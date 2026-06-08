local commandObj = {}

commandObj.cmdprops =
{
    permission = 1,
    parameters = 's'
}

local function error(player, msg)
    player:PrintToPlayer(msg)
    player:PrintToPlayer('!setgfvariable <player>')
end

commandObj.onTrigger = function(player, target)

local geaFeteNM =
{
    [xi.zone.ESCHA_RUAUN] =
    {
        { 'Bia' },
        { 'Ruea' },
        { 'Ma' },
        { 'Khon' },
        { 'Met' },
        { 'Khun' },
        { 'Wasserspeier' },
        { 'Emputa' },
        { 'Peirithoos' },
        { 'Asida' },
        { 'Tenodera' },
        { 'Sava_Savanovic' },
        { 'Palila' },
        { 'Hanbi' },
        { 'Yilan' },
        { 'Amymone' },
        { 'Naphula' },
        { 'Kammavaca' },
        { 'Pakecet' },
        { 'Duke_Vepar' },
        { 'Virava' },
        { 'Byakko' },
        { 'Genbu' },
        { 'Seiryu' },
        { 'Suzaku' },
        { 'Kouryu' }, -- Kirin
        { 'Ark_Angel_HM' },
        { 'Ark_Angel_TT' },
        { 'Ark_Angel_MR' },
        { 'Ark_Angel_EV' },
        { 'Ark_Angel_GK' },
        { 'Warder_of_Courage' },
    },

    [xi.zone.ESCHA_ZITAH] =
    {
        { 'Wepwawet' },
        { 'Lustful_Lydia' },
        { 'Aglaophotis' },
        { 'Tangata_Manu' },
        { 'Vidala' },
        { 'Gestalt' },
        { 'Angrboda' },
        { 'Cunnast' },
        { 'Revetaur' },
        { 'Ferrodon' },
        { 'Gulltop' },
        { 'Vyala' },
        { 'Blazewing' },
        { 'Bucca' },
        { 'Puca' },
        { 'Alpluachra' },
        { 'Pazuzu' },
        { 'Wrathare'},
        { 'Ionos' },
        { 'Sensual_Sandy' },
        { 'Nosoi' },
        { 'Brittlis' },
        { 'Kamohoalii' },
        { 'Umdhlebi' },
        { 'Fleetstalker' },
        { 'Shockmaw' },
        { 'Urmahlullu' },
    },

    [xi.zone.REISENJIMA] =
    {

        { 'Crom_Dubh' },
        { 'Golden_Kist' },
        { 'Mauve-wristed_Gomberry' },
        { 'Dazzling_Dolores' },
        { 'Taelmoth_the_Diremaw' },
        { 'Belphegor' },
        { 'Kabandha' },
        { 'Selkit' },
        { 'Sang_Buaya' },
        { 'Sabotender_Royal' },
        { 'Zduhac' },
        { 'Oryx' },
        { 'Strophadia' },
        { 'Gajasimha' },
        { 'Ironside' },
        { 'Sarsaok' },
        { 'Old_Shuck' },
        { 'Bashmu' },
        { 'Maju' },
        { 'Yakshi' },
        { 'Neak' },
        { 'Teles' },
        { 'Zerde' },
        { 'Vinipata' },
        { 'Schah' },
        { 'Albumen' },
        { 'Onychophora' },
        { 'Erinys' },
    }
}

    local function setGeaFeteNMBit(player)
        local zone = player:getZoneID()
        local tbl = geaFeteNM[zone]

        if not tbl then return end

        local varName = '[RoD]GeaFetesDefeated' .. zone
        local value = player:getCharVar(varName)

        for i = 1, #tbl do
            value = utils.mask.setBit(value, i - 1, true)
        end

        player:setCharVar(varName, value)
    end

    -- validate target
    local targ
    if target == nil then
        targ = player
    else
        targ = GetPlayerByName(target)
        if targ == nil then
            error(player, string.format('Player named "%s" not found!', target))
            return
        end
    end

    setGeaFeteNMBit(targ)

    targ:printToPlayer(string.format('%s now has all geas Fete kill counts, variable set to %s.', targ:getName(), targ:getCharVar('[RoD]GeaFetesDefeated'..player:getZoneID())))
end

return commandObj
