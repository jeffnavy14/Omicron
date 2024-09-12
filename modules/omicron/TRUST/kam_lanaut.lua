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
local m = Module:new("kamlanaut")

local trustToReplaceName = "rahal"

m:addOverride(string.format("xi.globals.spells.trust.%s.onSpellCast", trustToReplaceName), function(caster, target, spell)
   
    local trust = caster:spawnTrust(spell:getID())

    trust:setModelId(799)
    trust:renameEntity("Kam'lanaut")

	
	trust:addSimpleGambit(ai.t.TARGET, ai.c.NOT_STATUS, xi.effect.FLASH, ai.r.MA, ai.s.SPECIFIC, xi.magic.spell.FLASH)
	
      trust:addSimpleGambit(ai.t.TARGET, ai.c.CASTING_MA, 0, ai.r.JA, ai.s.SPECIFIC, xi.ja.RAMPART)
	trust:addSimpleGambit(ai.t.SELF, ai.c.NOT_STATUS, xi.effect.PALISADE, ai.r.JA, ai.s.SPECIFIC, xi.ja.PALISADE)
      trust:addSimpleGambit(ai.t.SELF, ai.c.NOT_STATUS, xi.effect.SENTINEL, ai.r.JA, ai.s.SPECIFIC, xi.ja.SENTINEL)

      trust:addSimpleGambit(ai.t.TARGET, ai.c.READYING_WS, 0, ai.r.JA, ai.s.SPECIFIC, xi.ja.SHIELD_BASH)
      trust:addSimpleGambit(ai.t.TARGET, ai.c.READYING_MS, 0, ai.r.JA, ai.s.SPECIFIC, xi.ja.SHIELD_BASH)
      trust:addSimpleGambit(ai.t.TARGET, ai.c.READYING_JA, 0, ai.r.JA, ai.s.SPECIFIC, xi.ja.SHIELD_BASH)
      trust:addSimpleGambit(ai.t.TARGET, ai.c.CASTING_MA, 0, ai.r.JA, ai.s.SPECIFIC, xi.ja.SHIELD_BASH)
	

	
	trust:setTrustTPSkillSettings(ai.tp.ASAP, ai.s.RANDOM)
	
	local power = trust:getMainLvl()
      trust:addMod(xi.mod.MATT, power)
      trust:addMod(xi.mod.MACC, power)
	trust:addMod(xi.mod.DEF, power*5)
	trust:addMod(xi.mod.MDEF, power*5)
	trust:addMod(xi.mod.ATT, power*8)
	trust:addMod(xi.mod.ACC, power*8)
	trust:addMod(xi.mod.DMG, -2500)
      trust:addMod(xi.mod.ALL_WSDMG_ALL_HITS, power)
      trust:addMod(xi.mod.WSACC, power*3)
	trust:addMod(xi.mod.SHIELDBLOCKRATE, power)
	trust:addMod(xi.mod.ABSORB_DMG_TO_MP, 10)
	trust:addMod(xi.mod.FASTCAST, power/2)
	trust:addMod(xi.mod.ENMITY, 2000)
      trust:addStatusEffect(xi.effect.ENLIGHT, 50, 3, 0)
end)

m:addOverride(string.format("xi.globals.spells.trust.%s.onMobSpawn", trustToReplaceName), function(mob)
    for _, member in ipairs(mob:getMaster():getParty()) do
        if member:isPC() then
            member:PrintToPlayer("This world is nothing but a grave and you are the maggots that squirm through the rotting corpse.", 4, "Kam'lanaut") -- 4: MESSAGE_PARTY
        end
    end
end)

m:addOverride(string.format("xi.globals.spells.trust.%s.onMobDespawn", trustToReplaceName), function(mob)
    local masterId = mob:getLocalVar("MASTER_ID")
    local master = GetPlayerByID(masterId)
    for _, member in ipairs(master:getParty()) do
        if member:isPC() then
            member:PrintToPlayer("*claps slowly* Quite an interesting show you put on.", 4, "Kam'lanaut") -- 4: MESSAGE_PARTY
        end
    end
end)

m:addOverride(string.format("xi.globals.spells.trust.%s.onMobDeath", trustToReplaceName), function(mob)
    local masterId = mob:getLocalVar("MASTER_ID")
    local master = GetPlayerByID(masterId)
    for _, member in ipairs(master:getParty()) do
        if member:isPC() then
            member:PrintToPlayer("Etch this moment, now, deep in your hearts and minds! For victory belongs to us, the children of Altana!", 4, "Kam'lanaut") -- 4: MESSAGE_PARTY
	  end
    end
end)

return m