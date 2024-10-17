ESX = nil

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end
end)

local function handlestrawberriesStart()
    local playerPed = PlayerPedId()

    ESX.Streaming.RequestAnimDict('amb@prop_human_movie_bulb@idle_a', function()
        TaskPlayAnim(PlayerPedId(), 'amb@prop_human_movie_bulb@idle_a', 'idle_a', 8.0, -8.0, -1, 2, 0, false, false, false)
    end)

        if lib.skillCheck(Config.SkillCheckTypes) then
        TriggerServerEvent('farmer-system:getstrawberries')
        ClearPedTasks(playerPed)
    else
        ClearPedTasks(playerPed)
        ESX.ShowNotification(Config.Locale['failed'])
    end

    ClearPedTasks(playerPed)
end

RegisterNetEvent("farmer-system:startstrawberries")
AddEventHandler("farmer-system:startstrawberries", handlestrawberriesStart)

exports.ox_target:addSphereZone({
    coords = vec3(363.9182, 6479.439, 29.86481),
    radius = 3,
    id = 2,
    options = {
        {
            event = 'farmer-system:startstrawberries',
            icon = 'fa-solid fa-apple-whole',
            label = Config.Locale['collectstrawberries'],
            distance = 2,
            canInteract = function(entity, distance, coords, name)
                return true
            end
        }
    }
})
