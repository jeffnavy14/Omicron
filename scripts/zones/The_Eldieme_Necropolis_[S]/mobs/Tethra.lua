------------------------------
-- Area: The Eldieme Necropolis [S]
--   NM: Tethra
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
    mob:addMod(xi.mod.DEFP, 375)
    mob:addMod(xi.mod.RATTP, 375)
    mob:addMod(xi.mod.ACC, 100)
    -- Resistances Based On https://ffxiclopedia.fandom.com/wiki/Tethra
    mob:setMod(xi.mod.EARTH_SDT, 170)
    mob:setMod(xi.mod.DARK_SDT, 240)
    mob:setMod(xi.mod.LIGHT_SDT, 170)
    mob:setMod(xi.mod.FIRE_SDT, 128)
    mob:setMod(xi.mod.WATER_SDT, 170)
    mob:setMod(xi.mod.THUNDER_SDT, 170)
    mob:setMod(xi.mod.WIND_SDT, 128)
    mob:setMod(xi.mod.ICE_SDT, 200)
    mob:setMod(xi.mod.SILENCERES, 100)
    mob:setMod(xi.mod.STUNRES, 99)
    -- Adding Resbuild for Stun as it was too potent.
    mob:setMod(xi.mod.BINDRES, 100)
    mob:setMod(xi.mod.GRAVITYRES, 100)
    mob:setMod(xi.mod.SLEEPRES, 100)
    mob:setMod(xi.mod.POISONRES, 100)
    mob:setMod(xi.mod.PARALYZERES, 100)
    mob:setMod(xi.mod.LULLABYRES, 100)
    mob:setMod(xi.mod.EARTH_ABSORB, 100)
    mob:setMod(xi.mod.LIGHT_ABSORB, 100)
    -- Status Effecs Based On https://ffxiclopedia.fandom.com/wiki/Tethra
    mob:addStatusEffect(xi.effect.REGEN, 30, 3, 0)
    mob:setMod(xi.effect.FAST_CAST, 25)
    -- Increasing Enstone to 100 Per Attack Round (http://wiki.ffo.jp/wiki.cgi?Command=HDetail&articleid=129692&id=18306)
    mob:addStatusEffect(xi.effect.ENSTONE_II, 100, 0, 0)
    mob:addStatusEffect(xi.effect.REFRESH, 50, 3, 0)
    mob:setMobMod(xi.mobMod.ADD_EFFECT, 1)
end

entity.onAdditionalEffect = function(mob, target, damage)
    -- 25% En-Petrify https://ffxiclopedia.fandom.com/wiki/Tethra
    if target:hasStatusEffect(xi.effect.PETRIFICATION) == false then
        return xi.mob.onAddEffect(mob, target, damage, xi.mob.ae.PETRIFY, {chance = 25})
    end
end

entity.onMobFight = function(mob, target)

    -- Arena Style Draw-In
    -- Should Draw Into A Single Point In the Room (https://ffxiclopedia.fandom.com/wiki/Tethra)
    local drawInWait = mob:getLocalVar("DrawInWait")

    if (target:getZPos() > -64.00) and os.time() > drawInWait then
        target:setPos(113.621, 8.584, -81.806)
        mob:messageBasic(232, 0, 0, target)
        mob:setLocalVar("DrawInWait", os.time() + 2)
    end

    if mob:getCurrentAction() == xi.act.MAGIC_CASTING then
        mob:setMod(xi.mod.FIRE_ABSORB, 100)
        mob:setMod(xi.mod.WATER_ABSORB, 100)
        mob:setMod(xi.mod.DARK_ABSORB, 100)
        mob:setMod(xi.mod.LTNG_ABSORB, 100)
        mob:setMod(xi.mod.ICE_ABSORB, 100)
        mob:setMod(xi.mod.WIND_ABSORB, 100)
        -- Nullify All Physical Damage
        mob:addMod(xi.mod.UDMGPHYS, -100)
        mob:addMod(xi.mod.UDMGRANGE, -100)
    else
        mob:setMod(xi.mod.FIRE_ABSORB, 0)
        mob:setMod(xi.mod.WATER_ABSORB, 0)
        mob:setMod(xi.mod.DARK_ABSORB, 0)
        mob:setMod(xi.mod.LTNG_ABSORB, 0)
        mob:setMod(xi.mod.ICE_ABSORB, 0)
        mob:setMod(xi.mod.WIND_ABSORB, 0)
        mob:setMod(xi.mod.UDMGPHYS, 0)
        mob:setMod(xi.mod.UDMGRANGE, 0)
    end

    -- Manafont
    -- Should Be Used Every 5 Minutes, Set to 50% Health As Baseline (https://ffxiclopedia.fandom.com/wiki/Tethra)
    local timer = mob:getLocalVar("TManafontTimer")
    if mob:getHPP() <= 50 then
        if os.time() > timer then
            mob:useMobAbility(691)
            mob:setLocalVar("TManafontTimer", os.time() + 300)
        end
    end

    -- Job Ability Functions
    -- Retaliates With Instant Stone IV And Level Up If Targeted (https://ffxiclopedia.fandom.com/wiki/Tethra)
    -- Starts Level Up Sequence When Any Other Ability Is Used (https://ffxiclopedia.fandom.com/wiki/Tethra)
    mob:addListener("PLAYER_ABILITY_USED", "TETHRA_PLAYER_ABILITY_USED", function(mob, player, ability, action, target)
        --Retaliate and Level Up
        if ability:getID() == (46) then
            mob:setLocalVar("TAbilityRetaliate", 1)
        
        -- Level Up
        else
            mob:setLocalVar("TAbilityLevelUp", 1)
        
        end
    end)

    -- Magic Handling
    -- Mob Should Retaliate With Instant Cast Stone IV (https://ffxiclopedia.fandom.com/wiki/Tethra)
    -- Mob Should Have Little To No Enmity Control (https://ffxiclopedia.fandom.com/wiki/Tethra)
    mob:addListener("MAGIC_TAKE", "TETHRA_MAGIC_TAKE", function(target, caster, spell)
        if
            spell:tookEffect() and
            (caster:isPC() or caster:isPet())
        then
            target:setLocalVar("TMagicRetaliate", 1)
            target:addEnmity(caster, 1000, 1000)
        end
    end)

    -- Enmity Handling
    -- Mob Should Have Little To No Enmity Control (https://ffxiclopedia.fandom.com/wiki/Tethra)
    mob:addListener("TAKE_DAMAGE", "TETHRA_TAKE_DAMAGE", function(mob, amount, attacker, attackType, damageType)
        if attackType == xi.attackType.PHYSICAL then
            mob:addEnmity(attacker, 1000, 1000)
        end
    end)

    mob:addListener("WEAPONSKILL_TAKE", "TETHRA_WEAPONSKILL_TAKE", function(target, attacker, skillid, tp, action)
        target:addEnmity(attacker, 1000, 1000)
    end)

end

entity.OnSpellPrecast = function(caster, target, spell)
    if spell:getID() == 210 then
        if caster:hasStatusEffect(xi.effect.MANAFONT) == true then
            spell:setAoE(xi.magic.aoe.RADIAL)
            spell:setFlag(xi.magic.spellFlag.HIT_ALL)
            spell:setRadius(15)
        end
    end
end

entity.onMobDisengage = function(mob)
    local levelupsum = mob:getLocalVar("TotalLevelUp")
    if mob:getHPP() < 100 or levelupsum > 0 then
        DespawnMob(17494213)
        mob:setLocalVar("TotalLevelUp", 0)
        mob:setLocalVar("TFightTimer", 0)
        mob:setLocalVar("MobPoof", 1)
    end
    mob:removeListener("TEHTRA_WEAPONSKILL_TAKE")
    mob:removeListener("TEHTRA_TAKE_DAMAGE")
    mob:removeListener("TEHTRA_MAGIC_TAKE")
    mob:removeListener("TEHTRA_PLAYER_ABILITY_USED")
end

entity.onMobDespawn = function(mob) 
    if mob:getLocalVar("MobPoof") == 1 then
        mob:showText(mob, zones[mob:getZoneID()].text.NM_DESPAWN)
        mob:setLocalVar("MobPoof", 0)
    end

    local respawn = math.random(14400, 21600)
    mob:setRespawnTime(respawn) -- 4-6 hours
    SetServerVariable("Tethra_Respawn", (os.time() + respawn))
end

entity.onMobDeath = function(mob, player, isKiller)
    xi.hunts.checkHunt(mob, player, 496)
    player:setTitle(xi.title.TETHRA_EXORCIST)
end

return entity