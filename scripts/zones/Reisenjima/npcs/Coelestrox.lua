-----------------------------------
-- Area: Reisenjima (291)
-- NPC: Coelestrox
-- Notes: Offers to upgrade Reforged Artifiact Armor +1 into +2, RAF +2 into +3
-----------------------------------
local ID = zones[xi.zone.REISENJIMA]
-----------------------------------
---@type TNpcEntity
local entity = {}

local upgradeInfo =
{
[  1] = { trade = {27684, {9281, 4},9253,8983}, reward = 23040}, -- Pummelers_Mask_+2
[  2] = { trade = {27828, {9281, 5},9253,8986}, reward = 23107}, -- Pummelers_Lorica_+2
[  3] = { trade = {27964, {9281, 3},9253,8979}, reward = 23174}, -- Pummelers_Mufflers_+2
[  4] = { trade = {28111, {9281, 4},9253,8988}, reward = 23241}, -- Pummelers_Cuisses_+2
[  5] = { trade = {28244, {9281, 3},9253,8981}, reward = 23308}, -- Pummelers_Calligae_+2
[  6] = { trade = {27685, {9282, 4},9245,8983}, reward = 23041}, -- Anchorites_Crown_+2
[  7] = { trade = {27829, {9282, 5},9245,8986}, reward = 23108}, -- Anchorites_Cyclas_+2
[  8] = { trade = {27965, {9282, 3},9245,8979}, reward = 23175}, -- Anchorites_Gloves_+2
[  9] = { trade = {28112, {9282, 4},9245,8988}, reward = 23242}, -- Anchorites_Hose_+2
[ 10] = { trade = {28245, {9282, 3},9245,8981}, reward = 23309}, -- Anchorites_Gaiters_+2
[ 11] = { trade = {27686, {9283, 4},9251,8983}, reward = 23042}, -- Theophany_Cap_+2
[ 12] = { trade = {27830, {9283, 5},9251,8986}, reward = 23109}, -- theophany_briault_+2
[ 13] = { trade = {27966, {9283, 3},9251,8979}, reward = 23176}, -- Theophany_Mitts_+2
[ 14] = { trade = {28113, {9283, 4},9251,8988}, reward = 23243}, -- Theophany_Pantaloons_+2
[ 15] = { trade = {28246, {9283, 3},9251,8981}, reward = 23310}, -- Theophany_Duckbills_+2
[ 16] = { trade = {27687, {9284, 4},9257,8983}, reward = 23043}, -- Spaekonas_Petasos_+2
[ 17] = { trade = {27831, {9284, 5},9257,8986}, reward = 23110}, -- Spaekonas_Coat_+2
[ 18] = { trade = {27967, {9284, 3},9257,8979}, reward = 23177}, -- Spaekonas_Gloves_+2
[ 19] = { trade = {28114, {9284, 4},9257,8988}, reward = 23244}, -- Spaekonas_Tonban_+2
[ 20] = { trade = {28247, {9284, 3},9257,8981}, reward = 23311}, -- Spaekonas_Sabots_+2
[ 21] = { trade = {27688, {9285, 4},9255,8983}, reward = 23044}, -- Atrophy_Chapeau_+2
[ 22] = { trade = {27832, {9285, 5},9255,8986}, reward = 23111}, -- Atrophy_Tabard_+2
[ 23] = { trade = {27968, {9285, 3},9255,8979}, reward = 23178}, -- Atrophy_Gloves_+2
[ 24] = { trade = {28115, {9285, 4},9255,8988}, reward = 23245}, -- Atrophy_Tights_+2
[ 25] = { trade = {28248, {9285, 3},9255,8981}, reward = 23312}, -- Atrophy_Boots_+2
[ 26] = { trade = {27689, {9286, 4},9245,8983}, reward = 23045}, -- Pillagers_Bonnet_+2
[ 27] = { trade = {27833, {9286, 5},9245,8986}, reward = 23112}, -- Pillagers_Vest_+2
[ 28] = { trade = {27969, {9286, 3},9245,8979}, reward = 23179}, -- Pillagers_Armlets_+2
[ 29] = { trade = {28116, {9286, 4},9245,8988}, reward = 23246}, -- Pillagers_Culottes_+2
[ 30] = { trade = {28249, {9286, 3},9245,8981}, reward = 23313}, -- Pillagers_Poulaines_+2
[ 31] = { trade = {27690, {9287, 4},9249,8983}, reward = 23046}, -- Reverence_Coronet_+2
[ 32] = { trade = {27834, {9287, 5},9249,8986}, reward = 23113}, -- Reverence_Surcoat_+2
[ 33] = { trade = {27970, {9287, 3},9249,8979}, reward = 23180}, -- Reverence_Gauntlets_+2
[ 34] = { trade = {28117, {9287, 4},9249,8988}, reward = 23247}, -- Reverence_Breeches_+2
[ 35] = { trade = {28250, {9287, 3},9249,8981}, reward = 23314}, -- Reverence_Leggings_+2
[ 36] = { trade = {27691, {9288, 4},9247,8983}, reward = 23047}, -- Ignominy_Burgeonet_+2
[ 37] = { trade = {27835, {9288, 5},9247,8986}, reward = 23114}, -- Ignominy_Cuirass_+2
[ 38] = { trade = {27971, {9288, 3},9247,8979}, reward = 23181}, -- Ignominy_Gauntlets_+2
[ 39] = { trade = {28118, {9288, 4},9247,8988}, reward = 23248}, -- Ignominy_Flanchard_+2
[ 40] = { trade = {28251, {9288, 3},9247,8981}, reward = 23315}, -- Ignominy_Sollerets_+2
[ 41] = { trade = {27692, {9289, 4},9253,8983}, reward = 23048}, -- Totemic_Helm_+2
[ 42] = { trade = {27836, {9289, 5},9253,8986}, reward = 23115}, -- Totemic_Jackcoat_+2
[ 43] = { trade = {27972, {9289, 3},9253,8979}, reward = 23182}, -- Totemic_Gloves_+2
[ 44] = { trade = {28119, {9289, 4},9253,8988}, reward = 23249}, -- Totemic_Trousers_+2
[ 45] = { trade = {28252, {9289, 3},9253,8981}, reward = 23316}, -- Totemic_Gaiters_+2
[ 46] = { trade = {27693, {9290, 4},9251,8983}, reward = 23049}, -- Brioso_Roundlet_+2
[ 47] = { trade = {27837, {9290, 5},9251,8986}, reward = 23116}, -- Brioso_Justaucorps_+2
[ 48] = { trade = {27973, {9290, 3},9251,8979}, reward = 23183}, -- Brioso_Cuffs_+2
[ 49] = { trade = {28120, {9290, 4},9251,8988}, reward = 23250}, -- Brioso_Cannions_+2
[ 50] = { trade = {28253, {9290, 3},9251,8981}, reward = 23317}, -- Brioso_Slippers_+2
[ 51] = { trade = {27694, {9291, 4},9253,8983}, reward = 23050}, -- Orion_Beret_+2
[ 52] = { trade = {27838, {9291, 5},9253,8986}, reward = 23117}, -- Orion_Jerkin_+2
[ 53] = { trade = {27974, {9291, 3},9253,8979}, reward = 23184}, -- Orion_Bracers_+2
[ 54] = { trade = {28121, {9291, 4},9253,8988}, reward = 23251}, -- Orion_Braccae_+2
[ 55] = { trade = {28254, {9291, 3},9253,8981}, reward = 23318}, -- Orion_Socks_+2
[ 56] = { trade = {27695, {9292, 4},9247,8983}, reward = 23051}, -- Wakido_Kabuto_+2
[ 57] = { trade = {27839, {9292, 5},9247,8986}, reward = 23118}, -- Wakido_Domaru_+2
[ 58] = { trade = {27975, {9292, 3},9247,8979}, reward = 23185}, -- Wakido_Kote_+2
[ 59] = { trade = {28122, {9292, 4},9247,8988}, reward = 23252}, -- Wakido_Haidate_+2
[ 60] = { trade = {28255, {9292, 3},9247,8981}, reward = 23319}, -- Wakido_Sune-Ate_+2
[ 61] = { trade = {27696, {9293, 4},9247,8983}, reward = 23052}, -- Hachiya_Hatsuburi_+2
[ 62] = { trade = {27840, {9293, 5},9247,8986}, reward = 23119}, -- Hachiya_Chainmail_+2
[ 63] = { trade = {27976, {9293, 3},9247,8979}, reward = 23186}, -- Hachiya_Tekko_+2
[ 64] = { trade = {28123, {9293, 4},9247,8988}, reward = 23253}, -- Hachiya_Hakama_+2
[ 65] = { trade = {28256, {9293, 3},9247,8981}, reward = 23320}, -- Hachiya_Kyahan_+2
[ 66] = { trade = {27697, {9294, 4},9249,8983}, reward = 23053}, -- Vishap_Armet_+2
[ 67] = { trade = {27841, {9294, 5},9249,8986}, reward = 23120}, -- Vishap_Mail_+2
[ 68] = { trade = {27977, {9294, 3},9249,8979}, reward = 23187}, -- Vishap_Finger_Gauntlets_+2
[ 69] = { trade = {28124, {9294, 4},9249,8988}, reward = 23254}, -- Vishap_Brais_+2
[ 70] = { trade = {28257, {9294, 3},9249,8981}, reward = 23321}, -- Vishap_Greaves_+2
[ 71] = { trade = {27698, {9295, 4},9255,8983}, reward = 23054}, -- Convokers_Horn_+2
[ 72] = { trade = {27842, {9295, 5},9255,8986}, reward = 23121}, -- Convokers_Doublet_+2
[ 73] = { trade = {27978, {9295, 3},9255,8979}, reward = 23188}, -- Convokers_Bracers_+2
[ 74] = { trade = {28125, {9295, 4},9255,8988}, reward = 23255}, -- Convokers_Spats_+2
[ 75] = { trade = {28258, {9295, 3},9255,8981}, reward = 23322}, -- Convokers_Pigaches_+2
[ 76] = { trade = {27699, {9296, 4},9251,8983}, reward = 23055}, -- Assimilators_Keffiyeh_+2
[ 77] = { trade = {27843, {9296, 5},9251,8986}, reward = 23122}, -- Assimilators_Jubbah_+2
[ 78] = { trade = {27979, {9296, 3},9251,8979}, reward = 23189}, -- Assimilators_Bazubands_+2
[ 79] = { trade = {28126, {9296, 4},9251,8988}, reward = 23256}, -- Assimilators_Shalwar_+2
[ 80] = { trade = {28259, {9296, 3},9251,8981}, reward = 23323}, -- Assimilators_Charuqs_+2
[ 81] = { trade = {27700, {9297, 4},9257,8983}, reward = 23056}, -- Laksamanas_Tricorne_+2
[ 82] = { trade = {27844, {9297, 5},9257,8986}, reward = 23123}, -- Laksamanas_Frac_+2
[ 83] = { trade = {27980, {9297, 3},9257,8979}, reward = 23190}, -- laskamanas_gants_+2
[ 84] = { trade = {28127, {9297, 4},9257,8988}, reward = 23257}, -- Laksamanas_Trews_+2
[ 85] = { trade = {28260, {9297, 3},9257,8981}, reward = 23324}, -- Laksamanas_Bottes_+2
[ 86] = { trade = {27701, {9298, 4},9257,8983}, reward = 23057}, -- Foire_Taj_+2
[ 87] = { trade = {27845, {9298, 5},9257,8986}, reward = 23124}, -- Foire_Tobe_+2
[ 88] = { trade = {27981, {9298, 3},9257,8979}, reward = 23191}, -- Foire_Dastanas_+2
[ 89] = { trade = {28128, {9298, 4},9257,8988}, reward = 23258}, -- Foire_Churidars_+2
[ 90] = { trade = {28261, {9298, 3},9257,8981}, reward = 23325}, -- Foire_Babouches_+2
[ 91] = { trade = {27704, {9300, 4},9255,8983}, reward = 23060}, -- Academics_Mortarboard_+2
[ 92] = { trade = {27848, {9300, 5},9255,8986}, reward = 23127}, -- Academics_Gown_+2
[ 93] = { trade = {27984, {9300, 3},9255,8979}, reward = 23194}, -- Academics_Bracers_+2
[ 94] = { trade = {28131, {9300, 4},9255,8988}, reward = 23261}, -- Academics_Pants_+2
[ 95] = { trade = {28264, {9300, 3},9255,8981}, reward = 23328}, -- Academics_Loafers_+2
[ 96] = { trade = {27705, {9301, 4},9251,8983}, reward = 23061}, -- Geomancy_Galero_+2
[ 97] = { trade = {27849, {9301, 5},9251,8986}, reward = 23128}, -- Geomancy_Tunic_+2
[ 98] = { trade = {27985, {9301, 3},9251,8979}, reward = 23195}, -- Geomancy_Mitaines_+2
[ 99] = { trade = {28132, {9301, 4},9251,8988}, reward = 23262}, -- Geomancy_Pants_+2
[100] = { trade = {28265, {9301, 3},9251,8981}, reward = 23329}, -- Geomancy_Sandals_+2
[101] = { trade = {27706, {9302, 4},9247,8983}, reward = 23062}, -- Runeist_Bandeau_+2
[102] = { trade = {27850, {9302, 5},9247,8986}, reward = 23129}, -- Runeist_Coat_+2
[103] = { trade = {27986, {9302, 3},9247,8979}, reward = 23196}, -- Runeist_Mitons_+2
[104] = { trade = {28133, {9302, 4},9247,8988}, reward = 23263}, -- Runeist_Trousers_+2
[105] = { trade = {28266, {9302, 3},9247,8981}, reward = 23330}, -- Runeist_Bottes_+2
[106] = { trade = {27702, {9299, 4},9245,8983}, reward = 23058}, -- maxixi_tiara_+2
[107] = { trade = {27846, {9299, 5},9245,8986}, reward = 23125}, -- maxixi_casaque_+2
[108] = { trade = {27982, {9299, 3},9245,8979}, reward = 23192}, -- maxixi_bangles_+2
[109] = { trade = {28129, {9299, 4},9245,8988}, reward = 23259}, -- maxixi_tights_+2
[110] = { trade = {28262, {9299, 3},9245,8981}, reward = 23326}, -- maxixi_toe_shoes_+2
[111] = { trade = {27703, {9299, 4},9245,8983}, reward = 23059}, -- maxixi_tiara_+2
[112] = { trade = {27847, {9299, 5},9245,8986}, reward = 23126}, -- maxixi_casaque_+2
[113] = { trade = {27983, {9299, 3},9245,8979}, reward = 23193}, -- maxixi_bangles_+2
[114] = { trade = {28130, {9299, 4},9245,8988}, reward = 23260}, -- maxixi_tights_+2
[115] = { trade = {28263, {9299, 3},9245,8981}, reward = 23327}, -- maxixi_toe_shoes_+2
}


local handleMainEvent = function(player, option)
            if option == 2 then
                local afReforgedUpgrade = player:getCharVar('afReforged2Upgrade')
                local info = upgradeInfo[afReforgedUpgrade]
                    -- found a valid reward
                    if info and npcUtil.giveItem(player, info.reward) then
                        player:delCurrency('escha_beads', 500)
                        player:setCharVar('afReforged2Upgrade', 0)
                        player:setCharVar('afR2UpgradeDay', 0)
                    end
            end
end

entity.onTrade = function(player, npc, trade)
        local amount = player:getCurrency('escha_beads')
        local jobCards = {9281,9282,9283,9284,9285,9286,9287,9288,9289,9290,9291,9292,9293,9294,9295,9296,9297,9298,9299,9300,9301,9302}
        local tradedCombo = 0
        local tradedCards = 0
        local cardTraded = 0
        local count = trade:getItemCount()
        -- check for armor upgrade trades or card trades
        if tradedCombo == 0 then
            for k, v in pairs(upgradeInfo) do
                if npcUtil.tradeHasExactly(trade, v.trade) then
                    tradedCombo = k
                    break
                end
            end
        end
            for i = 1, #jobCards do
                if npcUtil.tradeHasExactly(trade, {{jobCards[i],count}}) then
                  tradedCards = math.floor(count / 5)
                  cardTraded = jobCards[i]
                  end
            end
        -- found a match
        if tradedCombo > 0 then
            player:confirmTrade()
            player:setCharVar('afReforged2Upgrade', tradedCombo)
            player:setCharVar('afR2UpgradeDay', getVanaMidnight())
            player:startEvent(28,upgradeInfo[tradedCombo].reward,1,10,500,1,0,amount,0)
        end
        if tradedCards > 0 then
             -- csid / item traded / qty traded / amount received / cards to display
             player:setCharVar('JCardReturnedID',cardTraded )
             player:setCharVar('JCardReturned', count % 5) -- set anything that isnt a multiple of 10 to be returned in case of an accidental trade
             player:setCharVar('JCardExchange',tradedCards)
             player:startEvent(32,cardTraded,count, tradedCards,22)
        end

end

entity.onTrigger = function(player, npc)
   local amount = player:getCurrency('escha_beads')
   local afReforgedUpgrade = player:getCharVar('afReforged2Upgrade')
         if afReforgedUpgrade == 0 then
            player:startEvent(27,5,0,0,0,0,0,amount,0)
         elseif afReforgedUpgrade > 0 and
                player:getCharVar('afR2UpgradeDay') > os.time() then
                player:startEvent(27,5,0,0,0,0,0,amount,0)
         elseif afReforgedUpgrade > 0 then
                if player:getCharVar('afR2UpgradeDay') < os.time() then
                   player:startEvent(30,upgradeInfo[afReforgedUpgrade])
                end
         end 

end

entity.onEventUpdate = function(player, csid, option, npc)
end

entity.onEventFinish = function(player, csid, option, npc)
       local returnCards = {{9281,1},{9282,2},{9283,3},{9284,4},{9285,5},{9286,6},{9287,7},{9288,8},{9289,9},{9290,10},{9291,11},{9292,12},{9293,13},{9294,14},{9295,15},{9296,16},{9297,17},{9298,18},{9299,19},{9300,20},{9301,21},{9302,22}}
       local returnAmount = player:getCharVar('JCardExchange')
       local optionSelected = bit.band(bit.rshift(option, 32), 0xFF)
       local amount = player:getCurrency('escha_beads')
       if csid == 28 and
          option == 2 then
          handleMainEvent(player, option)
       elseif csid == 30 then
                local afReforgedUpgrade = player:getCharVar('afReforged2Upgrade')
                local info = upgradeInfo[afReforgedUpgrade]
                    -- found a valid reward
                    if info and npcUtil.giveItem(player, info.reward) then
                        player:delCurrency('escha_beads', 10)
                        player:setCharVar('afReforged2Upgrade', 0)
                        player:setCharVar('afR2UpgradeDay', 0)
                    end
       elseif csid == 32 and
              option >= 1 and option <= 22 then
              for _, csidOption in pairs(returnCards) do
                     if option == csidOption[2] then
                        if npcUtil.giveItem(player, {{csidOption[1], returnAmount}}) then
                            player:confirmTrade()
                            player:setCharVar('JCardExchange',0)
                        end

                        if player:getCharVar('JCardReturnedID') > 0 and
                            npcUtil.giveItem(player, {{player:getCharVar('JCardReturnedID'), player:getCharVar('JCardReturned')}}, { silent = true }) then
                                player:setCharVar('JCardReturned',0)
                                player:setCharVar('JCardReturnedID',0)
                        end

                        return
                     end
              end

       elseif csid == 32 and
              option == 0 or
              option > 22 then
                    player:setCharVar('JCardReturned',0)
                    player:setCharVar('JCardReturnedID',0)
                    player:setCharVar('JCardExchange',0)
        end   
end

return entity


--[[
Trade
Event 28
23317, 1, 10, 500, 1, 0, 7689, 0
1. 23317 = item to be given back
2. 
3. 10 = cheap option for +2 -- gets refactored in +3 for different values see notes below
4. 500 = speedy option for +2 -- gets refactored in +3 for different values see notes below
5. 
6. 
7. 7689 = escha beads
8.

option 0 = exit
option 1 = cheap option
option 2 = speedy option


Trigger
Event 27
4,0,0,0,0,0,7689,0

Trigger
Event 27
5,0,0,0,0,0,7689,0

notes:
+2 to +3
Day 1 trade:
The "Cheap" route takes 1 game day and will cost 200 beads.
The "Speedy" route is instant and will cost 10000 beads.
Day 2 trade:
The "Cheap" route takes 1 game day and will cost 300 beads.
The "Speedy" route is instant and will cost 15000 beads.
NOTE: If at any point you stop the reforge +3 process, you will lose all the traded cards, scale and ingredients.

]]--