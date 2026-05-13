Nui = false

RegisterNUICallback('spawnNUIReady', function(data, cb)
    Nui = true
    Debug('spawnNUIReady')
    cb(1 or 'ok')
end)

-- Sets the preview ped at the given coords and starts the orbiting camera around it
local function SetPedAtCoordsAndCreateCamera(ped, coords)
    local pos = vector3(coords.x, coords.y, coords.z)
    SetEntityCoordsNoOffset(ped, pos.x, pos.y, pos.z)
    SetEntityVisible(ped, um.main.ped.status, false)
    FreezeEntityPosition(ped, false)
    if um.main.ped.status then
        TaskWanderStandard(cache.ped, 100.0, 50)
    else
        FreezeEntityPosition(cache.ped, true)
    end
    RequestCollision(pos)
    CreateCamera(ped)
end

-- Places the local ped slightly above the given coords (hidden) and creates the stable camera
local function SetPedAtLastLocAndStableCam(coords)
    SetEntityCoordsNoOffset(cache.ped, coords.x, coords.y, coords.z + 3)
    FreezeEntityPosition(cache.ped, true)
    SetEntityVisible(cache.ped, false, false)
    RequestCollision(coords)
    StableCam(coords)
end

exports('UMSpawnStart', function(coords)
    G_LastLocation = coords

    local p = promise.new()
    UMPromiseGlobal = p

    DoScreenFadeOut(250)
    Wait(500)

    cache:set('ped', PlayerPedId())

    -- Wait until NUI is fully loaded
    if not Nui then
        repeat
            Debug('Nui Waiting..')
            Wait(1000)
        until Nui
    end

    local houses, bookmarks = GetProperties()

    local properties = {
        apartments    = false,
        houses        = houses,
        bookmarks     = bookmarks,
        apartmentStart = false,
    }

    local statusTable = {
        apartment = false,
        house     = um.main.property.houseStatus and properties.houses or false,
        bookmark  = um.main.bookmark.status and properties.bookmarks or false,
        map       = not um.main.onlyLastLocation,
    }

    TriggerServerEvent('um-spawn:server:setBucketPlayer')
    Wait(1000)

    SetPedAtLastLocAndStableCam(coords)
    Wait(1000)

    SetNui(true)

    local lastLoc     = GetLastLocation()
    local zone        = GetNameOfZone(lastLoc.x, lastLoc.y, lastLoc.z)
    local region      = GetLabelText(zone) or 'Unknown'
    local streetHash  = GetStreetNameAtCoord(lastLoc.x, lastLoc.y, lastLoc.z)
    local street      = GetStreetNameFromHashKey(streetHash) or 'Unknown'

    SendNUIMessage({
        ui = true,
        d  = {
            lang       = Lang.UI,
            coords     = um.coords,
            properties = properties,
            statusTable = statusTable,
            lastlocation = {
                region = region,
                street = street,
            },
            xmas = um.logo,
        }
    })

    Wait(100)
    DoScreenFadeIn(1500)
    SetTimeCustom(true)
    um.hud(true)

    return Citizen.Await(UMPromiseGlobal)
end)

-- Called when the player clicks a map/coord button in the NUI to preview that location
RegisterNUICallback('buttonClick', function(data, cb)
    SelectSound()
    local pos = vector3(data.x, data.y, data.z)
    DoScreenFadeOut(10)
    SetEntityCoordsNoOffset(cache.ped, pos.x, pos.y, pos.z)
    RequestCollision(data)
    Wait(50)
    DoScreenFadeIn(50)
    if um.main.ped.status then
        TaskWanderStandard(cache.ped, 100.0, 50)
    else
        FreezeEntityPosition(cache.ped, true)
    end
    cb(1 or 'ok')
end)

-- Switches between the stable (last-location) camera and the orbiting (coords) camera
RegisterNUICallback('lastLocationChange', function(data, cb)
    if data.bool then
        -- Switch from stable cam (last location) to orbiting cam at selected coords
        local coords = data.coords
        DoScreenFadeOut(10)
        DestroyStableCam()
        Wait(500)
        SetPedAtCoordsAndCreateCamera(cache.ped, coords)
        Wait(1000)
        DoScreenFadeIn(500)
    else
        -- Switch back from orbiting cam to stable cam at last location
        DoScreenFadeOut(10)
        DestroyCoordsCam()
        Wait(500)
        SetPedAtLastLocAndStableCam(GetLastLocation())
        DoScreenFadeIn(500)
    end
    cb(1 or 'ok')
end)
