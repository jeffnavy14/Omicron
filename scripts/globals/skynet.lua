-----------------------------------
-- skynet.lua
-- Global controller for the Discord Bot Dead Drop
-----------------------------------
xi = xi or {}
xi.skynet = xi.skynet or {}

-- Initialize the timer globally so it never gets wiped from memory
xi.skynet.lastCheck = 0 

xi.skynet.check = function()
    local currentTime = os.time()
    
    -- The 5-second throttle happens safely inside the global core now!
    if currentTime - xi.skynet.lastCheck >= 5 then
        xi.skynet.lastCheck = currentTime
        
        local queue_id, action, target_name, param1, param2, string_arg = xi.discord.getCommand()
        
        if queue_id and queue_id > 0 then
            -- =====================================
            -- THE CIRCUIT BREAKER
            -- =====================================
            xi.discord.deleteCommand(queue_id)

            local target_player = GetPlayerByName(target_name)

            -- =====================================
            -- COMMAND: KICK
            -- =====================================
            if action == "kick" then
                if target_player ~= nil then
                    target_player:leaveGame()
                    print("[Discord GM] Kicked player: " .. target_name)
                else
                    print("[Discord GM] Tried to kick " .. target_name .. " but they are not online.")
                end

            -- =====================================
            -- COMMAND: GIVE ITEM
            -- =====================================
            elseif action == "giveitem" then
                if target_player ~= nil then
                    local itemId = param1
                    local amount = param2
                    
                    if target_player:getFreeSlotsCount() == 0 then
                        print("[Discord GM] Failed: " .. target_name .. " has no inventory space.")
                    else
                        local itemData = { id = itemId, quantity = amount }
                        target_player:addItem(itemData)
                        
                        local ID = zones[target_player:getZoneID()]
                        if amount and amount > 1 then
                            target_player:messageSpecial(ID.text.ITEM_OBTAINED + 9, itemId, amount)
                        else
                            target_player:messageSpecial(ID.text.ITEM_OBTAINED, itemId)
                        end
                        print("[Discord GM] Gave " .. target_name .. " ItemID: " .. itemId .. " (x" .. amount .. ")")
                    end
                else
                    print("[Discord GM] Tried to give item to " .. target_name .. " but they are not online.")
                end

            -- =====================================
            -- COMMAND: DELETE ITEM
            -- =====================================
            elseif action == "deleteitem" then
                if target_player ~= nil then
                    local itemId = param1
                    local amount = param2
                    target_player:delItem(itemId, amount)
                    print("[Discord GM] Removed from " .. target_name .. " ItemID: " .. itemId .. " (x" .. amount .. ")")
                else
                    print("[Discord GM] Tried to remove item from " .. target_name .. " but they are not online.")
                end

            -- =====================================
            -- COMMAND: ADD CURRENCY
            -- =====================================
            elseif action == "addcurrency" then
                if target_player ~= nil then
                    local currency = string_arg
                    local amount = param1
                    
                    if amount > 0 then
                        target_player:addCurrency(currency, amount)
                        local newAmount = target_player:getCurrency(currency)
                        print("[Discord GM] Gave " .. target_name .. " " .. amount .. " " .. currency .. " (New Total: " .. tostring(newAmount) .. ")")
                    else
                        print("[Discord GM] Failed: Invalid currency amount (" .. amount .. ") for " .. target_name)
                    end
                else
                    print("[Discord GM] Tried to add currency to " .. target_name .. " but they are not online.")
                end

            -- =====================================
            -- COMMAND: SET PLAYER VAR
            -- =====================================
            elseif action == "setplayervar" then
                if target_player ~= nil then
                    local variable_name = string_arg
                    local value = param1
                    
                    target_player:setCharVar(variable_name, value)
                    print("[Discord GM] Set " .. target_name .. "'s variable '" .. variable_name .. "' to " .. value)
                else
                    print("[Discord GM] Tried to set variable for " .. target_name .. " but they are not online.")
                end

            -- =====================================
            -- COMMAND: DELETE QUEST
            -- =====================================
            elseif action == "deletequest" then
                if target_player ~= nil then
                    local logId = param1
                    local questId = param2
                    target_player:delQuest(logId, questId)
                    print("[Discord GM] Deleted Quest ID " .. questId .. " (Log ID " .. logId .. ") for " .. target_name)
                else
                    print("[Discord GM] Tried to delete quest for " .. target_name .. " but they are not online.")
                end

            -- =====================================
            -- COMMAND: DELETE MISSION
            -- =====================================
            elseif action == "deletemission" then
                if target_player ~= nil then
                    local logId = param1
                    local missionId = param2
                    target_player:delMission(logId, missionId)
                    print("[Discord GM] Deleted Mission ID " .. missionId .. " (Log ID " .. logId .. ") for " .. target_name)
                else
                    print("[Discord GM] Tried to delete mission for " .. target_name .. " but they are not online.")
                end

            -- =====================================
            -- COMMAND: SET SERVER VAR
            -- =====================================
            elseif action == "setservervar" then
                local variable_name = string_arg
                local value = param1
                
                SetServerVariable(variable_name, value)
                print("[Discord GM] Set global server variable '" .. variable_name .. "' to " .. value)

            -- =====================================
            -- COMMAND: DOMAIN INVASION
            -- =====================================
            elseif action == "domain_invasion" then
                local di_controller = require("scripts/globals/di_controller")
                
                if param1 == 1 then
                    di_controller.start()
                    print("[Discord GM] Domain Invasion: STARTED")
                elseif param1 == 2 then
                    di_controller.stop()
                    print("[Discord GM] Domain Invasion: STOPPED")
                elseif param1 == 3 then
                    di_controller.restart()
                    print("[Discord GM] Domain Invasion: RESTARTED")
                elseif param1 == 4 then
                    local active = GetServerVariable("DI_ACTIVE")
                    if active == 1 then
                        print("[Discord GM] Domain Invasion Status: RUNNING")
                    else
                        print("[Discord GM] Domain Invasion Status: STOPPED")
                    end
                end

            -- =====================================
            -- COMMAND: CAMPAIGN CONTROL
            -- =====================================
            elseif action == "campaign" then
                if xi and xi.campaign and xi.campaign.forceStart then
                    local zIdx, aIdx, uIdx = nil, nil, nil
                    
                    if string_arg ~= "" and string_arg ~= nil then
                        local tokens = {}
                        for token in string.gmatch(string_arg, "%S+") do
                            table.insert(tokens, tonumber(token))
                        end
                        zIdx = tokens[1]
                        aIdx = tokens[2]
                        uIdx = tokens[3]
                    end
                    
                    xi.campaign.forceStart(nil, zIdx, aIdx, uIdx)
                    print("[Discord GM] Campaign Framework triggered. Payload strings: " .. (string_arg ~= "" and string_arg or "Random Assignment"))
                else
                    print("[Discord GM] Campaign Error: Target exposed module wrappers are missing or uninitialized.")
                end

            -- =====================================
            -- COMMAND: JAIL
            -- =====================================
            elseif action == "jail" then
                local jailCells = {
                    { -620, 11,  660 }, { -180, 11,  660 }, {  260, 11,  660 }, {  700, 11,  660 },
                    { -620, 11,  220 }, { -180, 11,  220 }, {  260, 11,  220 }, {  700, 11,  220 },
                    { -620, 11, -220 }, { -180, 11, -220 }, {  260, 11, -220 }, {  700, 11, -220 },
                    { -620, 11, -620 }, { -180, 11, -620 }, {  260, 11, -620 }, {  700, 11, -620 },
                    { -620, -400,  660 }, { -180, -400,  660 }, {  260, -400,  660 }, {  700, -400,  660 },
                    { -620, -400,  220 }, { -180, -400,  220 }, {  260, -400,  220 }, {  700, -400,  220 },
                    { -620, -400, -220 }, { -180, -400, -220 }, {  260, -400, -220 }, {  700, -400, -220 },
                    { -620, -400, -620 }, { -180, -400, -620 }, {  260, -400, -620 }, {  700, -400, -620 },
                }
                
                local cellId = param1
                if cellId <= 0 or cellId > 32 then cellId = 1 end
                
                local reason = string_arg
                if reason == "" or reason == nil then reason = "Unspecified" end
                
                local dest = jailCells[cellId]

                if target_player ~= nil then
                    target_player:setCharVar('inJail', cellId)
                    target_player:setPos(dest[1], dest[2], dest[3], 0, 131)
                    print("[Discord GM] Jailed (Online) " .. target_name .. " in cell " .. cellId .. ". Reason: " .. reason)
                else
                    local targetID = GetPlayerIDByName(target_name)
                    if targetID ~= nil and targetID > 0 and targetID < 0xFFFFFFFF then
                        if PlayerHasValidSession(targetID) then
                            print("[Discord GM] Failed: " .. target_name .. " is online in a different zone group/cluster.")
                        else
                            SendToJailOffline(targetID, cellId, dest[1], dest[2], dest[3], 0)
                            print("[Discord GM] Jailed (Offline) " .. target_name .. " in cell " .. cellId .. ". Reason: " .. reason)
                        end
                    else
                        print("[Discord GM] Failed: Invalid player '" .. target_name .. "' given for jail.")
                    end
                end

            -- =====================================
            -- COMMAND: PARDON
            -- =====================================
            elseif action == "pardon" then
                if target_player ~= nil then
                    if target_player:getCharVar('inJail') >= 1 then
                        target_player:setCharVar('inJail', 0)
                        target_player:warp()
                        print("[Discord GM] Pardoned " .. target_name .. " from jail.")
                    else
                        print("[Discord GM] " .. target_name .. " is not currently in jail.")
                    end
                else
                    print("[Discord GM] Failed: " .. target_name .. " is not online to be pardoned.")
                end

            -- =====================================
            -- COMMAND: RELOAD GLOBAL LUA
            -- =====================================
            elseif action == "reloadglobal" then
                local tokens = {}
                if string_arg ~= "" and string_arg ~= nil then
                    for token in string.gmatch(string_arg, "%S+") do
                        table.insert(tokens, token)
                    end
                end
                
                local globalLua = tokens[1]
                local other     = tokens[2]
                
                if globalLua ~= nil and other == nil then
                    local pathString = table.concat({ 'scripts/globals/', globalLua })
                    package.loaded[pathString] = nil
                    require(pathString)
                    print(string.format("[Discord GM] Lua file '%s' has been successfully reloaded down from live memory.", pathString))
                    
                elseif other == 'I_am_sure' then
                    package.loaded[globalLua] = nil
                    require(globalLua)
                    print(string.format("[Discord GM] Absolute Bypass Activated! Lua file '%s' has been forced reloaded.", globalLua))
                    
                else
                    print("[Discord GM] Reloadglobal Execution Failed: Malformed arguments. Must specify a global target file.")
                end

            -- =====================================
            -- COMMAND: EXECUTE RAW LUA
            -- =====================================
            elseif action == "exec" then
                local lua_string = string_arg
                
                if lua_string ~= nil and string.len(lua_string) > 0 then
                    local oldOs = os
                    ---@diagnostic disable-next-line: assign-type-mismatch
                    os = nil

                    local scriptObj, err0 = loadstring(lua_string)
                    if scriptObj == nil then
                        print("[Discord GM] Exec Failed to compile: " .. tostring(err0))
                    else
                        local successfullyExecuted, errorMessage = pcall(scriptObj)
                        if successfullyExecuted then
                            print("[Discord GM] Successfully Executed Lua: " .. lua_string)
                        else
                            print("[Discord GM] Exec Runtime Error: " .. tostring(errorMessage))
                        end
                    end
                    os = oldOs
                else
                    print("[Discord GM] Exec Failed: No string provided.")
                end
            end
            
        end
    end
end