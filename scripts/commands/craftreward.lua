require('scripts/enum/item')
require('modules/module_utils')
local commandObj = {}

commandObj.cmdprops =
{
    permission = 0,
    parameters = 's'
}
local function error(player, msg)
    player:printToPlayer(msg)
end
local rankrewardxx =
{
    [ 1] = {reward = 17764, var = 55, ran = 1}, -- TRAINEE_SWORD
    [ 2] = {reward = 15825, var = 55, ran = 3}, -- ALCHEMISTS_RING
    [ 3] = {reward = 17058, var = 55, ran = 5}, -- Caduceus
    [ 4] = {reward = 14398, var = 55, ran = 7}, -- Alchemists Apron
    [ 5] = {reward = xi.ki.WAY_OF_THE_ALCHEMIST, var = 55, ran = 9}, -- WAY_OF_THE_ALCHEMIST
    [ 6] = {reward = 15008, var = 54, ran = 1}, -- TRAINEE_GLOVES
    [ 7] = {reward = 15824, var = 54, ran = 3}, -- BONECRAFTERS_RING
    [ 8] = {reward = 13947, var = 54, ran = 5}, -- Protective Spectacles
    [ 9] = {reward = 14397, var = 54, ran = 7}, -- Boneworkers Apron
    [10] = {reward = xi.ki.WAY_OF_THE_BONEWORKER, var = 54, ran = 9}, -- WAY_OF_THE_BONEWORKER
    [11] = {reward = 18763, var = 52, ran = 1}, -- TRAINEE_SCISSORS
    [12] = {reward = 15822, var = 52, ran = 3}, -- TAILORS_RING
    [13] = {reward = 13946, var = 52, ran = 5}, -- Magnifying Spectacles
    [14] = {reward = 14395, var = 52, ran = 7}, -- Weavers Apron
    [15] = {reward = xi.ki.WAY_OF_THE_WEAVER, var = 52, ran = 9}, -- WAY_OF_THE_WEAVER
    [16] = {reward = 19101, var = 56, ran = 1}, -- TRAINEE_KNIFE
    [17] = {reward = 15826, var = 56, ran = 3}, -- CHEFS_RING
    [18] = {reward = 13948, var = 56, ran = 5}, -- Chefs Hat
    [19] = {reward = 14399, var = 56, ran = 7}, -- Culinarians Apron
    [20] = {reward = xi.ki.WAY_OF_THE_CULINARIAN, var = 56, ran = 9}, -- WAY_OF_THE_CULINARIAN
    [21] = {reward = 19274, var = 51, ran = 1}, -- TRAINEE_BURIN
    [22] = {reward = 15821, var = 51, ran = 3}, -- GOLDSMITHS_RING
    [23] = {reward = 13945, var = 51, ran = 5}, -- Shaded Spectacles
    [24] = {reward = 14394, var = 51, ran = 7}, -- Goldsmiths Apron
    [25] = {reward = xi.ki.WAY_OF_THE_GOLDSMITH, var = 51, ran = 9}, -- WAY_OF_THE_GOLDSMITH 
    [26] = {reward = 19110, var = 53, ran = 1}, -- TRAINEES_NEEDLE
    [27] = {reward = 15823, var = 53, ran = 3}, -- TANNERS_RING
    [28] = {reward = 14832, var = 53, ran = 5}, -- Tanners Gloves
    [29] = {reward = 14396, var = 53, ran = 7}, -- Tanners Apron
    [30] = {reward = xi.ki.WAY_OF_THE_TANNER, var = 53, ran = 9}, -- WAY_OF_THE_TANNER
    [31] = {reward = 18855, var = 50, ran = 1}, -- TRAINEE_HAMMER
    [32] = {reward = 15820, var = 50, ran = 3}, -- SMITHS_RING
    [33] = {reward = 14831, var = 50, ran = 5}, -- Smithys Mitts
    [34] = {reward = 14393, var = 50, ran = 7}, -- Blacksmiths Apron
    [35] = {reward = xi.ki.WAY_OF_THE_BLACKSMITH, var = 50, ran = 9}, -- WAY_OF_THE_BLACKSMITH
    [36] = {reward = 18502, var = 49, ran = 1}, -- TRAINEE_AXE
    [37] = {reward = 15819, var = 49, ran = 3}, -- CARPENTERS_RING
    [38] = {reward = 14830, var = 49, ran = 5}, -- Carpenters Gloves
    [39] = {reward = 14392, var = 49, ran = 7}, -- Carpenters Apron
    [40] = {reward = xi.ki.WAY_OF_THE_CARPENTER, var = 49, ran = 9}, -- WAY_OF_THE_CARPENTER  
    [41] = {reward = 11499, var = 48, ran = 1}, -- TRAINEES_SPECTACLES
    [42] = {reward = 15554, var = 48, ran = 3}, -- Pelican Ring
    [43] = {reward = 14195, var = 48, ran = 5}, -- Waders
    [44] = {reward = 25608, var = 48, ran = 7}, -- Tlahtlamah Glasses
    [45] = {reward = xi.ki.ANGLERS_ALMANAC, var = 48, ran = 9}, -- ANGLERS_ALMANAC 
}

local craftz =
{
{48, 'Fishing'},
{49, 'Woodworking'},
{50, 'Smithing'},
{51, 'Goldsmithing'},
{52, 'Clothcraft'},
{53, 'Leathercraft'},
{54, 'Bonecraft'},
{55, 'Alchemy'},
{56, 'Cooking'},
}

commandObj.onTrigger = function(player, craftid)
    if craftid == nil or tonumber(craftid) < 48 or tonumber(craftid) >56 then
        error(player, '!craftreward <craftid> \n48 Fishing \n49 Woodworking \n50 Smithing \n51 Goldsmithing \n52 Clothcraft \n53 Leathercraft \n54 Bonecraft \n55 Alchemy \n56 Cooking')
        return
    end

if tonumber(craftid) >= 48 and tonumber(craftid) <= 56 then
local i = 0
    if i == 0 then 
        for _, entry in pairs(craftz) do
            if tonumber(craftid) == entry[1] then
               i = entry[1]
            end
         end
    end

    local newRankz = player:getSkillRank(i)
    local reward   = 0
         if reward == 0 then
            for k, v in pairs(rankrewardxx) do
                if v.var == i and v.ran <= newRankz   then
                   reward = k
                   if reward == k and v.ran ~= 9 then 
                      npcUtil.giveItem(player, v.reward)
                   elseif reward == k and v.ran == 9 then
                      npcUtil.giveKeyItem(player, v.reward)
                   end
                end
            end 
         end
end
end

return commandObj




