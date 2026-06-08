-----------------------------------
-- func: getaugsyweapons
-- desc: get augments from specified item in slot
-----------------------------------
local commandObj = {}

commandObj.cmdprops =
{
    permission = 1,
    parameters = 'i'
}

local function error(player, msg)
    player:printToPlayer(msg)
    player:printToPlayer('!getaugs <slot>')
end

local slotNameByNum = {
    [ 0] = {name = "Main"},
    [ 1] = {name = "Sub"},
    [ 2] = {name = "Ranged"},
    [ 3] = {name = "Ammo"},
    [ 4] = {name = "Head"},
    [ 5] = {name = "Body"},
    [ 6] = {name = "Hands"},
    [ 7] = {name = "Legs"},
    [ 8] = {name = "Feet"},
    [ 9] = {name = "Neck"},
    [10] = {name = "Waist"},
    [11] = {name = "Ear1"},
    [12] = {name = "Ear2"},
    [13] = {name = "Ring1"},
    [14] = {name = "Ring2"},
    [15] = {name = "Back"}
}

local function packAugment(augmentTable)
    return bit.lshift(augmentTable[2], 11) + augmentTable[1]
end



commandObj.onTrigger = function(player, slot)
  local sname = 0
    for k, v in pairs(slotNameByNum) do
        if slot == k then
           sname = v.name
        end
    end

    local slots       = player:getEquippedItem(slot)
  if slots == nil then
     player:printToPlayer(string.format('You do not have an item in that slot %s', sname))
     return
  else

    local itemObj    = slots
    local itemId     = itemObj:getID()
    local lookupKeys = { itemId, 0, 0, 0, 0 }
        for augSlot = 0, 3 do
            lookupKeys[augSlot] = packAugment(itemObj:getAugment(augSlot))
        end

    local valueone  = lookupKeys[0] / 2048
    local valuea = math.floor(valueone)
    local augone   = valuea * 2048
    local auga   = lookupKeys[0] - augone

    local valuetwo  = lookupKeys[1] / 2048
    local valueb = math.floor(valuetwo)
    local augtwo   = valueb * 2048
    local augb   = lookupKeys[1] - augtwo

    local valuethree  = lookupKeys[2] / 2048
    local valuec = math.floor(valuethree)
    local augthree   = valuec * 2048
    local augc   = lookupKeys[2] - augthree

    local valuefour  = lookupKeys[3] / 2048
    local valued = math.floor(valuefour)
    local augfour   = valued * 2048
    local augd   = lookupKeys[3] - augfour
    
           player:printToPlayer(string.format('Item Name: %s | Slot: %s',itemObj:getName(itemId), sname),xi.msg.channel.SYSTEM_3)
        if valueone == 0 then
           return
        elseif valueone > 0 then
           player:printToPlayer(string.format('Augment One   %s Value %s', auga ,valuea +1),xi.msg.channel.SYSTEM_3)
        end
            if valuetwo == 0 then
               return
            elseif valuetwo > 0 then
                   player:printToPlayer(string.format('Augment Two   %s Value %s', augb, valueb +1),xi.msg.channel.SYSTEM_3)
            end
                if valuethree == 0 then
                   return
                elseif valuethree > 0 then
                       player:printToPlayer(string.format('Augment Three %s Value %s', augc, valuec +1),xi.msg.channel.SYSTEM_3)
                end
                    if valuefour == 0 then
                       return
                    elseif valuefour > 0 then
                           player:printToPlayer(string.format('Augment Four  %s Value %s', augd, valued +1),xi.msg.channel.SYSTEM_3)
                    end
  end
end

return commandObj
