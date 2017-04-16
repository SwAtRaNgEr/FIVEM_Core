-----------------
--FIVEM Script --
-----------------
RegisterNetEvent("CGC:pos")

orange = "^3"
prefix_debug = orange .. "[DEBUG] "

AddEventHandler("CGC:pos", function(args)
    Citizen.CreateThread(function()
        x, y, z = table.unpack(GetEntityCoords(GetPlayerPed(-1), true))
        TriggerEvent("chatMessage", "", {0, 0, 0}, "-------------------------------------------------------------")
        TriggerEvent("chatMessage", "", {0, 0, 0}, prefix_debug .. "X: " .. x)
        TriggerEvent("chatMessage", "", {0, 0, 0}, prefix_debug .. "Y: " .. y)
        TriggerEvent("chatMessage", "", {0, 0, 0}, prefix_debug .. "Z: " .. z)
    end)
end)