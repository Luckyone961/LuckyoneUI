-- Lua functions
local ipairs = ipairs
local unpack = unpack

-- API cache
local hooksecurefunc = hooksecurefunc

-- Global environment
local _G = _G

-- ElvUI modules
local E = unpack(ElvUI)
local S = E:GetModule('Skins')

function L1UI:Skin_Tabardy()
	if not E.private.L1UI.skins.Tabardy then return end

	local TabardyDesigner = _G.TabardyDesigner

	TabardyDesigner:SetTemplate('Transparent')
	TabardyDesigner.Bg:Hide()
	TabardyDesigner.NineSlice:Hide()

	S:HandleCloseButton(TabardyDesigner.CloseButton)

	local buttons = {
		TabardyDesigner.AcceptButton,
		TabardyDesigner.CancelButton,
		TabardyDesigner.Customizations.EmblemPicker,
		TabardyDesigner.Customizations.EmblemColorPicker,
		TabardyDesigner.Customizations.BackgroundPicker,
		TabardyDesigner.Customizations.BorderPicker,
		TabardyDesigner.Customizations.BorderColorPicker
	}
	for _, button in ipairs(buttons) do
		S:HandleButton(button)
	end

	hooksecurefunc(TabardyDesigner, 'LoadPortrait', function()
		TabardyDesignerPortrait:StripTextures()
	end)
end

S:AddCallbackForAddon('Tabardy', 'LuckyoneUI_Tabardy', L1UI.Skin_Tabardy)
