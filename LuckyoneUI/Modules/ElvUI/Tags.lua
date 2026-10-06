local _, Private = ...
local L = Private.L

if not Private.ElvUI then
	return
end

local floor = floor
local format = string.format
local pairs = pairs
local setmetatable = setmetatable
local strfind = string.find
local strmatch = string.match
local type = type
local unpack = unpack
local wipe = table.wipe

local GenerateTextColorCode = C_ColorUtil.GenerateTextColorCode
local GetClassColor = C_ClassColor.GetClassColor
local GetCreatureDifficultyColor = GetCreatureDifficultyColor
local GetPetHappiness = (C_PetInfo and C_PetInfo.GetPetHappiness) or GetPetHappiness
local HasPetUI = HasPetUI
local hooksecurefunc = hooksecurefunc
local issecretvalue = issecretvalue
local ScaleTo100 = CurveConstants.ScaleTo100
local TruncateWhenZero = C_StringUtil.TruncateWhenZero
local UnitClass = UnitClass
local UnitClassification = UnitClassification
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
local UnitIsPlayer = UnitIsPlayer
local UnitLevel = UnitLevel
local UnitName = UnitName
local UnitPower = UnitPower
local UnitPowerMax = UnitPowerMax
local UnitPowerPercent = UnitPowerPercent
local UnitPowerType = UnitPowerType
local UnitReaction = UnitReaction
local WrapString = C_StringUtil.WrapString

local QuestDifficultyColors = QuestDifficultyColors
local UNKNOWN = UNKNOWN

local E = unpack(ElvUI)
local NP = E:GetModule('NamePlates')
local UF = E:GetModule('UnitFrames')
local Abbrev = ElvUF.Tags.Env.Abbrev

local ElvUF_colors_class = ElvUF.colors.class
local ElvUF_colors_power = ElvUF.colors.power
local ElvUF_colors_reaction = ElvUF.colors.reaction

local POWERTYPE_MANA = Enum.PowerType.Mana

local DEFAULT_COLOR = '|cFFcccccc'
local DEAD, GHOST, OFFLINE = L["DEAD"], L["GHOST"], L["OFFLINE"]

local classificationText = {
	rare = L["Rare"],
	rareelite = L["Rare Elite"],
	elite = L["Elite"],
	worldboss = L["Boss"]
}

-- Status check (dead, ghost, offline)
local function getUnitStatus(unit)
	return UnitIsDead(unit) and DEAD or UnitIsGhost(unit) and GHOST or not UnitIsConnected(unit) and OFFLINE
end

-- Color table or r, g, b values to a hex escape code
local Hex
if Private.isModern then
	function Hex(r, g, b)
		if type(r) == 'table' then
			return '|c' .. GenerateTextColorCode(r)
		end

		if type(r) == 'number' and g and b then
			return format('|cff%02x%02x%02x', r * 255, g * 255, b * 255)
		end

		return '|cffFFFFFF'
	end
else
	function Hex(r, g, b)
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
end

-- Avoids a concat per tag call
local targetUnits = setmetatable({}, { __index = function(t, unit)
	local targetUnit = unit .. 'target'
	t[unit] = targetUnit
	return targetUnit
end})

-- Lazily built hex caches
local classHexCache = setmetatable({}, { __index = function(t, token)
	local cs = ElvUF_colors_class[token]
	local hex = cs and Hex(cs.r, cs.g, cs.b) or DEFAULT_COLOR
	t[token] = hex
	return hex
end})

local reactionHexCache = setmetatable({}, { __index = function(t, reaction)
	local cr = ElvUF_colors_reaction[reaction]
	local hex = cr and Hex(cr.r, cr.g, cr.b) or DEFAULT_COLOR
	t[reaction] = hex
	return hex
end})

-- Static power token colors only, alternate colors are unit specific and never cached
-- Tokens without a color cache as false so misses do not rebuild every call
local powerHexCache = setmetatable({}, { __index = function(t, token)
	local color = ElvUF_colors_power[token]
	local hex = color and Hex(color) or false
	t[token] = hex
	return hex
end})

local powerTypeHexCache = setmetatable({}, { __index = function(t, pType)
	local hex = Hex(ElvUF_colors_power[pType] or ElvUF_colors_power.MANA)
	t[pType] = hex
	return hex
end})

-- Wipe hex caches when ElvUI media or unitframe colors update so color changes apply without a reload
local function WipeCaches()
	wipe(classHexCache)
	wipe(reactionHexCache)
	wipe(powerHexCache)
	wipe(powerTypeHexCache)
end

hooksecurefunc(E, 'UpdateMedia', WipeCaches)
hooksecurefunc(UF, 'UpdateColors', WipeCaches)

-- Class color for players, reaction color for NPCs
-- Secret class tokens (identity restricted units, e.g. a group member as targettarget of an NPC) go through C_ClassColor
local function getUnitColor(unit)
	if UnitIsPlayer(unit) or UnitInPartyIsAI(unit) then
		local _, unitClass = UnitClass(unit)
		if issecretvalue(unitClass) then
			local color = GetClassColor(unitClass)
			if color then
				return Hex(color)
			end
		elseif unitClass then
			return classHexCache[unitClass]
		end
	else
		local reaction = UnitReaction(unit, 'player')
		if reaction then
			return reactionHexCache[reaction]
		end
	end

	return DEFAULT_COLOR
end

-- Name arg is already secret-checked
local function getFormattedName(unit, length, color, abbrev, name)
	if not name then
		name = UnitName(unit) or UNKNOWN
		if issecretvalue(name) then
			return name
		end
	end

	if name ~= UNKNOWN then
		if abbrev then
			name = Abbrev(name)
		end
		name = E:ShortenString(name, length)
	end

	if not color then return name end

	return getUnitColor(unit) .. name
end

local function getPowerColor(unit)
	local pType, pToken, altR, altG, altB = UnitPowerType(unit)

	local hex = pToken and powerHexCache[pToken]
	if hex then return hex end

	if altR then
		if altR > 1 or altG > 1 or altB > 1 then
			return Hex(altR / 255, altG / 255, altB / 255)
		end

		return Hex(altR, altG, altB)
	end

	return powerTypeHexCache[pType or 0]
end

local function getLastNamePart(name)
	return name and (strmatch(name, '(%S+)$') or name)
end

local function formatTargetName(unit, lastPartOnly, withColor)
	local targetUnit = targetUnits[unit]

	local targetName = UnitName(targetUnit)
	if not targetName then return end

	if issecretvalue(targetName) then
		if not withColor then return targetName end

		return WrapString(targetName, getUnitColor(targetUnit), '|r')
	end

	if lastPartOnly then
		targetName = getLastNamePart(targetName)
	end

	return withColor and (getUnitColor(targetUnit) .. targetName) or targetName
end

-------------------------------------------------------
-------------------- Classification -------------------
-------------------------------------------------------

-- Display unit classification without 'affix' on minor enemies
E:AddTag('luckyone:classification', 'UNIT_CLASSIFICATION_CHANGED', function(unit)
	return classificationText[UnitClassification(unit)]
end)
E:AddTagInfo('luckyone:classification', Private.Name, L["Displays the unit's classification (e.g 'Elite' and 'Rare') but without 'Affix'"])

-------------------------------------------------------
------------------------ Health -----------------------
-------------------------------------------------------

-- Display percentage health
if Private.isModern then
	E:AddTag('luckyone:health:percent', 'UNIT_HEALTH UNIT_MAXHEALTH', function(unit)
		return format('%d', UnitHealthPercent(unit, true, ScaleTo100))
	end)
	E:AddTagInfo('luckyone:health:percent', Private.Name, L["Displays percentage health without decimals"])

	-- Display current health abbreviated (Retail only)
	E:AddTag('luckyone:health:current:shortvalue', 'UNIT_HEALTH UNIT_MAXHEALTH', function(unit)
		return E:AbbreviateNumbers(UnitHealth(unit), E.Abbreviate.short)
	end)
	E:AddTagInfo('luckyone:health:current:shortvalue', Private.Name, L["Displays the short value of the current health (Examples: 156.4k, 1.62M, 1.75B)"])
else
	E:AddTag('luckyone:health:percent', 'UNIT_HEALTH UNIT_MAXHEALTH', function(unit)
		local maxHealth = UnitHealthMax(unit)
		if maxHealth == 0 then return end

		local percent = UnitHealth(unit) / maxHealth * 100
		if percent == 100 then return format('%.0f%%', percent) end

		return format(percent < 10 and '%.2f%%' or '%.1f%%', percent)
	end)
	E:AddTagInfo('luckyone:health:percent', Private.Name, L["Displays percentage health with 1 decimal below 100%, 2 decimals below 10% and hides decimals at 100%"])

	-- Shared by both absorb tags (Hidden on Era/HC/Seasonal)
	local function getAbsorbPercent(unit)
		local maxHealth = UnitHealthMax(unit)
		if maxHealth == 0 then return end

		return format('%.0f%%', (UnitHealth(unit) + (UnitGetTotalAbsorbs(unit) or 0)) / maxHealth * 100)
	end

	-- Display percentage health with absorb values, without decimals
	E:AddTag('luckyone:health:percent-with-absorbs', 'UNIT_HEALTH UNIT_MAXHEALTH UNIT_ABSORB_AMOUNT_CHANGED UNIT_CONNECTION PLAYER_FLAGS_CHANGED', function(unit)
		return getUnitStatus(unit) or getAbsorbPercent(unit)
	end, Private.isClassic)
	E:AddTagInfo('luckyone:health:percent-with-absorbs', Private.Name, L["Displays the unit's current health as a percentage with absorb values, without decimals"], nil, Private.isClassic)

	-- Display percentage health with absorb values, without decimals and without status
	E:AddTag('luckyone:health:percent-with-absorbs:nostatus', 'UNIT_HEALTH UNIT_MAXHEALTH UNIT_ABSORB_AMOUNT_CHANGED UNIT_CONNECTION PLAYER_FLAGS_CHANGED', getAbsorbPercent, Private.isClassic)
	E:AddTagInfo('luckyone:health:percent-with-absorbs:nostatus', Private.Name, L["Displays the unit's current health as a percentage with absorb values, without decimals and without status"], nil, Private.isClassic)
end

-------------------------------------------------------
------------------------ Power ------------------------
-------------------------------------------------------

-- Display percentage power with powercolor / with no color, hidden when empty or full
if Private.isModern then
	-- Floors to 0-99 and maps full to 0, so TruncateWhenZero hides both ends
	local hideFullCurve = C_CurveUtil.CreateCurve()
	hideFullCurve:SetType(Enum.LuaCurveType.Step)
	for i = 0, 99 do
		hideFullCurve:AddPoint(i / 100, i)
	end
	hideFullCurve:AddPoint(1, 0)

	-- nil instead of an empty string so oUF skips the suffix, an empty secret is dropped by oUF's WrapString
	E:AddTag('luckyone:power:percent-color', 'UNIT_MAXPOWER UNIT_POWER_FREQUENT UNIT_DISPLAYPOWER', function(unit)
		local text = TruncateWhenZero(UnitPowerPercent(unit, nil, true, hideFullCurve))
		if issecretvalue(text) or text ~= '' then return WrapString(text, getPowerColor(unit)) end
	end)

	E:AddTag('luckyone:power:percent-nocolor', 'UNIT_MAXPOWER UNIT_POWER_FREQUENT UNIT_DISPLAYPOWER', function(unit)
		local text = TruncateWhenZero(UnitPowerPercent(unit, nil, true, hideFullCurve))
		if issecretvalue(text) or text ~= '' then return text end
	end)
else
	E:AddTag('luckyone:power:percent-color', 'UNIT_MAXPOWER UNIT_POWER_FREQUENT UNIT_DISPLAYPOWER', function(unit)
		local min, max = UnitPower(unit), UnitPowerMax(unit)
		if max == 0 or min == max then return end

		local percentage = floor(min / max * 100 + .5)

		if percentage ~= 0 then
			return getPowerColor(unit) .. percentage
		end
	end)

	E:AddTag('luckyone:power:percent-nocolor', 'UNIT_MAXPOWER UNIT_POWER_FREQUENT UNIT_DISPLAYPOWER', function(unit)
		local min, max = UnitPower(unit), UnitPowerMax(unit)
		if min ~= 0 and max ~= 0 and min ~= max then
			return floor(min / max * 100 + .5)
		end
	end)

	-- Display percentage mana with 0 decimals (Classic only)
	E:AddTag('luckyone:mana:percent', 'UNIT_MAXPOWER UNIT_POWER_FREQUENT UNIT_DISPLAYPOWER', function(unit)
		local max = UnitPowerMax(unit, POWERTYPE_MANA)
		if max == 0 then return end -- Avoid the "%inf" on frames

		return format('%.0f%%', UnitPower(unit, POWERTYPE_MANA) / max * 100)
	end)
	E:AddTagInfo('luckyone:mana:percent', Private.Name, L["Displays percentage mana without decimals"])
end
E:AddTagInfo('luckyone:power:percent-color', Private.Name, L["Displays percentage power without decimals with powercolor"])
E:AddTagInfo('luckyone:power:percent-nocolor', Private.Name, L["Displays percentage power without decimals with no color"])

-------------------------------------------------------
--------------------- Healer Mana ---------------------
-------------------------------------------------------

-- Display mana (percent) if the unit is flagged healer
if Private.isModern then
	ElvUF.Tags.SharedEvents.PLAYER_ROLES_ASSIGNED = true -- carries no unit

	E:AddTag('luckyone:healermana:percent', 'UNIT_MAXPOWER UNIT_POWER_FREQUENT UNIT_DISPLAYPOWER GROUP_ROSTER_UPDATE PLAYER_ROLES_ASSIGNED', function(unit)
		local role = UnitGroupRolesAssigned(unit)
		if issecretvalue(role) or role ~= 'HEALER' then return end
		if UnitInPartyIsAI(unit) then return end -- Exclude NPC Healers (Delve companion etc)

		return powerHexCache.MANA .. format('%d', UnitPowerPercent(unit, POWERTYPE_MANA, true, ScaleTo100))
	end)
else
	-- Display mana (current) if the unit is flagged healer (Classic only)
	E:AddTag('luckyone:healermana:current', 'UNIT_MAXPOWER UNIT_POWER_FREQUENT UNIT_DISPLAYPOWER', function(unit)
		if UnitGroupRolesAssigned(unit) ~= 'HEALER' then return end

		return powerHexCache.MANA .. UnitPower(unit, POWERTYPE_MANA)
	end)
	E:AddTagInfo('luckyone:healermana:current', Private.Name, L["Displays the unit's Mana with manacolor (Role: Healer)"])

	E:AddTag('luckyone:healermana:percent', 'UNIT_MAXPOWER UNIT_POWER_FREQUENT UNIT_DISPLAYPOWER', function(unit)
		if UnitGroupRolesAssigned(unit) ~= 'HEALER' then return end

		local max = UnitPowerMax(unit, POWERTYPE_MANA)
		if max == 0 then return end -- Avoid the "%inf" on frames

		return powerHexCache.MANA .. format('%.0f%%', UnitPower(unit, POWERTYPE_MANA) / max * 100)
	end)
end
E:AddTagInfo('luckyone:healermana:percent', Private.Name, L["Displays the unit's Mana with manacolor in percent (Role: Healer)"])

-------------------------------------------------------
------------------------ Names ------------------------
-------------------------------------------------------

if Private.isModern then
	-- Display name with classcolor/reactioncolor (Retail only)
	E:AddTag('luckyone:name-color', 'UNIT_NAME_UPDATE UNIT_FACTION INSTANCE_ENCOUNTER_ENGAGE_UNIT', function(unit)
		return getUnitColor(unit) .. (UnitName(unit) or UNKNOWN)
	end)
	E:AddTagInfo('luckyone:name-color', Private.Name, L["Displays the name with classcolor/reactioncolor"])

	-- Display name with no color
	E:AddTag('luckyone:name-nocolor', 'UNIT_NAME_UPDATE INSTANCE_ENCOUNTER_ENGAGE_UNIT', function(unit)
		return UnitName(unit) or UNKNOWN
	end)
	E:AddTagInfo('luckyone:name-nocolor', Private.Name, L["Displays the name with no color"])
else
	-- Displays the last part of the unit's name with class color (Classic only)
	E:AddTag('luckyone:name:last-classcolor', 'UNIT_NAME_UPDATE UNIT_FACTION INSTANCE_ENCOUNTER_ENGAGE_UNIT', function(unit)
		return getUnitColor(unit) .. (getLastNamePart(UnitName(unit)) or UNKNOWN)
	end)
	E:AddTagInfo('luckyone:name:last-classcolor', Private.Name, L["Displays the last part of the unit's name with class color"])

	-- Displays the last part of the unit's name with no color (Classic only)
	E:AddTag('luckyone:name:last-nocolor', 'UNIT_NAME_UPDATE INSTANCE_ENCOUNTER_ENGAGE_UNIT', function(unit)
		return getLastNamePart(UnitName(unit)) or UNKNOWN
	end)
	E:AddTagInfo('luckyone:name:last-nocolor', Private.Name, L["Displays the last part of the unit's name with no color"])
end

-------------------------------------------------------
------------------------ Level ------------------------
-------------------------------------------------------

if not Private.isRetail then
	E:AddTag('luckyone:level', 'UNIT_LEVEL PLAYER_LEVEL_UP', function(unit)
		if E:XPIsLevelMax() then return end

		local level = UnitLevel(unit)
		local color = (level > 0) and GetCreatureDifficultyColor(level) or QuestDifficultyColors.impossible

		return Hex(color.r, color.g, color.b) .. ((level > 0) and level or '??')
	end)
	E:AddTagInfo('luckyone:level', Private.Name, L["Displays the unit's level with difficultycolor if the player is not max level"])
end

-------------------------------------------------------
------------------------ Target -----------------------
-------------------------------------------------------

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

-- Displays the last part of the unit's target name with class color (Classic only)
if not Private.isModern then
	E:AddTag('luckyone:target:last-classcolor', 'UNIT_TARGET UNIT_FACTION', function(unit)
		return formatTargetName(unit, true, true)
	end)
	E:AddTagInfo('luckyone:target:last-classcolor', Private.Name, L["Displays the last part of the unit's target name with class color"])

	-- Displays the last part of the unit's target name with no color (Classic only)
	E:AddTag('luckyone:target:last-nocolor', 'UNIT_TARGET', function(unit)
		return formatTargetName(unit, true, false)
	end)
	E:AddTagInfo('luckyone:target:last-nocolor', Private.Name, L["Displays the last part of the unit's target name with no color"])
end

-------------------------------------------------------
---------------------- Pet Frame ----------------------
-------------------------------------------------------

-- Hunter pet happiness status (Classic/TBC/Forever only), 'Pet' for everything else
if Private.isClassic or Private.isTBC or Private.isForever then
	local happinessColors = ElvUF.colors.happiness
	local happinessStrings = { PET_HAPPINESS1, PET_HAPPINESS2, PET_HAPPINESS3 } -- [1] "Unhappy", [2] "Content", [3] "Happy"

	E:AddTag('luckyone:pet:name-and-happiness', 'UNIT_NAME_UPDATE UNIT_HAPPINESS PET_UI_UPDATE', function(unit)
		local hasPetUI, isHunterPet = HasPetUI()
		-- E:UnitIsUnit returns nil instead of a secret when the comparison is restricted (Forever)
		if hasPetUI and isHunterPet and E:UnitIsUnit('pet', unit) then
			local petHappiness = GetPetHappiness()
			if petHappiness then -- Return for Hunters
				return Hex(happinessColors[petHappiness]) .. happinessStrings[petHappiness]
			end
		end

		-- Other Pet Classes, Shadowfiend and others
		return L["Pet"]
	end)
else
	E:AddTag('luckyone:pet:name-and-happiness', 'UNIT_NAME_UPDATE PET_UI_UPDATE', function()
		return L["Pet"]
	end)
end
E:AddTagInfo('luckyone:pet:name-and-happiness', Private.Name, L["Displays the hunter pet's happiness status on Vanilla and TBC, 'Pet' otherwise"])

-------------------------------------------------------
------------------- Name Formatting -------------------
-------------------------------------------------------

if Private.isModern then
	-- Maximum length with classcolor or no color (friendly only), full name (if enemy), secret names pass through for display
	local function buildNameTag(length, withColor)
		return function(unit)
			local name = UnitName(unit) or UNKNOWN
			if issecretvalue(name) then return name end

			if UnitIsFriend(unit, 'player') then
				return getFormattedName(unit, length, withColor, nil, name)
			end

			return name
		end
	end

	-- Same as buildNameTag but shows the unit's status (dead, ghost, offline) instead of the name
	local function buildNameStatusTag(length, withColor)
		local nameTag = buildNameTag(length, withColor)

		return function(unit)
			return getUnitStatus(unit) or nameTag(unit)
		end
	end

	for textFormat, length in pairs({ veryshort = 5, short = 10, medium = 15, long = 20 }) do
		E:AddTag('luckyone:name:' .. textFormat .. '-color-friendly', 'UNIT_NAME_UPDATE UNIT_FACTION INSTANCE_ENCOUNTER_ENGAGE_UNIT', buildNameTag(length, true))
		E:AddTag('luckyone:name:' .. textFormat .. '-nocolor-friendly', 'UNIT_NAME_UPDATE UNIT_FACTION INSTANCE_ENCOUNTER_ENGAGE_UNIT', buildNameTag(length, false))
		E:AddTag('luckyone:name:' .. textFormat .. '-color-friendly:status', 'UNIT_HEALTH UNIT_NAME_UPDATE UNIT_FACTION INSTANCE_ENCOUNTER_ENGAGE_UNIT UNIT_CONNECTION PLAYER_FLAGS_CHANGED', buildNameStatusTag(length, true))
		E:AddTag('luckyone:name:' .. textFormat .. '-nocolor-friendly:status', 'UNIT_HEALTH UNIT_NAME_UPDATE UNIT_FACTION INSTANCE_ENCOUNTER_ENGAGE_UNIT UNIT_CONNECTION PLAYER_FLAGS_CHANGED', buildNameStatusTag(length, false))

		E:AddTagInfo('luckyone:name:' .. textFormat .. '-color-friendly', Private.Name, format(L["Displays the unit's name with classcolor and a maximum length of %s characters (friendly only) or full name (if enemy)"], length))
		E:AddTagInfo('luckyone:name:' .. textFormat .. '-nocolor-friendly', Private.Name, format(L["Displays the unit's name with no color and a maximum length of %s characters (friendly only) or full name (if enemy)"], length))
		E:AddTagInfo('luckyone:name:' .. textFormat .. '-color-friendly:status', Private.Name, format(L["Displays the unit's status (dead, ghost, offline) and name with classcolor and a maximum length of %s characters (friendly only) or full name (if enemy)"], length))
		E:AddTagInfo('luckyone:name:' .. textFormat .. '-nocolor-friendly:status', Private.Name, format(L["Displays the unit's status (dead, ghost, offline) and name with no color and a maximum length of %s characters (friendly only) or full name (if enemy)"], length))
	end
else
	-- Maximum length with classcolor or no color, optionally abbreviated
	local function buildNameTag(length, withColor, abbrev)
		return function(unit)
			return getFormattedName(unit, length, withColor, abbrev)
		end
	end

	for textFormat, length in pairs({ veryshort = 5, short = 10, medium = 15, long = 20 }) do
		E:AddTag('luckyone:name:' .. textFormat .. '-classcolor', 'UNIT_NAME_UPDATE UNIT_FACTION INSTANCE_ENCOUNTER_ENGAGE_UNIT', buildNameTag(length, true))
		E:AddTag('luckyone:name:' .. textFormat .. '-nocolor', 'UNIT_NAME_UPDATE INSTANCE_ENCOUNTER_ENGAGE_UNIT', buildNameTag(length, false))
		E:AddTag('luckyone:name:abbrev:' .. textFormat .. '-classcolor', 'UNIT_NAME_UPDATE UNIT_FACTION INSTANCE_ENCOUNTER_ENGAGE_UNIT', buildNameTag(length, true, true))
		E:AddTag('luckyone:name:abbrev:' .. textFormat .. '-nocolor', 'UNIT_NAME_UPDATE INSTANCE_ENCOUNTER_ENGAGE_UNIT', buildNameTag(length, false, true))

		E:AddTagInfo('luckyone:name:' .. textFormat .. '-classcolor', Private.Name, format(L["Displays the unit's name with classcolor and a maximum length of %s characters"], length))
		E:AddTagInfo('luckyone:name:' .. textFormat .. '-nocolor', Private.Name, format(L["Displays the unit's name with no color and a maximum length of %s characters"], length))
		E:AddTagInfo('luckyone:name:abbrev:' .. textFormat .. '-classcolor', Private.Name, format(L["Displays the unit's name with classcolor and a maximum length of %s characters and abbreviates long names"], length))
		E:AddTagInfo('luckyone:name:abbrev:' .. textFormat .. '-nocolor', Private.Name, format(L["Displays the unit's name with no color and a maximum length of %s characters and abbreviates long names"], length))
	end
end

-------------------------------------------------------
---------------- Name Shortening Hooks ----------------
-------------------------------------------------------

if Private.isModern then
	local cappedPlates = { ENEMY_NPC = true, ENEMY_PLAYER = true }
	local cappedUnits = { boss = true, focus = true, pet = true, target = true, targettarget = true }

	-- Cap secret name text width and let the client cut it with '...' at the end
	hooksecurefunc(UF, 'Configure_CustomTexts', function(_, frame)
		local text = cappedUnits[frame.unitframeType] and frame.customTexts.Luckyone_Name
		if not text then return end

		text:SetWidth(frame.UNIT_WIDTH * 0.99)
		text:SetWordWrap(false)
	end)

	-- Same for enemy nameplate names, plates get reused across types so everything else goes back to auto width
	hooksecurefunc(NP, 'Update_Tags', function(_, nameplate)
		local text = nameplate.Name
		local db = NP:PlateDB(nameplate)

		if cappedPlates[nameplate.frameType] and not db.nameOnly then
			local point = E.InversePoints[db.name.position]
			text:SetJustifyH((strfind(point, 'LEFT') and 'LEFT') or (strfind(point, 'RIGHT') and 'RIGHT') or 'CENTER')
			text:SetWidth(db.health.width * 0.8)
			text:SetWordWrap(false)
		else
			text:SetWidth(0)
		end
	end)
end
