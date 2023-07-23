-----------------------------------
-- Area: Crawlers Nest [S]
--   NM: Lugh
------------------------------
require("scripts/globals/hunts")
mixins = {require("scripts/mixins/fomor_hate")}
------------------------------
local entity = {}


entity.onMobSpawn = function(mob)
    -- All Mods Here Are Assigned For Initial Difficulty Tuning
    mob:addMod(xi.mod.MAIN_DMG_RATING, 50)
    mob:addMod(xi.mod.STR, 50)
    mob:addMod(xi.mod.VIT, 20)
    mob:addMod(xi.mod.INT, 50)
    mob:addMod(xi.mod.MND, 20)
    mob:addMod(xi.mod.CHR, 20)
    mob:addMod(xi.mod.AGI, 20)
    mob:addMod(xi.mod.DEX, 40)
    mob:setMod(xi.mod.DEFP, 0)
    mob:setMod(xi.mod.RATTP, 0)
    mob:addMod(xi.mod.DEFP, 475)
    mob:addMod(xi.mod.RATTP, 475)
    mob:addMod(xi.mod.ACC, 100)
    -- Adding 10% Double Since WAR
    mob:setMod(xi.mod.DOUBLE_ATTACK, 10)
    -- Resistances Based On https://ffxiclopedia.fandom.com/wiki/Lugh
    mob:setMod(xi.mod.EARTH_SDT, 170)
    mob:setMod(xi.mod.DARK_SDT, 250)
    mob:setMod(xi.mod.LIGHT_SDT, 128)
    mob:setMod(xi.mod.FIRE_SDT, 170)
    mob:setMod(xi.mod.WATER_SDT, 170)
    mob:setMod(xi.mod.THUNDER_SDT, 170)
    mob:setMod(xi.mod.ICE_SDT, 200)
    mob:setMod(xi.mod.WIND_SDT, 170)
    mob:setMod(xi.mod.SILENCERES, 100)
    mob:setMod(xi.mod.FIRE_ABSORB, 100)
    mob:setMod(xi.mod.STUNRES, 99)
    -- Adding Resbuild for Stun as it was too potent.
    mob:setMod(xi.mod.STUNRES, 50)
    mob:setMod(xi.mod.BINDRES, 100)
    mob:setMod(xi.mod.GRAVITYRES, 100)
    mob:setMod(xi.mod.SLEEPRES, 100)
    mob:setMod(xi.mod.PARALYZERES, 100)
    mob:setMod(xi.mod.LULLABYRES, 100)
    mob:setMod(xi.mod.FASTCAST, 10)
    -- Status Effecs Based On https://ffxiclopedia.fandom.com/wiki/Lugh
    mob:addStatusEffect(xi.effect.BLAZE_SPIKES, 50, 0, 0)
    mob:addStatusEffect(xi.effect.REGAIN, 10, 3, 0)
    mob:addStatusEffect(xi.effect.REGEN, 30, 3, 0)
    -- Increasing Enfire for Standard Attack Round to 100 (http://wiki.ffo.jp/wiki.cgi?Command=HDetail&articleid=129695&id=18303)
    mob:addStatusEffect(xi.effect.ENFIRE_II, 100, 0, 0)
    mob:addStatusEffect(xi.effect.REFRESH, 50, 3, 0)
    -- Revamping Movement Speed Bonus
    mob:addMod(xi.mod.MOVE, 12)
    mob:setMobMod(xi.mobMod.ADD_EFFECT, 1)
end

entity.onAdditionalEffect = function(mob, target, damage)
    -- 25% En-Paralyze
    if target:hasStatusEffect(xi.effect.PLAGUE) == false then
        return xi.mob.onAddEffect(mob, target, damage, xi.mob.ae.PLAGUE, {chance = 25})
    end
end

entity.onMobFight = function(mob, target)

    -- Mighty Strikes
    -- Should Be Used Every 5 Minutes, Set to 50% Health As Baseline (https://ffxiclopedia.fandom.com/wiki/Lugh)
    local timer = mob:getLocalVar("LMightyStrikesTimer")
    if mob:getHPP() <= 50 then
        if os.time() > timer then
            mob:useMobAbility(688)
            mob:setLocalVar("LMightyStrikesTimer", os.time() + 300)
        end
    end

    -- Magic Enmity Handling
    -- Mob Should Have Little To No Enmity Control (https://ffxiclopedia.fandom.com/wiki/Lugh)
    mob:addListener("MAGIC_TAKE", "LUGH_MAGIC_TAKE", function(target, caster, spell)
        if
            spell:tookEffect() and
            (caster:isPC() or caster:isPet())
        then
            target:addEnmity(caster, 1000, 1000)
        end
    end)

    -- Enmity Handling
    -- Mob Should Have Little To No Enmity Control (https://ffxiclopedia.fandom.com/wiki/Lugh)
    mob:addListener("TAKE_DAMAGE", "LUGH_TAKE_DAMAGE", function(mob, amount, attacker, attackType, damageType)
        if attackType == xi.attackType.PHYSICAL then
            mob:addEnmity(attacker, 1000, 1000)
        end
    end)

    mob:addListener("WEAPONSKILL_TAKE", "LUGH_WEAPONSKILL_TAKE", function(target, attacker, skillid, tp, action)
        target:addEnmity(attacker, 1000, 1000)
    end)
end


entity.onMobDisengage = function(mob)
    local levelupsum = mob:getLocalVar("TotalLevelUp")
    if mob:getHPP() < 100 or levelupsum > 0 then
        DespawnMob(17477708)
        mob:setLocalVar("TotalLevelUp", 0)
        mob:setLocalVar("LFightTimer", 0)
        mob:setLocalVar("MobPoof", 1)
    end
    mob:removeListener("LUGH_WEAPONSKILL_TAKE")
    mob:removeListener("LUGH_TAKE_DAMAGE")
    mob:removeListener("LUGH_MAGIC_TAKE")
end

entity.onMobDespawn = function(mob) 
    if mob:getLocalVar("MobPoof") == 1 then
        mob:showText(mob, zones[mob:getZoneID()].text.NM_DESPAWN)
        mob:setLocalVar("MobPoof", 0)
    end

    local respawn = 14400
    mob:setRespawnTime(respawn) -- 4 hours 
    SetServerVariable("Lugh_Respawn", (os.time() + respawn))
end

entity.onMobDeath = function(mob, player, optParams)
        xi.hunts.checkHunt(mob, player, 516)
        player:setTitle(xi.title.LUGH_EXORCIST)
end

return entity
