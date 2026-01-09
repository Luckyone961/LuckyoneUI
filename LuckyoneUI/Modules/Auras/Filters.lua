-- Addon namespace
local _, Private = ...
local L = Private.Libs.ACL

-- ElvUI file
if not Private.ElvUI then
	return
end

-- Lua functions
local ipairs = ipairs
local pairs = pairs
local unpack = unpack

-- ElvUI modules
local E = unpack(ElvUI)

-- Function to add IDs to a list
local function Add(list, ids, value)
	for _, id in ipairs(ids) do
		list[id] = list[id] or value
	end
end

-- Aura filters: Installer Function
function Private:Setup_Filters(installer)
	if Private.isRetail then
		Private:Setup_Filters_Retail()
	elseif Private.isMists then
		Private:Setup_Filters_Mists()
	elseif Private.isTBC then
		Private:Setup_Filters_TBC()
	elseif Private.isClassic then
		Private:Setup_Filters_Classic()
	end

	if installer then
		_G.LuckyoneInstallStepComplete:ShowMessage(L["Custom ElvUI aura filters loaded."])
	end

	Private:Print(L["Custom ElvUI aura filters loaded."])
end

-- Aura filters: Retail
function Private:Setup_Filters_Retail()
	if not Private.isRetail then return end

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
		blacklist = {},
		whitelist = {},
		-- Healers
		DRUID = { 207386, 188550, 155777, 203554, 774, 102351, 102352, 8936, 33763, 48438, 200389, 157982, 391891 },
		EVOKER = { 367364, 376788, 363502, 406732, 410089, 364343, 395152, 373267, 366155, 369459, 357170, 360827, 355941, 406789, 361022, 412710 },
		MONK = { 325209, 115175, 116849, 119611, 124682, 116841 },
		PALADIN = { 1044, 200025, 148039, 6940, 156910, 157047, 204018, 53563, 1022, 395180, 156322, 223306, 431381 },
		PRIEST = { 139, 193065, 10060, 17, 33206, 194384, 41635, 47788, 6788, 77489 },
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
	classes['DRUID'][188550] = { -- Lifebloom
		['displayText'] = true,
		['yOffset'] = 1,
		['sizeOffset'] = 2,
		['style'] = 'texturedIcon',
		['xOffset'] = 33,
	}
	classes['DRUID'][33763] = { -- Lifebloom
		['displayText'] = true,
		['yOffset'] = 1,
		['sizeOffset'] = 2,
		['style'] = 'texturedIcon',
		['xOffset'] = 33,
	}
	classes['DRUID'][774] = { -- Rejuvenation
		['point'] = 'TOPLEFT',
		['displayText'] = true,
		['yOffset'] = 1,
		['sizeOffset'] = 2,
		['style'] = 'texturedIcon',
		['xOffset'] = -1,
	}
	classes['DRUID'][155777] = { -- Rejuvenation (Germination)
		['point'] = 'TOPLEFT',
		['displayText'] = true,
		['yOffset'] = 1,
		['sizeOffset'] = 2,
		['style'] = 'texturedIcon',
		['xOffset'] = 16,
	}
	classes['DRUID'][8936] = { -- Regrowth
		['point'] = 'TOPRIGHT',
		['displayText'] = true,
		['yOffset'] = 1,
		['sizeOffset'] = 2,
		['style'] = 'texturedIcon',
		['xOffset'] = -16,
	}
	classes['DRUID'][48438] = { -- Wild Growth
		['point'] = 'TOPRIGHT',
		['displayText'] = true,
		['yOffset'] = 1,
		['sizeOffset'] = 2,
		['style'] = 'texturedIcon',
		['xOffset'] = 1,
	}
	classes['DRUID'][391891] = { -- Adaptive Swarm
		['point'] = 'TOPRIGHT',
		['displayText'] = true,
		['yOffset'] = 1,
		['sizeOffset'] = 2,
		['style'] = 'texturedIcon',
		['xOffset'] = -33,
	}
	classes['DRUID'][102351] = { -- Cenarion Ward
		['point'] = 'RIGHT',
		['displayText'] = true,
		['sizeOffset'] = 2,
		['style'] = 'texturedIcon',
		['xOffset'] = 1,
	}
	classes['DRUID'][102352] = { -- Cenarion Ward
		['point'] = 'RIGHT',
		['displayText'] = true,
		['sizeOffset'] = 2,
		['style'] = 'texturedIcon',
		['xOffset'] = 1,
	}
	classes['DRUID'][207386]['enabled'] = false -- Spring Blossoms
	classes['DRUID'][203554]['enabled'] = false -- Focused Growth
	classes['DRUID'][157982]['enabled'] = false -- Tranquility
	classes['DRUID'][200389]['enabled'] = false -- Cultivation

	-- Evoker
	classes['EVOKER'][355941] = { -- Dream Breath
		['displayText'] = true,
		['sizeOffset'] = 2,
		['style'] = 'texturedIcon',
		['xOffset'] = 1,
		['yOffset'] = 1,
	}
	classes['EVOKER'][376788] = { -- Dream Breath (Echo)
		['displayText'] = true,
		['sizeOffset'] = 2,
		['style'] = 'texturedIcon',
		['xOffset'] = -16,
		['yOffset'] = 1,
	}
	classes['EVOKER'][366155] = { -- Reversion
		['displayText'] = true,
		['point'] = 'TOP',
		['sizeOffset'] = 2,
		['style'] = 'texturedIcon',
		['xOffset'] = 17,
		['yOffset'] = 1,
	}
	classes['EVOKER'][367364] = { -- Reversion (Echo)
		['displayText'] = true,
		['point'] = 'TOP',
		['sizeOffset'] = 2,
		['style'] = 'texturedIcon',
		['xOffset'] = 0,
		['yOffset'] = 1,
	}
	classes['EVOKER'][373267] = { -- Life Bind
		['displayText'] = true,
		['point'] = 'TOPLEFT',
		['sizeOffset'] = 2,
		['style'] = 'texturedIcon',
		['xOffset'] = 16,
		['yOffset'] = 1,
	}
	classes['EVOKER'][364343] = { -- Echo
		['color'] = {
			['a'] = 1,
			['r'] = 1,
			['g'] = 1,
			['b'] = 1,
		},
		['displayText'] = true,
		['yOffset'] = 2,
		['sizeOffset'] = 6,
		['style'] = 'timerOnly',
		['xOffset'] = -17,
	}
	auraHighlight[364343] = { -- Echo
		['enable'] = true,
		['ownOnly'] = true,
		['style'] = 'FILL',
		['color'] = {
			['a'] = 0.45,
			['b'] = 0.51,
			['g'] = 0.96,
			['r'] = 0.51,
		},
	}
	classes['EVOKER'][357170] = { -- Time Dilation
		['displayText'] = true,
		['point'] = 'RIGHT',
		['sizeOffset'] = 2,
		['style'] = 'texturedIcon',
		['xOffset'] = 1,
	}
	classes['EVOKER'][363502] = { -- Dream Flight
		['displayText'] = true,
		['point'] = 'BOTTOMRIGHT',
		['sizeOffset'] = 2,
		['style'] = 'texturedIcon',
		['xOffset'] = 1,
		['yOffset'] = -1,
	}
	classes['EVOKER'][406732] = { -- Spatial Paradox (Player)
		['displayText'] = true,
		['point'] = 'TOP',
		['sizeOffset'] = 2,
		['style'] = 'texturedIcon',
		['yOffset'] = 1,
	}
	classes['EVOKER'][406789] = { -- Spatial Paradox (Others)
		['displayText'] = true,
		['point'] = 'TOP',
		['sizeOffset'] = 2,
		['style'] = 'texturedIcon',
		['yOffset'] = 1,
	}
	classes['EVOKER'][410089] = { -- Prescience
		['color'] = {
			['a'] = 1,
			['b'] = 1,
			['g'] = 1,
			['r'] = 1,
		},
		['displayText'] = true,
		['point'] = 'TOPRIGHT',
		['sizeOffset'] = 6,
		['style'] = 'timerOnly',
	}
	auraHighlight[410089] = { -- Prescience
		['enable'] = true,
		['ownOnly'] = true,
		['style'] = 'FILL',
		['color'] = {
			['a'] = 0.65,
			['r'] = 0.80,
			['g'] = 0.59,
			['b'] = 0.34,
		},
	}
	classes['EVOKER'][360827] = { -- Blistering Scales
		['countAnchor'] = 'BOTTOM',
		['point'] = 'TOPLEFT',
		['sizeOffset'] = 2,
		['style'] = 'texturedIcon',
		['xOffset'] = -1,
		['yOffset'] = 1,
	}
	classes['EVOKER'][361022] = { -- Sense Power
		['point'] = 'BOTTOMLEFT',
		['sizeOffset'] = 2,
		['style'] = 'texturedIcon',
		['xOffset'] = -1,
		['yOffset'] = -1,
	}
	classes['EVOKER'][369459] = { -- Source of Magic
		['anyUnit'] = true,
		['cooldownAnchor'] = 'CENTER',
		['countAnchor'] = 'BOTTOMRIGHT',
		['countX'] = 1,
		['countY'] = 1,
		['displayText'] = false,
		['enabled'] = true,
		['id'] = 369459,
		['onlyShowMissing'] = false,
		['point'] = 'TOPLEFT',
		['sizeOffset'] = 2,
		['style'] = 'texturedIcon',
		['textThreshold'] = -1,
		['xOffset'] = -1,
		['yOffset'] = 1,
	}
	classes['EVOKER'][412710] = { -- Timelessness
		['point'] = 'TOPLEFT',
		['color'] = {
			['b'] = 1,
			['g'] = 1,
			['r'] = 1,
		},
		['displayText'] = false,
		['yOffset'] = 1,
		['enabled'] = true,
		['anyUnit'] = false,
		['cooldownX'] = 1,
		['id'] = 412710,
		['countY'] = 1,
		['textThreshold'] = -1,
		['countAnchor'] = 'BOTTOMRIGHT',
		['sizeOffset'] = 2,
		['style'] = 'texturedIcon',
		['cooldownY'] = 1,
		['countX'] = 1,
		['cooldownAnchor'] = 'CENTER',
		['xOffset'] = -1,
		['onlyShowMissing'] = false,
	}
	classes['EVOKER'][395152]['enabled'] = false -- Ebon Might (Others)

	-- Monk
	classes['MONK'][119611] = { -- Renewing Mist
		['displayText'] = true,
		['yOffset'] = 1,
		['countY'] = 0,
		['sizeOffset'] = 2,
		['style'] = 'texturedIcon',
		['xOffset'] = -1,
		['cooldownY'] = 0,
	}
	classes['MONK'][124682] = { -- Enveloping Mist
		['point'] = 'TOPLEFT',
		['displayText'] = true,
		['yOffset'] = 1,
		['countY'] = 0,
		['sizeOffset'] = 2,
		['style'] = 'texturedIcon',
		['countX'] = 0,
		['xOffset'] = 16,
		['cooldownY'] = 0,
	}
	classes['MONK'][325209] = { -- Enveloping Breath
		['point'] = 'TOPLEFT',
		['xOffset'] = 33,
		['displayText'] = true,
		['yOffset'] = 1,
		['sizeOffset'] = 2,
		['style'] = 'texturedIcon',
	}
	classes['MONK'][115175] = { -- Soothing Mist
		['point'] = 'BOTTOMLEFT',
		['xOffset'] = -1,
		['displayText'] = true,
		['yOffset'] = -1,
		['sizeOffset'] = 2,
		['style'] = 'texturedIcon',
	}
	classes['MONK'][116849] = { -- Life Cocoon
		['point'] = 'RIGHT',
		['displayText'] = true,
		['sizeOffset'] = 2,
		['style'] = 'texturedIcon',
		['xOffset'] = 1,
	}
	classes['MONK'][116841] = { -- Tiger's Lust
		['point'] = 'TOPRIGHT',
		['displayText'] = true,
		['yOffset'] = 1,
		['sizeOffset'] = 2,
		['style'] = 'texturedIcon',
		['xOffset'] = 1,
	}

	-- Paladin
	classes['PALADIN'][431381] = { -- Dawnlight
		["point"] = "TOPLEFT",
		["displayText"] = true,
		["yOffset"] = 1,
		["sizeOffset"] = 2,
		["style"] = "texturedIcon",
		["xOffset"] = -1,
	}
	classes['PALADIN'][6940] = { -- Hand of Sacrifice
		["point"] = "TOPLEFT",
		["displayText"] = true,
		["yOffset"] = 1,
		["sizeOffset"] = 2,
		["style"] = "texturedIcon",
		["xOffset"] = 16,
	}
	classes['PALADIN'][148039] = { -- Barrier of Faith (Accumulation)
		["point"] = "TOPRIGHT",
		["displayText"] = true,
		["yOffset"] = 1,
		["sizeOffset"] = 2,
		["style"] = "texturedIcon",
		["xOffset"] = -16,
	}
	classes['PALADIN'][395180] = { -- Barrier of Faith (Absorbtion)
		["point"] = "TOPRIGHT",
		["displayText"] = true,
		["yOffset"] = 1,
		["sizeOffset"] = 2,
		["style"] = "texturedIcon",
		["xOffset"] = -16,
	}
	classes['PALADIN'][53563] = { -- Beacon of Light
		["displayText"] = true,
		["yOffset"] = 1,
		["sizeOffset"] = 2,
		["style"] = "texturedIcon",
		["xOffset"] = 1,
	}
	classes['PALADIN'][200025] = { -- Beacon of Virtue
		["displayText"] = true,
		["yOffset"] = 1,
		["sizeOffset"] = 2,
		["style"] = "texturedIcon",
		["xOffset"] = 1,
	}
	classes['PALADIN'][156910] = { -- Beacon of Faith
		["displayText"] = true,
		["yOffset"] = 1,
		["sizeOffset"] = 2,
		["style"] = "texturedIcon",
		["xOffset"] = 1,
	}
	classes['PALADIN'][1022] = { -- Hand of Protection
		["point"] = "RIGHT",
		["displayText"] = true,
		["sizeOffset"] = 2,
		["style"] = "texturedIcon",
		["xOffset"] = 1,
	}
	classes['PALADIN'][204018] = { -- Blessing of Spellwarding
		["point"] = "RIGHT",
		["displayText"] = true,
		["sizeOffset"] = 2,
		["style"] = "texturedIcon",
		["xOffset"] = 1,
	}
	classes['PALADIN'][1044] = { -- Hand of Freedom
		["displayText"] = true,
		["yOffset"] = -1,
		["sizeOffset"] = 2,
		["style"] = "texturedIcon",
		["xOffset"] = 1,
	}
	classes['PALADIN'][157047]['enabled'] = false -- Saved by the Light
	classes['PALADIN'][156322]['enabled'] = false -- Eternal Flame
	classes['PALADIN'][223306]['enabled'] = false -- Bestow Faith

	-- Priest
	classes['PRIEST'][194384] = { -- Atonement
		["point"] = "TOPLEFT",
		["yOffset"] = 1,
		["sizeOffset"] = 2,
		["style"] = "texturedIcon",
		["xOffset"] = -1,
	}
	classes['PRIEST'][17] = { -- Power Word: Shield
		["displayText"] = true,
		["yOffset"] = 1,
		["sizeOffset"] = 2,
		["style"] = "texturedIcon",
		["xOffset"] = 16,
	}
	classes['PRIEST'][41635] = { -- Prayer of Mending
		["point"] = "TOP",
		["displayText"] = true,
		["yOffset"] = 1,
		["sizeOffset"] = 2,
		["style"] = "texturedIcon",
	}
	classes['PRIEST'][139] = { -- Renew
		["point"] = "TOPRIGHT",
		["displayText"] = true,
		["yOffset"] = 1,
		["sizeOffset"] = 2,
		["style"] = "texturedIcon",
		["xOffset"] = -16,
	}
	classes['PRIEST'][6788] = { -- Weakened Soul
		["point"] = "TOPRIGHT",
		["displayText"] = true,
		["yOffset"] = 1,
		["sizeOffset"] = 2,
		["style"] = "texturedIcon",
		["xOffset"] = 1,
	}
	classes['PRIEST'][33206] = { -- Pain Suppression
		["point"] = "RIGHT",
		["displayText"] = true,
		["sizeOffset"] = 2,
		["style"] = "texturedIcon",
		["xOffset"] = 1,
	}
	classes['PRIEST'][47788] = { -- Guardian Spirit
		["point"] = "RIGHT",
		["displayText"] = true,
		["sizeOffset"] = 2,
		["style"] = "texturedIcon",
		["xOffset"] = 1,
	}
	classes['PRIEST'][10060] = { -- Power Infusion
		["point"] = "BOTTOMRIGHT",
		["displayText"] = true,
		["yOffset"] = -1,
		["sizeOffset"] = 2,
		["style"] = "texturedIcon",
		["xOffset"] = 1,
	}
	classes['PRIEST'][77489]['enabled'] = false -- Echo of Light
	classes['PRIEST'][193065]['enabled'] = false -- Protective Light

	-- Shaman
	classes['SHAMAN'][61295] = { -- Riptide
		["point"] = "TOPLEFT",
		["displayText"] = true,
		["yOffset"] = 1,
		["sizeOffset"] = 2,
		["style"] = "texturedIcon",
		["xOffset"] = -1,
	}
	classes['SHAMAN'][383648] = { -- Earth Shield (Elemental Orbit)
		["point"] = "TOPLEFT",
		["displayText"] = true,
		["yOffset"] = 1,
		["sizeOffset"] = 2,
		["style"] = "texturedIcon",
		["xOffset"] = 16,
	}
	classes['SHAMAN'][974] = { -- Earth Shield
		["point"] = "TOPLEFT",
		["displayText"] = true,
		["yOffset"] = 1,
		["sizeOffset"] = 2,
		["style"] = "texturedIcon",
		["xOffset"] = 16,
	}

	-- Hunter
	classes['HUNTER'][90361]['style'] = 'texturedIcon' -- Spirit Mend

	-- Rogue
	classes['ROGUE'][57934]['style'] = 'texturedIcon' -- Tricks of the Trade

	-- Warrior
	classes['WARRIOR'][3411]['style'] = 'texturedIcon' -- Intervene
end

-- Aura filters: Mists of Pandaria
function Private:Setup_Filters_Mists()
	if not Private.isMists then return end

	-- General vars
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
		MONK = aurawatch['MONK'] or {},
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
		if class == 'blacklist' then
			Add(aurafilters['Blacklist'] or {}, classIDs, { enable = true, priority = 0 })
		elseif class == 'whitelist' then
			Add(aurafilters['Whitelist'] or {}, classIDs, { enable = false })
		else
			Add(classes[class], classIDs, { enable = true, color = {} })
		end
	end

	-- Druid
	classes['DRUID'][48438] = { -- Wild Growth
		['point'] = 'TOPLEFT',
		['xOffset'] = 29,
		['displayText'] = true,
		['yOffset'] = 1,
		['cooldownX'] = 0,
		['style'] = 'texturedIcon',
		['cooldownY'] = 0,
	}
	classes['DRUID'][8936] = { -- Regrowth
		['point'] = 'TOPLEFT',
		['xOffset'] = 14,
		['displayText'] = true,
		['yOffset'] = 1,
		['cooldownX'] = 0,
		['style'] = 'texturedIcon',
		['cooldownY'] = 0,
	}
	classes['DRUID'][33763] = { -- Lifebloom
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
		['point'] = 'TOPLEFT',
		['xOffset'] = -1,
		['displayText'] = true,
		['yOffset'] = 1,
		['cooldownX'] = 0,
		['style'] = 'texturedIcon',
		['cooldownY'] = 0,
	}
	classes['DRUID'][29166] = { -- Innervate
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
		['point'] = 'TOP',
		['displayText'] = true,
		['yOffset'] = 1,
		['cooldownX'] = 0,
		['style'] = 'texturedIcon',
		['cooldownY'] = 0,
	}
	classes['PALADIN'][1022] = { -- Hand of Protection
		['point'] = 'TOPRIGHT',
		['cooldownY'] = 0,
		['displayText'] = true,
		['yOffset'] = 1,
		['cooldownX'] = 0,
		['style'] = 'texturedIcon',
		['xOffset'] = 1,
	}
	classes['PALADIN'][1038] = { -- Hand of Salvation
		['point'] = 'TOPRIGHT',
		['cooldownY'] = 0,
		['displayText'] = true,
		['yOffset'] = 1,
		['cooldownX'] = 0,
		['style'] = 'texturedIcon',
		['xOffset'] = -29,
	}
	classes['PALADIN'][6940] = { -- Hand of Sacrifice
		['point'] = 'TOPRIGHT',
		['cooldownY'] = 0,
		['displayText'] = true,
		['yOffset'] = 1,
		['cooldownX'] = 0,
		['style'] = 'texturedIcon',
		['xOffset'] = -14,
	}
	classes['PALADIN'][53563] = { -- Beacon of Light
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
		['point'] = 'TOPLEFT',
		['cooldownY'] = 0,
		['displayText'] = true,
		['yOffset'] = 1,
		['cooldownX'] = 0,
		['style'] = 'texturedIcon',
		['xOffset'] = -1,
	}
	classes['PRIEST'][33206] = { -- Pain Suppression
		['cooldownY'] = 0,
		['displayText'] = true,
		['yOffset'] = 1,
		['cooldownX'] = 0,
		['style'] = 'texturedIcon',
		['xOffset'] = 1,
	}
	classes['PRIEST'][6788] = { -- Weakened Soul
		['displayText'] = true,
		['yOffset'] = 1,
		['cooldownX'] = 0,
		['style'] = 'texturedIcon',
		['cooldownY'] = 0,
	}
	classes['PRIEST'][10060] = { -- Power Infusion
		['point'] = 'TOPRIGHT',
		['cooldownY'] = 0,
		['displayText'] = true,
		['yOffset'] = 1,
		['cooldownX'] = 0,
		['style'] = 'texturedIcon',
		['xOffset'] = 1,
	}
	classes['PRIEST'][47788] = { -- Guardian Spirit
		['point'] = 'TOPRIGHT',
		['cooldownY'] = 0,
		['displayText'] = true,
		['yOffset'] = 1,
		['cooldownX'] = 0,
		['style'] = 'texturedIcon',
		['xOffset'] = 1,
	}
	classes['PRIEST'][139] = { -- Renew
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
		['point'] = 'TOPLEFT',
		['xOffset'] = -1,
		['displayText'] = true,
		['yOffset'] = 1,
		['cooldownX'] = 0,
		['style'] = 'texturedIcon',
		['cooldownY'] = 0,
	}
	classes['SHAMAN'][974] = { -- Earth Shield
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
		['point'] = 'TOPLEFT',
		['yOffset'] = 1,
		['style'] = 'texturedIcon',
		['xOffset'] = 29,
		['displayText'] = true,
		['cooldownX'] = 0,
		['cooldownY'] = 0,
	}
	classes['MONK'][119611] = { -- Renewing Mist
		['yOffset'] = 1,
		['style'] = 'texturedIcon',
		['xOffset'] = -1,
		['displayText'] = true,
		['cooldownX'] = 0,
		['cooldownY'] = 0,
	}
	classes['MONK'][116849] = { -- Life Cocoon
		['yOffset'] = 1,
		['style'] = 'texturedIcon',
		['xOffset'] = 1,
		['displayText'] = true,
		['cooldownX'] = 0,
		['cooldownY'] = 0,
	}
	classes['MONK'][132120] = { -- Enveloping Mist
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
end

-- Aura filters: TBC
function Private:Setup_Filters_TBC()
	if not Private.isTBC then return end

	-- General vars
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

	for class, classIDs in pairs(ids) do
		if class == 'blacklist' then
			Add(aurafilters['Blacklist'] or {}, classIDs, { enable = true, priority = 0 })
		elseif class == 'whitelist' then
			Add(aurafilters['Whitelist'] or {}, classIDs, { enable = false })
		else
			Add(classes[class], classIDs, { enable = true, color = {} })
		end
	end

	-- Priest
	classes['PRIEST'][6346] = { -- Fear Ward
		['point'] = 'BOTTOMRIGHT',
		['yOffset'] = -1,
		['anyUnit'] = true,
		['style'] = 'texturedIcon',
		['xOffset'] = 1,
	}
	classes['PRIEST'][139] = { -- Renew
		['point'] = 'TOPLEFT',
		['yOffset'] = 1,
		['style'] = 'texturedIcon',
		['xOffset'] = -1,
	}
	classes['PRIEST'][27683] = { -- Prayer of Shadow Protection
		['yOffset'] = -1,
		['style'] = 'texturedIcon',
		['xOffset'] = 25,
	}
	classes['PRIEST'][1243] = { -- Power Word: Fortitude
		['point'] = 'BOTTOMLEFT',
		['yOffset'] = -1,
		['style'] = 'texturedIcon',
		['xOffset'] = -1,
	}
	classes['PRIEST'][10060] = { -- Power Infusion
		['yOffset'] = 1,
		['style'] = 'texturedIcon',
	}
	classes['PRIEST'][402004] = { -- Pain Suppression
		['yOffset'] = 1,
		['style'] = 'texturedIcon',
	}
	classes['PRIEST'][17] = { -- Power Word: Shield
		['point'] = 'TOPLEFT',
		['yOffset'] = 1,
		['style'] = 'texturedIcon',
		['xOffset'] = 25,
	}
	classes['PRIEST'][27681] = { -- Prayer of Spirit
		['point'] = 'BOTTOMLEFT',
		['yOffset'] = -1,
		['style'] = 'texturedIcon',
		['xOffset'] = 12,
	}
	classes['PRIEST'][14752] = { -- Divine Spirit
		['point'] = 'BOTTOMLEFT',
		['yOffset'] = -1,
		['style'] = 'texturedIcon',
		['xOffset'] = 12,
	}
	classes['PRIEST'][401877] = { -- Prayer of Mending
		['point'] = 'TOPLEFT',
		['yOffset'] = 1,
		['countY'] = 0,
		['style'] = 'texturedIcon',
		['countX'] = 0,
		['xOffset'] = 12,
	}
	classes['PRIEST'][21562] = { -- Prayer of Fortitude
		['point'] = 'BOTTOMLEFT',
		['yOffset'] = -1,
		['style'] = 'texturedIcon',
		['xOffset'] = -1,
	}
	classes['PRIEST'][976] = { -- Shadow Protection
		['yOffset'] = -1,
		['style'] = 'texturedIcon',
		['xOffset'] = 25,
	}

	-- Druid
	classes['DRUID'][21849]['style'] = 'texturedIcon' -- Gift of the Wild
	classes['DRUID'][467]['style'] = 'texturedIcon' -- Thorns
	classes['DRUID'][1126]['style'] = 'texturedIcon' -- Mark of the Wild
	classes['DRUID'][8936]['style'] = 'texturedIcon' -- Regrowth
	classes['DRUID'][408120]['style'] = 'texturedIcon' -- Wild Growth
	classes['DRUID'][774]['style'] = 'texturedIcon' -- Rejuvenation
	classes['DRUID'][29166]['style'] = 'texturedIcon' -- Innervate

	-- Paladin
	classes['PALADIN'][19740]['style'] = 'texturedIcon' -- Blessing of Might
	classes['PALADIN'][25894]['style'] = 'texturedIcon' -- Greater Blessing of Wisdom
	classes['PALADIN'][1044]['style'] = 'texturedIcon' -- Blessing of Freedom
	classes['PALADIN'][25782]['style'] = 'texturedIcon' -- Greater Blessing of Might
	classes['PALADIN'][6940]['style'] = 'texturedIcon' -- Blessing of Sacrifice
	classes['PALADIN'][19746]['style'] = 'texturedIcon' -- Concentration Aura
	classes['PALADIN'][1022]['style'] = 'texturedIcon' -- Blessing of Protection
	classes['PALADIN'][19742]['style'] = 'texturedIcon' -- Blessing of Wisdom
	classes['PALADIN'][19977]['style'] = 'texturedIcon' -- Blessing of Light
	classes['PALADIN'][465]['style'] = 'texturedIcon' -- Devotion Aura

	-- Shaman
	classes['SHAMAN'][8072]['style'] = 'texturedIcon' -- Stoneskin Totem
	classes['SHAMAN'][25909]['style'] = 'texturedIcon' -- Tranquil Air
	classes['SHAMAN'][10596]['style'] = 'texturedIcon' -- Nature Resistance Totem
	classes['SHAMAN'][8182]['style'] = 'texturedIcon' -- Frost Resistance Totem
	classes['SHAMAN'][29203]['style'] = 'texturedIcon' -- Healing Way
	classes['SHAMAN'][8185]['style'] = 'texturedIcon' -- Fire Resistance Totem
	classes['SHAMAN'][16237]['style'] = 'texturedIcon' -- Ancestral Fortitude
	classes['SHAMAN'][16191]['style'] = 'texturedIcon' -- Mana Tide Totem
	classes['SHAMAN'][5677]['style'] = 'texturedIcon' -- Mana Spring Totem
	classes['SHAMAN'][5672]['style'] = 'texturedIcon' -- Healing Stream Totem

	-- Mage
	classes['MAGE'][1008]['style'] = 'texturedIcon' -- Amplify Magic
	classes['MAGE'][604]['style'] = 'texturedIcon' -- Dampen Magic
	classes['MAGE'][1459]['style'] = 'texturedIcon' -- Arcane Intellect
	classes['MAGE'][23028]['style'] = 'texturedIcon' -- Arcane Brilliance
	classes['MAGE'][130]['style'] = 'texturedIcon' -- Slow Fall
	classes['MAGE'][400735]['style'] = 'texturedIcon' -- Temporal Beacon

	-- Warlock
	classes['WARLOCK'][2970]['style'] = 'texturedIcon' -- Detect Invisibility
	classes['WARLOCK'][6512]['style'] = 'texturedIcon' -- Detect Lesser Invisibility
	classes['WARLOCK'][11743]['style'] = 'texturedIcon' -- Detect Greater Invisibility
	classes['WARLOCK'][5697]['style'] = 'texturedIcon' -- Unending Breath

	-- Hunter
	classes['HUNTER'][19506]['style'] = 'texturedIcon' -- Trueshot Aura
	classes['HUNTER'][13159]['style'] = 'texturedIcon' -- Aspect of the Pack
	classes['HUNTER'][20043]['style'] = 'texturedIcon' -- Aspect of the Wild

	-- Warrior
	classes['WARRIOR'][6673]['style'] = 'texturedIcon' -- Battle Shout
end

-- Aura filters: Classic
function Private:Setup_Filters_Classic()
	if not Private.isClassic then return end

	-- General vars
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

	for class, classIDs in pairs(ids) do
		if class == 'blacklist' then
			Add(aurafilters['Blacklist'] or {}, classIDs, { enable = true, priority = 0 })
		elseif class == 'whitelist' then
			Add(aurafilters['Whitelist'] or {}, classIDs, { enable = false })
		else
			Add(classes[class], classIDs, { enable = true, color = {} })
		end
	end

	-- Priest
	classes['PRIEST'][6346] = { -- Fear Ward
		['point'] = 'BOTTOMRIGHT',
		['yOffset'] = -1,
		['anyUnit'] = true,
		['style'] = 'texturedIcon',
		['xOffset'] = 1,
	}
	classes['PRIEST'][139] = { -- Renew
		['point'] = 'TOPLEFT',
		['yOffset'] = 1,
		['style'] = 'texturedIcon',
		['xOffset'] = -1,
	}
	classes['PRIEST'][27683] = { -- Prayer of Shadow Protection
		['yOffset'] = -1,
		['style'] = 'texturedIcon',
		['xOffset'] = 25,
	}
	classes['PRIEST'][1243] = { -- Power Word: Fortitude
		['point'] = 'BOTTOMLEFT',
		['yOffset'] = -1,
		['style'] = 'texturedIcon',
		['xOffset'] = -1,
	}
	classes['PRIEST'][10060] = { -- Power Infusion
		['yOffset'] = 1,
		['style'] = 'texturedIcon',
	}
	classes['PRIEST'][402004] = { -- Pain Suppression
		['yOffset'] = 1,
		['style'] = 'texturedIcon',
	}
	classes['PRIEST'][17] = { -- Power Word: Shield
		['point'] = 'TOPLEFT',
		['yOffset'] = 1,
		['style'] = 'texturedIcon',
		['xOffset'] = 25,
	}
	classes['PRIEST'][27681] = { -- Prayer of Spirit
		['point'] = 'BOTTOMLEFT',
		['yOffset'] = -1,
		['style'] = 'texturedIcon',
		['xOffset'] = 12,
	}
	classes['PRIEST'][14752] = { -- Divine Spirit
		['point'] = 'BOTTOMLEFT',
		['yOffset'] = -1,
		['style'] = 'texturedIcon',
		['xOffset'] = 12,
	}
	classes['PRIEST'][401877] = { -- Prayer of Mending
		['point'] = 'TOPLEFT',
		['yOffset'] = 1,
		['countY'] = 0,
		['style'] = 'texturedIcon',
		['countX'] = 0,
		['xOffset'] = 12,
	}
	classes['PRIEST'][21562] = { -- Prayer of Fortitude
		['point'] = 'BOTTOMLEFT',
		['yOffset'] = -1,
		['style'] = 'texturedIcon',
		['xOffset'] = -1,
	}
	classes['PRIEST'][976] = { -- Shadow Protection
		['yOffset'] = -1,
		['style'] = 'texturedIcon',
		['xOffset'] = 25,
	}

	-- Druid
	classes['DRUID'][21849]['style'] = 'texturedIcon' -- Gift of the Wild
	classes['DRUID'][467]['style'] = 'texturedIcon' -- Thorns
	classes['DRUID'][1126]['style'] = 'texturedIcon' -- Mark of the Wild
	classes['DRUID'][8936]['style'] = 'texturedIcon' -- Regrowth
	classes['DRUID'][408120]['style'] = 'texturedIcon' -- Wild Growth
	classes['DRUID'][774]['style'] = 'texturedIcon' -- Rejuvenation
	classes['DRUID'][29166]['style'] = 'texturedIcon' -- Innervate

	-- Paladin
	classes['PALADIN'][19740]['style'] = 'texturedIcon' -- Blessing of Might
	classes['PALADIN'][25894]['style'] = 'texturedIcon' -- Greater Blessing of Wisdom
	classes['PALADIN'][1044]['style'] = 'texturedIcon' -- Blessing of Freedom
	classes['PALADIN'][25782]['style'] = 'texturedIcon' -- Greater Blessing of Might
	classes['PALADIN'][6940]['style'] = 'texturedIcon' -- Blessing of Sacrifice
	classes['PALADIN'][19746]['style'] = 'texturedIcon' -- Concentration Aura
	classes['PALADIN'][1022]['style'] = 'texturedIcon' -- Blessing of Protection
	classes['PALADIN'][19742]['style'] = 'texturedIcon' -- Blessing of Wisdom
	classes['PALADIN'][19977]['style'] = 'texturedIcon' -- Blessing of Light
	classes['PALADIN'][465]['style'] = 'texturedIcon' -- Devotion Aura

	-- Shaman
	classes['SHAMAN'][8072]['style'] = 'texturedIcon' -- Stoneskin Totem
	classes['SHAMAN'][25909]['style'] = 'texturedIcon' -- Tranquil Air
	classes['SHAMAN'][10596]['style'] = 'texturedIcon' -- Nature Resistance Totem
	classes['SHAMAN'][8182]['style'] = 'texturedIcon' -- Frost Resistance Totem
	classes['SHAMAN'][29203]['style'] = 'texturedIcon' -- Healing Way
	classes['SHAMAN'][8185]['style'] = 'texturedIcon' -- Fire Resistance Totem
	classes['SHAMAN'][16237]['style'] = 'texturedIcon' -- Ancestral Fortitude
	classes['SHAMAN'][16191]['style'] = 'texturedIcon' -- Mana Tide Totem
	classes['SHAMAN'][5677]['style'] = 'texturedIcon' -- Mana Spring Totem
	classes['SHAMAN'][5672]['style'] = 'texturedIcon' -- Healing Stream Totem

	-- Mage
	classes['MAGE'][1008]['style'] = 'texturedIcon' -- Amplify Magic
	classes['MAGE'][604]['style'] = 'texturedIcon' -- Dampen Magic
	classes['MAGE'][1459]['style'] = 'texturedIcon' -- Arcane Intellect
	classes['MAGE'][23028]['style'] = 'texturedIcon' -- Arcane Brilliance
	classes['MAGE'][130]['style'] = 'texturedIcon' -- Slow Fall
	classes['MAGE'][400735]['style'] = 'texturedIcon' -- Temporal Beacon

	-- Warlock
	classes['WARLOCK'][2970]['style'] = 'texturedIcon' -- Detect Invisibility
	classes['WARLOCK'][6512]['style'] = 'texturedIcon' -- Detect Lesser Invisibility
	classes['WARLOCK'][11743]['style'] = 'texturedIcon' -- Detect Greater Invisibility
	classes['WARLOCK'][5697]['style'] = 'texturedIcon' -- Unending Breath

	-- Hunter
	classes['HUNTER'][19506]['style'] = 'texturedIcon' -- Trueshot Aura
	classes['HUNTER'][13159]['style'] = 'texturedIcon' -- Aspect of the Pack
	classes['HUNTER'][20043]['style'] = 'texturedIcon' -- Aspect of the Wild

	-- Warrior
	classes['WARRIOR'][6673]['style'] = 'texturedIcon' -- Battle Shout
end
