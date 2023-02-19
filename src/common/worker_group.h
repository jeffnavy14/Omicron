/*
===========================================================================

  Copyright (c) 2023 LandSandBoat Dev Teams

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
#pragma once

#include "common/cbasetypes.h"
#include "common/worker_thread.h"

#include <concurrentqueue.h>

template <typename Signature>
class WorkerGroup;

template <typename R, typename... Args>
class WorkerGroup<R(Args...)>
{
    using TaskFunc = std::function<R(Args...)>;

public:
    template <typename... CArgs>
    WorkerGroup(CArgs... args)
    {
        uint16 numThreads = std::thread::hardware_concurrency();
        for (int i = 0; i < numThreads; ++i)
        {
            wts.push_back(std::make_unique<WorkerThread<R(Args...)>>(std::forward<CArgs>(args)...));
        }
    }

    void enqueue(TaskFunc&& func)
    {
        // Round-robin
        static uint32 jobCount = 0;
        wts[jobCount++ % wts.size()]->enqueue(std::move(func));
    }

    void join()
    {
        // Wait for all workers to finish
        for (auto& worker : wts)
        {
            while (worker->has_pending_input())
            {
                // TODO: Use completion of jobs to re-check this loop
                std::this_thread::sleep_for(200ms);
            }
        }
    }

private:
    std::vector<std::unique_ptr<WorkerThread<R(Args...)>>> wts;
};
