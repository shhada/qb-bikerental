local QBCore = exports['qb-core']:GetCoreObject()

RegisterServerEvent('qb-bikerental:Pay', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local PlayerMoney = {
        cash = Player.PlayerData.money.cash,
        bank = Player.PlayerData.money.bank
    }
    local missingMoney = 0

    if PlayerMoney.cash >= Config.Price then
        Player.Functions.RemoveMoney('cash', Config.Price, "bike-rental")
    elseif PlayerMoney.bank >= Config.Price then
        Player.Functions.RemoveMoney('bank', Config.Price, "bike-rental")
    else
        if PlayerMoney.bank > PlayerMoney.cash then
            missingMoney = (Config.Price - PlayerMoney.bank)
        else
            missingMoney = (Config.Price - PlayerMoney.cash)
        end
        TriggerClientEvent('QBCore:Notify', src, 'Not Enough Money, You Are Missing $' .. missingMoney .. '', 'error')
    end
end)
