ESX = nil

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end
end)

local function handleCowStart()
    local playerPed = PlayerPedId()
    if lib.skillCheck(Config.SkillCheckTypes) then
    TriggerServerEvent('farmer-system:getmilk')
    ClearPedTasks(playerPed)
else
    ClearPedTasks(playerPed)
    ESX.ShowNotification(Config.Locale['failed'])
end
end
    RegisterNetEvent("farmer-system:startmilk")
    AddEventHandler("farmer-system:startmilk", handleCowStart)


exports.ox_target:addModel("a_c_cow", {{
            event = 'farmer-system:startmilk',
            icon = 'fa-solid fa-cow',
            label = Config.Locale['collectmilk'],
			distance = 2,
}})

local cowModel = ""..Config.CowsConfiguration['CowModel']..""
local cowHash = GetHashKey(cowModel)

Citizen.CreateThread(function()
    RequestModel(cowHash)
    while not HasModelLoaded(cowHash) do
        Citizen.Wait(100)
    end

    for _, location in ipairs(Config.CowsConfiguration['Locations']) do
        local cowPed = CreatePed(28, cowHash, location.x, location.y, location.z, location.heading, false, true)
        SetEntityAsMissionEntity(cowPed, true, true)
        SetBlockingOfNonTemporaryEvents(cowPed, true)
        FreezeEntityPosition(cowPed, true)
    end
end)
