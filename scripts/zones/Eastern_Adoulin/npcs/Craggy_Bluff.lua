-----------------------------------
-- Area: Eastern Adoulin
--  NPC: Craggy Bluff
-----------------------------------
---@type TNpcEntity

local entity={}

  local craggyShop =
        {
            [1] = -- page 1
            {
               [ 1] = { 20550,  500},  -- Vineslash Cesti
               [ 2] = { 20638,  500},  -- Coalition Dirk
               [ 3] = { 20741,  500},  -- Coalition Blade
               [ 4] = { 20782,  500},  -- Coalition Sword
               [ 5] = { 20830,  500},  -- Coalition Axe
               [ 6] = { 20876,  500},  -- Trunkcleaver
               [ 7] = { 20921,  500},  -- Fieldrazer Scythe
               [ 8] = { 20966,  500},  -- Coalition Lance
               [ 9] = { 21008,  500},  -- Kotekirigo
               [10] = { 21055,  500},  -- Kashiwadachi
               [11] = { 21131,  500},  -- Coalition Rod
               [12] = { 21204,  500},  -- Sortilevel Staff
               [13] = { 21205,  500},  -- Avitap Pole
               [14] = { 21241,  500},  -- Coalition Bow
               [15] = { 21291,  500},  -- Shadeshot Gun
               [16] = { 20547, 1300},  -- Forefront Cesti
            },
            [2] =  -- page 2
            {
               [ 1] = { 20635, 1300},  -- Forefront Dagger
               [ 2] = { 20737, 1300},  -- Forefront Blade
               [ 3] = { 20777, 1300},  -- Forefront Claymore
               [ 4] = { 20825, 1300},  -- Forefront Axe
               [ 5] = { 20871, 1300},  -- Forefront Labrys
               [ 6] = { 20916, 1300},  -- Forefront Scythe
               [ 7] = { 20962, 1300},  -- Forefront Lance
               [ 8] = { 21014, 1300},  -- Ichijintanto
               [ 9] = { 21059, 1300},  -- Ichijinto
               [10] = { 21127, 1300},  -- Forefront Wand
               [11] = { 21196, 1300},  -- Forefront Staff
               [12] = { 21197, 1300},  -- Forefront Scepter
               [13] = { 21237, 1300},  -- Forefront Bow
               [14] = { 21287, 1300},  -- Forefront Gun
               [15] = { 21255, 1300},  -- Forefront Bowgun
               [16] = { 21409, 1300},  -- Forefront Flute
            },
            [3] = -- page 3
            {
               [ 1] = { 21454, 1300},  -- Forefront Animator
               [ 2] = { 21387, 1300},  -- Convocaller
               [ 3] = { 20545, 2000},  -- Camaraderie Knuckles
               [ 4] = { 20633, 2000},  -- Camaraderie Dagger
               [ 5] = { 20735, 2000},  -- Camaraderie Blade
               [ 6] = { 20771, 2000},  -- Camaraderie Claymore
               [ 7] = { 20823, 2000},  -- Camaraderie Axe
               [ 8] = { 20869, 2000},  -- Camaraderie Reaver
               [ 9] = { 20914, 2000},  -- Camaraderie Scythe
               [10] = { 20960, 2000},  -- Camaraderie Lance
               [11] = { 21003, 2000},  -- Camaraderie Katana
               [12] = { 21050, 2000},  -- Camaraderie Tachi
               [13] = { 21123, 2000},  -- Camaraderie Wand
               [14] = { 21188, 2000},  -- Camaraderie Staff
               [15] = { 21189, 2000},  -- Camaraderie Pole
               [16] = { 21235, 2000},  -- Camaraderie Bow
            },
            [4] = -- page 4
            {
               [ 1] = { 21285, 2000},  -- Camaraderie Gun
               [ 2] = { 21254, 2000},  -- Camaraderie Bowgun
               [ 3] = { 21408, 2000},  -- Camaraderie Harp
               [ 4] = { 20531, 3000},  -- Homestead Cesti
               [ 5] = { 20617, 3000},  -- Homestead Dagger
               [ 6] = { 20719, 3000},  -- Homestead Blade
               [ 7] = { 20760, 3000},  -- Homestead Claymore
               [ 8] = { 20810, 3000},  -- Homestead Axe
               [ 9] = { 20859, 3000},  -- Homestead Labrys
               [10] = { 20903, 3000},  -- Homestead Scythe
               [11] = { 20947, 3000},  -- Homestead Lance
               [12] = { 20993, 3000},  -- Senkutanto
               [13] = { 21038, 3000},  -- Senkuto
               [14] = { 21109, 3000},  -- Homestead Wand
               [15] = { 21171, 3000},  -- Homestead Staff
               [16] = { 21172, 3000},  -- Homestead Scepter
            },
            [5] = -- page 5
            {
               [ 1] = { 21226, 3000},  -- Homestead Bow
               [ 2] = { 21248, 3000},  -- Homestead Bowgun
               [ 3] = { 21275, 3000},  -- Homestead Gun
               [ 4] = { 21406, 3000},  -- Homestead Flute
               [ 5] = { 21356,    5},  -- Suppa Shuriken
            },
        }
entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    local bayldcount=player:getCurrency('bayld')
    player:startEvent(7511,0,0,65535,bayldcount)
end

entity.onEventUpdate = function(player, csid, option, npc)
print(csid, option)
end

entity.onEventFinish = function(player, csid, option, npc)
    local itemCatagory = bit.band(bit.rshift(option, 12), 0x3FF) +1
    local itemSelected = bit.band(bit.rshift(option, 8), 15) +1
    local itemQuantity = bit.band(bit.rshift(option, 24), 0x3FF)
    local itemData     = craggyShop[itemCatagory][itemSelected]
    local itemId       = itemData[1]
    local itemCost     = itemData[2]
    local bayldTotal   = player:getCurrency('bayld')
    local cancel       = bit.band(bit.rshift(option, 0), 0xFFFF)
  if cancel == 0 then -- bail out 
     return
  else
        if itemCost >= bayldTotal +1 then
           player:printToPlayer('You do not posses enough Bayld to make this purchase!', 0, 'Craggy Bluff')
           return
        else
                if itemCost <= bayldTotal and
                   npcUtil.giveItem(player, { { itemId, itemQuantity } })
                then
                   player:delCurrency('bayld', itemCost * itemQuantity)
                end
        end
  end
end

return entity