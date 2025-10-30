-- Addon namespace
local _, Private = ...
local L = Private.Libs.ACL

-- Lua functions
local ipairs = ipairs
local next = next

-- API cache
local SetCVar = C_CVar.SetCVar

-- Global environment
local _G = _G

-- Blizzard functions
local ChatFrame_AddMessageGroup = ChatFrame_AddMessageGroup
local ChatFrame_RemoveAllMessageGroups = ChatFrame_RemoveAllMessageGroups
local ChatFrame_RemoveMessageGroup = ChatFrame_RemoveMessageGroup
local FCF_DockFrame = FCF_DockFrame
local FCF_OpenNewWindow = FCF_OpenNewWindow
local FCF_ResetChatWindow = FCF_ResetChatWindow
local FCF_ResetChatWindows = FCF_ResetChatWindows
local FCF_SavePositionAndDimensions = FCF_SavePositionAndDimensions
local FCF_SetChatWindowFontSize = FCF_SetChatWindowFontSize
local FCF_SetWindowName = FCF_SetWindowName
local FCF_StopDragging = FCF_StopDragging
local FCFDock_SelectWindow = FCFDock_SelectWindow
local VoiceTranscriptionFrame_UpdateEditBox = VoiceTranscriptionFrame_UpdateEditBox
local VoiceTranscriptionFrame_UpdateVisibility = VoiceTranscriptionFrame_UpdateVisibility
local VoiceTranscriptionFrame_UpdateVoiceTab = VoiceTranscriptionFrame_UpdateVoiceTab

-- Global strings
local VOICE = VOICE

-- Constants
local WHISPER_TAB = { 'WHISPER', 'BN_WHISPER', 'IGNORED' }
local GUILD_TAB = { 'GUILD', 'GUILD_ACHIEVEMENT', 'OFFICER' }
local PARTY_TAB = { 'PARTY', 'PARTY_LEADER', 'RAID', 'RAID_LEADER', 'RAID_WARNING', 'INSTANCE_CHAT', 'INSTANCE_CHAT_LEADER', 'SYSTEM' }

-- Chat setup for tabs, windows and channels
function Private:Setup_Chat(installer)
	-- General
	local chats = _G.CHAT_FRAMES

	-- CVars Chat
	SetCVar('chatClassColorOverride', 0)
	SetCVar('chatMouseScroll', 1)
	SetCVar('chatStyle', 'classic')
	SetCVar('colorChatNamesByClass', 1)
	SetCVar('showTimestamps', '%H:%M ')
	SetCVar('whisperMode', 'inline')
	SetCVar('wholeChatWindowClickable', 0)

	-- CVars Voice Transcription
	SetCVar('speechToText', 0)
	SetCVar('textToSpeech', 0)

	-- Reset chat to Blizzard defaults
	FCF_ResetChatWindows()

	-- Force initialize text-to-speech (it doesn't get shown)
	local voiceChat = _G[chats[3]]
	FCF_ResetChatWindow(voiceChat, VOICE)
	FCF_DockFrame(voiceChat, 3)

	-- Open 3 new tabs
	FCF_OpenNewWindow()
	FCF_OpenNewWindow()
	FCF_OpenNewWindow()

	for id, name in next, chats do
		local frame = _G[name]

		if Private.ElvUI then
			if ElvUI[1].private.chat.enable then
				local module = ElvUI[1]:GetModule('Chat')
				module:FCFTab_UpdateColors(module:GetTab(frame))
			end
		end

		-- Font size for all tabs
		FCF_SetChatWindowFontSize(nil, frame, 11)

		-- Tabs
		if id == 1 then
			FCF_SetWindowName(frame, 'General')
			if Private.ElvUI then
				frame:ClearAllPoints()
				frame:Point('BOTTOMLEFT', _G.LeftChatToggleButton, 'TOPLEFT', 1, 3)
			end
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
	ChatFrame_RemoveAllMessageGroups(_G.ChatFrame4)
	for _, v in ipairs(WHISPER_TAB) do
		ChatFrame_AddMessageGroup(_G.ChatFrame4, v)
	end

	-- Guild tab
	ChatFrame_RemoveAllMessageGroups(_G.ChatFrame5)
	for _, v in ipairs(GUILD_TAB) do
		ChatFrame_AddMessageGroup(_G.ChatFrame5, v)
	end

	-- Party tab
	ChatFrame_RemoveAllMessageGroups(_G.ChatFrame6)
	for _, v in ipairs(PARTY_TAB) do
		ChatFrame_AddMessageGroup(_G.ChatFrame6, v)
	end

	-- Remove whispers from main tab
	ChatFrame_RemoveMessageGroup(_G.ChatFrame1, 'IGNORED')
	ChatFrame_RemoveMessageGroup(_G.ChatFrame1, 'WHISPER')
	ChatFrame_RemoveMessageGroup(_G.ChatFrame1, 'BN_WHISPER')

	-- Select the main tab
	FCFDock_SelectWindow(_G.GENERAL_CHAT_DOCK, _G.ChatFrame1)

	if installer then
		_G.LuckyoneInstallStepComplete:ShowMessage(L["Chat setup successful."])
	end

	Private:Print(L["Chat setup successful."])
end
