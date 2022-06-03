-----------------------------------
require("modules/module_utils")
require("scripts/globals/trust")
-----------------------------------
local m = Module:new("rimuru")

local trustToReplaceName = "aatt"

m:addOverride(string.format("xi.globals.spells.trust.%s.onSpellCast", trustToReplaceName), function(caster, target, spell)
   
    -----------------------------------
    -- NOTE: This is the logic from xi.trust.spawn()
    -----------------------------------
    local trust = caster:spawnTrust(spell:getID())

    trust:setModelId(2431) -- Trust: Rimuru
    trust:renameEntity("Rimuru")

    local boostAmount = math.ceil((30 / 99) * caster:getMainLvl())
    trust:addSimpleGambit(ai.t.TARGET, ai.c.READYING_WS, 0, ai.r.MA, ai.s.SPECIFIC, xi.magic.spell.STUN)
    trust:addSimpleGambit(ai.t.TARGET, ai.c.READYING_MS, 0, ai.r.MA, ai.s.SPECIFIC, xi.magic.spell.STUN)
    trust:addSimpleGambit(ai.t.TARGET, ai.c.READYING_JA, 0, ai.r.MA, ai.s.SPECIFIC, xi.magic.spell.STUN)
    trust:addSimpleGambit(ai.t.TARGET, ai.c.CASTING_MA, 0, ai.r.MA, ai.s.SPECIFIC, xi.magic.spell.STUN)
    trust:addSimpleGambit(ai.t.SELF, ai.c.ALWAYS, 0, ai.r.JA, ai.s.SPECIFIC, xi.ja.LAST_RESORT)
    trust:addSimpleGambit(ai.t.TARGET, ai.c.MB_AVAILABLE, 0, ai.r.MA, ai.s.MB_ELEMENT, xi.magic.spell.BLIZZAJA)
    trust:addSimpleGambit(ai.t.TARGET, ai.c.MB_AVAILABLE, 0, ai.r.MA, ai.s.MB_ELEMENT, xi.magic.spell.THUNDAJA)
    trust:addSimpleGambit(ai.t.SELF, ai.c.HPP_LT, 10, ai.r.JA, ai.s.SPECIFIC, xi.ja.BLOOD_WEAPON)

    trust:setTrustTPSkillSettings(ai.tp.ASAP, ai.s.HIGHEST)


	local power = trust:getMainLvl()
      trust:addMod(xi.mod.MATT, power*30)
      trust:addMod(xi.mod.MACC, 1000)
	trust:addMod(xi.mod.MDEF, power*100)
	trust:addMod(xi.mod.DOUBLE_ATTACK, 75)
	trust:addMod(xi.mod.REFRESH, 50)
      trust:addMod(xi.mod.REGAIN, 100)
	trust:addMod(xi.mod.DEF, power*70)
	trust:addMod(xi.mod.ACC, power*255)
	trust:addMod(xi.mod.ATT, power*255)
      trust:addMod(xi.mod.HASTE_MAGIC, power*2)


 trust:setLocalVar("MASTER_ID", trust:getMaster():getID())
end)

m:addOverride(string.format("xi.globals.spells.trust.%s.onMobSpawn", trustToReplaceName), function(mob)
    for _, member in ipairs(mob:getMaster():getParty()) do
        if member:isPC() then
            member:PrintToPlayer("Warui suraimu janai yo 悪いスライムじゃないよ", 4, "Rimuru") -- 4: MESSAGE_PARTY
        end
    end
end)

m:addOverride(string.format("xi.globals.spells.trust.%s.onMobDespawn", trustToReplaceName), function(mob)
    local masterId = mob:getLocalVar("MASTER_ID")
    local master = GetPlayerByID(masterId)
    for _, member in ipairs(master:getParty()) do
        if member:isPC() then
            member:PrintToPlayer("As you have just learned, I am strong!", 4, "Rimuru") -- 4: MESSAGE_PARTY
        end
    end
end)

m:addOverride(string.format("xi.globals.spells.trust.%s.onMobDeath", trustToReplaceName), function(mob)
    local masterId = mob:getLocalVar("MASTER_ID")
    local master = GetPlayerByID(masterId)
    for _, member in ipairs(master:getParty()) do
        if member:isPC() then
            member:PrintToPlayer("As you have just learned, I am strong!", 4, "Rimuru") -- 4: MESSAGE_PARTY
	  end
    end
end)

return m