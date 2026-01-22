-- Addon namespace
local _, Private = ...
local L = Private.Libs.ACL

-- ElvUI file (and Retail only)
if not Private.ElvUI or (Private.isClassic or Private.isTBC or Private.isMists) then
	return
end

-- Lua functions
local format = string.format

-- API cache
local AbbreviateNumbers = AbbreviateNumbers
local ScaleTo100 = CurveConstants and CurveConstants.ScaleTo100
local UnitHealth = UnitHealth
local UnitHealthPercent = UnitHealthPercent
local UnitInPartyIsAI = UnitInPartyIsAI
local UnitIsPlayer = UnitIsPlayer
local UnitPowerPercent = UnitPowerPercent

-- Global environment
local _G = _G

-- Global strings
local UNKNOWN = UNKNOWN

-- ElvUI modules
local E = unpack(ElvUI)
local _COLORS = ElvUF.colors

-- Display percentage health
E:AddTag('luckyone:health:percent', 'UNIT_HEALTH UNIT_MAXHEALTH', function(unit)
	local percent = format('%d', UnitHealthPercent(unit, true, ScaleTo100))
	return percent
end)
E:AddTagInfo('luckyone:health:percent', Private.Name, L["Displays percentage health without decimals"])

-- Display current health abbreviated
E:AddTag('luckyone:health:current:shortvalue', 'UNIT_HEALTH UNIT_MAXHEALTH', function(unit)
	local currentHealth = UnitHealth(unit)
	return AbbreviateNumbers(currentHealth, Private.Tags.abbrevOptions)
end)
E:AddTagInfo('luckyone:health:current:shortvalue', Private.Name, L["Displays the short value of the current health (Examples: 156.4k, 1.62M, 1.75B)"])

-- Display percentage power with powercolor
E:AddTag('luckyone:power:percent-color', 'UNIT_MAXPOWER UNIT_POWER_FREQUENT UNIT_DISPLAYPOWER', function(unit)
	local percent = format('%d', UnitPowerPercent(unit, nil, true, ScaleTo100))
	local color = Private.Tags.getPowerColor(unit)
	return color .. percent
end)
E:AddTagInfo('luckyone:power:percent-color', Private.Name, L["Displays percentage power without decimals with powercolor"])

-- Display percentage power with no color
E:AddTag('luckyone:power:percent-nocolor', 'UNIT_MAXPOWER UNIT_POWER_FREQUENT UNIT_DISPLAYPOWER', function(unit)
	local percent = format('%d', UnitPowerPercent(unit, nil, true, ScaleTo100))
	return percent
end)
E:AddTagInfo('luckyone:power:percent-nocolor', Private.Name, L["Displays percentage power without decimals with no color"])

-- Display name with classcolor/reactioncolor
E:AddTag('luckyone:name-color', 'UNIT_NAME_UPDATE UNIT_FACTION INSTANCE_ENCOUNTER_ENGAGE_UNIT', function(unit)
	local name = UnitName(unit) or UNKNOWN
	local color = Private.Tags.getUnitColor(unit)
	return color .. name
end)
E:AddTagInfo('luckyone:name-color', Private.Name, L["Displays the name with classcolor/reactioncolor"])

-- Display name with no color
E:AddTag('luckyone:name-nocolor', 'UNIT_NAME_UPDATE INSTANCE_ENCOUNTER_ENGAGE_UNIT', function(unit)
	local name = UnitName(unit) or UNKNOWN
	return name
end)
E:AddTagInfo('luckyone:name-nocolor', Private.Name, L["Displays the name with no color"])

for textFormat, length in pairs({ veryshort = 5, short = 10, medium = 15, long = 20 }) do
	-- Displays the unit's name with classcolor and a maximum length of 5, 10, 15 and 20 characters (Only works for friendly party/raid members)
	E:AddTag('luckyone:name:' .. textFormat .. '-color-friendly', 'UNIT_NAME_UPDATE UNIT_FACTION', function(unit)
		if not (UnitIsPlayer(unit) or UnitInPartyIsAI(unit)) then return '' end
		return Private.Tags.getFormattedName(unit, length, true)
	end)
	-- Displays the unit's name with no color and a maximum length of 5, 10, 15 and 20 characters (Only works for friendly party/raid members)
	E:AddTag('luckyone:name:' .. textFormat .. '-nocolor-friendly', 'UNIT_NAME_UPDATE', function(unit)
	if not (UnitIsPlayer(unit) or UnitInPartyIsAI(unit)) then return '' end
		return Private.Tags.getFormattedName(unit, length, false)
	end)

	E:AddTagInfo('luckyone:name:' .. textFormat .. '-color-friendly', Private.Name, format(L["Displays the unit's name with classcolor and a maximum length of %s characters (Only works for friendly party/raid members)"], length))
	E:AddTagInfo('luckyone:name:' .. textFormat .. '-nocolor-friendly', Private.Name, format(L["Displays the unit's name with no color and a maximum length of %s characters (Only works for friendly party/raid members)"], length))
end
