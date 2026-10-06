local _, Private = ...
local L = Private.L

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
		Add(aurawatch[class], classIDs)
	end

	-- Druid
	aurawatch['DRUID'][48438] = { -- Wild Growth
		['enabled'] = true,
		['point'] = 'TOPLEFT',
		['xOffset'] = 29,
		['displayText'] = true,
		['yOffset'] = 1,
		['cooldownX'] = 0,
		['style'] = 'texturedIcon',
		['cooldownY'] = 0,
	}
	aurawatch['DRUID'][8936] = { -- Regrowth
		['enabled'] = true,
		['point'] = 'TOPLEFT',
		['xOffset'] = 14,
		['displayText'] = true,
		['yOffset'] = 1,
		['cooldownX'] = 0,
		['style'] = 'texturedIcon',
		['cooldownY'] = 0,
	}
	aurawatch['DRUID'][33763] = { -- Lifebloom
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
	aurawatch['DRUID'][774] = { -- Rejuvenation
		['enabled'] = true,
		['point'] = 'TOPLEFT',
		['xOffset'] = -1,
		['displayText'] = true,
		['yOffset'] = 1,
		['cooldownX'] = 0,
		['style'] = 'texturedIcon',
		['cooldownY'] = 0,
	}
	aurawatch['DRUID'][29166] = { -- Innervate
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
	aurawatch['PALADIN'][1044] = { -- Hand of Freedom
		['enabled'] = true,
		['point'] = 'TOP',
		['displayText'] = true,
		['yOffset'] = 1,
		['cooldownX'] = 0,
		['style'] = 'texturedIcon',
		['cooldownY'] = 0,
	}
	aurawatch['PALADIN'][1022] = { -- Hand of Protection
		['enabled'] = true,
		['point'] = 'TOPRIGHT',
		['cooldownY'] = 0,
		['displayText'] = true,
		['yOffset'] = 1,
		['cooldownX'] = 0,
		['style'] = 'texturedIcon',
		['xOffset'] = 1,
	}
	aurawatch['PALADIN'][1038] = { -- Hand of Salvation
		['enabled'] = true,
		['point'] = 'TOPRIGHT',
		['cooldownY'] = 0,
		['displayText'] = true,
		['yOffset'] = 1,
		['cooldownX'] = 0,
		['style'] = 'texturedIcon',
		['xOffset'] = -29,
	}
	aurawatch['PALADIN'][6940] = { -- Hand of Sacrifice
		['enabled'] = true,
		['point'] = 'TOPRIGHT',
		['cooldownY'] = 0,
		['displayText'] = true,
		['yOffset'] = 1,
		['cooldownX'] = 0,
		['style'] = 'texturedIcon',
		['xOffset'] = -14,
	}
	aurawatch['PALADIN'][53563] = { -- Beacon of Light
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
	aurawatch['PRIEST'][41635] = { -- Prayer of Mending
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
	aurawatch['PRIEST'][17] = { -- Power Word: Shield
		['enabled'] = true,
		['point'] = 'TOPLEFT',
		['cooldownY'] = 0,
		['displayText'] = true,
		['yOffset'] = 1,
		['cooldownX'] = 0,
		['style'] = 'texturedIcon',
		['xOffset'] = -1,
	}
	aurawatch['PRIEST'][33206] = { -- Pain Suppression
		['enabled'] = true,
		['cooldownY'] = 0,
		['displayText'] = true,
		['yOffset'] = 1,
		['cooldownX'] = 0,
		['style'] = 'texturedIcon',
		['xOffset'] = 1,
	}
	aurawatch['PRIEST'][6788] = { -- Weakened Soul
		['enabled'] = true,
		['displayText'] = true,
		['yOffset'] = 1,
		['cooldownX'] = 0,
		['style'] = 'texturedIcon',
		['cooldownY'] = 0,
	}
	aurawatch['PRIEST'][10060] = { -- Power Infusion
		['enabled'] = true,
		['point'] = 'TOPRIGHT',
		['cooldownY'] = 0,
		['displayText'] = true,
		['yOffset'] = 1,
		['cooldownX'] = 0,
		['style'] = 'texturedIcon',
		['xOffset'] = 1,
	}
	aurawatch['PRIEST'][47788] = { -- Guardian Spirit
		['enabled'] = true,
		['point'] = 'TOPRIGHT',
		['cooldownY'] = 0,
		['displayText'] = true,
		['yOffset'] = 1,
		['cooldownX'] = 0,
		['style'] = 'texturedIcon',
		['xOffset'] = 1,
	}
	aurawatch['PRIEST'][139] = { -- Renew
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
	aurawatch['SHAMAN'][61295] = { -- Riptide
		['enabled'] = true,
		['point'] = 'TOPLEFT',
		['xOffset'] = -1,
		['displayText'] = true,
		['yOffset'] = 1,
		['cooldownX'] = 0,
		['style'] = 'texturedIcon',
		['cooldownY'] = 0,
	}
	aurawatch['SHAMAN'][974] = { -- Earth Shield
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
	aurawatch['SHAMAN'][51945] = { -- Earthliving
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
	aurawatch['MONK'][124081] = { -- Zen Sphere
		['enabled'] = true,
		['point'] = 'TOPLEFT',
		['yOffset'] = 1,
		['style'] = 'texturedIcon',
		['xOffset'] = 29,
		['displayText'] = true,
		['cooldownX'] = 0,
		['cooldownY'] = 0,
	}
	aurawatch['MONK'][119611] = { -- Renewing Mist
		['enabled'] = true,
		['yOffset'] = 1,
		['style'] = 'texturedIcon',
		['xOffset'] = -1,
		['displayText'] = true,
		['cooldownX'] = 0,
		['cooldownY'] = 0,
	}
	aurawatch['MONK'][116849] = { -- Life Cocoon
		['enabled'] = true,
		['yOffset'] = 1,
		['style'] = 'texturedIcon',
		['xOffset'] = 1,
		['displayText'] = true,
		['cooldownX'] = 0,
		['cooldownY'] = 0,
	}
	aurawatch['MONK'][132120] = { -- Enveloping Mist
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
	aurawatch['DEATHKNIGHT'][49016]['style'] = 'texturedIcon' -- Unholy Frenzy

	-- Mage
	aurawatch['MAGE'][130]['style'] = 'texturedIcon' -- Slow Fall

	-- Warlock
	aurawatch['WARLOCK'][5697]['style'] = 'texturedIcon' -- Unending Breath
	aurawatch['WARLOCK'][20707]['style'] = 'texturedIcon' -- Soulstone

	-- Hunter
	aurawatch['HUNTER'][34477]['style'] = 'texturedIcon' -- Misdirection

	-- Rogue
	aurawatch['ROGUE'][57933]['style'] = 'texturedIcon' -- Tricks of the Trade

	-- Warrior
	aurawatch['WARRIOR'][3411]['style'] = 'texturedIcon' -- Intervene
	aurawatch['WARRIOR'][50720]['style'] = 'texturedIcon' -- Vigilance

	Private:Print(L["Custom ElvUI aura filters loaded."], installer)
end
