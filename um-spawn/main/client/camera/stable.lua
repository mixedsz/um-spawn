local L0_1, L1_1
L0_1 = nil
function L1_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
  L1_2 = DoesCamExist
  L2_2 = L0_1
  L1_2 = L1_2(L2_2)
  if L1_2 then
    L1_2 = SetCamCoord
    L2_2 = L0_1
    L3_2 = A0_2.x
    L4_2 = A0_2.y
    L5_2 = A0_2.z
    L1_2(L2_2, L3_2, L4_2, L5_2)
    L1_2 = SetCamRot
    L2_2 = L0_1
    L3_2 = 0
    L4_2 = 0
    L5_2 = A0_2.w
    if not L5_2 then
      L5_2 = A0_2.a
    end
    L6_2 = 2
    L1_2(L2_2, L3_2, L4_2, L5_2, L6_2)
    L1_2 = Debug
    L2_2 = "Updated Stable Cam"
    L1_2(L2_2)
    return
  end
  L1_2 = CreateCamWithParams
  L2_2 = "DEFAULT_SCRIPTED_CAMERA"
  L3_2 = A0_2.x
  L4_2 = A0_2.y
  L4_2 = L4_2 - 0.3
  L5_2 = A0_2.z
  L5_2 = L5_2 + 1.1
  L6_2 = 0.0
  L7_2 = 5.0
  L8_2 = A0_2.w
  if not L8_2 then
    L8_2 = A0_2.a
  end
  L9_2 = 30.0
  L10_2 = false
  L11_2 = 0
  L1_2 = L1_2(L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2)
  L0_1 = L1_2
  L1_2 = SetCamActive
  L2_2 = L0_1
  L3_2 = true
  L1_2(L2_2, L3_2)
  L1_2 = RenderScriptCams
  L2_2 = true
  L3_2 = false
  L4_2 = 1
  L5_2 = true
  L6_2 = true
  L1_2(L2_2, L3_2, L4_2, L5_2, L6_2)
  L1_2 = CamDof
  L2_2 = L0_1
  L1_2(L2_2)
  L1_2 = Debug
  L2_2 = "Created Stable Cam"
  L1_2(L2_2)
  L1_2 = CreateThread
  function L2_2()
    local L0_3, L1_3
    while true do
      L0_3 = DoesCamExist
      L1_3 = L0_1
      L0_3 = L0_3(L1_3)
      if not L0_3 then
        break
      end
      L0_3 = SetUseHiDof
      L0_3()
      L0_3 = Wait
      L1_3 = 0
      L0_3(L1_3)
    end
  end
  L1_2(L2_2)
end
StableCam = L1_1
function L1_1(A0_2)
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
    L2_2 = "Destroyed Stable Cam"
    L1_2(L2_2)
  else
    L1_2 = Debug
    L2_2 = "Camera not found error this maybe?"
    L1_2(L2_2)
  end
end
DestroyStableCam = L1_1
