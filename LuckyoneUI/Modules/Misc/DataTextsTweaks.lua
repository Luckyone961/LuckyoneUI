-- Addon namespace
local _, Private = ...

-- ElvUI file
if not Private.ElvUI then
	return
end

-- API cache
local GetSpecialization = C_SpecializationInfo and C_SpecializationInfo.GetSpecialization
local GetSpecializationInfo = C_SpecializationInfo and C_SpecializationInfo.GetSpecializationInfo
local InCombatLockdown = InCombatLockdown

-- ElvUI reference
local E = unpack(ElvUI)
local DT = E:GetModule('DataTexts')

-- Healers
local healers = {
	[270] = true, -- Mistweaver Monk
	[264] = true, -- Restoration Shaman
	[1468] = true, -- Preservation Evoker
	[257] = true, -- Holy Priest
	[256] = true, -- Discipline Priest
	[65] = true, -- Holy Paladin
	[105] = true -- Restoration Druid
}

local function Profile()
	local data = E.data:GetCurrentProfile()
	return strfind(data, 'Luckyone Main') and 1 or strfind(data, 'Luckyone Healing') and 2 or nil
end

-- Update ActionBars DataText width based on specialization
local function UpdateDataTextWidth()
	if InCombatLockdown() then return end

	-- 1080p
	local scaled = Private.Addon.db.global.scaled

	local ActionBarsDT = E.global.datatexts.customPanels.Luckyone_ActionBars_DT

	-- Only continue if our custom ActionBars DataText exists
	if not ActionBarsDT then return end

	-- Get specialization ID
	local specIndex = GetSpecialization()
	if not specIndex then return end

	-- print('specIndex: ' .. specIndex)

	local ID = GetSpecializationInfo(specIndex)
	if not ID then return end

	-- print('ID: ' .. ID)

	-- Healer layout values
	if healers[ID] or (Private.itsLuckyone and ID == 1473 and Profile() == 2) then
		ActionBarsDT.width = 704
	else -- Main layout values
		ActionBarsDT.width = (scaled and 398) or 395
	end

	-- print('new width: ' .. ActionBarsDT.width)

	DT:LoadDataTexts()
end

function Private:DataTextsTweaks()
	if not (Private.isRetail and Private.Addon.db.profile.misc.dataTextsTweaks) then return end
	E:Delay(1, UpdateDataTextWidth)
end
