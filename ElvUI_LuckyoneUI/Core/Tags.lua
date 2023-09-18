local Name, Private = ...
local E, L, V, P, G = unpack(ElvUI)

local floor = floor

local UnitClassification = UnitClassification
local UnitGroupRolesAssigned = UnitGroupRolesAssigned
local UnitHealth = UnitHealth
local UnitHealthMax = UnitHealthMax
local UnitPower = UnitPower
local UnitPowerMax = UnitPowerMax

-- Display unit classification without 'affix' on minor enemies
E:AddTag('luckyone:classification', 'UNIT_CLASSIFICATION_CHANGED', function(unit)
	local class = UnitClassification(unit)
	if class == 'rare' then
		return 'Rare'
	elseif class == 'rareelite' then
		return 'Rare Elite'
	elseif class == 'elite' then
		return 'Elite'
	elseif class == 'worldboss' then
		return 'Boss'
	end
end)

-- Display percentage health: 100% 0 decimals | <100% 1 decimal | <10% 2 decimals
E:AddTag('luckyone:health:percent', 'UNIT_HEALTH UNIT_MAXHEALTH', function(unit)
	local currentHealth, maxHealth = UnitHealth(unit), UnitHealthMax(unit)
	local percent = currentHealth / maxHealth * 100
	return E:GetFormattedText('PERCENT', currentHealth, maxHealth, percent == 100 and 0 or percent < 10 and 2 or 1, nil)
end)

-- Display percentage mana with 0 decimals
E:AddTag('luckyone:mana:percent', 'UNIT_POWER_FREQUENT UNIT_MAXPOWER UNIT_DISPLAYPOWER', function(unit)
	local min = UnitPower(unit, Enum.PowerType.Mana)
	return E:GetFormattedText('PERCENT', min, UnitPowerMax(unit, Enum.PowerType.Mana), 0, nil)
end)

-- Display mana (current) if the unit is flagged healer (Retail only)
E:AddTag('luckyone:healermana:current', 'UNIT_POWER_FREQUENT UNIT_MAXPOWER', function(unit)
	local role = UnitGroupRolesAssigned(unit)
	if role == 'HEALER' then
		return UnitPower(unit, Enum.PowerType.Mana)
	end
end, not E.Retail)

-- Display mana (percent) if the unit is flagged healer (Retail only)
E:AddTag('luckyone:healermana:percent', 'UNIT_MAXPOWER UNIT_POWER_FREQUENT', function(unit)
	local role = UnitGroupRolesAssigned(unit)
	local min = UnitPower(unit, Enum.PowerType.Mana)
	if role == 'HEALER' then
		return E:GetFormattedText('PERCENT', min, UnitPowerMax(unit, Enum.PowerType.Mana), 0, nil)
	end
end, not E.Retail)

-- Descriptions for (Retail-Only) Available Tags
E:AddTagInfo('luckyone:healermana:current', Private.Name, L["Displays the unit's Mana (Role: Healer)"], nil, not E.Retail)
E:AddTagInfo('luckyone:healermana:percent', Private.Name, L["Displays the unit's Mana in percent (Role: Healer)"], nil, not E.Retail)

-- Descriptions for Available Tags
E:AddTagInfo('luckyone:classification', Private.Name, L["Displays the unit's classification (e.g 'Elite' and 'Rare') but without 'Affix'"])
E:AddTagInfo('luckyone:health:percent', Private.Name, L["Displays percentage health with 1 decimal below 100%, 2 decimals below 10% and hides decimals at 100%"])
E:AddTagInfo('luckyone:mana:percent', Private.Name, L["Displays percentage mana without decimals"])
