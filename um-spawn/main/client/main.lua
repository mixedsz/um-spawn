local L0_1, L1_1, L2_1, L3_1, L4_1
Nui = false
L0_1 = RegisterNUICallback
L1_1 = "spawnNUIReady"
function L2_1(A0_2, A1_2)
  local L2_2, L3_2
  Nui = true
  L2_2 = Debug
  L3_2 = "spawnNUIReady"
  L2_2(L3_2)
  L2_2 = A1_2
  L3_2 = 1
  if not L3_2 then
    L3_2 = "ok"
  end
  L2_2(L3_2)
end
L0_1(L1_1, L2_1)
function L0_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  L2_2 = vector3
  L3_2 = A1_2.x
  L4_2 = A1_2.y
  L5_2 = A1_2.z
  L2_2 = L2_2(L3_2, L4_2, L5_2)
  L3_2 = SetEntityCoordsNoOffset
  L4_2 = A0_2
  L5_2 = L2_2.x
  L6_2 = L2_2.y
  L7_2 = L2_2.z
  L3_2(L4_2, L5_2, L6_2, L7_2)
  L3_2 = SetEntityVisible
  L4_2 = A0_2
  L5_2 = um
  L5_2 = L5_2.main
  L5_2 = L5_2.ped
  L5_2 = L5_2.status
  L6_2 = false
  L3_2(L4_2, L5_2, L6_2)
  L3_2 = FreezeEntityPosition
  L4_2 = A0_2
  L5_2 = false
  L3_2(L4_2, L5_2)
  L3_2 = um
  L3_2 = L3_2.main
  L3_2 = L3_2.ped
  L3_2 = L3_2.status
  if L3_2 then
    L3_2 = TaskWanderStandard
    L4_2 = cache
    L4_2 = L4_2.ped
    L5_2 = 100.0
    L6_2 = 50
    L3_2(L4_2, L5_2, L6_2)
  else
    L3_2 = FreezeEntityPosition
    L4_2 = cache
    L4_2 = L4_2.ped
    L5_2 = true
    L3_2(L4_2, L5_2)
  end
  L3_2 = RequestCollision
  L4_2 = L2_2
  L3_2(L4_2)
  L3_2 = CreateCamera
  L4_2 = A0_2
  L3_2(L4_2)
end
function L1_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2
  L1_2 = SetEntityCoordsNoOffset
  L2_2 = cache
  L2_2 = L2_2.ped
  L3_2 = A0_2.x
  L4_2 = A0_2.y
  L5_2 = A0_2.z
  L5_2 = L5_2 + 3
  L1_2(L2_2, L3_2, L4_2, L5_2)
  L1_2 = FreezeEntityPosition
  L2_2 = cache
  L2_2 = L2_2.ped
  L3_2 = true
  L1_2(L2_2, L3_2)
  L1_2 = SetEntityVisible
  L2_2 = cache
  L2_2 = L2_2.ped
  L3_2 = false
  L4_2 = false
  L1_2(L2_2, L3_2, L4_2)
  L1_2 = RequestCollision
  L2_2 = A0_2
  L1_2(L2_2)
  L1_2 = StableCam
  L2_2 = A0_2
  L1_2(L2_2)
end
L2_1 = exports
L3_1 = "UMSpawnStart"
function L4_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2
  G_LastLocation = A0_2
  L1_2 = promise
  L1_2 = L1_2.new
  L1_2 = L1_2()
  UMPromiseGlobal = L1_2
  L1_2 = DoScreenFadeOut
  L2_2 = 250
  L1_2(L2_2)
  L1_2 = Wait
  L2_2 = 500
  L1_2(L2_2)
  L1_2 = cache
  L2_2 = L1_2
  L1_2 = L1_2.set
  L3_2 = "ped"
  L4_2 = PlayerPedId
  L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2 = L4_2()
  L1_2(L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2)
  L1_2 = Nui
  if not L1_2 then
    repeat
      L1_2 = Debug
      L2_2 = "Nui Waiting.."
      L1_2(L2_2)
      L1_2 = Wait
      L2_2 = 1000
      L1_2(L2_2)
      L1_2 = Nui
    until L1_2
  end
  L1_2 = GetProperties
  L1_2, L2_2 = L1_2()
  L3_2 = {}
  L3_2.apartments = false
  L3_2.houses = L1_2
  L3_2.bookmarks = L2_2
  L3_2.apartmentStart = false
  L4_2 = {}
  L4_2.apartment = false
  L5_2 = um
  L5_2 = L5_2.main
  L5_2 = L5_2.property
  L5_2 = L5_2.houseStatus
  if L5_2 then
    L5_2 = L3_2.houses
  end
  L4_2.house = L5_2
  L5_2 = um
  L5_2 = L5_2.main
  L5_2 = L5_2.bookmark
  L5_2 = L5_2.status
  if L5_2 then
    L5_2 = L3_2.bookmarks
  end
  L4_2.bookmark = L5_2
  L5_2 = um
  L5_2 = L5_2.main
  L5_2 = L5_2.onlyLastLocation
  L5_2 = not L5_2
  L4_2.map = L5_2
  L5_2 = TriggerServerEvent
  L6_2 = "um-spawn:server:setBucketPlayer"
  L5_2(L6_2)
  L5_2 = Wait
  L6_2 = 1000
  L5_2(L6_2)
  L5_2 = L1_1
  L6_2 = A0_2
  L5_2(L6_2)
  L5_2 = Wait
  L6_2 = 1000
  L5_2(L6_2)
  L5_2 = SetNui
  L6_2 = true
  L5_2(L6_2)
  L5_2 = GetLastLocation
  L5_2 = L5_2()
  L6_2 = SendNUIMessage
  L7_2 = {}
  L7_2.ui = true
  L8_2 = {}
  L9_2 = Lang
  L9_2 = L9_2.UI
  L8_2.lang = L9_2
  L9_2 = um
  L9_2 = L9_2.coords
  L8_2.coords = L9_2
  L8_2.properties = L3_2
  L8_2.statusTable = L4_2
  L9_2 = {}
  L10_2 = GetLabelText
  L11_2 = GetNameOfZone
  L12_2 = L5_2.x
  L13_2 = L5_2.y
  L14_2 = L5_2.z
  L11_2, L12_2, L13_2, L14_2 = L11_2(L12_2, L13_2, L14_2)
  L10_2 = L10_2(L11_2, L12_2, L13_2, L14_2)
  if not L10_2 then
    L10_2 = "Unknown"
  end
  L9_2.region = L10_2
  L10_2 = GetStreetNameFromHashKey
  L11_2 = GetStreetNameAtCoord
  L12_2 = L5_2.x
  L13_2 = L5_2.y
  L14_2 = L5_2.z
  L11_2, L12_2, L13_2, L14_2 = L11_2(L12_2, L13_2, L14_2)
  L10_2 = L10_2(L11_2, L12_2, L13_2, L14_2)
  if not L10_2 then
    L10_2 = "Unknown"
  end
  L9_2.street = L10_2
  L8_2.lastlocation = L9_2
  L9_2 = um
  L9_2 = L9_2.logo
  L8_2.xmas = L9_2
  L7_2.d = L8_2
  L6_2(L7_2)
  L6_2 = Wait
  L7_2 = 100
  L6_2(L7_2)
  L6_2 = DoScreenFadeIn
  L7_2 = 1500
  L6_2(L7_2)
  L6_2 = SetTimeCustom
  L7_2 = true
  L6_2(L7_2)
  L6_2 = um
  L6_2 = L6_2.hud
  L7_2 = true
  L6_2(L7_2)
  L6_2 = Citizen
  L6_2 = L6_2.Await
  L7_2 = UMPromiseGlobal
  return L6_2(L7_2)
end
L2_1(L3_1, L4_1)
L2_1 = RegisterNUICallback
L3_1 = "buttonClick"
function L4_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  L2_2 = SelectSound
  L2_2()
  L2_2 = vector3
  L3_2 = A0_2.x
  L4_2 = A0_2.y
  L5_2 = A0_2.z
  L2_2 = L2_2(L3_2, L4_2, L5_2)
  L3_2 = DoScreenFadeOut
  L4_2 = 10
  L3_2(L4_2)
  L3_2 = SetEntityCoordsNoOffset
  L4_2 = cache
  L4_2 = L4_2.ped
  L5_2 = L2_2.x
  L6_2 = L2_2.y
  L7_2 = L2_2.z
  L3_2(L4_2, L5_2, L6_2, L7_2)
  L3_2 = RequestCollision
  L4_2 = A0_2
  L3_2(L4_2)
  L3_2 = Wait
  L4_2 = 50
  L3_2(L4_2)
  L3_2 = DoScreenFadeIn
  L4_2 = 50
  L3_2(L4_2)
  L3_2 = um
  L3_2 = L3_2.main
  L3_2 = L3_2.ped
  L3_2 = L3_2.status
  if L3_2 then
    L3_2 = TaskWanderStandard
    L4_2 = cache
    L4_2 = L4_2.ped
    L5_2 = 100.0
    L6_2 = 50
    L3_2(L4_2, L5_2, L6_2)
  else
    L3_2 = FreezeEntityPosition
    L4_2 = cache
    L4_2 = L4_2.ped
    L5_2 = true
    L3_2(L4_2, L5_2)
  end
  L3_2 = A1_2
  L4_2 = 1
  if not L4_2 then
    L4_2 = "ok"
  end
  L3_2(L4_2)
end
L2_1(L3_1, L4_1)
L2_1 = RegisterNUICallback
L3_1 = "lastLocationChange"
function L4_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2
  L2_2 = A0_2.bool
  if L2_2 then
    L2_2 = A0_2.coords
    L3_2 = DoScreenFadeOut
    L4_2 = 10
    L3_2(L4_2)
    L3_2 = DestroyStableCam
    L3_2()
    L3_2 = Wait
    L4_2 = 500
    L3_2(L4_2)
    L3_2 = L0_1
    L4_2 = cache
    L4_2 = L4_2.ped
    L5_2 = L2_2
    L3_2(L4_2, L5_2)
    L3_2 = Wait
    L4_2 = 1000
    L3_2(L4_2)
    L3_2 = DoScreenFadeIn
    L4_2 = 500
    L3_2(L4_2)
  else
    L2_2 = DoScreenFadeOut
    L3_2 = 10
    L2_2(L3_2)
    L2_2 = DestroyCoordsCam
    L2_2()
    L2_2 = Wait
    L3_2 = 500
    L2_2(L3_2)
    L2_2 = L1_1
    L3_2 = GetLastLocation
    L3_2, L4_2, L5_2 = L3_2()
    L2_2(L3_2, L4_2, L5_2)
    L2_2 = DoScreenFadeIn
    L3_2 = 500
    L2_2(L3_2)
  end
  L2_2 = A1_2
  L3_2 = 1
  if not L3_2 then
    L3_2 = "ok"
  end
  L2_2(L3_2)
end
L2_1(L3_1, L4_1)
