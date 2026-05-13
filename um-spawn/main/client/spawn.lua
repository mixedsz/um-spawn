local function setPlayerPosition(coords)
    local ped = cache.ped
    SetEntityCoordsNoOffset(ped, coords.x, coords.y, coords.z)
    SetEntityHeading(ped, coords.w or coords.a or coords.h or GetEntityHeading(cache.ped))
    FreezeEntityPosition(ped, false)
    -- The spawn menu hides the ped; always make it visible when placing at spawn,
    -- regardless of which camera was active or whether it was already destroyed.
    SetEntityVisible(ped, true)
end

local function destroyCamera()
    DestroyStableCam(true)
    DestroyCoordsCam(true)
end

local function setPlace(data)
    if ForceDeadPedLastLocation() then return end

    local placeType = data.place
    if placeType == 'lastloc' then
        setPlayerPosition(GetLastLocation())
        DestroyStableCam(true)
    elseif placeType == 'coords' then
        setPlayerPosition(GetEntityCoords(cache.ped))
        DestroyCoordsCam(true)
    elseif placeType == 'properties' then
        TriggerEvent("qb-houses:client:LastLocationHouse", data.type)
        Debug('Houses: | Properties Name: ' .. data.type)
        Wait(1000)
        destroyCamera()
    elseif placeType == 'bookmarks' then
        setPlayerPosition(data.coords)
        destroyCamera()
    end
end

RegisterNUICallback('spawn', function(data, cb)
    CloseNui()
    DoScreenFadeOut(250)
    Wait(500)
    setPlace(data)
    Wait(2000)
    Debug('Location: ' .. data.place .. ' Spawned')
    um.hud(false)
    if data.place ~= 'properties' then
        MoveToPlayerFromSky() -- handles its own fade-in after sky camera is active
    else
        DoScreenFadeIn(1000)
    end
    UMPromiseGlobal:resolve(nil)
    cb(1 or 'ok')
end)

function ForceDeadPedLastLocation()
    if not um.main.forceDeadPedLastLocation then return false end

    local playerData = ESX.GetPlayerData()
    if not playerData then return false end

    if playerData.dead then
        setPlayerPosition(GetLastLocation())
        return true
    end

    return false
end
