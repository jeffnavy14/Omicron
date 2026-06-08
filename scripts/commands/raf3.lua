---------------------------------------------------------------------------------------------------
-- func: RAF3
-- desc: gives GM RAF3
---------------------------------------------------------------------------------------------------
local commandObj = {}

commandObj.cmdprops =
{
    permission = 1,
    parameters = 'i'
}


commandObj.onTrigger = function(player, target, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val)
    local itemId = 0
	local amount = 1

	-- if (target == nil or itemId == nil) then
        -- error(player, 'You must enter a valid player name.')
        -- return
    -- end

    -- local player = GetPlayerByName( target )
    -- if (player == nil) then
        -- player:printToPlayer( string.format( 'No target specified. Please target a player.' ) )
        -- return
    -- end

    -- Load needed text ids for target's current zone
    local ID = zones[player:getZoneID()]

    -- Attempt to give the target the items
    if (player:getFreeSlotsCount() < 5) then
        player:messageSpecial( ID.text.ITEM_CANNOT_BE_OBTAINED, itemId )
        player:printToPlayer( string.format( ' "%s" does not have enough free space for that set! Please clear 5 inventory slots and try again.', player ) )
    else
		if (player:getMainJob() == xi.job.WAR) then
			itemId = 23375 -- Pummeler's Mask +3
			player:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			player:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 23442 -- Pummeler's Lorica +3
			player:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			player:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 23509 -- Pummeler's Mufflers +3
			player:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			player:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 23576 -- Pummeler's Cuisses +3
			player:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			player:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 23643 -- Pummeler's Calligae +3
			player:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			player:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			player:printToPlayer( string.format( 'Gave "%s" the Pummelers +3 set.', player ) )
		elseif (player:getMainJob() == xi.job.MNK) then
			itemId = 23376 -- Anchorite's Crown +3
			player:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			player:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 23443 -- Anchorite's Cyclas +3
			player:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			player:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 23510 -- Anchorite's Gloves +3
			player:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			player:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 23577 -- Anchorite's Hose +3
			player:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			player:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 23644 -- Anchorite's Gaiters +3
			player:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			player:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			player:printToPlayer( string.format( 'Gave "%s" the Anchorite +3 set.', player ) )
		elseif (player:getMainJob() == xi.job.WHM) then
			itemId = 23377 -- Theophany Cap +3
			player:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			player:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 23444 -- Theophany Briault +3
			player:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			player:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 23511 -- Theophany Mitts +3
			player:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			player:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 23578 -- Theophany Pantaloons +3
			player:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			player:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 23645 -- Theophany Duckbills +3
			player:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			player:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			player:printToPlayer( string.format( 'Gave "%s" the Theophany +3 set.', player ) )
		elseif (player:getMainJob() == xi.job.BLM) then
			itemId = 23378 -- Spaekona's Petasos +3
			player:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			player:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 23445 -- Spaekona's Coat +3
			player:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			player:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 23512 -- Spaekona's Gloves +3
			player:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			player:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 23579 -- Spaekona's Tonban +3
			player:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			player:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 23646 -- Spaekona's Sabots +3
			player:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			player:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			player:printToPlayer( string.format( 'Gave "%s" the Spaekonas +3 set.', player ) )
		elseif (player:getMainJob() == xi.job.RDM) then
			itemId = 23402 -- Atrophy Chapeau +3
			player:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			player:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 23469 -- Atrophy Tabard +3
			player:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			player:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 23536 -- Atrophy Gloves +3
			player:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			player:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 23603 -- Atrophy Tights +3
			player:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			player:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 23670 -- Atrophy Boots +3
			player:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			player:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			player:printToPlayer( string.format( 'Gave "%s" the Atrophy +3 set.', player ) )
		elseif (player:getMainJob() == xi.job.THF) then
			itemId = 23380 -- Pillager's Bonnet +3
			player:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			player:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 23447 -- Pillager's Vest +3
			player:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			player:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 23514 -- Pillager's Armlets +3
			player:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			player:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 23581 -- Pillager's Culottes +3
			player:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			player:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 23648 -- Pillager's Poulaines +3
			player:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			player:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			player:printToPlayer( string.format( 'Gave "%s" the Pillagers +3 set.', player ) )
		elseif (player:getMainJob() == xi.job.PLD) then
			itemId = 23381 -- Reverence Coronet +3
			player:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			player:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 23448 -- Reverence Surcoat +3
			player:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			player:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 23515 -- Reverence Gauntlets +3
			player:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			player:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 23582 -- Reverence Breeches +3
			player:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			player:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 23649 -- Reverence Leggings +3
			player:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			player:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			player:printToPlayer( string.format( 'Gave "%s" the Reverence +3 set.', player ) )
		elseif (player:getMainJob() == xi.job.DRK) then
			itemId = 23382 -- Ignominy Burgeonet +3
			player:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			player:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 23449 -- Ignominy Cuirass +3
			player:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			player:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 23516 -- Ignominy Finger Gauntlets +3
			player:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			player:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 23583 -- Ignominy Flanchard +3
			player:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			player:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 23650 -- Ignominy Sollerets +3
			player:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			player:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			player:printToPlayer( string.format( 'Gave "%s" the Ignominy +3 set.', player ) )
		elseif (player:getMainJob() == xi.job.BST) then
			itemId = 23383 -- Totemic Helm +3
			player:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			player:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 23450 -- Totemic Jackcoat +3
			player:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			player:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 23517 -- Totemic Gloves +3
			player:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			player:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 23584 -- Totemic Trousers +3
			player:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			player:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 23651 -- Totemic Gaiters +3
			player:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			player:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			player:printToPlayer( string.format( 'Gave "%s" the Totemic +3 set.', player ) )
		elseif (player:getMainJob() == xi.job.BRD) then
			itemId = 23384 -- Brioso Roundlet +3
			player:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			player:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 23451 -- Brioso Justaucorps +3
			player:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			player:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 23518 -- Brioso Cuffs +3
			player:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			player:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 23585 -- Brioso Cannions +3
			player:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			player:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 23652 -- Brioso Slippers +3
			player:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			player:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			player:printToPlayer( string.format( 'Gave "%s" the Brioso +3 set.', player ) )
		elseif (player:getMainJob() == xi.job.RNG) then
			itemId = 23385 -- Orion Beret +3
			player:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			player:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 23452 -- Orion Jerkin +3
			player:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			player:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 23519 -- Orion Bracer +3
			player:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			player:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 23586 -- Orion Braccae +3
			player:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			player:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 23653 -- Orion Socks +3
			player:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			player:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			player:printToPlayer( string.format( 'Gave "%s" the Orion +3 set.', player ) )
		elseif (player:getMainJob() == xi.job.SAM) then
			itemId = 23386 -- Wakido Kabuto +3
			player:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			player:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 23453 -- Wakido Domaru +3
			player:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			player:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 23520 -- Wakido Kote +3
			player:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			player:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 23587 -- Wakido Haidate +3
			player:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			player:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 23654 -- Wakido Sune-Ate +3
			player:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			player:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			player:printToPlayer( string.format( 'Gave "%s" the Wakido +3 set.', player ) )
		elseif (player:getMainJob() == xi.job.NIN) then
			itemId = 23387 -- Hachiya Hatsuburi +3
			player:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			player:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 23454 -- Hachiya Chainmail +3
			player:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			player:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 23521 -- Hachiya Tekko +3
			player:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			player:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 23588 -- Hachiya Hakama +3
			player:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			player:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 23655 -- Hachiya Kyahan +3
			player:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			player:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			player:printToPlayer( string.format( 'Gave "%s" the Hachiya +3 set.', player ) )
		elseif (player:getMainJob() == xi.job.DRG) then
			itemId = 23388 -- Vishap Armet +3
			player:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			player:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 23455 -- Vishap Mail +3
			player:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			player:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 23522 -- Vishap Finger Gauntlets +3
			player:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			player:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 23589 -- Vishap Brais +3
			player:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			player:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 23656 -- Vishap Greaves +3
			player:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			player:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			player:printToPlayer( string.format( 'Gave "%s" the Vishap +3 set.', player ) )
		elseif (player:getMainJob() == xi.job.SMN) then
			itemId = 23389 -- Convoker's Horn +3
			player:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			player:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 23456 -- Convoker's Doublet +3
			player:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			player:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 23523 -- Convoker's Bracers +3
			player:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			player:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 23590 -- Convoker's Spats +3
			player:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			player:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 23657 -- Convoker's Pigaches +3
			player:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			player:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			player:printToPlayer( string.format( 'Gave "%s" the Convokers +3 set.', player ) )
		elseif (player:getMainJob() == xi.job.BLU) then
			itemId = 23390 -- Assimilator's Keffiyeh +3
			player:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			player:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 23457 -- Assimilator's Jubbah +3
			player:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			player:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 23524 -- Assimilator's Bazubands +3
			player:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			player:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 23591 -- Assimilator's Shalwar +3
			player:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			player:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 23658 -- Assimilator's Charuqs +3
			player:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			player:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			player:printToPlayer( string.format( 'Gave "%s" the Assimilators +3 set.', player ) )
		elseif (player:getMainJob() == xi.job.COR) then
			itemId = 23391 -- Laksamana's Tricorne +3
			player:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			player:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 23458 -- Laksamana's Frac +3
			player:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			player:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 23525 -- Laksamana's Gants +3
			player:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			player:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 23592 -- Laksamana's Trews +3
			player:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			player:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 23659 -- Laksamana's Bottes +3
			player:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			player:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			player:printToPlayer( string.format( 'Gave "%s" the Laksamanas +3 set.', player ) )
		elseif (player:getMainJob() == xi.job.PUP) then
			itemId = 23392 -- Foire Taj +3
			player:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			player:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 23459 -- Foire Tobe +3
			player:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			player:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 23526 -- Foire Dastanas +3
			player:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			player:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 23593 -- Foire Churidars +3
			player:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			player:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 23660 -- Foire Babouches +3
			player:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			player:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			player:printToPlayer( string.format( 'Gave "%s" the Foire +3 set.', player ) )
		elseif (player:getMainJob() == xi.job.DNC) then
			itemId = 23393 -- Maxixi Tiara +3
			player:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			player:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 23460 -- Maxixi Casaque +3
			player:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			player:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 23527 -- Maxixi Bangles +3
			player:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			player:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 23594 -- Maxixi Tights +3
			player:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			player:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 23661 -- Maxixi Toe Shoes +3
			player:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			player:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			player:printToPlayer( string.format( 'Gave "%s" the Maxixi +3 set.', player ) )
		elseif (player:getMainJob() == xi.job.SCH) then
			itemId = 23395 -- Academic's Mortarboard +3
			player:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			player:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 23462 -- Academic's Gown +3
			player:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			player:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 23529 -- Academic's Bracers +3
			player:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			player:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 23596 -- Academic's Pants +3
			player:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			player:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 23663 -- Academic's Loafers +3
			player:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			player:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			player:printToPlayer( string.format( 'Gave "%s" the Academics +3 set.', player ) )
		elseif (player:getMainJob() == xi.job.GEO) then
			itemId = 23396 -- Geomancy Galero +3
			player:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			player:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 23463 -- Geomancy Tunic +3
			player:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			player:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 23530 -- Geomancy Mitaines +3
			player:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			player:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 23597 -- Geomancy Pants +3
			player:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			player:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 23664 -- Geomancy Sandals +3
			player:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			player:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			player:printToPlayer( string.format( 'Gave "%s" the Geomancy +3 set.', player ) )
		elseif (player:getMainJob() == xi.job.RUN) then
			itemId = 23397 -- Runeist Bandeau +3
			player:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			player:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 23464 -- Runeist Coat +3
			player:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			player:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 23531 -- Runeist Mitons +3
			player:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			player:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 23598 -- Runeist Trousers +3
			player:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			player:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			itemId = 23665 -- Runeist Boots +3
			player:addItem( itemId, amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			player:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
			player:printToPlayer( string.format( 'Gave "%s" the Runeist +3 set.', player ) )
		end
	end
end

return commandObj