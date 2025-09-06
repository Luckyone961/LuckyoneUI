-- Lua functions
local concat = table.concat
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
local UnitGetTotalAbsorbs = UnitGetTotalAbsorbs
local UnitGroupRolesAssigned = UnitGroupRolesAssigned
local UnitHealth = UnitHealth
local UnitHealthMax = UnitHealthMax
local UnitInPartyIsAI = UnitInPartyIsAI
local UnitIsBattlePetCompanion = UnitIsBattlePetCompanion
local UnitIsConnected = UnitIsConnected
local UnitIsDead = UnitIsDead
local UnitIsGhost = UnitIsGhost
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

local _COLORS = ElvUF.colors
local ElvUF_colors_class = ElvUF.colors.class
local ElvUF_colors_power = ElvUF.colors.power
local ElvUF_colors_reaction = ElvUF.colors.reaction

local classificationText = {
	rare = 'Rare',
	rareelite = 'Rare Elite',
	elite = 'Elite',
	worldboss = 'Boss'
}

local function Hex(r, g, b)
	if type(r) == 'table' then
		if r.r then
			r, g, b = r.r, r.g, r.b
		else
			r, g, b = unpack(r)
		end
	end

	if type(r) == 'number' and g and b then
		return format('|cff%02x%02x%02x', r * 255, g * 255, b * 255)
	end

	return '|cffFFFFFF'
end

local function getFormattedName(unit, length, color, abbrev)
	local name = UnitName(unit) or UNKNOWN

	if name ~= UNKNOWN then
		if abbrev then
			name = Abbrev(name)
		end
		name = E:ShortenString(name, length)
	end

	if not color then return name end

	local colorHex = '|cFFcccccc' -- Default color

	if UnitIsPlayer(unit) or (E.Retail and UnitInPartyIsAI(unit)) then
		local _, unitClass = UnitClass(unit)
		if unitClass then
			local cs = ElvUF_colors_class[unitClass]
			if cs then
				colorHex = Hex(cs.r, cs.g, cs.b)
			end
		end
	else
		local reaction = UnitReaction(unit, 'player')
		if reaction then
			local cr = ElvUF_colors_reaction[reaction]
			if cr then
				colorHex = Hex(cr.r, cr.g, cr.b)
			end
		end
	end

	return colorHex .. name
end

local function getUnitColor(unit)
	local color = '|cFFcccccc'

	if UnitIsPlayer(unit) or (E.Retail and UnitInPartyIsAI(unit)) then
		local _, unitClass = UnitClass(unit)
		local cs = ElvUF_colors_class[unitClass]
		if cs then
			color = Hex(cs.r, cs.g, cs.b)
		end
	else
		local cr = ElvUF_colors_reaction[UnitReaction(unit, 'player')]
		if cr then
			color = Hex(cr.r, cr.g, cr.b)
		end
	end

	return color
end

local function getLastNamePart(name)
	if not name then return name end
	if not strfind(name, '%s') then return name end
	return strmatch(name, '([%S]+)$')
end

local function formatTargetName(unit, lastPartOnly, withColor)
	local targetName = UnitName(unit..'target')
	if not targetName then return end

	if lastPartOnly and strfind(targetName, '%s') then
		targetName = strmatch(targetName, '([%S]+)$')
	end

	return withColor and (getUnitColor(unit..'target')..targetName) or targetName
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

-- Display percentage health with absorb values, without decimals
E:AddTag('luckyone:health:percent-with-absorbs', 'UNIT_HEALTH UNIT_MAXHEALTH UNIT_ABSORB_AMOUNT_CHANGED UNIT_CONNECTION PLAYER_FLAGS_CHANGED', function(unit)
	local status = UnitIsDead(unit) and L["Dead"] or UnitIsGhost(unit) and L["Ghost"] or not UnitIsConnected(unit) and L["Offline"]

	if status then
		return status
	end

	local absorb = UnitGetTotalAbsorbs(unit) or 0
	if absorb == 0 then
		return E:GetFormattedText('PERCENT', UnitHealth(unit), UnitHealthMax(unit), 0, nil)
	end

	local healthTotalIncludingAbsorbs = UnitHealth(unit) + absorb
	return E:GetFormattedText('PERCENT', healthTotalIncludingAbsorbs, UnitHealthMax(unit), 0, nil)
end, E.Classic)
E:AddTagInfo('luckyone:health:percent-with-absorbs', Private.Name, L["Displays the unit's current health as a percentage with absorb values, without decimals"], nil, E.Classic)

-- Display percentage health with absorb values, without decimals and without status
E:AddTag('luckyone:health:percent-with-absorbs:nostatus', 'UNIT_HEALTH UNIT_MAXHEALTH UNIT_ABSORB_AMOUNT_CHANGED UNIT_CONNECTION PLAYER_FLAGS_CHANGED', function(unit)
	local absorb = UnitGetTotalAbsorbs(unit) or 0
	if absorb == 0 then
		return E:GetFormattedText('PERCENT', UnitHealth(unit), UnitHealthMax(unit), 0, nil)
	end

	local healthTotalIncludingAbsorbs = UnitHealth(unit) + absorb
	return E:GetFormattedText('PERCENT', healthTotalIncludingAbsorbs, UnitHealthMax(unit), 0, nil)
end, E.Classic)
E:AddTagInfo('luckyone:health:percent-with-absorbs:nostatus', Private.Name, L["Displays the unit's current health as a percentage with absorb values, without decimals and without status"], nil, E.Classic)

-- Display percentage power with powecolor and hides power at 0
E:AddTag('luckyone:power:percent-color', 'UNIT_MAXPOWER UNIT_POWER_FREQUENT UNIT_DISPLAYPOWER', function(unit)
	local min, max = UnitPower(unit), UnitPowerMax(unit)
	local pType, pToken, altR, altG, altB = UnitPowerType(unit)
	local color = _COLORS.power[pToken] or (altR and (altR > 1 or altG > 1 or altB > 1) and Hex(altR / 255, altG / 255, altB / 255)) or Hex(_COLORS.power[pType] or _COLORS.power.MANA)
	local percentage = (min == 0 or max == 0) and '' or floor(min / max * 100 + .5)

	if altR and not _COLORS.power[pToken] then
		if altR <= 1 and altG <= 1 and altB <= 1 then
			color = Hex(altR, altG, altB)
		end
	else
		color = Hex(color)
	end

	return color .. percentage
end)
E:AddTagInfo('luckyone:power:percent-color', Private.Name, L["Displays percentage power with powercolor and hides power at 0"])

-- Display percentage power with no color and hides power at 0
E:AddTag('luckyone:power:percent-nocolor', 'UNIT_MAXPOWER UNIT_POWER_FREQUENT UNIT_DISPLAYPOWER', function(unit)
	local min, max = UnitPower(unit), UnitPowerMax(unit)
	return (min == 0) and '' or floor(min / max * 100 + .5)
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

	return not max and Hex(color.r, color.g, color.b) .. ((level > 0) and level or '??')
end)
E:AddTagInfo('luckyone:level', Private.Name, L["Displays the unit's level with difficultycolor if the player is not max level"])

-- Display mana (current) if the unit is flagged healer (Retail and Mists only)
E:AddTag('luckyone:healermana:current', 'UNIT_MAXPOWER UNIT_POWER_FREQUENT UNIT_DISPLAYPOWER', function(unit)
	local role = UnitGroupRolesAssigned(unit)

	if role == 'HEALER' then
		local color = ElvUF_colors_power.MANA
		return Hex(color.r, color.g, color.b) .. UnitPower(unit, Enum.PowerType.Mana)
	end
end, E.Classic)
E:AddTagInfo('luckyone:healermana:current', Private.Name, L["Displays the unit's Mana with manacolor (Role: Healer)"], nil, E.Classic)

-- Display mana (percent) if the unit is flagged healer (Retail and Mists only)
E:AddTag('luckyone:healermana:percent', 'UNIT_MAXPOWER UNIT_POWER_FREQUENT UNIT_DISPLAYPOWER', function(unit)
	local role = UnitGroupRolesAssigned(unit)
	if role == 'HEALER' then
		local color = ElvUF_colors_power.MANA
		local min = UnitPower(unit, Enum.PowerType.Mana)
		local max = UnitPowerMax(unit, Enum.PowerType.Mana)

		return Hex(color.r, color.g, color.b) .. E:GetFormattedText('PERCENT', min, max, 0, nil)
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
				return Hex(happinessColor) .. _G['PET_HAPPINESS' .. petHappiness]
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
		local cs = ElvUF_colors_class[unitClass]
		color = cs and Hex(cs.r, cs.g, cs.b) or '|cFFcccccc'
	else
		local cr = ElvUF_colors_reaction[UnitReaction(unit, 'player')]
		color = cr and Hex(cr.r, cr.g, cr.b) or '|cFFcccccc'
	end

	formattedName = name and (strfind(name, '%s') and strmatch(name, '([%S]+)$') or name) or UNKNOWN

	return color .. formattedName
end)
E:AddTagInfo('luckyone:name:last-classcolor', Private.Name, L["Displays the last part of the unit's name with class color"])

-- Displays the last (and mostly important) part of the unit's name with no color
E:AddTag('luckyone:name:last-nocolor', 'UNIT_NAME_UPDATE INSTANCE_ENCOUNTER_ENGAGE_UNIT', function(unit)
	local name = UnitName(unit)
	return getLastNamePart(name)
end)
E:AddTagInfo('luckyone:name:last-nocolor', Private.Name, L["Displays the last part of the unit's name with no color"])

-- Displays the last (and mostly important) part of the unit's target name with class color
E:AddTag('luckyone:target:last-classcolor', 'UNIT_TARGET UNIT_FACTION', function(unit)
	return formatTargetName(unit, true, true)
end)
E:AddTagInfo('luckyone:target:last-classcolor', Private.Name, L["Displays the last part of the unit's target name with class color"])

-- Displays the last (and mostly important) part of the unit's target name with no color
E:AddTag('luckyone:target:last-nocolor', 'UNIT_TARGET', function(unit)
	return formatTargetName(unit, true, false)
end)
E:AddTagInfo('luckyone:target:last-nocolor', Private.Name, L["Displays the last part of the unit's target name with no color"])

-- Displays the unit's target name with class color
E:AddTag('luckyone:target:name-classcolor', 'UNIT_TARGET UNIT_FACTION', function(unit)
	return formatTargetName(unit, false, true)
end)
E:AddTagInfo('luckyone:target:name-classcolor', Private.Name, L["Displays the unit's target name with class color"])

-- Displays the unit's target name with no color
E:AddTag('luckyone:target:name-nocolor', 'UNIT_TARGET', function(unit)
	return formatTargetName(unit, false, false)
end)
E:AddTagInfo('luckyone:target:name-nocolor', Private.Name, L["Displays the unit's target name with no color"])

for textFormat, length in pairs({ veryshort = 5, short = 10, medium = 15, long = 20 }) do
	-- Displays the unit's name with classcolor and a maximum length of 5, 10, 15 and 20 characters
	E:AddTag('luckyone:name:' .. textFormat .. '-classcolor', 'UNIT_NAME_UPDATE UNIT_FACTION INSTANCE_ENCOUNTER_ENGAGE_UNIT', function(unit)
		return getFormattedName(unit, length, true)
	end)
	-- Displays the unit's name with no color and a maximum length of 5, 10, 15 and 20 characters
	E:AddTag('luckyone:name:' .. textFormat .. '-nocolor', 'UNIT_NAME_UPDATE INSTANCE_ENCOUNTER_ENGAGE_UNIT', function(unit)
		return getFormattedName(unit, length, false)
	end)
	-- Displays the unit's name abbreviated with classcolor and a maximum length of 5, 10, 15 and 20 characters
	E:AddTag('luckyone:name:abbrev:' .. textFormat .. '-classcolor', 'UNIT_NAME_UPDATE UNIT_FACTION INSTANCE_ENCOUNTER_ENGAGE_UNIT', function(unit)
		return getFormattedName(unit, length, true, true)
	end)
	-- Displays the unit's name abbreviated with no color and a maximum length of 5, 10, 15 and 20 characters
	E:AddTag('luckyone:name:abbrev:' .. textFormat .. '-nocolor', 'UNIT_NAME_UPDATE INSTANCE_ENCOUNTER_ENGAGE_UNIT', function(unit)
		return getFormattedName(unit, length, false, true)
	end)

	E:AddTagInfo('luckyone:name:' .. textFormat .. '-classcolor', Private.Name, format(L["Displays the unit's name with classcolor and a maximum length of %s characters"], length))
	E:AddTagInfo('luckyone:name:' .. textFormat .. '-nocolor', Private.Name, format(L["Displays the unit's name with no color and a maximum length of %s characters"], length))
	E:AddTagInfo('luckyone:name:abbrev:' .. textFormat .. '-classcolor', Private.Name, format(L["Displays the unit's name with classcolor and a maximum length of %s characters and abbreviates long names"], length))
	E:AddTagInfo('luckyone:name:abbrev:' .. textFormat .. '-nocolor', Private.Name, format(L["Displays the unit's name with no color and a maximum length of %s characters and abbreviates long names"], length))
end
