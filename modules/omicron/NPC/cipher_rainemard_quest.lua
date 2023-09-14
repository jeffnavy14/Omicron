-----------------------------------
-- Cipher: Rainemard Quest
-- Area: Ru'Lude Gardens
--  NPC: Jamal
-- !pos 3.779 2.000 140.932 243
-----------------------------------
require('scripts/globals/npc_util')
-----------------------------------
local rainemard = Module:new("cipher_rainemard_quest")

rainemard:addOverride("xi.zones.RuLude_Gardens.npcs.Jamal.onTrigger", function(player, npc)
super(zone)
    local StartingTrusts = player:hasSpell(896) and player:hasSpell(897) and player:hasSpell(898) and player:hasSpell(899) and
        player:hasSpell(900) and player:hasSpell(901) and player:hasSpell(902) and player:hasSpell(903) and
        player:hasSpell(904) and player:hasSpell(905) and player:hasSpell(917)

    if StartingTrusts then
	    npcUtil.giveKeyItem(player, xi.keyItem.BUNDLE_OF_HALF_INSCRIBED_SCROLLS)
        player:PrintToPlayer("Impressive, adventurer. I never doubted you for a moment. Here, take this as a token of recognition for your effects.", 0, npc:getPacketName())
    --else
    --    player:PrintToPlayer("Hey, you... Looking for some exotic Trust Magic?", 0, npc:getPacketName())
	
    --    player:timer(2000, function(playerArg)	
    --    player:PrintToPlayer("Collect red, blue and yellow institute cards, and I'll reward you with something special.", 0, npc:getPacketName())	
    --    end)
    --    return
	end	
end)

return rainemard