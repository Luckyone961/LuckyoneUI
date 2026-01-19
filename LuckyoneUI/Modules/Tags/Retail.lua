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

-- Display percentage health
E:AddTag('luckyone:health:percent', 'UNIT_HEALTH UNIT_MAXHEALTH', function(unit)
	return format('%d%%', UnitHealthPercent(unit, true, ScaleTo100))
end)
E:AddTagInfo('luckyone:health:percent', Private.Name, L["Displays percentage health with a percent sign"])

-- Display current health abbreviated
E:AddTag('luckyone:health:current:shortvalue', 'UNIT_HEALTH UNIT_MAXHEALTH', function(unit)
	local currentHealth = UnitHealth(unit)
	return AbbreviateNumbers(currentHealth, Private.Tags.abbrevOptions)
end)
E:AddTagInfo('luckyone:health:current:shortvalue', Private.Name, L["Displays the short value of the current health (Examples: 156.4k, 1.62M, 1.75B)"])

-- Display percentage power
E:AddTag('luckyone:power:percent', 'UNIT_MAXPOWER UNIT_POWER_FREQUENT UNIT_DISPLAYPOWER', function(unit)
	return format('%d', UnitPowerPercent(unit, nil, true, ScaleTo100))
end)
E:AddTagInfo('luckyone:power:percent', Private.Name, L["Displays percentage power without a percent sign"])

--[[
	L["Displays percentage health with a percent sign"] = true
	L["Displays the short value of the current health (Examples: 156.4k, 1.62M, 1.75B)"] = true
	L["Displays percentage power without a percent sign"] = true
]]
