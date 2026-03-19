-----------------------------------
-- Domain Point Stone Merchant
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)

    -- Stone shop stock (itemId, price)
    local stock =
    {
        {8930, 500}, {8931, 1250}, {8932, 2500},   -- Snowslit
        {8933, 500}, {8934, 1250}, {8935, 2500},   -- Leafslit
        {8936, 500}, {8937, 1250}, {8938, 2500},   -- Duskslit
										 
        {8939, 500}, {8940, 1250}, {8941, 2500},   -- Snowtip
        {8942, 500}, {8943, 1250}, {8944, 2500},   -- Leaftip
        {8945, 500}, {8946, 1250}, {8947, 2500},   -- Dusktip
										 
        {8948, 500}, {8949, 1250}, {8950, 2500},   -- Snowdim
        {8951, 500}, {8952, 1250}, {8953, 2500},   -- Leafdim
        {8954, 500}, {8955, 1250}, {8956, 2500},   -- Duskdim
										 
        {8957, 500}, {8958, 1250}, {8959, 2500},   -- Snoworb
        {8960, 500}, {8961, 1250}, {8962, 2500},   -- Leaforb
        {8963, 500}, {8964, 1250}, {8965, 2500},   -- Duskorb
    }

    -- Optional greeting
    player:printToPlayer("Heemo-Weemo: Take your pick of stones!", 0x1F)

    -- Use the same shop engine as Mogshop, but with Domain Points
    xi.shop.general(player, stock)
end

return entity
