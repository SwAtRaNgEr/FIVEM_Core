-----------------
--FIVEM Script --
-----------------
local localChatRange = 30.00  -- the range in metres for local chat type. Edit if you wish.

-- ////////////////////////////////////////////
local chatInputActive = false
local chatInputActivating = false
local showChat = true
local localVoiceChat = false

RegisterNetEvent('chatMessage')
RegisterNetEvent('chatMessageRanged')
RegisterNetEvent('toggleVoiceChannel')


RegisterNUICallback('chatResult', function(data, cb)
    chatInputActive = false

    SetNuiFocus(false)

    if data.message then
	
		if data.message == "/textchat" then		
			showChat = not showChat
			return
		end
		
        if(string.sub(data.message, 1, 1) == "/" and string.len(data.message) >= 2) then
            TriggerServerEvent('chatCommandEntered', data.message)
        else
			local posp = GetEntityCoords(GetPlayerPed(-1), true)
			TriggerServerEvent('chatMessageRanged', data.message, localChatRange)
        end
    end

    cb('ok')
end)

AddEventHandler('toggleVoiceChannel', function()
	if localVoiceChat then 
		NetworkSetTalkerProximity(0.0)
		TriggerEvent('chatMessage', "SYSTEM", {0, 0, 0}, "Switched to global voice.")	
	else
		NetworkSetTalkerProximity(localChatRange)
		TriggerEvent('chatMessage', "SYSTEM", {0, 0, 0}, "Switched to local voice.")	
	end
	localVoiceChat = not localVoiceChat
end)

Citizen.CreateThread(function()
    SetTextChatEnabled(false)
	TriggerEvent('chatMessage', "SYSTEM", {0, 0, 0}, "Switched to global voice.")
    while true do
        Wait(0)

        if not chatInputActive then
            if IsControlPressed(0, 245) --[[ INPUT_MP_TEXT_CHAT_ALL ]] then
                chatInputActive = true
                chatInputActivating = true

                SendNUIMessage({
                    meta = 'openChatBox'
                })
            end
        end

        if chatInputActivating then
            if not IsControlPressed(0, 245) then
                SetNuiFocus(true)

                chatInputActivating = false
            end
        end
    end
end)

function stringsplit(self, delimiter)
  local a = self:Split(delimiter)
  local t = {}

  for i = 0, #a - 1 do
     table.insert(t, a[i])
  end

  return t
end