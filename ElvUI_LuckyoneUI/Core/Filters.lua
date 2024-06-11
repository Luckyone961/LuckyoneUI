local Name, Private = ...
local E, L, V, P, G = unpack(ElvUI)

local pairs = pairs

-- Function to add IDs to a list
local function Add(list, ids, value)
	for _, id in pairs(ids) do
		list[id] = list[id] or value
	end
end

-- Aura Filters DB
function L1UI:Setup_Filters_Retail()
	if not E.Retail then return end

	-- General setup
	local unitframe = E.global['unitframe'] or {}
	local aurafilters = unitframe['aurafilters'] or {}
	local aurawatch = unitframe['aurawatch'] or {}

	-- Classes setup
	local classes = {
		-- Healers
		DRUID = aurawatch['DRUID'] or {},
		EVOKER = aurawatch['EVOKER'] or {},
		MONK = aurawatch['MONK'] or {},
		PALADIN = aurawatch['PALADIN'] or {},
		PRIEST = aurawatch['PRIEST'] or {},
		SHAMAN = aurawatch['SHAMAN'] or {},
		-- Others
		HUNTER = aurawatch['HUNTER'] or {},
		ROGUE = aurawatch['ROGUE'] or {},
		WARRIOR = aurawatch['WARRIOR'] or {}
	}

	local ids = {
		-- General
		blacklist = { 393957, 382428, 388755 },
		whitelist = {},
		-- Healers
		DRUID = { 207386, 188550, 155777, 203554, 774, 102351, 102352, 8936, 33763, 48438, 200389 },
		EVOKER = { 367364, 376788, 363502, 406732, 410089, 364343, 395152, 373267, 366155, 369459, 357170, 360827, 355941, 406789 },
		MONK = { 325209, 115175, 191840, 116849, 119611, 124682, 116841 },
		PALADIN = { 1044, 200025, 287280, 148039, 6940, 156910, 157047, 204018, 223306, 53563, 1022, 395180 },
		PRIEST = { 139, 193065, 10060, 214206, 17, 33206, 194384, 41635, 47788, 6788, 77489 },
		SHAMAN = { 61295, 383648, 974 },
		-- Others
		HUNTER = { 90361 },
		ROGUE = { 57934 },
		WARRIOR = { 3411 }
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
	classes['DRUID'][207386]['style'] = 'texturedIcon'
	classes['DRUID'][188550]['style'] = 'texturedIcon'
	classes['DRUID'][155777]['style'] = 'texturedIcon'
	classes['DRUID'][203554]['style'] = 'texturedIcon'
	classes['DRUID'][774]['style'] = 'texturedIcon'
	classes['DRUID'][102351]['style'] = 'texturedIcon'
	classes['DRUID'][102352]['style'] = 'texturedIcon'
	classes['DRUID'][8936]['style'] = 'texturedIcon'
	classes['DRUID'][33763]['style'] = 'texturedIcon'
	classes['DRUID'][48438]['style'] = 'texturedIcon'
	classes['DRUID'][200389]['style'] = 'texturedIcon'

	-- Evoker
	classes['EVOKER'][367364]["style"] = "texturedIcon"
	classes['EVOKER'][376788]["style"] = "texturedIcon"
	classes['EVOKER'][363502]["style"] = "texturedIcon"
	classes['EVOKER'][406732] = {
		["point"] = "TOP",
		["displayText"] = true,
		["sizeOffset"] = 4,
		["style"] = "texturedIcon",
	}
	classes['EVOKER'][410089] = {
		["point"] = "TOPRIGHT",
		["displayText"] = true,
		["sizeOffset"] = 6,
		["style"] = "timerOnly",
		["color"] = {
			["a"] = 1,
			["r"] = 1,
			["g"] = 1,
			["b"] = 1,
		},
	}
	classes['EVOKER'][364343]["style"] = "texturedIcon"
	classes['EVOKER'][395152] = {
		["displayText"] = true,
		["enabled"] = false,
		["sizeOffset"] = 6,
		["style"] = "texturedIcon",
	}
	classes['EVOKER'][373267]["style"] = "texturedIcon"
	classes['EVOKER'][366155]["style"] = "texturedIcon"
	classes['EVOKER'][369459] = {
		["enabled"] = true,
		["anyUnit"] = true,
		["point"] = "TOPLEFT",
		["cooldownAnchor"] = "CENTER",
		["id"] = 369459,
		["displayText"] = false,
		["textThreshold"] = -1,
		["yOffset"] = 0,
		["countAnchor"] = "BOTTOMRIGHT",
		["sizeOffset"] = 6,
		["style"] = "texturedIcon",
		["countY"] = 1,
		["countX"] = 1,
		["xOffset"] = 0,
		["color"] = {
			["b"] = 1,
			["g"] = 1,
			["r"] = 1,
		},
		["onlyShowMissing"] = false,
	}
	classes['EVOKER'][357170]["style"] = "texturedIcon"
	classes['EVOKER'][360827] = {
		["point"] = "TOPLEFT",
		["countAnchor"] = "BOTTOM",
		["sizeOffset"] = 6,
		["style"] = "texturedIcon",
		["color"] = {
			["a"] = 1,
			["b"] = 1,
			["g"] = 1,
			["r"] = 1,
		},
	}
	classes['EVOKER'][355941]["style"] = "texturedIcon"
	classes['EVOKER'][406789] = {
		["point"] = "TOP",
		["displayText"] = true,
		["sizeOffset"] = 4,
		["style"] = "texturedIcon",
	}

	-- Monk
	classes['MONK'][325209] = {
		["point"] = "BOTTOMRIGHT",
		["xOffset"] = -14,
		["sizeOffset"] = 4,
		["style"] = "texturedIcon",
	}
	classes['MONK'][115175] = {
		["point"] = "TOPRIGHT",
		["xOffset"] = -14,
		["sizeOffset"] = 4,
		["style"] = "texturedIcon",
	}
	classes['MONK'][191840] = {
		["point"] = "TOP",
		["sizeOffset"] = 4,
		["style"] = "texturedIcon",
	}
	classes['MONK'][116849] = {
		["point"] = "TOPLEFT",
		["sizeOffset"] = 4,
		["style"] = "texturedIcon",
	}
	classes['MONK'][119611] = {
		["point"] = "TOPRIGHT",
		["displayText"] = true,
		["countY"] = 0,
		["sizeOffset"] = 4,
		["style"] = "texturedIcon",
		["cooldownY"] = 0,
	}
	classes['MONK'][124682] = {
		["point"] = "BOTTOMRIGHT",
		["displayText"] = true,
		["countY"] = 0,
		["sizeOffset"] = 4,
		["style"] = "texturedIcon",
		["countX"] = 0,
		["cooldownY"] = 0,
	}
	classes['MONK'][116841] = {
		["point"] = "TOPLEFT",
		["anyUnit"] = true,
		["sizeOffset"] = 4,
		["style"] = "texturedIcon",
		["xOffset"] = 14,
	}

	-- Paladin
	classes['PALADIN'][1044]['style'] = 'texturedIcon'
	classes['PALADIN'][200025]['style'] = 'texturedIcon'
	classes['PALADIN'][287280]['style'] = 'texturedIcon'
	classes['PALADIN'][148039]['style'] = 'texturedIcon'
	classes['PALADIN'][6940]['style'] = 'texturedIcon'
	classes['PALADIN'][156910]['style'] = 'texturedIcon'
	classes['PALADIN'][157047]['style'] = 'texturedIcon'
	classes['PALADIN'][204018]['style'] = 'texturedIcon'
	classes['PALADIN'][223306]['style'] = 'texturedIcon'
	classes['PALADIN'][53563]['style'] = 'texturedIcon'
	classes['PALADIN'][1022]['style'] = 'texturedIcon'
	classes['PALADIN'][395180]['style'] = 'texturedIcon'

	-- Priest
	classes['PRIEST'][139]['style'] = 'texturedIcon'
	classes['PRIEST'][193065]['style'] = 'texturedIcon'
	classes['PRIEST'][10060]['style'] = 'texturedIcon'
	classes['PRIEST'][214206]['style'] = 'texturedIcon'
	classes['PRIEST'][17]['style'] = 'texturedIcon'
	classes['PRIEST'][33206]['style'] = 'texturedIcon'
	classes['PRIEST'][194384]['style'] = 'texturedIcon'
	classes['PRIEST'][41635]['style'] = 'texturedIcon'
	classes['PRIEST'][47788]['style'] = 'texturedIcon'
	classes['PRIEST'][6788]['style'] = 'texturedIcon'
	classes['PRIEST'][77489]['style'] = 'texturedIcon'

	-- Shaman
	classes['SHAMAN'][61295]['style'] = 'texturedIcon'
	classes['SHAMAN'][383648]['style'] = 'texturedIcon'
	classes['SHAMAN'][974]['style'] = 'texturedIcon'

	-- Hunter
	classes['HUNTER'][90361]['style'] = 'texturedIcon'

	-- Rogue
	classes['ROGUE'][57934]['style'] = 'texturedIcon'

	-- Warrior
	classes['WARRIOR'][3411]['style'] = 'texturedIcon'
end

function L1UI:Setup_Filters_Cata()
	if not E.Cata then return end

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
		DRUID = { 467, 48438, 8936, 33763, 774, 29166 },
		PALADIN = { 1044, 1022, 1038, 6940, 53563 },
		PRIEST = { 41635, 17, 33206, 6788, 10060, 47788, 139 },
		SHAMAN = { 61295, 974, 51945, 16177 },
		-- Others
		DEATHKNIGHT = { 49016 },
		MAGE = { 130 },
		WARLOCK = { 5697, 20707 },
		HUNTER = { 34477 },
		ROGUE = { 57933 },
		WARRIOR = { 3411, 50720 }
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
		["countY"] = -10,
		["countAnchor"] = "BOTTOM",
		["style"] = "texturedIcon",
		["countX"] = 0,
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
	classes["SHAMAN"][16177] = {
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
