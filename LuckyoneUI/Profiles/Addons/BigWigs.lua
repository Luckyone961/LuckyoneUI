local _, Private = ...
local L = Private.L

local LibStub = LibStub

-- Runs only after successful profile import
local function CallbackFunction(accepted)
	if not accepted then return end

	-- Minimap icon
	local LDBI = LibStub('LibDBIcon-1.0')
	BigWigsIconDB.hide = true
	LDBI:Hide('BigWigs')

	-- 1080p
	local scaled = Private.Addon.db.global.scaled
	local bres = BigWigsLoader.db:GetNamespace('BigWigs_Plugins_BattleRes', true)
	if (scaled and bres) then
		bres.profile.position[3] = -489 -- 1440p: -709
		bres.profile.position[4] = -514 -- 1440p: -694
	end

	local block = BigWigsLoader.db:GetNamespace('BigWigs_Plugins_BossBlock', true)
	if block then -- LuckyoneUI hides talking head while keeping its audio
		block.profile.blockTalkingHeads = { false, false, false, false, false, false }
	end

	local auras = BigWigsLoader.db:GetNamespace('BigWigs_Plugins_Auras', true)
	if auras then -- We use ElvUI player frame debuffs with filter strings
		auras.profile.player.disabled = true
	end

	local mplus = BigWigsLoader.db:GetNamespace('MythicPlus', true)
	if mplus then -- MPlusTimer already adds tooltip progress
		mplus.profile.progressTooltip = false
	end
end

-- BigWigs profile
function Private:Setup_BigWigs()
	if not BigWigsAPI then Private:Print('BigWigs ' .. L["is not installed or enabled."]) return end

	-- Profile name
	local name = 'Luckyone'

	-- Profile string
	local importString = [[BW2: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]]

	-- Profile import
	BigWigsAPI.RegisterProfile('LuckyoneUI', importString, name, CallbackFunction)
end
