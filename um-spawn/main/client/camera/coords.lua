local coordsCam = nil

local cameraConfig = um.main.camera
-- Increment angle per frame when turning is enabled
local turnSpeed = cameraConfig.turning and 0.1 or 0

-- Calculates a point on a circle around `center` at the given `radius` and `angle` (radians)
local function OrbitPoint(center, radius, angle)
    local x = center.x + radius * math.cos(angle)
    local y = center.y + radius * math.sin(angle)
    return vector3(x, y, center.z)
end

-- Creates a rotating camera that orbits around the given ped entity
function CreateCamera(ped)
    local radius = cameraConfig.radius
    local angle  = cameraConfig.angle

    coordsCam = CreateCam('DEFAULT_SCRIPTED_CAMERA', true)
    SetCamActive(coordsCam, true)
    RenderScriptCams(true, false, 1, true, true)
    CamDof(coordsCam)

    CreateThread(function()
        while true do
            if not DoesCamExist(coordsCam) then break end

            local entityCoords = GetEntityCoords(ped)

            angle = angle + turnSpeed
            if angle >= 360 then angle = 0 end

            local camPos = OrbitPoint(entityCoords, radius, math.rad(angle))

            SetCamCoord(coordsCam, camPos.x, camPos.y, camPos.z - cameraConfig.point)
            PointCamAtCoord(coordsCam, entityCoords.x, entityCoords.y, entityCoords.z - cameraConfig.point)
            SetUseHiDof()
            Wait(0)
        end
    end)

    Debug('Coords Camera Created')
end

-- Applies depth-of-field and a subtle shake to the given camera handle
function CamDof(cam)
    ShakeCam(cam, 'JOLT_SHAKE ', 1.0)
    SetCamUseShallowDofMode(cam, true)
    SetCamNearDof(cam, 1.0)
    SetCamFarDof(cam, 7.0)
    SetCamDofStrength(cam, 1.0)
    SetCamUseShallowDofMode(cam, true)
    SetCamNearDof(cam, 1.0)
    SetCamFarDof(cam, 7.0)
    SetCamDofStrength(cam, 1.0)
end
CamDof = CamDof

-- Destroys the orbiting camera and restores normal rendering.
-- Pass true to also stop the custom time/weather loop.
function DestroyCoordsCam(stopTime)
    if DoesCamExist(coordsCam) then
        if stopTime then
            SetTimeCustom(false)
        end
        FreezeEntityPosition(cache.ped, false)
        RenderScriptCams(false, true, 0, true, true)
        SetCamActive(coordsCam, false)
        DestroyCam(coordsCam, true)
        SetEntityVisible(cache.ped, true)
        coordsCam = nil
        Debug('Destroyed Coords Cam')
    else
        Debug('Camera not found error this maybe?')
    end
end
