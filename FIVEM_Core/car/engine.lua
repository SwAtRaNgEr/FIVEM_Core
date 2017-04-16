-----------------
--FIVEM Script --
-----------------
RegisterNetEvent("CGC:engine")

red = "^1"
orange = "^3"
prefix_info = "[INFO] " .. orange
prefix_error = red .. "[ERROR] "

local engineCarCrashThreshold = 25
local engineCarCrashWaitTime = 7000
local engineDamageThreshold = 900

local engineOn = true
local forceEngineOff = false
local isInCar = false
local engineDamage = nil

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)
        main()
    end
end)

function main()
    car = GetVehiclePedIsIn(GetPlayerPed(-1), false)
    
    if not engineDamage then
        engineDamage = GetVehicleEngineHealth(car)
    end
    
    if isEngineMalfunctioning(car) then
        handleEngineMalfunctioning(car)
    else
        if car and not isInCar then
            isInCar = true
            turnEngineOn()
        elseif not car and isInCar then
            isInCar = false
        end
        
        if car then
            checkCarCrash(car)
        end
    end
        
    if not engineOn or forceEngineOff then
        SetVehicleEngineOn(car, false, true)
    end
end

function checkCarCrash(car)
    if engineDamage - engineCarCrashThreshold > GetVehicleEngineHealth(car) and IsVehicleEngineOn(car) then
        Citizen.CreateThread(function()
            forceEngineOff = true
            TriggerEvent("chatMessage", "", {0, 0, 0}, prefix_info .. "The engine shut off because of the damage. You have to wait 10 seconds.")
            Citizen.Wait(7000)
            forceEngineOff = false
        end)
    end
            
    engineDamage = GetVehicleEngineHealth(car)
end

function handleEngineMalfunctioning(car)
    if isEngineMalfunctioning(car) and engineOn then
        TriggerEvent("chatMessage", "", {0, 0, 0}, prefix_info .. "The engine is too damaged to work anymore.")
        turnEngineOff()
    end
end

function isEngineMalfunctioning(car)
    if GetVehicleEngineHealth(car) < engineDamageThreshold then
        return true
    else
        return false
    end
end

function turnEngineOn()
    engineOn = true
end

function turnEngineOff()
    engineOn = false
end

AddEventHandler("CGC:engine", function()
    Citizen.CreateThread(function()
        car = GetVehiclePedIsIn(GetPlayerPed(-1), false)
    
        if not isEngineMalfunctioning(car) then
            if car then
                if engineOn and not forceEngineOff then
                    turnEngineOff()
                    TriggerEvent("chatMessage", "", {0, 0, 0}, prefix_info .. "Turning engine ^1off.")
                elseif not forceEngineOff then
                    turnEngineOn()
                    TriggerEvent("chatMessage", "", {0, 0, 0}, prefix_info .. "Turning engine ^2on.")
                end
            else
                TriggerEvent("chatMessage", "", {0, 0, 0}, prefix_error .. "You are not in a vehicle.")
            end
        else
            TriggerEvent("chatMessage", "", {0, 0, 0}, prefix_info .. "The engine is too damaged to work anymore.")
        end
    end)
end)