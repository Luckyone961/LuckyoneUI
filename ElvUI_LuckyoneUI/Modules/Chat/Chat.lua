local Name, Private = ...
local E, L, V, P, G = unpack(ElvUI)
local CH = E:GetModule('Chat')

local _G = _G
local ipairs = ipairs

local ChatFrame_AddChannel = ChatFrame_AddChannel
local ChatFrame_AddMessageGroup = ChatFrame_AddMessageGroup
local ChatFrame_RemoveAllMessageGroups = ChatFrame_RemoveAllMessageGroups
local ChatFrame_RemoveMessageGroup = ChatFrame_RemoveMessageGroup
local FCF_OpenNewWindow = FCF_OpenNewWindow
local FCF_ResetChatWindows = FCF_ResetChatWindows
local FCF_SavePositionAndDimensions = FCF_SavePositionAndDimensions
local FCF_SetChatWindowFontSize = FCF_SetChatWindowFontSize
local FCF_SetWindowName = FCF_SetWindowName
local FCF_StopDragging = FCF_StopDragging
local FCFDock_SelectWindow = FCFDock_SelectWindow
local FCFTab_UpdateColors = FCFTab_UpdateColors
local SetCVar = SetCVar
local VoiceTranscriptionFrame_UpdateEditBox = VoiceTranscriptionFrame_UpdateEditBox
local VoiceTranscriptionFrame_UpdateVisibility = VoiceTranscriptionFrame_UpdateVisibility
local VoiceTranscriptionFrame_UpdateVoiceTab = VoiceTranscriptionFrame_UpdateVoiceTab

-- Chat setup for tabs, windows and channels
function L1UI:Setup_Chat()
	-- CVars Chat
	SetCVar('chatClassColorOverride', 0)
	SetCVar('chatMouseScroll', 1)
	SetCVar('chatStyle', 'classic')
	SetCVar('colorChatNamesByClass', 1)
	SetCVar('whisperMode', 'inline')
	SetCVar('wholeChatWindowClickable', 0)

	-- CVars Voice Transcription
	SetCVar('speechToText', 0)
	SetCVar('textToSpeech', 0)

	-- Reset chat to Blizzard defaults
	FCF_ResetChatWindows()

	-- Open 3 new tabs
	FCF_OpenNewWindow()
	FCF_OpenNewWindow()
	FCF_OpenNewWindow()

	for _, name in ipairs(_G.CHAT_FRAMES) do
		local frame = _G[name]
		local id = frame:GetID()

		if E.private.chat.enable then
			CH:FCFTab_UpdateColors(CH:GetTab(_G[name]))
		end

		-- Font size 10 for all tabs
		FCF_SetChatWindowFontSize(nil, frame, 10)

		-- Tabs
		if id == 1 then
			FCF_SetWindowName(frame, 'General')
			frame:ClearAllPoints()
			frame:Point('BOTTOMLEFT', _G.LeftChatToggleButton, 'TOPLEFT', 1, 3)
		elseif id == 2 then
			FCF_SetWindowName(frame, 'Log')
		elseif id == 3 then
			VoiceTranscriptionFrame_UpdateVisibility(frame)
			VoiceTranscriptionFrame_UpdateVoiceTab(frame)
			VoiceTranscriptionFrame_UpdateEditBox(frame)
		elseif id == 4 then
			FCF_SetWindowName(frame, 'Whisper')
		elseif id == 5 then
			FCF_SetWindowName(frame, 'Guild')
		elseif id == 6 then
			FCF_SetWindowName(frame, 'Party')
		end

		FCF_SavePositionAndDimensions(frame)
		FCF_StopDragging(frame)
	end

	-- Whisper tab
	local whisper = { 'WHISPER', 'BN_WHISPER', 'IGNORED' }
	ChatFrame_RemoveAllMessageGroups(_G.ChatFrame4)
	for _, v in ipairs(whisper) do
		ChatFrame_AddMessageGroup(_G.ChatFrame4, v)
	end

	-- Guild tab
	local guild = { 'GUILD', 'GUILD_ACHIEVEMENT', 'OFFICER' }
	ChatFrame_RemoveAllMessageGroups(_G.ChatFrame5)
	for _, v in ipairs(guild) do
		ChatFrame_AddMessageGroup(_G.ChatFrame5, v)
	end

	-- Party tab
	local party = { 'PARTY', 'PARTY_LEADER', 'RAID', 'RAID_LEADER', 'RAID_WARNING', 'INSTANCE_CHAT', 'INSTANCE_CHAT_LEADER' }
	ChatFrame_RemoveAllMessageGroups(_G.ChatFrame6)
	for _, v in ipairs(party) do
		ChatFrame_AddMessageGroup(_G.ChatFrame6, v)
	end

	-- Remove whispers from main tab
	ChatFrame_RemoveMessageGroup(_G.ChatFrame1, 'IGNORED')
	ChatFrame_RemoveMessageGroup(_G.ChatFrame1, 'WHISPER')
	ChatFrame_RemoveMessageGroup(_G.ChatFrame1, 'BN_WHISPER')

	-- Select the main tab
	FCFDock_SelectWindow(_G.GENERAL_CHAT_DOCK, _G.ChatFrame1)

	Private:Print(L["Chat setup successful."])
end
