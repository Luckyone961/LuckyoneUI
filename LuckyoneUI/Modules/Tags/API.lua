-- Addon namespace
local _, Private = ...

-- ElvUI file
if not Private.ElvUI then
	return
end

Private.Tags = Private.Tags or {}

-- Lua functions
local format = string.format
local strfind = string.find
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
			local cs = ElvUF_colors_class[unitClass]
			if cs then
				return Hex(cs.r, cs.g, cs.b)
			end
		end
	else
		local reaction = UnitReaction(unit, 'player')
		if reaction then
			local cr = ElvUF_colors_reaction[reaction]
			if cr then
				return Hex(cr.r, cr.g, cr.b)
			end
		end
	end

	return DEFAULT_COLOR
end

function Private.Tags.getFormattedName(unit, length, color, abbrev)
	local name = UnitName(unit) or UNKNOWN

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

	return Private.Tags.getUnitColor(unit) .. name
end

function Private.Tags.getPowerColor(unit)
	local pType, pToken, altR, altG, altB = UnitPowerType(unit)
	local color = ElvUF_colors_power[pToken]

	if not color then
		if altR then
			if altR > 1 or altG > 1 or altB > 1 then
				color = Hex(altR / 255, altG / 255, altB / 255)
			else
				color = Hex(altR, altG, altB)
			end
		else
			color = Hex(ElvUF_colors_power[pType] or ElvUF_colors_power.MANA)
		end
	else
		color = Hex(color)
	end

	return color
end

function Private.Tags.getLastNamePart(name)
	if not name then return name end
	if not strfind(name, '%s') then return name end
	return strmatch(name, '([%S]+)$')
end

function Private.Tags.formatTargetName(unit, lastPartOnly, withColor)
	local targetName = UnitName(unit..'target')
	if not targetName then return end

	if lastPartOnly then
		targetName = Private.Tags.getLastNamePart(targetName)
	end

	return withColor and (Private.Tags.getUnitColor(unit..'target')..targetName) or targetName
end
