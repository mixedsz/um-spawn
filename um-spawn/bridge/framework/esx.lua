if GetResourceState('es_extended') ~= 'started' then return print('CORE?') end

ESX = exports["es_extended"]:getSharedObject()

Debug('es_extended ready')

-- Server
if IsDuplicityVersion() then

    function GetPlayer(src)
        local attempts = 10
        local delay = 1000

        local player = ESX.GetPlayerFromId(src)
        while not player and attempts > 0 do
            Debug('Waiting for player data...')
            Wait(delay)
            player = ESX.GetPlayerFromId(src)
            attempts = attempts - 1
        end

        if not player then
            Debug('Failed to get player data after several attempts.')
            return nil
        end

        return player
    end

     function GetLicense(src)
        return GetPlayerIdentifierByType(src, 'license') or Debug('Failed to get License')
     end

end

G_LastLocation = nil
function GetLastLocation()
    return G_LastLocation or Debug('Failed to get last location')
end