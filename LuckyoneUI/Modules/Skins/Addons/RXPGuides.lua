local _, Private = ...

if not Private.ElvUI then
	return
end

--[[
	NOT skinned:
	- Guide Configurator
	- Guide importer
	- feedback and export windows
	- Leveling report
	- Active Party Steps
	- Auction House upgrades tab
]]

local ceil = ceil
local next = next
local unpack = unpack

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

local function AddHover(frame, anchor)
	local hover = frame:CreateTexture(nil, 'HIGHLIGHT')
	hover:SetInside(anchor)
	hover:SetColorTexture(1, 1, 1, .25)
end

local function Backdrop_SetBackdrop(frame, backdrop)
	local backdrops = addon.RXPFrame.backdrop
	if backdrop == backdrops.edge or backdrop == backdrops.guideName or backdrop == backdrops.bottom then
		frame:SetTemplate(frame.template)
	end
end

local function Backdrop_SetBackdropColor(frame)
	local center = frame.Center
	if not center then return end

	local transparent = frame.template == 'Transparent'
	local r, g, b, a = unpack(transparent and E.media.backdropfadecolor or E.media.backdropcolor)
	center:SetVertexColor(r, g, b, transparent and a or 1)
end

local function SkinBackdrop(frame, template)
	-- A frame with its background hidden gets the template on the next SetBackdrop
	if frame.backdropInfo then
		frame:SetTemplate(template)
	else
		frame.template = template
	end

	hooksecurefunc(frame, 'SetBackdrop', Backdrop_SetBackdrop)
	hooksecurefunc(frame, 'SetBackdropColor', Backdrop_SetBackdropColor)
end

local function HideV2Backdrop(frame)
	local background, border, shadow = frame.rxpBackground, frame.rxpBorder, frame.rxpShadow
	if background then background:SetAlpha(0) end
	if border then border:SetAlpha(0) end
	if shadow then shadow:SetAlpha(0) end
end

local function SkinV2Backdrop(frame, template)
	HideV2Backdrop(frame)

	frame:CreateBackdrop(template, nil, nil, nil, nil, nil, nil, true)
	frame.v2Backdrop = true

	-- Icon frames with Hide Background on get no ElvUI background either
	local background = frame.rxpBackground
	if not (background and background:IsShown()) then
		frame.backdrop:Hide()
	end
end

-- The icon frames get their border and shadow on the first background toggle
local function V2_ApplyFrameBackdrop(_, frame)
	if frame.v2Backdrop then
		HideV2Backdrop(frame)
	end
end

local function V2_SetFrameBackdropShown(_, frame, shown)
	if frame.v2Backdrop then
		frame.backdrop:SetShown(shown)
	end
end

-- Legacy step list rows, created per step on guide load
local function Guide_Load()
	for _, row in next, addon.RXPFrame.ScrollChild.framePool do
		if not row.IsSkinned then
			SkinBackdrop(row, 'Transparent')
			AddHover(row)

			row.IsSkinned = true
		end
	end
end

local function ScrollBar_Update()
	local scrollBar = addon.RXPFrame.ScrollFrame.ScrollBar
	for _, button in next, { scrollBar.ScrollUpButton, scrollBar.ScrollDownButton } do
		button.Normal:SetTexture(E.Media.Textures.ArrowUp)
		button.Pushed:SetTexture(E.Media.Textures.ArrowUp)
		button.Disabled:SetTexture(E.Media.Textures.ArrowUp)
		button.Highlight:SetTexture(E.ClearTexture)
	end

	scrollBar:GetThumbTexture():SetTexture()
end

-- Legacy active steps, their frames and element rows are created in SetStep, which ends in UpdateText
local function CurrentStep_UpdateText()
	for _, stepFrame in next, addon.RXPFrame.CurrentStepFrame.framePool do
		if not stepFrame.IsSkinned then
			SkinBackdrop(stepFrame, 'Transparent')

			-- Step label in the top right corner, above the step text
			local number = stepFrame.number
			SkinBackdrop(number)
			number:ClearAllPoints()
			number:Point('TOPRIGHT', stepFrame, 'TOPRIGHT')
			number:OffsetFrameLevel(3, stepFrame)

			stepFrame.IsSkinned = true
		end

		for _, element in next, stepFrame.elements do
			local button = element.button
			if not button.IsSkinned then
				S:HandleCheckBox(button)
				button.backdrop:SetAllPoints()

				button:GetDisabledCheckedTexture():SetAlpha(0)
			end
		end
	end
end

local function SkinGuideWindow()
	local frame = addon.RXPFrame

	-- The visible frames sit 3px inside the clamped window, let them reach the screen edge
	frame:SetClampRectInsets(3, -3, 0, 0)

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
end

-- V2 step list scroll bar, RXP recolors it on every theme update
local function V2Scroll_RefreshVisuals(scroll)
	local scrollBar = scroll.scrollbar
	scrollBar.ScrollUpButton.Normal:SetVertexColor(1, 1, 1)
	scrollBar.ScrollDownButton.Normal:SetVertexColor(1, 1, 1)
end

-- V2 step list rows, pooled and re-themed by SetRow
local function GuideSteps_SetRows(guideSteps)
	for _, item in next, guideSteps.items do
		local frame = item.frame
		if not frame.IsSkinned then
			SkinV2Backdrop(frame, 'Transparent')
			AddHover(frame, frame.backdrop)

			-- Step number without the badge
			HideV2Backdrop(item.numberFrame)

			ReplaceFont(item.text)
			ReplaceFont(item.number)

			frame.IsSkinned = true
		end
	end
end

local function V2_UpdateMenuTheme(_, listFrame, enabled)
	if not (enabled and listFrame) then return end

	HideV2Backdrop(listFrame)

	local menuBackdrop = _G[listFrame:GetName() .. 'MenuBackdrop']
	if menuBackdrop then
		menuBackdrop:Show()
	end
end

-- Active step checkboxes, StripTextures in HandleCheckBox also clears RXP's check mark lines
local function ActiveStepItem_SetElements(item)
	for _, row in next, item.elementRows do
		local button = row.button
		if not button.IsSkinned then
			HideV2Backdrop(button)
			S:HandleCheckBox(button)
			button.backdrop:SetAllPoints()

			-- RXP disables completed elements, they keep the checked look
			button:GetDisabledTexture():SetAlpha(0)

			-- Skip icon on hover without the border
			HideV2Backdrop(button.rxpHoverFrame)
		end
	end
end

-- Active step cards of the V2 window, the party members' cards keep the party window's look
local function V2_ReconcileActiveStepItems(v2, playerState)
	if playerState ~= v2.state.player[addon.player.name] then return end

	for _, item in next, playerState.activeStepItems do
		if not item.IsSkinned then
			SkinV2Backdrop(item.card, 'Transparent')
			SkinV2Backdrop(item.title)
			ReplaceFont(item.titletext)

			ActiveStepItem_SetElements(item)
			hooksecurefunc(item, 'SetElements', ActiveStepItem_SetElements)

			item.IsSkinned = true
		end
	end
end

local function SkinV2GuideWindow()
	local v2 = addon.v2
	local window = v2:GetGuideWindow()
	if not window then return end

	-- Header with the logo, guide name and menu buttons
	local header = window.upperFrame
	SkinV2Backdrop(header)
	HideV2Backdrop(window.guideNameFrame)
	window.banner:SetAlpha(0)
	S:HandleCloseButton(window.closebutton, header)

	-- Step list, its top border sits under the header's bottom border
	local list = window.guideStepsFrame
	SkinV2Backdrop(list, 'Transparent')
	list.backdrop:Point('TOPLEFT', list, 'TOPLEFT', 0, E.Border)
	window.footerBackground:SetAlpha(0)

	local guideSteps = window.guideSteps
	local scroll = guideSteps.scroll
	S:HandleScrollBar(scroll.scrollbar)
	scroll.scrollbg:SetAlpha(0)
	V2Scroll_RefreshVisuals(scroll)
	hooksecurefunc(scroll, 'RefreshVisuals', V2Scroll_RefreshVisuals)

	GuideSteps_SetRows(guideSteps)
	hooksecurefunc(guideSteps, 'SetRows', GuideSteps_SetRows)

	-- Texts created with the theme font
	ReplaceFont(window.title)
	ReplaceFont(window.subtitle)
	ReplaceFont(window.footerText)

	hooksecurefunc(v2, 'UpdateMenuTheme', V2_UpdateMenuTheme)

	local ui = addon.ui.v2
	hooksecurefunc(ui, 'ApplyFrameBackdrop', V2_ApplyFrameBackdrop)
	hooksecurefunc(ui, 'AddFrameShadow', V2_ApplyFrameBackdrop)
	hooksecurefunc(ui, 'SetFrameBackdropShown', V2_SetFrameBackdropShown)

	-- Cards RXP built in its own initialization
	local playerState = v2.state.player[addon.player.name]
	if playerState and playerState.activeStepItems then
		V2_ReconcileActiveStepItems(v2, playerState)
	end

	hooksecurefunc(v2, 'ReconcileActiveStepItems', V2_ReconcileActiveStepItems)
end

-- Timer bars below the window come from a library pool shared with other addons
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

-- Active Items and Active Targets, the title sits above the frame
local function SkinIconFrame(frame)
	local title = frame.title
	if frame.v2 then
		SkinV2Backdrop(frame, 'Transparent')
		SkinV2Backdrop(title)
	else
		SkinBackdrop(frame, 'Transparent')
		SkinBackdrop(title)
	end

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

-- Returns the rows of shown buttons, RXP puts 4 in a row
local function SkinTargetButtons(buttons)
	local shown = 0
	for _, button in next, buttons do
		if not button.IsSkinned then
			SkinIconButton(button)
		end

		-- RXP re-anchors the cached portraits every update
		local icon = button.icon
		if icon ~= button.placeholder or not icon.IsSkinned then
			S:HandleIcon(icon)
			icon:SetInside()
			icon.IsSkinned = true
		end

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
	local enemyRows, friendlyRows = SkinTargetButtons(enemies), SkinTargetButtons(friendlies)

	-- RXP keeps room on top for the title, which sits above the frame here
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

local function SkinIconFrames()
	local itemFrame = addon.activeItemFrame
	SkinIconFrame(itemFrame)

	ActiveItems_Update()
	hooksecurefunc(addon, 'UpdateItemFrame', ActiveItems_Update)

	-- The frame keeps the original function as its UpdateFrame
	hooksecurefunc(itemFrame, 'UpdateFrame', ActiveItems_Update)

	local targeting = addon.targeting
	SkinIconFrame(targeting.activeTargetFrame)

	ActiveTargets_Update(targeting)
	hooksecurefunc(targeting, 'UpdateTargetFrame', ActiveTargets_Update)
end

local function Theme_Load()
	addon.font = E.media.normFont
end

-- V2 texts read the font from the theme tables, RXP rebuilds those from the legacy themes
local function Themes_Convert()
	for _, theme in next, addon.v2.themes do
		theme.font = E.media.normFont
	end
end

local function SkinFonts()
	Theme_Load()
	hooksecurefunc(addon, 'LoadActiveTheme', Theme_Load)

	Themes_Convert()
	hooksecurefunc(addon.v2, 'ConvertThemes', Themes_Convert)

	-- Texts the addon already created with the theme font
	addon.UpdateGuideFontSize()
	addon.activeItemFrame:UpdateVisuals()
	addon.targeting.activeTargetFrame:UpdateVisuals()
	ReplaceFont(addon.arrowFrame.text)
end

-- Level Splits, title centered above the frame
local function Tracker_CreateLevelSplits(tracker)
	local frame = tracker.levelSplits
	if not frame or frame.IsSkinned then return end

	SkinBackdrop(frame, 'Transparent')

	local title = frame.title
	SkinBackdrop(title)
	ReplaceFont(title.text)
	title:ClearAllPoints()
	title:Point('BOTTOM', frame, 'TOP', 0, 1)

	frame.IsSkinned = true
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

-- Buttons the addon adds to Blizzard frames
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
end

local function Skin_RXPGuides()
	if not Private.Addon.db.profile.skins.RXPGuides then return end

	addon = LibStub('AceAddon-3.0'):GetAddon('RXPGuides', true)
	if not addon then return end

	SkinFonts()

	if addon.v2:IsGuideWindowEnabled() then
		SkinV2GuideWindow()
	else
		SkinGuideWindow()
	end

	hooksecurefunc(addon, 'StartTimer', Timer_Start)
	LibStub('LibCandyBar-3.0').RegisterCallback('LuckyoneUI_RXPGuides', 'LibCandyBar_Stop', CandyBar_Stop)

	SkinIconFrames()

	local tracker = addon.tracker
	Tracker_CreateLevelSplits(tracker)
	hooksecurefunc(tracker, 'CreateLevelSplits', Tracker_CreateLevelSplits)

	SkinBlizzardAdditions()
end

S:AddCallbackForAddon('RXPGuides', 'LuckyoneUI_RXPGuides', Skin_RXPGuides)
