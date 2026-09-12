local _, Private = ...
local L = Private.Libs.ACL

local ipairs = ipairs
local next = next

local SetCVar = C_CVar.SetCVar

local _G = _G
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

local VOICE = VOICE

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
		FCF_SetChatWindowFontSize(nil, frame, 12)

		-- Tabs
		if id == 1 then
			FCF_SetWindowName(frame, 'Main')
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
	_G.ChatFrame4:RemoveAllMessageGroups()
	for _, v in ipairs({ 'WHISPER', 'BN_WHISPER', 'IGNORED' }) do
		_G.ChatFrame4:AddMessageGroup(v)
	end

	-- Guild tab
	_G.ChatFrame5:RemoveAllMessageGroups()
	for _, v in ipairs({ 'GUILD', 'GUILD_ACHIEVEMENT', 'OFFICER' }) do
		_G.ChatFrame5:AddMessageGroup(v)
	end

	-- Party tab
	_G.ChatFrame6:RemoveAllMessageGroups()
	for _, v in ipairs({ 'PARTY', 'PARTY_LEADER', 'RAID', 'RAID_LEADER', 'RAID_WARNING', 'INSTANCE_CHAT', 'INSTANCE_CHAT_LEADER', 'SYSTEM' }) do
		_G.ChatFrame6:AddMessageGroup(v)
	end

	-- Remove whispers from main tab
	_G.ChatFrame1:RemoveMessageGroup('IGNORED')
	_G.ChatFrame1:RemoveMessageGroup('WHISPER')
	_G.ChatFrame1:RemoveMessageGroup('BN_WHISPER')

	-- Select the main tab
	FCFDock_SelectWindow(_G.GENERAL_CHAT_DOCK, _G.ChatFrame1)

	Private:Print(L["Chat setup successful."], installer)
	Private:Print(L["Your chat will keep disappearing unless you move it in Blizzard's Edit Mode and save the profile there."])
end
