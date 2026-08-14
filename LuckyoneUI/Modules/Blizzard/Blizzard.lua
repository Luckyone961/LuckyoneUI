local _, Private = ...
local L = Private.Libs.ACL
local Blizzard = Private.Modules.Blizzard

local ContinueOnAddOnLoaded = EventUtil.ContinueOnAddOnLoaded
local CreateFrame = CreateFrame
local GetNumQuestLogEntries = C_QuestLog.GetNumQuestLogEntries
local GetQuestInfo = C_QuestLog.GetInfo
local hooksecurefunc = hooksecurefunc
local IsShiftKeyDown = IsShiftKeyDown
local LFGListSearchPanel_SelectResult = LFGListSearchPanel_SelectResult
local LFGListSearchPanel_SignUp = LFGListSearchPanel_SignUp
local LFGListSearchPanelUtil_CanSelectResult = LFGListSearchPanelUtil_CanSelectResult
local RemoveQuestWatch = C_QuestLog.RemoveQuestWatch
local RunNextFrame = RunNextFrame

local _G = _G
local UIParent = UIParent

local DELETE_ITEM_CONFIRM_STRING = DELETE_ITEM_CONFIRM_STRING
local StaticPopupDialogs = StaticPopupDialogs

-- Disabled Blizzard Frames (Loading on init)
function Private:DisabledFrames()
	local db = Private.Addon.db.profile.disabledFrames
	local HiddenFrame

	local function GetHiddenFrame()
		if not HiddenFrame then
			HiddenFrame = CreateFrame('Frame', nil, UIParent)
			HiddenFrame:Hide()
		end
		return HiddenFrame
	end

	if db.AlertFrame then
		local AlertFrame = _G.AlertFrame
		if AlertFrame then
			AlertFrame:UnregisterAllEvents()
			if Private.ElvUI then
				ElvUI[1]:DisableMover('AlertFrameMover')
			end
		end
	end

	if db.BossBanner and Private.isRetail then
		local BossBanner = _G.BossBanner
		if BossBanner then
			BossBanner:UnregisterAllEvents()
			if Private.ElvUI then
				ElvUI[1]:DisableMover('BossBannerMover')
			end
		end
	end

	if db.ZoneTextFrame then
		local ZoneTextFrame = _G.ZoneTextFrame
		if ZoneTextFrame then
			ZoneTextFrame:UnregisterAllEvents()
		end
	end

	if db.HousingDecorAlerts and Private.isRetail then
		-- HousingEventHandler is local to Blizzard; EventRegistry unregister needs that owner.
		-- No-op the alert system instead so the toast never queues.
		local system = _G.HousingItemEarnedAlertFrameSystem
		if system then
			system.AddAlert = function() end
		end
	end

	if db.LossOfControl and (Private.isRetail or Private.isMists) then
		local LossOfControlFrame = _G.LossOfControlFrame
		if LossOfControlFrame then
			LossOfControlFrame:UnregisterAllEvents()
			-- ElvUI only creates this mover on Retail and DisableMover errors on unknown movers
			if Private.ElvUI and Private.isRetail then
				ElvUI[1]:DisableMover('LossControlMover')
			end
		end
	end

	if db.ApplicationCover and (Private.isRetail or Private.isMists) then
		local Cover = _G.LFGListFrame.ApplicationViewer.UnempoweredCover
		if Cover then
			Cover:UnregisterAllEvents()
			Cover:SetParent(GetHiddenFrame())
			Cover:Hide()
		end
	end

	if db.UIErrorsFrame then
		local ErrorFrame = _G.UIErrorsFrame
		if ErrorFrame then
			ErrorFrame:UnregisterAllEvents()
			ErrorFrame:SetParent(GetHiddenFrame())
			ErrorFrame:Hide()
		end
	end

	if db.TalkingHead and Private.isRetail then
		ContinueOnAddOnLoaded('Blizzard_TalkingHeadUI', function()
			hooksecurefunc(_G.TalkingHeadFrame, 'PlayCurrent', function(frame)
				RunNextFrame(function() frame:Hide() end)
			end)
		end)
	end
end

-- Prevent GroupLootHistoryFrame from auto-opening after a boss kill or keystone
function Private:PreventLootAutoShow()
	if not (Private.isRetail and Private.Addon.db.profile.qualityOfLife.preventLootAutoShow) then return end

	local GroupLootHistoryFrame = _G.GroupLootHistoryFrame
	if GroupLootHistoryFrame then
		GroupLootHistoryFrame:UnregisterEvent('LOOT_HISTORY_GO_TO_ENCOUNTER')
	end
end

-- Easy delete
function Private:EasyDelete()
	if not Private.Addon.db.profile.qualityOfLife.easyDelete then return end

	local function EasyDelete_OnShow(frame)
		frame.EditBox:SetText(DELETE_ITEM_CONFIRM_STRING)
	end

	-- Higher quality than green
	hooksecurefunc(StaticPopupDialogs.DELETE_GOOD_ITEM, 'OnShow', EasyDelete_OnShow)

	-- Quests and Quest starters
	hooksecurefunc(StaticPopupDialogs.DELETE_GOOD_QUEST_ITEM, 'OnShow', EasyDelete_OnShow)
end

-- Auto accept role check
function Private:AutoAcceptRole()
	if not ((Private.isRetail or Private.isMists) and Private.Addon.db.profile.qualityOfLife.autoAcceptRole) then return end

	-- Auto click on show
	_G.LFDRoleCheckPopupAcceptButton:HookScript('OnShow', function(self)
		if not IsShiftKeyDown() then
			self:Click()
		end
	end)

	-- Allow skipping auto-accept while shift key is down
	_G.LFGListApplicationDialog:HookScript('OnShow', function(self)
		if not IsShiftKeyDown() then
			self.SignUpButton:Click()
		end
	end)
end

-- Quick signup (double-click LFG search results to open signup)
local function QuickSignup_OnDoubleClick(self, button)
	if button ~= 'LeftButton' then return end

	local resultID = self.resultID
	if not resultID or not LFGListSearchPanelUtil_CanSelectResult(resultID) then return end

	local panel = _G.LFGListFrame.SearchPanel
	if panel.selectedResult ~= resultID then
		LFGListSearchPanel_SelectResult(panel, resultID)
	end

	LFGListSearchPanel_SignUp(panel)
end

function Private:QuickSignup()
	if not ((Private.isRetail or Private.isMists) and Private.Addon.db.profile.qualityOfLife.quickSignup) then return end

	-- Update fires per entry on every list refresh, only set the handler once per entry
	hooksecurefunc('LFGListSearchEntry_Update', function(entry)
		if not entry.LuckyoneQuickSignup then
			entry:SetScript('OnDoubleClick', QuickSignup_OnDoubleClick)
			entry.LuckyoneQuickSignup = true
		end
	end)
end

-- Untrack All Quests
-- Source and Credits:
-- https://www.reddit.com/r/WowUI/comments/1qk96mg/otherfixworkaroundhidden_tracked_quests_caused_60/
function Private:UntrackAllQuests()
	local numShownEntries = GetNumQuestLogEntries()
	for i = 1, numShownEntries do
		local info = GetQuestInfo(i)
		if info and info.questID and info.questID > 0 then
			RemoveQuestWatch(info.questID)
		end
	end

	Private:Print(L["Successfully untracked all quests (including hidden ones)"])
end

-- Removes the Realm names from friendly Nameplates in name-only mode while in a Dungeon/Raid/Battleground
-- This sets (NamePlateFriendlyFrameOptions.updateNameUsesGetUnitName = nil) without tainting
function Private:RemoveNameplateRealm()
	if not (Private.isRetail and Private.Addon.db.profile.misc.removeNameplateRealm) then return end
	_G.TextureLoadingGroupMixin.RemoveTexture({textures = _G.NamePlateFriendlyFrameOptions}, 'updateNameUsesGetUnitName')
end

function Blizzard:PLAYER_ENTERING_WORLD(_, initLogin, isReload)
	-- Retries until Blizzard_Communities is loaded, creates the overlay once
	Private:PrivacyOverlay()

	-- Only run the setup on login and reload, not on every loading screen
	if not (initLogin or isReload) then return end

	Private:AutoAcceptRole()
	Private:DisabledFrames()
	Private:EasyDelete()
	Private:PreventLootAutoShow()
	Private:QuickSignup()
	Private:RemoveNameplateRealm()
end

function Blizzard:OnEnable()
	self:RegisterEvent('PLAYER_ENTERING_WORLD')
end
