-----------------------------------
-- Undying Promise
-- Qu'Bia Arena BCNM40, Star Orb
-- !additem 1131
-----------------------------------
local qubiaID = zones[xi.zone.QUBIA_ARENA]
-----------------------------------

local content = Battlefield:new({
    zoneId        = xi.zone.QUBIA_ARENA,
    battlefieldId = xi.battlefield.id.UNDYING_PROMISE,
    maxPlayers    = 3,
    levelCap      = 40,
    timeLimit     = utils.minutes(15),
    index         = 12,
    entryNpc      = 'BC_Entrance',
    exitNpc       = 'Burning_Circle',
    requiredItems = { xi.item.STAR_ORB, wearMessage = qubiaID.text.A_CRACK_HAS_FORMED, wornMessage = qubiaID.text.ORB_IS_CRACKED },
    armouryCrates =
    {
        qubiaID.mob.GHUL_I_BEABAN + 2,
        qubiaID.mob.GHUL_I_BEABAN + 5,
        qubiaID.mob.GHUL_I_BEABAN + 8,
    },
})

content.groups =
{
    {
        mobIds =
        {
            { qubiaID.mob.GHUL_I_BEABAN     },
            { qubiaID.mob.GHUL_I_BEABAN + 3 },
            { qubiaID.mob.GHUL_I_BEABAN + 6 },
        },
    },

    {
        mobIds =
        {
            { qubiaID.mob.GHUL_I_BEABAN + 1 },
            { qubiaID.mob.GHUL_I_BEABAN + 4 },
            { qubiaID.mob.GHUL_I_BEABAN + 7 },
        },

        spawned = false,
    },
}

function content:onBattlefieldTick(battlefield, tick)
    Battlefield.onBattlefieldTick(self, battlefield, tick)

    -- If we have won, stop everything.
    if battlefield:getLocalVar('battlefieldWon') ~= 0 then
        return
    end

    local baseId = qubiaID.mob.GHUL_I_BEABAN + (battlefield:getArea() - 1) * 3

    local darkKnight = GetMobByID(baseId)
    if not darkKnight then
        return
    end

    local blackMage = GetMobByID(baseId + 1)
    if not blackMage then
        return
    end

    if
        darkKnight:isSpawned() or
        blackMage:isSpawned()
    then
        return
    end

    -- If we reach here, Ghul-I-Beaban is dead, get the position before he despawns
    local xPos = battlefield:getLocalVar('xPos') / 100 * (1 - 2 * battlefield:getLocalVar('xPosSign'))
    local yPos = battlefield:getLocalVar('yPos') / 100 * (1 - 2 * battlefield:getLocalVar('yPosSign'))
    local zPos = battlefield:getLocalVar('zPos') / 100 * (1 - 2 * battlefield:getLocalVar('zPosSign'))
    local rPos = battlefield:getLocalVar('rPos')

    -- Check how many times we've defeated Ghul-I-Beaban and spawn the appropriate job
    local deaths = battlefield:getLocalVar('deaths')

    if deaths < 3 then
        darkKnight:spawn()
        darkKnight:setPos(xPos, yPos, zPos, rPos)
        return
    elseif deaths < 5 then
        blackMage:spawn()
        blackMage:setPos(xPos, yPos, zPos, rPos)
        return
    end

    -- If we make it all the way here, we win
    battlefield:setLocalVar('battlefieldWon', 1)
    content:handleAllMonstersDefeated(battlefield)
end

content.loot =
{
    {
        { itemId = xi.item.GIL,                   weight = 1000, amount = 5000 },
    },

    {
        { itemId = xi.item.CALVELEYS_DAGGER,      weight = 100 },
        { itemId = xi.item.JONGLEURS_DAGGER,      weight = 100 },
        { itemId = xi.item.KAGEHIDE,              weight = 100 },
        { itemId = xi.item.OHAGURO,               weight = 100 },
        { itemId = xi.item.JENNET_SHIELD,         weight = 400 },
        { itemId = xi.item.BLACK_ROCK,            weight =  10 },
        { itemId = xi.item.BLUE_ROCK,             weight =  10 },
        { itemId = xi.item.GREEN_ROCK,            weight =  10 },
        { itemId = xi.item.PURPLE_ROCK,           weight =  10 },
        { itemId = xi.item.RED_ROCK,              weight =  10 },
        { itemId = xi.item.TRANSLUCENT_ROCK,      weight =  10 },
        { itemId = xi.item.WHITE_ROCK,            weight =  10 },
        { itemId = xi.item.YELLOW_ROCK,           weight =  10 },
        { itemId = xi.item.AMETRINE,              weight =  10 },
        { itemId = xi.item.BLACK_PEARL,           weight =  10 },
        { itemId = xi.item.GARNET,                weight =  10 },
        { itemId = xi.item.GOSHENITE,             weight =  10 },
        { itemId = xi.item.PEARL,                 weight =  10 },
        { itemId = xi.item.PERIDOT,               weight =  10 },
        { itemId = xi.item.SPHENE,                weight =  10 },
        { itemId = xi.item.TURQUOISE,             weight =  10 },
        { itemId = xi.item.MYTHRIL_BEASTCOIN,     weight =  10 },
        { itemId = xi.item.ROSEWOOD_LOG,          weight =  10 },
        { itemId = xi.item.OAK_LOG,               weight =  10 },
        { itemId = xi.item.VILE_ELIXIR,           weight =  10 },
    },

    {
        { itemId = xi.item.BEHOURD_LANCE,         weight = 100 },
        { itemId = xi.item.MUTILATOR,             weight = 100 },
        { itemId = xi.item.RAIFU,                 weight = 100 },
        { itemId = xi.item.TOURNEY_PATAS,         weight = 100 },
        { itemId = xi.item.ELEGANT_SHIELD,        weight = 400 },
        { itemId = xi.item.BLACK_ROCK,            weight =  10 },
        { itemId = xi.item.BLUE_ROCK,             weight =  10 },
        { itemId = xi.item.GREEN_ROCK,            weight =  10 },
        { itemId = xi.item.PURPLE_ROCK,           weight =  10 },
        { itemId = xi.item.RED_ROCK,              weight =  10 },
        { itemId = xi.item.TRANSLUCENT_ROCK,      weight =  10 },
        { itemId = xi.item.WHITE_ROCK,            weight =  10 },
        { itemId = xi.item.YELLOW_ROCK,           weight =  10 },
        { itemId = xi.item.AMETRINE,              weight =  10 },
        { itemId = xi.item.BLACK_PEARL,           weight =  10 },
        { itemId = xi.item.GARNET,                weight =  10 },
        { itemId = xi.item.GOSHENITE,             weight =  10 },
        { itemId = xi.item.PEARL,                 weight =  10 },
        { itemId = xi.item.PERIDOT,               weight =  10 },
        { itemId = xi.item.SPHENE,                weight =  10 },
        { itemId = xi.item.TURQUOISE,             weight =  10 },
        { itemId = xi.item.MYTHRIL_BEASTCOIN,     weight =  10 },
        { itemId = xi.item.ROSEWOOD_LOG,          weight =  10 },
        { itemId = xi.item.OAK_LOG,               weight =  10 },
        { itemId = xi.item.RERAISER,              weight =  10 },
    },

    {
        { itemId = xi.item.SCROLL_OF_ICE_SPIKES,  weight = 300 },
        { itemId = xi.item.SCROLL_OF_REFRESH,     weight = 200 },
        { itemId = xi.item.SCROLL_OF_UTSUSEMI_NI, weight = 200 },
        { itemId = xi.item.EBONY_LOG,             weight = 300 },
    },

    {
        { itemId = xi.item.FIRE_SPIRIT_PACT,      weight = 200 },
        { itemId = xi.item.SCROLL_OF_ABSORB_STR,  weight = 100 },
        { itemId = xi.item.SCROLL_OF_ERASE,       weight = 200 },
        { itemId = xi.item.SCROLL_OF_PHALANX,     weight = 200 },
        { itemId = xi.item.GOLD_INGOT,            weight = 150 },
        { itemId = xi.item.DARKSTEEL_INGOT,       weight = 150 },
    },

    {
        quantity = 2,
        { itemId = xi.item.BONE_CHIP, weight = 1000 },
    },
}

return content:register()
