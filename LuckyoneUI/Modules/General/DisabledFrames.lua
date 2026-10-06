local _, Private = ...

local CreateFrame = CreateFrame
local hooksecurefunc = hooksecurefunc
local RunNextFrame = RunNextFrame

local _G = _G
local UIParent = UIParent

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

	local E = Private.ElvUI and ElvUI[1]

	-- Older ElvUI versions lack some movers and DisableMover errors on unknown ones
	if mover and E and E:GetMoverHolder(mover) then
		E:DisableMover(mover)

		-- ElvUI profile switches re-enable disabled movers unless shouldDisable returns true
		E.DisabledMovers[mover].shouldDisable = function() return true end
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
function Private:DisabledFrames()
	local db = Private.Addon.db.profile.disabledFrames

	if db.AlertFrame then
		DisableFrame('AlertFrame', 'AlertFrameMover')
	end

	if db.BossBanner and Private.isModern then
		DisableFrame('BossBanner', 'BossBannerMover')
	end

	if db.ZoneTextFrame then
		DisableFrame('ZoneTextFrame')
	end

	if db.LossOfControl and (Private.isModern or Private.isMists) then
		DisableFrame('LossOfControlFrame', 'LossControlMover')
	end

	if db.HousingDecorAlerts and Private.isRetail then
		-- HousingEventHandler is local to Blizzard; EventRegistry unregister needs that owner.
		-- Zero the queue limits instead, AddAlert drops the toast on its own.
		local system = _G.HousingItemEarnedAlertFrameSystem
		if system then
			system.maxAlerts, system.maxQueue = 0, 0
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
