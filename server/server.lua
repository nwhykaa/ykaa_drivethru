RegisterNetEvent('ykaa_drivethru:buy', function(item, price)
    local source = source
    
    local moneyCount = exports.ox_inventory:Search(source, 'count', 'money')

    if moneyCount >= price then
        exports.ox_inventory:RemoveItem(source, 'money', price)
        
        exports.ox_inventory:AddItem(source, item, 1)

        TriggerClientEvent('ox_lib:notify', source, {
            title = 'Succes',
            description = 'You buyed' .. item .. ' for $' .. price,
            type = 'success',
            position = 'top-right'
        })
    else
        TriggerClientEvent('ox_lib:notify', source, {
            title = 'Error',
            description = 'You dont have money ($' .. price .. ')!',
            type = 'error',
            position = 'top-right'
        })
    end
end)
