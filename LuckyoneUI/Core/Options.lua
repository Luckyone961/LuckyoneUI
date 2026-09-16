local _, Private = ...

if Private.ElvUI then
	return
end

-- Standalone config for the Blizzard settings panel
-- Made for the ACH table from Config.lua

local ipairs = ipairs
local next = next
local pairs = pairs
local tonumber = tonumber
local tostring = tostring
local type = type
local unpack = unpack
local concat = table.concat
local sort = table.sort
local wipe = table.wipe
local format = string.format
local gsub = string.gsub
local strtrim = strtrim
local strcmputf8i = strcmputf8i

local _G = _G
local CreateColor = CreateColor
local CreateColorFromHexString = CreateColorFromHexString
local CreateFrame = CreateFrame
local FormatPercentage = FormatPercentage
local MinimalSliderWithSteppersMixin = MinimalSliderWithSteppersMixin
local PlaySound = PlaySound
local SOUNDKIT = SOUNDKIT
local Settings = Settings
local SettingsTooltip = SettingsTooltip
local StaticPopup_Show = StaticPopup_Show
local StaticPopupDialogs = StaticPopupDialogs
local UIParent = UIParent
local GRAY_FONT_COLOR = _G.GRAY_FONT_COLOR
local NORMAL_FONT_COLOR = _G.NORMAL_FONT_COLOR

local ACCEPT = ACCEPT
local NO = NO
local YES = YES

-- Confirmation for options
-- StaticPopup_Show('LUCKYONE_CONFIRM', text, nil, { run = func, cancel = func })
StaticPopupDialogs['LUCKYONE_CONFIRM'] = {
	text = '%s',
	button1 = YES,
	button2 = NO,
	OnAccept = function(_, data) data.run() end,
	OnCancel = function(_, data) if data.cancel then data.cancel() end end,
	whileDead = 1,
	hideOnEscape = 1,
}

local proxies = {} -- Every value setting
local refreshSetting -- Dummy setting so the disabled states follow the values

-- Values that changed under the hood
-- Every row re-checks its disabled state
local function Refresh()
	for i = 1, #proxies do
		local proxy = proxies[i]
		local value = proxy.get()
		if value ~= proxy.value then
			proxy.value = value
			proxy.setting:NotifyUpdate()
		end
	end

	refreshSetting:NotifyUpdate()
end

-- We have our own reset buttons
-- So the Defaults button top right should be no-op
local function RegisterProxy(category, info, varType, name, get, set)
	local setting = Settings.RegisterProxySetting(category, 'LUCKYONEUI_' .. concat(info, '_'), varType, name, get, get, set)
	proxies[#proxies + 1] = { setting = setting, get = get }

	return setting
end

-- AceConfig fields are plain values or functions that get the info table
local function Resolve(value, info)
	if type(value) == 'function' then
		return value(info)
	end

	return value
end

-- Groups pass 'disabled' and 'hidden' ACH down to everything inside
local function Inherit(checks, value, info)
	if not value then return checks end

	local list = {}
	for i = 1, #checks do
		list[i] = checks[i]
	end

	list[#list + 1] = (type(value) == 'function' and function() return value(info) end) or function() return true end

	return list
end

local function AnyTrue(checks)
	for i = 1, #checks do
		if checks[i]() then return true end
	end
end

-- Hidden rows leave the list
-- Disabled rows grey out and re-check on every refresh
local function ApplyChecks(initializer, disabled, hidden)
	if #hidden > 0 then
		initializer:AddShownPredicate(function() return not AnyTrue(hidden) end)
	end

	if #disabled > 0 then
		initializer:AddModifyPredicate(function() return not AnyTrue(disabled) end)
		initializer:AddEvaluateStateCVar('LUCKYONEUI_REFRESH')
	end
end

-- Confirm is true or a function
local function Ask(option, info, text, run, cancel)
	if not Resolve(option.confirm, info) then return run() end

	StaticPopup_Show('LUCKYONE_CONFIRM', option.confirmText or text, nil, { run = run, cancel = cancel })
end

local function SortedKeys(args)
	local keys = {}
	for key in pairs(args) do
		keys[#keys + 1] = key
	end

	sort(keys, function(a, b)
		local orderA, orderB = args[a].order or 100, args[b].order or 100
		if orderA ~= orderB then return orderA < orderB end
		return a < b
	end)

	return keys
end

-- The category list is plain text, icons from GetIconName stay out
local function CategoryName(name)
	return strtrim((gsub(name, '|T.-|t', '')))
end

local function SetLabelEnabled(label, enabled)
	local color = enabled and NORMAL_FONT_COLOR or GRAY_FONT_COLOR
	label:SetTextColor(color:GetRGB())
end

-- The scroll box hands us plain frames that we fill on demand
local function CustomRow(extent, init, release)
	local initializer = Settings.CreateElementInitializer('Frame', {})
	initializer.GetExtent = function() return extent end
	initializer.InitFrame = init
	initializer.Resetter = release
	return initializer
end

-- Headers, same font and offsets as the Blizzard section header but without the hover tooltip
local function AddHeader(category, name, hidden, font)
	local initializer = CustomRow(45, function(_, frame)
		local text = frame.Header
		if not text then
			text = frame:CreateFontString(nil, 'ARTWORK')
			text:SetPoint('TOPLEFT', 7, -16)
			frame.Header = text
		end

		text:SetFontObject(font or 'GameFontHighlightLarge')
		text:SetText(name)
		text:Show()
	end, function(_, frame)
		frame.Header:Hide()
	end)

	ApplyChecks(initializer, {}, hidden)
	Settings.RegisterInitializer(category, initializer)
end

-- Custom backdrop behind descriptions and the multiline inputs
local function CreateBox(parent)
	local box = CreateFrame('Frame', nil, parent, 'BackdropTemplate')
	box:SetBackdrop({ bgFile = 'Interface\\Buttons\\WHITE8x8', edgeFile = 'Interface\\Buttons\\WHITE8x8', edgeSize = 1 })
	box:SetBackdropColor(0, 0, 0, 0.5)
	box:SetBackdropBorderColor(0.3, 0.3, 0.3)
	return box
end

-- Description, measured once so the row gets the right height before it exists
local measure = UIParent:CreateFontString(nil, 'ARTWORK', 'GameFontHighlight')
measure:SetPoint('TOP', UIParent, 'BOTTOM', 0, -1000)
measure:SetWidth(550)

local function AddDescription(category, name, hidden)
	measure:SetText(name)

	-- 8px of padding around the text, 2px between the box and the rows next to it
	local initializer = CustomRow(measure:GetStringHeight() + 20, function(_, frame)
		local box = frame.Description
		if not box then
			box = CreateBox(frame)
			box:SetPoint('TOPLEFT', 37, -2)
			box:SetPoint('BOTTOMRIGHT', -20, 2)

			box.Text = box:CreateFontString(nil, 'ARTWORK', 'GameFontHighlight')
			box.Text:SetPoint('TOPLEFT', 8, -8)
			box.Text:SetPoint('RIGHT', -8, 0)
			box.Text:SetJustifyH('LEFT')
			box.Text:SetWordWrap(true)
			frame.Description = box
		end

		box.Text:SetText(name)
		box:Show()
	end, function(_, frame)
		frame.Description:Hide()
	end)

	ApplyChecks(initializer, {}, hidden)
	Settings.RegisterInitializer(category, initializer)
end

-- Range
local function AddRange(category, info, name, desc, get, set, option)
	local min, max, step = option.min or 0, option.max or 1, option.step or 1
	local fmt = (step >= 1 and '%.0f') or (step >= 0.1 and '%.1f') or '%.2f'

	local setting = RegisterProxy(category, info, Settings.VarType.Number, name, function() return tonumber(get(info)) or min end, function(value)
		value = tonumber(format(fmt, value)) -- Sliders hand out float noise
		if value == get(info) then return end

		set(info, value)
		Refresh()
	end)

	local options = Settings.CreateSliderOptions(min, max, step)
	options:SetLabelFormatter(MinimalSliderWithSteppersMixin.Label.Right, option.isPercent and FormatPercentage or function(value) return format(fmt, value) end)

	return Settings.CreateSlider(category, setting, options, desc)
end

-- Select, the dropdown only knows strings
local function StripCodes(label)
	return (gsub(gsub(label, '|c%x%x%x%x%x%x%x%x', ''), '|r', ''))
end

local function ByLabel(a, b)
	return strcmputf8i(a.plain, b.plain) < 0
end

local function ByKey(a, b)
	return a.key < b.key
end

local function AddSelect(category, info, name, desc, get, set, option, path)
	if option.dialogControl then
		error(format('LuckyoneUI: %s uses %s, not supported without ElvUI', concat(path, '.'), option.dialogControl))
	end

	local keys, labels = {}, {}

	local function Options()
		local entries = {}
		local numeric = true
		wipe(keys)
		wipe(labels)

		for key, label in pairs(Resolve(option.values, info)) do
			local id = tostring(key)
			keys[id] = key
			labels[id] = label
			entries[#entries + 1] = { key = key, label = label, plain = StripCodes(label) }
			if type(key) ~= 'number' then numeric = false end
		end

		sort(entries, numeric and ByKey or ByLabel)

		local container = Settings.CreateControlTextContainer()
		for _, entry in ipairs(entries) do
			container:Add(tostring(entry.key), entry.label)
		end

		return container:GetData()
	end

	-- A declined confirm puts the dropdown back on the stored value
	local setting
	setting = RegisterProxy(category, info, Settings.VarType.String, name, function()
		local value = get(info)
		return value == nil and '' or tostring(value)
	end, function(id)
		local key = keys[id]
		if key == nil then key = id end

		Ask(option, info, format('%s\n\n%s', name, labels[id] or id), function()
			set(info, key)
			Refresh()
		end, function() setting:NotifyUpdate() end)
	end)

	return Settings.CreateDropdown(category, setting, Options, desc)
end

-- Colors
local function AddColor(category, info, name, desc, get, set, option, path)
	if option.hasAlpha then
		error(format('LuckyoneUI: %s uses alpha, not supported without ElvUI', concat(path, '.')))
	end

	local setting = RegisterProxy(category, info, Settings.VarType.String, name, function()
		local r, g, b = get(info)
		return CreateColor(r or 1, g or 1, b or 1):GenerateHexColor()
	end, function(hex)
		local r, g, b = CreateColorFromHexString(hex):GetRGB()
		set(info, r, g, b)
		Refresh()
	end)

	return Settings.CreateColorSwatch(category, setting, desc)
end

local function TooltipLeave()
	SettingsTooltip:Hide()
end

-- Toggles and executes pack three per row like the ACH layout
local function EntryEnter(self)
	SettingsTooltip:SetOwner(self, 'ANCHOR_RIGHT')
	Settings.InitTooltip(self.entry.name, self.entry.desc)
	SettingsTooltip:Show()
end

local function EntryText(entry)
	return entry.desc and format('%s\n\n%s', entry.name, entry.desc) or entry.name
end

local function ButtonClick(self)
	local entry = self.entry
	Ask(entry.option, entry.info, EntryText(entry), function()
		entry.option.func(entry.info)
		Refresh()
	end)
end

local function ToggleClick(self)
	local entry = self.entry
	local checked = self:GetChecked()
	PlaySound(checked and SOUNDKIT.IG_MAINMENU_OPTION_CHECKBOX_ON or SOUNDKIT.IG_MAINMENU_OPTION_CHECKBOX_OFF)

	-- A declined confirm reads the box back from the config
	Ask(entry.option, entry.info, EntryText(entry), function()
		entry.set(entry.info, checked)
		Refresh()
	end, Refresh)
end

local function CreateSlotButton(frame)
	local button = CreateFrame('Button', nil, frame, 'UIPanelButtonTemplate')
	button:SetSize(188, 22)
	button:SetScript('OnClick', ButtonClick)
	button:SetScript('OnEnter', EntryEnter)
	button:SetScript('OnLeave', TooltipLeave)
	return button
end

-- The label belongs to the click area of the box
local function CreateSlotToggle(frame)
	local check = CreateFrame('CheckButton', nil, frame, 'SettingsCheckboxTemplate')
	check:SetHitRectInsets(0, -166, 0, 0)
	check:SetScript('OnClick', ToggleClick)
	check:SetScript('OnEnter', EntryEnter)
	check:SetScript('OnLeave', TooltipLeave)

	check.Label = check:CreateFontString(nil, 'ARTWORK', 'GameFontNormal')
	check.Label:SetPoint('LEFT', check, 'RIGHT', 2, 0)
	check.Label:SetWidth(162)
	check.Label:SetJustifyH('LEFT')
	check.Label:SetWordWrap(false)

	return check
end

-- Hidden slots drop out
local function UpdateSlots(frame)
	local x = 37

	for i, entry in ipairs(frame.row) do
		local slot = frame.slots[i]
		if AnyTrue(entry.hidden) then
			slot:Hide()
		else
			local enabled = not AnyTrue(entry.disabled)
			slot:SetPoint('LEFT', x, 0)
			slot:SetEnabled(enabled)

			if slot.Label then
				slot:SetChecked(entry.get(entry.info) and true or false)
				SetLabelEnabled(slot.Label, enabled)
			end

			slot:Show()
			x = x + 196
		end
	end
end

local function AddSlots(category, row, rowType, tags)
	local initializer = CustomRow(26, function(_, frame)
		frame.row = row

		local key = rowType == 'toggle' and 'Toggles' or 'Buttons'
		frame[key] = frame[key] or {}
		frame.slots = frame[key]

		for i, entry in ipairs(row) do
			local slot = frame.slots[i]
			if not slot then
				slot = (rowType == 'toggle' and CreateSlotToggle or CreateSlotButton)(frame)
				frame.slots[i] = slot
			end

			slot.entry = entry

			if slot.Label then
				slot.Label:SetText(entry.name)
			else
				slot:SetText(entry.name)
			end
		end

		UpdateSlots(frame)
		frame.refreshHandle = Settings.SetOnValueChangedCallback('LUCKYONEUI_REFRESH', UpdateSlots, frame)
	end, function(_, frame)
		if frame.refreshHandle then
			frame.refreshHandle:Unregister()
			frame.refreshHandle = nil
		end

		frame.row = nil

		for i = 1, #frame.slots do
			frame.slots[i]:Hide()
		end

		frame.slots = nil
	end)

	-- All hidden, remove the entire row
	local allChecked = true
	initializer:AddSearchTags(unpack(tags))
	for i = 1, #row do
		initializer:AddSearchTags(row[i].name)
		if #row[i].hidden == 0 then allChecked = false end
	end

	if allChecked then
		initializer:AddShownPredicate(function()
			for i = 1, #row do
				if not AnyTrue(row[i].hidden) then return true end
			end

			return false
		end)
	end

	Settings.RegisterInitializer(category, initializer)
end

-- Input, one editbox for a line
local function InputEnterPressed(self)
	local row = self:GetParent().row
	if row.set then
		row.set(row.info, self:GetText())
		Refresh()
	end

	self:ClearFocus()
end

local function InputEscapePressed(self)
	self:ClearFocus()
end

local function InputFocusGained(self)
	self:HighlightText()
end

local function InputFocusLost(self)
	local row = self:GetParent().row
	self:SetText(tostring(row.get(row.info) or ''))
	self:HighlightText(0, 0)
end

local function InputEnter(self)
	local row = self:GetParent().row
	if not row.desc then return end

	SettingsTooltip:SetOwner(self, 'ANCHOR_RIGHT')
	Settings.InitTooltip(row.name, row.desc)
	SettingsTooltip:Show()
end

local function MultilineAccept(self)
	local frame = self:GetParent()
	local row = frame.row
	if row.set then
		row.set(row.info, frame.Multiline:GetInputText())
		Refresh()
	end

	frame.Multiline:ClearFocus()
end

local function UpdateInput(frame)
	local row = frame.row
	local enabled = not AnyTrue(row.disabled)
	local box = row.multiline and frame.Multiline or frame.Input

	box:SetEnabled(enabled)
	SetLabelEnabled(frame.InputLabel, enabled)

	if row.multiline then
		frame.MultilineAccept:SetEnabled(enabled)
	end

	if not box:HasFocus() then
		box:SetText(tostring(row.get(row.info) or ''))
	end
end

local function AddInput(category, info, name, desc, get, set, option, disabled)
	local row = { name = name, desc = desc, get = get, set = set, info = info, disabled = disabled, multiline = option.multiline, full = option.width == 'full' }

	local initializer = CustomRow(row.multiline and 150 or 26, function(_, frame)
		frame.row = row

		local label = frame.InputLabel
		if not label then
			label = frame:CreateFontString(nil, 'ARTWORK', 'GameFontNormal')
			label:SetJustifyH('LEFT')
			label:SetWordWrap(false)
			frame.InputLabel = label
		end

		label:SetText(name)
		label:ClearAllPoints()
		label:Show()

		if row.multiline then
			local box = frame.Multiline
			if not box then
				local backdrop = CreateBox(frame)
				frame.MultilineBackdrop = backdrop

				box = CreateFrame('Frame', nil, frame, 'ScrollingEditBoxTemplate')
				box:SetPoint('TOPLEFT', 37, -26)
				box:SetPoint('BOTTOMRIGHT', -60, 6)
				box:SetTextInsets(4, 4, 4, 4)
				backdrop:SetPoint('TOPLEFT', box, -1, 1)
				backdrop:SetPoint('BOTTOMRIGHT', box, 1, -1)
				frame.Multiline = box

				local accept = CreateFrame('Button', nil, frame, 'UIPanelButtonTemplate')
				accept:SetSize(100, 22)
				accept:SetPoint('TOPRIGHT', -60, 0)
				accept:SetText(ACCEPT)
				accept:SetScript('OnClick', MultilineAccept)
				frame.MultilineAccept = accept
			end

			label:SetPoint('TOPLEFT', 37, -4)
			label:SetPoint('RIGHT', frame.MultilineAccept, 'LEFT', -10, 0)
			frame.MultilineBackdrop:Show()
			frame.MultilineAccept:Show()
			box:Show()
		else
			local box = frame.Input
			if not box then
				box = CreateFrame('EditBox', nil, frame, 'InputBoxTemplate')
				box:SetHeight(20)
				box:SetAutoFocus(false)
				box:SetScript('OnEnterPressed', InputEnterPressed)
				box:SetScript('OnEscapePressed', InputEscapePressed)
				box:SetScript('OnEditFocusGained', InputFocusGained)
				box:SetScript('OnEditFocusLost', InputFocusLost)
				box:SetScript('OnEnter', InputEnter)
				box:SetScript('OnLeave', TooltipLeave)
				frame.Input = box
			end

			label:SetPoint('LEFT', 37, 0)
			label:SetPoint('RIGHT', frame, 'CENTER', -85, 0)
			box:ClearAllPoints()
			box:SetPoint('LEFT', frame, 'CENTER', -80, 0)

			if row.full then
				box:SetPoint('RIGHT', -60, 0)
			else
				box:SetWidth(250)
			end

			box:Show()
		end

		UpdateInput(frame)
		frame.refreshHandle = Settings.SetOnValueChangedCallback('LUCKYONEUI_REFRESH', UpdateInput, frame)
	end, function(_, frame)
		if frame.refreshHandle then
			frame.refreshHandle:Unregister()
			frame.refreshHandle = nil
		end

		frame.row = nil
		frame.InputLabel:Hide()

		if frame.Input then frame.Input:Hide() end
		if frame.Multiline then
			frame.Multiline:Hide()
			frame.MultilineBackdrop:Hide()
			frame.MultilineAccept:Hide()
		end
	end)

	return initializer
end

-- Inline groups turn into headers, the other groups into subcategories
-- Only one level of subcategories
local function AddOptions(category, args, path, get, set, disabled, hidden, nested, tags)
	local pending, pendingType = {}, nil -- Consecutive toggles or executes waiting for their shared row

	local function Flush()
		if #pending > 0 then
			AddSlots(category, pending, pendingType, tags)
			pending = {}
		end
	end

	for _, key in ipairs(SortedKeys(args)) do
		local option = args[key]

		if option.hidden ~= true and not (option.type == 'group' and next(option.args) == nil) then
			if option.type ~= pendingType then
				Flush()
			end

			path[#path + 1] = key

			local info = { unpack(path) }
			local optionGet = option.get or get
			local optionSet = option.set or set
			local optionDisabled = Inherit(disabled, option.disabled, info)
			local optionHidden = Inherit(hidden, option.hidden, info)
			local name = Resolve(option.name, info) or ''
			local desc = Resolve(option.desc, info)
			local optionType = option.type

			if optionType == 'group' then
				local groupTags = { unpack(tags) }
				if name ~= '' then
					groupTags[#groupTags + 1] = StripCodes(CategoryName(name))
				end

				if option.inline or nested then
					if name ~= '' then
						AddHeader(category, name, optionHidden, not option.inline and 'GameFontNormalHuge')
					end

					AddOptions(category, option.args, path, optionGet, optionSet, optionDisabled, optionHidden, nested, groupTags)
				else
					AddOptions(Settings.RegisterVerticalLayoutSubcategory(category, CategoryName(name)), option.args, path, optionGet, optionSet, optionDisabled, optionHidden, true, groupTags)
				end
			elseif optionType == 'header' then
				if name ~= '' and CategoryName(name) ~= category:GetName() then -- The panel already shows the category name as the page title
					AddHeader(category, name, optionHidden)
				end
			elseif optionType == 'description' then
				if strtrim(name) ~= '' then -- Spacers are descriptions with a blank name
					AddDescription(category, name, optionHidden)
				end
			elseif optionType == 'toggle' or optionType == 'execute' then
				pending[#pending + 1] = { name = name, desc = desc, option = option, info = info, get = optionGet, set = optionSet, disabled = optionDisabled, hidden = optionHidden }
				pendingType = optionType

				if #pending == 3 then
					Flush()
				end
			elseif optionType == 'range' then
				local initializer = AddRange(category, info, name, desc, optionGet, optionSet, option)
				initializer:AddSearchTags(unpack(tags))
				ApplyChecks(initializer, optionDisabled, optionHidden)
			elseif optionType == 'select' then
				local initializer = AddSelect(category, info, name, desc, optionGet, optionSet, option, path)
				initializer:AddSearchTags(unpack(tags))
				ApplyChecks(initializer, optionDisabled, optionHidden)
			elseif optionType == 'color' then
				-- A disabled color leaves the list like a hidden one
				local initializer = AddColor(category, info, name, desc, optionGet, optionSet, option, path)
				initializer:AddSearchTags(unpack(tags))
				ApplyChecks(initializer, {}, Inherit(optionHidden, #optionDisabled > 0 and function() return AnyTrue(optionDisabled) end))
			elseif optionType == 'input' then
				local initializer = AddInput(category, info, name, desc, optionGet, optionSet, option, optionDisabled)
				initializer:AddSearchTags(name, unpack(tags))
				ApplyChecks(initializer, {}, optionHidden)
				Settings.RegisterInitializer(category, initializer)
			else
				error(format('LuckyoneUI: %s is a %s, not supported without ElvUI', concat(path, '.'), tostring(optionType)))
			end

			path[#path] = nil
		end
	end

	Flush()
end

-- Called once at PLAYER_LOGIN inside Init.lua, the panel keeps the categories for the session
function Private:RegisterSettings()
	local config = Private.Config
	local root = Settings.RegisterVerticalLayoutCategory(CategoryName(config.name))

	refreshSetting = Settings.RegisterProxySetting(root, 'LUCKYONEUI_REFRESH', Settings.VarType.Boolean, 'LuckyoneUI', false, function() return false end, function() end)

	AddOptions(root, config.args, {}, config.get, config.set, {}, {}, false, {})

	Settings.RegisterAddOnCategory(root)
	Private.SettingsCategoryID = root:GetID()
end
