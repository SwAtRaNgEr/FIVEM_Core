-----------------
--FIVEM Script --
-----------------
resource_manifest_version '77731fab-63ca-442c-a67b-abc70f28dfa5'
description 'Gamemode from Ranger.'
resource_type 'gametype' { name = 'FIVEM_Core
'}
server_scripts {
        "main.lua",
        "cmds/911.lua",
        "cmds/ts3.lua",
		"cmds/discord.lua",
        "cmds/website.lua",
        "cmds/me.lua",
        "cmds/help.lua",
        "cmds/sms.lua",
        "car/indicator/server.lua",
        "cmds/ip.lua",
		"cmds/tpserver.lua",
		"cmds/update.lua",
		"cmds/advert.lua",
		"cmds/helpjob.lua",
}

client_scripts {
		"cmds/tpclient.lua",
        "cmds/pos.lua",
		"cmds/tpcity.lua",
        "car/indicator/client.lua",
        "car/door.lua",
        "car/engine.lua",
        "car/enginelevel.lua",
        "proximityvoicechat.lua",
        "watermark.lua",
        "playerlogin.lua",
}