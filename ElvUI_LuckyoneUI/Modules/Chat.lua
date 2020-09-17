local L1UI, E, L, V, P, G = unpack(select(2, ...))
local CH = E:GetModule('Chat')

local _G = _G
local FCF_SetWindowName = FCF_SetWindowName
local FCF_OpenNewWindow = FCF_OpenNewWindow
local FCF_ResetChatWindows = FCF_ResetChatWindows
local FCF_SetChatWindowFontSize = FCF_SetChatWindowFontSize

function L1UI:SetupChat()

	--Reset to default
	FCF_ResetChatWindows()

	--Create new windows
	FCF_OpenNewWindow() --id 3
	FCF_OpenNewWindow() --id 4
	FCF_OpenNewWindow() --id 5

	--Rename all windows
	for _, name in ipairs(_G.CHAT_FRAMES) do
		local frame = _G[name]
		local id = frame:GetID()

		--Set Font Size
		FCF_SetChatWindowFontSize(nil, frame, 11)

		if id == 1 then
			FCF_SetWindowName(frame, 'General')
		elseif id == 2 then
			FCF_SetWindowName(frame, 'Log')
		elseif id == 3 then
			FCF_SetWindowName(frame, 'Whisper')
		elseif id == 4 then
			FCF_SetWindowName(frame, 'Guild')
		elseif id == 5 then
			FCF_SetWindowName(frame, 'Party')
		end
	end

end
