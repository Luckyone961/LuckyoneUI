local L1UI, E, L, V, P, G = unpack(select(2, ...))
local ElvUF = E.oUF

local floor = floor

local UnitClassification = UnitClassification
local UnitGroupRolesAssigned = UnitGroupRolesAssigned
local UnitHealth = UnitHealth
local UnitHealthMax = UnitHealthMax
local UnitPower = UnitPower
local UnitPowerMax = UnitPowerMax

-- Display unit classification without 'affix' on minor enemies
ElvUF.Tags.Events['luckyone:classification'] = 'UNIT_CLASSIFICATION_CHANGED'
ElvUF.Tags.Methods['luckyone:classification'] = function(unit)
	local class = UnitClassification(unit)
	if (class == 'rare') then
		return 'Rare'
	elseif (class == 'rareelite') then
		return 'Rare Elite'
	elseif (class == 'elite') then
		return 'Elite'
	elseif (class == 'worldboss') then
		return 'Boss'
	end
end

-- Display percentage health: 100% 0 decimals | <100% 1 decimal | <10% 2 decimals
ElvUF.Tags.Events['luckyone:health:percent'] = 'UNIT_HEALTH UNIT_MAXHEALTH'
ElvUF.Tags.Methods['luckyone:health:percent'] = function(unit)
	local currentHealth, maxHealth = UnitHealth(unit), UnitHealthMax(unit)
	local percent = currentHealth / maxHealth * 100

	return E:GetFormattedText('PERCENT', currentHealth, maxHealth, percent == 100 and 0 or percent < 10 and 2 or 1, nil)
end

-- Add the following tags only in retail
if L1UI.Retail then
	-- Display mana (current) if the unit is flagged healer
	ElvUF.Tags.Events['luckyone:healermana:current'] = 'UNIT_POWER_FREQUENT UNIT_MAXPOWER'
	ElvUF.Tags.Methods['luckyone:healermana:current'] = function(unit)
		local role = UnitGroupRolesAssigned(unit)
		if (role == 'HEALER') then
			return UnitPower(unit, Enum.PowerType.Mana)
		end
	end

	-- Display mana (percent) if the unit is flagged healer
	ElvUF.Tags.Events['luckyone:healermana:percent'] = 'UNIT_MAXPOWER UNIT_POWER_FREQUENT'
	ElvUF.Tags.Methods['luckyone:healermana:percent'] = function(unit)
		local role = UnitGroupRolesAssigned(unit)
		if (role == 'HEALER') then
			local powerMax = UnitPowerMax(unit, Enum.PowerType.Mana)
			if (powerMax == 0) then
				return 0
			else
				return floor(UnitPower(unit, Enum.PowerType.Mana) / powerMax * 100 + .5)
			end
		end
	end

	E:AddTagInfo('luckyone:healermana:current', L1UI.Name, "Displays the unit's Mana (Role: Healer)")
	E:AddTagInfo('luckyone:healermana:percent', L1UI.Name, "Displays the unit's Mana in percent (Role: Healer)")
end

E:AddTagInfo('luckyone:classification', L1UI.Name, "Displays the unit's classification (e.g 'Elite' and 'Rare') but without 'Affix'")
E:AddTagInfo('luckyone:health:percent', L1UI.Name, "Displays percentage health with 1 decimal below 100%, 2 decimals below 10% and hides decimals at 100%")
