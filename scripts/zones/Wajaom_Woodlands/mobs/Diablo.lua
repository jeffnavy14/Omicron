-----------------------------------
-- Area: Wajaom Woodlands
--  Mob: Diablo
-----------------------------------
local entity = {}

entity.onMobSpawn = function(mob)
    mob:renameEntity("Diablo")

end


entity.onMobFight = function(mob)
	SetServerVariable("Diablo", math.random(1,300))
	mob:setMobMod(xi.mobMod.ADD_EFFECT, 1)


	if
		GetServerVariable("Diablo") >= 1
	and
		GetServerVariable("Diablo") < 14 
	then
entity.onAdditionalEffect = function(mob, target, damage)
    return xi.mob.onAddEffect(mob, target, damage, xi.mob.ae.ENBLIZZARD, {chance = 100, power = math.random(50, 150)})
end
end

	if
		GetServerVariable("Diablo") >= 14
	and
		GetServerVariable("Diablo") < 27
	then
entity.onAdditionalEffect = function(mob, target, damage)
    return xi.mob.onAddEffect(mob, target, damage, xi.mob.ae.PARALYZE, {chance = 100, duration = math.random(10, 60)})
end
end
	if
		GetServerVariable("Diablo") >= 27
	and
		GetServerVariable("Diablo") < 39
	then
entity.onAdditionalEffect = function(mob, target, damage)
    return xi.mob.onAddEffect(mob, target, damage, xi.mob.ae.ENAERO, {chance = 100, power = math.random(50, 150)})
end
end
	if
		GetServerVariable("Diablo") >= 39
	and
		GetServerVariable("Diablo") < 52
	then
entity.onAdditionalEffect = function(mob, target, damage)
    return xi.mob.onAddEffect(mob, target, damage, xi.mob.ae.EVA_DOWN, {chance = 100, power = math.random(50,150), duration = math.random(10, 60)})
end
end
	if
		GetServerVariable("Diablo") >= 52
	and
		GetServerVariable("Diablo") < 65
	then
entity.onAdditionalEffect = function(mob, target, damage)
    return xi.mob.onAddEffect(mob, target, damage, xi.mob.ae.STUN, {chance = 100, duration = math.random(2, 6)})
end
end
	if
		GetServerVariable("Diablo") >= 65
	and
		GetServerVariable("Diablo") < 78
	then
entity.onAdditionalEffect = function(mob, target, damage)
    return xi.mob.onAddEffect(mob, target, damage, xi.mob.ae.HP_DRAIN, {chance = 100, power = math.random(50, 150)})
end
end
	if
		GetServerVariable("Diablo") >= 78
	and
		GetServerVariable("Diablo") < 91
	then
entity.onAdditionalEffect = function(mob, target, damage)
    return xi.mob.onAddEffect(mob, target, damage, xi.mob.ae.PLAGUE, {chance = 100})
end
end
	if
		GetServerVariable("Diablo") >= 91
	and
		GetServerVariable("Diablo") < 104
	then
entity.onAdditionalEffect = function(mob, target, damage)
    return xi.mob.onAddEffect(mob, target, damage, xi.mob.ae.ENWATER, {chance = 100, power = math.random(50, 150)})
end
end
	if
		GetServerVariable("Diablo") >= 104
	and
		GetServerVariable("Diablo") < 117
	then
entity.onAdditionalEffect = function(mob, target, damage)
    return xi.mob.onAddEffect(mob, target, damage, xi.mob.ae.ENLIGHT, {chance = 100, power = math.random(50, 150)})
end
end
	if
		GetServerVariable("Diablo") >= 117
	and
		GetServerVariable("Diablo") < 130
	then
entity.onAdditionalEffect = function(mob, target, damage)
    return xi.mob.onAddEffect(mob, target, damage, xi.mob.ae.POISON, {chance = 100, power = math.random (1,50), duration = math.random(5,30)})
end
end
	if
		GetServerVariable("Diablo") >= 130
	and
		GetServerVariable("Diablo") < 143
	then
entity.onAdditionalEffect = function(mob, target, damage)
    return xi.mob.onAddEffect(mob, target, damage, xi.mob.ae.SILENCE, {chance = 100, duration = math.random(5, 45)})
end
end
	if
		GetServerVariable("Diablo") >= 143
	and
		GetServerVariable("Diablo") < 156
	then
entity.onAdditionalEffect = function(mob, target, damage)
    return xi.mob.onAddEffect(mob, target, damage, xi.mob.ae.PARALYZE, {chance = 100, power = math.random(1,5), duration = math.random(5, 45)})
end
end
	if
		GetServerVariable("Diablo") >= 156
	and
		GetServerVariable("Diablo") < 169
	then
entity.onAdditionalEffect = function(mob, target, damage)
    return xi.mob.onAddEffect(mob, target, damage, xi.mob.ae.BLIND, {chance = 100, power = math.random(1,5), duration = math.random(5, 45)})
end
end
	if
		GetServerVariable("Diablo") >= 169
	and
		GetServerVariable("Diablo") < 182
	then
entity.onAdditionalEffect = function(mob, target, damage)
    return xi.mob.onAddEffect(mob, target, damage, xi.mob.ae.PETRIFY, {chance = 100, duration = math.random(5, 45)})
end
end
	if
		GetServerVariable("Diablo") >= 182
	and
		GetServerVariable("Diablo") < 195
	then
entity.onAdditionalEffect = function(mob, target, damage)
    return xi.mob.onAddEffect(mob, target, damage, xi.mob.ae.TERROR, {duration = math.random(5, 30)})
end
end
	if
		GetServerVariable("Diablo") >= 195
	and
		GetServerVariable("Diablo") < 208
	then
entity.onAdditionalEffect = function(mob, target, damage)
    return xi.mob.onAddEffect(mob, target, damage, xi.mob.ae.ENDARK, {chance = 100, power = math.random(50, 150)})
end
end
	if
		GetServerVariable("Diablo") >= 208
	and
		GetServerVariable("Diablo") < 221
	then
entity.onAdditionalEffect = function(mob, target, damage)
    return xi.mob.onAddEffect(mob, target, damage, xi.mob.ae.ENFIRE, {chance = 100, power = math.random(50, 150)})
end
end
	if
		GetServerVariable("Diablo") >= 221
	and
		GetServerVariable("Diablo") < 234
	then
entity.onAdditionalEffect = function(mob, target, damage)
    return xi.mob.onAddEffect(mob, target, damage, xi.mob.ae.ENTHUNDER, {chance = 100, power = math.random(50, 150)})
end
end
	if
		GetServerVariable("Diablo") >= 234
	and
		GetServerVariable("Diablo") < 247
	then
entity.onAdditionalEffect = function(mob, target, damage)
    return xi.mob.onAddEffect(mob, target, damage, xi.mob.ae.CURSE, {chance = 100})
end
end
	if
		GetServerVariable("Diablo") >= 247
	and
		GetServerVariable("Diablo") < 260
	then
entity.onAdditionalEffect = function(mob, target, damage)
    return xi.mob.onAddEffect(mob, target, damage, xi.mob.ae.TP_DRAIN, {chance = 100, power = math.random(50, 150)})
end
end
	if
		GetServerVariable("Diablo") >= 260
	and
		GetServerVariable("Diablo") < 273
	then
entity.onAdditionalEffect = function(mob, target, damage)
    return xi.mob.onAddEffect(mob, target, damage, xi.mob.ae.MP_DRAIN, {chance = 100, power = math.random(50, 150)})
end
end
	if
		GetServerVariable("Diablo") >= 273
	and
		GetServerVariable("Diablo") < 286
	then
entity.onAdditionalEffect = function(mob, target, damage)
    return xi.mob.onAddEffect(mob, target, damage, xi.mob.ae.SLOW, {chance = 100, duration = math.random(5, 45)})
end
end

	if
		GetServerVariable("Diablo") >= 286
	and
		GetServerVariable("Diablo") < 299
	then
entity.onAdditionalEffect = function(mob, target, damage)
    return xi.mob.onAddEffect(mob, target, damage, xi.mob.ae.ENSTONE, {chance = 100, power = math.random(50, 150)})
end
end

	if
		GetServerVariable("Diablo") == 300
	then
entity.onAdditionalEffect = function(mob, target, damage)
    return xi.mob.onAddEffect(mob, target, damage, xi.mob.ae.DEATH)
end
end


entity.onMobDeath = function(mob)
	SetServerVariable("Diablo", 0)
 		SetServerVariable("Summoned", 0)


	end
end


return entity