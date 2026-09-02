local _, Private = ...
local DM = Private.Modules.DamageMeter

if not DM then return end

local L = Private.Libs.ACL

local unpack = unpack
local pairs = pairs
local wipe = wipe
local max = math.max

local Ambiguate = Ambiguate
local CreateFrame = CreateFrame
local hooksecurefunc = hooksecurefunc
local SetCVar = C_CVar.SetCVar
local IsInGroup = IsInGroup
local UnitAffectingCombat = UnitAffectingCombat

local _G = _G

local E = unpack(ElvUI)

DM.windows = {}

function DM:WindowDB(index)
	return DM.db.windows[index]
end

-- Ambiguate accepts secret names, string functions don't
function DM:StripRealm(name, classFilename)
	if not name or not DM.db.stripRealm then return name end
	if not classFilename or classFilename == '' then return name end

	return Ambiguate(name, 'short')
end

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

-- Use ElvUI backdrop faded color db
function DM:UpdateBackdrop()
	if not DM.holder then return end

	if not DM.holder.backdrop then
		DM.holder:CreateBackdrop('Transparent', nil, nil, nil, nil, nil, nil, true)
	end

	DM.holder.backdrop:SetShown(DM.db.backdrop)
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

local widths, heights = {}, {}

-- Windows are laid out along one axis, the holder wraps them
function DM:Layout()
	local db = DM.db
	local holder = DM.holder
	if not holder then return end

	local vertical = db.orientation == 'VERTICAL'
	local count = db.windowCount
	local inner, outer = db.innerSpacing, db.outerSpacing
	local holderWidth, holderHeight

	if db.sizeMode == 'CUSTOM' then
		-- Every window brings its own size, the holder wraps them
		local axis, cross = outer * 2 + (count - 1) * inner, 0

		for index = 1, count do
			local wdb = DM:WindowDB(index)
			widths[index], heights[index] = wdb.width, wdb.height

			axis = axis + (vertical and wdb.height or wdb.width)
			cross = max(cross, vertical and wdb.width or wdb.height)
		end

		holderWidth = vertical and cross or axis
		holderHeight = vertical and axis or cross
	else
		-- The holder size is given, the windows split it evenly
		if db.sizeMode == 'CHAT' then
			local chat = E.db.chat
			holderWidth = chat.separateSizes and chat.panelWidthRight or chat.panelWidth
			holderHeight = chat.separateSizes and chat.panelHeightRight or chat.panelHeight
		else
			holderWidth, holderHeight = db.width, db.height
		end

		local size = ((vertical and holderHeight or holderWidth) - outer * 2 - (count - 1) * inner) / count

		for index = 1, count do
			widths[index] = vertical and holderWidth or size
			heights[index] = vertical and size or holderHeight
		end
	end

	holder:Size(holderWidth, holderHeight)

	for index = 1, count do
		local window = DM.windows[index]
		if window then
			window:ClearAllPoints()
			window:Size(widths[index], heights[index])

			if index == 1 then
				window:Point('TOPLEFT', holder, 'TOPLEFT', vertical and 0 or outer, vertical and -outer or 0)
			elseif vertical then
				window:Point('TOPLEFT', DM.windows[index - 1], 'BOTTOMLEFT', 0, -inner)
			else
				window:Point('TOPLEFT', DM.windows[index - 1], 'TOPRIGHT', inner, 0)
			end

			window:Show()
		end
	end

	for index, window in pairs(DM.windows) do
		if index > count then
			window:Hide()
		else
			DM:UpdateWindowGeometry(window, widths[index], heights[index])
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

	E:CreateMover(holder, 'LuckyoneUI_DamageMeterMover', Private.Name .. ' ' .. L["Damage Meter"], nil, nil, nil, 'ALL,GENERAL', nil, 'LuckyoneUI,damageMeter')

	-- Follow ElvUI resizing while the "Chat Panel" size mode is used
	hooksecurefunc(E:GetModule('Chat'), 'PositionChats', function()
		if DM.db.enable and DM.db.sizeMode == 'CHAT' then
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

-- Re-render after combat when the amounts stop being secret
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

	for index = 1, db.windowCount do
		DM:GetWindow(index)
	end

	for _, window in pairs(DM.windows) do
		DM:ApplyWindowSettings(window)
	end

	DM:Layout()
	DM:UpdateBackdrop()
	DM:UpdateShown()
	DM:MarkAllDirty()
end

-- Restore profile defaults config button
function Private:DamageMeter_ResetDefaults()
	local db = Private.Addon.db.profile.damageMeter
	local enable = db.enable

	wipe(db)
	E:CopyTable(db, Private.Defaults.profile.damageMeter)

	-- Restoring the look should not switch the module off
	db.enable = enable

	for _, window in pairs(DM.windows) do
		DM:CloseDrilldown(window)

		window.meterType = nil
		window.sessionType = nil
		window.sessionID = nil
		window.offset = 0
	end

	Private:DamageMeter_UpdateAll()
end

function DM:OnEnable()
	Private:DamageMeter_UpdateAll()
end
