-- Lua functions
local pairs = pairs
local unpack = unpack

-- API cache
local hooksecurefunc = hooksecurefunc

-- Global environment
local _G = _G

-- ElvUI modules
local E = unpack(ElvUI)
local S = E:GetModule('Skins')

local function HandleNextPrev(button)

	S:HandleNextPrevButton(button, nil, nil, true)

	button:SetScript('OnEnter', nil)
	button:SetScript('OnLeave', nil)
	button:SetScript('OnMouseUp', nil)
	button:SetScript('OnMouseDown', nil)
end

function L1UI:Skin_Tabardy()
	if not E.private.L1UI.skins.Tabardy then return end

	local TabardyDesigner = _G.TabardyDesigner

	TabardyDesigner:SetTemplate('Transparent')
	TabardyDesigner.Bg:Hide()
	TabardyDesigner.NineSlice:Hide()

	local buttons = {
		TabardyDesigner.AcceptButton,
		TabardyDesigner.CancelButton,
		TabardyDesigner.Customizations.EmblemPicker,
		TabardyDesigner.Customizations.EmblemColorPicker,
		TabardyDesigner.Customizations.BackgroundPicker
	}
	for _, button in pairs(buttons) do
		S:HandleButton(button)
	end

	local nextPrev = {
		TabardyDesigner.Customizations.BorderPicker.DecrementButton,
		TabardyDesigner.Customizations.BorderPicker.IncrementButton,
		TabardyDesigner.Customizations.BorderColorPicker.DecrementButton,
		TabardyDesigner.Customizations.BorderColorPicker.IncrementButton
	}
	for _, button in pairs(nextPrev) do
		HandleNextPrev(button)
	end

	hooksecurefunc(TabardyDesigner, 'LoadPortrait', function()
		TabardyDesignerPortrait:StripTextures()
	end)
end

S:AddCallbackForAddon('Tabardy', 'LuckyoneUI_Tabardy', L1UI.Skin_Tabardy)
