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
	if not layerFrame or layerFrame.isSkinned then return end

	-- Main Frame
	S:HandleFrame(layerFrame)
	NWBVersionDragTooltip:StripTextures()
	NWBVersionDragTooltip:SetTemplate('Transparent') -- Mouseover tooltip, list of all layers

	-- Move the layer box to the bottom left of the minimap
	layerFrame:ClearAllPoints()
	layerFrame:Point('BOTTOMLEFT', Minimap, -1, -1)

	-- Make sure we can't randomly drag it around
	layerFrame:SetMovable(false)

	-- Adjust the actual size to fit our template
	layerFrame:Size(52, 18)

	layerFrame.isSkinned = true
end

S:AddCallbackForAddon('NovaWorldBuffs', 'LuckyoneUI_NovaWorldBuffs', Skin_NovaWorldBuffs)
