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
    sendMessage(p, prefix_info .. "/help 2 - Help page 2")
end

function showHelp2(p)
    sendMessage(p, "-------------------------------------------------------------")
    sendMessage(p, prefix_info .. "Help page 2:")
	sendMessage(p, prefix_info .. "/help 3 - Help page 3")
end

function showHelp3(p)
    sendMessage(p, "-------------------------------------------------------------")
    sendMessage(p, prefix_info .. "Help page 3:")
	sendMessage(p, prefix_info .. "/help 4 - Help page 4")
end

function showHelp4(p)
    sendMessage(p, "-------------------------------------------------------------")
    sendMessage(p, prefix_info .. "Help page 4:")
end

function showHelp5(p)
    sendMessage(p, "-------------------------------------------------------------")
end
