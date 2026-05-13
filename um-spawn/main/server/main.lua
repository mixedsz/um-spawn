-- Routing bucket used to isolate players during the spawn screen so they
-- cannot see or interact with the live world until they have chosen a spawn point.
local SPAWN_BUCKET = 1

-- Move the player into the isolated spawn bucket
RegisterNetEvent('um-spawn:server:setBucketPlayer', function()
    local src = source
    SetPlayerRoutingBucket(src, SPAWN_BUCKET)
    Debug('setBucketPlayer: player ' .. src .. ' -> bucket ' .. SPAWN_BUCKET)
end)

-- Return the player to the default shared bucket (0)
RegisterNetEvent('um-spawn:server:setBucketDefault', function()
    local src = source
    SetPlayerRoutingBucket(src, 0)
    Debug('setBucketDefault: player ' .. src .. ' -> bucket 0')
end)

-- Lets the client confirm which bucket it is currently in before proceeding
lib.callback.register('um-spawn:server:getBucket', function(src)
    return GetPlayerRoutingBucket(src)
end)
