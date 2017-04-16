-------------------------------------------------
-- Scripted By Central Gaming Development Team
-- Developer(s):MrScammer
-- 2017(C) Copyrighted
-------------------------------------------------
red = "^1"
orange = "^3"
prefix_info = "[INFO] " .. orange
prefix_error = red .. "[ERROR] "

RegisterNetEvent("CGC:tpa")
RegisterNetEvent("CGC:tpaccept")
RegisterNetEvent("CGC:tpdeny")
RegisterNetEvent("CGC:teleport")

local requester = nil

TriggerServerEvent("CGC:tpanewplayer")

AddEventHandler("CGC:tpa", function(newRequester, newRequesterName)
    requester = newRequester
	TriggerEvent("chatMessage", "", {255, 0, 0}, prefix_info .. newRequesterName .. " wants to teleport to you.")
	TriggerEvent("chatMessage", "", {255, 0, 0}, prefix_info .. "/tpaccept or /tpdeny to accept/deny.")
end)

AddEventHandler("CGC:tpaccept", function()
    if requester == nil then
        TriggerEvent("chatMessage", "", {255, 0, 0}, prefix_error .. "Nobody is requesting to teleport to you at the moment.")
        return
    end
    
    TriggerServerEvent("CGC:tpastatus", PlayerId(), requester, true)
	TriggerEvent("chatMessage", "", {255, 0, 0}, prefix_info .. "Accepted teleport.")
    requester = nil
end)

AddEventHandler("CGC:tpdeny", function()
    if requester == nil then
        TriggerEvent("chatMessage", "", {255, 0, 0}, prefix_error .. "Nobody is requesting to teleport to you at the moment.")
        return
    end
    
    TriggerServerEvent("CGC:tpastatus", PlayerId(), requester, false)
	TriggerEvent("chatMessage", "", {255, 0, 0}, prefix_error .. "Denied teleport.")
    requester = nil
end)

AddEventHandler("CGC:teleport", function(target, accepted)
    if not accepted then
		TriggerEvent("chatMessage", "", {255, 0, 0}, prefix_error .. "Teleport was not accepted.")
        return
    end
    
    x, y, z = table.unpack(GetEntityCoords(GetPlayerPed(target) , true))
    SetEntityCoords(GetPlayerPed(-1), x, y, z, 1, 0, 0, 1)
	TriggerEvent("chatMessage", "", {255, 0, 0}, prefix_error .. "Teleport was accepted.")
end)