local _, Private = ...

if not Private.ElvUI then
	return
end

-- We only skin the legacy guide window and the frames around it
-- The V2 interface (beta) and the Guide Configurator keep the addon's own look

local ceil = ceil
local next = next
local unpack = unpack

local CreateFrame = CreateFrame
local hooksecurefunc = hooksecurefunc
local InCombatLockdown = InCombatLockdown

local LibStub = LibStub

local _G = _G

local E = unpack(ElvUI)
local S = E:GetModule('Skins')

local addon

local function ReplaceFont(text)
	local _, size, flags = text:GetFont()
	text:SetFont(E.media.normFont, size, flags)
end

local function Backdrop_SetBackdrop(frame, backdrop)
	local backdrops = addon.RXPFrame.backdrop
	if backdrop == backdrops.edge or backdrop == backdrops.guideName or backdrop == backdrops.bottom then
		frame:SetTemplate(frame.template)
	end
end

local function Backdrop_SetBackdropColor(frame)
	local transparent = frame.template == 'Transparent'
	local r, g, b, a = unpack(transparent and E.media.backdropfadecolor or E.media.backdropcolor)
	frame.Center:SetVertexColor(r, g, b, transparent and a or 1)
end

local function SkinBackdrop(frame, template)
	if frame.backdropInfo then
		frame:SetTemplate(template)
	else
		frame.template = template
	end

	hooksecurefunc(frame, 'SetBackdrop', Backdrop_SetBackdrop)
	hooksecurefunc(frame, 'SetBackdropColor', Backdrop_SetBackdropColor)
end

local function ResetArrow(button, direction, r, g, b)
	local rotation = S.ArrowRotation[direction]
	local normal, pushed, disabled = button:GetNormalTexture(), button:GetPushedTexture(), button:GetDisabledTexture()

	for _, texture in next, { normal, pushed, disabled } do
		texture:SetTexture(E.Media.Textures.ArrowUp)
		texture:SetRotation(rotation)
		texture:SetDesaturated(false)
	end

	normal:SetVertexColor(r or 1, g or 1, b or 1)
	pushed:SetVertexColor(1, 1, 1)
	disabled:SetVertexColor(.3, .3, .3)

	local highlight = button:GetHighlightTexture()
	highlight:SetTexture(E.ClearTexture)
end

-- Step list rows
local function Row_SetBackdropColor(row)
	row.hover:SetShown(row:IsMouseOver())
end

local function SkinRow(row)
	SkinBackdrop(row, 'Transparent')

	local hover = row:CreateTexture(nil, 'ARTWORK')
	hover:SetInside()
	hover:SetColorTexture(1, 1, 1, .25)
	hover:Hide()
	row.hover = hover

	hooksecurefunc(row, 'SetBackdropColor', Row_SetBackdropColor)

	row.IsSkinned = true
end

-- Rows are created per guide step on guide load
local function Guide_Load()
	for _, row in next, addon.RXPFrame.ScrollChild.framePool do
		if not row.IsSkinned then
			SkinRow(row)
		end
	end
end

local function ScrollBar_Update()
	local scrollBar = addon.RXPFrame.ScrollFrame.ScrollBar

	ResetArrow(scrollBar.ScrollUpButton, 'up')
	ResetArrow(scrollBar.ScrollDownButton, 'down')

	local thumb = scrollBar:GetThumbTexture()
	thumb:SetTexture()
end

local function CurrentStep_UpdateText()
	for _, stepFrame in next, addon.RXPFrame.CurrentStepFrame.framePool do
		if not stepFrame.IsSkinned then
			SkinBackdrop(stepFrame, 'Transparent')

			-- Step label in the top right corner, above the step text (elements and their checkboxes)
			local number = stepFrame.number
			SkinBackdrop(number)
			number:ClearAllPoints()
			number:Point('TOPRIGHT', stepFrame, 'TOPRIGHT')
			number:OffsetFrameLevel(3, stepFrame)

			stepFrame.IsSkinned = true
		end

		for _, element in next, stepFrame.elements do
			local button = not element.button.IsSkinned and element.button
			if button then
				S:HandleCheckBox(button)
				button.backdrop:SetAllPoints()

				local disabledChecked = button:GetDisabledCheckedTexture()
				disabledChecked:SetAlpha(0)
			end
		end
	end
end

-- Timer bars come from a library shared with other addons
local timerBars = {}
local function Timer_Start(_, label)
	local bar = addon.RXPFrame.BarContainer.bars[label or '']
	if not bar then return end

	bar:SetTexture(E.media.normTex)

	local _, size, flags = bar.candyBarLabel:GetFont()
	bar:SetFont(E.media.normFont, size, flags)

	local backdrop = bar.candyBarBackdrop
	backdrop:SetTemplate('Transparent', nil, true, true)
	backdrop:SetOutside(bar)
	backdrop:Show()

	timerBars[bar] = true
end

local function CandyBar_Stop(_, bar)
	if timerBars[bar] then
		bar.candyBarBackdrop:Hide()
		timerBars[bar] = nil
	end
end

local function SkinGuideWindow()
	local frame = addon.RXPFrame

	-- Step list
	SkinBackdrop(frame.BottomFrame, 'Transparent')
	S:HandleScrollBar(frame.ScrollFrame.ScrollBar)
	hooksecurefunc(frame, 'UpdateScrollBar', ScrollBar_Update)

	Guide_Load()
	hooksecurefunc(addon, 'LoadGuide', Guide_Load)

	-- Header and footer
	local guideName = frame.GuideName
	SkinBackdrop(guideName)
	guideName.bg:Hide()

	local logo = guideName.icon
	logo:Size(32)
	logo:ClearAllPoints()
	logo:Point('CENTER', guideName, 'LEFT', 19, 1)

	local footer = frame.Footer
	SkinBackdrop(footer)
	footer.bg:Hide()

	-- Active steps
	CurrentStep_UpdateText()
	hooksecurefunc(frame.CurrentStepFrame, 'UpdateText', CurrentStep_UpdateText)

	-- Timers below the window
	hooksecurefunc(addon, 'StartTimer', Timer_Start)

	local LibCandyBar = LibStub('LibCandyBar-3.0')
	LibCandyBar.RegisterCallback('LuckyoneUI_RXPGuides', 'LibCandyBar_Stop', CandyBar_Stop)
end

-- Active Items and Active Targets title
local function SkinTitle(frame)
	local title = frame.title
	SkinBackdrop(title)
	title:ClearAllPoints()
	title:Point('BOTTOMLEFT', frame, 'TOPLEFT', 5, 1)
end

-- Active Items and Active Targets buttons are secure, the addon only creates them out of combat
local function SkinIconButton(button)
	for _, region in next, { button:GetRegions() } do
		if region:GetDrawLayer() == 'HIGHLIGHT' then
			region:SetColorTexture(1, 1, 1, .3)
			region:SetInside()
		end
	end

	button:SetTemplate()

	button.Center:SetDrawLayer('BACKGROUND', -1)

	button.IsSkinned = true
end

local function ActiveItems_Update()
	if InCombatLockdown() then return end

	local frame = addon.activeItemFrame
	for _, button in next, frame.buttonList do
		if not button.IsSkinned then
			SkinIconButton(button)

			S:HandleIcon(button.icon)
			button.icon:SetInside()

			button.cooldown:SetInside()
			E:RegisterCooldown(button.cooldown)
		end
	end

	frame:Height(29)
end

local function SkinActiveItems()
	local frame = addon.activeItemFrame

	SkinBackdrop(frame, 'Transparent')
	SkinTitle(frame)

	ActiveItems_Update()
	hooksecurefunc(addon, 'UpdateItemFrame', ActiveItems_Update)

	hooksecurefunc(frame, 'UpdateFrame', ActiveItems_Update)
end

local function SkinTargetButtons(buttons)
	for _, button in next, buttons do
		if not button.IsSkinned then
			SkinIconButton(button)
		end

		local icon = button.icon
		-- RXP re-anchors the cached portraits every update
		if icon ~= button.placeholder or not icon.IsSkinned then
			S:HandleIcon(icon)
			icon:SetInside()
			icon.IsSkinned = true
		end
	end
end

local function CountRows(buttons)
	local shown = 0
	for _, button in next, buttons do
		if button:IsShown() then
			shown = shown + 1
		end
	end

	return ceil(shown / 4)
end

local function ActiveTargets_Update(targeting)
	if InCombatLockdown() then return end

	local frame = targeting.activeTargetFrame
	local enemies, friendlies = frame.enemyTargetButtons, frame.friendlyTargetButtons
	SkinTargetButtons(enemies)
	SkinTargetButtons(friendlies)

	local enemyRows, friendlyRows = CountRows(enemies), CountRows(friendlies)
	if enemyRows > 0 then
		local first = enemies[1]
		first:ClearAllPoints()
		first:Point('TOPLEFT', frame, 'TOPLEFT', 6, -6)
	end

	if friendlyRows > 0 then
		local first = friendlies[1]
		first:ClearAllPoints()
		first:Point('BOTTOMLEFT', frame, 'BOTTOMLEFT', 6, 6)
	end

	-- 2px between the enemy and friendly rows, like between buttons
	frame:Height(12 + (enemyRows + friendlyRows) * 25 + (enemyRows > 0 and friendlyRows > 0 and 2 or 0))
end

local function SkinActiveTargets()
	local targeting = addon.targeting
	local frame = targeting.activeTargetFrame

	SkinBackdrop(frame, 'Transparent')
	SkinTitle(frame)

	ActiveTargets_Update(targeting)
	hooksecurefunc(targeting, 'UpdateTargetFrame', ActiveTargets_Update)
end

local function Theme_Load()
	addon.font = E.media.normFont
end

local function SkinFonts()
	Theme_Load()
	hooksecurefunc(addon, 'LoadActiveTheme', Theme_Load)

	-- Texts the addon already created with the theme font
	addon.UpdateGuideFontSize()
	addon.activeItemFrame:UpdateVisuals()
	addon.targeting.activeTargetFrame:UpdateVisuals()
	ReplaceFont(addon.arrowFrame.text)
end

-- Leveling report
local function ReplaceLabelFonts(widget)
	for _, child in next, widget.children do
		local fontObject = child.fontObject
		if fontObject then
			local _, size, flags = fontObject:GetFont()
			fontObject:SetFont(E.media.normFont, size, flags)
		end

		if child.children then
			ReplaceLabelFonts(child)
		end
	end
end

local function Tracker_CreateGui()
	for _, report in next, addon.tracker.ui do
		local frame = report.frame
		if not frame.IsSkinned then
			if E.private.skins.ace3Enable then
				SkinBackdrop(frame, 'Transparent')
			end

			ReplaceLabelFonts(report)

			frame.IsSkinned = true
		end
	end
end

-- Level splits
local function Tracker_CreateLevelSplits(tracker)
	local frame = tracker.levelSplits
	if not frame or frame.IsSkinned then return end

	SkinBackdrop(frame, 'Transparent')

	-- Centered title
	local title = frame.title
	SkinBackdrop(title)
	ReplaceFont(title.text)
	title:ClearAllPoints()
	title:Point('BOTTOM', frame, 'TOP', 0, 1)

	frame.IsSkinned = true
end

-- Feedback form and export windows
local function BugReport_Open()
	_G.RESTEDXP_BUG_REPORT_WINDOW:SetTemplate('Transparent')
end

local function BrandedExport_Open()
	_G.RESTEDXP_BRANDED_EXPORT:SetTemplate('Transparent')
end

-- Guide importer
local function SkinImporterButton(button)
	addon.ui.v2:SetFrameBackdropShown(button, false)
	S:HandleButton(button)
end

local function Popup_UpdateTheme(popup)
	ReplaceFont(popup.title)
	ReplaceFont(popup.message)

	for _, button in next, popup.buttons do
		ReplaceFont(button.text)
	end
end

local function SkinPopup(popup)
	local frame = popup.frame
	addon.ui.v2:SetFrameBackdropShown(frame, false)
	frame:SetTemplate('Transparent')

	-- The close button is the only child button without an index
	for _, child in next, { frame:GetChildren() } do
		if child:IsObjectType('Button') and not child.index then
			S:HandleCloseButton(child, frame)
		end
	end

	for _, button in next, popup.buttons do
		SkinImporterButton(button)
	end

	Popup_UpdateTheme(popup)
	hooksecurefunc(popup, 'UpdateSubTheme', Popup_UpdateTheme)
end

local function Importer_UpdateTheme(importer)
	local widgets = addon.guideImporter.widgets

	for _, text in next, { importer.title, importer.description, widgets.importLabel, widgets.importBox.editBox, widgets.guidesLabel, widgets.currentGuides.text, widgets.progressLabel, widgets.progressText, widgets.history } do
		ReplaceFont(text)
	end

	for _, button in next, { widgets.importButton, widgets.importSplicedString, widgets.purgeButton, widgets.reloadButton, widgets.deleteButton } do
		ReplaceFont(button.text)
	end
end

-- Imported guides dropdown
local function Dropdown_ApplyTheme(_, dropdown)
	if dropdown ~= addon.guideImporter.widgets.currentGuides then return end

	ResetArrow(dropdown.button, 'down', 1, .8, 0)

	local pullout = dropdown.pullout
	local frame = pullout.frame
	frame:SetTemplate(nil, true)

	local slider = pullout.rxpV2Slider
	if not pullout.IsSkinned then
		addon.ui.v2:SetFrameBackdropShown(frame, false)
		pullout.rxpV2Background:Hide()
		pullout.rxpV2SliderBackground:Hide()
		S:HandleScrollBar(slider)

		pullout.IsSkinned = true
	end

	ResetArrow(slider.ScrollUpButton, 'up')
	ResetArrow(slider.ScrollDownButton, 'down')

	for _, item in next, pullout.items do
		ReplaceFont(item.text)
		item.highlight:SetColorTexture(1, 1, 1, .25)
	end
end

-- Built on first open
local function Importer_Open()
	local widgets = addon.guideImporter.widgets
	local importer = widgets.import
	local frame = importer and importer.frame
	if not frame or frame.IsSkinned then return end

	-- Window
	addon.ui.v2:SetFrameBackdropShown(frame, false)
	for _, texture in next, { frame.importerBackground, frame.importerBody, frame.importerHeader } do
		texture:Hide()
	end

	frame:SetTemplate('Transparent')
	S:HandleCloseButton(importer.closebutton, frame)

	-- Paste field and buttons
	local field = widgets.importBox.background
	addon.ui.v2:SetFrameBackdropShown(field, false)
	field:SetTemplate()

	for _, button in next, { widgets.importButton, widgets.importSplicedString, widgets.purgeButton, widgets.reloadButton, widgets.deleteButton } do
		SkinImporterButton(button.frame)
	end

	if E.private.skins.ace3Enable then
		local dropdown = widgets.currentGuides
		addon.ui.v2:SetFrameBackdropShown(dropdown.frame, false)

		local backdrop = dropdown.dropdown.backdrop
		local button = dropdown.button
		button:ClearAllPoints()
		button:Point('TOPLEFT', backdrop, 'TOPRIGHT', -22, -2)
		button:Point('BOTTOMRIGHT', backdrop, 'BOTTOMRIGHT', -2, 2)
	end

	-- Progress bar
	local progress = widgets.progress
	addon.ui.v2:SetFrameBackdropShown(progress, false)
	widgets.progressBackground:Hide()
	progress:SetStatusBarTexture(E.media.normTex)
	progress:CreateBackdrop('Transparent')
	E:RegisterStatusBar(progress)

	-- Purge and delete confirmations
	SkinPopup(widgets.purgeConfirmation)
	SkinPopup(widgets.deleteConfirmation)

	Importer_UpdateTheme(importer)
	hooksecurefunc(importer, 'UpdateSubTheme', Importer_UpdateTheme)

	frame.IsSkinned = true
end

local function SkinWindows()
	local tracker = addon.tracker

	Tracker_CreateGui()
	hooksecurefunc(tracker, 'CreateGui', Tracker_CreateGui)

	Tracker_CreateLevelSplits(tracker)
	hooksecurefunc(tracker, 'CreateLevelSplits', Tracker_CreateLevelSplits)

	-- AceGUI windows, only when ElvUI skins them
	if E.private.skins.ace3Enable then
		local comms = addon.comms

		local openBugReport = comms.OpenBugReport
		for _, entry in next, addon.RXPFrame.bottomMenu do
			if entry.func == openBugReport then
				hooksecurefunc(entry, 'func', BugReport_Open)
			end
		end

		hooksecurefunc(comms, 'OpenBugReport', BugReport_Open)
		hooksecurefunc(comms, 'OpenBrandedExport', BrandedExport_Open)

		hooksecurefunc(addon.ui.v2, 'ApplyDropdownTheme', Dropdown_ApplyTheme)
	end

	Importer_Open()
	hooksecurefunc(addon.guideImporter, 'Open', Importer_Open)
end

-- Talent guides button, styled like the spec tabs it sits below (Vanilla and TBC)
local function Talents_UpdateButton(talents)
	local button = talents.talentsButton
	if not button or button.IsSkinned then return end

	button.bg:Hide()
	button.bg.ht:Hide()

	button:SetTemplate()
	button:StyleButton(nil, true)

	local normal = button:GetNormalTexture()
	normal:SetInside()
	normal:SetTexCoords()

	button.IsSkinned = true
end

-- Item upgrade results (Vanilla and TBC)
local function SkinUpgradeRow(row)
	row:StripTextures()
	row:SetHighlightTexture(E.media.blankTex)

	-- The same highlight marks the selected row
	local highlight = row:GetHighlightTexture()
	highlight:SetVertexColor(1, 1, 1, .2)
	highlight:ClearAllPoints()
	highlight:Point('TOPLEFT', row.ItemIcon, 'TOPRIGHT', 2, 0)
	highlight:Point('BOTTOMRIGHT', row, 'BOTTOMRIGHT', -2, 5)

	local button = row.ItemIcon
	button:SetTemplate()
	button:StyleButton()

	local normal = button:GetNormalTexture()
	normal:SetTexture()

	local icon = button.IconTexture
	S:HandleIcon(icon)
	icon:SetInside()
end

local function AuctionHouse_DisplayResults()
	local panel = addon.ui.v2.auctionHouse
	if not panel then return end

	for _, block in next, panel.Results.children do
		local frame = block.frame
		if not frame.IsSkinned then
			frame.Header:StripTextures()
			SkinUpgradeRow(frame.Best)
			SkinUpgradeRow(frame.Budget)

			frame.IsSkinned = true
		end
	end
end

-- Auction House tab and upgrades panel
local function AuctionHouse_CreateGui()
	local panel = addon.ui.v2.auctionHouse
	local frame = panel and panel.frame
	if not frame or frame.IsSkinned then return end

	local AuctionFrame = _G.AuctionFrame
	for i = 1, AuctionFrame.numTabs do
		local tab = _G['AuctionFrameTab' .. i]
		if tab.isRXP then
			S:HandleTab(tab)
			tab:Point('TOPLEFT', _G['AuctionFrameTab' .. (i - 1)], 'TOPRIGHT', -19, 0)
		end
	end

	-- Title at the same spot as the Blizzard tab titles
	local title = frame.Title
	title:ClearAllPoints()
	title:Point('TOP', AuctionFrame, 'TOP', 0, -5)

	-- Column headers, then the close button, the buy and search buttons are keyed
	local itemName, level, upgradeEP, buyout, closeButton = frame:GetChildren()
	for _, header in next, { itemName, level, upgradeEP, buyout } do
		header:StripTextures()
	end

	local buyButton, searchButton = frame.buyButton, frame.searchButton
	for _, button in next, { closeButton, buyButton, searchButton } do
		S:HandleButton(button, true)
	end

	closeButton:Point('BOTTOMRIGHT', frame, 'BOTTOMRIGHT', -8, 6)
	buyButton:Point('RIGHT', closeButton, 'LEFT', -4, 0)
	searchButton:Point('RIGHT', buyButton, 'LEFT', -4, 0)

	-- Results list background
	local background = CreateFrame('Frame', nil, frame)
	background:SetTemplate('Transparent')
	background:Point('TOPLEFT', frame, 'TOPLEFT', 21, -74)
	background:Point('BOTTOMRIGHT', frame, 'BOTTOMRIGHT', -9, 37)

	frame.IsSkinned = true
end

-- Buttons the addon adds to Blizzard frames, only when ElvUI skins that frame
local function SkinBlizzardAdditions()
	local blizzard = E.private.skins.blizzard
	if not blizzard.enable then return end

	-- Quest log cleanup button below Abandon
	local cleanupButton = _G.RXPQuestLogCleanupButton
	if cleanupButton and blizzard[Private.isModern and 'worldmap' or 'quest'] then
		S:HandleButton(cleanupButton)
	end

	local talents = addon.talents
	if talents and blizzard.talent then
		Talents_UpdateButton(talents)
		hooksecurefunc(talents, 'UpdateTalentsButton', Talents_UpdateButton)
	end

	local itemUpgrades = addon.itemUpgrades
	if itemUpgrades and blizzard.auctionhouse then
		local auctionHouse = itemUpgrades.AH
		hooksecurefunc(auctionHouse, 'CreateEmbeddedGui', AuctionHouse_CreateGui)
		hooksecurefunc(auctionHouse, 'DisplayEmbeddedResults', AuctionHouse_DisplayResults)
	end
end

local function Skin_RXPGuides()
	if not Private.Addon.db.profile.skins.RXPGuides then return end

	addon = LibStub('AceAddon-3.0'):GetAddon('RXPGuides', true)
	if not addon or addon.v2:IsGuideWindowEnabled() then return end

	SkinFonts()
	SkinGuideWindow()
	SkinActiveItems()
	SkinActiveTargets()
	SkinWindows()
	SkinBlizzardAdditions()
end

S:AddCallbackForAddon('RXPGuides', 'LuckyoneUI_RXPGuides', Skin_RXPGuides)
