-----------------------------------
-- Summons 21 pigs in Northern Sandoria / Bastok Mines / Windurst Woods
-----------------------------------
local commandObj = {}

commandObj.cmdprops =
{
    permission = 4,
    parameters = 'is'
}
local function error(player, msg)
    player:printToPlayer(msg)
    player:printToPlayer('!gmflypigs <area>')
end

local drops = -- 50% drop chance
{
[1]={reward = 1455},-- 1 Byne Bill
[2]={reward = 1452},-- Ordelle Bronze Pieve
[3]={reward = 1449},-- Tukuku Whiteshell
[4]={reward = 2184},-- Imperial Bronze piece
[5]={reward = 2186},-- Imperial Mythril piece
[6]={reward = 2185},-- Imperial Silver piece
}

local dropsa = -- 16% drop chance
{
[1]={reward = 1456},-- 1 Hundred byne bill
[2]={reward = 1453},-- Montiont Silverpiece
[3]={reward = 1450},-- Lungo Nango Jadeshell
[4]={reward = 2187},-- Imperial Gold piece
[5]={reward = 8973},-- Special Gobbie Key
[6]={reward = 1875},-- Ancient Beastcoins
}

local dropsb = -- 34% drop chance
{
[1]={reward = 'unity_accolades'},
[2]={reward = 'spark_of_eminence'},
[3]={reward = 'imperial_standing'},
[4]={reward = 'zeni_point'},
[5]={reward = 'login_points'},
[6]={reward = 'voidstones'},
}

local locationSandy =
{
    [ 1] = {zone = xi.zone.NORTHERN_SAN_DORIA, X = -125.0999, Y = -0.1990,  Z = 77.8498,   Rot = 121},
    [ 2] = {zone = xi.zone.NORTHERN_SAN_DORIA, X =  -16.2502, Y =  0.0000,  Z = 56.2866,   Rot = 114},
    [ 3] = {zone = xi.zone.NORTHERN_SAN_DORIA, X =   -1.6901, Y =  0.0000,  Z = 62.7009,   Rot = 125},
    [ 4] = {zone = xi.zone.NORTHERN_SAN_DORIA, X =   15.1554, Y = -0.1990,  Z = 66.5150,   Rot = 100},
    [ 5] = {zone = xi.zone.NORTHERN_SAN_DORIA, X =   32.3328, Y = -0.1990,  Z = 65.9178,   Rot = 100},
    [ 6] = {zone = xi.zone.NORTHERN_SAN_DORIA, X =   31.7498, Y = -0.1990,  Z = 49.7730,   Rot = 118},
    [ 7] = {zone = xi.zone.NORTHERN_SAN_DORIA, X =   27.4845, Y =  0.0000,  Z = 39.2434,   Rot = 120},
    [ 8] = {zone = xi.zone.NORTHERN_SAN_DORIA, X =    0.8009, Y =  0.5000,  Z = 53.6827,   Rot = 130},
    [ 9] = {zone = xi.zone.NORTHERN_SAN_DORIA, X =   63.7287, Y =  0.0000,  Z = 54.9259,   Rot = 121},
    [10] = {zone = xi.zone.NORTHERN_SAN_DORIA, X =   74.5217, Y = -0.1990,  Z = 53.1394,   Rot = 121},
    [11] = {zone = xi.zone.NORTHERN_SAN_DORIA, X =   72.9141, Y = -0.1990,  Z = 35.4682,   Rot = 121},
    [12] = {zone = xi.zone.NORTHERN_SAN_DORIA, X =   53.0700, Y = -0.1990,  Z = 25.7137,   Rot = 121},
    [13] = {zone = xi.zone.NORTHERN_SAN_DORIA, X =   35.2775, Y = -0.1992,  Z = 20.3773,   Rot = 121},
    [14] = {zone = xi.zone.NORTHERN_SAN_DORIA, X =   15.2080, Y =  0.0000,  Z = 18.0819,   Rot = 121},
    [15] = {zone = xi.zone.NORTHERN_SAN_DORIA, X =    3.2453, Y =  0.0000,  Z = 21.3022,   Rot = 121},
    [16] = {zone = xi.zone.NORTHERN_SAN_DORIA, X =   -6.1716, Y =  0.5000,  Z = 31.4192,   Rot = 121},
    [17] = {zone = xi.zone.NORTHERN_SAN_DORIA, X =   -3.4672, Y =  0.5000,  Z = 49.4738,   Rot = 121},
    [18] = {zone = xi.zone.NORTHERN_SAN_DORIA, X =    3.7313, Y =  0.0000,  Z = 57.1912,   Rot = 121},
    [19] = {zone = xi.zone.NORTHERN_SAN_DORIA, X =    2.0432, Y =  0.0000,  Z = 70.7217,   Rot = 121},
    [20] = {zone = xi.zone.NORTHERN_SAN_DORIA, X =  -40.0079, Y = -0.1990,  Z = 74.2619,   Rot = 121},
    [21] = {zone = xi.zone.NORTHERN_SAN_DORIA, X =  -55.0350, Y = -0.1990,  Z = 74.3430,   Rot = 121},
}
local locationBastok =
{
    [ 1] = {zone = xi.zone.BASTOK_MINES, X =  77.6141,    Y =  0.0000,  Z =  -65.6896,     Rot =  18},
    [ 2] = {zone = xi.zone.BASTOK_MINES, X =  71.0716,    Y =  0.0000,  Z =  -69.0217,     Rot =   6},
    [ 3] = {zone = xi.zone.BASTOK_MINES, X =  68.1990,    Y =  0.0000,  Z =  -76.9791,     Rot = 250},
    [ 4] = {zone = xi.zone.BASTOK_MINES, X =  73.5763,    Y =  0.0000,  Z =  -79.7233,     Rot = 233},
    [ 5] = {zone = xi.zone.BASTOK_MINES, X =  59.0034,    Y =  0.0000,  Z =  -91.9131,     Rot = 183},
    [ 6] = {zone = xi.zone.BASTOK_MINES, X =  45.4447,    Y =  0.8720,  Z =  -92.6987,     Rot = 234},
    [ 7] = {zone = xi.zone.BASTOK_MINES, X =  49.1520,    Y =  0.8720,  Z =  -88.7576,     Rot =  30},
    [ 8] = {zone = xi.zone.BASTOK_MINES, X =  41.9841,    Y =  0.0000,  Z =  -69.0624,     Rot = 234},
    [ 9] = {zone = xi.zone.BASTOK_MINES, X =  39.0088,    Y =  0.0000,  Z =  -49.9508,     Rot =  24},
    [10] = {zone = xi.zone.BASTOK_MINES, X =  30.6824,    Y =  0.0000,  Z =  -62.6844,     Rot =  45},
    [11] = {zone = xi.zone.BASTOK_MINES, X =  12.4986,    Y = -3.0000,  Z =  -53.8435,     Rot =  49},
    [12] = {zone = xi.zone.BASTOK_MINES, X = -11.6853,    Y = -3.0000,  Z =  -54.4220,     Rot =  80},
    [13] = {zone = xi.zone.BASTOK_MINES, X =  13.1322,    Y =  0.0000,  Z = -107.4814,     Rot =   4},
    [14] = {zone = xi.zone.BASTOK_MINES, X =   2.9595,    Y = -1.0008,  Z = -116.9046,     Rot = 137},
    [15] = {zone = xi.zone.BASTOK_MINES, X =  -4.2094,    Y = -1.0008,  Z = -110.4412,     Rot = 200},
    [16] = {zone = xi.zone.BASTOK_MINES, X = -14.1004,    Y = -1.0008,  Z = -112.5796,     Rot = 189},
    [17] = {zone = xi.zone.BASTOK_MINES, X = -26.1177,    Y = -1.0008,  Z = -112.5180,     Rot = 228},
    [18] = {zone = xi.zone.BASTOK_MINES, X = -31.0202,    Y =  0.0000,  Z =  -94.3979,     Rot = 215},
    [19] = {zone = xi.zone.BASTOK_MINES, X = -32.6690,    Y =  0.0000,  Z =  -82.3572,     Rot = 221},
    [20] = {zone = xi.zone.BASTOK_MINES, X = -20.3414,    Y =  0.0000,  Z =  -82.6480,     Rot = 251},
    [21] = {zone = xi.zone.BASTOK_MINES, X =  -2.4857,    Y =  0.0000,  Z =  -77.4345,     Rot =  25},
}
local locationWindy =
{
    [ 1] = {zone = xi.zone.WINDURST_WOODS, X = -75.7245,    Y = 2.2612,  Z = -69.8586,     Rot =   1},
    [ 2] = {zone = xi.zone.WINDURST_WOODS, X = -74.5460,    Y = 2.3002,  Z = -67.6292,     Rot =  21},
    [ 3] = {zone = xi.zone.WINDURST_WOODS, X = -46.0464,    Y = 1.4459,  Z = -91.0124,     Rot = 201},
    [ 4] = {zone = xi.zone.WINDURST_WOODS, X = -42.5341,    Y = 2.0060,  Z = -89.9696,     Rot = 183},
    [ 5] = {zone = xi.zone.WINDURST_WOODS, X =  14.0892,    Y = 1.5443,  Z = -88.0893,     Rot = 148},
    [ 6] = {zone = xi.zone.WINDURST_WOODS, X =  12.0792,    Y = 1.3676,  Z = -93.5092,     Rot = 154},
    [ 7] = {zone = xi.zone.WINDURST_WOODS, X =  18.1150,    Y = 2.0000,  Z = -49.6852,     Rot = 111},
    [ 8] = {zone = xi.zone.WINDURST_WOODS, X =  17.2940,    Y = 2.0000,  Z = -42.1199,     Rot = 110},
    [ 9] = {zone = xi.zone.WINDURST_WOODS, X =  11.1989,    Y = 1.9359,  Z = -40.1416,     Rot =  94},
    [10] = {zone = xi.zone.WINDURST_WOODS, X = -39.1753,    Y = 1.0319,  Z = -31.5465,     Rot =  44},
    [11] = {zone = xi.zone.WINDURST_WOODS, X = -35.6386,    Y = 0.8099,  Z = -29.7484,     Rot =  78},
    [12] = {zone = xi.zone.WINDURST_WOODS, X = -34.1554,    Y = 3.0000,  Z = -48.6115,     Rot =  40},
    [13] = {zone = xi.zone.WINDURST_WOODS, X = -40.9511,    Y = 2.9434,  Z = -56.0564,     Rot =  25},
    [14] = {zone = xi.zone.WINDURST_WOODS, X = -39.0637,    Y = 3.0000,  Z = -66.4917,     Rot = 230},
    [15] = {zone = xi.zone.WINDURST_WOODS, X = -33.1856,    Y = 2.9169,  Z = -76.2491,     Rot =  20},
    [16] = {zone = xi.zone.WINDURST_WOODS, X =  -5.5299,    Y = 3.0000,  Z = -76.1585,     Rot = 178},
    [17] = {zone = xi.zone.WINDURST_WOODS, X =   2.0867,    Y = 3.0000,  Z = -67.4143,     Rot = 233},
    [18] = {zone = xi.zone.WINDURST_WOODS, X =   2.9744,    Y = 3.0000,  Z = -60.5893,     Rot = 241},
    [19] = {zone = xi.zone.WINDURST_WOODS, X =  -1.8269,    Y = 3.0000,  Z = -52.5861,     Rot = 128},
    [20] = {zone = xi.zone.WINDURST_WOODS, X = -14.4686,    Y = 2.7500,  Z = -55.4008,     Rot = 132},
    [21] = {zone = xi.zone.WINDURST_WOODS, X = -18.8630,    Y = 2.7500,  Z = -72.6521,     Rot =  13},
}

local menu = {}
local page1 = {}
local page2 = {}


local delaySendMenu = function(player)
         player:timer(50, function(playerArg)
         playerArg:customMenu(menu)
         end)
end
menu =
{
    title = 'Join the event?',
    options = {},
}
page1 =
{
    {
        'Yes',
        function(player)
        if player:getZoneID() == 231 then
          local playercount = GetServerVariable('[LPFSEvent] PlayerCount')
          SetServerVariable('[LPFSEvent] PlayerCount', playercount +1)
          player:setCharVar('[LPFSEvent] PlayerLevel', player:getMainLvl())
          player:addStatusEffect(xi.effect.CONFRONTATION, { power = 2, origin = player })
          if player:getMainLvl() < 10 then
          return
          else
          player:setLevel(10)
          end
         elseif player:getZoneID() == 234 then
          local playercount = GetServerVariable('[LPFBEvent] PlayerCount')
          SetServerVariable('[LPFBEvent] PlayerCount', playercount +1)
          player:setCharVar('[LPFBEvent] PlayerLevel', player:getMainLvl())
          player:addStatusEffect(xi.effect.CONFRONTATION, { power = 2, origin = player })
          if player:getMainLvl() < 10 then
          return
          else
          player:setLevel(10)
          end
        elseif player:getZoneID() == 241 then
          local playercount = GetServerVariable('[LPFWEvent] PlayerCount')
          SetServerVariable('[LPFWEvent] PlayerCount', playercount +1)
          player:setCharVar('[LPFWEvent] PlayerLevel', player:getMainLvl())
          player:addStatusEffect(xi.effect.CONFRONTATION, { power = 2, origin = player })
          if player:getMainLvl() < 10 then
          return
          else
          player:setLevel(10)
          end
        end
        end,
    },
    {
        'No',
        function(player)
        end,
    },
}
page2 =
{
    {
        'Yes',
        function(player)
                       local ExistLvlS = tonumber(player:getCharVar('[LPFSEvent] PlayerLevel'))
                       local playercountS = GetServerVariable('[LPFSEvent] PlayerCount')
                       local ExistLvlB = tonumber(player:getCharVar('[LPFBEvent] PlayerLevel'))
                       local playercountB = GetServerVariable('[LPFBEvent] PlayerCount')
                       local ExistLvlW = tonumber(player:getCharVar('[LPFWEvent] PlayerLevel'))
                       local playercountW = GetServerVariable('[LPFWEvent] PlayerCount')
                             if player:hasStatusEffect(xi.effect.CONFRONTATION) then
                                player:delStatusEffect(xi.effect.CONFRONTATION)
                             end
                             if ExistLvlS > 0 then
                             player:setLevel(ExistLvlS)
                             player:setCharVar('[LPFSEvent] PlayerLevel', 0)
                             SetServerVariable('[LPFSEvent] PlayerCount', playercountS - 1)
                             elseif ExistLvlB > 0 then
                             player:setLevel(ExistLvlB)
                             player:setCharVar('[LPFBEvent] PlayerLevel', 0)
                             SetServerVariable('[LPFBEvent] PlayerCount', playercountB - 1)
                             elseif ExistLvlW > 0 then
                             player:setLevel(ExistLvlW)
                             player:setCharVar('[LPFWEvent] PlayerLevel', 0)
                             SetServerVariable('[LPFWEvent] PlayerCount', playercountW - 1)
                             end
        end,
    },
    {
        'No',
        function(player)
        end,
    }
}

commandObj.onTrigger = function(player, area)
-- validate area to populate
    if area == nil or area > 3 then
        error(player, 'Improper area selected, 1 = Northern SandOria, 2 = Bastok Mines, 3 = Windurst Woods')
        return
    end
        local areaCall = 0
        local areaName = 0
        local npcLocation = 0
            if area == 1 then
                areaCall = locationSandy
                areaName = 'Northern San dOria'
                npcLocation = 'in Northern San dOria near the mog house entrance'
            elseif area == 2 then
                areaCall = locationBastok
                areaName = 'Bastok Mines'
                npcLocation= 'in Bastok Mines near the mog house entrance'
            elseif area == 3 then
                areaCall = locationWindy
                areaName = 'Windurst Woods'
                npcLocation= 'in Windurst Woods near the San dOrian Consul'
            end


  player:printToArea(string.format('GM: The Pigs are taking over the city, they have been spotted in %s!', areaName), xi.msg.channel.SYSTEM_3, 0)
  player:printToArea('GM: Help us stop them from stealing our valuables, they will be gone in 10 minutes!', xi.msg.channel.SYSTEM_3, 0)
  player:printToArea(string.format('GM: Please see the GM NPC %s.', npcLocation), xi.msg.channel.SYSTEM_3, 0)
 if area == 1 then
    -------------------------------------------------------------------------------------------
    -------------------------- Flying Pigs - San dOrian
    -------------------------------------------------------------------------------------------
  for i = 1, 21 do 
            for k, v in pairs(locationSandy) do
                    if i == k then
                       X = v.X
                       Y = v.Y
                       Z = v.Z
                       Rot = v.Rot
                       zonez = v.zone
                    end
            end
    local zone = GetZone(zonez)
	local Pig = zone:insertDynamicEntity({
		objtype = xi.objType.MOB,
		name = "Pig Assassin",
		x = X,
		y = Y,
		z = Z,		
		rotation =  Rot,
		widescan = 1,
		look = 2928,
		allegiance = 0,
		groupId = 16,
		groupZoneId = 180,
        minLevel = 10,
        maxLevel = 10,

		onMobSpawn = function(mob)
			local lpfsEvent = GetServerVariable('[LPFSEvent] PigCount') -- Let Pigs Fly Sandy Event
				SetServerVariable('[LPFSEvent] PigCount', lpfsEvent +1)
                mob:addMod(xi.mod.REGEN, 3)
                mob:addMod(xi.mod.REGAIN, 15)
                mob:addMod(xi.mod.COUNTER, 5)
                mob:addMod(xi.mod.DOUBLE_ATTACK, 10)
		        mob:setMobMod(xi.mobMod.ROAM_DISTANCE, 45)
                mob:addStatusEffect(xi.effect.CONFRONTATION, { power = 2, origin = mob})
				mob:setMobLevel(10)
				mob:setMobMod(xi.mobMod.CHECK_AS_NM, 1)
            mob:addListener('TAKE_DAMAGE', 'PIG_TAKE_DAMAGE', function(mob, damage, attacker, attackType, damageType)
                if attackType == xi.attackType.PHYSICAL or attackType == xi.attackType.RANGED or attackType == xi.attackType.MAGICAL then
                    local rand = math.random(1,3)
                        if rand == 2 then
                           npcUtil.giveItem(attacker, { { xi.item.GIL, math.random(100, 1000) } })
                        end
                end
            end)
          mob:setLocalVar('PigDespawn', os.time() + 1200) -- 600 = 10 minutes
		end,
    
		onMobRoam = function(mob)
            if mob:getLocalVar('PigDespawn') <= os.time() then
                DespawnMob(mob:getID())
            end
		end,
		onMobFight = function(mob, target)
            if mob:getLocalVar('PigDespawn') <= os.time() then
                DespawnMob(mob:getID())
            end
		end,
        onMobDespawn = function(mob)
			local LPFSEvent = GetServerVariable('[LPFSEvent] PigCount') -- Let Pigs Fly Sandy Event
				-- SetServerVariable('[LPFSEvent] PigCount', LPFSEvent -1)
        end,
	
        onMobDeath = function(mob, player, optParams)
        if optParams.isKiller then 
		    local droppool = math.random(1,100)
			 if droppool >= 1 and droppool <= 50 then 
               local randz = math.random(1, 6)
                        for k, v in pairs(drops) do
                          if randz == k then
                             npcUtil.giveItem(player, { { v.reward, math.random(5,10) } })
                          end
                        end
			 elseif droppool >= 51 and droppool <= 66 then
               local randz = math.random(1, 6)
                        for k, v in pairs(dropsa) do
                          if randz == k then
                             npcUtil.giveItem(player, { { v.reward, 1 } })
                          end
                        end
			 elseif droppool >= 67 and droppool <= 100  then
               local randz = math.random(1, 6)
			   local randamount = math.random(10,20)
                        for k, v in pairs(dropsb) do
                          if randz == k then
                             player:addCurrency(v.reward, randamount)
							 player:printToPlayer(string.format("You obtained %s %s", randamount, v.reward),xi.msg.channel.SYSTEM_3)
                          end
                        end
			 end
	      local lpfsEvent	= GetServerVariable('[LPFSEvent] PigCount')
           SetServerVariable('[LPFSEvent] PigCount', lpfsEvent -1)
			if lpfsEvent > 1 then
                local pigcounts = lpfsEvent -1
				player:printToArea(string.format('GM: There are currently %s pigs still tormenting the citizens in San dOria!', pigcounts), xi.msg.channel.SYSTEM_3, 0)
			elseif lpfsEvent == 1 then  
				player:printToArea(string.format('GM: Congratulations!! All the Flying pigs have been defeated in San dOria.', lpfsEvent), xi.msg.channel.SYSTEM_3, 0)	
				player:printToArea(string.format('GM: Please return to the GM NPC to have your level returned', lpfsEvent), xi.msg.channel.SYSTEM_3, 0)	
				SetServerVariable('[LPFSEvent] PigCount', 0)
            end
        end    
			mob:removeListener('PIG_TAKE_DAMAGE')
		end,
		specialSpawnAnimation = false,
        releaseIdOnDisappear = true,
	})
        Pig:setSpawn(X, Y, Z, Rot, zonez)
    	Pig:setDropID(0) -- No drops from loot pool in sql
		Pig:setMobMod(xi.mobMod.NO_DROPS, 1)
        Pig:setCallForHelpBlocked(true)
		Pig:spawn()
  end
	    utils.unused(Pig)
    -------------------------------------------------------------------------------------------
    -------------------------- Northern Sandoria NPC
    -------------------------------------------------------------------------------------------
    local namez = player:getName()
    local zoneOrInstanceObj = GetZone(xi.zone.NORTHERN_SAN_DORIA)
    local instance = player:getInstance()
    if instance then
        zoneOrInstanceObj = instance
    end
    local npcs = zoneOrInstanceObj:insertDynamicEntity({
        objtype = xi.objType.NPC,
        name = 'GM - ' ..namez,
        look = 1548,
        x = 80.9197,
        y = -0.1990,
        z = 20.4243,
        rotation = 95,
        widescan = 0,

        onTrigger = function(player, npc)
                local LPFSEvent	= GetServerVariable('[LPFSEvent] PigCount')
                local playercount = GetServerVariable('[LPFSEvent] PlayerCount')
                if LPFSEvent > 1 and
                   player:getCharVar('[LPFSEvent] PlayerLevel') == 0 then
                   player:printToPlayer('Welcome and Thank you for joining the GM Event Let Pigs Fly!',xi.msg.channel.SYSTEM_3)
                   menu.options = page1
                   delaySendMenu(player)
                elseif LPFSEvent > 1 and
                   player:getCharVar('[LPFSEvent] PlayerLevel') > 0 then
                   player:printToPlayer('You wish to leave the event early?!',xi.msg.channel.SYSTEM_3)
                   menu.options = page2
                   delaySendMenu(player)
                elseif LPFSEvent == 0 and
                       player:getCharVar('[LPFSEvent] PlayerLevel') > 0 and
                       GetServerVariable('[LPFSEvent] PlayerCount') > 1 then
                       local ExistLvl = tonumber(player:getCharVar('[LPFSEvent] PlayerLevel'))
                             player:delStatusEffect(xi.effect.CONFRONTATION)
                             player:setLevel(ExistLvl)
                             player:setCharVar('[LPFSEvent] PlayerLevel', 0)
                             SetServerVariable('[LPFSEvent] PlayerCount', playercount - 1)
                elseif LPFSEvent == 0 and
                       player:getCharVar('[LPFSEvent] PlayerLevel') > 0 and
                       GetServerVariable('[LPFSEvent] PlayerCount') == 1 then
                       local ExistLvl = tonumber(player:getCharVar('[LPFSEvent] PlayerLevel'))
                             player:delStatusEffect(xi.effect.CONFRONTATION)
                             player:setLevel(ExistLvl)
                             player:setCharVar('[LPFSEvent] PlayerLevel', 0)
                             SetServerVariable('[LPFSEvent] PlayerCount', playercount - 1)
                             npc:setStatus(xi.status.DISAPPEAR)
                elseif LPFSEvent == 0 and
                       GetServerVariable('[LPFSEvent] PlayerCount') == 0 then
                             npc:setStatus(xi.status.DISAPPEAR) 
                end
        end,
        releaseIdOnDisappear = true,
    })
    utils.unused(npcs)
elseif area == 2 then
    -------------------------------------------------------------------------------------------
    -------------------------- Flying Pigs - Bastok Mines
    -------------------------------------------------------------------------------------------
for i = 1, 21 do 
            for k, v in pairs(locationBastok) do
                    if i == k then
                       X = v.X
                       Y = v.Y
                       Z = v.Z
                       Rot = v.Rot
                       zonez = v.zone
                    end
            end
    local zone = GetZone(zonez)
	local Pig = zone:insertDynamicEntity({
		objtype = xi.objType.MOB,
		name = "Pig Assassin",
		x = X,
		y = Y,
		z = Z,		
		rotation =  Rot,
		widescan = 1,
		look = 2928,
		allegiance = 0,
		groupId = 16,
		groupZoneId = 180,
        minLevel = 10,
        maxLevel = 10,

		onMobSpawn = function(mob)
			local LPFBEvent = GetServerVariable('[LPFBEvent] PigCount') -- Let Pigs Fly Bastok Event
				SetServerVariable('[LPFBEvent] PigCount', LPFBEvent +1)
		        mob:setMobMod(xi.mobMod.ROAM_DISTANCE, 45)
                mob:addStatusEffect(xi.effect.CONFRONTATION, { power = 2, origin = mob})
				mob:setMobLevel(10)
				mob:setMobMod(xi.mobMod.CHECK_AS_NM, 1)
            mob:addListener('TAKE_DAMAGE', 'PIG_TAKE_DAMAGE', function(mob, damage, attacker, attackType, damageType)
                if attackType == xi.attackType.PHYSICAL or attackType == xi.attackType.RANGED or attackType == xi.attackType.MAGICAL then
                    local rand = math.random(1,3)
                        if rand == 2 then
                           npcUtil.giveItem(attacker, { { xi.item.GIL, math.random(100, 1000) } })
                        end
                end
            end)
          mob:setLocalVar('PigDespawn', os.time() + 1200) -- 600 = 10 minutes
		end,

		onMobRoam = function(mob)
            if mob:getLocalVar('PigDespawn') <= os.time() then
                DespawnMob(mob:getID())
            end
		end,
		onMobFight = function(mob, target)
            if mob:getLocalVar('PigDespawn') <= os.time() then
                DespawnMob(mob:getID())
            end
		end,
        onMobDespawn = function(mob)
			local LPFBEvent = GetServerVariable('[LPFBEvent] PigCount') -- Let Pigs Fly Bastok Event
				-- SetServerVariable('[LPFBEvent] PigCount', LPFBEvent -1)
        end,
	
        onMobDeath = function(mob, player, optParams)
        if optParams.isKiller then    
		    local droppool = math.random(1,100)
			 if droppool >= 1 and droppool <= 50 then 
               local randz = math.random(1, 6)
                        for k, v in pairs(drops) do
                          if randz == k then
                             npcUtil.giveItem(player, { { v.reward, math.random(5,10) } })
                          end
                        end
			 elseif droppool >= 51 and droppool <= 66 then
               local randz = math.random(1, 6)
                        for k, v in pairs(dropsa) do
                          if randz == k then
                             npcUtil.giveItem(player, { { v.reward, 1 } })
                          end
                        end
			 elseif droppool >= 67 and droppool <= 100  then
               local randz = math.random(1, 6)
			   local randamount = math.random(10,20)
                        for k, v in pairs(dropsb) do
                          if randz == k then
                             player:addCurrency(v.reward, randamount)
							 player:printToPlayer(string.format("You obtained %s %s", randamount, v.reward),xi.msg.channel.SYSTEM_3)
                          end
                        end
			 end
	      local LPFBEvent	= GetServerVariable('[LPFBEvent] PigCount')
            SetServerVariable('[LPFBEvent] PigCount', LPFBEvent -1)
			if LPFBEvent > 1 then
                local pigcountb = LPFBEvent -1
				player:printToArea(string.format('GM: There are currently %s pigs still tormenting the citizens in Bastok!', pigcountb), xi.msg.channel.SYSTEM_3, 0)
			elseif LPFBEvent == 1 then  
				player:printToArea(string.format('GM: Congratulations!! All the Flying pigs have been defeated in Bastok.', LPFBEvent), xi.msg.channel.SYSTEM_3, 0)	
				player:printToArea(string.format('GM: Please return to the GM NPC to have your level returned', LPFBEvent), xi.msg.channel.SYSTEM_3, 0)	
				SetServerVariable('[LPFBEvent] PigCount', 0)
            end
        end    
			mob:removeListener('PIG_TAKE_DAMAGE')
		end,
		specialSpawnAnimation = false,
        releaseIdOnDisappear = true,
	})
        Pig:setSpawn(X, Y, Z, Rot, zonez)
    	Pig:setDropID(0) -- No drops from loot pool in sql
		Pig:setMobMod(xi.mobMod.NO_DROPS, 1)
        Pig:setCallForHelpBlocked(true)
		Pig:spawn()
  end
	    utils.unused(Pig)
    -------------------------------------------------------------------------------------------
    -------------------------- Bastok Mines NPC
    -------------------------------------------------------------------------------------------
    local namez = player:getName()
    local zoneOrInstanceObj = GetZone(xi.zone.BASTOK_MINES)
    local instance = player:getInstance()
    if instance then
        zoneOrInstanceObj = instance
    end
    local npcb = zoneOrInstanceObj:insertDynamicEntity({
        objtype = xi.objType.NPC,
        name = 'GM - ' ..namez,
        look = 1548,
        x = 100.5263,
        y = 0.9944,
        z = -72.1499,
        rotation = 0,
        widescan = 0,

        onTrigger = function(player, npc)
                local LPFBEvent	= GetServerVariable('[LPFBEvent] PigCount')
                local playercount = GetServerVariable('[LPFBEvent] PlayerCount')
                if LPFBEvent > 1 and
                   player:getCharVar('[LPFBEvent] PlayerLevel') == 0 then
                   player:printToPlayer('Welcome and Thank you for joining the GM Event Let Pigs Fly!',xi.msg.channel.SYSTEM_3)
                   menu.options = page1
                   delaySendMenu(player)
                elseif LPFBEvent > 1 and
                   player:getCharVar('[LPFBEvent] PlayerLevel') > 0 then
                   player:printToPlayer('You wish to leave the event early?!',xi.msg.channel.SYSTEM_3)
                   menu.options = page2
                   delaySendMenu(player)
                elseif LPFBEvent == 0 and
                       player:getCharVar('[LPFBEvent] PlayerLevel') > 0 and
                       GetServerVariable('[LPFBEvent] PlayerCount') > 1 then
                       local ExistLvl = tonumber(player:getCharVar('[LPFBEvent] PlayerLevel'))
                             player:delStatusEffect(xi.effect.CONFRONTATION)
                             player:setLevel(ExistLvl)
                             player:setCharVar('[LPFBEvent] PlayerLevel', 0)
                             SetServerVariable('[LPFBEvent] PlayerCount', playercount - 1)
                elseif LPFBEvent == 0 and
                       player:getCharVar('[LPFBEvent] PlayerLevel') > 0 and
                       GetServerVariable('[LPFBEvent] PlayerCount') == 1 then
                       local ExistLvl = tonumber(player:getCharVar('[LPFBEvent] PlayerLevel'))
                             player:delStatusEffect(xi.effect.CONFRONTATION)
                             player:setLevel(ExistLvl)
                             player:setCharVar('[LPFBEvent] PlayerLevel', 0)
                             SetServerVariable('[LPFBEvent] PlayerCount', playercount - 1)
                             npc:setStatus(xi.status.DISAPPEAR)
                elseif LPFBEvent == 0 and
                       GetServerVariable('[LPFBEvent] PlayerCount') == 0 then
                             npc:setStatus(xi.status.DISAPPEAR) 
                end
        end,
        releaseIdOnDisappear = true,
    })
    utils.unused(npcb)
elseif area == 3 then
    -------------------------------------------------------------------------------------------
    -------------------------- Flying Pigs - Windy Woods
    -------------------------------------------------------------------------------------------
 for i = 1, 21 do 
            for k, v in pairs(locationWindy) do
                    if i == k then
                       X = v.X
                       Y = v.Y
                       Z = v.Z
                       Rot = v.Rot
                       zonez = v.zone
                    end
            end
    local zone = GetZone(zonez)
	local Pig = zone:insertDynamicEntity({
		objtype = xi.objType.MOB,
		name = "Pig Assassin",
		x = X,
		y = Y,
		z = Z,		
		rotation =  Rot,
		widescan = 1,
		look = 2928,
		allegiance = 0,
		groupId = 16,
		groupZoneId = 180,
        minLevel = 10,
        maxLevel = 10,

		onMobSpawn = function(mob)
			local LPFWEvent = GetServerVariable('[LPFWEvent] PigCount') -- Let Pigs Fly Windy Event
				SetServerVariable('[LPFWEvent] PigCount', LPFWEvent +1)
		        mob:setMobMod(xi.mobMod.ROAM_DISTANCE, 45)
                mob:addStatusEffect(xi.effect.CONFRONTATION, { power = 2, origin = mob})
				mob:setMobLevel(10)
				mob:setMobMod(xi.mobMod.CHECK_AS_NM, 1)
            mob:addListener('TAKE_DAMAGE', 'PIG_TAKE_DAMAGE', function(mob, damage, attacker, attackType, damageType)
                if attackType == xi.attackType.PHYSICAL or attackType == xi.attackType.RANGED or attackType == xi.attackType.MAGICAL then
                    local rand = math.random(1,3)
                        if rand == 2 then
                           npcUtil.giveItem(attacker, { { xi.item.GIL, math.random(100, 1000) } })
                        end
                end
            end)
          mob:setLocalVar('PigDespawn', os.time() + 1200) -- 600 = 10 minutes
		end,

		onMobRoam = function(mob)
            if mob:getLocalVar('PigDespawn') <= os.time() then
                DespawnMob(mob:getID())
            end
		end,
		onMobFight = function(mob, target)
            if mob:getLocalVar('PigDespawn') <= os.time() then
                DespawnMob(mob:getID())
            end
		end,
        onMobDespawn = function(mob)
			local LPFWEvent = GetServerVariable('[LPFWEvent] PigCount') -- Let Pigs Fly Windy Event
				-- SetServerVariable('[LPFWEvent] PigCount', LPFWEvent -1)
        end,
	
        onMobDeath = function(mob, player, optParams)
        if optParams.isKiller then    
		    local droppool = math.random(1,100)
			 if droppool >= 1 and droppool <= 50 then 
               local randz = math.random(1, 6)
                        for k, v in pairs(drops) do
                          if randz == k then
                             npcUtil.giveItem(player, { { v.reward, math.random(5,10) } })
                          end
                        end
			 elseif droppool >= 51 and droppool <= 66 then
               local randz = math.random(1, 6)
                        for k, v in pairs(dropsa) do
                          if randz == k then
                             npcUtil.giveItem(player, { { v.reward, 1 } })
                          end
                        end
			 elseif droppool >= 67 and droppool <= 100  then
               local randz = math.random(1, 6)
			   local randamount = math.random(10,20)
                        for k, v in pairs(dropsb) do
                          if randz == k then
                             player:addCurrency(v.reward, randamount)
							 player:printToPlayer(string.format("You obtained %s %s", randamount, v.reward),xi.msg.channel.SYSTEM_3)
                          end
                        end
			 end
	      local LPFWEvent	= GetServerVariable('[LPFWEvent] PigCount')
            SetServerVariable('[LPFWEvent] PigCount', LPFWEvent -1)
			if LPFWEvent > 1 then
                local pigcountw = LPFWEvent -1
				player:printToArea(string.format('GM: There are currently %s pigs still tormenting the citizens in Windurst!', pigcountw), xi.msg.channel.SYSTEM_3, 0)
			elseif LPFWEvent == 1 then  
				player:printToArea(string.format('GM: Congratulations!! All the Flying pigs have been defeated in Windurst.', LPFWEvent), xi.msg.channel.SYSTEM_3, 0)	
				player:printToArea(string.format('GM: Please return to the GM NPC to have your level returned', LPFWEvent), xi.msg.channel.SYSTEM_3, 0)	
				SetServerVariable('[LPFWEvent] PigCount', 0)
            end
        end    
			mob:removeListener('PIG_TAKE_DAMAGE')
		end,
		specialSpawnAnimation = false,
        releaseIdOnDisappear = true,
	})
        Pig:setSpawn(X, Y, Z, Rot, zonez)
    	Pig:setDropID(0) -- No drops from loot pool in sql
		Pig:setMobMod(xi.mobMod.NO_DROPS, 1)
        Pig:setCallForHelpBlocked(true)
		Pig:spawn()
 end
	    utils.unused(Pig)
    -------------------------------------------------------------------------------------------
    -------------------------- Windurst Woods NPC
    -------------------------------------------------------------------------------------------
    local namez = player:getName()
    local zoneOrInstanceObj = GetZone(xi.zone.WINDURST_WOODS)
    local instance = player:getInstance()
    if instance then
        zoneOrInstanceObj = instance
    end
    local npcw = zoneOrInstanceObj:insertDynamicEntity({
        objtype = xi.objType.NPC,
        name = 'GM - ' ..namez,
        look = 1548,
        x = -49.0976,
        y = 0.7964,
        z = -46.5350,
        rotation = 24,
        widescan = 0,

        onTrigger = function(player, npc)
                local LPFWEvent	= GetServerVariable('[LPFWEvent] PigCount')
                local playercount = GetServerVariable('[LPFWEvent] PlayerCount')
                if LPFWEvent > 1 and
                   player:getCharVar('[LPFWEvent] PlayerLevel') == 0 then
                   player:printToPlayer('Welcome and Thank you for joining the GM Event Let Pigs Fly!',xi.msg.channel.SYSTEM_3)
                   menu.options = page1
                   delaySendMenu(player)
                elseif LPFWEvent > 1 and
                   player:getCharVar('[LPFWEvent] PlayerLevel') > 0 then
                   player:printToPlayer('You wish to leave the event early?!',xi.msg.channel.SYSTEM_3)
                   menu.options = page2
                   delaySendMenu(player)
                elseif LPFWEvent == 0 and
                       player:getCharVar('[LPFWEvent] PlayerLevel') > 0 and
                       GetServerVariable('[LPFWEvent] PlayerCount') > 1 then
                       local ExistLvl = tonumber(player:getCharVar('[LPFWEvent] PlayerLevel'))
                             player:delStatusEffect(xi.effect.CONFRONTATION)
                             player:setLevel(ExistLvl)
                             player:setCharVar('[LPFWEvent] PlayerLevel', 0)
                             SetServerVariable('[LPFWEvent] PlayerCount', playercount - 1)
                elseif LPFWEvent == 0 and
                       player:getCharVar('[LPFWEvent] PlayerLevel') > 0 and
                       GetServerVariable('[LPFWEvent] PlayerCount') == 1 then
                       local ExistLvl = tonumber(player:getCharVar('[LPFWEvent] PlayerLevel'))
                             player:delStatusEffect(xi.effect.CONFRONTATION)
                             player:setLevel(ExistLvl)
                             player:setCharVar('[LPFWEvent] PlayerLevel', 0)
                             SetServerVariable('[LPFWEvent] PlayerCount', playercount - 1)
                             npc:setStatus(xi.status.DISAPPEAR)
                elseif LPFWEvent == 0 and
                       GetServerVariable('[LPFWEvent] PlayerCount') == 0 then
                             npc:setStatus(xi.status.DISAPPEAR)                      
                end
        end,
        releaseIdOnDisappear = true,
    })
    utils.unused(npcw)
 end


end
return commandObj
