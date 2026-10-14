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

local function Tabardy_LoadPortrait()
	_G.TabardyDesignerPortrait:StripTextures()
end

local function Skin_Tabardy()
	if not Private.Addon.db.profile.skins.Tabardy then return end

	local designer = _G.TabardyDesigner
	if not designer then return end

	-- Main Frame
	designer:SetTemplate('Transparent')
	designer.Bg:Hide()
	designer.NineSlice:Hide()

	-- Close Button
	S:HandleCloseButton(designer.CloseButton)

	-- Buttons and Pickers
	local customizations = designer.Customizations
	for _, button in next, {
		designer.AcceptButton,
		designer.CancelButton,
		customizations.EmblemPicker,
		customizations.EmblemColorPicker,
		customizations.BackgroundPicker,
		customizations.BorderPicker,
		customizations.BorderColorPicker
	} do
		S:HandleButton(button)
	end

	-- The portrait border comes back on every refresh
	hooksecurefunc(designer, 'LoadPortrait', Tabardy_LoadPortrait)
end

S:AddCallbackForAddon('Tabardy', 'LuckyoneUI_Tabardy', Skin_Tabardy)
