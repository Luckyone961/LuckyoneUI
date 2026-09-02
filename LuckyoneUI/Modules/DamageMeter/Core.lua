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
local IsInGroup = IsInGroup
local UnitAffectingCombat = UnitAffectingCombat

local _G = _G

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
	if not Private.Addon.db.profile.damageMeter.enable then return end

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
local hosts, columns = {}, {}

-- Attached windows leave the main axis
local function BuildColumns(count)
	wipe(hosts)
	wipe(columns)

	for index = 1, count do
		local target = DM:WindowDB(index).attachTo or 0
		local host = (target >= 1 and target <= count and target ~= index) and DM:WindowDB(target)

		hosts[index] = (host and (host.attachTo or 0) == 0) and target or 0

		if hosts[index] == 0 then
			columns[#columns + 1] = index
		end
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
	local holderWidth, holderHeight

	BuildColumns(count)
	local columnCount = #columns

	if db.sizeMode == 'CUSTOM' then
		-- Every column brings its own size, the holder wraps them
		local axis, cross = outer * 2 + (columnCount - 1) * inner, 0

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

		local size = ((vertical and holderHeight or holderWidth) - outer * 2 - (columnCount - 1) * inner) / columnCount

		for _, index in ipairs(columns) do
			widths[index] = vertical and holderWidth or size
			heights[index] = vertical and size or holderHeight
		end
	end

	-- Attached windows take their share of the slot, the host keeps the rest
	local minSize = db.headerHeight + db.barHeight

	for _, index in ipairs(columns) do
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

	holder:Size(holderWidth, holderHeight)

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

			local anchor = window

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
