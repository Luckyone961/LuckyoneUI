local L1UI, E, L, V, P, G = unpack(select(2, ...))

local ElvUF = E.oUF

-- Modified verion of oUF classification
ElvUF.Tags.Events['luckyone:classification'] = 'UNIT_CLASSIFICATION_CHANGED'
ElvUF.Tags.Methods['luckyone:classification'] = function(u)
	local c = UnitClassification(u)
	if (c =='rare') then
		return 'Rare'
	elseif (c == 'rareelite') then
		return 'Rare Elite'
	elseif (c == 'elite') then
		return 'Elite'
	elseif (c == 'worldboss') then
		return 'Boss'
	end
end

E:AddTagInfo('luckyone:classification', L1UI.Name, "Displays the unit's classification (e.g 'Elite' and 'Rare') but without 'Affix'")
