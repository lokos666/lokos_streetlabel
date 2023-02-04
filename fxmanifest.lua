fx_version 'adamant'
game 'gta5'

author 'Lokos'
description 'lokos_streetlabel'

lua54 'yes'

dependency 'ox_lib'

shared_script '@ox_lib/init.lua'

client_scripts {
    'client/*.lua'
}

files {
    'html/**'
}

ui_page 'html/ui.html'

export 'setIsStreetLabelEnabled'