local _, Private = ...
local DM = Private.Modules.DamageMeter

if not DM then return end

local unpack = unpack
local format = string.format
local ipairs = ipairs
local pairs = pairs
local type = type
local wipe = wipe
local sort = table.sort
local tinsert = table.insert
local tremove = table.remove
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
	window.sessionButton.icon:SetVertexColor(r, g, b)
	window.resetButton.icon:SetVertexColor(r, g, b)
	window.settingsButton.icon:SetVertexColor(r, g, b)
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

-- Session changes, anything open on top of the window goes away with the old data
local function WindowChanged(window)
	window.offset = 0

	DM:ClosePopup()
	DM:CloseBookmarks(window)
	DM:UpdateHeader(window)
	DM:RefreshWindow(window)
end

function DM:SetWindowType(window, meterType)
	window.meterType = meterType
	DM:WindowDB(window.index).meterType = meterType

	WindowChanged(window)
end

-- Session IDs are per login session, only the type is saved
function DM:SetWindowSession(window, sessionType, sessionID)
	window.sessionType = sessionType
	window.sessionID = sessionID
	DM:WindowDB(window.index).sessionType = sessionType

	WindowChanged(window)
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

local function SetHoverScripts(frame)
	frame:SetScript('OnEnter', Frame_OnHover)
	frame:SetScript('OnLeave', Frame_OnHover)
end

-- Clicks anywhere on screen decide whether a panel stays open
local function Frame_OnShow(frame)
	frame:RegisterEvent('GLOBAL_MOUSE_DOWN')
end

-- Right click carries through to the window so the bookmarks open from here too
local function TypeButton_OnClick(button, mouseButton)
	if mouseButton == 'RightButton' then
		DM:WindowRightClick(button.window)
	else
		OpenMenu(button, TypeMenu)
	end
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
		DM:ResetData()
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

local function Content_OnMouseDown(frame, button)
	if button == 'RightButton' then
		DM:WindowRightClick(frame.window)
	end
end

-- Secret safe bookmarks
-- A right click panel over the bar area, it only carries damage meter types (the table)
-- Every type is stored as its own place in the list so it can be dragged around,
-- profiles from before that stored a plain true and fall back to the type menu order
local NEW_BOOKMARK = 99 -- Higher than the type count, anything new sorts to the end

local bookmarkList, bookmarkPlaces = {}, {}

local function SortBookmarks(a, b)
	return bookmarkPlaces[a] < bookmarkPlaces[b]
end

local function BuildBookmarkList()
	wipe(bookmarkList)
	wipe(bookmarkPlaces)

	local saved = DM.db.bookmarks
	local total = 0

	for _, category in ipairs(DM.TypeCategories) do
		for _, meterType in ipairs(category.types) do
			total = total + 1

			local place = saved[meterType]

			if place then
				bookmarkList[#bookmarkList + 1] = meterType
				bookmarkPlaces[meterType] = (type(place) == 'number') and place or total
			end
		end
	end

	sort(bookmarkList, SortBookmarks)

	return bookmarkList, total
end

-- Dropping one leaves a gap behind, the places are handed out again from the list
local function SaveBookmarkOrder()
	local saved = DM.db.bookmarks

	for index, meterType in ipairs(bookmarkList) do
		saved[meterType] = index
	end
end

-- The options list and the plus menu both go through here, a dropped one is kept
-- as false so the profile defaults cannot bring it back on the next login
function DM:SetBookmark(meterType, enabled)
	DM.db.bookmarks[meterType] = enabled and NEW_BOOKMARK or false
end

local function AddBookmark(data)
	DM:SetBookmark(data.meterType, true)
	DM:LayoutBookmarks(data.window)
end

-- The plus icon only offers types which are still missing in the bookmarks
local function BookmarkMenu(owner, rootDescription)
	rootDescription:SetTag('MENU_LUCKYONEUI_DAMAGE_METER_BOOKMARK')

	local saved = DM.db.bookmarks
	local window = owner.window

	for _, category in ipairs(DM.TypeCategories) do
		local submenu

		for _, meterType in ipairs(category.types) do
			if not saved[meterType] then
				submenu = submenu or rootDescription:CreateButton(category.name)
				submenu:CreateButton(DM.TypeNames[meterType], AddBookmark, { window = window, meterType = meterType })
			end
		end
	end
end

local function BookmarkRow_OnClick(row, mouseButton)
	local window = row.window

	-- The last slot spawns the menu instead, it has no type of its own
	if not row.meterType then
		if mouseButton == 'LeftButton' then
			OpenMenu(row, BookmarkMenu)
		end

		return
	end

	-- Right click drops the bookmark again, the panel stays open
	if mouseButton == 'RightButton' then
		DM:SetBookmark(row.meterType, false)
		DM:LayoutBookmarks(window)
		return
	end

	DM:SetWindowType(window, row.meterType)
end

-- Drag and drop reorder
-- The row under the cursor, the plus slot never counts as one
local function DropIndex(frame)
	local _, y = GetCursorPosition()
	y = y / frame:GetEffectiveScale()

	for index = 1, frame.dropCount do
		if y >= frame.rows[index]:GetBottom() then
			return index
		end
	end

	return frame.dropCount
end

-- The marker sits above the target while moving up and below it while moving down
local function Bookmarks_OnUpdate(frame)
	local index = DropIndex(frame)
	if index == frame.dropIndex then return end

	frame.dropIndex = index

	local row = frame.rows[index]
	local marker = frame.marker

	marker:ClearAllPoints()

	if index <= frame.dragIndex then
		marker:Point('BOTTOMLEFT', row, 'TOPLEFT', 0, 0)
		marker:Point('BOTTOMRIGHT', row, 'TOPRIGHT', 0, 0)
	else
		marker:Point('TOPLEFT', row, 'BOTTOMLEFT', 0, 0)
		marker:Point('TOPRIGHT', row, 'BOTTOMRIGHT', 0, 0)
	end
end

local function BookmarkRow_OnDragStart(row)
	if not DM.db.bookmarkDragDrop or not row.meterType then return end

	local frame = row:GetParent()
	frame.dragIndex = row.index
	frame.dropIndex = nil

	row:SetAlpha(0.4)
	frame.marker:Show()
	frame:SetScript('OnUpdate', Bookmarks_OnUpdate)

	Bookmarks_OnUpdate(frame)
end

local function BookmarkRow_OnDragStop(row)
	local frame = row:GetParent()
	local from, to = frame.dragIndex, frame.dropIndex

	frame.dragIndex, frame.dropIndex = nil, nil
	if not from then return end

	frame:SetScript('OnUpdate', nil)
	frame.marker:Hide()
	row:SetAlpha(1)

	if to and to ~= from then
		DM:MoveBookmark(row.window, from, to)
	end
end

local function CreateBookmarkRow(frame)
	local row = CreateFrame('Button', nil, frame)
	row.window = frame.window

	row:SetFrameLevel(frame:GetFrameLevel() + 2) -- Keeps its backdrop above the one behind the whole panel
	row:RegisterForClicks('LeftButtonUp', 'RightButtonUp')
	row:RegisterForDrag('LeftButton')
	row:SetScript('OnClick', BookmarkRow_OnClick)
	row:SetScript('OnDragStart', BookmarkRow_OnDragStart)
	row:SetScript('OnDragStop', BookmarkRow_OnDragStop)
	row:CreateBackdrop('Transparent', nil, nil, nil, nil, nil, nil, true)
	SetHoverScripts(row)

	-- Marks the type the window is showing right now
	row.selected = row:CreateTexture(nil, 'ARTWORK')
	row.selected:SetTexture(E.media.blankTex)
	row.selected:SetVertexColor(1, 1, 1, 0.2)
	row.selected:SetAllPoints()

	local highlight = row:CreateTexture(nil, 'HIGHLIGHT')
	highlight:SetTexture(E.media.blankTex)
	highlight:SetVertexColor(1, 1, 1, 0.2)
	highlight:SetAllPoints()

	-- Both edges so the longer type names get trimmed instead of spilling out
	row.text = row:CreateFontString(nil, 'OVERLAY')
	row.text:SetJustifyH('CENTER')
	row.text:SetWordWrap(false)
	row.text:Point('LEFT', row, 'LEFT', 4, 0)
	row.text:Point('RIGHT', row, 'RIGHT', -4, 0)

	return row
end

-- The bars come back whichever way the panel went away
local function Bookmarks_OnHide(frame)
	frame:UnregisterEvent('GLOBAL_MOUSE_DOWN')
	frame:SetScript('OnUpdate', nil)

	frame.dragIndex, frame.dropIndex = nil, nil
	frame.marker:Hide()
	frame.window.content:Show()
end

-- Anything on the window keeps it open, the add menu counts as part of it
local function Bookmarks_OnEvent(frame)
	if Menu.GetManager():GetOpenMenu() then return end
	if DoesAncestryIncludeAny(frame.window, GetMouseFoci()) then return end

	frame:Hide()
end

local function Bookmarks_OnMouseDown(frame, button)
	if button == 'RightButton' then
		frame:Hide()
	end
end

local function CreateBookmarks(window)
	local frame = CreateFrame('Frame', nil, window)

	-- Set before the scripts, the first Hide already fires OnHide
	frame.rows = {}
	frame.window = window
	window.bookmarks = frame

	frame:SetFrameLevel(window.content:GetFrameLevel() + 5)
	frame:Point('TOPLEFT', window.header, 'BOTTOMLEFT', 0, 0)
	frame:Point('BOTTOMRIGHT', window, 'BOTTOMRIGHT', 0, 0)
	frame:EnableMouse(true)

	-- Shows where a dragged bookmark lands, above the rows so it stays visible
	local marker = CreateFrame('Frame', nil, frame)
	marker:SetFrameLevel(frame:GetFrameLevel() + 4)
	marker:Hide()
	frame.marker = marker

	marker.texture = marker:CreateTexture(nil, 'OVERLAY')
	marker.texture:SetTexture(E.media.blankTex)
	marker.texture:SetAllPoints()

	frame:SetScript('OnShow', Frame_OnShow)
	frame:SetScript('OnHide', Bookmarks_OnHide)
	frame:SetScript('OnEvent', Bookmarks_OnEvent)
	frame:SetScript('OnMouseDown', Bookmarks_OnMouseDown)
	frame:CreateBackdrop('Transparent', nil, nil, nil, nil, nil, nil, true)
	frame:Hide()
	SetHoverScripts(frame)

	return frame
end

-- The rows split whatever the header leaves over, so they always fit
function DM:LayoutBookmarks(window)
	local frame = window.bookmarks
	if not frame then return false end

	local db = DM.db
	local list, total = BuildBookmarkList()

	-- The plus icon goes away once every type is bookmarked
	local rows = #list + ((#list < total) and 1 or 0)
	if rows == 0 then return false end

	local spacing = db.barSpacing
	local rowHeight = floor(((window.contentHeight or 0) - (rows - 1) * spacing) / rows)
	if rowHeight < 1 then return false end

	-- Whatever the list looked like, it comes out of here numbered from the top
	SaveBookmarkOrder()

	local r, g, b = HeaderColor()

	frame.dropCount = #list
	frame.marker:Height(max(spacing, 2))
	frame.marker.texture:SetVertexColor(r, g, b)

	for index = 1, rows do
		local row = frame.rows[index]
		if not row then
			row = CreateBookmarkRow(frame)
			frame.rows[index] = row
		end

		local meterType = list[index]
		local yOffset = -((index - 1) * (rowHeight + spacing))

		row:ClearAllPoints()
		row:Point('TOPLEFT', frame, 'TOPLEFT', 0, yOffset)
		row:Point('TOPRIGHT', frame, 'TOPRIGHT', 0, yOffset)
		row:Height(rowHeight)

		row.index = index
		row.meterType = meterType
		row:SetAlpha(1) -- A drag that ended on a relayout leaves it dimmed
		row.text:FontTemplate(db.headerFont, db.headerFontSize, db.headerFontOutline)
		row.text:SetTextColor(r, g, b)
		row.text:SetText(meterType and DM.TypeNames[meterType] or '+')
		row.selected:SetShown(meterType == window.meterType)
		row:Show()
	end

	for index = rows + 1, #frame.rows do
		frame.rows[index]:Hide()
	end

	return true
end

local function OpenBookmarks(window)
	if not DM.db.showBookmarks then return end

	local frame = window.bookmarks or CreateBookmarks(window)
	if not DM:LayoutBookmarks(window) then return end

	window.content:Hide()
	frame:Show()
end

-- The list is rebuilt from the places, so the places are what has to move
function DM:MoveBookmark(window, from, to)
	local list = BuildBookmarkList()

	local meterType = tremove(list, from)
	if not meterType then return end

	tinsert(list, to, meterType)
	SaveBookmarkOrder()

	DM:LayoutBookmarks(window)
end

function DM:CloseBookmarks(window)
	if window.bookmarks then
		window.bookmarks:Hide()
	end
end

function DM:CloseAllBookmarks()
	for _, window in pairs(DM.windows) do
		DM:CloseBookmarks(window)
	end
end

-- The popup goes first, the bookmarks only take over once it is gone
-- The popup has no bookmarks of its own, a right click on it only closes it
function DM:WindowRightClick(window)
	local popup = DM.popup
	local bookmarks = window.bookmarks

	if popup and popup:IsShown() then
		popup:Hide()
	elseif bookmarks and bookmarks:IsShown() then
		bookmarks:Hide()
	elseif not window.spellMode then
		OpenBookmarks(window)
	end
end

-- Spell breakdown popup
-- Same idea as the Blizzard source window, spawned at the cursor instead
-- https://github.com/Gethe/wow-ui-source/blob/live/Interface/AddOns/Blizzard_DamageMeter/DamageMeterSourceWindow.lua
-- The source it showed is set again by the next OpenPopup
local function Popup_OnHide(popup)
	popup:UnregisterEvent('GLOBAL_MOUSE_DOWN')

	popup.owner = nil
	popup.session = nil

	-- The next one it opens rebuilds its bars with the current settings
	popup.lastRows = nil
	popup.lastWidth = nil
	popup.scrollShown = nil
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

	local maxOffset = max(window.numEntries - window.visibleCount, 0)
	local shown = maxOffset > 0

	-- The bars only move when the scroll bar comes or goes
	if window.scrollShown ~= shown then
		window.scrollShown = shown
		scrollBar:SetShown(shown)
		window.content:Point('BOTTOMRIGHT', window, 'BOTTOMRIGHT', shown and -(scrollBar:GetWidth() + DM.db.barSpacing) or 0, 0)
	end

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
	popup:SetScript('OnShow', Frame_OnShow)
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

-- The click area grows with the header, the artwork stays centered in it
local function CreateHeaderButton(window, icon, onClick)
	local button = CreateFrame('Button', nil, window.header)
	button:SetNormalTexture(icon)
	button:SetScript('OnClick', onClick)
	button.window = window
	SetHoverScripts(button)

	button.icon = button:GetNormalTexture()
	button.icon:ClearAllPoints()
	button.icon:Point('CENTER')

	return button
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
	header:SetPassThroughButtons('LeftButton', 'MiddleButton')
	header:SetScript('OnMouseDown', Content_OnMouseDown)
	header.window = window
	window.header = header
	SetHoverScripts(header)

	window.resetButton = CreateHeaderButton(window, ICON_RESET, ResetButton_OnClick)
	window.sessionButton = CreateHeaderButton(window, ICON_SESSIONS, SessionButton_OnClick)
	window.settingsButton = CreateHeaderButton(window, ICON_SETTINGS, SettingsButton_OnClick)

	local typeButton = CreateFrame('Button', nil, header)
	typeButton:RegisterForClicks('LeftButtonUp', 'RightButtonUp')
	typeButton:SetScript('OnClick', TypeButton_OnClick)
	typeButton.window = window
	window.typeButton = typeButton
	SetHoverScripts(typeButton)

	window.typeText = typeButton:CreateFontString(nil, 'OVERLAY')
	window.typeText:SetJustifyH('LEFT')
	window.typeText:SetWordWrap(false)
	window.typeText:Point('TOPLEFT')
	window.typeText:Point('BOTTOMRIGHT')

	local content = CreateFrame('Frame', nil, window)
	content:Point('TOPLEFT', header, 'BOTTOMLEFT', 0, 0)
	content:Point('BOTTOMRIGHT', window, 'BOTTOMRIGHT', 0, 0)
	content:SetPassThroughButtons('LeftButton', 'MiddleButton')
	content:EnableMouseWheel(true)
	content:SetScript('OnMouseWheel', Content_OnMouseWheel)
	content:SetScript('OnMouseDown', Content_OnMouseDown)
	content.window = window
	window.content = content
	SetHoverScripts(content)

	window.infoText = content:CreateFontString(nil, 'OVERLAY')
	window.infoText:SetJustifyH('CENTER')
	window.infoText:Point('CENTER')

	DM.windows[index] = window
	return window
end

-- Header buttons from right to left, every one takes the spot of a hidden one to its right
-- edge is the gap to the header, gap the one to the next button on the right and pad what the
-- tighter settings artwork (trim) hands over to whatever sits on its left
local HeaderButtons = {
	{ button = 'resetButton', shown = 'showResetButton', x = 'headerResetXOffset', y = 'headerResetYOffset', edge = 3 },
	{ button = 'sessionButton', shown = 'showSessionButton', x = 'headerSessionXOffset', y = 'headerSessionYOffset', edge = 3 },
	{ button = 'settingsButton', shown = 'showSettingsButton', x = 'headerSettingsXOffset', y = 'headerSettingsYOffset', edge = 2, gap = -1, pad = -2, trim = 1 },
}

function DM:ApplyWindowSettings(window)
	local db = DM.db
	local wdb = DM:WindowDB(window.index)

	if window.meterType == nil then
		window.meterType = wdb.meterType
	end

	if window.sessionType == nil and window.sessionID == nil then
		window.sessionType = wdb.sessionType
	end

	local header, typeButton = window.header, window.typeButton
	local iconSize, headerHeight = db.headerIconSize, db.headerHeight

	-- Hidden buttons stay hidden, mouseover only fades the enabled ones
	local mouseover = wdb.mouseoverButtons
	local alpha = (mouseover and not window:IsMouseOver()) and 0 or 1
	window.mouseoverButtons = mouseover

	header:Height(headerHeight)

	-- The icons bring their own size, the click areas fill the header height and move along with x and y
	local previous, previousX, previousY, previousPad = nil, 0, 0, 0

	for _, info in ipairs(HeaderButtons) do
		local button = window[info.button]
		local shown = wdb[info.shown]
		local x, y = db[info.x], db[info.y]

		button:Size(iconSize, headerHeight)
		button.icon:Size(iconSize - (info.trim or 0))
		button:ClearAllPoints()

		if previous then
			button:Point('RIGHT', previous, 'LEFT', (info.gap or 0) + previousPad + x - previousX, y - previousY)
		else
			button:Point('RIGHT', header, 'RIGHT', info.edge + x, y)
		end

		button:SetShown(shown)
		button:SetAlpha(alpha)

		if shown then
			previous, previousX, previousY, previousPad = button, x, y, info.pad or 0
		end
	end

	-- The type button fills whatever the buttons leave over
	local typeX, typeY = db.headerTypeXOffset, db.headerTypeYOffset

	typeButton:ClearAllPoints()
	typeButton:Point('TOPLEFT', header, 'TOPLEFT', typeX, typeY)

	if previous then
		typeButton:Point('BOTTOMRIGHT', previous, 'BOTTOMLEFT', -4 + previousPad + typeX - previousX, typeY - previousY)
	else
		typeButton:Point('BOTTOMRIGHT', header, 'BOTTOMRIGHT', -2 + typeX, typeY)
	end

	-- The fade wants the mouse, the bookmark panel wants the right click
	-- Left and middle clicks pass straight through either way
	local takeMouse = mouseover or db.showBookmarks

	header:EnableMouse(takeMouse)
	window.content:EnableMouse(takeMouse)

	window.typeText:FontTemplate(db.headerFont, db.headerFontSize, db.headerFontOutline)
	window.infoText:FontTemplate(db.font, db.fontSize, db.fontOutline)

	DM:UpdateWindowBackdrop(window)
	DM:UpdateHeaderColors(window)
	DM:UpdateHeader(window)
end
