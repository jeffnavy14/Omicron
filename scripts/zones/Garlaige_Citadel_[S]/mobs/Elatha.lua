------------------------------
-- Area: Garlaige Citadel [S]
--   NM: Elatha
------------------------------
require("scripts/globals/hunts")
require("scripts/globals/status")
mixins = {require("scripts/mixins/fomor_hate")}
------------------------------
local entity = {}

entity.onMobSpawn = function(mob)
    -- All Mods Here Are Assigned For Initial Difficulty Tuning
    mob:addMod(xi.mod.MAIN_DMG_RATING, 50)
    mob:addMod(xi.mod.STR, 40)
    mob:addMod(xi.mod.VIT, 20)
    mob:addMod(xi.mod.INT, 65)
    mob:addMod(xi.mod.MND, 20)
    mob:addMod(xi.mod.CHR, 20)
    mob:addMod(xi.mod.AGI, 20)
    mob:addMod(xi.mod.DEX, 40)
    mob:setMod(xi.mod.DEFP, 0)
    mob:setMod(xi.mod.RATTP, 0)
    -- Raising Defense As Melee Was Doing Too Much Damage
    mob:addMod(xi.mod.DEFP, 525)
    mob:addMod(xi.mod.RATTP, 525)
    mob:addMod(xi.mod.ACC, 100)
    -- Resistances Based On https://ffxiclopedia.fandom.com/wiki/Elatha
    mob:setMod(xi.mod.EARTH_SDT, 200)
    mob:setMod(xi.mod.DARK_SDT, 250)
    mob:setMod(xi.mod.LIGHT_SDT, 200)
    mob:setMod(xi.mod.FIRE_SDT, 128)
    mob:setMod(xi.mod.WATER_SDT, 200)
    mob:setMod(xi.mod.THUNDER_SDT, 200)
    mob:setMod(xi.mod.WIND_SDT, 200)
    mob:setMod(xi.mod.ICE_SDT, 200)
    mob:setMod(xi.mod.SILENCERES, 100)
    mob:setMod(xi.mod.ICE_ABSORB, 100)
    mob:setMod(xi.mod.STUNRES, 99)
    -- Adding Resbuild for Stun as it was too potent.
    mob:setMod(xi.mod.BINDRES, 100)
    mob:setMod(xi.mod.GRAVITYRES, 100)
    mob:setMod(xi.mod.SLEEPRES, 100)
    mob:setMod(xi.mod.POISONRES, 100)
    mob:setMod(xi.mod.PARALYZERES, 100)
    mob:setMod(xi.mod.LULLABYRES, 100)
    mob:setMod(xi.mod.FASTCAST, 10)
    -- Status Effecs Based On https://ffxiclopedia.fandom.com/wiki/Elatha
    mob:addStatusEffect(xi.effect.ICE_SPIKES, 50, 0, 0)
    mob:addStatusEffect(xi.effect.REGEN, 30, 3, 0)
    -- Increasing Enblizzard for Standard Attack Round to 100 (http://wiki.ffo.jp/wiki.cgi?Command=HDetail&articleid=129694&id=18305)
    mob:addStatusEffect(xi.effect.ENBLIZZARD_II, 25, 0, 0)
    mob:addStatusEffect(xi.effect.REFRESH, 50, 3, 0)
    mob:setMobMod(xi.mobMod.ADD_EFFECT, 1)
end

entity.onAdditionalEffect = function(mob, target, damage)
    -- 25% En-Paralyze
    if target:hasStatusEffect(xi.effect.PARALYSIS) == false then
        return xi.mob.onAddEffect(mob, target, damage, xi.mob.ae.PARALYZE, {chance = 25})
    end
end

entity.onMobFight = function(mob, target)

   -- Blood Weapon
    -- Should Be Used Every 5 Minutes, Set to 50% Health As Baseline (https://ffxiclopedia.fandom.com/wiki/Elatha)
    local timer = mob:getLocalVar("EBloodWeaponTimer")
    if mob:getHPP() <= 50 then
        if os.time() > timer then
            mob:useMobAbility(695)
            mob:setLocalVar("EBloodWeaponTimer", os.time() + 300)
            mob:setLocalVar("EBloodWeaponFollow", 1)
        end
    end

    -- 20 Yalm Paralyze Aura Wtih Blood Weapon Active (https://ffxiclopedia.fandom.com/wiki/Elatha)
    -- This just silently removes and adds Paralyze. RIP Battlemod users' HUDs for the next 60 seconds.
    if mob:hasStatusEffect(xi.effect.BLOOD_WEAPON) == true then
        local nearbyPlayers = mob:getPlayersInRange(20)
        if nearbyPlayers == nil then return end
        for _,v in ipairs(nearbyPlayers) do
            v:delStatusEffectSilent(xi.effect.PARALYSIS)
            v:addStatusEffectEx(xi.effect.PARALYSIS, xi.effect.PARALYSIS, 25, 0, 5)
        end
    end

    -- Arena Style Draw-In
    -- Should Draw Into A Single Point In the Room, Draws In Anyone In Range (https://ffxiclopedia.fandom.com/wiki/Elatha)
    local drawInWait = mob:getLocalVar("DrawInWait")

    if (target:getZPos() < -111.00 or target:getZPos() > -82.00) and os.time() > drawInWait then
        target:setPos(-140.25, 0.00, -100.00)
        mob:messageBasic(232, 0, 0, target)
        mob:setLocalVar("DrawInWait", os.time() + 2)
    elseif (target:getXPos() < -155.00 or target:getXPos() > -122.00) and os.time() > drawInWait then
        target:setPos(-140.25, 0.00, -100.00)
        mob:messageBasic(232, 0, 0, target)
        mob:setLocalVar("DrawInWait", os.time() + 2)
    end

    -- Magic Retaliation and Level Up Function
    -- Should Always Retaliate When Taking Magic Damage and Level Up (https://ffxiclopedia.fandom.com/wiki/Elatha)
    mob:addListener("MAGIC_TAKE", "ELATHA_MAGIC_TAKE", function(target, caster, spell)
        if
            spell:tookEffect() and
            (caster:isPC() or caster:isPet())
        then
            target:setLocalVar("ERetaliate", 1)
            target:addEnmity(caster, 1000, 1000)
        end
    end)

    -- Enmity Handling
    -- Mob Should Have Little To No Enmity Control (https://ffxiclopedia.fandom.com/wiki/Elatha)
    mob:addListener("TAKE_DAMAGE", "ELATHA_TAKE_DAMAGE", function(mob, amount, attacker, attackType, damageType)
        if attackType == xi.attackType.PHYSICAL then
            mob:addEnmity(attacker, 1000, 1000)
        end
    end)

    mob:addListener("WEAPONSKILL_TAKE", "ELATHA_WEAPONSKILL_TAKE", function(target, attacker, skillid, tp, action)
        target:addEnmity(attacker, 1000, 1000)
    end)

end

entity.onMobDisengage = function(mob)
    local levelupsum = mob:getLocalVar("TotalLevelUp")
    if mob:getHPP() < 100 or levelupsum > 0 then
        DespawnMob(17449008)
        mob:setLocalVar("TotalLevelUp", 0)
        mob:setLocalVar("EFightTimer", 0)
        mob:setLocalVar("MobPoof", 1)
    end
    mob:removeListener("ELATHA_WEAPONSKILL_TAKE")
    mob:removeListener("ELATHA_DAMAGE")
    mob:removeListener("ELATHA_TAKE")
end

entity.onMobDespawn = function(mob) 
    if mob:getLocalVar("MobPoof") == 1 then
        mob:showText(mob, zones[mob:getZoneID()].text.NM_DESPAWN)
        mob:setLocalVar("MobPoof", 0)
    end

    local respawn = 14400
    mob:setRespawnTime(respawn) -- 4 hours
    SetServerVariable("Elatha_Respawn", (os.time() + respawn))
end

entity.onMobDeath = function(mob, player, isKiller)
    xi.hunts.checkHunt(mob, player, 534)
    player:setTitle(xi.title.ELATHA_EXORCIST)
end
return entity