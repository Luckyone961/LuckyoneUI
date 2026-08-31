local _, Private = ...
local L = Private.Libs.ACL

if not Private.ElvUI then
	return
end

local floor = floor
local format = string.format
local pairs = pairs
local unpack = unpack

local GetCreatureDifficultyColor = GetCreatureDifficultyColor
local GetPetHappiness = GetPetHappiness
local HasPetUI = HasPetUI
local issecretvalue = issecretvalue
local ScaleTo100 = CurveConstants and CurveConstants.ScaleTo100
local UnitClassification = UnitClassification
local UnitEffectiveLevel = UnitEffectiveLevel
local UnitGetTotalAbsorbs = UnitGetTotalAbsorbs
local UnitGroupRolesAssigned = UnitGroupRolesAssigned
local UnitHealth = UnitHealth
local UnitHealthMax = UnitHealthMax
local UnitHealthPercent = UnitHealthPercent
local UnitInPartyIsAI = UnitInPartyIsAI
local UnitIsFriend = UnitIsFriend
local UnitIsUnit = UnitIsUnit
local UnitName = UnitName
local UnitPower = UnitPower
local UnitPowerMax = UnitPowerMax
local UnitPowerPercent = UnitPowerPercent

local _G = _G

local UNKNOWN = UNKNOWN

local E = unpack(ElvUI)
local ElvUF_colors_power = ElvUF.colors.power

local Hex = Private.Tags.Hex
local classificationText = Private.Tags.classificationText
local formatTargetName = Private.Tags.formatTargetName
local getFormattedName = Private.Tags.getFormattedName
local getLastNamePart = Private.Tags.getLastNamePart
local getPowerColor = Private.Tags.getPowerColor
local getUnitColor = Private.Tags.getUnitColor
local getUnitStatus = Private.Tags.getUnitStatus

local POWERTYPE_MANA = Enum.PowerType.Mana
local manaColorTable = ElvUF_colors_power.MANA
local MANA_HEX = manaColorTable and Hex(manaColorTable.r, manaColorTable.g, manaColorTable.b)
local petHappinessStrings = _G.PET_HAPPINESS1 and { _G.PET_HAPPINESS1, _G.PET_HAPPINESS2, _G.PET_HAPPINESS3 } -- [1] "Unhappy", [2] "Content", [3] "Happy"

-------------------------------------------------------
-------------------- Classification -------------------
-------------------------------------------------------

-- Display unit classification without 'affix' on minor enemies
E:AddTag('luckyone:classification', 'UNIT_CLASSIFICATION_CHANGED', function(unit)
	return classificationText[UnitClassification(unit)]
end)
E:AddTagInfo('luckyone:classification', Private.Name, L["Displays the unit's classification (e.g 'Elite' and 'Rare') but without 'Affix'"])

-------------------------------------------------------
------------------------ Health -----------------------
-------------------------------------------------------

-- Display percentage health
if Private.isRetail then
	E:AddTag('luckyone:health:percent', 'UNIT_HEALTH UNIT_MAXHEALTH', function(unit)
		return format('%d', UnitHealthPercent(unit, true, ScaleTo100))
	end)
	E:AddTagInfo('luckyone:health:percent', Private.Name, L["Displays percentage health without decimals"])

	-- Display current health abbreviated (Retail only)
	E:AddTag('luckyone:health:current:shortvalue', 'UNIT_HEALTH UNIT_MAXHEALTH', function(unit)
		return E:AbbreviateNumbers(UnitHealth(unit), E.Abbreviate.short)
	end)
	E:AddTagInfo('luckyone:health:current:shortvalue', Private.Name, L["Displays the short value of the current health (Examples: 156.4k, 1.62M, 1.75B)"])
else
	E:AddTag('luckyone:health:percent', 'UNIT_HEALTH UNIT_MAXHEALTH', function(unit)
		local currentHealth, maxHealth = UnitHealth(unit), UnitHealthMax(unit)
		local percent = currentHealth / maxHealth * 100
		return E:GetFormattedText('PERCENT', currentHealth, maxHealth, percent == 100 and 0 or percent < 10 and 2 or 1, nil)
	end)
	E:AddTagInfo('luckyone:health:percent', Private.Name, L["Displays percentage health with 1 decimal below 100%, 2 decimals below 10% and hides decimals at 100%"])

	-- Shared by both absorb tags (Hidden on Era/HC/Seasonal)
	local function getAbsorbPercent(unit)
		local absorb = UnitGetTotalAbsorbs(unit) or 0
		return E:GetFormattedText('PERCENT', UnitHealth(unit) + absorb, UnitHealthMax(unit), 0, nil)
	end

	-- Display percentage health with absorb values, without decimals
	E:AddTag('luckyone:health:percent-with-absorbs', 'UNIT_HEALTH UNIT_MAXHEALTH UNIT_ABSORB_AMOUNT_CHANGED UNIT_CONNECTION PLAYER_FLAGS_CHANGED', function(unit)
		local status = getUnitStatus(unit)
		if status then return status end

		return getAbsorbPercent(unit)
	end, Private.isClassic)
	E:AddTagInfo('luckyone:health:percent-with-absorbs', Private.Name, L["Displays the unit's current health as a percentage with absorb values, without decimals"], nil, Private.isClassic)

	-- Display percentage health with absorb values, without decimals and without status
	E:AddTag('luckyone:health:percent-with-absorbs:nostatus', 'UNIT_HEALTH UNIT_MAXHEALTH UNIT_ABSORB_AMOUNT_CHANGED UNIT_CONNECTION PLAYER_FLAGS_CHANGED', getAbsorbPercent, Private.isClassic)
	E:AddTagInfo('luckyone:health:percent-with-absorbs:nostatus', Private.Name, L["Displays the unit's current health as a percentage with absorb values, without decimals and without status"], nil, Private.isClassic)
end

-------------------------------------------------------
------------------------ Power ------------------------
-------------------------------------------------------

-- Display percentage power with powercolor / with no color
if Private.isRetail then
	E:AddTag('luckyone:power:percent-color', 'UNIT_MAXPOWER UNIT_POWER_FREQUENT UNIT_DISPLAYPOWER', function(unit)
		return getPowerColor(unit) .. format('%d', UnitPowerPercent(unit, nil, true, ScaleTo100))
	end)

	E:AddTag('luckyone:power:percent-nocolor', 'UNIT_MAXPOWER UNIT_POWER_FREQUENT UNIT_DISPLAYPOWER', function(unit)
		return format('%d', UnitPowerPercent(unit, nil, true, ScaleTo100))
	end)
else
	E:AddTag('luckyone:power:percent-color', 'UNIT_MAXPOWER UNIT_POWER_FREQUENT UNIT_DISPLAYPOWER', function(unit)
		local min, max = UnitPower(unit), UnitPowerMax(unit)
		if max == 0 then return end

		local percentage = floor(min / max * 100 + .5)

		if percentage ~= 0 then
			return getPowerColor(unit) .. percentage
		end
	end)

	E:AddTag('luckyone:power:percent-nocolor', 'UNIT_MAXPOWER UNIT_POWER_FREQUENT UNIT_DISPLAYPOWER', function(unit)
		local min, max = UnitPower(unit), UnitPowerMax(unit)
		if min ~= 0 and max ~= 0 then
			return floor(min / max * 100 + .5)
		end
	end)

	-- Display percentage mana with 0 decimals (Classic only)
	E:AddTag('luckyone:mana:percent', 'UNIT_MAXPOWER UNIT_POWER_FREQUENT UNIT_DISPLAYPOWER', function(unit)
		return E:GetFormattedText('PERCENT', UnitPower(unit, POWERTYPE_MANA), UnitPowerMax(unit, POWERTYPE_MANA), 0, nil)
	end)
	E:AddTagInfo('luckyone:mana:percent', Private.Name, L["Displays percentage mana without decimals"])
end
E:AddTagInfo('luckyone:power:percent-color', Private.Name, L["Displays percentage power without decimals with powercolor"])
E:AddTagInfo('luckyone:power:percent-nocolor', Private.Name, L["Displays percentage power without decimals with no color"])

-------------------------------------------------------
--------------------- Healer Mana ---------------------
-------------------------------------------------------

-- Display mana (percent) if the unit is flagged healer
if Private.isRetail then
	E:AddTag('luckyone:healermana:percent', 'UNIT_MAXPOWER UNIT_POWER_FREQUENT UNIT_DISPLAYPOWER GROUP_ROSTER_UPDATE PLAYER_ROLES_ASSIGNED', function(unit)
		local role = UnitGroupRolesAssigned(unit)
		if issecretvalue(role) or role ~= 'HEALER' then return end
		if UnitInPartyIsAI(unit) then return end -- Exclude NPC Healers (Delve companion etc)

		return getPowerColor(unit) .. format('%d', UnitPowerPercent(unit, POWERTYPE_MANA, true, ScaleTo100))
	end)
else
	-- Display mana (current) if the unit is flagged healer (Classic only)
	E:AddTag('luckyone:healermana:current', 'UNIT_MAXPOWER UNIT_POWER_FREQUENT UNIT_DISPLAYPOWER', function(unit)
		if UnitGroupRolesAssigned(unit) ~= 'HEALER' then return end

		return MANA_HEX .. UnitPower(unit, POWERTYPE_MANA)
	end)
	E:AddTagInfo('luckyone:healermana:current', Private.Name, L["Displays the unit's Mana with manacolor (Role: Healer)"])

	E:AddTag('luckyone:healermana:percent', 'UNIT_MAXPOWER UNIT_POWER_FREQUENT UNIT_DISPLAYPOWER', function(unit)
		if UnitGroupRolesAssigned(unit) ~= 'HEALER' then return end

		local min = UnitPower(unit, POWERTYPE_MANA)
		local max = UnitPowerMax(unit, POWERTYPE_MANA)
		if max == 0 then return end -- Avoid the "%inf" on frames

		return MANA_HEX .. E:GetFormattedText('PERCENT', min, max, 0, nil)
	end)
end
E:AddTagInfo('luckyone:healermana:percent', Private.Name, L["Displays the unit's Mana with manacolor in percent (Role: Healer)"])

-------------------------------------------------------
------------------------ Names ------------------------
-------------------------------------------------------

if Private.isRetail then
	-- Display name with classcolor/reactioncolor (Retail only)
	E:AddTag('luckyone:name-color', 'UNIT_NAME_UPDATE UNIT_FACTION INSTANCE_ENCOUNTER_ENGAGE_UNIT', function(unit)
		return getUnitColor(unit) .. (UnitName(unit) or UNKNOWN)
	end)
	E:AddTagInfo('luckyone:name-color', Private.Name, L["Displays the name with classcolor/reactioncolor"])

	-- Display name with no color
	E:AddTag('luckyone:name-nocolor', 'UNIT_NAME_UPDATE INSTANCE_ENCOUNTER_ENGAGE_UNIT', function(unit)
		return UnitName(unit) or UNKNOWN
	end)
	E:AddTagInfo('luckyone:name-nocolor', Private.Name, L["Displays the name with no color"])
else
	-- Displays the last part of the unit's name with class color (Classic only)
	E:AddTag('luckyone:name:last-classcolor', 'UNIT_NAME_UPDATE UNIT_FACTION INSTANCE_ENCOUNTER_ENGAGE_UNIT', function(unit)
		local name = UnitName(unit)
		return getUnitColor(unit) .. ((name and getLastNamePart(name)) or UNKNOWN)
	end)
	E:AddTagInfo('luckyone:name:last-classcolor', Private.Name, L["Displays the last part of the unit's name with class color"])

	-- Displays the last part of the unit's name with no color (Classic only)
	E:AddTag('luckyone:name:last-nocolor', 'UNIT_NAME_UPDATE INSTANCE_ENCOUNTER_ENGAGE_UNIT', function(unit)
		return getLastNamePart(UnitName(unit)) or UNKNOWN
	end)
	E:AddTagInfo('luckyone:name:last-nocolor', Private.Name, L["Displays the last part of the unit's name with no color"])
end

-------------------------------------------------------
------------------------ Level ------------------------
-------------------------------------------------------

if not Private.isRetail then
	E:AddTag('luckyone:level', 'UNIT_LEVEL PLAYER_LEVEL_UP', function(unit)
		if E:XPIsLevelMax() then return end

		local level = UnitEffectiveLevel(unit)
		local color = GetCreatureDifficultyColor(level)

		return Hex(color.r, color.g, color.b) .. ((level > 0) and level or '??')
	end)
	E:AddTagInfo('luckyone:level', Private.Name, L["Displays the unit's level with difficultycolor if the player is not max level"])
end

-------------------------------------------------------
------------------------ Target -----------------------
-------------------------------------------------------

-- Displays the unit's target name with class color
E:AddTag('luckyone:target:name-classcolor', 'UNIT_TARGET UNIT_FACTION', function(unit)
	return formatTargetName(unit, false, true)
end)
E:AddTagInfo('luckyone:target:name-classcolor', Private.Name, L["Displays the unit's target name with class color"])

-- Displays the unit's target name with no color
E:AddTag('luckyone:target:name-nocolor', 'UNIT_TARGET', function(unit)
	return formatTargetName(unit, false, false)
end)
E:AddTagInfo('luckyone:target:name-nocolor', Private.Name, L["Displays the unit's target name with no color"])

-- Displays the last part of the unit's target name with class color (Classic only)
if not Private.isRetail then
	E:AddTag('luckyone:target:last-classcolor', 'UNIT_TARGET UNIT_FACTION', function(unit)
		return formatTargetName(unit, true, true)
	end)
	E:AddTagInfo('luckyone:target:last-classcolor', Private.Name, L["Displays the last part of the unit's target name with class color"])

	-- Displays the last part of the unit's target name with no color (Classic only)
	E:AddTag('luckyone:target:last-nocolor', 'UNIT_TARGET', function(unit)
		return formatTargetName(unit, true, false)
	end)
	E:AddTagInfo('luckyone:target:last-nocolor', Private.Name, L["Displays the last part of the unit's target name with no color"])
end

-------------------------------------------------------
---------------------- Pet Frame ----------------------
-------------------------------------------------------

-- Display pet name and happiness status (Classic and TBC only)
if Private.isClassic or Private.isTBC then
	local happinessColors = ElvUF.colors.happiness

	E:AddTag('luckyone:pet:name-and-happiness', 'UNIT_NAME_UPDATE UNIT_HAPPINESS PET_UI_UPDATE', function(unit)
		local hasPetUI, isHunterPet = HasPetUI()
		if hasPetUI and isHunterPet and UnitIsUnit('pet', unit) then
			local petHappiness = GetPetHappiness()
			if petHappiness then -- Return for Hunters
				return Hex(happinessColors[petHappiness]) .. petHappinessStrings[petHappiness]
			end
		end

		-- Other Pet Classes, Shadowfiend and others
		return 'Pet'
	end)
else
	E:AddTag('luckyone:pet:name-and-happiness', 'UNIT_NAME_UPDATE PET_UI_UPDATE', function()
		return 'Pet'
	end)
end
E:AddTagInfo('luckyone:pet:name-and-happiness', Private.Name, L["Displays the pet's name and includes (in Classic only) the full happiness status"])

-------------------------------------------------------
------------------- Name Formatting -------------------
-------------------------------------------------------

if Private.isRetail then
	-- Maximum length with classcolor or no color (friendly only), full name (if enemy), secret names pass through for display
	local function buildNameTag(length, withColor)
		return function(unit)
			local name = UnitName(unit) or UNKNOWN
			if issecretvalue(name) then return name end

			if UnitIsFriend(unit, 'player') then
				return getFormattedName(unit, length, withColor, nil, name)
			end

			return name
		end
	end

	-- Same as buildNameTag but shows the unit's status (dead, ghost, offline) instead of the name
	local function buildNameStatusTag(length, withColor)
		return function(unit)
			local status = getUnitStatus(unit)
			if status then return status end

			local name = UnitName(unit) or UNKNOWN
			if issecretvalue(name) then return name end

			if UnitIsFriend(unit, 'player') then
				return getFormattedName(unit, length, withColor, nil, name)
			end

			return name
		end
	end

	for textFormat, length in pairs({ veryshort = 5, short = 10, medium = 15, long = 20 }) do
		E:AddTag('luckyone:name:' .. textFormat .. '-color-friendly', 'UNIT_NAME_UPDATE UNIT_FACTION INSTANCE_ENCOUNTER_ENGAGE_UNIT', buildNameTag(length, true))
		E:AddTag('luckyone:name:' .. textFormat .. '-nocolor-friendly', 'UNIT_NAME_UPDATE UNIT_FACTION INSTANCE_ENCOUNTER_ENGAGE_UNIT', buildNameTag(length, false))
		E:AddTag('luckyone:name:' .. textFormat .. '-color-friendly:status', 'UNIT_HEALTH UNIT_NAME_UPDATE UNIT_FACTION INSTANCE_ENCOUNTER_ENGAGE_UNIT PLAYER_UPDATE_RESTING UNIT_CONNECTION PLAYER_FLAGS_CHANGED', buildNameStatusTag(length, true))
		E:AddTag('luckyone:name:' .. textFormat .. '-nocolor-friendly:status', 'UNIT_HEALTH UNIT_NAME_UPDATE UNIT_FACTION INSTANCE_ENCOUNTER_ENGAGE_UNIT PLAYER_UPDATE_RESTING UNIT_CONNECTION PLAYER_FLAGS_CHANGED', buildNameStatusTag(length, false))

		E:AddTagInfo('luckyone:name:' .. textFormat .. '-color-friendly', Private.Name, format(L["Displays the unit's name with classcolor and a maximum length of %s characters (friendly only) or full name (if enemy)"], length))
		E:AddTagInfo('luckyone:name:' .. textFormat .. '-nocolor-friendly', Private.Name, format(L["Displays the unit's name with no color and a maximum length of %s characters (friendly only) or full name (if enemy)"], length))
		E:AddTagInfo('luckyone:name:' .. textFormat .. '-color-friendly:status', Private.Name, format(L["Displays the unit's status (dead, ghost, offline) and name with classcolor and a maximum length of %s characters (friendly only) or full name (if enemy)"], length))
		E:AddTagInfo('luckyone:name:' .. textFormat .. '-nocolor-friendly:status', Private.Name, format(L["Displays the unit's status (dead, ghost, offline) and name with no color and a maximum length of %s characters (friendly only) or full name (if enemy)"], length))
	end
else
	-- Maximum length with classcolor or no color, optionally abbreviated
	local function buildNameTag(length, withColor, abbrev)
		return function(unit)
			return getFormattedName(unit, length, withColor, abbrev)
		end
	end

	for textFormat, length in pairs({ veryshort = 5, short = 10, medium = 15, long = 20 }) do
		E:AddTag('luckyone:name:' .. textFormat .. '-classcolor', 'UNIT_NAME_UPDATE UNIT_FACTION INSTANCE_ENCOUNTER_ENGAGE_UNIT', buildNameTag(length, true))
		E:AddTag('luckyone:name:' .. textFormat .. '-nocolor', 'UNIT_NAME_UPDATE INSTANCE_ENCOUNTER_ENGAGE_UNIT', buildNameTag(length, false))
		E:AddTag('luckyone:name:abbrev:' .. textFormat .. '-classcolor', 'UNIT_NAME_UPDATE UNIT_FACTION INSTANCE_ENCOUNTER_ENGAGE_UNIT', buildNameTag(length, true, true))
		E:AddTag('luckyone:name:abbrev:' .. textFormat .. '-nocolor', 'UNIT_NAME_UPDATE INSTANCE_ENCOUNTER_ENGAGE_UNIT', buildNameTag(length, false, true))

		E:AddTagInfo('luckyone:name:' .. textFormat .. '-classcolor', Private.Name, format(L["Displays the unit's name with classcolor and a maximum length of %s characters"], length))
		E:AddTagInfo('luckyone:name:' .. textFormat .. '-nocolor', Private.Name, format(L["Displays the unit's name with no color and a maximum length of %s characters"], length))
		E:AddTagInfo('luckyone:name:abbrev:' .. textFormat .. '-classcolor', Private.Name, format(L["Displays the unit's name with classcolor and a maximum length of %s characters and abbreviates long names"], length))
		E:AddTagInfo('luckyone:name:abbrev:' .. textFormat .. '-nocolor', Private.Name, format(L["Displays the unit's name with no color and a maximum length of %s characters and abbreviates long names"], length))
	end
end
