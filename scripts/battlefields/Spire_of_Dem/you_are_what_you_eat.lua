-----------------------------------
-- You Are What You Eat
-- Spire of Dem ENM30
-- !addkeyitem 671
-----------------------------------
local spireOfDemID = zones[xi.zone.SPIRE_OF_DEM]
-----------------------------------

local content = Battlefield:new({
    zoneId           = xi.zone.SPIRE_OF_DEM,
    battlefieldId    = xi.battlefield.id.YOU_ARE_WHAT_YOU_EAT,
    allowTrusts      = false,
    maxPlayers       = 18,
    levelCap         = 30,
    timeLimit        = utils.minutes(30),
    index            = 1,
    entryNpc         = '_0j0',
    exitNpcs         = { '_0j1', '_0j2', '_0j3' },
    requiredKeyItems = { xi.ki.CENSER_OF_ANTIPATHY, message = spireOfDemID.text.FADES_INTO_NOTHINGNESS },
    experimental     = true,
})

content.groups =
{
    {
        mobIds =
        {
            {
                spireOfDemID.mob.INGESTER,
            },

            {
                spireOfDemID.mob.INGESTER + 6,
            },

            {
                spireOfDemID.mob.INGESTER + 12,
            },
        },
    },
}

content.loot =
{
    {
        -- TODO: Loot
    },
}

return content:register()
