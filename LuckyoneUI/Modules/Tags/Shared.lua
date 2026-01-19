-- Addon namespace
local _, Private = ...
local L = Private.Libs.ACL

-- ElvUI file
if not Private.ElvUI then
	return
end

-- API cache
local GetPetHappiness = GetPetHappiness
local HasPetUI = HasPetUI
local UnitIsUnit = UnitIsUnit
local UnitClassification = UnitClassification

-- Global environment
local _G = _G

-- ElvUI modules
local E = unpack(ElvUI)
local _COLORS = ElvUF.colors

-- Display unit classification without 'affix' on minor enemies
E:AddTag('luckyone:classification', 'UNIT_CLASSIFICATION_CHANGED', function(unit)
	return Private.Tags.classificationText[UnitClassification(unit)] or nil
end)
E:AddTagInfo('luckyone:classification', Private.Name, L["Displays the unit's classification (e.g 'Elite' and 'Rare') but without 'Affix'"])

-- Display pet name and happiness status (Classic and TBC only)
E:AddTag('luckyone:pet:name-and-happiness', (Private.isClassic or Private.isTBC) and 'UNIT_NAME_UPDATE UNIT_HAPPINESS PET_UI_UPDATE' or 'UNIT_NAME_UPDATE PET_UI_UPDATE', function(unit)
	if Private.isRetail or Private.isMists then
		return 'Pet'
	else
		local hasPetUI, isHunterPet = HasPetUI()
		if hasPetUI and UnitIsUnit('pet', unit) then
			if isHunterPet then
				local petHappiness = GetPetHappiness()
				local happinessColor = _COLORS.happiness[petHappiness]
				-- Return for Hunters
				return Private.Tags.Hex(happinessColor) .. _G['PET_HAPPINESS' .. petHappiness]
			else
				-- Return for other Pet Classes
				return 'Pet'
			end
		else -- Shadowfiend and others
			return 'Pet'
		end
	end
end)
E:AddTagInfo('luckyone:pet:name-and-happiness', Private.Name, L["Displays the pet's name and includes (in Classic only) the full happiness status"])
