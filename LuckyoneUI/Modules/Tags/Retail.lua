-- Addon namespace
local _, Private = ...
local L = Private.Libs.ACL

-- ElvUI file
if not Private.ElvUI then
	return
end

-- Retail only file
if Private.isClassic or Private.isTBC or Private.isMists then
	return
end

-- ToDo: Remove me later
if not Private.isMidnight then
	return
end

-- Lua functions
local format = string.format

-- API cache
local AbbreviateNumbers = AbbreviateNumbers
local ScaleTo100 = CurveConstants and CurveConstants.ScaleTo100
local UnitHealth = UnitHealth
local UnitHealthPercent = UnitHealthPercent
local UnitPowerPercent = UnitPowerPercent

-- Global environment
local _G = _G

-- ElvUI modules
local E = unpack(ElvUI)
local _COLORS = ElvUF.colors

-- Display percentage health
E:AddTag('luckyone:health:percent', 'UNIT_HEALTH UNIT_MAXHEALTH', function(unit)
	local percent = format('%d%%', UnitHealthPercent(unit, true, ScaleTo100))
	return percent
end)
E:AddTagInfo('luckyone:health:percent', Private.Name, L["Displays percentage health with a percent sign"])

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
E:AddTagInfo('luckyone:power:percent-color', Private.Name, L["Displays percentage power with powercolor"])

-- Display percentage power with no color
E:AddTag('luckyone:power:percent-nocolor', 'UNIT_MAXPOWER UNIT_POWER_FREQUENT UNIT_DISPLAYPOWER', function(unit)
	local percent = format('%d', UnitPowerPercent(unit, nil, true, ScaleTo100))
	return percent
end)
E:AddTagInfo('luckyone:power:percent-nocolor', Private.Name, L["Displays percentage power with no color"])

-- Display name with classcolor/reactioncolor
E:AddTag('luckyone:name-color', 'UNIT_NAME_UPDATE INSTANCE_ENCOUNTER_ENGAGE_UNIT', function(unit)
	local name = UnitName(unit)
	local color = Private.Tags.getUnitColor(unit)
	return color .. name
end)
E:AddTagInfo('luckyone:name-color', Private.Name, L["Displays the name with classcolor/reactioncolor"])

-- Display name with no color
E:AddTag('luckyone:name-nocolor', 'UNIT_NAME_UPDATE INSTANCE_ENCOUNTER_ENGAGE_UNIT', function(unit)
	local name = UnitName(unit)
	return name
end)
E:AddTagInfo('luckyone:name-nocolor', Private.Name, L["Displays the name with no color"])
