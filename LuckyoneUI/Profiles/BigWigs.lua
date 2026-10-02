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
