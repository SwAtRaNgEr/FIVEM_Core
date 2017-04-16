-----------------
--FIVEM Script --
-----------------
RegisterServerEvent("CGC:ip")

AddEventHandler("CGC:ip", function(p, args)
    sendMessage(p, prefix_debug .. GetPlayerEP(p))
end)