---------------------------------------------------------------------------------------------------
-- func: flip
-- desc: Temporarily flips the user's main job and subjob to allow equipping items usable only by subjob.
---------------------------------------------------------------------------------------------------

require("scripts/globals/status");

cmdprops =
{
    permission = 0,
    parameters = ""
};

function error(player, msg)
    player:PrintToPlayer(msg);
    player:PrintToPlayer("!flip");
end;

function onTrigger(player)

	if player:isCustomizationEnabled(1) == false then
		player:PrintToPlayer("Job flip is not enabled on this server.")
		return
	end
	
    ret = player:flip(1);
	
	if (ret == 0) then
		error(player, "... an error occurred.");
	end
end
