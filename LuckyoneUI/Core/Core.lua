local Name, Private = ...
local L = Private.L
local LDB = Private.Libs.LDB
local LDBI = Private.Libs.LDBI
local LSM = Private.Libs.LSM
local Core = Private.Modules.Core

local gsub = string.gsub
local max = math.max
local min = math.min
local next = next
local pairs = pairs
local print = print
local strfind = string.find
local strlower = string.lower
local tonumber = tonumber
local wipe = table.wipe

local C_UI = C_UI
local CopyTable = CopyTable
local DisableAddOn = C_AddOns.DisableAddOn
local EnableAddOn = C_AddOns.EnableAddOn
local GetAddOnEnableState = C_AddOns.GetAddOnEnableState
local GetAddOnInfo = C_AddOns.GetAddOnInfo
local GetCursorPosition = GetCursorPosition
local GetCVar = C_CVar.GetCVar
local GetCVarBool = C_CVar.GetCVarBool
local GetNumAddOns = C_AddOns.GetNumAddOns
local InCombatLockdown = InCombatLockdown
local IsShiftKeyDown = IsShiftKeyDown
local LoadAddOn = C_AddOns.LoadAddOn
local MergeTable = MergeTable
local SetCVar = C_CVar.SetCVar

local _G = _G
local UIParent = _G.UIParent

local Settings_OpenToCategory = _G.Settings.OpenToCategory
local SlashCmdList = _G.SlashCmdList
local StaticPopupDialogs = _G.StaticPopupDialogs

local ACCEPT = ACCEPT
local CANCEL = CANCEL
local OKAY = OKAY

-- Keep these enabled in debug mode
local AddOns = {
	ElvUI = true,
	ElvUI_Libraries = true,
	ElvUI_Options = true,
	LuckyoneUI = true
}

-- Chat print
function Private:Print(msg, installer)
	print(Private.Name .. ': ' .. msg)

	if installer then
		Private.Installer:ShowStatus(msg)
	end
end

-- Restore defaults config buttons, the enable toggle survives the wipe
function Private:ResetDefaults(db, defaults)
	local enable = db.enable
	wipe(db)
	MergeTable(db, CopyTable(defaults))
	db.enable = enable
end

-- Font strings and font objects share this
function Private:SetFont(text, font, size, outline)
	local shadow = strfind(outline, 'SHADOW')
	if shadow then
		outline = gsub(outline, 'SHADOW', '')
	end

	text:SetFont(LSM:Fetch('font', font), size, outline == 'NONE' and '' or outline)
	text:SetShadowColor(0, 0, 0, shadow and (outline == '' and 1 or 0.6) or 0) -- Same as ElvUI, lighter under an outline
	text:SetShadowOffset(1, -1)
end

-- Drag and drop reorder for the scrolling lists (damage meter bookmarks, mailbox favorites)
-- The list frame keeps rows, offset, total, visible, dropCount and a marker, its Layout fills the rows from the offset
local function DragList_ScrollTo(frame, offset)
	offset = min(max(offset, 0), max(frame.total - frame.visible, 0))
	if offset == frame.offset then return end

	frame.offset = offset
	frame.Layout(frame)

	return true
end

local function DragList_OnMouseWheel(frame, delta)
	DragList_ScrollTo(frame, frame.offset - delta)
end

-- The row under the cursor
local function DropIndex(frame, y)
	for index = 1, frame.dropCount do
		if y >= frame.rows[index]:GetBottom() then
			return frame.offset + index
		end
	end

	return frame.offset + frame.dropCount
end

-- One row per step while the drag sits on an edge
local function DragScroll(frame, y, elapsed)
	-- Nothing to scroll, spare rows past the end have no position either
	if frame.total <= frame.visible then return end

	local direction = 0

	if y > frame.rows[1]:GetTop() then
		direction = -1
	elseif y < frame.rows[frame.visible]:GetBottom() then
		direction = 1
	end

	if direction == 0 then
		frame.scrollWait = nil
		return
	end

	frame.scrollWait = (frame.scrollWait or 0.15) - elapsed
	if frame.scrollWait > 0 then return end

	frame.scrollWait = 0.15

	-- The rows carry other entries now, the marker has to find its place again
	if DragList_ScrollTo(frame, frame.offset + direction) then
		frame.dropIndex = nil
	end
end

-- The marker sits above the target while moving up and below it while moving down
local function DragList_OnUpdate(frame, elapsed)
	local _, y = GetCursorPosition()
	y = y / frame:GetEffectiveScale()

	DragScroll(frame, y, elapsed or 0)

	local index = DropIndex(frame, y)
	if index == frame.dropIndex then return end

	local row = frame.rows[index - frame.offset]
	if not row then return end

	frame.dropIndex = index

	local marker = frame.marker
	marker:ClearAllPoints()

	if index <= frame.dragIndex then
		marker:SetPoint('BOTTOMLEFT', row, 'TOPLEFT', 0, 0)
		marker:SetPoint('BOTTOMRIGHT', row, 'TOPRIGHT', 0, 0)
	else
		marker:SetPoint('TOPLEFT', row, 'BOTTOMLEFT', 0, 0)
		marker:SetPoint('TOPRIGHT', row, 'BOTTOMRIGHT', 0, 0)
	end
end

function Private:DragList_Init(frame, layout)
	frame.Layout = layout
	frame.rows = {}
	frame.offset, frame.total, frame.visible = 0, 0, 0

	frame:EnableMouseWheel(true)
	frame:SetScript('OnMouseWheel', DragList_OnMouseWheel)
end

-- The dragged row stays dimmed until the layout runs again
function Private:DragList_Start(frame, row)
	frame.dragIndex = row.index
	frame.dropIndex = nil
	frame.scrollWait = nil

	row:SetAlpha(0.4)
	frame.marker:Show()
	frame:SetScript('OnUpdate', DragList_OnUpdate)

	DragList_OnUpdate(frame)
end

-- Ends a running drag, returns where the row came from and where it was dropped
function Private:DragList_Stop(frame)
	local from, to = frame.dragIndex, frame.dropIndex

	frame:SetScript('OnUpdate', nil)
	frame.dragIndex, frame.dropIndex, frame.scrollWait = nil, nil, nil
	frame.marker:Hide()

	return from, to
end

-- Open settings helper
local function OpenSettings()
	if Private.ElvUI then
		local E = ElvUI[1]
		E:ToggleOptions('LuckyoneUI')
		E:Config_UpdateSize(true)
	elseif Private.SettingsCategoryID then
		if InCombatLockdown() then return end

		Settings_OpenToCategory(Private.SettingsCategoryID)
	end
end

-- Installer toggle helper
local function ToggleInstaller()
	if Private.Installer:IsShown() then
		Private.Installer:Hide()
	else
		Private.Installer:Show()
	end
end

-- Minimap icon toggle helper
local function SetMinimapHidden(hide)
	Private.Addon.db.profile.minimap.hide = hide

	if hide then
		LDBI:Hide(Name)
	else
		LDBI:Show(Name)
	end
end

-- Minimap icon
local LuckyoneLDB = LDB:NewDataObject(Name, {
	type = 'data source',
	text = Private.Name,
	icon = 'Interface\\AddOns\\LuckyoneUI\\Media\\Textures\\Compartment.png',
	OnClick = function(_, button)
		if button == 'LeftButton' then
			OpenSettings()
		elseif button == 'RightButton' then
			if IsShiftKeyDown() then
				SetMinimapHidden(true)
			else
				ToggleInstaller()
			end
		end
	end,
	OnTooltipShow = function(tooltip)
		tooltip:AddLine(Private.Name)
		tooltip:AddLine('\n')
		tooltip:AddLine(L["Minimap_Tooltip"])
	end,
})

-- Addon Compartment OnClick TOC func
function LuckyoneUI_OnAddonCompartmentClick()
	OpenSettings()
end

-- Reload popup
-- StaticPopup_Show('LUCKYONE_RL')
StaticPopupDialogs['LUCKYONE_RL'] = {
	text = L["Reload required - continue?"],
	button1 = ACCEPT,
	button2 = CANCEL,
	OnAccept = function() C_UI.Reload() end,
	whileDead = 1,
	hideOnEscape = false,
}

-- Editbox popup
-- StaticPopup_Show('LUCKYONE_EDITBOX', text_arg1, text_arg2, data)
local function CloseEditBox(self)
	self:GetParent():Hide()
end

StaticPopupDialogs['LUCKYONE_EDITBOX'] = {
	text = Private.Name,
	button1 = OKAY,
	hasEditBox = 1,
	-- Pooled dialogs keep the letter limit of the last popup, 0 lifts it for long strings
	maxLetters = 0,
	OnShow = function(self, data)
		local editBox = self.EditBox
		editBox:SetAutoFocus(false)
		editBox.width = editBox:GetWidth()
		editBox:SetWidth(280)
		editBox.temptxt = data
		editBox:SetText(data)
		editBox:SetJustifyH('CENTER')
	end,
	OnHide = function(self)
		local editBox = self.EditBox
		editBox:SetWidth(editBox.width or 50)
		editBox.width = nil
		editBox.temptxt = nil
	end,
	EditBoxOnEnterPressed = CloseEditBox,
	EditBoxOnEscapePressed = CloseEditBox,
	EditBoxOnTextChanged = function(self)
		if self.temptxt and self:GetText() ~= self.temptxt then
			self:SetText(self.temptxt)
		end
		self:HighlightText()
	end,
	whileDead = 1,
	preferredIndex = 3,
	hideOnEscape = 1,
}

-- Without ElvUI we set UIParent scale ourselves like ElvUI does
function Core:UpdateScale()
	if Private.ElvUI or not GetCVarBool('useUiScale') then return end

	-- UIParent holds protected frames, try again after combat
	if InCombatLockdown() then
		self:RegisterEvent('PLAYER_REGEN_ENABLED', 'UpdateScale')
		return
	end

	self:UnregisterEvent('PLAYER_REGEN_ENABLED')

	local scale = tonumber(GetCVar('uiScale'))
	if scale and scale < UIParent:GetScale() then
		UIParent:SetScale(scale)
	end
end

-- Weekly Rewards Frame chat commands
local function WeeklyRewards()
	LoadAddOn('Blizzard_WeeklyRewards')

	local frame = _G.WeeklyRewardsFrame
	if not frame then return end

	if frame:IsShown() then
		frame:Hide()
	else
		frame:Show()
	end
end

-- LuckyoneUI chat commands
local commands = {
	install = ToggleInstaller,
	config = OpenSettings,
	minimap = function() SetMinimapHidden(not Private.Addon.db.profile.minimap.hide) end,
}

local function Toggles(msg)
	local command = commands[strlower(msg)]
	if command then
		command()
	end
end

-- LuckyoneUI ElvUI debug mode
local function DebugMode(msg)
	local switch = strlower(msg)
	local disabled = Private.Addon.db.global.DebugDisabledAddOns

	-- GUID like Blizzard's AddOn list
	if switch == 'on' then
		for i = 1, GetNumAddOns() do
			local name = GetAddOnInfo(i)
			if not AddOns[name] and GetAddOnEnableState(name, Private.myGUID) > 0 then
				DisableAddOn(name, Private.myGUID)
				disabled[name] = true
			end
		end
		SetCVar('scriptErrors', 1)
		C_UI.Reload()
	elseif switch == 'off' then
		if next(disabled) then
			for name in pairs(disabled) do
				EnableAddOn(name, Private.myGUID)
			end
			wipe(disabled)
			C_UI.Reload()
		end
	else
		Private:Print('/luckydebug on - /luckydebug off')
	end
end

-- Register all commands
local function LoadCommands()
	_G.SLASH_LUCKYONEUI1 = '/lucky'
	SlashCmdList.LUCKYONEUI = Toggles
	if Private.isModern then
		commands.untrack = function() Private:UntrackAllQuests() end
	end
	if Private.isRetail then -- Retail chat commands
		_G.SLASH_LUCKYONEUI_WEEKLY1 = '/vault'
		_G.SLASH_LUCKYONEUI_WEEKLY2 = '/weekly'
		SlashCmdList.LUCKYONEUI_WEEKLY = WeeklyRewards
	end
	if Private.ElvUI then
		commands.bars = function() Private:ActionBarConverter() end
		_G.SLASH_LUCKYONEUI_DEBUG1 = '/luckydebug'
		SlashCmdList.LUCKYONEUI_DEBUG = DebugMode
	end
end

function Core:OnLogin(initLogin)
	-- Debug mode only has to survive a reload
	if initLogin then
		wipe(Private.Addon.db.global.DebugDisabledAddOns)
	end

	if Private.itsLuckyone then
		Private.Addon.db.global.dev = true
	end
end

function Core:OnEnable()
	LDBI:Register(Name, LuckyoneLDB, Private.Addon.db.profile.minimap)
	LoadCommands()

	if not Private.ElvUI then
		self:UpdateScale()
		self:RegisterEvent('UI_SCALE_CHANGED', 'UpdateScale')
	end
end
