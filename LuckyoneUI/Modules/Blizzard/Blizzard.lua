local _, Private = ...
local L = Private.Libs.ACL
local Blizzard = Private.Modules.Blizzard

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

local HiddenFrame

-- Only created if one of the options below using it is enabled
local function GetHiddenFrame()
	if not HiddenFrame then
		HiddenFrame = CreateFrame('Frame', nil, UIParent)
		HiddenFrame:Hide()
	end
	return HiddenFrame
end

local function DisableFrame(name, mover)
	local frame = _G[name]
	if not frame then return end

	frame:UnregisterAllEvents()

	if mover and Private.ElvUI then
		ElvUI[1]:DisableMover(mover)
	end
end

-- Parks a frame on a invisible parent so shit stays hidden
local function HideFrame(frame)
	if not frame then return end

	frame:UnregisterAllEvents()
	frame:SetParent(GetHiddenFrame())
	frame:Hide()
end

local function TalkingHead_Hide()
	_G.TalkingHeadFrame:Hide()
end

-- PlayCurrent is too early, the frame shows itself right after
local function TalkingHead_PlayCurrent()
	RunNextFrame(TalkingHead_Hide)
end

-- Disabled Blizzard Frames (Loading on init)
local function DisabledFrames()
	local db = Private.Addon.db.profile.disabledFrames

	if db.AlertFrame then
		DisableFrame('AlertFrame', 'AlertFrameMover')
	end

	if db.BossBanner and Private.isRetail then
		DisableFrame('BossBanner', 'BossBannerMover')
	end

	if db.ZoneTextFrame then
		DisableFrame('ZoneTextFrame')
	end

	if db.LossOfControl and (Private.isRetail or Private.isMists) then
		-- ElvUI only creates this mover on Retail and DisableMover errors on unknown movers
		DisableFrame('LossOfControlFrame', Private.isRetail and 'LossControlMover' or nil)
	end

	if db.HousingDecorAlerts and Private.isRetail then
		-- HousingEventHandler is local to Blizzard; EventRegistry unregister needs that owner.
		-- No-op the alert system instead so the toast never queues.
		local system = _G.HousingItemEarnedAlertFrameSystem
		if system then
			system.AddAlert = Private.Noop
		end
	end

	if db.ApplicationCover and (Private.isRetail or Private.isMists) then
		local viewer = _G.LFGListFrame and _G.LFGListFrame.ApplicationViewer
		HideFrame(viewer and viewer.UnempoweredCover)
	end

	if db.UIErrorsFrame then
		HideFrame(_G.UIErrorsFrame)
	end

	if db.TalkingHead and Private.isRetail then
		local TalkingHeadFrame = _G.TalkingHeadFrame
		if TalkingHeadFrame then
			hooksecurefunc(TalkingHeadFrame, 'PlayCurrent', TalkingHead_PlayCurrent)
		end
	end
end

-- Prevent GroupLootHistoryFrame from auto-opening after a boss kill or keystone
local function PreventLootAutoShow()
	if not (Private.isRetail and Private.Addon.db.profile.qualityOfLife.preventLootAutoShow) then return end

	local GroupLootHistoryFrame = _G.GroupLootHistoryFrame
	if GroupLootHistoryFrame then
		GroupLootHistoryFrame:UnregisterEvent('LOOT_HISTORY_GO_TO_ENCOUNTER')
	end
end

-- Easy delete
local function EasyDelete_OnShow(frame)
	frame.EditBox:SetText(DELETE_ITEM_CONFIRM_STRING)
end

local function EasyDelete()
	if not Private.Addon.db.profile.qualityOfLife.easyDelete then return end

	-- Higher quality than green, plus quests and quest starters
	hooksecurefunc(StaticPopupDialogs.DELETE_GOOD_ITEM, 'OnShow', EasyDelete_OnShow)
	hooksecurefunc(StaticPopupDialogs.DELETE_GOOD_QUEST_ITEM, 'OnShow', EasyDelete_OnShow)
end

-- Auto accept role check, holding shift on show skips it
local function AutoAcceptRole_OnShow(self)
	if not IsShiftKeyDown() then
		self:Click()
	end
end

local function AutoSignUp_OnShow(self)
	if not IsShiftKeyDown() then
		self.SignUpButton:Click()
	end
end

local function AutoAcceptRole()
	if not ((Private.isRetail or Private.isMists) and Private.Addon.db.profile.qualityOfLife.autoAcceptRole) then return end

	local AcceptButton = _G.LFDRoleCheckPopupAcceptButton
	if AcceptButton then
		AcceptButton:HookScript('OnShow', AutoAcceptRole_OnShow)
	end

	local ApplicationDialog = _G.LFGListApplicationDialog
	if ApplicationDialog then
		ApplicationDialog:HookScript('OnShow', AutoSignUp_OnShow)
	end
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

local function QuickSignup_Update(entry)
	if not entry.LuckyoneQuickSignup then
		entry:SetScript('OnDoubleClick', QuickSignup_OnDoubleClick)
		entry.LuckyoneQuickSignup = true
	end
end

local function QuickSignup()
	if not ((Private.isRetail or Private.isMists) and Private.Addon.db.profile.qualityOfLife.quickSignup) then return end

	-- Update fires per entry on every list refresh, only set the handler once per entry
	hooksecurefunc('LFGListSearchEntry_Update', QuickSignup_Update)
end

-- Untrack All Quests
-- Source and Credits:
-- https://www.reddit.com/r/WowUI/comments/1qk96mg/otherfixworkaroundhidden_tracked_quests_caused_60/
function Private:UntrackAllQuests()
	for i = 1, GetNumQuestLogEntries() do
		local info = GetQuestInfo(i)
		if info and info.questID and info.questID > 0 then
			RemoveQuestWatch(info.questID)
		end
	end

	Private:Print(L["Successfully untracked all quests (including hidden ones)"])
end

-- Removes the Realm names from friendly Nameplates in name-only mode while in a Dungeon/Raid/Battleground
-- This sets (NamePlateFriendlyFrameOptions.updateNameUsesGetUnitName = nil) without tainting
local function RemoveNameplateRealm()
	if not (Private.isRetail and Private.Addon.db.profile.misc.removeNameplateRealm) then return end
	_G.TextureLoadingGroupMixin.RemoveTexture({textures = _G.NamePlateFriendlyFrameOptions}, 'updateNameUsesGetUnitName')
end

function Blizzard:PLAYER_ENTERING_WORLD(_, initLogin, isReload)
	-- Retries until Blizzard_Communities is loaded, creates the overlay once
	Private:PrivacyOverlay()

	-- Only run the setup on login and reload, not on every loading screen
	if not (initLogin or isReload) then return end

	AutoAcceptRole()
	DisabledFrames()
	EasyDelete()
	Private:ExpandMerchant()
	if Private.isClassic or Private.isTBC then
		Private:ExpandQuestLog()
	end
	Private:FasterLoot()
	Private:FriendsList()
	Private:MailboxFavorites()
	Private:MovableFrames()
	PreventLootAutoShow()
	QuickSignup()
	RemoveNameplateRealm()
end

function Blizzard:OnEnable()
	-- Fonts have to be in place before the tracker builds its first layout at PLAYER_ENTERING_WORLD
	if Private.isRetail then
		Private:ObjectiveTracker()
	end

	self:RegisterEvent('PLAYER_ENTERING_WORLD')
	self:RegisterEvent('PLAYER_REGEN_DISABLED')
	self:RegisterEvent('PLAYER_REGEN_ENABLED')
end
