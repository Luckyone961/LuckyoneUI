local _, Private = ...

if not Private.ElvUI then
	return
end

--[[
	Modified version of:
	ElvUI\Game\Mainline\Skins\CooldownManager.Lua
	Removed all skinning except for the settings frame, added the alert editors.
]]

local next = next

local hooksecurefunc = hooksecurefunc

local _G = _G

local E = unpack(ElvUI)
local S = E:GetModule('Skins')

local hookedItemPools = {}

local function ViewerTab_SetPoint(tab, _, _, _, x, y)
	if x ~= 2 or y ~= -1 then
		tab:ClearAllPoints()
		tab:SetPoint('TOPLEFT', _G.CooldownViewerSettings, 'TOPRIGHT', 2, -1)
	end
end

local function TabIcon_SetPoint(icon, point)
	if point == 'CENTER' then return end

	icon:ClearAllPoints()
	icon:SetPoint('CENTER')
end

local function SkinHeader(header)
	if header.HighlightMiddle then header.HighlightMiddle:SetAlpha(0) end
	if header.HighlightLeft then header.HighlightLeft:SetAlpha(0) end
	if header.HighlightRight then header.HighlightRight:SetAlpha(0) end
	if header.Middle then header.Middle:Hide() end
	if header.Left then header.Left:Hide() end
	if header.Right then header.Right:Hide() end

	S:HandleButton(header)

	header.IsSkinned = true
end

local function SkinSettingItem(item)
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

-- Items come from a pool
local function ItemPool_Acquire(pool)
	for frame in pool:EnumerateActive() do
		SkinSettingItem(frame)
	end
end

local function SkinContent(content)
	for _, child in next, { content:GetChildren() } do
		local header = child.Header
		if header and not header.IsSkinned then
			SkinHeader(header)
		end

		local itemPool = child.itemPool
		if itemPool and not hookedItemPools[itemPool] then
			hookedItemPools[itemPool] = true

			ItemPool_Acquire(itemPool)

			hooksecurefunc(itemPool, 'Acquire', ItemPool_Acquire)
		end
	end
end

local function Settings_RefreshLayout(viewer)
	SkinContent(viewer.CooldownScroll.Content)
	SkinContent(viewer.GroupBuffFilter.Scroll.Content)
end

local function SkinAbilityTabs(viewer)
	for i, tab in next, { viewer.SpellsTab, viewer.AurasTab, viewer.GroupBuffsTab } do
		tab:CreateBackdrop()
		tab:Size(30, 40)

		if i == 1 then
			tab:ClearAllPoints()
			tab:SetPoint('TOPLEFT', viewer, 'TOPRIGHT', 2, -1)

			hooksecurefunc(tab, 'SetPoint', ViewerTab_SetPoint)
		end

		if tab.Icon then
			tab.Icon:ClearAllPoints()
			tab.Icon:SetPoint('CENTER')

			hooksecurefunc(tab.Icon, 'SetPoint', TabIcon_SetPoint)
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

local function SkinSettings(viewer)
	S:HandlePortraitFrame(viewer)
	S:HandleEditBox(viewer.SearchBox)
	S:HandleTrimScrollBar(viewer.CooldownScroll.ScrollBar)
	S:HandleTrimScrollBar(viewer.GroupBuffFilter.Scroll.ScrollBar)
	S:HandleButton(viewer.UndoButton)
	S:HandleDropDownBox(viewer.LayoutDropdown)

	SkinAbilityTabs(viewer)
	Settings_RefreshLayout(viewer)

	hooksecurefunc(viewer, 'RefreshLayout', Settings_RefreshLayout)
end

local function SkinLayoutDialog(dialog)
	dialog.Border:Hide()
	dialog:SetTemplate('Transparent')

	S:HandleButton(dialog.AcceptButton)
	S:HandleButton(dialog.CancelButton)
	S:HandleCheckBox(dialog.CharacterSpecificLayoutCheckButton.Button)
	S:HandleEditBox(dialog.LayoutNameEditBox)
	dialog.LayoutNameEditBox.backdrop:NudgePoint(0, -3, nil, 'TOPLEFT')
	dialog.LayoutNameEditBox.backdrop:NudgePoint(0, 3, nil, 'BOTTOMRIGHT')
end

-- CooldownViewerSettingsEditAlert and GroupBuffFilterEditVisualAlert share CooldownViewerEditAlertBaseTemplate,
-- the side panel that opens to the right of the settings frame when adding or editing an alert
local function SkinEditAlert(frame, ...)
	frame.BG:Hide()
	frame:SetTemplate('Transparent')

	S:HandleIcon(frame.Icon, true)
	S:HandleCloseButton(frame.CloseButton)
	S:HandleButton(frame.AddButton)

	for _, dropdown in next, { ... } do
		S:HandleDropDownBox(dropdown, 268)
	end
end

local function Skin_CooldownViewer()
	if not Private.Addon.db.profile.skins.Blizzard.CooldownViewer then return end

	SkinSettings(_G.CooldownViewerSettings)

	local editAlert = _G.CooldownViewerSettingsEditAlert
	SkinEditAlert(editAlert, editAlert.TypeDropdown, editAlert.EventDropdown, editAlert.PayloadDropdown)

	local visualAlert = _G.GroupBuffFilterEditVisualAlert
	SkinEditAlert(visualAlert, visualAlert.VisualDropdown)

	SkinLayoutDialog(_G.CooldownViewerLayoutDialog)

	local importDialog = _G.CooldownViewerImportLayoutDialog
	SkinLayoutDialog(importDialog)
	S:HandleEditBox(importDialog.ImportBox)

	-- Line up the right edge with the import box above it
	importDialog.LayoutNameEditBox.backdrop:NudgePoint(10, 0, nil, 'BOTTOMRIGHT')
end

S:AddCallbackForAddon('Blizzard_CooldownViewer', 'LuckyoneUI_CooldownViewer', Skin_CooldownViewer)
