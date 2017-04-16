RegisterServerEvent("CGC:indicator:requestbroadcast")

AddEventHandler("CGC:indicator:requestbroadcast", function(car, leftState, rightState)
    TriggerClientEvent("CGC:indicator:broadcast", -1, car, leftState, rightState)
end)