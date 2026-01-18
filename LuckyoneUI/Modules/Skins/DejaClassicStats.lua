-- Addon namespace
local _, Private = ...

-- ElvUI file
if not Private.ElvUI then
	return
end

-- Lua functions
local ipairs = ipairs
local unpack = unpack

-- API cache
local C_Timer = C_Timer

-- Global environment
local _G = _G

-- ElvUI modules
local E = unpack(ElvUI)
local S = E:GetModule('Skins')

function Private:Skin_DejaClassicStats()
	if not (Private.isClassic or Private.isTBC) and not Private.Addon.db.profile.skins.DejaClassicStats then return end

	if DejaClassicStatsFrame and not DejaClassicStatsFrame.isSkinned then
		-- Main Frame
		DejaClassicStatsFrame:StripTextures()
		DejaClassicStatsFrame:SetTemplate('Transparent')
		DCS_StatScrollFrame:StripTextures()
		DCS_StatScrollFrame:SetTemplate('Transparent')

		-- Adjust size and position
		DCS_StatScrollFrame:Height(424)
		DCS_StatScrollFrame:ClearAllPoints()
		DCS_StatScrollFrame:Point('TOPLEFT', _G.CharacterFrame, 'TOPRIGHT', -31, -12)

		-- Category Headers
		local headers = {
			'DCSSpellEnhancementsStatsHeader',
			'DCSPrimaryStatsHeader',
			'DCSDefenseStatsHeader',
			'DCSRangedStatsHeader',
			'DCSMeleeEnhancementsStatsHeader'
		}
		for _, headerName in ipairs(headers) do
			local header = _G[headerName]
			if header then
				header:StripTextures()
				header:SetTemplate()
				header:Height(24)
			end
		end

		DejaClassicStatsFrame.isSkinned = true
	end
end

S:AddCallbackForAddon('DejaClassicStats', 'LuckyoneUI_DejaClassicStats', C_Timer.After(1, function() Private.Skin_DejaClassicStats() end))
