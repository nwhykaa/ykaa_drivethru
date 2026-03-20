fx_version 'cerulean'
game 'gta5'

author 'ykaa'
description 'Advanced Script For Drive Thru'
version '1.0.0'

lua54 'yes'

shared_scripts {
    '@ox_lib/init.lua',
    'config.lua',
}

server_scripts {
    'server/server.lua',
}

client_scripts {
    'client/client.lua',
}

dependencies {
    'ox_lib',
    'ox_inventory',
    'ox_target'
}