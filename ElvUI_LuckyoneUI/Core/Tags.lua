-- Lua functions
local floor = floor
local format = format
local pairs = pairs
local strfind = string.find
local strmatch = string.match
local type = type
local unpack = unpack

-- API cache
local C_PetJournal_GetPetTeamAverageLevel = C_PetJournal.GetPetTeamAverageLevel
local GetCreatureDifficultyColor = GetCreatureDifficultyColor
local GetPetHappiness = GetPetHappiness
local GetRelativeDifficultyColor = GetRelativeDifficultyColor
local HasPetUI = HasPetUI
local QuestDifficultyColors = QuestDifficultyColors
local UnitBattlePetLevel = UnitBattlePetLevel
local UnitClassification = UnitClassification
local UnitEffectiveLevel = UnitEffectiveLevel
local UnitGroupRolesAssigned = UnitGroupRolesAssigned
local UnitHealth = UnitHealth
local UnitHealthMax = UnitHealthMax
local UnitInPartyIsAI = UnitInPartyIsAI
local UnitIsBattlePetCompanion = UnitIsBattlePetCompanion
local UnitIsPlayer = UnitIsPlayer
local UnitIsUnit = UnitIsUnit
local UnitIsWildBattlePet = UnitIsWildBattlePet
local UnitName = UnitName
local UnitPower = UnitPower
local UnitPowerMax = UnitPowerMax
local UnitPowerType = UnitPowerType
local UnitReaction = UnitReaction

-- Global environment
local _G = _G

-- Global strings
local UNKNOWN = UNKNOWN

-- AddOn namespace
local _, Private = ...

-- ElvUI modules
local E, L = unpack(ElvUI)
local Tags = ElvUF.Tags
local Abbrev = Tags.Env.Abbrev

local classificationText = {
	rare = 'Rare',
	rareelite = 'Rare Elite',
	elite = 'Elite',
	worldboss = 'Boss'
}

-- oUF\Elements\tags.lua
local function Hex(r, g, b)
	if type(r) == 'table' then
		if r.r then
			r, g, b = r.r, r.g, r.b
		else
			r, g, b = unpack(r)
		end
	elseif not r or type(r) == 'string' then
		return '|cffFFFFFF'
	end

	return format('|cff%02x%02x%02x', r * 255, g * 255, b * 255)
end

-- Display unit classification without 'affix' on minor enemies
E:AddTag('luckyone:classification', 'UNIT_CLASSIFICATION_CHANGED', function(unit)
	return classificationText[UnitClassification(unit)] or nil
end)
E:AddTagInfo('luckyone:classification', Private.Name, L["Displays the unit's classification (e.g 'Elite' and 'Rare') but without 'Affix'"])

-- Display percentage health: 100% 0 decimals | <100% 1 decimal | <10% 2 decimals
E:AddTag('luckyone:health:percent', 'UNIT_HEALTH UNIT_MAXHEALTH', function(unit)
	local currentHealth, maxHealth = UnitHealth(unit), UnitHealthMax(unit)
	local percent = currentHealth / maxHealth * 100

	return E:GetFormattedText('PERCENT', currentHealth, maxHealth, percent == 100 and 0 or percent < 10 and 2 or 1, nil)
end)
E:AddTagInfo('luckyone:health:percent', Private.Name, L["Displays percentage health with 1 decimal below 100%, 2 decimals below 10% and hides decimals at 100%"])

-- Display percentage power with powecolor and hides power at 0
E:AddTag('luckyone:power:percent-color', 'UNIT_MAXPOWER UNIT_POWER_FREQUENT UNIT_DISPLAYPOWER', function(unit)
	local min, max = UnitPower(unit), UnitPowerMax(unit)
	local pType, pToken, altR, altG, altB = UnitPowerType(unit)
	local color = _COLORS.power[pToken] or (altR and (altR > 1 or altG > 1 or altB > 1) and Hex(altR / 255, altG / 255, altB / 255)) or Hex(_COLORS.power[pType] or _COLORS.power.MANA)
	local percentage = (min == 0) and '' or floor(min / max * 100 + .5)

	if altR and not _COLORS.power[pToken] then
		if altR <= 1 and altG <= 1 and altB <= 1 then
			color = Hex(altR, altG, altB)
		end
	else
		color = Hex(color)
	end

	return format('%s%s', color, percentage)
end)
E:AddTagInfo('luckyone:power:percent-color', Private.Name, L["Displays percentage power with powercolor and hides power at 0"])

-- Display percentage power with no color and hides power at 0
E:AddTag('luckyone:power:percent-nocolor', 'UNIT_MAXPOWER UNIT_POWER_FREQUENT UNIT_DISPLAYPOWER', function(unit)
	local min, max = UnitPower(unit), UnitPowerMax(unit)

	return (min == 0) and '' or floor(UnitPower(unit) / max * 100 + .5)
end)
E:AddTagInfo('luckyone:power:percent-nocolor', Private.Name, L["Displays percentage power with no color and hides power at 0"])

-- Display percentage mana with 0 decimals
E:AddTag('luckyone:mana:percent', 'UNIT_MAXPOWER UNIT_POWER_FREQUENT UNIT_DISPLAYPOWER', function(unit)
	local min = UnitPower(unit, Enum.PowerType.Mana)

	return E:GetFormattedText('PERCENT', min, UnitPowerMax(unit, Enum.PowerType.Mana), 0, nil)
end)
E:AddTagInfo('luckyone:mana:percent', Private.Name, L["Displays percentage mana without decimals"])

-- Display the unit level if player is not max level
E:AddTag('luckyone:level', 'UNIT_LEVEL PLAYER_LEVEL_UP', function(unit)
	local color
	local level = UnitEffectiveLevel(unit)
	local max = E:XPIsLevelMax()

	if E.Retail and (UnitIsWildBattlePet(unit) or UnitIsBattlePetCompanion(unit)) then
		level = UnitBattlePetLevel(unit)
		local teamLevel = C_PetJournal_GetPetTeamAverageLevel()
		color = (teamLevel ~= level) and GetRelativeDifficultyColor(teamLevel, level) or QuestDifficultyColors.difficult
	else
		color = GetCreatureDifficultyColor(level)
	end

	return not max and format('%s%s', Hex(color.r, color.g, color.b), (level > 0) and level or '??')
end)
E:AddTagInfo('luckyone:level', Private.Name, L["Displays the unit's level with difficultycolor if the player is not max level"])

-- Display mana (current) if the unit is flagged healer (Retail and Cata only)
E:AddTag('luckyone:healermana:current', 'UNIT_MAXPOWER UNIT_POWER_FREQUENT UNIT_DISPLAYPOWER', function(unit)
	local role = UnitGroupRolesAssigned(unit)

	if role == 'HEALER' then
		local color = ElvUF.colors.power.MANA
		return format('%s%s', Hex(color.r, color.g, color.b), UnitPower(unit, Enum.PowerType.Mana))
	end
end, E.Classic)
E:AddTagInfo('luckyone:healermana:current', Private.Name, L["Displays the unit's Mana with manacolor (Role: Healer)"], nil, E.Classic)

-- Display mana (percent) if the unit is flagged healer (Retail and Cata only)
E:AddTag('luckyone:healermana:percent', 'UNIT_MAXPOWER UNIT_POWER_FREQUENT UNIT_DISPLAYPOWER', function(unit)
	local role = UnitGroupRolesAssigned(unit)
	if role == 'HEALER' then
		local color = ElvUF.colors.power.MANA
		local min = UnitPower(unit, Enum.PowerType.Mana)
		local max = UnitPowerMax(unit, Enum.PowerType.Mana)

		return format('%s%s', Hex(color.r, color.g, color.b), E:GetFormattedText('PERCENT', min, max, 0, nil))
	end
end, E.Classic)
E:AddTagInfo('luckyone:healermana:percent', Private.Name, L["Displays the unit's Mana with manacolor in percent (Role: Healer)"], nil, E.Classic)

-- Display pet name and happiness status (Classic only)
E:AddTag('luckyone:pet:name-and-happiness', E.Classic and 'UNIT_NAME_UPDATE UNIT_HAPPINESS PET_UI_UPDATE' or 'UNIT_NAME_UPDATE PET_UI_UPDATE', function(unit)
	if not E.Classic then
		return 'Pet'
	else
		local hasPetUI, isHunterPet = HasPetUI()
		if hasPetUI and UnitIsUnit('pet', unit) then
			if isHunterPet then
				local petHappiness = GetPetHappiness()
				local happinessColor = _COLORS.happiness[petHappiness]
				-- Return for Hunters
				return format('%s%s', Hex(happinessColor), _G['PET_HAPPINESS' .. petHappiness])
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

-- Displays the last (and mostly important) part of the unit's name with class color
E:AddTag('luckyone:name:last-classcolor', 'UNIT_NAME_UPDATE UNIT_FACTION INSTANCE_ENCOUNTER_ENGAGE_UNIT', function(unit)
	local name = UnitName(unit)
	local color, formattedName

	if UnitIsPlayer(unit) or (E.Retail and UnitInPartyIsAI(unit)) then
		local _, unitClass = UnitClass(unit)
		local cs = ElvUF.colors.class[unitClass]
		color = cs and Hex(cs.r, cs.g, cs.b) or '|cFFcccccc'
	else
		local cr = ElvUF.colors.reaction[UnitReaction(unit, 'player')]
		color = cr and Hex(cr.r, cr.g, cr.b) or '|cFFcccccc'
	end

	if name and strfind(name, '%s') then
		name = strmatch(name, '([%S]+)$')
	end

	formattedName = name or UNKNOWN

	return format('%s%s', color, formattedName)
end)
E:AddTagInfo('luckyone:name:last-classcolor', Private.Name, L["Displays the last part of the unit's name with class color"])

-- Displays the last (and mostly important) part of the unit's name with no color
E:AddTag('luckyone:name:last-nocolor', 'UNIT_NAME_UPDATE INSTANCE_ENCOUNTER_ENGAGE_UNIT', function(unit)
	local name = UnitName(unit)

	if name and strfind(name, '%s') then
		name = strmatch(name, '([%S]+)$')
	end

	return name
end)
E:AddTagInfo('luckyone:name:last-nocolor', Private.Name, L["Displays the last part of the unit's name with no color"])

local function getFormattedName(unit, length, color, abbrev)
	local name = UnitName(unit) or UNKNOWN
	if abbrev then
		name = Abbrev(name)
	end
	name = E:ShortenString(name, length)

	if color then
		local colorHex = '|cFFcccccc' -- Default color
		if UnitIsPlayer(unit) or (E.Retail and UnitInPartyIsAI(unit)) then
			local _, unitClass = UnitClass(unit)
			local cs = ElvUF.colors.class[unitClass]
			if cs then
				colorHex = Hex(cs.r, cs.g, cs.b)
			end
		else
			local cr = ElvUF.colors.reaction[UnitReaction(unit, 'player')]
			if cr then
				colorHex = Hex(cr.r, cr.g, cr.b)
			end
		end
		return format('%s%s', colorHex, name)
	else
		return name
	end
end

for textFormat, length in pairs({ veryshort = 5, short = 10, medium = 15, long = 20 }) do
	-- Displays the unit's name with classcolor and a maximum length of 5, 10, 15 and 20 characters
	E:AddTag(format('luckyone:name:%s-classcolor', textFormat), 'UNIT_NAME_UPDATE UNIT_FACTION INSTANCE_ENCOUNTER_ENGAGE_UNIT', function(unit)
		return getFormattedName(unit, length, true)
	end)
	-- Displays the unit's name with no color and a maximum length of 5, 10, 15 and 20 characters
	E:AddTag(format('luckyone:name:%s-nocolor', textFormat), 'UNIT_NAME_UPDATE INSTANCE_ENCOUNTER_ENGAGE_UNIT', function(unit)
		return getFormattedName(unit, length, false)
	end)
	-- Displays the unit's name abbreviated with classcolor and a maximum length of 5, 10, 15 and 20 characters
	E:AddTag(format('luckyone:name:abbrev:%s-classcolor', textFormat), 'UNIT_NAME_UPDATE UNIT_FACTION INSTANCE_ENCOUNTER_ENGAGE_UNIT', function(unit)
		return getFormattedName(unit, length, true, true)
	end)
	-- Displays the unit's name abbreviated with no color and a maximum length of 5, 10, 15 and 20 characters
	E:AddTag(format('luckyone:name:abbrev:%s-nocolor', textFormat), 'UNIT_NAME_UPDATE INSTANCE_ENCOUNTER_ENGAGE_UNIT', function(unit)
		return getFormattedName(unit, length, false, true)
	end)

	E:AddTagInfo(format('luckyone:name:%s-classcolor', textFormat), Private.Name, format(L["Displays the unit's name with classcolor and a maximum length of %s characters"], length))
	E:AddTagInfo(format('luckyone:name:%s-nocolor', textFormat), Private.Name, format(L["Displays the unit's name with no color and a maximum length of %s characters"], length))
	E:AddTagInfo(format('luckyone:name:abbrev:%s-classcolor', textFormat), Private.Name, format(L["Displays the unit's name with classcolor and a maximum length of %s characters and abbreviates long names"], length))
	E:AddTagInfo(format('luckyone:name:abbrev:%s-nocolor', textFormat), Private.Name, format(L["Displays the unit's name with no color and a maximum length of %s characters and abbreviates long names"], length))
end
