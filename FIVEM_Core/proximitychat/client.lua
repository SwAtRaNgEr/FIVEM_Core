-----------------
--FIVEM Script --
-----------------
RegisterNetEvent("CGC:vchat")

orange = "^3"
prefix_info = "[INFO] " .. orange

local localChat = true

AddEventHandler("CGC:vchat", function(args)
    Citizen.CreateThread(function()
        localChat = not localChat -- Inverts
        
        if localChat then
            TriggerEvent("chatMessage", "", {0, 0, 0}, prefix_info .. "Switched to local voice chat.")
        else
            NetworkSetTalkerProximity(-1)
            TriggerEvent("chatMessage", "", {0, 0, 0}, prefix_info .. "Switched to global voice chat.")
        end
    end)
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)
        if localChat then
            if NetworkIsPlayerTalking(PlayerId()) then
                loudness = NetworkGetPlayerLoudness(PlayerId())
                NetworkSetTalkerProximity(loudness * 28)
            end
        end
    end
end)
