local spawnType = um.main.spawn.type or 'playerFromSky'
local cutScene  = um.main.spawn.cutScene or false

-- Plays a beach-heist cutscene animation on the local ped via a synced network scene
local function PlayCutScene()
    local animDict = 'anim@scripted@heist@ig25_beach@male@'

    RequestAnimDict(animDict)
    repeat
        Wait(0)
    until HasAnimDictLoaded(animDict)

    local ped     = cache.ped
    local coords  = GetEntityCoords(ped)
    local heading = GetEntityHeading(ped)

    local scene = NetworkCreateSynchronisedScene(
        coords.x, coords.y, coords.z - 1,
        0.0, 0.0, heading,
        2, false, false,
        8.0, 2.0, 1.0
    )

    NetworkAddPedToSynchronisedScene(ped, scene, animDict, 'action', 2.0, 8.0, 0, 0, 2.0, 8192)
    NetworkAddSynchronisedSceneCamera(scene, animDict, 'action_camera')
    NetworkStartSynchronisedScene(scene)

    -- Wait for the animation to finish (GetAnimDuration returns seconds)
    Wait(GetAnimDuration(animDict, 'action'))
end

-- Uses the GTA V native player-switch effect to transition into the game world
local function SpawnGTAVNative()
    FreezeEntityPosition(cache.ped, true)
    DoScreenFadeOut(0)
    TriggerScreenblurFadeIn(10)

    if not IsPlayerSwitchInProgress() then
        SwitchOutPlayer(cache.ped, 0, 1)
    end

    -- Wait until the switch is in the "ready" state
    while true do
        if GetPlayerSwitchState() == 5 then break end
        Wait(0)
    end

    DoScreenFadeIn(1000)
    Wait(500)

    if cutScene then PlayCutScene() end

    Wait(2000)
    SwitchInPlayer(cache.ped)

    -- Wait until the switch fully completes
    while true do
        if GetPlayerSwitchState() == 12 then break end
        Wait(0)
    end

    FreezeEntityPosition(cache.ped, false)
    TriggerScreenblurFadeOut(100)
end

-- Animates a camera falling from the sky down to the player then hands control back.
-- Used for the 'playerFromSky' spawn type (default).
function MoveToPlayerFromSky()
    if spawnType == 'gtaVNative' then
        SpawnGTAVNative()
        return
    end

    FreezeEntityPosition(cache.ped, true)

    local pedCoords   = GetEntityCoords(cache.ped)
    local groundOffset = 2.0  -- keep camera this many units above the ped at the end

    local skyCam = CreateCam('DEFAULT_SCRIPTED_CAMERA', true)

    -- Start with the camera directly above the ped
    SetCamCoord(skyCam, pedCoords.x, pedCoords.y, pedCoords.z + 50.0)
    SetCamRot(skyCam, um.main.camera.skyspawnPos or -20, 0.0, 0.0, 2)
    SetCamActive(skyCam, true)
    RenderScriptCams(true, false, 0, true, true)
    -- Screen was kept dark until now; fade in while the camera is already pointing
    -- at the sky so the player is never seen at ground level before the animation.
    DoScreenFadeIn(1000)

    -- Animate the camera descending from the sky using a cubic ease-out over 2 seconds.
    -- The function intentionally starts from a very high altitude so the player appears
    -- to fall through the clouds before the camera settles near ground level.
    local endTime = GetGameTimer() + 2000
    while true do
        local now = GetGameTimer()
        if endTime <= now then break end

        local remaining  = endTime - now            -- ms left  (2000 → 0)
        local t          = 1.0 - (remaining / 1000) -- normalised progress (-1 → 1)
        local ease       = 1 - (1 - t) ^ 3         -- cubic ease-out  (-7 → 1)

        local camZ = (pedCoords.z + groundOffset) + (50.0 - groundOffset) * (1.0 - ease)
        SetCamCoord(skyCam, pedCoords.x, pedCoords.y, camZ)
        Wait(0)
    end

    RenderScriptCams(false, true, 500, true, true)
    DestroyCam(skyCam, false)
    FreezeEntityPosition(cache.ped, false)

    if cutScene then PlayCutScene() end
end
