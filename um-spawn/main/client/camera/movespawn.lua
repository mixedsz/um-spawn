local L0_1, L1_1, L2_1, L3_1, L4_1
L0_1 = um
L0_1 = L0_1.main
L0_1 = L0_1.spawn
L0_1 = L0_1.type
if not L0_1 then
  L0_1 = "playerFromSky"
end
L1_1 = um
L1_1 = L1_1.main
L1_1 = L1_1.spawn
L1_1 = L1_1.cutScene
if not L1_1 then
  L1_1 = false
end
function L2_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2
  L0_2 = "anim@scripted@heist@ig25_beach@male@"
  L1_2 = RequestAnimDict
  L2_2 = L0_2
  L1_2(L2_2)
  repeat
    L1_2 = Wait
    L2_2 = 0
    L1_2(L2_2)
    L1_2 = HasAnimDictLoaded
    L2_2 = L0_2
    L1_2 = L1_2(L2_2)
  until L1_2
  L1_2 = cache
  L1_2 = L1_2.ped
  L2_2 = GetEntityCoords
  L3_2 = L1_2
  L2_2 = L2_2(L3_2)
  L3_2 = GetEntityHeading
  L4_2 = L1_2
  L3_2 = L3_2(L4_2)
  L4_2 = NetworkCreateSynchronisedScene
  L5_2 = L2_2.x
  L6_2 = L2_2.y
  L7_2 = L2_2.z
  L7_2 = L7_2 - 1
  L8_2 = 0.0
  L9_2 = 0.0
  L10_2 = L3_2
  L11_2 = 2
  L12_2 = false
  L13_2 = false
  L14_2 = 8.0
  L15_2 = 2.0
  L16_2 = 1.0
  L4_2 = L4_2(L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2)
  L5_2 = NetworkAddPedToSynchronisedScene
  L6_2 = L1_2
  L7_2 = L4_2
  L8_2 = L0_2
  L9_2 = "action"
  L10_2 = 2.0
  L11_2 = 8.0
  L12_2 = 0
  L13_2 = 0
  L14_2 = 2.0
  L15_2 = 8192
  L5_2(L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2)
  L5_2 = NetworkAddSynchronisedSceneCamera
  L6_2 = L4_2
  L7_2 = L0_2
  L8_2 = "action_camera"
  L5_2(L6_2, L7_2, L8_2)
  L5_2 = NetworkStartSynchronisedScene
  L6_2 = L4_2
  L5_2(L6_2)
  L5_2 = Wait
  L6_2 = GetAnimDuration
  L7_2 = L0_2
  L8_2 = "action"
  L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2 = L6_2(L7_2, L8_2)
  L5_2(L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2)
end
function L3_1()
  local L0_2, L1_2, L2_2, L3_2
  L0_2 = FreezeEntityPosition
  L1_2 = cache
  L1_2 = L1_2.ped
  L2_2 = true
  L0_2(L1_2, L2_2)
  L0_2 = DoScreenFadeOut
  L1_2 = 0
  L0_2(L1_2)
  L0_2 = TriggerScreenblurFadeIn
  L1_2 = 10
  L0_2(L1_2)
  L0_2 = IsPlayerSwitchInProgress
  L0_2 = L0_2()
  if not L0_2 then
    L0_2 = SwitchOutPlayer
    L1_2 = cache
    L1_2 = L1_2.ped
    L2_2 = 0
    L3_2 = 1
    L0_2(L1_2, L2_2, L3_2)
  end
  while true do
    L0_2 = GetPlayerSwitchState
    L0_2 = L0_2()
    if 5 == L0_2 then
      break
    end
    L0_2 = Wait
    L1_2 = 0
    L0_2(L1_2)
  end
  L0_2 = DoScreenFadeIn
  L1_2 = 1000
  L0_2(L1_2)
  L0_2 = Wait
  L1_2 = 500
  L0_2(L1_2)
  L0_2 = L1_1
  if L0_2 then
    L0_2 = L2_1
    L0_2()
  end
  L0_2 = Wait
  L1_2 = 2000
  L0_2(L1_2)
  L0_2 = SwitchInPlayer
  L1_2 = cache
  L1_2 = L1_2.ped
  L0_2(L1_2)
  while true do
    L0_2 = GetPlayerSwitchState
    L0_2 = L0_2()
    if 12 == L0_2 then
      break
    end
    L0_2 = Wait
    L1_2 = 0
    L0_2(L1_2)
  end
  L0_2 = FreezeEntityPosition
  L1_2 = cache
  L1_2 = L1_2.ped
  L2_2 = false
  L0_2(L1_2, L2_2)
  L0_2 = TriggerScreenblurFadeOut
  L1_2 = 100
  L0_2(L1_2)
end
function L4_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2
  L0_2 = L0_1
  if "gtaVNative" == L0_2 then
    L0_2 = L3_1
    L0_2()
    return
  end
  L0_2 = FreezeEntityPosition
  L1_2 = cache
  L1_2 = L1_2.ped
  L2_2 = true
  L0_2(L1_2, L2_2)
  L0_2 = GetEntityCoords
  L1_2 = cache
  L1_2 = L1_2.ped
  L0_2 = L0_2(L1_2)
  L1_2 = CreateCam
  L2_2 = "DEFAULT_SCRIPTED_CAMERA"
  L3_2 = true
  L1_2 = L1_2(L2_2, L3_2)
  L2_2 = 2.0
  L3_2 = SetCamCoord
  L4_2 = L1_2
  L5_2 = L0_2.x
  L6_2 = L0_2.y
  L7_2 = L0_2.z
  L7_2 = L7_2 + 50.0
  L3_2(L4_2, L5_2, L6_2, L7_2)
  L3_2 = SetCamRot
  L4_2 = L1_2
  L5_2 = um
  L5_2 = L5_2.main
  L5_2 = L5_2.camera
  L5_2 = L5_2.skyspawnPos
  if not L5_2 then
    L5_2 = -20
  end
  L6_2 = 0.0
  L7_2 = 0.0
  L8_2 = 2
  L3_2(L4_2, L5_2, L6_2, L7_2, L8_2)
  L3_2 = SetCamActive
  L4_2 = L1_2
  L5_2 = true
  L3_2(L4_2, L5_2)
  L3_2 = RenderScriptCams
  L4_2 = true
  L5_2 = false
  L6_2 = 0
  L7_2 = true
  L8_2 = true
  L3_2(L4_2, L5_2, L6_2, L7_2, L8_2)
  L3_2 = GetGameTimer
  L3_2 = L3_2()
  L3_2 = L3_2 + 2000
  while true do
    L4_2 = GetGameTimer
    L4_2 = L4_2()
    if not (L3_2 > L4_2) then
      break
    end
    L4_2 = GetGameTimer
    L4_2 = L4_2()
    L4_2 = L3_2 - L4_2
    L5_2 = L4_2 / 1000
    L6_2 = 1.0
    L5_2 = L6_2 - L5_2
    L6_2 = 1
    L6_2 = L6_2 - L5_2
    L6_2 = L6_2 ^ 3
    L7_2 = 1
    L6_2 = L7_2 - L6_2
    L7_2 = L0_2.z
    L7_2 = L7_2 + L2_2
    L8_2 = 50.0
    L8_2 = L8_2 - L2_2
    L9_2 = 1.0
    L9_2 = L9_2 - L6_2
    L8_2 = L8_2 * L9_2
    L7_2 = L7_2 + L8_2
    L8_2 = SetCamCoord
    L9_2 = L1_2
    L10_2 = L0_2.x
    L11_2 = L0_2.y
    L12_2 = L7_2
    L8_2(L9_2, L10_2, L11_2, L12_2)
    L8_2 = Wait
    L9_2 = 0
    L8_2(L9_2)
  end
  L4_2 = RenderScriptCams
  L5_2 = false
  L6_2 = true
  L7_2 = 500
  L8_2 = true
  L9_2 = true
  L4_2(L5_2, L6_2, L7_2, L8_2, L9_2)
  L4_2 = DestroyCam
  L5_2 = L1_2
  L6_2 = false
  L4_2(L5_2, L6_2)
  L4_2 = FreezeEntityPosition
  L5_2 = cache
  L5_2 = L5_2.ped
  L6_2 = false
  L4_2(L5_2, L6_2)
  L4_2 = L1_1
  if L4_2 then
    L4_2 = L2_1
    L4_2()
  end
end
MoveToPlayerFromSky = L4_1
