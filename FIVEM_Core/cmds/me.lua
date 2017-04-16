-----------------
--FIVEM Script --
-----------------
RegisterServerEvent("CGC:me")

AddEventHandler("CGC:me", function(p, args)
    if args[1] ~= nil then
        activity = joinArgs(args)
        sendMessage(-1, prefix_action .. blue .. GetPlayerName(p) .. purple .. " " .. activity)
    else
        sendMessage(p, prefix_error .. "Please state an activity.")
    end
end)
