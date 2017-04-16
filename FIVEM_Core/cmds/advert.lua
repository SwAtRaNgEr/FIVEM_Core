-------------------------------------------------
-- Scripted By Central Gaming Development Team
-- Developer(s):Ranger
-- 2017(C) Copyrighted
-------------------------------------------------
RegisterServerEvent("CGC:advert")

AddEventHandler("CGC:advert", function(p, args)
    if args[1] ~= nil then
        advert = joinArgs(args)
        sendMessage(-1, .. GetPlayerName(p) .. " Advertisement |".. green .. " " .. advert)
    else
        sendMessage(p, prefix_error .. "Please state an advertisement.")
    end
end)