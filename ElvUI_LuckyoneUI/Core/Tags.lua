local Name, Private = ...
local E, L, V, P, G = unpack(ElvUI)

local floor = floor
local format = format
local strfind, strmatch = strfind, strmatch

local _G = _G

local GetPetHappiness = GetPetHappiness
local HasPetUI = HasPetUI
local UnitClassification = UnitClassification
local UnitEffectiveLevel = UnitEffectiveLevel
local UnitGroupRolesAssigned = UnitGroupRolesAssigned
local UnitHealth = UnitHealth
local UnitHealthMax = UnitHealthMax
local UnitInPartyIsAI = UnitInPartyIsAI
local UnitIsPlayer = UnitIsPlayer
local UnitIsUnit = UnitIsUnit
local UnitName = UnitName
local UnitPower = UnitPower
local UnitPowerMax = UnitPowerMax
local UnitReaction = UnitReaction

-- Display unit classification without 'affix' on minor enemies
E:AddTag('luckyone:classification', 'UNIT_CLASSIFICATION_CHANGED', function(unit)
	local class = UnitClassification(unit)
	return class == 'rare' and 'Rare' or class == 'rareelite' and 'Rare Elite' or class == 'elite' and 'Elite' or class == 'worldboss' and 'Boss' or nil
end)
E:AddTagInfo('luckyone:classification', Private.Name, L["Displays the unit's classification (e.g 'Elite' and 'Rare') but without 'Affix'"])

-- Display percentage health: 100% 0 decimals | <100% 1 decimal | <10% 2 decimals
E:AddTag('luckyone:health:percent', 'UNIT_HEALTH UNIT_MAXHEALTH', function(unit)
	local currentHealth, maxHealth = UnitHealth(unit), UnitHealthMax(unit)
	local percent = currentHealth / maxHealth * 100
	return E:GetFormattedText('PERCENT', currentHealth, maxHealth, percent == 100 and 0 or percent < 10 and 2 or 1, nil)
end)
E:AddTagInfo('luckyone:health:percent', Private.Name, L["Displays percentage health with 1 decimal below 100%, 2 decimals below 10% and hides decimals at 100%"])

-- Display percentage power and hides power at 0
E:AddTag('luckyone:power:percent', 'UNIT_MAXPOWER UNIT_POWER_FREQUENT', function(unit)
	local min, max = UnitPower(unit), UnitPowerMax(unit)
	return (min == 0) and '' or floor(UnitPower(unit) / max * 100 + .5)
end)
E:AddTagInfo('luckyone:power:percent', Private.Name, L["Displays percentage power and hides power at 0"])

-- Display percentage mana with 0 decimals
E:AddTag('luckyone:mana:percent', 'UNIT_POWER_FREQUENT UNIT_MAXPOWER UNIT_DISPLAYPOWER', function(unit)
	local min = UnitPower(unit, Enum.PowerType.Mana)
	return E:GetFormattedText('PERCENT', min, UnitPowerMax(unit, Enum.PowerType.Mana), 0, nil)
end)
E:AddTagInfo('luckyone:mana:percent', Private.Name, L["Displays percentage mana without decimals"])

-- Display the unit level if player is not max level
E:AddTag('luckyone:level', 'UNIT_LEVEL PLAYER_LEVEL_UP', function(unit)
	local level, max = UnitEffectiveLevel(unit), E:XPIsLevelMax()
	return max and nil or level > 0 and level or '??'
end)
E:AddTagInfo('luckyone:level', Private.Name, L["Displays the unit's level if the player is not max level"])

-- Display mana (current) if the unit is flagged healer (Retail and Cata only)
E:AddTag('luckyone:healermana:current', 'UNIT_POWER_FREQUENT UNIT_MAXPOWER', function(unit)
	local role = UnitGroupRolesAssigned(unit)
	return role == 'HEALER' and UnitPower(unit, Enum.PowerType.Mana)
end, E.Classic)
E:AddTagInfo('luckyone:healermana:current', Private.Name, L["Displays the unit's Mana (Role: Healer)"], nil, E.Classic)

-- Display mana (percent) if the unit is flagged healer (Retail and Cata only)
E:AddTag('luckyone:healermana:percent', 'UNIT_MAXPOWER UNIT_POWER_FREQUENT', function(unit)
	local role = UnitGroupRolesAssigned(unit)
	local min = UnitPower(unit, Enum.PowerType.Mana)
	return role == 'HEALER' and E:GetFormattedText('PERCENT', min, UnitPowerMax(unit, Enum.PowerType.Mana), 0, nil)
end, E.Classic)
E:AddTagInfo('luckyone:healermana:percent', Private.Name, L["Displays the unit's Mana in percent (Role: Healer)"], nil, E.Classic)

-- Display pet name and happiness status (Classic only)
E:AddTag('luckyone:pet:name-and-happiness', E.Retail and 'UNIT_NAME_UPDATE PET_UI_UPDATE' or 'UNIT_NAME_UPDATE UNIT_HAPPINESS PET_UI_UPDATE', function(unit)
	local hasPetUI, isHunterPet = HasPetUI()
	if hasPetUI and isHunterPet and UnitIsUnit('pet', unit) then
		return (not E.Classic and 'Pet') or format('%s %s%s', 'Pet', Hex(_COLORS.happiness[GetPetHappiness()]), _G['PET_HAPPINESS'..GetPetHappiness()])
	end
end)
E:AddTagInfo('luckyone:pet:name-and-happiness', Private.Name, L["Displays the pet's name and includes (in Classic only) the full happiness status"])

-- Displays the last (and mostly important) part of the unit's name with class color
E:AddTag('luckyone:name:last', 'UNIT_NAME_UPDATE UNIT_FACTION INSTANCE_ENCOUNTER_ENGAGE_UNIT', function(unit)
	local name = UnitName(unit)
	if name and strfind(name, '%s') then
		name = strmatch(name, '([%S]+)$')
	end
	if UnitIsPlayer(unit) or (E.Retail and UnitInPartyIsAI(unit)) then
		local _, unitClass = UnitClass(unit)
		local cs = ElvUF.colors.class[unitClass]
		return format('%s%s', (cs and Hex(cs.r, cs.g, cs.b)) or '|cFFcccccc', name)
	else
		local cr = ElvUF.colors.reaction[UnitReaction(unit, 'player')]
		return format('%s%s', (cr and Hex(cr.r, cr.g, cr.b)) or '|cFFcccccc', name)
	end
end)
E:AddTagInfo('luckyone:name:last', Private.Name, L["Displays the last part of the unit's name with class color"])
