-- Addon namespace
local _, Private = ...

-- ElvUI file
if not Private.ElvUI then
	return
end

Private.Tags = Private.Tags or {}

-- Lua functions
local format = string.format
local setmetatable = setmetatable
local strmatch = string.match
local type = type
local unpack = unpack

-- API cache
local GenerateTextColorCode = C_ColorUtil and C_ColorUtil.GenerateTextColorCode
local UnitClass = UnitClass
local UnitInPartyIsAI = UnitInPartyIsAI
local UnitIsPlayer = UnitIsPlayer
local UnitName = UnitName
local UnitPowerType = UnitPowerType
local UnitReaction = UnitReaction

-- Global strings
local UNKNOWN = UNKNOWN

-- ElvUI modules
local E = unpack(ElvUI)
local Abbrev = ElvUF.Tags.Env.Abbrev

local ElvUF_colors_class = ElvUF.colors.class
local ElvUF_colors_power = ElvUF.colors.power
local ElvUF_colors_reaction = ElvUF.colors.reaction

-- Constants
local DEFAULT_COLOR = '|cFFcccccc'

-- Static color tables
local classHexCache = {}
local reactionHexCache = {}
local powerHexCache = {}
local powerTypeHexCache = {}

-- Avoids a concat per tag call
local targetUnits = setmetatable({}, { __index = function(t, unit)
	local targetUnit = unit .. 'target'
	t[unit] = targetUnit
	return targetUnit
end})

Private.Tags.classificationText = {
	rare = 'Rare',
	rareelite = 'Rare Elite',
	elite = 'Elite',
	worldboss = 'Boss'
}

function Private.Tags.Hex(r, g, b)
	if type(r) == 'table' then
		if Private.isRetail then
			return '|c' .. GenerateTextColorCode(r)
		elseif r.r then
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

local Hex = Private.Tags.Hex

function Private.Tags.getUnitColor(unit)
	if UnitIsPlayer(unit) or (Private.isRetail and UnitInPartyIsAI(unit)) then
		local _, unitClass = UnitClass(unit)
		if unitClass then
			local hex = classHexCache[unitClass]
			if not hex then
				local cs = ElvUF_colors_class[unitClass]
				if cs then
					hex = Hex(cs.r, cs.g, cs.b)
					classHexCache[unitClass] = hex
				end
			end
			if hex then return hex end
		end
	else
		local reaction = UnitReaction(unit, 'player')
		if reaction then
			local hex = reactionHexCache[reaction]
			if not hex then
				local cr = ElvUF_colors_reaction[reaction]
				if cr then
					hex = Hex(cr.r, cr.g, cr.b)
					reactionHexCache[reaction] = hex
				end
			end
			if hex then return hex end
		end
	end

	return DEFAULT_COLOR
end

local getUnitColor = Private.Tags.getUnitColor

function Private.Tags.getFormattedName(unit, length, color, abbrev, name)
	name = name or UnitName(unit) or UNKNOWN

	if E:IsSecretValue(name) then
		return name
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

function Private.Tags.getPowerColor(unit)
	local pType, pToken, altR, altG, altB = UnitPowerType(unit)

	if pToken then
		local cached = powerHexCache[pToken]
		if cached then return cached end
	end

	local color = ElvUF_colors_power[pToken]
	local hex

	if not color then
		if altR then
			if altR > 1 or altG > 1 or altB > 1 then
				hex = Hex(altR / 255, altG / 255, altB / 255)
			else
				hex = Hex(altR, altG, altB)
			end
		else
			hex = pType and powerTypeHexCache[pType]
			if not hex then
				hex = Hex(ElvUF_colors_power[pType] or ElvUF_colors_power.MANA)
				if pType then
					powerTypeHexCache[pType] = hex
				end
			end
		end
	else
		hex = Hex(color)
	end

	if pToken then
		powerHexCache[pToken] = hex
	end

	return hex
end

function Private.Tags.getLastNamePart(name)
	if not name then return name end
	return strmatch(name, '([%S]+)$') or name
end

local getLastNamePart = Private.Tags.getLastNamePart

function Private.Tags.formatTargetName(unit, lastPartOnly, withColor)
	local targetUnit = targetUnits[unit]

	local targetName = UnitName(targetUnit)
	if not targetName then return end

	if lastPartOnly then
		targetName = getLastNamePart(targetName)
	end

	return withColor and (getUnitColor(targetUnit)..targetName) or targetName
end
