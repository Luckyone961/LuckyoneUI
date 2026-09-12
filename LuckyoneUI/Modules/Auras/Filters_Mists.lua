local _, Private = ...
local L = Private.Libs.ACL

if not Private.ElvUI then
	return
end

local ipairs = ipairs
local pairs = pairs
local unpack = unpack

local E = unpack(ElvUI)

-- Function to add IDs to a list (fresh table per ID)
local function Add(list, ids)
	for _, id in ipairs(ids) do
		list[id] = list[id] or { enabled = true, color = {} }
	end
end

-- Aura filters: Mists of Pandaria
function Private:Setup_Filters(installer)
	-- General vars
	local aurawatch = E.global.unitframe.aurawatch

	-- Classes setup
	local classes = {
		-- Healers
		DRUID = aurawatch.DRUID,
		PALADIN = aurawatch.PALADIN,
		PRIEST = aurawatch.PRIEST,
		SHAMAN = aurawatch.SHAMAN,
		MONK = aurawatch.MONK,
		-- Others
		DEATHKNIGHT = aurawatch.DEATHKNIGHT,
		MAGE = aurawatch.MAGE,
		WARLOCK = aurawatch.WARLOCK,
		HUNTER = aurawatch.HUNTER,
		ROGUE = aurawatch.ROGUE,
		WARRIOR = aurawatch.WARRIOR
	}

	local ids = {
		-- Healers
		DRUID = { 48438, 8936, 33763, 774, 29166 },
		PALADIN = { 1044, 1022, 1038, 6940, 53563 },
		PRIEST = { 41635, 17, 33206, 6788, 10060, 47788, 139 },
		SHAMAN = { 61295, 974, 51945 },
		MONK = { 132120, 116849, 119611, 124081 },
		-- Others
		DEATHKNIGHT = { 49016 },
		MAGE = { 130 },
		WARLOCK = { 5697, 20707 },
		HUNTER = { 34477 },
		ROGUE = { 57933 },
		WARRIOR = { 3411, 50720 }
	}

	for class, classIDs in pairs(ids) do
		Add(classes[class], classIDs)
	end

	-- Druid
	classes['DRUID'][48438] = { -- Wild Growth
		['enabled'] = true,
		['point'] = 'TOPLEFT',
		['xOffset'] = 29,
		['displayText'] = true,
		['yOffset'] = 1,
		['cooldownX'] = 0,
		['style'] = 'texturedIcon',
		['cooldownY'] = 0,
	}
	classes['DRUID'][8936] = { -- Regrowth
		['enabled'] = true,
		['point'] = 'TOPLEFT',
		['xOffset'] = 14,
		['displayText'] = true,
		['yOffset'] = 1,
		['cooldownX'] = 0,
		['style'] = 'texturedIcon',
		['cooldownY'] = 0,
	}
	classes['DRUID'][33763] = { -- Lifebloom
		['enabled'] = true,
		['point'] = 'TOP',
		['xOffset'] = -7,
		['displayText'] = true,
		['yOffset'] = 1,
		['cooldownX'] = 0,
		['countY'] = -8,
		['countAnchor'] = 'BOTTOM',
		['style'] = 'texturedIcon',
		['countX'] = 0,
		['cooldownY'] = 0,
	}
	classes['DRUID'][774] = { -- Rejuvenation
		['enabled'] = true,
		['point'] = 'TOPLEFT',
		['xOffset'] = -1,
		['displayText'] = true,
		['yOffset'] = 1,
		['cooldownX'] = 0,
		['style'] = 'texturedIcon',
		['cooldownY'] = 0,
	}
	classes['DRUID'][29166] = { -- Innervate
		['enabled'] = true,
		['point'] = 'TOPRIGHT',
		['xOffset'] = 1,
		['displayText'] = true,
		['yOffset'] = 1,
		['cooldownX'] = 0,
		['style'] = 'texturedIcon',
		['cooldownY'] = 0,
	}

	-- Paladin
	classes['PALADIN'][1044] = { -- Hand of Freedom
		['enabled'] = true,
		['point'] = 'TOP',
		['displayText'] = true,
		['yOffset'] = 1,
		['cooldownX'] = 0,
		['style'] = 'texturedIcon',
		['cooldownY'] = 0,
	}
	classes['PALADIN'][1022] = { -- Hand of Protection
		['enabled'] = true,
		['point'] = 'TOPRIGHT',
		['cooldownY'] = 0,
		['displayText'] = true,
		['yOffset'] = 1,
		['cooldownX'] = 0,
		['style'] = 'texturedIcon',
		['xOffset'] = 1,
	}
	classes['PALADIN'][1038] = { -- Hand of Salvation
		['enabled'] = true,
		['point'] = 'TOPRIGHT',
		['cooldownY'] = 0,
		['displayText'] = true,
		['yOffset'] = 1,
		['cooldownX'] = 0,
		['style'] = 'texturedIcon',
		['xOffset'] = -29,
	}
	classes['PALADIN'][6940] = { -- Hand of Sacrifice
		['enabled'] = true,
		['point'] = 'TOPRIGHT',
		['cooldownY'] = 0,
		['displayText'] = true,
		['yOffset'] = 1,
		['cooldownX'] = 0,
		['style'] = 'texturedIcon',
		['xOffset'] = -14,
	}
	classes['PALADIN'][53563] = { -- Beacon of Light
		['enabled'] = true,
		['point'] = 'TOPLEFT',
		['cooldownY'] = 0,
		['displayText'] = true,
		['yOffset'] = 1,
		['cooldownX'] = 0,
		['style'] = 'texturedIcon',
		['xOffset'] = -1,
	}

	-- Priest
	classes['PRIEST'][41635] = { -- Prayer of Mending
		['enabled'] = true,
		['point'] = 'TOPLEFT',
		['cooldownY'] = 0,
		['displayText'] = true,
		['yOffset'] = 1,
		['cooldownX'] = 0,
		['countY'] = -10,
		['countAnchor'] = 'BOTTOM',
		['style'] = 'texturedIcon',
		['countX'] = 0,
		['xOffset'] = 29,
	}
	classes['PRIEST'][17] = { -- Power Word: Shield
		['enabled'] = true,
		['point'] = 'TOPLEFT',
		['cooldownY'] = 0,
		['displayText'] = true,
		['yOffset'] = 1,
		['cooldownX'] = 0,
		['style'] = 'texturedIcon',
		['xOffset'] = -1,
	}
	classes['PRIEST'][33206] = { -- Pain Suppression
		['enabled'] = true,
		['cooldownY'] = 0,
		['displayText'] = true,
		['yOffset'] = 1,
		['cooldownX'] = 0,
		['style'] = 'texturedIcon',
		['xOffset'] = 1,
	}
	classes['PRIEST'][6788] = { -- Weakened Soul
		['enabled'] = true,
		['displayText'] = true,
		['yOffset'] = 1,
		['cooldownX'] = 0,
		['style'] = 'texturedIcon',
		['cooldownY'] = 0,
	}
	classes['PRIEST'][10060] = { -- Power Infusion
		['enabled'] = true,
		['point'] = 'TOPRIGHT',
		['cooldownY'] = 0,
		['displayText'] = true,
		['yOffset'] = 1,
		['cooldownX'] = 0,
		['style'] = 'texturedIcon',
		['xOffset'] = 1,
	}
	classes['PRIEST'][47788] = { -- Guardian Spirit
		['enabled'] = true,
		['point'] = 'TOPRIGHT',
		['cooldownY'] = 0,
		['displayText'] = true,
		['yOffset'] = 1,
		['cooldownX'] = 0,
		['style'] = 'texturedIcon',
		['xOffset'] = 1,
	}
	classes['PRIEST'][139] = { -- Renew
		['enabled'] = true,
		['point'] = 'TOPLEFT',
		['cooldownY'] = 0,
		['displayText'] = true,
		['yOffset'] = 1,
		['cooldownX'] = 0,
		['style'] = 'texturedIcon',
		['xOffset'] = 14,
	}

	-- Shaman
	classes['SHAMAN'][61295] = { -- Riptide
		['enabled'] = true,
		['point'] = 'TOPLEFT',
		['xOffset'] = -1,
		['displayText'] = true,
		['yOffset'] = 1,
		['cooldownX'] = 0,
		['style'] = 'texturedIcon',
		['cooldownY'] = 0,
	}
	classes['SHAMAN'][974] = { -- Earth Shield
		['enabled'] = true,
		['point'] = 'TOPRIGHT',
		['xOffset'] = 1,
		['displayText'] = true,
		['yOffset'] = 1,
		['cooldownX'] = 0,
		['countY'] = -10,
		['countAnchor'] = 'BOTTOM',
		['style'] = 'texturedIcon',
		['countX'] = 0,
		['cooldownY'] = 0,
	}
	classes['SHAMAN'][51945] = { -- Earthliving
		['enabled'] = true,
		['point'] = 'TOPLEFT',
		['xOffset'] = 29,
		['displayText'] = true,
		['yOffset'] = 1,
		['cooldownX'] = 0,
		['style'] = 'texturedIcon',
		['cooldownY'] = 0,
	}

	-- Monk
	classes['MONK'][124081] = { -- Zen Sphere
		['enabled'] = true,
		['point'] = 'TOPLEFT',
		['yOffset'] = 1,
		['style'] = 'texturedIcon',
		['xOffset'] = 29,
		['displayText'] = true,
		['cooldownX'] = 0,
		['cooldownY'] = 0,
	}
	classes['MONK'][119611] = { -- Renewing Mist
		['enabled'] = true,
		['yOffset'] = 1,
		['style'] = 'texturedIcon',
		['xOffset'] = -1,
		['displayText'] = true,
		['cooldownX'] = 0,
		['cooldownY'] = 0,
	}
	classes['MONK'][116849] = { -- Life Cocoon
		['enabled'] = true,
		['yOffset'] = 1,
		['style'] = 'texturedIcon',
		['xOffset'] = 1,
		['displayText'] = true,
		['cooldownX'] = 0,
		['cooldownY'] = 0,
	}
	classes['MONK'][132120] = { -- Enveloping Mist
		['enabled'] = true,
		['point'] = 'TOPLEFT',
		['yOffset'] = 1,
		['style'] = 'texturedIcon',
		['xOffset'] = 14,
		['displayText'] = true,
		['cooldownX'] = 0,
		['cooldownY'] = 0,
	}

	-- Death Knight
	classes['DEATHKNIGHT'][49016]['style'] = 'texturedIcon' -- Unholy Frenzy

	-- Mage
	classes['MAGE'][130]['style'] = 'texturedIcon' -- Slow Fall

	-- Warlock
	classes['WARLOCK'][5697]['style'] = 'texturedIcon' -- Unending Breath
	classes['WARLOCK'][20707]['style'] = 'texturedIcon' -- Soulstone

	-- Hunter
	classes['HUNTER'][34477]['style'] = 'texturedIcon' -- Misdirection

	-- Rogue
	classes['ROGUE'][57933]['style'] = 'texturedIcon' -- Tricks of the Trade

	-- Warrior
	classes['WARRIOR'][3411]['style'] = 'texturedIcon' -- Intervene
	classes['WARRIOR'][50720]['style'] = 'texturedIcon' -- Vigilance

	Private:Print(L["Custom ElvUI aura filters loaded."], installer)
end
