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
