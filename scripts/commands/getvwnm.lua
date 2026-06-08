-----------------------------------
-- func: getvwnm
-- desc: displays your vwnm kills
-----------------------------------

local commandObj = {}

commandObj.cmdprops =
{
    permission = 0,
    parameters = "is"
}

local function error(player, msg)
    player:printToPlayer(msg)
    player:printToPlayer('!getvwnm <option>')
end

local vwnmVariables =
{
    '[VWNM] Sallow_Seymour',
    '[VWNM] Ushumgal',
    '[VWNM] Sarimanok',
    '[VWNM] Cottus',
    '[VWNM] Virvatuli', 
    '[VWNM] Pancimanci',
    '[VWNM] Goji',
    '[VWNM] Gugalanna',
    '[VWNM] Yatagarasu',
    '[VWNM] Agathos',
    '[VWNM] Cherufe',
    '[VWNM] Taweret',
    '[VWNM] Holy_Moly',
    '[VWNM] Ildebrann',
    '[VWNM] Neith',
    '[VWNM] Sabotender_Campeador',
    '[VWNM] Tangaroa',
    '[VWNM] Malleator_Maurok',
    '[VWNM] Fjalar',
    '[VWNM] Abununnu',
    '[VWNM] Tsui-Goab',
    '[VWNM] Isarukitsck',
    '[VWNM] Dimgruzub',
    '[VWNM] Brekekekex',
    '[VWNM] Yalungur',
    '[VWNM] Vanasarvik',
    '[VWNM] Lorbulcrud',
    '[VWNM] Krabimanjaro',
    '[VWNM] Ogbunabali',
    '[VWNM] Roly-Poly', 
    '[VWNM] Laidly_Laurence',
    '[VWNM] Mellonia',
    '[VWNM] Nympha_Eunomia',
    '[VWNM] Gasha',
    '[VWNM] Giltine',
    '[VWNM] Cath_Palug',
    '[VWNM] Modron',
    '[VWNM] Mimic_King',
    '[VWNM] Bismarck',
    '[VWNM] Morta',
    '[VWNM] Murk-veined_Baneberry',
    '[VWNM] Melancholic_Moira',
    '[VWNM] Belphoebe',
    '[VWNM] Kholomodumo',
    '[VWNM] Lord_Asag',
    '[VWNM] Akupara',
    '[VWNM] Kaggen',
    '[VWNM] Akvan',
    '[VWNM] Pil',
    '[VWNM] Aello',
    '[VWNM] Uptala',
    '[VWNM] Qilin',
    '[VWNM] Celaeno',
    '[VWNM] Hahava',
    '[VWNM] Voidwrought',
    '[VWNM] Lancing_Lamorak',
    '[VWNM] Bhishani', 
    '[VWNM] Rw_Nw_Prt_M_Hrw',
    '[VWNM] Stachysaurus',
    '[VWNM] Gwynn_ap_Nudd',
    '[VWNM] Smierc',
    '[VWNM] Gaunab',
    '[VWNM] Ocythoe',
    '[VWNM] Kalasutrax',
    '[VWNM] Ig-Alima',
    '[VWNM] Botulus_Rex',
}
-- function(player)
commandObj.onTrigger = function(player, option)

    if option == nil or option < 1 or option > 2 then
        error(player, 'Invalid option, please enter 1 for VWNM killed or 2 for VWNM not killed.')
        return
    end

    if option == 1 then     
        for i = 1, #vwnmVariables do
            if player:getCharVar(vwnmVariables[i]) ~= 0 then
                player:printToPlayer(string.format('%s %s', vwnmVariables[i],  player:getCharVar(vwnmVariables[i])),3, xi.msg.channel.system_3)
            end
        end
    elseif option == 2 then
        for i = 1, #vwnmVariables do
            if player:getCharVar(vwnmVariables[i]) == 0 then
                player:printToPlayer(string.format('%s %s', vwnmVariables[i],  player:getCharVar(vwnmVariables[i])),3, xi.msg.channel.system_3)
            end
        end
    end
end
return commandObj

