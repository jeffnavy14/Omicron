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

#ifndef _SOCKET_H_
#define _SOCKET_H_

#ifndef _CBASETYPES_H_
#include "common/cbasetypes.h"
#endif

#ifdef __APPLE__
#include <CoreFoundation/CoreFoundation.h>
#endif

#ifdef __APPLE__
#define MAX_FD FD_SETSIZE
#else
#define MAX_FD 10240
#endif

#ifdef WIN32
#include <winsock2.h>
#include <ws2tcpip.h>
typedef long in_addr_t;
#else
#include <arpa/inet.h>
#include <errno.h>
#include <netinet/in.h>
#include <sys/socket.h>
#include <sys/types.h>
#endif

#include <array>
#include <ctime>
#include <memory>
#include <string>

#if defined(WIN32) // windows portability layer
typedef int socklen_t;

#define sErrno         WSAGetLastError()
#define S_ENOTSOCK     WSAENOTSOCK
#define S_EWOULDBLOCK  WSAEWOULDBLOCK
#define S_EINTR        WSAEINTR
#define S_ECONNABORTED WSAECONNABORTED

#define SHUT_RD   SD_RECEIVE
#define SHUT_WR   SD_SEND
#define SHUT_RDWR SD_BOTH

// global array of sockets (emulating linux)
// fd is the position in the array
extern SOCKET sock_arr[MAX_FD];
extern int    sock_arr_len;

/// Returns the socket associated with the target fd.
///
/// @param fd Target fd.
/// @return Socket
#define fd2sock(fd) sock_arr[fd]

/// Returns the first fd associated with the socket.
/// Returns -1 if the socket is not found.
///
/// @param s Socket
/// @return Fd or -1
int sock2fd(SOCKET s);

/// Inserts the socket into the global array of sockets.
/// Returns a new fd associated with the socket.
/// If there are too many sockets it closes the socket, sets an error and
//  returns -1 instead.
/// Since fd 0 is reserved, it returns values in the range [1,MAX_FD[.
///
/// @param s Socket
/// @return New fd or -1
int sock2newfd(SOCKET s);

int sAccept(int fd, struct sockaddr* addr, int* addrlen);

int sClose(int fd);
int sSocket(int af, int type, int protocol);

#define sBind(fd, name, namelen)                        bind(fd2sock(fd), name, namelen)
#define sListen(fd, backlog)                            listen(fd2sock(fd), backlog)
#define sIoctl(fd, cmd, argp)                           ioctlsocket(fd2sock(fd), cmd, argp)
#define sConnect(fd, name, namelen)                     connect(fd2sock(fd), name, namelen)
#define sRecv(fd, buf, len, flags)                      recv(fd2sock(fd), buf, len, flags)
#define sRecvfrom(fd, buf, len, flags, from, addrlen)   recvfrom(fd2sock(fd), buf, len, flags, from, addrlen)
#define sSelect                                         select
#define sSend(fd, buf, len, flags)                      send(fd2sock(fd), buf, len, flags)
#define sSendto(fd, buf, len, flags, to, addrlen)       sendto(fd2sock(fd), buf, len, flags, to, addrlen)
#define sSetsockopt(fd, level, optname, optval, optlen) setsockopt(fd2sock(fd), level, optname, optval, optlen)
#define sShutdown(fd, how)                              shutdown(fd2sock(fd), how)
#define sFD_SET(fd, set)                                FD_SET(fd2sock(fd), set)
#define sFD_CLR(fd, set)                                FD_CLR(fd2sock(fd), set)
#define sFD_ISSET(fd, set)                              FD_ISSET(fd2sock(fd), set)
#define sFD_ZERO                                        FD_ZERO
#else // nix portability layer

#define SOCKET_ERROR (-1)

#define sErrno         errno
#define S_ENOTSOCK     EBADF
#define S_EWOULDBLOCK  EAGAIN
#define S_EINTR        EINTR
#define S_ECONNABORTED ECONNABORTED

#define sAccept accept
#define sClose  close
#define sSocket socket

#define sBind       bind
#define sConnect    connect
#define sIoctl      ioctl
#define sListen     listen
#define sRecv       recv
#define sRecvfrom   recvfrom
#define sSelect     select
#define sSend       send
#define sSendto     sendto
#define sSetsockopt setsockopt
#define sShutdown   shutdown
#define sFD_SET     FD_SET
#define sFD_CLR     FD_CLR
#define sFD_ISSET   FD_ISSET
#define sFD_ZERO    FD_ZERO

#endif

extern fd_set readfds;
extern int    fd_max;
extern time_t last_tick;

void socket_init();

// hostname/ip conversion functions
std::string ip2str(uint32 ip);

uint32 str2ip(const char* ip_str);

void set_nonblocking(int fd, unsigned long yes);

int32 makeBind_udp(uint32 ip, uint16 port);

void socket_init_udp(void);

int32 recvudp(int32 fd, void* buff, size_t nbytes, int32 flags, struct sockaddr* from, socklen_t* addrlen);
int32 sendudp(int32 fd, void* buff, size_t nbytes, int32 flags, const struct sockaddr* from, socklen_t addrlen);

template <typename T, typename U>
auto ref(U* buf, std::size_t index) -> T&
{
    return *reinterpret_cast<T*>(reinterpret_cast<uint8*>(buf) + index);
}

template <typename T, typename U>
auto as(U& object) -> T*
{
    static_assert(std::is_standard_layout_v<T>, "Type must be standard layout (No virtual functions, inheritance, etc.)");
    return reinterpret_cast<T*>(&object);
}

#endif // _SOCKET_H //
