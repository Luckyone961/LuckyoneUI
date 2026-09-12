local _, Private = ...

if not Private.ElvUI then
	return
end

--[[
	Settings frame skin is ElvUI's own S:CooldownManager_HandleSettings,
	the alert editors and layout dialogs are skinned here.
]]

local next = next

local _G = _G

local E = unpack(ElvUI)
local S = E:GetModule('Skins')

local function SkinLayoutDialog(dialog)
	dialog.Border:Hide()
	dialog:SetTemplate('Transparent')

	S:HandleButton(dialog.AcceptButton)
	S:HandleButton(dialog.CancelButton)
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

	local editAlert = _G.CooldownViewerSettingsEditAlert
	SkinEditAlert(editAlert, editAlert.TypeDropdown, editAlert.EventDropdown, editAlert.PayloadDropdown)

	local visualAlert = _G.GroupBuffFilterEditVisualAlert
	SkinEditAlert(visualAlert, visualAlert.VisualDropdown)

	-- ElvUI leaves the layout checkbox alone
	local layoutDialog = _G.CooldownViewerLayoutDialog
	local importDialog = _G.CooldownViewerImportLayoutDialog
	S:HandleCheckBox(layoutDialog.CharacterSpecificLayoutCheckButton.Button)
	S:HandleCheckBox(importDialog.CharacterSpecificLayoutCheckButton.Button)

	-- ElvUI's own skin already covers the settings frame and both layout dialogs
	if E.private.skins.blizzard.enable and E.private.skins.blizzard.cooldownManager then return end

	S:CooldownManager_HandleSettings(_G.CooldownViewerSettings)
	SkinLayoutDialog(layoutDialog)
	SkinLayoutDialog(importDialog)
	S:HandleEditBox(importDialog.ImportBox)

	-- Line up the right edge with the import box above it
	importDialog.LayoutNameEditBox.backdrop:NudgePoint(10, 0, nil, 'BOTTOMRIGHT')
end

S:AddCallbackForAddon('Blizzard_CooldownViewer', 'LuckyoneUI_CooldownViewer', Skin_CooldownViewer)
