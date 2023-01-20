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
		player:addStatusEffect(xi.effect.REGEN, 2, 0, 14400)
		player:addStatusEffect(xi.effect.REFRESH, 2, 0, 14400)
		player:addStatusEffect(xi.effect.HASTE, 10, 0, 14400)

		-- Add bonus mods..
        player:addMod(xi.mod.RACC, 20)
        player:addMod(xi.mod.RATT, 20)
        player:addMod(xi.mod.ACC, 20)
        player:addMod(xi.mod.ATT, 20)
        player:addMod(xi.mod.MATT, 20)
        player:addMod(xi.mod.MACC, 20)
        player:addMod(xi.mod.RDEF, 20)
        player:addMod(xi.mod.DEF, 20)
        player:addMod(xi.mod.MDEF, 20)
		
	else
        -- Toggle Regen off..
        player:setCharVar("Regen", 0)

        -- Remove bonus effects..
        player:delStatusEffect(xi.effect.REFRESH)
        player:delStatusEffect(xi.effect.REGEN)
		player:delStatusEffect(xi.effect.HASTE)
		
		-- Remove bonus mods..
        player:delMod(xi.mod.RACC, 20)
        player:delMod(xi.mod.RATT, 20)
        player:delMod(xi.mod.ACC, 20)
        player:delMod(xi.mod.ATT, 20)
        player:delMod(xi.mod.MATT, 20)
        player:delMod(xi.mod.MACC, 20)
        player:delMod(xi.mod.RDEF, 20)
        player:delMod(xi.mod.DEF, 20)
        player:delMod(xi.mod.MDEF, 20)


    end
end
