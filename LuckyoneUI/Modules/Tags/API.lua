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
local UnitReaction = UnitReaction

-- Global strings
local UNKNOWN = UNKNOWN

-- ElvUI modules
local E = unpack(ElvUI)
local Abbrev = ElvUF.Tags.Env.Abbrev

local ElvUF_colors_class = ElvUF.colors.class
local ElvUF_colors_reaction = ElvUF.colors.reaction

function Private.Tags.Hex(r, g, b)
	if type(r) == 'table' then
		if Private.isMidnight then
			return '|c' .. GenerateTextColorCode(r)
		elseif(r.r) then
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

function Private.Tags.getFormattedName(unit, length, color, abbrev)
	local name = UnitName(unit) or UNKNOWN

	if name ~= UNKNOWN then
		if abbrev then
			name = Abbrev(name)
		end
		name = E:ShortenString(name, length)
	end

	if not color then return name end

	local colorHex = '|cFFcccccc' -- Default color

	if UnitIsPlayer(unit) or (Private.isRetail and UnitInPartyIsAI(unit)) then
		local _, unitClass = UnitClass(unit)
		if unitClass then
			local cs = ElvUF_colors_class[unitClass]
			if cs then
				colorHex = Private.Tags.Hex(cs.r, cs.g, cs.b)
			end
		end
	else
		local reaction = UnitReaction(unit, 'player')
		if reaction then
			local cr = ElvUF_colors_reaction[reaction]
			if cr then
				colorHex = Private.Tags.Hex(cr.r, cr.g, cr.b)
			end
		end
	end

	return colorHex .. name
end

function Private.Tags.getUnitColor(unit)
	local color = '|cFFcccccc'

	if UnitIsPlayer(unit) or (Private.isRetail and UnitInPartyIsAI(unit)) then
		local _, unitClass = UnitClass(unit)
		local cs = ElvUF_colors_class[unitClass]
		if cs then
			color = Private.Tags.Hex(cs.r, cs.g, cs.b)
		end
	else
		local cr = ElvUF_colors_reaction[UnitReaction(unit, 'player')]
		if cr then
			color = Private.Tags.Hex(cr.r, cr.g, cr.b)
		end
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

	if lastPartOnly and strfind(targetName, '%s') then
		targetName = strmatch(targetName, '([%S]+)$')
	end

	return withColor and (Private.Tags.getUnitColor(unit..'target')..targetName) or targetName
end
