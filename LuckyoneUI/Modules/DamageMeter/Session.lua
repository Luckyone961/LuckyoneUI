local _, Private = ...
local DM = Private.Modules.DamageMeter

if not DM then return end

local unpack = unpack
local format = string.format
local ipairs = ipairs
local pairs = pairs
local max = math.max
local min = math.min
local floor = math.floor

local CreateFrame = CreateFrame
local DoesAncestryIncludeAny = DoesAncestryIncludeAny
local GetCursorPosition = GetCursorPosition
local GetMouseFoci = GetMouseFoci
local IsShiftKeyDown = IsShiftKeyDown
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
local ScrollBarMixin = ScrollBarMixin
local CreateAnchor = AnchorUtil.CreateAnchor
local issecretvalue = issecretvalue or function() return false end

local _G = _G
local StaticPopup_Show = _G.StaticPopup_Show

local E = unpack(ElvUI)
local S = E:GetModule('Skins')

local ICON_RESET = Private.IconPath .. 'DM_Reset.png'
local ICON_SESSIONS = Private.IconPath .. 'DM_Sessions.png'
local ICON_SETTINGS = Private.IconPath .. 'DM_Settings.png'

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

-- The popup pulls a single source, the windows pull the whole session
function DM:FetchWindow(window)
	local session

	if window.spellMode then
		if window.sessionType then
			session = GetCombatSessionSourceFromType(window.sessionType, window.meterType, window.sourceGUID, window.sourceCreatureID)
		elseif window.sessionID then
			session = GetCombatSessionSourceFromID(window.sessionID, window.meterType, window.sourceGUID, window.sourceCreatureID)
		end
	elseif window.sessionType then
		session = GetCombatSessionFromType(window.sessionType, window.meterType)
	elseif window.sessionID then
		session = GetCombatSessionFromID(window.sessionID, window.meterType)
	end

	window.session = session
end

-- Fake data for the test mode preview, same names Blizzard uses in Edit Mode
-- https://github.com/Gethe/wow-ui-source/blob/live/Interface/AddOns/Blizzard_DamageMeter/DamageMeterSessionWindow.lua#L76-L89
local TestSources = {
	{ name = _G.DAMAGE_METER_EDIT_MODE_SOURCE_1 or 'Arthas', classFilename = 'DEATHKNIGHT' },
	{ name = _G.DAMAGE_METER_EDIT_MODE_SOURCE_2 or 'Jaina', classFilename = 'MAGE' },
	{ name = _G.DAMAGE_METER_EDIT_MODE_SOURCE_3 or "Gul'dan", classFilename = 'WARLOCK' },
	{ name = _G.DAMAGE_METER_EDIT_MODE_SOURCE_7 or 'Sylvanas', classFilename = 'HUNTER' },
	{ name = _G.DAMAGE_METER_EDIT_MODE_SOURCE_6 or 'Illidan', classFilename = 'DEMONHUNTER' },
	{ name = _G.DAMAGE_METER_EDIT_MODE_SOURCE_4 or 'Thrall', classFilename = 'SHAMAN' },
	{ name = _G.DAMAGE_METER_EDIT_MODE_SOURCE_5 or 'Uther', classFilename = 'PALADIN' },
}

local TestTopAmount, TestFalloff, TestDuration = 12400000, 0.88, 300
local testSessions = {}

-- The windows can have different heights
local function GetTestSession(count)
	count = max(count, #TestSources)

	local session = testSessions[count]
	if session then return session end

	local sources, total, amount = {}, 0, TestTopAmount

	for index = 1, count do
		local source = TestSources[(index - 1) % #TestSources + 1]

		sources[index] = {
			name = source.name,
			classFilename = source.classFilename,
			totalAmount = amount,
			amountPerSecond = amount / TestDuration,
		}

		total = total + amount
		amount = max(floor(amount * TestFalloff), 1)
	end

	session = { combatSources = sources, maxAmount = TestTopAmount, totalAmount = total }
	testSessions[count] = session

	return session
end

-- DamageMeterSessionWindowMixin:GetCombatSession
-- Fake data replaces the live data
function DM:GetSession(window)
	if DM.testMode then
		return GetTestSession(window.visibleCount)
	end

	return window.session
end

function DM:RefreshWindow(window)
	window.dirty = false
	DM:FetchWindow(window)
	DM:RenderWindow(window)
end

local function Refresh(onlyDirty)
	for _, window in pairs(DM.windows) do
		if (window.dirty or not onlyDirty) and window:IsVisible() then
			DM:RefreshWindow(window)
		end
	end

	local popup = DM.popup
	if popup and popup:IsShown() and (popup.dirty or not onlyDirty) then
		DM:RefreshPopup()
	end
end

function DM:RefreshAll()
	Refresh(false)
end

local pendingFlush = false
local function Flush()
	pendingFlush = false
	Refresh(true)
end

function DM:MarkDirty(window)
	window.dirty = true

	-- The popup reads the same session as the window it was opened from
	local popup = DM.popup
	if popup and popup.owner == window then
		popup.dirty = true
	end

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
	DM:ClosePopup()

	for _, window in pairs(DM.windows) do
		-- Numbered segments are gone after a wipe, fall back to the current one
		if window.sessionID then
			window.sessionType = SessionType.Current
			window.sessionID = nil
			DM:UpdateHeader(window)
		end

		window.offset = 0
		DM:MarkDirty(window)
	end
end

-- Header text and colors
local function SegmentName(window)
	local short = DM.db.headerSessionLength == 'SHORT'

	if window.sessionType == SessionType.Current then
		return short and _G.DAMAGE_METER_CURRENT_SESSION_SHORT or _G.DAMAGE_METER_CURRENT_SESSION
	elseif window.sessionType == SessionType.Overall then
		return short and _G.DAMAGE_METER_OVERALL_SESSION_SHORT or _G.DAMAGE_METER_OVERALL_SESSION
	end

	return window.sessionID
end

-- Only rebuilt when the bracket style changes
local headerKey, headerFormat
local function GetHeaderFormat()
	local style = DM.db.headerBracketStyle

	if headerKey ~= style then
		headerKey = style

		local chars = DM.BracketChars[style] or DM.BracketChars.SQUARE
		headerFormat = '%s ' .. chars[1] .. '%s' .. chars[2]
	end

	return headerFormat
end

function DM:UpdateHeader(window)
	window.typeText:SetFormattedText(GetHeaderFormat(), DM.TypeNames[window.meterType], SegmentName(window))
end

local function HeaderColor()
	if DM.db.useValueColor then
		return unpack(E.media.rgbvaluecolor)
	end

	return 1, 1, 1
end

function DM:UpdateHeaderColors(window)
	local r, g, b = HeaderColor()

	window.typeText:SetTextColor(r, g, b)
	window.sessionIcon:SetVertexColor(r, g, b)
	window.resetIcon:SetVertexColor(r, g, b)
	window.settingsIcon:SetVertexColor(r, g, b)
end

-- ElvUI keeps calling this whenever its media updates
local function BackdropColor(backdrop)
	local color = backdrop.customColor
	backdrop:SetBackdropColor(color.r, color.g, color.b, color.a)
end

local function SetBackdropColor(backdrop, custom, color)
	if custom then
		backdrop.customColor = color
		backdrop.callbackBackdropColor = BackdropColor
		BackdropColor(backdrop)
	else
		backdrop.customColor = nil
		backdrop.callbackBackdropColor = nil
		backdrop:SetBackdropColor(unpack(E.media.backdropfadecolor))
	end
end

function DM:UpdateWindowBackdrop(window)
	local wdb = DM:WindowDB(window.index)

	if not wdb.backdrop then
		if window.backdrop then
			window.backdrop:Hide()
		end

		return
	end

	if not window.backdrop then
		window:CreateBackdrop('Transparent', nil, nil, nil, nil, nil, nil, true)
	end

	local backdrop = window.backdrop

	-- Padding grows the backdrop past the window
	backdrop:SetOutside(window, E.Border + E:Scale(wdb.backdropWidth), E.Border + E:Scale(wdb.backdropHeight), nil, true)

	SetBackdropColor(backdrop, wdb.backdropColorType == 'CUSTOM', wdb.backdropColor)
	backdrop:Show()
end

-- Session changes
function DM:SetWindowType(window, meterType)
	window.meterType = meterType
	window.offset = 0

	local wdb = DM:WindowDB(window.index)
	wdb.meterType = meterType

	DM:ClosePopup()
	DM:UpdateHeader(window)
	DM:RefreshWindow(window)
end

function DM:SetWindowSession(window, sessionType, sessionID)
	window.sessionType = sessionType
	window.sessionID = sessionID
	window.offset = 0

	-- Session IDs are per login session
	local wdb = DM:WindowDB(window.index)
	wdb.sessionType = sessionType

	DM:ClosePopup()
	DM:UpdateHeader(window)
	DM:RefreshWindow(window)
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

-- Anchored above the window instead of at the cursor, the manager flips them
-- back down on its own when there is no room left on screen
local function OpenMenu(button, generator, alignRight)
	local rootDescription = MenuUtil.CreateRootMenuDescription(MenuVariants.GetDefaultContextMenuMixin())
	Menu.PopulateDescription(generator, button, rootDescription)

	local point, relativePoint = 'BOTTOMLEFT', 'TOPLEFT'
	if alignRight then
		point, relativePoint = 'BOTTOMRIGHT', 'TOPRIGHT'
	end

	local anchor = CreateAnchor(point, button.window, relativePoint, -3, -4)
	Menu.GetManager():OpenMenu(button, rootDescription, anchor)
end

function DM:UpdateHeaderButtons(window)
	if not window.mouseoverButtons then return end

	local alpha = window:IsMouseOver() and 1 or 0
	window.sessionButton:SetAlpha(alpha)
	window.settingsButton:SetAlpha(alpha)
	window.resetButton:SetAlpha(alpha)
end

local function Frame_OnHover(frame)
	DM:UpdateHeaderButtons(frame.window)
end

local function TypeButton_OnClick(button)
	OpenMenu(button, TypeMenu)
end

local function SessionButton_OnClick(button)
	OpenMenu(button, SessionMenu, true)
end

local function SettingsButton_OnClick()
	E:ToggleOptions('LuckyoneUI,damageMeter')
end

-- Shift click skips the confirmation
local function ResetButton_OnClick()
	if IsShiftKeyDown() then
		ResetAllCombatSessions()
	else
		StaticPopup_Show('LUCKYONE_DM_RESET')
	end
end

-- Mouse wheel scrolling, the session windows have no scroll bar
local function Content_OnMouseWheel(content, delta)
	local window = content.window

	local offset = min(max(0, window.numEntries - window.visibleCount), max(0, window.offset - delta))
	if offset ~= window.offset then
		window.offset = offset
		DM:RenderWindow(window)
		DM:UpdateScrollBar(window)
	end
end

local function Content_OnMouseDown(_, button)
	if button == 'RightButton' then
		DM:ClosePopup()
	end
end

-- Spell breakdown popup
-- Same idea as the Blizzard source window, spawned at the cursor instead
-- https://github.com/Gethe/wow-ui-source/blob/live/Interface/AddOns/Blizzard_DamageMeter/DamageMeterSourceWindow.lua
local function Popup_OnShow(popup)
	popup:RegisterEvent('GLOBAL_MOUSE_DOWN')
end

local function Popup_OnHide(popup)
	popup:UnregisterEvent('GLOBAL_MOUSE_DOWN')

	popup.owner = nil
	popup.session = nil
	popup.sourceGUID = nil
	popup.sourceCreatureID = nil
	popup.sourceName = nil
	popup.sourceClass = nil

	-- The next one it opens rebuilds its bars with the current settings
	popup.lastRows = nil
	popup.lastWidth = nil
end

-- Any click that misses the popup closes it again unless it was pinned
local function Popup_OnEvent(popup)
	if not popup.sticky and not DoesAncestryIncludeAny(popup, GetMouseFoci()) then
		popup:Hide()
	end
end

-- Only pinned popups are worth moving, the rest close on the next click
local function PopupHeader_OnDragStart(header)
	local popup = header.window

	if popup.sticky then
		popup:StartMoving()
	end
end

local function PopupHeader_OnDragStop(header)
	local popup = header.window

	popup:StopMovingOrSizing()
	popup:SetUserPlaced(false)
end

-- The cursor corner is the anchor, the popup grows toward the screen center
local function AnchorToCursor(popup)
	local scale = popup:GetEffectiveScale()
	local x, y = GetCursorPosition()
	x, y = x / scale, y / scale

	local horizontal = (x > E.UIParent:GetWidth() / 2) and 'RIGHT' or 'LEFT'
	local vertical = (y > E.UIParent:GetHeight() / 2) and 'TOP' or 'BOTTOM'

	popup:ClearAllPoints()
	popup:SetPoint(vertical .. horizontal, E.UIParent, 'BOTTOMLEFT', x, y)
end

-- The scroll bar works in percent, the render path works in rows
local function ScrollBar_OnScroll(window, percentage)
	if window.scrollBar.locked then return end

	local maxOffset = max(window.numEntries - window.visibleCount, 0)
	local offset = floor(percentage * maxOffset + 0.5)

	if offset ~= window.offset then
		window.offset = offset
		DM:RenderWindow(window)
	end
end

-- Only shows up once the list outgrows the popup, the bars give up their right edge for it
function DM:UpdateScrollBar(window)
	local scrollBar = window.scrollBar
	if not scrollBar then return end

	local db = DM.db
	local maxOffset = max(window.numEntries - window.visibleCount, 0)
	local shown = maxOffset > 0

	scrollBar:SetShown(shown)
	window.content:Point('BOTTOMRIGHT', window, 'BOTTOMRIGHT', shown and -(scrollBar:GetWidth() + db.barSpacing) or 0, 0)

	if not shown then return end

	-- One row per stepper click, the thumb covers as much of the track as the popup covers of the list
	scrollBar.locked = true
	scrollBar:SetPanExtentPercentage(1 / maxOffset)
	scrollBar:SetVisibleExtentPercentage(window.visibleCount / window.numEntries)
	scrollBar:SetScrollPercentage(window.offset / maxOffset)
	scrollBar.locked = false
end

function DM:GetPopup()
	local popup = DM.popup
	if popup then return popup end

	popup = CreateFrame('Frame', 'LuckyoneUI_DamageMeterPopup', E.UIParent)
	popup:SetFrameStrata('DIALOG')
	popup:SetClampedToScreen(true)
	popup:SetMovable(true)
	popup:SetScript('OnShow', Popup_OnShow)
	popup:SetScript('OnHide', Popup_OnHide)
	popup:SetScript('OnEvent', Popup_OnEvent)
	popup:CreateBackdrop('Transparent', nil, nil, nil, nil, nil, nil, true)
	popup:Hide()

	-- Everything the shared render path expects from a window
	popup.spellMode = true
	popup.bars = {}
	popup.offset = 0
	popup.visibleCount = 0
	popup.numEntries = 0

	-- The header doubles as the drag handle
	local header = CreateFrame('Frame', nil, popup)
	header:Point('TOPLEFT')
	header:Point('TOPRIGHT')
	header:EnableMouse(true)
	header:RegisterForDrag('LeftButton')
	header:SetScript('OnDragStart', PopupHeader_OnDragStart)
	header:SetScript('OnDragStop', PopupHeader_OnDragStop)
	header:SetScript('OnMouseDown', Content_OnMouseDown)
	header.window = popup
	popup.header = header

	popup.typeText = header:CreateFontString(nil, 'OVERLAY')
	popup.typeText:SetJustifyH('LEFT')
	popup.typeText:SetWordWrap(false)

	local content = CreateFrame('Frame', nil, popup)
	content:Point('TOPLEFT', header, 'BOTTOMLEFT', 0, 0)
	content:Point('BOTTOMRIGHT', popup, 'BOTTOMRIGHT', 0, 0)
	content:EnableMouse(true)
	content:EnableMouseWheel(true)
	content:SetScript('OnMouseWheel', Content_OnMouseWheel)
	content:SetScript('OnMouseDown', Content_OnMouseDown)
	content.window = popup
	popup.content = content

	-- The Blizzard trim scroll bar with the ElvUI skin, the wheel keeps moving one row at a time
	local scrollBar = CreateFrame('EventFrame', nil, popup, 'WowTrimScrollBar')
	scrollBar:EnableMouseWheel(true)
	scrollBar:SetScript('OnMouseWheel', Content_OnMouseWheel)
	scrollBar:RegisterCallback(ScrollBarMixin.Event.OnScroll, ScrollBar_OnScroll, popup)
	scrollBar:Hide()
	scrollBar.window = popup
	popup.scrollBar = scrollBar

	S:HandleTrimScrollBar(scrollBar)

	DM.popup = popup
	return popup
end

function DM:ApplyPopupSettings(popup)
	local db = DM.db
	local wdb = DM:WindowDB(popup.owner.index)
	local scrollWidth = 22
	local r, g, b = HeaderColor()

	popup.header:Height(db.headerHeight)

	popup.typeText:ClearAllPoints()
	popup.typeText:Point('TOPLEFT', popup.header, 'TOPLEFT', db.headerTypeXOffset, db.headerTypeYOffset)
	popup.typeText:Point('BOTTOMRIGHT', popup.header, 'BOTTOMRIGHT', db.headerTypeXOffset, db.headerTypeYOffset)
	popup.typeText:FontTemplate(db.headerFont, db.headerFontSize, db.headerFontOutline)
	popup.typeText:SetTextColor(r, g, b)

	-- Kept off the bars by the same gap the bars keep from each other
	popup.scrollBar:ClearAllPoints()
	popup.scrollBar:Point('TOPLEFT', popup.content, 'TOPRIGHT', db.barSpacing, 0)
	popup.scrollBar:Point('BOTTOMLEFT', popup.content, 'BOTTOMRIGHT', db.barSpacing, 0)
	popup.scrollBar:Width(scrollWidth)

	-- The backdrop follows the window the popup was opened from
	popup.backdrop:SetOutside(popup, E.Border + E:Scale(wdb.backdropWidth), E.Border + E:Scale(wdb.backdropHeight), nil, true)
	SetBackdropColor(popup.backdrop, db.popupBackdropColorType == 'CUSTOM', db.popupBackdropColor)
end

function DM:UpdatePopupHeader(popup)
	local name = DM:StripRealm(popup.sourceName, popup.sourceClass) or _G.UNKNOWN

	popup.typeText:SetFormattedText(GetHeaderFormat(), name, SegmentName(popup))
end

function DM:RefreshPopup()
	local db = DM.db
	local popup = DM.popup
	local owner = popup.owner

	popup.dirty = false
	DM:FetchWindow(popup)

	local entries = popup.session and popup.session.combatSpells

	-- It grows to fit the spells, the window it came from is the ceiling
	local rows = max(min(entries and #entries or 0, owner.visibleCount), 1)
	local width = owner:GetWidth()

	if popup.lastRows ~= rows or popup.lastWidth ~= width then
		popup.lastRows, popup.lastWidth = rows, width

		local height = db.headerHeight + rows * db.barHeight + (rows - 1) * db.barSpacing
		popup:Size(width, height)
		DM:UpdateWindowGeometry(popup, width, height)
	end

	DM:RenderWindow(popup)
	DM:UpdateScrollBar(popup)
end

function DM:OpenPopup(window, entry)
	-- Death entries open the Blizzard death recap instead
	if entry.deathRecapID and entry.deathRecapID ~= 0 then
		_G.OpenDeathRecapUI(entry.deathRecapID)
		return
	end

	-- Secret identifiers cannot be passed back into the API while restricted
	if issecretvalue(entry.sourceGUID) or issecretvalue(entry.sourceCreatureID) then return end
	if not entry.sourceGUID and not entry.sourceCreatureID then return end

	local popup = DM:GetPopup()

	popup.owner = window
	popup.meterType = window.meterType
	popup.sessionType = window.sessionType
	popup.sessionID = window.sessionID
	popup.sourceGUID = entry.sourceGUID
	popup.sourceCreatureID = entry.sourceCreatureID
	popup.sourceName = entry.name
	popup.sourceClass = entry.classFilename
	popup.offset = 0

	-- Shift click pins it, otherwise the next click anywhere else closes it
	popup.sticky = IsShiftKeyDown()

	DM:ApplyPopupSettings(popup)
	DM:UpdatePopupHeader(popup)
	DM:RefreshPopup()

	AnchorToCursor(popup)
	popup:Show()
end

function DM:ClosePopup()
	if DM.popup then
		DM.popup:Hide()
	end
end

function DM:GetWindow(index)
	local window = DM.windows[index]
	if window then return window end

	window = CreateFrame('Frame', 'LuckyoneUI_DamageMeterWindow' .. index, DM.holder)
	window.index = index
	window.offset = 0
	window.bars = {}
	window.visibleCount = 0
	window.numEntries = 0

	local header = CreateFrame('Frame', nil, window)
	header:Point('TOPLEFT')
	header:Point('TOPRIGHT')
	header:SetScript('OnEnter', Frame_OnHover)
	header:SetScript('OnLeave', Frame_OnHover)
	header.window = window
	window.header = header

	local resetButton = CreateFrame('Button', nil, header)
	resetButton:SetNormalTexture(ICON_RESET)
	resetButton:SetScript('OnClick', ResetButton_OnClick)
	resetButton:SetScript('OnEnter', Frame_OnHover)
	resetButton:SetScript('OnLeave', Frame_OnHover)
	resetButton.window = window
	window.resetButton = resetButton
	window.resetIcon = resetButton:GetNormalTexture()
	window.resetIcon:ClearAllPoints()
	window.resetIcon:Point('CENTER')

	local sessionButton = CreateFrame('Button', nil, header)
	sessionButton:SetNormalTexture(ICON_SESSIONS)
	sessionButton:SetScript('OnClick', SessionButton_OnClick)
	sessionButton:SetScript('OnEnter', Frame_OnHover)
	sessionButton:SetScript('OnLeave', Frame_OnHover)
	sessionButton.window = window
	window.sessionButton = sessionButton
	window.sessionIcon = sessionButton:GetNormalTexture()
	window.sessionIcon:ClearAllPoints()
	window.sessionIcon:Point('CENTER')

	local settingsButton = CreateFrame('Button', nil, header)
	settingsButton:SetNormalTexture(ICON_SETTINGS)
	settingsButton:SetScript('OnClick', SettingsButton_OnClick)
	settingsButton:SetScript('OnEnter', Frame_OnHover)
	settingsButton:SetScript('OnLeave', Frame_OnHover)
	settingsButton.window = window
	window.settingsButton = settingsButton
	window.settingsIcon = settingsButton:GetNormalTexture()
	window.settingsIcon:ClearAllPoints()
	window.settingsIcon:Point('CENTER')

	local typeButton = CreateFrame('Button', nil, header)
	typeButton:SetScript('OnClick', TypeButton_OnClick)
	typeButton:SetScript('OnEnter', Frame_OnHover)
	typeButton:SetScript('OnLeave', Frame_OnHover)
	typeButton.window = window
	window.typeButton = typeButton

	window.typeText = typeButton:CreateFontString(nil, 'OVERLAY')
	window.typeText:SetJustifyH('LEFT')
	window.typeText:SetWordWrap(false)
	window.typeText:Point('TOPLEFT')
	window.typeText:Point('BOTTOMRIGHT')

	local content = CreateFrame('Frame', nil, window)
	content:Point('TOPLEFT', header, 'BOTTOMLEFT', 0, 0)
	content:Point('BOTTOMRIGHT', window, 'BOTTOMRIGHT', 0, 0)
	content:EnableMouseWheel(true)
	content:SetScript('OnMouseWheel', Content_OnMouseWheel)
	content:SetScript('OnMouseDown', Content_OnMouseDown)
	content:SetScript('OnEnter', Frame_OnHover)
	content:SetScript('OnLeave', Frame_OnHover)
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
	local wdb = DM:WindowDB(window.index)

	if window.meterType == nil then
		window.meterType = wdb.meterType
	end

	if window.sessionType == nil and window.sessionID == nil then
		window.sessionType = wdb.sessionType
	end

	local header, resetButton, sessionButton, settingsButton, typeButton = window.header, window.resetButton, window.sessionButton, window.settingsButton, window.typeButton

	-- The icons bring their own size, the click areas fill the header height
	local iconSize = db.headerIconSize

	header:Height(db.headerHeight)
	resetButton:Size(iconSize, db.headerHeight)
	sessionButton:Size(iconSize, db.headerHeight)
	settingsButton:Size(iconSize, db.headerHeight)

	window.resetIcon:Size(iconSize)
	window.sessionIcon:Size(iconSize)
	window.settingsIcon:Size(iconSize - 1) -- Its artwork sits tighter in the file than the other two

	-- Click areas move move along with x and y
	local resetX, resetY = db.headerResetXOffset, db.headerResetYOffset
	local sessionX, sessionY = db.headerSessionXOffset, db.headerSessionYOffset
	local settingsX, settingsY = db.headerSettingsXOffset, db.headerSettingsYOffset
	local typeX, typeY = db.headerTypeXOffset, db.headerTypeYOffset

	resetButton:ClearAllPoints()
	resetButton:Point('RIGHT', header, 'RIGHT', 3 + resetX, resetY)

	-- Every button takes the spot of the one to its right when that one is hidden
	sessionButton:ClearAllPoints()

	if wdb.showResetButton then
		sessionButton:Point('RIGHT', resetButton, 'LEFT', sessionX - resetX, sessionY - resetY)
	else
		sessionButton:Point('RIGHT', header, 'RIGHT', 3 + sessionX, sessionY)
	end

	settingsButton:ClearAllPoints()

	if wdb.showSessionButton then
		settingsButton:Point('RIGHT', sessionButton, 'LEFT', -1 + settingsX - sessionX, settingsY - sessionY)
	elseif wdb.showResetButton then
		settingsButton:Point('RIGHT', resetButton, 'LEFT', -1 + settingsX - resetX, settingsY - resetY)
	else
		settingsButton:Point('RIGHT', header, 'RIGHT', 2 + settingsX, settingsY)
	end

	-- The type button fills whatever the buttons leave over
	typeButton:ClearAllPoints()
	typeButton:Point('TOPLEFT', header, 'TOPLEFT', typeX, typeY)

	if wdb.showSettingsButton then
		typeButton:Point('BOTTOMRIGHT', settingsButton, 'BOTTOMLEFT', -6 + typeX - settingsX, typeY - settingsY)
	elseif wdb.showSessionButton then
		typeButton:Point('BOTTOMRIGHT', sessionButton, 'BOTTOMLEFT', -4 + typeX - sessionX, typeY - sessionY)
	elseif wdb.showResetButton then
		typeButton:Point('BOTTOMRIGHT', resetButton, 'BOTTOMLEFT', -4 + typeX - resetX, typeY - resetY)
	else
		typeButton:Point('BOTTOMRIGHT', header, 'BOTTOMRIGHT', -2 + typeX, typeY)
	end

	-- Hidden buttons stay hidden, mouseover only fades the enabled ones
	local mouseover = wdb.mouseoverButtons
	local alpha = (mouseover and not window:IsMouseOver()) and 0 or 1
	window.mouseoverButtons = mouseover

	sessionButton:SetShown(wdb.showSessionButton)
	sessionButton:SetAlpha(alpha)
	resetButton:SetShown(wdb.showResetButton)
	resetButton:SetAlpha(alpha)
	settingsButton:SetShown(wdb.showSettingsButton)
	settingsButton:SetAlpha(alpha)

	-- Header and content only take the mouse for the fade, the bars always do
	header:EnableMouse(mouseover)
	window.content:EnableMouse(mouseover)

	window.typeText:FontTemplate(db.headerFont, db.headerFontSize, db.headerFontOutline)
	window.infoText:FontTemplate(db.font, db.fontSize, db.fontOutline)

	DM:UpdateWindowBackdrop(window)
	DM:UpdateHeaderColors(window)
	DM:UpdateHeader(window)
end
