-----------------
--FIVEM Script --
-----------------
RegisterNetEvent("CGC:door")

red = "^1"
orange = "^3"
prefix_info = "[INFO] " .. orange
prefix_error = red .. "[ERROR] "

AddEventHandler("CGC:door", function(args)
    Citizen.CreateThread(function()
        car = GetVehiclePedIsIn(GetPlayerPed(-1), false)
        door = tonumber(args[1])
    
        if door ~= nil and door > -1 and door < 8 and car then
            if not IsVehicleDoorDamaged(car, door) then
                if GetVehicleDoorAngleRatio(car, door) == 0.0 then
                    SetVehicleDoorOpen(car, door, false, false)
                    TriggerEvent("chatMessage", "", {0, 0, 0}, prefix_info .. "Door ^2opened.")
                else
                    SetVehicleDoorShut(car, door, false)
                    TriggerEvent("chatMessage", "", {0, 0, 0}, prefix_info .. "Door ^1closed.")
                end
            else
                TriggerEvent("chatMessage", "", {0, 0, 0}, prefix_error .. "Door is damaged.")
            end
        elseif not car then
            TriggerEvent("chatMessage", "", {0, 0, 0}, prefix_error .. "You are not in a vehicle.")
        elseif door ~= nil then
            TriggerEvent("chatMessage", "", {0, 0, 0}, prefix_error .. "Door Id does not exist.")
        else
            TriggerEvent("chatMessage", "", {0, 0, 0}, prefix_error .. "Please enter a door id")
        end
    end)
end)