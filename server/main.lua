local QBCore = exports['qb-core']:GetCoreObject()

RegisterServerEvent('knoes:chickenpicking')
AddEventHandler('knoes:chickenpicking', function()
	local src = source
	local Player = QBCore.Functions.GetPlayer(source)

	Player.Functions.AddItem("alivechicken", math.random(Config.PickingMinChicken,Config.PickingMaxChicken))
	TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["alivechicken"], 'add')
end)

RegisterServerEvent("knoes:chickenprocessing")
AddEventHandler("knoes:chickenprocessing", function()
	local src = source
    local Player = QBCore.Functions.GetPlayer(source)
    if Player.Functions.RemoveItem("alivechicken", Config.CutChicken) then
			TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["alivechicken"], 'remove')
			QBCore.Functions.Notify(Config.Locales['cut_chicken'], "success")
			Player.Functions.AddItem("slaughteredchicken", 1)
			TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["slaughteredchicken"], 'add')
        else
    end
end)

RegisterServerEvent("knoes:chickenpacking")
AddEventHandler("knoes:chickenpacking", function()
	local src = source
    local Player = QBCore.Functions.GetPlayer(source)
    if Player.Functions.RemoveItem("slaughteredchicken", Config.PacketChicken) then
			TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["slaughteredchicken"], 'remove')
			Player.Functions.AddItem("packagedchicken", 1)
			TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["packagedchicken"], 'add')
        else
    end
end)

RegisterNetEvent('knoes:sellItems', function()
    local source = source
    local price = 0
    local Player = QBCore.Functions.GetPlayer(source)
    if Player.PlayerData.items ~= nil and next(Player.PlayerData.items) ~= nil then
        for k, v in pairs(Player.PlayerData.items) do
            if Player.PlayerData.items[k] ~= nil then
                if Config.Sell[Player.PlayerData.items[k].name] ~= nil then
                    price = price + (Config.Sell[Player.PlayerData.items[k].name].price * Player.PlayerData.items[k].amount)
                    Player.Functions.RemoveItem(Player.PlayerData.items[k].name, Player.PlayerData.items[k].amount, k)
                    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[Player.PlayerData.items[k].name], "remove")
                end
            end
        end
        Player.Functions.AddMoney("cash", price)
		TriggerClientEvent('QBCore:Notify', source, Config.Locales["sell_chicken"])
	end
end)


