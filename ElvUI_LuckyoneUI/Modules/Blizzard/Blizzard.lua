-- Addon namespace
local _, Private = ...

-- API cache
local hooksecurefunc = hooksecurefunc

-- Global environment
local _G = _G

-- Global strings
local DELETE_ITEM_CONFIRM_STRING = DELETE_ITEM_CONFIRM_STRING

-- Disabled Blizzard Frames (Loading on init)
function Private:DisabledFrames()
	if Private.Addon.db.global.disabledFrames.AlertFrame then
		_G.AlertFrame:UnregisterAllEvents()
	end

	if Private.Addon.db.global.disabledFrames.BossBanner and Private.isRetail then
		_G.BossBanner:UnregisterAllEvents()
	end

	if Private.Addon.db.global.disabledFrames.ZoneTextFrame then
		_G.ZoneTextFrame:UnregisterAllEvents()
	end
end

-- Easy delete
function Private:EasyDelete()
	if not Private.Addon.db.global.qualityOfLife.easyDelete then return end

	-- Higher quality than green
	hooksecurefunc(StaticPopupDialogs.DELETE_GOOD_ITEM, 'OnShow', function(frame)
		frame.EditBox:SetText(DELETE_ITEM_CONFIRM_STRING)
	end)

	-- Quests and Quest starters
	hooksecurefunc(StaticPopupDialogs.DELETE_GOOD_QUEST_ITEM, 'OnShow', function(frame)
		frame.EditBox:SetText(DELETE_ITEM_CONFIRM_STRING)
	end)
end
