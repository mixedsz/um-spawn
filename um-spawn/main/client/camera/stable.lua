local stableCam = nil

-- Creates (or updates) a static camera aimed at the given coords.
-- coords must have x, y, z and either w or a for the heading.
function StableCam(coords)
    local heading = coords.w or coords.a

    -- If the camera already exists, just reposition it
    if DoesCamExist(stableCam) then
        SetCamCoord(stableCam, coords.x, coords.y, coords.z)
        SetCamRot(stableCam, 0, 0, heading, 2)
        Debug('Updated Stable Cam')
        return
    end

    -- Slight y offset so the camera frames the ped from just behind/above
    stableCam = CreateCamWithParams(
        'DEFAULT_SCRIPTED_CAMERA',
        coords.x,
        coords.y - 0.3,
        coords.z + 1.1,
        0.0, 5.0, heading,
        30.0, false, 0
    )

    SetCamActive(stableCam, true)
    RenderScriptCams(true, false, 1, true, true)
    CamDof(stableCam)
    Debug('Created Stable Cam')

    CreateThread(function()
        while true do
            if not DoesCamExist(stableCam) then break end
            SetUseHiDof()
            Wait(0)
        end
    end)
end

-- Destroys the stable camera and restores normal rendering.
-- Pass true to also stop the custom time/weather loop.
function DestroyStableCam(stopTime)
    if DoesCamExist(stableCam) then
        if stopTime then
            SetTimeCustom(false)
        end
        FreezeEntityPosition(cache.ped, false)
        RenderScriptCams(false, true, 0, true, true)
        SetCamActive(stableCam, false)
        DestroyCam(stableCam, true)
        SetEntityVisible(cache.ped, true)
        stableCam = nil
        Debug('Destroyed Stable Cam')
    else
        Debug('Camera not found error this maybe?')
    end
end
