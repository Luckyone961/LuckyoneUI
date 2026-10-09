local _, Private = ...
local DM = Private.Modules.DamageMeter

if not Private.ElvUI then
	return
end

local L = Private.L

local unpack = unpack
local pairs = pairs
local ipairs = ipairs
local wipe = wipe
local max = math.max
local min = math.min
local floor = math.floor
local match = string.match

local Ambiguate = Ambiguate
local CreateFrame = CreateFrame
local hooksecurefunc = hooksecurefunc
local GetCVarBool = C_CVar.GetCVarBool
local SetCVar = C_CVar.SetCVar
local GetInstanceInfo = GetInstanceInfo
local HasActiveDelve = C_DelvesUI.HasActiveDelve
local IsInGroup = IsInGroup
local MergeTable = MergeTable
local UnitAffectingCombat = UnitAffectingCombat
local UnitNameFromGUID = UnitNameFromGUID
local issecretvalue = issecretvalue
local ResetAllCombatSessions = C_DamageMeter.ResetAllCombatSessions
local C_UI = C_UI

local UNKNOWNOBJECT = UNKNOWNOBJECT

local _G = _G
local StaticPopup_Show = _G.StaticPopup_Show

local E = unpack(ElvUI)

DM.windows = {}

function DM:CreateText(parent, justify)
	local text = parent:CreateFontString(nil, 'OVERLAY')
	text:SetJustifyH(justify)
	text:SetWordWrap(false)

	return text
end

-- Ambiguate accepts secret names
function DM:StripRealm(name, classFilename, guid)
	if not name or not DM.db.stripRealm then return name end
	if not classFilename or classFilename == '' then return name end

	if Private.isForever then
		local mainName = guid and UnitNameFromGUID(guid)
		if mainName and (issecretvalue(mainName) or mainName ~= UNKNOWNOBJECT) then return mainName end

		if not issecretvalue(name) then
			return match(name, '^[^%s%-]+') or name
		end
	end

	return Ambiguate(name, 'short')
end

local function ShouldShow()
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

-- Roster updates fire in bursts, only an actual change does any work
function DM:UpdateShown()
	local shown = ShouldShow()
	if shown == DM.holder:IsShown() then return end

	DM.holder:SetShown(shown)

	if shown then
		DM:MarkAllDirty()
	else
		DM:ClosePopup()
		DM:CloseAllBookmarks()
	end
end

-- A reload always drops back to the live data
function DM:SetTestMode(value)
	DM.testMode = value or nil

	-- Fake data brings its own bar count, start from the top again
	for _, window in pairs(DM.windows) do
		window.offset = 0
	end

	Private:DamageMeter_Update()
end

local widths, heights = {}, {}
local hosts, columns, floating = {}, {}, {}
local activeCount -- Content changes compare against this

local function BuildRoots(count)
	wipe(hosts)
	wipe(columns)
	wipe(floating)

	for index = 1, count do
		local wdb = DM.db.windows[index]
		local target = (wdb.placement == 'ATTACH' and wdb.attachTo) or 0
		local host = (target >= 1 and target <= count and target ~= index) and DM.db.windows[target]

		hosts[index] = (host and host.placement ~= 'ATTACH') and target or 0

		if hosts[index] == 0 then
			if wdb.placement == 'CUSTOM' then
				-- Custom placed windows always bring their own size
				floating[#floating + 1] = index
				widths[index], heights[index] = wdb.width, wdb.height
			else
				columns[#columns + 1] = index
			end
		end
	end
end

local function SplitSlot(index, count, vertical, inner, minSize)
	local remaining = vertical and widths[index] or heights[index]

	for child = 1, count do
		if hosts[child] == index then
			remaining = remaining - inner

			local share = floor(remaining * (DM.db.windows[child].attachSize or 50) / 100 + 0.5)
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

-- ElvUI keeps disabled movers around, this only flips them back and forth
local function ToggleMover(name, enabled)
	if enabled then
		if E.DisabledMovers[name] then
			E:EnableMover(name)
		end
	elseif E.CreatedMovers[name] then
		E:DisableMover(name)

		-- ElvUI profile switches re-enable disabled movers unless shouldDisable returns true
		E.DisabledMovers[name].shouldDisable = function() return true end
	end
end

-- Custom placed windows are dragged around with their own mover
local function UpdateWindowMover(window, index, custom)
	local name = 'LuckyoneUI_DamageMeterWindow' .. index .. 'Mover'

	if window.mover then
		ToggleMover(name, custom)

		if custom then
			E:SetMoverPoints(name, window)
		end
	elseif custom then
		-- The mover spawns wherever the window sits right now
		if not window:GetPoint() then
			window:Point('TOPLEFT', DM.holder, 'TOPLEFT', 0, 0)
		end

		E:CreateMover(window, name, Private.Name .. ' ' .. L["Damage Meter"] .. ' ' .. index, nil, nil, nil, 'ALL,GENERAL', nil, 'LuckyoneUI,damageMeter')
	end
end

-- Custom placed windows are positioned by ElvUI movers, the profile export carries them along
function Private:DamageMeter_ExportMovers()
	local movers, db = {}, E.db.movers
	for index = 1, 4 do
		local name = 'LuckyoneUI_DamageMeterWindow' .. index .. 'Mover'
		movers[name] = db and db[name]
	end

	return movers
end

-- Profile import, the reload applies them through E:SetMoversPositions
function Private:DamageMeter_ImportMovers(movers)
	E.db.movers = E.db.movers or {}
	MergeTable(E.db.movers, movers)
end

-- Windows attached to this one get their own slot back
local function ReleaseAttached(db, index)
	for other = 1, 4 do
		local wdb = db.windows[other]

		if wdb.attachTo == index then
			wdb.attachTo = 0
			wdb.placement = 'AUTO'
		end
	end
end

-- Config setters, DM.db follows the profile only in DamageMeter_Update
function DM:SetWindowPlacement(index, value)
	local db = Private.Addon.db.profile.damageMeter
	db.windows[index].placement = value

	if value == 'ATTACH' then
		ReleaseAttached(db, index)
	else
		db.windows[index].attachTo = 0
	end

	Private:DamageMeter_Update()
end

function DM:SetWindowAttachTo(index, value)
	local db = Private.Addon.db.profile.damageMeter
	db.windows[index].attachTo = value

	if value ~= 0 then
		ReleaseAttached(db, index)
	end

	Private:DamageMeter_Update()
end

-- An existing window switches right away
function DM:SetWindowMeterType(index, value)
	Private.Addon.db.profile.damageMeter.windows[index].meterType = value

	local window = DM.windows[index]
	if window then
		DM:SetWindowType(window, value)
	end
end

-- Delves need special treatment, they don't fire a real loading screen
-- The party keeps its delve after leaving it, real instances keep their own type
local function GetInstanceType()
	local _, instanceType, _, _, _, _, _, instanceID = GetInstanceInfo()
	if instanceType == 'none' and HasActiveDelve() then
		instanceType = 'scenario'
	end

	return instanceType, instanceID
end

-- Content types
local ContentScopes = {
	none = 'world',
	party = 'dungeon',
	scenario = 'dungeon', -- Includes Delve
	raid = 'raid',
	pvp = 'pvp',
	arena = 'pvp',
}

-- Override, zero leaves it alone
local function GetWindowCount()
	local scope = ContentScopes[GetInstanceType()] or 'world'
	local override = DM.db.contentWindows[scope]

	return override > 0 and override or DM.db.windowCount
end

-- Columns split the holder along one axis, custom placed windows sit outside of it
local function LayoutWindows()
	local db = DM.db
	local holder = DM.holder

	local vertical = db.orientation == 'VERTICAL'
	local count = activeCount
	local inner, outer = db.innerSpacing, db.outerSpacing
	local minSize = db.headerHeight + db.barHeight

	BuildRoots(count)

	-- The chat panel gives the holder its size, the columns split it evenly
	local chat = E.db.chat
	local holderWidth = chat.separateSizes and chat.panelWidthRight or chat.panelWidth
	local holderHeight = chat.separateSizes and chat.panelHeightRight or chat.panelHeight
	local columnCount = #columns

	if columnCount > 0 then
		local size = ((vertical and holderHeight or holderWidth) - outer * 2 - (columnCount - 1) * inner) / columnCount

		for _, index in ipairs(columns) do
			widths[index] = vertical and holderWidth or size
			heights[index] = vertical and size or holderHeight
		end
	end

	-- Attached windows take their share from the root they sit under
	for index = 1, count do
		if hosts[index] == 0 then
			SplitSlot(index, count, vertical, inner, minSize)
		end
	end

	holder:Size(max(holderWidth, minSize), max(holderHeight, minSize))

	local previous

	for _, index in ipairs(columns) do
		local window = DM.windows[index]
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

	-- The mover owns the position, the layout only keeps the size
	for _, index in ipairs(floating) do
		local window = DM.windows[index]
		window:Size(widths[index], heights[index])
		window:Show()

		PlaceAttached(index, count, vertical, inner)
	end

	for index, window in pairs(DM.windows) do
		if index > count then
			UpdateWindowMover(window, index, false)
			window:Hide()
		else
			UpdateWindowMover(window, index, db.windows[index].placement == 'CUSTOM')
			DM:UpdateWindowGeometry(window, heights[index])
		end
	end
end

local initialized, reloadingUI

local function Initialize()
	if initialized then return end
	initialized = true

	local holder = CreateFrame('Frame', 'LuckyoneUI_DamageMeterHolder', E.UIParent)
	holder:SetFrameStrata('LOW')
	holder:Point('BOTTOMRIGHT', _G.RightChatPanel or E.UIParent, 'BOTTOMRIGHT', 0, 0)
	DM.holder = holder

	-- Attempt to keep data on reloads
	hooksecurefunc(C_UI, 'Reload', function() reloadingUI = true end)

	-- The holder follows the right chat panel around
	hooksecurefunc(E:GetModule('Chat'), 'PositionChats', function()
		if DM.db.enable then
			LayoutWindows()
			DM:RefreshAll()
		end
	end)

	E.valueColorUpdateFuncs.LuckyoneUI_DamageMeterModule = function()
		if DM.db.enable and DM.db.useValueColor then
			for _, window in pairs(DM.windows) do
				DM:UpdateHeaderColors(window)
			end

			if DM.popup and DM.popup:IsShown() then
				DM:ApplyPopupSettings(DM.popup)
			end
		end
	end

	-- Make sure both WindTools modules are off
	-- Their layout forces Blizzard Meter to be shown
	if Private.IsAddOnLoaded('ElvUI_WindTools') then
		local layout = E.db.WT and E.db.WT.combat and E.db.WT.combat.damageMeterLayout
		if layout then layout.enable = false end

		local skin = E.private.WT and E.private.WT.skins and E.private.WT.skins.damageMeter
		if skin then skin.enable = false end
	end

	DM:RegisterEvent('DAMAGE_METER_COMBAT_SESSION_UPDATED')
	DM:RegisterEvent('DAMAGE_METER_CURRENT_SESSION_UPDATED')
	DM:RegisterEvent('DAMAGE_METER_RESET')
	DM:RegisterEvent('PLAYER_REGEN_ENABLED')
	DM:RegisterEvent('PLAYER_ENTERING_WORLD')
	DM:RegisterEvent('PLAYER_LOGOUT')

	-- Delves skip the loading screen
	DM:RegisterEvent('ACTIVE_DELVE_DATA_UPDATE')

	-- Combat and group changes only touch the visibility rule
	DM:RegisterEvent('PLAYER_REGEN_DISABLED', 'UpdateShown')
	DM:RegisterEvent('GROUP_ROSTER_UPDATE', 'UpdateShown')
end

-- Wipe all sessions, confirmed in chat
function DM:ResetData()
	ResetAllCombatSessions()
	Private:Print(L["Damage Meter data has been reset."])
end

-- Reset data popup
-- StaticPopup_Show('LUCKYONE_DM_RESET')
_G.StaticPopupDialogs['LUCKYONE_DM_RESET'] = {
	text = Private.Name .. ' ' .. L["Damage Meter"] .. '|n|n' .. L["Reset all data?"],
	button1 = OKAY,
	button2 = CANCEL,
	OnAccept = function() DM:ResetData() end,
	whileDead = 1,
	hideOnEscape = 1,
	preferredIndex = 3,
}

-- Instance types the auto reset can watch, scenarios cover Delves
local InstanceScopes = {
	party = true,
	raid = true,
	scenario = true,
}

local lastInstanceID

-- Offer a data reset when the instance actually changes
-- A Delve keeps the outdoor instance ID, leaving it clears the last one so the next Delve counts again
local function CheckAutoReset(initLogin, isReload)
	-- The events stay registered after the module is switched off
	if not DM.db.enable then return end

	local instanceType, instanceID = GetInstanceType()
	local scope = InstanceScopes[instanceType] and instanceType or nil
	local last = lastInstanceID

	-- Track where we are even while the option is off
	lastInstanceID = scope and instanceID or nil

	if initLogin or isReload then return end
	if not scope or instanceID == last then return end

	local mode = DM.db.autoReset
	if mode == 'NONE' then return end

	if not DM.db.autoResetTypes[scope] then return end

	if mode == 'AUTO' then
		DM:ResetData()
	else
		StaticPopup_Show('LUCKYONE_DM_RESET')
	end
end

-- The data comes from the client either way, we don't need their meter on+hidden
-- Its auto reset would wipe the data behind our own Auto Reset option
local function DisableBlizzardMeter()
	if GetCVarBool('damageMeterEnabled') then SetCVar('damageMeterEnabled', 0) end
	if GetCVarBool('damageMeterResetOnNewInstance') then SetCVar('damageMeterResetOnNewInstance', 0) end
end

function DM:PLAYER_ENTERING_WORLD(_, initLogin, isReload)
	-- The events stay registered after the module is switched off
	if not DM.db.enable then return end

	-- New content type?
	if GetWindowCount() ~= activeCount then
		Private:DamageMeter_Update()
	else
		DisableBlizzardMeter()
		DM:UpdateShown()
		DM:MarkAllDirty()
	end

	CheckAutoReset(initLogin, isReload)
end

-- Fires when a Delve starts or shuts down, without a loading screen
function DM:ACTIVE_DELVE_DATA_UPDATE()
	-- The events stay registered after the module is switched off
	if not DM.db.enable then return end

	if GetWindowCount() ~= activeCount then
		Private:DamageMeter_Update()
	end

	CheckAutoReset()
end

function DM:PLAYER_LOGOUT()
	if not DM.db.enable then return end
	if not DM.db.resetOnLogout then return end
	if reloadingUI then return end

	ResetAllCombatSessions()
end

-- Re-render after combat when the amounts stop being secret
function DM:PLAYER_REGEN_ENABLED()
	DM:UpdateShown()
	DM:MarkAllDirty()
end

function Private:DamageMeter_Update()
	local db = Private.Addon.db.profile.damageMeter
	DM.db = db

	-- The popup and the bookmarks rebuild themselves the next time they open
	DM:ClosePopup()
	DM:CloseAllBookmarks()

	if not db.enable then
		if DM.holder then
			-- Custom placed windows would keep their mover
			for index, window in pairs(DM.windows) do
				UpdateWindowMover(window, index, false)
			end

			DM.holder:Hide()
		end
		return
	end

	Initialize()
	DisableBlizzardMeter()

	local count = GetWindowCount()
	activeCount = count

	for index = 1, count do
		DM:ApplyWindowSettings(DM:GetWindow(index))
	end

	LayoutWindows()
	DM:UpdateShown()
	DM:RefreshAll()
end

-- Restore profile defaults config button
function Private:DamageMeter_ResetDefaults()
	Private:ResetDefaults(Private.Addon.db.profile.damageMeter, Private.Defaults.profile.damageMeter)

	for _, window in pairs(DM.windows) do
		window.meterType = nil
		window.sessionType = nil
		window.sessionID = nil
		window.offset = 0
	end

	Private:DamageMeter_Update()
end

function DM:OnEnable()
	Private:DamageMeter_Update()
end
