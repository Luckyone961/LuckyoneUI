-- Lua functions
local pairs = pairs
local unpack = unpack

-- AddOn namespace
local _, Private = ...

-- ElvUI modules
local E = unpack(ElvUI)

-- Function to add IDs to a list
local function Add(list, ids, value)
	for _, id in pairs(ids) do
		list[id] = list[id] or value
	end
end

-- Aura filters: Retail
function Private:Setup_Filters_Retail()
	if not E.Retail then return end

	-- General vars
	local unitframe = E.global['unitframe'] or {}
	local aurafilters = unitframe['aurafilters'] or {}
	local aurawatch = unitframe['aurawatch'] or {}
	local auraHighlight = unitframe['AuraHighlightColors'] or {}

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
		EVOKER = { 367364, 376788, 363502, 406732, 410089, 364343, 395152, 373267, 366155, 369459, 357170, 360827, 355941, 406789, 361022 },
		MONK = { 325209, 115175, 191840, 116849, 119611, 124682, 116841 },
		PALADIN = { 1044, 200025, 148039, 6940, 156910, 157047, 204018, 223306, 53563, 1022, 395180, 156322, 481381 },
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
	classes['EVOKER'][355941] = {
		["displayText"] = true,
		["sizeOffset"] = 2,
		["style"] = "texturedIcon",
		["xOffset"] = 1,
		["yOffset"] = 1,
	}
	classes['EVOKER'][357170] = {
		["displayText"] = true,
		["point"] = "RIGHT",
		["sizeOffset"] = 2,
		["style"] = "texturedIcon",
		["xOffset"] = 1,
	}
	classes['EVOKER'][360827] = {
		["countAnchor"] = "BOTTOM",
		["point"] = "TOPLEFT",
		["sizeOffset"] = 6,
		["style"] = "texturedIcon",
		["xOffset"] = -1,
		["yOffset"] = 1,
	}
	classes['EVOKER'][361022] = {
		["point"] = "BOTTOMLEFT",
		["sizeOffset"] = 6,
		["style"] = "texturedIcon",
		["xOffset"] = -1,
		["yOffset"] = -1,
	}
	classes['EVOKER'][363502] = {
		["displayText"] = true,
		["point"] = "BOTTOMRIGHT",
		["sizeOffset"] = 2,
		["style"] = "texturedIcon",
		["xOffset"] = 1,
		["yOffset"] = -1,
	}
	classes['EVOKER'][364343] = {
		["displayText"] = true,
		["sizeOffset"] = 2,
		["style"] = "texturedIcon",
		["xOffset"] = -17,
		["yOffset"] = 1,
	}
	classes['EVOKER'][366155] = {
		["displayText"] = true,
		["point"] = "TOP",
		["sizeOffset"] = 2,
		["style"] = "texturedIcon",
		["xOffset"] = 17,
		["yOffset"] = 1,
	}
	classes['EVOKER'][367364] = {
		["displayText"] = true,
		["point"] = "TOP",
		["sizeOffset"] = 2,
		["style"] = "texturedIcon",
		["xOffset"] = 0,
		["yOffset"] = 1,
	}
	classes['EVOKER'][369459] = {
		["anyUnit"] = true,
		["cooldownAnchor"] = "CENTER",
		["countAnchor"] = "BOTTOMRIGHT",
		["countX"] = 1,
		["countY"] = 1,
		["displayText"] = false,
		["enabled"] = true,
		["id"] = 369459,
		["onlyShowMissing"] = false,
		["point"] = "TOPLEFT",
		["sizeOffset"] = 6,
		["style"] = "texturedIcon",
		["textThreshold"] = -1,
		["xOffset"] = -1,
		["yOffset"] = 1,
	}
	classes['EVOKER'][373267] = {
		["displayText"] = true,
		["point"] = "TOPLEFT",
		["sizeOffset"] = 2,
		["style"] = "texturedIcon",
		["xOffset"] = 16,
		["yOffset"] = 1,
	}
	classes['EVOKER'][376788] = {
		["displayText"] = true,
		["sizeOffset"] = 2,
		["style"] = "texturedIcon",
		["xOffset"] = -16,
		["yOffset"] = 1,
	}
	classes['EVOKER'][395152] = {
		["displayText"] = true,
		["enabled"] = false,
		["sizeOffset"] = 6,
		["style"] = "texturedIcon",
	}
	classes['EVOKER'][406732] = {
		["displayText"] = true,
		["point"] = "TOP",
		["sizeOffset"] = 6,
		["style"] = "texturedIcon",
		["yOffset"] = 1,
	}
	classes['EVOKER'][406789] = {
		["displayText"] = true,
		["point"] = "TOP",
		["sizeOffset"] = 6,
		["style"] = "texturedIcon",
		["yOffset"] = 1,
	}
	classes['EVOKER'][410089] = {
		["color"] = {
			["a"] = 1,
			["b"] = 1,
			["g"] = 1,
			["r"] = 1,
		},
		["displayText"] = true,
		["point"] = "TOPRIGHT",
		["sizeOffset"] = 6,
		["style"] = "timerOnly",
	}

	auraHighlight[410089] = {
		["enable"] = true,
		["ownOnly"] = true,
		["style"] = "FILL",
		["color"] = {
			["a"] = 0.65,
			["r"] = 0.80,
			["g"] = 0.59,
			["b"] = 0.34,
		},
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
	classes['PALADIN'][481381]['style'] = 'texturedIcon'
	classes['PALADIN'][156322]['style'] = 'texturedIcon'
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

-- Aura filters: Cataclysm
function Private:Setup_Filters_Cata()
	if not E.Cata then return end

	-- General vars
	local unitframe = E.global['unitframe'] or {}
	local aurafilters = unitframe['aurafilters'] or {}
	local aurawatch = unitframe['aurawatch'] or {}
	local auraHighlight = unitframe['AuraHighlightColors'] or {}

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
		PRIEST = { 41635, 17, 33206, 6788, 10060, 47788, 139, 56161 },
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
	classes["PRIEST"][56161] = {
		["cooldownY"] = 0,
		["displayText"] = true,
		["cooldownX"] = 0,
		["style"] = "texturedIcon",
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

-- Aura filters: Classic
function Private:Setup_Filters_Classic()
	if not E.Classic then return end

	-- General vars
	local unitframe = E.global['unitframe'] or {}
	local aurafilters = unitframe['aurafilters'] or {}
	local aurawatch = unitframe['aurawatch'] or {}
	local auraHighlight = unitframe['AuraHighlightColors'] or {}

	-- Classes setup
	local classes = {
		-- Healers
		DRUID = aurawatch['DRUID'] or {},
		PALADIN = aurawatch['PALADIN'] or {},
		PRIEST = aurawatch['PRIEST'] or {},
		SHAMAN = aurawatch['SHAMAN'] or {},
		-- Others
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
		DRUID = { 21849, 467, 1126, 8936, 408120, 774, 29166 },
		PALADIN = { 19740, 25894, 1044, 25782, 6940, 19746, 1022, 19742, 19977, 465 },
		PRIEST = { 6346, 139, 27683, 1243, 10060, 402004, 17, 27681, 14752, 401877, 21562, 976 },
		SHAMAN = { 8072, 25909, 10596, 8182, 29203, 8185, 16237, 16191, 5677, 5672 },
		-- Others
		MAGE = { 1008, 604, 1459, 23028, 130, 400735 },
		WARLOCK = { 2970, 6512, 11743, 5697 },
		HUNTER = { 19506, 13159, 20043 },
		ROGUE = {},
		WARRIOR = { 6673 }
	}

	-- Druid
	classes["DRUID"][21849] = {
		["style"] = "texturedIcon",
	}
	classes["DRUID"][467] = {
		["style"] = "texturedIcon",
	}
	classes["DRUID"][1126] = {
		["style"] = "texturedIcon",
	}
	classes["DRUID"][8936] = {
		["style"] = "texturedIcon",
	}
	classes["DRUID"][408120] = {
		["style"] = "texturedIcon",
	}
	classes["DRUID"][774] = {
		["style"] = "texturedIcon",
	}
	classes["DRUID"][29166] = {
		["style"] = "texturedIcon",
	}

	-- Paladin
	classes["PALADIN"][19740] = {
		["style"] = "texturedIcon",
	}
	classes["PALADIN"][25894] = {
		["style"] = "texturedIcon",
	}
	classes["PALADIN"][1044] = {
		["style"] = "texturedIcon",
	}
	classes["PALADIN"][25782] = {
		["style"] = "texturedIcon",
	}
	classes["PALADIN"][6940] = {
		["style"] = "texturedIcon",
	}
	classes["PALADIN"][19746] = {
		["style"] = "texturedIcon",
	}
	classes["PALADIN"][1022] = {
		["style"] = "texturedIcon",
	}
	classes["PALADIN"][19742] = {
		["style"] = "texturedIcon",
	}
	classes["PALADIN"][19977] = {
		["style"] = "texturedIcon",
	}
	classes["PALADIN"][465] = {
		["style"] = "texturedIcon",
	}

	-- Priest
	classes["PRIEST"][6346] = {
		["point"] = "BOTTOMRIGHT",
		["yOffset"] = -1,
		["anyUnit"] = true,
		["style"] = "texturedIcon",
		["xOffset"] = 1,
	}
	classes["PRIEST"][139] = {
		["point"] = "TOPLEFT",
		["yOffset"] = 1,
		["style"] = "texturedIcon",
		["xOffset"] = -1,
	}
	classes["PRIEST"][27683] = {
		["yOffset"] = -1,
		["style"] = "texturedIcon",
		["xOffset"] = 25,
	}
	classes["PRIEST"][1243] = {
		["point"] = "BOTTOMLEFT",
		["yOffset"] = -1,
		["style"] = "texturedIcon",
		["xOffset"] = -1,
	}
	classes["PRIEST"][10060] = {
		["yOffset"] = 1,
		["style"] = "texturedIcon",
	}
	classes["PRIEST"][402004] = {
		["yOffset"] = 1,
		["style"] = "texturedIcon",
	}
	classes["PRIEST"][17] = {
		["point"] = "TOPLEFT",
		["yOffset"] = 1,
		["style"] = "texturedIcon",
		["xOffset"] = 25,
	}
	classes["PRIEST"][27681] = {
		["point"] = "BOTTOMLEFT",
		["yOffset"] = -1,
		["style"] = "texturedIcon",
		["xOffset"] = 12,
	}
	classes["PRIEST"][14752] = {
		["point"] = "BOTTOMLEFT",
		["yOffset"] = -1,
		["style"] = "texturedIcon",
		["xOffset"] = 12,
	}
	classes["PRIEST"][401877] = {
		["point"] = "TOPLEFT",
		["yOffset"] = 1,
		["countY"] = 0,
		["style"] = "texturedIcon",
		["countX"] = 0,
		["xOffset"] = 12,
	}
	classes["PRIEST"][21562] = {
		["point"] = "BOTTOMLEFT",
		["yOffset"] = -1,
		["style"] = "texturedIcon",
		["xOffset"] = -1,
	}
	classes["PRIEST"][976] = {
		["yOffset"] = -1,
		["style"] = "texturedIcon",
		["xOffset"] = 25,
	}

	-- Shaman
	classes["SHAMAN"][8072] = {
		["style"] = "texturedIcon",
	}
	classes["SHAMAN"][25909] = {
		["style"] = "texturedIcon",
	}
	classes["SHAMAN"][10596] = {
		["style"] = "texturedIcon",
	}
	classes["SHAMAN"][8182] = {
		["style"] = "texturedIcon",
	}
	classes["SHAMAN"][29203] = {
		["style"] = "texturedIcon",
	}
	classes["SHAMAN"][8185] = {
		["style"] = "texturedIcon",
	}
	classes["SHAMAN"][16237] = {
		["style"] = "texturedIcon",
	}
	classes["SHAMAN"][16191] = {
		["style"] = "texturedIcon",
	}
	classes["SHAMAN"][5677] = {
		["style"] = "texturedIcon",
	}
	classes["SHAMAN"][5672] = {
		["style"] = "texturedIcon",
	}

	-- Mage
	classes["MAGE"][1008] = {
		["style"] = "texturedIcon",
	}
	classes["MAGE"][604] = {
		["style"] = "texturedIcon",
	}
	classes["MAGE"][1459] = {
		["style"] = "texturedIcon",
	}
	classes["MAGE"][23028] = {
		["style"] = "texturedIcon",
	}
	classes["MAGE"][130] = {
		["style"] = "texturedIcon",
	}
	classes["MAGE"][400735] = {
		["style"] = "texturedIcon",
	}

	-- Warlock
	classes["WARLOCK"][2970] = {
		["style"] = "texturedIcon",
	}
	classes["WARLOCK"][6512] = {
		["style"] = "texturedIcon",
	}
	classes["WARLOCK"][11743] = {
		["style"] = "texturedIcon",
	}
	classes["WARLOCK"][5697] = {
		["style"] = "texturedIcon",
	}

	-- Hunter
	classes["HUNTER"][19506] = {
		["style"] = "texturedIcon",
	}
	classes["HUNTER"][13159] = {
		["style"] = "texturedIcon",
	}
	classes["HUNTER"][20043] = {
		["style"] = "texturedIcon",
	}

	-- Warrior
	classes["WARRIOR"][6673] = {
		["style"] = "texturedIcon",
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
end
