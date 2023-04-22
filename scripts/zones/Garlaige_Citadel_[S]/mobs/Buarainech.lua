------------------------------
-- Area: Garlaige Citadel [S]
--   NM: Buarainech
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
    mob:addMod(xi.mod.INT, 50)
    mob:addMod(xi.mod.MND, 20)
    mob:addMod(xi.mod.CHR, 20)
    mob:addMod(xi.mod.AGI, 20)
    mob:addMod(xi.mod.DEX, 40)
    mob:setMod(xi.mod.DEFP, 0)
    mob:setMod(xi.mod.RATTP, 0)
    mob:addMod(xi.mod.DEFP, 475)
    mob:addMod(xi.mod.RATTP, 475)
    mob:addMod(xi.mod.ACC, 150)
    -- Resistances Based On https://ffxiclopedia.fandom.com/wiki/Buarainech
    mob:setMod(xi.mod.EARTH_SDT, 128)
    mob:setMod(xi.mod.DARK_SDT, 250)
    mob:setMod(xi.mod.LIGHT_SDT, 200)
    mob:setMod(xi.mod.ICE_SDT, 200)
    mob:setMod(xi.mod.FIRE_SDT, 200)
    mob:setMod(xi.mod.WATER_SDT, 200)
    mob:setMod(xi.mod.THUNDER_SDT, 200)
    mob:setMod(xi.mod.WIND_SDT, 200)
    mob:setMod(xi.mod.SILENCERES, 100)
    mob:setMod(xi.mod.STUNRES, 99)
    -- Adding Resbuild for Stun as it was too potent.
    mob:setMod(xi.mod.BINDRES, 100)
    mob:setMod(xi.mod.GRAVITYRES, 100)
    mob:setMod(xi.mod.SLEEPRES, 100)
    mob:setMod(xi.mod.POISONRES, 100)
    mob:setMod(xi.mod.PARALYZERES, 100)
    mob:setMod(xi.mod.LULLABYRES, 100)
    mob:setMod(xi.mod.FASTCAST, 10)
    -- Status Effecs Based On https://ffxiclopedia.fandom.com/wiki/Buarainech
    mob:addStatusEffect(xi.effect.SHOCK_SPIKES, 50, 0, 0)
    mob:addStatusEffect(xi.effect.REGEN, 30, 3, 0)
    -- Increasing Enthunder for Standard Attack Round to 100 (http://wiki.ffo.jp/wiki.cgi?Command=HDetail&articleid=129693&id=18304)
    mob:addStatusEffect(xi.effect.ENTHUNDER_II, 100, 0, 0)
    mob:addStatusEffect(xi.effect.REFRESH, 50, 3, 0)
end

entity.onAdditionalEffect = function(mob, target, damage)
    -- 100% En-Doom Kek
    if target:hasStatusEffect(xi.effect.DOOM) == false then
        return xi.mob.onAddEffect(mob, target, damage, xi.mob.ae.DOOM, {chance = 100})
    end
end

entity.onMobFight = function(mob, target)

    -- Arena Style Draw-In
    -- Should Draw Into A Single Point In the Room (https://www.youtube.com/watch?v=7sjZoknSXRw&ab_channel=RainbowChaser)
    local drawInWait = mob:getLocalVar("DrawInWait")
    
    if (target:getZPos() < -146.66) and os.time() > drawInWait then
        target:setPos(121.70, 7.00, -122.45)
        mob:messageBasic(232, 0, 0, target)
        mob:setLocalVar("DrawInWait", os.time() + 2)
    end

    -- Spirit Surge
    -- Should Be Used Every 5 Minutes, Set to 50% Health As Baseline (https://ffxiclopedia.fandom.com/wiki/Buarainech)
    local timer = mob:getLocalVar("BSpiritSurgeTimer")
    if mob:getHPP() <= 50 then
        if os.time() > timer then
            mob:useMobAbility(1893)
            mob:setLocalVar("BSpiritSurgeTimer", os.time() + 300)
        end
    end

    -- En-doom When Spirit Surge Active (https://ffxiclopedia.fandom.com/wiki/Buarainech)
    if (mob:hasStatusEffect(xi.effect.SPIRIT_SURGE) == true) then
        mob:setMobMod(xi.mobMod.ADD_EFFECT, 1)
    else
        mob:setMobMod(xi.mobMod.ADD_EFFECT, 0)
    end

    -- Level Up Function
    -- Starts Level Up Sequence When Any Buff Is Gained (https://ffxiclopedia.fandom.com/wiki/Buarainech)
    mob:addListener("EFFECT_GAIN", "BUARAINECH_EFFECT_GAIN", function(mob, effect)
        if (effect:getType() == xi.effect.SPIRIT_SURGE) then
            mob:setLocalVar("LevelUp", 0)
        else
            local levelupsum = mob:getLocalVar("TotalLevelUp")
                if levelupsum <= 30 then
                    mob:setLocalVar("LevelUp", 1)
                    mob:setLocalVar("TotalLevelUp", levelupsum + 1)
                else
                    mob:setLocalVar("LevelUp", 0)
                end
        end
    end)

    -- Magic Retaliation
    -- Should Always Retaliate When Taking Magic Damage (https://ffxiclopedia.fandom.com/wiki/Buarainech)
    mob:addListener("MAGIC_TAKE", "BUARAINECH_MAGIC_TAKE", function(target, caster, spell)
        if
            spell:tookEffect() and
            (caster:isPC() or caster:isPet())
        then
            target:setLocalVar("BRetaliate", 1)
            target:addEnmity(caster, 1000, 1000)
        end
    end)

    -- Enmity Handling
    -- Mob Should Have Little To No Enmity Control (https://ffxiclopedia.fandom.com/wiki/Buarainech)
    mob:addListener("TAKE_DAMAGE", "BUARAINECH_TAKE_DAMAGE", function(mob, amount, attacker, attackType, damageType)
        if attackType == xi.attackType.PHYSICAL then
            mob:addEnmity(attacker, 1000, 1000)
        end
    end)

    mob:addListener("WEAPONSKILL_TAKE", "BUARAINECH_WEAPONSKILL_TAKE", function(target, attacker, skillid, tp, action)
        target:addEnmity(attacker, 1000, 1000)
    end)

end

entity.OnSpellPrecast = function(caster, target, spell)
    -- AOE Stun (https://ffxiclopedia.fandom.com/wiki/Buarainech)
    if spell:getID() == 252 then
        caster:addStatusEffect(xi.effect.MANIFESTATION, 1, 0, 60)
    end
end

entity.onMobDisengage = function(mob)
    local levelupsum = mob:getLocalVar("TotalLevelUp")
    if mob:getHPP() < 100 or levelupsum > 0 then
        DespawnMob(17449017)
        mob:setLocalVar("BFightTimer", 0)
        mob:setLocalVar("TotalLevelUp", 0)
        mob:setLocalVar("MobPoof", 1)
    end
    mob:removeListener("BUARAINECH_WEAPONSKILL_TAKE")
    mob:removeListener("BUARAINECH_TAKE_DAMAGE")
    mob:removeListener("BUARAINECH_MAGIC_TAKE")
    mob:removeListener("BUARAINECH_EFFECT_GAIN")
end

entity.onMobDespawn = function(mob) 
    if mob:getLocalVar("MobPoof") == 1 then
        mob:showText(mob, zones[mob:getZoneID()].text.NM_DESPAWN)
        mob:setLocalVar("MobPoof", 0)
    end

    local respawn = 14400
    mob:setRespawnTime(respawn) -- 4 hours
    SetServerVariable("Buarainech_Respawn", (os.time() + respawn))
end

entity.onMobDeath = function(mob, player, isKiller)
    xi.hunts.checkHunt(mob, player, 534)
    player:setTitle(xi.title.BUARAINECH_EXORCIST)
end

return entity