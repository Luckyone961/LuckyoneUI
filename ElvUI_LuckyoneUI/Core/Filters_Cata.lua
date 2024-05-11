local Name, Private = ...
local E, L, V, P, G = unpack(ElvUI)

-- This file is only for Cataclysm
if not E.Cata then return end

local pairs = pairs

-- Function to add IDs to a list
local function Add(list, ids, value)
	for _, id in pairs(ids) do
		list[id] = list[id] or value
	end
end

-- Aura Filters DB
function L1UI:Setup_Filters()

	-- General setup
	local unitframe = E.global['unitframe'] or {}
	local aurafilters = unitframe['aurafilters'] or {}
	local aurawatch = unitframe['aurawatch'] or {}
	
	-- Classes setup
	local classes = {
		-- Healers
		DRUID = aurawatch['DRUID'] or {},
		PALADIN = aurawatch['PALADIN'] or {},
		PRIEST = aurawatch['PRIEST'] or {},
		SHAMAN = aurawatch['SHAMAN'] or {},
		-- Others
		DEATHKNIGHT = aurawatch['DEATHKNIGHT'] or {},
		MAGE = aurawatch['MAGE'] or {},
		WARLOCK = aurawatch['WARLOCK'] or {},
		HUNTER = aurawatch['HUNTER'] or {},
		ROGUE = aurawatch['ROGUE'] or {},
		WARRIOR = aurawatch['WARRIOR'] or {}
	}

	local ids = {
		-- General
		blacklist = {},
		whitelist = {},
		-- Healers
		DRUID = {},
		PALADIN = {},
		PRIEST = {},
		SHAMAN = {},
		-- Others
		DEATHKNIGHT = {},
		MAGE = {},
		WARLOCK = {},
		HUNTER = {},
		ROGUE = {},
		WARRIOR = {}
	}

	for class, classIDs in pairs(ids) do
		if class == 'blacklist' then
			Add(aurafilters['Blacklist'] or {}, classIDs, { enable = true, priority = 0 })
		elseif class == 'whitelist' then
			Add(aurafilters['Whitelist'] or {}, classIDs, { enable = false })
		else
			Add(classes[class], classIDs, { enable = true, color = {} })
		end
	end

	-- Druid
	classes["DRUID"][467] = {
		["cooldownY"] = 0,
		["displayText"] = true,
		["yOffset"] = 1,
		["cooldownX"] = 0,
		["style"] = "texturedIcon",
		["xOffset"] = -14,
	}
	classes["DRUID"][48438] = {
		["point"] = "TOPLEFT",
		["xOffset"] = 29,
		["displayText"] = true,
		["yOffset"] = 1,
		["cooldownX"] = 0,
		["style"] = "texturedIcon",
		["cooldownY"] = 0,
	}
	classes["DRUID"][8936] = {
		["point"] = "TOPLEFT",
		["xOffset"] = 14,
		["displayText"] = true,
		["yOffset"] = 1,
		["cooldownX"] = 0,
		["style"] = "texturedIcon",
		["cooldownY"] = 0,
	}
	classes["DRUID"][33763] = {
		["point"] = "TOP",
		["xOffset"] = -7,
		["displayText"] = true,
		["yOffset"] = 1,
		["cooldownX"] = 0,
		["countY"] = -8,
		["countAnchor"] = "BOTTOM",
		["style"] = "texturedIcon",
		["countX"] = 0,
		["cooldownY"] = 0,
	}
	classes["DRUID"][774] = {
		["point"] = "TOPLEFT",
		["xOffset"] = -1,
		["displayText"] = true,
		["yOffset"] = 1,
		["cooldownX"] = 0,
		["style"] = "texturedIcon",
		["cooldownY"] = 0,
	}
	classes["DRUID"][29166] = {
		["point"] = "TOPRIGHT",
		["xOffset"] = 1,
		["displayText"] = true,
		["yOffset"] = 1,
		["cooldownX"] = 0,
		["style"] = "texturedIcon",
		["cooldownY"] = 0,
	}

	-- Paladin
	classes["PALADIN"][1044] = {
		["point"] = "TOP",
		["displayText"] = true,
		["yOffset"] = 1,
		["cooldownX"] = 0,
		["style"] = "texturedIcon",
		["cooldownY"] = 0,
	}
	classes["PALADIN"][1022] = {
		["point"] = "TOPRIGHT",
		["cooldownY"] = 0,
		["displayText"] = true,
		["yOffset"] = 1,
		["cooldownX"] = 0,
		["style"] = "texturedIcon",
		["xOffset"] = 1,
	}
	classes["PALADIN"][1038] = {
		["point"] = "TOPRIGHT",
		["cooldownY"] = 0,
		["displayText"] = true,
		["yOffset"] = 1,
		["cooldownX"] = 0,
		["style"] = "texturedIcon",
		["xOffset"] = -29,
	}
	classes["PALADIN"][6940] = {
		["point"] = "TOPRIGHT",
		["cooldownY"] = 0,
		["displayText"] = true,
		["yOffset"] = 1,
		["cooldownX"] = 0,
		["style"] = "texturedIcon",
		["xOffset"] = -14,
	}
	classes["PALADIN"][53563] = {
		["point"] = "TOPLEFT",
		["cooldownY"] = 0,
		["displayText"] = true,
		["yOffset"] = 1,
		["cooldownX"] = 0,
		["style"] = "texturedIcon",
		["xOffset"] = -1,
	}

	-- Priest
	classes["PRIEST"][41635] = {
		["point"] = "TOPLEFT",
		["cooldownY"] = 0,
		["displayText"] = true,
		["yOffset"] = 1,
		["cooldownX"] = 0,
		["countY"] = -10,
		["countAnchor"] = "BOTTOM",
		["style"] = "texturedIcon",
		["countX"] = 0,
		["xOffset"] = 29,
	}
	classes["PRIEST"][17] = {
		["point"] = "TOPLEFT",
		["cooldownY"] = 0,
		["displayText"] = true,
		["yOffset"] = 1,
		["cooldownX"] = 0,
		["style"] = "texturedIcon",
		["xOffset"] = -1,
	}
	classes["PRIEST"][33206] = {
		["cooldownY"] = 0,
		["displayText"] = true,
		["yOffset"] = 1,
		["cooldownX"] = 0,
		["style"] = "texturedIcon",
		["xOffset"] = 1,
	}
	classes["PRIEST"][6788] = {
		["displayText"] = true,
		["yOffset"] = 1,
		["cooldownX"] = 0,
		["style"] = "texturedIcon",
		["cooldownY"] = 0,
	}
	classes["PRIEST"][10060] = {
		["point"] = "TOPRIGHT",
		["cooldownY"] = 0,
		["displayText"] = true,
		["yOffset"] = 1,
		["cooldownX"] = 0,
		["style"] = "texturedIcon",
		["xOffset"] = 1,
	}
	classes["PRIEST"][47788] = {
		["point"] = "TOPRIGHT",
		["cooldownY"] = 0,
		["displayText"] = true,
		["yOffset"] = 1,
		["cooldownX"] = 0,
		["style"] = "texturedIcon",
		["xOffset"] = 1,
	}
	classes["PRIEST"][139] = {
		["point"] = "TOPLEFT",
		["cooldownY"] = 0,
		["displayText"] = true,
		["yOffset"] = 1,
		["cooldownX"] = 0,
		["style"] = "texturedIcon",
		["xOffset"] = 14,
	}

	-- Shaman
	classes["SHAMAN"][61295] = {
		["point"] = "TOPLEFT",
		["xOffset"] = -1,
		["displayText"] = true,
		["yOffset"] = 1,
		["cooldownX"] = 0,
		["style"] = "texturedIcon",
		["cooldownY"] = 0,
	}
	classes["SHAMAN"][974] = {
		["point"] = "TOPRIGHT",
		["xOffset"] = 1,
		["displayText"] = true,
		["yOffset"] = 1,
		["cooldownX"] = 0,
		["style"] = "texturedIcon",
		["cooldownY"] = 0,
	}
	classes["SHAMAN"][51945] = {
		["point"] = "TOPLEFT",
		["xOffset"] = 29,
		["displayText"] = true,
		["yOffset"] = 1,
		["cooldownX"] = 0,
		["style"] = "texturedIcon",
		["cooldownY"] = 0,
	}
	classes["SHAMAN"][16236] = {
		["point"] = "TOPLEFT",
		["xOffset"] = 14,
		["displayText"] = true,
		["yOffset"] = 1,
		["cooldownX"] = 0,
		["style"] = "texturedIcon",
		["cooldownY"] = 0,
	}

	-- Death Knight
	classes["DEATHKNIGHT"][49016]["style"] = "texturedIcon"

	-- Mage
	classes["MAGE"][130]["style"] = "texturedIcon"

	-- Warlock
	classes["WARLOCK"][5697]["style"] = "texturedIcon"
	classes["WARLOCK"][20707]["style"] = "texturedIcon"

	-- Hunter
	classes["HUNTER"][34477]["style"] = "texturedIcon"

	-- Rogue
	classes["ROGUE"][57933]["style"] = "texturedIcon"

	-- Warrior
	classes["WARRIOR"][3411]["style"] = "texturedIcon"
	classes["WARRIOR"][50720]["style"] = "texturedIcon"
end
