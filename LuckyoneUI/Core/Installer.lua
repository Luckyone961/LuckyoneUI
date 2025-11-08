-- Addon namespace
local _, Private = ...
local L = Private.Libs.ACL
local LSM = Private.Libs.LSM

-- Lua functions
local format = string.format
local pairs = pairs
local type = type
local unpack = unpack

-- API cache
local C_Timer = C_Timer
local C_UI_Reload = C_UI.Reload
local CreateFrame = CreateFrame
local PlaySound = PlaySound
local UIFrameFadeOut = UIFrameFadeOut

-- Global environment
local _G = _G
local UIParent = UIParent

-- Constants: Font + Outline
local FONT = LSM:Fetch('font', Private.Font)
local FONT_OUTLINE = Private.Outline

-- Constants: Scalings
local MAIN_FRAME_HEIGHT = 400
local MAIN_FRAME_WIDTH = 550
local STEP_BUTTON_HEIGHT = 20
local STEP_BUTTON_WIDTH = 200
local STEP_FRAME_WIDTH = 220

-- Constants: Colors
local LUCKYONE_COLOR = {0.294, 0.922, 0.173} -- #4beb2c
local STEP_TITLE_COLOR = {1, 1, 1}
local STEP_TITLE_SELECTED_COLOR = {0, 0.702, 1} -- #00b3ff

-- Installer module
local Installer = {}
Private.Installer = Installer

-- Local references
local installerFrame
local currentPage = 0
local maxPage = 0

-- Our frame 'skin'
local function ApplyTemplate(frame)
	if not frame.SetBackdrop then _G.Mixin(frame, _G.BackdropTemplateMixin) end

	frame:SetBackdrop({
		bgFile = 'Interface\\Buttons\\WHITE8X8',
		edgeFile = 'Interface\\Buttons\\WHITE8X8',
		tile = false,
		tileSize = 0,
		edgeSize = 1,
		insets = { left = 1, right = 1, top = 1, bottom = 1 }
	})

	-- Background color: #0d0d0d + alpha 90
	frame:SetBackdropColor(0.051, 0.051, 0.051, 0.9)

	-- Border color: #000000 + alpha 100
	frame:SetBackdropBorderColor(0, 0, 0, 1)
end

-- Our button 'skin'
local function StyleButton(button)
	-- If the background texture does not exist
	if not button.bg then
		button.bg = button:CreateTexture(nil, 'BACKGROUND')
		button.bg:SetAllPoints()
		button.bg:SetColorTexture(0.2, 0.2, 0.2, 0.8)
	end

	-- Hover highlight
	if not button.highlight then
		button.highlight = button:CreateTexture(nil, 'HIGHLIGHT')
		button.highlight:SetAllPoints()
		button.highlight:SetColorTexture(1, 1, 1, 0.15)
		button:SetHighlightTexture(button.highlight)
	end

	-- Font
	if not button.text then
		button.text = button:CreateFontString(nil, 'OVERLAY')
		button.text:SetFont(FONT, 12, FONT_OUTLINE)
		button.text:SetPoint('CENTER')
		button.text:SetJustifyH('CENTER')

		-- Override SetText to use our font string
		button.SetText = function(self, text)
			self.text:SetText(text)
		end

		-- Override GetFontString to return our font string
		button.GetFontString = function(self)
			return self.text
		end
	end
end

-- Layout option buttons based on how many are visible
local function LayoutOptionButtons()
	local visibleButtons = {}
	for i = 1, 4 do
		if installerFrame['Option' .. i]:IsShown() then
			visibleButtons[#visibleButtons + 1] = installerFrame['Option' .. i]
		end
	end

	local numButtons = #visibleButtons
	if numButtons == 0 then
		return
	end

	local spacing = 4
	local buttonWidth = 160
	local totalWidth = (numButtons * buttonWidth) + ((numButtons - 1) * spacing)
	local startX = -(totalWidth / 2) + (buttonWidth / 2)

	for i, button in ipairs(visibleButtons) do
		button:ClearAllPoints()
		local offsetX = startX + ((i - 1) * (buttonWidth + spacing))
		button:SetPoint('BOTTOM', installerFrame, 'BOTTOM', offsetX, 60)
	end
end

-- Set install version to current LuckyoneUI version
local function InstallComplete()
	Private.Addon.db.global.install_version = Private.Version
	C_UI_Reload()
end

-- Create step complete frame
local stepCompleteFrame
local function CreateStepComplete()
	local frame = CreateFrame('Frame', 'LuckyoneInstallStepComplete', UIParent, _G.BackdropTemplateMixin and 'BackdropTemplate')
	frame:SetSize(400, 60)
	frame:SetPoint('TOP', 0, -200)
	frame:Hide()

	ApplyTemplate(frame)

	frame.text = frame:CreateFontString(nil, 'ARTWORK')
	frame.text:SetFont(FONT, 16, FONT_OUTLINE)
	frame.text:SetPoint('CENTER', 0, 0)
	frame.text:SetTextColor(LUCKYONE_COLOR[1], LUCKYONE_COLOR[2], LUCKYONE_COLOR[3])
	frame.text:SetJustifyH('CENTER')

	local hideTimer

	function frame:ShowMessage(msg)
		if hideTimer then
			Private.Addon:CancelTimer(hideTimer, true)
			hideTimer = nil
		end

		PlaySound(888) -- Level Up Sound
		self.text:SetText(format('%s: %s', Private.Name, msg))

		if not self:IsShown() then
			self:Show()
		end

		hideTimer = Private.Addon:ScheduleTimer(function()
			self:Hide()
			hideTimer = nil
		end, 3)
	end

	stepCompleteFrame = frame
	_G.LuckyoneInstallStepComplete = frame
end

-- Installer Frame Setup
local function SetupReset()
	installerFrame.Next:Disable()
	installerFrame.Prev:Disable()

	-- Reset all options
	for i = 1, 4 do
		local option = installerFrame['Option' .. i]
		option:Hide()
		option:SetScript('OnClick', nil)
		option:SetText('')
		option:ClearAllPoints()
		option:SetSize(160, 30)
	end

	-- Reset texts
	installerFrame.SubTitle:SetText('')
	installerFrame.Desc1:SetText('')
	installerFrame.Desc2:SetText('')
	installerFrame.Desc3:SetText('')
	installerFrame.Desc4:SetText('')

	-- Reset step title
	if installerFrame.stepFrame then
		for i = 1, #installerFrame.stepFrame.buttons do
			installerFrame.stepFrame.buttons[i].text:SetText('')
		end
	end
end

local function UpdateProgressBar()
	local progress = currentPage / maxPage
	installerFrame.StatusBar:SetValue(currentPage)

	-- Red -> Yellow -> Green (50% brightness)
	local r, g, b
	if progress < 0.5 then
		r = 0.5
		g = progress
		b = 0
	else
		r = 0.5 - (progress - 0.5)
		g = 0.5
		b = 0
	end

	installerFrame.StatusBar:SetStatusBarColor(r, g, b)
	installerFrame.StatusBar.text:SetFormattedText('%d / %d', currentPage, maxPage)
end

local function UpdateStepList()
	if not installerFrame.stepFrame or not installerFrame.StepTitles then return end

	for i = 1, #installerFrame.stepFrame.buttons do
		local button = installerFrame.stepFrame.buttons[i]
		local color = STEP_TITLE_COLOR

		if i == currentPage then
			color = installerFrame.StepTitlesColorSelected or STEP_TITLE_SELECTED_COLOR
		else
			color = installerFrame.StepTitlesColor or STEP_TITLE_COLOR
		end

		local stepTitle
		if type(installerFrame.StepTitles[i]) == 'function' then
			stepTitle = installerFrame.StepTitles[i]()
		else
			stepTitle = installerFrame.StepTitles[i]
		end

		button.text:SetText(stepTitle)
		button.text:SetTextColor(color[1], color[2], color[3])
	end
end

function Installer:SetPage(pageNum)
	if pageNum < 1 or pageNum > maxPage then return end

	SetupReset()

	currentPage = pageNum

	-- Update navigation buttons
	-- We don't want "Previous" on the first page
	-- We also don't want "Continue" on the last page
	if currentPage == maxPage then
		installerFrame.Next:Hide()
	else
		installerFrame.Next:Show()
		installerFrame.Next:Enable()
	end

	if currentPage == 1 then
		installerFrame.Prev:Hide()
	else
		installerFrame.Prev:Show()
		installerFrame.Prev:Enable()
	end

	UpdateProgressBar()

	-- Execute page function
	if installerFrame.Pages and installerFrame.Pages[currentPage] then
		installerFrame.Pages[currentPage]()
	end

	LayoutOptionButtons()
	UpdateStepList()
end

function Installer:NextPage()
	if currentPage < maxPage then
		self:SetPage(currentPage + 1)
	end
end

function Installer:PreviousPage()
	if currentPage > 1 then
		self:SetPage(currentPage - 1)
	end
end

local function StepButton_OnClick(self)
	local pageNum = self:GetID()
	if pageNum and pageNum <= maxPage then
		Installer:SetPage(pageNum)
	end
end

local function CloseInstaller()
	installerFrame:Hide()
	if installerFrame.stepFrame then
		installerFrame.stepFrame:Hide()
	end
end

-- Frame Creation
local function CreateMainFrame()
	local frame = CreateFrame('Frame', 'LuckyoneInstallerFrame', UIParent, BackdropTemplateMixin and 'BackdropTemplate')
	frame:SetSize(MAIN_FRAME_WIDTH, MAIN_FRAME_HEIGHT)
	frame:SetPoint('CENTER', UIParent, 'CENTER', 0, 0)
	frame:SetFrameStrata('DIALOG')
	frame:EnableMouse(true)
	frame:SetMovable(true)
	frame:RegisterForDrag('LeftButton')
	frame:SetScript('OnDragStart', function(self) self:StartMoving() end)
	frame:SetScript('OnDragStop', function(self) self:StopMovingOrSizing() end)
	frame:Hide()

	ApplyTemplate(frame)

	frame.Title = frame:CreateFontString(nil, 'OVERLAY')
	frame.Title:SetFont(FONT, 16, FONT_OUTLINE)
	frame.Title:SetPoint('TOP', 0, -10)
	frame.Title:SetText('|cff4beb2cLuckyoneUI|r Installation')

	-- Logo texture
	frame.Logo = frame:CreateTexture(nil, 'ARTWORK')
	frame.Logo:SetTexture(Private.Logo)
	frame.Logo:SetSize(36, 18)
	frame.Logo:SetPoint('RIGHT', frame.Title, 'LEFT', 6, 0)

	frame.SubTitle = frame:CreateFontString(nil, 'OVERLAY')
	frame.SubTitle:SetFont(FONT, 14, FONT_OUTLINE)
	frame.SubTitle:SetPoint('TOP', 0, -45)

	frame.Desc1 = frame:CreateFontString(nil, 'OVERLAY')
	frame.Desc1:SetFont(FONT, 12, FONT_OUTLINE)
	frame.Desc1:SetPoint('TOPLEFT', 20, -80)
	frame.Desc1:SetWidth(MAIN_FRAME_WIDTH - 40)
	frame.Desc1:SetJustifyH('CENTER')
	frame.Desc1:SetSpacing(2)

	frame.Desc2 = frame:CreateFontString(nil, 'OVERLAY')
	frame.Desc2:SetFont(FONT, 12, FONT_OUTLINE)
	frame.Desc2:SetPoint('TOP', frame.Desc1, 'BOTTOM', 0, -20)
	frame.Desc2:SetWidth(MAIN_FRAME_WIDTH - 40)
	frame.Desc2:SetJustifyH('CENTER')
	frame.Desc2:SetSpacing(2)

	frame.Desc3 = frame:CreateFontString(nil, 'OVERLAY')
	frame.Desc3:SetFont(FONT, 12, FONT_OUTLINE)
	frame.Desc3:SetPoint('TOP', frame.Desc2, 'BOTTOM', 0, -20)
	frame.Desc3:SetWidth(MAIN_FRAME_WIDTH - 40)
	frame.Desc3:SetJustifyH('CENTER')
	frame.Desc3:SetSpacing(2)

	frame.Desc4 = frame:CreateFontString(nil, 'OVERLAY')
	frame.Desc4:SetFont(FONT, 12, FONT_OUTLINE)
	frame.Desc4:SetPoint('TOP', frame.Desc3, 'BOTTOM', 0, -20)
	frame.Desc4:SetWidth(MAIN_FRAME_WIDTH - 40)
	frame.Desc4:SetJustifyH('CENTER')
	frame.Desc4:SetSpacing(2)

	for i = 1, 4 do
		local button = CreateFrame('Button', 'LuckyoneInstallerOption' .. i, frame)
		button:SetSize(160, 30)
		button:Hide()

		StyleButton(button)

		frame['Option' .. i] = button
	end

	frame.Prev = CreateFrame('Button', 'LuckyoneInstallerPrevButton', frame)
	frame.Prev:SetSize(110, 25)
	frame.Prev:SetPoint('BOTTOMLEFT', 5, 5)
	frame.Prev:Disable()
	frame.Prev:SetScript('OnClick', function() Installer:PreviousPage() end)
	StyleButton(frame.Prev)
	frame.Prev:SetText(L["Previous"])

	frame.Next = CreateFrame('Button', 'LuckyoneInstallerNextButton', frame)
	frame.Next:SetSize(110, 25)
	frame.Next:SetPoint('BOTTOMRIGHT', -5, 5)
	frame.Next:Disable()
	frame.Next:SetScript('OnClick', function() Installer:NextPage() end)
	StyleButton(frame.Next)
	frame.Next:SetText(L["Next"])

	frame.StatusBar = CreateFrame('StatusBar', 'LuckyoneInstallerStatusBar', frame)
	frame.StatusBar:SetPoint('TOPLEFT', frame.Prev, 'TOPRIGHT', 6, 0)
	frame.StatusBar:SetPoint('BOTTOMRIGHT', frame.Next, 'BOTTOMLEFT', -6, 0)
	frame.StatusBar:SetStatusBarTexture('Interface\\Buttons\\WHITE8X8')
	frame.StatusBar:SetMinMaxValues(0, 1)
	frame.StatusBar:SetValue(0)
	frame.StatusBar:SetStatusBarColor(1, 0, 0)

	frame.StatusBar.bg = frame.StatusBar:CreateTexture(nil, 'BACKGROUND')
	frame.StatusBar.bg:SetAllPoints()
	frame.StatusBar.bg:SetColorTexture(0.2, 0.2, 0.2, 0.8)

	frame.StatusBar.text = frame.StatusBar:CreateFontString(nil, 'OVERLAY')
	frame.StatusBar.text:SetFont(FONT, 12, FONT_OUTLINE)
	frame.StatusBar.text:SetPoint('CENTER')
	frame.StatusBar.text:SetText('0 / 0')

	return frame
end

local function CreateStepFrame(parent)
	local frame = CreateFrame('Frame', 'LuckyoneInstallerStepFrame', UIParent, BackdropTemplateMixin and 'BackdropTemplate')
	frame:SetSize(STEP_FRAME_WIDTH, MAIN_FRAME_HEIGHT)
	frame:SetPoint('TOPLEFT', parent, 'TOPRIGHT', 1, 0)
	frame:SetFrameStrata('DIALOG')
	frame:Hide()

	ApplyTemplate(frame)

	-- Title
	frame.title = frame:CreateFontString(nil, 'OVERLAY')
	frame.title:SetFont(FONT, 14, FONT_OUTLINE)
	frame.title:SetPoint('TOP', 0, -10)
	frame.title:SetText('Steps')

	-- Create step buttons
	frame.buttons = {}
	for i = 1, 18 do
		local button = CreateFrame('Button', nil, frame)
		button:SetSize(STEP_BUTTON_WIDTH, STEP_BUTTON_HEIGHT)
		button:SetID(i)
		button:SetScript('OnClick', StepButton_OnClick)
		button:Hide()

		if i == 1 then
			button:SetPoint('TOP', frame.title, 'BOTTOM', 0, -10)
		else
			button:SetPoint('TOP', frame.buttons[i - 1], 'BOTTOM', 0, -2)
		end

		button.bg = button:CreateTexture(nil, 'BACKGROUND')
		button.bg:SetAllPoints()
		button.bg:SetColorTexture(0.2, 0.2, 0.2, 0.5)

		button.highlight = button:CreateTexture(nil, 'HIGHLIGHT')
		button.highlight:SetAllPoints()
		button.highlight:SetColorTexture(1, 1, 1, 0.15)
		button:SetHighlightTexture(button.highlight)

		button.text = button:CreateFontString(nil, 'OVERLAY')
		button.text:SetFont(FONT, 11, FONT_OUTLINE)
		button.text:SetPoint('CENTER')
		button.text:SetJustifyH('CENTER')
		button.text:SetText('')

		frame.buttons[i] = button
	end

	return frame
end

function Installer:Show(data)
	if not installerFrame then self:Initialize() end
	if not data or not data.Pages or #data.Pages == 0 then return end

	-- Reset state
	currentPage = 0
	maxPage = #data.Pages

	installerFrame.Pages = data.Pages
	installerFrame.StepTitles = data.StepTitles
	installerFrame.StepTitlesColor = data.StepTitlesColor
	installerFrame.StepTitlesColorSelected = data.StepTitlesColorSelected

	if data.Title then
		installerFrame.Title:SetText(data.Title)
	end

	installerFrame.StatusBar:SetMinMaxValues(0, maxPage)
	installerFrame.StatusBar:SetValue(0)

	if data.StepTitles and #data.StepTitles == maxPage then
		if not installerFrame.stepFrame then
			installerFrame.stepFrame = CreateStepFrame(installerFrame)
		end

		for i = 1, #installerFrame.stepFrame.buttons do
			if i <= maxPage then
				installerFrame.stepFrame.buttons[i]:Show()
			else
				installerFrame.stepFrame.buttons[i]:Hide()
			end
		end

		installerFrame:ClearAllPoints()
		installerFrame:SetPoint('CENTER', UIParent, 'CENTER', -(STEP_FRAME_WIDTH / 2) - 5, 0)
		installerFrame.stepFrame:Show()
	else
		if installerFrame.stepFrame then
			installerFrame.stepFrame:Hide()
		end
		installerFrame:ClearAllPoints()
		installerFrame:SetPoint('CENTER', UIParent, 'CENTER', 0, 0)
	end

	-- Make sure we start on page one
	installerFrame:Show()
	self:SetPage(1)
end

function Installer:Hide()
	if installerFrame then
		CloseInstaller()
	end
end

function Installer:IsShown()
	return installerFrame and installerFrame:IsShown() or false
end

function Installer:Initialize()
	if installerFrame then
		return
	end

	CreateStepComplete()
	installerFrame = CreateMainFrame()
end

-- Installer Data
local function BuildInstallerData()
	local pages = {}
	local stepTitles = {}
	local pageIndex = 1

	-- Page 1: Welcome
	pages[pageIndex] = function()
		local f = installerFrame
		f.SubTitle:SetText(L["Welcome"])
		f.Desc1:SetText(L["The LuckyoneUI installer will guide you through some steps and apply the profiles of your choice."])
		f.Desc2:SetText(format('|cff4beb2c%s', L["Your existing profiles will not change. The installer will create a fresh profile."]))
		f.Desc3:SetText(L["Please read the steps carefully before clicking any buttons."])
		f.Option1:Show()
		f.Option1:SetScript('OnClick', InstallComplete)
		f.Option1:SetText(format('|cffC80000%s', L["Skip and close"]))
	end
	stepTitles[pageIndex] = L["Welcome"]
	pageIndex = pageIndex + 1

	-- Page 2: Layout scale (All versions)
	pages[pageIndex] = function()
		local f = installerFrame
		f.SubTitle:SetText(L["Layout scale"])
		f.Desc1:SetText(L["1440p = Default | 1080p = Downscaled"] .. '.')
		f.Desc2:SetText(format('|cff4beb2c%s', L["Recommended step. Should not be skipped."]))
		f.Option1:Show()
		f.Option1:SetScript('OnClick', function()
			Private.Addon.db.profile.scaled = false
			Private:Print(L["Layout scale"] .. ' 1440p')
			stepCompleteFrame:ShowMessage(L["Layout scale"] .. ' 1440p')
		end)
		f.Option1:SetText('1440p')
		f.Option2:Show()
		f.Option2:SetScript('OnClick', function()
			Private.Addon.db.profile.scaled = true
			Private:Print(L["Layout scale"] .. ' 1080p')
			stepCompleteFrame:ShowMessage(L["Layout scale"] .. ' 1080p')
		end)
		f.Option2:SetText('1080p')
	end
	stepTitles[pageIndex] = L["Layout scale"]
	pageIndex = pageIndex + 1

	-- Only add ElvUI-specific pages if ElvUI is loaded
	if Private.ElvUI then
		-- Page: ElvUI layouts
		pages[pageIndex] = function()
			local f = installerFrame
			f.SubTitle:SetText(L["ElvUI layouts"])
			f.Desc1:SetText(L["This step will configure the ElvUI layout of your choice."])
			f.Desc2:SetText(format('|cff4beb2c%s', L["Recommended step. Should not be skipped."]))
			f.Desc3:SetText(format('|cff33937F%s|r', L["Augmentation"]) .. ': ' .. L["No ActionBars and centered Raid Frames"] .. '.')
			f.Option1:Show()
			f.Option1:SetScript('OnClick', function() Private:Setup_Layout('main', true) end)
			f.Option1:SetText(L["DPS & Tanks"])
			f.Option2:Show()
			f.Option2:SetScript('OnClick', function() Private:Setup_Layout('healing', true) end)
			f.Option2:SetText(L["Healing"])
			f.Option3:Show()
			f.Option3:SetScript('OnClick', function() Private:Setup_Layout('support', true) end)
			f.Option3:SetText(format('|cff33937F%s', L["Augmentation"]))
		end
		stepTitles[pageIndex] = L["ElvUI layouts"]
		pageIndex = pageIndex + 1

		-- Page: ElvUI Filters
		pages[pageIndex] = function()
			local f = installerFrame
			f.SubTitle:SetText(L["ElvUI Filters"])
			f.Desc1:SetText(L["This will apply Luckyones Aura Indicator edit and set the style to Textured.\nIt will also add custom IDs to Whitelist & Blacklist.\n"])
			f.Desc2:SetText(format('|cff4beb2c%s', L["Recommended step. Should not be skipped."]))
			f.Option1:Show()
			f.Option1:SetScript('OnClick', function() Private:Setup_Filters(true) end)
			f.Option1:SetText(L["Setup Aura Filters"])
		end
		stepTitles[pageIndex] = L["ElvUI Filters"]
		pageIndex = pageIndex + 1

		-- Retail-only: ElvUI plugins
		if Private.isRetail then
			pages[pageIndex] = function()
				local f = installerFrame
				f.SubTitle:SetText(L["ElvUI plugins"])
				f.Desc1:SetText(L["This step will configure profiles for other ElvUI plugins."])
				f.Desc2:SetText(format('|cff4beb2c%s', L["Recommended step. Should not be skipped."]))
				f.Option1:Show()
				f.Option1:SetScript('OnClick', function() Private:Setup_WindTools(true) end)
				f.Option1:SetText('|cff5385edWindTools|r')
				f.Option2:Show()
				f.Option2:SetScript('OnClick', function() Private:Setup_ShadowAndLight(true) end)
				f.Option2:SetText('|cff9482c9Shadow & Light|r')
			end
			stepTitles[pageIndex] = L["ElvUI plugins"]
			pageIndex = pageIndex + 1
		end

		-- Page: Color Theme
		pages[pageIndex] = function()
			local f = installerFrame
			f.SubTitle:SetText(L["Color Theme"])
			f.Desc1:SetText(L["Select your preferred UnitFrames color theme."])
			f.Desc2:SetText(format('|cff4beb2c%s', L["Optional step. Dark is applied by default."]))
			f.Option1:Show()
			f.Option1:SetScript('OnClick', function() Private:Setup_Theme('dark', true) end)
			f.Option1:SetText(L["Dark"])
			f.Option2:Show()
			f.Option2:SetScript('OnClick', function() Private:Setup_Theme('class', true) end)
			f.Option2:SetText(L["Class Color"])
		end
		stepTitles[pageIndex] = L["Color Theme"]
		pageIndex = pageIndex + 1
	end

	-- Page: Chat
	pages[pageIndex] = function()
		local f = installerFrame
		f.SubTitle:SetText(L["Chat"])
		f.Desc1:SetText(L["This step will configure your two chat panels."])
		f.Desc2:SetText(format('|cff4beb2c%s', L["Recommended step. Should not be skipped."]))
		f.Desc3:SetText(L["Left panel: General - Log - Whisper - Guild - Party."])
		f.Desc4:SetText(L["Right panel: Details! Damage Meter."])
		f.Option1:Show()
		f.Option1:SetScript('OnClick', function() Private:Setup_Chat(true) end)
		f.Option1:SetText(L["Setup Chat"])
	end
	stepTitles[pageIndex] = L["Chat"]
	pageIndex = pageIndex + 1

	-- Page: Console variables
	pages[pageIndex] = function()
		local f = installerFrame
		f.SubTitle:SetText(L["Console variables"])
		f.Desc1:SetText(L["This step will configure some of Blizzards console variables."])
		f.Desc2:SetText(format('|cff4beb2c%s', L["Recommended step. Should not be skipped."]))
		f.Desc3:SetText(L["Examples: Max camera distance, screenshot quality and tutorials."])
		f.Desc4:SetText(L["The full list of configured CVars can be found in /luckyoneui config."])
		f.Option1:Show()
		f.Option1:SetScript('OnClick', function() Private:Setup_CVars(nil, true) end)
		f.Option1:SetText(L["Setup CVars"])
	end
	stepTitles[pageIndex] = L["Console variables"]
	pageIndex = pageIndex + 1

	-- Page: NamePlates
	pages[pageIndex] = function()
		local f = installerFrame
		f.SubTitle:SetText(L["NamePlates"])
		f.Desc1:SetText(L["Choose between ElvUI NamePlates and Plater NamePlates."])
		f.Desc2:SetText(format('|cff4beb2c%s', L["Recommended step. Should not be skipped."]))
		f.Option1:Show()
		f.Option1:SetScript('OnClick', function() Private:Setup_Plater(true) end)
		f.Option1:SetText('Plater')
		if Private.ElvUI then
			f.Option2:Show()
			f.Option2:SetScript('OnClick', function() Private:Setup_NamePlates(true) end)
			f.Option2:SetText('ElvUI')
		end
	end
	stepTitles[pageIndex] = L["NamePlates"]
	pageIndex = pageIndex + 1

	-- Page: BigWigs
	pages[pageIndex] = function()
		local f = installerFrame
		f.SubTitle:SetText(L["BigWigs profile"])
		f.Desc1:SetText(L["Please click the button below to apply Luckyones profile for BigWigs and LittleWigs."])
		f.Desc2:SetText(format('|cff4beb2c%s', L["Recommended step. Should not be skipped."]))
		f.Option1:Show()
		f.Option1:SetScript('OnClick', function() Private:Setup_BigWigs('main') end)
		f.Option1:SetText('BigWigs')
		f.Option2:Show()
		f.Option2:SetScript('OnClick', function() Private:Setup_BigWigs('healing') end)
		f.Option2:SetText(L["BigWigs Healing"])
	end
	stepTitles[pageIndex] = 'BigWigs'
	pageIndex = pageIndex + 1

	-- Page: Details
	pages[pageIndex] = function()
		local f = installerFrame
		f.SubTitle:SetText(L["Details profile"])
		f.Desc1:SetText(L["Please click the button below to apply Luckyones profile for Details! Damage Meter."])
		f.Desc2:SetText(format('|cff4beb2c%s', L["Recommended step. Should not be skipped."]))
		f.Option1:Show()
		f.Option1:SetScript('OnClick', function() Private:Setup_Details(true) end)
		f.Option1:SetText(L["Setup Details"])
	end
	stepTitles[pageIndex] = 'Details'
	pageIndex = pageIndex + 1

	-- Retail-only: OmniCD
	if Private.isRetail then
		pages[pageIndex] = function()
			local f = installerFrame
			f.SubTitle:SetText(L["OmniCD profile"])
			f.Desc1:SetText(L["Please click the button below to apply Luckyones profile for OmniCD Party CDs."])
			f.Desc2:SetText(format('|cff4beb2c%s', L["Recommended step. Should not be skipped."]))
			f.Option1:Show()
			f.Option1:SetScript('OnClick', function() Private:Setup_OmniCD('main', true) end)
			f.Option1:SetText('OmniCD')
			f.Option2:Show()
			f.Option2:SetScript('OnClick', function() Private:Setup_OmniCD('healing', true) end)
			f.Option2:SetText(L["OmniCD Healing"])
		end
		stepTitles[pageIndex] = 'OmniCD'
		pageIndex = pageIndex + 1

		-- Retail-only: WarpDeplete
		pages[pageIndex] = function()
			local f = installerFrame
			f.SubTitle:SetText(L["WarpDeplete profile"])
			f.Desc1:SetText(L["Please click the button below to apply Luckyones profile for WarpDeplete."])
			f.Desc2:SetText(format('|cff4beb2c%s', L["Recommended step. Should not be skipped."]))
			f.Option1:Show()
			f.Option1:SetScript('OnClick', function() Private:Setup_WarpDeplete(true) end)
			f.Option1:SetText(L["Setup WarpDeplete"])
		end
		stepTitles[pageIndex] = 'WarpDeplete'
		pageIndex = pageIndex + 1
	end

	-- Final page: Installation Complete
	pages[pageIndex] = function()
		local f = installerFrame
		f.SubTitle:SetText(L["Installation Complete"])
		f.Desc1:SetText(L["You have completed the installation process, please click 'Finished' to reload the UI."])
		f.Desc2:SetText(L["Feel free to join our community Discord for support and social chats."])
		f.Option1:Show()
		f.Option1:SetScript('OnClick', function()
			_G.StaticPopup_Show('LUCKYONE_EDITBOX', nil, nil, 'https://discord.gg/xRY4bwA')
		end)
		f.Option1:SetText('Discord')
		f.Option2:Show()
		f.Option2:SetScript('OnClick', InstallComplete)
		f.Option2:SetText(format('|cff4beb2c%s', L["Finished"]))
	end
	stepTitles[pageIndex] = L["Installation Complete"]

	return { Title = format('|cff4beb2c%s|r Installation', Private.Name), Pages = pages, StepTitles = stepTitles, StepTitlesColor = STEP_TITLE_COLOR, StepTitlesColorSelected = STEP_TITLE_SELECTED_COLOR }
end

Private.InstallerData = BuildInstallerData()

-- Initialize
function Private.Installer:OnLoad()
	Installer:Show(Private.InstallerData)
end
