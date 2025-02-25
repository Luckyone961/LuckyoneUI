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
	E.db.nameplates.overlapV = 1.7
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
		'Luckyone_FALL', 'Luckyone_RISE', 'Luckyone_DHT', 'Luckyone_BRH', 'Luckyone_AD', 'Luckyone_WM', 'Luckyone_EB', 'Luckyone_TOTT', 'Luckyone_Amirdrassil',
		-- TWW Season 1
		'Luckyone_ARAK', 'Luckyone_COT', 'Luckyone_DAWN', 'Luckyone_SV', 'Luckyone_GB', 'Luckyone_MISTS', 'Luckyone_SIEGE', 'Luckyone_NW',
		-- TWW Season 2
		'Luckyone_BREW', 'Luckyone_ROOK', 'Luckyone_DFC', 'Luckyone_PSF', 'Luckyone_FLOOD', 'Luckyone_ML', 'Luckyone_TOP', 'Luckyone_WORK'
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

		-- TWW Season 2
		local filters = {
			-- Dungeons
			'Luckyone_BREW', 'Luckyone_ROOK', 'Luckyone_DFC', 'Luckyone_PSF', 'Luckyone_FLOOD', 'Luckyone_ML', 'Luckyone_TOP', 'Luckyone_WORK'
		}

		-- Create filters and set defaults
		for _, filterName in pairs(filters) do
			E.global.nameplates.filters[filterName] = {}
			E.NamePlates:StyleFilterCopyDefaults(E.global.nameplates.filters[filterName])
			E.db.nameplates.filters[filterName] = { triggers = { enable = true } }
		end

		-- Cinderbrew Meadery [BREW]
		E.global.nameplates.filters.Luckyone_BREW.actions.color.health = true
		E.global.nameplates.filters.Luckyone_BREW.actions.color.healthColor.g = 0.75
		E.global.nameplates.filters.Luckyone_BREW.actions.color.healthColor.r = 0
		E.global.nameplates.filters.Luckyone_BREW.triggers.instanceDifficulty.dungeon['mythic'] = true
		E.global.nameplates.filters.Luckyone_BREW.triggers.instanceDifficulty.dungeon['mythic+'] = true
		E.global.nameplates.filters.Luckyone_BREW.triggers.instanceType['party'] = true
		E.global.nameplates.filters.Luckyone_BREW.triggers.names['214673'] = true -- Flavor Scientist
		E.global.nameplates.filters.Luckyone_BREW.triggers.names['214697'] = true -- Chef Chewie
		E.global.nameplates.filters.Luckyone_BREW.triggers.names['220141'] = true -- Royal Jelly Purveyor
		E.global.nameplates.filters.Luckyone_BREW.triggers.priority = 2

		-- The Rookery [ROOK]
		E.global.nameplates.filters.Luckyone_ROOK.actions.color.health = true
		E.global.nameplates.filters.Luckyone_ROOK.actions.color.healthColor.g = 0.75
		E.global.nameplates.filters.Luckyone_ROOK.actions.color.healthColor.r = 0
		E.global.nameplates.filters.Luckyone_ROOK.triggers.instanceDifficulty.dungeon['mythic'] = true
		E.global.nameplates.filters.Luckyone_ROOK.triggers.instanceDifficulty.dungeon['mythic+'] = true
		E.global.nameplates.filters.Luckyone_ROOK.triggers.instanceType['party'] = true
		E.global.nameplates.filters.Luckyone_ROOK.triggers.names['209801'] = true -- Quartermaster Koratite
		E.global.nameplates.filters.Luckyone_ROOK.triggers.names['212793'] = true -- Void Ascendant
		E.global.nameplates.filters.Luckyone_ROOK.triggers.priority = 2

		-- Darkflame Cleft [DFC]
		E.global.nameplates.filters.Luckyone_DFC.actions.color.health = true
		E.global.nameplates.filters.Luckyone_DFC.actions.color.healthColor.g = 0.75
		E.global.nameplates.filters.Luckyone_DFC.actions.color.healthColor.r = 0
		E.global.nameplates.filters.Luckyone_DFC.triggers.instanceDifficulty.dungeon['mythic'] = true
		E.global.nameplates.filters.Luckyone_DFC.triggers.instanceDifficulty.dungeon['mythic+'] = true
		E.global.nameplates.filters.Luckyone_DFC.triggers.instanceType['party'] = true
		E.global.nameplates.filters.Luckyone_DFC.triggers.names['210818'] = true -- Lowly Moleherd
		E.global.nameplates.filters.Luckyone_DFC.triggers.names['208456'] = true -- Shuffling Horror
		E.global.nameplates.filters.Luckyone_DFC.triggers.names['212411'] = true -- Torchsnarl
		E.global.nameplates.filters.Luckyone_DFC.triggers.priority = 2

		-- Priory of the Sacred Flame [PSF]
		E.global.nameplates.filters.Luckyone_PSF.actions.color.health = true
		E.global.nameplates.filters.Luckyone_PSF.actions.color.healthColor.g = 0.75
		E.global.nameplates.filters.Luckyone_PSF.actions.color.healthColor.r = 0
		E.global.nameplates.filters.Luckyone_PSF.triggers.instanceDifficulty.dungeon['mythic'] = true
		E.global.nameplates.filters.Luckyone_PSF.triggers.instanceDifficulty.dungeon['mythic+'] = true
		E.global.nameplates.filters.Luckyone_PSF.triggers.instanceType['party'] = true
		E.global.nameplates.filters.Luckyone_PSF.triggers.names['206697'] = true -- Devout Priest
		E.global.nameplates.filters.Luckyone_PSF.triggers.priority = 2

		-- Operation: Floodgate [FLOOD]
		E.global.nameplates.filters.Luckyone_FLOOD.actions.color.health = true
		E.global.nameplates.filters.Luckyone_FLOOD.actions.color.healthColor.g = 0.75
		E.global.nameplates.filters.Luckyone_FLOOD.actions.color.healthColor.r = 0
		E.global.nameplates.filters.Luckyone_FLOOD.triggers.instanceDifficulty.dungeon['mythic'] = true
		E.global.nameplates.filters.Luckyone_FLOOD.triggers.instanceDifficulty.dungeon['mythic+'] = true
		E.global.nameplates.filters.Luckyone_FLOOD.triggers.instanceType['party'] = true
		E.global.nameplates.filters.Luckyone_FLOOD.triggers.names['229251'] = true -- Venture Co. Architect
		E.global.nameplates.filters.Luckyone_FLOOD.triggers.names['230748'] = true -- Darkfuse Bloodwarper
		E.global.nameplates.filters.Luckyone_FLOOD.triggers.names['231312'] = true -- Venture Co. Electrician
		E.global.nameplates.filters.Luckyone_FLOOD.triggers.priority = 2

		-- The MOTHERLODE!! [ML]
		E.global.nameplates.filters.Luckyone_ML.actions.color.health = true
		E.global.nameplates.filters.Luckyone_ML.actions.color.healthColor.g = 0.75
		E.global.nameplates.filters.Luckyone_ML.actions.color.healthColor.r = 0
		E.global.nameplates.filters.Luckyone_ML.triggers.instanceDifficulty.dungeon['mythic'] = true
		E.global.nameplates.filters.Luckyone_ML.triggers.instanceDifficulty.dungeon['mythic+'] = true
		E.global.nameplates.filters.Luckyone_ML.triggers.instanceType['party'] = true
		E.global.nameplates.filters.Luckyone_ML.triggers.names['136470'] = true -- Refreshment Vendor
		E.global.nameplates.filters.Luckyone_ML.triggers.names['133430'] = true -- Venture Co. Mastermind
		E.global.nameplates.filters.Luckyone_ML.triggers.names['134012'] = true -- Taskmaster Askari
		E.global.nameplates.filters.Luckyone_ML.triggers.priority = 2

		-- Theater of Pain [TOP]
		E.global.nameplates.filters.Luckyone_TOP.actions.color.health = true
		E.global.nameplates.filters.Luckyone_TOP.actions.color.healthColor.g = 0.75
		E.global.nameplates.filters.Luckyone_TOP.actions.color.healthColor.r = 0
		E.global.nameplates.filters.Luckyone_TOP.triggers.instanceDifficulty.dungeon['mythic'] = true
		E.global.nameplates.filters.Luckyone_TOP.triggers.instanceDifficulty.dungeon['mythic+'] = true
		E.global.nameplates.filters.Luckyone_TOP.triggers.instanceType['party'] = true
		E.global.nameplates.filters.Luckyone_TOP.triggers.names['164451'] = true -- Dessia the Decapitator
		E.global.nameplates.filters.Luckyone_TOP.triggers.names['160495'] = true -- Maniacal Soulbinder
		E.global.nameplates.filters.Luckyone_TOP.triggers.names['164506'] = true -- Ancient Captain
		E.global.nameplates.filters.Luckyone_TOP.triggers.names['170850'] = true -- Raging Bloodhorn
		E.global.nameplates.filters.Luckyone_TOP.triggers.names['174210'] = true -- Blighted Sludge-Spewer
		E.global.nameplates.filters.Luckyone_TOP.triggers.priority = 2

		-- Mechagon Workshop [WORK]
		E.global.nameplates.filters.Luckyone_WORK.actions.color.health = true
		E.global.nameplates.filters.Luckyone_WORK.actions.color.healthColor.g = 0.75
		E.global.nameplates.filters.Luckyone_WORK.actions.color.healthColor.r = 0
		E.global.nameplates.filters.Luckyone_WORK.triggers.instanceDifficulty.dungeon['mythic'] = true
		E.global.nameplates.filters.Luckyone_WORK.triggers.instanceDifficulty.dungeon['mythic+'] = true
		E.global.nameplates.filters.Luckyone_WORK.triggers.instanceType['party'] = true
		E.global.nameplates.filters.Luckyone_WORK.triggers.names['144293'] = true -- Waste Processing Unit
		E.global.nameplates.filters.Luckyone_WORK.triggers.names['144294'] = true -- Mechagon Tinkerer
		E.global.nameplates.filters.Luckyone_WORK.triggers.names['151325'] = true -- Alarm o Bot
		E.global.nameplates.filters.Luckyone_WORK.triggers.names['151657'] = true -- Bomb Tonk
		E.global.nameplates.filters.Luckyone_WORK.triggers.priority = 2
	end

	-- Disable alpha fading and scaling for ElvUI_Target and ElvUI_NonTarget
	E.global.nameplates.filters.ElvUI_NonTarget.actions.alpha = -1
	E.global.nameplates.filters.ElvUI_Target.actions.scale = 1

	-- Turn off both default filters
	E.db.nameplates.filters.ElvUI_NonTarget.triggers.enable = false
	E.db.nameplates.filters.ElvUI_Target.triggers.enable = false

	-- Set NamePlate CVars
	if not skipVars then
		Private:NameplateCVars(true)
	end

	Private:Print(L["NamePlate StyleFilters and CVars have been set."])
end
