-- Addon namespace
local _, Private = ...

-- ElvUI file
if not Private.ElvUI then
	return
end

--[[
Event: runs on PLAYER_SPECIALIZATION_CHANGED:player
aura_env.run = function()
	-- Prevent error just in case we test stuff with ElvUI disabled
	if not _G.ElvUI then return end
	-- Sometimes spec change will finish even after entering combat
	if InCombatLockdown() then return end

	-- ElvUI
	local E = unpack(ElvUI)
	local scaled = E.global.L1UI.scaled -- 1080p users
	local ActionBarsDT = E.global.datatexts.customPanels.Luckyone_ActionBars_DT

	-- Just in case any non-Retail andy is trying to import it
	if not E.Retail then return end

	-- APIs
	local ID = GetSpecializationInfo(GetSpecialization())

	-- Healers
	local healers = {
		[270] = true, --Mistweaver Monk
		[264] = true, --Restoration Shaman
		[1468] = true, --Preservation Evoker
		[257] = true, --Holy Priest
		[256] = true, --Discipline Priest
		[65] = true, --Holy Paladin
		[105] = true, --Restoration Druid
	}

	-- Debug print
	if aura_env.config.debug then
		print(ID)
	end

	-- Only check spec if LuckyoneUI DT exists
	if ActionBarsDT then
		-- Augmentation layout values
		if ID == 1473 then
			ActionBarsDT.width = (scaled and 404) or 464
			-- Healer layout values when ActionBars are hidden
			-- elseif aura_env.config.healers and healers[ID] and E.db.actionbar.bar1.mouseover then
		elseif aura_env.config.healers and healers[ID] then
			ActionBarsDT.width = 604
			-- Main layout values
		else
			ActionBarsDT.width = (scaled and 299) or 347
		end
	end
end

-- Run on init and after edits to this file
aura_env.run()
]]
