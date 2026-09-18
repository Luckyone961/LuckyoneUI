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

local function SkinFilterRow(row)
	S:HandleCheckBox(row.Act)

	if row.DropDown then
		S:HandleDropDownBox(row.DropDown, 145, nil, true)
	end

	if row.Min then
		S:HandleEditBox(row.Min)
		S:HandleEditBox(row.Max)
	end
end

local function InfoButton_OnEnter(button)
	_G.GameTooltip:ClearAllPoints()
	_G.GameTooltip:Point('BOTTOMLEFT', button, 'TOPRIGHT', 1, 0)
end

local function SkinPanel(panel)
	for _, section in next, { panel:GetChildren() } do
		-- Advanced expression box, or the sorting line on the mini panel
		if section.Expression then
			S:HandleEditBox(section.Expression)

			if section.Expression.ScrollBar then
				S:HandleTrimScrollBar(section.Expression.ScrollBar)
			end

			if section.Info then
				section.Info:HookScript('OnEnter', InfoButton_OnEnter)
			end
		else
			for _, child in next, { section:GetChildren() } do
				if child.Act then
					SkinFilterRow(child)
				elseif child.Label then -- select all / none / invert
					S:HandleButton(child, true)
				end
			end
		end
	end
end

local function SkinSettingsItem(item)
	if item.CheckBox then
		S:HandleCheckBox(item.CheckBox)
	end
end

local function SettingsScrollBox_Update(scrollBox)
	scrollBox:ForEachFrame(SkinSettingsItem)
end

local function Dialog_ResetPosition(dialog)
	dialog:Point('TOPLEFT', _G.PVEFrame, 'TOPRIGHT', 1, 0)
end

local function PopupMenu_OnShow(popup)
	popup:SetBackdropBorderColor(unpack(E.media.bordercolor))
end

local function Skin_PremadeGroupsFilter()
	if not Private.Addon.db.profile.skins.PremadeGroupsFilter then return end

	-- Dialog
	local dialog = _G.PremadeGroupsFilterDialog
	S:HandlePortraitFrame(dialog)
	S:HandleMaxMinFrame(dialog.MaximizeMinimizeFrame)
	hooksecurefunc(dialog, 'ResetPosition', Dialog_ResetPosition)

	for _, button in next, { dialog.ResetButton, dialog.SettingsButton, dialog.RefreshButton } do
		S:HandleButton(button)
	end

	dialog.SettingsButton.Icon:SetTexCoord(unpack(E.TexCoords))
	dialog.SettingsButton:Point('TOPLEFT', dialog.ResetButton, 'TOPRIGHT', 1, 0)

	-- Filter Panels
	for _, name in next, { 'Dungeon', 'Delve', 'Role', 'Arena', 'RBG', 'Raid', 'Mini' } do
		SkinPanel(_G['PremadeGroupsFilter' .. name .. 'Panel'])
	end

	-- Dropdown Menu, the addon resets the border to grey every time it opens
	local popup = _G.PremadeGroupsFilter.PopupMenuFrame
	popup:StripTextures()
	popup:SetTemplate('Transparent')
	popup:HookScript('OnShow', PopupMenu_OnShow)

	-- PGF toggle on the Group Finder
	S:HandleCheckBox(_G.UsePGFButton)

	-- Settings Page
	local settings = _G.PremadeGroupsFilterSettingsFrame
	S:HandleTrimScrollBar(settings.ScrollBar)
	hooksecurefunc(settings.ScrollBox, 'Update', SettingsScrollBox_Update)

	-- Static Popup
	S:HandleStaticPopup(_G.PremadeGroupsFilterStaticPopup)
end

S:AddCallbackForAddon('PremadeGroupsFilter', 'LuckyoneUI_PremadeGroupsFilter', Skin_PremadeGroupsFilter)
