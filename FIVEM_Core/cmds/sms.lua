-------------------------------------------------
-- Scripted By Central Gaming Development Team
-- Developer(s):Ranger
-- 2017(C) Copyrighted
-------------------------------------------------
RegisterServerEvent("CGC:sms")

AddEventHandler("CGC:sms", function(p, args)
    receiver = tonumber(args[1])
    if receiver == nil then
        sendMessage(p, prefix_error .. "Please specify a player id.")
        return
    elseif players[receiver] == nil then
        sendMessage(p, prefix_error .. "Player id not found.")
        return
    end
    
    if args[2] == nil then
        sendMessage(p, prefix_error .. "Please specify a message.")
        return
    end
    
    msg = args
    table.remove(msg, 1) -- Remove player name from array
    msg = joinArgs(msg)
    
    TriggerClientEvent("chatMessage", receiver, "[SMS] " .. GetPlayerName(p), {160, 160, 160}, msg)
    TriggerClientEvent("chatMessage", p, "You to " .. GetPlayerName(receiver), {160, 160, 160}, msg)
end)