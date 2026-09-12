local _, Private = ...
local L = Private.Libs.ACL
local AceGUI = Private.Libs.GUI
local LSM = Private.Libs.LSM

local concat = table.concat
local floor = math.floor
local format = string.format
local gmatch = string.gmatch
local ipairs = ipairs
local min = math.min
local strmatch = string.match
local wipe = table.wipe

local C_UI = C_UI
local CreateFrame = CreateFrame
local GameTooltip_Hide = GameTooltip_Hide
local PlaySound = PlaySound

local _G = _G
local CLOSE = CLOSE
local GameTooltip = GameTooltip
local StaticPopup_Show = _G.StaticPopup_Show
local UIParent = UIParent

-- Installer module
local Installer = {}
Private.Installer = Installer

local installerFrame
local pages = {}
local selections = {} -- Key of the option picked last
local currentPage = 0

local function Green(text)
	return format('|cff4beb2c%s|r', text)
end

local function Red(text)
	return format('|cffC80000%s|r', text)
end

local function ToggleDB(toggle)
	local db = Private.Addon.db.profile
	for part in gmatch(toggle.section, '[^.]+') do
		db = db[part]
	end
	return db
end

local function EnableDamageMeter()
	Private.Addon.db.profile.damageMeter.enable = true
	Private:DamageMeter_UpdateAll()
	Private:Print(L["Damage Meter module enabled."], true)
end

local function InstallComplete()
	Private:HandleLuckyoneDB()
	C_UI.Reload()
end

-- Our frame 'skin'
local function ApplyTemplate(frame)
	frame:SetBackdrop({
		bgFile = 'Interface\\Buttons\\WHITE8X8',
		edgeFile = 'Interface\\Buttons\\WHITE8X8',
		edgeSize = 1,
	})

	-- Background color: #0d0d0d + alpha 90
	frame:SetBackdropColor(0.051, 0.051, 0.051, 0.9)

	-- Border color: #000000 + alpha 100
	frame:SetBackdropBorderColor(0, 0, 0, 1)
end

local function CreateLine(parent)
	local line = parent:CreateTexture(nil, 'ARTWORK')
	line:SetColorTexture(0, 0, 0, 1)
	line:SetHeight(1)
	return line
end

local function CreateText(parent, size)
	local text = parent:CreateFontString(nil, 'OVERLAY')
	text:SetFont(LSM:Fetch('font', Private.Font), size, Private.Outline)
	return text
end

local function CreateHighlight(button)
	local highlight = button:CreateTexture(nil, 'HIGHLIGHT')
	highlight:SetAllPoints()
	highlight:SetColorTexture(1, 1, 1, 0.15)
	button:SetHighlightTexture(highlight)
end

-- Tooltips sit next to the installer so they never cover a page
local function ShowTooltip(title, text)
	GameTooltip:SetOwner(installerFrame, 'ANCHOR_NONE')
	GameTooltip:SetPoint('TOPLEFT', installerFrame.Sidebar, 'TOPRIGHT', 1, 0)
	GameTooltip:AddLine(title, 1, 1, 1)

	if text then
		GameTooltip:AddLine(text, 1, 1, 1, true)
	end

	GameTooltip:Show()
end

-- Our button 'skin'
local function CreateButton(parent, width, height)
	local button = CreateFrame('Button', nil, parent, 'BackdropTemplate')
	button:SetSize(width, height)
	button:SetMotionScriptsWhileDisabled(true)

	ApplyTemplate(button)
	button:SetBackdropColor(0.2, 0.2, 0.2, 0.8)
	CreateHighlight(button)

	button.text = CreateText(button, 12)
	button.text:SetPoint('CENTER')

	return button
end

local function SetButtonEnabled(button, enabled)
	button:SetEnabled(enabled)
	button:SetAlpha(enabled and 1 or 0.4)
end

local function SetButtonSelected(button, selected)
	if selected then
		button:SetBackdropColor(0.294, 0.922, 0.173, 0.2)
		button:SetBackdropBorderColor(0.294, 0.922, 0.173, 1)
	else
		button:SetBackdropColor(0.2, 0.2, 0.2, 0.8)
		button:SetBackdropBorderColor(0, 0, 0, 1)
	end
end

-- Sidebar, the check icon doubles as the completed state of a step
local function UpdateSidebar()
	for index, button in ipairs(installerFrame.Sidebar.Buttons) do
		if index == currentPage then
			button.bg:SetColorTexture(0.2, 0.2, 0.2, 0.9)
			button.text:SetTextColor(0, 0.702, 1) -- #00b3ff
		else
			button.bg:SetColorTexture(0.2, 0.2, 0.2, 0.5)
			button.text:SetTextColor(1, 1, 1)
		end
	end
end

local function Step_OnClick(self)
	Installer:SetPage(self:GetID())
end

local function CreateStepButton(sidebar, index, name)
	local button = CreateFrame('Button', nil, sidebar)
	button:SetSize(184, 22)
	button:SetID(index)
	button:SetScript('OnClick', Step_OnClick)

	if index == 1 then
		button:SetPoint('TOP', 0, -47)
	else
		button:SetPoint('TOP', sidebar.Buttons[index - 1], 'BOTTOM', 0, -2)
	end

	button.bg = button:CreateTexture(nil, 'BACKGROUND')
	button.bg:SetAllPoints()
	button.bg:SetColorTexture(0.2, 0.2, 0.2, 0.5)

	CreateHighlight(button)

	button.icon = button:CreateTexture(nil, 'ARTWORK')
	button.icon:SetSize(14, 14)
	button.icon:SetPoint('RIGHT', -6, 0)
	button.icon:SetTexture('Interface\\RaidFrame\\ReadyCheck-Ready')
	button.icon:Hide()

	button.text = CreateText(button, 12)
	button.text:SetPoint('LEFT', 26, 0)
	button.text:SetPoint('RIGHT', -26, 0)
	button.text:SetJustifyH('CENTER')
	button.text:SetWordWrap(false)
	button.text:SetText(name)

	return button
end

-- Option buttons
local function Option_OnClick(self)
	local data = self.data

	if data.key then
		selections[currentPage] = data.key

		for _, button in ipairs(installerFrame.Content.Options) do
			SetButtonSelected(button, button.data == data)
		end

		installerFrame.Sidebar.Buttons[currentPage].icon:Show()
	end

	data.func()
end

local function Option_OnEnter(self)
	local addon = self.data.addon
	if addon and not Private.IsAddOnLoaded(addon) then
		ShowTooltip(addon .. ' ' .. L["is not installed or enabled."])
	end
end

local function LayoutOptions(count)
	local content = installerFrame.Content

	for index = count + 1, #content.Options do
		content.Options[index]:Hide()
	end

	if count == 0 then return end

	local width = min(190, floor((700 - 6 * (count - 1)) / count))
	local total = count * width + 6 * (count - 1)

	for index = 1, count do
		local button = content.Options[index]
		button:SetWidth(width)
		button:ClearAllPoints()
		button:SetPoint('BOTTOM', content, 'BOTTOM', -total / 2 + width / 2 + (index - 1) * (width + 6), 56)
	end
end

-- Checkboxes, AceGUI widgets so they match the config (ElvUI skins them as well)
-- Only the db is written, the reload at the end of the installer loads everything
local function CheckBox_OnValueChanged(widget, _, value)
	local toggle = widget:GetUserData('toggle')

	ToggleDB(toggle)[toggle.key] = value and true or false
	installerFrame.Sidebar.Buttons[currentPage].icon:Show()
end

local function CheckBox_OnEnter(widget)
	local toggle = widget:GetUserData('toggle')
	if toggle.desc then
		ShowTooltip(toggle.label, toggle.desc)
	end
end

local function CreateCheckBox(parent)
	local widget = AceGUI:Create('CheckBox')
	widget.frame:SetParent(parent)
	widget:SetWidth(325)
	widget:SetCallback('OnValueChanged', CheckBox_OnValueChanged)
	widget:SetCallback('OnEnter', CheckBox_OnEnter)
	widget:SetCallback('OnLeave', GameTooltip_Hide)
	widget.text:SetFont(LSM:Fetch('font', Private.Font), 12, Private.Outline)

	return widget
end

-- Two columns
local function LayoutToggles(page)
	local content = installerFrame.Content
	local container = content.Toggles
	local rows = floor((422 - 44 - content.Desc:GetStringHeight() - 16 - (page.buttons and 100 or 40)) / 24)
	local column, row = 0, 0
	local headers, checks = 0, 0

	for _, group in ipairs(page.toggles) do
		if #group > 0 then
			if row > 0 and row + #group + 1 > rows then
				column, row = column + 1, 0
			end

			headers = headers + 1
			local header = container.Headers[headers]
			if not header then
				header = CreateText(container, 13)
				header:SetJustifyH('LEFT')
				header:SetTextColor(0.294, 0.922, 0.173)
				container.Headers[headers] = header
			end

			header:SetText(group.name)
			header:ClearAllPoints()
			header:SetPoint('TOPLEFT', column * 350, -(row * 24) - 4)
			header:Show()
			row = row + 1

			for _, toggle in ipairs(group) do
				if row >= rows then
					column, row = column + 1, 0
				end

				checks = checks + 1
				local check = container.Checks[checks]
				if not check then
					check = CreateCheckBox(container)
					container.Checks[checks] = check
				end

				check:SetUserData('toggle', toggle)
				check:SetLabel(toggle.label)
				check:SetValue(ToggleDB(toggle)[toggle.key])
				check:ClearAllPoints()
				check:SetPoint('TOPLEFT', column * 350, -(row * 24))
				check.frame:Show()
				row = row + 1
			end
		end
	end

	for index = headers + 1, #container.Headers do
		container.Headers[index]:Hide()
	end

	for index = checks + 1, #container.Checks do
		container.Checks[index].frame:Hide()
	end
end

local function UpdateProgress()
	local bar = installerFrame.StatusBar
	local progress = currentPage / #pages

	bar:SetValue(currentPage)

	-- Red -> Yellow -> Green (50% brightness)
	if progress < 0.5 then
		bar:SetStatusBarColor(0.5, progress, 0)
	else
		bar:SetStatusBarColor(1 - progress, 0.5, 0)
	end

	bar.text:SetFormattedText('%d / %d', currentPage, #pages)
end

-- Frame Creation
local function CreateMainFrame()
	local frame = CreateFrame('Frame', 'LuckyoneInstallerFrame', UIParent, 'BackdropTemplate')
	frame:SetSize(740, 500)
	frame:SetPoint('CENTER', UIParent, 'CENTER', -100, 160)
	frame:SetFrameStrata('DIALOG')
	frame:SetMovable(true)
	frame:SetClampedToScreen(true)
	frame:EnableMouse(true)
	frame:Hide()

	ApplyTemplate(frame)

	-- Top Header
	local header = CreateFrame('Frame', nil, frame)
	header:SetHeight(36)
	header:SetPoint('TOPLEFT')
	header:SetPoint('TOPRIGHT')
	header:EnableMouse(true)
	header:RegisterForDrag('LeftButton')
	header:SetScript('OnDragStart', function() frame:StartMoving() end)
	header:SetScript('OnDragStop', function() frame:StopMovingOrSizing() end)

	local title = CreateText(header, 16)
	title:SetPoint('CENTER')
	title:SetText(Private.Name .. ' ' .. L["Installation"])

	local logo = header:CreateTexture(nil, 'ARTWORK')
	logo:SetTexture(Private.Logo)
	logo:SetSize(36, 18)
	logo:SetPoint('RIGHT', title, 'LEFT', 6, 0)

	local version = CreateText(header, 11)
	version:SetPoint('LEFT', 10, 0)
	version:SetTextColor(0.6, 0.6, 0.6)
	version:SetText(Private.VersionString)

	local headerLine = CreateLine(frame)
	headerLine:SetPoint('TOPLEFT', header, 'BOTTOMLEFT')
	headerLine:SetPoint('TOPRIGHT', header, 'BOTTOMRIGHT')

	-- Footer: Previous, progress bar, Next
	local footer = CreateFrame('Frame', nil, frame)
	footer:SetHeight(40)
	footer:SetPoint('BOTTOMLEFT')
	footer:SetPoint('BOTTOMRIGHT')

	local footerLine = CreateLine(frame)
	footerLine:SetPoint('BOTTOMLEFT', footer, 'TOPLEFT')
	footerLine:SetPoint('BOTTOMRIGHT', footer, 'TOPRIGHT')

	frame.Prev = CreateButton(footer, 110, 26)
	frame.Prev:SetPoint('LEFT', 8, 0)
	frame.Prev:SetScript('OnClick', function() Installer:SetPage(currentPage - 1) end)
	frame.Prev.text:SetText(L["Previous"])

	frame.Next = CreateButton(footer, 110, 26)
	frame.Next:SetPoint('RIGHT', -8, 0)
	frame.Next:SetScript('OnClick', function() Installer:SetPage(currentPage + 1) end)
	frame.Next.text:SetText(L["Next"])

	-- Same backdrop as the buttons
	local barHolder = CreateFrame('Frame', nil, footer, 'BackdropTemplate')
	barHolder:SetPoint('TOPLEFT', frame.Prev, 'TOPRIGHT', 6, 0)
	barHolder:SetPoint('BOTTOMRIGHT', frame.Next, 'BOTTOMLEFT', -6, 0)
	ApplyTemplate(barHolder)
	barHolder:SetBackdropColor(0.2, 0.2, 0.2, 0.8)

	local bar = CreateFrame('StatusBar', nil, barHolder)
	bar:SetPoint('TOPLEFT', 1, -1)
	bar:SetPoint('BOTTOMRIGHT', -1, 1)
	bar:SetStatusBarTexture('Interface\\Buttons\\WHITE8X8')
	frame.StatusBar = bar

	bar.text = CreateText(bar, 12)
	bar.text:SetPoint('CENTER')

	-- Step list, its own frame next to the main one so it moves and hides along with it
	local sidebar = CreateFrame('Frame', nil, frame, 'BackdropTemplate')
	sidebar:SetSize(200, 500)
	sidebar:SetPoint('TOPLEFT', frame, 'TOPRIGHT', 1, 0)
	sidebar.Buttons = {}
	frame.Sidebar = sidebar

	ApplyTemplate(sidebar)

	local steps = CreateText(sidebar, 16)
	steps:SetPoint('CENTER', sidebar, 'TOP', 0, -18)
	steps:SetText(L["Steps"])

	local sidebarLine = CreateLine(sidebar)
	sidebarLine:SetPoint('TOPLEFT', 0, -36)
	sidebarLine:SetPoint('TOPRIGHT', 0, -36)

	-- Content: Subtitle, description, checkboxes, option buttons and the status line
	local content = CreateFrame('Frame', nil, frame)
	content:SetSize(740, 422)
	content:SetPoint('TOPLEFT', header, 'BOTTOMLEFT', 0, -1)
	frame.Content = content

	content.SubTitle = CreateText(content, 16)
	content.SubTitle:SetPoint('TOP', 0, -16)

	content.Desc = CreateText(content, 12)
	content.Desc:SetPoint('TOPLEFT', 20, -44)
	content.Desc:SetWidth(700)
	content.Desc:SetJustifyH('CENTER')
	content.Desc:SetSpacing(2)

	local toggles = CreateFrame('Frame', nil, content)
	toggles:SetPoint('TOPLEFT', content.Desc, 'BOTTOMLEFT', 0, -16)
	toggles:SetPoint('BOTTOMRIGHT', -20, 100)
	toggles:Hide()
	toggles.Headers = {}
	toggles.Checks = {}
	content.Toggles = toggles

	content.Options = {}

	for index = 1, 4 do
		local button = CreateButton(content, 190, 30)
		button:SetScript('OnClick', Option_OnClick)
		button:SetScript('OnEnter', Option_OnEnter)
		button:SetScript('OnLeave', GameTooltip_Hide)
		button:Hide()
		content.Options[index] = button
	end

	-- Status line, holds for three seconds and fades out over one
	local status = CreateText(content, 13)
	status:SetHeight(20)
	status:SetPoint('BOTTOMLEFT', 20, 12)
	status:SetPoint('BOTTOMRIGHT', -20, 12)
	status:SetJustifyH('CENTER')
	status:SetTextColor(0.294, 0.922, 0.173)
	status:Hide()
	content.Status = status

	status.fade = status:CreateAnimationGroup()
	status.fade:SetScript('OnFinished', function() status:Hide() end)

	local alpha = status.fade:CreateAnimation('Alpha')
	alpha:SetStartDelay(3)
	alpha:SetDuration(1)
	alpha:SetFromAlpha(1)
	alpha:SetToAlpha(0)

	return frame
end

-- Used by Private:Print with the installer flag
function Installer:ShowStatus(msg)
	if not installerFrame then return end

	local status = installerFrame.Content.Status
	status:SetText(msg)
	status:Show()
	status.fade:Restart()

	PlaySound(888) -- Level Up Sound
end

-- Pages
function Installer:SetPage(index)
	local page = pages[index]
	if not page then return end

	currentPage = index

	local content = installerFrame.Content
	content.Toggles:Hide()
	content.Status.fade:Stop()
	content.Status:Hide()

	content.SubTitle:SetText(page.title)
	content.Desc:SetText(page.desc)

	local shown = 0
	if page.buttons then
		for _, data in ipairs(page.buttons) do
			if not data.hidden then
				shown = shown + 1

				local button = content.Options[shown]
				button.data = data
				button.text:SetText(data.text)
				button:Show()

				SetButtonEnabled(button, not data.addon or Private.IsAddOnLoaded(data.addon))
				SetButtonSelected(button, data.key and selections[index] == data.key)
			end
		end
	end

	LayoutOptions(shown)

	if page.toggles then
		LayoutToggles(page)
		content.Toggles:Show()
	end

	-- Nothing to go back to on page one, nothing to go forward to on the last
	SetButtonEnabled(installerFrame.Prev, index > 1)
	SetButtonEnabled(installerFrame.Next, index < #pages)

	UpdateProgress()
	UpdateSidebar()
end

local function Page(name, desc, buttons, toggles, hidden, title)
	return { name = name, title = title or name, desc = concat(desc, '\n\n'), buttons = buttons, toggles = toggles, hidden = hidden }
end

local function Button(text, func, key, addon, hidden)
	return { text = text, func = func, key = key, addon = addon, hidden = hidden }
end

-- Hidden toggles are dropped here so the layout never has to skip them
local function Group(name, ...)
	local group = { name = name }

	for _, toggle in ipairs({ ... }) do
		if not toggle.hidden then
			group[#group + 1] = toggle
		end
	end

	return group
end

-- Missing sections (no ElvUI, other flavor) and disabled groups (Kaliel's Tracker) hide the toggle just like a hidden option
local function ConfigOption(path)
	local option, hidden = Private.Config, false

	for part in gmatch(path, '[^.]+') do
		option = option.args and option.args[part]
		if not option then return {}, true end
		if option.hidden == true or option.disabled == true then hidden = true end
	end

	return option, hidden
end

-- The db key is the last part of the path
local function Toggle(section, path, labelPath, descPath)
	local option, hidden = ConfigOption(path)
	local label = (labelPath and ConfigOption(labelPath).name) or option.name
	local desc = (descPath and ConfigOption(descPath).name) or option.desc

	return { section = section, key = strmatch(path, '[^.]+$'), label = label, desc = desc, hidden = hidden }
end

local function BuildPages()
	local recommended = Green(L["Recommended step. Should not be skipped."])

	return {
		-- Welcome
		Page(L["Welcome"], {
			L["The LuckyoneUI installer will guide you through some steps and apply the profiles of your choice."],
			Green(L["Your existing profiles will not change. The installer will create a fresh profile."]),
			L["Please read the steps carefully before clicking any buttons."],
		}, {
			Button(Green(L["Start"]), function() Installer:SetPage(currentPage + 1) end),
			Button(CLOSE, function() Installer:Hide() end),
		}),

		-- UI scale
		Page(L["LuckyoneUI Scale"], {
			L["1440p = Default | 1080p = Downscaled"] .. '.',
			Red(L["Keep in mind I play on 1440p.\nThe 1080p layout might experience some minor pixel offsets."]),
			recommended,
		}, {
			Button('1440p', function() Private:ApplyScale(true, true) end, 'native'),
			Button('1080p', function() Private:ApplyScale(false, true) end, 'scaled'),
		}),

		-- ElvUI profiles
		Page(L["ElvUI Layouts"], {
			L["This step will configure the ElvUI layout of your choice."],
			L["The ElvUI Nameplates are included in this step."],
			recommended,
		}, {
			Button(L["DPS & Tanks"], function() Private:Setup_Layout('main', true) end, 'main'),
			Button(L["Healing Vertical"], function() Private:Setup_Layout('healing', true) end, 'vertical'),
			Button(L["Healing Horizontal"], function() Private:Setup_Layout('healing', true, 'horizontal') end, 'horizontal'),
		}, nil, not Private.ElvUI),

		-- Aura indicators (Global)
		Page(L["ElvUI Filters"], {
			L["This will apply Luckyones Aura Indicator edit and set the style to Textured."],
			recommended,
		}, {
			Button(L["Setup Aura Indicators"], function() Private:Setup_Filters(true) end, 'filters'),
		}, nil, not Private.ElvUI),

		-- UnitFrames color themes
		Page(L["Color Theme"], {
			L["Select your preferred UnitFrames color theme."],
			Green(L["Optional step. Dark is applied by default."]),
		}, {
			Button(L["Dark"], function() Private:Setup_Theme('dark', true) end, 'dark'),
			Button(L["Class Color"], function() Private:Setup_Theme('class', true) end, 'class'),
		}, nil, not Private.ElvUI),

		-- Chat tabs setup & Chattynator option
		Page(L["Chat"], {
			L["This step will configure your two chat panels."],
			recommended,
			L["Left panel: Main - Log - Whisper - Guild - Party."] .. '\n' .. L["Right panel: Damage Meter."],
		}, {
			Button(L["Setup Chat"], function() Private:Setup_Chat(true) end, 'chat'),
			Button(L["Use Chattynator Addon"], function() Private:Setup_Chattynator(true) end, 'chattynator', 'Chattynator'),
		}),

		-- CVars
		Page(L["Console Variables"], {
			L["This step will configure some of Blizzards console variables."],
			recommended,
			L["Examples: Max camera distance, screenshot quality and tutorials."] .. '\n' .. L["The full list of configured CVars can be found in /lucky config."],
		}, {
			Button(L["Setup CVars"], function() Private:Setup_CVars(nil, true) end, 'cvars'),
		}),

		-- BigWigs profiles
		Page('BigWigs', {
			L["Please click the button below to apply Luckyones profile for BigWigs and LittleWigs."],
			recommended,
		}, {
			Button(L["BigWigs Main"], function() Private:Setup_BigWigs('main') end, 'main', 'BigWigs'),
			Button(L["BigWigs Healing"], function() Private:Setup_BigWigs('healing') end, 'healing', 'BigWigs'),
		}, nil, nil, L["BigWigs profile"]),

		-- Damage Meter choice
		Page(L["Damage Meter"], Private.Modules.DamageMeter and {
			L["Choose between Details! Damage Meter and the custom LuckyoneUI Damage Meter."],
			L["The LuckyoneUI Damage Meter is based on the Blizzard API and much more lightweight\nbut offers less options compared to Details."],
			recommended,
		} or {
			L["Please click the button below to apply Luckyones profile for Details! Damage Meter."],
			recommended,
		}, {
			Button(L["Setup Details"], function() Private:Setup_Details(true) end, 'details', 'Details'),
			Button(L["LuckyoneUI Damage Meter"], EnableDamageMeter, 'luckyone', nil, not Private.Modules.DamageMeter),
		}),

		-- M+ timer profile
		Page(L["Mythic+ Addons"], {
			L["Please click the button below to apply Luckyones profile for MPlusTimer."],
			recommended,
		}, {
			Button(L["Setup MPlusTimer"], function() Private:Setup_MPlusTimer(true) end, 'mplustimer', 'MPlusTimer'),
		}, nil, not Private.isRetail),

		-- SCM profile
		Page(L["Cooldown Manager"], {
			L["Please click the button below to apply Luckyones profile for SkironCooldownManager."],
			recommended,
			L["For position adjustments use /scm X and Y offset options."],
		}, {
			Button('SkironCooldownManager', function() Private:Setup_SCM(true) end, 'scm', 'SkironCooldownManager'),
		}, nil, not Private.isRetail, L["Cooldown Manager profile"]),

		-- Edit mode string and guide
		Page(L["Blizzard Edit Mode"], {
			Green(L["Step 1:"]) .. '\n' .. L["Click the first button for the import.\nUse CTRL+C to copy the string from the popup."],
			Green(L["Step 2:"]) .. '\n' .. L["Enter Edit Mode and select Import on the Dropdown.\nUse CTRL+V to paste string, then pick a name and click import."],
		}, {
			Button(L["Copy Editmode String"], function() Private:Return_EditModeString() end, 'copy'),
			Button(Green(L["Enter Edit Mode"]), function() Private:ToggleEditMode() end),
		}, nil, not Private.isRetail),

		-- LuckyoneUI module checkboxes
		Page(L["Modules"], { L["Enable the LuckyoneUI modules you want to use. Hover over a checkbox for details."] }, nil, {
			Group(L["Modules"],
				Toggle('map.minimap.buttons', 'map.minimapButtons.enable', 'map.minimapButtons'),
				Toggle('misc.combatText', 'misc.combatText.generalOptions.enable', 'misc.combatText'),
				Toggle('movableFrames', 'blizzard.movableFrames.enable', 'blizzard.movableFrames'),
				Toggle('misc.mailbox', 'misc.mailbox.generalOptions.enable', 'misc.mailbox'),
				Toggle('misc.friendsList', 'misc.friendsList.generalOptions.enable', 'misc.friendsList'),
				Toggle('misc.objectiveTracker', 'misc.objectiveTracker.general.generalOptions.enable', 'misc.objectiveTracker')
			),
			Group(L["ElvUI Tweaks"],
				Toggle('misc', 'elvuiTweaks.toggles.mythicVisibility', nil, 'elvuiTweaks.mythicVisibilityDesc.desc'),
				Toggle('misc', 'elvuiTweaks.toggles.dataTextsTweaks', nil, 'elvuiTweaks.dataTextsTweaksDesc.desc')
			),
			Group(L["Nameplates"],
				Toggle('nameplates', 'elvuiTweaks.nameplates.targetTextureEnable'),
				Toggle('nameplates', 'elvuiTweaks.nameplates.focusTextureEnable'),
				Toggle('misc', 'blizzard.misc.removeNameplateRealm')
			),
		}),

		-- LuckyoneUI general tab checkboxes
		Page(L["Quality of Life"], { L["Small tweaks that speed up daily tasks and hide Blizzard frames you do not need."] }, nil, {
			Group(L["Quality of Life"],
				Toggle('qualityOfLife', 'blizzard.qualityOfLife.autoAcceptRole'),
				Toggle('qualityOfLife', 'blizzard.qualityOfLife.autoDismount'),
				Toggle('qualityOfLife', 'blizzard.qualityOfLife.easyDelete'),
				Toggle('qualityOfLife', 'blizzard.qualityOfLife.expandMerchant'),
				Toggle('qualityOfLife', 'blizzard.qualityOfLife.expandQuestLog'),
				Toggle('qualityOfLife', 'blizzard.qualityOfLife.fasterLoot'),
				Toggle('qualityOfLife', 'blizzard.qualityOfLife.preventLootAutoShow'),
				Toggle('qualityOfLife', 'blizzard.qualityOfLife.privacyOverlay'),
				Toggle('qualityOfLife', 'blizzard.qualityOfLife.quickSignup')
			),
			Group(L["Hide Blizzard Frames"],
				Toggle('disabledFrames', 'blizzard.disabledFrames.AlertFrame'),
				Toggle('disabledFrames', 'blizzard.disabledFrames.ApplicationCover'),
				Toggle('disabledFrames', 'blizzard.disabledFrames.BossBanner'),
				Toggle('disabledFrames', 'blizzard.disabledFrames.HousingDecorAlerts'),
				Toggle('disabledFrames', 'blizzard.disabledFrames.LossOfControl'),
				Toggle('disabledFrames', 'blizzard.disabledFrames.TalkingHead'),
				Toggle('disabledFrames', 'blizzard.disabledFrames.UIErrorsFrame'),
				Toggle('disabledFrames', 'blizzard.disabledFrames.ZoneTextFrame')
			),
		}),

		-- LuckyoneUI custom skins
		Page('Skins', { L["Skin the Addons and Blizzard frames below in ElvUI style. Only installed Addons are listed."] }, nil, {
			Group('AddOns',
				Toggle('skins', 'skins.addons.Auctionator'),
				Toggle('skins', 'skins.addons.BigWigs'),
				Toggle('skins', 'skins.addons.BugSack'),
				Toggle('skins', 'skins.addons.LFGBulletinBoard'),
				Toggle('skins', 'skins.addons.NovaSpellRankChecker'),
				Toggle('skins', 'skins.addons.NovaWorldBuffs'),
				Toggle('skins', 'skins.addons.SimpleAddonManager'),
				Toggle('skins', 'skins.addons.Simulationcraft'),
				Toggle('skins', 'skins.addons.Tabardy'),
				Toggle('skins', 'skins.addons.WhatsTraining')
			),
			Group('Blizzard',
				Toggle('skins.Blizzard', 'skins.blizzard.CooldownViewer'),
				Toggle('skins.Blizzard', 'skins.blizzard.DeveloperConsole')
			),
		}, not Private.ElvUI),

		-- Final reload and Discord link
		Page(L["Installation Complete"], {
			L["You have completed the installation process, please click 'Finished' to reload the UI."],
			L["Feel free to join our community Discord for support and social chats."],
		}, {
			Button('Discord', function() StaticPopup_Show('LUCKYONE_EDITBOX', nil, nil, 'https://discord.gg/xRY4bwA') end),
			Button(Green(L["Finished"]), InstallComplete),
		}),
	}
end

local function Initialize()
	installerFrame = CreateMainFrame()

	-- Checkbox pages read their text from the config table
	Private:BuildConfig()

	-- Addon checks only make sense once everything is loaded
	local sidebar = installerFrame.Sidebar
	for _, page in ipairs(BuildPages()) do
		if not page.hidden then
			local index = #pages + 1
			pages[index] = page
			sidebar.Buttons[index] = CreateStepButton(sidebar, index, page.name)
		end
	end

	installerFrame.StatusBar:SetMinMaxValues(0, #pages)
end

function Installer:Show()
	if not installerFrame then Initialize() end

	wipe(selections)
	for _, button in ipairs(installerFrame.Sidebar.Buttons) do
		button.icon:Hide()
	end

	installerFrame:Show()
	self:SetPage(1)
end

function Installer:Hide()
	if installerFrame then
		installerFrame:Hide()
	end
end

function Installer:IsShown()
	return installerFrame and installerFrame:IsShown()
end
