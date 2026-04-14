-- Addon namespace
local _, Private = ...
local L = Private.Libs.ACL
local Blizzard = Private.Modules.Blizzard

-- API cache
local CreateAndInitFromMixin = CreateAndInitFromMixin
local CreateFrame = CreateFrame
local GetNumQuestLogEntries = C_QuestLog.GetNumQuestLogEntries
local GetQuestInfo = C_QuestLog.GetInfo
local hooksecurefunc = hooksecurefunc
local RemoveQuestWatch = C_QuestLog.RemoveQuestWatch

-- Global environment
local _G = _G
local UIParent = UIParent

-- Global strings
local DELETE_ITEM_CONFIRM_STRING = DELETE_ITEM_CONFIRM_STRING

-- Disabled Blizzard Frames (Loading on init)
function Private:DisabledFrames()
	if Private.Addon.db.profile.disabledFrames.AlertFrame then
		_G.AlertFrame:UnregisterAllEvents()
		if Private.ElvUI then
			ElvUI[1]:DisableMover('AlertFrameMover')
		end
	end

	if Private.Addon.db.profile.disabledFrames.BossBanner and Private.isRetail then
		_G.BossBanner:UnregisterAllEvents()
		if Private.ElvUI then
			ElvUI[1]:DisableMover('BossBannerMover')
		end
	end

	if Private.Addon.db.profile.disabledFrames.ZoneTextFrame then
		_G.ZoneTextFrame:UnregisterAllEvents()
	end

	if Private.Addon.db.profile.disabledFrames.HousingDecorAlerts and Private.isRetail then
		local HousingEventHandler = CreateAndInitFromMixin(_G.HousingEventHandlerMixin)
		_G.EventRegistry:UnregisterFrameEventAndCallback('NEW_HOUSING_ITEM_ACQUIRED', HousingEventHandler.ShowHousingItemAcquiredAlert, HousingEventHandler)
	end

	if Private.Addon.db.profile.disabledFrames.ApplicationCover and Private.isRetail then
		local HiddenFrame = CreateFrame('Frame', nil, UIParent)
		HiddenFrame:Hide()
		local Cover = _G.LFGListFrame.ApplicationViewer.UnempoweredCover
		if Cover then
			Cover:UnregisterAllEvents()
			Cover:SetParent(HiddenFrame)
			Cover:Hide()
		end
	end
end

-- Easy delete
function Private:EasyDelete()
	if not Private.Addon.db.profile.qualityOfLife.easyDelete then return end

	-- Higher quality than green
	hooksecurefunc(StaticPopupDialogs.DELETE_GOOD_ITEM, 'OnShow', function(frame)
		frame.EditBox:SetText(DELETE_ITEM_CONFIRM_STRING)
	end)

	-- Quests and Quest starters
	hooksecurefunc(StaticPopupDialogs.DELETE_GOOD_QUEST_ITEM, 'OnShow', function(frame)
		frame.EditBox:SetText(DELETE_ITEM_CONFIRM_STRING)
	end)
end

-- Untrack All Quests
-- Source and Credits:
-- https://www.reddit.com/r/WowUI/comments/1qk96mg/otherfixworkaroundhidden_tracked_quests_caused_60/
function Private:UntrackAllQuests()
	if not C_QuestLog then return end

	local numShownEntries = GetNumQuestLogEntries()
	for i = 1, numShownEntries do
		local info = GetQuestInfo(i)
		if info and info.questID and info.questID > 0 then
			RemoveQuestWatch(info.questID)
		end
	end

	Private:Print(L["Successfully untracked all quests (including hidden ones)"])
end

function Blizzard:PLAYER_ENTERING_WORLD()
	Private:DisabledFrames()
	Private:EasyDelete()
	Private:PrivacyOverlay()
end

function Blizzard:OnEnable()
	self:RegisterEvent('PLAYER_ENTERING_WORLD')
end
