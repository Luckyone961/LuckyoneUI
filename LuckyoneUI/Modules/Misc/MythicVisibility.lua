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
local GetInstanceInfo = GetInstanceInfo

-- ElvUI reference
local E = unpack(ElvUI)
local UF = E:GetModule('UnitFrames')

-- Profile defaults
local DefaultVisibility = {
	party = '[@raid6,exists][@party1,noexists] hide;show',
	raid1 = '[@raid6,noexists][@raid21,exists] hide;show',
	raid2 = '[@raid21,noexists][@raid31,exists] hide;show',
	raid3 = '[@raid31,noexists] hide;show',
}

-- Force Raid1 in Mythic difficulty
local MythicVisibility = {
	party = 'hide',
	raid1 = '[nogroup] hide;show',
	raid2 = 'hide',
	raid3 = 'hide',
}

local function HasVisibility(preset)
	local units = E.db.unitframe.units
	return units.party.visibility == preset.party
		and units.raid1.visibility == preset.raid1
		and units.raid2.visibility == preset.raid2
		and units.raid3.visibility == preset.raid3
end

local function ApplyVisibility(preset)
	if HasVisibility(preset) then return end

	local units = E.db.unitframe.units
	units.party.visibility = preset.party
	units.raid1.visibility = preset.raid1
	units.raid2.visibility = preset.raid2
	units.raid3.visibility = preset.raid3

	-- Only update headers if ElvUI frames are actually enabled
	for _, frame in ipairs({'party', 'raid1', 'raid2', 'raid3'}) do
		if units[frame].enable then
			UF:CreateAndUpdateHeaderGroup(frame)
		end
	end
end

-- Update visibility for group unitframes based on instance type and difficulty
local function UpdateRaidVisibility()
	if not Private.isRetail then return end

	-- Make sure maxAllowedGroups is enabled
	E.db.unitframe.maxAllowedGroups = true

	local _, instanceType, difficultyID = GetInstanceInfo()
	local isMythicRaid = (instanceType == 'raid' and difficultyID == 16)

	ApplyVisibility(isMythicRaid and MythicVisibility or DefaultVisibility)
end

function Private:MythicVisibility()
	if not (Private.isRetail and Private.Addon.db.profile.misc.mythicVisibility) then return end
	E:Delay(1, UpdateRaidVisibility)
end
