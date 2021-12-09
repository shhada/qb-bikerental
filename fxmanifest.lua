fx_version 'bodacious' -- if that doesn't work, try 'adamant'
game 'gta5'

description 'Night_bikes by nighmares, converted to QB Core + electric scooter from WiroWorks'
author 'shhada'

server_script 'server/main.lua'
client_script 'client/main.lua'
shared_script 'config.lua'

file '**/*.meta'

data_file 'HANDLING_FILE' 			'data/handling.meta'
data_file 'VEHICLE_METADATA_FILE' 	'data/vehicles.meta'
data_file 'VEHICLE_VARIATION_FILE' 	'data/carvariations.meta'

lua54 'yes'