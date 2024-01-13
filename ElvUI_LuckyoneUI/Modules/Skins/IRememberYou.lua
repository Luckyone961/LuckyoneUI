local Name, Private = ...
local E, L, V, P, G = unpack(ElvUI)
local S = E:GetModule('Skins')

local _G = _G

function L1UI:Skin_IRememberYou()
	if not E.private.L1UI.skins.IRememberYou then return end

	local MyListAddonFrame = _G.MyListAddonFrame
	S:HandleFrame(MyListAddonFrame)

	local MyListAddonScrollFrameScrollBar = _G.MyListAddonScrollFrameScrollBar
	S:HandleScrollBar(MyListAddonScrollFrameScrollBar)

	local SliderAddonSlider = _G.SliderAddonSlider
	SliderAddonSlider:StripTextures()

	local sliderTextureFrame = _G.sliderTextureFrame
	sliderTextureFrame:StripTextures()

	local toolsEditBox = _G.toolsEditBox
	S:HandleEditBox(toolsEditBox)
end

S:AddCallbackForAddon('IRememberYou', 'LuckyoneUI_IRememberYou', L1UI.Skin_IRememberYou)
