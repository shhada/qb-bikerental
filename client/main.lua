local QBCore = exports['qb-core']:GetCoreObject()
local PlayerData = QBCore.Functions.GetPlayerData()
local pedspawned = false

RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function(Player)
  PlayerData = Player   
end)

RegisterNetEvent('QBCore:Client:OnJobUpdate', function(job)
  PlayerData.job = job
end)


RegisterNetEvent('qb-bikerental:bmx', function(bike)
    local rent = true
    local vehicle = bike.vehicle
    local rentalbike = nil
    QBCore.Functions.TriggerCallback('qb-bikerental:checkPrice', function(hasMoney)
        if hasMoney then
            if vehicle == 'bmx' then
                QBCore.Functions.SpawnVehicle(vehicle, function(veh)
                    rentalvehicle = veh
                    TaskWarpPedIntoVehicle(PlayerPedId(), veh, -1)
                    TriggerEvent("vehiclekeys:client:SetOwner", GetVehicleNumberPlateText(veh))
                    exports['LegacyFuel']:SetFuel(veh, 100.0)
                end)
                TriggerServerEvent('qb-bikerental:hasMoney', Config.BikePrice)
            elseif  vehicle == 'cruiser' then
                QBCore.Functions.SpawnVehicle(vehicle, function(veh)
                    rentalvehicle = veh
                    TaskWarpPedIntoVehicle(PlayerPedId(), veh, -1)
                    TriggerEvent("vehiclekeys:client:SetOwner", GetVehicleNumberPlateText(veh))
                    exports['LegacyFuel']:SetFuel(veh, 100.0)
                end)
                TriggerServerEvent('qb-bikerental:hasMoney', Config.BikePrice)
            elseif vehicle ==  'fixter' then
                QBCore.Functions.SpawnVehicle(vehicle, function(veh)
                    rentalvehicle = veh
                    TaskWarpPedIntoVehicle(PlayerPedId(), veh, -1)
                    TriggerEvent("vehiclekeys:client:SetOwner", GetVehicleNumberPlateText(veh))
                    exports['LegacyFuel']:SetFuel(veh, 100.0)
                end)
                TriggerServerEvent('qb-bikerental:hasMoney', Config.BikePrice)
            elseif vehicle == 'scorcher' then
                QBCore.Functions.SpawnVehicle(vehicle, function(veh)
                    rentalvehicle = veh
                    TaskWarpPedIntoVehicle(PlayerPedId(), veh, -1)
                    TriggerEvent("vehiclekeys:client:SetOwner", GetVehicleNumberPlateText(veh))
                    exports['LegacyFuel']:SetFuel(veh, 100.0)
                end)
                TriggerServerEvent('qb-bikerental:hasMoney', Config.BikePrice)
            elseif vehicle == 'tribike' then 
                QBCore.Functions.SpawnVehicle(vehicle, function(veh)
                    rentalvehicle = veh
                    TaskWarpPedIntoVehicle(PlayerPedId(), veh, -1)
                    TriggerEvent("vehiclekeys:client:SetOwner", GetVehicleNumberPlateText(veh))
                    exports['LegacyFuel']:SetFuel(veh, 100.0)
                end)
                TriggerServerEvent('qb-bikerental:hasMoney', Config.BikePrice)
            elseif vehicle == 'tribike2' then
                QBCore.Functions.SpawnVehicle(vehicle, function(veh)
                    rentalvehicle = veh
                    TaskWarpPedIntoVehicle(PlayerPedId(), veh, -1)
                    TriggerEvent("vehiclekeys:client:SetOwner", GetVehicleNumberPlateText(veh))
                    exports['LegacyFuel']:SetFuel(veh, 100.0)
                end)
                TriggerServerEvent('qb-bikerental:hasMoney', Config.BikePrice)
            elseif vehicle == 'tribike3' then
                QBCore.Functions.SpawnVehicle(vehicle, function(veh)
                    rentalvehicle = veh
                    TaskWarpPedIntoVehicle(PlayerPedId(), veh, -1)
                    TriggerEvent("vehiclekeys:client:SetOwner", GetVehicleNumberPlateText(veh))
                    exports['LegacyFuel']:SetFuel(veh, 100.0)
                end)
            elseif vehicle == 'serv_electricscooter' then
                QBCore.Functions.SpawnVehicle(vehicle, function(veh)
                    rentalvehicle = veh
                    TaskWarpPedIntoVehicle(PlayerPedId(), veh, -1)
                    TriggerEvent("vehiclekeys:client:SetOwner", GetVehicleNumberPlateText(veh))
                    exports['LegacyFuel']:SetFuel(veh, 100.0)
                end)
                TriggerServerEvent('qb-bikerental:hasMoney', Config.BikePrice)
            end
        else 
            TriggerEvent('QBCore:Notify', 'You don\'t have enough money!', 'error')
        end
    end, Config.BikePrice)    
end)

RegisterNetEvent('qb-bikerental:deliver', function()
    local Player = QBCore.Functions.GetPlayerData()
    local rental = GetVehiclePedIsIn(PlayerPedId(), true)
    local thingy = IsPedInVehicle(PlayerPedId(), rental, false)
    if thingy ~= false then
        Citizen.Wait(200)
        QBCore.Functions.DeleteVehicle(rental)
        TriggerEvent('QBCore:Notify','Thanks for returning your rental!')
    else
        TriggerEvent('QBCore:Notify','Nothing to return!', 'error')
    end
end)

RegisterNetEvent('qb-bikerental:rented', function()
    TriggerEvent('nh-context:sendMenu', {
        {
            id = 1,
            header = "Rentals ($"..Config.BikePrice..")",
            txt = ""
        },
        {
            id = 2,
            header = "BMX",
            txt = "Shred in the park",
            params = {
                event = "qb-bikerental:bmx",
                args = {
                    vehicle = 'bmx', 
                }
            }
        },
        {
            id = 3,
            header = "Cruiser",
            txt = "Cruise on the beach",
            params = {
                event = "qb-bikerental:bmx",
                args = {
                    vehicle = 'cruiser',  
                }
            }
        },
        {
            id = 4,
            header = "Fixter",
            txt = "Fixed gear bike",
            params = {
                event = "qb-bikerental:bmx",
                args = {
                    vehicle = 'fixter',  
                }
            }
        },
        {
            id = 5,
            header = "Scorcher",
            txt = "Mountain Bike",
            params = {
                event = "qb-bikerental:bmx",
                args = {
                    vehicle = 'scorcher', 
                }
            }
        },
        {
            id = 6,
            header = "Tribike",
            txt = "Triathlon bike in GREEN and WHITE",
            params = {
                event = "qb-bikerental:bmx",
                args = {
                    vehicle = 'tribike',
                }
            }
        },
        {
            id = 7,
            header = "Tribike2",
            txt = "Triathlon bike in RED and WHITE",
            params = {
                event = "qb-bikerental:bmx",
                args = {
                    vehicle = 'tribike2',
                }
            }
        },
        {
            id = 8,
            header = "Tribike3",
            txt = "Triathlon bike in BLUE and WHITE",
            params = {
                event = "qb-bikerental:bmx",
                args = {
                    vehicle = 'tribike3',
                }
            }
        },
        {
            id = 9,
            header = "Electric Scooter",
            txt = "for those times when you're too lazy",
            params = {
                event = "qb-bikerental:bmx",
                args = {
                    vehicle = 'serv_electricscooter',
                }
            }
        },
        {
            id = 10,
            header = "[ RETURN ]",
            txt = "",
            params = {
                event = "qb-bikerental:deliver",
                args = {
                }
            }
        },
        
    })
end)