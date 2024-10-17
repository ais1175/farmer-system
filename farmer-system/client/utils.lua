-- Create a blip for the location using the config values
Citizen.CreateThread(function()
    local blip = AddBlipForCoord(Config.BlipLocation)
    SetBlipSprite(blip, Config.BlipSettings.sprite)
    SetBlipDisplay(blip, 4)
    SetBlipScale(blip, Config.BlipSettings.scale)
    SetBlipColour(blip, Config.BlipSettings.color)
    SetBlipAsShortRange(blip, true)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString("Ferma")
    EndTextCommandSetBlipName(blip)
end)

-- Create the dealer NPC using the config values
Citizen.CreateThread(function()
    local dealerHash = GetHashKey(Config.PedModel)
    RequestModel(dealerHash)

    while not HasModelLoaded(dealerHash) do
        Wait(1)
    end

    -- Coordinates for the dealer ped using config
    local dealerPed = CreatePed(4, dealerHash, Config.PedLocation.x, Config.PedLocation.y, Config.PedLocation.z, Config.PedHeading, false, true)
    SetEntityInvincible(dealerPed, true)
    SetBlockingOfNonTemporaryEvents(dealerPed, true)
    FreezeEntityPosition(dealerPed, true)
end)

-- Target interaction for the dealer
exports.ox_target:addModel(Config.PedModel, {
    {
        event = 'farming:openmenu',
        icon = 'fas fa-hand-rock',
        label = Config.Locale['utils'], -- Use locale for label
        distance = 2,
    }
})

-- Open menu to sell items
RegisterNetEvent('farming:openmenu')
AddEventHandler('farming:openmenu', function()
TriggerServerEvent('farming:sellItem')
end)
