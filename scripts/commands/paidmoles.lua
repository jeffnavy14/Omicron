-----------------------------------
-- func: !paidmoles
-- desc: allow players to start whackamole event given they have the gil
-----------------------------------
require("scripts/globals/npc_util")
local commandObj = {}

commandObj.cmdprops =
{
    permission = 0,
    parameters = ''
}

-- Global declarations for menu pages and helper function at the top
local menu = {}

-- Helper function for delayed menu sending
local function delaySendMenu(player)
    player:timer(50, function(p) p:customMenu(menu) end)
end

local drops =
{
    [ 1]={reward = 1488},--A_egg
    [ 2]={reward = 1489},--B_egg
    [ 3]={reward = 1490},--C_egg
    [ 4]={reward = 1491},--D_egg
    [ 5]={reward = 1492},--E_egg
    [ 6]={reward = 1493},--F_egg
    [ 7]={reward = 1494},--G_egg
    [ 8]={reward = 1495},--H_egg
    [ 9]={reward = 1496},--I_egg
    [10]={reward = 1497},--J_egg
    [11]={reward = 1498},--K_egg
    [12]={reward = 1499},--L_egg
    [13]={reward = 1500},--M_egg
    [14]={reward = 1501},--N_egg
    [15]={reward = 1502},--O_egg
    [16]={reward = 1503},--P_egg
    [17]={reward = 1504},--Q_egg
    [18]={reward = 1505},--R_egg
    [19]={reward = 1506},--S_egg
    [20]={reward = 1507},--T_egg
    [21]={reward = 1508},--U_egg
    [22]={reward = 1509},--V_egg
    [23]={reward = 1510},--W_egg
    [24]={reward = 1511},--X_egg
    [25]={reward = 1512},--Y_egg
    [26]={reward = 1513},--Z_egg
    [27]={reward = 4487},--Colored_Egg
    [28]={reward = 4595},--Party_Egg
    [29]={reward = 4600},--Lucky_Egg
    [30]={reward = 18168},--Imperial_Egg
    [31]={reward = 18256},--Orphic_Egg
    [32]={reward = 18167},--Fortune_Egg
    [33]={reward = 18166},--Happy_Egg
    [34]={reward = 22299},--per._lucky_egg
}

local restrictedZones =
{
    [xi.zone.BASTOK_MARKETS] = true,
    [xi.zone.BASTOK_MINES] = true,
    [xi.zone.PORT_BASTOK] = true,
    [xi.zone.METALWORKS] = true,
    [xi.zone.SOUTHERN_SAN_DORIA] = true,
    [xi.zone.NORTHERN_SAN_DORIA] = true,
    [xi.zone.PORT_SAN_DORIA] = true,
    [xi.zone.CHATEAU_DORAGUILLE] = true,
    [xi.zone.WINDURST_WATERS] = true,
    [xi.zone.WINDURST_WALLS] = true,
    [xi.zone.PORT_WINDURST] = true,
    [xi.zone.WINDURST_WOODS] = true,
    [xi.zone.HEAVENS_TOWER] = true,
    [xi.zone.RULUDE_GARDENS] = true,
    [xi.zone.UPPER_JEUNO] = true,
    [xi.zone.LOWER_JEUNO] = true,
    [xi.zone.PORT_JEUNO] = true,
    [xi.zone.RABAO] = true,
    [xi.zone.SELBINA] = true,
    [xi.zone.MHAURA] = true,
    [xi.zone.NORG] = true,
    [xi.zone.KAZHAM] = true,
    [xi.zone.AL_ZAHBI] = true,
    [xi.zone.AHT_URHGAN_WHITEGATE] = true,
    [xi.zone.NASHMAU] = true,
    [xi.zone.BASTOK_MARKETS_S] = true,
    [xi.zone.SOUTHERN_SAN_DORIA_S] = true,
    [xi.zone.WINDURST_WATERS_S] = true,
    [xi.zone.WESTERN_ADOULIN] = true,
    [xi.zone.EASTERN_ADOULIN] = true,
}

commandObj.onTrigger = function(player)
    local cost = 25000000
    local currentGil = player:getGil()
    local name = player:getName() or 'Someone'
    local zone = player:getZone()
    local lastUsed = zone:getLocalVar("PaidMolesLastUsed")
    local now = os.time()
    local cooldown = 60 * 60
    local currentZoneID = player:getZoneID()
    local isGM = player:getGMLevel() >= 1

    if restrictedZones[currentZoneID] then
        player:printToPlayer("You cannot use !paidmoles in this zone. Please go to an area where you can engage monsters normally.")
        return
    end

    if not isGM and lastUsed ~= 0 and now - lastUsed < cooldown then
        local remaining = cooldown - (now - lastUsed)
        player:printToPlayer(string.format("The Moles were recently summoned in this zone! Please wait %d more minute(s).", math.ceil(remaining / 60)))
        return
    end

    if not isGM and (type(currentGil) ~= "number" or currentGil < cost) then
        player:printToPlayer(string.format("You need %i gil to summon the Moles. You only have %i gil.", cost, currentGil))
        return
    end

menu.title = 'You want to kill the moles?'
menu.options =
    {
        {
            string.format('Yes, summon the Moles! (%s)', isGM and "Free" or string.format("%i Gil", cost)),
            function(playerArg)
                local isGMArg = playerArg:getGMLevel() >= 1
                if not isGMArg then
                    if not playerArg:delGil(cost) then
                        playerArg:printToPlayer("An error occurred while trying to deduct gil. Please try again.")
                        return
                    end
                    playerArg:printToPlayer(string.format("You have paid %i gil to summon the Moles!", cost))
                else
                    playerArg:printToPlayer("GM Override: Summoning Moles for free.")
                end
                zone:setLocalVar("PaidMolesLastUsed", os.time())

                if isGMArg then
                    playerArg:printToArea(string.format('%s has summoned the moles to appear, but they have stolen our eggs!', name), xi.msg.channel.SYSTEM_3, 0)
                else
                    playerArg:printToArea(string.format('%s has paid the moles to appear, but they have stolen our eggs!', name), xi.msg.channel.SYSTEM_3, 0)
                end
                playerArg:printToArea('Stop them, we have 10 minutes before they disappear back into the ground!', xi.msg.channel.SYSTEM_3, 0)
                playerArg:printToArea(string.format('Remember to tip %s!', name), xi.msg.channel.SYSTEM_3, 0)
                if not isGMArg then
                    playerArg:printToArea('Be aware: there is a 60-minute cooldown to restart the event in this zone.', xi.msg.channel.SYSTEM_3, 0)
                end

                for i = 1, 10 do
                    local zoneOrInstanceObj = playerArg:getZone()
                    local instance = playerArg:getInstance()
                    if instance then
                        zoneOrInstanceObj = instance
                    end

                    local mob = zoneOrInstanceObj:insertDynamicEntity({
                        objtype = xi.objType.MOB,
                        name = 'Mole',
                        look = 1972,
                        x = playerArg:getXPos(),
                        y = playerArg:getYPos(),
                        z = playerArg:getZPos(),
                        rotation = playerArg:getRotPos(),
                        groupId = 17,
                        groupZoneId = 95,
                        allegiance = 0,
                        widescan = 1,
                        minLevel = 10,
                        maxLevel = 10,

                        onMobSpawn = function(mob, mobPlayerArg, optParams)
                            mob:setMobMod(xi.mobMod.ROAM_DISTANCE, 45)
                            mob:setMobMod(xi.mobMod.NO_AGGRO, 1)
                            mob:addMod(xi.mod.REGEN, 1000)
                            mob:addMod(xi.mod.DMG, -500)
                            mob:addMod(xi.mod.ATT, -1000)
                            mob:addMod(xi.mod.ACC, -1000)
                            mob:addMod(xi.mod.EVA, -500)
                            mob:addMod(xi.mod.DEF, -500)
                            mob:setUnkillable(true)
                            mob:addStatusEffect(xi.effect.PHYSICAL_SHIELD, { power = 1, origin = mob, icon = 0 })
                            mob:addStatusEffect(xi.effect.ARROW_SHIELD, { power = 1, origin = mob, icon = 0 })
                            mob:setMobMod(xi.mobMod.NO_DROPS, 1)
                            mob:setMobMod(xi.mobMod.CLAIM_TYPE, xi.claimType.UNCLAIMABLE)
                            mob:setLocalVar('MoleDespawn', os.time() + 600)

                            mob:addListener('TAKE_DAMAGE', 'MOLE_TAKE_DAMAGE', function(mob, damage, attacker, attackType, damageType)
                                if attacker and attacker:isPC() then
                                    local encumbranceId = xi.effect.EMCUMBRANCE_I or 259
                                    if not attacker:hasStatusEffect(encumbranceId) then
                                        local duration = mob:getLocalVar('MoleDespawn') - os.time()
                                        if duration > 0 then
                                            for i = xi.slot.MAIN, xi.slot.BACK do
                                                attacker:unequipItem(i)
                                            end
                                            attacker:addStatusEffect(xi.effect.ENCUMBRANCE_I, { power = 65535, duration = 0, origin = attacker })
                                        end
                                    end
                                    if attackType == xi.attackType.PHYSICAL and
                                    (damageType == xi.damageType.NONE or damageType == xi.damageType.HTH) then
                                        attacker:setTP(0)
                                        local rand = math.random(1, 20)
                                        local randz = math.random(1, 240)
                                        if attacker:isPC() then
                                            if rand == 5 then
                                                npcUtil.giveItem(attacker, { { xi.item.GIL, math.random(100, 1000) } })
                                            end
                                            for k, v in pairs(drops) do
                                                if randz == k then
                                                    npcUtil.giveItem(attacker, { { v.reward, 1 } })
                                                end
                                            end
                                        end
                                    end
                                end
                            end)
                        end,

                        onMobFight = function(mob, target)
                            if mob:getLocalVar('MoleDespawn') <= os.time() then
                                DespawnMob(mob:getID())
                            end
                        end,

                        onMobRoam = function(mob)
                            if mob:getLocalVar('MoleDespawn') <= os.time() then
                                DespawnMob(mob:getID())
                            end
                        end,

                        onMobDeath = function(mob, mobPlayerArg, optParams) end,
                        onMobDespawn = function(mob, mobPlayerArg, optParams)
                            local zone = mob:getZone()
                            local players = zone:getPlayers()
                            local encumbranceId = xi.effect.ENCUMBRANCE or 177
                            for _, player in pairs(players) do
                                if player:hasStatusEffect(xi.effect.ENCUMBRANCE_I) then
                                    player:delStatusEffect(xi.effect.ENCUMBRANCE_I)
                                end
                            end
                        end,

                        releaseIdOnDisappear = true,
                        specialSpawnAnimation = true,
                    })

                    mob:setSpawn(playerArg:getXPos() + math.random(5, 15), playerArg:getYPos(), playerArg:getZPos() + math.random(5, 15), playerArg:getRotPos())
                    mob:setDropID(0)
                    --mob:setClaimable(false) -- IGNORE - This function does not exist, using claim type instead
                    mob:spawn()
                end
            end
        },
        {
            'No, Cancel',
            function(playerArg)
			
            end
        },
    }

    delaySendMenu(player)
end

return commandObj