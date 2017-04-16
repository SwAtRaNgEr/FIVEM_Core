-------------------------------------------------
-- Scripted By Central Gaming Development Team
-- Developer(s):Ranger
-- 2017(C) Copyrighted
-------------------------------------------------
RegisterServerEvent("CGC:911")

AddEventHandler("CGC:911", function(p, args)
    if args[1] ~= nil then
        reason = joinArgs(args)
        sendMessage(-1, prefix_info .. blue .. GetPlayerName(p) .. orange .. " has called 911 for: " .. reason)
    else
        sendMessage(p, prefix_error .. "Please state where, what and who.")
    end
end)