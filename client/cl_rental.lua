local QBCore = exports['qb-core']:GetCoreObject()
SpawnSepeda = nil

AddEventHandler('arsy-rental:client:rentalSepeda', function(kendaraan)
    local PlayerData = QBCore.Functions.GetPlayerData()
    local uang = PlayerData.money['cash']

    if uang < kendaraan.harga then
        QBCore.Functions.Notify("Anda tidak mempunyai uang yang cukup untuk menyewa sepeda...", "error")
        return
    end

    TriggerServerEvent('arsy-rental:server:rentalSepeda', kendaraan)

    QBCore.Functions.SpawnVehicle(kendaraan.model, function(veh)
        SetEntityHeading(veh, SpawnSepeda.w)
        exports['LegacyFuel']:SetFuel(veh, 100.0)

        SetVehicleNumberPlateText(veh, "RENTAL")
        TriggerEvent("vehiclekeys:client:SetOwner", QBCore.Functions.GetPlate(veh))

        SetVehicleEngineOn(veh, true, true)    
        SetVehicleDirtLevel(veh, 0.0)
        
        QBCore.Functions.Notify("Anda berhasil merental sepeda", "success")
    end, SpawnSepeda, true, true)
end)

CreateThread(function()
    for k, v in pairs(MenuRental) do
        local options =  {}
    
        for _, kendaraan in pairs(v.kendaraan) do
            options[#options + 1] = {
                title = kendaraan.label,
                description = "$ " .. kendaraan.harga,

                onSelect = function()
                    TriggerEvent('arsy-rental:client:rentalSepeda', kendaraan)
                end
            }
        end
    
        lib.registerContext({
            id = 'arsy-rental.' .. k,
            title = v.label,
            options = options
        })
    end
end)

--
-- Blips Untuk Merental Sepeda
--
CreateThread(function()
    for k, v in pairs(LokasiRental) do
        if not v.blip.show then goto continue end
        local blip = AddBlipForCoord(v.blip.coords.x, v.blip.coords.y, v.blip.coords.z)
        SetBlipSprite(blip, v.blip.sprite)
        SetBlipDisplay(blip, 4)
        SetBlipScale(blip, v.blip.scale)
        SetBlipAsShortRange(blip, true)
        SetBlipColour(blip, v.blip.color)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentSubstringPlayerName(v.blip.label)
        EndTextCommandSetBlipName(blip)
        ::continue::
    end
end)