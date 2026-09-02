local _, Private = ...
local DM = Private.Modules.DamageMeter

if not DM then return end

local L = Private.Libs.ACL

local unpack = unpack
local format = string.format
local ipairs = ipairs
local pairs = pairs
local max = math.max
local min = math.min

local CreateFrame = CreateFrame
local GetAvailableCombatSessions = C_DamageMeter.GetAvailableCombatSessions
local GetCombatSessionFromID = C_DamageMeter.GetCombatSessionFromID
local GetCombatSessionFromType = C_DamageMeter.GetCombatSessionFromType
local GetCombatSessionSourceFromID = C_DamageMeter.GetCombatSessionSourceFromID
local GetCombatSessionSourceFromType = C_DamageMeter.GetCombatSessionSourceFromType
local ResetAllCombatSessions = C_DamageMeter.ResetAllCombatSessions
local After = C_Timer.After
local SecondsToClock = SecondsToClock
local MenuUtil = MenuUtil
local MenuVariants = MenuVariants
local Menu = Menu
local CreateAnchor = AnchorUtil.CreateAnchor
local issecretvalue = issecretvalue or function() return false end

local _G = _G

local E = unpack(ElvUI)

local MeterType = Enum.DamageMeterType
local SessionType = Enum.DamageMeterSessionType

-- Localized names come from GlobalStrings, same source as the Blizzard meter
-- https://github.com/Gethe/wow-ui-source/blob/live/Interface/AddOns/Blizzard_DamageMeter/DamageMeterSessionWindow.lua#L1-L46
DM.TypeNames = {
	[MeterType.DamageDone] = _G.DAMAGE_METER_TYPE_DAMAGE_DONE,
	[MeterType.Dps] = _G.DAMAGE_METER_TYPE_DPS,
	[MeterType.HealingDone] = _G.DAMAGE_METER_TYPE_HEALING_DONE,
	[MeterType.Hps] = _G.DAMAGE_METER_TYPE_HPS,
	[MeterType.Absorbs] = _G.DAMAGE_METER_TYPE_ABSORBS,
	[MeterType.Interrupts] = _G.DAMAGE_METER_TYPE_INTERRUPTS,
	[MeterType.Dispels] = _G.DAMAGE_METER_TYPE_DISPELS,
	[MeterType.DamageTaken] = _G.DAMAGE_METER_TYPE_DAMAGE_TAKEN,
	[MeterType.AvoidableDamageTaken] = _G.DAMAGE_METER_TYPE_AVOIDABLE_DAMAGE_TAKEN,
	[MeterType.Deaths] = _G.DAMAGE_METER_TYPE_DEATHS,
	[MeterType.EnemyDamageTaken] = _G.DAMAGE_METER_TYPE_ENEMY_DAMAGE_TAKEN,
}

DM.TypeCategories = {
	{ name = _G.DAMAGE_METER_CATEGORY_DAMAGE, types = { MeterType.DamageDone, MeterType.Dps, MeterType.DamageTaken, MeterType.AvoidableDamageTaken, MeterType.EnemyDamageTaken } },
	{ name = _G.DAMAGE_METER_CATEGORY_HEALING, types = { MeterType.HealingDone, MeterType.Hps } },
	{ name = _G.DAMAGE_METER_CATEGORY_ACTIONS, types = { MeterType.Interrupts, MeterType.Dispels, MeterType.Deaths } },
}

DM.TypePerSecondPrimary = {
	[MeterType.Dps] = true,
	[MeterType.Hps] = true,
}

DM.TypeSuppressPerSecond = {
	[MeterType.Interrupts] = true,
	[MeterType.Dispels] = true,
	[MeterType.Deaths] = true,
}

DM.TypeSuppressIcon = {
	[MeterType.EnemyDamageTaken] = true,
}

function DM:FetchWindow(window)
	if window.mode == 'spells' then
		if window.sessionType then
			window.session = GetCombatSessionSourceFromType(window.sessionType, window.meterType, window.drillGUID, window.drillCreatureID)
		elseif window.sessionID then
			window.session = GetCombatSessionSourceFromID(window.sessionID, window.meterType, window.drillGUID, window.drillCreatureID)
		end
	else
		if window.sessionType then
			window.session = GetCombatSessionFromType(window.sessionType, window.meterType)
		elseif window.sessionID then
			window.session = GetCombatSessionFromID(window.sessionID, window.meterType)
		end
	end
end

local pendingFlush = false
local function Flush()
	pendingFlush = false

	for _, window in pairs(DM.windows) do
		if window.dirty and window:IsVisible() then
			window.dirty = false
			DM:FetchWindow(window)
			DM:RenderWindow(window)
		end
	end
end

function DM:MarkDirty(window)
	window.dirty = true

	if not pendingFlush then
		pendingFlush = true
		After(0.25, Flush)
	end
end

function DM:MarkAllDirty()
	for _, window in pairs(DM.windows) do
		DM:MarkDirty(window)
	end
end

function DM:DAMAGE_METER_COMBAT_SESSION_UPDATED(_, meterType, sessionID)
	for _, window in pairs(DM.windows) do
		if window.meterType == meterType then
			if window.sessionID == sessionID or (sessionID == 0 and window.sessionType ~= nil) then
				DM:MarkDirty(window)
			end
		end
	end
end

function DM:DAMAGE_METER_CURRENT_SESSION_UPDATED()
	for _, window in pairs(DM.windows) do
		if window.sessionType == SessionType.Current then
			window.offset = 0
			DM:MarkDirty(window)
		end
	end
end

function DM:DAMAGE_METER_RESET()
	for _, window in pairs(DM.windows) do
		window.offset = 0
		DM:MarkDirty(window)
	end
end

-- Header text and colors
function DM:UpdateHeader(window)
	if window.mode == 'spells' then
		window.typeText:SetFormattedText('< %s', DM:StripRealm(window.drillName, window.drillClass) or _G.UNKNOWN)
	else
		window.typeText:SetText(DM.TypeNames[window.meterType])
	end

	local sessionText
	if window.sessionType == SessionType.Current then
		sessionText = _G.DAMAGE_METER_CURRENT_SESSION_SHORT
	elseif window.sessionType == SessionType.Overall then
		sessionText = _G.DAMAGE_METER_OVERALL_SESSION_SHORT
	else
		sessionText = window.sessionID
	end

	window.sessionText:SetText(sessionText)
end

function DM:UpdateHeaderColors(window)
	local r, g, b = 1, 1, 1
	if DM.db.useValueColor then
		r, g, b = unpack(E.media.rgbvaluecolor)
	end

	window.typeText:SetTextColor(r, g, b)
	window.sessionText:SetTextColor(r, g, b)
end

-- Session changes
function DM:SetWindowType(window, meterType)
	window.meterType = meterType
	window.mode = 'sources'
	window.offset = 0

	local wdb = window.index == 1 and DM.db.windowOne or DM.db.windowTwo
	wdb.meterType = meterType

	DM:UpdateHeader(window)
	DM:FetchWindow(window)
	DM:RenderWindow(window)
end

function DM:SetWindowSession(window, sessionType, sessionID)
	window.sessionType = sessionType
	window.sessionID = sessionID
	window.mode = 'sources'
	window.offset = 0

	-- Session IDs are per login session and intentionally not persisted
	local wdb = window.index == 1 and DM.db.windowOne or DM.db.windowTwo
	wdb.sessionType = sessionType

	DM:UpdateHeader(window)
	DM:FetchWindow(window)
	DM:RenderWindow(window)
end

-- Drill-down into a single source
function DM:OpenDrilldown(window, entry)
	-- Death entries open the Blizzard death recap instead
	if entry.deathRecapID and entry.deathRecapID ~= 0 then
		_G.OpenDeathRecapUI(entry.deathRecapID)
		return
	end

	-- Secret identifiers cannot be passed back into the API while restricted
	if issecretvalue(entry.sourceGUID) or issecretvalue(entry.sourceCreatureID) then return end
	if not entry.sourceGUID and not entry.sourceCreatureID then return end

	window.mode = 'spells'
	window.drillGUID = entry.sourceGUID
	window.drillCreatureID = entry.sourceCreatureID
	window.drillName = entry.name
	window.drillClass = entry.classFilename
	window.offset = 0

	DM:UpdateHeader(window)
	DM:FetchWindow(window)
	DM:RenderWindow(window)
end

function DM:CloseDrilldown(window)
	if window.mode ~= 'spells' then return end

	window.mode = 'sources'
	window.drillGUID = nil
	window.drillCreatureID = nil
	window.drillName = nil
	window.drillClass = nil
	window.offset = 0

	DM:UpdateHeader(window)
	DM:FetchWindow(window)
	DM:RenderWindow(window)
end

-- Menus
local function IsTypeSelected(data)
	return data.window.meterType == data.meterType
end

local function SetTypeSelected(data)
	DM:SetWindowType(data.window, data.meterType)
end

local function TypeMenu(owner, rootDescription)
	rootDescription:SetTag('MENU_LUCKYONEUI_DAMAGE_METER_TYPE')

	for _, category in ipairs(DM.TypeCategories) do
		local submenu = rootDescription:CreateButton(category.name)

		for _, meterType in ipairs(category.types) do
			submenu:CreateRadio(DM.TypeNames[meterType], IsTypeSelected, SetTypeSelected, { window = owner.window, meterType = meterType })
		end
	end
end

local function IsSessionSelected(data)
	return data.window.sessionType == data.sessionType and data.window.sessionID == data.sessionID
end

local function SetSessionSelected(data)
	DM:SetWindowSession(data.window, data.sessionType, data.sessionID)
end

local function SessionMenu(owner, rootDescription)
	rootDescription:SetTag('MENU_LUCKYONEUI_DAMAGE_METER_SESSION')

	local window = owner.window

	for _, session in ipairs(GetAvailableCombatSessions()) do
		local name = session.name
		if not name or name == '' then
			name = format(_G.DAMAGE_METER_COMBAT_NUMBER, session.sessionID)
		end

		if session.durationSeconds then
			name = format('%s [%s]', name, SecondsToClock(session.durationSeconds))
		end

		rootDescription:CreateRadio(name, IsSessionSelected, SetSessionSelected, { window = window, sessionID = session.sessionID })
	end

	rootDescription:CreateDivider()
	rootDescription:CreateRadio(_G.DAMAGE_METER_CURRENT_SESSION, IsSessionSelected, SetSessionSelected, { window = window, sessionType = SessionType.Current })
	rootDescription:CreateRadio(_G.DAMAGE_METER_OVERALL_SESSION, IsSessionSelected, SetSessionSelected, { window = window, sessionType = SessionType.Overall })
end

local function SettingsMenu(_, rootDescription)
	rootDescription:SetTag('MENU_LUCKYONEUI_DAMAGE_METER_SETTINGS')

	rootDescription:CreateButton(_G.DAMAGE_METER_RESET_ALL_SESSIONS, ResetAllCombatSessions)
	rootDescription:CreateDivider()
	rootDescription:CreateButton(Private.Name .. ' ' .. L["Options"], function()
		E:ToggleOptions('LuckyoneUI,damageMeter')
	end)
end

-- Anchored above the window instead of at the cursor, the manager flips them
-- back down on its own when there is no room left on screen
local function OpenMenu(button, generator, alignRight)
	local rootDescription = MenuUtil.CreateRootMenuDescription(MenuVariants.GetDefaultContextMenuMixin())
	Menu.PopulateDescription(generator, button, rootDescription)

	local point, relativePoint = 'BOTTOMLEFT', 'TOPLEFT'
	if alignRight then
		point, relativePoint = 'BOTTOMRIGHT', 'TOPRIGHT'
	end

	local anchor = CreateAnchor(point, button.window, relativePoint, -1, -4)
	Menu.GetManager():OpenMenu(button, rootDescription, anchor)
end

local function TypeButton_OnClick(button)
	local window = button.window

	if window.mode == 'spells' then
		DM:CloseDrilldown(window)
	else
		OpenMenu(button, TypeMenu)
	end
end

local function SessionButton_OnClick(button)
	OpenMenu(button, SessionMenu, true)
end

local function CogButton_OnClick(button)
	OpenMenu(button, SettingsMenu, true)
end

local function CogButton_OnEnter(button)
	button:GetNormalTexture():SetVertexColor(unpack(E.media.rgbvaluecolor))
end

local function CogButton_OnLeave(button)
	button:GetNormalTexture():SetVertexColor(1, 1, 1)
end

-- Mouse wheel scrolling, no scrollbar
local function Content_OnMouseWheel(content, delta)
	local window = content.window
	local session = window.session
	local entries = session and (window.mode == 'spells' and session.combatSpells or session.combatSources)
	local numEntries = entries and #entries or 0

	local offset = min(max(0, numEntries - window.visibleCount), max(0, window.offset - delta))
	if offset ~= window.offset then
		window.offset = offset
		DM:RenderWindow(window)
	end
end

local function Content_OnMouseDown(content, button)
	if button == 'RightButton' then
		DM:CloseDrilldown(content.window)
	end
end

function DM:GetWindow(index)
	local window = DM.windows[index]
	if window then return window end

	window = CreateFrame('Frame', 'LuckyoneUI_DamageMeterWindow' .. index, DM.holder)
	window.index = index
	window.offset = 0
	window.mode = 'sources'
	window.bars = {}
	window.visibleCount = 0

	local header = CreateFrame('Frame', nil, window)
	header:Point('TOPLEFT')
	header:Point('TOPRIGHT')
	window.header = header

	local cogButton = CreateFrame('Button', nil, header)
	cogButton:Point('RIGHT', header, 'RIGHT', -2, 0)
	cogButton:SetNormalAtlas('GM-icon-settings')
	cogButton:SetScript('OnClick', CogButton_OnClick)
	cogButton:SetScript('OnEnter', CogButton_OnEnter)
	cogButton:SetScript('OnLeave', CogButton_OnLeave)
	cogButton.window = window
	window.cogButton = cogButton

	-- The atlas carries padding, oversize it like the ElvUI skin does
	window.cogIcon = cogButton:GetNormalTexture()
	window.cogIcon:ClearAllPoints()
	window.cogIcon:Point('CENTER')

	local sessionButton = CreateFrame('Button', nil, header)
	sessionButton:Point('RIGHT', cogButton, 'LEFT', 0, 0)
	sessionButton:SetScript('OnClick', SessionButton_OnClick)
	sessionButton.window = window
	window.sessionButton = sessionButton

	window.sessionText = sessionButton:CreateFontString(nil, 'OVERLAY')
	window.sessionText:SetJustifyH('CENTER')
	window.sessionText:SetAllPoints()

	local typeButton = CreateFrame('Button', nil, header)
	typeButton:Point('TOPLEFT', header, 'TOPLEFT', 2, 0)
	typeButton:Point('BOTTOMRIGHT', sessionButton, 'BOTTOMLEFT', -4, 0)
	typeButton:SetScript('OnClick', TypeButton_OnClick)
	typeButton.window = window
	window.typeButton = typeButton

	window.typeText = typeButton:CreateFontString(nil, 'OVERLAY')
	window.typeText:SetJustifyH('LEFT')
	window.typeText:SetWordWrap(false)
	window.typeText:SetAllPoints()

	local content = CreateFrame('Frame', nil, window)
	content:Point('TOPLEFT', window.header, 'BOTTOMLEFT', 0, 0)
	content:Point('BOTTOMRIGHT', window, 'BOTTOMRIGHT', 0, 0)
	content:EnableMouseWheel(true)
	content:SetScript('OnMouseWheel', Content_OnMouseWheel)
	content:SetScript('OnMouseDown', Content_OnMouseDown)
	content.window = window
	window.content = content

	window.infoText = content:CreateFontString(nil, 'OVERLAY')
	window.infoText:SetJustifyH('CENTER')
	window.infoText:Point('CENTER')

	DM.windows[index] = window
	return window
end

function DM:ApplyWindowSettings(window)
	local db = DM.db
	local wdb = window.index == 1 and db.windowOne or db.windowTwo

	if window.meterType == nil then
		window.meterType = wdb.meterType
	end

	if window.sessionType == nil and window.sessionID == nil then
		window.sessionType = wdb.sessionType
	end

	window.header:Height(db.headerHeight)
	local cogSize = min(db.headerHeight - 2, db.fontSize + 4)
	window.cogButton:Size(cogSize)
	window.cogIcon:Size(db.fontSize * 2)
	window.sessionButton:Size(26, db.headerHeight)

	window.typeText:FontTemplate(db.font, db.fontSize, db.fontOutline)
	window.sessionText:FontTemplate(db.font, db.fontSize, db.fontOutline)
	window.infoText:FontTemplate(db.font, db.fontSize, db.fontOutline)

	DM:UpdateHeaderColors(window)
	DM:UpdateHeader(window)
end
