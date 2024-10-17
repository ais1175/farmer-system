ESX = nil

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end
end)

RegisterNetEvent("farmer-system:getmilk")
AddEventHandler("farmer-system:getmilk", function()
    local xPlayer = ESX.GetPlayerFromId(source)
            if xPlayer.canCarryItem("milk", 10) then
                xPlayer.addInventoryItem("milk", math.random(2, 10))
            else
                xPlayer.showNotification(Config.Locale['inventoryfull'])
    end
end)