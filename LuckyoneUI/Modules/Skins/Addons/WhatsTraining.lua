local _, Private = ...

if not Private.ElvUI then
	return
end

local next = next
local unpack = unpack

local hooksecurefunc = hooksecurefunc

local _G = _G

local E = unpack(ElvUI)
local S = E:GetModule('Skins')
local TT = E:GetModule('Tooltip')

-- Waypoint provider radios
local function GroupingPopup_OnShow(popup)
	for _, radio in next, popup.providerRadios do
		S:HandleRadioButton(radio)
	end
end

-- Compact list, shared by the Vanilla/TBC Spellbook page and the Forever /wt window
local function SkinCompactFrame(frame)
	local name = frame:GetName()

	-- Scroll Bar
	S:HandleScrollBar(_G[name..'ScrollBarScrollBar'])

	-- Edit Box
	local searchBox = _G[name..'SearchBox']
	S:HandleEditBox(searchBox)
	searchBox:Height(24)

	-- Weapon Skill Toggle and Grouping Buttons
	local toggleButton, groupingButton = frame.weaponSkillToggleButton, frame.groupingButton
	for _, button in next, { toggleButton, groupingButton } do
		S:HandleButton(button)
		button:Size(24)
	end

	toggleButton.Icon:SetTexCoords()
	toggleButton:ClearAllPoints()
	toggleButton:Point('LEFT', searchBox.backdrop, 'RIGHT', 3, 0)
	groupingButton:ClearAllPoints()
	groupingButton:Point('LEFT', toggleButton, 'RIGHT', 3, 0)

	-- Grouping Popup
	local popup = frame.groupingPopup
	popup:SetTemplate('Transparent')

	for _, radio in next, popup.radios do
		S:HandleRadioButton(radio)
	end

	-- WhatsTraining 11.0.0-beta20+
	if popup.providerRadios then
		popup:HookScript('OnShow', GroupingPopup_OnShow)
	end

	S:HandleButton(_G[name..'GroupingPopupDone'])

	-- Show Known checkbox, WhatsTraining 11+
	local showKnown = _G[name..'GroupingPopupShowKnown']
	if showKnown then
		S:HandleCheckBox(showKnown)
	end
end

-- Vanilla and TBC: own page inside the SpellBookFrame
local function Skin_Legacy()
	local frame = WhatsTrainingFrame
	if not frame or frame.isSkinned then return end

	-- The SpellBookFrame holds secure spell buttons, retried on the next open
	if InCombatLockdown() then return end

	-- Main Frame
	S:HandleFrame(frame, true, 'Default', 11, -50, -32, 76)

	SkinCompactFrame(frame)
	WhatsTrainingFrameSearchBox:Point('TOPLEFT', frame, 'TOPLEFT', 15, -50)

	-- Frame Positioning
	frame:Point('TOPLEFT', SpellBookFrame, 'TOPLEFT', 0, 38)

	-- Close Button
	SpellBookCloseButton:SetFrameStrata('HIGH')

	frame.isSkinned = true
end

local function LayoutTabIcon(tab)
	local scale = tab.inverted and 0.8 or 1
	local icon = tab.icon
	icon:Size(36 * scale, 35 * scale)
	icon:ClearAllPoints()
	icon:Point(tab.inverted and 'TOP' or 'BOTTOM')
end

local function TabActive_SetShown(active, shown)
	local tab = active:GetParent()
	LayoutTabIcon(tab)

	if shown then
		tab.backdrop:SetBackdropBorderColor(1, 0.8, 0.1)
	else
		tab.backdrop:SetBackdropBorderColor(unpack(E.media.bordercolor))
	end
end

-- Same look as ElvUI's square Spellbook category tabs
local function SkinTab(tab)
	tab.normal:SetAlpha(0)
	tab.active:SetAlpha(0)
	tab.glow:SetAlpha(0)

	local icon = tab.icon
	icon:SetTexCoords()

	tab:CreateBackdrop()
	tab.backdrop:SetOutside(icon)

	tab:SetHighlightTexture(E.media.blankTex)

	local highlight = tab:GetHighlightTexture()
	highlight:SetVertexColor(1, 1, 1, 0.25)
	highlight:SetAllPoints(icon)

	hooksecurefunc(tab.active, 'SetShown', TabActive_SetShown)
	TabActive_SetShown(tab.active, tab.active:IsShown())
end

-- Forever: overlay on the PlayerSpellsFrame, the page keeps the WhatsTraining parchment like the Spellbook
local function Skin_Forever()
	local frame = WhatsTrainingFrame
	if not frame or frame.isSkinned then return end

	-- Tabs
	SkinTab(WhatsTrainingLauncher)
	SkinTab(WhatsTrainingOverlay.returnTab)

	-- Dropdown
	local dropdown = frame.displayDropdown
	S:HandleNextPrevButton(dropdown, 'down', nil, true)
	dropdown:SetTemplate()

	-- Edit Box
	local searchBox = frame.searchBox
	S:HandleEditBox(searchBox)
	searchBox:Height(20)
	searchBox:ClearAllPoints()
	searchBox:Point('RIGHT', dropdown, 'LEFT', -5, 0)

	-- Scroll Bars
	S:HandleTrimScrollBar(frame.scrollFrame.ScrollBar)
	S:HandleTrimScrollBar(frame.weaponPage.scrollFrame.ScrollBar)

	-- Price Dropdown
	local priceDropdown = frame.priceDropdown
	S:HandleNextPrevButton(priceDropdown, 'down', nil, true, nil, nil, 16)
	priceDropdown:SetTemplate()

	-- WhatsTraining raised the total 4px for its half height arrow, center the arrow on the total instead
	priceDropdown:ClearAllPoints()
	priceDropdown:Point('TOPRIGHT', frame.header.Border, 'TOPRIGHT', 0, 19)
	frame.total:ClearAllPoints()
	frame.total:Point('RIGHT', priceDropdown, 'LEFT', -2, 0)

	-- Page Buttons
	local paging = frame.pagingControls
	S:HandleNextPrevButton(paging.PrevPageButton, 'left', nil, true)
	S:HandleNextPrevButton(paging.NextPageButton, 'right', nil, true)

	-- Center the now smaller buttons on the page label row
	paging.PrevPageButton.align = 'center'
	paging.NextPageButton.align = 'center'

	frame.isSkinned = true
end

-- Forever: /wt and Broker window
local function Skin_FloatingFrame()
	local frame = WhatsTrainingFloatingFrame
	if not frame or frame.isSkinned then return end

	S:HandleFrame(frame)
	S:HandleCloseButton(WhatsTrainingFloatingFrameClose)

	SkinCompactFrame(frame)

	frame.isSkinned = true
end

local function SkinCanvas(frame)
	local canvas = frame:GetChildren()
	local header = canvas:GetChildren()
	header:Hide()

	canvas:StripTextures()
	canvas:SetTemplate()
end

local function CraftingPage_OnShow()
	ProfessionsFrame.TitleContainer.TitleText:SetAlpha(0)
end

local function CraftingPage_OnHide()
	ProfessionsFrame.TitleContainer.TitleText:SetAlpha(1)
end

local function CraftingTab_SetPoint(tab, point, relativeTo)
	local bottom = point == 'TOPRIGHT'
	tab:Size(bottom and 30 or 36, bottom and 36 or 30)

	if bottom then
		tab:SetPointsOffset(E:Scale(-1), E:Scale(-3))
	elseif relativeTo == ProfessionsFrame.ProfessionsOverviewTab then
		tab:SetPointsOffset(0, E:Scale(3))
	else
		tab:SetPointsOffset(E:Scale(3), E:Scale(1))
	end
end

-- Profession headers like ElvUI's recipe list categories
local function SkinCraftingRow(row)
	if row.isSkinned then return end

	if row.CollapseButton then
		row:StripTextures()
		row:CreateBackdrop()
		row.backdrop:SetInside(row, 0, 1)
	elseif row.iconBorder then
		row.iconBorder:SetAlpha(0)
		S:HandleIcon(row.icon, true)
	end

	row.isSkinned = true
end

local function CraftingList_Update(scrollBox)
	scrollBox:ForEachFrame(SkinCraftingRow)
end

local function Skin_Crafting()
	local page = WhatsTrainingCraftingPage
	if not page or page.isSkinned then return end

	local canvas = page:GetChildren()
	for _, child in next, { page:GetChildren() } do
		if child ~= canvas and not child:GetName() then
			local _, border = child:GetPoint()
			child:SetOutside(border, 6, 6)

			SkinCanvas(child)
		end
	end

	SkinCanvas(page)
	page:HookScript('OnShow', CraftingPage_OnShow)
	page:HookScript('OnHide', CraftingPage_OnHide)

	-- Tabs
	local launcher = WhatsTrainingCraftingTab
	S:HandleLargeSideTab(launcher)
	S:HandleLargeSideTab(WhatsTrainingCraftingReturnTab)
	hooksecurefunc(launcher, 'SetPoint', CraftingTab_SetPoint)

	-- Edit Box
	S:HandleEditBox(WhatsTrainingCraftingSearchBox)

	-- Filter Dropdown
	local filterDropdown = WhatsTrainingCraftingFilterDropdown
	S:HandleButton(filterDropdown, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, true, 'right')
	S:HandleCloseButton(filterDropdown.ResetButton)

	-- Scroll Bar
	S:HandleTrimScrollBar(WhatsTrainingCraftingScrollBar)

	-- Rows
	hooksecurefunc(WhatsTrainingCraftingScrollBox, 'Update', CraftingList_Update)

	page.isSkinned = true
end

-- Skin on the first Spellbook open
local function Skin_WhatsTraining()
	if not Private.Addon.db.profile.skins.WhatsTraining then return end

	local blizzard = E.private.skins.blizzard
	if blizzard.enable and blizzard.tooltip then
		for _, tooltip in next, { WhatsTrainingTooltip, WhatsTrainingCompareTooltip, WhatsTrainingForeverTooltip } do
			TT:SetStyle(tooltip)
		end
	end

	if Private.isForever then
		EventRegistry:RegisterCallback('PlayerSpellsFrame.SpellBookFrame.Show', Skin_Forever, 'LuckyoneUI_WhatsTraining')

		if blizzard.enable and blizzard.tradeskill then
			EventRegistry:RegisterCallback('ProfessionsFrame.Show', Skin_Crafting, 'LuckyoneUI_WhatsTraining')
		end

		-- The window is created on its first open
		hooksecurefunc(SlashCmdList, 'WHATSTRAINING', Skin_FloatingFrame)

		local broker = Private.Libs.LDB:GetDataObjectByName('WhatsTraining')
		if broker then
			hooksecurefunc(broker, 'OnClick', Skin_FloatingFrame)
		end
	else
		SpellBookFrame:HookScript('OnShow', Skin_Legacy)
	end
end

S:AddCallbackForAddon('WhatsTraining', 'LuckyoneUI_WhatsTraining', Skin_WhatsTraining)
