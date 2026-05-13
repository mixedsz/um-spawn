UMPromiseGlobal = nil -- don't touch this

um = {}

um.debug = false

um.lang = 'en' -- tr,en,es,zh,fr,hi [or add locales > .lua]

-- If you want to show the logo, set it to true or hidden false
um.logo = {
    status = false,
    url = '',
}

um.main = {
    onlyLastLocation = false,        -- If you want to only last location set true.
    forceDeadPedLastLocation = true, -- If you want force injured ped last location set true.
    spawn = {
        type = 'playerFromSky',      -- playerFromSky (um), gtaVNative
        cutScene = false,            -- If you want to show the cutscene, set it to true.
    },
    camera = {
        radius = 2.0,      -- Camera distance from the character
        angle = 50,        -- Camera angle
        point = 0.1,       -- Camera point
        turning = true,    -- If you want to turn the camera, set it to true.
        skyspawnPos = -20, -- -100 vertical, -20 horizontal
    },
    ped = {
        status = false, -- If you want to show the character and walk in the spawn menu, set it to true.
    },
    property = {
        houseStatus = false, -- Todo: next update
    },
    bookmark = {
        status = false,   -- If you want to show the bookmark system, set it to true.
        money = {
            free = false, -- If you want to bookmark the free money, set it to true.
            amount = math.random(1000, 10000) or 500
        }
    },
}

--[[
   If your hud appears in spawn menu,
   this is nonsense, remember that hud is not shown without playerLoaded or LocalPlayer loaded,
   but that's ok, that's what this function was made for
--]]
um.hud = function(bool)
    if bool then
        -- Example: exports['myhud']:SetDisplay(false)
        --DisplayRadar(false)

        Debug('Hud is hidden', 'debug')
    else
        -- Example: exports['myhud']:SetDisplay(true)
        --DisplayRadar(true)

        Debug('Hud is show', 'debug')
    end
end


um.weather = {
    sync = true,   -- If you want to sync the weather, set it to true.
    sc = 'cd',  -- cd , vSync
    type = 'XMAS', -- https://docs.fivem.net/docs/game-references/weather-types/
    time = 23,     -- 0 - 23
}

um.coords = {
    -- ['motel'] = {
    --     coords = vector4(313.23, -236.72, 53.99, 68.11),
    --     street = 'Meteor St',
    --     text = 'Motel St'
    -- },
    -- ['hospital'] = {
    --     coords = vector4(286.42, -602.82, 43.19, 128.92),
    --     street = 'Elgin Ave Del Perro Fwy',
    --     text = 'Hospital Ave'
    -- },
    -- ['police'] = {
    --     coords = vector4(400.46, -979.54, 29.39, 270.35),
    --     street = 'Sinner St Atlee St',
    --     text = 'Police Station'
    -- },
    -- ['sandy'] = {
    --     coords = vector4(1421.33, 3601.24, 34.85, 297.93),
    --     street = 'Algonquin Blvd',
    --     text = 'Sandy Shore'
    -- },
    -- ['paleto'] = {
    --     coords = vector4(-131.32, 6390.86, 31.5, 34.13),
    --     street = 'Paleto Blvd',
    --     text = 'Paleto Bay'
    -- }


    ['legion_garage'] = {
    coords = vector4(211.4431, -812.5846, 30.7645, 0.0),
    street = 'Legion Main Garage',
    text = 'Main Garage'
},
['suburban'] = {
    coords = vector4(408.1850, -1016.9625, 29.3727, 0.0),
    street = 'Suburban',
    text = 'Suburban'
},
['pier'] = {
    coords = vector4(-1445.0836, -776.8078, 23.5680, 0.0),
    street = 'Pier',
    text = 'The Pier'
},
['police_garage'] = {
    coords = vector4(408.1850, -1016.9625, 29.3727, 0.0),
    street = 'Police Garage',
    text = 'Police Garage'
},
['thot_thots'] = {
    coords = vector4(245.6205, -1471.6584, 29.2528, 0.0),
    street = 'Thot Thots',
    text = 'Thot Thots'
},
['ems_garage'] = {
    coords = vector4(68.8778, -433.9857, 39.2469, 0.0),
    street = 'EMS Garage',
    text = 'EMS Garage'
},

}
