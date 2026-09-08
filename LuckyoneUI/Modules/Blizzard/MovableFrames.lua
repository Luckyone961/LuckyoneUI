local _, Private = ...

local pairs = pairs

local CreateFrame = CreateFrame
local hooksecurefunc = hooksecurefunc
local InCombatLockdown = InCombatLockdown
local IsAltKeyDown = IsAltKeyDown
local IsControlKeyDown = IsControlKeyDown
local IsShiftKeyDown = IsShiftKeyDown

local _G = _G
local UIParent = UIParent
local UIPanelWindows = UIPanelWindows

-- The offsets clear the portrait and the close button
local HANDLE_HEIGHT = 20
local HANDLE_LEFT = 60
local HANDLE_RIGHT = -40
local HANDLE_TOP = -4

-- Config option offers to require mod-click to move
local Modifiers = {
	ALT = IsAltKeyDown,
	CTRL = IsControlKeyDown,
	SHIFT = IsShiftKeyDown,
}

-- Edit Mode moves the HUD on its own
local Blocked = {
	EditModeManagerFrame = true,
}

-- Non-Retail registers the Worldmap as a left area panel
-- Opening it drags it out of the screen center
local Centered = {
	WorldMapFrame = not Private.isRetail,
}

local Defaults = {} -- The position it had before the first drag
local Handles = {}
local Positions = {} -- The custom position, session only and reverted on reload
local Restored = {} -- Frames that should ignore the Blizzard panel layout

local EventFrame
local initialized

local function ModifierDown()
	local isDown = Modifiers[Private.Addon.db.profile.movableFrames.modifier]
	return not isDown or isDown()
end

-- Moving a protected panel from addon code is blocked in combat
local function CanMove(frame)
	if InCombatLockdown() then return end

	-- Full screen panels like the Classic Worldmap cannot be moved
	return not (frame.IsMaximized and frame:IsMaximized())
end

-- Secret values safety check
local function GetAnchor(frame)
	if frame.IsAnchoringSecret and frame:IsAnchoringSecret() then return end

	local point, relativeTo, relativePoint, x, y = frame:GetPoint()
	if not point or (relativeTo and relativeTo ~= UIParent) then return end

	return { point = point, relativePoint = relativePoint, x = x, y = y }
end

local function SetAnchor(frame, anchor)
	frame:ClearAllPoints()
	frame:SetPoint(anchor.point, UIParent, anchor.relativePoint, anchor.x, anchor.y)
end

local function GetPosition(frame)
	return Positions[frame] or Restored[frame]
end

-- Blizzard re-anchors every open panel whenever one of them opens or closes
local function ApplyPositions()
	for frame in pairs(Handles) do
		local anchor = GetPosition(frame)
		if anchor and frame:IsShown() and CanMove(frame) then
			SetAnchor(frame, anchor)
		end
	end
end

local function Handle_OnShow(self)
	local frame = self:GetParent()
	local anchor = GetPosition(frame)

	if anchor and CanMove(frame) then
		SetAnchor(frame, anchor)
	end
end

local function Handle_OnDragStart(self)
	local frame = self:GetParent()
	if not CanMove(frame) or not ModifierDown() then return end

	if not Defaults[frame] then
		Defaults[frame] = GetAnchor(frame)
	end

	-- Prevent moving out of the screen
	self.clamped = frame:IsClampedToScreen()
	frame:SetClampedToScreen(true)

	frame:SetMovable(true)
	frame:StartMoving()

	-- True would keep the spot in Blizzards layout cache file
	frame:SetUserPlaced(false)

	self.moving = true
end

local function Handle_OnDragStop(self)
	if not self.moving then return end
	self.moving = nil

	local frame = self:GetParent()

	frame:StopMovingOrSizing()
	frame:SetUserPlaced(false)
	frame:SetMovable(false)
	frame:SetClampedToScreen(self.clamped)

	Positions[frame] = GetAnchor(frame)
end

-- Right click can put a panel back to Blizzard default position
local function Handle_OnMouseUp(self, button)
	if button ~= 'RightButton' or not ModifierDown() then return end

	local frame = self:GetParent()
	local anchor = Positions[frame] and Defaults[frame]
	if not (anchor and CanMove(frame)) then return end

	Positions[frame] = nil
	SetAnchor(frame, anchor)
end

local function AddHandle(name)
	local frame = _G[name]
	if not frame or Handles[frame] or Blocked[name] then return end
	if frame:IsForbidden() or frame:GetParent() ~= UIParent then return end

	if UIPanelWindows[name].area == 'full' then return end

	-- Grab the layout position before we register the move
	if Centered[name] then
		Restored[frame] = GetAnchor(frame)
	end

	local handle = CreateFrame('Frame', nil, frame)
	handle:SetFrameLevel(frame:GetFrameLevel() + 1)
	handle:EnableMouse(true)
	handle:RegisterForDrag('LeftButton')
	handle:SetScript('OnDragStart', Handle_OnDragStart)
	handle:SetScript('OnDragStop', Handle_OnDragStop)
	handle:SetScript('OnMouseUp', Handle_OnMouseUp)
	handle:SetScript('OnShow', Handle_OnShow)

	-- Frames like the Achievement one keep their title bar on a header that sticks out above the panel
	local title = frame.TitleContainer or (frame.BorderFrame and frame.BorderFrame.TitleContainer) or frame.Header or _G[name .. 'Header']
	if not title then
		handle:SetHeight(HANDLE_HEIGHT)
		handle:SetPoint('TOPLEFT', frame, 'TOPLEFT', HANDLE_LEFT, HANDLE_TOP)
		handle:SetPoint('TOPRIGHT', frame, 'TOPRIGHT', HANDLE_RIGHT, HANDLE_TOP)
	elseif title.IsMouseEnabled and title:IsMouseEnabled() then
		handle:SetFrameLevel(title:GetFrameLevel() + 1)
		handle:SetPoint('TOPLEFT', title, 'TOPLEFT')
		handle:SetPoint('BOTTOMRIGHT', title, 'BOTTOMRIGHT', HANDLE_RIGHT, 0)
	else
		handle:SetAllPoints(title)
	end

	Handles[frame] = handle
end

-- Load on demand panels add themselves to the table on ADDON_LOADED
local function AddHandles()
	for name in pairs(UIPanelWindows) do
		AddHandle(name)
	end
end

local function OnEvent(_, event)
	if event == 'ADDON_LOADED' then
		AddHandles()
	elseif event == 'PLAYER_LOGOUT' then
		for frame in pairs(Handles) do
			frame:SetUserPlaced(false)
		end
	else
		ApplyPositions()
	end
end

function Private:MovableFrames()
	if initialized then return end
	if not Private.Addon.db.profile.movableFrames.enable then return end

	AddHandles()

	hooksecurefunc('UpdateUIPanelPositions', ApplyPositions)

	EventFrame = CreateFrame('Frame')
	EventFrame:SetScript('OnEvent', OnEvent)
	EventFrame:RegisterEvent('ADDON_LOADED')
	EventFrame:RegisterEvent('PLAYER_LOGOUT')
	EventFrame:RegisterEvent('PLAYER_REGEN_ENABLED')

	initialized = true
end
