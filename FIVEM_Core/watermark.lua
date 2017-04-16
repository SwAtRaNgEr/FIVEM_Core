-----------------
--FIVEM Script --
-----------------
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)
        
        SetTextFont(0)
        SetTextProportional(1)
        SetTextScale(0.0, 0.25)
        SetTextColour(192, 192, 192, 255)
        SetTextDropshadow(0, 0, 0, 0, 255)
        SetTextEdge(1, 0, 0, 0, 255)
        SetTextDropShadow()
        SetTextOutline()
        SetTextEntry("STRING")
        AddTextComponentString("FIVEM_Core")
        DrawText(0.005, 0.005)
    end
end)