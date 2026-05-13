local function setPlayerPosition(coords)
    local ped = cache.ped
    SetEntityCoordsNoOffset(ped, coords.x, coords.y, coords.z)
    SetEntityHeading(ped, coords.w or coords.a or coords.h or GetEntityHeading(cache.ped))
    FreezeEntityPosition(ped, false)
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
    DoScreenFadeIn(1000)
    um.hud(false)
    if data.place ~= 'properties' then MoveToPlayerFromSky() end
    UMPromiseGlobal:resolve(nil)
    cb(1 or 'ok')
end)

function ForceDeadPedLastLocation()
    if not um.main.forceDeadPedLastLocation then return false end

    local checkDead = ESX.GetPlayerData()?.dead

    if checkDead then
        setPlayerPosition(GetLastLocation())
        return true
    end

    return false
end
