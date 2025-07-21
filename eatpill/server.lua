local QBCore = exports['qb-core']:GetCoreObject()

QBCore.Functions.CreateUseableItem("death_pill", function(src)
    TriggerClientEvent('pill:death', src)
end)

QBCore.Functions.CreateUseableItem("monkey_pill", function(src)
    TriggerClientEvent('pill:transform', src, "a_c_chimp")
end)

QBCore.Functions.CreateUseableItem("speed_pill", function(src)
    TriggerClientEvent('pill:speed', src)
end)
