-----------------
--FIVEM Script --
-----------------
RegisterServerEvent("chatMessageEntered")
RegisterServerEvent("CGC:newplayer")
RegisterServerEvent("chatCommandEntered")

AddEventHandler("chatMessage", function(p, color, msg)
    if msg:sub(1, 1) == "/" then
        fullcmd = stringSplit(msg, " ")
        handleCmd(p, fullcmd)
        CancelEvent()
    end
end)

function handleCmd(p, fullcmd)
    cmd = fullcmd[1]
    args = makeArgs(fullcmd)
    if cmd == "/911" then
        TriggerCmd("911", p, args)
    elseif cmd == "/ts3" then
       TriggerCmd("ts3", p, args)   
	elseif cmd == "/tpa" then
        TriggerCmd("tpa", p, args)
	elseif cmd == "/tpaccept" then
        TriggerCmd("tpaccept", p, args)
	elseif cmd == "/tpdeny" then
        TriggerCmd("tpdeny", p, args)
    elseif cmd == "/me" then
        TriggerCmd("me", p, args)
    elseif cmd == "/pos" then
        TriggerClientCmd("pos", p, args)
	elseif cmd == "/ragdoll" then
        TriggerClientCmd("ragdoll", p, true)
    elseif cmd == "/tpcity" then
        TriggerClientCmd("tpcity", p, args)
    elseif cmd == "/sms" then
        TriggerCmd("sms", p, args)
    elseif cmd == "/door" then
        TriggerClientCmd("door", p, args)
    elseif cmd == "/engine" then
        TriggerClientCmd("engine", p, args)
    elseif cmd == "/enginelevel" then
        TriggerClientCmd("enginelevel", p, args)
    elseif cmd == "/ip" then
        TriggerCmd("ip", p, args)
    elseif cmd == "/advert" then
        TriggerCmd("advert", p, args)
	else
	sendMessage(p, prefix_error .. "Command not found! Do /help for a list of commands.")
end

function TriggerCmd(trigger, p, args)
    TriggerEvent("CGC:" .. trigger, p, args)
end

function TriggerAdminCmd(trigger, p, args)
    if players[p] ~= rank_admin then
        sendMessage(p, prefix_error .. "No permissions to do that.")
        return
    end
    
    TriggerEvent("CGC:" .. trigger, p, args)
end
function TriggerSafeCmd(trigger, p, args)
    if players[p] ~= rank_safe then
        sendMessage(p, prefix_error .. "No permissions to do that.")
        return
    end
    
    TriggerEvent("CGC:" .. trigger, p, args)
end

function TriggerPoliceCmd(trigger, p, args)
    if players[p] ~= rank_police then
        sendMessage(p, prefix_error .. "No permissions to do that.")
        return
    end
    
    TriggerEvent("CGC:" .. trigger, p, args)
end

function TriggerClientCmd(trigger, p, args)
    TriggerClientEvent("CGC:" .. trigger, p, args)
end

function makeArgs(cmd)
    args = {}
    for i = 2, #cmd, 1 do
        table.insert(args, cmd[i])
    end
    return args
end

-- Utils (WON´T WORK IN CLIENT-SIDED SCRIPTS) --

function stringSplit(self, delimiter)
  local a = self:Split(delimiter)
  local t = {}

  for i = 0, #a - 1 do
     table.insert(t, a[i])
  end

  return t
end

function joinArgs(arguments)
    local joined_arg = "";
    for k, v in pairs(arguments) do
        joined_arg = joined_arg .. " " .. tostring(v)
    end
    return joined_arg
end

function sendMessage(id, message)
    TriggerClientEvent("chatMessage", id, "", {0, 0, 0}, message)
end

red = "^1"
green = "^2"
orange = "^3"
blue = "^4"
lightblue = "^5"
purple = "^6"
white = "^7"

red2 = "~r~"
blue2 = "~b~"
green2 = "~g~"
yellow = "~y~"
purple2 = "~p~"
grey = "~c~"
dark_grey = "~m~"
black = "~u~"
orange2 = "~o~"

new_line = "~n~"
white2 = "~s~"
bold = "~h~"
rockstar = "?"
rockstar2 = "÷"
rockstar_verified = "¦"

prefix_info = "[INFO] " .. orange
prefix_police = "[Police] " .. blue
prefix_action = "[*] "
prefix_error = red .. "[ERROR] "
prefix_debug = orange .. "[DEBUG] "
prefix_purchase = blue .. "[SHOP] "
prefix_system = red .. "[SYSTEM] " .. white
prefix_duty = purple .. "[DUTY] "

rank_civ = "civ"
rank_police = "police"
rank_admin = "admin"
rank_safe = "safe"

-- Finally loaded --
sendMessage(-1, prefix_system .. "Reloaded the server script.")
