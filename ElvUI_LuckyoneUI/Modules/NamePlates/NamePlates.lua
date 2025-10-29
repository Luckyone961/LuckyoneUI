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

-- Wipe any existing Luckyone filters
local function Cleanup()
	for filterName, _ in pairs(E.global.nameplates.filters) do
		if filterName:match('^Luckyone_') then
			E.global.nameplates.filters[filterName] = nil
		end
	end
end

-- NamePlate Setup for ElvUI
function Private:Setup_NamePlates(installer)
	-- Make sure to enable the module
	E.private.nameplates.enable = true

	-- Restore defaults
	E.db.nameplates = E:CopyTable({}, P.nameplates)

	-- Setup StyleFilters (includes NamePlate CVars)
	Private:Setup_StyleFilters()

	-- NamePlates colors
	E.db.nameplates.colors.auraByType = false
	E.db.nameplates.colors.castbarDesaturate = false
	E.db.nameplates.colors.castColor.g = 1
	E.db.nameplates.colors.castColor.r = 0.02
	E.db.nameplates.colors.castNoInterruptColor.b = 0
	E.db.nameplates.colors.castNoInterruptColor.g = 0
	E.db.nameplates.colors.castNoInterruptColor.r = 1
	E.db.nameplates.colors.glowColor.b = 0.97
	E.db.nameplates.colors.glowColor.r = 0
	E.db.nameplates.colors.selection[0].b = 0.07
	E.db.nameplates.colors.selection[0].g = 0.13
	E.db.nameplates.colors.selection[0].r = 0.92
	E.db.nameplates.colors.selection[2].b = 0.27
	E.db.nameplates.colors.selection[2].g = 0.8
	E.db.nameplates.colors.selection[2].r = 0.93
	E.db.nameplates.colors.selection[3].b = 0.02
	E.db.nameplates.colors.selection[3].g = 0.82
	E.db.nameplates.colors.selection[3].r = 0.02
	E.db.nameplates.colors.threat.badColor.b = 0
	E.db.nameplates.colors.threat.badColor.g = 0
	E.db.nameplates.colors.threat.badTransition.b = 0
	E.db.nameplates.colors.threat.badTransition.g = 0.8
	E.db.nameplates.colors.threat.goodColor.b = 1
	E.db.nameplates.colors.threat.goodColor.g = 0.5
	E.db.nameplates.colors.threat.goodColor.r = 0.5
	E.db.nameplates.colors.threat.goodTransition.b = 0
	E.db.nameplates.colors.threat.goodTransition.g = 1
	E.db.nameplates.colors.threat.offTankColor.g = 0.92
	E.db.nameplates.colors.threat.offTankColor.r = 0.73
	E.db.nameplates.colors.threat.offTankColorBadTransition.b = 1
	E.db.nameplates.colors.threat.offTankColorBadTransition.g = 0.92
	E.db.nameplates.colors.threat.offTankColorBadTransition.r = 0.73
	E.db.nameplates.colors.threat.offTankColorGoodTransition.b = 1
	E.db.nameplates.colors.threat.offTankColorGoodTransition.g = 0.92
	E.db.nameplates.colors.threat.offTankColorGoodTransition.r = 0.73
	E.db.nameplates.colors.threat.soloColor.b = 1
	E.db.nameplates.colors.threat.soloColor.g = 0.5
	E.db.nameplates.colors.threat.soloColor.r = 0.5

	-- NamePlates general
	E.db.nameplates.cooldown.override = false
	E.db.nameplates.fadeIn = false
	E.db.nameplates.lowHealthThreshold = 0
	E.db.nameplates.overlapH = 1
	E.db.nameplates.overlapV = 2.2
	E.db.nameplates.plateSize.enemyWidth = 210
	E.db.nameplates.plateSize.friendlyHeight = 8
	E.db.nameplates.plateSize.friendlyWidth = 210
	E.db.nameplates.plateSize.personalWidth = 210
	E.db.nameplates.statusbar = Private.Texture
	E.db.nameplates.threat.useSoloColor = true

	-- NamePlates misc
	E.db.nameplates.visibility.enemy.guardians = true
	E.db.nameplates.visibility.enemy.minions = true
	E.db.nameplates.widgets.below = false

	-- Target indicator
	E.db.nameplates.units.TARGET.arrowScale = 0.7
	E.db.nameplates.units.TARGET.arrowSpacing = 25
	E.db.nameplates.units.TARGET.glowStyle = 'style2'

	-- Enemy NPC
	E.db.nameplates.units.ENEMY_NPC.auras.countFont = Private.Font
	E.db.nameplates.units.ENEMY_NPC.auras.countFontSize = 12
	E.db.nameplates.units.ENEMY_NPC.auras.countXOffset = 1
	E.db.nameplates.units.ENEMY_NPC.auras.countYOffset = 1
	E.db.nameplates.units.ENEMY_NPC.auras.desaturate = false
	E.db.nameplates.units.ENEMY_NPC.auras.height = 24
	E.db.nameplates.units.ENEMY_NPC.auras.keepSizeRatio = false
	E.db.nameplates.units.ENEMY_NPC.auras.numAuras = 3
	E.db.nameplates.units.ENEMY_NPC.auras.priority = Private.isRetail and 'ImportantCC' or 'CCDebuffs'
	E.db.nameplates.units.ENEMY_NPC.auras.size = 30
	E.db.nameplates.units.ENEMY_NPC.auras.sortMethod = 'INDEX'
	E.db.nameplates.units.ENEMY_NPC.auras.sourceText.font = Private.Font
	E.db.nameplates.units.ENEMY_NPC.auras.sourceText.fontSize = 11
	E.db.nameplates.units.ENEMY_NPC.auras.sourceText.length = 5
	E.db.nameplates.units.ENEMY_NPC.auras.sourceText.xOffset = 2
	E.db.nameplates.units.ENEMY_NPC.auras.sourceText.yOffset = 13
	E.db.nameplates.units.ENEMY_NPC.auras.yOffset = -1
	E.db.nameplates.units.ENEMY_NPC.buffs.anchorPoint = 'TOPRIGHT'
	E.db.nameplates.units.ENEMY_NPC.buffs.countFont = Private.Font
	E.db.nameplates.units.ENEMY_NPC.buffs.countFontSize = 12
	E.db.nameplates.units.ENEMY_NPC.buffs.countPosition = 'TOP'
	E.db.nameplates.units.ENEMY_NPC.buffs.countXOffset = 1
	E.db.nameplates.units.ENEMY_NPC.buffs.countYOffset = 14
	E.db.nameplates.units.ENEMY_NPC.buffs.desaturate = false
	E.db.nameplates.units.ENEMY_NPC.buffs.font = Private.Font
	E.db.nameplates.units.ENEMY_NPC.buffs.fontSize = 10
	E.db.nameplates.units.ENEMY_NPC.buffs.growthX = 'LEFT'
	E.db.nameplates.units.ENEMY_NPC.buffs.maxDuration = 300
	E.db.nameplates.units.ENEMY_NPC.buffs.numAuras = 4
	E.db.nameplates.units.ENEMY_NPC.buffs.priority = 'Dispellable'
	E.db.nameplates.units.ENEMY_NPC.buffs.size = 22
	E.db.nameplates.units.ENEMY_NPC.buffs.xOffset = 1
	E.db.nameplates.units.ENEMY_NPC.buffs.yOffset = -3
	E.db.nameplates.units.ENEMY_NPC.castbar.anchorPoint = 'BOTTOMLEFT'
	E.db.nameplates.units.ENEMY_NPC.castbar.castTimeFormat = 'REMAINING'
	E.db.nameplates.units.ENEMY_NPC.castbar.channelTimeFormat = 'REMAINING'
	E.db.nameplates.units.ENEMY_NPC.castbar.displayTarget = true
	E.db.nameplates.units.ENEMY_NPC.castbar.font = Private.Font
	E.db.nameplates.units.ENEMY_NPC.castbar.fontSize = 10
	E.db.nameplates.units.ENEMY_NPC.castbar.height = 14
	E.db.nameplates.units.ENEMY_NPC.castbar.iconOffsetX = 2
	E.db.nameplates.units.ENEMY_NPC.castbar.iconOffsetY = -1
	E.db.nameplates.units.ENEMY_NPC.castbar.iconPosition = 'LEFT'
	E.db.nameplates.units.ENEMY_NPC.castbar.iconSize = 16
	E.db.nameplates.units.ENEMY_NPC.castbar.targetAnchorPoint = 'RIGHT'
	E.db.nameplates.units.ENEMY_NPC.castbar.targetFont = Private.Font
	E.db.nameplates.units.ENEMY_NPC.castbar.targetStyle = 'SEPARATE'
	E.db.nameplates.units.ENEMY_NPC.castbar.targetXOffset = 2
	E.db.nameplates.units.ENEMY_NPC.castbar.textPosition = 'ONBAR'
	E.db.nameplates.units.ENEMY_NPC.castbar.textXOffset = 4
	E.db.nameplates.units.ENEMY_NPC.castbar.timeToHold = 2
	E.db.nameplates.units.ENEMY_NPC.castbar.timeXOffset = -1
	E.db.nameplates.units.ENEMY_NPC.castbar.width = 197
	E.db.nameplates.units.ENEMY_NPC.castbar.xOffset = 13
	E.db.nameplates.units.ENEMY_NPC.castbar.yOffset = 3
	E.db.nameplates.units.ENEMY_NPC.debuffs.anchorPoint = 'LEFT'
	E.db.nameplates.units.ENEMY_NPC.debuffs.countFont = Private.Font
	E.db.nameplates.units.ENEMY_NPC.debuffs.countFontSize = 12
	E.db.nameplates.units.ENEMY_NPC.debuffs.countPosition = 'TOP'
	E.db.nameplates.units.ENEMY_NPC.debuffs.countXOffset = 1
	E.db.nameplates.units.ENEMY_NPC.debuffs.countYOffset = 14
	E.db.nameplates.units.ENEMY_NPC.debuffs.desaturate = false
	E.db.nameplates.units.ENEMY_NPC.debuffs.font = Private.Font
	E.db.nameplates.units.ENEMY_NPC.debuffs.fontSize = 10
	E.db.nameplates.units.ENEMY_NPC.debuffs.numAuras = 4
	E.db.nameplates.units.ENEMY_NPC.debuffs.priority = Private.isRetail and 'blockNonPersonal,ClassDebuffs' or 'blockCCDebuffs,Personal'
	E.db.nameplates.units.ENEMY_NPC.debuffs.size = 24
	E.db.nameplates.units.ENEMY_NPC.debuffs.xOffset = -2
	E.db.nameplates.units.ENEMY_NPC.debuffs.yOffset = -1
	E.db.nameplates.units.ENEMY_NPC.eliteIcon.size = 14
	E.db.nameplates.units.ENEMY_NPC.eliteIcon.xOffset = 3
	E.db.nameplates.units.ENEMY_NPC.health.height = 22
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
	E.db.nameplates.units.ENEMY_PLAYER.auras.countFont = Private.Font
	E.db.nameplates.units.ENEMY_PLAYER.auras.countFontSize = 12
	E.db.nameplates.units.ENEMY_PLAYER.auras.countXOffset = 1
	E.db.nameplates.units.ENEMY_PLAYER.auras.countYOffset = 1
	E.db.nameplates.units.ENEMY_PLAYER.auras.desaturate = false
	E.db.nameplates.units.ENEMY_PLAYER.auras.height = 24
	E.db.nameplates.units.ENEMY_PLAYER.auras.keepSizeRatio = false
	E.db.nameplates.units.ENEMY_PLAYER.auras.numAuras = 3
	E.db.nameplates.units.ENEMY_PLAYER.auras.priority = Private.isRetail and 'ImportantCC' or 'CCDebuffs'
	E.db.nameplates.units.ENEMY_PLAYER.auras.size = 30
	E.db.nameplates.units.ENEMY_PLAYER.auras.sortMethod = 'INDEX'
	E.db.nameplates.units.ENEMY_PLAYER.auras.sourceText.font = Private.Font
	E.db.nameplates.units.ENEMY_PLAYER.auras.sourceText.fontSize = 11
	E.db.nameplates.units.ENEMY_PLAYER.auras.sourceText.length = 5
	E.db.nameplates.units.ENEMY_PLAYER.auras.sourceText.xOffset = 2
	E.db.nameplates.units.ENEMY_PLAYER.auras.sourceText.yOffset = 13
	E.db.nameplates.units.ENEMY_PLAYER.auras.yOffset = -1
	E.db.nameplates.units.ENEMY_PLAYER.buffs.anchorPoint = 'TOPRIGHT'
	E.db.nameplates.units.ENEMY_PLAYER.buffs.countFont = Private.Font
	E.db.nameplates.units.ENEMY_PLAYER.buffs.countFontSize = 12
	E.db.nameplates.units.ENEMY_PLAYER.buffs.countPosition = 'TOP'
	E.db.nameplates.units.ENEMY_PLAYER.buffs.countXOffset = 1
	E.db.nameplates.units.ENEMY_PLAYER.buffs.countYOffset = 14
	E.db.nameplates.units.ENEMY_PLAYER.buffs.desaturate = false
	E.db.nameplates.units.ENEMY_PLAYER.buffs.font = Private.Font
	E.db.nameplates.units.ENEMY_PLAYER.buffs.fontSize = 10
	E.db.nameplates.units.ENEMY_PLAYER.buffs.growthX = 'LEFT'
	E.db.nameplates.units.ENEMY_PLAYER.buffs.numAuras = 4
	E.db.nameplates.units.ENEMY_PLAYER.buffs.priority = 'Dispellable'
	E.db.nameplates.units.ENEMY_PLAYER.buffs.size = 22
	E.db.nameplates.units.ENEMY_PLAYER.buffs.xOffset = 1
	E.db.nameplates.units.ENEMY_PLAYER.buffs.yOffset = -3
	E.db.nameplates.units.ENEMY_PLAYER.castbar.anchorPoint = 'BOTTOMLEFT'
	E.db.nameplates.units.ENEMY_PLAYER.castbar.castTimeFormat = 'REMAINING'
	E.db.nameplates.units.ENEMY_PLAYER.castbar.channelTimeFormat = 'REMAINING'
	E.db.nameplates.units.ENEMY_PLAYER.castbar.displayTarget = true
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
	E.db.nameplates.units.ENEMY_PLAYER.castbar.width = 197
	E.db.nameplates.units.ENEMY_PLAYER.castbar.xOffset = 13
	E.db.nameplates.units.ENEMY_PLAYER.castbar.yOffset = 3
	E.db.nameplates.units.ENEMY_PLAYER.debuffs.anchorPoint = 'LEFT'
	E.db.nameplates.units.ENEMY_PLAYER.debuffs.countFont = Private.Font
	E.db.nameplates.units.ENEMY_PLAYER.debuffs.countFontSize = 12
	E.db.nameplates.units.ENEMY_PLAYER.debuffs.countPosition = 'TOP'
	E.db.nameplates.units.ENEMY_PLAYER.debuffs.countXOffset = 1
	E.db.nameplates.units.ENEMY_PLAYER.debuffs.countYOffset = 14
	E.db.nameplates.units.ENEMY_PLAYER.debuffs.desaturate = false
	E.db.nameplates.units.ENEMY_PLAYER.debuffs.font = Private.Font
	E.db.nameplates.units.ENEMY_PLAYER.debuffs.fontSize = 10
	E.db.nameplates.units.ENEMY_PLAYER.debuffs.numAuras = 4
	E.db.nameplates.units.ENEMY_PLAYER.debuffs.priority = Private.isRetail and 'blockNonPersonal,ClassDebuffs' or 'blockCCDebuffs,Personal'
	E.db.nameplates.units.ENEMY_PLAYER.debuffs.size = 24
	E.db.nameplates.units.ENEMY_PLAYER.debuffs.xOffset = -2
	E.db.nameplates.units.ENEMY_PLAYER.debuffs.yOffset = -1
	E.db.nameplates.units.ENEMY_PLAYER.health.height = 22
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
	E.db.nameplates.units.FRIENDLY_NPC.buffs.enable = false
	E.db.nameplates.units.FRIENDLY_NPC.debuffs.enable = false
	E.db.nameplates.units.FRIENDLY_NPC.health.text.format = '[luckyone:health:percent]'
	E.db.nameplates.units.FRIENDLY_NPC.name.font = Private.Font
	E.db.nameplates.units.FRIENDLY_NPC.name.fontSize = 14
	E.db.nameplates.units.FRIENDLY_NPC.name.yOffset = 0
	E.db.nameplates.units.FRIENDLY_NPC.questIcon.enable = false
	E.db.nameplates.units.FRIENDLY_NPC.raidTargetIndicator.size = 20
	E.db.nameplates.units.FRIENDLY_NPC.title.enable = true
	E.db.nameplates.units.FRIENDLY_NPC.title.font = Private.Font

	-- Friendly Player
	E.db.nameplates.units.FRIENDLY_PLAYER.auras.enable = false
	E.db.nameplates.units.FRIENDLY_PLAYER.buffs.enable = false
	E.db.nameplates.units.FRIENDLY_PLAYER.debuffs.enable = false
	E.db.nameplates.units.FRIENDLY_PLAYER.health.text.format = '[luckyone:health:percent]'
	E.db.nameplates.units.FRIENDLY_PLAYER.markHealers = false
	E.db.nameplates.units.FRIENDLY_PLAYER.markTanks = false
	E.db.nameplates.units.FRIENDLY_PLAYER.name.font = Private.Font
	E.db.nameplates.units.FRIENDLY_PLAYER.name.fontSize = 14
	E.db.nameplates.units.FRIENDLY_PLAYER.name.yOffset = 0
	E.db.nameplates.units.FRIENDLY_PLAYER.nameOnly = true
	E.db.nameplates.units.FRIENDLY_PLAYER.raidTargetIndicator.size = 20
	E.db.nameplates.units.FRIENDLY_PLAYER.title.enable = true
	E.db.nameplates.units.FRIENDLY_PLAYER.title.font = Private.Font

	if NP.Initialized then
		E:UpdateNamePlates(true)
	end

	if installer then
		_G.LuckyoneInstallStepComplete:ShowMessage(L["NamePlate StyleFilters and CVars have been set."])
	end
end

-- Custom StyleFilters
function Private:Setup_StyleFilters(skipVars)
	if not E.private.nameplates.enable then return end

	-- Wipe old filters
	Cleanup()

	-- Base filters
	local baseFilters = {
		'Luckyone_Quest_H',
		'Luckyone_Quest_N',
	}

	-- NonClassic specific filters
	local nonClassicFilters = {
		'Luckyone_Focus',
	}

	-- Retail specific filters
	local retailFilters = {
		-- Global
		'Luckyone_SPECIAL',
		-- Raid
		'Luckyone_MF',
		-- Dungeons
		'Luckyone_ARAK',
		'Luckyone_EDA',
		'Luckyone_HOA',
		'Luckyone_PSF',
		'Luckyone_FLOOD',
		'Luckyone_GMBT',
		'Luckyone_STRT',
		'Luckyone_DAWN',
	}

	-- Create base filters
	for _, filterName in ipairs(baseFilters) do
		E.global.nameplates.filters[filterName] = {}
		E.NamePlates:StyleFilterCopyDefaults(E.global.nameplates.filters[filterName])
		E.db.nameplates.filters[filterName] = { triggers = { enable = true } }
	end

	-- Disable alpha fading and scaling for ElvUI_Target and ElvUI_NonTarget
	E.global.nameplates.filters.ElvUI_NonTarget.actions.alpha = -1
	E.global.nameplates.filters.ElvUI_Target.actions.scale = 1

	-- Turn off both default filters
	E.db.nameplates.filters.ElvUI_NonTarget.triggers.enable = false
	E.db.nameplates.filters.ElvUI_Target.triggers.enable = false

	-- Quest Hostile
	E.global.nameplates.filters.Luckyone_Quest_H.actions.health.colors.color.b = 0
	E.global.nameplates.filters.Luckyone_Quest_H.actions.health.colors.color.g = 0.37
	E.global.nameplates.filters.Luckyone_Quest_H.actions.health.colors.enable = true
	E.global.nameplates.filters.Luckyone_Quest_H.triggers.isNotTapDenied = true
	E.global.nameplates.filters.Luckyone_Quest_H.triggers.isQuest = true
	E.global.nameplates.filters.Luckyone_Quest_H.triggers.outOfCombatUnit = true
	E.global.nameplates.filters.Luckyone_Quest_H.triggers.priority = 2
	E.global.nameplates.filters.Luckyone_Quest_H.triggers.reactionType.enable = true
	E.global.nameplates.filters.Luckyone_Quest_H.triggers.reactionType.hostile = true

	-- Quest Neutral
	E.global.nameplates.filters.Luckyone_Quest_N.actions.health.colors.color.b = 0
	E.global.nameplates.filters.Luckyone_Quest_N.actions.health.colors.color.g = 0.65
	E.global.nameplates.filters.Luckyone_Quest_N.actions.health.colors.enable = true
	E.global.nameplates.filters.Luckyone_Quest_N.triggers.isNotTapDenied = true
	E.global.nameplates.filters.Luckyone_Quest_N.triggers.isQuest = true
	E.global.nameplates.filters.Luckyone_Quest_N.triggers.outOfCombatUnit = true
	E.global.nameplates.filters.Luckyone_Quest_N.triggers.priority = 2
	E.global.nameplates.filters.Luckyone_Quest_N.triggers.reactionType.enable = true
	E.global.nameplates.filters.Luckyone_Quest_N.triggers.reactionType.neutral = true

	if not Private.isClassic then

		-- Create NonClassic specific filters
		for _, filterName in ipairs(nonClassicFilters) do
			E.global.nameplates.filters[filterName] = {}
			E.NamePlates:StyleFilterCopyDefaults(E.global.nameplates.filters[filterName])
			E.db.nameplates.filters[filterName] = { triggers = { enable = true } }
		end

		-- Focus target [FOCUS]
		E.global.nameplates.filters.Luckyone_Focus.actions.health.texture.enable = true
		E.global.nameplates.filters.Luckyone_Focus.actions.health.texture.texture = 'Luckyone Focus'
		E.global.nameplates.filters.Luckyone_Focus.triggers.isFocus = true
		E.global.nameplates.filters.Luckyone_Focus.triggers.priority = 2
	end

	if Private.isRetail then

		-- Create retail specific filters
		for _, filterName in ipairs(retailFilters) do
			E.global.nameplates.filters[filterName] = {}
			E.NamePlates:StyleFilterCopyDefaults(E.global.nameplates.filters[filterName])
			E.db.nameplates.filters[filterName] = { triggers = { enable = true } }
		end

		-- Special coloring [SPECIAL]
		E.global.nameplates.filters.Luckyone_SPECIAL.actions.health.colors.enable = true
		E.global.nameplates.filters.Luckyone_SPECIAL.actions.health.colors.color.r = 1
		E.global.nameplates.filters.Luckyone_SPECIAL.actions.health.colors.color.g = 0.25
		E.global.nameplates.filters.Luckyone_SPECIAL.actions.health.colors.color.b = 0.99
		E.global.nameplates.filters.Luckyone_SPECIAL.triggers.instanceDifficulty.dungeon['mythic'] = true
		E.global.nameplates.filters.Luckyone_SPECIAL.triggers.instanceDifficulty.dungeon['mythic+'] = true
		E.global.nameplates.filters.Luckyone_SPECIAL.triggers.instanceType['party'] = true
		E.global.nameplates.filters.Luckyone_SPECIAL.triggers.names['231176'] = true -- Scaffolding [FLOOD]
		E.global.nameplates.filters.Luckyone_SPECIAL.triggers.names['179733'] = true -- Invigorating Fish Stick [GMBT]
		E.global.nameplates.filters.Luckyone_SPECIAL.triggers.names['180433'] = true -- Wandering Pulsar [GMBT]
		E.global.nameplates.filters.Luckyone_SPECIAL.triggers.names['175576'] = true -- Containment Cell [STRT]
		E.global.nameplates.filters.Luckyone_SPECIAL.triggers.names['177237'] = true -- Chains of Damnation [STRT]
		E.global.nameplates.filters.Luckyone_SPECIAL.triggers.names['244302'] = true -- Binding Javelin [EDA]
		E.global.nameplates.filters.Luckyone_SPECIAL.triggers.names['240952'] = true -- Evoked Spirit [EDA]
		E.global.nameplates.filters.Luckyone_SPECIAL.triggers.priority = 2

		-- Manaforge Omega [MF]
		E.global.nameplates.filters.Luckyone_MF.actions.health.colors.enable = true
		E.global.nameplates.filters.Luckyone_MF.actions.health.colors.color.r = 1
		E.global.nameplates.filters.Luckyone_MF.actions.health.colors.color.g = 0.25
		E.global.nameplates.filters.Luckyone_MF.actions.health.colors.color.b = 0.99
		E.global.nameplates.filters.Luckyone_MF.triggers.instanceType['raid'] = true
		E.global.nameplates.filters.Luckyone_MF.triggers.names['241800'] = true -- Manaforged Titan [Nexus-King Salhadaar]
		E.global.nameplates.filters.Luckyone_MF.triggers.names['242587'] = true -- Living Mass [Dimensius]
		E.global.nameplates.filters.Luckyone_MF.triggers.priority = 2

		-- Ara-Kara, City of Echoes [ARAK]
		E.global.nameplates.filters.Luckyone_ARAK.actions.health.colors.enable = true
		E.global.nameplates.filters.Luckyone_ARAK.actions.health.colors.color.g = 0.75
		E.global.nameplates.filters.Luckyone_ARAK.actions.health.colors.color.r = 0
		E.global.nameplates.filters.Luckyone_ARAK.triggers.instanceDifficulty.dungeon['mythic'] = true
		E.global.nameplates.filters.Luckyone_ARAK.triggers.instanceDifficulty.dungeon['mythic+'] = true
		E.global.nameplates.filters.Luckyone_ARAK.triggers.instanceType['party'] = true
		E.global.nameplates.filters.Luckyone_ARAK.triggers.names['216293'] = true -- Trilling Attendant
		E.global.nameplates.filters.Luckyone_ARAK.triggers.names['218961'] = true -- Starved Crawler
		E.global.nameplates.filters.Luckyone_ARAK.triggers.names['223253'] = true -- Bloodstained Webmage
		E.global.nameplates.filters.Luckyone_ARAK.triggers.names['216340'] = true -- Sentry Stagshell
		E.global.nameplates.filters.Luckyone_ARAK.triggers.names['216364'] = true -- Blood Overseer
		E.global.nameplates.filters.Luckyone_ARAK.triggers.priority = 2

		-- Eco-Dome Al'dani [EDA]
		E.global.nameplates.filters.Luckyone_EDA.actions.health.colors.enable = true
		E.global.nameplates.filters.Luckyone_EDA.actions.health.colors.color.g = 0.75
		E.global.nameplates.filters.Luckyone_EDA.actions.health.colors.color.r = 0
		E.global.nameplates.filters.Luckyone_EDA.triggers.instanceDifficulty.dungeon['mythic'] = true
		E.global.nameplates.filters.Luckyone_EDA.triggers.instanceDifficulty.dungeon['mythic+'] = true
		E.global.nameplates.filters.Luckyone_EDA.triggers.instanceType['party'] = true
		E.global.nameplates.filters.Luckyone_EDA.triggers.names['234957'] = true -- Wastelander Ritualist
		E.global.nameplates.filters.Luckyone_EDA.triggers.names['234955'] = true -- Wastelander Pactspeaker
		E.global.nameplates.filters.Luckyone_EDA.triggers.priority = 2

		-- Halls of Atonement [HOA]
		E.global.nameplates.filters.Luckyone_HOA.actions.health.colors.enable = true
		E.global.nameplates.filters.Luckyone_HOA.actions.health.colors.color.g = 0.75
		E.global.nameplates.filters.Luckyone_HOA.actions.health.colors.color.r = 0
		E.global.nameplates.filters.Luckyone_HOA.triggers.instanceDifficulty.dungeon['mythic'] = true
		E.global.nameplates.filters.Luckyone_HOA.triggers.instanceDifficulty.dungeon['mythic+'] = true
		E.global.nameplates.filters.Luckyone_HOA.triggers.instanceType['party'] = true
		E.global.nameplates.filters.Luckyone_HOA.triggers.names['165414'] = true -- Depraved Obliterator
		E.global.nameplates.filters.Luckyone_HOA.triggers.names['164562'] = true -- Depraved Houndmaster
		E.global.nameplates.filters.Luckyone_HOA.triggers.priority = 2

		-- Priory of the Sacred Flame [PSF]
		E.global.nameplates.filters.Luckyone_PSF.actions.health.colors.enable = true
		E.global.nameplates.filters.Luckyone_PSF.actions.health.colors.color.g = 0.75
		E.global.nameplates.filters.Luckyone_PSF.actions.health.colors.color.r = 0
		E.global.nameplates.filters.Luckyone_PSF.triggers.instanceDifficulty.dungeon['mythic'] = true
		E.global.nameplates.filters.Luckyone_PSF.triggers.instanceDifficulty.dungeon['mythic+'] = true
		E.global.nameplates.filters.Luckyone_PSF.triggers.instanceType['party'] = true
		E.global.nameplates.filters.Luckyone_PSF.triggers.names['206697'] = true -- Devout Priest
		E.global.nameplates.filters.Luckyone_PSF.triggers.names['206698'] = true -- Fanatical Conjuror
		E.global.nameplates.filters.Luckyone_PSF.triggers.names['221760'] = true -- Risen Mage
		E.global.nameplates.filters.Luckyone_PSF.triggers.priority = 2

		-- Operation: Floodgate [FLOOD]
		E.global.nameplates.filters.Luckyone_FLOOD.actions.health.colors.enable = true
		E.global.nameplates.filters.Luckyone_FLOOD.actions.health.colors.color.g = 0.75
		E.global.nameplates.filters.Luckyone_FLOOD.actions.health.colors.color.r = 0
		E.global.nameplates.filters.Luckyone_FLOOD.triggers.instanceDifficulty.dungeon['mythic'] = true
		E.global.nameplates.filters.Luckyone_FLOOD.triggers.instanceDifficulty.dungeon['mythic+'] = true
		E.global.nameplates.filters.Luckyone_FLOOD.triggers.instanceType['party'] = true
		E.global.nameplates.filters.Luckyone_FLOOD.triggers.names['229686'] = true -- Venture Co. Surveyor
		E.global.nameplates.filters.Luckyone_FLOOD.triggers.names['229251'] = true -- Venture Co. Architect
		E.global.nameplates.filters.Luckyone_FLOOD.triggers.names['229212'] = true -- Darkfuse Demolitionist
		E.global.nameplates.filters.Luckyone_FLOOD.triggers.names['231312'] = true -- Venture Co. Electrician
		E.global.nameplates.filters.Luckyone_FLOOD.triggers.priority = 2

		-- Tazavesh: So'leah's Gambit [GMBT]
		E.global.nameplates.filters.Luckyone_GMBT.actions.health.colors.enable = true
		E.global.nameplates.filters.Luckyone_GMBT.actions.health.colors.color.g = 0.75
		E.global.nameplates.filters.Luckyone_GMBT.actions.health.colors.color.r = 0
		E.global.nameplates.filters.Luckyone_GMBT.triggers.instanceDifficulty.dungeon['mythic'] = true
		E.global.nameplates.filters.Luckyone_GMBT.triggers.instanceDifficulty.dungeon['mythic+'] = true
		E.global.nameplates.filters.Luckyone_GMBT.triggers.instanceType['party'] = true
		E.global.nameplates.filters.Luckyone_GMBT.triggers.names['178142'] = true -- Murkbrine Fishmancer
		E.global.nameplates.filters.Luckyone_GMBT.triggers.names['176551'] = true -- Vault Purifier
		E.global.nameplates.filters.Luckyone_GMBT.triggers.names['179388'] = true -- Hourglass Tidesage
		E.global.nameplates.filters.Luckyone_GMBT.triggers.names['180431'] = true -- Focused Ritualist
		E.global.nameplates.filters.Luckyone_GMBT.triggers.priority = 2

		-- Tazavesh: Streets of Wonder [STRT]
		E.global.nameplates.filters.Luckyone_STRT.actions.health.colors.enable = true
		E.global.nameplates.filters.Luckyone_STRT.actions.health.colors.color.g = 0.75
		E.global.nameplates.filters.Luckyone_STRT.actions.health.colors.color.r = 0
		E.global.nameplates.filters.Luckyone_STRT.triggers.instanceDifficulty.dungeon['mythic'] = true
		E.global.nameplates.filters.Luckyone_STRT.triggers.instanceDifficulty.dungeon['mythic+'] = true
		E.global.nameplates.filters.Luckyone_STRT.triggers.instanceType['party'] = true
		E.global.nameplates.filters.Luckyone_STRT.triggers.names['177817'] = true -- Support Officer
		E.global.nameplates.filters.Luckyone_STRT.triggers.names['180336'] = true -- Cartel Wiseguy
		E.global.nameplates.filters.Luckyone_STRT.triggers.names['176395'] = true -- Overloaded Mailemental
		E.global.nameplates.filters.Luckyone_STRT.triggers.names['179841'] = true -- Veteran Sparkcaster
		E.global.nameplates.filters.Luckyone_STRT.triggers.priority = 2

		-- The Dawnbreaker [DAWN]
		E.global.nameplates.filters.Luckyone_DAWN.actions.health.colors.enable = true
		E.global.nameplates.filters.Luckyone_DAWN.actions.health.colors.color.g = 0.75
		E.global.nameplates.filters.Luckyone_DAWN.actions.health.colors.color.r = 0
		E.global.nameplates.filters.Luckyone_DAWN.triggers.instanceDifficulty.dungeon['mythic'] = true
		E.global.nameplates.filters.Luckyone_DAWN.triggers.instanceDifficulty.dungeon['mythic+'] = true
		E.global.nameplates.filters.Luckyone_DAWN.triggers.instanceType['party'] = true
		E.global.nameplates.filters.Luckyone_DAWN.triggers.names['213892'] = true -- Nightfall Shadowmage
		E.global.nameplates.filters.Luckyone_DAWN.triggers.names['214761'] = true -- Nightfall Ritualist
		E.global.nameplates.filters.Luckyone_DAWN.triggers.names['213893'] = true -- Nightfall Darkcaster
		E.global.nameplates.filters.Luckyone_DAWN.triggers.priority = 2
	end

	-- Set NamePlate CVars
	if not skipVars then
		Private:NameplateCVars(true)
	end

	Private:Print(L["NamePlate StyleFilters and CVars have been set."])
end
