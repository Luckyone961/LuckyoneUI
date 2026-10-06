local _, Private = ...

if not Private.ElvUI then
	return
end

local unpack = unpack

local E = unpack(ElvUI)
local S = E:GetModule('Skins')

local function Skin_NovaWorldBuffs()
	if not Private.Addon.db.profile.skins.NovaWorldBuffs then return end

	local layerFrame = MinimapLayerFrame
	if not layerFrame then return end

	-- Main Frame
	S:HandleFrame(layerFrame)

	-- Mouseover tooltip, list of all layers (NWB gives its version window tooltip the same global name)
	layerFrame.tooltip:StripTextures()
	layerFrame.tooltip:SetTemplate('Transparent')

	-- Move the layer box to the bottom left of the minimap
	layerFrame:ClearAllPoints()
	layerFrame:Point('BOTTOMLEFT', Minimap, -1, -1)

	-- Make sure we can't randomly drag it around
	layerFrame:SetMovable(false)

	-- Adjust the actual size to fit our template, NWB re-applies .width on every layer update
	layerFrame.width = E:Scale(52)
	layerFrame:Size(52, 18)
end

S:AddCallbackForAddon('NovaWorldBuffs', 'LuckyoneUI_NovaWorldBuffs', Skin_NovaWorldBuffs)
