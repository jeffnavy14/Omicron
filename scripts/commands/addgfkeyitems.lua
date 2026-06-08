-----------------------------------
-- func: addallhp's'
-- desc: Adds all homepoints to the given player.
-----------------------------------
local commandObj = {}

commandObj.cmdprops =
{
    permission = 0,
    parameters = 's'
}

local function error(player, msg)
    player:PrintToPlayer(msg)
    player:PrintToPlayer('!addallhps <player>')
end

commandObj.onTrigger = function(player, target)
local grislyTrinkets =
{
    [xi.zone.ESCHA_RUAUN] =
    {
        { xi.ki.BIAS_GLOVE, 'Bia' },
        { xi.ki.RUEAS_STONE, 'Ruea' },
        { xi.ki.MAS_LANCE, 'Ma' },
        { xi.ki.KHONS_SCEPTER, 'Khon' },
        { xi.ki.METS_RING, 'Met' },
        { xi.ki.KHUNS_CROWN, 'Khun' },
        { xi.ki.WASSERSPEIERS_HORN, 'Wasserspeier' },
        { xi.ki.EMPUTAS_WING, 'Emputa' },
        { xi.ki.PEIRITHOOSS_HOOF, 'Peirithoos' },
        { xi.ki.ASIDAS_GEL, 'Asida' },
        { xi.ki.TENODERAS_SCYTHE, 'Tenodera' },
        { xi.ki.SAVA_SAVANOVICS_CAPE, 'Sava_Savanovic' },
        { xi.ki.PALILAS_TALON, 'Palila' },
        { xi.ki.HANBIS_NAIL, 'Hanbi' },
        { xi.ki.YILANS_SCALE, 'Yilan' },
        { xi.ki.AMYMONES_TOOTH, 'Amymone' },
        { xi.ki.NAPHULAS_BRACELET, 'Naphula' },
        { xi.ki.KAMMAVACAS_BINDING, 'Kammavaca' },
        { xi.ki.PAKECETS_BLUBBER, 'Pakecet' },
        { xi.ki.DUKE_VEPARS_SIGNET, 'Duke_Vepar' },
        { xi.ki.VIRAVAS_STALK, 'Virava' },
        { xi.ki.BYAKKOS_PRIDE, 'Byakko' },
        { xi.ki.GENBUS_HONOR, 'Genbu' },
        { xi.ki.SEIRYUS_NOBILITY, 'Seiryu' },
        { xi.ki.SUZAKUS_BENEFACTION, 'Suzaku' },
        { xi.ki.KIRINS_FERVOR, 'Kirin' },
        { xi.ki.ARK_ANGEL_HMS_COAT, 'Ark_Angel_HM' },
        { xi.ki.ARK_ANGEL_TTS_NECKLACE, 'Ark_Angel_TT' },
        { xi.ki.ARK_ANGEL_MRS_BUCKLE, 'Ark_Angel_MR' },
        { xi.ki.ARK_ANGEL_EVS_SASH, 'Ark_Angel_EV' },
        { xi.ki.ARK_ANGEL_GKS_BANGLE, 'Ark_Angel_GK' },
        { xi.ki.PRIMAL_NAZAR, 'Warder_of_Courage' },
    },
    [xi.zone.ESCHA_ZITAH] =
    {
        {xi.ki.WEPWAWETS_TOOTH, 'Wepwawet' },
        {xi.ki.LYDIAS_VINE, 'Lustful_Lydia' },
        {xi.ki.AGLAOPHOTIS_BUD, 'Aglaophotis' },
        {xi.ki.TANGATAS_WING, 'Tangata_Manu' },
        {xi.ki.VIDALAS_CLAW, 'Vidala' },
        {xi.ki.GESTALTS_RETINA, 'Gestalt' },
        {xi.ki.ANGRBODAS_NECKLACE, 'Angrboda' },
        {xi.ki.CUNNASTS_TALON, 'Cunnast' },
        {xi.ki.REVETAURS_HORN, 'Revetaur' },
        {xi.ki.FERRODONS_SCALE, 'Ferrodon' },
        {xi.ki.GULLTOPS_SHELL, 'Gulltop' },
        {xi.ki.VYALAS_PREY, 'Vyala' },
        {xi.ki.BLAZEWINGS_PINCER, 'Blazewing' },
        {xi.ki.COVENS_DUST, 'Alpluachra', 'Bucca', 'Puca' },
        {xi.ki.PAZUZUS_BLADE_HILT, 'Pazuzu' },
        {xi.ki.WRATHARES_CARROT, 'Wrathare'},
        {xi.ki.IONOSS_WEBBING, 'Ionos' },
        {xi.ki.SANDYS_LASHER, 'Sensual_Sandy' },
        {xi.ki.NOSOIS_FEATHER, 'Nosoi' },
        {xi.ki.BRITTLISS_RING, 'Brittlis' },
        {xi.ki.KAMOHOALIIS_FIN, 'Kamohoalii' },
        {xi.ki.UMDHLEBIS_FLOWER, 'Umdhlebi' },
        {xi.ki.FLEETSTALKERS_CLAW, 'Fleetstalker' },
        {xi.ki.SHOCKMAWS_BLUBBER, 'Shockmaw' },
        {xi.ki.URMAHLULLUS_ARMOR, 'Urmahlulu' },
    },
    [xi.zone.REISENJIMA] =
    {
        {xi.ki.BELPHEGORS_CROWN, 'Belphegor' },
        {xi.ki.CROM_DUBHS_HELM, 'Crom_Dubh' },
        {xi.ki.DAZZLING_DOLORESS_VINE, 'Dazzling_Dolores' },
        {xi.ki.GOLDEN_KISTS_KEY, 'Golden_Kist' },
        {xi.ki.KABANDHAS_WING, 'Kabandha' },
        {xi.ki.MAUVE_WRISTED_GOMBERRYS_KNIFE, 'Mauve-wristed_Gomberry' },
        {xi.ki.ORYXS_PLUMAGE, 'Oryx' },
        {xi.ki.SABOTENDER_ROYALS_NEEDLE, 'Sabotender_Royal' },
        {xi.ki.SANG_BUAYAS_TUSK, 'Sang_Buaya' },
        {xi.ki.SELKITS_PINCER, 'Selkit' },
        {xi.ki.TAELMOTHS_STAFF, 'Taelmoth_the_Diremaw' },
        {xi.ki.ZDUHACS_TALON, 'Zduhac' },
        {xi.ki.BASHMUS_TRINKET, 'Bashmu' },
        {xi.ki.GAJASIMHAS_MANE , 'Gajasimha' },
        {xi.ki.IRONSIDES_MAUL, 'Ironside' },
        {xi.ki.OLD_SHUCKS_TUFT, 'Old_Shuck' },
        {xi.ki.SARSAOKS_HOARD, 'Sarsaok' },
        {xi.ki.STROPHADIAS_PEARL, 'Strophadia' },
        {xi.ki.MAJUS_CLAW, 'Maju' },
        {xi.ki.NEAKS_TREASURE, 'Neak' },
        {xi.ki.YAKSHIS_SCROLL, 'Yakshi' },
        {xi.ki.ALBUMENS_FLOWER , 'Albumen' },
        {xi.ki.ERINYSS_BEAK , 'Erinys' },
        {xi.ki.ONYCHOPHORAS_SOIL , 'Onychophora' },
        {xi.ki.SCHAHS_GAMBIT , 'Schah' },
        {xi.ki.TELESS_HYMN , 'Teles' },
        {xi.ki.VINIPATAS_BLADE , 'Vinipata' },
        {xi.ki.ZERDES_CUP , 'Zerde' },
    }
}

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
    local playerZone = targ:getZoneID()
    -- add maps
    for _, v in ipairs(grislyTrinkets[playerZone]) do
        if not targ:hasKeyItem(v[1]) then
            targ:addKeyItem(v[1])
        end
    end

    targ:printToPlayer(string.format('%s now has all keys items for zone %s.', targ:getName(), targ:getZone():getName()))
end

return commandObj
