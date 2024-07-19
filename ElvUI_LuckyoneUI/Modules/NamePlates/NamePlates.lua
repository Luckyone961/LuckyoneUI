-- Lua functions
local pairs = pairs
local unpack = unpack

-- Global environment
local _G = _G

-- AddOn namespace
local _, Private = ...

-- ElvUI modules
local E, L, _, P = unpack(ElvUI)
local NP = E:GetModule('NamePlates')

-- NamePlate Setup for ElvUI
function Private:Setup_NamePlates(installer)
	-- Make sure to enable the module
	E.private.nameplates.enable = true

	-- 1080p
	local scaled = E.global.L1UI.scaled

	-- Restore defaults
	E.db.nameplates = E:CopyTable({}, P.nameplates)

	-- Setup StyleFilters (includes NamePlate CVars)
	Private:Setup_StyleFilters()

	-- NamePlates general
	E.db.nameplates.colors.castbarDesaturate = false
	E.db.nameplates.colors.castColor.g = 1
	E.db.nameplates.colors.castColor.r = 0.02
	E.db.nameplates.colors.castNoInterruptColor.b = 0
	E.db.nameplates.colors.castNoInterruptColor.g = 0
	E.db.nameplates.colors.castNoInterruptColor.r = 1
	E.db.nameplates.colors.glowColor.b = 0.97
	E.db.nameplates.colors.glowColor.r = 0
	E.db.nameplates.cooldown.override = false
	E.db.nameplates.lowHealthThreshold = 0
	E.db.nameplates.overlapH = 1
	E.db.nameplates.overlapV = 1.6
	E.db.nameplates.plateSize.enemyWidth = (scaled and 190) or 210
	E.db.nameplates.plateSize.friendlyWidth = (scaled and 190) or 210
	E.db.nameplates.plateSize.personalWidth = (scaled and 190) or 210
	E.db.nameplates.statusbar = Private.Texture

	-- NamePlates misc
	E.db.nameplates.units.PLAYER.enable = false
	E.db.nameplates.visibility.enemy.guardians = true
	E.db.nameplates.visibility.enemy.minions = true

	-- Enemy NPC
	E.db.nameplates.units.ENEMY_NPC.buffs.anchorPoint = 'RIGHT'
	E.db.nameplates.units.ENEMY_NPC.buffs.countFont = Private.Font
	E.db.nameplates.units.ENEMY_NPC.buffs.countFontSize = 12
	E.db.nameplates.units.ENEMY_NPC.buffs.countPosition = 'TOP'
	E.db.nameplates.units.ENEMY_NPC.buffs.countYOffset = 14
	E.db.nameplates.units.ENEMY_NPC.buffs.desaturate = false
	E.db.nameplates.units.ENEMY_NPC.buffs.font = Private.Font
	E.db.nameplates.units.ENEMY_NPC.buffs.fontSize = 10
	E.db.nameplates.units.ENEMY_NPC.buffs.numAuras = 4
	E.db.nameplates.units.ENEMY_NPC.buffs.priority = 'Blacklist,Whitelist,Dispellable,RaidBuffsElvUI'
	E.db.nameplates.units.ENEMY_NPC.buffs.size = (scaled and 20) or 22
	E.db.nameplates.units.ENEMY_NPC.buffs.xOffset = 2
	E.db.nameplates.units.ENEMY_NPC.buffs.yOffset = -1
	E.db.nameplates.units.ENEMY_NPC.castbar.castTimeFormat = 'REMAINING'
	E.db.nameplates.units.ENEMY_NPC.castbar.channelTimeFormat = 'REMAINING'
	E.db.nameplates.units.ENEMY_NPC.castbar.font = Private.Font
	E.db.nameplates.units.ENEMY_NPC.castbar.fontSize = 10
	E.db.nameplates.units.ENEMY_NPC.castbar.height = 14
	E.db.nameplates.units.ENEMY_NPC.castbar.iconOffsetX = 2
	E.db.nameplates.units.ENEMY_NPC.castbar.iconOffsetY = -1
	E.db.nameplates.units.ENEMY_NPC.castbar.iconPosition = 'LEFT'
	E.db.nameplates.units.ENEMY_NPC.castbar.iconSize = 16
	E.db.nameplates.units.ENEMY_NPC.castbar.textPosition = 'ONBAR'
	E.db.nameplates.units.ENEMY_NPC.castbar.textXOffset = 4
	E.db.nameplates.units.ENEMY_NPC.castbar.timeToHold = 2
	E.db.nameplates.units.ENEMY_NPC.castbar.timeXOffset = -1
	E.db.nameplates.units.ENEMY_NPC.castbar.width = (scaled and 177) or 197
	E.db.nameplates.units.ENEMY_NPC.castbar.xOffset = (scaled and 7) or 6
	E.db.nameplates.units.ENEMY_NPC.castbar.yOffset = (scaled and -17) or -18
	E.db.nameplates.units.ENEMY_NPC.debuffs.anchorPoint = 'LEFT'
	E.db.nameplates.units.ENEMY_NPC.debuffs.countFont = Private.Font
	E.db.nameplates.units.ENEMY_NPC.debuffs.countFontSize = 12
	E.db.nameplates.units.ENEMY_NPC.debuffs.countPosition = 'TOP'
	E.db.nameplates.units.ENEMY_NPC.debuffs.countYOffset = 14
	E.db.nameplates.units.ENEMY_NPC.debuffs.desaturate = false
	E.db.nameplates.units.ENEMY_NPC.debuffs.font = Private.Font
	E.db.nameplates.units.ENEMY_NPC.debuffs.fontSize = 10
	E.db.nameplates.units.ENEMY_NPC.debuffs.numAuras = 4
	E.db.nameplates.units.ENEMY_NPC.debuffs.size = (scaled and 20) or 22
	E.db.nameplates.units.ENEMY_NPC.debuffs.xOffset = -2
	E.db.nameplates.units.ENEMY_NPC.debuffs.yOffset = -1
	E.db.nameplates.units.ENEMY_NPC.eliteIcon.size = 14
	E.db.nameplates.units.ENEMY_NPC.eliteIcon.xOffset = 3
	E.db.nameplates.units.ENEMY_NPC.health.height = (scaled and 18) or 20
	E.db.nameplates.units.ENEMY_NPC.health.text.font = Private.Font
	E.db.nameplates.units.ENEMY_NPC.health.text.format = '[luckyone:health:percent]'
	E.db.nameplates.units.ENEMY_NPC.health.text.position = 'TOPRIGHT'
	E.db.nameplates.units.ENEMY_NPC.health.text.yOffset = -20
	E.db.nameplates.units.ENEMY_NPC.level.enable = false
	E.db.nameplates.units.ENEMY_NPC.name.font = Private.Font
	E.db.nameplates.units.ENEMY_NPC.name.format = '[luckyone:level< ||cffffffff- ][luckyone:name:last-nocolor]'
	E.db.nameplates.units.ENEMY_NPC.name.xOffset = 2
	E.db.nameplates.units.ENEMY_NPC.name.yOffset = -20
	E.db.nameplates.units.ENEMY_NPC.pvpindicator.size = 35
	E.db.nameplates.units.ENEMY_NPC.questIcon.enable = false
	E.db.nameplates.units.ENEMY_NPC.questIcon.font = Private.Font
	E.db.nameplates.units.ENEMY_NPC.questIcon.size = 25
	E.db.nameplates.units.ENEMY_NPC.questIcon.textPosition = 'CENTER'
	E.db.nameplates.units.ENEMY_NPC.raidTargetIndicator.position = 'CENTER'
	E.db.nameplates.units.ENEMY_NPC.raidTargetIndicator.size = 16
	E.db.nameplates.units.ENEMY_NPC.raidTargetIndicator.xOffset = 0
	E.db.nameplates.units.ENEMY_NPC.raidTargetIndicator.yOffset = 1

	-- Enemy Player
	E.db.nameplates.units.ENEMY_PLAYER.buffs.anchorPoint = 'RIGHT'
	E.db.nameplates.units.ENEMY_PLAYER.buffs.countFont = Private.Font
	E.db.nameplates.units.ENEMY_PLAYER.buffs.countFontSize = 12
	E.db.nameplates.units.ENEMY_PLAYER.buffs.countPosition = 'TOP'
	E.db.nameplates.units.ENEMY_PLAYER.buffs.countYOffset = 14
	E.db.nameplates.units.ENEMY_PLAYER.buffs.desaturate = false
	E.db.nameplates.units.ENEMY_PLAYER.buffs.font = Private.Font
	E.db.nameplates.units.ENEMY_PLAYER.buffs.fontSize = 10
	E.db.nameplates.units.ENEMY_PLAYER.buffs.maxDuration = 0
	E.db.nameplates.units.ENEMY_PLAYER.buffs.numAuras = 4
	E.db.nameplates.units.ENEMY_PLAYER.buffs.priority = 'Blacklist,Dispellable,TurtleBuffs'
	E.db.nameplates.units.ENEMY_PLAYER.buffs.size = (scaled and 20) or 22
	E.db.nameplates.units.ENEMY_PLAYER.buffs.xOffset = 2
	E.db.nameplates.units.ENEMY_PLAYER.buffs.yOffset = -1
	E.db.nameplates.units.ENEMY_PLAYER.castbar.castTimeFormat = 'REMAINING'
	E.db.nameplates.units.ENEMY_PLAYER.castbar.channelTimeFormat = 'REMAINING'
	E.db.nameplates.units.ENEMY_PLAYER.castbar.font = Private.Font
	E.db.nameplates.units.ENEMY_PLAYER.castbar.fontSize = 10
	E.db.nameplates.units.ENEMY_PLAYER.castbar.height = 14
	E.db.nameplates.units.ENEMY_PLAYER.castbar.iconOffsetX = 2
	E.db.nameplates.units.ENEMY_PLAYER.castbar.iconOffsetY = -1
	E.db.nameplates.units.ENEMY_PLAYER.castbar.iconPosition = 'LEFT'
	E.db.nameplates.units.ENEMY_PLAYER.castbar.iconSize = 16
	E.db.nameplates.units.ENEMY_PLAYER.castbar.textPosition = 'ONBAR'
	E.db.nameplates.units.ENEMY_PLAYER.castbar.textXOffset = 4
	E.db.nameplates.units.ENEMY_PLAYER.castbar.timeToHold = 2
	E.db.nameplates.units.ENEMY_PLAYER.castbar.timeXOffset = -1
	E.db.nameplates.units.ENEMY_PLAYER.castbar.width = (scaled and 177) or 197
	E.db.nameplates.units.ENEMY_PLAYER.castbar.xOffset = (scaled and 7) or 6
	E.db.nameplates.units.ENEMY_PLAYER.castbar.yOffset = (scaled and -17) or -18
	E.db.nameplates.units.ENEMY_PLAYER.debuffs.anchorPoint = 'LEFT'
	E.db.nameplates.units.ENEMY_PLAYER.debuffs.countFont = Private.Font
	E.db.nameplates.units.ENEMY_PLAYER.debuffs.countFontSize = 12
	E.db.nameplates.units.ENEMY_PLAYER.debuffs.countPosition = 'TOP'
	E.db.nameplates.units.ENEMY_PLAYER.debuffs.countYOffset = 14
	E.db.nameplates.units.ENEMY_PLAYER.debuffs.desaturate = false
	E.db.nameplates.units.ENEMY_PLAYER.debuffs.font = Private.Font
	E.db.nameplates.units.ENEMY_PLAYER.debuffs.fontSize = 10
	E.db.nameplates.units.ENEMY_PLAYER.debuffs.numAuras = 4
	E.db.nameplates.units.ENEMY_PLAYER.debuffs.priority = 'Blacklist,Whitelist,Personal,CCDebuffs'
	E.db.nameplates.units.ENEMY_PLAYER.debuffs.size = (scaled and 20) or 22
	E.db.nameplates.units.ENEMY_PLAYER.debuffs.xOffset = -2
	E.db.nameplates.units.ENEMY_PLAYER.debuffs.yOffset = -1
	E.db.nameplates.units.ENEMY_PLAYER.health.height = (scaled and 18) or 20
	E.db.nameplates.units.ENEMY_PLAYER.health.text.font = Private.Font
	E.db.nameplates.units.ENEMY_PLAYER.health.text.format = '[luckyone:health:percent]'
	E.db.nameplates.units.ENEMY_PLAYER.health.text.position = 'TOPRIGHT'
	E.db.nameplates.units.ENEMY_PLAYER.health.text.yOffset = -20
	E.db.nameplates.units.ENEMY_PLAYER.level.enable = false
	E.db.nameplates.units.ENEMY_PLAYER.level.format = '[luckyone:level]'
	E.db.nameplates.units.ENEMY_PLAYER.markHealers = false
	E.db.nameplates.units.ENEMY_PLAYER.name.font = Private.Font
	E.db.nameplates.units.ENEMY_PLAYER.name.format = '[luckyone:level< ||cffffffff- ][luckyone:name:last-nocolor]'
	E.db.nameplates.units.ENEMY_PLAYER.name.xOffset = 2
	E.db.nameplates.units.ENEMY_PLAYER.name.yOffset = -20
	E.db.nameplates.units.ENEMY_PLAYER.pvpindicator.size = 35
	E.db.nameplates.units.ENEMY_PLAYER.raidTargetIndicator.position = 'CENTER'
	E.db.nameplates.units.ENEMY_PLAYER.raidTargetIndicator.size = 16
	E.db.nameplates.units.ENEMY_PLAYER.raidTargetIndicator.xOffset = 0
	E.db.nameplates.units.ENEMY_PLAYER.raidTargetIndicator.yOffset = 1
	E.db.nameplates.units.ENEMY_PLAYER.title.format = ''

	-- Friendly NPC
	E.db.nameplates.units.FRIENDLY_NPC.health.text.format = '[luckyone:health:percent]'
	E.db.nameplates.units.FRIENDLY_NPC.name.font = Private.Font
	E.db.nameplates.units.FRIENDLY_NPC.nameOnly = true
	E.db.nameplates.units.FRIENDLY_NPC.name.fontSize = (scaled and 11) or 14
	E.db.nameplates.units.FRIENDLY_NPC.name.yOffset = 0
	E.db.nameplates.units.FRIENDLY_NPC.questIcon.enable = false
	E.db.nameplates.units.FRIENDLY_NPC.raidTargetIndicator.size = 20
	E.db.nameplates.units.FRIENDLY_NPC.title.enable = true
	E.db.nameplates.units.FRIENDLY_NPC.title.font = Private.Font

	-- Friendly Player
	E.db.nameplates.units.FRIENDLY_PLAYER.health.text.format = '[luckyone:health:percent]'
	E.db.nameplates.units.FRIENDLY_PLAYER.markHealers = false
	E.db.nameplates.units.FRIENDLY_PLAYER.markTanks = false
	E.db.nameplates.units.FRIENDLY_PLAYER.name.font = Private.Font
	E.db.nameplates.units.FRIENDLY_PLAYER.name.fontSize = (scaled and 11) or 14
	E.db.nameplates.units.FRIENDLY_PLAYER.name.yOffset = 0
	E.db.nameplates.units.FRIENDLY_PLAYER.nameOnly = true
	E.db.nameplates.units.FRIENDLY_PLAYER.raidTargetIndicator.size = 20
	E.db.nameplates.units.FRIENDLY_PLAYER.title.enable = true
	E.db.nameplates.units.FRIENDLY_PLAYER.title.font = Private.Font

	-- Target indicator
	E.db.nameplates.units.TARGET.arrowScale = 0.7
	E.db.nameplates.units.TARGET.arrowSpacing = 25
	E.db.nameplates.units.TARGET.glowStyle = 'style2'

	if NP.Initialized then
		E:UpdateNamePlates(true)
	end

	if installer then
		_G.LuckyoneInstallStepComplete.message = L["NamePlate StyleFilters and CVars have been set."]
		_G.LuckyoneInstallStepComplete:Show()
	end
end

local function Cleanup()
	local toDelete = {
		-- General
		'ElvUI_Explosives',
		-- Dragonflight Season 1
		'Luckyone_AA', 'Luckyone_AV', 'Luckyone_COS', 'Luckyone_HOV', 'Luckyone_NO', 'Luckyone_RLP', 'Luckyone_SBG', 'Luckyone_TJS', 'Luckyone_TOJS', 'Luckyone_VOTI',
		-- Dragonflight Season 2
		'Luckyone_BH', 'Luckyone_HOI', 'Luckyone_NELT', 'Luckyone_ULD', 'Luckyone_NL', 'Luckyone_FH', 'Luckyone_UNDR', 'Luckyone_VP', 'Luckyone_Aberrus',
		-- Dragonflight Season 3
		'Luckyone_FALL', 'Luckyone_RISE', 'Luckyone_DHT', 'Luckyone_BRH', 'Luckyone_AD', 'Luckyone_WM', 'Luckyone_EB', 'Luckyone_TOTT', 'Luckyone_Amirdrassil'
	}

	for _, v in pairs(toDelete) do
		if E.global.nameplates.filters[v] then
			E.global.nameplates.filters[v] = nil
		end
	end
end

-- Custom StyleFilters
function Private:Setup_StyleFilters(skipVars)
	if not E.private.nameplates.enable then return end

	-- Wipe old filters
	Cleanup()

	if E.Retail then

		-- Season 4 Dungeons & Raid
		local filters = {
			-- Dungeons
			'Luckyone_RLP', 'Luckyone_AA', 'Luckyone_NO', 'Luckyone_AV', 'Luckyone_BH', 'Luckyone_HOI', 'Luckyone_NELT', 'Luckyone_ULD',
			-- Raids
			'Luckyone_VOTI', 'Luckyone_Aberrus', 'Luckyone_Amirdrassil'
		}

		for _, filterName in pairs(filters) do
			E.global.nameplates.filters[filterName] = {}
			E.NamePlates:StyleFilterCopyDefaults(E.global.nameplates.filters[filterName])
			E.db.nameplates.filters[filterName] = { triggers = { enable = true } }
		end

		-- Vault of the Incarnates [VOTI]
		E.global.nameplates.filters.Luckyone_VOTI.actions.color.health = true
		E.global.nameplates.filters.Luckyone_VOTI.actions.color.healthColor.g = 0.75
		E.global.nameplates.filters.Luckyone_VOTI.actions.color.healthColor.r = 0
		E.global.nameplates.filters.Luckyone_VOTI.triggers.instanceType['raid'] = true
		E.global.nameplates.filters.Luckyone_VOTI.triggers.names['191222'] = true -- Juvenile Frost Proto-Dragon
		E.global.nameplates.filters.Luckyone_VOTI.triggers.names['199547'] = true -- Frostforged Zealot
		E.global.nameplates.filters.Luckyone_VOTI.triggers.priority = 2

		-- Aberrus, the Shadowed Crucible [Aberrus]
		E.global.nameplates.filters.Luckyone_Aberrus.actions.color.health = true
		E.global.nameplates.filters.Luckyone_Aberrus.actions.color.healthColor.g = 0.75
		E.global.nameplates.filters.Luckyone_Aberrus.actions.color.healthColor.r = 0
		E.global.nameplates.filters.Luckyone_Aberrus.triggers.instanceType['raid'] = true
		E.global.nameplates.filters.Luckyone_Aberrus.triggers.names['203812'] = true -- Echo of Neltharion Adds
		E.global.nameplates.filters.Luckyone_Aberrus.triggers.names['202969'] = true -- Scalecommander Sarkareth Mythic Adds
		E.global.nameplates.filters.Luckyone_Aberrus.triggers.priority = 2

		-- Amirdrassil: The Dream's Hope [Amirdrassil]
		E.global.nameplates.filters.Luckyone_Amirdrassil.actions.color.health = true
		E.global.nameplates.filters.Luckyone_Amirdrassil.actions.color.healthColor.g = 0.75
		E.global.nameplates.filters.Luckyone_Amirdrassil.actions.color.healthColor.r = 0
		E.global.nameplates.filters.Luckyone_Amirdrassil.triggers.instanceType['raid'] = true
		E.global.nameplates.filters.Luckyone_Amirdrassil.triggers.names['208461'] = true -- Scorching Brambles
		E.global.nameplates.filters.Luckyone_Amirdrassil.triggers.names['207796'] = true -- Burning Colossus
		E.global.nameplates.filters.Luckyone_Amirdrassil.triggers.priority = 2

		-- Ruby Life Pools [RLP]
		E.global.nameplates.filters.Luckyone_RLP.actions.color.health = true
		E.global.nameplates.filters.Luckyone_RLP.actions.color.healthColor.g = 0.75
		E.global.nameplates.filters.Luckyone_RLP.actions.color.healthColor.r = 0
		E.global.nameplates.filters.Luckyone_RLP.triggers.instanceDifficulty.dungeon['mythic'] = true
		E.global.nameplates.filters.Luckyone_RLP.triggers.instanceDifficulty.dungeon['mythic+'] = true
		E.global.nameplates.filters.Luckyone_RLP.triggers.instanceType['party'] = true
		E.global.nameplates.filters.Luckyone_RLP.triggers.names['187897'] = true -- Defier Draghar
		E.global.nameplates.filters.Luckyone_RLP.triggers.names['188244'] = true -- Primal Juggernaut
		E.global.nameplates.filters.Luckyone_RLP.triggers.names['195119'] = true -- Primalist Shockcaster
		E.global.nameplates.filters.Luckyone_RLP.triggers.names['197698'] = true -- Thunderhead
		E.global.nameplates.filters.Luckyone_RLP.triggers.names['198047'] = true -- Tempest Channeler
		E.global.nameplates.filters.Luckyone_RLP.triggers.names['197535'] = true -- High Channeler Ryvati
		E.global.nameplates.filters.Luckyone_RLP.triggers.priority = 2

		-- Algeth’ar Academy [AA]
		E.global.nameplates.filters.Luckyone_AA.actions.color.health = true
		E.global.nameplates.filters.Luckyone_AA.actions.color.healthColor.g = 0.75
		E.global.nameplates.filters.Luckyone_AA.actions.color.healthColor.r = 0
		E.global.nameplates.filters.Luckyone_AA.triggers.instanceDifficulty.dungeon['mythic'] = true
		E.global.nameplates.filters.Luckyone_AA.triggers.instanceDifficulty.dungeon['mythic+'] = true
		E.global.nameplates.filters.Luckyone_AA.triggers.instanceType['party'] = true
		E.global.nameplates.filters.Luckyone_AA.triggers.names['196576'] = true -- Spellbound Scepter
		E.global.nameplates.filters.Luckyone_AA.triggers.names['196671'] = true -- Arcane Ravager
		E.global.nameplates.filters.Luckyone_AA.triggers.names['197219'] = true -- Vile Lasher
		E.global.nameplates.filters.Luckyone_AA.triggers.names['196548'] = true -- Ancient Branch
		E.global.nameplates.filters.Luckyone_AA.triggers.names['196203'] = true -- Ethereal Restorer
		E.global.nameplates.filters.Luckyone_AA.triggers.names['192680'] = true -- Guardian Sentry
		E.global.nameplates.filters.Luckyone_AA.triggers.names['192333'] = true -- Alpha Eagle
		E.global.nameplates.filters.Luckyone_AA.triggers.priority = 2

		-- Nokhud Offensive [NO]
		E.global.nameplates.filters.Luckyone_NO.actions.color.health = true
		E.global.nameplates.filters.Luckyone_NO.actions.color.healthColor.g = 0.75
		E.global.nameplates.filters.Luckyone_NO.actions.color.healthColor.r = 0
		E.global.nameplates.filters.Luckyone_NO.triggers.instanceDifficulty.dungeon['mythic'] = true
		E.global.nameplates.filters.Luckyone_NO.triggers.instanceDifficulty.dungeon['mythic+'] = true
		E.global.nameplates.filters.Luckyone_NO.triggers.instanceType['party'] = true
		E.global.nameplates.filters.Luckyone_NO.triggers.names['192800'] = true -- Nokhud Lancemaster
		E.global.nameplates.filters.Luckyone_NO.triggers.names['195696'] = true -- Primalist Thunderbeast
		E.global.nameplates.filters.Luckyone_NO.triggers.names['195927'] = true -- Soulharvester Galtmaa
		E.global.nameplates.filters.Luckyone_NO.triggers.names['195928'] = true -- Soulharvester Duuren
		E.global.nameplates.filters.Luckyone_NO.triggers.names['195930'] = true -- Soulharvester Mandakh
		E.global.nameplates.filters.Luckyone_NO.triggers.names['195929'] = true -- Soulharvester Tumen
		E.global.nameplates.filters.Luckyone_NO.triggers.names['193462'] = true -- Batak
		E.global.nameplates.filters.Luckyone_NO.triggers.priority = 2

		-- Azure Vault [AV]
		E.global.nameplates.filters.Luckyone_AV.actions.color.health = true
		E.global.nameplates.filters.Luckyone_AV.actions.color.healthColor.g = 0.75
		E.global.nameplates.filters.Luckyone_AV.actions.color.healthColor.r = 0
		E.global.nameplates.filters.Luckyone_AV.triggers.instanceDifficulty.dungeon['mythic'] = true
		E.global.nameplates.filters.Luckyone_AV.triggers.instanceDifficulty.dungeon['mythic+'] = true
		E.global.nameplates.filters.Luckyone_AV.triggers.instanceType['party'] = true
		E.global.nameplates.filters.Luckyone_AV.triggers.names['187159'] = true -- Shrieking Whelp
		E.global.nameplates.filters.Luckyone_AV.triggers.names['187155'] = true -- Rune Seal Keeper
		E.global.nameplates.filters.Luckyone_AV.triggers.names['196116'] = true -- Crystal Fury
		E.global.nameplates.filters.Luckyone_AV.triggers.names['191739'] = true -- Scalebane Lieutenant
		E.global.nameplates.filters.Luckyone_AV.triggers.names['187240'] = true -- Drakonid Breaker
		E.global.nameplates.filters.Luckyone_AV.triggers.names['199368'] = true -- Hardened Crystal
		E.global.nameplates.filters.Luckyone_AV.triggers.priority = 2

		-- Brackenhide Hollow [BH]
		E.global.nameplates.filters.Luckyone_BH.actions.color.health = true
		E.global.nameplates.filters.Luckyone_BH.actions.color.healthColor.g = 0.75
		E.global.nameplates.filters.Luckyone_BH.actions.color.healthColor.r = 0
		E.global.nameplates.filters.Luckyone_BH.triggers.instanceDifficulty.dungeon['mythic'] = true
		E.global.nameplates.filters.Luckyone_BH.triggers.instanceDifficulty.dungeon['mythic+'] = true
		E.global.nameplates.filters.Luckyone_BH.triggers.instanceType['party'] = true
		E.global.nameplates.filters.Luckyone_BH.triggers.names['193352'] = true -- Hextrick Totem
		E.global.nameplates.filters.Luckyone_BH.triggers.names['186191'] = true -- Decay Speaker
		E.global.nameplates.filters.Luckyone_BH.triggers.names['186226'] = true -- Fetid Rotsinger
		E.global.nameplates.filters.Luckyone_BH.triggers.names['186227'] = true -- Monstrous Decay
		E.global.nameplates.filters.Luckyone_BH.triggers.names['187033'] = true -- Stinkbreath
		E.global.nameplates.filters.Luckyone_BH.triggers.names['187224'] = true -- Vile Rothexer
		E.global.nameplates.filters.Luckyone_BH.triggers.names['190426'] = true -- Decay Totem
		E.global.nameplates.filters.Luckyone_BH.triggers.names['193799'] = true -- Rotchanting Totem
		E.global.nameplates.filters.Luckyone_BH.triggers.priority = 2

		-- Halls of Infusion [HOI]
		E.global.nameplates.filters.Luckyone_HOI.actions.color.health = true
		E.global.nameplates.filters.Luckyone_HOI.actions.color.healthColor.g = 0.75
		E.global.nameplates.filters.Luckyone_HOI.actions.color.healthColor.r = 0
		E.global.nameplates.filters.Luckyone_HOI.triggers.instanceDifficulty.dungeon['mythic'] = true
		E.global.nameplates.filters.Luckyone_HOI.triggers.instanceDifficulty.dungeon['mythic+'] = true
		E.global.nameplates.filters.Luckyone_HOI.triggers.instanceType['party'] = true
		E.global.nameplates.filters.Luckyone_HOI.triggers.names['190342'] = true -- Containment Apparatus
		E.global.nameplates.filters.Luckyone_HOI.triggers.names['199037'] = true -- Primalist Shocktrooper
		E.global.nameplates.filters.Luckyone_HOI.triggers.names['190368'] = true -- Flamecaller Aymi
		E.global.nameplates.filters.Luckyone_HOI.triggers.names['190377'] = true -- Primalist Icecaller
		E.global.nameplates.filters.Luckyone_HOI.triggers.names['190405'] = true -- Infuser Sariya
		E.global.nameplates.filters.Luckyone_HOI.triggers.priority = 2

		-- Neltharus [NELT]
		E.global.nameplates.filters.Luckyone_NELT.actions.color.health = true
		E.global.nameplates.filters.Luckyone_NELT.actions.color.healthColor.g = 0.75
		E.global.nameplates.filters.Luckyone_NELT.actions.color.healthColor.r = 0
		E.global.nameplates.filters.Luckyone_NELT.triggers.instanceDifficulty.dungeon['mythic'] = true
		E.global.nameplates.filters.Luckyone_NELT.triggers.instanceDifficulty.dungeon['mythic+'] = true
		E.global.nameplates.filters.Luckyone_NELT.triggers.instanceType['party'] = true
		E.global.nameplates.filters.Luckyone_NELT.triggers.names['192788'] = true -- Qalashi Thaumaturge
		E.global.nameplates.filters.Luckyone_NELT.triggers.names['189265'] = true -- Qalashi Bonetender
		E.global.nameplates.filters.Luckyone_NELT.triggers.names['189235'] = true -- Overseer Lahar
		E.global.nameplates.filters.Luckyone_NELT.triggers.names['189466'] = true -- Irontorch Commander
		E.global.nameplates.filters.Luckyone_NELT.triggers.names['193291'] = true -- Apex Blazewing
		E.global.nameplates.filters.Luckyone_NELT.triggers.priority = 2

		-- Uldaman: Legacy of Tyr [ULD]
		E.global.nameplates.filters.Luckyone_ULD.actions.color.health = true
		E.global.nameplates.filters.Luckyone_ULD.actions.color.healthColor.g = 0.75
		E.global.nameplates.filters.Luckyone_ULD.actions.color.healthColor.r = 0
		E.global.nameplates.filters.Luckyone_ULD.triggers.instanceDifficulty.dungeon['mythic'] = true
		E.global.nameplates.filters.Luckyone_ULD.triggers.instanceDifficulty.dungeon['mythic+'] = true
		E.global.nameplates.filters.Luckyone_ULD.triggers.instanceType['party'] = true
		E.global.nameplates.filters.Luckyone_ULD.triggers.names['186420'] = true -- Earthen Weaver
		E.global.nameplates.filters.Luckyone_ULD.triggers.names['184020'] = true -- Hulking Berserker
		E.global.nameplates.filters.Luckyone_ULD.triggers.names['184107'] = true -- Runic Protector
		E.global.nameplates.filters.Luckyone_ULD.triggers.priority = 2
	end

	-- Disable alpha fading and scaling for ElvUI_Target and ElvUI_NonTarget
	E.global.nameplates.filters.ElvUI_NonTarget.actions.alpha = -1
	E.global.nameplates.filters.ElvUI_Target.actions.scale = 1

	-- Set NamePlate CVars
	if not skipVars then
		Private:NameplateCVars(true)
	end

	Private:Print(L["NamePlate StyleFilters and CVars have been set."])
end
