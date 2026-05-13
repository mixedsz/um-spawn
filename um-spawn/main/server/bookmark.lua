-- Returns the player's current cash balance so the client can verify they can
-- afford to create a bookmark before showing the confirmation dialog.
lib.callback.register('um-spawn:server:bookmark:getMoney', function(src)
    local player = GetPlayer(src)
    if not player then return 0 end
    return player.getMoney()
end)

-- Deducts the bookmark fee (when configured) and persists the new bookmark.
-- `input`       – { [1] = name, [2] = imageURL }
-- `moneyAmount` – fee to deduct, or false when bookmarks are free
-- `location`    – { x, y, z, h } table of the saved position
RegisterNetEvent('um-spawn:server:bookmark:addBookmark', function(input, moneyAmount, location)
    local src     = source
    local player  = GetPlayer(src)
    if not player then return end

    local license = GetLicense(src)
    local name    = input[1]
    local image   = input[2]

    if moneyAmount and moneyAmount > 0 then
        player.removeMoney(moneyAmount)
    end

    MySQL.insert(
        'INSERT INTO `spawnbookmarks` (`license`, `name`, `image`, `location`) VALUES (?, ?, ?, ?)',
        { license, name, image, json.encode(location) }
    )

    Debug('addBookmark: ' .. name .. ' for ' .. license)
end)

-- Removes one of the player's bookmarks by name.
RegisterNetEvent('um-spawn:server:bookmark:deleteBookmark', function(name)
    local src     = source
    local license = GetLicense(src)

    MySQL.update(
        'DELETE FROM `spawnbookmarks` WHERE `license` = ? AND `name` = ?',
        { license, name }
    )

    Debug('deleteBookmark: ' .. name .. ' for ' .. license)
end)

-- Fetches all bookmarks belonging to the calling player.
lib.callback.register('getBookmarks', function(src)
    local license = GetLicense(src)
    local rows    = MySQL.query.await(
        'SELECT `name`, `image`, `location` FROM `spawnbookmarks` WHERE `license` = ?',
        { license }
    )

    if not rows or #rows == 0 then return false end

    local bookmarks = {}
    for _, row in ipairs(rows) do
        bookmarks[#bookmarks + 1] = {
            name     = row.name,
            image    = row.image,
            location = json.decode(row.location),
        }
    end

    return bookmarks
end)
