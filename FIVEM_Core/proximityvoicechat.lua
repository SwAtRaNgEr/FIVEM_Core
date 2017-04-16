Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)
        if NetworkIsPlayerTalking(PlayerId()) then
            loudness = NetworkGetPlayerLoudness(PlayerId())
            
            if loudness < 0.2 then
                NetworkSetTalkerProximity(4.01)
            elseif loudness < 0.4 then
                NetworkSetTalkerProximity(8.01)
            elseif loudness < 0.6 then
                NetworkSetTalkerProximity(12.01)
            elseif loudness < 0.8 then
                NetworkSetTalkerProximity(16.01)
            else
                NetworkSetTalkerProximity(20.01)
            end
        end
    end
end)