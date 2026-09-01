local _, Private = ...
local DM = Private.Modules.DamageMeter

if not DM then return end

local L = Private.Libs.ACL

local unpack = unpack
local pairs = pairs

local CreateFrame = CreateFrame
local hooksecurefunc = hooksecurefunc
local SetCVar = C_CVar.SetCVar
local IsInGroup = IsInGroup
local UnitAffectingCombat = UnitAffectingCombat

local _G = _G

local E = unpack(ElvUI)

DM.windows = {}

local function HideBlizzardMeter()
	local meter = _G.DamageMeter
	if not meter or meter:IsForbidden() then return end
	if not Private.Addon.db.profile.damageMeter.enable then return end

	-- Edit Mode needs the system frame visible while editing
	if meter.IsEditing and meter:IsEditing() then return end

	meter:SetShown(false)
end

-- Force the CVar on while enabled, the native meter is our only data source
function DM:HandleBlizzardMeter()
	local meter = _G.DamageMeter
	if not meter or meter:IsForbidden() then return end

	if DM.db.enable then
		SetCVar('damageMeterEnabled', 1)

		if not DM.blizzardHooked then
			hooksecurefunc(meter, 'UpdateShownState', HideBlizzardMeter)
			DM.blizzardHooked = true
		end

		HideBlizzardMeter()
	elseif DM.blizzardHooked then
		-- Hand the frame back to Blizzards own visibility logic
		meter:UpdateShownState()
	end
end

function DM:ShouldShow()
	if not DM.db.enable then return false end

	local visibility = DM.db.visibility

	if visibility == 'COMBAT' then
		return UnitAffectingCombat('player')
	elseif visibility == 'GROUP' then
		return IsInGroup()
	end

	return true
end

function DM:UpdateShown()
	if not DM.holder then return end

	local shown = DM:ShouldShow()
	DM.holder:SetShown(shown)

	if shown and not DM.lastShown then
		DM:MarkAllDirty()
	end

	DM.lastShown = shown
end

-- Windows split the holder, one window takes the full width, two share it
function DM:Layout()
	local db = DM.db
	local holder = DM.holder
	if not holder then return end

	local width, height
	if db.syncSize then
		local chat = E.db.chat
		width = chat.separateSizes and chat.panelWidthRight or chat.panelWidth
		height = chat.separateSizes and chat.panelHeightRight or chat.panelHeight
	else
		width, height = db.width, db.height
	end

	holder:Size(width, height)

	local count = db.secondWindow and 2 or 1
	local windowWidth = (width - (count - 1) * db.innerSpacing) / count

	for index, window in pairs(DM.windows) do
		if index <= count then
			window:ClearAllPoints()
			window:Size(windowWidth, height)

			if index == 1 then
				window:Point('TOPLEFT', holder, 'TOPLEFT', 0, 0)
			else
				window:Point('TOPRIGHT', holder, 'TOPRIGHT', 0, 0)
			end

			DM:UpdateWindowGeometry(window, windowWidth, height)
			window:Show()
		else
			window:Hide()
		end
	end
end

function DM:Initialize()
	if DM.initialized then return end
	DM.initialized = true

	local holder = CreateFrame('Frame', 'LuckyoneUI_DamageMeterHolder', E.UIParent)
	holder:SetFrameStrata('LOW')
	holder:Point('BOTTOMRIGHT', _G.RightChatPanel or E.UIParent, 'BOTTOMRIGHT', 0, 0)
	DM.holder = holder

	E:CreateMover(holder, 'LuckyoneUI_DamageMeterMover', L["Damage Meter"], nil, nil, nil, 'ALL,GENERAL', nil, 'LuckyoneUI,damageMeter')

	-- Follow chat panel resizing while synced
	hooksecurefunc(E:GetModule('Chat'), 'PositionChats', function()
		if DM.db.enable and DM.db.syncSize then
			DM:Layout()
		end
	end)

	E.valueColorUpdateFuncs.LuckyoneUI_DamageMeterModule = function()
		if DM.db.enable and DM.db.useValueColor then
			for _, window in pairs(DM.windows) do
				DM:UpdateHeaderColors(window)
			end
		end
	end

	DM:RegisterEvent('DAMAGE_METER_COMBAT_SESSION_UPDATED')
	DM:RegisterEvent('DAMAGE_METER_CURRENT_SESSION_UPDATED')
	DM:RegisterEvent('DAMAGE_METER_RESET')
	DM:RegisterEvent('PLAYER_REGEN_DISABLED')
	DM:RegisterEvent('PLAYER_REGEN_ENABLED')
	DM:RegisterEvent('GROUP_ROSTER_UPDATE')
	DM:RegisterEvent('PLAYER_ENTERING_WORLD')
end

function DM:PLAYER_ENTERING_WORLD()
	DM:HandleBlizzardMeter()
	DM:UpdateShown()
	DM:MarkAllDirty()
end

function DM:PLAYER_REGEN_DISABLED()
	DM:UpdateShown()
end

-- Re-render after combat, the amounts stop being secret so the share comes back
function DM:PLAYER_REGEN_ENABLED()
	DM:UpdateShown()
	DM:MarkAllDirty()
end

function DM:GROUP_ROSTER_UPDATE()
	DM:UpdateShown()
end

function Private:DamageMeter_UpdateAll()
	local db = Private.Addon.db.profile.damageMeter
	DM.db = db

	DM:HandleBlizzardMeter()

	if not db.enable then
		if DM.holder then
			DM.holder:Hide()
			DM.lastShown = false
		end
		return
	end

	DM:Initialize()

	DM:GetWindow(1)
	if db.secondWindow then
		DM:GetWindow(2)
	end

	for _, window in pairs(DM.windows) do
		DM:ApplyWindowSettings(window)
	end

	DM:Layout()
	DM:UpdateShown()
	DM:MarkAllDirty()
end

function DM:OnEnable()
	Private:DamageMeter_UpdateAll()
end
