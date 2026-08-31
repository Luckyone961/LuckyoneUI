local _, Private = ...

if not Private.ElvUI then
	return
end

--[[
	Modified version of:
	ElvUI\Game\Mainline\Skins\CooldownManager.Lua
	Removed all skinning except for the settings frame.
]]

local next = next

local hooksecurefunc = hooksecurefunc

local _G = _G

local E = unpack(ElvUI)
local S = E:GetModule('Skins')

local function CooldownManager_PositionViewerTab(tab, _, _, _, x, y)
	if x ~= 1 or y ~= 0 then
		tab:ClearAllPoints()
		tab:SetPoint('TOPLEFT', _G.CooldownViewerSettings, 'TOPRIGHT', 2, -1)
	end
end

local function CooldownManager_PositionTabIcons(icon, point)
	if point == 'CENTER' then return end

	icon:ClearAllPoints()
	icon:SetPoint('CENTER')
end

local function CooldownManager_HandleHeaders(header)
	if header.HighlightMiddle then header.HighlightMiddle:SetAlpha(0) end
	if header.HighlightLeft then header.HighlightLeft:SetAlpha(0) end
	if header.HighlightRight then header.HighlightRight:SetAlpha(0) end
	if header.Middle then header.Middle:Hide() end
	if header.Left then header.Left:Hide() end
	if header.Right then header.Right:Hide() end

	S:HandleButton(header)

	header.IsSkinned = true
end

local function CooldownManager_HandleSettingItem(item)
	if item.IsSkinned then return end

	local icon = item.Icon
	if icon then
		local highlight = item.Highlight
		if highlight then
			highlight:SetColorTexture(1, 1, 1, .25)
			highlight:SetAllPoints(icon)
		end

		S:HandleIcon(icon, true)
	end

	item.IsSkinned = true
end

local function CooldownManager_HandleSettingItemPool(pool)
	for frame in pool:EnumerateActive() do
		CooldownManager_HandleSettingItem(frame)
	end
end

local hookedItemPools = {}

local function RefreshContent(content)
	if not content then return end

	for _, child in next, { content:GetChildren() } do
		local header = child.Header
		if header and not header.IsSkinned then
			CooldownManager_HandleHeaders(child.Header)
		end

		local itemPool = child.itemPool
		if itemPool and not hookedItemPools[itemPool] then
			hookedItemPools[itemPool] = true

			CooldownManager_HandleSettingItemPool(itemPool)

			hooksecurefunc(itemPool, 'Acquire', CooldownManager_HandleSettingItemPool)
		end
	end
end

local function CooldownManager_RefreshLayout()
	local CooldownViewer = _G.CooldownViewerSettings
	if not CooldownViewer then return end

	if CooldownViewer.CooldownScroll then
		RefreshContent(CooldownViewer.CooldownScroll.Content)
	end

	local groupBuffFilter = CooldownViewer.GroupBuffFilter
	if groupBuffFilter and groupBuffFilter.Scroll then
		RefreshContent(groupBuffFilter.Scroll.Content)
	end
end

local function CooldownManager_HandleAbilityTabs(viewer)
	for i, tab in next, { viewer.SpellsTab, viewer.AurasTab, viewer.GroupBuffsTab } do
		tab:CreateBackdrop()
		tab:Size(30, 40)

		if i == 1 then
			tab:ClearAllPoints()
			tab:SetPoint('TOPLEFT', viewer, 'TOPRIGHT', 2, -1)

			hooksecurefunc(tab, 'SetPoint', CooldownManager_PositionViewerTab)
		end

		if tab.Icon then
			tab.Icon:ClearAllPoints()
			tab.Icon:SetPoint('CENTER')

			hooksecurefunc(tab.Icon, 'SetPoint', CooldownManager_PositionTabIcons)
		end

		if tab.Background then
			tab.Background:SetAlpha(0)
		end

		if tab.SelectedTexture then
			tab.SelectedTexture:SetDrawLayer('ARTWORK')
			tab.SelectedTexture:SetColorTexture(1, 0.82, 0, 0.3)
			tab.SelectedTexture:SetAllPoints()
		end

		if tab.HighlightTexture then
			tab.HighlightTexture:SetColorTexture(1, 1, 1, 0.3)
			tab.HighlightTexture:SetAllPoints()
		end

		if tab.TabGlow then
			tab.TabGlow:SetAlpha(0)
		end
	end
end

local function CooldownManager_HandleSettings(viewer)
	if not viewer then return end

	S:HandlePortraitFrame(viewer)
	S:HandleEditBox(viewer.SearchBox)
	S:HandleTrimScrollBar(viewer.CooldownScroll.ScrollBar)
	S:HandleTrimScrollBar(viewer.GroupBuffFilter.Scroll.ScrollBar)
	S:HandleButton(viewer.UndoButton)
	S:HandleDropDownBox(viewer.LayoutDropdown)

	CooldownManager_HandleAbilityTabs(viewer)
	CooldownManager_RefreshLayout()

	hooksecurefunc(viewer, 'RefreshLayout', CooldownManager_RefreshLayout)
end

local function Skin_CooldownViewer()
	if not Private.Addon.db.profile.skins.Blizzard.CooldownViewer then return end

	CooldownManager_HandleSettings(_G.CooldownViewerSettings)

	local ImportLayoutDialog = _G.CooldownViewerImportLayoutDialog
	if ImportLayoutDialog then
		ImportLayoutDialog.Border:Hide()
		ImportLayoutDialog:SetTemplate('Transparent')

		S:HandleButton(ImportLayoutDialog.AcceptButton)
		S:HandleButton(ImportLayoutDialog.CancelButton)
		S:HandleEditBox(ImportLayoutDialog.ImportBox)
		S:HandleEditBox(ImportLayoutDialog.LayoutNameEditBox)
		ImportLayoutDialog.LayoutNameEditBox.backdrop:NudgePoint(0, -3, nil, 'TOPLEFT')
		ImportLayoutDialog.LayoutNameEditBox.backdrop:NudgePoint(10, 3, nil, 'BOTTOMRIGHT')
	end

	local LayoutDialog = _G.CooldownViewerLayoutDialog
	if LayoutDialog then
		LayoutDialog.Border:Hide()
		LayoutDialog:SetTemplate('Transparent')

		S:HandleButton(LayoutDialog.AcceptButton)
		S:HandleButton(LayoutDialog.CancelButton)
		S:HandleEditBox(LayoutDialog.LayoutNameEditBox)
		LayoutDialog.LayoutNameEditBox.backdrop:NudgePoint(0, -3, nil, 'TOPLEFT')
		LayoutDialog.LayoutNameEditBox.backdrop:NudgePoint(0, 3, nil, 'BOTTOMRIGHT')
	end
end

S:AddCallbackForAddon('Blizzard_CooldownViewer', 'LuckyoneUI_CooldownViewer', Skin_CooldownViewer)
