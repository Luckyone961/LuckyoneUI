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

-- Aura filters: TBC / Classic
function Private:Setup_Filters(installer)
	-- General vars
	local aurawatch = E.global.unitframe.aurawatch

	local ids = {
		-- Healers
		DRUID = { 21849, 467, 1126, 8936, 408120, 774, 29166 },
		PALADIN = { 19740, 25894, 1044, 25782, 6940, 19746, 1022, 19742, 19977, 465 },
		PRIEST = { 6346, 139, 27683, 1243, 10060, 402004, 17, 27681, 14752, 401877, 21562, 976 },
		SHAMAN = { 8072, 25909, 10596, 8182, 29203, 8185, 16237, 16191, 5677, 5672 },
		-- Others
		MAGE = { 1008, 604, 1459, 23028, 130, 400735 },
		WARLOCK = { 2970, 6512, 11743, 5697 },
		HUNTER = { 19506, 13159, 20043 },
		WARRIOR = { 6673 }
	}

	for class, classIDs in pairs(ids) do
		Add(aurawatch[class], classIDs)
	end

	-- Priest
	aurawatch['PRIEST'][6346] = { -- Fear Ward
		['enabled'] = true,
		['point'] = 'BOTTOMRIGHT',
		['yOffset'] = -1,
		['anyUnit'] = true,
		['style'] = 'texturedIcon',
		['xOffset'] = 1,
	}
	aurawatch['PRIEST'][139] = { -- Renew
		['enabled'] = true,
		['point'] = 'TOPLEFT',
		['yOffset'] = 1,
		['style'] = 'texturedIcon',
		['xOffset'] = -1,
	}
	aurawatch['PRIEST'][27683] = { -- Prayer of Shadow Protection
		['enabled'] = true,
		['yOffset'] = -1,
		['style'] = 'texturedIcon',
		['xOffset'] = 25,
	}
	aurawatch['PRIEST'][1243] = { -- Power Word: Fortitude
		['enabled'] = true,
		['point'] = 'BOTTOMLEFT',
		['yOffset'] = -1,
		['style'] = 'texturedIcon',
		['xOffset'] = -1,
	}
	aurawatch['PRIEST'][10060] = { -- Power Infusion
		['enabled'] = true,
		['yOffset'] = 1,
		['style'] = 'texturedIcon',
	}
	aurawatch['PRIEST'][402004] = { -- Pain Suppression
		['enabled'] = true,
		['yOffset'] = 1,
		['style'] = 'texturedIcon',
	}
	aurawatch['PRIEST'][17] = { -- Power Word: Shield
		['enabled'] = true,
		['point'] = 'TOPLEFT',
		['yOffset'] = 1,
		['style'] = 'texturedIcon',
		['xOffset'] = 25,
	}
	aurawatch['PRIEST'][27681] = { -- Prayer of Spirit
		['enabled'] = true,
		['point'] = 'BOTTOMLEFT',
		['yOffset'] = -1,
		['style'] = 'texturedIcon',
		['xOffset'] = 12,
	}
	aurawatch['PRIEST'][14752] = { -- Divine Spirit
		['enabled'] = true,
		['point'] = 'BOTTOMLEFT',
		['yOffset'] = -1,
		['style'] = 'texturedIcon',
		['xOffset'] = 12,
	}
	aurawatch['PRIEST'][401877] = { -- Prayer of Mending
		['enabled'] = true,
		['point'] = 'TOPLEFT',
		['yOffset'] = 1,
		['countY'] = 0,
		['style'] = 'texturedIcon',
		['countX'] = 0,
		['xOffset'] = 12,
	}
	aurawatch['PRIEST'][21562] = { -- Prayer of Fortitude
		['enabled'] = true,
		['point'] = 'BOTTOMLEFT',
		['yOffset'] = -1,
		['style'] = 'texturedIcon',
		['xOffset'] = -1,
	}
	aurawatch['PRIEST'][976] = { -- Shadow Protection
		['enabled'] = true,
		['yOffset'] = -1,
		['style'] = 'texturedIcon',
		['xOffset'] = 25,
	}

	-- Druid
	aurawatch['DRUID'][21849]['style'] = 'texturedIcon' -- Gift of the Wild
	aurawatch['DRUID'][467]['style'] = 'texturedIcon' -- Thorns
	aurawatch['DRUID'][1126]['style'] = 'texturedIcon' -- Mark of the Wild
	aurawatch['DRUID'][8936]['style'] = 'texturedIcon' -- Regrowth
	aurawatch['DRUID'][408120]['style'] = 'texturedIcon' -- Wild Growth
	aurawatch['DRUID'][774]['style'] = 'texturedIcon' -- Rejuvenation
	aurawatch['DRUID'][29166]['style'] = 'texturedIcon' -- Innervate

	-- Paladin
	aurawatch['PALADIN'][19740]['style'] = 'texturedIcon' -- Blessing of Might
	aurawatch['PALADIN'][25894]['style'] = 'texturedIcon' -- Greater Blessing of Wisdom
	aurawatch['PALADIN'][1044]['style'] = 'texturedIcon' -- Blessing of Freedom
	aurawatch['PALADIN'][25782]['style'] = 'texturedIcon' -- Greater Blessing of Might
	aurawatch['PALADIN'][6940]['style'] = 'texturedIcon' -- Blessing of Sacrifice
	aurawatch['PALADIN'][19746]['style'] = 'texturedIcon' -- Concentration Aura
	aurawatch['PALADIN'][1022]['style'] = 'texturedIcon' -- Blessing of Protection
	aurawatch['PALADIN'][19742]['style'] = 'texturedIcon' -- Blessing of Wisdom
	aurawatch['PALADIN'][19977]['style'] = 'texturedIcon' -- Blessing of Light
	aurawatch['PALADIN'][465]['style'] = 'texturedIcon' -- Devotion Aura

	-- Shaman
	aurawatch['SHAMAN'][8072]['style'] = 'texturedIcon' -- Stoneskin Totem
	aurawatch['SHAMAN'][25909]['style'] = 'texturedIcon' -- Tranquil Air
	aurawatch['SHAMAN'][10596]['style'] = 'texturedIcon' -- Nature Resistance Totem
	aurawatch['SHAMAN'][8182]['style'] = 'texturedIcon' -- Frost Resistance Totem
	aurawatch['SHAMAN'][29203]['style'] = 'texturedIcon' -- Healing Way
	aurawatch['SHAMAN'][8185]['style'] = 'texturedIcon' -- Fire Resistance Totem
	aurawatch['SHAMAN'][16237]['style'] = 'texturedIcon' -- Ancestral Fortitude
	aurawatch['SHAMAN'][16191]['style'] = 'texturedIcon' -- Mana Tide Totem
	aurawatch['SHAMAN'][5677]['style'] = 'texturedIcon' -- Mana Spring Totem
	aurawatch['SHAMAN'][5672]['style'] = 'texturedIcon' -- Healing Stream Totem

	-- Mage
	aurawatch['MAGE'][1008]['style'] = 'texturedIcon' -- Amplify Magic
	aurawatch['MAGE'][604]['style'] = 'texturedIcon' -- Dampen Magic
	aurawatch['MAGE'][1459]['style'] = 'texturedIcon' -- Arcane Intellect
	aurawatch['MAGE'][23028]['style'] = 'texturedIcon' -- Arcane Brilliance
	aurawatch['MAGE'][130]['style'] = 'texturedIcon' -- Slow Fall
	aurawatch['MAGE'][400735]['style'] = 'texturedIcon' -- Temporal Beacon

	-- Warlock
	aurawatch['WARLOCK'][2970]['style'] = 'texturedIcon' -- Detect Invisibility
	aurawatch['WARLOCK'][6512]['style'] = 'texturedIcon' -- Detect Lesser Invisibility
	aurawatch['WARLOCK'][11743]['style'] = 'texturedIcon' -- Detect Greater Invisibility
	aurawatch['WARLOCK'][5697]['style'] = 'texturedIcon' -- Unending Breath

	-- Hunter
	aurawatch['HUNTER'][19506]['style'] = 'texturedIcon' -- Trueshot Aura
	aurawatch['HUNTER'][13159]['style'] = 'texturedIcon' -- Aspect of the Pack
	aurawatch['HUNTER'][20043]['style'] = 'texturedIcon' -- Aspect of the Wild

	-- Warrior
	aurawatch['WARRIOR'][6673]['style'] = 'texturedIcon' -- Battle Shout

	-- Forever matches indicators by id only, entries without an ElvUI default get none back on reload
	for class, classIDs in pairs(ids) do
		for _, id in ipairs(classIDs) do
			aurawatch[class][id].id = id
		end
	end

	Private:Print(L["Custom ElvUI aura filters loaded."], installer)
end
