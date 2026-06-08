require('scripts/globals/mixins')

g_mixins = g_mixins or {}

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

local domainInvasionNM =
{
    [xi.zone.ESCHA_RUAUN] =
    {
        { 'Naga_Raja' },
        { 'Mireu' },
    },

    [xi.zone.ESCHA_ZITAH] =
    {
        { 'Azi_Dahaka' },
        { 'Mireu' },
    },

    [xi.zone.REISENJIMA] =
    {
        { 'Quetzalcoatl' },
        { 'Mireu' },
    }
}

g_mixins.rod_death_counter = function(mob)
    local function checkNMType(mob)
        local zone = mob:getZoneID()
        local table = domainInvasionNM[zone]
        local domainInvNM = false

        if not table then
            return false
        end

        for i = 1, #table do
            if mob:getName() == table[i][1] then
                domainInvNM = true
            end
        end

        return domainInvNM
    end

    local function setDIVar(mob, member)
        local zone = mob:getZoneID()
        local table = domainInvasionNM[zone]

        if not table then
            return
        end

        for i = 1, #table do
            if mob:getName() == table[i][1] then
                member:setCharVar('[RoD]Kill_Count_' .. mob:getName(), member:getCharVar('[RoD]Kill_Count_' .. mob:getName()) + 1)
            end
        end
    end

    local function anyMemberHasTranscendency(member)
        local party = member:getParty()

        if not party then
            return false
        end

        for _, m in ipairs(party) do
            if m:hasStatusEffect(xi.effect.TRANSCENDENCY) then
                return true
            end
        end

        return false
    end

    local function setGeaFeteNMBit(mob, member)
        local zone = mob:getZoneID()
        local tbl = geaFeteNM[zone]

        if not tbl then
            return
        end

        local varName = '[RoD]GeaFetesDefeated' .. zone
        local value = member:getCharVar(varName)

        local aeonicVarName = '[Aeonic]progress' .. zone
        local aeonicValue = member:getCharVar(aeonicVarName)

        -- mobs to skip for aeonic tracking
        local aeonicSkip = {
            Puca = true,
            Alpluachra = true,
        }

        local aeonicIndex = 0

        for i = 1, #tbl do
            local mobName = tbl[i][1]

            -- always set RoD bit normally
            if mob:getName() == mobName then
                value = utils.mask.setBit(value, i - 1, true)
            end

            -- only increment aeonic index if NOT skipped
            if not aeonicSkip[mobName] then
                if mob:getName() == mobName then
                    aeonicValue = utils.mask.setBit(aeonicValue, aeonicIndex, true)
                end
                aeonicIndex = aeonicIndex + 1
            end
        end

        member:setCharVar(varName, value)

        local aeonicZones = {
            [1] = xi.zone.ESCHA_ZITAH,
            [2] = xi.zone.ESCHA_RUAUN,
            [3] = xi.zone.REISENJIMA,
        }

        local questStage = member:getCharVar('[Aeonic]QuestActive')
        local currentZone = member:getZoneID()
        local blockAeonic = anyMemberHasTranscendency(member)

        if not blockAeonic then
            if aeonicZones[questStage] == currentZone then
                member:setCharVar(aeonicVarName, aeonicValue)
            end
        end
    end

    local function spawnEmblazonedReliquary(mob, killer) -- ***** need to set a variable to not allow player to spawn the same type of chest
        local zone = mob:getZone()
        local emblazonedReliquary = zone:queryEntitiesByName('Emblazoned_Reliquary')

        local randomChest = {
            { 75, 965 }, -- Blue
            { 20, 966 }, -- Brown
            { 5, 969 }  -- Gold
        }

        if not emblazonedReliquary or #emblazonedReliquary == 0 then
            return
        end

        local totalWeight = 0
        for _, entry in ipairs(randomChest) do
            totalWeight = totalWeight + entry[1]
        end

        local roll = math.random(1, totalWeight)
        local selectedModelId = 965 -- default fallback (blue)
        local cumulative = 0

        for _, entry in ipairs(randomChest) do
            cumulative = cumulative + entry[1]
            if roll <= cumulative then
                selectedModelId = entry[2]
                break
            end
        end

        local partyAllianceCheck = {}

        if killer:checkSoloPartyAlliance() == 2 then
            partyAllianceCheck = killer:getAlliance()
        else
            partyAllianceCheck = killer:getPartyWithTrusts()
        end

        -- Check if anyone in the party/alliance already has this chest color spawned
        for _, member in pairs(partyAllianceCheck) do
            if member and member:isPC() then
                if member:getLocalVar('SpawnChestModelID'..selectedModelId) == 1 then
                    return
                end
            end
        end

        local mobPos = mob:getPos()

        for _, chest in pairs(emblazonedReliquary) do
            if chest and chest:getStatus() == xi.status.DISAPPEAR then
                -- Update variables for all members
                for _, member in pairs(partyAllianceCheck) do
                    if member and member:isPC() then
                        member:setLocalVar('SpawnedChest', member:getLocalVar('SpawnedChest') + 1)
                        member:setLocalVar('SpawnChestModelID'..selectedModelId, 1)
                    end
                end

                chest:setPos(mobPos.x, mobPos.y, mobPos.z, mobPos.rot)
                chest:setStatus(xi.status.NORMAL)
                chest:setModelId(selectedModelId)
                chest:setLocalVar('SpawnStatus', 1)
                chest:setLocalVar('SpawnTime', GetSystemTime())
                chest:setLocalVar('PartyLeader', killer:getLeaderID())

                chest:timer(180000, function(chestArg)
                    if chestArg:getStatus() == xi.status.NORMAL then
                        xi.emblazonedReliquary.removeChest(killer, chestArg)
                    end
                end)

                return
            end
        end
    end

    local function canSpawnEmblazonedReliquary(mob, killer)
        local chestCount = killer:getLocalVar('SpawnedChest')
        local spawnChance = 5 -- percent

        if chestCount ~= nil and
            chestCount >= 3 then
                return false
        end

        if math.random(1, 5) <= spawnChance then
            return true
        end

        return false
    end

    -- NOTE: retail does not break kill counts out between zones, all kills are recorded and presented in all 3 zone Register of Deed NPC's'
    mob:addListener('DEATH', 'DEATH_FUNCTIONS', function(mob, killer)
        if killer then
            local player = killer

            if player:isPet() or player:isTrust() then
                player = player:getMaster()
            end

            if player and player:isPC() then
                local alliance = player:getAlliance()

                for _, member in pairs(alliance) do
                    if member:isPC() and member:getZoneID() == mob:getZoneID() then
                        if not mob:isNM() then
                            member:setCharVar('[RoD]Mob_Counter', member:getCharVar('[RoD]Mob_Counter') + 1)
                        elseif mob:isNM() then
                            if not checkNMType(mob) then
                                member:setCharVar('[RoD]NM_Counter', member:getCharVar('[RoD]NM_Counter') + 1)
                                setGeaFeteNMBit(mob, member)
                            else
                                setDIVar(mob, member)
                            end
                        end
                    end
                end
            end
            --[[
            local chestSpawnCheck = canSpawnEmblazonedReliquary(mob, killer)

            if chestSpawnCheck then
                spawnEmblazonedReliquary(mob, killer)
            end
            ]]--
        end
    end)
end

return g_mixins.rod_death_counter