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

-- Aura filters: Retail
function Private:Setup_Filters(installer)
	-- General vars
	local aurawatch = E.global.unitframe.aurawatch

	-- Classes setup
	local classes = {
		-- Healers
		DRUID = aurawatch.DRUID,
		EVOKER = aurawatch.EVOKER,
		MONK = aurawatch.MONK,
		PALADIN = aurawatch.PALADIN,
		PRIEST = aurawatch.PRIEST,
		SHAMAN = aurawatch.SHAMAN,
	}

	local ids = {
		DRUID = {
			-- Restoration
			774, -- Rejuvenation
			8936, -- Regrowth
			33763, -- Lifebloom
			48438, -- Wild Growth
			155777, -- Germination
		},
		EVOKER = {
			-- Preservation
			355941, -- Dream Breath
			376788, -- Dream Breath (Echo)
			363502, -- Dream Flight
			366155, -- Reversion
			367364, -- Reversion (Echo)
			373267, -- Life Bind
			364343, -- Echo
			-- Augmentation
			360827, -- Blistering Scales
			410089, -- Prescience
			395152, -- Ebon Might
			410263, -- Inferno's Blessing
			410686, -- Symbiotic Bloom
			413984, -- Shifting Sands
			-- All
			369459, -- Source of Magic
		},
		MONK = {
			-- Mistweaver
			115175, -- Soothing Mist
			119611, -- Renewing Mist
			450769, -- Aspect of Harmony
			124682, -- Enveloping Mist
		},
		PALADIN = {
			-- Holy
			53563, -- Beacon of Light
			156910, -- Beacon of Faith
			200025, -- Beacon of Virtue
			156322, -- Eternal Flame
			1244893, -- Beacon of the Savior
		},
		PRIEST = {
			-- Holy
			139, -- Renew
			41635, -- Prayer of Mending
			77489, -- Echo of Light
			-- Discipline
			17, -- Power Word: Shield
			194384, -- Atonement
			1253593, -- Void Shield
		},
		SHAMAN = {
			-- Restoration
			974, -- Earth Shield
			61295, -- Riptide
			383648, -- Earth Shield (Elemental Orbit)
			207400, -- Ancestral Vigor
			382024, -- Earthliving Weapon
			444490, -- Hydrobubble
		},
	}

	for class, classIDs in pairs(ids) do
		Add(classes[class], classIDs)
	end

	-- Restoration
	classes['DRUID'][774] = { -- Rejuvenation
		['enabled'] = true,
		['point'] = 'TOPLEFT',
		['displayText'] = true,
		['yOffset'] = 1,
		['sizeOffset'] = 6,
		['style'] = 'texturedIcon',
		['xOffset'] = -1,
	}
	classes['DRUID'][155777] = { -- Rejuvenation (Germination)
		['enabled'] = true,
		['point'] = 'TOPLEFT',
		['displayText'] = true,
		['yOffset'] = 1,
		['sizeOffset'] = 6,
		['style'] = 'texturedIcon',
		['xOffset'] = 20,
	}
	classes['DRUID'][33763] = { -- Lifebloom
		['enabled'] = true,
		['xOffset'] = 41,
		['displayText'] = true,
		['yOffset'] = 1,
		['countAnchor'] = 'RIGHT',
		['sizeOffset'] = 6,
		['style'] = 'texturedIcon',
		['countX'] = 13,
	}
	classes['DRUID'][8936] = { -- Regrowth
		['enabled'] = true,
		['point'] = 'TOPRIGHT',
		['displayText'] = true,
		['yOffset'] = 1,
		['sizeOffset'] = 6,
		['style'] = 'texturedIcon',
		['xOffset'] = -20,
	}
	classes['DRUID'][48438] = { -- Wild Growth
		['enabled'] = true,
		['point'] = 'TOPRIGHT',
		['displayText'] = true,
		['yOffset'] = 1,
		['sizeOffset'] = 6,
		['style'] = 'texturedIcon',
		['xOffset'] = 1,
	}
	classes['DRUID'][474754] = { -- Symbiotic Relationship
		['enabled'] = true,
		['point'] = 'LEFT',
		['sizeOffset'] = 6,
		['style'] = 'texturedIcon',
		['xOffset'] = -1,
	}

	-- Preservation
	classes['EVOKER'][366155] = { -- Reversion
		['enabled'] = true,
		['point'] = 'TOPLEFT',
		['displayText'] = true,
		['yOffset'] = 1,
		['sizeOffset'] = 6,
		['style'] = 'texturedIcon',
		['xOffset'] = -1,
	}
	classes['EVOKER'][367364] = { -- Reversion (Echo)
		['enabled'] = true,
		['point'] = 'TOPLEFT',
		['displayText'] = true,
		['yOffset'] = 1,
		['sizeOffset'] = 6,
		['style'] = 'texturedIcon',
		['xOffset'] = 20,
	}
	classes['EVOKER'][355941] = { -- Dream Breath
		['enabled'] = true,
		['point'] = 'TOPLEFT',
		['displayText'] = true,
		['yOffset'] = 1,
		['sizeOffset'] = 6,
		['style'] = 'texturedIcon',
		['xOffset'] = 41,
	}
	classes['EVOKER'][376788] = { -- Dream Breath (Echo)
		['enabled'] = true,
		['point'] = 'TOPLEFT',
		['displayText'] = true,
		['yOffset'] = 1,
		['countAnchor'] = 'TOPLEFT',
		['sizeOffset'] = 6,
		['style'] = 'texturedIcon',
		['xOffset'] = 62,
	}
	classes['EVOKER'][373267] = { -- Lifebind
		['enabled'] = true,
		['point'] = 'TOPRIGHT',
		['displayText'] = true,
		['yOffset'] = 1,
		['sizeOffset'] = 6,
		['style'] = 'texturedIcon',
		['xOffset'] = -20,
	}
	classes['EVOKER'][364343] = { -- Echo
		['enabled'] = true,
		['point'] = 'TOPRIGHT',
		['displayText'] = true,
		['yOffset'] = 1,
		['sizeOffset'] = 6,
		['style'] = 'texturedIcon',
		['xOffset'] = 1,
	}
	classes['EVOKER'][363502]['enabled'] = false -- Dream Flight

	-- Augmentation
	classes['EVOKER'][360827] = { -- Blistering Scales
		['enabled'] = true,
		['countAnchor'] = 'CENTER',
		['point'] = 'TOPLEFT',
		['sizeOffset'] = 6,
		['style'] = 'texturedIcon',
		['xOffset'] = -1,
		['yOffset'] = 1,
	}
	classes['EVOKER'][410089] = { -- Prescience
		['enabled'] = true,
		['displayText'] = true,
		['yOffset'] = 1,
		['point'] = 'TOPRIGHT',
		['sizeOffset'] = 6,
		['style'] = 'texturedIcon',
		['xOffset'] = 1,
	}

	classes['EVOKER'][369459] = { -- Source of Magic
		['enabled'] = true,
		['point'] = 'LEFT',
		['sizeOffset'] = 6,
		['style'] = 'texturedIcon',
		['xOffset'] = -1,
	}
	classes['EVOKER'][395152]['enabled'] = false -- Ebon Might (Others)
	classes['EVOKER'][410263]['enabled'] = false -- Inferno's Blessing
	classes['EVOKER'][410686]['enabled'] = false -- Symbiotic Bloom
	classes['EVOKER'][413984]['enabled'] = false -- Shifting Sands

	-- Monk
	classes['MONK'][119611] = { -- Renewing Mist
		['enabled'] = true,
		['displayText'] = true,
		['yOffset'] = 1,
		['countY'] = 0,
		['sizeOffset'] = 6,
		['style'] = 'texturedIcon',
		['xOffset'] = -1,
	}
	classes['MONK'][450769] = { -- Aspect of Harmony
		['enabled'] = true,
		['displayText'] = true,
		['yOffset'] = 1,
		['countY'] = 0,
		['sizeOffset'] = 6,
		['style'] = 'texturedIcon',
		['xOffset'] = -1,
	}
	classes['MONK'][124682] = { -- Enveloping Mist
		['enabled'] = true,
		['point'] = 'TOPLEFT',
		['displayText'] = true,
		['yOffset'] = 1,
		['countY'] = 0,
		['sizeOffset'] = 6,
		['style'] = 'texturedIcon',
		['countX'] = 0,
		['xOffset'] = 20,
	}
	classes['MONK'][115175] = { -- Soothing Mist
		['enabled'] = true,
		['point'] = 'TOPLEFT',
		['displayText'] = true,
		['yOffset'] = 1,
		['sizeOffset'] = 6,
		['style'] = 'texturedIcon',
		['xOffset'] = 41,
	}

	-- Holy
	classes['PALADIN'][53563] = { -- Beacon of Light
		['enabled'] = true,
		['point'] = 'TOPLEFT',
		['displayText'] = true,
		['yOffset'] = 1,
		['sizeOffset'] = 6,
		['style'] = 'texturedIcon',
		['xOffset'] = -1,
	}
	classes['PALADIN'][156910] = { -- Beacon of Faith
		['enabled'] = true,
		['point'] = 'TOPLEFT',
		['displayText'] = true,
		['yOffset'] = 1,
		['sizeOffset'] = 6,
		['style'] = 'texturedIcon',
		['xOffset'] = -1,
	}
	classes['PALADIN'][200025] = { -- Beacon of Virtue
		['enabled'] = true,
		['point'] = 'TOPLEFT',
		['displayText'] = true,
		['yOffset'] = 1,
		['sizeOffset'] = 6,
		['style'] = 'texturedIcon',
		['xOffset'] = -1,
	}
	classes['PALADIN'][156322] = { -- Eternal Flame
		['enabled'] = true,
		['displayText'] = true,
		['yOffset'] = 1,
		['sizeOffset'] = 6,
		['style'] = 'texturedIcon',
		['xOffset'] = 20,
	}
	classes['PALADIN'][1244893] = { -- Beacon of the Savior
		['enabled'] = true,
		['point'] = 'TOP',
		['displayText'] = true,
		['yOffset'] = 1,
		['sizeOffset'] = 6,
		['style'] = 'texturedIcon',
	}

	-- Holy
	classes['PRIEST'][139] = { -- Renew
		['enabled'] = true,
		['point'] = 'TOPLEFT',
		['displayText'] = true,
		['yOffset'] = 1,
		['sizeOffset'] = 6,
		['style'] = 'texturedIcon',
		['xOffset'] = -1,
	}
	classes['PRIEST'][77489] = { -- Echo of Light
		['enabled'] = false,
		['point'] = 'TOPLEFT',
		['displayText'] = true,
		['yOffset'] = 1,
		['sizeOffset'] = 6,
		['style'] = 'texturedIcon',
		['xOffset'] = 20,
	}

	-- Discipline
	classes['PRIEST'][41635] = { -- Prayer of Mending
		['enabled'] = true,
		['point'] = 'TOP',
		['displayText'] = true,
		['yOffset'] = 1,
		['countAnchor'] = 'RIGHT',
		['sizeOffset'] = 6,
		['style'] = 'texturedIcon',
		['countX'] = 13,
	}
	classes['PRIEST'][17] = {  -- Power Word: Shield
		['enabled'] = true,
		['point'] = 'TOPRIGHT',
		['displayText'] = true,
		['yOffset'] = 1,
		['anyUnit'] = false,
		['sizeOffset'] = 6,
		['style'] = 'texturedIcon',
		['xOffset'] = -20,
	}
	classes['PRIEST'][1253593] = { -- Void Shield
		['enabled'] = true,
		['point'] = 'TOPRIGHT',
		['displayText'] = true,
		['yOffset'] = 1,
		['sizeOffset'] = 6,
		['style'] = 'texturedIcon',
		['xOffset'] = -20,
	}
	classes['PRIEST'][194384] = { -- Atonement
		['enabled'] = true,
		['displayText'] = true,
		['yOffset'] = 1,
		['sizeOffset'] = 6,
		['style'] = 'texturedIcon',
		['xOffset'] = 1,
	}

	-- Restoration
	classes['SHAMAN'][974] = { -- Earth Shield
		['enabled'] = true,
		['point'] = 'TOPLEFT',
		['displayText'] = true,
		['yOffset'] = 1,
		['sizeOffset'] = 6,
		['style'] = 'texturedIcon',
		['xOffset'] = -1,
	}
	classes['SHAMAN'][383648] = { -- Earth Shield (Elemental Orbit)
		['enabled'] = true,
		['point'] = 'TOPLEFT',
		['displayText'] = true,
		['yOffset'] = 1,
		['sizeOffset'] = 6,
		['style'] = 'texturedIcon',
		['xOffset'] = -1,
	}
	classes['SHAMAN'][61295] = { -- Riptide
		['enabled'] = true,
		['point'] = 'TOPLEFT',
		['displayText'] = true,
		['yOffset'] = 1,
		['sizeOffset'] = 6,
		['style'] = 'texturedIcon',
		['xOffset'] = 20,
	}
	classes['SHAMAN'][382024] = { -- Earthliving Weapon
		['enabled'] = true,
		['point'] = 'TOPRIGHT',
		['displayText'] = true,
		['yOffset'] = 1,
		['sizeOffset'] = 6,
		['style'] = 'texturedIcon',
		['xOffset'] = -20,
	}
	classes['SHAMAN'][207400] = { -- Ancestral Vigor
		['enabled'] = true,
		['point'] = 'TOPRIGHT',
		['displayText'] = true,
		['yOffset'] = 1,
		['sizeOffset'] = 6,
		['style'] = 'texturedIcon',
		['xOffset'] = 1,
	}
	classes['SHAMAN'][444490]['enabled'] = false -- Hydrobubble

	Private:Print(L["Custom ElvUI aura filters loaded."], installer)
end
