-- Addon namespace
local _, Private = ...
local L = Private.Libs.ACL

-- ElvUI file
if not Private.ElvUI then
	return
end

-- Lua functions
local floor = floor
local format = string.format
local pairs = pairs
local unpack = unpack

-- API cache
local GetCreatureDifficultyColor = GetCreatureDifficultyColor
local GetPetHappiness = GetPetHappiness
local HasPetUI = HasPetUI
local ScaleTo100 = CurveConstants and CurveConstants.ScaleTo100
local UnitClassification = UnitClassification
local UnitEffectiveLevel = UnitEffectiveLevel
local UnitGetTotalAbsorbs = UnitGetTotalAbsorbs
local UnitGroupRolesAssigned = UnitGroupRolesAssigned
local UnitHealth = UnitHealth
local UnitHealthMax = UnitHealthMax
local UnitHealthPercent = UnitHealthPercent
local UnitInPartyIsAI = UnitInPartyIsAI
local UnitIsConnected = UnitIsConnected
local UnitIsDead = UnitIsDead
local UnitIsFriend = UnitIsFriend
local UnitIsGhost = UnitIsGhost
local UnitIsUnit = UnitIsUnit
local UnitName = UnitName
local UnitPower = UnitPower
local UnitPowerMax = UnitPowerMax
local UnitPowerPercent = UnitPowerPercent

-- Global environment
local _G = _G
local Enum = Enum

-- Global strings
local UNKNOWN = UNKNOWN

-- ElvUI modules
local E = unpack(ElvUI)
local _COLORS = ElvUF.colors
local ElvUF_colors_power = ElvUF.colors.power

-- Local references
local Hex = Private.Tags.Hex

-------------------------------------------------------
-------------------- Classification -------------------
-------------------------------------------------------

-- Display unit classification without 'affix' on minor enemies
E:AddTag('luckyone:classification', 'UNIT_CLASSIFICATION_CHANGED', function(unit)
	return Private.Tags.classificationText[UnitClassification(unit)] or nil
end)
E:AddTagInfo('luckyone:classification', Private.Name, L["Displays the unit's classification (e.g 'Elite' and 'Rare') but without 'Affix'"])

-------------------------------------------------------
------------------------ Health -----------------------
-------------------------------------------------------

-- Display percentage health
E:AddTag('luckyone:health:percent', 'UNIT_HEALTH UNIT_MAXHEALTH', function(unit)
	if Private.isRetail then
		return format('%d', UnitHealthPercent(unit, true, ScaleTo100))
	else
		local currentHealth, maxHealth = UnitHealth(unit), UnitHealthMax(unit)
		local percent = currentHealth / maxHealth * 100
		return E:GetFormattedText('PERCENT', currentHealth, maxHealth, percent == 100 and 0 or percent < 10 and 2 or 1, nil)
	end
end)
if Private.isRetail then
	E:AddTagInfo('luckyone:health:percent', Private.Name, L["Displays percentage health without decimals"])
else
	E:AddTagInfo('luckyone:health:percent', Private.Name, L["Displays percentage health with 1 decimal below 100%, 2 decimals below 10% and hides decimals at 100%"])
end

-- Display current health abbreviated (Retail only)
if Private.isRetail then
	E:AddTag('luckyone:health:current:shortvalue', 'UNIT_HEALTH UNIT_MAXHEALTH', function(unit)
		local currentHealth = UnitHealth(unit)
		return E:AbbreviateNumbers(currentHealth, E.Abbreviate.short)
	end)
	E:AddTagInfo('luckyone:health:current:shortvalue', Private.Name, L["Displays the short value of the current health (Examples: 156.4k, 1.62M, 1.75B)"])
end

-- Display percentage health with absorb values, without decimals (Classic only, hidden on Vanilla)
if not Private.isRetail then
	E:AddTag('luckyone:health:percent-with-absorbs', 'UNIT_HEALTH UNIT_MAXHEALTH UNIT_ABSORB_AMOUNT_CHANGED UNIT_CONNECTION PLAYER_FLAGS_CHANGED', function(unit)
		local status = UnitIsDead(unit) and L["DEAD"] or UnitIsGhost(unit) and L["GHOST"] or not UnitIsConnected(unit) and L["OFFLINE"]
		if status then return status end

		local absorb = UnitGetTotalAbsorbs(unit) or 0
		if absorb == 0 then
			return E:GetFormattedText('PERCENT', UnitHealth(unit), UnitHealthMax(unit), 0, nil)
		end

		local healthTotalIncludingAbsorbs = UnitHealth(unit) + absorb
		return E:GetFormattedText('PERCENT', healthTotalIncludingAbsorbs, UnitHealthMax(unit), 0, nil)
	end, Private.isClassic)
	E:AddTagInfo('luckyone:health:percent-with-absorbs', Private.Name, L["Displays the unit's current health as a percentage with absorb values, without decimals"], nil, Private.isClassic)

	-- Display percentage health with absorb values, without decimals and without status (Classic only, hidden on Vanilla)
	E:AddTag('luckyone:health:percent-with-absorbs:nostatus', 'UNIT_HEALTH UNIT_MAXHEALTH UNIT_ABSORB_AMOUNT_CHANGED UNIT_CONNECTION PLAYER_FLAGS_CHANGED', function(unit)
		local absorb = UnitGetTotalAbsorbs(unit) or 0
		if absorb == 0 then
			return E:GetFormattedText('PERCENT', UnitHealth(unit), UnitHealthMax(unit), 0, nil)
		end

		local healthTotalIncludingAbsorbs = UnitHealth(unit) + absorb
		return E:GetFormattedText('PERCENT', healthTotalIncludingAbsorbs, UnitHealthMax(unit), 0, nil)
	end, Private.isClassic)
	E:AddTagInfo('luckyone:health:percent-with-absorbs:nostatus', Private.Name, L["Displays the unit's current health as a percentage with absorb values, without decimals and without status"], nil, Private.isClassic)
end

-------------------------------------------------------
------------------------ Power ------------------------
-------------------------------------------------------

-- Display percentage power with powercolor
E:AddTag('luckyone:power:percent-color', 'UNIT_MAXPOWER UNIT_POWER_FREQUENT UNIT_DISPLAYPOWER', function(unit)
	if Private.isRetail then
		local percent = format('%d', UnitPowerPercent(unit, nil, true, ScaleTo100))
		local color = Private.Tags.getPowerColor(unit)
		return color .. percent
	else
		local min, max = UnitPower(unit), UnitPowerMax(unit)
		if max == 0 then return end

		local color = Private.Tags.getPowerColor(unit)
		local percentage = floor(min / max * 100 + .5)

		if percentage ~= 0 then
			return color .. percentage
		end
	end
end)
E:AddTagInfo('luckyone:power:percent-color', Private.Name, L["Displays percentage power without decimals with powercolor"])

-- Display percentage power with no color
E:AddTag('luckyone:power:percent-nocolor', 'UNIT_MAXPOWER UNIT_POWER_FREQUENT UNIT_DISPLAYPOWER', function(unit)
	if Private.isRetail then
		return format('%d', UnitPowerPercent(unit, nil, true, ScaleTo100))
	else
		local min, max = UnitPower(unit), UnitPowerMax(unit)
		if min ~= 0 and max ~= 0 then
			return floor(min / max * 100 + .5)
		end
	end
end)
E:AddTagInfo('luckyone:power:percent-nocolor', Private.Name, L["Displays percentage power without decimals with no color"])

-- Display percentage mana with 0 decimals (Classic only)
if not Private.isRetail then
	E:AddTag('luckyone:mana:percent', 'UNIT_MAXPOWER UNIT_POWER_FREQUENT UNIT_DISPLAYPOWER', function(unit)
		local min = UnitPower(unit, Enum.PowerType.Mana)
		local max = UnitPowerMax(unit, Enum.PowerType.Mana)

		return E:GetFormattedText('PERCENT', min, max, 0, nil)
	end)
	E:AddTagInfo('luckyone:mana:percent', Private.Name, L["Displays percentage mana without decimals"])
end

-------------------------------------------------------
--------------------- Healer Mana ---------------------
-------------------------------------------------------

-- Display mana (current) if the unit is flagged healer (Classic only)
if not Private.isRetail then
	E:AddTag('luckyone:healermana:current', 'UNIT_MAXPOWER UNIT_POWER_FREQUENT UNIT_DISPLAYPOWER', function(unit)
		local role = UnitGroupRolesAssigned(unit)
		if role ~= 'HEALER' then return end

		local color = ElvUF_colors_power.MANA
		return Hex(color.r, color.g, color.b) .. UnitPower(unit, Enum.PowerType.Mana)
	end)
	E:AddTagInfo('luckyone:healermana:current', Private.Name, L["Displays the unit's Mana with manacolor (Role: Healer)"])
end

-- Display mana (percent) if the unit is flagged healer
E:AddTag('luckyone:healermana:percent', 'UNIT_MAXPOWER UNIT_POWER_FREQUENT UNIT_DISPLAYPOWER', function(unit)
	local role = UnitGroupRolesAssigned(unit)
	if role ~= 'HEALER' then return end

	if Private.isRetail then
		if UnitInPartyIsAI(unit) then return end -- Exclude NPC Healers (Delve companion etc)
		local percent = format('%d', UnitPowerPercent(unit, nil, true, ScaleTo100))
		local color = Private.Tags.getPowerColor(unit)
		return color .. percent
	else
		local color = ElvUF_colors_power.MANA
		local min = UnitPower(unit, Enum.PowerType.Mana)
		local max = UnitPowerMax(unit, Enum.PowerType.Mana)
		if max == 0 then return end -- Avoid the "%inf" on frames

		return Hex(color.r, color.g, color.b) .. E:GetFormattedText('PERCENT', min, max, 0, nil)
	end
end)
E:AddTagInfo('luckyone:healermana:percent', Private.Name, L["Displays the unit's Mana with manacolor in percent (Role: Healer)"])

-------------------------------------------------------
------------------------ Names ------------------------
-------------------------------------------------------

-- Display name with classcolor/reactioncolor (Retail only)
if Private.isRetail then
	E:AddTag('luckyone:name-color', 'UNIT_NAME_UPDATE UNIT_FACTION INSTANCE_ENCOUNTER_ENGAGE_UNIT', function(unit)
		local name = UnitName(unit) or UNKNOWN

		local color = Private.Tags.getUnitColor(unit)
		return color .. name
	end)
	E:AddTagInfo('luckyone:name-color', Private.Name, L["Displays the name with classcolor/reactioncolor"])

	-- Display name with no color (Retail only)
	E:AddTag('luckyone:name-nocolor', 'UNIT_NAME_UPDATE INSTANCE_ENCOUNTER_ENGAGE_UNIT', function(unit)
		local name = UnitName(unit) or UNKNOWN
		return name
	end)
	E:AddTagInfo('luckyone:name-nocolor', Private.Name, L["Displays the name with no color"])
end

-- Displays the last part of the unit's name with class color (Classic only)
if not Private.isRetail then
	E:AddTag('luckyone:name:last-classcolor', 'UNIT_NAME_UPDATE UNIT_FACTION INSTANCE_ENCOUNTER_ENGAGE_UNIT', function(unit)
		local name = UnitName(unit)
		local color = Private.Tags.getUnitColor(unit)
		local formattedName = (name and Private.Tags.getLastNamePart(name)) or UNKNOWN

		return color .. formattedName
	end)
	E:AddTagInfo('luckyone:name:last-classcolor', Private.Name, L["Displays the last part of the unit's name with class color"])

	-- Displays the last part of the unit's name with no color (Classic only)
	E:AddTag('luckyone:name:last-nocolor', 'UNIT_NAME_UPDATE INSTANCE_ENCOUNTER_ENGAGE_UNIT', function(unit)
		local name = UnitName(unit)
		return Private.Tags.getLastNamePart(name) or UNKNOWN
	end)
	E:AddTagInfo('luckyone:name:last-nocolor', Private.Name, L["Displays the last part of the unit's name with no color"])
end

-------------------------------------------------------
------------------------ Level ------------------------
-------------------------------------------------------

if not Private.isRetail then
	E:AddTag('luckyone:level', 'UNIT_LEVEL PLAYER_LEVEL_UP', function(unit)
		local level = UnitEffectiveLevel(unit)
		local max = E:XPIsLevelMax()
		local color = GetCreatureDifficultyColor(level)

		return not max and Hex(color.r, color.g, color.b) .. ((level > 0) and level or '??')
	end)
	E:AddTagInfo('luckyone:level', Private.Name, L["Displays the unit's level with difficultycolor if the player is not max level"])
end

-------------------------------------------------------
------------------------ Target -----------------------
-------------------------------------------------------

-- Displays the unit's target name with class color
E:AddTag('luckyone:target:name-classcolor', 'UNIT_TARGET UNIT_FACTION', function(unit)
	return Private.Tags.formatTargetName(unit, false, true)
end)
E:AddTagInfo('luckyone:target:name-classcolor', Private.Name, L["Displays the unit's target name with class color"])

-- Displays the unit's target name with no color
E:AddTag('luckyone:target:name-nocolor', 'UNIT_TARGET', function(unit)
	return Private.Tags.formatTargetName(unit, false, false)
end)
E:AddTagInfo('luckyone:target:name-nocolor', Private.Name, L["Displays the unit's target name with no color"])

-- Displays the last part of the unit's target name with class color (Classic only)
if not Private.isRetail then
	E:AddTag('luckyone:target:last-classcolor', 'UNIT_TARGET UNIT_FACTION', function(unit)
		return Private.Tags.formatTargetName(unit, true, true)
	end)
	E:AddTagInfo('luckyone:target:last-classcolor', Private.Name, L["Displays the last part of the unit's target name with class color"])

	-- Displays the last part of the unit's target name with no color (Classic only)
	E:AddTag('luckyone:target:last-nocolor', 'UNIT_TARGET', function(unit)
		return Private.Tags.formatTargetName(unit, true, false)
	end)
	E:AddTagInfo('luckyone:target:last-nocolor', Private.Name, L["Displays the last part of the unit's target name with no color"])
end

-------------------------------------------------------
---------------------- Pet Frame ----------------------
-------------------------------------------------------

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

-------------------------------------------------------
------------------- Name Formatting -------------------
-------------------------------------------------------

if Private.isRetail then
	for textFormat, length in pairs({ veryshort = 5, short = 10, medium = 15, long = 20 }) do
		-- Displays the unit's name with classcolor and a maximum length (friendly only) or full name (if enemy)
		E:AddTag('luckyone:name:' .. textFormat .. '-color-friendly', 'UNIT_NAME_UPDATE UNIT_FACTION INSTANCE_ENCOUNTER_ENGAGE_UNIT', function(unit)
			local friend = UnitIsFriend(unit, 'player')
			local name = UnitName(unit) or UNKNOWN
			if E:IsSecretValue(name) then return name end

			return (friend and Private.Tags.getFormattedName(unit, length, true)) or name
		end)
		-- Displays the unit's name with no color and a maximum length (friendly only) or full name (if enemy)
		E:AddTag('luckyone:name:' .. textFormat .. '-nocolor-friendly', 'UNIT_NAME_UPDATE UNIT_FACTION INSTANCE_ENCOUNTER_ENGAGE_UNIT', function(unit)
			local friend = UnitIsFriend(unit, 'player')
			local name = UnitName(unit) or UNKNOWN
			if E:IsSecretValue(name) then return name end

			return (friend and Private.Tags.getFormattedName(unit, length, false)) or name
		end)
		-- Displays the unit's name (or status) with classcolor and a maximum length (friendly only) or full name (if enemy)
		E:AddTag('luckyone:name:' .. textFormat .. '-color-friendly:status', 'UNIT_HEALTH UNIT_NAME_UPDATE UNIT_FACTION INSTANCE_ENCOUNTER_ENGAGE_UNIT PLAYER_UPDATE_RESTING UNIT_CONNECTION PLAYER_FLAGS_CHANGED', function(unit)
			local status = UnitIsDead(unit) and L["DEAD"] or UnitIsGhost(unit) and L["GHOST"] or not UnitIsConnected(unit) and L["OFFLINE"]
			if status then return status end

			local friend = UnitIsFriend(unit, 'player')
			local name = UnitName(unit) or UNKNOWN
			if E:IsSecretValue(name) then return name end

			return (friend and Private.Tags.getFormattedName(unit, length, true)) or name
		end)
		-- Displays the unit's name (or status) with no color and a maximum length (friendly only) or full name (if enemy)
		E:AddTag('luckyone:name:' .. textFormat .. '-nocolor-friendly:status', 'UNIT_HEALTH UNIT_NAME_UPDATE UNIT_FACTION INSTANCE_ENCOUNTER_ENGAGE_UNIT PLAYER_UPDATE_RESTING UNIT_CONNECTION PLAYER_FLAGS_CHANGED', function(unit)
			local status = UnitIsDead(unit) and L["DEAD"] or UnitIsGhost(unit) and L["GHOST"] or not UnitIsConnected(unit) and L["OFFLINE"]
			if status then return status end

			local friend = UnitIsFriend(unit, 'player')
			local name = UnitName(unit) or UNKNOWN
			if E:IsSecretValue(name) then return name end

			return (friend and Private.Tags.getFormattedName(unit, length, false)) or name
		end)

		E:AddTagInfo('luckyone:name:' .. textFormat .. '-color-friendly', Private.Name, format(L["Displays the unit's name with classcolor and a maximum length of %s characters (friendly only) or full name (if enemy)"], length))
		E:AddTagInfo('luckyone:name:' .. textFormat .. '-nocolor-friendly', Private.Name, format(L["Displays the unit's name with no color and a maximum length of %s characters (friendly only) or full name (if enemy)"], length))
		E:AddTagInfo('luckyone:name:' .. textFormat .. '-color-friendly:status', Private.Name, format(L["Displays the unit's status (dead, ghost, offline) and name with classcolor and a maximum length of %s characters (friendly only) or full name (if enemy)"], length))
		E:AddTagInfo('luckyone:name:' .. textFormat .. '-nocolor-friendly:status', Private.Name, format(L["Displays the unit's status (dead, ghost, offline) and name with no color and a maximum length of %s characters (friendly only) or full name (if enemy)"], length))
	end
else
	for textFormat, length in pairs({ veryshort = 5, short = 10, medium = 15, long = 20 }) do
		-- Displays the unit's name with classcolor and a maximum length
		E:AddTag('luckyone:name:' .. textFormat .. '-classcolor', 'UNIT_NAME_UPDATE UNIT_FACTION INSTANCE_ENCOUNTER_ENGAGE_UNIT', function(unit)
			return Private.Tags.getFormattedName(unit, length, true)
		end)
		-- Displays the unit's name with no color and a maximum length
		E:AddTag('luckyone:name:' .. textFormat .. '-nocolor', 'UNIT_NAME_UPDATE INSTANCE_ENCOUNTER_ENGAGE_UNIT', function(unit)
			return Private.Tags.getFormattedName(unit, length, false)
		end)
		-- Displays the unit's name abbreviated with classcolor and a maximum length
		E:AddTag('luckyone:name:abbrev:' .. textFormat .. '-classcolor', 'UNIT_NAME_UPDATE UNIT_FACTION INSTANCE_ENCOUNTER_ENGAGE_UNIT', function(unit)
			return Private.Tags.getFormattedName(unit, length, true, true)
		end)
		-- Displays the unit's name abbreviated with no color and a maximum length
		E:AddTag('luckyone:name:abbrev:' .. textFormat .. '-nocolor', 'UNIT_NAME_UPDATE INSTANCE_ENCOUNTER_ENGAGE_UNIT', function(unit)
			return Private.Tags.getFormattedName(unit, length, false, true)
		end)

		E:AddTagInfo('luckyone:name:' .. textFormat .. '-classcolor', Private.Name, format(L["Displays the unit's name with classcolor and a maximum length of %s characters"], length))
		E:AddTagInfo('luckyone:name:' .. textFormat .. '-nocolor', Private.Name, format(L["Displays the unit's name with no color and a maximum length of %s characters"], length))
		E:AddTagInfo('luckyone:name:abbrev:' .. textFormat .. '-classcolor', Private.Name, format(L["Displays the unit's name with classcolor and a maximum length of %s characters and abbreviates long names"], length))
		E:AddTagInfo('luckyone:name:abbrev:' .. textFormat .. '-nocolor', Private.Name, format(L["Displays the unit's name with no color and a maximum length of %s characters and abbreviates long names"], length))
	end
end
