-- Addon namespace
local _, Private = ...

-- ElvUI file
if not Private.ElvUI then
	return
end

-- Lua functions
local strfind = string.find
local unpack = unpack

-- API cache
local InCombatLockdown = InCombatLockdown

-- ElvUI reference
local E = unpack(ElvUI)
local DT = E:GetModule('DataTexts')

local function Profile()
	local data = E.data:GetCurrentProfile()
	return strfind(data, 'Luckyone Main') and 1 or strfind(data, 'Luckyone Healing') and 2 or nil
end

-- Update ActionBars DataText width based on active LuckyoneUI profile
local function UpdateDataTextWidth()
	if InCombatLockdown() then return end

	local datatexts = E.global.datatexts
	if not datatexts or not datatexts.customPanels then return end

	local ActionBarsDT = datatexts.customPanels.Luckyone_ActionBars_DT
	if not ActionBarsDT then return end

	local profile = Profile()
	local scaled = Private.Addon.db.global.scaled

	-- Main layout values
	if profile == 1 then
		ActionBarsDT.width = scaled and 398 or 395
	elseif profile == 2 then -- Healer layout values
		ActionBarsDT.width = 704
	else
		Private:Print('Unknown profile, not adjusting DataText width.')
		return
	end

	DT:LoadDataTexts()
end

function Private:DataTextsTweaks()
	if not Private.Addon.db.profile.misc.dataTextsTweaks then return end
	E:Delay(1, UpdateDataTextWidth)
end
