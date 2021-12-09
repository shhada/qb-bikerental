local QBCore = exports['qb-core']:GetCoreObject()
local bikeprice = {}

QBCore.Functions.CreateCallback('qb-bikerental:checkPrice', function(source, cb)
    local Player = QBCore.Functions.GetPlayer(source)
    local CitizenId = Player.PlayerData.citizenid

    if Player.PlayerData.money.bank >= Config.BikePrice then
        bikeprice[CitizenId] = "bank"
        Player.Functions.RemoveMoney('bank', Config.BikePrice)
        cb(true)
    else
        cb(false)
    end
end)

RegisterServerEvent('qb-bikerental:hasMoney', function(hasMoney)
    local user = source
    local Player = QBCore.Functions.GetPlayer(user)

    if Player then
        Player.Functions.RemoveMoney('bank', hasMOney)
    end
end)  