ESX = nil

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end
end)

RegisterNetEvent("farmer-system:getstrawberries")
AddEventHandler("farmer-system:getstrawberries", function()
    local xPlayer = ESX.GetPlayerFromId(source)
            if xPlayer.canCarryItem("strawberries", 8) then
                xPlayer.addInventoryItem("strawberries", math.random(2, 8))
            else
                xPlayer.showNotification(Config.Locale['inventoryfull'])
    end
end)