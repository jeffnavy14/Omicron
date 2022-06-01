-----------------------------------
-- Area: Al'Taieu
--   NM: Megumin
-----------------------------------
require("modules/module_utils")
require("scripts/zones/AlTaieu/Zone")
-----------------------------------
local m = Module:new("isekai")
m:setEnabled(true)

m:addOverride("xi.zones.AlTaieu.Zone.onInitialize", function(zone)
    super(zone)

end)

 entity.onTrade = function(player, npc, trade)
    
    if (
        trade:hasItemQty(3454, 1) and -- zelos_orb
	  trade:hasItemQty(3455, 1) and -- bia_orb
        trade:getItemCount() == 2
    ) then
      
        player:tradeComplete()
        local mob = zone:insertDynamicEntity({
		    objtype = xi.objType.MOB,
            name = "Megumin",
            look = "2373",
            x = 431,
            y = -0,
            z = -603,
            rotation = 33,
            widescan = 1,

            groupId = 1,
            groupZoneId = 222,:updateClaim(player)
    end
end


            onMobSpawn = function(mob)			   
              -- Server-wide message
              player:PrintToArea("{Megumin} Wahahahahaha! My name is Megumin, the number one mage of Axel! Come, you shall all become my experience points today!", xi.msg.channel.SYSTEM_3, xi.msg.area.SYSTEM)
            end,


            onMobFight = function(mob, target)

            local lifePercent = mob:getHPP()

        	if lifePercent < 75 and GetServerVariable("GigaFlareUsed") == 0 then
                mob:useMobAbility(1552)
 			mob:setMod(xi.mod.MATT, 200)
	    		SetServerVariable("GigaFlareUsed", 1)
	        end
	    	if lifePercent < 50 and GetServerVariable("GigaFlareUsed") == 1 then
                mob:useMobAbility(1552)
	    		mob:setMod(xi.mod.MATT, 300)
                  player:PrintToArea("{Megumin} Ex-PLOSION~!", xi.msg.channel.SYSTEM_3, xi.msg.area.SYSTEM)
               	SetServerVariable("GigaFlareUsed", 2)
	         end
	    	if lifePercent < 25 and GetServerVariable("GigaFlareUsed") == 2 then
                mob:useMobAbility(1552)
			mob:setMod(xi.mod.MATT, 400)
	      	player:PrintToArea("{Megumin} I beseech thee, combine with my deep crimson. The time of awakening cometh.", xi.msg.channel.SYSTEM_3, xi.msg.area.SYSTEM)
	    		player:PrintToArea("{Megumin} Justice, fallen upon the infallible boundary, appear now as an intangible distortions!.", xi.msg.channel.SYSTEM_3, xi.msg.area.SYSTEM)
			player:PrintToArea("{Megumin} Ex-PLOSION~!", xi.msg.channel.SYSTEM_3, xi.msg.area.SYSTEM)
			SetServerVariable("GigaFlareUsed", 3)
	        end
	    	if lifePercent < 5 and GetServerVariable("GigaFlareUsed") == 3 then
                mob:useMobAbility(1552)
	    		mob:setMod(xi.mod.MATT, 600)
			player:PrintToArea("{Megumin} Light in the end of the corners of the world,", xi.msg.channel.SYSTEM_3, xi.msg.area.SYSTEM)
			player:PrintToArea("{Megumin} come together I call upon the crimson realm, my ultimate destruction magic!", xi.msg.channel.SYSTEM_3, xi.msg.area.SYSTEM)
			player:PrintToArea("{Megumin} EX-PLO~SION~!", xi.msg.channel.SYSTEM_3, xi.msg.area.SYSTEM)
	    		SetServerVariable("GigaFlareUsed", 4)


              end,
            onMobSpawn = function(mob)
	          mob:addStatusEffect(xi.effect.PHALANX, 35, 0, 180)
                mob:addStatusEffect(xi.effect.STONESKIN, 350, 0, 300)
                mob:addStatusEffect(xi.effect.PROTECT, 175, 0, 1800)
                mob:addStatusEffect(xi.effect.SHELL, 84, 0, 1800)
              end,
        })

        mob:setSpawn(431, -0, -603)
        mob:setDropID(5474)
        mob:setMobLevel(145)
        mob:addMod(xi.mod.STR, 40)
        mob:addMod(xi.mod.VIT, 40)
        mob:addMod(xi.mod.INT, 200)
        mob:addMod(xi.mod.MND, 200)
        mob:addMod(xi.mod.CHR, 200)
        mob:addMod(xi.mod.AGI, 40)
        mob:addMod(xi.mod.DEX, 40)
        mob:setMod(xi.mod.MATT, 100)
        mob:setMod(xi.mod.MACC, 3000)
        mob:setMod(xi.mod.DEF, 3000)
        mob:setMod(xi.mod.MDEF, 4000)
        mob:setMod(xi.mod.ENSPELL_DMG, 100)
        mob:setMod(xi.mod.HASTE_MAGIC, 300)
        mob:setMod(xi.mod.ATT, 567)
        mob:setMod(xi.mod.ACC, 1800)
        mob:setMod(xi.mod.EARTH_RES, 20)
        mob:setMod(xi.mod.DARK_RES, 250)
        mob:setMod(xi.mod.LIGHT_RES, 200)
        mob:setMod(xi.mod.ICE_RES, 200)
        mob:setMod(xi.mod.FIRE_RES, 2000)
        mob:setMod(xi.mod.WATER_RES, 200)
        mob:setMod(xi.mod.THUNDER_RES, 200)
        mob:setMod(xi.mod.WIND_RES, 200)
        mob:setMod(xi.mod.SILENCERES, 1000)
        mob:setMod(xi.mod.STUNRES, 50)
        mob:setMod(xi.mod.BINDRES, 100)
        mob:setMod(xi.mod.GRAVITYRES, 100)
        mob:setMod(xi.mod.SLEEPRES, 100)
        mob:setMod(xi.mod.POISONRES, 100)
        mob:setMod(xi.mod.PARALYZERES, 100)
        mob:setMod(xi.mod.LULLABYRES, 100)
        mob:setMobMod(xi.mobMod.SKILL_LIST, 726)
        mob:setMobMod(xi.mobMod.SPELL_LIST, 144)
        mob:setMod(xi.mod.PETRIFYRES, 500)
        mob:setMod(xi.mod.STUNRES, 2000)	
        mob:setMod(xi.mod.FAST_CAST, 200)	
	  mob:setMobMod(xi.mobMod.MAGIC_COOL, 50)
        mob:addStatusEffect(xi.effect.REGEN, 10, 3, 0)
        mob:addStatusEffect(xi.effect.BLAZE_SPIKES, 70, 0, 0)
        mob:addStatusEffect(xi.effect.REGAIN, 10, 3, 0)
        mob:addStatusEffect(xi.effect.REGEN, 30, 3, 0)
        mob:addStatusEffect(xi.effect.ENFIRE_II, 100, 0, 0)
        mob:addStatusEffect(xi.effect.REFRESH, 100, 3, 0)
	  mob:setMobMod(xi.mobMod.SKILL_LIST, 361)
        mob:setMobMod(xi.mobMod.SPELL_LIST, 86)

		end
	    
end)
