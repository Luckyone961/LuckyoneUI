local Name, Private = ...
local E, L, V, P, G = unpack(ElvUI)
local NP = E:GetModule('NamePlates')

local pairs = pairs

-- NamePlate Setup for ElvUI and Plater
function L1UI:Setup_NamePlates()
	-- Make sure to enable ElvUI NamePlates
	E.private.nameplates.enable = true

	-- Restore defaults
	E.db.nameplates = E:CopyTable({}, P.nameplates)

	-- Setup StyleFilters (includes NamePlate CVars)
	L1UI:Setup_StyleFilters()

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
	E.db.nameplates.overlapV = 1.4
	E.db.nameplates.plateSize.enemyHeight = 30
	E.db.nameplates.plateSize.enemyWidth = 190
	E.db.nameplates.plateSize.friendlyHeight = 30
	E.db.nameplates.plateSize.friendlyWidth = 190
	E.db.nameplates.plateSize.personalHeight = 30
	E.db.nameplates.plateSize.personalWidth = 190
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
	E.db.nameplates.units.ENEMY_NPC.buffs.priority = 'Blacklist,Dispellable,RaidBuffsElvUI'
	E.db.nameplates.units.ENEMY_NPC.buffs.size = 20
	E.db.nameplates.units.ENEMY_NPC.buffs.xOffset = 2
	E.db.nameplates.units.ENEMY_NPC.buffs.yOffset = -1
	E.db.nameplates.units.ENEMY_NPC.castbar.castTimeFormat = 'REMAINING'
	E.db.nameplates.units.ENEMY_NPC.castbar.channelTimeFormat = 'REMAINING'
	E.db.nameplates.units.ENEMY_NPC.castbar.font = Private.Font
	E.db.nameplates.units.ENEMY_NPC.castbar.fontSize = 9
	E.db.nameplates.units.ENEMY_NPC.castbar.height = 12
	E.db.nameplates.units.ENEMY_NPC.castbar.iconOffsetY = -1
	E.db.nameplates.units.ENEMY_NPC.castbar.iconPosition = 'LEFT'
	E.db.nameplates.units.ENEMY_NPC.castbar.iconSize = 14
	E.db.nameplates.units.ENEMY_NPC.castbar.textPosition = 'ONBAR'
	E.db.nameplates.units.ENEMY_NPC.castbar.textXOffset = 1
	E.db.nameplates.units.ENEMY_NPC.castbar.timeToHold = 2
	E.db.nameplates.units.ENEMY_NPC.castbar.timeXOffset = -1
	E.db.nameplates.units.ENEMY_NPC.castbar.width = 177
	E.db.nameplates.units.ENEMY_NPC.castbar.xOffset = 6
	E.db.nameplates.units.ENEMY_NPC.castbar.yOffset = -16
	E.db.nameplates.units.ENEMY_NPC.debuffs.anchorPoint = 'LEFT'
	E.db.nameplates.units.ENEMY_NPC.debuffs.countFont = Private.Font
	E.db.nameplates.units.ENEMY_NPC.debuffs.countFontSize = 12
	E.db.nameplates.units.ENEMY_NPC.debuffs.countPosition = 'TOP'
	E.db.nameplates.units.ENEMY_NPC.debuffs.countYOffset = 14
	E.db.nameplates.units.ENEMY_NPC.debuffs.desaturate = false
	E.db.nameplates.units.ENEMY_NPC.debuffs.font = Private.Font
	E.db.nameplates.units.ENEMY_NPC.debuffs.fontSize = 10
	E.db.nameplates.units.ENEMY_NPC.debuffs.numAuras = 4
	E.db.nameplates.units.ENEMY_NPC.debuffs.size = 20
	E.db.nameplates.units.ENEMY_NPC.debuffs.xOffset = -2
	E.db.nameplates.units.ENEMY_NPC.debuffs.yOffset = -1
	E.db.nameplates.units.ENEMY_NPC.eliteIcon.size = 14
	E.db.nameplates.units.ENEMY_NPC.eliteIcon.xOffset = 3
	E.db.nameplates.units.ENEMY_NPC.health.height = 18
	E.db.nameplates.units.ENEMY_NPC.health.text.font = Private.Font
	E.db.nameplates.units.ENEMY_NPC.health.text.format = '[luckyone:health:percent]'
	E.db.nameplates.units.ENEMY_NPC.health.text.position = 'TOPRIGHT'
	E.db.nameplates.units.ENEMY_NPC.health.text.yOffset = -20
	E.db.nameplates.units.ENEMY_NPC.level.enable = false
	E.db.nameplates.units.ENEMY_NPC.name.font = Private.Font
	E.db.nameplates.units.ENEMY_NPC.name.format = '[name:last]'
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
	E.db.nameplates.units.ENEMY_PLAYER.buffs.size = 20
	E.db.nameplates.units.ENEMY_PLAYER.buffs.xOffset = 2
	E.db.nameplates.units.ENEMY_PLAYER.buffs.yOffset = -1
	E.db.nameplates.units.ENEMY_PLAYER.castbar.castTimeFormat = 'REMAINING'
	E.db.nameplates.units.ENEMY_PLAYER.castbar.channelTimeFormat = 'REMAINING'
	E.db.nameplates.units.ENEMY_PLAYER.castbar.font = Private.Font
	E.db.nameplates.units.ENEMY_PLAYER.castbar.fontSize = 9
	E.db.nameplates.units.ENEMY_PLAYER.castbar.height = 12
	E.db.nameplates.units.ENEMY_PLAYER.castbar.iconOffsetY = -1
	E.db.nameplates.units.ENEMY_PLAYER.castbar.iconPosition = 'LEFT'
	E.db.nameplates.units.ENEMY_PLAYER.castbar.iconSize = 14
	E.db.nameplates.units.ENEMY_PLAYER.castbar.textPosition = 'ONBAR'
	E.db.nameplates.units.ENEMY_PLAYER.castbar.textXOffset = 1
	E.db.nameplates.units.ENEMY_PLAYER.castbar.timeToHold = 2
	E.db.nameplates.units.ENEMY_PLAYER.castbar.timeXOffset = -1
	E.db.nameplates.units.ENEMY_PLAYER.castbar.width = 177
	E.db.nameplates.units.ENEMY_PLAYER.castbar.xOffset = 6
	E.db.nameplates.units.ENEMY_PLAYER.castbar.yOffset = -16
	E.db.nameplates.units.ENEMY_PLAYER.debuffs.anchorPoint = 'LEFT'
	E.db.nameplates.units.ENEMY_PLAYER.debuffs.countFont = Private.Font
	E.db.nameplates.units.ENEMY_PLAYER.debuffs.countFontSize = 12
	E.db.nameplates.units.ENEMY_PLAYER.debuffs.countPosition = 'TOP'
	E.db.nameplates.units.ENEMY_PLAYER.debuffs.countYOffset = 14
	E.db.nameplates.units.ENEMY_PLAYER.debuffs.desaturate = false
	E.db.nameplates.units.ENEMY_PLAYER.debuffs.font = Private.Font
	E.db.nameplates.units.ENEMY_PLAYER.debuffs.fontSize = 10
	E.db.nameplates.units.ENEMY_PLAYER.debuffs.numAuras = 4
	E.db.nameplates.units.ENEMY_PLAYER.debuffs.priority = 'Blacklist,Personal,CCDebuffs'
	E.db.nameplates.units.ENEMY_PLAYER.debuffs.size = 20
	E.db.nameplates.units.ENEMY_PLAYER.debuffs.xOffset = -2
	E.db.nameplates.units.ENEMY_PLAYER.debuffs.yOffset = -1
	E.db.nameplates.units.ENEMY_PLAYER.health.height = 18
	E.db.nameplates.units.ENEMY_PLAYER.health.text.font = Private.Font
	E.db.nameplates.units.ENEMY_PLAYER.health.text.format = '[luckyone:health:percent]'
	E.db.nameplates.units.ENEMY_PLAYER.health.text.position = 'TOPRIGHT'
	E.db.nameplates.units.ENEMY_PLAYER.health.text.yOffset = -20
	E.db.nameplates.units.ENEMY_PLAYER.level.enable = false
	E.db.nameplates.units.ENEMY_PLAYER.level.format = '[difficultycolor][level][shortclassification]'
	E.db.nameplates.units.ENEMY_PLAYER.markHealers = false
	E.db.nameplates.units.ENEMY_PLAYER.name.font = Private.Font
	E.db.nameplates.units.ENEMY_PLAYER.name.format = '[name:last]'
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
	E.db.nameplates.units.FRIENDLY_NPC.questIcon.enable = false
	E.db.nameplates.units.FRIENDLY_NPC.raidTargetIndicator.size = 20
	E.db.nameplates.units.FRIENDLY_NPC.title.enable = true
	E.db.nameplates.units.FRIENDLY_NPC.title.font = Private.Font

	-- Friendly Player
	E.db.nameplates.units.FRIENDLY_PLAYER.health.text.format = '[luckyone:health:percent]'
	E.db.nameplates.units.FRIENDLY_PLAYER.markHealers = false
	E.db.nameplates.units.FRIENDLY_PLAYER.markTanks = false
	E.db.nameplates.units.FRIENDLY_PLAYER.name.font = Private.Font
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
end

-- Custom StyleFilters for all current Dungeons
function L1UI:Setup_StyleFilters()
	if not E.private.nameplates.enable then return end

	-- Wipe old data
	if E.global.nameplates.filters.ElvUI_Explosives then E.global.nameplates.filters.ElvUI_Explosives = nil end
	if E.global.nameplates.filters.Luckyone_AA then E.global.nameplates.filters.Luckyone_AA = nil end
	if E.global.nameplates.filters.Luckyone_AV then E.global.nameplates.filters.Luckyone_AV = nil end
	if E.global.nameplates.filters.Luckyone_COS then E.global.nameplates.filters.Luckyone_COS = nil end
	if E.global.nameplates.filters.Luckyone_HOV then E.global.nameplates.filters.Luckyone_HOV = nil end
	if E.global.nameplates.filters.Luckyone_NO then E.global.nameplates.filters.Luckyone_NO = nil end
	if E.global.nameplates.filters.Luckyone_RLP then E.global.nameplates.filters.Luckyone_RLP = nil end
	if E.global.nameplates.filters.Luckyone_SBG then E.global.nameplates.filters.Luckyone_SBG = nil end
	if E.global.nameplates.filters.Luckyone_TJS then E.global.nameplates.filters.Luckyone_TJS = nil end
	if E.global.nameplates.filters.Luckyone_VOTI then E.global.nameplates.filters.Luckyone_VOTI = nil end

	-- Retail Season 2 Dungeons & Raid
	if E.Retail then
		for _, filterName in pairs({ 'Luckyone_BH', 'Luckyone_HOI', 'Luckyone_NELT', 'Luckyone_ULD', 'Luckyone_NL', 'Luckyone_FH', 'Luckyone_UNDR', 'Luckyone_VP' }) do
			E.global.nameplates.filters[filterName] = {}
			E.NamePlates:StyleFilterCopyDefaults(E.global.nameplates.filters[filterName])
			E.db.nameplates.filters[filterName] = { triggers = { enable = true } }
		end

		-- Aberrus, the Shadowed Crucible [Aberrus]
		-- E.global.nameplates.filters.Luckyone_Aberrus.actions.color.health = true
		-- E.global.nameplates.filters.Luckyone_Aberrus.actions.color.healthColor.g = 0.75
		-- E.global.nameplates.filters.Luckyone_Aberrus.actions.color.healthColor.r = 0
		-- E.global.nameplates.filters.Luckyone_Aberrus.triggers.instanceType['raid'] = true
		-- E.global.nameplates.filters.Luckyone_Aberrus.triggers.names[''] = true
		-- E.global.nameplates.filters.Luckyone_Aberrus.triggers.names[''] = true
		-- E.global.nameplates.filters.Luckyone_Aberrus.triggers.priority = 2

		-- Brackenhide Hollow [BH]
		E.global.nameplates.filters.Luckyone_BH.actions.color.health = true
		E.global.nameplates.filters.Luckyone_BH.actions.color.healthColor.g = 0.75
		E.global.nameplates.filters.Luckyone_BH.actions.color.healthColor.r = 0
		E.global.nameplates.filters.Luckyone_BH.triggers.instanceDifficulty.dungeon['mythic'] = true
		E.global.nameplates.filters.Luckyone_BH.triggers.instanceDifficulty.dungeon['mythic+'] = true
		E.global.nameplates.filters.Luckyone_BH.triggers.instanceType['party'] = true
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
		E.global.nameplates.filters.Luckyone_ULD.triggers.names['184020'] = true -- Hulking Berserker
		E.global.nameplates.filters.Luckyone_ULD.triggers.names['184107'] = true -- Runic Protector
		E.global.nameplates.filters.Luckyone_ULD.triggers.priority = 2

		-- Neltharion's Lair [NL]
		E.global.nameplates.filters.Luckyone_NL.actions.color.health = true
		E.global.nameplates.filters.Luckyone_NL.actions.color.healthColor.g = 0.75
		E.global.nameplates.filters.Luckyone_NL.actions.color.healthColor.r = 0
		E.global.nameplates.filters.Luckyone_NL.triggers.instanceDifficulty.dungeon['mythic'] = true
		E.global.nameplates.filters.Luckyone_NL.triggers.instanceDifficulty.dungeon['mythic+'] = true
		E.global.nameplates.filters.Luckyone_NL.triggers.instanceType['party'] = true
		E.global.nameplates.filters.Luckyone_NL.triggers.names['91001'] = true -- Tarspitter Lurker
		E.global.nameplates.filters.Luckyone_NL.triggers.names['92610'] = true -- Understone Drummer
		E.global.nameplates.filters.Luckyone_NL.triggers.names['101437'] = true -- Burning Geode
		E.global.nameplates.filters.Luckyone_NL.triggers.names['102253'] = true -- Understone Demolisher
		E.global.nameplates.filters.Luckyone_NL.triggers.priority = 2

		-- Freehold [FH]
		E.global.nameplates.filters.Luckyone_FH.actions.color.health = true
		E.global.nameplates.filters.Luckyone_FH.actions.color.healthColor.g = 0.75
		E.global.nameplates.filters.Luckyone_FH.actions.color.healthColor.r = 0
		E.global.nameplates.filters.Luckyone_FH.triggers.instanceDifficulty.dungeon['mythic'] = true
		E.global.nameplates.filters.Luckyone_FH.triggers.instanceDifficulty.dungeon['mythic+'] = true
		E.global.nameplates.filters.Luckyone_FH.triggers.instanceType['party'] = true
		E.global.nameplates.filters.Luckyone_FH.triggers.names['129602'] = true -- Irontide Enforcer
		E.global.nameplates.filters.Luckyone_FH.triggers.names['127111'] = true -- Irontide Oarsman
		E.global.nameplates.filters.Luckyone_FH.triggers.names['130404'] = true -- Vermin Trapper
		E.global.nameplates.filters.Luckyone_FH.triggers.names['126919'] = true -- Irontide Stormcaller
		E.global.nameplates.filters.Luckyone_FH.triggers.priority = 2

		-- The Underrot [UNDR]
		E.global.nameplates.filters.Luckyone_UNDR.actions.color.health = true
		E.global.nameplates.filters.Luckyone_UNDR.actions.color.healthColor.g = 0.75
		E.global.nameplates.filters.Luckyone_UNDR.actions.color.healthColor.r = 0
		E.global.nameplates.filters.Luckyone_UNDR.triggers.instanceDifficulty.dungeon['mythic'] = true
		E.global.nameplates.filters.Luckyone_UNDR.triggers.instanceDifficulty.dungeon['mythic+'] = true
		E.global.nameplates.filters.Luckyone_UNDR.triggers.instanceType['party'] = true
		E.global.nameplates.filters.Luckyone_UNDR.triggers.names['131492'] = true -- Devout Blood Priest
		E.global.nameplates.filters.Luckyone_UNDR.triggers.names['130909'] = true -- Fetid Maggot
		E.global.nameplates.filters.Luckyone_UNDR.triggers.names['134284'] = true -- Fallen Deathspeaker
		E.global.nameplates.filters.Luckyone_UNDR.triggers.priority = 2

		-- The Vortex Pinnacle [VP]
		E.global.nameplates.filters.Luckyone_VP.actions.color.health = true
		E.global.nameplates.filters.Luckyone_VP.actions.color.healthColor.g = 0.75
		E.global.nameplates.filters.Luckyone_VP.actions.color.healthColor.r = 0
		E.global.nameplates.filters.Luckyone_VP.triggers.instanceDifficulty.dungeon['mythic'] = true
		E.global.nameplates.filters.Luckyone_VP.triggers.instanceDifficulty.dungeon['mythic+'] = true
		E.global.nameplates.filters.Luckyone_VP.triggers.instanceType['party'] = true
		E.global.nameplates.filters.Luckyone_VP.triggers.names['45919'] = true -- Young Storm Drake
		E.global.nameplates.filters.Luckyone_VP.triggers.names['45935'] = true -- Temple Adept
		E.global.nameplates.filters.Luckyone_VP.triggers.priority = 2
	end

	-- Disable alpha fading and scaling for ElvUI_Target and ElvUI_NonTarget
	E.global.nameplates.filters.ElvUI_NonTarget.actions.alpha = -1
	E.global.nameplates.filters.ElvUI_Target.actions.scale = 1

	-- Set NamePlate CVars
	L1UI:NameplateCVars(true)

	Private:Print(L["NamePlate StyleFilters and CVars have been set."])
end
