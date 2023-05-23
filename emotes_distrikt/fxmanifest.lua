
fx_version 'cerulean'
game 'gta5'
lua54 'yes' 

shared_script '@es_extended/imports.lua'

client_scripts {
    'Config.lua',
    'client.lua',
    'dpemoteskompat/AnimationList.lua',
    'dpemoteskompat/Emote.lua',
    'dpemoteskompat/Keybinds.lua',
}

ui_page {
    'ui/index.html',
}

files {
    'ui/index.html',
    'ui/css/*.css',
    'ui/css/*.css.map',
    'ui/css/*.scss',
    'ui/js/*.js',
    'ui/img/*.png',
    'ui/img/*.svg',
}
