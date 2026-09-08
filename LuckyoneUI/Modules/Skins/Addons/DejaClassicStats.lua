local _, Private = ...

if not Private.ElvUI or not (Private.isClassic or Private.isTBC) then
	return
end

local ipairs = ipairs
local unpack = unpack

local C_Timer = C_Timer

local _G = _G

local E = unpack(ElvUI)
local S = E:GetModule('Skins')

-- Category headers
local Headers = {
	'DCSSpellEnhancementsStatsHeader',
	'DCSPrimaryStatsHeader',
	'DCSDefenseStatsHeader',
	'DCSRangedStatsHeader',
	'DCSMeleeEnhancementsStatsHeader'
}

local function Skin_DejaClassicStats()
	if not Private.Addon.db.profile.skins.DejaClassicStats then return end

	local frame = _G.DejaClassicStatsFrame
	if not frame or frame.isSkinned then return end

	-- Main Frame
	frame:StripTextures()
	frame:SetTemplate('Transparent')

	-- Stat Frame
	local statFrame = _G.DCS_StatScrollFrame
	statFrame:StripTextures()
	statFrame:SetTemplate('Transparent')

	-- Adjust size and position
	statFrame:Height(424)
	statFrame:ClearAllPoints()
	statFrame:Point('TOPLEFT', _G.CharacterFrame, 'TOPRIGHT', -31, -12)

	for _, headerName in ipairs(Headers) do
		local header = _G[headerName]
		if header then
			header:StripTextures()
			header:SetTemplate()
			header:Height(24)
		end
	end

	frame.isSkinned = true
end

S:AddCallbackForAddon('DejaClassicStats', 'LuckyoneUI_DejaClassicStats', function() C_Timer.After(1, Skin_DejaClassicStats) end)
