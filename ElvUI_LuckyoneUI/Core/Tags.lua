local L1UI, E, L, V, P, G = unpack(select(2, ...))

local ElvUF = E.oUF

--[[
	ref: elvui\ElvUI\Libraries\oUF\elements\tags.lua
]]

-- Classification without Affix
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

-- Healer Mana Current
ElvUF.Tags.Events['luckyone:healermana:current'] = 'UNIT_POWER_FREQUENT UNIT_MAXPOWER'
ElvUF.Tags.Methods['luckyone:healermana:current'] = function(unit)
	local role = UnitGroupRolesAssigned(unit)
	if (role == 'HEALER') then
		return UnitPower(unit, Enum.PowerType.Mana)
	end
end

-- Healer Mana Percent
ElvUF.Tags.Events['luckyone:healermana:percent'] = 'UNIT_MAXPOWER UNIT_POWER_FREQUENT'
ElvUF.Tags.Methods['luckyone:healermana:percent'] = function(unit)
	local role = UnitGroupRolesAssigned(unit)
	if (role == 'HEALER') then
		local max = UnitPowerMax(unit, Enum.PowerType.Mana)
		if (max == 0) then
			return 0
		else
			return math.floor(UnitPower(unit, Enum.PowerType.Mana) / max * 100 + .5)
		end
	end
end

E:AddTagInfo('luckyone:classification', L1UI.Name, "Displays the unit's classification (e.g 'Elite' and 'Rare') but without 'Affix'")
E:AddTagInfo('luckyone:healermana:current', L1UI.Name, "Displays the unit's Mana (Role: Healer)")
E:AddTagInfo('luckyone:healermana:percent', L1UI.Name, "Displays the unit's Mana in percent (Role: Healer)")
