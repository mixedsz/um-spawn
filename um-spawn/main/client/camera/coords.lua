local L0_1, L1_1, L2_1, L3_1, L4_1
L0_1 = nil
L1_1 = um
L1_1 = L1_1.main
L1_1 = L1_1.camera
L2_1 = L1_1.turning
if L2_1 then
  L2_1 = 0.1
  if L2_1 then
    goto lbl_13
  end
end
L2_1 = 0
::lbl_13::
function L3_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L3_2 = A0_2.x
  L4_2 = math
  L4_2 = L4_2.cos
  L5_2 = A2_2
  L4_2 = L4_2(L5_2)
  L4_2 = A1_2 * L4_2
  L3_2 = L3_2 + L4_2
  L4_2 = A0_2.y
  L5_2 = math
  L5_2 = L5_2.sin
  L6_2 = A2_2
  L5_2 = L5_2(L6_2)
  L5_2 = A1_2 * L5_2
  L4_2 = L4_2 + L5_2
  L5_2 = A0_2.z
  L6_2 = vector3
  L7_2 = L3_2
  L8_2 = L4_2
  L9_2 = L5_2
  return L6_2(L7_2, L8_2, L9_2)
end
function L4_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  L1_2 = L1_1.radius
  L2_2 = L1_1.angle
  L3_2 = CreateCam
  L4_2 = "DEFAULT_SCRIPTED_CAMERA"
  L5_2 = true
  L3_2 = L3_2(L4_2, L5_2)
  L0_1 = L3_2
  L3_2 = SetCamActive
  L4_2 = L0_1
  L5_2 = true
  L3_2(L4_2, L5_2)
  L3_2 = RenderScriptCams
  L4_2 = true
  L5_2 = false
  L6_2 = 1
  L7_2 = true
  L8_2 = true
  L3_2(L4_2, L5_2, L6_2, L7_2, L8_2)
  L3_2 = CamDof
  L4_2 = L0_1
  L3_2(L4_2)
  L3_2 = CreateThread
  function L4_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3
    while true do
      L0_3 = DoesCamExist
      L1_3 = L0_1
      L0_3 = L0_3(L1_3)
      if not L0_3 then
        break
      end
      L0_3 = GetEntityCoords
      L1_3 = A0_2
      L0_3 = L0_3(L1_3)
      L1_3 = L2_2
      L2_3 = L2_1
      L1_3 = L1_3 + L2_3
      L2_2 = L1_3
      L1_3 = L2_2
      L2_3 = 360
      if L1_3 >= L2_3 then
        L1_3 = 0
        L2_2 = L1_3
      end
      L1_3 = L3_1
      L2_3 = L0_3
      L3_3 = L1_2
      L4_3 = math
      L4_3 = L4_3.rad
      L5_3 = L2_2
      L4_3, L5_3, L6_3, L7_3 = L4_3(L5_3)
      L1_3 = L1_3(L2_3, L3_3, L4_3, L5_3, L6_3, L7_3)
      L2_3 = SetCamCoord
      L3_3 = L0_1
      L4_3 = L1_3.x
      L5_3 = L1_3.y
      L6_3 = L1_3.z
      L7_3 = L1_1.point
      L6_3 = L6_3 - L7_3
      L2_3(L3_3, L4_3, L5_3, L6_3)
      L2_3 = PointCamAtCoord
      L3_3 = L0_1
      L4_3 = L0_3.x
      L5_3 = L0_3.y
      L6_3 = L0_3.z
      L7_3 = L1_1.point
      L6_3 = L6_3 - L7_3
      L2_3(L3_3, L4_3, L5_3, L6_3)
      L2_3 = SetUseHiDof
      L2_3()
      L2_3 = Wait
      L3_3 = 0
      L2_3(L3_3)
    end
  end
  L3_2(L4_2)
  L3_2 = Debug
  L4_2 = "Coords Camera Created"
  L3_2(L4_2)
end
CreateCamera = L4_1
function L4_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2
  L1_2 = ShakeCam
  L2_2 = A0_2
  L3_2 = "JOLT_SHAKE "
  L4_2 = 1.0
  L1_2(L2_2, L3_2, L4_2)
  L1_2 = SetCamUseShallowDofMode
  L2_2 = A0_2
  L3_2 = true
  L1_2(L2_2, L3_2)
  L1_2 = SetCamNearDof
  L2_2 = A0_2
  L3_2 = 1.0
  L1_2(L2_2, L3_2)
  L1_2 = SetCamFarDof
  L2_2 = A0_2
  L3_2 = 7.0
  L1_2(L2_2, L3_2)
  L1_2 = SetCamDofStrength
  L2_2 = A0_2
  L3_2 = 1.0
  L1_2(L2_2, L3_2)
  L1_2 = SetCamUseShallowDofMode
  L2_2 = A0_2
  L3_2 = true
  L1_2(L2_2, L3_2)
  L1_2 = SetCamNearDof
  L2_2 = A0_2
  L3_2 = 1.0
  L1_2(L2_2, L3_2)
  L1_2 = SetCamFarDof
  L2_2 = A0_2
  L3_2 = 7.0
  L1_2(L2_2, L3_2)
  L1_2 = SetCamDofStrength
  L2_2 = A0_2
  L3_2 = 1.0
  L1_2(L2_2, L3_2)
end
CamDof = L4_1
function L4_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2
  L1_2 = DoesCamExist
  L2_2 = L0_1
  L1_2 = L1_2(L2_2)
  if L1_2 then
    if A0_2 then
      L1_2 = SetTimeCustom
      L2_2 = false
      L1_2(L2_2)
    end
    L1_2 = FreezeEntityPosition
    L2_2 = cache
    L2_2 = L2_2.ped
    L3_2 = false
    L1_2(L2_2, L3_2)
    L1_2 = RenderScriptCams
    L2_2 = false
    L3_2 = true
    L4_2 = 0
    L5_2 = true
    L6_2 = true
    L1_2(L2_2, L3_2, L4_2, L5_2, L6_2)
    L1_2 = SetCamActive
    L2_2 = L0_1
    L3_2 = false
    L1_2(L2_2, L3_2)
    L1_2 = DestroyCam
    L2_2 = L0_1
    L3_2 = true
    L1_2(L2_2, L3_2)
    L1_2 = SetEntityVisible
    L2_2 = cache
    L2_2 = L2_2.ped
    L3_2 = true
    L1_2(L2_2, L3_2)
    L1_2 = nil
    L0_1 = L1_2
    L1_2 = Debug
    L2_2 = "Destroyed Coords Cam"
    L1_2(L2_2)
  else
    L1_2 = Debug
    L2_2 = "Camera not found error this maybe?"
    L1_2(L2_2)
  end
end
DestroyCoordsCam = L4_1
