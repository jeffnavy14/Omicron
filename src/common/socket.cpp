/*
===========================================================================

  Copyright (c) 2010-2015 Darkstar Dev Teams

  This program is free software: you can redistribute it and/or modify
  it under the terms of the GNU General Public License as published by
  the Free Software Foundation, either version 3 of the License, or
  (at your option) any later version.

  This program is distributed in the hope that it will be useful,
  but WITHOUT ANY WARRANTY; without even the implied warranty of
  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  GNU General Public License for more details.

  You should have received a copy of the GNU General Public License
  along with this program.  If not, see http://www.gnu.org/licenses/

===========================================================================
*/

#include "common/cbasetypes.h"
#include "common/kernel.h"
#include "common/logging.h"
#include "common/mmo.h"
#include "common/taskmgr.h"
#include "common/timer.h"
#include "common/utils.h"

#include "settings.h"
#include "socket.h"

#include <sstream>

#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <sys/types.h>

#ifdef WIN32
#include <io.h>
#include <winsock2.h>
#else
#include <arpa/inet.h>
#include <cerrno>
#include <net/if.h>
#include <netdb.h>
#include <netinet/in.h>
#include <netinet/tcp.h>
#include <sys/ioctl.h>
#include <sys/socket.h>
#include <sys/time.h>
#include <unistd.h>

#ifndef SIOCGIFCONF
#include <sys/sockio.h> // SIOCGIFCONF on Solaris, maybe others? [Shinomori]
#endif

#ifdef HAVE_SETRLIMIT
#include <sys/resource.h>
#endif
#endif

#if defined(WIN32) // windows portability layer

typedef int socklen_t;

#define sErrno         WSAGetLastError()
#define S_ENOTSOCK     WSAENOTSOCK
#define S_EWOULDBLOCK  WSAEWOULDBLOCK
#define S_EINTR        WSAEINTR
#define S_ECONNABORTED WSAECONNABORTED

SOCKET sock_arr[MAX_FD];
int    sock_arr_len = 0;

/// Returns the first fd associated with the socket.
/// Returns -1 if the socket is not found.
///
/// @param s Socket
/// @return Fd or -1
int sock2fd(SOCKET s)
{
    TracyZoneScoped;
    int fd;

    // search for the socket
    for (fd = 1; fd < sock_arr_len; ++fd)
        if (sock_arr[fd] == s)
            break; // found the socket
    if (fd == sock_arr_len)
        return -1; // not found
    return fd;
}

/// Inserts the socket into the global array of sockets.
/// Returns a new fd associated with the socket.
/// If there are too many sockets it closes the socket, sets an error and
//  returns -1 instead.
/// Since fd 0 is reserved, it returns values in the range [1,MAX_FD[.
///
/// @param s Socket
/// @return New fd or -1
int sock2newfd(SOCKET s)
{
    TracyZoneScoped;
    int fd;

    // find an empty position
    for (fd = 1; fd < sock_arr_len; ++fd)
        if (sock_arr[fd] == INVALID_SOCKET)
            break; // empty position
    if (fd == (sizeof(sock_arr) / sizeof(sock_arr[0])))
    {
        // too many sockets
        closesocket(s);
        WSASetLastError(WSAEMFILE);
        return -1;
    }
    sock_arr[fd] = s;
    if (sock_arr_len <= fd)
        sock_arr_len = fd + 1;
    return fd;
}

int sAccept(int fd, struct sockaddr* addr, int* addrlen)
{
    TracyZoneScoped;
    SOCKET s;

    // accept connection
    s = accept(fd2sock(fd), addr, addrlen);
    if (s == INVALID_SOCKET)
        return -1; // error
    return sock2newfd(s);
}

int sClose(int fd)
{
    TracyZoneScoped;
    int ret     = closesocket(fd2sock(fd));
    fd2sock(fd) = INVALID_SOCKET;
    return ret;
}

int sSocket(int af, int type, int protocol)
{
    TracyZoneScoped;
    SOCKET s;

    // create socket
    s = socket(af, type, protocol);
    if (s == INVALID_SOCKET)
        return -1; // error
    return sock2newfd(s);
}
#else // *nix sys
#endif

fd_set readfds;
int32  fd_max;
time_t last_tick;
time_t tick_time;

// hostname/ip conversion functions
std::string ip2str(uint32 ip)
{
    uint32 reversed_ip = htonl(ip);
    char   address[INET_ADDRSTRLEN];
    inet_ntop(AF_INET, &reversed_ip, address, INET_ADDRSTRLEN);

    // This is internal, so we can trust it.
    return fmt::format("{}", asStringFromUntrustedSource(address));
}

uint32 str2ip(const char* ip_str)
{
    uint32 ip = 0;
    inet_pton(AF_INET, ip_str, &ip);

    return ntohl(ip);
}

void set_nonblocking(int fd, unsigned long yes)
{
    TracyZoneScoped;
    // FIONBIO Use with a nonzero argp parameter to enable the nonblocking mode of socket s.
    // The argp parameter is zero if nonblocking is to be disabled.
    if (sIoctl(fd, FIONBIO, &yes) != 0)
    {
        ShowError("set_nonblocking: Failed to set socket #%d to non-blocking mode (code %d) - Please report this!!!", fd, sErrno);
    }
}

int32 makeBind_udp(uint32 ip, uint16 port)
{
    TracyZoneScoped;
    sockaddr_in server_address{};
    int         fd     = 0;
    int         result = 0;

    fd = sSocket(AF_INET, SOCK_DGRAM, 0);

    if (fd == -1)
    {
        ShowError("make_listen_bind: socket creation failed (port %d, code %d)!", port, sErrno);
        do_final(EXIT_FAILURE);
    }
    if (fd == 0)
    { // reserved
        ShowError("make_listen_bind: Socket #0 is reserved - Please report this!!!");
        sClose(fd);
        return -1;
    }
    if (fd >= MAX_FD)
    { // socket number too big
        ShowError("make_listen_bind: New socket #%d is greater than can we handle! Increase the value of MAX_FD (currently %d) for your OS to fix this!",
                  fd, MAX_FD);
        sClose(fd);
        return -1;
    }

    server_address.sin_family      = AF_INET;
    server_address.sin_addr.s_addr = htonl(ip);
    server_address.sin_port        = htons(port);

    result = sBind(fd, (struct sockaddr*)&server_address, sizeof(server_address));
    if (result == SOCKET_ERROR)
    {
        ShowError("make_listen_bind: bind failed (socket #%d, port %d, code %d)!", fd, port, sErrno);
        do_final(EXIT_FAILURE);
    }

    if (fd_max <= fd)
    {
        fd_max = fd + 1;
    }
    sFD_SET(fd, &readfds);
    return fd;
}

void socket_init_udp()
{
    TracyZoneScoped;
#ifdef WIN32
    { // Start up windows networking
        WSADATA wsaData;
        WORD    wVersionRequested = MAKEWORD(2, 0);
        if (WSAStartup(wVersionRequested, &wsaData) != 0)
        {
            ShowError("socket_init: WinSock not available!");
            return;
        }
        if (LOBYTE(wsaData.wVersion) != 2 || HIBYTE(wsaData.wVersion) != 0)
        {
            ShowError("socket_init: WinSock version mismatch (2.0 or compatible required)!");
            return;
        }
    }
#elif defined(HAVE_SETRLIMIT) && !defined(CYGWIN)
    // NOTE: getrlimit and setrlimit have bogus behavior in cygwin.
    //       "Number of fds is virtually unlimited in cygwin" (sys/param.h)
    { // set socket limit to MAX_FD
        rlimit rlp;
        if (0 == getrlimit(RLIMIT_NOFILE, &rlp))
        {
            rlp.rlim_cur = MAX_FD;
            if (0 != setrlimit(RLIMIT_NOFILE, &rlp))
            { // failed, try setting the maximum too (permission to change system limits is required)
                rlp.rlim_max = MAX_FD;
                if (0 != setrlimit(RLIMIT_NOFILE, &rlp))
                { // failed
                    // set to maximum allowed
                    getrlimit(RLIMIT_NOFILE, &rlp);
                    rlp.rlim_cur = rlp.rlim_max;
                    setrlimit(RLIMIT_NOFILE, &rlp);
                    // report limit
                    getrlimit(RLIMIT_NOFILE, &rlp);
                    ShowWarning("socket_init: failed to set socket limit to %d (current limit %d).", MAX_FD, (int)rlp.rlim_cur);
                }
            }
        }
    }
#endif

    sFD_ZERO(&readfds);

    // initialize last send-receive tick
    last_tick = time(nullptr);
}

int32 recvudp(int32 fd, void* buff, size_t nbytes, int32 flags, struct sockaddr* from, socklen_t* addrlen)
{
    TracyZoneScoped;
    return sRecvfrom(fd, (char*)buff, (int)nbytes, flags, from, addrlen);
}

int32 sendudp(int32 fd, void* buff, size_t nbytes, int32 flags, const struct sockaddr* from, socklen_t addrlen)
{
    TracyZoneScoped;
    return sSendto(fd, (const char*)buff, (int)nbytes, flags, from, addrlen);
}

void socket_init()
{
    TracyZoneScoped;

    socket_init_udp();
}
