ESX = nil

TriggerEvent(Config.esxGetter, function(obj)
    ESX = obj
    
end)

RegisterNetEvent("rdl:rent")
AddEventHandler("rdl:rent", function(vehicleId)
    local _src = source
    local xPlayer = ESX.GetPlayerFromId(_src)
    local price = Config.location[vehicleId].price

   if priceAvailable and xPlayer.getMoney() >= price then
        xPlayer.removeMoney(price)
    elseif xPlayer.getMoney() >= price then
        xPlayer.removeMoney(price)
    else
        TriggerClientEvent("rdl:cb", _src, false, "~r~Vous n'avez pas assez d'argent")
        return
    end

    TriggerClientEvent("rdl:cb", _src, true, "~g~Bonne route", Config.location[vehicleId])
end)