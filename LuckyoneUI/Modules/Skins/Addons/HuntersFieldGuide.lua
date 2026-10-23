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

-- Gold border on the selected tab
local function Tab_SetChecked(tab, checked)
	if checked then
		tab.backdrop:SetBackdropBorderColor(1, 0.8, 0.1)
	else
		local r, g, b = unpack(E.media.bordercolor)
		tab.backdrop:SetBackdropBorderColor(r, g, b)
	end
end

local function HandleTab(tab)
	tab.frame:SetAlpha(0)
	tab.active:SetAlpha(0)
	tab.glow:SetAlpha(0)

	for _, region in next, { tab:GetRegions() } do
		if region:GetObjectType() == 'Texture' and region:GetNumMaskTextures() > 0 then
			region:RemoveMaskTexture(region:GetMaskTexture(1))
			region:SetTexCoords()
			region:Size(30)

			tab:CreateBackdrop()
			tab.backdrop:SetOutside(region)
		end
	end

	hooksecurefunc(tab, 'SetChecked', Tab_SetChecked)
end

local function HandleArrows(owner)
	S:HandleNextPrevButton(owner.prev, 'left', nil, true)
	S:HandleNextPrevButton(owner.next, 'right', nil, true)
end

local function Skin_Journal(frame, pager)
	local page
	for _, region in next, { frame:GetRegions() } do
		if region:GetObjectType() == 'Texture' and region:GetAtlas() == 'spellbook-Page-Right-C60' then
			page = region
		end
	end

	-- Main Frame
	S:HandlePortraitFrame(frame)

	if page then
		page:SetAtlas('spellbook-Page-Right-C60')
	end

	-- The portrait is hidden
	frame.home:ClearHighlightTexture()

	-- Buttons
	for _, button in next, { frame.back, frame.map, frame.model, frame.filter } do
		S:HandleButton(button)
	end

	-- Search Box
	S:HandleEditBox(frame.search)

	-- Page Arrows
	HandleArrows(pager)

	-- Map page, beast page maps and tabs
	for _, child in next, { frame:GetChildren() } do
		if child.idxKey then
			HandleArrows(child)
		elseif child.mapBelow then
			HandleArrows(child.map)
			HandleArrows(child.mapBelow)
		elseif child.tab then
			HandleTab(child)
		end
	end

	-- Filter Menu
	local menu = frame.filterMenu
	menu:SetTemplate('Transparent')
	S:HandleButton(menu.clear)

	for _, check in next, { menu.level, menu.speed, menu.look } do
		S:HandleCheckBox(check)
	end

	for _, check in next, menu.only do
		S:HandleCheckBox(check)
	end
end

-- Target panel and popup
local function Skin_Popups()
	local panel = _G.FieldGuideTargetPanel
	panel:SetTemplate('Transparent')
	panel.zones:SetTextColor(1, 1, 1)
	panel.teach:SetTextColor(1, 1, 1)
	S:HandleButton(panel.done)

	local toast = _G.FieldGuideToast
	toast:SetTemplate('Transparent')
	toast.head:SetTextColor(1, 1, 1)
	toast.sub:SetTextColor(1, 1, 1)
	toast.slot:SetTemplate()
	S:HandleButton(toast.done)
end

-- The export window
local function Skin_Export()
	local frame = _G.FieldGuideExport
	if frame.IsSkinned then return end

	frame:SetTemplate('Transparent')
	S:HandleScrollBar(_G.FieldGuideExportScroll.ScrollBar)

	-- Close button
	for _, child in next, { frame:GetChildren() } do
		if child:IsObjectType('Button') then
			S:HandleCloseButton(child)
		end
	end

	frame.IsSkinned = true
end

local function Skin_HuntersFieldGuide()
	if not Private.Addon.db.profile.skins.HuntersFieldGuide then return end

	local frame = _G.FieldGuideFrame
	if not frame then return end

	local HuntersFieldGuide = _G.HuntersFieldGuide

	-- Only the Forever Spellbook option style
	if HuntersFieldGuide.skinName == 'forever' then
		Skin_Journal(frame, HuntersFieldGuide.pager)
	end

	Skin_Popups()

	hooksecurefunc(HuntersFieldGuide, 'ShowExport', Skin_Export)
end

S:AddCallbackForAddon('HuntersFieldGuide', 'LuckyoneUI_HuntersFieldGuide', Skin_HuntersFieldGuide)
