-----------------
--FIVEM Script --
-----------------
RegisterServerEvent("CGC:help")

AddEventHandler("CGC:help", function(p, args)
    if args[1] == 5 then
        showHelp5(p)
	elseif args[1] == 2 then
	showHelp2(p)
    elseif args[1] == 3 then
	showHelp3(p)
	elseif args[1] == 4 then
	showHelp4(p)
	elseif args[1] == 5 then
	showHelp5(p)
    else
        showHelp1(p)
    end
end)

function showHelp1(p)
    sendMessage(p, "-------------------------------------------------------------")
    sendMessage(p, prefix_info .. "Help page 1:")
	sendMessage(p, prefix_info .. "/helpcar - Displays all commands for vehicle.")
	sendMessage(p, prefix_info .. "/jobs - Displays all current jobs.")
	sendMessage(p, prefix_info .. "/helppolice - Displays all commands for current jobs.")
	sendMessage(p, prefix_info .. "/helpadmin - Displays all commands for admins.")
    sendMessage(p, prefix_info .. "/help 2 - Help page 2")
end

function showHelp2(p)
    sendMessage(p, "-------------------------------------------------------------")
    sendMessage(p, prefix_info .. "Help page 2:")
    sendMessage(p, prefix_info .. "/sms <PlayerId> [Message] - Sends a private SMS message to a specific player.")
    sendMessage(p, prefix_info .. "/hu or /hd - Puts your hands up / down.")
	sendMessage(p, prefix_info .. "/me (action) - Sends a action message.")
	sendMessage(p, prefix_info .. "/911 (message) - Sends a action message.")
    sendMessage(p, prefix_info .. "/tpcity <ls/s/p> - Teleports either to [L]os Santos, [S]andy Shores or [P]aleto Bay.")
	sendMessage(p, prefix_info .. "/help 3 - Help page 3")
end

function showHelp3(p)
    sendMessage(p, "-------------------------------------------------------------")
    sendMessage(p, prefix_info .. "Help page 3:")
	sendMessage(p, prefix_info .. "/tpcity <ls/s/p> - Teleports either to [L]os Santos, [S]andy Shores or [P]aleto Bay.")
	sendMessage(p, prefix_info .. "/tpa (PlayerId) - Teleports to a player.")
	sendMessage(p, prefix_info .. "/tpaccept - Approve a Player Teleporting to you.")
	sendMessage(p, prefix_info .. "/tpreject - Deny a Player Teleporting to you.")
	sendMessage(p, prefix_info .. "/help 4 - Help page 4")
end

function showHelp4(p)
    sendMessage(p, "-------------------------------------------------------------")
    sendMessage(p, prefix_info .. "Help page 4:")
	sendMessage(p, prefix_info .. "/update - Sends a private SMS message to a specific player.")
	sendMessage(p, prefix_info .. "/pos - Displays the current coridatons of your location.")
	sendMessage(p, prefix_info .. "/ip - Displays the current ip.")
	sendMessage(p, prefix_info .. "/help 5 - Help page 5")
end

function showHelp5(p)
    sendMessage(p, "-------------------------------------------------------------")
	sendMessage(p, prefix_info .. "Help page 5:")
	sendMessage(p, prefix_info .. "/discord - Displays the servers discord IP.")
    sendMessage(p, prefix_info .. "/ts3 Displays the servers TeamSpeak3 IP.")
	sendMessage(p, prefix_info .. "/website - Displays the servers website URL.")
end