-- Lua functions
local unpack = unpack

-- API cache
local hooksecurefunc = hooksecurefunc

-- Global environment
local _G = _G

-- Global strings
local DELETE_ITEM_CONFIRM_STRING = DELETE_ITEM_CONFIRM_STRING

-- AddOn namespace
local _, Private = ...

-- ElvUI modules
local E = unpack(ElvUI)

-- Disabled Blizzard Frames (Loading on init)
function Private:DisabledFrames()
	if E.private.L1UI.disabledFrames.AlertFrame then
		_G.AlertFrame:UnregisterAllEvents()
		E:DisableMover('AlertFrameMover')
	end

	if E.private.L1UI.disabledFrames.BossBanner and E.Retail then
		_G.BossBanner:UnregisterAllEvents()
		E:DisableMover('BossBannerMover')
	end

	if E.private.L1UI.disabledFrames.ZoneTextFrame then
		_G.ZoneTextFrame:UnregisterAllEvents()
	end
end

-- Easy delete
function Private:EasyDelete()
	if not E.private.L1UI.qualityOfLife.easyDelete then return end

	-- Higher quality than green
	hooksecurefunc(StaticPopupDialogs.DELETE_GOOD_ITEM, 'OnShow', function(frame)
		local name = E.Classic and frame.editBox or frame.EditBox
		name:SetText(DELETE_ITEM_CONFIRM_STRING)
	end)

	-- Quests and Quest starters
	hooksecurefunc(StaticPopupDialogs.DELETE_GOOD_QUEST_ITEM, 'OnShow', function(frame)
		local name = E.Classic and frame.editBox or frame.EditBox
		name:SetText(DELETE_ITEM_CONFIRM_STRING)
	end)
end
