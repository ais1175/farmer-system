ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)


RegisterNetEvent('farming:sellItem')
AddEventHandler('farming:sellItem', function()
    local xPlayer = ESX.GetPlayerFromId(source)
    local totalSale = 0
    local itemsToSell = {}

    -- Loop through each item in the configuration
    for itemName, itemPrice in pairs(Config.Prices) do
        local item = xPlayer.getInventoryItem(itemName)  -- Get the item from the inventory

        if item and item.count > 0 then  -- Check if the item exists and has count
            totalSale = totalSale + (item.count * itemPrice)  -- Calculate total sale value

            -- Store sold items for notification
            table.insert(itemsToSell, { name = itemName, count = item.count })

            -- Remove all items from the player's inventory
            xPlayer.removeInventoryItem(itemName, item.count)
        end
    end

    -- Check if the player has sold anything
    if totalSale > 0 then
        xPlayer.addMoney(totalSale)  -- Add the total sale amount to the player's money
        local soldItemsList = ""

        -- Prepare a list of sold items for notification
        for _, item in ipairs(itemsToSell) do
            soldItemsList = soldItemsList .. item.count .. " " .. item.name .. ", "
        end

        -- Remove the trailing comma and space
        soldItemsList = soldItemsList:sub(1, -3)
    else
    end
end)

