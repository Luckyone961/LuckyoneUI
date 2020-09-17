local L1UI, E, L, V, P, G = unpack(select(2, ...))
local CH = E:GetModule('Chat')

local _G = _G
local ipairs = ipairs
local SetCVar = SetCVar

local FCF_SetWindowName = FCF_SetWindowName
local FCF_OpenNewWindow = FCF_OpenNewWindow
local FCF_ResetChatWindows = FCF_ResetChatWindows
local FCF_SetChatWindowFontSize = FCF_SetChatWindowFontSize

local ChatFrame_AddMessageGroup = ChatFrame_AddMessageGroup
local ChatFrame_RemoveMessageGroup = ChatFrame_RemoveMessageGroup
local ChatFrame_RemoveAllMessageGroups = ChatFrame_RemoveAllMessageGroups

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

		--Update tab colors
		if E.private.chat.enable then
			CH:FCFTab_UpdateColors(CH:GetTab(_G[name]))
		end

		--Set font size
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

	--Tab setup: Whisper
	local chats = { 'WHISPER', 'BN_WHISPER', 'IGNORED' }
	ChatFrame_RemoveAllMessageGroups(_G.ChatFrame3)
	for _, k in ipairs(chats) do
		ChatFrame_AddMessageGroup(_G.ChatFrame3, k)
	end

	--Tab setup: Guild
	chats = { 'GUILD', 'GUILD_ACHIEVEMENT', 'OFFICER' }
	ChatFrame_RemoveAllMessageGroups(_G.ChatFrame4)
	for _, k in ipairs(chats) do
		ChatFrame_AddMessageGroup(_G.ChatFrame4, k)
	end

	--Tab setup: Party
	chats = { 'PARTY', 'PARTY_LEADER', 'RAID', 'RAID_LEADER', 'RAID_WARNING', 'INSTANCE_CHAT', 'INSTANCE_CHAT_LEADER' }
	ChatFrame_RemoveAllMessageGroups(_G.ChatFrame5)
	for _, k in ipairs(chats) do
		ChatFrame_AddMessageGroup(_G.ChatFrame5, k)
	end

	--Chat CVars
	SetCVar('chatStyle', 'classic')

	--Jump back to General tab
	FCFDock_SelectWindow(_G.GENERAL_CHAT_DOCK, _G.ChatFrame1)

	--Remove whispers from General tab
	ChatFrame_RemoveMessageGroup(_G.ChatFrame1, 'IGNORED')
	ChatFrame_RemoveMessageGroup(_G.ChatFrame1, 'WHISPER')
	ChatFrame_RemoveMessageGroup(_G.ChatFrame1, 'BN_WHISPER')

	L1UI:Print('Chat setup successful.')
end
