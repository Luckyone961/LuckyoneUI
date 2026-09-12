local _, Private = ...

if not Private.ElvUI then
	return
end

local ipairs = ipairs
local unpack = unpack

local GetInstanceInfo = GetInstanceInfo

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

local GroupFrames = { 'party', 'raid1', 'raid2', 'raid3' }

local function HasVisibility(preset)
	local units = E.db.unitframe.units
	for _, frame in ipairs(GroupFrames) do
		if units[frame].visibility ~= preset[frame] then return end
	end

	return true
end

local function ApplyVisibility(preset)
	if HasVisibility(preset) then return end

	local units = E.db.unitframe.units
	for _, frame in ipairs(GroupFrames) do
		units[frame].visibility = preset[frame]
	end

	-- The headers are secure, ElvUI rebuilds them through its coroutine which waits for combat to end
	UF:UpdateAllHeaders()
end

-- Update visibility for group unitframes based on instance type and difficulty
local function UpdateRaidVisibility()
	-- Make sure maxAllowedGroups is enabled
	E.db.unitframe.maxAllowedGroups = true

	local _, instanceType, difficultyID = GetInstanceInfo()
	local isMythicRaid = (instanceType == 'raid' and difficultyID == 16)

	ApplyVisibility(isMythicRaid and MythicVisibility or DefaultVisibility)
end

function Private:MythicVisibility()
	if Private.Addon.db.profile.misc.mythicVisibility then
		E:Delay(1, UpdateRaidVisibility)
	elseif HasVisibility(MythicVisibility) then
		-- Switching the option off hands the default visibility back
		ApplyVisibility(DefaultVisibility)
	end
end
