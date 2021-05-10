local L1UI, E, L, V, P, G = unpack(select(2, ...))
local CH = E:GetModule('Chat')

local _G = _G
local ipairs = ipairs

local ChatFrame_AddMessageGroup = ChatFrame_AddMessageGroup
local ChatFrame_RemoveAllMessageGroups = ChatFrame_RemoveAllMessageGroups
local ChatFrame_RemoveMessageGroup = ChatFrame_RemoveMessageGroup
local FCF_OpenNewWindow = FCF_OpenNewWindow
local FCF_ResetChatWindows = FCF_ResetChatWindows
local FCF_SetChatWindowFontSize = FCF_SetChatWindowFontSize
local FCF_SetWindowName = FCF_SetWindowName
local FCFDock_SelectWindow = FCFDock_SelectWindow
local FCFTab_UpdateColors = FCFTab_UpdateColors
local SetCVar = SetCVar

-- Chat setup for tabs, windows and channels
function L1UI:SetupChat()

	-- Reset chat to Blizzard defaults
	FCF_ResetChatWindows()

	-- General and Log are always id 1 and 2
	FCF_OpenNewWindow() -- id 3
	FCF_OpenNewWindow() -- id 4
	FCF_OpenNewWindow() -- id 5

	-- Rename and color all 5 tabs
	for _, name in ipairs(_G.CHAT_FRAMES) do
		local frame = _G[name]
		local id = frame:GetID()

		if E.private.chat.enable then
			CH:FCFTab_UpdateColors(CH:GetTab(_G[name]))
		end

		-- Font size 11 for all tabs
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

	-- Setup whisper tab
	local chats = { 'WHISPER', 'BN_WHISPER', 'IGNORED' }
	ChatFrame_RemoveAllMessageGroups(_G.ChatFrame3)
	for _, k in ipairs(chats) do
		ChatFrame_AddMessageGroup(_G.ChatFrame3, k)
	end

	-- Setup Guild tab
	chats = { 'GUILD', 'GUILD_ACHIEVEMENT', 'OFFICER' }
	ChatFrame_RemoveAllMessageGroups(_G.ChatFrame4)
	for _, k in ipairs(chats) do
		ChatFrame_AddMessageGroup(_G.ChatFrame4, k)
	end

	-- Setup Party tab
	chats = { 'PARTY', 'PARTY_LEADER', 'RAID', 'RAID_LEADER', 'RAID_WARNING', 'INSTANCE_CHAT', 'INSTANCE_CHAT_LEADER' }
	ChatFrame_RemoveAllMessageGroups(_G.ChatFrame5)
	for _, k in ipairs(chats) do
		ChatFrame_AddMessageGroup(_G.ChatFrame5, k)
	end

	-- Set Chat CVars
	SetCVar('chatStyle', 'classic')
	SetCVar('whisperMode', 'inline')
	SetCVar('colorChatNamesByClass', 1)
	SetCVar('chatClassColorOverride', 0)

	-- Jump back to main tab
	FCFDock_SelectWindow(_G.GENERAL_CHAT_DOCK, _G.ChatFrame1)

	-- Remove Whispers from main tab
	ChatFrame_RemoveMessageGroup(_G.ChatFrame1, 'IGNORED')
	ChatFrame_RemoveMessageGroup(_G.ChatFrame1, 'WHISPER')
	ChatFrame_RemoveMessageGroup(_G.ChatFrame1, 'BN_WHISPER')

	L1UI:Print('Chat setup successful.')
end
