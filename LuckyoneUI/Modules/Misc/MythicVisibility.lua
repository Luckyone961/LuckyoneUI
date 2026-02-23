-- Addon namespace
local _, Private = ...

-- ElvUI file
if not Private.ElvUI then
	return
end

-- Lua functions
local unpack = unpack

-- API cache
local GetInstanceInfo = GetInstanceInfo

-- ElvUI reference
local E = unpack(ElvUI)
local UF = E:GetModule('UnitFrames')

local function CreateAndUpdateAll()
	UF:CreateAndUpdateHeaderGroup('party')
	UF:CreateAndUpdateHeaderGroup('raid1')
	UF:CreateAndUpdateHeaderGroup('raid2')
end

-- Update raid visibility based on instance type and difficulty
local function UpdateRaidVisibility()
	if not Private.isRetail then return end

	local _, instanceType, difficultyID = GetInstanceInfo()

	local defaultVisibility =
	(E.db.unitframe.units.party.visibility == '[@raid6,exists][@party1,noexists] hide;show') and
	(E.db.unitframe.units.raid1.visibility == '[@raid6,noexists][@raid21,exists] hide;show') and
	(E.db.unitframe.units.raid2.visibility == '[@raid21,noexists][@raid31,exists] hide;show')

	local mythicVisibility =
	(E.db.unitframe.units.party.visibility == 'hide') and
	(E.db.unitframe.units.raid1.visibility == '[nogroup] hide;show') and
	(E.db.unitframe.units.raid2.visibility == 'hide')

	-- Make sure maxAllowedGroups is enabled
	if not E.db.unitframe.maxAllowedGroups then
		E.db.unitframe.maxAllowedGroups = true
	end

	if instanceType == 'raid' then
		if difficultyID == 16 then -- Mythic
			if not mythicVisibility then
				E.db.unitframe.units.party.visibility = 'hide'
				E.db.unitframe.units.raid1.visibility = '[nogroup] hide;show'
				E.db.unitframe.units.raid2.visibility = 'hide'
				CreateAndUpdateAll()
			end
		else
			if not defaultVisibility then
				E.db.unitframe.units.party.visibility = '[@raid6,exists][@party1,noexists] hide;show'
				E.db.unitframe.units.raid1.visibility = '[@raid6,noexists][@raid21,exists] hide;show'
				E.db.unitframe.units.raid2.visibility = '[@raid21,noexists][@raid31,exists] hide;show'
				CreateAndUpdateAll()
			end
		end
	else
		if not defaultVisibility then
			E.db.unitframe.units.party.visibility = '[@raid6,exists][@party1,noexists] hide;show'
			E.db.unitframe.units.raid1.visibility = '[@raid6,noexists][@raid21,exists] hide;show'
			E.db.unitframe.units.raid2.visibility = '[@raid21,noexists][@raid31,exists] hide;show'
			CreateAndUpdateAll()
		end
	end
end

function Private:MythicVisibility()
	if not (Private.isRetail and Private.Addon.db.profile.misc.mythicVisibility) then return end
	E:Delay(1, UpdateRaidVisibility)
end
