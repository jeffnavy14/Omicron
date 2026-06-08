-----------------------------------
--  Geas Fete
-----------------------------------
xi = xi or {}
xi.geasFete = xi.geasFete or {}
xi.registerOfDeeds = xi.registerOfDeeds or {}
xi.geasFeteNPC = xi.geasFeteNPC or {}
xi.emblazonedReliquary = xi.emblazonedReliquary or {}
--------------------------------------------------------------
--------- QM NPC
--------------------------------------------------------------

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
        {xi.ki.URMAHLULLUS_ARMOR, 'Urmahlullu' },
    },
    [xi.zone.REISENJIMA] =
    {
        {xi.ki.CROM_DUBHS_HELM, 'Crom_Dubh' },
        {xi.ki.GOLDEN_KISTS_KEY, 'Golden_Kist' },
        {xi.ki.MAUVE_WRISTED_GOMBERRYS_KNIFE, 'Mauve-wristed_Gomberry' },
        {xi.ki.DAZZLING_DOLORESS_VINE, 'Dazzling_Dolores' },
        {xi.ki.TAELMOTHS_STAFF, 'Taelmoth_the_Diremaw' },
        {xi.ki.BELPHEGORS_CROWN, 'Belphegor' },
        {xi.ki.KABANDHAS_WING, 'Kabandha' },
        {xi.ki.SELKITS_PINCER, 'Selkit' },
        {xi.ki.SANG_BUAYAS_TUSK, 'Sang_Buaya' },
        {xi.ki.SABOTENDER_ROYALS_NEEDLE, 'Sabotender_Royal' },
        {xi.ki.ZDUHACS_TALON, 'Zduhac' },
        {xi.ki.ORYXS_PLUMAGE, 'Oryx' },
        {xi.ki.STROPHADIAS_PEARL, 'Strophadia' },
        {xi.ki.GAJASIMHAS_MANE , 'Gajasimha' },
        {xi.ki.IRONSIDES_MAUL, 'Ironside' },
        {xi.ki.SARSAOKS_HOARD, 'Sarsaok' },
        {xi.ki.OLD_SHUCKS_TUFT, 'Old_Shuck' },
        {xi.ki.BASHMUS_TRINKET, 'Bashmu' },
        {xi.ki.MAJUS_CLAW, 'Maju' },
        {xi.ki.YAKSHIS_SCROLL, 'Yakshi' },
        {xi.ki.NEAKS_TREASURE, 'Neak' },
        {xi.ki.TELESS_HYMN , 'Teles' },
        {xi.ki.ZERDES_CUP , 'Zerde' },
        {xi.ki.VINIPATAS_BLADE , 'Vinipata' },
        {xi.ki.SCHAHS_GAMBIT , 'Schah' },
        {xi.ki.ALBUMENS_FLOWER , 'Albumen'},
        {xi.ki.ONYCHOPHORAS_SOIL , 'Onychophora' },
        {xi.ki.ERINYSS_BEAK , 'Erinys' },
        --[[
        {xi.ki.ZERDES_CUP , 'Zerde', 'Zerdes_Haupia', 'Zerdes_Kacamak', 'Zerdes_Drisheen' }, -- not counting all the mobs, 1 mob dies on his own, suppose to spawn 4
        {xi.ki.VINIPATAS_BLADE , 'Vinipata', 'Vinipatas_Naraka' }, -- suppose to spawn 2
        {xi.ki.SCHAHS_GAMBIT , 'Schah', 'Schahs_Mantri', 'Schahs_Ratha', 'Schahs_Gaja', 'Schahs_Ashva', 'Schahs_Bhata', 'Schahs_Mantri' }, -- suppose to start spawning after 30 seconds
        {xi.ki.ALBUMENS_FLOWER , 'Albumen', 'Albumens_Mandragora', 'Albumens_Lycopodium', 'Albumens_Korrigan', 'Albumens_Pachypodium' }, -- Spawns with four adds, Albumen spawns an additional set of four adds at specific time intervals of ~2 minutes apart
        {xi.ki.ONYCHOPHORAS_SOIL , 'Onychophora', 'Onycophoras_Sandworm' }, -- Spawns Onychophora's Sandworm after any Skillchain is performed on it
        {xi.ki.ERINYSS_BEAK , 'Erinys', 'Boobrie' }, -- spawns 5 at the begining of the fight
        ]]--
    }
}

local geasFeteText =
{
    [xi.zone.ESCHA_RUAUN] = -- 288
    {
        CONTENT_LEVEL            = 7018, -- <1F:7B>The level of difficulty for this content is {0}.<7F31>
        BATTLE_DISTANCE_TOFAR    = 7335, -- <1F:7B>You have ventured too far from the field of battle.\x07You will be automatically relieved of Voidwatcher status if you do not return.<7F31>
        BATTLE_STATUS_REMOVED    = 7336, -- You have ventured too far from the field of battle.\x07Voidwatcher status revoked.<7F31>
        BATTLE_DISTANCE_RETURNED = 7337, -- You have returned to the field of battle.<7F31>
        BATTLE_TIME              = 7338, -- You have {0} {0:pluralSelect}[minute/minutes] (Earth time) to complete the battle.<7F31>
        REMAINING_TIME_MINUTES   = 7339, -- You have {0} {0:pluralSelect}[minute/minutes] (Earth time) remaining to complete the battle.<7F31>
        REMAINING_TIME_SECONDS   = 7340, -- You have only {0} {0:pluralSelect}[second/seconds] (Earth time) remaining.<7F31>
        MOB_DESPAWNS             = 7342, -- The monster fades before your eyes, a look of disappointment on its face.<7F31>
        GF_INITIAL_DIALOG_1      = 7618, -- Unreal, isn't it?<7F31>
        GF_INITIAL_DIALOG_2      = 7619, -- You ever seen anything quite like this place?<7F31>
        GF_INITIAL_DIALOG_3      = 7620, -- The name's Dremi. Yours?<7F31>
        GF_INITIAL_DIALOG_4      = 7621, -- {player:name}, eh?\x07Heh, I'll have to remember that one.<7F31>
        GF_INITIAL_DIALOG_5      = 7622, -- I'm here on behalf of the Tenshodo.<7F31>
        GF_INITIAL_DIALOG_6      = 7623, -- My job here is to brief adventurers like you on the latest details in the area, and of course, do some business while I'm at it.<7F31>
        GF_INITIAL_DIALOG_7      = 7624, -- I've got some items here you can't get anywhere else. Items you'll need if you want to survive in this place. All it takes is a bit of silt and I'm sure you and I will get along fine.<7F31>
        NOT_PTY_LEADER           = 7684, -- <1F:7B>You are not the party leader.<7F31>
        MEMBER_OUT_OF_ZONE       = 7685, -- <1F:7B>One or more members of your party are not in the appropriate staging zone.<7F31>
        ALL_MEMBERS_DEAD         = 7692, -- <1F:7B>All party members have been knocked out. Leaving the battle in {0} minute{0:pluralSelect}[/s].<7F31>
        LEADER_COMMENCE_BATTLE   = 7693, -- <1F:7B>Your party leader is attempting to commence a battle.<7F31>
        MISSING_KEY_ITEM         = 7822, -- You will be able to engage in combat here if you possess <0105:36,82,80,80,80> and a grisly trinket.<7F31>
        LOSE_KEYITEM             = 7823, -- The <0105:33,82,80,80,80> {1:select}[disappears/and the grisly trinket disappear]!<7F31>
        MEMBER_NO_KEYITEM        = 7832, -- <1F:7B>One or more party members do not possess <0105:36,82,80,80,80>.<7F31>
    },
    [xi.zone.ESCHA_ZITAH] = -- 289
    {
        CONTENT_LEVEL            = 7018, -- <1F:7B>The level of difficulty for this content is {0}.<7F31>
        BATTLE_DISTANCE_TOFAR    = 7335, -- <1F:7B>You have ventured too far from the field of battle.\x07You will be automatically relieved of Voidwatcher status if you do not return.<7F31>
        BATTLE_STATUS_REMOVED    = 7336, -- You have ventured too far from the field of battle.\x07Voidwatcher status revoked.<7F31>
        BATTLE_DISTANCE_RETURNED = 7337, -- You have returned to the field of battle.<7F31>
        BATTLE_TIME              = 7338, -- You have {0} {0:pluralSelect}[minute/minutes] (Earth time) to complete the battle.<7F31>
        REMAINING_TIME_MINUTES   = 7339, -- You have {0} {0:pluralSelect}[minute/minutes] (Earth time) remaining to complete the battle.<7F31>
        REMAINING_TIME_SECONDS   = 7340, -- You have only {0} {0:pluralSelect}[second/seconds] (Earth time) remaining.<7F31>
        MOB_DESPAWNS             = 7342, -- The monster fades before your eyes, a look of disappointment on its face.<7F31>
        GF_INITIAL_DIALOG_1      = 7465, -- Soon as I set foot in this place I knew I was in fer a treat, but boy, word spreads fast to these adventurer types...<7F31>
        GF_INITIAL_DIALOG_2      = 7466, -- Urk... Me? I'm, uh...Affi. And what does an ugly mug like you call yerself?<7F31>
        GF_INITIAL_DIALOG_3      = 7467, -- {player:name}? Bwahaha, a better adventurer's name I've never heard!<7F31>
        GF_INITIAL_DIALOG_4      = 7468, -- Surely you know what the Tenshodo is, {player:name}? Well, they sent me off to what was supposed to be this Goddessfersaken land...but there's far more coin to make out here than I've imagined.<7F31>
        GF_INITIAL_DIALOG_5      = 7469, -- So loosen up your purse strings, because I've got sundries aplenty!<7F31>
        GF_INITIAL_DIALOG_6      = 7470, -- Aye, I say “coin to make,” but that's a bit more metaphori-whatsit than physical. What I'm lookin' fer isn't gil, but a special substance known as “escha silt.”<7F31>
        GF_INITIAL_DIALOG_7      = 7471, -- Dun' worry if you don't have any on you right now. Just go bash some skulls in over yonder, and you'll surely be able to...procure some from the corpses of the fallen.<7F31>
        NOT_PTY_LEADER           = 7803, -- <1F:7B>You are not the party leader.<7F31>
        MEMBER_OUT_OF_ZONE       = 7804, -- <1F:7B>One or more members of your party are not in the appropriate staging zone.<7F31>
        ALL_MEMBERS_DEAD         = 7811, -- <1F:7B>All party members have been knocked out. Leaving the battle in {0} minute{0:pluralSelect}[/s].<7F31>
        LEADER_COMMENCE_BATTLE   = 7812, -- <1F:7B>Your party leader is attempting to commence a battle.<7F31>
        MISSING_KEY_ITEM         = 7703, -- You will be able to engage in combat here if you possess <0105:36,82,80,80,80> and a grisly trinket.<7F31>
        LOSE_KEYITEM             = 7704, -- The <0105:33,82,80,80,80> {1:select}[disappears/and the grisly trinket disappear]!<7F31>
        MEMBER_NO_KEYITEM        = 7713, -- <1F:7B>One or more party members do not possess <0105:36,82,80,80,80>.<7F31>
    },
    [xi.zone.REISENJIMA] = -- 291
    {
        CONTENT_LEVEL            = 7018, -- <1F:7B>The level of difficulty for this content is {0}.<7F31>
        BATTLE_DISTANCE_TOFAR    = 7335, -- <1F:7B>You have ventured too far from the field of battle.\x07You will be automatically relieved of Voidwatcher status if you do not return.<7F31>
        BATTLE_STATUS_REMOVED    = 7336, -- You have ventured too far from the field of battle.\x07Voidwatcher status revoked.<7F31>
        BATTLE_DISTANCE_RETURNED = 7337, -- You have returned to the field of battle.<7F31>
        BATTLE_TIME              = 7338, -- You have {0} {0:pluralSelect}[minute/minutes] (Earth time) to complete the battle.<7F31>
        REMAINING_TIME_MINUTES   = 7339, -- You have {0} {0:pluralSelect}[minute/minutes] (Earth time) remaining to complete the battle.<7F31>
        REMAINING_TIME_SECONDS   = 7340, -- You have only {0} {0:pluralSelect}[second/seconds] (Earth time) remaining.<7F31>
        MOB_DESPAWNS             = 7342, -- The monster fades before your eyes, a look of disappointment on its face.<7F31>
        GF_INITIAL_DIALOG_1      = 7718, -- Hey, Man{player:gender:select}[/-lady], you come here! Shiftrix knew it, hehehe.<7F31>
        GF_INITIAL_DIALOG_2      = 7719, -- This is Shiftrix. Shiftrix sell things. People come to island-rock, buy things from Shiftrix. Man-person from Tenshodo say so.<7F31>
        GF_INITIAL_DIALOG_3      = 7720, -- Is Shiftrix from Tenshodo? Who cares? Doesn't matter.<7F31>
        GF_INITIAL_DIALOG_4      = 7721, -- Shiftrix sell anyway.<7F31>
        GF_INITIAL_DIALOG_5      = 7722, -- If Man{player:gender:select}[/-lady] want buy, need escha silt.<7F31>
        GF_INITIAL_DIALOG_6      = 7723, -- Man{player:gender:select}[/-lady] get silt from monsters. Clobber monsters, get silt. Then trade with Shiftrix.<7F31>s
        NOT_PTY_LEADER           = 7830, -- <1F:7B>You are not the party leader.<7F31>
        MEMBER_OUT_OF_ZONE       = 7831, -- <1F:7B>One or more members of your party are not in the appropriate staging zone.<7F31>
        ALL_MEMBERS_DEAD         = 7838, -- <1F:7B>All party members have been knocked out. Leaving the battle in {0} minute{0:pluralSelect}[/s].<7F31>
        LEADER_COMMENCE_BATTLE   = 7839, -- <1F:7B>Your party leader is attempting to commence a battle.<7F31>
        MISSING_KEY_ITEM         = 7849, -- You will be able to engage in combat here if you possess <0105:36,82,80,80,80> and a grisly trinket.<7F31>
        LOSE_KEYITEM             = 7850, -- The <0105:33,82,80,80,80> {1:select}[disappears/and the grisly trinket disappear]!<7F31>
        MEMBER_NO_KEYITEM        = 7859, -- <1F:7B>One or more party members do not possess <0105:36,82,80,80,80>.<7F31>
    }
}

--[[ TODO
*** status effect is also level restriction icon why??? tested and seems to be no effect, possibly level restrict to 99 for future level adjustments???
*** set up fencing 50y and remove mobs visually for those players who are ingaged in content, reappear when status effect wears

*** what happens if all three mob ids are summoned? what message do you get?

]]--

local zoneBlessings = -- TODO get verification on adjustments
{
    [1] = { adjustment = .5, bitIndex = 11 }, -- Temperance Halves the silt cost of Eschan Portals. (50 silt) **** need to adjust portals params, rightnow it already says 50
    [2] = { adjustment = 2, bitIndex = 12 }, -- Fortitude Increases effects of Vorseals that increase base stats.
    [3] = { adjustment = 2, bitIndex = 13 }, -- Piety Doubles the effect duration of Vorseals.
    [4] = { adjustment = 1, bitIndex = 14 }, -- Justice Increases "Treasure Hunter" by 1.
    [5] = { adjustment = 2, bitIndex = 15 }, -- Hope Increases the chances of an emblazoned reliquary appearing. ****** Need to code these chests and drops & confirm rate increase
    [6] = { adjustment = 2, bitIndex = 16 }, -- Wisdom	Doubles the effect duration of food
    [7] = { adjustment = 2, bitIndex = 17 }, -- Compassion	Increases the "Refresh," "Regen," and "Accuracy++" effects of Vorseals
    [8] = { adjustment = 2, bitIndex = 18 }, -- Dignity Increases escha silt yields.
    [9] = { adjustment = 2, bitIndex = 19 }, -- Loyalty Increases escha bead yields.
    [10] = { adjustment = 0, bitIndex = 20 }, -- Mercy	Key Item Reapers and Key Item tribulenses have a chance of not being consumed. ****** Need to confirm rate increase
    [11] = { adjustment = 2, bitIndex = 21 }, -- Courage Increases the "Rare enemy+" effects of Vorseals. ****** Need to confirm rate increase
}

local function mobScaling(mob)
    local lvl = mob:getMainLvl()
    if lvl < 119 then return end

    local delta = lvl - 117 -- adjust deltas below for increased scaling if content level is increased in the future

    local ATT  = 100  + delta * 70
    local DEF  = 100  + delta * 22
    local ACC  = 100  + delta * 40
    local EVA  = 150  + delta * 13
    local MATT = 150  + delta * 5
    local MDEF = 150  + delta * 29
    local MACC = 150  + delta * 40
    local MEVA = 150  + delta * 17
    local HASTE = math.floor(6 + delta * 0.5)

    mob:addMod(xi.mod.ATT, ATT)
    mob:addMod(xi.mod.RATT, ATT)
    mob:addMod(xi.mod.DEF, DEF)
    mob:addMod(xi.mod.ACC, ACC)
    mob:addMod(xi.mod.RACC, ACC)
    mob:addMod(xi.mod.EVA, EVA)
    mob:addMod(xi.mod.MATT, MATT)
    mob:addMod(xi.mod.MDEF, MDEF)
    mob:addMod(xi.mod.MACC, MACC)
    mob:addMod(xi.mod.MEVA, MEVA)
    mob:addMod(xi.mod.HASTE_MAGIC, HASTE)
    mob:addMod(xi.mod.DMG, math.floor((lvl - 118) * 250))
    mob:addMod(xi.mod.HPP, 100)
    mob:updateHealth()
    mob:setHP(mob:getMaxHP())

    local statBonus = math.floor(150 + delta * 10)
    mob:addMod(xi.mod.STR, statBonus)
    mob:addMod(xi.mod.DEX, statBonus)
    mob:addMod(xi.mod.VIT, statBonus)
    mob:addMod(xi.mod.AGI, statBonus)
    mob:addMod(xi.mod.INT, statBonus)
    mob:addMod(xi.mod.MND, statBonus)
    mob:addMod(xi.mod.CHR, statBonus)

    local statusResMods = {
        xi.mod.SLEEPRES, xi.mod.POISONRES, xi.mod.PARALYZERES,
        xi.mod.BLINDRES, xi.mod.SILENCERES, xi.mod.VIRUSRES,
        xi.mod.PETRIFYRES, xi.mod.BINDRES, xi.mod.CURSERES,
        xi.mod.GRAVITYRES, xi.mod.SLOWRES, xi.mod.STUNRES,
        xi.mod.CHARMRES, xi.mod.AMNESIARES, xi.mod.LULLABYRES,
        xi.mod.DEATHRES, xi.mod.STATUSRES,
    }

    local baseRes = math.floor(40 + (delta ^ 1.2) * 4)

    for _, mod in ipairs(statusResMods) do
        mob:addMod(mod, baseRes)
    end

    if lvl >= 126 then
        local regen = math.floor((lvl - 125) * 7)
        mob:addMod(xi.mod.REGEN, regen)
        mob:addMod(xi.mod.REFRESH, regen)
        mob:addMod(xi.mod.FASTCAST, math.floor((lvl - 125) * 0.5))
    end

    if lvl >= 131 then
        local regain = math.floor((lvl - 130) * 3)
        mob:addMod(xi.mod.REGAIN, regain)
    end
end

function customMobScaling(mob)
    mobScaling(mob)
end

local function getInitialKI(player)
    local initialKeyItem = true
    local party = player:getParty()

    for _, member in pairs(party) do
        if member:hasKeyItem(xi.ki.TRIBULENS) or -- Key Item 2894
           member:hasKeyItem(xi.ki.RADIALENS) then -- Key Item 3031
               initialKeyItem = true
        else
            initialKeyItem = false
        end
    end
    return initialKeyItem
end

local function checkRequirements(player, npc)
    local zone = player:getZoneID()
    local textID = geasFeteText[zone]
    local initialRequirement = true
    local alliance = player:getAlliance()
    local leader = player:getLeaderID()
    local initialKI = getInitialKI(player)

    if leader ~= player:getID() then
        player:messageSpecial(textID.NOT_PTY_LEADER) -- You are not the party leader
        initialRequirement = false
    end

    if leader == player:getID() then
        if player:hasKeyItem(xi.ki.TRIBULENS) or
           player:hasKeyItem(xi.ki.RADIALENS) then
        else
            GetPlayerByID(leader):messageSpecial(textID.MISSING_KEY_ITEM,xi.ki.TRIBULENS) -- Need Tribulens, Radialens or Grisly Trinket Key Item
            return
        end
    end

    local noKeyItem = 0
    local keyItemCount = 0

    if leader == player:getID() then
        for _, keyItem in pairs(grislyTrinkets[zone]) do
            keyItemCount = keyItemCount +1

            if not player:hasKeyItem(keyItem[1]) then
                noKeyItem = noKeyItem +1
            end
        end
    end

    if noKeyItem == keyItemCount then
        GetPlayerByID(leader):messageSpecial(textID.MISSING_KEY_ITEM) -- Need Tribulens, Radialens or Grisly Trinket Key Item
        initialRequirement = false
        return
    end

    for _, member in pairs(alliance) do
        if member:checkDistance(npc) >= 50 then
            GetPlayerByID(leader):messageSpecial(textID.MEMBER_OUT_OF_ZONE) -- one or more members of your party are not in the appropriate zone
            initialRequirement = false
            return
        end
    end

    if initialKI == false then
        GetPlayerByID(leader):messageSpecial(textID.MEMBER_NO_KEYITEM,xi.ki.TRIBULENS) -- One or more party members do not possess a tribulens
        initialRequirement = false
    end

    return initialRequirement
end

local function getGeaFatesKI(player)
    local playerZone = player:getZoneID()
    local erKeyItems = 0
        for i = 1, #grislyTrinkets[playerZone] do
            erKeyItems = utils.mask.setBit(erKeyItems, i -1, player:hasKeyItem(grislyTrinkets[playerZone][i][1]))
        end
    return erKeyItems
end

local function getGeasFetesPurchasedKI(player)
    local playerZone = player:getZoneID()
    local purKeyItems = 0

    local zoneTable = grislyTrinkets[playerZone]
    if not zoneTable then
        return 0
    end

    local max = math.min(#zoneTable, 12)

    for i = 1, max do
        local keyItemId = zoneTable[i][1]

        if player:hasKeyItem(keyItemId) then
            purKeyItems = purKeyItems + (2 ^ (i - 1))
        end
    end

    return purKeyItems
end

local function deleteInitialKI(player)
    local party = player:getParty()
    local zone = player:getZoneID()
    local textID = geasFeteText[zone]
    -- After testing, only party members get dialog about KI disappearing not leader
    -- if player:hasKeyItem(xi.ki.TRIBULENS) then
    --     player:messageSpecial(7822,xi.ki.TRIBULENS,1) -- Tribulens & Trinket disappear
    -- end

    for _, member in pairs(party) do
        if member:hasKeyItem(xi.ki.TRIBULENS) then
            member:delKeyItem(xi.ki.TRIBULENS)
            member:messageSpecial(textID.LOSE_KEYITEM,xi.ki.TRIBULENS) -- Tribulens disappear
            member:messageSpecial(textID.BATTLE_TIME,15) -- 15 minutes to kill
        end
    end
end

local function getMemberCount(player)
    local alliance = player:getAlliance()
    if not alliance then
        return 1
    end
    return #alliance
end

local function getDeadPlayerCount(player)
    local alliance = player:getAlliance()
    local isDead = 0
    for _, participant in ipairs(alliance) do
        if not participant:isAlive() then
            isDead = isDead + 1
        end
    end
    return isDead
end

xi.geasFete.getTimeOfBattle = function(mob)
    local zone = mob:getZoneID()
    local textID = geasFeteText[zone]
    local target = mob:getTarget()
    if not target then return end
    if not target:isAlive() then return end
    local alliance = target:getAlliance()
    if not alliance then return end
    local now = os.time()

    local notificationTimes =
    {
        { offset = 300, var = "Notified_10min", text = textID.REMAINING_TIME_MINUTES, arg = 10 },
        { offset = 600, var = "Notified_5min",  text = textID.REMAINING_TIME_MINUTES, arg = 5  },
        { offset = 840, var = "Notified_1min",  text = textID.REMAINING_TIME_MINUTES, arg = 1  },
        { offset = 870, var = "Notified_30sec", text = textID.REMAINING_TIME_SECONDS, arg = 30 },
        { offset = 885, var = "Notified_15sec", text = textID.REMAINING_TIME_SECONDS, arg = 15 },
    }

    local startTime = mob:getLocalVar('Kill_Notification')

    for _, data in ipairs(notificationTimes) do
        if now >= (startTime + data.offset) and mob:getLocalVar(data.var) == 0 then
            for _, member in ipairs(alliance) do
                if member:isPC() then
                    member:messageSpecial(data.text, data.arg)
                end
            end
            mob:setLocalVar(data.var, 1)
        end
    end

end

xi.geasFete.getTimeofBattle = function(mob)
    -- Deprecated in favor of getTimeOfBattle. This is a compatibility shim.
    -- This can be removed once all calls are updated.
    xi.geasFete.getTimeOfBattle(mob)
end

xi.geasFete.buildFencing = function(player, mob)

    local objective = {
        countdown = {
            duration = 900,
            warning = 30
        },

        fence = {
            pos = { x = mob:getXPos(), z = mob:getZPos() }, -- center of fence
            radius = 50.00, -- radius from pos in yalms
            render = 10.00, -- distance from fence it becomes visible
            blue = false -- optional, turns default red fence bars blue
        },
    }

    player:objectiveUtility(objective)
end

local function checkPlayerDistance(player) -- possibly move this into the status effect of level restriction
    local geasFeteQM = player:getLocalVar('GEASFEAT_QM')
    local zone = player:getZoneID()
    local textID = geasFeteText[zone]

    if player:getObjType() == xi.objType.PC then
        if player:getLocalVar('[GEASFETE]Status') ~= 1 then
            if player:checkDistance(GetNPCByID(geasFeteQM)) > 50 then
                player:messageSpecial(textID.BATTLE_DISTANCE_TOFAR)
                player:setLocalVar('[GEASFETE]Status', 1)
                    player:timer(10000, function(playerArg) -- 10 seconds to return to arena
                        if playerArg:getLocalVar('[GEASFETE]Status') == 1 then
                            playerArg:delStatusEffect(xi.effect.CONFRONTATION)
                            playerArg:messageSpecial(textID.BATTLE_STATUS_REMOVED)
                            playerArg:removeListener('GEASFETE_TICK')

                            if playerArg:isPC() then
                                playerArg:countdown()
                            end
                        end
                    end)
            end
        elseif player:getLocalVar('[GEASFETE]Status') ~= 0 then
            if player:checkDistance(GetNPCByID(geasFeteQM)) < 50 then
                player:messageSpecial(textID.BATTLE_DISTANCE_RETURNED)
                player:setLocalVar('[GEASFETE]Status', 0)
            end
        end
    end
end

-----------------------------------
-- Battle Registration Helpers
-----------------------------------

-- Centralized function to attach standard Geas Fete logic to a mob
xi.geasFete.registerBattleListeners = function(mob, player, npc)
    local qmId = npc:getID()
    local textID = geasFeteText[npc:getZoneID()]

    mob:addListener('COMBAT_TICK', 'MOB_TIMER_' .. mob:getID(), function(mobArg)
        xi.geasFete.getTimeOfBattle(mobArg)
        if mobArg:getLocalVar('Kill_Timer') < os.time() then
            DespawnMob(mobArg:getID())
        end
    end)

    mob:addListener('DEATH', 'COUNTDOWN_TIMER' .. mob:getID(), function(mobArg)
        if mobArg:getLocalVar("DeathHandled") == 1 then
            return
        end
        mobArg:setLocalVar("DeathHandled", 1)

        local count = npc:getLocalVar('MobCount') - 1
        npc:setLocalVar('MobCount', count)

        if count <= 0 then
            if npc:getLocalVar("Finished") == 1 then
                return
            end
            npc:setLocalVar("Finished", 1)
            npc:setStatus(xi.status.NORMAL)

            for _, member in pairs(mobArg:getZone():getPlayers()) do
                if member:getLocalVar('GEASFEAT_QM') == qmId then
                    member:countdown()
                    member:delStatusEffect(xi.effect.CONFRONTATION)
                    member:removeListener('GEASFETE_TICK')
                    member:setLocalVar('GEASFEAT_QM', 0)
                end
            end
        end
    end)

    mob:addListener('DESPAWN', 'QM_' .. qmId, function(mobArg)
        -- Only trigger if despawning alive (e.g., timeout) and not transforming (like Kirin)
        if mobArg:getHP() > 0 and mobArg:getLocalVar("Transforming") == 0 then
            local count = npc:getLocalVar('MobCount') - 1
            npc:setLocalVar('MobCount', math.max(count, 0))
            if count <= 0 then
                npc:setLocalVar('MobCount', 0)
                npc:setStatus(xi.status.NORMAL)

                for _, member in pairs(mobArg:getZone():getPlayers()) do
                    if member:getLocalVar('GEASFEAT_QM') == qmId then
                        if member:isPC() then
                            member:messageSpecial(textID.MOB_DESPAWNS)
                            member:countdown()
                        end
                        member:delStatusEffect(xi.effect.CONFRONTATION)
                        member:removeListener('GEASFETE_TICK')
                        member:setLocalVar('GEASFEAT_QM', 0)
                    end
                end
            end
        end
    end)
end

-- Spawns an add that inherits the current battle's state and increments MobCount
xi.geasFete.spawnAdd = function(master, addId)
    local player = master:getTarget()
    if not player or not player:isPC() then
        return nil
    end

    local qmId = player:getLocalVar('GEASFEAT_QM')
    local npc = GetNPCByID(qmId)
    if not npc then
        return nil
    end

    local add = SpawnMob(addId)
    if add then
        -- Position randomized around the master mob
        local pos = master:getPos()
        add:setPos(pos.x + (math.random() * 4 - 2), pos.y, pos.z + (math.random() * 4 - 2), pos.rot)
        add:updateClaim(player)

        -- Standard Geas Fete Setup
        customMobScaling(add)
        add:addStatusEffect(xi.effect.CONFRONTATION, { power = 2, origin = add })

        -- Inherit timer data from the master mob
        add:setLocalVar('Kill_Timer', master:getLocalVar('Kill_Timer'))
        add:setLocalVar('Kill_Notification', master:getLocalVar('Kill_Notification'))
        add:setMobMod(xi.mobMod.IDLE_DESPAWN, 180)
        add:setLocalVar("Transforming", 0)
        add:setLocalVar("DeathHandled", 0)

        -- Register with QM controller
        npc:setLocalVar('MobCount', npc:getLocalVar('MobCount') + 1)
        xi.geasFete.registerBattleListeners(add, player, npc)
    end
    return add
end

xi.geasFete.setCountDown = function(player, mob, npc)
    local zone = player:getZoneID()
    local textID = geasFeteText[zone]
    local leader = GetPlayerByID(player:getLeaderID())

    if leader == nil then
        return
    end

    local alliancePartyCheck = {}

    if leader:checkSoloPartyAlliance() == 2 then
        alliancePartyCheck = leader:getAlliance()
    else
        alliancePartyCheck = leader:getPartyWithTrusts()
    end

    if type(alliancePartyCheck) == "table" then
        for _, member in pairs(alliancePartyCheck) do
            if member:isPC() then
                xi.geasFete.buildFencing(player, mob)
            end

            member:addStatusEffect(xi.effect.CONFRONTATION, { power = 2, origin = member })
            member:getStatusEffect(xi.effect.CONFRONTATION):delEffectFlag(xi.effectFlag.DEATH)

            if member:isPC() then
                member:messageSpecial(textID.REMAINING_TIME_MINUTES,15) -- battle time dialog 15 minutes
            end
            member:addListener('TICK', 'GEASFETE_TICK', function(playerArg)
                checkPlayerDistance(playerArg)
            end)
        end
    end
end

xi.geasFete.qmOnTrade = function(player, npc, trade)

end

xi.geasFete.qmOnTrigger = function(player, npc)
    local zone = npc:getZoneID()
    local textID = geasFeteText[zone]
    local paramOne = getGeaFatesKI(player)
    local alliance = player:getAlliance()
    local leader = player:getLeaderID()
    local initialCS = checkRequirements(player, npc) -- getInitialKI(player)
        if initialCS == true and
            paramOne ~= 0 then
                for _, participant in pairs(alliance) do
                    if participant:getID() ~= leader then -- everyone except for leader gets the message
                        participant:messageSpecial(textID.LEADER_COMMENCE_BATTLE) -- Your party leader is attempting to commence a battle message
                    end
                end

            player:startEvent(9200,paramOne)
        end
end

xi.geasFete.qmOnEventUpdate = function(player, csid, option, npc)
    local npcZone  = npc:getZoneID()
    local textID = geasFeteText[npcZone]
    local mobLevel = bit.rshift(option, 16)
    local gfKeyItem = bit.rshift(option, 16)
    local mobSpawn = 0

    if mobSpawn == 0 then
        for _, erKeyItem in pairs (grislyTrinkets[npcZone]) do
            if gfKeyItem == erKeyItem[1] then
                npc:setLocalVar('MobKeyItem', erKeyItem[1])
                return
            end
        end
    end

    player:messageSpecial(textID.CONTENT_LEVEL,mobLevel) -- displays content level in red
end

xi.geasFete.qmOnEventFinish = function(player, csid, option, npc)
    local npcZone = npc:getZoneID()
    local textID = geasFeteText[npcZone]
    local escape = bit.band(bit.rshift(option, 6), 0xFFFF) -- 0 for escape 1 for yes spawn mob
    local alliance = player:getAlliance() or { player }

    if escape == 0 then
        npc:setLocalVar('MobKeyItem', 0)
        return
    end

    npc:setLocalVar('Finished', 0)
    npc:setLocalVar('MobCount', 0)

    local selectedMobs = {}
    for _, erKeyItem in pairs(grislyTrinkets[npcZone]) do
        if erKeyItem[1] == npc:getLocalVar('MobKeyItem') then
            for i = 2, #erKeyItem do
                local mobList = npc:getZone():queryEntitiesByName(erKeyItem[i])
                if mobList then
                    for _, mob in pairs(mobList) do
                        if mob:isSpawned() then
                            DespawnMob(mob:getID())
                        end
                        DisallowRespawn(mob:getID(), true)
                        table.insert(selectedMobs, mob)
                        break
                    end
                end
            end
            break
        end
    end

    local actualSpawnCount = 0
    for _, mob in ipairs(selectedMobs) do
        local dx = player:getXPos() + math.random(-2, 2)
        local dy = player:getYPos() + 0.1
        local dz = player:getZPos() + math.random(-2, 2)

        mob:setSpawn(dx, dy, dz)
        local spawnedMob = SpawnMob(mob:getID())

        if spawnedMob then
            actualSpawnCount = actualSpawnCount + 1
            spawnedMob:updateClaim(player)
            mobScaling(spawnedMob) -- THIS IS CAUSING MOBS TO DESPAWN
            spawnedMob:addStatusEffect(xi.effect.CONFRONTATION, { power = 2, origin = spawnedMob })
            spawnedMob:setLocalVar("Transforming", 0)
            spawnedMob:setLocalVar("DeathHandled", 0)
            xi.geasFete.setCountDown(player, spawnedMob)

            spawnedMob:setLocalVar('Kill_Timer', os.time() + 900)
            spawnedMob:setLocalVar('Kill_Notification', os.time())
            spawnedMob:setMobMod(xi.mobMod.IDLE_DESPAWN, 180)
            xi.geasFete.registerBattleListeners(spawnedMob, player, npc)
        end
    end

    npc:setLocalVar('MobCount', actualSpawnCount)
    npc:setStatus(xi.status.DISAPPEAR)
    player:delKeyItem(npc:getLocalVar('MobKeyItem'))
    deleteInitialKI(player)

    for _, member in pairs(alliance) do
        member:setLocalVar('GEASFEAT_QM', npc:getID())
        member:addListener('DEATH', 'CONFRONTATION_DEATH', function(memberArg)
            local allianceObj = memberArg:getAlliance()

            if getMemberCount(memberArg) == getDeadPlayerCount(memberArg) then
                for _, participant in pairs(allianceObj) do
                    participant:messageSpecial(textID.ALL_MEMBERS_DEAD, 3)
                end
            end
        end)
    end
end

--------------------------------------------------------------

--------------------------------------------------------------
--------- Register of Deeds NPC
--------------------------------------------------------------
local domainInvasionNM =
{
    [xi.zone.ESCHA_RUAUN] =
    {
        { 'Naga_Raja' },
    },

    [xi.zone.ESCHA_ZITAH] =
    {
        { 'Azi_Dahaka' },
    },

    [xi.zone.REISENJIMA] =
    {
        { 'Quetzalcoatl' },
    }
}

local function toBinary(n)
    local t = {}
    repeat
        table.insert(t, 1, n % 2)
        n = math.floor(n/2)
    until n == 0
    return table.concat(t)
end

local function shiftLeft16(n)
    return n * 2^16
end

local function binaryToDecimal(bin)
    local dec = 0
    local len = #bin
    for i= 1, len do
        local bit = tonumber(bin:sub(i, i))
        dec = dec + bit * 2^(len - i)
    end
    return dec
end

xi.registerOfDeeds.npcOnTrade = function(player, npc, trade)

end

xi.registerOfDeeds.npcOnTrigger = function(player, npc)
    local nmDefeated = player:getCharVar('[RoD]GeaFetesDefeated'..player:getZoneID())
    local nmDefeatedVar = player:getCharVar('[RoD]NM_Counter') -- Have to conver this to binary then back to decimal, this is bit 32-16
    local nmDefeatedVarToBin = toBinary(shiftLeft16(nmDefeatedVar))
    local correctedNMDefeatedTotal = binaryToDecimal(nmDefeatedVarToBin)
    local mobDefeatedTotal = player:getCharVar('[RoD]Mob_Counter')
    local diMireuKills = player:getCharVar('[RoD]Kill_Count_Mireu')
    local playerZone = player:getZoneID()
    local diBossKill = player:getCharVar('[RoD]Kill_Count_'..domainInvasionNM[playerZone][1][1])

    player:startEvent(9708,correctedNMDefeatedTotal, nmDefeated, mobDefeatedTotal, diBossKill, 0, diMireuKills)

end

xi.registerOfDeeds.npcOnEventUpdate = function(player, csid, option, npc)

end

xi.registerOfDeeds.npcOnEventFinish = function(player, csid, option, npc)

end

--------------------------------------------------------------
--------- Affi / Dremi / Shiftrix NPC
--------------------------------------------------------------
local requirementIndex =
{
    NONE          = 1,
    KEYITEMS      = 2,
    MOBKILLS      = 3,
    NMKILLS       = 4,
    GEASFETEKILLS = 5,
}

local tempItemReqs =
{
    [requirementIndex.NONE] = -- change this to initial dialog instead of none
    {
        [1] = { param = 1, bitIndex = 1, itemIndex = 17, item = 5824, cost = 30, requirement = nil }, -- lucid potion I
        [2] = { param = 1, bitIndex = 2, itemIndex = 20, item = 5827, cost = 30, requirement = nil }, -- lucid ether I
        [3] = { param = 1, bitIndex = 3, itemIndex = 25, item = 5835, cost = 90, requirement = nil }, -- tube of healing salve I
        [4] = { param = 1, bitIndex = 4, itemIndex = 27, item = 5837, cost = 90, requirement = nil }, -- tube of clear salve I
    },

    [requirementIndex.KEYITEMS] =
    {
        [1] = { param = 1, bitIndex = 5, itemIndex = 1, item = 4182, cost = 30, requirement = xi.ki.RHAPSODY_IN_WHITE }, -- Scroll of instant reraise
        [2] = { param = 1, bitIndex = 13, itemIndex = 4, item = 4254, cost = 180, requirement = xi.ki.RHAPSODY_IN_AZURE }, -- megalixir
        [3] = { param = 1, bitIndex = 22, itemIndex = 5, item = 5385, cost = 90, requirement = xi.ki.RHAPSODY_IN_EMERALD }, -- bottle of barbarians drink
        [4] = { param = 1, bitIndex = 7, itemIndex = 6, item = 5386, cost = 90, requirement = xi.ki.RHAPSODY_IN_WHITE }, -- bottle of fighters drink
        [5] = { param = 1, bitIndex = 23, itemIndex = 7, item = 5387, cost = 90, requirement = xi.ki.RHAPSODY_IN_EMERALD }, -- bottle of oracles drink
        [6] = { param = 1, bitIndex = 6, itemIndex = 8, item = 5388, cost = 90, requirement = xi.ki.RHAPSODY_IN_WHITE }, -- bottle of assassins drink
        [7] = { param = 1, bitIndex = 9, itemIndex = 9, item = 5389, cost = 90, requirement = xi.ki.RHAPSODY_IN_UMBER }, -- bottle of spys drink
        [8] = { param = 1, bitIndex = 18, itemIndex = 11, item = 5391, cost = 90, requirement = xi.ki.RHAPSODY_IN_CRIMSON }, -- bottle of soldiers drink
        [9] = { param = 1, bitIndex = 10, itemIndex = 12, item = 5392, cost = 90, requirement = xi.ki.RHAPSODY_IN_UMBER }, -- bottle of champions drink
        [10] = { param = 1, bitIndex = 21, itemIndex = 13, item = 5393, cost = 90, requirement = xi.ki.RHAPSODY_IN_EMERALD }, -- bottle of monarchs drink
        [11] = { param = 1, bitIndex = 8, itemIndex = 14, item = 5394, cost = 90, requirement = xi.ki.RHAPSODY_IN_UMBER }, -- bottle of gnostics drink
        [12] = { param = 1, bitIndex = 11, itemIndex = 18, item = 5825, cost = 180, requirement = xi.ki.RHAPSODY_IN_AZURE }, -- lucid potion II
        [13] = { param = 1, bitIndex = 24, itemIndex = 19, item = 5826, cost = 270, requirement = xi.ki.RHAPSODY_IN_MAUVE }, -- licud potion III
        [14] = { param = 1, bitIndex = 12, itemIndex = 21, item = 5828, cost = 180, requirement = xi.ki.RHAPSODY_IN_AZURE }, -- lucid ether II
        [15] = { param = 1, bitIndex = 25, itemIndex = 22, item = 5829, cost = 270, requirement = xi.ki.RHAPSODY_IN_MAUVE }, -- lucid ether III
        [16] = { param = 1, bitIndex = 26, itemIndex = 23, item = 5830, cost = 270, requirement = xi.ki.RHAPSODY_IN_MAUVE }, -- lucid elixir I
        [17] = { param = 1, bitIndex = 19, itemIndex = 26, item = 5836, cost = 180, requirement = xi.ki.RHAPSODY_IN_CRIMSON }, -- tube of healing salve II
        [18] = { param = 1, bitIndex = 20, itemIndex = 28, item = 5838, cost = 180, requirement = xi.ki.RHAPSODY_IN_CRIMSON }, -- tube of clear salve II
        [19] = { param = 2, bitIndex = 1, itemIndex = 33, item = 5322, cost = 90, requirement = xi.ki.RHAPSODY_IN_FUCHSIA }, -- flask of healing powder
        [20] = { param = 2, bitIndex = 2, itemIndex = 34, item = 4255, cost = 90, requirement = xi.ki.RHAPSODY_IN_FUCHSIA }, -- pinch of mana powder
        [21] = { param = 2, bitIndex = 3, itemIndex = 35, item = 4208, cost = 120, requirement = xi.ki.RHAPSODY_IN_FUCHSIA }, -- bottle of catholicons +1
        [22] = { param = 2, bitIndex = 4, itemIndex = 36, item = 6474, cost = 600, requirement = xi.ki.RHAPSODY_IN_PUCE }, -- phial of poison buffer
        [23] = { param = 2, bitIndex = 5, itemIndex = 37, item = 5832, cost = 360, requirement = xi.ki.RHAPSODY_IN_PUCE }, -- flask of healing mist
        [24] = { param = 2, bitIndex = 6, itemIndex = 38, item = 5833, cost = 360, requirement = xi.ki.RHAPSODY_IN_PUCE }, -- flask of mana mist
        [25] = { param = 2, bitIndex = 7, itemIndex = 39, item = 5439, cost = 300, requirement = xi.ki.RHAPSODY_IN_OCHRE }, -- bottle of vicars drink
        [26] = { param = 2, bitIndex = 8, itemIndex = 40, item = 5831, cost = 360, requirement = xi.ki.RHAPSODY_IN_OCHRE }, -- lucid elixir II
        [27] = { param = 2, bitIndex = 9, itemIndex = 41, item = 5436, cost = 150, requirement = xi.ki.RHAPSODY_IN_OCHRE }, -- dusty scroll of reraise
        [28] = { param = 2, bitIndex = 10, itemIndex = 42, item = 5853, cost = 11000000, requirement = xi.ki.SCINTILLATING_RHAPSODY }, -- flask of primeval brew
    },

    [requirementIndex.MOBKILLS] =
    {
        [1] = { param = 1, bitIndex = 15, itemIndex = 3, item = 4206, cost = 60, requirement = 200 }, -- bottle of catholicon
        [2] = { param = 1, bitIndex = 28, itemIndex = 29, item = 6399, cost = 600, requirement = 2000 }, -- bottle of saviors tonic
        [3] = { param = 2, bitIndex = 12, itemIndex = 44, item = 6473, cost = 3000, requirement = 20000 }, -- super revitalizer
    },

    [requirementIndex.NMKILLS] =
    {
        [1] = { param = 1, bitIndex = 29, itemIndex = 30, item = 6400, cost = 600, requirement = 100 }, -- bottle of mirrors tonic
        [2] = { param = 1, bitIndex = 30, itemIndex = 31, item = 6401, cost = 600, requirement = 500 }, -- bottle of monetas tonic
        [3] = { param = 2, bitIndex = 13, itemIndex = 45, item = 6476, cost = 600, requirement = 1000 }, -- phial of virus buffer
    },

    [requirementIndex.GEASFETEKILLS] =
    {
        [1] = { param = 1, bitIndex = 27, itemIndex = 2, item = 4202, cost = 150, requirement = { 'Amymone', 'Hanbi', 'Kammavaca', 'Naphula', 'Palila', 'Yilan' } }, -- deadalus wing
        [2] = { param = 1, bitIndex = 16, itemIndex = 10, item = 5390, cost = 240, requirement = { 'Fleetstalker', 'Shockmaw', 'Urmahlullu' } }, -- bottle of bravers drink
        [3] = { param = 1, bitIndex = 31, itemIndex = 15, item = 5395, cost = 900, requirement = { 'Duke_Vepar', 'Pakecet', 'Virava' } }, -- bottle of clerics drink
        [4] = { param = 1, bitIndex = 17, itemIndex = 16, item = 5397, cost = 90, requirement = {{ 'Alphuachra', 'Bucca', 'Puca' }, 'Blazewing', 'Pazuzu', 'Wrathare' } }, -- bottle of sprinters drink
        [5] = { param = 1, bitIndex = 14, itemIndex = 24, item = 5834, cost = 150, requirement = { 'Brittlis', 'Ionos', 'Kamohoalii', 'Nosoi', 'Sensual_Sandy', 'Umdhlebi' } }, -- pair of lucid wings I
        [6] = { param = 1, bitIndex = 32, itemIndex = 32, item = 6402, cost = 600, requirement = { 'Ark_Angel_EV', 'Ark_Angel_GK', 'Ark_Angel_HM', 'Ark_Angel_MR', 'Ark_Angel_TT', 'Byakko', 'Genbu', 'Seiryu', 'Suzaku', 'Kouryu', 'Warder_of_Courage' } }, -- bottle of steadfast tonic
        [7] = { param = 2, bitIndex = 11, itemIndex = 43, item = 6475, cost = 1000, requirement = { 'Bashmu', 'Gajasimha', 'Ironside', 'Old_Shuck', 'Sarsaok', 'Strophadia' } }, -- pair of lucid wings II
        [8] = { param = 2, bitIndex = 14, itemIndex = 46, item = 6477, cost = 600, requirement = { 'Maju', 'Neak', 'Yakshi' } }, -- phial of charm buffer
        [9] = { param = 2, bitIndex = 15, itemIndex = 47, item = 6478, cost = 600, requirement = { 'Albumen', 'Erinys', 'Onychophora', 'Schah', 'Teles', 'Vinipata', 'Zerde' } }, -- phial of curse buffer
    },
}

local eschaKeyItems =
{
    [1] = { keyItem = xi.ki.TRIBULENS, cost = 1000, bitIndex = 0, zoneAvailableIn = { xi.zone.ESCHA_RUAUN, xi.zone.ESCHA_ZITAH, xi.zone.REISENJIMA } },
    [2] = { keyItem = xi.ki.REAPER, cost = 50, bitIndex = 1, zoneAvailableIn = { xi.zone.ESCHA_RUAUN, xi.zone.ESCHA_ZITAH, xi.zone.REISENJIMA } },
    [3] = { keyItem = xi.ki.MAP_OF_ESCHA_ZITAH, cost = 50, bitIndex = 2, zoneAvailableIn = xi.zone.ESCHA_ZITAH },
    [4] = { keyItem = xi.ki.MAP_OF_ESCHA_RUAUN, cost = 50, bitIndex = 3, zoneAvailableIn = xi.zone.ESCHA_RUAUN },
    [5] = { keyItem = xi.ki.MAP_OF_REISENJIMA, cost = 50, bitIndex = 4, zoneAvailableIn = xi.zone.REISENJIMA },
    [6] = { keyItem = xi.ki.ESCHAN_URN, cost = 2000, bitIndex = 5, zoneAvailableIn = { xi.zone.ESCHA_RUAUN, xi.zone.ESCHA_ZITAH, xi.zone.REISENJIMA } },
    [7] = { keyItem = xi.ki.ESCHAN_CELLAR, cost = 10000, bitIndex = 6, zoneAvailableIn = { xi.zone.ESCHA_RUAUN, xi.zone.ESCHA_ZITAH, xi.zone.REISENJIMA } },
    [8] = { keyItem = xi.ki.ESCHAN_NEF, cost = 50000, bitIndex = 7, zoneAvailableIn = { xi.zone.ESCHA_RUAUN, xi.zone.ESCHA_ZITAH, xi.zone.REISENJIMA } },
    [9] = { keyItem = xi.ki.PRIMAL_NAZAR, cost = 0, bitIndex = 8, zoneAvailableIn = xi.zone.ESCHA_RUAUN },
    [10] = { keyItem = xi.ki.RADIALENS, cost = 10000, bitIndex = 9, zoneAvailableIn = { xi.zone.ESCHA_RUAUN, xi.zone.ESCHA_ZITAH, xi.zone.REISENJIMA } },
    [11] = { keyItem = xi.ki.MOLLIFIER, cost = 500, bitIndex = 10, zoneAvailableIn = { xi.zone.ESCHA_RUAUN, xi.zone.ESCHA_ZITAH, xi.zone.REISENJIMA } },
}

local wardenOfCourageKI =
{
    [1] = { keyItem = xi.ki.PRIMARY_NAZAR },
    [2] = { keyItem = xi.ki.SECONDARY_NAZAR },
    [3] = { keyItem = xi.ki.TERTIARY_NAZAR },
    [4] = { keyItem = xi.ki.QUATERNARY_NAZAR },
    [5] = { keyItem = xi.ki.QUINARY_NAZAR },
    [6] = { keyItem = xi.ki.SENARY_NAZAR },
    [7] = { keyItem = xi.ki.SEPTENARY_NAZAR },
    [8] = { keyItem = xi.ki.OCTONARY_NAZAR },
    [9] = { keyItem = xi.ki.NONARY_NAZAR },
    [10] = { keyItem = xi.ki.DENARY_NAZAR },
}

local function getWardenOfCourageKI(player)
    for i = 1, #wardenOfCourageKI do
        if not player:hasKeyItem(wardenOfCourageKI[i].keyItem) then
            return false
        end
    end
    return true
end

local function removeAllWardenOfCourageKI(player)
    for i = 1, #wardenOfCourageKI do
        local ki = wardenOfCourageKI[i].keyItem
        if player:hasKeyItem(ki) then
            player:delKeyItem(ki)
        end
    end
end

local function to32BitBinary(num)
    local binary = ""
    for i = 31, 0, -1 do
        local power = 2^i
        local bit = math.floor(num / power) % 2
        binary = binary .. bit
    end
    return binary
end

local function getInitialConversation(player) -- setting the initial conversation variable in one variable for all three zones as to not keep a bunch of uneeded variables Event 9700
    local npcZone = player:getZone():getID()
    local zoneTable = { { 288, 1 }, { 289, 3 }, { 291, 5 } }
    local initialConvo = false

    for i = 1, #zoneTable do
        if npcZone == zoneTable[i][1] and
            utils.mask.getBit(player:getCharVar('geasFeteNPCInitialConvo'), zoneTable[i][2] -1) == true then -- reads charvar by bit for if initial conversation has been completed 111 (291 (Zitah),289 (RuAun),288 (Reisenjima)
            initialConvo = true
        end
    end

    return initialConvo
end

local function setConversation(player)
    local npcZone = player:getZone():getID()
    local eschaInitialConvo = player:getCharVar('geasFeteNPCInitialConvo')
    local conversationBit = { { 288, 1 }, { 289, 3 }, { 291, 5 } }
    local siltPaidBit = { { 288, 2 }, { 289, 4 }, { 291, 6 } }

    for i = 1, #conversationBit do -- set bit for initial conversation
        if npcZone == conversationBit[i][1] and
            utils.mask.getBit(player:getCharVar('geasFeteNPCInitialConvo'), conversationBit[i][2] -1) == false then -- reads charvar by bit for if initial conversation has been completed 111 (291 (Zitah),289 (RuAun),288 (Reisenjima)
                player:setCharVar('geasFeteNPCInitialConvo', utils.mask.setBit(eschaInitialConvo, conversationBit[i][2] - 1, true))
        end
    end

    for i = 1, #siltPaidBit do -- set bit if you have copleted the initial conversation and paid the 10 gil
        if npcZone == siltPaidBit[i][1] and
            utils.mask.getBit(player:getCharVar('geasFeteNPCInitialConvo'), siltPaidBit[i][2] -2) == true and
            utils.mask.getBit(player:getCharVar('geasFeteNPCInitialConvo'), siltPaidBit[i][2] -1) == false then -- reads charvar by bit for if silty has been paid 111 (291 (Zitah),289 (RuAun),288 (Reisenjima)
                player:delCurrency('escha_silt', 10)
                player:setCharVar('geasFeteNPCInitialConvo', utils.mask.setBit(eschaInitialConvo, siltPaidBit[i][2] - 1, true))
        end
    end
end

local function getDialog(player)
    local eschaInitialConvo = player:getCharVar('geasFeteNPCInitialConvo')
    local conversationBit = { { 288, 1 }, { 289, 3 }, { 291, 5 } }
    local siltPaidBit = { { 288, 2 }, { 289, 4 }, { 291, 6 } }
    local dialogBits = 0
    local currentZone = player:getZoneID()

    for i = 1, #eschaKeyItems do
        local keyItemData = eschaKeyItems[i]
        local availableZones = keyItemData.zoneAvailableIn
        local isZoneValid = false
        local currentZone = player:getZoneID()

        -- Check if key item is available in current zone
        if type(availableZones) == "table" then
            for _, zone in ipairs(availableZones) do
                if currentZone == zone then
                    isZoneValid = true
                    break
                end
            end
        else
            isZoneValid = (currentZone == availableZones)
        end

        if keyItemData.keyItem == xi.ki.PRIMAL_NAZAR then
            if isZoneValid and getWardenOfCourageKI(player) then
                dialogBits = utils.mask.setBit(dialogBits, keyItemData.bitIndex, false) -- show
            else
                dialogBits = utils.mask.setBit(dialogBits, keyItemData.bitIndex, true) -- hide
            end
        else
            local hasKeyItem = player:hasKeyItem(keyItemData.keyItem)

            if not isZoneValid or hasKeyItem then
                dialogBits = utils.mask.setBit(dialogBits, keyItemData.bitIndex, true) -- hide
            else
                dialogBits = utils.mask.setBit(dialogBits, keyItemData.bitIndex, false) -- show
            end
        end
    end

    -- Initial conversation flags
    for i = 1, #conversationBit do
        if utils.mask.getBit(eschaInitialConvo, conversationBit[i][2] - 1) == true then
            dialogBits = utils.mask.setBit(dialogBits, 24, true) -- initial event 9700 conversation bit
        end
    end

    -- Silt paid flags
    for i = 1, #siltPaidBit do
        if utils.mask.getBit(eschaInitialConvo, siltPaidBit[i][2] - 1) == true then
            dialogBits = utils.mask.setBit(dialogBits, 25, true) -- need to pay 10 gil bit
            dialogBits = utils.mask.setBit(dialogBits, 26, true) -- has paid the 10 gil bit
        end
    end

    if currentZone == xi.zone.ESCHA_RUAUN then -- used to show the correct dialog per zone
        dialogBits = utils.mask.setBit(dialogBits, 16, true)
    elseif currentZone == xi.zone.REISENJIMA then
        dialogBits = utils.mask.setBit(dialogBits, 17, true)
    end

    return dialogBits
end

local grislyTrinketsTrade =
{
    ['TRADES'] =
    {
        [xi.zone.ESCHA_ZITAH] = -- 288
        {
            [1] = { trade = { { xi.item.DARKSTEEL_INGOT, 2 } }, csid = 9702 },
            [2] = { trade = { { xi.item.PIECE_OF_MAHOGANY_LUMBER, 3 } }, csid = 9702 },
            [3] = { trade = { { xi.item.SQUARE_OF_SILK_CLOTH, 2 } }, csid = 9702 },
            [4] = { trade = { { xi.item.SQUARE_OF_BUFFALO_LEATHER, 2 } }, csid = 9702 },
            [5] = { trade = { { xi.item.GOLD_INGOT, 2 } }, csid = 9702 },
            [6] = { trade = { { xi.item.CARAPACE_GORGET, 1 } }, csid = 9702 },
            [7] = { trade = { { xi.item.FLAME_BLADE, 1 } }, csid = 9702 },
            [8] = { trade = { { xi.item.HOLY_SWORD, 1 } }, csid = 9702 },
            [9] = { trade = { { xi.item.FISH_MITHKABOB, 6 } }, csid = 9702 },
            [10] = { trade = { { xi.item.STICK_OF_ETHEREAL_INCENSE, 5 } }, csid = 9704 },
            [11] = { trade = { { xi.item.AYAPECS_SHELL, 5 } }, csid = 9703 },
            [12] = { trade = { { xi.item.RIFTBORN_BOULDER, 5 } }, csid = nil, keyItem = xi.ki.FLEETSTALKERS_CLAW },
            [13] = { trade = { { xi.item.BEITETSU, 5 } }, csid = nil, keyItem = xi.ki.SHOCKMAWS_BLUBBER },
            [14] = { trade = { { xi.item.PLUTON, 5 } }, csid = nil, keyItem = xi.ki.URMAHLULLUS_ARMOR },
            [15] = { trade = { { xi.item.TUFT_OF_ASHWEED, 1 }, { xi.item.GRAVEWOOD_LOG, 1 } }, csid = nil, keyItem = xi.ki.COVENS_DUST },
            [16] = { trade = { { xi.item.DUSKCRAWLER, 1 }, { xi.item.GRAVEWOOD_LOG, 1 } }, csid = nil, keyItem = xi.ki.BLAZEWINGS_PINCER },
            [17] = { trade = { { xi.item.TUFT_OF_ASHWEED, 1 }, { xi.item.DUSKCRAWLER, 1 } }, csid = nil, keyItem = xi.ki.PAZUZUS_BLADE_HILT },
            [18] = { trade = { { xi.item.TUFT_OF_ASHWEED, 1 }, { xi.item.GRAVEWOOD_LOG, 1 }, { xi.item.DUSKCRAWLER, 1 } }, csid = nil, keyItem = xi.ki.WRATHARES_CARROT },
        },

        [xi.zone.ESCHA_RUAUN] = -- 289
        {
            [1] = { trade = { { xi.item.STEEL_INGOT, 2 } }, csid = 9702 },
            [2] = { trade = { { xi.item.PIECE_OF_EBONY_LUMBER, 2 } }, csid = 9702 },
            [3] = { trade = { { xi.item.SQUARE_OF_KARAKUL_CLOTH, 2 } }, csid = 9702 },
            [4] = { trade = { { xi.item.SQUARE_OF_CATOBLEPAS_LEATHER, 2 } }, csid = 9702 },
            [5] = { trade = { { xi.item.PLATINUM_INGOT, 2 } }, csid = 9702 },
            [6] = { trade = { { xi.item.CERMET_CHUNK, 2 } }, csid = 9702 },
            [7] = { trade = { { xi.item.TURTLE_BANGLES, 1 } }, csid = 9702 },
            [8] = { trade = { { xi.item.PAMAMA_TART, 1 } }, csid = 9702 }, -- add to enum 4563
            [9] = { trade = { { xi.item.BHEFHEL_MARLIN_1, 1 } }, csid = 9702 },
            [10] = { trade = { { xi.item.MHUUFYAS_BEAK, 5 } }, csid = nil, keyItem = xi.ki.AMYMONES_TOOTH }, -- add to enum 9097
            [11] = { trade = { { xi.item.AZRAELS_EYE, 5 } }, csid = nil, keyItem = xi.ki.HANBIS_NAIL }, -- add to enum 9059
            [12] = { trade = { { xi.item.VEDRFOLNIRS_WING, 5 } }, csid = nil, keyItem = xi.ki.KAMMAVACAS_BINDING }, -- add to enum 9031
            [13] = { trade = { { xi.item.TUFT_OF_CAMAHUETOS_FUR, 5 } }, csid = nil, keyItem = xi.ki.NAPHULAS_BRACELET }, -- add to enum 9051
            [14] = { trade = { { xi.item.VIDMAPRIES_CLAW, 5 } }, csid = nil, keyItem = xi.ki.PALILAS_TALON }, -- add to enum 9103
            [15] = { trade = { { xi.item.CENTURIO_ARMOR, 5 } }, csid = nil, keyItem = xi.ki.YILANS_SCALE }, -- add to enum 9104
            [16] = { trade = { xi.item.YGGDREANT_ROOT }, csid = nil, keyItem = xi.ki.DUKE_VEPARS_SIGNET },
            [17] = { trade = { xi.item.WAKTZA_CREST }, csid = nil, keyItem = xi.ki.PAKECETS_BLUBBER },
            [18] = { trade = { xi.item.CEHUETZI_PELT }, csid = nil, keyItem = xi.ki.VIRAVAS_STALK },
            [19] = { trade = { xi.item.SHEET_OF_PARCHMENT, xi.item.BOTTLE_OF_ILLUMININK, xi.item.ASHEN_CRAYFISH, xi.item.TUFT_OF_ASHWEED }, csid = nil, keyItem = xi.ki.ARK_ANGEL_EVS_SASH }, -- add to enum 9146
            [20] = { trade = { xi.item.SHEET_OF_PARCHMENT, xi.item.BOTTLE_OF_ILLUMININK, xi.item.ASHEN_CRAYFISH, xi.item.GRAVEWOOD_LOG }, csid = nil, keyItem = xi.ki.ARK_ANGEL_GKS_BANGLE },
            [21] = { trade = { xi.item.SHEET_OF_PARCHMENT, xi.item.BOTTLE_OF_ILLUMININK, xi.item.TUFT_OF_ASHWEED, xi.item.GRAVEWOOD_LOG }, csid = nil, keyItem = xi.ki.ARK_ANGEL_HMS_COAT },
            [22] = { trade = { xi.item.SHEET_OF_PARCHMENT, xi.item.BOTTLE_OF_ILLUMININK, xi.item.ASHEN_CRAYFISH, xi.item.DUSKCRAWLER }, csid = nil, keyItem = xi.ki.ARK_ANGEL_MRS_BUCKLE },
            [23] = { trade = { xi.item.SHEET_OF_PARCHMENT, xi.item.BOTTLE_OF_ILLUMININK, xi.item.DUSKCRAWLER, xi.item.GRAVEWOOD_LOG }, csid = nil, keyItem = xi.ki.ARK_ANGEL_TTS_NECKLACE },
            [24] = { trade = { { xi.item.SEAL_OF_BYAKKO_SCRAP, 3 } }, csid = nil, keyItem = xi.ki.BYAKKOS_PRIDE, requirement = xi.title.KIRIN_CAPTIVATOR }, -- add to enum 3278
            [25] = { trade = { { xi.item.SEAL_OF_GENBU_SCRAP, 3 } }, csid = nil, keyItem = xi.ki.GENBUS_HONOR, requirement = xi.title.KIRIN_CAPTIVATOR }, -- add to enum 3275
            [26] = { trade = { { xi.item.SEAL_OF_BYAKKO_SCRAP, 5 }, { xi.item.SEAL_OF_GENBU_SCRAP, 5 }, { xi.item.SEAL_OF_SEIRYU_SCRAP, 5 }, { xi.item.SEAL_OF_SUZAKU_SCRAP, 5 } }, csid = nil, keyItem = xi.ki.KIRINS_FERVOR, requirement = xi.title.KIRIN_CAPTIVATOR },
            [27] = { trade = { { xi.item.SEAL_OF_SEIRYU_SCRAP, 3 } }, csid = nil, keyItem = xi.ki.SEIRYUS_NOBILITY, requirement = xi.title.KIRIN_CAPTIVATOR }, -- add to enum 3277
            [28] = { trade = { { xi.item.SEAL_OF_SUZAKU_SCRAP, 3 } }, csid = nil, keyItem = xi.ki.SUZAKUS_BENEFACTION, requirement = xi.title.KIRIN_CAPTIVATOR }, -- add to enum 3276
        },

        [xi.zone.REISENJIMA] = -- 291
        {
            [1] = { trade = { { xi.item.DARKSTEEL_BUCKLER, 1 } }, csid = 9702 },
            [2] = { trade = { { xi.item.PIECE_OF_ANCIENT_LUMBER, 2 } }, csid = 9702 },
            [3] = { trade = { { xi.item.GOLD_OBI, 1 } }, csid = 9702 },
            [4] = { trade = { { xi.item.SQUARE_OF_BEHEMOTH_LEATHER, 1 } }, csid = 9702 },
            [5] = { trade = { { xi.item.GOLD_BANGLES, 1 } }, csid = 9702 }, -- add to enums 13983
            [6] = { trade = { { xi.item.DEMONS_KNIFE, 1 } }, csid = 9702 }, -- add to enum 17601
            [7] = { trade = { { xi.item.BOWL_OF_TURTLE_SOUP, 1 } }, csid = 9702 },
            [8] = { trade = { { xi.item.BLADEFISH_1, 1 } }, csid = 9702 },
            [9] = { trade = { xi.item.GRAMK_DROOGS_GRAND_COFFER }, csid = nil, keyItem = xi.ki.BASHMUS_TRINKET }, -- add to enum 6296
            [10] = { trade = { { xi.item.IGNOR_MNT_GRAND_COFFER, 2 } }, csid = nil, keyItem = xi.ki.GAJASIMHAS_MANE }, -- add to enum 6288
            [11] = { trade = { { xi.item.DURS_VIKES_GRAND_COFFER, 2 } }, csid = nil, keyItem = xi.ki.IRONSIDES_MAUL }, -- add to enum 6290
            [12] = { trade = { { xi.item.LIIJ_VOKS_GRAND_COFFER, 2 } }, csid = nil, keyItem = xi.ki.OLD_SHUCKS_TUFT }, -- add to enum 6294
            [13] = { trade = { { xi.item.TRYL_WUJS_GRAND_COFFER, 2 } }, csid = nil, keyItem = xi.ki.SARSAOKS_HOARD }, -- add to enum 6292
            [14] = { trade = { { xi.item.YMMR_ULVIDS_GRAND_COFFER, 2 } }, csid = nil, keyItem = xi.ki.STROPHADIAS_PEARL }, -- add to enum 6286
            [15] = { trade = { xi.item.SOVEREIGN_BEHEMOTHS_HIDE }, csid = nil, keyItem = xi.ki.MAJUS_CLAW }, -- add to enum 9151
            [16] = { trade = { xi.item.TOLBAS_SHELL }, csid = nil, keyItem = xi.ki.NEAKS_TREASURE }, -- add to enum 9150
            [17] = { trade = { xi.item.HIDHAEGGS_SCALE }, csid = nil, keyItem = xi.ki.YAKSHIS_SCROLL }, -- add to enum 9149
            [18] = { trade = { { xi.item.TUFT_OF_ASHWEED, 3 }, { xi.item.TUFT_OF_VOID_GRASS, 3 }, xi.item.JUG_OF_VERMIHUMUS, xi.item.CLUMP_OF_COALITION_HUMUS }, csid = nil, keyItem = xi.ki.ALBUMENS_FLOWER }, -- add to enum 3990 & 9215
            [19] = { trade = { { xi.item.VOIDSNAPPER, 3 }, { xi.item.TUFT_OF_ASHWEED, 3 }, xi.item.MISTMELT, xi.item.SCROLL_OF_TORNADO }, csid = nil, keyItem = xi.ki.ERINYSS_BEAK }, -- add to enum 9216
            [20] = { trade = { { xi.item.VOID_CRYSTAL, 3 }, { xi.item.TUFT_OF_VOID_GRASS, 3 }, { xi.item.TITANITE, 10 }, xi.item.SACK_OF_LITTLE_WORM_MULCH }, csid = nil, keyItem = xi.ki.ONYCHOPHORAS_SOIL }, -- add to enum 9214
            [21] = { trade = { { xi.item.VOIDSNAPPER, 3 }, { xi.item.GRAVEWOOD_LOG, 3 }, xi.item.LEISURE_TABLE, xi.item.TRUMP_CARD_CASE }, csid = nil, keyItem = xi.ki.SCHAHS_GAMBIT }, -- add to enum 419
            [22] = { trade = { { xi.item.VOID_CRYSTAL, 3 }, { xi.item.VOIDSNAPPER, 3 }, xi.item.LOCK_OF_SIRENS_HAIR, xi.item.SCROLL_OF_MAIDENS_VIRELAI }, csid = nil, keyItem = xi.ki.TELESS_HYMN },
            [23] = { trade = { { xi.item.VOID_CRYSTAL, 3 }, { xi.item.DUSKCRAWLER, 3 }, { xi.item.BONE_CHIP, 10 }, xi.item.SCARLETITE_INGOT }, csid = nil, keyItem = xi.ki.VINIPATAS_BLADE },
            [24] = { trade = { { xi.item.TUFT_OF_VOID_GRASS, 3 }, { xi.item.ASHEN_CRAYFISH, 3 }, { xi.item.CHUNK_OF_FLAN_MEAT, 10 }, xi.item.SERVING_OF_BLACK_PUDDING }, csid = nil, keyItem = xi.ki.ZERDES_CUP }, -- Add to enum 9552
        },
    },

    ['KEYITEMS'] =
    {
        [xi.zone.ESCHA_ZITAH] =
        {
            [9702] =
            {
                [1] = { xi.ki.WEPWAWETS_TOOTH },
                [2] = { xi.ki.LYDIAS_VINE },
                [3] = { xi.ki.AGLAOPHOTIS_BUD },
                [4] = { xi.ki.TANGATAS_WING },
                [5] = { xi.ki.VIDALAS_CLAW },
                [6] = { xi.ki.GESTALTS_RETINA },
                [7] = { xi.ki.ANGRBODAS_NECKLACE },
                [8] = { xi.ki.CUNNASTS_TALON },
                [9] = { xi.ki.REVETAURS_HORN},
                [10] = { xi.ki.FERRODONS_SCALE },
                [11] = { xi.ki.GULLTOPS_SHELL },
                [12] = { xi.ki.VYALAS_PREY },
            },
            [9703] =
            {
                [1] = { xi.ki.IONOSS_WEBBING },
                [2] = { xi.ki.NOSOIS_FEATHER },
                [3] = { xi.ki.KAMOHOALIIS_FIN },
            },
            [9704] =
            {
                [1] = { xi.ki.SANDYS_LASHER },
                [2] = { xi.ki.BRITTLISS_RING },
                [3] = { xi.ki.UMDHLEBIS_FLOWER },
            },
        },

        [xi.zone.ESCHA_RUAUN] =
        {
            [9702] =
            {
                [1] = { xi.ki.BIAS_GLOVE },
                [2] = { xi.ki.RUEAS_STONE },
                [3] = { xi.ki.MAS_LANCE },
                [4] = { xi.ki.KHONS_SCEPTER },
                [5] = { xi.ki.METS_RING },
                [6] = { xi.ki.KHUNS_CROWN },
                [7] = { xi.ki.WASSERSPEIERS_HORN },
                [8] = { xi.ki.EMPUTAS_WING },
                [9] = { xi.ki.PEIRITHOOSS_HOOF},
                [10] = { xi.ki.ASIDAS_GEL },
                [11] = { xi.ki.TENODERAS_SCYTHE },
                [12] = { xi.ki.SAVA_SAVANOVICS_CAPE },
            },
        },

        [xi.zone.REISENJIMA] =
        {
            [9702] =
            {
                [1] = { xi.ki.CROM_DUBHS_HELM },
                [2] = { xi.ki.GOLDEN_KISTS_KEY },
                [3] = { xi.ki.MAUVE_WRISTED_GOMBERRYS_KNIFE },
                [4] = { xi.ki.DAZZLING_DOLORESS_VINE },
                [5] = { xi.ki.TAELMOTHS_STAFF },
                [6] = { xi.ki.BELPHEGORS_CROWN },
                [7] = { xi.ki.KABANDHAS_WING },
                [8] = { xi.ki.SELKITS_PINCER },
                [9] = { xi.ki.SANG_BUAYAS_TUSK},
                [10] = { xi.ki.SABOTENDER_ROYALS_NEEDLE },
                [11] = { xi.ki.ZDUHACS_TALON },
                [12] = { xi.ki.ORYXS_PLUMAGE },
            },
        },
    },
}

local vorsealData = { -- must unlock tier first by doing missions/quests/etc and killing GeasFets NMs / Domain Invasion NMs then you can purchase the upgrades
    ["HP/MP"] = { -- Kill Escha Non NM Mobs [RoD]Mob_Counter
        purchaseOrder = 1,
        cost = 1200,
        values = {20, 40, 60, 80, 100, 120, 140, 160, 180, 200, 220},
        mods = { xi.mod.HP, xi.mod.MP},
        purchasedBitIndex = { 3, 2, 1, 0 }, -- vorseals purchased in startEvent and option 9
        purchasedParam = 1, -- vorseals purchased in startEvent and option 9
        unlockParam = { { 4, 17 }, { 4, 18 }, { 4, 19 }, { 4, 20 }, { 4, 21 }, { 4, 22 }, { 4, 23 }, { 4, 24 }, { 4, 25 }, { 4, 26 }, { 4, 27 } }, -- vorseal tier unlock { parameter #, bitIndex }
        unlock = {
            ['Kill_Count_Escha_Mob'] = {
                [1] = 10,  -- Tier 1 - 10 kills any Escha Zone mobs
                [2] = 50, -- Tier 2 - 50 kills any Escha Zone mobs
                [3] = 100, -- Tier 3 - 100 kills any Escha Zone mobs
                [4] = 500, -- Tier 4 - 500 kills any Escha Zone mobs
                [5] = 1000, -- Tier 5 - 1000 kills any Escha Zone mobs
                [6] = 5000, -- Tier 6 - 5000 kills any Escha Zone mobs
                [7] = 10000, -- Tier 7 - 10000 kills any Escha Zone mobs
                [8] = 25000, -- Tier 8 - 25000 kills any Escha Zone mobs
                [9] = 50000, -- Tier 9 - 50000 kills any Escha Zone mobs
                [10] = 75000,-- Tier 10 - 75000 kills any Escha Zone mobs
                [11] = 110000 -- Tier 11 - 110000 kills any Escha Zone mobs
            },
        }
    },
    ["Acc/R.Acc/Eva"] = {
        cost = 600,
        purchaseOrder = 2,
        values = {2, 4, 6, 8, 10, 12, 14, 16, 18, 20, 22},
        mods = { xi.mod.ACC, xi.mod.RACC, xi.mod.EVA },
        purchasedBitIndex = { 7, 6, 5, 4 }, -- vorseals purchased in startEvent and option 9
        purchasedParam = 1, -- vorseals purchased in startEvent and option 9
        unlockParam = { { 2, 1 }, { 2, 8 }, { 2, 19 }, { 2, 25 }, { 3, 12 }, { 3, 18 }, { 4, 1 }, { 4, 7 }, { 6, 19 }, { 6, 25 }, { 7, 15 } }, -- vorseal tier unlock { parameter #, bitIndex }
        unlock = {
            ['Mission'] = {
                [1] = { xi.mission.log_id.SANDORIA, xi.mission.id.sandoria.THE_HEIR_TO_THE_LIGHT },

            },

            ['Quest'] = {
                [1] = { xi.questLog.CRYSTAL_WAR, xi.quest.id.crystalWar.FACE_OF_THE_FUTURE },
                [2] = { xi.questLog.OTHER_AREAS, xi.quest.id.otherAreas.FISHERMANS_HEART },
            },

            ['Title'] = {
                [1] = xi.title.DISCERNING_INDIVIDUAL,
                [2] = xi.title.MAZE_WANDERER,
            },

            ['Notorious_Monsters'] = {
                [1] = 'Wepwawet',
                [2] = 'Angrboda',
                [3] = 'Bia',
                [4] = 'Wasserspeier',
                [5] = 'Crom_Dubh',
                [6] = 'Kabandha',
            },
        }
    },
    ["Def"] = {
        cost = 600,
        purchaseOrder = 3,
        values = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11 }, -- These are percentages
        mods = { xi.mod.DEF },
        purchasedBitIndex = { 11, 10, 9, 8 }, -- vorseals purchased in startEvent and option 9
        purchasedParam = 1, -- vorseals purchased in startEvent and option 9
        unlockParam = { { 2, 2 }, { 2, 9 }, { 2, 20 }, { 2, 26 }, { 3, 13 }, { 3, 19 }, { 4, 2 }, { 4, 8 }, { 6, 20 }, { 6, 26 }, { 7, 16 } }, -- vorseal tier unlock { parameter #, bitIndex }
        unlock = {
            ['Mission'] = {
                [1] = { xi.mission.log_id.BASTOK, xi.mission.id.bastok.WHERE_TWO_PATHS_CONVERGE },

            },

            ['Quest'] = {
                [1] = { xi.questLog.CRYSTAL_WAR, xi.quest.id.crystalWar.BONDS_OF_MYTHRIL },
                [2] = { xi.questLog.OTHER_AREAS, xi.quest.id.otherAreas.HYPNOTIC_HOSPITALITY}, -- NOT CODED OR ASSIGNED YET
            },

            ['Quest_Any_Of'] = {  -- Only 1 Tier
                [1] = { xi.questLog.OTHER_AREAS, xi.quest.id.otherAreas.A_GENEROUS_GENERAL }, -- NOT CODED OR ASSIGNED YET
                [2] = { xi.questLog.OTHER_AREAS, xi.quest.id.otherAreas.AN_UNDERSTANDING_OVERLORD }, -- NOT CODED OR ASSIGNED YET
                [3] = { xi.questLog.OTHER_AREAS, xi.quest.id.otherAreas.AN_AFFABLE_ADAMANTKING }, -- NOT CODED OR ASSIGNED YET
                [4] = { xi.questLog.OTHER_AREAS, xi.quest.id.otherAreas.A_MORAL_MANIFEST }, -- NOT CODED OR ASSIGNED YET
            },

            ['Title'] = {
                [1] = xi.title.EPIC_EINHERJAR,
            },

            ['Notorious_Monsters'] = {
                [1] = 'Lustful_Lydia',
                [2] = 'Cunnast',
                [3] = 'Ruea',
                [4] = 'Emputa',
                [5] = 'Golden_Kist',
                [6] = 'Selkit',
            },
        }
    },
    ["Atk/R.Atk"] = {
        cost = 600,
        purchaseOrder = 4,
        values = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11 }, -- These are percentages
        mods = { xi.mod.ATT, xi.mod.RATT },
        purchasedBitIndex = { 15, 14, 13, 12 }, -- vorseals purchased in startEvent and option 9
        purchasedParam = 1, -- vorseals purchased in startEvent and option 9
        unlockParam = { { 2, 3 }, { 2, 10 }, { 2, 21 }, { 2, 27 }, { 3, 14 }, { 3, 20 }, { 4, 3 }, { 4, 9 }, { 6, 21 }, { 6, 27 }, { 7, 17 } }, -- vorseal tier unlock { parameter #, bitIndex }
        unlock = {
            ['Mission'] = {
                [1] = { xi.mission.log_id.WINDURST, xi.mission.id.windurst.MOON_READING },

            },

            ['Quest'] = {
                [1] = { xi.questLog.CRYSTAL_WAR, xi.quest.id.crystalWar.AT_JOURNEYS_END },
                [2] = { xi.questLog.OTHER_AREAS, xi.quest.id.otherAreas.CRY_NOT_CARETAKER }, -- NOT CODED OR ASSIGNED YET
            },

            ['Title'] = {
                [1] = xi.title.DELVER_OF_THE_DEPTHS,
                [2] = xi.title.CHOCOBO_TRAINER, -- wEBSITE SAYS CHOCOBO_ROOKIE HOWEVER THAT DOES NOT EXIST IN THE DATS
            },

            ['Notorious_Monsters'] = {
                [1] = 'Aglaophotis',
                [2] = 'Revetaur',
                [3] = 'Ma',
                [4] = 'Peirithoos',
                [5] = 'Mauve-wristed_Gomberry',
                [6] = 'Sang_Buaya',
            },
        }
    },
    ["M.Acc/M.Eva"] = {
        cost = 600,
        purchaseOrder = 5,
        values = {2, 4, 6, 8, 10, 12, 14, 16, 18, 20, 22},
        mods = { xi.mod.MACC, xi.mod.MEVA },
        purchasedBitIndex = { 19, 18, 17, 16 }, -- vorseals purchased in startEvent and option 9
        purchasedParam = 1, -- vorseals purchased in startEvent and option 9
        unlockParam = { { 2, 4 }, { 2, 11 }, { 2, 22 }, { 2, 28 }, { 3, 15 }, { 3, 21 }, { 4, 4 }, { 4, 10 }, { 6, 22 }, { 6, 28 }, { 7, 18 } }, -- vorseal tier unlock { parameter #, bitIndex }
        unlock = {
            ['Mission'] = {
                [1] = { xi.mission.log_id.ZILART, xi.mission.id.zilart.THE_CELESTIAL_NEXUS },
            },

            ['Quest'] = {
                [1] = { xi.questLog.OTHER_AREAS, xi.quest.id.otherAreas.MONSTROSITY }, -- TODO Reach Level 30 with any species (excluding Final Fantasy XIV Spriggans and Dragon Quest X Slimes) in Monstrosity
            },

            ['Title'] = {
                [1] = xi.title.EXPEDITIONARY_TROOPER,
                [2] = xi.title.WITNESS_TO_PROVENANCE,
            },

            ['Title_Any_Of'] = {  -- Only 1 Tier
                [1] = xi.title.SOLAR_SAGE,
                [2] = xi.title.BOLIDE_BARON,
                [3] = xi.title.MOON_MAVEN,
                [4] = xi.title.SUPERNAL_SAVANT,
            },

            ['Notorious_Monsters'] = {
                [1] = 'Tangata_Manu',
                [2] = 'Ferrodon',
                [3] = 'Khon',
                [4] = 'Asida',
                [5] = 'Dazzling_Dolores',
                [6] = 'Sabotender_Royal',
            },
        }
    },
    ["M.Def"] = { -- TODO addin Coalition Rank: Legend (any)
        cost = 600,
        purchaseOrder = 6,
        values = {2, 4, 6, 8, 10, 12, 14, 16, 18, 20, 22},
        mods = { xi.mod.MDEF },
        purchasedBitIndex = { 23, 22, 21, 20 }, -- vorseals purchased in startEvent and option 9
        purchasedParam = 1, -- vorseals purchased in startEvent and option 9
        unlockParam = { { 2, 5 }, { 2, 12 }, { 2, 23 }, { 2, 29 }, { 3, 16 }, { 3, 22 }, { 4, 5 }, { 4, 11 }, { 6, 23 }, { 6, 29 }, { 7, 19 } }, -- vorseal tier unlock { parameter #, bitIndex }
        unlock = {
            ['Mission'] = {
                [1] = { xi.mission.log_id.COP, xi.mission.id.cop.THE_LAST_VERSE },
                [2] = { xi.mission.log_id.AMK, xi.mission.id.amk.A_MOOGLE_KUPO_DETAT },
            },

            ['Quest_Any_Of'] = {  -- Only 1 Tier
                [1] = { xi.questLog.WINDURST, xi.quest.id.windurst.TRUST_WINDURST },
                [2] = { xi.questLog.SANDORIA, xi.quest.id.sandoria.TRUST_SANDORIA },
                [3] = { xi.questLog.BASTOK, xi.quest.id.bastok.TRUST_BASTOK },
            },

            ['Title_Any_Of'] = {  -- Only 1 Tier
                [1] = xi.title.UMAGRHK_MANEMANGLER,
                [2] = xi.title.MELISSEUS_DOMESTICATOR,
            },

            ['Notorious_Monsters'] = {
                [1] = 'Vidala',
                [2] = 'Gulltop',
                [3] = 'Met',
                [4] = 'Tenodera',
                [5] = 'Taelmoth_the_Diremaw',
                [6] = 'Zduhac',
            },
        }
    },
    ["M.Atk"] = {
        cost = 600,
        purchaseOrder = 7,
        values = {2, 4, 6, 8, 10, 12, 14, 16, 18, 20, 22},
        mods = xi.mod.MATT,
        purchasedBitIndex = { 27, 26, 25, 24 }, -- vorseals purchased in startEvent and option 9
        purchasedParam = 1, -- vorseals purchased in startEvent and option 9
        unlockParam = { { 2, 6 }, { 2, 13 }, { 2, 24 }, { 2, 30 }, { 3, 17 }, { 3, 23 }, { 4, 6 }, { 4, 12 }, { 6, 24 }, { 6, 30 }, { 7, 20 } }, -- vorseal tier unlock { parameter #, bitIndex }
        unlock = {
            ['Mission'] = {
                [1] = { xi.mission.log_id.TOAU, xi.mission.id.toau.ETERNAL_MERCENARY },
                [2] = { xi.mission.log_id.ASA, xi.mission.id.asa.A_SHANTOTTO_ASCENSION },
            },

            ['Quest'] = {
                [1] = { xi.questLog.JEUNO, xi.quest.id.jeuno.MIRROR_IMAGES },
                -- [2] = { xi.questLog.ROV, xi.quest.id.roe.TO_KILL_MOCKING_BIRDS }, -- TODO this does not exist yet
            },

            ['Title'] = {
                [1] = xi.title.ILLUMINATOR_OF_THE_15TH_WALK,
            },

            ['Notorious_Monsters'] = {
                [1] = 'Gestalt',
                [2] = 'Vyala',
                [3] = 'Khun',
                [4] = 'Sava_Savanovic',
                [5] = 'Belphegor',
                [6] = 'Oryx',
            },
        }
    },
    ["DEX/AGI"] = {
        cost = 800,
        purchaseOrder = 8,
        values = {3, 6, 9, 12, 15, 18, 21, 24, 27, 30, 33},
        mods = { xi.mod.DEX, xi.mod.AGI },
        purchasedBitIndex = { 31, 30, 29, 28 }, -- vorseals purchased in startEvent and option 9
        purchasedParam = 1, -- vorseals purchased in startEvent and option 9
        unlockParam = { { 2, 14 }, { 2, 31 }, { 3, 3 }, { 3, 6 }, { 3, 24 }, { 3, 27 }, { 5, 29 }, { 6, 2 }, { 6, 31 }, { 7, 2 }, { 7, 8 } }, -- vorseal tier unlock { parameter #, bitIndex }
        unlock = {
            ['Quest_All'] = {  -- Only 1 Tier
                [1] = { xi.questLog.ABYSSEA, xi.quest.id.abyssea.A_BEAKED_BLUSTERER }, -- TODO these are not coded
                [2] = { xi.questLog.ABYSSEA, xi.quest.id.abyssea.CLASSROOMS_WITHOUT_BORDERS },
                [3] = { xi.questLog.ABYSSEA, xi.quest.id.abyssea.THE_SECRET_INGREDIENT },
                [4] = { xi.questLog.ABYSSEA, xi.quest.id.abyssea.HELP_NOT_WANTED },
                [5] = { xi.questLog.ABYSSEA, xi.quest.id.abyssea.THE_TITUS_TOUCH },
                [6] = { xi.questLog.ABYSSEA, xi.quest.id.abyssea.SLACKING_SUBORDINATES },
                [7] = { xi.questLog.ABYSSEA, xi.quest.id.abyssea.MOTHERLY_LOVE },
                [8] = { xi.questLog.ABYSSEA, xi.quest.id.abyssea.LOOK_TO_THE_SKY },
                [9] = { xi.questLog.ABYSSEA, xi.quest.id.abyssea.THE_UNMARKED_TOMB },
                [10] = { xi.questLog.ABYSSEA, xi.quest.id.abyssea.PROOF_OF_THE_LION },
                [11] = { xi.questLog.ABYSSEA, xi.quest.id.abyssea.BRYGID_THE_STYLIST_STRIKES_BACK },
            },

            ['Notorious_Monsters'] = {
                [1] = 'Ionos',
                [2] = 'Brittlis',
                [3] = 'Blazewing',
                [4] = 'Palila',
                [5] = 'Amymone',
                [6] = 'Byakko',
                [7] = 'Ark_Angel_HM',
                [8] = 'Strophadia',
                [9] = 'Sarsaok',
                [10] = 'Teles',
            },
        }
    },
    ["STR/VIT"] = {
        cost = 800,
        purchaseOrder = 9,
        values = {3, 6, 9, 12, 15, 18, 21, 24, 27, 30, 33},
        mods = { xi.mod.STR, xi.mod.VIT },
        purchasedBitIndex = { 3, 2, 1, 0 }, -- vorseals purchased in startEvent and option 9
        purchasedParam = 2, -- vorseals purchased in startEvent and option 9
        unlockParam = { { 2, 15 }, { 2, 32 }, { 3, 4 }, { 3, 7 }, { 3, 25 }, { 3, 28 }, { 5, 30 }, { 6, 3 }, { 6, 32 }, { 7, 3 }, { 7, 9 } }, -- vorseal tier unlock { parameter #, bitIndex }
        unlock = {
            ['Quest_All'] = {  -- Only 1 Tier
                [1] = { xi.questLog.ABYSSEA, xi.quest.id.abyssea.A_MAN_EATING_MITE }, -- TODO these are not coded
                [2] = { xi.questLog.ABYSSEA, xi.quest.id.abyssea.LET_THERE_BE_LIGHT },
                [3] = { xi.questLog.ABYSSEA, xi.quest.id.abyssea.LOOK_OUT_BELOW },
                [4] = { xi.questLog.ABYSSEA, xi.quest.id.abyssea.HOME_HOME_ON_THE_RANGE },
                [5] = { xi.questLog.ABYSSEA, xi.quest.id.abyssea.IMPERIAL_ESPIONAGE },
                [6] = { xi.questLog.ABYSSEA, xi.quest.id.abyssea.IMPERIAL_ESPIONAGE_II },
                [7] = { xi.questLog.ABYSSEA, xi.quest.id.abyssea.BOREAL_BLOSSOMS },
                [8] = { xi.questLog.ABYSSEA, xi.quest.id.abyssea.BROTHERS_IN_ARMS },
                [9] = { xi.questLog.ABYSSEA, xi.quest.id.abyssea.SCOUTS_ASTRAY },
                [10] = { xi.questLog.ABYSSEA, xi.quest.id.abyssea.FROZEN_FLAME_REDUX },
                [11] = { xi.questLog.ABYSSEA, xi.quest.id.abyssea.SLIP_SLIDIN_AWAY },
            },

            ['Notorious_Monsters'] = {
                [1] = 'Sensual_Sandy',
                [2] = 'Kamohoalii',
                [3] = 'Alpluachra',
                [4] = 'Hanbi',
                [5] = 'Naphula',
                [6] = 'Genbu',
                [7] = 'Ark_Angel_TT',
                [8] = 'Gajasimha',
                [9] = 'Old_Shuck',
                [10] = 'Zerde',
            },
        }
    },
    ["INT/MND/CHR"] = {
        cost = 800,
        purchaseOrder = 10,
        values = {3, 6, 9, 12, 15, 18, 21, 24, 27, 30, 33},
        mods = { xi.mod.INT, xi.mod.MND, xi.mod.CHR },
        purchasedBitIndex = { 7, 6, 5, 4 }, -- vorseals purchased in startEvent and option 9
        purchasedParam = 2, -- vorseals purchased in startEvent and option 9
        unlockParam = { { 2, 16 }, { 3, 1 }, { 3, 5 }, { 3, 8 }, { 3, 26 }, { 3, 29 }, { 5, 31 }, { 6, 4 }, { 7, 1 }, { 7, 4 }, { 7, 10 } }, -- vorseal tier unlock { parameter #, bitIndex }
        unlock = {
            ['Quest_All'] = {  -- Only 1 Tier
                [1] = { xi.questLog.ABYSSEA, xi.quest.id.abyssea.AN_ULCEROUS_URAGNITE }, -- TODO these are not coded
                [2] = { xi.questLog.ABYSSEA, xi.quest.id.abyssea.VOICES_FROM_BEYOND },
                [3] = { xi.questLog.ABYSSEA, xi.quest.id.abyssea.BENEVOLENCE_LOST },
                [4] = { xi.questLog.ABYSSEA, xi.quest.id.abyssea.BRUGAIRES_AMBITION },
                [5] = { xi.questLog.ABYSSEA, xi.quest.id.abyssea.CHOCOBO_PANIC },
                [6] = { xi.questLog.ABYSSEA, xi.quest.id.abyssea.THE_EGG_ENTHUSIAST },
                [7] = { xi.questLog.ABYSSEA, xi.quest.id.abyssea.GETTING_LUCKY },
                [8] = { xi.questLog.ABYSSEA, xi.quest.id.abyssea.HER_FATHERS_LEGACY },
                [9] = { xi.questLog.ABYSSEA, xi.quest.id.abyssea.THE_MYSTERIOUS_HEAD_PATROL },
                [10] = { xi.questLog.ABYSSEA, xi.quest.id.abyssea.MASTER_MISSING_MASTER_MISSED },
                [11] = { xi.questLog.ABYSSEA, xi.quest.id.abyssea.THE_PERILS_OF_KORORO },
            },

            ['Notorious_Monsters'] = {
                [1] = 'Nosoi',
                [2] = 'Umdhlebi',
                [3] = 'Pazuzu',
                [4] = 'Yilan',
                [5] = 'Kammavaca',
                [6] = 'Seiryu',
                [7] = 'Ark_Angel_MR',
                [8] = 'Ironside',
                [9] = 'Bashmu',
                [10] = 'Vinipata',
            },
        }
    },
    ["Occ. Nullifies Damage"] = {
        cost = 10000,
        purchaseOrder = 11,
        values = { 1, 2, 3 }, -- These are percentages
        mods = xi.mod.NULL_DAMAGE,
        purchasedBitIndex = { 11, 10, 9 , 8 }, -- vorseals purchased in startEvent and option 9
        purchasedParam = 2, -- vorseals purchased in startEvent and option 9
        unlockParam = { { 3, 9 }, { 3, 30 }, { 7, 5 } }, -- vorseal tier unlock { parameter #, bitIndex }
        unlock = {
            ['Notorious_Monsters'] = {
                [1] = 'Fleetstalker',
                [2] = 'Pakecet',
                [3] = 'Maju',
            },
        }
    },
    ["Killer Effects"] = {
        cost = 10000,
        purchaseOrder = 12,
        values = { 1, 2, 3 }, -- These are percentages
        mods = { xi.mod.VERMIN_KILLER, xi.mod.BIRD_KILLER, xi.mod.AMORPH_KILLER, xi.mod.LIZARD_KILLER, xi.mod.AQUAN_KILLER, xi.mod.PLANTOID_KILLER, xi.mod.BEAST_KILLER, xi.mod.UNDEAD_KILLER, xi.mod.ARCANA_KILLER, xi.mod.DRAGON_KILLER, xi.mod.DEMON_KILLER, xi.mod.EMPTY_KILLER, xi.mod.HUMANOID_KILLER, xi.mod.LUMINIAN_KILLER, xi.mod.LUMINION_KILLER },
        purchasedBitIndex = { 15, 14, 13, 12 }, -- vorseals purchased in startEvent and option 9
        purchasedParam = 2, -- vorseals purchased in startEvent and option 9
        unlockParam = { { 3, 10 }, { 3, 31 }, { 7, 6 } }, -- vorseal tier unlock { parameter #, bitIndex }
        unlock = {
            ['Notorious_Monsters'] = {
                [1] = 'Shockmaw',
                [2] = 'Duke_Vapar',
                [3] = 'Yakshi',
            },
        }
    },
    ["Damage Taken"] = {
        cost = 10000,
        purchaseOrder = 13,
        values = { -1, -2, -3 }, -- These are percentages
        mods = xi.mod.DMG,
        purchasedBitIndex = { 19, 18, 17, 16 }, -- vorseals purchased in startEvent and option 9
        purchasedParam = 2, -- vorseals purchased in startEvent and option 9
        unlockParam = { { 3, 11 }, { 3, 32 }, { 7, 7 } }, -- vorseal tier unlock { parameter #, bitIndex }
        unlock = {
            ['Notorious_Monsters'] = {
                [1] = 'Urmahlulu',
                [2] = 'Virava',
                [3] = 'Neak',
            },
        }
    },
    ["Spoils"] = { -- Kill Escha NM [RoD]NM_Counter
        cost = 50000,
        purchaseOrder = 14,
        values = { 5, 10, 15, 20, 25, 30, 35, 40, 45, 50, 55 }, -- These are percentages
        purchasedBitIndex = { 23, 22, 21, 20 }, -- vorseals purchased in startEvent and option 9
        purchasedParam = 2, -- vorseals purchased in startEvent and option 9
        unlockParam = { { 4, 28 }, { 4, 29 }, { 4, 30 }, { 4, 31 }, { 4, 32 }, { 5, 1 }, { 5, 2 }, { 5, 3 }, { 5, 4 }, { 5, 5 }, { 5, 6 } }, -- vorseal tier unlock { parameter #, bitIndex }
        unlock = {
            ['Kill_Count_Escha_NM'] = {
                [1] = 10,
                [2] = 25,
                [3] = 50,
                [4] = 100,
                [5] = 200,
                [6] = 350,
                [7] = 550,
                [8] = 800,
                [9] = 1100,
                [10] = 1500,
                [11] = 2000,
            },
        }
    },
    ["Rare Enemy"] = { -- need to set a local variable and then check in on the NM place holders
        cost = 1000,
        purchaseOrder = 15,
        values = { 1.06, 1.14, 1.22, 1.32, 1.43, 1.56, 1.72, 1.92, 2.17, 2.50, 2.94 }, -- {"1/94", "1/88", "1/82", "1/76", "1/70", "1/64", "1/58", "1/52", "1/46", "1/40", "1/34"},
        purchasedBitIndex = { 27, 26, 25, 24 }, -- vorseals purchased in startEvent and option 9
        purchasedParam = 2, -- vorseals purchased in startEvent and option 9
        unlockParam = { { 2, 7 }, { 2, 17 }, { 4, 15 }, { 4, 16 }, { 6, 1 }, { 6, 7 }, { 7, 21 }, { 7, 22 }, { 7, 23 }, { 7, 24 }, { 7, 25 } }, -- vorseal tier unlock { parameter #, bitIndex }
        unlock = {
            ['Mission'] = {
                [1] = { xi.mission.log_id.WOTG, xi.mission.id.wotg.LEST_WE_FORGET },
                [2] = { xi.mission.log_id.SOA, xi.mission.id.soa.THE_LIGHT_WITHIN },
                [3] = { xi.mission.log_id.ROV, xi.mission.id.rov.NARY_A_CLOUD_IN_SIGHT },
            },

            ['Quest'] = {
                [1] = { xi.questLog.ABYSSEA, xi.quest.id.abyssea.THE_WYRM_GOD },
                [2] = { xi.questLog.ABYSSEA, xi.quest.id.abyssea.TENUOUS_EXISTENCE },
            },

            ['Title'] = {
                [1] = xi.title.LEGENDARY_LEGIONNAIRE,
                [2] = xi.title.WITNESS_TO_PROVENANCE,
                [3] = xi.title.CURATOR_CULLER,
            },

            ['Title_Any_Of'] = { -- Only 1 Tier
                [1] = xi.title.APOLLYON_RAZER,
                [2] = xi.title.TEMENOS_EMANCIPATOR,
            },

            ['Notorious_Monsters'] = {
                [1] = 'Kirin',
                [2] = 'Warders_of_Courage',
            },
        }
    },
    ["Luck"] = {
        cost = 1000,
        purchaseOrder = 16,
        eschan_portal_cost = true,
        values = { -5, -10, -15, -20, -25, -30, -35, -40, -45, -50, -55 }, -- These are percentages
        eschan_beads = {2, 3, 4, 5, 6, 7, 8, 9, 10, 11},
        purchasedBitIndex = { 31, 30, 29, 28 }, -- vorseals purchased in startEvent and option 9
        purchasedParam = 2, -- vorseals purchased in startEvent and option 9
        unlockParam = { { 2, 18 }, { 2, 2 }, { 4, 13 }, { 4, 14 }, { 5, 32 }, { 6, 5 }, { 6, 6 }, { 7, 11 }, { 7, 12 }, { 7, 13 }, { 7, 14 } }, -- vorseal tier unlock { parameter #, bitIndex }
        unlock = {
            ['Mission'] = {
                [1] = { xi.mission.log_id.ROV, xi.mission.id.rov.VOLTO_OSCURO },
                [2] = { xi.mission.log_id.ROV, xi.mission.id.rov.UNCERTAIN_FUTURES },
            },

            ['Title'] = {
                [1] = xi.title.DEAD_BODY,
                [2] = xi.title.FROZEN_DEAD_BODY,
                [3] = xi.title.TOXIN_TUSSLER,
            },

            ['Notorious_Monsters'] = {
                [1] = 'Wrathare',
                [2] = 'Suzaku',
                [3] = 'Ark_Angel_EV',
                [4] = 'Ark_Angel_GK',
                [5] = 'Schah',
                [6] = 'Albumen',
                [7] = 'Onychophora',
                [8] = 'Erinys',
            },
        }
    },
    ["Regen"] = { -- Kill DI NM [RoD]Kill_Count_Azi_Dahaka
        cost = 1500,
        purchaseOrder = 17,
        values = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11},
        mods = xi.mod.REGEN,
        purchasedBitIndex = { 3, 2, 1, 0 }, -- vorseals purchased in startEvent and option 9
        purchasedParam = 3, -- vorseals purchased in startEvent and option 9
        unlockParam = { { 5, 7 }, { 5, 8 }, { 5, 9 }, { 5, 10 }, { 5, 11 }, { 5, 12 }, { 5, 13 }, { 5, 14 }, { 5, 15 }, { 5, 16 }, { 5, 17 } }, -- vorseal tier unlock { parameter #, bitIndex }
        unlock = {
            ['Kill_Count_Azi_Dahaka'] = {
                [1] = 1,
                [2] = 5,
                [3] = 10,
                [4] = 20,
                [5] = 40,
                [6] = 60,
                [7] = 80,
                [8] = 100,
                [9] = 160,
                [10] = 240,
                [11] = 360,
            },
        }
    },
    ["Refresh"] = { -- Kill DI NM [RoD]Kill_Count_Naja_Raja
        cost = 1500,
        purchaseOrder = 18,
        values = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11},
        mods = xi.mod.REFRESH,
        purchasedBitIndex = { 7, 6, 5, 4, }, -- vorseals purchased in startEvent and option 9
        purchasedParam = 3, -- vorseals purchased in startEvent and option 9
        unlockParam = { { 5, 18 }, { 5, 19 }, { 5, 20 }, { 5, 21 }, { 5, 22 }, { 5, 23 }, { 5, 24 }, { 5, 25 }, { 5, 26 }, { 5, 27 }, { 5, 28 } }, -- vorseal tier unlock { parameter #, bitIndex }
        unlock = {
            ['Kill_Count_Naja_Raja'] = {
                [1] = 1,
                [2] = 5,
                [3] = 10,
                [4] = 20,
                [5] = 40,
                [6] = 60,
                [7] = 80,
                [8] = 100,
                [9] = 160,
                [10] = 240,
                [11] = 360,
            },
        }
    },
    ["Accuracy"] = { -- Kill DI NM [RoD]Kill_Count_Quetzalcoatl
        cost = 1500,
        purchaseOrder = 19,
        values = {5, 10, 15, 20, 25, 30, 35, 40, 45, 50, 55},
        mods = xi.mod.ACC,
        purchasedBitIndex = { 11, 10, 9, 8 }, -- vorseals purchased in startEvent and option 9
        purchasedParam = 3, -- vorseals purchased in startEvent and option 9
        unlockParam = { { 6, 8 }, { 6, 9 }, { 6, 10 }, { 6, 11 }, { 6, 12 }, { 6, 13 }, { 6, 14 }, { 6, 15 }, { 6, 16 }, { 6, 17 }, { 6, 18 } }, -- vorseal tier unlock { parameter #, bitIndex }
        unlock = {
            ['Kill_Count_Quetzalcoatl'] = {
                [1] = 1,
                [2] = 5,
                [3] = 10,
                [4] = 20,
                [5] = 40,
                [6] = 60,
                [7] = 80,
                [8] = 100,
                [9] = 160,
                [10] = 240,
                [11] = 360,
            },
        }
    }
}

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
        { 'Kirin' },
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
        { 'Urmahlulu' },
    },

    [xi.zone.REISENJIMA] =
    {
        { 'Belphegor' },
        { 'Crom_Dubh' },
        { 'Dazzling_Dolores' },
        { 'Golden_Kist' },
        { 'Kabandha' },
        { 'Mauve-wristed_Gomberry' },
        { 'Oryx' },
        { 'Sabotender_Royal' },
        { 'Sang_Buaya' },
        { 'Selkit' },
        { 'Taelmoth_the_Diremaw' },
        { 'Zduhac' },
        { 'Bashmu' },
        { 'Gajasimha' },
        { 'Ironside' },
        { 'Old_Shuck' },
        { 'Sarsaok' },
        { 'Strophadia' },
        { 'Maju' },
        { 'Neak' },
        { 'Yakshi' },
        { 'Albumen' },
        { 'Erinys' },
        { 'Onychophora' },
        { 'Schah' },
        { 'Teles' },
        { 'Vinipata' },
        { 'Zerde' },
    }
}

local function getDefeatedGeasFeteNMs(player)
    local zone = player:getZoneID()
    local nmTable = geaFeteNM[zone]
    local defeatedNMs = {}

    if not nmTable then
        return defeatedNMs
    end

    local varName = '[RoD]GeaFetesDefeated' .. zone
    local bitmask = player:getCharVar(varName)

    local bitIndex = 0

    for i = 1, #nmTable do
        local entry = nmTable[i]

        for j = 1, #entry do
            local nmName = entry[j]

            if utils.mask.getBit(bitmask, bitIndex) then
                table.insert(defeatedNMs, nmName)
            end

            bitIndex = bitIndex + 1
        end
    end

    return defeatedNMs
end


local function tempItemParams(player, itemParamOne, itemParamTwo)
    local itemParamOne = 0
    local itemParamTwo = 0
    local bitReversal  = true
    local keyItemIndex = tempItemReqs[requirementIndex.KEYITEMS]
    local geasFeteIndex = tempItemReqs[requirementIndex.GEASFETEKILLS]
    local mobKillsIndex = tempItemReqs[requirementIndex.MOBKILLS]
    local nmKillsIndex = tempItemReqs[requirementIndex.NMKILLS]
    local noneIndex = tempItemReqs[requirementIndex.NONE]
    local defeatedNMs = getDefeatedGeasFeteNMs(player)

        for i = 1, #keyItemIndex do
            if not player:hasItem(keyItemIndex[i].item) and
                player:hasKeyItem(keyItemIndex[i].requirement) then
                    bitReversal = false
            elseif player:hasItem(keyItemIndex[i].item) and
                player:hasKeyItem(keyItemIndex[i].requirement) then
                    bitReversal = true
            end

            if keyItemIndex[i].param == 1 then
                itemParamOne = utils.mask.setBit(itemParamOne, keyItemIndex[i].bitIndex -1, bitReversal)
            elseif keyItemIndex[i].param == 2 then
                itemParamTwo = utils.mask.setBit(itemParamTwo, keyItemIndex[i].bitIndex -1, bitReversal)
            end
        end

        for i = 1, #geasFeteIndex do
            local geaFeteKills = true
            local defeatedLookup = {}

            for _, name in ipairs(defeatedNMs) do
                defeatedLookup[name] = true
            end

            local requirements = geasFeteIndex[i].requirement

            local function tempItemCheckRequirements(reqList)
                for _, name in ipairs(reqList) do
                    if type(name) == "table" then
                        if tempItemCheckRequirements(name) then
                            return false
                        end
                    elseif defeatedLookup[name] then
                        return false
                    end
                end
                return true
            end

            geaFeteKills = tempItemCheckRequirements(requirements)

            if player:hasItem(geasFeteIndex[i].item) then
                geaFeteKills = true
            end

            if geasFeteIndex[i].param == 1 then
                itemParamOne = utils.mask.setBit(itemParamOne, geasFeteIndex[i].bitIndex - 1, geaFeteKills)
            elseif geasFeteIndex[i].param == 2 then
                itemParamTwo = utils.mask.setBit(itemParamTwo, geasFeteIndex[i].bitIndex - 1, geaFeteKills)
            end
        end

        for i = 1, #mobKillsIndex do
            local mobKills = true

            if player:getCharVar('[RoD]Mob_Counter') >= mobKillsIndex[i].requirement then
                mobKills = false
            end

            if player:hasItem(mobKillsIndex[i].item) then
                nmKills = true
            end

            if mobKillsIndex[i].param == 1 then
                itemParamOne = utils.mask.setBit(itemParamOne, mobKillsIndex[i].bitIndex -1, mobKills)
            elseif mobKillsIndex[i].param == 2 then
                itemParamTwo = utils.mask.setBit(itemParamTwo, mobKillsIndex[i].bitIndex -1, mobKills)
            end
        end

        for i = 1, #nmKillsIndex do
            local nmKills = true

            if player:getCharVar('[RoD]NM_Counter') >= nmKillsIndex[i].requirement then
                nmKills = false
            end

            if player:hasItem(nmKillsIndex[i].item) then
                nmKills = true
            end

            if nmKillsIndex[i].param == 1 then
                itemParamOne = utils.mask.setBit(itemParamOne, nmKillsIndex[i].bitIndex -1, nmKills)
            elseif nmKillsIndex[i].param == 2 then
                itemParamTwo = utils.mask.setBit(itemParamTwo, nmKillsIndex[i].bitIndex -1, nmKills)
            end
        end

        for i = 1, #noneIndex do
            local bitSet = true

            if player:hasItem(noneIndex[i].item) then
                bitSet = false
            end

            if noneIndex[i].param == 1 then
                itemParamOne = utils.mask.setBit(itemParamOne, noneIndex[i].bitIndex -1, bitSet)
            elseif noneIndex[i].param == 2 then
                itemParamTwo = utils.mask.setBit(itemParamTwo, noneIndex[i].bitIndex -1, bitSet)
            end
        end

    return itemParamOne, itemParamTwo
end

local function getGrislyTrinkets(player)
    local zoneID = player:getZone():getID()
    local trinketsForZone = grislyTrinkets[zoneID]
    local defeatedNMs = getDefeatedGeasFeteNMs(player)

    local trinketParam = 0

    local defeatedLookup = {}
    for _, name in ipairs(defeatedNMs) do
        defeatedLookup[name] = true
    end

    local allTier1Defeated = true
    local allTier2Defeated = true

    if trinketsForZone then
        for i = 1, 12 do
            trinketParam = utils.mask.setBit(trinketParam, i - 1, true)

            local kiData = trinketsForZone[i]
            local nmName = kiData and kiData[2]
            if not nmName or not defeatedLookup[nmName] then
                allTier1Defeated = false
            end
        end

        for i = 13, 19 do
            local kiData = trinketsForZone[i]
            local nmName = kiData and kiData[2]
            if not nmName or not defeatedLookup[nmName] then
                allTier2Defeated = false
                break
            end
        end

        if allTier1Defeated then
            for i = 13, 19 do
                trinketParam = utils.mask.setBit(trinketParam, i - 1, true)
            end
        end

        if allTier2Defeated then
            for i = 20, 21 do
                trinketParam = utils.mask.setBit(trinketParam, i - 1, true)
            end
        end
    end

    return trinketParam
end

local function getVorsealParams(player)
    local vorsealBits1, vorsealBits2, vorsealBits3, vorsealBits4, vorsealBits5, vorsealBits6 = 0, 0, 0, 0, 0, 0
    local defeatedNMsCache = getDefeatedGeasFeteNMs(player) -- Cache once

    for key, data in pairs(vorsealData) do
        local purchasedParam = data.purchasedParam
        if purchasedParam and data.unlock and data.purchasedBitIndex then
            local tier = 0
            local tierSetByNM = false

            -- First: check if Notorious_Monsters is a requirement
            for unlockType, unlockData in pairs(data.unlock) do
                if unlockType == "Notorious_Monsters" then
                    local defeatedCount = 0

                    for _, nmName in ipairs(unlockData) do
                        for _, defeatedName in ipairs(defeatedNMsCache) do
                            if nmName == defeatedName then
                                defeatedCount = defeatedCount + 1
                                break
                            end
                        end
                    end

                    tier = math.min(defeatedCount, #data.values)
                    tierSetByNM = true

                    break -- No need to process more unlocks
                end
            end

            -- If tier wasn't set by NM logic, run normal unlock checks per tier
            if not tierSetByNM then
                for t = 1, #data.values do
                    local qualifies = true

                    for unlockType, unlockData in pairs(data.unlock) do
                        if unlockType == "Mission" then
                            local mission = unlockData[t]
                            if not (mission and player:hasCompletedMission(mission[1], mission[2])) then
                                qualifies = false
                                break
                            end

                        elseif unlockType == "Quest" then
                            local quest = unlockData[t]
                            if not (quest and player:hasCompletedQuest(quest[1], quest[2])) then
                                qualifies = false
                                break
                            end

                        elseif unlockType == "Title" then
                            local title = unlockData[t]
                            if not (title and player:hasTitle(title)) then
                                qualifies = false
                                break
                            end

                        elseif unlockType == "Kill_Count_Escha_Mob" then
                            if player:getCharVar('[RoD]Mob_Counter') < unlockData[t] then
                                qualifies = false
                                break
                            end

                        elseif unlockType == "Kill_Count_Escha_NM" then
                            if player:getCharVar('[RoD]NM_Counter') < unlockData[t] then
                                qualifies = false
                                break
                            end

                        elseif unlockType == "Kill_Count_Azi_Dahaka" then
                            if player:getCharVar('[RoD]Kill_Count_Azi_Dahaka') < unlockData[t] then
                                qualifies = false
                                break
                            end

                        elseif unlockType == "Kill_Count_Naja_Raja" then
                            if player:getCharVar('[RoD]Kill_Count_Naja_Raja') < unlockData[t] then
                                qualifies = false
                                break
                            end

                        elseif unlockType == "Kill_Count_Quetzalcoatl" then
                            if player:getCharVar('[RoD]Kill_Count_Quetzalcoatl') < unlockData[t] then
                                qualifies = false
                                break
                            end

                        elseif unlockType == "Quest_Any_Of" then
                            if not utils.any(unlockData, function(_, quest) return player:hasCompletedQuest(quest[1], quest[2]) end) then
                                qualifies = false
                                break
                            end

                        elseif unlockType == "Title_Any_Of" then
                            if not utils.any(unlockData, function(_, titleId) return player:hasTitle(titleId) end) then
                                qualifies = false
                                break
                            end

                        elseif unlockType == "Quest_All" then
                            if not utils.all(unlockData, function(_, quest) return player:hasCompletedQuest(quest[1], quest[2]) end) then
                                qualifies = false
                                break
                            end
                        end
                    end

                    if qualifies then
                        tier = t
                    else
                        break
                    end
                end
            end

            -- Also set unlockParam bits for all unlocked tiers
            if data.unlockParam then
                for i = 1, tier do
                    local unlockParamEntry = data.unlockParam[i]
                    if unlockParamEntry then
                        local paramNum = unlockParamEntry[1]
                        local bitIndex = unlockParamEntry[2]

                        if paramNum == 2 then
                            vorsealBits1 = utils.mask.setBit(vorsealBits1, bitIndex -1, true)
                        elseif paramNum == 3 then
                            vorsealBits2 = utils.mask.setBit(vorsealBits2, bitIndex -1, true)
                        elseif paramNum == 4 then
                            vorsealBits3 = utils.mask.setBit(vorsealBits3, bitIndex -1, true)
                        elseif paramNum == 5 then
                            vorsealBits4 = utils.mask.setBit(vorsealBits4, bitIndex -1, true)
                        elseif paramNum == 6 then
                            vorsealBits5 = utils.mask.setBit(vorsealBits5, bitIndex -1, true)
                        elseif paramNum == 7 then
                            vorsealBits6 = utils.mask.setBit(vorsealBits6, bitIndex -1, true)
                        end
                    end
                end
            end

            if key == "Spoils" then
                player:setCharVar("[Vorseal]Spoils", tier)
            elseif key == "Rare Enemy" then
                player:setCharVar("[Vorseal]Rare Enemy", tier)
            elseif key == "Luck" then
                player:setCharVar("[Vorseal]Luck", tier)
            end
        end
    end

    return vorsealBits1, vorsealBits2, vorsealBits3, vorsealBits4, vorsealBits5, vorsealBits6
end

local function getPurchasedVorsealParams(player)
    local vorsealEffectBits1, vorsealEffectBits2, vorsealEffectBits3 = 0, 0, 0

    for key, data in pairs(vorsealData) do
        local tier = player:getCharVar('[Vorseal]' .. key) or 0
        local totalBits = #data.purchasedBitIndex
        local purchasedParam = data.purchasedParam

        -- Clamp tier to available bits
        if tier > totalBits then
            tier = totalBits
        end

        for i = 1, totalBits do
            local bitIndex = data.purchasedBitIndex[i]
            local bitPos = totalBits - i
            local bitSet = bit.band(tier, bit.lshift(1, bitPos)) ~= 0

            if purchasedParam == 1 then
                vorsealEffectBits1 = utils.mask.setBit(vorsealEffectBits1, bitIndex, bitSet)
            elseif purchasedParam == 2 then
                vorsealEffectBits2 = utils.mask.setBit(vorsealEffectBits2, bitIndex, bitSet)
            elseif purchasedParam == 3 then
                vorsealEffectBits3 = utils.mask.setBit(vorsealEffectBits3, bitIndex, bitSet)
            end
        end
    end

    return vorsealEffectBits1, vorsealEffectBits2, vorsealEffectBits3
end

local function applyVorsealEffects(player) -- what to do if player upgrades after this is applied also does it reset time if upgraded?????????
    for key, data in pairs(vorsealData) do
        local tier = player:getCharVar('[Vorseal]' .. key) or 0

        if tier > 0 and data.values and data.values[tier] then
            local value = data.values[tier]
            local mods = data.mods

            -- If mods is not a table, convert it to a single-element table
            if type(mods) ~= "table" then
                mods = { mods }
            end

            for _, mod in ipairs(mods) do
                player:addMod(mod, value)
            end
        end
    end
end

local function delVorsealEffects(player)
    for key, data in pairs(vorsealData) do
        local tier = player:getCharVar('[Vorseal]' .. key) or 0

        if tier > 0 and data.values[tier] then
            local valueToRemove = data.values[tier]
            local mods = data.mods

            -- Remove either single mod or list of mods
            if type(mods) == "table" then
                for _, modId in ipairs(mods) do
                    player:delMod(modId, valueToRemove)
                end
            else
                player:delMod(mods, valueToRemove)
            end
        end
    end
end

local function eligibleForVorseal(player)
    for key, data in pairs(vorsealData) do
        local tier = player:getCharVar('[Vorseal]' .. key) or 0
        if tier > 0 then
            return true
        end
    end
    return false
end

local function getBits(option)
    local results = {}

    for i = 0, 32 do
        results[#results + 1] = bit.band(bit.rshift(option, i), 0xF)
    end

end

xi.geasFeteNPC.npcOnTrade = function(player, npc, trade)
    local npcZone = npc:getZoneID()
    local tradeItemsTable = grislyTrinketsTrade['TRADES'][npcZone]

    if tradeItemsTable then
        for k, tradeEntry in pairs(tradeItemsTable) do
            if npcUtil.tradeHasExactly(trade, tradeEntry.trade ) then
                if tradeEntry.csid == nil then
                    if npcUtil.giveKeyItem(player, tradeEntry.keyItem) then
                        player:tradeComplete()
                        player:messageSpecial(zones[xi.zone.ESCHA_ZITAH].text.AFFI_KEYITEM_OBTAINED)
                        return
                    end
                end

                player:setLocalVar("GeasFeteTradeItem", tradeEntry.trade[1][1])
                player:setLocalVar("GeasFeteTradeQty", tradeEntry.trade[1][2])
                player:tradeComplete()

                player:startEvent(tradeEntry.csid,0,0,getGeasFetesPurchasedKI(player))
                return
            end
        end
    end
end


xi.geasFeteNPC.npcOnTrigger = function(player, npc)
    local currency = player:getCurrency('escha_silt')
    local initialConvoCheck = getInitialConversation(player)
    local dialog = getDialog(player)
    local vorsealEffectBits1, vorsealEffectBits2, vorsealEffectBits3 = getPurchasedVorsealParams(player)

    if not initialConvoCheck then -- initial dialog from npcs, in capture they are event 9700 however 9700 forces an exit out of the event which is not capabale at the moment
        local zone = player:getZoneID()
        local textID = geasFeteText[zone]

        local i = 1
        while true do
            local key = "GF_INITIAL_DIALOG_" .. i
            if textID[key] == nil then
                break
            end
            player:messageSpecial(textID[key])
            i = i + 1
        end
        setConversation(player)

    elseif initialConvoCheck then
        player:startEvent(9701, 2096128, currency, dialog, 0, vorsealEffectBits1, vorsealEffectBits2, vorsealEffectBits3, 0)
    end
    --[[
    ***4294967295 = 11111111111111111111111111111111 ***

    2096136 =
    Domain Inv???     Area Blessing         Domain Inv
    0000 0000     ( 0001 1111 1111 1100 )    0000 1000
    area blessing ( 0 0 0 courage, mercy, loyalty, dignity, compassion, wisdom, hope, justice, piety, fortitude, temperance 0 0)
    2096128 - 0000 0000 0001 1111 1111 1100 0000 0000 - no DI options
    2096129 - 00000000000111111111110000000001 - Receive elvorseal option
    2096130 - 00000000000111111111110000000010 - Receive elvorseal option
    2096132 - 00000000000111111111110000000100 - no DI Options
    2096136 - 00000000000111111111110000001000 - no DI Options
    2096144 - 00000000000111111111110000010000 - no DI Options
    2096160 - 00000000000111111111110000100000 - no DI Options
    2096192 - 00000000000111111111110001000000 - no DI Options
    2096256 - 00000000000111111111110010000000 - no DI Options
    2096384 - 00000000000111111111110100000000 - no DI Options
    2096640 - 00000000000111111111111000000000 - no DI Options
    18873344 - 00000001000111111111110000000000 - no DI Options
    35650560 - 00000010000111111111110000000000 - no DI Options
    69204992 - 00000100000111111111110000000000 - no DI Options
    136313856 - 00001000000111111111110000000000 - no DI Options
    270531584 - 00010000000111111111110000000000 - no DI Options
    538967040 - 00100000000111111111110000000000 - no DI Options
    1075837952 - 01000000000111111111110000000000 - no DI Options
    2149579776 - 10000000000111111111110000000000 - no DI Options
    2149579778 - 10000000000111111111110000000010 - return elvorseal & teleport to target monster (must have DI option enable to 1 for this option to show up)
                 ^ turns dialog from receive to return elvorseal (player:hasStatusEffect())

    Eliijah
    get - 2096177 -          0000 0000 0001 1111 1111 1100 0011 0001
    teleport - -2145387471 - 1000 0000 0001 1111 1111 1100 0011 0001
    return - -2145387471 -   1000 0000 0001 1111 1111 1100 0011 0001

    while di has started x4 (1 before mobs spawned, 2 after initial mobs spawn, 3 boss spawn, 4 DI over)
    ** i do not have elvorseal ( status id 603 ) at this point
    1.2096178 -      0000 0000 0001 1111 1111 1100 0011 0010
    2.2096178 -      0000 0000 0001 1111 1111 1100 0011 0010
    3.2096914 -      0000 0000 0001 1111 1111 1111 0001 0010
    4.2096136 -      0000 0000 0001 1111 1111 1100 0000 1000

    ** checking again with elvorseal active
    1. -2145387511 - 1000 0000 0001 1111 1111 1100 0000 1001
    2. -2145387510 - 1000 0000 0001 1111 1111 1100 0000 1010
    3. -2145386750 - 1000 0000 0001 1111 1111 1111 0000 0010
    4.     2096136 - 0000 0000 0001 1111 1111 1100 0000 1000

    1024 - Temperance	Halves the silt cost of Eschan Portals. 100
    2048 - Fortitude	Increases effects of Vorseals that increase base stats. 1000
    4096 - Piety	Doubles the effect duration of Vorseals. 1 0000
    8192 -Justice	Increases "Treasure Hunter" by 1. 10 0000
    16384 - Hope	Increases the chances of an emblazoned reliquary appearing. 100 0000
    32768 - Wisdom	Doubles the effect duration of food 1000 0000
    65536 - Compassion	Increases the "Refresh," "Regen," and "Accuracy++" effects of Vorseals. 1 0000 0000
    131072 - Dignity	Increases escha silt yields. 10 0000 0000
    262144 - Loyalty	Increases escha bead yields. 100 0000 0000
    524288 - Mercy	Key ItemReapers and Key Itemtribulenses have a chance of not being consumed. 1000 0000 0000
    1048576 - Courage	Increases the "Rare enemy+" effects of Vorseals. 1 0000 0000 0000









[18:57:50] [ID View] INCOMING < CS Event + Params (0x034): NPC: 17957449 (Affi), Event: 9701, Params: 2096136, 791791, 117441022, 0, 16, 268435456, 0, 0
[18:57:51] [ID View] OUTGOING > Event Option (0x05B): NPC: 17957449 (Affi), Event: 9701, Option: 14
[18:57:51] [ID View] INCOMING < Event Update (0x05C): Params: 536879104, 31744, 0, 0, 0, 0, 0, 0
[18:57:52] [ID View] OUTGOING > Event Option (0x05B): NPC: 17957449 (Affi), Event: 9701, Option: 8
[18:57:52] [ID View] INCOMING < Event Update (0x05C): Params: 119, 467861562, -7792894, -125886448, 393664, 254, 1048576, 233471
[18:57:53] [ID View] OUTGOING > Event Option (0x05B): NPC: 17957449 (Affi), Event: 9701, Option: 9
[18:57:53] [ID View] INCOMING < Event Update (0x05C): Params: 2096136, 791791, 117441022, 0, 16, 268435456, 0, 0

    ]]--

end


local function isGeaFeteNM(mob)
    local zoneId = mob:getZoneID()
    local mobName = mob:getName()

    local zoneTable = geaFeteNM[zoneId]
    if not zoneTable then
        return false
    end

    for _, entry in ipairs(zoneTable) do
        if entry[1] == mobName then
            return true
        end
    end

    return false
end

local zoneMax =
{
    [xi.zone.ESCHA_RUAUN] = -1,
    [xi.zone.ESCHA_ZITAH] = 134217727,
    [xi.zone.REISENJIMA]  = 268435455,
}

local removableKeyItems =
{
    xi.ki.RADIALENS,
    xi.ki.MOLLIFIER,
}

-- Remove KIs
local function removeGeasFeteKIs(player)
    for _, keyItem in ipairs(removableKeyItems) do
        if player:hasKeyItem(keyItem) then
            player:delKeyItem(keyItem)
        end
    end
end

-- Helper: check if player has completed zone
local function addGeasFeteKIs(player)
        if not player:hasKeyItem(xi.ki.RADIALENS) then
            player:addKeyItem(xi.ki.RADIALENS)
        end
end

local function hasCompletedZone(player, zone)
    local maxValue = zoneMax[zone]
    if not maxValue then
        return false
    end

    local varName = '[RoD]GeaFetesDefeated' .. zone
    local bitmask = player:getCharVar(varName)

    return bitmask >= maxValue
end

xi.geasFete.afterZoneIn = function(player)
    local zone = player:getZoneID()
    local isTrackedZone = zoneMax[zone] ~= nil

    if isTrackedZone then
        if hasCompletedZone(player, zone) then
            addGeasFeteKIs(player)
        else
            removeGeasFeteKIs(player)
        end
    end
--[[
    if eligibleForVorseal(player) then
        player:addStatusEffect(xi.effect.VORSEAL,
        {
            duration = 3600,
            origin   = player,
            tick     = 3,
            icon     = xi.effect.VORSEAL,
        })
    end
]]--
    player:addListener('EXPERIENCE_POINTS', 'ESCHA_BEADS',
        function(playerObj, mobObj, expGained)
            if playerObj:isDead() then
                return
            end

            if isGeaFeteNM(mobObj) then
                local beadsToAdd = math.floor(expGained / 100)
                if beadsToAdd > 0 then
                    playerObj:addCurrency('escha_beads', beadsToAdd)
                end
            end
        end
    )
end

xi.geasFete.onZoneOut = function(player)
    local zone = player:getZoneID()

    if player:hasStatusEffect(xi.effect.VORSEAL) then
        player:delStatusEffect(xi.effect.VORSEAL)
    end

    player:removeListener('ESCHA_BEADS')

    if not zoneMax[zone] then
        return
    end

    if hasCompletedZone(player, zone) then
        return
    end

    removeGeasFeteKIs(player)
end

xi.geasFeteNPC.npcOnEventUpdate = function(player, csid, option, npc)
    local menuSelection = bit.band(option, 0xF)
    local itemSelected = bit.rshift(option, 8)
    local vorsealSelected = bit.band(bit.rshift(option,8), 0xFF)
    local vorsealTier = bit.rshift(option, 16)


    if csid == 9701 then
        if option == 2 then
            setConversation(player)
        end

        if option == 14 then
            local tempItemParamOne = tempItemParams(player) -- temp item 1-32 (4294967295 has all) (32767 has all)
            local _, tempItemParamTwo = tempItemParams(player) -- temp items 33-47 (32767 has all)

            player:updateEvent(tempItemParamOne, tempItemParamTwo, 0, 0, 0, 0, 0, 0)
        end

        if option == 8 then
            local grislyTrinkerParam = getGrislyTrinkets(player)
            local vorsealBits1, vorsealBits2, vorsealBits3, vorsealBits4, vorsealBits5, vorsealBits6 = getVorsealParams(player) -- vorseal tiers unlocked
            --TODO continue research on what the 1st parameter is, still unknown (12)
            player:updateEvent(0,vorsealBits1, vorsealBits2, vorsealBits3, vorsealBits4, vorsealBits5, vorsealBits6, grislyTrinkerParam)

        end

        if option == 9 then
            local dialog = getDialog(player)
            local currency = player:getCurrency('escha_silt')
            local vorsealEffectBits1, vorsealEffectBits2, vorsealEffectBits3 = getPurchasedVorsealParams(player) -- vorseals upgraded effect received, return check menus

            --                 area blessing & ???? / currency / diaglog / ? / ve1 / ve2 / ve3 / ???
            player:updateEvent(2096128, currency, dialog, 0, vorsealEffectBits1, vorsealEffectBits2, vorsealEffectBits3, 0)
        end

        if option == 3 then -- receive KI's menu

            --[[ TODO identify what each parameter controls
            OUTGOING > Event Option (0x05B):  NPC: 17961711 (Dremi)
            Event: 9701
            Option: 3

            INCOMING < Event Update (0x05C):
            Params: 0, 200, 116140, -40475, -148619, -1324, 578147, 0


            param 1 = Tribulens cost????

            ]]--
        end

        if menuSelection == 4 then -- purchase KI items in option 3
            local keyItemSelected = bit.rshift(option, 8)

            for kiOption, keyItemTable in pairs(eschaKeyItems) do
                if kiOption == keyItemSelected +1 then
                    if keyItemSelected +1 == 9 then
                        if npcUtil.giveKeyItem(player, keyItemTable.keyItem,0) then
                            removeAllWardenOfCourageKI(player)

                            local dialog = getDialog(player)
                            local currency = player:getCurrency('escha_silt')

                            player:updateEvent(2096128, currency, dialog)

                        end
                    elseif keyItemSelected +1 == 10 then -- 3031 Radialens
                        if npcUtil.giveKeyItem(player, keyItemTable.keyItem,0) then
                            player:delCurrency('escha_silt', keyItemTable.cost)

                            local zone = player:getZoneID()
                            local isTrackedZone = zoneMax[zone] ~= nil

                            if isTrackedZone then
                                if hasCompletedZone(player, zone) then
                                    player:setCharVar('GEASFETE_RADIALENS_ACTIVE', 0)
                                    player:removeListener('GEASFETE_RADIALENS_TICK')

                                else

                                    local expiry = GetSystemTime() + 7200
                                    player:setCharVar('GEASFETE_RADIALENS_ACTIVE', expiry)

                                    player:removeListener('GEASFETE_RADIALENS_TICK')

                                    player:addListener('TICK', 'GEASFETE_RADIALENS_TICK', function(playerArg)
                                        local expiryTime = playerArg:getCharVar('GEASFETE_RADIALENS_ACTIVE')

                                        if expiryTime > 0 and GetSystemTime() >= expiryTime then
                                            if playerArg:hasKeyItem(xi.ki.RADIALENS) then
                                                local textID = geasFeteText[playerArg:getZoneID()]

                                                playerArg:messageSpecial(textID.LOSE_KEYITEM, xi.ki.RADIALENS)
                                                playerArg:delKeyItem(xi.ki.RADIALENS)
                                            end

                                            playerArg:setCharVar('GEASFETE_RADIALENS_ACTIVE', 0)
                                            playerArg:removeListener('GEASFETE_RADIALENS_TICK')
                                        end
                                    end)
                                end
                            end

                            local dialog = getDialog(player)
                            local currency = player:getCurrency('escha_silt')

                           -- player:updateEvent(2096128, currency, dialog) -- i dont know if placing this here is correct, the dialog is off after the purchase
                        end
                    else
                        npcUtil.giveKeyItem(player, keyItemTable.keyItem,0)
                        player:delCurrency('escha_silt', keyItemTable.cost)

                        local dialog = getDialog(player)
                        local currency = player:getCurrency('escha_silt')

                        player:updateEvent(2096128, currency, dialog)
                    return
                    end
                end
            end
        end

        if menuSelection == 5 then -- Upgrade Vorseals
            for key, data in pairs(vorsealData) do
                if data.purchaseOrder == vorsealSelected +1 then
                    if player:getCharVar('[Vorseal]'..key) < vorsealTier then
                        if player:hasStatusEffect(xi.effect.VORSEAL) then
                            player:delStatusEffectSilent(xi.effect.VORSEAL)
                        end

                        local costAdjustment = vorsealTier - player:getCharVar('[Vorseal]'..key)

                        player:setCharVar('[Vorseal]'..key,vorsealTier)
                        player:delCurrency('escha_silt', data.cost * costAdjustment)
                        -- player:addStatusEffect(xi.effect.VORSEAL, xi.effect.VORSEAL, 0, 0, 3600)
                        player:addStatusEffect(xi.effect.VORSEAL, { duration = 3600, origin = player, tick = 3, icon = xi.effect.VORSEAL })

                        local dialog = getDialog(player)
                        local currency = player:getCurrency('escha_silt')
                        local vorsealEffectBits1, vorsealEffectBits2, vorsealEffectBits3 = getPurchasedVorsealParams(player) -- vorseals upgraded effect received, return check menus

                        player:updateEvent(2096128, currency, dialog, 0, vorsealEffectBits1, vorsealEffectBits2, vorsealEffectBits3, 0)
                    end
                end
            end

        end

        if menuSelection == 6 then -- return vorseal option
            for key, data in pairs(vorsealData) do
                if data.purchaseOrder == vorsealSelected +1 then
                    if player:getCharVar('[Vorseal]'..key) > 0 then
                        if player:hasStatusEffect(xi.effect.VORSEAL) then
                            player:delStatusEffectSilent(xi.effect.VORSEAL)
                            player:setCharVar('[Vorseal]'..key, 0)
                        end

                        if player:getCharVar('[Vorseal]'..key) > 0 then
                            player:addStatusEffect(xi.effect.VORSEAL, { duration = 3600, origin = player, tick = 3, icon = xi.effect.VORSEAL })
                        end

                        local dialog = getDialog(player)
                        local currency = player:getCurrency('escha_silt')
                        local vorsealEffectBits1, vorsealEffectBits2, vorsealEffectBits3 = getPurchasedVorsealParams(player) -- vorseals upgraded effect received, return check menus

                        player:updateEvent(2096128, currency, dialog, 0, vorsealEffectBits1, vorsealEffectBits2, vorsealEffectBits3, 0)

                    end
                end
            end

            local currency = player:getCurrency('escha_silt')
            local dialog = getDialog(player)

            player:updateEvent(2048, currency, dialog,0,0,0,0,0)
        end

        if menuSelection == 7 then -- purchase temp items
            for _, itemTable in pairs(tempItemReqs[requirementIndex.KEYITEMS]) do
                if itemTable.itemIndex == itemSelected +1 then
                    npcUtil.giveItem(player, { itemTable.item })
                    player:delCurrency('escha_silt', itemTable.cost)
                    return
                end
            end
        end
    end
end

xi.geasFeteNPC.npcOnEventFinish = function(player, csid, option, npc)
    local itemSelected = bit.rshift(option, 8)
    local npcZone = npc:getZoneID()
    local keyItemsTable = grislyTrinketsTrade['KEYITEMS']
        and grislyTrinketsTrade['KEYITEMS'][npcZone]
        and grislyTrinketsTrade['KEYITEMS'][npcZone][csid]

    local selectedOp = bit.band(bit.rshift(option, 0), 0xFFFF)

    if csid >= 9702 and csid <= 9704 then
        if selectedOp == 0 then
            player:addItem(player:getLocalVar('GeasFeteTradeItem'), player:getLocalVar('GeasFeteTradeQty'))
            player:setLocalVar('GeasFeteTradeItem', 0)
            player:setLocalVar('GeasFeteTradeQty', 0)
            return
        end

        local entry = keyItemsTable and keyItemsTable[itemSelected]
        local keyItem = entry and entry[1]

        if keyItem and not player:hasKeyItem(keyItem) then
            npcUtil.giveKeyItem(player, keyItem)
            player:tradeComplete()
        end
    end
end

xi.geasFete.onEffectGain = function(target, effect)
    applyVorsealEffects(target)

    target:setHP(target:getMaxHP())
    target:setMP(target:getMaxMP())
end

xi.geasFete.onEffectTick = function(target, effect)

end

xi.geasFete.onEffectLose = function(target, effect)
    delVorsealEffects(target)
end

--------------------------------------------------------------
--------- Emblazoned Reliquary Chest NPC
--------------------------------------------------------------

xi.emblazonedReliquary.chestType =
{
    GOLD  = 1,
    BROWN = 2,
    BLUE  = 3,
}

xi.emblazonedReliquary.chestDrop = {
    [xi.zone.ESCHA_ZITAH] =
    {
        [xi.emblazonedReliquary.chestType.GOLD] =
        {
            [xi.item.FACILITY_RING] = xi.drop_rate.VERY_COMMON, -- 50%
            [xi.item.CAPACITY_RING] = xi.drop_rate.VERY_COMMON, -- 50%
        },
        [xi.emblazonedReliquary.chestType.BROWN] =
        {
            [xi.item.ARROWWOOD_LOG]        = xi.drop_rate.RARE,        -- 6.4%
            [xi.item.TUFT_OF_ASHWEED]      = xi.drop_rate.VERY_RARE,   -- 4.3%
            [xi.item.BEAD_POUCH]           = xi.drop_rate.VERY_RARE,   -- 2.1%
            [xi.item.CLUMP_OF_BOYAHDA_MOSS]= xi.drop_rate.VERY_RARE,   -- 2.1%
            [xi.item.ESCHALIXIR]           = xi.drop_rate.UNCOMMON,    -- 12.8%
            [xi.item.ESCHALIXIR_P1]        = xi.drop_rate.UNCOMMON,    -- 12.8%
            [xi.item.CHUNK_OF_ESCHITE_ORE] = xi.drop_rate.NEVER,       -- 0%
            [xi.item.FLAX_FLOWER]          = xi.drop_rate.RARE,        -- 8.5%
            [xi.item.GRAVEWOOD_LOG]        = xi.drop_rate.RARE,        -- 6.4%
            [xi.item.INSECT_WING]          = xi.drop_rate.UNCOMMON,    -- 10.6%
            [xi.item.SPIDER_WEB]           = xi.drop_rate.UNCOMMON,    -- 14.9%
            [xi.item.SILT_POUCH]           = xi.drop_rate.VERY_COMMON, -- 40.4%
        },
        [xi.emblazonedReliquary.chestType.BLUE] =
        {
            [xi.item.BOTTLE_OF_ASSASSINS_DRINK]     = xi.drop_rate.VERY_RARE, -- 1.4%
            [xi.item.BOTTLE_OF_BARBARIANS_DRINK]    = xi.drop_rate.VERY_RARE, -- 1.4%
            [xi.item.TUBE_OF_CLEAR_SALVE_I]         = xi.drop_rate.VERY_RARE, -- 2.8%
            [xi.item.TUBE_OF_CLEAR_SALVE_II]        = xi.drop_rate.VERY_RARE, -- 1.4%
            [xi.item.BOTTLE_OF_CLERICS_DRINK]       = xi.drop_rate.VERY_RARE, -- 1.4%
            [xi.item.BOTTLE_OF_CATHOLICON]          = xi.drop_rate.VERY_RARE, -- 2.8%
            [xi.item.BOTTLE_OF_CATHOLICON_P1]       = xi.drop_rate.VERY_RARE, -- 1.4%
            [xi.item.PHIAL_OF_CURSE_BUFFER]         = xi.drop_rate.RARE,      -- 9.9%
            [xi.item.DAEDALUS_WING]                 = xi.drop_rate.VERY_RARE, -- 1.4%
            [xi.item.DUSTY_SCROLL_OF_RERAISE]       = xi.drop_rate.VERY_RARE, -- 1.4%
            [xi.item.BOTTLE_OF_FIGHTERS_DRINK]      = xi.drop_rate.VERY_RARE, -- 1.4%
            [xi.item.BOTTLE_OF_GNOSTICS_DRINK]      = xi.drop_rate.VERY_RARE, -- 4.2%
            [xi.item.FLASK_OF_HEALING_MIST]         = xi.drop_rate.RARE,      -- 5.6%
            [xi.item.TUBE_OF_HEALING_SALVE_II]      = xi.drop_rate.VERY_RARE, -- 4.2%
            [xi.item.SCROLL_OF_INSTANT_RERAISE]     = xi.drop_rate.VERY_RARE, -- 2.8%
            [xi.item.LUCID_ELIXIR_I]                = xi.drop_rate.VERY_RARE, -- 2.8%
            [xi.item.LUCID_ELIXIR_II]               = xi.drop_rate.RARE,      -- 7%
            [xi.item.LUCID_ETHER_I]                 = xi.drop_rate.VERY_RARE, -- 2.8%
            [xi.item.LUCID_ETHER_II]                = xi.drop_rate.VERY_RARE, -- 2.8%
            [xi.item.LUCID_ETHER_III]               = xi.drop_rate.VERY_RARE, -- 1.4%
            [xi.item.LUCID_POTION_I]                = xi.drop_rate.VERY_RARE, -- 4.2%
            [xi.item.LUCID_POTION_II]               = xi.drop_rate.VERY_RARE, -- 4.2%
            [xi.item.PAIR_OF_LUCID_WINGS_I]         = xi.drop_rate.VERY_RARE, -- 1.4%
            [xi.item.PAIR_OF_LUCID_WINGS_II]        = xi.drop_rate.VERY_RARE, -- 4.2%
            [xi.item.FLASK_OF_MANA_MIST]            = xi.drop_rate.RARE,      -- 5.6%
            [xi.item.PINCH_OF_MANA_POWDER]          = xi.drop_rate.VERY_RARE, -- 4.2%
            [xi.item.MEGALIXIR]                     = xi.drop_rate.VERY_RARE, -- 4.2%
            [xi.item.BOTTLE_OF_MIRRORS_TONIC]       = xi.drop_rate.VERY_RARE, -- 4.2%
            [xi.item.BOTTLE_OF_MONARCHS_DRINK]      = xi.drop_rate.RARE,      -- 7%
            [xi.item.BOTTLE_OF_MONETAS_TONIC]       = xi.drop_rate.RARE,      -- 5.6%
            [xi.item.BOTTLE_OF_ORACLES_DRINK]       = xi.drop_rate.VERY_RARE, -- 4.2%
            [xi.item.BOTTLE_OF_SAVIORS_TONIC]       = xi.drop_rate.VERY_RARE, -- 2.8%
            [xi.item.BOTTLE_OF_SOLDIERS_DRINK]      = xi.drop_rate.VERY_RARE, -- 2.8%
            [xi.item.BOTTLE_OF_SPRINTERS_DRINK]     = xi.drop_rate.VERY_RARE, -- 4.2%
            [xi.item.BOTTLE_OF_STEADFAST_TONIC]     = xi.drop_rate.VERY_RARE, -- 2.8%
            [xi.item.SUPER_REVITALIZER]             = xi.drop_rate.VERY_RARE, -- 1.4%
            [xi.item.BOTTLE_OF_VICARS_DRINK]        = xi.drop_rate.VERY_RARE, -- 4.2%
            [xi.item.PHIAL_OF_VIRUS_BUFFER]         = xi.drop_rate.VERY_RARE, -- 2.8%
        }
    },
    [xi.zone.ESCHA_RUAUN] =
    {
        [xi.emblazonedReliquary.chestType.GOLD] =
        {
            [xi.item.FACILITY_RING] = xi.drop_rate.GUARANTEED, -- 100%
            [xi.item.PORXIE_WING]   = xi.drop_rate.GUARANTEED, -- 100%
        },
        [xi.emblazonedReliquary.chestType.BROWN] =
        {
            [xi.item.TUFT_OF_ASHWEED]         = xi.drop_rate.RARE,        -- 9.9%
            [xi.item.BEAD_POUCH]              = xi.drop_rate.RARE,        -- 7.4%
            [xi.item.CLUMP_OF_BOYAHDA_MOSS]   = xi.drop_rate.UNCOMMON,    -- 12.3%
            [xi.item.DIVINE_LOG]              = xi.drop_rate.VERY_RARE,   -- 2.5%
            [xi.item.ESCHALIXIR]              = xi.drop_rate.COMMON,      -- 18.5%
            [xi.item.ESCHALIXIR_P1]           = xi.drop_rate.RARE,        -- 7.4%
            [xi.item.CHUNK_OF_ESCHITE_ORE]    = xi.drop_rate.VERY_RARE,   -- 3.7%
            [xi.item.GRAVEWOOD_LOG]           = xi.drop_rate.VERY_RARE,   -- 3.7%
            [xi.item.PLATE_OF_INDI_FRAILTY]   = xi.drop_rate.VERY_RARE,   -- 1.2%
            [xi.item.KITRON]                  = xi.drop_rate.RARE,        -- 6.2%
            [xi.item.PORXIE_WING]             = xi.drop_rate.RARE,        -- 6.2%
            [xi.item.SILT_POUCH]              = xi.drop_rate.VERY_COMMON, -- 35.8%
            [xi.item.WALNUT_LOG]              = xi.drop_rate.RARE,        -- 8.6%
        },

        [xi.emblazonedReliquary.chestType.BLUE] =
        {
            [xi.item.BOTTLE_OF_ASSASSINS_DRINK]    = xi.drop_rate.VERY_RARE, -- 3.8%
            [xi.item.BOTTLE_OF_BARBARIANS_DRINK]   = xi.drop_rate.VERY_RARE, -- 3.8%
            [xi.item.BOTTLE_OF_BRAVERS_DRINK]      = xi.drop_rate.VERY_RARE, -- 3.8%
            [xi.item.BOTTLE_OF_CATHOLICON]         = xi.drop_rate.VERY_RARE, -- 3.8%
            [xi.item.BOTTLE_OF_CHAMPIONS_DRINK]    = xi.drop_rate.VERY_RARE, -- 3.8%
            [xi.item.TUBE_OF_CLEAR_SALVE_I]        = xi.drop_rate.VERY_RARE, -- 3.8%
            [xi.item.TUBE_OF_CLEAR_SALVE_II]       = xi.drop_rate.VERY_RARE, -- 4.7%
            [xi.item.BOTTLE_OF_CLERICS_DRINK]      = xi.drop_rate.VERY_RARE, -- 2.8%
            [xi.item.DAEDALUS_WING]                = xi.drop_rate.VERY_RARE, -- 4.7%
            [xi.item.BOTTLE_OF_FIGHTERS_DRINK]     = xi.drop_rate.VERY_RARE, -- 2.8%
            [xi.item.BOTTLE_OF_GNOSTICS_DRINK]     = xi.drop_rate.VERY_RARE, -- 3.8%
            [xi.item.TUBE_OF_HEALING_SALVE_I]      = xi.drop_rate.VERY_RARE, -- 3.8%
            [xi.item.TUBE_OF_HEALING_SALVE_II]     = xi.drop_rate.VERY_RARE, -- 2.8%
            [xi.item.SCROLL_OF_INSTANT_RERAISE]    = xi.drop_rate.VERY_RARE, -- 3.8%
            [xi.item.LUCID_ELIXIR_I]               = xi.drop_rate.VERY_RARE, -- 1.9%
            [xi.item.LUCID_ETHER_I]                = xi.drop_rate.VERY_RARE, -- 3.8%
            [xi.item.LUCID_ETHER_II]               = xi.drop_rate.VERY_RARE, -- 0.9%
            [xi.item.LUCID_ETHER_III]              = xi.drop_rate.VERY_RARE, -- 4.7%
            [xi.item.LUCID_POTION_I]               = xi.drop_rate.RARE,      -- 6.6%
            [xi.item.LUCID_POTION_II]              = xi.drop_rate.VERY_RARE, -- 2.8%
            [xi.item.LUCID_POTION_III]             = xi.drop_rate.RARE,      -- 6.6%
            [xi.item.PAIR_OF_LUCID_WINGS_I]        = xi.drop_rate.RARE,      -- 5.7%
            [xi.item.MEGALIXIR]                    = xi.drop_rate.RARE,      -- 7.5%
            [xi.item.BOTTLE_OF_MIRRORS_TONIC]      = xi.drop_rate.VERY_RARE, -- 4.7%
            [xi.item.BOTTLE_OF_MONARCHS_DRINK]     = xi.drop_rate.RARE,      -- 5.7%
            [xi.item.BOTTLE_OF_MONETAS_TONIC]      = xi.drop_rate.VERY_RARE, -- 2.8%
            [xi.item.BOTTLE_OF_ORACLES_DRINK]      = xi.drop_rate.RARE,      -- 5.7%
            [xi.item.BOTTLE_OF_SAVIORS_TONIC]      = xi.drop_rate.RARE,      -- 6.6%
            [xi.item.BOTTLE_OF_SOLDIERS_DRINK]     = xi.drop_rate.VERY_RARE, -- 4.7%
            [xi.item.BOTTLE_OF_SPYS_DRINK]         = xi.drop_rate.VERY_RARE, -- 2.8%
            [xi.item.BOTTLE_OF_STEADFAST_TONIC]    = xi.drop_rate.RARE,      -- 7.5%
        }
    },
    [xi.zone.REISENJIMA] =
    {
        [xi.emblazonedReliquary.chestType.GOLD] =
        {
            [xi.item.CALIBER_RING]    = xi.drop_rate.VERY_COMMON, -- 33.3%
            [xi.item.FACILITY_RING]   = xi.drop_rate.VERY_COMMON, -- 66.7%
            [xi.item.LESSER_CHIGOE]   = xi.drop_rate.VERY_COMMON, -- 33.3%
        },
        [xi.emblazonedReliquary.chestType.BROWN] =
        {
            [xi.item.HANDFUL_OF_BAMBOO_SHOOTS] = xi.drop_rate.UNCOMMON,    -- 14.7%
            [xi.item.BAMBOO_STICK]             = xi.drop_rate.RARE,        -- 8%
            [xi.item.BEAD_POUCH]               = xi.drop_rate.VERY_RARE,   -- 1.3%
            [xi.item.CALIBER_RING]             = xi.drop_rate.VERY_RARE,   -- 1.3%
            [xi.item.SCROLL_OF_DISTRACT_II]    = xi.drop_rate.VERY_RARE,   -- 1.3%
            [xi.item.EASTERN_GINGER_ROOT]      = xi.drop_rate.RARE,        -- 4%
            [xi.item.CHUNK_OF_ESCHITE_ORE]     = xi.drop_rate.VERY_RARE,   -- 1.3%
            [xi.item.FERN_STONE]               = xi.drop_rate.UNCOMMON,    -- 10.7%
            [xi.item.HYDRANGEA]                = xi.drop_rate.RARE,        -- 4%
            [xi.item.LESSER_CHIGOE]            = xi.drop_rate.RARE,        -- 6.7%
            [xi.item.PELLUCID_STONE]           = xi.drop_rate.RARE,        -- 4%
            [xi.item.SILT_POUCH]               = xi.drop_rate.VERY_COMMON, -- 41.3%
            [xi.item.TAUPE_STONE]              = xi.drop_rate.UNCOMMON,    -- 14.7%
            [xi.item.TUFT_OF_VOID_GRASS]       = xi.drop_rate.RARE,        -- 6.7%
        },

        [xi.emblazonedReliquary.chestType.BLUE] =
        {
            [xi.item.BOTTLE_OF_ASSASSINS_DRINK]     = xi.drop_rate.VERY_RARE,     -- 2.9%
            [xi.item.BOTTLE_OF_BARBARIANS_DRINK]    = xi.drop_rate.VERY_RARE,     -- 2.9%
            [xi.item.BOTTLE_OF_BRAVERS_DRINK]       = xi.drop_rate.VERY_RARE,     -- 2.9%
            [xi.item.BOTTLE_OF_CHAMPIONS_DRINK]     = xi.drop_rate.VERY_RARE,     -- 2.9%
            [xi.item.BOTTLE_OF_CLERICS_DRINK]       = xi.drop_rate.VERY_RARE,     -- 2.9%
            [xi.item.DAEDALUS_WING]                 = xi.drop_rate.RARE,          -- 7.2%
            [xi.item.BOTTLE_OF_FIGHTERS_DRINK]      = xi.drop_rate.VERY_RARE,     -- 2.9%
            [xi.item.FLASK_OF_HEALING_MIST]         = xi.drop_rate.VERY_RARE,     -- 2.9%
            [xi.item.TUBE_OF_HEALING_SALVE_II]      = xi.drop_rate.VERY_RARE,     -- 2.9%
            [xi.item.SCROLL_OF_INSTANT_RERAISE]     = xi.drop_rate.VERY_RARE,     -- 2.9%
            [xi.item.LUCID_ELIXIR_II]               = xi.drop_rate.RARE,          -- 5.8%
            [xi.item.LUCID_ETHER_III]               = xi.drop_rate.VERY_RARE,     -- 2.9%
            [xi.item.LUCID_POTION_III]              = xi.drop_rate.VERY_RARE,     -- 2.9%
            [xi.item.MEGALIXIR]                     = xi.drop_rate.VERY_RARE,     -- 2.9%
            [xi.item.BOTTLE_OF_MIRRORS_TONIC]       = xi.drop_rate.VERY_RARE,     -- 2.9%
            [xi.item.BOTTLE_OF_MONARCHS_DRINK]      = xi.drop_rate.VERY_RARE,     -- 2.9%
            [xi.item.BOTTLE_OF_MONETAS_TONIC]       = xi.drop_rate.RARE,          -- 5.8%
            [xi.item.BOTTLE_OF_ORACLES_DRINK]       = xi.drop_rate.RARE,          -- 5.8%
            [xi.item.BOTTLE_OF_SPYS_DRINK]          = xi.drop_rate.RARE,          -- 5.8%
            [xi.item.SUPER_REVITALIZER]             = xi.drop_rate.VERY_RARE,     -- 1.4%
        }
    },
}


xi.emblazonedReliquary.canOpenChest = function(player, npc)

end

xi.emblazonedReliquary.messageChest = function(player, messageid, param1, param2, param3, param4, npc)

end

xi.emblazonedReliquary.removeChest = function(player, npc)
    npc:setUntargetable(true)
    npc:timer(5000, function(npcArg)
        npcArg:resetLocalVars()
        npcArg:setStatus(xi.status.DISAPPEAR)
        npcArg:entityAnimationPacket(xi.animationString.STATUS_DISAPPEAR)
        npc:setUntargetable(false)
    end)
end

xi.emblazonedReliquary.getDrops = function(npc, dropType, tier)

end

xi.emblazonedReliquary.openChest = function(player, npc)
    local zoneID = npc:getZoneID()

    player:startEvent(9250, zoneID, 1)

    npc:entityAnimationPacket(xi.animationString.OPEN_CRATE_GLOW)
--[[
     0001 0000 0110 1010 0001 0100 1100 1010
INCOMING < CS Event + Params (0x034):  NPC: 17957473 (Emblazoned Reliquary)
Event: 9250

        zone / item 1 & 2 / item 3 & 4 / ??? / ??? / ??? / ??? / ???
Params: 288, 275387594, 0, -147515, -563, 0, 0, 0
{      item one   }{     item two     }
0001 0000 0110 1010 0001 0100 1100 1010

0001 0100 1100 1010 - Falsk of healing powder 5322
0001 0000 0110 1010 = Daedalus Wing 4202


param 2 = items
param 3 = items
     ]]--
    player:startEvent(9250,0, 2, 275387594, 0, 0, 0, 0, 0)
end

--[[
Escha - Zi'Tah
Emblazoned Reliquary-Gold
Gold Chest

Gold Emblazoned Reliquary
Item	Abundance
Facility Ring	More data needed.(50%)
Capacity Ring	More data needed.(50%)
500 Escha Silt (Whole party)
10 Escha Beads (Whole party)


Brown Emblazoned Reliquary
Item	Abundance
Arrowwood Log	More data needed.(6.4%)
Ashweed	More data needed.(4.3%)
Bead Pouch	More data needed.(2.1%)
Boyahda Moss	More data needed.(2.1%)
Eschalixir	More data needed.(12.8%)
Eschalixir +1	More data needed.(12.8%)
Eschite Ore	Unknown(0%)
Flax Flower	More data needed.(8.5%)
Gravewood Log	More data needed.(6.4%)
Insect Wing	More data needed.(10.6%)
Spider Web	More data needed.(14.9%)
Silt Pouch Exclusive	More data needed.(40.4%)
20 Escha Silt (Whole party)
1 Escha Beads (Whole party)



Emblazoned Reliquary-Blue
Blue Chest

Blue Emblazoned Reliquary
Item	Abundance
Assassin's Drink RareExclusiveTemporary	More data needed.(1.4%)
Barbarian's Drink RareExclusiveTemporary	More data needed.(1.4%)
Clear Salve I RareExclusiveTemporary	More data needed.(2.8%)
Clear Salve II RareExclusiveTemporary	More data needed.(1.4%)
Cleric's Drink RareExclusiveTemporary	More data needed.(1.4%)
Catholicon RareExclusiveTemporary	More data needed.(2.8%)
Catholicon +1 RareExclusiveTemporary	More data needed.(1.4%)
Curse Buffer RareExclusiveTemporary	More data needed.(9.9%)
Daedalus Wing RareExclusiveTemporary	More data needed.(1.4%)
Dusty Reraise RareExclusiveTemporary	More data needed.(1.4%)
Fighter's Drink RareExclusiveTemporary	More data needed.(1.4%)
Gnostic's Drink RareExclusiveTemporary	More data needed.(4.2%)
Healing Mist RareExclusiveTemporary	More data needed.(5.6%)
Healing Salve II RareExclusiveTemporary	More data needed.(4.2%)
Instant Reraise RareExclusiveTemporary	More data needed.(2.8%)
Lucid Elixir I RareExclusiveTemporary	More data needed.(2.8%)
Lucid Elixir II RareExclusiveTemporary	More data needed.(7%)
Lucid Ether I RareExclusiveTemporary	More data needed.(2.8%)
Lucid Ether II RareExclusiveTemporary	More data needed.(2.8%)
Lucid Ether III RareExclusiveTemporary	More data needed.(1.4%)
Lucid Potion I RareExclusiveTemporary	More data needed.(4.2%)
Lucid Potion II RareExclusiveTemporary	More data needed.(4.2%)
Lucid Wings I RareExclusiveTemporary	More data needed.(1.4%)
Lucid Wings II RareExclusiveTemporary	More data needed.(4.2%)
Mana Mist RareExclusiveTemporary	More data needed.(5.6%)
Mana Powder RareExclusiveTemporary	More data needed.(4.2%)
Megalixir RareExclusiveTemporary	More data needed.(4.2%)
Mirror's Tonic RareExclusiveTemporary	More data needed.(4.2%)
Monarch's Drink RareExclusiveTemporary	More data needed.(7%)
Moneta's Tonic RareExclusiveTemporary	More data needed.(5.6%)
Oracle's Drink RareExclusiveTemporary	More data needed.(4.2%)
Savior's Tonic RareExclusiveTemporary	More data needed.(2.8%)
Soldier's Drink RareExclusiveTemporary	More data needed.(2.8%)
Sprinter's Drink RareExclusiveTemporary	More data needed.(4.2%)
Steadfast Tonic RareExclusiveTemporary	More data needed.(2.8%)
Super Revitalizer RareExclusiveTemporary	More data needed.(1.4%)
Vicar's Drink RareExclusiveTemporary	More data needed.(4.2%)
Virus Buffer RareExclusiveTemporary	More data needed.(2.8%)
10 Escha Silt (Whole party)




Escha - Ru'Aun
Emblazoned Reliquary-Gold
Gold Chest

Gold Emblazoned Reliquary
Item	Abundance
Facility Ring Rare Exclusive	More data needed.(100%)
Porxie Wing	More data needed.(100%)
500 Escha Silt (Whole party)
10 Escha Beads (Whole party)



Emblazoned Reliquary-Brown
Brown Chest

Brown Emblazoned Reliquary
Item	Abundance
Ashweed	More data needed.(9.9%)
Bead Pouch Exclusive	More data needed.(7.4%)
Boyahda Moss	More data needed.(12.3%)
Crystal Cluster	More data needed.(8.6%)
Divine Log	More data needed.(2.5%)
Eschalixir	More data needed.(18.5%)
Eschalixir +1	More data needed.(7.4%)
Eschite Ore	More data needed.(3.7%)
Gravewood Log	More data needed.(3.7%)
Indi-Frailty	More data needed.(1.2%)
Kitron	More data needed.(6.2%)
Porxie Wing	More data needed.(6.2%)
Silt Pouch Exclusive	More data needed.(35.8%)
Walnut Log	More data needed.(8.6%)
20 Escha Silt (Whole party)
1 Escha Beads (Whole party)



Emblazoned Reliquary-Blue
Blue Chest

Blue Emblazoned Reliquary
Item	Abundance
Assassin's Drink RareExclusiveTemporary	Very Rare(3.8%)
Barbarian's Drink RareExclusiveTemporary	Very Rare(3.8%)
Braver's Drink RareExclusiveTemporary	Very Rare(3.8%)
Catholicon RareExclusiveTemporary	Very Rare(3.8%)
Champion's Drink RareExclusiveTemporary	Very Rare(3.8%)
Clear Salve I RareExclusiveTemporary	Very Rare(3.8%)
Clear Salve II RareExclusiveTemporary	Very Rare(4.7%)
Cleric's Drink RareExclusiveTemporary	Very Rare(2.8%)
Daedalus Wing RareExclusiveTemporary	Very Rare(4.7%)
Fighter's Drink RareExclusiveTemporary	Very Rare(2.8%)
Gnostic's Drink RareExclusiveTemporary	Very Rare(3.8%)
Healing Salve I RareExclusiveTemporary	Very Rare(3.8%)
Healing Salve II RareExclusiveTemporary	Very Rare(2.8%)
Instant Reraise RareExclusiveTemporary	Very Rare(3.8%)
Lucid Elixir I RareExclusiveTemporary	Very Rare(1.9%)
Lucid Ether I RareExclusiveTemporary	Very Rare(3.8%)
Lucid Ether II RareExclusiveTemporary	Extremely Rare(0.9%)
Lucid Ether III RareExclusiveTemporary	Very Rare(4.7%)
Lucid Potion I RareExclusiveTemporary	Rare(6.6%)
Lucid Potion II RareExclusiveTemporary	Very Rare(2.8%)
Lucid Potion III RareExclusiveTemporary	Rare(6.6%)
Lucid Wings I RareExclusiveTemporary	Rare(5.7%)
Megalixir RareExclusiveTemporary	Rare(7.5%)
Mirror's Tonic RareExclusiveTemporary	Very Rare(4.7%)
Monarch's Drink RareExclusiveTemporary	Rare(5.7%)
Moneta's Tonic RareExclusiveTemporary	Very Rare(2.8%)
Oracle's Drink RareExclusiveTemporary	Rare(5.7%)
Savior's Tonic RareExclusiveTemporary	Rare(6.6%)
Soldier's Drink RareExclusiveTemporary	Very Rare(4.7%)
Spy's Drink RareExclusiveTemporary	Very Rare(2.8%)
Steadfast Tonic RareExclusiveTemporary	Rare(7.5%)
10 Escha Silt (Whole party)



Reisenjima
Emblazoned Reliquary-Gold
Gold Chest

Gold Emblazoned Reliquary
Item	Abundance
Caliber Ring Rare Exclusive	More data needed.(33.3%)
Facility Ring Rare Exclusive	More data needed.(66.7%)
Lesser Chigoe	More data needed.(33.3%)
500 Escha Silt (Whole party)
10 Escha Beads (Whole party)



Emblazoned Reliquary-Brown
Brown Chest

Brown Emblazoned Reliquary
Item	Abundance
Bamboo Shoots	More data needed.(14.7%)
Bamboo Stick	More data needed.(8%)
Bead Pouch Exclusive	More data needed.(1.3%)
Caliber Ring Rare Exclusive	More data needed.(1.3%)
Distract II	More data needed.(1.3%)
Eastern Ginger	More data needed.(4%)
Eschite Ore	More data needed.(1.3%)
Fern Stone	More data needed.(10.7%)
Hydrangea	More data needed.(4%)
Lesser Chigoe	More data needed.(6.7%)
Pelucid Stone	More data needed.(4%)
Silt Pouch Exclusive	More data needed.(41.3%)
Taupe Stone	More data needed.(14.7%)
Void Grass	More data needed.(6.7%)
20 Escha Silt (Whole party)
1 Escha Beads (Whole party)



Emblazoned Reliquary-Blue
Blue Chest

Blue Emblazoned Reliquary
Item	Abundance
Assassin's Drink RareExclusiveTemporary	Very Rare(2.9%)
Barbarian's Drink RareExclusiveTemporary	Very Rare(1.9%)
Braver's Drink RareExclusiveTemporary	Very Rare(1.9%)
Catholicon RareExclusiveTemporary	Very Rare(2.9%)
Catholicon +1 RareExclusiveTemporary	Very Rare(2.9%)
Charm Buffer RareExclusiveTemporary	Very Rare(1.9%)
Champion's Drink RareExclusiveTemporary	Very Rare(2.9%)
Clear Salve I RareExclusiveTemporary	Rare(6.7%)
Clear Salve II RareExclusiveTemporary	Very Rare(4.8%)
Curse Buffer RareExclusiveTemporary	Extremely Rare(1%)
Daedalus Wing RareExclusiveTemporary	Rare(5.8%)
Dusty Reraise RareExclusiveTemporary	Very Rare(3.8%)
Fighter's Drink RareExclusiveTemporary	Very Rare(1.9%)
Gnostic's Drink RareExclusiveTemporary	Very Rare(3.8%)
Healing Mist RareExclusiveTemporary	Very Rare(2.9%)
Healing Powder RareExclusiveTemporary	Very Rare(4.8%)
Healing Salve I RareExclusiveTemporary	Very Rare(1.9%)
Healing Salve II RareExclusiveTemporary	Very Rare(1.9%)
Instant Reraise RareExclusiveTemporary	Very Rare(1.9%)
Lucid Elixir I RareExclusiveTemporary	Very Rare(3.8%)
Lucid Elixir II RareExclusiveTemporary	Very Rare(3.8%)
Lucid Ether I RareExclusiveTemporary	Rare(5.8%)
Lucid Ether II RareExclusiveTemporary	Extremely Rare(1%)
Lucid Ether III RareExclusiveTemporary	Rare(7.7%)
Lucid Potion I RareExclusiveTemporary	Extremely Rare(1%)
Lucid Potion II RareExclusiveTemporary	Rare(6.7%)
Lucid Potion III RareExclusiveTemporary	Extremely Rare(1%)
Lucid Wings I RareExclusiveTemporary	Very Rare(1.9%)
Lucid Wings II RareExclusiveTemporary	Very Rare(4.8%)
Mana Mist RareExclusiveTemporary	Very Rare(1.9%)
Mana Powder RareExclusiveTemporary	Extremely Rare(1%)
Megalixir RareExclusiveTemporary	Very Rare(2.9%)
Mirror's Tonic RareExclusiveTemporary	Very Rare(4.8%)
Monarch's Drink RareExclusiveTemporary	Very Rare(2.9%)
Moneta's Tonic RareExclusiveTemporary	Very Rare(2.9%)
Savior's Tonic RareExclusiveTemporary	Very Rare(1.9%)
Soldier's Drink RareExclusiveTemporary	Very Rare(2.9%)
Sprinter's Drink RareExclusiveTemporary	Very Rare(3.8%)
Spy's Drink RareExclusiveTemporary	Extremely Rare(1%)
Steadfast Tonic RareExclusiveTemporary	Extremely Rare(1%)
Super Revitalizer RareExclusiveTemporary	Very Rare(1.9%)
Vicar's Drink RareExclusiveTemporary	Very Rare(1.9%)
Virus Buffer RareExclusiveTemporary	Very Rare(1.9%)
10 Escha Silt (Whole party)


xi.drop_rate =
{
    NEVER       = 0, --   0.00%
    ULTRA_RARE  = 1, --   0.10%
    SUPER_RARE  = 2, --   0.50%
    VERY_RARE   = 3, --   1.00%
    RARE        = 4, --   5.00%
    UNCOMMON    = 5, --  10.00%
    COMMON      = 6, --  15.00%
    VERY_COMMON = 7, --  24.00%
    GUARANTEED  = 8, -- 100.00%
}


Captured data
brown @ 20:55
blue @ 20:57
    1 lucid elixir 1

blue chest
    1 bottle of soldiers drink

blue chest
    1 mirros tonic

blue chest
    1 barbarian drink

blue chest
    1 phial of curse buffer

brown chest
    1 lessor chigoe

brown chest
    1 lesser chigoe
    1 chapuli wing

brown chest
    1   chapuli wing

brown chest
    1 bamboo stick

blue chest
    1 bottle of vicars drink

blue chest
    1 flask of mana mist

blue chest
    1 bottle of catholicon +1
    flask of healing powder

brown chest
    1 lesser chigoe

blue chest
    1 dusty scroll of reraise

blue chest
    1 bottle of gnostic drink

blue chest
    1 bottle of barbarians drink

brown chest
    1 silt pouch
    1 bead pouch

blue chest
    1 tube o clear slave ii

gold chest - combination chest twist dials up and down
    1 caliber ring

blue chest
    1 bottle of assassins drink
    1 tube of healing slave I


examples 20
blue 12 = 85% single item / 15% double item
brown 7 = 85% single item / 15% double item
gold  1 - 85% single item / 15% double item












    [4013] =
    { -- Gain Experience
        trigger = xi.roeTrigger.GAIN_EXPERIENCE,
        goal = 5000,
        increment = 0,
        flags = set { 'timed', 'repeat' },
        reward = { sparks = 300, exp = 1500, accolades = 300, item = { xi.item.COPPER_AMAN_VOUCHER } },
        check = function(self, player, params)
            if params.exp and params.exp > 0 then
                params.progress = params.progress + params.exp
                return true
            end

            return false
        end,
    },





**************************NEED TO FIX *****************************************
FIXED - Urmahllulu does not spawn?????

Deed of Reg mobs not counted as killed
FIXED - Agalophotis
FIXED - Ferradon
FIXED - Gulltop
FIXED - Britillis
FIXED - Fleetstalker


Escha Ruaun -
FIXED - Kirin soawn and attacks but cannot be attacked or targeted or changes to dragon
FIXED - Warder of hope spawns but cannot be attacked of targeted
FXIED -- Yovra do not deend to attack
FIXED -- Warder of love cannot be popped due to Yovra

Deed of regs mobs not counted as killed -
FIXED - Palila -- NEEDS TO BE SET AS A NM in SQL

Reisenjima Issues
KI's mis mapped, some not used and qm does not match current KI in Inventory
Deed of Re mobs not countased as killed
FIXED - Neak
FIXED - Teles
FIXED - Vinipata


TODO LIST -
add timer to radialens
Need to create mob file for each Nm
Remove escha Zitah Sql file, rename to geaFetes and add it updated skills and spells
Need to make sure all the qm’s in each zone are in sql correctly, rename them to geaFetesQm1-blah and create the qm files
Need to put a check for lottery NM’s for player variable, need to see player variable based on vorseal mod rare enemy + adds additional 1% chance to spawn the mob
]]--