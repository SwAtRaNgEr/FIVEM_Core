RegisterNetEvent("CGC:indicator:broadcast")

local leftState = false
local rightState = false

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)
        car = GetVehiclePedIsIn(GetPlayerPed(-1), false)
    
        if car then
            if IsControlPressed(0, 10) then -- Left arrow key
                leftState = not leftState
                TriggerServerEvent("CGC:indicator:requestbroadcast", car, leftState, rightState)
                Citizen.Wait(250)
            elseif IsControlPressed(0, 11) then -- Right arrow key
                rightState = not rightState
                TriggerServerEvent("CGC:indicator:requestbroadcast", car, leftState, rightState)
                Citizen.Wait(250)
            end
        end
    end
end)

AddEventHandler("CGC:indicator:broadcast", function(mCar, mLeftState, mRightState)
    Citizen.CreateThread(function()
        -- Left Indicator --
        if mLeftState then
            SetVehicleIndicatorLights(mCar, 1, 1)
        else
            SetVehicleIndicatorLights(mCar, 1, 0)
        end
        
        -- Right Indicator --
        if mRightState then
            SetVehicleIndicatorLights(mCar, 0, 1)
        else
            SetVehicleIndicatorLights(mCar, 0, 0)
        end
    end)
end)