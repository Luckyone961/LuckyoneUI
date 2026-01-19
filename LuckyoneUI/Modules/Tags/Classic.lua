-- Addon namespace
local _, Private = ...
local L = Private.Libs.ACL

-- ElvUI file
if not Private.ElvUI then
	return
end

-- Classic only file
if Private.isMidnight then -- ToDo: Change me to retail in 12.0
	return
end

-- Lua functions
local floor = floor
local format = string.format
local pairs = pairs
local strfind = string.find
local strmatch = string.match
local unpack = unpack

-- API cache
local C_PetJournal_GetPetTeamAverageLevel = C_PetJournal.GetPetTeamAverageLevel
local GetCreatureDifficultyColor = GetCreatureDifficultyColor
local GetRelativeDifficultyColor = GetRelativeDifficultyColor
local QuestDifficultyColors = QuestDifficultyColors
local UnitBattlePetLevel = UnitBattlePetLevel
local UnitClass = UnitClass
local UnitClassification = UnitClassification
local UnitEffectiveLevel = UnitEffectiveLevel
local UnitGetTotalAbsorbs = UnitGetTotalAbsorbs
local UnitGroupRolesAssigned = UnitGroupRolesAssigned
local UnitHealth = UnitHealth
local UnitHealthMax = UnitHealthMax
local UnitInPartyIsAI = UnitInPartyIsAI
local UnitIsBattlePetCompanion = UnitIsBattlePetCompanion
local UnitIsConnected = UnitIsConnected
local UnitIsDead = UnitIsDead
local UnitIsGhost = UnitIsGhost
local UnitIsPlayer = UnitIsPlayer
local UnitIsWildBattlePet = UnitIsWildBattlePet
local UnitName = UnitName
local UnitPower = UnitPower
local UnitPowerMax = UnitPowerMax
local UnitPowerType = UnitPowerType
local UnitReaction = UnitReaction

-- Global environment
local _G = _G
local Enum = Enum

-- Global strings
local UNKNOWN = UNKNOWN

-- ElvUI modules
local E = unpack(ElvUI)
local Tags = ElvUF.Tags
local Abbrev = Tags.Env.Abbrev

local _COLORS = ElvUF.colors
local ElvUF_colors_class = ElvUF.colors.class
local ElvUF_colors_power = ElvUF.colors.power
local ElvUF_colors_reaction = ElvUF.colors.reaction

-- Display percentage health: 100% 0 decimals | <100% 1 decimal | <10% 2 decimals
E:AddTag('luckyone:health:percent', 'UNIT_HEALTH UNIT_MAXHEALTH', function(unit)
	local currentHealth, maxHealth = UnitHealth(unit), UnitHealthMax(unit)
	local percent = currentHealth / maxHealth * 100
	return E:GetFormattedText('PERCENT', currentHealth, maxHealth, percent == 100 and 0 or percent < 10 and 2 or 1, nil)
end)
E:AddTagInfo('luckyone:health:percent', Private.Name, L["Displays percentage health with 1 decimal below 100%, 2 decimals below 10% and hides decimals at 100%"])

-- Display percentage health with absorb values, without decimals
E:AddTag('luckyone:health:percent-with-absorbs', 'UNIT_HEALTH UNIT_MAXHEALTH UNIT_ABSORB_AMOUNT_CHANGED UNIT_CONNECTION PLAYER_FLAGS_CHANGED', function(unit)
	local status = UnitIsDead(unit) and L["Dead"] or UnitIsGhost(unit) and L["Ghost"] or not UnitIsConnected(unit) and L["Offline"]

	if status then
		return status
	end

	local absorb = UnitGetTotalAbsorbs(unit) or 0
	if absorb == 0 then
		return E:GetFormattedText('PERCENT', UnitHealth(unit), UnitHealthMax(unit), 0, nil)
	end

	local healthTotalIncludingAbsorbs = UnitHealth(unit) + absorb
	return E:GetFormattedText('PERCENT', healthTotalIncludingAbsorbs, UnitHealthMax(unit), 0, nil)
end, Private.isClassic)
E:AddTagInfo('luckyone:health:percent-with-absorbs', Private.Name, L["Displays the unit's current health as a percentage with absorb values, without decimals"], nil, Private.isClassic)

-- Display percentage health with absorb values, without decimals and without status
E:AddTag('luckyone:health:percent-with-absorbs:nostatus', 'UNIT_HEALTH UNIT_MAXHEALTH UNIT_ABSORB_AMOUNT_CHANGED UNIT_CONNECTION PLAYER_FLAGS_CHANGED', function(unit)
	local absorb = UnitGetTotalAbsorbs(unit) or 0
	if absorb == 0 then
		return E:GetFormattedText('PERCENT', UnitHealth(unit), UnitHealthMax(unit), 0, nil)
	end

	local healthTotalIncludingAbsorbs = UnitHealth(unit) + absorb
	return E:GetFormattedText('PERCENT', healthTotalIncludingAbsorbs, UnitHealthMax(unit), 0, nil)
end, Private.isClassic)
E:AddTagInfo('luckyone:health:percent-with-absorbs:nostatus', Private.Name, L["Displays the unit's current health as a percentage with absorb values, without decimals and without status"], nil, Private.isClassic)

-- Display percentage power with powecolor and hides power at 0
E:AddTag('luckyone:power:percent-color', 'UNIT_MAXPOWER UNIT_POWER_FREQUENT UNIT_DISPLAYPOWER', function(unit)
	local min, max = UnitPower(unit), UnitPowerMax(unit)
	local pType, pToken, altR, altG, altB = UnitPowerType(unit)
	local color = _COLORS.power[pToken] or (altR and (altR > 1 or altG > 1 or altB > 1) and Private.Tags.Hex(altR / 255, altG / 255, altB / 255)) or Private.Tags.Hex(_COLORS.power[pType] or _COLORS.power.MANA)
	local percentage = (min == 0 or max == 0) and '' or floor(min / max * 100 + .5)

	if altR and not _COLORS.power[pToken] then
		if altR <= 1 and altG <= 1 and altB <= 1 then
			color = Private.Tags.Hex(altR, altG, altB)
		end
	else
		color = Private.Tags.Hex(color)
	end

	return color .. percentage
end)
E:AddTagInfo('luckyone:power:percent-color', Private.Name, L["Displays percentage power with powercolor and hides power at 0"])

-- Display percentage power with no color and hides power at 0
E:AddTag('luckyone:power:percent-nocolor', 'UNIT_MAXPOWER UNIT_POWER_FREQUENT UNIT_DISPLAYPOWER', function(unit)
	local min, max = UnitPower(unit), UnitPowerMax(unit)
	return (min == 0) and '' or floor(min / max * 100 + .5)
end)
E:AddTagInfo('luckyone:power:percent-nocolor', Private.Name, L["Displays percentage power with no color and hides power at 0"])

-- Display percentage mana with 0 decimals
E:AddTag('luckyone:mana:percent', 'UNIT_MAXPOWER UNIT_POWER_FREQUENT UNIT_DISPLAYPOWER', function(unit)
	local min = UnitPower(unit, Enum.PowerType.Mana)

	return E:GetFormattedText('PERCENT', min, UnitPowerMax(unit, Enum.PowerType.Mana), 0, nil)
end)
E:AddTagInfo('luckyone:mana:percent', Private.Name, L["Displays percentage mana without decimals"])

-- Display the unit level if player is not max level
E:AddTag('luckyone:level', 'UNIT_LEVEL PLAYER_LEVEL_UP', function(unit)
	local color
	local level = UnitEffectiveLevel(unit)
	local max = E:XPIsLevelMax()

	if Private.isRetail and (UnitIsWildBattlePet(unit) or UnitIsBattlePetCompanion(unit)) then
		level = UnitBattlePetLevel(unit)
		local teamLevel = C_PetJournal_GetPetTeamAverageLevel()
		color = (teamLevel ~= level) and GetRelativeDifficultyColor(teamLevel, level) or QuestDifficultyColors.difficult
	else
		color = GetCreatureDifficultyColor(level)
	end

	return not max and Private.Tags.Hex(color.r, color.g, color.b) .. ((level > 0) and level or '??')
end)
E:AddTagInfo('luckyone:level', Private.Name, L["Displays the unit's level with difficultycolor if the player is not max level"])

-- Display mana (current) if the unit is flagged healer (Retail and Mists only)
E:AddTag('luckyone:healermana:current', 'UNIT_MAXPOWER UNIT_POWER_FREQUENT UNIT_DISPLAYPOWER', function(unit)
	local role = UnitGroupRolesAssigned(unit)

	if role == 'HEALER' then
		local color = ElvUF_colors_power.MANA
		return Private.Tags.Hex(color.r, color.g, color.b) .. UnitPower(unit, Enum.PowerType.Mana)
	end
end, Private.isClassic)
E:AddTagInfo('luckyone:healermana:current', Private.Name, L["Displays the unit's Mana with manacolor (Role: Healer)"], nil, Private.isClassic)

-- Display mana (percent) if the unit is flagged healer (Retail and Mists only)
E:AddTag('luckyone:healermana:percent', 'UNIT_MAXPOWER UNIT_POWER_FREQUENT UNIT_DISPLAYPOWER', function(unit)
	local role = UnitGroupRolesAssigned(unit)
	if role == 'HEALER' then
		local color = ElvUF_colors_power.MANA
		local min = UnitPower(unit, Enum.PowerType.Mana)
		local max = UnitPowerMax(unit, Enum.PowerType.Mana)

		return Private.Tags.Hex(color.r, color.g, color.b) .. E:GetFormattedText('PERCENT', min, max, 0, nil)
	end
end, Private.isClassic)
E:AddTagInfo('luckyone:healermana:percent', Private.Name, L["Displays the unit's Mana with manacolor in percent (Role: Healer)"], nil, Private.isClassic)

-- Displays the last (and mostly important) part of the unit's name with class color
E:AddTag('luckyone:name:last-classcolor', 'UNIT_NAME_UPDATE UNIT_FACTION INSTANCE_ENCOUNTER_ENGAGE_UNIT', function(unit)
	local name = UnitName(unit)
	local color, formattedName

	if UnitIsPlayer(unit) or (Private.isRetail and UnitInPartyIsAI(unit)) then
		local _, unitClass = UnitClass(unit)
		local cs = ElvUF_colors_class[unitClass]
		color = cs and Private.Tags.Hex(cs.r, cs.g, cs.b) or '|cFFcccccc'
	else
		local cr = ElvUF_colors_reaction[UnitReaction(unit, 'player')]
		color = cr and Private.Tags.Hex(cr.r, cr.g, cr.b) or '|cFFcccccc'
	end

	formattedName = name and (strfind(name, '%s') and strmatch(name, '([%S]+)$') or name) or UNKNOWN

	return color .. formattedName
end)
E:AddTagInfo('luckyone:name:last-classcolor', Private.Name, L["Displays the last part of the unit's name with class color"])

-- Displays the last (and mostly important) part of the unit's name with no color
E:AddTag('luckyone:name:last-nocolor', 'UNIT_NAME_UPDATE INSTANCE_ENCOUNTER_ENGAGE_UNIT', function(unit)
	local name = UnitName(unit)
	return Private.Tags.getLastNamePart(name)
end)
E:AddTagInfo('luckyone:name:last-nocolor', Private.Name, L["Displays the last part of the unit's name with no color"])

-- Displays the last (and mostly important) part of the unit's target name with class color
E:AddTag('luckyone:target:last-classcolor', 'UNIT_TARGET UNIT_FACTION', function(unit)
	return Private.Tags.formatTargetName(unit, true, true)
end)
E:AddTagInfo('luckyone:target:last-classcolor', Private.Name, L["Displays the last part of the unit's target name with class color"])

-- Displays the last (and mostly important) part of the unit's target name with no color
E:AddTag('luckyone:target:last-nocolor', 'UNIT_TARGET', function(unit)
	return Private.Tags.formatTargetName(unit, true, false)
end)
E:AddTagInfo('luckyone:target:last-nocolor', Private.Name, L["Displays the last part of the unit's target name with no color"])

-- Displays the unit's target name with class color
E:AddTag('luckyone:target:name-classcolor', 'UNIT_TARGET UNIT_FACTION', function(unit)
	return Private.Tags.formatTargetName(unit, false, true)
end)
E:AddTagInfo('luckyone:target:name-classcolor', Private.Name, L["Displays the unit's target name with class color"])

-- Displays the unit's target name with no color
E:AddTag('luckyone:target:name-nocolor', 'UNIT_TARGET', function(unit)
	return Private.Tags.formatTargetName(unit, false, false)
end)
E:AddTagInfo('luckyone:target:name-nocolor', Private.Name, L["Displays the unit's target name with no color"])

for textFormat, length in pairs({ veryshort = 5, short = 10, medium = 15, long = 20 }) do
	-- Displays the unit's name with classcolor and a maximum length of 5, 10, 15 and 20 characters
	E:AddTag('luckyone:name:' .. textFormat .. '-classcolor', 'UNIT_NAME_UPDATE UNIT_FACTION INSTANCE_ENCOUNTER_ENGAGE_UNIT', function(unit)
		return Private.Tags.getFormattedName(unit, length, true)
	end)
	-- Displays the unit's name with no color and a maximum length of 5, 10, 15 and 20 characters
	E:AddTag('luckyone:name:' .. textFormat .. '-nocolor', 'UNIT_NAME_UPDATE INSTANCE_ENCOUNTER_ENGAGE_UNIT', function(unit)
		return Private.Tags.getFormattedName(unit, length, false)
	end)
	-- Displays the unit's name abbreviated with classcolor and a maximum length of 5, 10, 15 and 20 characters
	E:AddTag('luckyone:name:abbrev:' .. textFormat .. '-classcolor', 'UNIT_NAME_UPDATE UNIT_FACTION INSTANCE_ENCOUNTER_ENGAGE_UNIT', function(unit)
		return Private.Tags.getFormattedName(unit, length, true, true)
	end)
	-- Displays the unit's name abbreviated with no color and a maximum length of 5, 10, 15 and 20 characters
	E:AddTag('luckyone:name:abbrev:' .. textFormat .. '-nocolor', 'UNIT_NAME_UPDATE INSTANCE_ENCOUNTER_ENGAGE_UNIT', function(unit)
		return Private.Tags.getFormattedName(unit, length, false, true)
	end)

	E:AddTagInfo('luckyone:name:' .. textFormat .. '-classcolor', Private.Name, format(L["Displays the unit's name with classcolor and a maximum length of %s characters"], length))
	E:AddTagInfo('luckyone:name:' .. textFormat .. '-nocolor', Private.Name, format(L["Displays the unit's name with no color and a maximum length of %s characters"], length))
	E:AddTagInfo('luckyone:name:abbrev:' .. textFormat .. '-classcolor', Private.Name, format(L["Displays the unit's name with classcolor and a maximum length of %s characters and abbreviates long names"], length))
	E:AddTagInfo('luckyone:name:abbrev:' .. textFormat .. '-nocolor', Private.Name, format(L["Displays the unit's name with no color and a maximum length of %s characters and abbreviates long names"], length))
end
