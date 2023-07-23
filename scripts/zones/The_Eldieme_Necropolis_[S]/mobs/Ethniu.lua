------------------------------
-- Area: The Eldieme Necropolis [S]
--   NM: Ethniu
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
    mob:addMod(xi.mod.AGI, 50)
    mob:addMod(xi.mod.DEX, 50)
    mob:setMod(xi.mod.DEFP, 0)
    mob:setMod(xi.mod.RATTP, 0)
    mob:addMod(xi.mod.DEFP, 450)
    mob:addMod(xi.mod.RATTP, 450)
    mob:addMod(xi.mod.ACC, 150)
    mob:addMod(xi.mod.EVA, 100)
    -- Adding 10% Triple Since THF
    mob:setMod(xi.mod.TRIPLE_ATTACK, 10)
    -- Resistances Based On https://ffxiclopedia.fandom.com/wiki/Ethniu
    mob:setMod(xi.mod.EARTH_SDT, 170)
    mob:setMod(xi.mod.DARK_SDT, 250)
    mob:setMod(xi.mod.LIGHT_SDT, 128)
    mob:setMod(xi.mod.FIRE_SDT, 128)
    mob:setMod(xi.mod.WATER_SDT, 170)
    mob:setMod(xi.mod.THUNDER_SDT, 170)
    mob:setMod(xi.mod.ICE_SDT, 200)
    mob:setMod(xi.mod.WIND_SDT, 170)
    mob:setMod(xi.mod.SILENCERES, 100)
    mob:setMod(xi.mod.STUNRES, 99)
    -- Adding Resbuild for Stun as it was too potent.
    mob:setMod(xi.mod.BINDRES, 100)
    mob:setMod(xi.mod.GRAVITYRES, 100)
    mob:setMod(xi.mod.SLEEPRES, 100)
    mob:setMod(xi.mod.PARALYZERES, 100)
    mob:setMod(xi.mod.LULLABYRES, 100)
    mob:setMod(xi.mod.FASTCAST, 10)
    -- Status Effecs Based On https://ffxiclopedia.fandom.com/wiki/Ethniu
    mob:addStatusEffect(xi.effect.REGAIN, 10, 3, 0)
    mob:addStatusEffect(xi.effect.REGEN, 30, 3, 0)
    -- Increasing Enaero for Standard Attack Round to Equal 100 (http://wiki.ffo.jp/wiki.cgi?Command=HDetail&articleid=129696&id=18300)
    mob:addStatusEffect(xi.effect.ENAERO, 50, 0, 0)
    mob:addStatusEffect(xi.effect.REFRESH, 50, 3, 0)
    -- Revamping Movement Speed Bonus
    mob:addMod(xi.mod.MOVE, 12)
    mob:setMobMod(xi.mobMod.ADD_EFFECT, 1)
end

entity.onAdditionalEffect = function(mob, target, damage)
    -- 25% En-Silence
    if target:hasStatusEffect(xi.effect.SILENCE) == false then
        return xi.mob.onAddEffect(mob, target, damage, xi.mob.ae.SILENCE, {chance = 25})
    end
end


entity.onMobFight = function(mob, target)

    -- Perfect Dodge
    -- Should Be Used Every 5 Minutes, Set to 50% Health As Baseline (https://ffxiclopedia.fandom.com/wiki/Ethniu)
    local timer = mob:getLocalVar("EPerfectDodgeTimer")
    if mob:getHPP() <= 50 then
        if os.time() > timer then
            mob:useMobAbility(693)
            mob:setLocalVar("EPerfectDodgeTimer", os.time() + 300)
        end
    end

    -- Arena Style Draw-In
    -- Should Draw Into A Single Point In the Room, Draws In Anyone In Range (https://ffxiclopedia.fandom.com/wiki/Ethniu)
    local drawInWait = mob:getLocalVar("DrawInWait")

    if (target:getXPos() > 175.00) and os.time() > drawInWait then
        target:setPos(152.955, -15.000, 272.959)
        mob:messageBasic(232, 0, 0, target)
        mob:setLocalVar("DrawInWait", os.time() + 2)
    elseif target:getXPos() < 151.00 and os.time() > drawInWait then
        target:setPos(152.955, -15.000, 272.959)
        mob:messageBasic(232, 0, 0, target)
        mob:setLocalVar("DrawInWait", os.time() + 2)
    elseif target:getXPos() < 151.00 and target:getXPos() > 118.00 then
        target:setPos(152.955, -15.000, 272.959)
        mob:messageBasic(232, 0, 0, target)
        mob:setLocalVar("DrawInWait", os.time() + 2)
    end

    -- Increases Triple Attack Rate To 80% While Perfect Dodge (https://ffxiclopedia.fandom.com/wiki/Ethniu)
    if mob:hasStatusEffect(xi.effect.PERFECT_DODGE) == true then
        mob:setMod(xi.mod.TRIPLE_ATTACK, 80)
    else
        mob:setMod(xi.mod.TRIPLE_ATTACK, 10)
    end
    


    -- Magic Enmity Handling
    -- Mob Should Have Little To No Enmity Control (https://ffxiclopedia.fandom.com/wiki/Ethniu)
    mob:addListener("MAGIC_TAKE", "ETHNIU_MAGIC_TAKE", function(target, caster, spell)
        if
            spell:tookEffect() and
            (caster:isPC() or caster:isPet())
        then
            target:addEnmity(caster, 1000, 1000)
        end
    end)

    -- Enmity Handling
    -- Mob Should Have Little To No Enmity Control (https://ffxiclopedia.fandom.com/wiki/Ethniu)
    mob:addListener("TAKE_DAMAGE", "ETHNIU_TAKE_DAMAGE", function(mob, amount, attacker, attackType, damageType)
        if attackType == xi.attackType.PHYSICAL then
            mob:addEnmity(attacker, 1000, 1000)
        end
    end)

    mob:addListener("WEAPONSKILL_TAKE", "ETHNIU_WEAPONSKILL_TAKE", function(target, attacker, skillid, tp, action)
        target:addEnmity(attacker, 1000, 1000)
    end)
end

entity.onSpellPrecast = function(mob, spell)
    if spell:getID() == (208 or 186 or 157 or 359 or 366) then
        mob:setLocalVar("ELevelUp", 1)
    end
end

entity.onMobDisengage = function(mob)
    local levelupsum = mob:getLocalVar("TotalLevelUp")
    if mob:getHPP() < 100 or levelupsum > 0 then
        DespawnMob(17494093)
        mob:setLocalVar("TotalLevelUp", 0)
        mob:setLocalVar("EFightTimer", 0)
        mob:setLocalVar("MobPoof", 1)
    end
    mob:removeListener("ETHNIU_WEAPONSKILL_TAKE")
    mob:removeListener("ETHNIU_TAKE_DAMAGE")
    mob:removeListener("ETHNIU_MAGIC_TAKE")
end

entity.onMobDespawn = function(mob) 
    if mob:getLocalVar("MobPoof") == 1 then
        mob:showText(mob, zones[mob:getZoneID()].text.NM_DESPAWN)
        mob:setLocalVar("MobPoof", 0)
    end

    local respawn = 14400
    mob:setRespawnTime(respawn) -- 4 hours
    SetServerVariable("Ethniu_Respawn", (os.time() + respawn))
end

entity.onMobDeath = function(mob, player, isKiller)
    xi.hunts.checkHunt(mob, player, 497)
    player:setTitle(xi.title.ETHNIU_EXORCIST)
end

return entity