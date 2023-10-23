fx_version "adamant"
game "gta5"
lua54 "yes"

author "dortey_"
name "[SCAR] Vehicle switch seat"
description "[SCAR] Vehicle switch seat by dortey_"
version "1.0.1"

client_scripts {
	"RageUI/RMenu.lua",
	"RageUI/menu/RageUI.lua",
	"RageUI/menu/Menu.lua",
	"RageUI/menu/MenuController.lua",
	"RageUI/components/*.lua",
	"RageUI/menu/elements/*.lua",
	"RageUI/menu/items/*.lua",
	
	"config.lua",
	"Client/client_functions.lua",
	"Client/client.lua",
}

server_scripts {
	"config.lua",
	"Server/server.lua",
}

escrow_ignore {
	"RageUI/RMenu.lua",
	"RageUI/menu/RageUI.lua",
	"RageUI/menu/Menu.lua",
	"RageUI/menu/MenuController.lua",
	"RageUI/components/*.lua",
	"RageUI/menu/elements/*.lua",
	"RageUI/menu/items/*.lua",
	
    "config.lua",
	"Client/client_functions.lua",
	"Client/client.lua",
	"Server/server.lua",
}