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
    if GetServerVariable("[Domain]NM") == 0 then
    player:setPos(-0.927, -43.600, -234.829, 0, 289)
	end
end
