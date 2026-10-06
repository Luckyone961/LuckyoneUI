local _, Private = ...
local Blizzard = Private.Modules.Blizzard

local hooksecurefunc = hooksecurefunc

local _G = _G

local DELETE_ITEM_CONFIRM_STRING = DELETE_ITEM_CONFIRM_STRING
local StaticPopupDialogs = StaticPopupDialogs

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

function Blizzard:PLAYER_ENTERING_WORLD(_, initLogin, isReload)
	-- Only run the setup on login and reload, not on every loading screen
	if not (initLogin or isReload) then return end

	-- Neither flag can be set again this session, so stop listening
	self:UnregisterEvent('PLAYER_ENTERING_WORLD')

	if Private.isRetail or Private.isMists then
		Private:AutoAcceptRole()
	end
	if Private.isRetail then
		Private:AutoDismount()
	end
	Private:DisabledFrames()
	EasyDelete()
	Private:ExpandMerchant()
	if Private.isClassic or Private.isTBC then
		Private:ExpandQuestLog()
	end
	Private:FasterLoot()
	Private:MovableFrames()
	PreventLootAutoShow()
	Private:PrivacyOverlay()
	if Private.isRetail or Private.isMists then
		Private:QuickSignup()
	end
end

function Blizzard:OnEnable()
	self:RegisterEvent('PLAYER_ENTERING_WORLD')
end
