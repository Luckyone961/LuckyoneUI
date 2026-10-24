local _, Private = ...

local CreateFrame = CreateFrame
local hooksecurefunc = hooksecurefunc
local RunNextFrame = RunNextFrame

local _G = _G
local UIParent = UIParent

local HiddenFrame

local function DisableFrame(name, mover)
	local frame = _G[name]
	if not frame then return end

	frame:UnregisterAllEvents()

	local E = Private.ElvUI and ElvUI[1]

	-- Older ElvUI versions lack some movers and DisableMover errors on unknown ones
	if mover and E and E:GetMoverHolder(mover) then
		E:DisableMover(mover)

		-- ElvUI profile switches re-enable disabled movers unless shouldDisable returns true
		E.DisabledMovers[mover].shouldDisable = function() return true end
	end
end

-- Parks a frame on a invisible parent so shit stays hidden
-- The parent is only created if one of the options below uses it
local function HideFrame(frame)
	if not frame then return end

	if not HiddenFrame then
		HiddenFrame = CreateFrame('Frame', nil, UIParent)
		HiddenFrame:Hide()
	end

	frame:UnregisterAllEvents()
	frame:SetParent(HiddenFrame)
	frame:Hide()
end

local function TalkingHead_IgnoreManager(frame)
	-- A frame moved in Edit Mode already carries Blizzard's own flag
	if not frame.ignoreFramePositionManager then
		frame.ignoreFramePositionManager = true
	end
end

local function TalkingHead_Hide()
	local frame = _G.TalkingHeadFrame

	if frame.layoutParent.showingFrames[frame] then
		return
	end

	frame:Hide()
end

-- PlayCurrent is too early, the frame shows itself right after
local function TalkingHead_PlayCurrent()
	RunNextFrame(TalkingHead_Hide)
end

-- Disabled Blizzard Frames (Loading on init)
function Private:DisabledFrames()
	local db = Private.Addon.db.profile.disabledFrames

	if db.AlertFrame then
		DisableFrame('AlertFrame', 'AlertFrameMover')
	end

	if db.BossBanner and Private.isModern then
		DisableFrame('BossBanner', 'BossBannerMover')
	end

	if db.EventToasts then
		if Private.isModern then
			DisableFrame('EventToastManagerFrame', 'EventToastMover')
			DisableFrame('MajorFactionsRenownToast')
			DisableFrame('MajorFactionUnlockToast')
			DisableFrame('CovenantRenownToast')
			DisableFrame('HousingTopBannerFrame')
		elseif Private.isMists then
			HideFrame(_G.LevelUpDisplay)
		end
	end

	if db.ZoneTextFrame then
		DisableFrame('ZoneTextFrame')
	end

	if db.LossOfControl and (Private.isModern or Private.isMists) then
		DisableFrame('LossOfControlFrame', 'LossControlMover')
	end

	if db.HousingDecorAlerts and Private.isRetail then
		local frame = _G.EventRegistry.frameEventFrame
		if frame then
			frame:UnregisterEvent('NEW_HOUSING_ITEM_ACQUIRED')
		end
	end

	if db.ApplicationCover and (Private.isRetail or Private.isMists) then
		local viewer = _G.LFGListFrame and _G.LFGListFrame.ApplicationViewer
		HideFrame(viewer and viewer.UnempoweredCover)
	end

	if db.UIErrorsFrame then
		HideFrame(_G.UIErrorsFrame)
	end

	if db.TalkingHead and Private.isModern then
		local TalkingHeadFrame = _G.TalkingHeadFrame
		if TalkingHeadFrame then
			TalkingHead_IgnoreManager(TalkingHeadFrame)
			hooksecurefunc(TalkingHeadFrame, 'ApplySystemAnchor', TalkingHead_IgnoreManager)
			hooksecurefunc(TalkingHeadFrame, 'PlayCurrent', TalkingHead_PlayCurrent)
		end
	end
end
