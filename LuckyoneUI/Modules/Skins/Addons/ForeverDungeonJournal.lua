local _, Private = ...

if not Private.ElvUI then
	return
end

local abs = abs
local next = next
local unpack = unpack

local hooksecurefunc = hooksecurefunc
local RunNextFrame = RunNextFrame

local E = unpack(ElvUI)
local S = E:GetModule('Skins')

local FDJ

local function SkinPanel(panel)
	panel:SetBackdrop()
	panel:CreateBackdrop()
end

local function CreateHighlight(button)
	local highlight = button:CreateTexture(nil, 'HIGHLIGHT')
	highlight:SetColorTexture(1, 1, 1, .25)
	highlight:SetInside(button.backdrop)
end

-- The selected row is painted in the theme color of the dungeon
local function IsSelectedColor(r, g, b)
	for _, theme in next, FDJ.THEMES do
		local color = theme.rowSelected
		if abs(r - color[1]) < .001 and abs(g - color[2]) < .001 and abs(b - color[3]) < .001 then
			return true
		end
	end

	return false
end

local function Row_SetBackdropColor(row, r, g, b)
	row.selectedTexture:SetShown(IsSelectedColor(r, g, b))
end

-- Boss and quest rows, faction buttons
local function SkinListRow(row)
	local r, g, b = row:GetBackdropColor()

	row:SetBackdrop()
	row:CreateBackdrop('Transparent', nil, nil, nil, nil, nil, nil, true)
	CreateHighlight(row)

	local selected = row:CreateTexture(nil, 'BACKGROUND')
	local vr, vg, vb = unpack(E.media.rgbvaluecolor)
	selected:SetColorTexture(vr, vg, vb, .25)
	selected:SetInside(row.backdrop)
	row.selectedTexture = selected

	Row_SetBackdropColor(row, r, g, b)
	hooksecurefunc(row, 'SetBackdropColor', Row_SetBackdropColor)

	row.IsSkinned = true
end

local function SkinQuestRow(row)
	SkinListRow(row)

	-- Completed quests get a green border
	local glow = row.completeGlow
	glow:SetTemplate(nil, nil, true, true)
	glow:SetBackdropColor(0, 0, 0, 0)
	glow:SetBackdropBorderColor(.12, 1, .25)
	glow:SetAllPoints()

	-- Quest Chain
	row.chainPanel:SetTemplate('Transparent')
end

-- Loot rows, quest rewards and the quest item buttons
local function SkinItemButton(button)
	button:SetBackdrop()
	button:CreateBackdrop('Transparent', nil, nil, nil, nil, nil, nil, true)
	CreateHighlight(button)

	local icon = button.icon
	icon:SetTexCoords()
	icon:CreateBackdrop(nil, nil, nil, nil, nil, nil, nil, nil, true)
	icon:SetParent(icon.backdrop)

	button.IsSkinned = true
end

local function Tab_UpdateBorder(tab)
	tab:SetBackdropBorderColor(unpack(tab:IsEnabled() and E.media.bordercolor or E.media.rgbvaluecolor))
end

-- DungeonJournal disables the active tab
local function SkinTab(tab)
	S:HandleButton(tab)

	tab:HookScript('OnEnable', Tab_UpdateBorder)
	tab:HookScript('OnDisable', Tab_UpdateBorder)
	Tab_UpdateBorder(tab)
end

local function BossContent_SetHeight(content)
	for _, row in next, { content:GetChildren() } do
		if not row.IsSkinned then
			row:Width(306)
			SkinListRow(row)
		end
	end
end

local function QuestContent_SetHeight(content)
	for _, row in next, { content:GetChildren() } do
		if not row.IsSkinned then
			SkinQuestRow(row)
		end
	end
end

local function ItemContent_SetHeight(content)
	for _, button in next, { content:GetChildren() } do
		if button.icon and button.name and not button.IsSkinned then
			SkinItemButton(button)
		end
	end
end

local function HomeContent_SetHeight(content)
	for _, card in next, { content:GetChildren() } do
		if not card.IsSkinned then
			-- Border around the dungeon art
			card:SetBackdrop()
			card:CreateBackdrop()
			card.backdrop:SetInside(card, 3, 3)
			card.innerGlow:Hide()

			card:HookScript('OnEnter', S.SetModifiedBackdrop)
			card:HookScript('OnLeave', S.SetOriginalBackdrop)

			card.IsSkinned = true
		end
	end
end

local function RouteContent_SetHeight(content)
	for _, row in next, { content:GetChildren() } do
		S:HandleButton(row.mapButton)
	end
end

local function SearchResults_SetHeight(results)
	for _, row in next, { results:GetChildren() } do
		-- Skip the template borders without thin borders
		if not row.IsSkinned and row:IsObjectType('Button') then
			row:GetHighlightTexture():SetColorTexture(1, 1, 1, .25)
			row.IsSkinned = true
		end
	end
end

-- Floor buttons of multi level dungeons
local function Map_Render()
	local buttons = ForeverDungeonJournalFrame.dungeonMapFloorButtons
	if not buttons then return end

	for _, button in next, buttons do
		if not button.IsSkinned then
			SkinTab(button)
		end
	end
end

local function Text_SetTextColor(text, r, g, b)
	if r ~= 1 or g ~= 1 or b ~= 1 then
		text:SetTextColor(1, 1, 1)
	end
end

-- The "You will also receive" header is created on demand in a black font
local function QuestDetail_SetHeight()
	local header = ForeverDungeonJournalFrame.questAlsoReceiveHeader
	if header then
		header:SetTextColor(1, 1, 1)
	end
end

local function Skin_Frame()
	local frame = ForeverDungeonJournalFrame
	if not frame then return end

	-- Main Frame
	frame:SetBackdrop()
	frame:StripTextures()
	frame:CreateBackdrop('Transparent')

	for _, child in next, { frame:GetChildren() } do
		if child:IsObjectType('Button') and child:GetScript('OnClick') == UIPanelCloseButton_OnClick then
			S:HandleCloseButton(child)
		end
	end

	S:HandleButton(frame.backButton)

	-- Language select top right
	S:HandleButton(frame.languageSelectorButton)
	S:HandleNextPrevButton(frame.languageLeftButton, 'left', nil, true)
	S:HandleNextPrevButton(frame.languageRightButton, 'right', nil, true)

	local languageMenu = frame.languageMenu
	for _, option in next, { languageMenu:GetChildren() } do
		option:GetHighlightTexture():SetColorTexture(1, 1, 1, .25)
	end

	languageMenu:SetTemplate('Transparent')

	-- Search
	local searchBox = frame.searchEditBox
	searchBox:SetBackdrop()
	S:HandleEditBox(searchBox)
	searchBox.backdrop:SetAllPoints()
	frame.searchClearButton:SetNormalTexture(E.Media.Textures.Close)

	local searchResults = frame.searchResultsFrame
	searchResults:SetTemplate('Transparent')
	hooksecurefunc(searchResults, 'SetHeight', SearchResults_SetHeight)

	-- Dungeon List
	local home = frame.homePanel
	home:SetBackdrop()
	home:StripTextures()

	local hideButton = frame.hideDungeonsButton
	hideButton:SetBackdrop()
	S:HandleButton(hideButton, nil, nil, nil, true)

	S:HandleScrollBar(frame.homeScroll.ScrollBar)

	hooksecurefunc(frame.homeCardsContent, 'SetHeight', HomeContent_SetHeight)
	HomeContent_SetHeight(frame.homeCardsContent)

	-- Dungeon Page
	frame.contentPanel:SetBackdrop()
	frame.contentParchment:Hide()
	frame.atmosphere:Hide()
	frame.dungeonBackgroundArt:Kill()

	SkinPanel(frame.headerPanel)
	frame.headerParchment:Hide()

	SkinTab(frame.bossesTab)
	SkinTab(frame.questsTab)
	SkinTab(frame.mapTab)
	SkinTab(frame.dungeonRouteButton)

	-- Bosses
	SkinPanel(frame.leftPanel)
	SkinPanel(frame.rightPanel)
	frame.leftParchment:Hide()
	frame.rightParchment:Hide()

	S:HandleScrollBar(frame.bossListScroll.ScrollBar)
	S:HandleScrollBar(frame.lootScroll.ScrollBar)

	hooksecurefunc(frame.bossContent, 'SetHeight', BossContent_SetHeight)
	hooksecurefunc(frame.lootContent, 'SetHeight', ItemContent_SetHeight)
	BossContent_SetHeight(frame.bossContent)
	ItemContent_SetHeight(frame.lootContent)

	-- Quests
	SkinPanel(frame.questLeftPanel)
	SkinPanel(frame.questRightPanel)
	frame.questLeftParchment:Hide()
	frame.questRightParchment:Hide()

	SkinListRow(frame.allianceQuestButton)
	SkinListRow(frame.hordeQuestButton)

	S:HandleScrollBar(frame.questListScroll.ScrollBar)
	S:HandleScrollBar(frame.questDetailScroll.ScrollBar)

	hooksecurefunc(frame.questContent, 'SetHeight', QuestContent_SetHeight)
	QuestContent_SetHeight(frame.questContent)

	-- Quest Details
	frame.questTextInset:SetBackdrop()
	frame.questHeaderSeparator:Hide()

	for _, edge in next, frame.questInsetEdges do
		edge:Hide()
	end

	if E.private.skins.parchmentRemoverEnable then
		frame.questParchment:Hide()

		for _, text in next, { frame.selectedQuestMeta, frame.questDetailText, frame.questStartsText, frame.questTurninText, frame.questNotesText, frame.questRewardSummary, frame.noQuestMessage } do
			text:SetTextColor(1, 1, 1)
			hooksecurefunc(text, 'SetTextColor', Text_SetTextColor)
		end

		hooksecurefunc(frame.questDetailContent, 'SetHeight', QuestDetail_SetHeight)
	else
		frame.questParchment:SetInside(frame.questRightPanel.backdrop)
	end

	local shareButton = frame.questShareButton
	shareButton:SetBackdrop()
	S:HandleButton(shareButton, nil, nil, nil, true)

	S:HandleButton(frame.questMapButton)
	S:HandleButton(frame.questChainButton)
	S:HandleButton(frame.questStartLinkButton)
	S:HandleButton(frame.questLeadsToButton)
	S:HandleNextPrevButton(frame.questPrevStepButton, 'left', nil, true)
	S:HandleNextPrevButton(frame.questNextStepButton, 'right', nil, true)

	-- Same look as the reward rows
	frame.questXPReward:SetTemplate('Transparent')
	frame.questMoneyReward:SetTemplate('Transparent')

	hooksecurefunc(frame.questDetailContent, 'SetHeight', ItemContent_SetHeight)
	ItemContent_SetHeight(frame.questDetailContent)

	-- Dungeon Map
	frame.dungeonMapPanel:SetTemplate()
	frame.dungeonMapCanvas:SetBackdrop()
	hooksecurefunc(FDJ, 'RenderCustomDungeonMap', Map_Render)

	-- Route Guide
	local routePanel = frame.routePanel
	routePanel:StripTextures()
	routePanel:SetTemplate()

	S:HandleButton(frame.routeMapButton)
	S:HandleScrollBar(frame.routeStepScroll.ScrollBar)
	hooksecurefunc(frame.routeStepContent, 'SetHeight', RouteContent_SetHeight)
end

local function Skin_ForeverDungeonJournal()
	if not Private.Addon.db.profile.skins.ForeverDungeonJournal then return end

	FDJ = ForeverDungeonJournal_NS

	-- DungeonJournal builds its window on PLAYER_LOGIN
	if ForeverDungeonJournalFrame then
		Skin_Frame()
	else
		RunNextFrame(Skin_Frame)
	end
end

S:AddCallbackForAddon('ForeverDungeonJournal', 'LuckyoneUI_ForeverDungeonJournal', Skin_ForeverDungeonJournal)
