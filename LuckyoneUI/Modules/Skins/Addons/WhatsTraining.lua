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
	frame:Point('BOTTOMRIGHT', SpellBookFrame, 'BOTTOMRIGHT', 0, 0)

	-- Close Button
	SpellBookCloseButton:SetFrameStrata('HIGH')

	frame.isSkinned = true
end

local function TabActive_SetShown(active, shown)
	local backdrop = active:GetParent().backdrop
	if shown then
		backdrop:SetBackdropBorderColor(1, .8, .1)
	else
		backdrop:SetBackdropBorderColor(unpack(E.media.bordercolor))
	end
end

-- Same look as ElvUI's square Spellbook category tabs
local function SkinTab(tab)
	tab.normal:SetAlpha(0)
	tab.active:SetAlpha(0)
	tab.glow:SetAlpha(0)

	-- ElvUI drops the native icon mask, which WhatsTraining simulates with a smaller icon
	local icon = tab.icon
	icon:SetTexCoords()
	icon:Size(36, 35)
	icon:ClearAllPoints()
	icon:Point('BOTTOM')

	tab:CreateBackdrop()
	tab.backdrop:SetOutside(icon)

	tab:SetHighlightTexture(E.media.blankTex)

	local highlight = tab:GetHighlightTexture()
	highlight:SetVertexColor(1, 1, 1, .25)
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

-- WhatsTraining builds its frames on PLAYER_ENTERING_WORLD (Forever controls once Blizzard_PlayerSpells loads), so skin on the first Spellbook open
local function Skin_WhatsTraining()
	if not Private.Addon.db.profile.skins.WhatsTraining then return end

	if Private.isForever then
		-- Needs an owner, an ownerless callback taints Blizzard's shared owner ID counter
		EventRegistry:RegisterCallback('PlayerSpellsFrame.SpellBookFrame.Show', Skin_Forever, 'LuckyoneUI_WhatsTraining')

		-- The window is created on its first open, from /wt or the Broker button
		hooksecurefunc(SlashCmdList, 'WHATSTRAINING', Skin_FloatingFrame)

		local broker = LibStub('LibDataBroker-1.1'):GetDataObjectByName('WhatsTraining')
		if broker then
			hooksecurefunc(broker, 'OnClick', Skin_FloatingFrame)
		end
	else
		SpellBookFrame:HookScript('OnShow', Skin_Legacy)
	end
end

S:AddCallbackForAddon('WhatsTraining', 'LuckyoneUI_WhatsTraining', Skin_WhatsTraining)
