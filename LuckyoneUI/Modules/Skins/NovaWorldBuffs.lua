-- Addon namespace
local _, Private = ...

-- ElvUI file
if not Private.ElvUI then
	return
end

-- Lua functions
local unpack = unpack

-- ElvUI modules
local E = unpack(ElvUI)
local S = E:GetModule('Skins')

function Private:Skin_NovaWorldBuffs()
	if not Private.Addon.db.profile.skins.NovaWorldBuffs then return end

    if MinimapLayerFrame and not MinimapLayerFrame.isSkinned then
		-- Main Frame
		S:HandleFrame(MinimapLayerFrame)
        NWBVersionDragTooltip:StripTextures()
        NWBVersionDragTooltip:SetTemplate('Transparent') -- Mouseover tooltip, list of all layers

		-- Move the layer box to the bottom left of the minimap
        MinimapLayerFrame:ClearAllPoints()
        MinimapLayerFrame:Point('BOTTOMLEFT', Minimap, -1, -1)

		-- Make sure we can't randomly drag it around
        MinimapLayerFrame:SetMovable(false)

		-- Adjust the actual size to fit our template
        MinimapLayerFrame:Width(52)
        MinimapLayerFrame:Height(18)

        MinimapLayerFrame.isSkinned = true
    end
end

S:AddCallbackForAddon('NovaWorldBuffs', 'LuckyoneUI_NovaWorldBuffs', Private.Skin_NovaWorldBuffs)
