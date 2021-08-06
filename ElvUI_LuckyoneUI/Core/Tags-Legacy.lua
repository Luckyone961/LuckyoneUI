local L1UI, E, L, V, P, G = unpack(select(2, ...))
if L1UI.Retail then return end
local ElvUF = E.oUF

local UnitClassification = UnitClassification
local UnitHealth = UnitHealth
local UnitHealthMax = UnitHealthMax

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

E:AddTagInfo('luckyone:classification', L1UI.Name, "Displays the unit's classification (e.g 'Elite' and 'Rare') but without 'Affix'")
E:AddTagInfo('luckyone:health:percent', L1UI.Name, "Displays percentage health with 1 decimal below 100%, 2 decimals below 10% and hides decimals at 100%")
