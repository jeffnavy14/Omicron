---------------------------------------------------------------------------------------------------
-- func: Checks current currencies held
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 0,
    parameters = "s"
}

function onTrigger(player)
local scyld = player:getCurrency("scyld")
local Cruor = player:getCurrency("cruor")
local spark = player:getCurrency("spark_of_eminence")
local daily = player:getCurrency("daily_tally")
local valor = player:getCurrency("valor_point")
local imperial = player:getCurrency("imperial_standing")
local jetton = player:getCurrency("jetton")
local zeni = player:getCurrency("zeni_point")

player:PrintToPlayer("Current Scyld: "..scyld..".", 0xD)
player:PrintToPlayer("Current Cruor: "..cruor..".", 0xD)
player:PrintToPlayer("Current Sparks: "..spark..".", 0xD)
player:PrintToPlayer("Current Valor: "..valor..".", 0xD)
player:PrintToPlayer("Current Daily Points: "..daily..".", 0xD)
player:PrintToPlayer("Current Imperial Standing "..imperial..".",0xD)
player:PrintToPlayer("Current Jetton: "..jetton..".",0xD)
player:PrintToPlayer("Current Zeni: "..zeni..".",0xD)


end