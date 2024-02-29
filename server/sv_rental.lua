local QBCore = exports['qb-core']:GetCoreObject()

CreateThread(function()
    QBCore.Functions.AddItems({
        ['rental_papers'] = {
            ['name'] = 'rental_papers',
            ['label'] = 'Ticket Rental',
            ['weight'] = 100,
            ['type'] = 'item',
            ['image'] = 'rental.png',
            ['unique'] = false,
            ['useable'] = false,
            ['shouldClose'] = false,
            ['combinable'] = nil,
            ['description'] = 'Tiket Rental Kendaraan'
        }
    })
end)

RegisterNetEvent('arsy-rental:server:rentalSepeda', function(kendaraan)
    local Player = QBCore.Functions.GetPlayer(source)
    if not Player then return end
    Player.Functions.RemoveMoney('cash', kendaraan.harga, "vehicle-rental")
    Player.Functions.AddItem('rental_papers', 1)
end)