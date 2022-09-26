-----------------------------------
-- Area: Waughroon Shrine
--  Mob: Maat
-- Genkai 5 Fight
-----------------------------------
mixins = { require("scripts/mixins/families/maat") }
-----------------------------------
local entity = {}

entity.onMobSpawn = function(mob)
    mob:renameEntity("Master Maat")
		mob:addMod(xi.mod.ATT, 300)
		mob:addMod(xi.mod.ACC, 300)
		mob:addMod(xi.mod.DEF, 600)
		mob:addMod(xi.mod.EVA, 600)
		mob:addMod(xi.mod.MATT, 300)
		mob:addMod(xi.mod.MDEF, 200)
		mob:addMod(xi.mod.MEVA, 400)
		mob:addStatusEffect(xi.effect.REGEN, 30)
		mob:addStatusEffect(xi.effect.REGAIN, 30)
		mob:addStatusEffect(xi.effect.REFRESH, 30)
		mob:addMod(xi.mod.STR, 400)
		mob:addMod(xi.mod.DEX, 400)
		mob:addMod(xi.mod.AGI, 400)
		mob:addMod(xi.mod.VIT, 400)
		mob:addMod(xi.mod.INT, 100)
		mob:addMod(xi.mod.MND, 400)
		mob:addMod(xi.mod.CHR, 400)
		mob:addStatusEffect(xi.effect.ENFIRE, 25)
		mob:addMod(xi.mod.DOUBLE_ATTACK, 12)
		mob:addStatusEffect(xi.effect.SHOCK_SPIKES, 25)
		mob:addStatusEffect(xi.effect.FAST_CAST, 100)
end

entity.onMobDeath = function(mob, player, isKiller)
end

return entity
