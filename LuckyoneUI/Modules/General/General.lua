local _, Private = ...
local General = Private.Modules.General

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

-- Removes the Realm names from friendly Nameplates in name-only mode while in a Dungeon/Raid/Battleground
-- This sets (NamePlateFriendlyFrameOptions.updateNameUsesGetUnitName = nil) without tainting
local function RemoveNameplateRealm()
	if not (Private.isModern and Private.Addon.db.profile.misc.removeNameplateRealm) then return end
	_G.TextureLoadingGroupMixin.RemoveTexture({textures = _G.NamePlateFriendlyFrameOptions}, 'updateNameUsesGetUnitName')
end

function General:OnLogin()
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
	RemoveNameplateRealm()
end
