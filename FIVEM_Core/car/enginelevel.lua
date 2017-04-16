-----------------
--FIVEM Script --
-----------------
RegisterNetEvent("CGC:enginelevel")

red = "^1"
orange = "^3"
prefix_error = red .. "[ERROR] "
prefix_debug = orange .. "[DEBUG] "

AddEventHandler("CGC:enginelevel", function(args)
    Citizen.CreateThread(function()
        car = GetVehiclePedIsIn(GetPlayerPed(-1), false)
    
        if car then
            TriggerEvent("chatMessage", "", {0, 0, 0}, prefix_debug .. "Engine level: " .. tostring(GetVehicleEngineHealth(car)))
        else
            TriggerEvent("chatMessage", "", {0, 0, 0}, prefix_error .. "You are not in a vehicle.")
        end
    end)
end)