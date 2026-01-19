-- Addon namespace
local _, Private = ...
local L = Private.Libs.ACL

-- ElvUI file
if not Private.ElvUI then
	return
end

-- Lua functions
local format = string.format

-- API cache
local ScaleTo100 = CurveConstants and CurveConstants.ScaleTo100
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

-- Display percentage power
E:AddTag('luckyone:power:percent', 'UNIT_MAXPOWER UNIT_POWER_FREQUENT UNIT_DISPLAYPOWER', function(unit)
	return format('%d', UnitPowerPercent(unit, nil, true, ScaleTo100))
end)
E:AddTagInfo('luckyone:power:percent', Private.Name, L["Displays percentage power without a percent sign"])