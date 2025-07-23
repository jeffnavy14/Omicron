-----------------------------------
-- Simulant
-- Spire of Holla ENM30
-- !addkeyitem 670
-----------------------------------
local spireOfHollaID = zones[xi.zone.SPIRE_OF_HOLLA]
-----------------------------------

local content = Battlefield:new({
    zoneId           = xi.zone.SPIRE_OF_HOLLA,
    battlefieldId    = xi.battlefield.id.SIMULANT,
    maxPlayers       = 18,
    levelCap         = 30,
    timeLimit        = utils.minutes(30),
    index            = 1,
    entryNpc         = '_0h0',
    exitNpcs         = { '_0h1', '_0h2', '_0h3' },
    requiredKeyItems = { xi.ki.CENSER_OF_ABANDONMENT, message = spireOfHollaID.text.FADES_INTO_NOTHINGNESS },
    experimental     = true,
})

content.groups =
{
    {
        mobIds =
        {
            {
                spireOfHollaID.mob.COGITATOR,
            },

            {
                spireOfHollaID.mob.COGITATOR + 5,
            },

            {
                spireOfHollaID.mob.COGITATOR + 10,
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
