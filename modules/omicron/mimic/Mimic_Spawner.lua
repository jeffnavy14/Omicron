----------------------------------
-- Mimic Spawner 
----------------------------------
require("scripts/globals/status")
require("modules/module_utils")
require("scripts/globals/zone")
require("modules/omicron/mimic/Mimic")
-----------------------------------
local m = Module:new("mimic_spawn")
local spawnZones =
{
    "RuAun_Gardens",
    "Beadeaux",
    "Monastic_Cavern",
    "Castle_Oztroja",
    "The_Boyahda_Tree",
    "Temple_of_Uggalepih",
    "Den_of_Rancor",
    "Castle_Zvahl_Baileys",
	"Toraimarai_Canal",
    "Kuftal_Tunnel",
    "Sea_Serpent_Grotto",
    "VeLugannon_Palace",
    "The_Eldieme_Necropolis",
    "Crawlers_Nest",
    "Garlaige_Citadel",
    "Ifrits_Cauldron",
	"Quicksand_Caves",
}

for _, zoneName in pairs(spawnZones) do
m:addOverride(string.format("xi.zones.%s.Zone.onInitialize",zoneName), function(zone)
    super(zone)

	if
       GetServerVariable("[MimicHunt]") > 0 then
       SetServerVariable("[MimicHunt]", 0)
	end

	if
       GetServerVariable("[Found]") > 0 then
       SetServerVariable("[Found]", 0)
	end
end)
end

for _, zoneName in pairs(spawnZones) do
m:addOverride(string.format("xi.zones.%s.Zone.onZoneTick",zoneName), function(zone, player)
    super(zone)
	local spawn = math.random (1, 17)
	
	local mimicTable =
	{
	[ 1] = { 17309979 },
	[ 2] = { 17379783 },
	[ 3] = { 17391805 },
	[ 4] = { 17396144 },
	[ 5] = { 17404336 },
	[ 6] = { 17428497 },
	[ 7] = { 17432583 },
	[ 8] = { 17436965 },
	[ 9] = { 17469761 },
	[10] = { 17490230 },
	[11] = { 17498564 },
	[12] = { 17502567 },
	[13] = { 17576270 },
	[14] = { 17584426 },
	[15] = { 17596728 },
	[16] = { 17617157 },
	[17] = { 17629190 },
	}
	
    local mimic = mimicTable[spawn][1]
	if 
	  	GetServerVariable("[MimicHunt]") == 0 and             
        GetServerVariable("[Found]") == 0 
	then
		SetServerVariable("[MimicHunt]", mimic)
	end

	if 
	  	GetServerVariable("[MimicHunt]") == mimic and             
        GetServerVariable("[Found]") == 0 
	then
		SpawnMob(mimic)
    end
end)
end
return m

