local driveThruPed = nil

local function createBlip()
    local b = Config.DriveThru.Blip
    if not b.enabled then return end
    
    local blip = AddBlipForCoord(b.coords.x, b.coords.y, b.coords.z)
    SetBlipSprite(blip, b.sprite)
    SetBlipDisplay(blip, 4)
    SetBlipScale(blip, b.scale)
    SetBlipColour(blip, b.color)
    SetBlipAsShortRange(blip, true)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString(b.label)
    EndTextCommandSetBlipName(blip)
end

local function spawnDriveThruPed()
    if driveThruPed and DoesEntityExist(driveThruPed) then
        DeleteEntity(driveThruPed)
    end
    
    local cfg = Config.DriveThru
    RequestModel(cfg.Model)
    while not HasModelLoaded(cfg.Model) do Wait(10) end

    driveThruPed = CreatePed(4, cfg.Model, cfg.PedCoords.x, cfg.PedCoords.y, cfg.PedCoords.z, cfg.PedCoords.w, false, false)
    
    SetEntityAsMissionEntity(driveThruPed, true, true)
    SetBlockingOfNonTemporaryEvents(driveThruPed, true)
    SetEntityInvincible(driveThruPed, true)
    FreezeEntityPosition(driveThruPed, true)

    lib.requestAnimDict(cfg.Animation.dict)
    TaskPlayAnim(driveThruPed, cfg.Animation.dict, cfg.Animation.name, 8.0, 0, -1, 1, 0, 0, 0)

    exports.ox_target:addLocalEntity(driveThruPed, {
        {
            name = 'ykaa_drivethru_target',
            icon = cfg.Target.icon,
            label = cfg.Target.label,
            distance = cfg.Target.distance,
            onSelect = function()
                lib.registerContext({
                    id = 'ykaa_chef_menu',
                    title = 'Drive Thru',
                    options = Config.Items
                })
                lib.showContext('ykaa_chef_menu')
            end
        }
    })
end

CreateThread(function()
    spawnDriveThruPed()
    createBlip()
end)

AddEventHandler('onResourceStop', function(resourceName)
    if (GetCurrentResourceName() ~= resourceName) then return end
    if driveThruPed and DoesEntityExist(driveThruPed) then
        DeleteEntity(driveThruPed)
    end
end)