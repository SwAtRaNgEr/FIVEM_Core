-----------------
--FIVEM Script --
-----------------
local allChatPassword = "pswd"

-- ////////////////////////////////////

RegisterServerEvent('chatCommandEntered')
RegisterServerEvent('chatMessageEntered')
RegisterServerEvent('chatMessageRanged')


RegisterServerEvent("chatCommandEntered")
AddEventHandler('chatCommandEntered', function(fullcommand)
    cm = stringsplit(fullcommand, " ")

    if(cm[1] == "/all") then
		if tablelength(cm) > 2 then
			if cm[2] == allChatPassword then
				local msg = ""
				for i=3, tablelength(cm) do
					msg = msg.. " ".. cm[i]
				end
				local chatname = GetPlayerName(source).. "(all)"
				TriggerEvent('chatMessage', source, chatname, msg)
				TriggerEvent('chatMessageEntered', chatname, {0, 0x99, 255}, msg)
			else 
				print("Incorrect all chat password entered by ".. GetPlayerName(source))
			end			
		end
	elseif cm[1] == "/tvc" then
		TriggerClientEvent('toggleVoiceChannel', source)
		print("Voice channel changed for ".. GetPlayerName(source))
    end
end)

print('Chat adapted by Central Gaming Community (LUA, FiveReborn). Commands to type in chat (T):')
print('/all PSWD MSG - Sends MSG to all people on the server if PSWD matches the allChatPassword.')
print('/tvc - Switches your voice channel from global to local or vice versa.')
print('/textchat - Toggles text chat visibility for yourself.')

-- Following is by FiveReborn team:

-- player join messages
AddEventHandler('playerActivated', function()
    TriggerClientEvent('chatMessage', -1, '', { 0, 0, 0 }, '^2* ' .. GetPlayerName(source) .. ' joined.')
end)

AddEventHandler('playerDropped', function(reason)
    TriggerClientEvent('chatMessage', -1, '', { 0, 0, 0 }, '^2* ' .. GetPlayerName(source) ..' left (' .. reason .. ')')
end)

-- say command handler
AddEventHandler('rconCommand', function(commandName, args)
    if commandName == "say" then
        local msg = table.concat(args, ' ')

        TriggerClientEvent('chatMessage', -1, 'console', { 0, 0x99, 255 }, msg)
        RconPrint('console: ' .. msg .. "\n")

        CancelEvent()
    end
end)

-- tell command handler
AddEventHandler('rconCommand', function(commandName, args)
    if commandName == "tell" then
        local target = table.remove(args, 1)
        local msg = table.concat(args, ' ')

        TriggerClientEvent('chatMessage', tonumber(target), 'Server Console', { 0, 0x99, 255 }, msg)
        RconPrint('console: ' .. msg .. "\n")

        CancelEvent()
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

function tablelength(T)
  local count = 0
  for _ in pairs(T) do count = count + 1 end
  return count
end