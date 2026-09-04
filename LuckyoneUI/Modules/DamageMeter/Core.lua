local _, Private = ...
local DM = Private.Modules.DamageMeter

if not DM then return end

local L = Private.Libs.ACL

local unpack = unpack
local pairs = pairs
local ipairs = ipairs
local wipe = wipe
local max = math.max
local min = math.min
local floor = math.floor

local Ambiguate = Ambiguate
local CreateFrame = CreateFrame
local hooksecurefunc = hooksecurefunc
local SetCVar = C_CVar.SetCVar
local GetInstanceInfo = GetInstanceInfo
local IsInGroup = IsInGroup
local UnitAffectingCombat = UnitAffectingCombat
local ResetAllCombatSessions = C_DamageMeter.ResetAllCombatSessions

local _G = _G
local StaticPopup_Show = _G.StaticPopup_Show

local E = unpack(ElvUI)

DM.windows = {}

function DM:WindowDB(index)
	return DM.db.windows[index]
end

-- Ambiguate accepts secret names
function DM:StripRealm(name, classFilename)
	if not name or not DM.db.stripRealm then return name end
	if not classFilename or classFilename == '' then return name end

	return Ambiguate(name, 'short')
end

local function HideBlizzardMeter()
	local meter = _G.DamageMeter
	if not meter or meter:IsForbidden() then return end
	if not DM.db.enable then return end

	-- Edit Mode needs the system frame visible while editing
	if meter.IsEditing and meter:IsEditing() then return end

	meter:SetShown(false) -- Same as "Hidden" visibility in Edit Mode settings
end

-- The native meter is our only data source, mirror the CVar with our module state
function DM:HandleBlizzardMeter()
	SetCVar('damageMeterEnabled', DM.db.enable and 1 or 0)

	local meter = _G.DamageMeter
	if not meter or meter:IsForbidden() then return end

	if DM.db.enable then
		if not DM.blizzardHooked then
			hooksecurefunc(meter, 'UpdateShownState', HideBlizzardMeter)
			DM.blizzardHooked = true
		end

		HideBlizzardMeter()
	elseif DM.blizzardHooked then
		meter:UpdateShownState()
	end
end

function DM:ShouldShow()
	if not DM.db.enable then return false end

	-- The preview ignores the visibility rule, same as Edit Mode
	if DM.testMode then return true end

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

-- A reload always drops back to the live data
function DM:SetTestMode(value)
	DM.testMode = value or nil

	-- Fake data has no spell entries
	for _, window in pairs(DM.windows) do
		DM:CloseDrilldown(window)
		window.offset = 0
	end

	Private:DamageMeter_UpdateAll()
end

local widths, heights = {}, {}
local hosts, columns, floating = {}, {}, {}

local function BuildRoots(count)
	wipe(hosts)
	wipe(columns)
	wipe(floating)

	for index = 1, count do
		local wdb = DM:WindowDB(index)
		local target = (wdb.placement == 'ATTACH' and wdb.attachTo) or 0
		local host = (target >= 1 and target <= count and target ~= index) and DM:WindowDB(target)

		hosts[index] = (host and host.placement ~= 'ATTACH') and target or 0

		if hosts[index] == 0 then
			local list = wdb.placement == 'CUSTOM' and floating or columns
			list[#list + 1] = index
		end
	end
end

local function SplitSlot(index, count, vertical, inner, minSize)
	local remaining = vertical and widths[index] or heights[index]

	for child = 1, count do
		if hosts[child] == index then
			remaining = remaining - inner

			local share = floor(remaining * (DM:WindowDB(child).attachSize or 50) / 100 + 0.5)
			share = max(min(share, remaining - minSize), minSize)
			remaining = remaining - share

			widths[child] = vertical and share or widths[index]
			heights[child] = vertical and heights[index] or share
		end
	end

	remaining = max(remaining, minSize)

	if vertical then
		widths[index] = remaining
	else
		heights[index] = remaining
	end
end

local function PlaceAttached(index, count, vertical, inner)
	local anchor = DM.windows[index]

	for child = 1, count do
		if hosts[child] == index then
			local sub = DM.windows[child]
			if sub then
				sub:ClearAllPoints()
				sub:Size(widths[child], heights[child])

				if vertical then
					sub:Point('TOPLEFT', anchor, 'TOPRIGHT', inner, 0)
				else
					sub:Point('TOPLEFT', anchor, 'BOTTOMLEFT', 0, -inner)
				end

				sub:Show()
				anchor = sub
			end
		end
	end
end

-- Nothing is anchored to the main holder when every window is in custom mode
local function UpdateHolderMover(enabled)
	local name = 'LuckyoneUI_DamageMeterMover'

	if enabled then
		if E.DisabledMovers[name] then
			E:EnableMover(name)
		end
	elseif E.CreatedMovers[name] then
		E:DisableMover(name)
	end
end

-- Custom placed windows are dragged around with their own mover
local function UpdateWindowMover(window, index, custom)
	local name = 'LuckyoneUI_DamageMeterWindow' .. index .. 'Mover'

	if not custom then
		if window.mover and E.CreatedMovers[name] then
			E:DisableMover(name)
		end
	elseif window.mover then
		if E.DisabledMovers[name] then
			E:EnableMover(name)
		end

		E:SetMoverPoints(name, window)
	else
		-- The mover spawns wherever the window sits right now
		if not window:GetPoint() then
			window:Point('TOPLEFT', DM.holder, 'TOPLEFT', 0, 0)
		end

		E:CreateMover(window, name, Private.Name .. ' ' .. L["Damage Meter"] .. ' ' .. index, nil, nil, nil, 'ALL,GENERAL', nil, 'LuckyoneUI,damageMeter')
	end
end

-- Columns are laid out along one axis, the holder wraps them
function DM:Layout()
	local db = DM.db
	local holder = DM.holder
	if not holder then return end

	local vertical = db.orientation == 'VERTICAL'
	local count = db.windowCount
	local inner, outer = db.innerSpacing, db.outerSpacing
	local minSize = db.headerHeight + db.barHeight
	local holderWidth, holderHeight

	BuildRoots(count)
	local columnCount = #columns

	if db.sizeMode == 'CUSTOM' then
		-- Every column brings its own size, the holder wraps them
		local axis, cross = outer * 2 + max(columnCount - 1, 0) * inner, 0

		for _, index in ipairs(columns) do
			local wdb = DM:WindowDB(index)
			widths[index], heights[index] = wdb.width, wdb.height

			axis = axis + (vertical and wdb.height or wdb.width)
			cross = max(cross, vertical and wdb.width or wdb.height)
		end

		holderWidth = vertical and cross or axis
		holderHeight = vertical and axis or cross
	else
		-- The holder size is given, the columns split it evenly
		if db.sizeMode == 'CHAT' then
			local chat = E.db.chat
			holderWidth = chat.separateSizes and chat.panelWidthRight or chat.panelWidth
			holderHeight = chat.separateSizes and chat.panelHeightRight or chat.panelHeight
		else
			holderWidth, holderHeight = db.width, db.height
		end

		if columnCount > 0 then
			local size = ((vertical and holderHeight or holderWidth) - outer * 2 - (columnCount - 1) * inner) / columnCount

			for _, index in ipairs(columns) do
				widths[index] = vertical and holderWidth or size
				heights[index] = vertical and size or holderHeight
			end
		end
	end

	-- Custom placed windows always bring their own size
	for _, index in ipairs(floating) do
		local wdb = DM:WindowDB(index)
		widths[index], heights[index] = wdb.width, wdb.height
	end

	for _, index in ipairs(columns) do
		SplitSlot(index, count, vertical, inner, minSize)
	end

	for _, index in ipairs(floating) do
		SplitSlot(index, count, vertical, inner, minSize)
	end

	holder:Size(max(holderWidth, minSize), max(holderHeight, minSize))

	local previous

	for _, index in ipairs(columns) do
		local window = DM.windows[index]
		if window then
			window:ClearAllPoints()
			window:Size(widths[index], heights[index])

			if not previous then
				window:Point('TOPLEFT', holder, 'TOPLEFT', vertical and 0 or outer, vertical and -outer or 0)
			elseif vertical then
				window:Point('TOPLEFT', previous, 'BOTTOMLEFT', 0, -inner)
			else
				window:Point('TOPLEFT', previous, 'TOPRIGHT', inner, 0)
			end

			window:Show()
			previous = window

			PlaceAttached(index, count, vertical, inner)
		end
	end

	-- The mover owns the position, the layout only keeps the size
	for _, index in ipairs(floating) do
		local window = DM.windows[index]
		if window then
			window:Size(widths[index], heights[index])
			window:Show()

			PlaceAttached(index, count, vertical, inner)
		end
	end

	for index, window in pairs(DM.windows) do
		if index > count then
			UpdateWindowMover(window, index, false)
			window:Hide()
		else
			UpdateWindowMover(window, index, DM:WindowDB(index).placement == 'CUSTOM')
			DM:UpdateWindowGeometry(window, widths[index], heights[index])
		end
	end

	UpdateHolderMover(columnCount > 0)
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
			DM:RefreshAll()
		end
	end)

	E.valueColorUpdateFuncs.LuckyoneUI_DamageMeterModule = function()
		if DM.db.enable and DM.db.useValueColor then
			for _, window in pairs(DM.windows) do
				DM:UpdateHeaderColors(window)
			end
		end
	end

	-- Make sure both WindTools modules are off
	-- Their layout forces Blizzard Meter to be shown
	if Private.IsAddOnLoaded('ElvUI_WindTools') then
		E.db.WT.combat.damageMeterLayout.enable = false
		E.private.WT.skins.damageMeter.enable = false
	end

	DM:RegisterEvent('DAMAGE_METER_COMBAT_SESSION_UPDATED')
	DM:RegisterEvent('DAMAGE_METER_CURRENT_SESSION_UPDATED')
	DM:RegisterEvent('DAMAGE_METER_RESET')
	DM:RegisterEvent('PLAYER_REGEN_DISABLED')
	DM:RegisterEvent('PLAYER_REGEN_ENABLED')
	DM:RegisterEvent('GROUP_ROSTER_UPDATE')
	DM:RegisterEvent('PLAYER_ENTERING_WORLD')
end

-- Reset data popup
-- StaticPopup_Show('LUCKYONE_DM_RESET')
_G.StaticPopupDialogs['LUCKYONE_DM_RESET'] = {
	text = Private.Name .. ' ' .. L["Damage Meter"] .. '|n|n' .. L["Reset all data?"],
	button1 = OKAY,
	button2 = CANCEL,
	OnAccept = ResetAllCombatSessions,
	whileDead = 1,
	hideOnEscape = 1,
	preferredIndex = 3,
}

local InstanceScopes = {
	party = 'PARTY',
	raid = 'RAID',
}

-- Offer a data reset when the instance actually changes
function DM:CheckAutoReset(initLogin, isReload)
	-- The events stay registered after the module is switched off
	if not DM.db.enable then return end

	local _, instanceType, _, _, _, _, _, instanceID = GetInstanceInfo()
	local scope = InstanceScopes[instanceType]
	local last = DM.lastInstanceID

	-- Track where we are even while the option is off
	DM.lastInstanceID = scope and instanceID or nil

	if initLogin or isReload then return end
	if not scope or instanceID == last then return end

	local mode = DM.db.autoReset
	if mode == 'NONE' then return end

	local wanted = DM.db.autoResetType
	if wanted ~= 'BOTH' and wanted ~= scope then return end

	if mode == 'AUTO' then
		ResetAllCombatSessions()
	else
		StaticPopup_Show('LUCKYONE_DM_RESET')
	end
end

function DM:PLAYER_ENTERING_WORLD(_, initLogin, isReload)
	DM:HandleBlizzardMeter()
	DM:UpdateShown()
	DM:MarkAllDirty()
	DM:CheckAutoReset(initLogin, isReload)
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
		DM:ApplyWindowSettings(DM:GetWindow(index))
	end

	DM:Layout()
	DM:UpdateShown()
	DM:RefreshAll()
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
