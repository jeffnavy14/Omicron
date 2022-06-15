-----------------------------------
require("modules/module_utils")
require("scripts/globals/gambits")
require("scripts/globals/magic")
require("scripts/globals/status")
require("scripts/globals/trust")
require("scripts/globals/utils")
require("scripts/globals/weaponskillids")
require("scripts/globals/zone")
-----------------------------------
local m = Module:new("forkicks")

local trustToReplaceName = "curilla"

m:addOverride(string.format("xi.globals.spells.trust.%s.onSpellCast", trustToReplaceName), function(caster, target, spell)
   
    local trust = caster:spawnTrust(spell:getID())

    trust:setModelId(790)
    trust:renameEntity("Demetrie")


    trust:SetMobSkillAttack(361)

    trust:setTrustTPSkillSettings(ai.tp.CLOSER, ai.s.RANDOM)


	local power = trust:getMainLvl()
      trust:addMod(xi.mod.MATT, power*25)
      trust:addMod(xi.mod.MACC, 1000)
	trust:addMod(xi.mod.MDEF, power*25)
	trust:addMod(xi.mod.DEF, power*25)
      trust:addMod(xi.mod.ALL_WSDMG_ALL_HITS, power*2)
	trust:addMod(xi.mod.REFRESH, 3000)
      trust:addStatusEffect(xi.effect.CHAINSPELL)

end)


return m