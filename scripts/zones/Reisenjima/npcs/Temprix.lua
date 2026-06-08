-----------------------------------
-- Area: Reisenjima (291)
-- NPC: Temprix
-----------------------------------
---@type TNpcEntity
local entity = {}
local jobToKIBits =
{
    [xi.job.WAR] = { 5 },
    [xi.job.MNK] = { 0 },
    [xi.job.WHM] = { 10 },
    [xi.job.BLM] = { 11 },
    [xi.job.RDM] = { 2 },
    [xi.job.THF] = { 1 },
    [xi.job.PLD] = { 2, 14 },
    [xi.job.DRK] = { 7 },
    [xi.job.BST] = { 4 },
    [xi.job.BRD] = { 1, 15 },
    [xi.job.RNG] = { 12, 13 },
    [xi.job.SAM] = { 9 },
    [xi.job.NIN] = { 8 },
    [xi.job.DRG] = { 6 },
    [xi.job.SMN] = { 11 },
    [xi.job.BLU] = { 2 },
    [xi.job.COR] = { 13 },
    [xi.job.PUP] = { 0 },
    [xi.job.DNC] = { 1 },
    [xi.job.SCH] = { 11 },
    [xi.job.GEO] = { 10 },
    [xi.job.RUN] = { 3 },
}

local malformedKIs =
{
    xi.ki.MALFORMED_KNUCKLES,
    xi.ki.MALFORMED_DAGGER,
    xi.ki.MALFORMED_SWORD,
    xi.ki.MALFORMED_GREAT_SWORD,
    xi.ki.MALFORMED_AXE,
    xi.ki.MALFORMED_GREAT_AXE,
    xi.ki.MALFORMED_POLEARM,
    xi.ki.MALFORMED_SCYTHE,
    xi.ki.MALFORMED_KATANA,
    xi.ki.MALFORMED_GREAT_KATANA,
    xi.ki.MALFORMED_CLUB,
    xi.ki.MALFORMED_STAFF,
    xi.ki.MALFORMED_BOW,
    xi.ki.MALFORMED_GUN,
    xi.ki.MALFORMED_SHIELD,
    xi.ki.MALFORMED_FLUTE,
}

local aeonicTrade =
{
	[1] = { trade = { xi.item.ATTESTATION_OF_MIGHT, xi.item.VILLAINS_FORTUNE_PARCHMENT }, reward = xi.item.GODHANDS },
	[2] = { trade = { xi.item.ATTESTATION_OF_CELERITY, xi.item.SADISTS_FORTUNE_PARCHMENT }, reward = xi.item.AENEAS },
	[3] = { trade = { xi.item.ATTESTATION_OF_GLORY, xi.item.DESPOTS_FORTUNE_PARCHMENT }, reward = xi.item.SEQUENCE },
	[4] = { trade = { xi.item.ATTESTATION_OF_RIGHTEOUSNESS, xi.item.DESPOTS_FORTUNE_PARCHMENT }, reward = xi.item.LIONHEART },
	[5] = { trade = { xi.item.ATTESTATION_OF_BRAVERY, xi.item.TRAITORS_FORTUNE_PARCHMENT }, reward = xi.item.TRI_EDGE },
	[6] = { trade = { xi.item.ATTESTATION_OF_FORCE, xi.item.DESPOTS_FORTUNE_PARCHMENT }, reward = xi.item.CHANGO },
	[7] = { trade = { xi.item.ATTESTATION_OF_VIGOR, xi.item.DELUDERS_FORTUNE_PARCHMENT }, reward = xi.item.ANGUTA },
	[8] = { trade = { xi.item.ATTESTATION_OF_FORTITUDE, xi.item.TRAITORS_FORTUNE_PARCHMENT }, reward = xi.item.TRISHULA },
	[9] = { trade = { xi.item.ATTESTATION_OF_LEGERITY, xi.item.VILLAINS_FORTUNE_PARCHMENT }, reward = xi.item.HEISHI_SHORINKEN },
	[10] = { trade = { xi.item.ATTESTATION_OF_DECISIVENESS, xi.item.DELUDERS_FORTUNE_PARCHMENT }, reward = xi.item.DOJIKIRI_YASUTSUNA },
	[11] = { trade = { xi.item.ATTESTATION_OF_SACRIFICE, xi.item.SADISTS_FORTUNE_PARCHMENT }, reward = xi.item.TISHTRYA },
	[12] = { trade = { xi.item.ATTESTATION_OF_VIRTUE, xi.item.TRAITORS_FORTUNE_PARCHMENT }, reward = xi.item.KHATVANGA },
	[13] = { trade = { xi.item.ATTESTATION_OF_TRANSCENDENCE, xi.item.DELUDERS_FORTUNE_PARCHMENT }, reward = xi.item.FAIL_NOT },
	[14] = { trade = { xi.item.ATTESTATION_OF_HARMONY, xi.item.SADISTS_FORTUNE_PARCHMENT }, reward = xi.item.FOMALHAUT },
	[15] = { trade = { xi.item.ATTESTATION_OF_ACCURACY, xi.item.VILLAINS_FORTUNE_PARCHMENT }, reward = xi.item.MARSYAS },
    [16] = { trade = { xi.item.ATTESTATION_OF_INVULNERABILITY, xi.item.DESPOTS_FORTUNE_PARCHMENT }, reward = xi.item.SRIVATSA },
}

local getObtainableWeaponsMask = function(player)
    local mjob = player:getMainJob()
    local mask = 0xFFFF -- All hidden by default (true)
    local bits = jobToKIBits[mjob] or {}

    for _, bitIndex in ipairs(bits) do
        mask = bit.band(mask, bit.bnot(bit.lshift(1, bitIndex)))
    end

    return mask
end

entity.onTrade = function(player, npc, trade)
    local beadsAmount = player:getCurrency('escha_beads')
    local tempixConvo = player:getCharVar('[Aeonic]TemprixConvo')
    local obtainableWeapons = getObtainableWeaponsMask(player)
    local eZitahKilled = player:getCharVar('[Aeonic]progress288') -- all kills 33554431
    local eRuAunKilled = player:getCharVar('[Aeonic]progress289') -- all kills -1
    local reisinjimaKilled = player:getCharVar('[Aeonic]progress291') -- all kills 268435455

    for k, v in pairs(aeonicTrade) do
        if npcUtil.tradeHasExactly(trade, v.trade) then
            player:setCharVar('[Aeonic]Weapon', v.reward)
            player:setCharVar('[Aeonic]VanaDay', getVanaMidnight())
            break
        end
    end

    if tempixConvo == 8 and
        player:getCharVar('[Aeonic]Weapon') > 0 then
        player:tradeComplete()
        player:setCharVar('[Aeonic]TemprixConvo', 9)
        player:startEvent(15, player:getCharVar('[Aeonic]TemprixConvo'), eZitahKilled, eRuAunKilled, reisinjimaKilled, beadsAmount, 0, 0, obtainableWeapons)
    end

end

entity.onTrigger = function(player, npc)
    local beadsAmount = player:getCurrency('escha_beads')
    local tempixConvo = player:getCharVar('[Aeonic]TemprixConvo')
    local obtainableWeapons = getObtainableWeaponsMask(player)
    local eZitahKilled = player:getCharVar('[Aeonic]progress288')
    local eRuAunKilled = player:getCharVar('[Aeonic]progress289')
    local reisinjimaKilled = player:getCharVar('[Aeonic]progress291')
    local nextVanaDay = player:getCharVar('[Aeonic]VanaDay')
    --------remove this gm check when done testing
    if player:getGMLevel() < 1 and
        player:getName() ~= 'Graves' then
        return
    end

    if not player:hasKeyItem(xi.ki.SCINTILLATING_RHAPSODY) then
        return
    end

    if tempixConvo == 9 and
        nextVanaDay <= GetSystemTime() then
        player:setCharVar('[Aeonic]TemprixConvo', 10)
        player:startEvent(15, player:getCharVar('[Aeonic]TemprixConvo'), eZitahKilled, eRuAunKilled, reisinjimaKilled, beadsAmount, 0, 0, obtainableWeapons)
    end


    if tempixConvo <= 4 then
        player:startEvent(15, tempixConvo, 0, 0, 0, beadsAmount, 0, 0, obtainableWeapons)
    elseif tempixConvo ~= 9 then
        -- Default state
        player:startEvent(15, tempixConvo, eZitahKilled, eRuAunKilled, reisinjimaKilled, beadsAmount, 0, 0, obtainableWeapons)
    end
end

entity.onEventUpdate = function(player, csid, option, npc)
    local tempixConvo = player:getCharVar('[Aeonic]TemprixConvo')
    local beadsAmount = player:getCurrency('escha_beads')
    local obtainableWeapons = getObtainableWeaponsMask(player)

    if csid == 15 then
        -- Logic to update current beads if a payment option was selected in the menu
        local currentBeads = beadsAmount
        if option == 1 then
            currentBeads = currentBeads - 10
        elseif option == 2 then
            currentBeads = currentBeads - 100
        elseif option == 3 then
            currentBeads = currentBeads - 1000
        elseif option == 4 then
            currentBeads = currentBeads - 1
        end

        player:updateEvent(tempixConvo, 0, 0, 0, currentBeads, 0, 0, obtainableWeapons)
    end
end

entity.onEventFinish = function(player, csid, option, npc)
    local keyItemChosen = bit.band(bit.rshift(option, 6), 0xFFFF)
    local nextVanaDay = player:getCharVar('[Aeonic]VanaDay')

    if option == 0 then
        return
    end

    if option == 1 then     -- pay 10 beads
        player:delCurrency('escha_beads', 10)
        player:setCharVar('[Aeonic]TemprixConvo', 1)
    end

    if option == 2 then -- pay 100 beads "Tell me More"
        player:delCurrency('escha_beads', 100)
        player:setCharVar('[Aeonic]TemprixConvo', 2)
    end

    if option == 3 then -- pay 1000 beads "Tell me even more"
        player:delCurrency('escha_beads', 1000)
        player:setCharVar('[Aeonic]TemprixConvo', 3)
    end

    if option == 4 then -- pay 1 beads "Just who are you"
        player:delCurrency('escha_beads', 1)
        player:setCharVar('[Aeonic]TemprixConvo', 4)
    end

    local foundKI = false

    for _, ki in ipairs(malformedKIs) do
        if ki == keyItemChosen then
            foundKI = true
            break
        end
    end

    if foundKI then
        if player:getCurrency('escha_beads') >= 50000 then
            player:delCurrency('escha_beads', 50000)
            npcUtil.giveKeyItem(player, keyItemChosen)
            player:setCharVar('[Aeonic]TemprixConvo', 5)
            player:setCharVar('[Aeonic]KeyItem', keyItemChosen) -- to delete after the process if finished
            player:setCharVar('[Aeonic]QuestActive', 1)
        end
    end


    if option == 6 then -- Zitah all Killed
        player:setCharVar('[Aeonic]TemprixConvo', 6)
        player:setCharVar('[Aeonic]QuestActive', 2)
    end


    if option == 7 then --RuAun all Killed
        player:setCharVar('[Aeonic]TemprixConvo', 7)
        player:setCharVar('[Aeonic]QuestActive', 3)
    end

    if option == 8 then -- Reisenjima all Killed
        player:setCharVar('[Aeonic]TemprixConvo', 8)
    end

    if option == 10 then
        if nextVanaDay <= GetSystemTime() then
            player:setCharVar('[Aeonic]TemprixConvo', 11)
        end

    end

    if option == 11 then
        player:setCharVar('[Aeonic]TemprixConvo', 4)
        player:setCharVar('[Aeonic]QuestActive', 0)
        player:setCharVar('[Aeonic]progress288', 0)
        player:setCharVar('[Aeonic]progress289', 0)
        player:setCharVar('[Aeonic]progress291', 0)
        player:setCharVar('[Aeonic]VanaDay', 0)
        npcUtil.giveItem(player, player:getCharVar('[Aeonic]Weapon'))
        player:delKeyItem(player:getCharVar('[Aeonic]KeyItem'))
        player:setCharVar('[Aeonic]KeyItem',0)
        player:setCharVar('[Aeonic]Weapon',0)
    end

    if option == 30 then -- give up option
        player:delKeyItem(player:getCharVar('[Aeonic]KeyItem'))
        player:setCharVar('[Aeonic]TemprixConvo', 4)
        player:setCharVar('[Aeonic]QuestActive', 0)
        player:setCharVar('[Aeonic]progress288', 0)
        player:setCharVar('[Aeonic]progress289', 0)
        player:setCharVar('[Aeonic]progress291', 0)
        player:setCharVar('[Aeonic]VanaDay', 0)
        player:setCharVar('[Aeonic]KeyItem',0)
        player:setCharVar('[Aeonic]Weapon',0)
    end

end

return entity