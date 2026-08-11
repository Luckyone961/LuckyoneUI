-- Addon namespace
local _, Private = ...
local L = Private.Libs.ACL

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
local wipe = table.wipe

-- API cache
local GenerateTextColorCode = C_ColorUtil and C_ColorUtil.GenerateTextColorCode
local GetClassColor = C_ClassColor and C_ClassColor.GetClassColor
local hooksecurefunc = hooksecurefunc
local issecretvalue = issecretvalue
local WrapString = C_StringUtil and C_StringUtil.WrapString
local WrapTextInColor = C_ColorUtil and C_ColorUtil.WrapTextInColor
local UnitClass = UnitClass
local UnitInPartyIsAI = UnitInPartyIsAI
local UnitIsConnected = UnitIsConnected
local UnitIsDead = UnitIsDead
local UnitIsGhost = UnitIsGhost
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
local DEAD, GHOST, OFFLINE = L["DEAD"], L["GHOST"], L["OFFLINE"]

Private.Tags.classificationText = {
	rare = 'Rare',
	rareelite = 'Rare Elite',
	elite = 'Elite',
	worldboss = 'Boss'
}

-- Status check (dead, ghost, offline)
function Private.Tags.getUnitStatus(unit)
	return UnitIsDead(unit) and DEAD or UnitIsGhost(unit) and GHOST or not UnitIsConnected(unit) and OFFLINE
end

-- Color table or r, g, b values to a hex escape code
local Hex
if Private.isRetail then
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

Private.Tags.Hex = Hex

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
local powerHexCache = setmetatable({}, { __index = function(t, token)
	local color = ElvUF_colors_power[token]
	if color then
		local hex = Hex(color)
		t[token] = hex
		return hex
	end
end})

local powerTypeHexCache = setmetatable({}, { __index = function(t, pType)
	local hex = Hex(ElvUF_colors_power[pType] or ElvUF_colors_power.MANA)
	t[pType] = hex
	return hex
end})

-- Wipe hex caches when ElvUI media updates so color changes apply without a reload
function Private.Tags.WipeCaches()
	wipe(classHexCache)
	wipe(reactionHexCache)
	wipe(powerHexCache)
	wipe(powerTypeHexCache)
end

hooksecurefunc(E, 'UpdateMedia', Private.Tags.WipeCaches)

-- Class color for players, reaction color for NPCs
-- Retail will not touch any tables if secrets exist
if Private.isRetail then
	function Private.Tags.getUnitColor(unit)
		if UnitIsPlayer(unit) or UnitInPartyIsAI(unit) then
			local _, unitClass = UnitClass(unit)
			if unitClass and not issecretvalue(unitClass) then
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
else
	function Private.Tags.getUnitColor(unit)
		if UnitIsPlayer(unit) then
			local _, unitClass = UnitClass(unit)
			if unitClass then
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
end

local getUnitColor = Private.Tags.getUnitColor

-- The passed name arg is already checked for secrets
if Private.isRetail then
	function Private.Tags.getFormattedName(unit, length, color, abbrev, name)
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
else
	function Private.Tags.getFormattedName(unit, length, color, abbrev, name)
		name = name or UnitName(unit) or UNKNOWN

		if name ~= UNKNOWN then
			if abbrev then
				name = Abbrev(name)
			end
			name = E:ShortenString(name, length)
		end

		if not color then return name end

		return getUnitColor(unit) .. name
	end
end

function Private.Tags.getPowerColor(unit)
	local pType, pToken, altR, altG, altB = UnitPowerType(unit)

	if pToken then
		local hex = powerHexCache[pToken]
		if hex then return hex end
	end

	if altR then
		if altR > 1 or altG > 1 or altB > 1 then
			return Hex(altR / 255, altG / 255, altB / 255)
		end

		return Hex(altR, altG, altB)
	end

	return powerTypeHexCache[pType or 0]
end

function Private.Tags.getLastNamePart(name)
	if not name then return name end
	return strmatch(name, '([%S]+)$') or name
end

local getLastNamePart = Private.Tags.getLastNamePart

if Private.isRetail then
	function Private.Tags.formatTargetName(unit, lastPartOnly, withColor)
		local targetUnit = targetUnits[unit]

		local targetName = UnitName(targetUnit)
		if not targetName then return end
		if issecretvalue(targetName) then
			if not withColor then return targetName end

			-- Class color for players, secret class tokens go through C_ClassColor
			if UnitIsPlayer(targetUnit) or UnitInPartyIsAI(targetUnit) then
				local _, classToken = UnitClass(targetUnit)
				if issecretvalue(classToken) then
					return WrapTextInColor(targetName, GetClassColor(classToken))
				end
			end

			-- Non-secret color paths (reaction / cached class / fallback grey)
			return WrapString(targetName, getUnitColor(targetUnit), '|r')
		end

		if lastPartOnly then
			targetName = getLastNamePart(targetName)
		end

		return withColor and (getUnitColor(targetUnit) .. targetName) or targetName
	end
else
	function Private.Tags.formatTargetName(unit, lastPartOnly, withColor)
		local targetUnit = targetUnits[unit]

		local targetName = UnitName(targetUnit)
		if not targetName then return end

		if lastPartOnly then
			targetName = getLastNamePart(targetName)
		end

		return withColor and (getUnitColor(targetUnit) .. targetName) or targetName
	end
end
