local L1UI, E, L, V, P, G = unpack(select(2, ...))
local NP = E:GetModule('NamePlates')

local pairs = pairs

-- NamePlate Setup for ElvUI and Plater
function L1UI:Setup_NamePlates()

	-- Make sure to enable ElvUI NamePlates
	E.private.nameplates.enable = true

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
	E.db.nameplates.overlapV = 1.6
	E.db.nameplates.plateSize.enemyHeight = 36
	E.db.nameplates.plateSize.enemyWidth = 190
	E.db.nameplates.plateSize.friendlyHeight = 36
	E.db.nameplates.plateSize.friendlyWidth = 190
	E.db.nameplates.plateSize.personalHeight = 36
	E.db.nameplates.plateSize.personalWidth = 190
	E.db.nameplates.statusbar = L1UI.DefaultTexture

	-- NamePlates misc
	E.db.nameplates.units.PLAYER.enable = false
	E.db.nameplates.visibility.enemy.guardians = true
	E.db.nameplates.visibility.enemy.minions = true

	-- Enemy NPC
	E.db.nameplates.units.ENEMY_NPC.buffs.anchorPoint = 'TOPRIGHT'
	E.db.nameplates.units.ENEMY_NPC.buffs.countFont = L1UI.DefaultFont
	E.db.nameplates.units.ENEMY_NPC.buffs.countFontSize = 12
	E.db.nameplates.units.ENEMY_NPC.buffs.countPosition = 'TOP'
	E.db.nameplates.units.ENEMY_NPC.buffs.countYOffset = 14
	E.db.nameplates.units.ENEMY_NPC.buffs.font = L1UI.DefaultFont
	E.db.nameplates.units.ENEMY_NPC.buffs.fontSize = 10
	E.db.nameplates.units.ENEMY_NPC.buffs.numAuras = 3
	E.db.nameplates.units.ENEMY_NPC.buffs.priority = 'Blacklist,Dispellable,RaidBuffsElvUI'
	E.db.nameplates.units.ENEMY_NPC.buffs.size = 20
	E.db.nameplates.units.ENEMY_NPC.buffs.spacing = 0
	E.db.nameplates.units.ENEMY_NPC.buffs.xOffset = 22
	E.db.nameplates.units.ENEMY_NPC.buffs.yOffset = -29
	E.db.nameplates.units.ENEMY_NPC.castbar.castTimeFormat = 'REMAINING'
	E.db.nameplates.units.ENEMY_NPC.castbar.channelTimeFormat = 'REMAINING'
	E.db.nameplates.units.ENEMY_NPC.castbar.font = L1UI.DefaultFont
	E.db.nameplates.units.ENEMY_NPC.castbar.fontSize = 10
	E.db.nameplates.units.ENEMY_NPC.castbar.height = 14
	E.db.nameplates.units.ENEMY_NPC.castbar.iconOffsetY = -1
	E.db.nameplates.units.ENEMY_NPC.castbar.iconPosition = 'LEFT'
	E.db.nameplates.units.ENEMY_NPC.castbar.iconSize = 35
	E.db.nameplates.units.ENEMY_NPC.castbar.textPosition = 'ONBAR'
	E.db.nameplates.units.ENEMY_NPC.castbar.textXOffset = 1
	E.db.nameplates.units.ENEMY_NPC.castbar.timeToHold = 2
	E.db.nameplates.units.ENEMY_NPC.castbar.timeXOffset = -1
	E.db.nameplates.units.ENEMY_NPC.castbar.width = 190
	E.db.nameplates.units.ENEMY_NPC.castbar.yOffset = -17
	E.db.nameplates.units.ENEMY_NPC.debuffs.anchorPoint = 'TOP'
	E.db.nameplates.units.ENEMY_NPC.debuffs.countFont = L1UI.DefaultFont
	E.db.nameplates.units.ENEMY_NPC.debuffs.countFontSize = 12
	E.db.nameplates.units.ENEMY_NPC.debuffs.countPosition = 'TOP'
	E.db.nameplates.units.ENEMY_NPC.debuffs.countYOffset = 14
	E.db.nameplates.units.ENEMY_NPC.debuffs.desaturate = false
	E.db.nameplates.units.ENEMY_NPC.debuffs.font = L1UI.DefaultFont
	E.db.nameplates.units.ENEMY_NPC.debuffs.fontSize = 10
	E.db.nameplates.units.ENEMY_NPC.debuffs.numAuras = 6
	E.db.nameplates.units.ENEMY_NPC.debuffs.size = 20
	E.db.nameplates.units.ENEMY_NPC.debuffs.yOffset = -8
	E.db.nameplates.units.ENEMY_NPC.eliteIcon.size = 14
	E.db.nameplates.units.ENEMY_NPC.eliteIcon.xOffset = 3
	E.db.nameplates.units.ENEMY_NPC.health.height = 18
	E.db.nameplates.units.ENEMY_NPC.health.text.font = L1UI.DefaultFont
	E.db.nameplates.units.ENEMY_NPC.health.text.format = '[luckyone:health:percent]'
	E.db.nameplates.units.ENEMY_NPC.health.text.position = 'TOPRIGHT'
	E.db.nameplates.units.ENEMY_NPC.health.text.yOffset = -23
	E.db.nameplates.units.ENEMY_NPC.level.enable = false
	E.db.nameplates.units.ENEMY_NPC.name.font = L1UI.DefaultFont
	E.db.nameplates.units.ENEMY_NPC.name.format = '[name:last]'
	E.db.nameplates.units.ENEMY_NPC.name.xOffset = 1
	E.db.nameplates.units.ENEMY_NPC.name.yOffset = -23
	E.db.nameplates.units.ENEMY_NPC.pvpindicator.size = 35
	E.db.nameplates.units.ENEMY_NPC.questIcon.enable = false
	E.db.nameplates.units.ENEMY_NPC.questIcon.font = L1UI.DefaultFont
	E.db.nameplates.units.ENEMY_NPC.questIcon.size = 25
	E.db.nameplates.units.ENEMY_NPC.questIcon.textPosition = 'CENTER'
	E.db.nameplates.units.ENEMY_NPC.raidTargetIndicator.size = 20
	E.db.nameplates.units.ENEMY_NPC.raidTargetIndicator.xOffset = -2
	E.db.nameplates.units.ENEMY_NPC.raidTargetIndicator.yOffset = 1

	-- Enemy Player
	E.db.nameplates.units.ENEMY_PLAYER.buffs.anchorPoint = 'TOPRIGHT'
	E.db.nameplates.units.ENEMY_PLAYER.buffs.countFont = L1UI.DefaultFont
	E.db.nameplates.units.ENEMY_PLAYER.buffs.countFontSize = 12
	E.db.nameplates.units.ENEMY_PLAYER.buffs.countPosition = 'TOP'
	E.db.nameplates.units.ENEMY_PLAYER.buffs.countYOffset = 14
	E.db.nameplates.units.ENEMY_PLAYER.buffs.font = L1UI.DefaultFont
	E.db.nameplates.units.ENEMY_PLAYER.buffs.fontSize = 10
	E.db.nameplates.units.ENEMY_PLAYER.buffs.maxDuration = 0
	E.db.nameplates.units.ENEMY_PLAYER.buffs.numAuras = 3
	E.db.nameplates.units.ENEMY_PLAYER.buffs.priority = 'Blacklist,Dispellable,RaidBuffsElvUI,TurtleBuffs'
	E.db.nameplates.units.ENEMY_PLAYER.buffs.size = 20
	E.db.nameplates.units.ENEMY_PLAYER.buffs.spacing = 0
	E.db.nameplates.units.ENEMY_PLAYER.buffs.xOffset = 22
	E.db.nameplates.units.ENEMY_PLAYER.buffs.yOffset = -29
	E.db.nameplates.units.ENEMY_PLAYER.castbar.castTimeFormat = 'REMAINING'
	E.db.nameplates.units.ENEMY_PLAYER.castbar.channelTimeFormat = 'REMAINING'
	E.db.nameplates.units.ENEMY_PLAYER.castbar.font = L1UI.DefaultFont
	E.db.nameplates.units.ENEMY_PLAYER.castbar.fontSize = 10
	E.db.nameplates.units.ENEMY_PLAYER.castbar.height = 14
	E.db.nameplates.units.ENEMY_PLAYER.castbar.iconOffsetY = -1
	E.db.nameplates.units.ENEMY_PLAYER.castbar.iconPosition = 'LEFT'
	E.db.nameplates.units.ENEMY_PLAYER.castbar.iconSize = 35
	E.db.nameplates.units.ENEMY_PLAYER.castbar.textPosition = 'ONBAR'
	E.db.nameplates.units.ENEMY_PLAYER.castbar.textXOffset = 1
	E.db.nameplates.units.ENEMY_PLAYER.castbar.timeToHold = 2
	E.db.nameplates.units.ENEMY_PLAYER.castbar.timeXOffset = -1
	E.db.nameplates.units.ENEMY_PLAYER.castbar.width = 190
	E.db.nameplates.units.ENEMY_PLAYER.castbar.yOffset = -17
	E.db.nameplates.units.ENEMY_PLAYER.debuffs.anchorPoint = 'TOP'
	E.db.nameplates.units.ENEMY_PLAYER.debuffs.countFont = L1UI.DefaultFont
	E.db.nameplates.units.ENEMY_PLAYER.debuffs.countFontSize = 12
	E.db.nameplates.units.ENEMY_PLAYER.debuffs.countPosition = 'TOP'
	E.db.nameplates.units.ENEMY_PLAYER.debuffs.countYOffset = 14
	E.db.nameplates.units.ENEMY_PLAYER.debuffs.desaturate = false
	E.db.nameplates.units.ENEMY_PLAYER.debuffs.font = L1UI.DefaultFont
	E.db.nameplates.units.ENEMY_PLAYER.debuffs.fontSize = 10
	E.db.nameplates.units.ENEMY_PLAYER.debuffs.numAuras = 6
	E.db.nameplates.units.ENEMY_PLAYER.debuffs.priority = 'Blacklist,Personal,CCDebuffs'
	E.db.nameplates.units.ENEMY_PLAYER.debuffs.size = 20
	E.db.nameplates.units.ENEMY_PLAYER.debuffs.yOffset = -8
	E.db.nameplates.units.ENEMY_PLAYER.health.height = 18
	E.db.nameplates.units.ENEMY_PLAYER.health.text.font = L1UI.DefaultFont
	E.db.nameplates.units.ENEMY_PLAYER.health.text.format = '[luckyone:health:percent]'
	E.db.nameplates.units.ENEMY_PLAYER.health.text.position = 'TOPRIGHT'
	E.db.nameplates.units.ENEMY_PLAYER.health.text.yOffset = -23
	E.db.nameplates.units.ENEMY_PLAYER.level.enable = false
	E.db.nameplates.units.ENEMY_PLAYER.level.format = '[difficultycolor][level][shortclassification]'
	E.db.nameplates.units.ENEMY_PLAYER.markHealers = false
	E.db.nameplates.units.ENEMY_PLAYER.name.font = L1UI.DefaultFont
	E.db.nameplates.units.ENEMY_PLAYER.name.format = '[name:last]'
	E.db.nameplates.units.ENEMY_PLAYER.name.xOffset = 1
	E.db.nameplates.units.ENEMY_PLAYER.name.yOffset = -23
	E.db.nameplates.units.ENEMY_PLAYER.pvpindicator.size = 35
	E.db.nameplates.units.ENEMY_PLAYER.raidTargetIndicator.size = 20
	E.db.nameplates.units.ENEMY_PLAYER.raidTargetIndicator.xOffset = -2
	E.db.nameplates.units.ENEMY_PLAYER.raidTargetIndicator.yOffset = 1

	-- Friendly NPC
	E.db.nameplates.units.FRIENDLY_NPC.health.text.format = '[luckyone:health:percent]'
	E.db.nameplates.units.FRIENDLY_NPC.name.font = L1UI.DefaultFont
	E.db.nameplates.units.FRIENDLY_NPC.nameOnly = true
	E.db.nameplates.units.FRIENDLY_NPC.questIcon.enable = false
	E.db.nameplates.units.FRIENDLY_NPC.raidTargetIndicator.size = 20
	E.db.nameplates.units.FRIENDLY_NPC.title.enable = true
	E.db.nameplates.units.FRIENDLY_NPC.title.font = L1UI.DefaultFont

	-- Friendly Player
	E.db.nameplates.units.FRIENDLY_PLAYER.health.text.format = '[luckyone:health:percent]'
	E.db.nameplates.units.FRIENDLY_PLAYER.markHealers = false
	E.db.nameplates.units.FRIENDLY_PLAYER.markTanks = false
	E.db.nameplates.units.FRIENDLY_PLAYER.name.font = L1UI.DefaultFont
	E.db.nameplates.units.FRIENDLY_PLAYER.nameOnly = true
	E.db.nameplates.units.FRIENDLY_PLAYER.raidTargetIndicator.size = 20
	E.db.nameplates.units.FRIENDLY_PLAYER.title.enable = true
	E.db.nameplates.units.FRIENDLY_PLAYER.title.font = L1UI.DefaultFont

	-- Target indicator
	E.db.nameplates.units.TARGET.arrowScale = 0.7
	E.db.nameplates.units.TARGET.arrowSpacing = 25
	E.db.nameplates.units.TARGET.glowStyle = 'style8'

	-- Update the module so we don't require a ReloadUI
	if NP.Initialized then
		E:UpdateNamePlates(true)
	end
end

-- Custom StyleFilters for all current Dungeons
function L1UI:Setup_StyleFilters()
	if not E.private.nameplates.enable then return end

	if E.Retail then

		for _, filterName in pairs({'Luckyone_RLP', 'Luckyone_AA', 'Luckyone_NO', 'Luckyone_AV', 'Luckyone_COS', 'Luckyone_HOV', 'Luckyone_SBG', 'Luckyone_TOJS'}) do
			E.global.nameplates.filters[filterName] = {}
			E.NamePlates:StyleFilterCopyDefaults(E.global.nameplates.filters[filterName])
			E.db.nameplates.filters[filterName] = { triggers = { enable = true } }
		end

		-- Ruby Life Pools [RLP]
		E.global.nameplates.filters.Luckyone_RLP.actions.color.health = true
		E.global.nameplates.filters.Luckyone_RLP.actions.color.healthColor.g = 0.75
		E.global.nameplates.filters.Luckyone_RLP.actions.color.healthColor.r = 0
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
		E.global.nameplates.filters.Luckyone_AA.triggers.names['196576'] = true -- Spellbound Scepter
		E.global.nameplates.filters.Luckyone_AA.triggers.names['196671'] = true -- Arcane Ravager
		E.global.nameplates.filters.Luckyone_AA.triggers.names['197219'] = true -- Vile Lasher
		E.global.nameplates.filters.Luckyone_AA.triggers.names['196203'] = true -- Ethereal Restorer
		E.global.nameplates.filters.Luckyone_AA.triggers.names['192680'] = true -- Guardian Sentry
		E.global.nameplates.filters.Luckyone_AA.triggers.names['192333'] = true -- Alpha Eagle
		E.global.nameplates.filters.Luckyone_AA.triggers.priority = 2

		-- Nokhud Offensive [NO]
		E.global.nameplates.filters.Luckyone_NO.actions.color.health = true
		E.global.nameplates.filters.Luckyone_NO.actions.color.healthColor.g = 0.75
		E.global.nameplates.filters.Luckyone_NO.actions.color.healthColor.r = 0
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
		E.global.nameplates.filters.Luckyone_AV.triggers.names['187159'] = true -- Shrieking Whelp
		E.global.nameplates.filters.Luckyone_AV.triggers.names['187155'] = true -- Rune Seal Keeper
		E.global.nameplates.filters.Luckyone_AV.triggers.names['196116'] = true -- Crystal Fury
		E.global.nameplates.filters.Luckyone_AV.triggers.names['191739'] = true -- Scalebane Lieutenant
		E.global.nameplates.filters.Luckyone_AV.triggers.names['187240'] = true -- Drakonid Breaker
		E.global.nameplates.filters.Luckyone_AV.triggers.priority = 2

		-- Court of Stars [COS]
		E.global.nameplates.filters.Luckyone_COS.actions.color.health = true
		E.global.nameplates.filters.Luckyone_COS.actions.color.healthColor.g = 0.75
		E.global.nameplates.filters.Luckyone_COS.actions.color.healthColor.r = 0
		E.global.nameplates.filters.Luckyone_COS.triggers.names['104251'] = true -- Duskwatch Sentry
		E.global.nameplates.filters.Luckyone_COS.triggers.names['105715'] = true -- Watchful Inquisitor
		E.global.nameplates.filters.Luckyone_COS.triggers.names['104278'] = true -- Felbound Enforcer
		E.global.nameplates.filters.Luckyone_COS.triggers.names['105704'] = true -- Arcane Manifestation
		E.global.nameplates.filters.Luckyone_COS.triggers.priority = 2

		-- Halls of Valor [HOV]
		E.global.nameplates.filters.Luckyone_HOV.actions.color.health = true
		E.global.nameplates.filters.Luckyone_HOV.actions.color.healthColor.g = 0.75
		E.global.nameplates.filters.Luckyone_HOV.actions.color.healthColor.r = 0
		E.global.nameplates.filters.Luckyone_HOV.triggers.names['97068'] = true -- Storm Drake
		E.global.nameplates.filters.Luckyone_HOV.triggers.names['95834'] = true -- Valarjar Mystic
		E.global.nameplates.filters.Luckyone_HOV.triggers.names['96574'] = true -- Stormforged Sentinel
		E.global.nameplates.filters.Luckyone_HOV.triggers.priority = 2

		-- Shadowmoon Burial Grounds [SBG]
		E.global.nameplates.filters.Luckyone_SBG.actions.color.health = true
		E.global.nameplates.filters.Luckyone_SBG.actions.color.healthColor.g = 0.75
		E.global.nameplates.filters.Luckyone_SBG.actions.color.healthColor.r = 0
		E.global.nameplates.filters.Luckyone_SBG.triggers.names['75713'] = true -- Shadowmoon Bone-Mender
		E.global.nameplates.filters.Luckyone_SBG.triggers.names['75652'] = true -- Void Spawn
		E.global.nameplates.filters.Luckyone_SBG.triggers.priority = 2

		-- Temple of the Jade Serpent [TOJS]
		E.global.nameplates.filters.Luckyone_TOJS.actions.color.health = true
		E.global.nameplates.filters.Luckyone_TOJS.actions.color.healthColor.g = 0.75
		E.global.nameplates.filters.Luckyone_TOJS.actions.color.healthColor.r = 0
		E.global.nameplates.filters.Luckyone_TOJS.triggers.names['200126'] = true -- Fallen Waterspeaker
		E.global.nameplates.filters.Luckyone_TOJS.triggers.names['59546'] = true -- The Talking Fish
		E.global.nameplates.filters.Luckyone_TOJS.triggers.names['59553'] = true -- The Songbird Queen
		E.global.nameplates.filters.Luckyone_TOJS.triggers.names['59552'] = true -- The Crybaby Hozen
		E.global.nameplates.filters.Luckyone_TOJS.triggers.names['200137'] = true -- Depraved Mistweaver
		E.global.nameplates.filters.Luckyone_TOJS.triggers.names['57109'] = true -- Minion of Doubt
		E.global.nameplates.filters.Luckyone_TOJS.triggers.priority = 2

		-- Edited version of ElvUI_Explosives
		E.global.nameplates.filters.ElvUI_Explosives.actions.color.healthColor.b = 1
		E.global.nameplates.filters.ElvUI_Explosives.actions.color.healthColor.g = 0
		E.global.nameplates.filters.ElvUI_Explosives.actions.color.healthColor.r = 0.49
		E.global.nameplates.filters.ElvUI_Explosives.actions.scale = 1
		E.global.nameplates.filters.ElvUI_Explosives.actions.usePortrait = false
		E.global.nameplates.filters.ElvUI_Explosives.triggers.priority = 1
	end

	-- Disable alpha fading and scaling for ElvUI_Target and ElvUI_NonTarget
	E.global.nameplates.filters.ElvUI_NonTarget.actions.alpha = -1
	E.global.nameplates.filters.ElvUI_Target.actions.scale = 1

	-- Set NamePlate CVars
	L1UI:NameplateCVars()

	L1UI:Print(L["NamePlate StyleFilters and CVars have been set."])
end
