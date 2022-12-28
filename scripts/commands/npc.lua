-----------------------------------
-- func: !npc
-- desc: Test dynamic entity before its placed into a module for testing.
-- note: Will spawn after you move from your current position
-----------------------------------
require('scripts/globals/keyitems')
require('scripts/globals/npc_util')
-----------------------------------

cmdprops =
{
    permission = 0,
    parameters = ""
}
local tradedCombo = 0
local tradeTable =
{
	[  1] = { trade = { 27684, {9281, 8}, 9253, 8983 }, reward = 23040 }, -- WAR
	[  2] = { trade = { 27828, {9281,10}, 9253, 8986 }, reward = 23107 },
	[  3] = { trade = { 27964, {9281, 7}, 9253, 8979 }, reward = 23174 },
	[  4] = { trade = { 28111, {9281, 9}, 9253, 8988 }, reward = 23241 },
	[  5] = { trade = { 28244, {9281, 6}, 9253, 8981 }, reward = 23308 },
	[  6] = { trade = { 27685, {9282, 8}, 9245, 8983 }, reward = 23041 }, -- MNK
	[  7] = { trade = { 27829, {9282,10}, 9245, 8986 }, reward = 23108 },
	[  8] = { trade = { 27965, {9282, 7}, 9245, 8979 }, reward = 23175 },
	[  9] = { trade = { 28112, {9282, 9}, 9245, 8988 }, reward = 23242 },
	[ 10] = { trade = { 28245, {9282, 6}, 9245, 8981 }, reward = 23309 },
	[ 11] = { trade = { 27686, {9283, 8}, 9251, 8983 }, reward = 23042 }, -- WHM
	[ 12] = { trade = { 27830, {9283,10}, 9251, 8986 }, reward = 23109 },
	[ 13] = { trade = { 27966, {9283, 7}, 9251, 8979 }, reward = 23176 },
	[ 14] = { trade = { 28113, {9283, 9}, 9251, 8988 }, reward = 23243 },
	[ 15] = { trade = { 28246, {9283, 6}, 9251, 8981 }, reward = 23310 },
	[ 16] = { trade = { 27687, {9284, 8}, 9257, 8983 }, reward = 23043 }, -- BLM
	[ 17] = { trade = { 27831, {9284,10}, 9257, 8986 }, reward = 23110 },
	[ 18] = { trade = { 27967, {9284, 7}, 9257, 8979 }, reward = 23177 },
	[ 19] = { trade = { 28114, {9284, 9}, 9257, 8988 }, reward = 23244 },
	[ 20] = { trade = { 28247, {9284, 6}, 9257, 8981 }, reward = 23311 },
	[ 21] = { trade = { 27688, {9285, 8}, 9255, 8983 }, reward = 23044 }, -- RDM
	[ 22] = { trade = { 27832, {9285,10}, 9255, 8986 }, reward = 23111 },
	[ 23] = { trade = { 27968, {9285, 7}, 9255, 8979 }, reward = 23178 },
	[ 24] = { trade = { 28115, {9285, 9}, 9255, 8988 }, reward = 23245 },
	[ 25] = { trade = { 28248, {9285, 6}, 9255, 8981 }, reward = 23312 },
	[ 26] = { trade = { 27689, {9286, 8}, 9245, 8983 }, reward = 23045 }, -- THF
	[ 27] = { trade = { 27833, {9286,10}, 9245, 8986 }, reward = 23112 },
	[ 28] = { trade = { 27969, {9286, 7}, 9245, 8979 }, reward = 23179 },
	[ 29] = { trade = { 28116, {9286, 9}, 9245, 8988 }, reward = 23246 },
	[ 30] = { trade = { 28249, {9286, 6}, 9245, 8981 }, reward = 23313 },
	[ 31] = { trade = { 27690, {9287, 8}, 9249, 8983 }, reward = 23046 }, -- PLD
	[ 32] = { trade = { 27834, {9287,10}, 9249, 8986 }, reward = 23113 },
	[ 33] = { trade = { 27970, {9287, 7}, 9249, 8979 }, reward = 23180 },
	[ 34] = { trade = { 28117, {9287, 9}, 9249, 8988 }, reward = 23247 },
	[ 35] = { trade = { 28250, {9287, 6}, 9249, 8981 }, reward = 23314 },
	[ 36] = { trade = { 27691, {9288, 8}, 9248, 8983 }, reward = 23047 }, -- DRK
	[ 37] = { trade = { 27835, {9288,10}, 9248, 8986 }, reward = 23114 },
	[ 38] = { trade = { 27971, {9288, 7}, 9248, 8979 }, reward = 23181 },
	[ 39] = { trade = { 28118, {9288, 9}, 9248, 8988 }, reward = 23248 },
	[ 40] = { trade = { 28251, {9288, 6}, 9248, 8981 }, reward = 23315 },
	[ 41] = { trade = { 27692, {9289, 8}, 9253, 8983 }, reward = 23048 }, -- BST
	[ 42] = { trade = { 27836, {9289,10}, 9253, 8986 }, reward = 23115 },
	[ 43] = { trade = { 27972, {9289, 7}, 9253, 8979 }, reward = 23182 },
	[ 44] = { trade = { 28119, {9289, 9}, 9253, 8988 }, reward = 23249 },
	[ 45] = { trade = { 28252, {9289, 6}, 9253, 8981 }, reward = 23316 },
	[ 46] = { trade = { 27693, {9290, 8}, 9251, 8983 }, reward = 23049 }, -- BRD
	[ 47] = { trade = { 27837, {9290,10}, 9251, 8986 }, reward = 23116 },
	[ 48] = { trade = { 27973, {9290, 7}, 9251, 8979 }, reward = 23183 },
	[ 49] = { trade = { 28120, {9290, 9}, 9251, 8988 }, reward = 23250 },
	[ 50] = { trade = { 28253, {9290, 6}, 9251, 8981 }, reward = 23317 },
	[ 51] = { trade = { 27694, {9291, 8}, 9253, 8983 }, reward = 23050 }, -- RNG
	[ 52] = { trade = { 27838, {9291,10}, 9253, 8986 }, reward = 23117 },
	[ 53] = { trade = { 27974, {9291, 7}, 9253, 8979 }, reward = 23184 },
	[ 54] = { trade = { 28121, {9291, 9}, 9253, 8988 }, reward = 23251 },
	[ 55] = { trade = { 28254, {9291, 6}, 9253, 8981 }, reward = 23318 },
	[ 56] = { trade = { 27695, {9292, 8}, 9248, 8983 }, reward = 23051 }, -- SAM
	[ 57] = { trade = { 27839, {9292,10}, 9248, 8986 }, reward = 23118 },
	[ 58] = { trade = { 27975, {9292, 7}, 9248, 8979 }, reward = 23185 },
	[ 59] = { trade = { 28122, {9292, 9}, 9248, 8988 }, reward = 23252 },
	[ 60] = { trade = { 28255, {9292, 6}, 9248, 8981 }, reward = 23319 },
	[ 61] = { trade = { 27696, {9293, 8}, 9248, 8983 }, reward = 23052 }, -- NIN
	[ 62] = { trade = { 27840, {9293,10}, 9248, 8986 }, reward = 23119 },
	[ 63] = { trade = { 27976, {9293, 7}, 9248, 8979 }, reward = 23186 },
	[ 64] = { trade = { 28123, {9293, 9}, 9248, 8988 }, reward = 23253 },
	[ 65] = { trade = { 28256, {9293, 6}, 9248, 8981 }, reward = 23320 },
	[ 66] = { trade = { 27697, {9294, 8}, 9249, 8983 }, reward = 23053 }, -- DRG
	[ 67] = { trade = { 27841, {9294,10}, 9249, 8986 }, reward = 23120 },
	[ 68] = { trade = { 27956, {9294, 7}, 9249, 8979 }, reward = 23187 },
	[ 69] = { trade = { 28124, {9294, 9}, 9249, 8988 }, reward = 23254 },
	[ 70] = { trade = { 28257, {9294, 6}, 9249, 8981 }, reward = 23321 },
	[ 71] = { trade = { 27698, {9295, 8}, 9255, 8983 }, reward = 23054 }, -- SMN
	[ 72] = { trade = { 27842, {9295,10}, 9255, 8986 }, reward = 23121 },
	[ 73] = { trade = { 27978, {9295, 7}, 9255, 8979 }, reward = 23188 },
	[ 74] = { trade = { 28125, {9295, 9}, 9255, 8988 }, reward = 23255 },
	[ 75] = { trade = { 28258, {9295, 6}, 9255, 8981 }, reward = 23322 },
	[ 76] = { trade = { 27699, {9296, 8}, 9251, 8983 }, reward = 23055 }, -- BLU
	[ 77] = { trade = { 27843, {9296,10}, 9251, 8986 }, reward = 23122 },
	[ 78] = { trade = { 27979, {9296, 7}, 9251, 8979 }, reward = 23189 },
	[ 79] = { trade = { 28126, {9296, 9}, 9251, 8988 }, reward = 23256 },
	[ 80] = { trade = { 28259, {9296, 6}, 9251, 8981 }, reward = 23323 },
	[ 81] = { trade = { 27700, {9297, 8}, 9257, 8983 }, reward = 23056 }, --COR
	[ 82] = { trade = { 27844, {9297,10}, 9257, 8986 }, reward = 23123 },
	[ 83] = { trade = { 27980, {9297, 7}, 9257, 8979 }, reward = 23190 },
	[ 84] = { trade = { 28127, {9297, 9}, 9257, 8988 }, reward = 23257 },
	[ 85] = { trade = { 28260, {9297, 6}, 9257, 8981 }, reward = 23324 },
	[ 86] = { trade = { 27701, {9298, 8}, 9257, 8983 }, reward = 23057 }, -- PUP
	[ 87] = { trade = { 27845, {9298,10}, 9257, 8986 }, reward = 23124 },
	[ 88] = { trade = { 27981, {9298, 7}, 9257, 8979 }, reward = 23191 },
	[ 89] = { trade = { 28128, {9298, 9}, 9257, 8988 }, reward = 23258 },
	[ 90] = { trade = { 28270, {9298, 6}, 9257, 8981 }, reward = 23325 },
	[ 91] = { trade = { 27702, {9299, 8}, 9245, 8983 }, reward = 23058 }, -- DNC M
	[ 92] = { trade = { 27846, {9299,10}, 9245, 8986 }, reward = 23125 },
	[ 93] = { trade = { 27982, {9299, 7}, 9245, 8979 }, reward = 23192 },
	[ 94] = { trade = { 28129, {9299, 9}, 9245, 8988 }, reward = 23259 },
	[ 95] = { trade = { 28262, {9299, 6}, 9245, 8981 }, reward = 23326 },
	[ 96] = { trade = { 27703, {9299, 8}, 9245, 8983 }, reward = 23059 }, --DNC F
	[ 97] = { trade = { 27847, {9299,10}, 9245, 8986 }, reward = 23126 },
	[ 98] = { trade = { 27983, {9299, 7}, 9245, 8979 }, reward = 23193 },
	[ 99] = { trade = { 28130, {9299, 9}, 9245, 8988 }, reward = 23260 },
	[100] = { trade = { 28263, {9299, 6}, 9245, 8981 }, reward = 23327 },
	[101] = { trade = { 27704, {9300, 8}, 9255, 8983 }, reward = 23060 }, --SCH
	[102] = { trade = { 27848, {9300,10}, 9255, 8986 }, reward = 23127 },
	[103] = { trade = { 27984, {9300, 7}, 9255, 8979 }, reward = 23194 },
	[104] = { trade = { 28131, {9300, 9}, 9255, 8988 }, reward = 23261 },
	[105] = { trade = { 28273, {9300, 6}, 9255, 8981 }, reward = 23328 },
	[106] = { trade = { 27705, {9301, 8}, 9251, 8983 }, reward = 23061 }, --GEO
	[107] = { trade = { 27849, {9301,10}, 9251, 8986 }, reward = 23128 },
	[108] = { trade = { 28985, {9301, 7}, 9251, 8979 }, reward = 23195 },
	[109] = { trade = { 28132, {9301, 9}, 9251, 8988 }, reward = 23262 },
	[110] = { trade = { 28265, {9301, 6}, 9251, 8981 }, reward = 23329 },
	[111] = { trade = { 27706, {9302, 8}, 9248, 8983 }, reward = 23062 }, -- RUN
	[112] = { trade = { 27850, {9302,10}, 9248, 8986 }, reward = 23129 },
	[113] = { trade = { 27986, {9302, 7}, 9248, 8979 }, reward = 23196 },
	[114] = { trade = { 28133, {9302, 9}, 9248, 8988 }, reward = 23263 },
	[115] = { trade = { 28266, {9302, 6}, 9248, 8981 }, reward = 23330 },
}	

function onTrigger(player)
    local zone = player:getZone()
    local npc = zone:insertDynamicEntity({
    objtype = xi.objType.NPC,
    name = "PollyB",
	look = 3613,
    x = player:getXPos(),
    y = player:getYPos(),
    z = player:getZPos(),
    rotation = player:getRotPos(),
	

    onTrade = function(player, npc, trade)
        -- check for af upgrade trades
        if player:getCharVar("[Polly]item") == 0 then
            for k, v in pairs(tradeTable) do
                if npcUtil.tradeHasExactly(trade, v.trade) then
                    tradedCombo = k
                    break
	    		end
            end
        end
	    
        -- found a match
        if tradedCombo > 0 then
	        local rewardItemId = tradeTable[tradedCombo].reward
	    
            player:setCharVar("[Polly]item", rewardItemId)
	    	player:confirmTrade()
            player:setCharVar("[Polly]time", getVanaMidnight())
            player:PrintToPlayer("Fine, I'll start on improving this. Return tomorrow.", 0, npc:getPacketName())
		end
	end,
	
	onTrigger = function(player, npc, status)

		if player:getCharVar("[Polly]item") ~= 0 then
            if os.time() > player:getCharVar("[Polly]time") then	
                local reward = player:getCharVar("[Polly]item")				
       		        
				if npcUtil.giveItem(player, reward) then
       		    	   player:setCharVar("[Polly]item", 0)
       		    	   player:setCharVar("[Polly]time", 0)
       		    end
			else
                player:PrintToPlayer("Not ready yet...", 0, npc:getPacketName())
            end
	    else
        player:PrintToPlayer("Don't you dare offer a cracker? Fine... if you bring me the right materials, I'll improve the power of certain gear.", 0, npc:getPacketName())
       	player:PrintToPlayer("A piece of artifact gear, some paragon cards, a guild item, and an item from around this crud hole.", 0, npc:getPacketName())
        end
    end,   
    })
    player:PrintToPlayer(string.format("Please move to spawn (%s)", npc:getPacketName()))
end