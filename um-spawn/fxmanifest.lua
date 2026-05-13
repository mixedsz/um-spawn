shared_script "@ReaperV4/imports/bypass.lua"
shared_script "@ReaperV4/imports/bypass_s.lua"
shared_script "@ReaperV4/imports/bypass_c.lua"
lua54 "yes" -- needed for Reaper

fx_version 'cerulean'
game 'gta5'
name "um-spawn"
author "uyuyorum {um}"
version "1.5.4-esx"
description 'A spawn menu beyond dreams'
shared_scripts {
    '@ox_lib/init.lua',
    'config.lua',
    'utils/*.lua',
    'bridge/**/**'
}
client_scripts {
    'locales/*.lua',
    'main/client/**'
}
server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'main/server/*.lua'
}
ui_page 'web/build/index.html'
files {
    'web/build/index.html',
    'web/build/**',
}
escrow_ignore {
    'config.lua',
    'locales/*.lua',
    'utils/*.lua',
    'bridge/**/**',
    'main/client/functions.lua',
    'main/client/spawn.lua',
    'main/client/bookmark.lua',
    'main/server/bookmark.lua'
}
lua54 'yes'
use_experimental_fxv2_oal 'yes'
dependency '/assetpacks'
