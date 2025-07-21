local QBCore = exports['qb-core']:GetCoreObject()

-- حبة الموت
RegisterNetEvent('pill:death', function()
    local ped = PlayerPedId()
    RequestAnimDict("mp_suicide")
    while not HasAnimDictLoaded("mp_suicide") do Wait(0) end
    TaskPlayAnim(ped, "mp_suicide", "pill", 8.0, -8.0, -1, 1, 0, false, false, false)
    QBCore.Functions.Notify("أكلت الحبة... وداعًا", "error")
    Wait(4000)
    SetEntityHealth(ped, 0)
    Wait(120000)
    local model = GetHashKey("u_m_y_zombie_01")
    RequestModel(model)
    while not HasModelLoaded(model) do Wait(0) end
    SetPlayerModel(PlayerId(), model)
end)

-- حبة التحول إلى قرد
RegisterNetEvent('pill:transform', function(modelName)
    local ped = PlayerPedId()
    local originalModel = GetEntityModel(ped)

    RequestAnimDict("mp_suicide")
    while not HasAnimDictLoaded("mp_suicide") do Wait(0) end
    TaskPlayAnim(ped, "mp_suicide", "pill", 8.0, -8.0, -1, 1, 0, false, false, false)
    QBCore.Functions.Notify("تشعر أن جسمك يتغير...", "error")

    Wait(4000)
    local model = GetHashKey(modelName)
    RequestModel(model)
    while not HasModelLoaded(model) do Wait(0) end
    SetPlayerModel(PlayerId(), model)

    Wait(60000)
    RequestModel(originalModel)
    while not HasModelLoaded(originalModel) do Wait(0) end
    SetPlayerModel(PlayerId(), originalModel)
    QBCore.Functions.Notify("رجعت إلى طبيعتك", "success")
end)

-- حبة السرعة
RegisterNetEvent('pill:speed', function()
    local ped = PlayerPedId()
    QBCore.Functions.Notify("سرعتك ارتفعت بشكل مجنون!", "success")
    SetRunSprintMultiplierForPlayer(PlayerId(), 2.0)
    Wait(30000)
    SetRunSprintMultiplierForPlayer(PlayerId(), 1.0)
    QBCore.Functions.Notify("رجعت سرعتك طبيعية", "primary")
end)
