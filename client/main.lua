local QBCore = exports['qb-core']:GetCoreObject()

-- ▄▄▄▄▄▄▄▄▄▄▄
--  Functions
-- ▄▄▄▄▄▄▄▄▄▄▄

local function LoadDict(dict)
    RequestAnimDict(dict)
	while not HasAnimDictLoaded(dict) do
	  	Wait(10)
    end
end

local function processchicken()
    local count = 0
    if(count == 0) then
		local dict = 'anim@amb@business@coc@coc_unpack_cut_left@'
		LoadDict(dict)
		FreezeEntityPosition(GetPlayerPed(-1),true)
		TaskPlayAnim(GetPlayerPed(-1), dict, "coke_cut_v1_coccutter", 3.0, -8, -1, 63, 0, 0, 0, 0 )
		local PedCoords = GetEntityCoords(GetPlayerPed(-1))
		local yarra = CreateObject(GetHashKey('prop_knife'),PedCoords.x, PedCoords.y,PedCoords.z, true, true, true)
		AttachEntityToEntity(yarra, GetPlayerPed(-1), GetPedBoneIndex(GetPlayerPed(-1), 0), 0.13, 0.14, 0.09, 40.0, 0.0, 0.0, false, false, false, false, 2, true)
		SetEntityHeading(GetPlayerPed(-1), 311.0)
		local nane = CreateObject(GetHashKey('prop_int_cf_chick_01'),-94.87, 6207.008, 30.08, true, true, true)
		SetEntityRotation(nane,90.0, 0.0, 45.0, 1,true)
		Wait(5000)
		FreezeEntityPosition(GetPlayerPed(-1),false)
		DeleteEntity(nane)
		DeleteEntity(yarra)
		ClearPedTasks(PlayerPedId())
	
    	TriggerServerEvent("knoes:chickenprocessing")
    end
end

local function packedchicken()
    local count = 0

    if(count == 0) then
		SetEntityHeading(GetPlayerPed(-1), 40.0)
		local PedCoords = GetEntityCoords(GetPlayerPed(-1))
		local zort = CreateObject(GetHashKey('prop_cs_steak'),PedCoords.x, PedCoords.y,PedCoords.z, true, true, true)
		AttachEntityToEntity(zort, GetPlayerPed(-1), GetPedBoneIndex(GetPlayerPed(-1), 0x49D9), 0.15, 0.0, 0.01, 0.0, 0.0, 0.0, false, false, false, false, 2, true)
		local port = CreateObject(GetHashKey('prop_cs_clothes_box'),PedCoords.x, PedCoords.y,PedCoords.z, true, true, true)
		AttachEntityToEntity(port, GetPlayerPed(-1), GetPedBoneIndex(GetPlayerPed(-1), 57005), 0.13, 0.0, -0.16, 250.0, -30.0, 0.0, false, false, false, false, 2, true)
		LoadDict("anim@heists@ornate_bank@grab_cash_heels")
		TaskPlayAnim(PlayerPedId(), "anim@heists@ornate_bank@grab_cash_heels", "grab", 8.0, -8.0, -1, 1, 0, false, false, false)
		Wait(6500)
		FreezeEntityPosition(GetPlayerPed(-1),false)
		DeleteEntity(port)
		DeleteEntity(zort)
		ClearPedTasks(PlayerPedId())
	
       TriggerServerEvent("knoes:chickenpacking")
	   QBCore.Functions.Notify(Config.Locales['packing_chicken'], "success")
	else
		QBCore.Functions.Notify(Config.Locales['not_have_cutchicken'], "error")
    end
end

-- ▄▄▄▄▄▄▄▄▄▄▄
--  Targets
-- ▄▄▄▄▄▄▄▄▄▄▄


exports['qb-target']:AddBoxZone("collectchic", CollectChicken.targetZone, 1.4, 1.4, {
	name="collectchic",
	heading = CollectChicken.heading,
	debugPoly = false,
	minZ = CollectChicken.minZ,
	maxZ = CollectChicken.maxZ,
	}, {
		options = {
			{
				event = "knoes-chickenjob:picking",
				label = "Pickin Chicken",
			},
		},
	   distance = 1.5
  })


exports['qb-target']:AddBoxZone("processing", ProcessingChicken.targetZone, 1.4, 1.4, {
	name="processing",
	heading = ProcessingChicken.heading,
	debugPoly = false,
	minZ = ProcessingChicken.minZ,
	maxZ = ProcessingChicken.maxZ,
	}, {
		options = {
			{
				event = "knoes-chickenjob:proccessing",
				label = "Cut Chicken",
			},
		},
	   distance = 1.5
  })

exports['qb-target']:AddBoxZone("packing", PackingChicken.targetZone, 1.4, 1.4, {
	name="packing",
	heading = PackingChicken.heading,
	debugPoly = false,
	minZ = PackingChicken.minZ,
	maxZ = PackingChicken.maxZ,
	}, {
		options = {
			{
				event = "knoes-chickenjob:packing",
				icon = "fas fa-archive",
				label = "Pack Chicken ",
			},
		},
	   distance = 1.5
  })

exports['qb-target']:AddBoxZone("sell", SellChicken.targetZone, 1.4, 1.4, {
	name="sell",
	heading = SellChicken.heading,
	debugPoly = false,
	minZ = SellChicken.minZ,
	maxZ = SellChicken.maxZ,
	}, {
		options = {
			{
				type = "server",
				event = "knoes:sellItems",
				icon = "fas fa-dollar-sign",
				label = "Sell Chicken",
			},
		},
	   distance = 1.5
  })

exports['qb-target']:AddBoxZone("car", JobCar.targetZone, 1.4, 1.4, {
	name="car",
	heading = JobCar.heading,
	debugPoly = false,
	minZ = JobCar.minZ,
	maxZ = JobCar.maxZ,
	}, {
		options = {
			{
				event = "knoes:jobvehicle",
				icon = "fas fa-car",
				label = "Job Vehicle",
			},
		},
	   distance = 1.5
  })

-- ▄▄▄▄▄▄▄▄▄▄▄
--  Events
-- ▄▄▄▄▄▄▄▄▄▄▄

RegisterNetEvent('knoes-chickenjob:picking', function()
	QBCore.Functions.Progressbar('collect_chicken', Config.Locales['collect_chicken'], math.random(11000, 15000), false, true, {
	  disableMovement = true,
	  disableCarMovement = true,
	  disableMouse = false,
	  disableCombat = true,
	  }, {
	  animDict = 'mini@repair',
	  anim = 'fixing_a_player',
	  flags = 16,
	  }, {}, {}, function()
		  TriggerServerEvent('knoes:chickenpicking')
	  end, function()
	  QBCore.Functions.Notify(Config.Locales['cancel'], "error")
	end)
  end)


RegisterNetEvent('knoes-chickenjob:proccessing', function()
	local hasItem = QBCore.Functions.HasItem('alivechicken')
	if hasItem then
		QBCore.Functions.Progressbar('chicken_processing', Config.Locales['chicken_processing'], math.random(8500, 10000), false, true, {
			disableMovement = true,
			disableCarMovement = true,
			disableMouse = false,
			disableCombat = true,
			}, {
			animDict = 'mini@repair',
			anim = 'fixing_a_player',
			flags = 16,
			}, {}, {}, function()
				processchicken()
			end, function()
				QBCore.Functions.Notify(Config.Locales['cancel'], "error")
		end)
	else
		QBCore.Functions.Notify(Config.Locales['not_have_chicken'], "error")
	end
end)

RegisterNetEvent('knoes-chickenjob:packing', function()
	local hasItem = QBCore.Functions.HasItem('slaughteredchicken')
	if hasItem then
		QBCore.Functions.Progressbar('chicken_packet', Config.Locales['chicken_packet'], math.random(11000, 15000), false, true, {
			disableMovement = true,
			disableCarMovement = true,
			disableMouse = false,
			disableCombat = true,
			}, {
			animDict = 'mini@repair',
			anim = 'fixing_a_player',
			flags = 16,
			}, {}, {}, function()
				packedchicken()
			end, function()
				QBCore.Functions.Notify(Config.Locales['cancel'], "error")
		end)
	else
		QBCore.Functions.Notify(Config.Locales['not_have_cutchicken'], "error")
	end
end)

RegisterNetEvent('knoes:jobvehicle', function()
    local vehicle = {
      {
        header = Config.Locales["main_header"],
        isMenuHeader = true,
      },
      {
          header = Config.Locales["get_vehicle"],
          txt = Config.Locales["vehicle_model"],
          params = {
              event = 'knoes:jobvehicles',
            }
      },
      {
          header = Config.Locales["delete_car"],
          params = {
              event = 'knoes:removevehicle',
            }
      },
    }
	exports['qb-menu']:openMenu(vehicle)
end)


RegisterNetEvent('knoes:jobvehicles', function()
    local vehicle = JobCar.Vehicle
    local coords = JobCar.VehicleSpawn
    local knoes = PlayerPedId()
    RequestModel(vehicle)
    while not HasModelLoaded(vehicle) do Wait(0) end
    if not IsAnyVehicleNearPoint(coords.x, coords.y, coords.z, 5.0) then
        local JobVehicle = CreateVehicle(vehicle, coords, 45.0, true, false)
        SetVehicleHasBeenOwnedByPlayer(JobVehicle,  true)
        SetEntityAsMissionEntity(JobVehicle,  true,  true)
        exports[Config.Fuel]:SetFuel(JobVehicle, 100.0)
        local id = NetworkGetNetworkIdFromEntity(JobVehicle)
        DoScreenFadeOut(1500)
        Wait(1500)
        SetNetworkIdCanMigrate(id, true)
        TaskWarpPedIntoVehicle(knoes, JobVehicle, -1)
        TriggerEvent("vehiclekeys:client:SetOwner", QBCore.Functions.GetPlate(JobVehicle))
        DoScreenFadeIn(1500)
        Wait(2000)
        TriggerServerEvent('qb-phone:server:sendNewMail', {
            sender = Config.Locales["mail_sender"],
            subject = Config.Locales["mail_subject"],
            message = Config.Locales["phone_mail"],
            })
    else
        QBCore.Functions.Notify(Config.Locales["already_vehicle"], "error")
    end
end)

RegisterNetEvent('knoes:removevehicle', function()
    local kno = PlayerPedId()
    local vehicle = GetVehiclePedIsIn(kno,true)
    DeleteVehicle(vehicle)
    QBCore.Functions.Notify(Config.Locales["returned_vehicle"])
end)

-- ▄▄▄▄▄▄▄▄▄▄▄
--  Threads
-- ▄▄▄▄▄▄▄▄▄▄▄

CreateThread(function()
	for _,v in pairs(Config.Peds) do
		RequestModel(v.model)
		while not HasModelLoaded(v.model) do Wait(1) end
		v.handle = CreatePed(4, v.model, v.coords.x, v.coords.y, v.coords.z-1.0, v.heading, false, false)
		SetPedFleeAttributes(v.handle, 0, 0)
		SetPedDropsWeaponsWhenDead(v.handle, false)
		SetPedDiesWhenInjured(v.handle, false)
		SetEntityInvincible(v.handle , true)
		FreezeEntityPosition(v.handle, true)
		SetBlockingOfNonTemporaryEvents(v.handle, true)
		if v.anim.type == 1 then
			TaskStartScenarioInPlace(v.handle, v.anim.name, 0, true)
		elseif v.anim.type == 2 then
			RequestAnimDict(v.anim.dict)
			TaskPlayAnim(v.handle, v.anim.dict, v.anim.name, 8.0, 1, -1, 49, 0, false, false, false)
		end
	end
end)

if Config.EnableBlips then
	CreateThread(function()
		for _,v in pairs(Config.Locations) do
			local blip = AddBlipForCoord(v.coord)
			SetBlipSprite(blip, v.sprite)
			SetBlipScale(blip, v.scale)
			SetBlipColour(blip, v.color)
			SetBlipAsShortRange(blip, true)
			BeginTextCommandSetBlipName("STRING")
			AddTextComponentString(v.label)
			EndTextCommandSetBlipName(blip)
		end
	end)
end