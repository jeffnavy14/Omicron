-----------------------------------
-- func: addallspells
-- desc: Adds all valid spells EXCEPT TRUSTS to the given target. If no target then to the current player.
-----------------------------------
local commandObj = {}

commandObj.cmdprops =
{
    permission = 1,
    parameters = 's'
}

local function error(player, msg)
    player:printToPlayer(msg)
    player:printToPlayer('!oldccfix (player)')
end

commandObj.onTrigger = function(player, target)
    -- Corsair Rolls
local ValidRolls = {
    98, -- Fighter's Roll
    99, -- Monk's Roll
    100, -- Healer's Roll
    101, -- Wizard's Roll
    102, -- Warlock's Roll
    103, -- Rogue's Roll
    104, -- Gallant's Roll
    105, -- Chaos Roll
    106, -- Beast Roll
    107, -- Choral Roll
    108, -- Hunter's Roll
    109, -- Samurai Roll
    110, -- Ninja Roll
    111, -- Drachen Roll
    112, -- Evoker's Roll
    113, -- Magus' Roll
    114, -- Corsair's Roll
    115, -- Puppet's Roll
    116, -- Dancer's Roll
    117, -- Scholar's Roll
    118, -- Bolter's Roll
    119, -- Caster's Roll
    120, -- Courser's Roll
    121, -- Blitzer's Roll
    122, -- Tactician's Roll
    302, -- Allies Roll
    303, -- Miser's Roll
    304, -- Companion's Roll
    305, -- Avenger's Roll
    390, -- Naturalist's Roll
    391, -- Runeist's Roll
}
local ValidAttachments = {
    8193, 8194, 8195, 8196, 8197, 8198, 8224, 8225, 8226, 8227,
    8449, 8450, 8451, 8452, 8453, 8454, 8455, 8456, 8458,
    8462, 8481, 8482, 8483, 8484, 8485, 8486, 8487, 8488, 8489, 8490, 8491, 8493, 8497,
    8513, 8514, 8515, 8516, 8517, 8518, 8519, 8520,
    8523, 8524, 8526, 8528, 8545, 8546, 8547, 8548, 8549, 8550, 8551,
    8555, 8577, 8578, 8579, 8580, 8581, 8582, 8583, 8584, 8585,
    8587, 8609, 8610, 8611, 8612, 8613, 8614, 8615, 8616,
    8619, 8641, 8642, 8643, 8644, 8645, 8646, 8648, 8651,
    8673, 8674, 8675, 8676, 8677, 8678, 8680, 8682, 9138, 9143, 9230,
}
    -- validate target
    local targ
    if target == nil then
        targ = player
    else
        targ = GetPlayerByName(target)
        if targ == nil then
            error(player, string.format('Player named "%s" not found!', target))
            return
        end
    end
    -- add all spells
    local save = true
    local silent = true
    local sendUpdate = false -- prevent packet spam

    for i = 1, #ValidRolls do
        if i == #ValidRolls then
            silent = false
            sendUpdate = true
        end
            targ:addLearnedAbility(ValidRolls[i], silent, save, sendUpdate)
    end
        for i = 1, #ValidAttachments do
             if i == #ValidAttachments then
                 silent = false
                 sendUpdate = true
             end
                targ:unlockAttachment(ValidAttachments[i], silent, save, sendUpdate)
        end
            player:setPetName(xi.petType.WYVERN, math.random(1,32))
            player:setPetName(xi.petType.AUTOMATON, math.random(118, 149))
            player:printToPlayer(string.format('%s now has all Rolls and starter Attachments.', targ:getName()))
end

return commandObj
