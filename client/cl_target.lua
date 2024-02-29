local PedSewa = nil

local function AddTargetPed(menu)
    exports['qb-target']:AddTargetEntity(PedSewa, {
        options = {
            { 
                icon = 'fas fa-car', 
                label = 'Rental Sepeda', 
                action = function(entity) 
                    lib.showContext('arsy-rental.' .. menu)
                end,
            }
        }
    })
end

local function RegisterPedSpawner(data)
    lib.points.new({
        coords = data.KordinatPed,
        distance = 25,

        onEnter = function()
            lib.requestModel(data.model)
            PedSewa = CreatePed(4, joaat(data.model), data.KordinatPed.x, data.KordinatPed.y, data.KordinatPed.z, data.KordinatPed.w, false, true)
            SetEntityHeading(PedSewa, data.KordinatPed.w)
            FreezeEntityPosition(PedSewa, true)
            SetEntityInvincible(PedSewa, true)
            SetBlockingOfNonTemporaryEvents(PedSewa, true)
            SetModelAsNoLongerNeeded(PedSewa)

            TaskStartScenarioInPlace(PedSewa, data.scenario, 0, true)

            SpawnSepeda = data.SpawnKendaraan

            AddTargetPed(data.menu)
        end,

        onExit = function()
            if PedSewa ~= nil then
                DeleteEntity(PedSewa)
                PedSewa = nil
            end
        end
    })
end

CreateThread(function()
    for _, v in ipairs(LokasiRental) do
        RegisterPedSpawner(v)
    end
end)