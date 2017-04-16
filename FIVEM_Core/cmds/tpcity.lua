-------------------------------------------------
-- Scripted By Central Gaming Development Team
-- Developer(s):Ranger
-- 2017(C) Copyrighted
-------------------------------------------------

RegisterNetEvent("CGC:tpcity")

red = "^1"
orange = "^3"
prefix_info = "[INFO] " .. orange
prefix_error = red .. "[ERROR] "

AddEventHandler("CGC:tpcity", function(args)
    Citizen.CreateThread(function()
        local spawnChoise = math.random(4)
    
        if args[1] == "ls" then -- Los Santos
            if spawnChoise == 1 then
                SetEntityCoords(GetPlayerPed(-1), -279.0, -923.0, 31.0, 1, 0, 0, 1)
            elseif spawnChoise == 2 then
                SetEntityCoords(GetPlayerPed(-1), 572.0, -1579.0, 28.0, 1, 0, 0, 1)
            elseif spawnChoise == 3 then
                SetEntityCoords(GetPlayerPed(-1), 116.0, -455.0, 42.0, 1, 0, 0, 1)
            else
                SetEntityCoords(GetPlayerPed(-1), -1654.0, -1098.0, 13.0, 1, 0, 0, 1)
            end
            
            TriggerEvent("chatMessage", "", {0, 0, 0}, prefix_info .. "Teleported successfully to Los Santos.")
        elseif args[1] == "s" then -- Sandy Shores
            if spawnChoise == 1 then
                SetEntityCoords(GetPlayerPed(-1), 2071.0, 3692.0, 34.0, 1, 0, 0, 1)
            elseif spawnChoise == 2 then
                SetEntityCoords(GetPlayerPed(-1), 2014.0, 3931.0, 31.0, 1, 0, 0, 1)
            elseif spawnChoise == 3 then
                SetEntityCoords(GetPlayerPed(-1), 1557.0, 3832.0, 32.0, 1, 0, 0, 1)
            else
                SetEntityCoords(GetPlayerPed(-1), 1510.0, 3473.0, 37.0, 1, 0, 0, 1)
            end
            
            TriggerEvent("chatMessage", "", {0, 0, 0}, prefix_info .. "Teleported successfully to Sandy Shores.")
        elseif args[1] == "p" then -- Paleto Bay
            if spawnChoise == 1 then
                SetEntityCoords(GetPlayerPed(-1), 304.0, 6530.0, 29.0, 1, 0, 0, 1)
            elseif spawnChoise == 2 then
                SetEntityCoords(GetPlayerPed(-1), -274.0, 6633.0, 7.0, 1, 0, 0, 1)
            elseif spawnChoise == 3 then
                SetEntityCoords(GetPlayerPed(-1), -792.0, 5917.0, 20.0, 1, 0, 0, 1)
            else
                SetEntityCoords(GetPlayerPed(-1), 299.0, 6593.0, 29.0, 1, 0, 0, 1)
            end
            
            TriggerEvent("chatMessage", "", {0, 0, 0}, prefix_info .. "Teleported successfully to Paleto Bay.")
        else
            TriggerEvent("chatMessage", "", {0, 0, 0}, prefix_error .. "Either 'ls', 's' or 'p'")
        end
    end)
end)