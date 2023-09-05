/************************************************************************
* Campaign
*************************************************************************
* Lua util functions for Campaign
************************************************************************/
#include <tuple>

#include "map/utils/moduleutils.h"
#include "common/sql.h"
#include "campaign_system.h"
#include "map.h"
#include "map/utils/zoneutils.h"
#include "packets/campaign_map.h"
#include "utils/charutils.h"
#include "campaign_handler.h"

class CampaignModule : public CPPModule
{
    std::map<uint8, std::string> control_map;

    void OnInit() override
    {
        control_map[2] = "influence_sandoria";
        control_map[4] = "influence_bastok";
        control_map[6] = "influence_windurst";
        control_map[8] = "influence_beastman";

        TracyZoneScoped;

        lua["CampaignGetControl"] = [this](uint16 zoneID) -> uint8
        {
            TracyZoneScoped;

            if (sql->Query("SELECT nation FROM `campaign_map` WHERE zoneid = %u;", zoneID) != SQL_ERROR && sql->NumRows() > 0 && sql->NextRow() != SQL_ERROR)
            {
                return sql->GetUIntData(0);
            }

            return 8; // Beastman
        };
        lua["CampaignBattleStart"] = [this](uint16 zoneID) -> uint8
        {
            TracyZoneScoped;

            if (sql->Query("SELECT nation FROM `campaign_map` WHERE zoneid = %u;", zoneID) != SQL_ERROR && sql->NumRows() > 0 && sql->NextRow() != SQL_ERROR)
            {
                return sql->GetUIntData(2);
            }

            return 0; // IsBattle
        };
        lua["BattleStatus"] = [this](uint16 amount, uint16 zoneID) -> void
        {
            TracyZoneScoped;
            sql->Query("UPDATE campaign_map SET isbattle = %u WHERE zoneid = %u", amount, zoneID);      
        };

        lua["CampaignAddInfluence"] = [this](uint16 zoneID, uint8 faction, uint16 amount) -> void
        {
            TracyZoneScoped;
            sql->Query("UPDATE campaign_map SET %s = %s + $u WHERE zoneid = %u", control_map[faction], control_map[faction], amount, zoneID);

        };

        lua["CampaignUpdateControl"] = [this](uint16 zoneID) -> void
        {
            TracyZoneScoped;

            const char* updateCampaign =
                "UPDATE campaign_map SET nation = (\
                SELECT CASE GREATEST(influence_sandoria, influence_bastok, influence_windurst, influence_beastman) \
                WHEN influence_sandoria THEN 2   \
                WHEN influence_bastok   THEN 4   \
                WHEN influence_windurst THEN 6   \
                WHEN influence_beastman THEN 8)) \
                WHERE zoneid = %u";

            sql->Query(updateCampaign, zoneID);
        };
    }
};

REGISTER_CPP_MODULE(CampaignModule);
