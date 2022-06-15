---------------------------------------------------------------------------------------------------
-- func: Regen
-- desc: Toggles Regen and Refresh on the player, granting them several special abilities.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 0,
    parameters = ""
}

function onTrigger(player)
    if (player:getCharVar("Regen") == 0) then
        -- Toggle Regen on..
        player:setCharVar("Regen", 1)
		
        -- Add bonus effects to the player..
		player:addStatusEffect(xi.effect.REGAIN, 5, 0, 14400)
		player:addStatusEffect(xi.effect.REGEN, 5, 0, 14400)
		player:addStatusEffect(xi.effect.REFRESH, 5, 0, 14400)
		player:addStatusEffect(xi.effect.HASTE, 20, 0, 14400)
		player:addStatusEffect(xi.effect.DEDICATION, 250, 0, 14400, 0, 30000)
		player:setMod(915, 1000)

		-- Add bonus mods..
        player:addMod(xi.mod.RACC, 100)
        player:addMod(xi.mod.RATT, 100)
        player:addMod(xi.mod.ACC, 100)
        player:addMod(xi.mod.ATT, 100)
        player:addMod(xi.mod.MATT, 100)
        player:addMod(xi.mod.MACC, 100)
        player:addMod(xi.mod.RDEF, 100)
        player:addMod(xi.mod.DEF, 100)
        player:addMod(xi.mod.MDEF, 100)
		
	else
        -- Toggle Regen off..
        player:setCharVar("Regen", 0)

        -- Remove bonus effects..
        player:delStatusEffect(xi.effect.REGAIN)
        player:delStatusEffect(xi.effect.REFRESH)
        player:delStatusEffect(xi.effect.REGEN)
		player:delStatusEffect(xi.effect.HASTE)
		player:delStatusEffect(xi.effect.DEDICATION)
		
		-- Remove bonus mods..
        player:delMod(xi.mod.RACC, 100)
        player:delMod(xi.mod.RATT, 100)
        player:delMod(xi.mod.ACC, 100)
        player:delMod(xi.mod.ATT, 100)
        player:delMod(xi.mod.MATT, 100)
        player:delMod(xi.mod.MACC, 100)
        player:delMod(xi.mod.RDEF, 100)
        player:delMod(xi.mod.DEF, 100)
        player:delMod(xi.mod.MDEF, 100)


    end
end
