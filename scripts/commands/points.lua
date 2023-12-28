---------------------------------------------------------------------------------------------------
-- func: Checks current currencies held
---------------------------------------------------------------------------------------------------

local commandObj = {}

commandObj.cmdprops =
{
    permission = 0,
    parameters = 'i'
}

commandObj.onTrigger = function(player)
local scyld = player:getCurrency("scyld")
local cruor = player:getCurrency("cruor")
local spark = player:getCurrency("spark_of_eminence")
local daily = player:getCurrency("daily_tally")
local valor = player:getCurrency("valor_point")
local imperial = player:getCurrency("imperial_standing")
local jetton = player:getCurrency("jetton")
local zeni = player:getCurrency("zeni_point")

player:printToPlayer("Current Scyld: "..scyld..".", 0xD)
player:printToPlayer("Current Cruor: "..cruor..".", 0xD)
player:printToPlayer("Current Sparks: "..spark..".", 0xD)
player:printToPlayer("Current Valor: "..valor..".", 0xD)
player:printToPlayer("Current Daily Points: "..daily..".", 0xD)
player:printToPlayer("Current Imperial Standing "..imperial..".",0xD)
player:printToPlayer("Current Jetton: "..jetton..".",0xD)
player:printToPlayer("Current Zeni: "..zeni..".",0xD)


end
return commandObj