-----------------------------------
-- ID: 6181
-- Beitetsu Parcel
<<<<<<< HEAD
-- Breaks up a Beitetsu Parcel
-----------------------------------
require('scripts/globals/items')
require("scripts/globals/msg")
-----------------------------------
local itemObject = {}

itemObject.onItemCheck = function(target)
=======
-----------------------------------
require("scripts/globals/msg")
-----------------------------------
local item_object = {}

item_object.onItemCheck = function(target)
>>>>>>> d37dd4cd8142648c3444793af107889151db07e8
    local result = 0
    if target:getFreeSlotsCount() == 0 then
        result = xi.msg.basic.ITEM_NO_USE_INVENTORY
    end
<<<<<<< HEAD

    return result
end

itemObject.onItemUse = function(target)
    target:addItem(xi.items.BEITETSU, math.random(3, 15))
end

return itemObject
=======
    return result
end

item_object.onItemUse = function(target)
    target:addItem(4060, math.random(3,15))
end

return item_object
>>>>>>> d37dd4cd8142648c3444793af107889151db07e8
