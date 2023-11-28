local Name, Private = ...
local E, L, V, P, G = unpack(ElvUI)
local NP = E:GetModule('NamePlates')

local pairs = pairs

-- NamePlate Setup for ElvUI
function L1UI:Setup_NamePlates()
	-- Make sure to enable the module
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

local function wipe()
	-- General
	if E.global.nameplates.filters.ElvUI_Explosives then E.global.nameplates.filters.ElvUI_Explosives = nil end
	-- Season 1
	if E.global.nameplates.filters.Luckyone_AA then E.global.nameplates.filters.Luckyone_AA = nil end
	if E.global.nameplates.filters.Luckyone_AV then E.global.nameplates.filters.Luckyone_AV = nil end
	if E.global.nameplates.filters.Luckyone_COS then E.global.nameplates.filters.Luckyone_COS = nil end
	if E.global.nameplates.filters.Luckyone_HOV then E.global.nameplates.filters.Luckyone_HOV = nil end
	if E.global.nameplates.filters.Luckyone_NO then E.global.nameplates.filters.Luckyone_NO = nil end
	if E.global.nameplates.filters.Luckyone_RLP then E.global.nameplates.filters.Luckyone_RLP = nil end
	if E.global.nameplates.filters.Luckyone_SBG then E.global.nameplates.filters.Luckyone_SBG = nil end
	if E.global.nameplates.filters.Luckyone_TJS then E.global.nameplates.filters.Luckyone_TJS = nil end
	if E.global.nameplates.filters.Luckyone_TOJS then E.global.nameplates.filters.Luckyone_TOJS = nil end
	if E.global.nameplates.filters.Luckyone_VOTI then E.global.nameplates.filters.Luckyone_VOTI = nil end
	-- Season 2
	if E.global.nameplates.filters.Luckyone_BH then E.global.nameplates.filters.Luckyone_BH = nil end
	if E.global.nameplates.filters.Luckyone_HOI then E.global.nameplates.filters.Luckyone_HOI = nil end
	if E.global.nameplates.filters.Luckyone_NELT then E.global.nameplates.filters.Luckyone_NELT = nil end
	if E.global.nameplates.filters.Luckyone_ULD then E.global.nameplates.filters.Luckyone_ULD = nil end
	if E.global.nameplates.filters.Luckyone_NL then E.global.nameplates.filters.Luckyone_NL = nil end
	if E.global.nameplates.filters.Luckyone_FH then E.global.nameplates.filters.Luckyone_FH = nil end
	if E.global.nameplates.filters.Luckyone_UNDR then E.global.nameplates.filters.Luckyone_UNDR = nil end
	if E.global.nameplates.filters.Luckyone_VP then E.global.nameplates.filters.Luckyone_VP = nil end
	if E.global.nameplates.filters.Luckyone_Aberrus then E.global.nameplates.filters.Luckyone_Aberrus = nil end
	-- Season 3
	if E.global.nameplates.filters.Luckyone_FALL then E.global.nameplates.filters.Luckyone_FALL = nil end
	if E.global.nameplates.filters.Luckyone_RISE then E.global.nameplates.filters.Luckyone_RISE = nil end
	if E.global.nameplates.filters.Luckyone_DHT then E.global.nameplates.filters.Luckyone_DHT = nil end
	if E.global.nameplates.filters.Luckyone_BRH then E.global.nameplates.filters.Luckyone_BRH = nil end
	if E.global.nameplates.filters.Luckyone_AD then E.global.nameplates.filters.Luckyone_AD = nil end
	if E.global.nameplates.filters.Luckyone_WM then E.global.nameplates.filters.Luckyone_WM = nil end
	if E.global.nameplates.filters.Luckyone_EB then E.global.nameplates.filters.Luckyone_EB = nil end
	if E.global.nameplates.filters.Luckyone_TOTT then E.global.nameplates.filters.Luckyone_TOTT = nil end
	-- if E.global.nameplates.filters.Luckyone_Amirdrassil then E.global.nameplates.filters.Luckyone_Amirdrassil = nil end
end

-- Custom StyleFilters for all current Dungeons
function L1UI:Setup_StyleFilters(skipVars)
	if not E.private.nameplates.enable then return end

	-- Wipe old filters
	wipe()

	-- Retail Season 3 Dungeons & Raid
	if E.Retail then
		for _, filterName in pairs({ 'Luckyone_FALL', 'Luckyone_RISE', 'Luckyone_DHT', 'Luckyone_BRH', 'Luckyone_AD', 'Luckyone_WM', 'Luckyone_EB', 'Luckyone_TOTT' }) do
			E.global.nameplates.filters[filterName] = {}
			E.NamePlates:StyleFilterCopyDefaults(E.global.nameplates.filters[filterName])
			E.db.nameplates.filters[filterName] = { triggers = { enable = true } }
		end

		-- Amirdrassil: The Dream's Hope [Amirdrassil]
		-- E.global.nameplates.filters.Luckyone_Amirdrassil.actions.color.health = true
		-- E.global.nameplates.filters.Luckyone_Amirdrassil.actions.color.healthColor.g = 0.75
		-- E.global.nameplates.filters.Luckyone_Amirdrassil.actions.color.healthColor.r = 0
		-- E.global.nameplates.filters.Luckyone_Amirdrassil.triggers.instanceType['raid'] = true
		-- E.global.nameplates.filters.Luckyone_Amirdrassil.triggers.names[''] = true -- Name 1
		-- E.global.nameplates.filters.Luckyone_Amirdrassil.triggers.names[''] = true -- Name 2
		-- E.global.nameplates.filters.Luckyone_Amirdrassil.triggers.names[''] = true -- Name 3
		-- E.global.nameplates.filters.Luckyone_Amirdrassil.triggers.priority = 2

		-- Dawn of the Infinites: Galakrond's Fall [FALL]
		E.global.nameplates.filters.Luckyone_FALL.actions.color.health = true
		E.global.nameplates.filters.Luckyone_FALL.actions.color.healthColor.g = 0.75
		E.global.nameplates.filters.Luckyone_FALL.actions.color.healthColor.r = 0
		E.global.nameplates.filters.Luckyone_FALL.triggers.instanceDifficulty.dungeon['mythic'] = true
		E.global.nameplates.filters.Luckyone_FALL.triggers.instanceDifficulty.dungeon['mythic+'] = true
		E.global.nameplates.filters.Luckyone_FALL.triggers.instanceType['party'] = true
		E.global.nameplates.filters.Luckyone_FALL.triggers.names['205384'] = true -- Infinite Chronoweaver
		E.global.nameplates.filters.Luckyone_FALL.triggers.names['206140'] = true -- Coalesced Time
		E.global.nameplates.filters.Luckyone_FALL.triggers.names['205804'] = true -- Risen Dragon
		E.global.nameplates.filters.Luckyone_FALL.triggers.names['205691'] = true -- Iridikron's Creation
		E.global.nameplates.filters.Luckyone_FALL.triggers.priority = 2

		-- Dawn of the Infinites: Murozond's Rise [RISE]
		E.global.nameplates.filters.Luckyone_RISE.actions.color.health = true
		E.global.nameplates.filters.Luckyone_RISE.actions.color.healthColor.g = 0.75
		E.global.nameplates.filters.Luckyone_RISE.actions.color.healthColor.r = 0
		E.global.nameplates.filters.Luckyone_RISE.triggers.instanceDifficulty.dungeon['mythic'] = true
		E.global.nameplates.filters.Luckyone_RISE.triggers.instanceDifficulty.dungeon['mythic+'] = true
		E.global.nameplates.filters.Luckyone_RISE.triggers.instanceType['party'] = true
		E.global.nameplates.filters.Luckyone_RISE.triggers.names['205158'] = true -- Spurlok, Timesworn Sentinel
		E.global.nameplates.filters.Luckyone_RISE.triggers.names['205152'] = true -- Lerai, Timesworn Maiden
		E.global.nameplates.filters.Luckyone_RISE.triggers.names['206230'] = true -- Infinite Diversionist
		E.global.nameplates.filters.Luckyone_RISE.triggers.names['208698'] = true -- Infinite Riftmage
		E.global.nameplates.filters.Luckyone_RISE.triggers.names['205363'] = true -- Time-Lost Waveshaper
		E.global.nameplates.filters.Luckyone_RISE.triggers.names['208193'] = true -- Paladin of the Silver Hand
		E.global.nameplates.filters.Luckyone_RISE.triggers.names['208440'] = true -- Infinite Slayer
		E.global.nameplates.filters.Luckyone_RISE.triggers.names['205212'] = true -- Infinite Keeper
		E.global.nameplates.filters.Luckyone_RISE.triggers.priority = 2

		-- Darkheart Thicket [DHT]
		E.global.nameplates.filters.Luckyone_DHT.actions.color.health = true
		E.global.nameplates.filters.Luckyone_DHT.actions.color.healthColor.g = 0.75
		E.global.nameplates.filters.Luckyone_DHT.actions.color.healthColor.r = 0
		E.global.nameplates.filters.Luckyone_DHT.triggers.instanceDifficulty.dungeon['mythic'] = true
		E.global.nameplates.filters.Luckyone_DHT.triggers.instanceDifficulty.dungeon['mythic+'] = true
		E.global.nameplates.filters.Luckyone_DHT.triggers.instanceType['party'] = true
		E.global.nameplates.filters.Luckyone_DHT.triggers.names['95771'] = true -- Dreadsoul Ruiner
		E.global.nameplates.filters.Luckyone_DHT.triggers.names['99359'] = true -- Rotheart Keeper
		E.global.nameplates.filters.Luckyone_DHT.triggers.names['100531'] = true -- Bloodtainted Fury
		E.global.nameplates.filters.Luckyone_DHT.triggers.names['99365'] = true -- Taintheart Stalker
		E.global.nameplates.filters.Luckyone_DHT.triggers.priority = 2

		-- Black Rook Hold [BRH]
		E.global.nameplates.filters.Luckyone_BRH.actions.color.health = true
		E.global.nameplates.filters.Luckyone_BRH.actions.color.healthColor.g = 0.75
		E.global.nameplates.filters.Luckyone_BRH.actions.color.healthColor.r = 0
		E.global.nameplates.filters.Luckyone_BRH.triggers.instanceDifficulty.dungeon['mythic'] = true
		E.global.nameplates.filters.Luckyone_BRH.triggers.instanceDifficulty.dungeon['mythic+'] = true
		E.global.nameplates.filters.Luckyone_BRH.triggers.instanceType['party'] = true
		E.global.nameplates.filters.Luckyone_BRH.triggers.names['98362'] = true -- Troubled Soul
		E.global.nameplates.filters.Luckyone_BRH.triggers.names['98538'] = true -- Lady Velandras Ravencrest
		E.global.nameplates.filters.Luckyone_BRH.triggers.names['98521'] = true -- Lord Etheldrin Ravencrest
		E.global.nameplates.filters.Luckyone_BRH.triggers.names['98280'] = true -- Risen Arcanist
		E.global.nameplates.filters.Luckyone_BRH.triggers.names['101549'] = true -- Arcane Minion
		E.global.nameplates.filters.Luckyone_BRH.triggers.names['98810'] = true -- Wrathguard Bladelord
		E.global.nameplates.filters.Luckyone_BRH.triggers.names['102788'] = true -- Felspite Dominator
		E.global.nameplates.filters.Luckyone_BRH.triggers.priority = 2

		-- Waycrest Manor [WM]
		E.global.nameplates.filters.Luckyone_WM.actions.color.health = true
		E.global.nameplates.filters.Luckyone_WM.actions.color.healthColor.g = 0.75
		E.global.nameplates.filters.Luckyone_WM.actions.color.healthColor.r = 0
		E.global.nameplates.filters.Luckyone_WM.triggers.instanceDifficulty.dungeon['mythic'] = true
		E.global.nameplates.filters.Luckyone_WM.triggers.instanceDifficulty.dungeon['mythic+'] = true
		E.global.nameplates.filters.Luckyone_WM.triggers.instanceType['party'] = true
		E.global.nameplates.filters.Luckyone_WM.triggers.names['131677'] = true -- Heartsbane Runeweaver
		E.global.nameplates.filters.Luckyone_WM.triggers.names['131586'] = true -- Banquet Steward
		E.global.nameplates.filters.Luckyone_WM.triggers.names['131858'] = true -- Thornguard
		E.global.nameplates.filters.Luckyone_WM.triggers.names['131685'] = true -- Runic Disciple
		E.global.nameplates.filters.Luckyone_WM.triggers.names['131812'] = true -- Heartsbane Soulcharmer
		E.global.nameplates.filters.Luckyone_WM.triggers.priority = 2

		-- Atal'Dazar [AD]
		E.global.nameplates.filters.Luckyone_AD.actions.color.health = true
		E.global.nameplates.filters.Luckyone_AD.actions.color.healthColor.g = 0.75
		E.global.nameplates.filters.Luckyone_AD.actions.color.healthColor.r = 0
		E.global.nameplates.filters.Luckyone_AD.triggers.instanceDifficulty.dungeon['mythic'] = true
		E.global.nameplates.filters.Luckyone_AD.triggers.instanceDifficulty.dungeon['mythic+'] = true
		E.global.nameplates.filters.Luckyone_AD.triggers.instanceType['party'] = true
		E.global.nameplates.filters.Luckyone_AD.triggers.names['127315'] = true -- Reanimation Totem
		E.global.nameplates.filters.Luckyone_AD.triggers.names['122973'] = true -- Dazar'ai Confessor
		E.global.nameplates.filters.Luckyone_AD.triggers.names['128434'] = true -- Feasting Skyscreamer
		E.global.nameplates.filters.Luckyone_AD.triggers.priority = 2

		-- Everbloom [EB]
		E.global.nameplates.filters.Luckyone_EB.actions.color.health = true
		E.global.nameplates.filters.Luckyone_EB.actions.color.healthColor.g = 0.75
		E.global.nameplates.filters.Luckyone_EB.actions.color.healthColor.r = 0
		E.global.nameplates.filters.Luckyone_EB.triggers.instanceDifficulty.dungeon['mythic'] = true
		E.global.nameplates.filters.Luckyone_EB.triggers.instanceDifficulty.dungeon['mythic+'] = true
		E.global.nameplates.filters.Luckyone_EB.triggers.instanceType['party'] = true
		E.global.nameplates.filters.Luckyone_EB.triggers.names['81820'] = true -- Everbloom Mender
		E.global.nameplates.filters.Luckyone_EB.triggers.names['81984'] = true -- Gnarlroot
		E.global.nameplates.filters.Luckyone_EB.triggers.names['84767'] = true -- Twisted Abomination
		E.global.nameplates.filters.Luckyone_EB.triggers.names['84957'] = true -- Putrid Pyromancer
		E.global.nameplates.filters.Luckyone_EB.triggers.priority = 2

		-- Throne of the Tides [TOTT]
		E.global.nameplates.filters.Luckyone_TOTT.actions.color.health = true
		E.global.nameplates.filters.Luckyone_TOTT.actions.color.healthColor.g = 0.75
		E.global.nameplates.filters.Luckyone_TOTT.actions.color.healthColor.r = 0
		E.global.nameplates.filters.Luckyone_TOTT.triggers.instanceDifficulty.dungeon['mythic'] = true
		E.global.nameplates.filters.Luckyone_TOTT.triggers.instanceDifficulty.dungeon['mythic+'] = true
		E.global.nameplates.filters.Luckyone_TOTT.triggers.instanceType['party'] = true
		E.global.nameplates.filters.Luckyone_TOTT.triggers.names['41096'] = true -- Naz'jar Oracle
		E.global.nameplates.filters.Luckyone_TOTT.triggers.names['214117'] = true -- Stormflurry Totem
		E.global.nameplates.filters.Luckyone_TOTT.triggers.names['44404'] = true -- Naz'jar Frost Witch
		E.global.nameplates.filters.Luckyone_TOTT.triggers.names['212775'] = true -- Faceless Seer
		E.global.nameplates.filters.Luckyone_TOTT.triggers.names['40925'] = true -- Tainted Sentry
		E.global.nameplates.filters.Luckyone_TOTT.triggers.priority = 2
	end

	-- Disable alpha fading and scaling for ElvUI_Target and ElvUI_NonTarget
	E.global.nameplates.filters.ElvUI_NonTarget.actions.alpha = -1
	E.global.nameplates.filters.ElvUI_Target.actions.scale = 1

	-- Set NamePlate CVars
	if not skipVars then
		L1UI:NameplateCVars(true)
	end

	Private:Print(L["NamePlate StyleFilters and CVars have been set."])
end
