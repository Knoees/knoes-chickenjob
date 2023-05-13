Config = {}


Config.Fuel = 'cc-fuel'
Config.EnableBlips = true

-- ▄▄▄▄▄▄▄▄▄▄▄
--  Sell items
-- ▄▄▄▄▄▄▄▄▄▄▄

Config.Sell = {
    ["slaughteredchicken"] = {
        ["price"] = math.random(50, 75)                             -- Seller Price
    },
    ["packagedchicken"] = {
        ["price"] = math.random(30, 40)
    },
    ["alivechicken"] = {
        ["price"] = math.random(150, 200)
    },
}

-- ▄▄▄▄▄▄▄▄▄▄▄
--  Settings
-- ▄▄▄▄▄▄▄▄▄▄▄


Config.PickingMaxChicken = 5
Config.PickingMinChicken = 1
Config.CutChicken = 5
Config.PacketChicken = 1



-- ▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄
--  Target Coords
-- ▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄

CollectChicken = {
    targetZone = vector3(-68.24, 6248.27, 31.09),
    targetHeading = 36.74,
    minZ = 30.05,
    maxZ = 32.00,
}

ProcessingChicken = {
    targetZone = vector3(-95.66, 6207.11, 31.03),
    targetHeading = 315.44,
    minZ = 30.05,
    maxZ = 32.00,
}

PackingChicken = {
    targetZone = vector3(-104.0, 6206.81, 31.03),
    targetHeading = 47.39,
    minZ = 30.05,
    maxZ = 32.00,
}

SellChicken = {
    targetZone = vector3(1677.47, 4882.56, 42.04),
    targetHeading = 61.58,
    minZ = 41.05,
    maxZ = 43.00,
}

JobCar = { 
    targetZone = vector3(-136.4, 6198.49, 32.38),
    targetHeading = 46.27,
    minZ = 31.05,
    maxZ = 33.00,
    Vehicle = 'bison',                                          
    VehicleSpawn = vector4(-141.7, 6203.33, 31.25, 317.32), 
}

-- ▄▄▄▄▄▄▄▄▄▄▄
--  Locales
-- ▄▄▄▄▄▄▄▄▄▄▄

Config.Locales = {
	['collect_chicken'] = 'Picking Alive Chicken',
	['chicken_processing'] = 'Portion the Chicken..',
	['chicken_packet'] = 'Packing the Chicken..',
    ['sell_chicken'] = 'You sold packaged chicken',
    ['cancel'] = 'Cancel',
    ['cut_chicken'] = 'You Cut Chickens',
    ['not_have_chicken'] = 'You dont have any chickens',
    ['not_have_cutchicken'] = 'You dont have any cut chickens',
    ['packing_chicken'] = 'You packed the chickens',
    ['mail_sender'] = 'Chicken Factory',
    ['mail_subject'] = 'Job',
    ['phone_mail'] = 'You bought a vehicle from the factory, bring it back when youre done',
    ['main_header'] = 'Job Vehicle',
    ['get_vehicle'] = 'Get Vehicle',
    ['vehicle_model'] = 'Car: Bison',
    ['delete_car'] = 'Return the Car',
    ['already_vehicle'] = 'Theres already a vehicle outside',
    ['returned_vehicle'] = 'You returned the vehicle',
}


-- ▄▄▄▄▄▄▄▄▄▄▄
--  Blips
-- ▄▄▄▄▄▄▄▄▄▄▄


Config.Locations = {
    [1] = {label = "Chicken Factory", coord = vector3(-71.39, 6264.21, 31.21), color = 5, sprite = 478, scale = 0.6},
    [2] = {label = "Chicken Sales", coord = vector3(1677.47, 4882.56, 42.04), color = 2, sprite = 605, scale = 0.7},
    [3] = {label = "Chicken Factory Manager", coord = vector3(-136.4, 6198.49, 32.38), color = 0, sprite = 480, scale = 0.7},

}

-- ▄▄▄▄▄▄▄▄▄▄▄
--  Peds
-- ▄▄▄▄▄▄▄▄▄▄▄


Config.Peds = {
	[1] = { handle = nil, model ="a_m_m_fatlatin_01", coords = vector3(1677.47, 4882.56, 42.04), heading = 61.58,  anim = { type = 1, name = "CODE_HUMAN_CROSS_ROAD_WAIT"} }, -- scene
    [2] = { handle = nil, model ="a_m_y_busicas_01", coords = vector3(-136.4, 6198.49, 32.38), heading = 46.27,  anim = { type = 1, name = "WORLD_HUMAN_CLIPBOARD"} }, -- scene
}

	

