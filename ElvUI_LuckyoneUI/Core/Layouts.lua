-- Lua functions
local unpack = unpack

-- AddOn namespace
local _, Private = ...

-- ElvUI modules
local E = unpack(ElvUI)

-- The War Within layout db
function Private:Layout_TheWarWithin(layout)
	-- 1080p
	local scaled = E.global.L1UI.scaled
	-- AB conversion
	E.db.convertPages = true
	-- Protect movers error
	E.db.movers = E.db.movers or {}

	-- General
	E.db.general.addonCompartment.fontOutline = Private.Outline
	E.db.general.addonCompartment.hide = true
	E.db.general.addonCompartment.size = 20
	E.db.general.afkChat = false
	E.db.general.altPowerBar.font = Private.Font
	E.db.general.altPowerBar.statusBar = Private.Texture
	E.db.general.altPowerBar.statusBarColorGradient = true
	E.db.general.autoAcceptInvite = true
	E.db.general.autoRepair = (E.Retail and 'GUILD') or 'PLAYER'
	E.db.general.backdropcolor.b = 0.12
	E.db.general.backdropcolor.g = 0.12
	E.db.general.backdropcolor.r = 0.12
	E.db.general.backdropfadecolor.a = 0.9
	E.db.general.backdropfadecolor.b = 0.05
	E.db.general.backdropfadecolor.g = 0.05
	E.db.general.backdropfadecolor.r = 0.05
	E.db.general.bonusObjectivePosition = 'AUTO'
	E.db.general.bottomPanel = false
	E.db.general.customGlow.color.a = 1
	E.db.general.customGlow.color.b = 1
	E.db.general.customGlow.color.g = 1
	E.db.general.customGlow.color.r = 1
	E.db.general.customGlow.useColor = true
	E.db.general.durabilityScale = 0.5
	E.db.general.enhancedPvpMessages = false
	E.db.general.gameMenuScale = 0.8
	E.db.general.guildBank.countFont = Private.Font
	E.db.general.guildBank.countFontOutline = Private.Outline
	E.db.general.guildBank.itemLevelFont = Private.Font
	E.db.general.guildBank.itemLevelFontOutline = Private.Outline
	E.db.general.itemLevel.enchantAbbrev = false
	E.db.general.itemLevel.itemLevelFont = Private.Font
	E.db.general.itemLevel.itemLevelFontSize = 10
	E.db.general.itemLevel.totalLevelFont = Private.Font
	E.db.general.itemLevel.totalLevelFontSize = 22
	E.db.general.loginmessage = false
	E.db.general.lootRoll.buttonSize = 22
	E.db.general.lootRoll.spacing = 3
	E.db.general.lootRoll.statusBarTexture = Private.Texture
	E.db.general.lootRoll.style = 'fullbar'
	E.db.general.lootRoll.width = 340
	E.db.general.minimap.icons.classHall.scale = 0.7
	E.db.general.minimap.icons.classHall.xOffset = -2
	E.db.general.minimap.icons.classHall.yOffset = -2
	E.db.general.minimap.icons.crafting.scale = 0.8
	E.db.general.minimap.icons.crafting.xOffset = -2
	E.db.general.minimap.icons.crafting.yOffset = 2
	E.db.general.minimap.icons.difficulty.position = 'RIGHT'
	E.db.general.minimap.icons.difficulty.scale = 0.6
	E.db.general.minimap.icons.difficulty.xOffset = 0
	E.db.general.minimap.icons.difficulty.yOffset = 0
	E.db.general.minimap.icons.mail.position = 'RIGHT'
	E.db.general.minimap.icons.mail.scale = 0.9
	E.db.general.minimap.icons.mail.texture = 'Mail1'
	E.db.general.minimap.icons.mail.xOffset = -2
	E.db.general.minimap.icons.mail.yOffset = 24
	E.db.general.minimap.locationFontSize = 12
	E.db.general.minimap.locationText = 'SHOW'
	E.db.general.minimap.size = 172
	E.db.general.objectiveFrameAutoHide = false
	E.db.general.objectiveFrameHeight = 600
	E.db.general.privateAuras.icon.size = 64
	E.db.general.privateRaidWarning.scale = 2
	E.db.general.queueStatus.scale = 0.3
	E.db.general.tagUpdateRate = 0.33
	E.db.general.talkingHeadFrameBackdrop = true
	E.db.general.talkingHeadFrameScale = 1
	E.db.general.vehicleSeatIndicatorSize = 64

	-- ActionBars
	E.db.actionbar.bar1.buttonSize = (scaled and 24) or 28
	E.db.actionbar.bar1.buttonSpacing = 1
	E.db.actionbar.bar1.countFont = Private.Font
	E.db.actionbar.bar1.countFontOutline = Private.Outline
	E.db.actionbar.bar1.countFontSize = 9
	E.db.actionbar.bar1.countTextPosition = 'BOTTOM'
	E.db.actionbar.bar1.hotkeyFont = Private.Font
	E.db.actionbar.bar1.hotkeyFontOutline = Private.Outline
	E.db.actionbar.bar1.hotkeyFontSize = 9
	E.db.actionbar.bar1.hotkeyTextPosition = 'TOP'
	E.db.actionbar.bar1.hotkeyTextYOffset = -1
	E.db.actionbar.bar1.macroFont = Private.Font
	E.db.actionbar.bar1.macroFontOutline = Private.Outline
	E.db.actionbar.bar1.macroFontSize = 9
	E.db.actionbar.bar1.macrotext = true
	E.db.actionbar.bar1.macroTextPosition = 'BOTTOM'
	E.db.actionbar.bar1.macroTextYOffset = 1
	E.db.actionbar.bar1.professionQuality.enable = false
	E.db.actionbar.bar1.targetReticle = false
	E.db.actionbar.bar2.buttonSize = (scaled and 24) or 28
	E.db.actionbar.bar2.buttonSpacing = 1
	E.db.actionbar.bar2.countFont = Private.Font
	E.db.actionbar.bar2.countFontOutline = Private.Outline
	E.db.actionbar.bar2.countFontSize = 9
	E.db.actionbar.bar2.countTextPosition = 'BOTTOM'
	E.db.actionbar.bar2.enabled = true
	E.db.actionbar.bar2.hotkeyFont = Private.Font
	E.db.actionbar.bar2.hotkeyFontOutline = Private.Outline
	E.db.actionbar.bar2.hotkeyFontSize = 9
	E.db.actionbar.bar2.hotkeyTextPosition = 'TOP'
	E.db.actionbar.bar2.hotkeyTextYOffset = -1
	E.db.actionbar.bar2.macroFont = Private.Font
	E.db.actionbar.bar2.macroFontOutline = Private.Outline
	E.db.actionbar.bar2.macroFontSize = 9
	E.db.actionbar.bar2.macrotext = true
	E.db.actionbar.bar2.macroTextPosition = 'BOTTOM'
	E.db.actionbar.bar2.macroTextYOffset = 1
	E.db.actionbar.bar2.professionQuality.enable = false
	E.db.actionbar.bar2.targetReticle = false
	E.db.actionbar.bar3.buttons = 12
	E.db.actionbar.bar3.buttonSize = (scaled and 24) or 28
	E.db.actionbar.bar3.buttonSpacing = 1
	E.db.actionbar.bar3.buttonsPerRow = 12
	E.db.actionbar.bar3.countFont = Private.Font
	E.db.actionbar.bar3.countFontOutline = Private.Outline
	E.db.actionbar.bar3.countFontSize = 9
	E.db.actionbar.bar3.countTextPosition = 'BOTTOM'
	E.db.actionbar.bar3.hotkeyFont = Private.Font
	E.db.actionbar.bar3.hotkeyFontOutline = Private.Outline
	E.db.actionbar.bar3.hotkeyFontSize = 9
	E.db.actionbar.bar3.hotkeyTextPosition = 'TOP'
	E.db.actionbar.bar3.hotkeyTextYOffset = -1
	E.db.actionbar.bar3.macroFont = Private.Font
	E.db.actionbar.bar3.macroFontOutline = Private.Outline
	E.db.actionbar.bar3.macroFontSize = 9
	E.db.actionbar.bar3.macrotext = true
	E.db.actionbar.bar3.macroTextPosition = 'BOTTOM'
	E.db.actionbar.bar3.macroTextYOffset = 1
	E.db.actionbar.bar3.professionQuality.enable = false
	E.db.actionbar.bar3.targetReticle = false
	E.db.actionbar.bar4.backdrop = false
	E.db.actionbar.bar4.buttons = 7
	E.db.actionbar.bar4.buttonSize = (scaled and 21) or 26
	E.db.actionbar.bar4.buttonSpacing = 1
	E.db.actionbar.bar4.countFont = Private.Font
	E.db.actionbar.bar4.countFontOutline = Private.Outline
	E.db.actionbar.bar4.countFontSize = 9
	E.db.actionbar.bar4.countTextPosition = 'BOTTOM'
	E.db.actionbar.bar4.enabled = not E.Retail
	E.db.actionbar.bar4.hotkeyFont = Private.Font
	E.db.actionbar.bar4.hotkeyFontOutline = Private.Outline
	E.db.actionbar.bar4.hotkeyFontSize = 9
	E.db.actionbar.bar4.hotkeyTextPosition = 'TOP'
	E.db.actionbar.bar4.hotkeyTextYOffset = -1
	E.db.actionbar.bar4.macroFont = Private.Font
	E.db.actionbar.bar4.macroFontOutline = Private.Outline
	E.db.actionbar.bar4.macroFontSize = 9
	E.db.actionbar.bar4.macrotext = true
	E.db.actionbar.bar4.macroTextPosition = 'BOTTOM'
	E.db.actionbar.bar4.macroTextYOffset = 1
	E.db.actionbar.bar4.point = 'BOTTOMLEFT'
	E.db.actionbar.bar4.professionQuality.enable = false
	E.db.actionbar.bar4.targetReticle = false
	E.db.actionbar.bar5.buttons = 12
	E.db.actionbar.bar5.buttonSize = (scaled and 24) or 28
	E.db.actionbar.bar5.buttonSpacing = 1
	E.db.actionbar.bar5.buttonsPerRow = 1
	E.db.actionbar.bar5.countFont = Private.Font
	E.db.actionbar.bar5.countFontOutline = Private.Outline
	E.db.actionbar.bar5.countFontSize = 9
	E.db.actionbar.bar5.countTextPosition = 'BOTTOM'
	E.db.actionbar.bar5.enabled = true
	E.db.actionbar.bar5.hotkeyFont = Private.Font
	E.db.actionbar.bar5.hotkeyFontOutline = Private.Outline
	E.db.actionbar.bar5.hotkeyFontSize = 9
	E.db.actionbar.bar5.hotkeyTextPosition = 'TOP'
	E.db.actionbar.bar5.hotkeyTextYOffset = -1
	E.db.actionbar.bar5.macroFont = Private.Font
	E.db.actionbar.bar5.macroFontOutline = Private.Outline
	E.db.actionbar.bar5.macroFontSize = 9
	E.db.actionbar.bar5.macrotext = true
	E.db.actionbar.bar5.macroTextPosition = 'BOTTOM'
	E.db.actionbar.bar5.macroTextYOffset = 1
	E.db.actionbar.bar5.mouseover = true
	E.db.actionbar.bar5.professionQuality.enable = false
	E.db.actionbar.bar5.targetReticle = false
	E.db.actionbar.bar6.buttonSize = (scaled and 24) or 28
	E.db.actionbar.bar6.buttonSpacing = 1
	E.db.actionbar.bar6.countFont = Private.Font
	E.db.actionbar.bar6.countFontOutline = Private.Outline
	E.db.actionbar.bar6.countFontSize = 9
	E.db.actionbar.bar6.countTextPosition = 'BOTTOM'
	E.db.actionbar.bar6.enabled = false
	E.db.actionbar.bar6.hotkeyFont = Private.Font
	E.db.actionbar.bar6.hotkeyFontOutline = Private.Outline
	E.db.actionbar.bar6.hotkeyFontSize = 9
	E.db.actionbar.bar6.hotkeyTextPosition = 'TOP'
	E.db.actionbar.bar6.hotkeyTextYOffset = -1
	E.db.actionbar.bar6.macroFont = Private.Font
	E.db.actionbar.bar6.macroFontOutline = Private.Outline
	E.db.actionbar.bar6.macroFontSize = 9
	E.db.actionbar.bar6.macrotext = true
	E.db.actionbar.bar6.macroTextPosition = 'BOTTOM'
	E.db.actionbar.bar6.macroTextYOffset = 1
	E.db.actionbar.bar6.professionQuality.enable = false
	E.db.actionbar.bar6.targetReticle = false
	E.db.actionbar.bar7.buttonSize = (scaled and 24) or 28
	E.db.actionbar.bar7.buttonSpacing = 1
	E.db.actionbar.bar7.countFont = Private.Font
	E.db.actionbar.bar7.countFontOutline = Private.Outline
	E.db.actionbar.bar7.countFontSize = 9
	E.db.actionbar.bar7.countTextPosition = 'BOTTOM'
	E.db.actionbar.bar7.hotkeyFont = Private.Font
	E.db.actionbar.bar7.hotkeyFontOutline = Private.Outline
	E.db.actionbar.bar7.hotkeyFontSize = 9
	E.db.actionbar.bar7.hotkeyTextPosition = 'TOP'
	E.db.actionbar.bar7.hotkeyTextYOffset = -1
	E.db.actionbar.bar7.macroFont = Private.Font
	E.db.actionbar.bar7.macroFontOutline = Private.Outline
	E.db.actionbar.bar7.macroFontSize = 9
	E.db.actionbar.bar7.macrotext = true
	E.db.actionbar.bar7.macroTextPosition = 'BOTTOM'
	E.db.actionbar.bar7.macroTextYOffset = 1
	E.db.actionbar.bar7.professionQuality.enable = false
	E.db.actionbar.bar7.targetReticle = false
	E.db.actionbar.bar8.buttonSize = (scaled and 24) or 28
	E.db.actionbar.bar8.buttonSpacing = 1
	E.db.actionbar.bar8.countFont = Private.Font
	E.db.actionbar.bar8.countFontOutline = Private.Outline
	E.db.actionbar.bar8.countFontSize = 9
	E.db.actionbar.bar8.countTextPosition = 'BOTTOM'
	E.db.actionbar.bar8.hotkeyFont = Private.Font
	E.db.actionbar.bar8.hotkeyFontOutline = Private.Outline
	E.db.actionbar.bar8.hotkeyFontSize = 9
	E.db.actionbar.bar8.hotkeyTextPosition = 'TOP'
	E.db.actionbar.bar8.hotkeyTextYOffset = -1
	E.db.actionbar.bar8.macroFont = Private.Font
	E.db.actionbar.bar8.macroFontOutline = Private.Outline
	E.db.actionbar.bar8.macroFontSize = 9
	E.db.actionbar.bar8.macrotext = true
	E.db.actionbar.bar8.macroTextPosition = 'BOTTOM'
	E.db.actionbar.bar8.macroTextYOffset = 1
	E.db.actionbar.bar8.professionQuality.enable = false
	E.db.actionbar.bar8.targetReticle = false
	E.db.actionbar.bar9.buttonSize = (scaled and 24) or 28
	E.db.actionbar.bar9.buttonSpacing = 1
	E.db.actionbar.bar9.countFont = Private.Font
	E.db.actionbar.bar9.countFontOutline = Private.Outline
	E.db.actionbar.bar9.countFontSize = 9
	E.db.actionbar.bar9.countTextPosition = 'BOTTOM'
	E.db.actionbar.bar9.hotkeyFont = Private.Font
	E.db.actionbar.bar9.hotkeyFontOutline = Private.Outline
	E.db.actionbar.bar9.hotkeyFontSize = 9
	E.db.actionbar.bar9.hotkeyTextPosition = 'TOP'
	E.db.actionbar.bar9.hotkeyTextYOffset = -1
	E.db.actionbar.bar9.macroFont = Private.Font
	E.db.actionbar.bar9.macroFontOutline = Private.Outline
	E.db.actionbar.bar9.macroFontSize = 9
	E.db.actionbar.bar9.macrotext = true
	E.db.actionbar.bar9.macroTextPosition = 'BOTTOM'
	E.db.actionbar.bar9.macroTextYOffset = 1
	E.db.actionbar.bar9.professionQuality.enable = false
	E.db.actionbar.bar9.targetReticle = false
	E.db.actionbar.bar10.buttonSize = (scaled and 24) or 28
	E.db.actionbar.bar10.buttonSpacing = 1
	E.db.actionbar.bar10.countFont = Private.Font
	E.db.actionbar.bar10.countFontOutline = Private.Outline
	E.db.actionbar.bar10.countFontSize = 9
	E.db.actionbar.bar10.countTextPosition = 'BOTTOM'
	E.db.actionbar.bar10.hotkeyFont = Private.Font
	E.db.actionbar.bar10.hotkeyFontOutline = Private.Outline
	E.db.actionbar.bar10.hotkeyFontSize = 9
	E.db.actionbar.bar10.hotkeyTextPosition = 'TOP'
	E.db.actionbar.bar10.hotkeyTextYOffset = -1
	E.db.actionbar.bar10.macroFont = Private.Font
	E.db.actionbar.bar10.macroFontOutline = Private.Outline
	E.db.actionbar.bar10.macroFontSize = 9
	E.db.actionbar.bar10.macrotext = true
	E.db.actionbar.bar10.macroTextPosition = 'BOTTOM'
	E.db.actionbar.bar10.macroTextYOffset = 1
	E.db.actionbar.bar10.professionQuality.enable = false
	E.db.actionbar.bar10.targetReticle = false
	E.db.actionbar.bar13.buttonSize = (scaled and 24) or 28
	E.db.actionbar.bar13.buttonSpacing = 1
	E.db.actionbar.bar13.countFont = Private.Font
	E.db.actionbar.bar13.countFontOutline = Private.Outline
	E.db.actionbar.bar13.countFontSize = 9
	E.db.actionbar.bar13.countTextPosition = 'BOTTOM'
	E.db.actionbar.bar13.hotkeyFont = Private.Font
	E.db.actionbar.bar13.hotkeyFontOutline = Private.Outline
	E.db.actionbar.bar13.hotkeyFontSize = 9
	E.db.actionbar.bar13.hotkeyTextPosition = 'TOP'
	E.db.actionbar.bar13.hotkeyTextYOffset = -1
	E.db.actionbar.bar13.macroFont = Private.Font
	E.db.actionbar.bar13.macroFontOutline = Private.Outline
	E.db.actionbar.bar13.macroFontSize = 9
	E.db.actionbar.bar13.macrotext = true
	E.db.actionbar.bar13.macroTextPosition = 'BOTTOM'
	E.db.actionbar.bar13.macroTextYOffset = 1
	E.db.actionbar.bar13.professionQuality.enable = false
	E.db.actionbar.bar13.targetReticle = false
	E.db.actionbar.bar14.buttonSize = (scaled and 24) or 28
	E.db.actionbar.bar14.buttonSpacing = 1
	E.db.actionbar.bar14.countFont = Private.Font
	E.db.actionbar.bar14.countFontOutline = Private.Outline
	E.db.actionbar.bar14.countFontSize = 9
	E.db.actionbar.bar14.countTextPosition = 'BOTTOM'
	E.db.actionbar.bar14.hotkeyFont = Private.Font
	E.db.actionbar.bar14.hotkeyFontOutline = Private.Outline
	E.db.actionbar.bar14.hotkeyFontSize = 9
	E.db.actionbar.bar14.hotkeyTextPosition = 'TOP'
	E.db.actionbar.bar14.hotkeyTextYOffset = -1
	E.db.actionbar.bar14.macroFont = Private.Font
	E.db.actionbar.bar14.macroFontOutline = Private.Outline
	E.db.actionbar.bar14.macroFontSize = 9
	E.db.actionbar.bar14.macrotext = true
	E.db.actionbar.bar14.macroTextPosition = 'BOTTOM'
	E.db.actionbar.bar14.macroTextYOffset = 1
	E.db.actionbar.bar14.professionQuality.enable = false
	E.db.actionbar.bar14.targetReticle = false
	E.db.actionbar.bar15.buttonSize = (scaled and 24) or 28
	E.db.actionbar.bar15.buttonSpacing = 1
	E.db.actionbar.bar15.countFont = Private.Font
	E.db.actionbar.bar15.countFontOutline = Private.Outline
	E.db.actionbar.bar15.countFontSize = 9
	E.db.actionbar.bar15.countTextPosition = 'BOTTOM'
	E.db.actionbar.bar15.hotkeyFont = Private.Font
	E.db.actionbar.bar15.hotkeyFontOutline = Private.Outline
	E.db.actionbar.bar15.hotkeyFontSize = 9
	E.db.actionbar.bar15.hotkeyTextPosition = 'TOP'
	E.db.actionbar.bar15.hotkeyTextYOffset = -1
	E.db.actionbar.bar15.macroFont = Private.Font
	E.db.actionbar.bar15.macroFontOutline = Private.Outline
	E.db.actionbar.bar15.macroFontSize = 9
	E.db.actionbar.bar15.macrotext = true
	E.db.actionbar.bar15.macroTextPosition = 'BOTTOM'
	E.db.actionbar.bar15.macroTextYOffset = 1
	E.db.actionbar.bar15.professionQuality.enable = false
	E.db.actionbar.bar15.targetReticle = false
	E.db.actionbar.barPet.backdrop = false
	E.db.actionbar.barPet.buttonSize = (scaled and 24) or 28
	E.db.actionbar.barPet.buttonSpacing = 1
	E.db.actionbar.barPet.buttonsPerRow = 10
	E.db.actionbar.barPet.countFont = Private.Font
	E.db.actionbar.barPet.countFontOutline = Private.Outline
	E.db.actionbar.barPet.countFontSize = 9
	E.db.actionbar.barPet.hotkeyFont = Private.Font
	E.db.actionbar.barPet.hotkeyFontOutline = Private.Outline
	E.db.actionbar.barPet.hotkeyFontSize = 9
	E.db.actionbar.barPet.hotkeyTextPosition = 'TOP'
	E.db.actionbar.barPet.hotkeyTextYOffset = -1
	E.db.actionbar.barPet.point = 'TOPLEFT'
	E.db.actionbar.cooldown.override = false
	E.db.actionbar.countTextPosition = 'BOTTOM'
	E.db.actionbar.countTextYOffset = 1
	E.db.actionbar.extraActionButton.clean = true
	E.db.actionbar.extraActionButton.hotkeyFont = Private.Font
	E.db.actionbar.extraActionButton.hotkeyFontOutline = Private.Outline
	E.db.actionbar.extraActionButton.hotkeyFontSize = 9
	E.db.actionbar.extraActionButton.hotkeyTextPosition = 'TOP'
	E.db.actionbar.extraActionButton.hotkeyTextYOffset = -1
	E.db.actionbar.flyoutSize = (scaled and 24) or 28
	E.db.actionbar.font = Private.Font
	E.db.actionbar.fontOutline = Private.Outline
	E.db.actionbar.fontSize = 9
	E.db.actionbar.hotkeyTextPosition = 'TOP'
	E.db.actionbar.macroTextPosition = 'BOTTOM'
	E.db.actionbar.microbar.buttonSpacing = 1
	E.db.actionbar.microbar.enabled = true
	E.db.actionbar.microbar.mouseover = true
	E.db.actionbar.microbar.useIcons = false
	E.db.actionbar.stanceBar.buttonHeight = 24
	E.db.actionbar.stanceBar.buttonSize = 28
	E.db.actionbar.stanceBar.buttonSpacing = 1
	E.db.actionbar.stanceBar.hotkeyFont = Private.Font
	E.db.actionbar.stanceBar.hotkeyFontOutline = Private.Outline
	E.db.actionbar.stanceBar.hotkeyFontSize = 9
	E.db.actionbar.stanceBar.hotkeyTextPosition = 'TOP'
	E.db.actionbar.stanceBar.hotkeyTextYOffset = -1
	E.db.actionbar.stanceBar.mouseover = true
	E.db.actionbar.stanceBar.style = 'classic'
	E.db.actionbar.transparent = true
	E.db.actionbar.vehicleExitButton.hotkeyFont = Private.Font
	E.db.actionbar.vehicleExitButton.hotkeyFontOutline = Private.Outline
	E.db.actionbar.vehicleExitButton.hotkeyFontSize = 9
	E.db.actionbar.vehicleExitButton.hotkeyTextPosition = 'TOP'
	E.db.actionbar.vehicleExitButton.hotkeyTextYOffset = -1
	E.db.actionbar.zoneActionButton.clean = true

	-- Bags
	E.db.bags.autoToggle.guildBank = true
	E.db.bags.autoToggle.soulBind = false
	E.db.bags.bagBar.backdropSpacing = 1
	E.db.bags.bagBar.font = Private.Font
	E.db.bags.bagBar.size = 23
	E.db.bags.bagBar.spacing = 0
	E.db.bags.bagSize = (scaled and 28) or 30
	E.db.bags.bagWidth = (scaled and 400) or 464
	E.db.bags.bankSize = (scaled and 28) or 30
	E.db.bags.bankWidth = (scaled and 404) or 464
	E.db.bags.clearSearchOnClose = true
	E.db.bags.countFont = Private.Font
	E.db.bags.countFontOutline = Private.Outline
	E.db.bags.countFontSize = 11
	E.db.bags.itemInfoFont = Private.Font
	E.db.bags.itemInfoFontOutline = Private.Outline
	E.db.bags.itemInfoFontSize = 11
	E.db.bags.itemLevelFont = Private.Font
	E.db.bags.itemLevelFontOutline = Private.Outline
	E.db.bags.itemLevelFontSize = 11
	E.db.bags.moneyFormat = 'FULL'
	E.db.bags.specialtyColors = false
	E.db.bags.spinner.size = 60
	E.db.bags.split.bag5 = true
	E.db.bags.split.bagSpacing = 1
	E.db.bags.split.player = true
	E.db.bags.upgradeIcon = false
	E.db.bags.vendorGrays.enable = true
	E.db.bags.vendorGrays.interval = 0.1

	-- Auras
	E.db.auras.buffs.countFont = Private.Font
	E.db.auras.buffs.countFontOutline = Private.Outline
	E.db.auras.buffs.countFontSize = 12
	E.db.auras.buffs.countXOffset = 1
	E.db.auras.buffs.countYOffset = 2
	E.db.auras.buffs.fadeThreshold = -1
	E.db.auras.buffs.horizontalSpacing = 1
	E.db.auras.buffs.seperateOwn = 0
	E.db.auras.buffs.size = 22
	E.db.auras.buffs.timeFont = Private.Font
	E.db.auras.buffs.timeFontOutline = Private.Outline
	E.db.auras.buffs.timeXOffset = 1
	E.db.auras.buffs.timeYOffset = -1
	E.db.auras.buffs.verticalSpacing = 12
	E.db.auras.debuffs.countFont = Private.Font
	E.db.auras.debuffs.countFontOutline = Private.Outline
	E.db.auras.debuffs.countFontSize = 12
	E.db.auras.debuffs.countXOffset = 1
	E.db.auras.debuffs.countYOffset = 2
	E.db.auras.debuffs.fadeThreshold = -1
	E.db.auras.debuffs.horizontalSpacing = 1
	E.db.auras.debuffs.maxWraps = 2
	E.db.auras.debuffs.seperateOwn = 0
	E.db.auras.debuffs.size = 22
	E.db.auras.debuffs.timeFont = Private.Font
	E.db.auras.debuffs.timeFontOutline = Private.Outline
	E.db.auras.debuffs.timeXOffset = 1
	E.db.auras.debuffs.timeYOffset = -1
	E.db.auras.debuffs.verticalSpacing = 12

	-- Chat
	E.db.chat.customTimeColor.b = 1
	E.db.chat.customTimeColor.g = 1
	E.db.chat.customTimeColor.r = 1
	E.db.chat.desaturateVoiceIcons = false
	E.db.chat.editboxHistorySize = 5
	E.db.chat.editBoxPosition = 'ABOVE_CHAT_INSIDE'
	E.db.chat.enableCombatRepeat = false
	E.db.chat.fade = false
	E.db.chat.fadeTabsNoBackdrop = false
	E.db.chat.font = Private.Font
	E.db.chat.fontOutline = Private.Outline
	E.db.chat.hideChatToggles = true
	E.db.chat.historySize = 200
	E.db.chat.lfgIcons = false
	E.db.chat.maxLines = 500
	E.db.chat.numScrollMessages = 2
	E.db.chat.panelColor.a = 0.9
	E.db.chat.panelColor.b = 0.05
	E.db.chat.panelColor.g = 0.05
	E.db.chat.panelColor.r = 0.05
	E.db.chat.panelHeight = (scaled and 154) or 188
	E.db.chat.panelHeightRight = (scaled and 154) or 190
	E.db.chat.panelWidth = (scaled and 404) or 464
	E.db.chat.panelWidthRight = (scaled and 400) or 464
	E.db.chat.separateSizes = true
	E.db.chat.showHistory.CHANNEL = false
	E.db.chat.showHistory.EMOTE = false
	E.db.chat.showHistory.GUILD = false
	E.db.chat.showHistory.INSTANCE = false
	E.db.chat.showHistory.PARTY = false
	E.db.chat.showHistory.RAID = false
	E.db.chat.showHistory.SAY = false
	E.db.chat.showHistory.YELL = false
	E.db.chat.tabFont = Private.Font
	E.db.chat.tabFontOutline = Private.Outline
	E.db.chat.tabFontSize = 11
	E.db.chat.tabSelector = 'NONE'
	E.db.chat.throttleInterval = 0
	E.db.chat.timeStampFormat = '%H:%M '
	E.db.chat.timeStampLocalTime = true
	E.db.chat.useBTagName = true

	-- Cooldown Text
	E.db.cooldown.checkSeconds = true
	E.db.cooldown.fonts.font = Private.Font
	E.db.cooldown.fonts.fontSize = 16
	E.db.cooldown.hhmmColor.b = 1
	E.db.cooldown.hhmmColor.g = 1
	E.db.cooldown.hhmmColor.r = 0.4
	E.db.cooldown.mmssColor.b = 1
	E.db.cooldown.mmssColor.g = 1
	E.db.cooldown.mmssColor.r = 1
	E.db.cooldown.mmssThreshold = 120
	E.db.cooldown.secondsColor.b = 1
	E.db.cooldown.showModRate = true
	E.db.cooldown.targetAura = false
	E.db.cooldown.threshold = 4

	-- DataBars
	E.db.databars.azerite.enable = false
	E.db.databars.experience.font = Private.Font
	E.db.databars.experience.fontOutline = Private.Outline
	E.db.databars.experience.height = 20
	E.db.databars.experience.orientation = 'HORIZONTAL'
	E.db.databars.experience.questCompletedOnly = true
	E.db.databars.experience.showLevel = true
	E.db.databars.experience.textFormat = 'PERCENT'
	E.db.databars.experience.width = 420
	E.db.databars.honor.enable = false
	E.db.databars.petExperience.enable = false
	E.db.databars.reputation.enable = true
	E.db.databars.reputation.font = Private.Font
	E.db.databars.reputation.height = (scaled and 154) or 190
	E.db.databars.reputation.orientation = 'VERTICAL'
	E.db.databars.reputation.width = 12
	E.db.databars.threat.enable = false

	-- DataTexts custom
	E.db.datatexts.panels.Luckyone_ActionBars_DT.battleground = false
	E.db.datatexts.panels.Luckyone_ActionBars_DT.enable = true
	E.db.datatexts.panels.Luckyone_ActionBars_DT[1] = 'System'
	E.db.datatexts.panels.Luckyone_ActionBars_DT[2] = 'Combat'
	E.db.datatexts.panels.Luckyone_ActionBars_DT[3] = 'Durability'
	E.db.datatexts.panels.Luckyone_ActionBars_DT[4] = ''
	E.db.datatexts.panels.Luckyone_ActionBars_DT[5] = ''
	E.db.datatexts.panels.Luckyone_MiniMap_DT.battleground = false
	E.db.datatexts.panels.Luckyone_MiniMap_DT.enable = true
	E.db.datatexts.panels.Luckyone_MiniMap_DT[1] = 'Time'

	-- DataTexts default
	E.db.datatexts.battlePanel.LeftChatDataPanel[1] = ''
	E.db.datatexts.battlePanel.LeftChatDataPanel[2] = ''
	E.db.datatexts.battlePanel.LeftChatDataPanel[3] = ''
	E.db.datatexts.battlePanel.RightChatDataPanel[1] = ''
	E.db.datatexts.battlePanel.RightChatDataPanel[2] = ''
	E.db.datatexts.battlePanel.RightChatDataPanel[3] = ''
	E.db.datatexts.font = Private.Font
	E.db.datatexts.fontOutline = Private.Outline
	E.db.datatexts.fontSize = 11
	E.db.datatexts.noCombatClick = true
	E.db.datatexts.noCombatHover = true
	E.db.datatexts.panels.LeftChatDataPanel.battleground = false
	E.db.datatexts.panels.LeftChatDataPanel.enable = false
	E.db.datatexts.panels.LeftChatDataPanel.panelTransparency = true
	E.db.datatexts.panels.LeftChatDataPanel[1] = ''
	E.db.datatexts.panels.LeftChatDataPanel[2] = ''
	E.db.datatexts.panels.LeftChatDataPanel[3] = ''
	E.db.datatexts.panels.MinimapPanel.enable = false
	E.db.datatexts.panels.MinimapPanel.panelTransparency = true
	E.db.datatexts.panels.MinimapPanel[1] = ''
	E.db.datatexts.panels.MinimapPanel[2] = ''
	E.db.datatexts.panels.RightChatDataPanel.battleground = false
	E.db.datatexts.panels.RightChatDataPanel.enable = false
	E.db.datatexts.panels.RightChatDataPanel.panelTransparency = true
	E.db.datatexts.panels.RightChatDataPanel[1] = ''
	E.db.datatexts.panels.RightChatDataPanel[2] = ''
	E.db.datatexts.panels.RightChatDataPanel[3] = ''

	-- Tooltip
	E.db.tooltip.alwaysShowRealm = true
	E.db.tooltip.colorAlpha = 0.9
	E.db.tooltip.font = Private.Font
	E.db.tooltip.fontOutline = Private.Outline
	E.db.tooltip.headerFont = Private.Font
	E.db.tooltip.headerFontOutline = Private.Outline
	E.db.tooltip.headerFontSize = (scaled and 10) or 11
	E.db.tooltip.healthBar.font = Private.Font
	E.db.tooltip.healthBar.fontOutline = Private.Outline
	E.db.tooltip.healthBar.fontSize = (scaled and 9) or 10
	E.db.tooltip.healthBar.height = 6
	E.db.tooltip.healthBar.statusPosition = 'TOP'
	E.db.tooltip.inspectDataEnable = false
	E.db.tooltip.itemCount = 'NONE'
	E.db.tooltip.itemQuality = true
	E.db.tooltip.mythicDataEnable = false
	E.db.tooltip.role = false
	E.db.tooltip.showElvUIUsers = true
	E.db.tooltip.showMount = false
	E.db.tooltip.smallTextFontSize = (scaled and 9) or 10
	E.db.tooltip.targetInfo = false
	E.db.tooltip.textFontSize = (scaled and 10) or 11

	-- Shared UnitFrames
	E.db.unitframe.colors.castbar_backdrop.b = 0.05
	E.db.unitframe.colors.castbar_backdrop.g = 0.05
	E.db.unitframe.colors.castbar_backdrop.r = 0.05
	E.db.unitframe.colors.castColor.b = 0
	E.db.unitframe.colors.castColor.g = 1
	E.db.unitframe.colors.castColor.r = 0.02
	E.db.unitframe.colors.castNoInterrupt.b = 0
	E.db.unitframe.colors.castNoInterrupt.g = 0
	E.db.unitframe.colors.castNoInterrupt.r = 1
	E.db.unitframe.colors.colorhealthbyvalue = false
	E.db.unitframe.colors.customcastbarbackdrop = true
	E.db.unitframe.colors.customhealthbackdrop = true
	E.db.unitframe.colors.custompowerbackdrop = true
	E.db.unitframe.colors.frameGlow.mouseoverGlow.texture = Private.Texture
	E.db.unitframe.colors.healPrediction.overabsorbs.b = 1
	E.db.unitframe.colors.healPrediction.overabsorbs.r = 0
	E.db.unitframe.colors.health_backdrop_dead.b = 0.14
	E.db.unitframe.colors.health_backdrop_dead.g = 0.2
	E.db.unitframe.colors.health_backdrop_dead.r = 1
	E.db.unitframe.colors.health_backdrop.b = 0.61
	E.db.unitframe.colors.health_backdrop.g = 0.56
	E.db.unitframe.colors.health_backdrop.r = 0.54
	E.db.unitframe.colors.health.b = 0.05
	E.db.unitframe.colors.health.g = 0.05
	E.db.unitframe.colors.health.r = 0.05
	E.db.unitframe.colors.healthMultiplier = 0.75
	E.db.unitframe.colors.power_backdrop.b = 0.05
	E.db.unitframe.colors.power_backdrop.g = 0.05
	E.db.unitframe.colors.power_backdrop.r = 0.05
	E.db.unitframe.colors.power.MANA.b = 0.97
	E.db.unitframe.colors.power.MANA.g = 1
	E.db.unitframe.colors.power.MANA.r = 0
	E.db.unitframe.colors.tapped.g = 0.56
	E.db.unitframe.colors.tapped.r = 0.54
	E.db.unitframe.colors.transparentHealth = true
	E.db.unitframe.colors.transparentPower = true
	E.db.unitframe.colors.useDeadBackdrop = true
	E.db.unitframe.cooldown.fonts.font = Private.Font
	E.db.unitframe.cooldown.override = false
	E.db.unitframe.font = Private.Font
	E.db.unitframe.fontOutline = Private.Outline
	E.db.unitframe.fontSize = 11
	E.db.unitframe.modifiers.ALT = 'Blacklist'
	E.db.unitframe.statusbar = Private.Texture
	E.db.unitframe.targetOnMouseDown = true
	E.db.unitframe.targetSound = true

	-- Shared MA/MT
	E.db.unitframe.units.assist.enable = false
	E.db.unitframe.units.tank.enable = false

	-- Shared Arena
	E.db.unitframe.units.arena.customTexts = {}
	E.db.unitframe.units.arena.customTexts.Luckyone_HP = { attachTextTo = 'Health', enable = true, font = Private.Font, fontOutline = Private.Outline, justifyH = 'LEFT', size = 12, text_format = '[luckyone:health:percent] • [health:current:shortvalue]', xOffset = 3, yOffset = 0 }
	E.db.unitframe.units.arena.customTexts.Luckyone_Name = { attachTextTo = 'Health', enable = true, font = Private.Font, fontOutline = Private.Outline, justifyH = 'RIGHT', size = 12, text_format = '[luckyone:name:last-classcolor]', xOffset = -3, yOffset = 0 }
	E.db.unitframe.units.arena.customTexts.Luckyone_Power = { attachTextTo = 'Power', enable = true, font = Private.Font, fontOutline = Private.Outline, justifyH = 'CENTER', size = 11, text_format = '[luckyone:power:percent-color]', xOffset = 0, yOffset = 0 }

	E.db.unitframe.units.arena.buffs.countFont = Private.Font
	E.db.unitframe.units.arena.buffs.countFontSize = 10
	E.db.unitframe.units.arena.buffs.countPosition = 'TOPRIGHT'
	E.db.unitframe.units.arena.buffs.countXOffset = 2
	E.db.unitframe.units.arena.buffs.countYOffset = 0
	E.db.unitframe.units.arena.buffs.growthY = 'DOWN'
	E.db.unitframe.units.arena.buffs.maxDuration = 0
	E.db.unitframe.units.arena.buffs.perrow = 5
	E.db.unitframe.units.arena.buffs.priority = 'Blacklist,Whitelist,Dispellable,RaidBuffsElvUI'
	E.db.unitframe.units.arena.buffs.sizeOverride = 20
	E.db.unitframe.units.arena.buffs.xOffset = -1
	E.db.unitframe.units.arena.buffs.yOffset = -10
	E.db.unitframe.units.arena.castbar.customTextFont.enable = true
	E.db.unitframe.units.arena.castbar.customTextFont.font = Private.Font
	E.db.unitframe.units.arena.castbar.customTextFont.fontSize = 9
	E.db.unitframe.units.arena.castbar.customTimeFont.enable = true
	E.db.unitframe.units.arena.castbar.customTimeFont.font = Private.Font
	E.db.unitframe.units.arena.castbar.customTimeFont.fontSize = 9
	E.db.unitframe.units.arena.castbar.height = 14
	E.db.unitframe.units.arena.castbar.iconAttachedTo = 'Castbar'
	E.db.unitframe.units.arena.castbar.strataAndLevel.useCustomLevel = true
	E.db.unitframe.units.arena.castbar.strataAndLevel.useCustomStrata = true
	E.db.unitframe.units.arena.castbar.textColor.b = 1
	E.db.unitframe.units.arena.castbar.textColor.g = 1
	E.db.unitframe.units.arena.castbar.textColor.r = 1
	E.db.unitframe.units.arena.castbar.width = 211
	E.db.unitframe.units.arena.castbar.xOffsetText = 2
	E.db.unitframe.units.arena.castbar.xOffsetTime = -2
	E.db.unitframe.units.arena.debuffs.anchorPoint = 'TOPLEFT'
	E.db.unitframe.units.arena.debuffs.countFont = Private.Font
	E.db.unitframe.units.arena.debuffs.countFontSize = 10
	E.db.unitframe.units.arena.debuffs.countPosition = 'TOPRIGHT'
	E.db.unitframe.units.arena.debuffs.countXOffset = 2
	E.db.unitframe.units.arena.debuffs.countYOffset = 0
	E.db.unitframe.units.arena.debuffs.desaturate = true
	E.db.unitframe.units.arena.debuffs.growthX = 'LEFT'
	E.db.unitframe.units.arena.debuffs.growthY = 'DOWN'
	E.db.unitframe.units.arena.debuffs.maxDuration = 0
	E.db.unitframe.units.arena.debuffs.perrow = 5
	E.db.unitframe.units.arena.debuffs.priority = 'Blacklist,Whitelist,Personal,CCDebuffs'
	E.db.unitframe.units.arena.debuffs.sizeOverride = 20
	E.db.unitframe.units.arena.debuffs.xOffset = -1
	E.db.unitframe.units.arena.debuffs.yOffset = 1
	E.db.unitframe.units.arena.disableFocusGlow = true
	E.db.unitframe.units.arena.disableTargetGlow = true
	E.db.unitframe.units.arena.fader.minAlpha = 0.5
	E.db.unitframe.units.arena.fader.smooth = 0
	E.db.unitframe.units.arena.healPrediction.absorbStyle = 'WRAPPED'
	E.db.unitframe.units.arena.health.attachTextTo = 'Frame'
	E.db.unitframe.units.arena.health.text_format = ''
	E.db.unitframe.units.arena.height = 41
	E.db.unitframe.units.arena.infoPanel.height = 16
	E.db.unitframe.units.arena.middleClickFocus = true
	E.db.unitframe.units.arena.name.attachTextTo = 'Frame'
	E.db.unitframe.units.arena.name.text_format = ''
	E.db.unitframe.units.arena.power.autoHide = true
	E.db.unitframe.units.arena.power.height = 4
	E.db.unitframe.units.arena.power.strataAndLevel.frameStrata = 'MEDIUM'
	E.db.unitframe.units.arena.power.strataAndLevel.useCustomStrata = true
	E.db.unitframe.units.arena.power.text_format = ''
	E.db.unitframe.units.arena.pvpclassificationindicator.size = 24
	E.db.unitframe.units.arena.pvpclassificationindicator.xOffset = -40
	E.db.unitframe.units.arena.pvpSpecIcon = false
	E.db.unitframe.units.arena.pvpTrinket.size = 41
	E.db.unitframe.units.arena.raidicon.size = 10
	E.db.unitframe.units.arena.raidicon.yOffset = -1
	E.db.unitframe.units.arena.spacing = 16
	E.db.unitframe.units.arena.width = 210

	-- Shared Boss
	E.db.unitframe.units.boss.customTexts = {}
	E.db.unitframe.units.boss.customTexts.Luckyone_HP = { attachTextTo = 'Health', enable = true, font = Private.Font, fontOutline = Private.Outline, justifyH = 'LEFT', size = 12, text_format = '[luckyone:health:percent] • [health:current:shortvalue]', xOffset = 3, yOffset = 0 }
	E.db.unitframe.units.boss.customTexts.Luckyone_Name = { attachTextTo = 'Health', enable = true, font = Private.Font, fontOutline = Private.Outline, justifyH = 'RIGHT', size = 12, text_format = '[luckyone:name:last-classcolor]', xOffset = -3, yOffset = 0 }
	E.db.unitframe.units.boss.customTexts.Luckyone_Power = { attachTextTo = 'Power', enable = true, font = Private.Font, fontOutline = Private.Outline, justifyH = 'CENTER', size = 11, text_format = '[luckyone:power:percent-color]', xOffset = 0, yOffset = 0 }

	E.db.unitframe.units.boss.buffIndicator.enable = false
	E.db.unitframe.units.boss.buffs.countFont = Private.Font
	E.db.unitframe.units.boss.buffs.countFontSize = 10
	E.db.unitframe.units.boss.buffs.countPosition = 'TOPRIGHT'
	E.db.unitframe.units.boss.buffs.countXOffset = 2
	E.db.unitframe.units.boss.buffs.countYOffset = 0
	E.db.unitframe.units.boss.buffs.growthY = 'DOWN'
	E.db.unitframe.units.boss.buffs.perrow = 5
	E.db.unitframe.units.boss.buffs.priority = 'Blacklist,Whitelist,Dispellable,RaidBuffsElvUI'
	E.db.unitframe.units.boss.buffs.sizeOverride = 20
	E.db.unitframe.units.boss.buffs.xOffset = -1
	E.db.unitframe.units.boss.buffs.yOffset = -10
	E.db.unitframe.units.boss.castbar.customTextFont.enable = true
	E.db.unitframe.units.boss.castbar.customTextFont.font = Private.Font
	E.db.unitframe.units.boss.castbar.customTextFont.fontSize = 9
	E.db.unitframe.units.boss.castbar.customTimeFont.enable = true
	E.db.unitframe.units.boss.castbar.customTimeFont.font = Private.Font
	E.db.unitframe.units.boss.castbar.customTimeFont.fontSize = 9
	E.db.unitframe.units.boss.castbar.height = 14
	E.db.unitframe.units.boss.castbar.iconAttachedTo = 'Castbar'
	E.db.unitframe.units.boss.castbar.strataAndLevel.useCustomLevel = true
	E.db.unitframe.units.boss.castbar.strataAndLevel.useCustomStrata = true
	E.db.unitframe.units.boss.castbar.textColor.b = 1
	E.db.unitframe.units.boss.castbar.textColor.g = 1
	E.db.unitframe.units.boss.castbar.textColor.r = 1
	E.db.unitframe.units.boss.castbar.width = 211
	E.db.unitframe.units.boss.castbar.xOffsetText = 2
	E.db.unitframe.units.boss.castbar.xOffsetTime = -2
	E.db.unitframe.units.boss.debuffs.anchorPoint = 'TOPLEFT'
	E.db.unitframe.units.boss.debuffs.countFont = Private.Font
	E.db.unitframe.units.boss.debuffs.countFontSize = 10
	E.db.unitframe.units.boss.debuffs.countPosition = 'TOPRIGHT'
	E.db.unitframe.units.boss.debuffs.countXOffset = 2
	E.db.unitframe.units.boss.debuffs.countYOffset = 0
	E.db.unitframe.units.boss.debuffs.growthX = 'LEFT'
	E.db.unitframe.units.boss.debuffs.growthY = 'DOWN'
	E.db.unitframe.units.boss.debuffs.perrow = 5
	E.db.unitframe.units.boss.debuffs.priority = 'Blacklist,Whitelist,Personal,CCDebuffs'
	E.db.unitframe.units.boss.debuffs.sizeOverride = 20
	E.db.unitframe.units.boss.debuffs.xOffset = -1
	E.db.unitframe.units.boss.debuffs.yOffset = 1
	E.db.unitframe.units.boss.disableFocusGlow = true
	E.db.unitframe.units.boss.disableTargetGlow = true
	E.db.unitframe.units.boss.fader.minAlpha = 0.5
	E.db.unitframe.units.boss.fader.smooth = 0
	E.db.unitframe.units.boss.healPrediction.absorbStyle = 'WRAPPED'
	E.db.unitframe.units.boss.healPrediction.enable = true
	E.db.unitframe.units.boss.health.attachTextTo = 'Frame'
	E.db.unitframe.units.boss.health.text_format = ''
	E.db.unitframe.units.boss.height = 41
	E.db.unitframe.units.boss.middleClickFocus = true
	E.db.unitframe.units.boss.name.attachTextTo = 'Frame'
	E.db.unitframe.units.boss.name.text_format = ''
	E.db.unitframe.units.boss.power.autoHide = true
	E.db.unitframe.units.boss.power.height = 4
	E.db.unitframe.units.boss.power.strataAndLevel.frameStrata = 'MEDIUM'
	E.db.unitframe.units.boss.power.strataAndLevel.useCustomStrata = true
	E.db.unitframe.units.boss.power.text_format = ''
	E.db.unitframe.units.boss.raidicon.size = 10
	E.db.unitframe.units.boss.raidicon.yOffset = -1
	E.db.unitframe.units.boss.spacing = 16
	E.db.unitframe.units.boss.width = 210

	-- Shared Focus
	E.db.unitframe.units.focus.customTexts = {}
	E.db.unitframe.units.focus.customTexts.Luckyone_Name = { attachTextTo = 'Frame', enable = true, font = Private.Font, fontOutline = Private.Outline, justifyH = 'CENTER', size = 14, text_format = '[luckyone:name:last-classcolor]', xOffset = 0, yOffset = 0 }
	E.db.unitframe.units.focus.customTexts.Luckyone_Power = { attachTextTo = 'Power', enable = true, font = Private.Font, fontOutline = Private.Outline, justifyH = 'CENTER', size = 11, text_format = '[luckyone:power:percent-color]', xOffset = 0, yOffset = 0 }

	E.db.unitframe.units.focus.buffs.anchorPoint = 'TOPRIGHT'
	E.db.unitframe.units.focus.buffs.attachTo = 'DEBUFFS'
	E.db.unitframe.units.focus.buffs.countFont = Private.Font
	E.db.unitframe.units.focus.buffs.countFontSize = 8
	E.db.unitframe.units.focus.buffs.countPosition = 'TOPRIGHT'
	E.db.unitframe.units.focus.buffs.countXOffset = 2
	E.db.unitframe.units.focus.buffs.countYOffset = 0
	E.db.unitframe.units.focus.buffs.enable = true
	E.db.unitframe.units.focus.buffs.growthX = 'LEFT'
	E.db.unitframe.units.focus.buffs.maxDuration = 0
	E.db.unitframe.units.focus.buffs.numrows = 3
	E.db.unitframe.units.focus.buffs.perrow = 12
	E.db.unitframe.units.focus.buffs.priority = 'Blacklist,Whitelist,Dispellable,RaidBuffsElvUI'
	E.db.unitframe.units.focus.buffs.yOffset = 1
	E.db.unitframe.units.focus.castbar.customTextFont.enable = true
	E.db.unitframe.units.focus.castbar.customTextFont.font = Private.Font
	E.db.unitframe.units.focus.castbar.customTimeFont.enable = true
	E.db.unitframe.units.focus.castbar.customTimeFont.font = Private.Font
	E.db.unitframe.units.focus.castbar.iconAttached = false
	E.db.unitframe.units.focus.castbar.iconAttachedTo = 'Castbar'
	E.db.unitframe.units.focus.castbar.iconSize = 40
	E.db.unitframe.units.focus.castbar.iconXOffset = 0
	E.db.unitframe.units.focus.castbar.overlayOnFrame = 'Health'
	E.db.unitframe.units.focus.castbar.textColor.b = 1
	E.db.unitframe.units.focus.castbar.textColor.g = 1
	E.db.unitframe.units.focus.castbar.textColor.r = 1
	E.db.unitframe.units.focus.castbar.timeToHold = 2
	E.db.unitframe.units.focus.castbar.width = 181
	E.db.unitframe.units.focus.castbar.xOffsetText = 2
	E.db.unitframe.units.focus.castbar.xOffsetTime = -2
	E.db.unitframe.units.focus.CombatIcon.enable = false
	E.db.unitframe.units.focus.debuffs.countFont = Private.Font
	E.db.unitframe.units.focus.debuffs.countFontSize = 8
	E.db.unitframe.units.focus.debuffs.countPosition = 'TOPRIGHT'
	E.db.unitframe.units.focus.debuffs.countXOffset = 2
	E.db.unitframe.units.focus.debuffs.countYOffset = 0
	E.db.unitframe.units.focus.debuffs.desaturate = false
	E.db.unitframe.units.focus.debuffs.maxDuration = 0
	E.db.unitframe.units.focus.debuffs.numrows = 2
	E.db.unitframe.units.focus.debuffs.perrow = 12
	E.db.unitframe.units.focus.debuffs.priority = 'Blacklist,Whitelist,Personal,CCDebuffs'
	E.db.unitframe.units.focus.disableMouseoverGlow = true
	E.db.unitframe.units.focus.disableTargetGlow = true
	E.db.unitframe.units.focus.fader.minAlpha = 0.5
	E.db.unitframe.units.focus.fader.smooth = 0
	E.db.unitframe.units.focus.healPrediction.absorbStyle = 'WRAPPED'
	E.db.unitframe.units.focus.height = 40
	E.db.unitframe.units.focus.name.text_format = ''
	E.db.unitframe.units.focus.orientation = 'LEFT'
	E.db.unitframe.units.focus.power.autoHide = true
	E.db.unitframe.units.focus.power.detachedWidth = 200
	E.db.unitframe.units.focus.power.height = 4
	E.db.unitframe.units.focus.raidicon.attachTo = 'RIGHT'
	E.db.unitframe.units.focus.raidicon.size = 40
	E.db.unitframe.units.focus.raidicon.xOffset = 42
	E.db.unitframe.units.focus.raidicon.yOffset = 1
	E.db.unitframe.units.focus.smartAuraPosition = 'FLUID_BUFFS_ON_DEBUFFS'
	E.db.unitframe.units.focus.threatStyle = 'NONE'
	E.db.unitframe.units.focus.width = 200

	-- Shared Pet
	E.db.unitframe.units.pet.customTexts = {}
	E.db.unitframe.units.pet.customTexts.Luckyone_Name = { attachTextTo = 'Frame', enable = true, font = Private.Font, fontOutline = Private.Outline, justifyH = 'CENTER', size = 14, text_format = '[luckyone:pet:name-and-happiness]', xOffset = 0, yOffset = 0 }
	E.db.unitframe.units.pet.customTexts.Luckyone_Power = { attachTextTo = 'Power', enable = true, font = Private.Font, fontOutline = Private.Outline, justifyH = 'CENTER', size = 11, text_format = '[luckyone:power:percent-color]', xOffset = 0, yOffset = 0 }

	E.db.unitframe.units.pet.castbar.enable = false
	E.db.unitframe.units.pet.disableMouseoverGlow = true
	E.db.unitframe.units.pet.fader.minAlpha = 0.5
	E.db.unitframe.units.pet.fader.smooth = 0
	E.db.unitframe.units.pet.healPrediction.absorbStyle = 'WRAPPED'
	E.db.unitframe.units.pet.health.colorHappiness = false
	E.db.unitframe.units.pet.height = 46
	E.db.unitframe.units.pet.name.text_format = ''
	E.db.unitframe.units.pet.orientation = 'LEFT'
	E.db.unitframe.units.pet.power.autoHide = true
	E.db.unitframe.units.pet.power.height = 4
	E.db.unitframe.units.pet.power.strataAndLevel.frameStrata = 'MEDIUM'
	E.db.unitframe.units.pet.power.strataAndLevel.useCustomStrata = true
	E.db.unitframe.units.pet.raidicon.enable = false
	E.db.unitframe.units.pet.threatStyle = 'NONE'
	E.db.unitframe.units.pet.width = 80

	-- Shared Player
	E.db.unitframe.units.player.customTexts = {}
	E.db.unitframe.units.player.customTexts.Luckyone_HP = { attachTextTo = 'Frame', enable = true, font = Private.Font, fontOutline = Private.Outline, justifyH = 'RIGHT', size = 14, text_format = '[health:current:shortvalue] • [luckyone:health:percent]', xOffset = -2, yOffset = 0 }
	E.db.unitframe.units.player.customTexts.Luckyone_Name = { attachTextTo = 'Frame', enable = true, font = Private.Font, fontOutline = Private.Outline, justifyH = 'LEFT', size = 14, text_format = '[luckyone:name:last-classcolor]', xOffset = 5, yOffset = 0 }
	E.db.unitframe.units.player.customTexts.Luckyone_Power = { attachTextTo = 'Power', enable = true, font = Private.Font, fontOutline = Private.Outline, justifyH = 'CENTER', size = 11, text_format = '', xOffset = 0, yOffset = 0 }

	E.db.unitframe.units.player.aurabar.enable = false
	E.db.unitframe.units.player.buffs.attachTo = 'FRAME'
	E.db.unitframe.units.player.buffs.countFont = Private.Font
	E.db.unitframe.units.player.buffs.perrow = 10
	E.db.unitframe.units.player.buffs.priority = 'Blacklist,Personal,nonPersonal'
	E.db.unitframe.units.player.buffs.yOffset = 1
	E.db.unitframe.units.player.castbar.customColor.color.b = 0.05
	E.db.unitframe.units.player.castbar.customColor.color.g = 0.05
	E.db.unitframe.units.player.castbar.customColor.color.r = 0.05
	E.db.unitframe.units.player.castbar.customColor.colorBackdrop.a = 0.89
	E.db.unitframe.units.player.castbar.customColor.colorBackdrop.b = 0.61
	E.db.unitframe.units.player.castbar.customColor.colorBackdrop.g = 0.56
	E.db.unitframe.units.player.castbar.customColor.colorBackdrop.r = 0.54
	E.db.unitframe.units.player.castbar.customColor.colorInterrupted.b = 0.30
	E.db.unitframe.units.player.castbar.customColor.colorInterrupted.g = 0.30
	E.db.unitframe.units.player.castbar.customColor.colorInterrupted.r = 0.30
	E.db.unitframe.units.player.castbar.customColor.colorNoInterrupt.b = 0.05
	E.db.unitframe.units.player.castbar.customColor.colorNoInterrupt.g = 0.05
	E.db.unitframe.units.player.castbar.customColor.colorNoInterrupt.r = 0.05
	E.db.unitframe.units.player.castbar.customColor.enable = true
	E.db.unitframe.units.player.castbar.customColor.transparent = true
	E.db.unitframe.units.player.castbar.customColor.useCustomBackdrop = true
	E.db.unitframe.units.player.castbar.customTextFont.enable = true
	E.db.unitframe.units.player.castbar.customTextFont.font = Private.Font
	E.db.unitframe.units.player.castbar.customTimeFont.enable = true
	E.db.unitframe.units.player.castbar.customTimeFont.font = Private.Font
	E.db.unitframe.units.player.castbar.latency = false
	E.db.unitframe.units.player.castbar.spark = true
	E.db.unitframe.units.player.castbar.textColor.b = 1
	E.db.unitframe.units.player.castbar.textColor.g = 1
	E.db.unitframe.units.player.castbar.textColor.r = 1
	E.db.unitframe.units.player.castbar.tickColor.a = 0.89
	E.db.unitframe.units.player.castbar.tickColor.b = 1
	E.db.unitframe.units.player.castbar.tickColor.g = 1
	E.db.unitframe.units.player.castbar.tickColor.r = 1
	E.db.unitframe.units.player.castbar.timeToHold = 2
	E.db.unitframe.units.player.castbar.xOffsetText = 2
	E.db.unitframe.units.player.castbar.xOffsetTime = -2
	E.db.unitframe.units.player.classbar.enable = false
	E.db.unitframe.units.player.CombatIcon.enable = false
	E.db.unitframe.units.player.debuffs.countFont = Private.Font
	E.db.unitframe.units.player.debuffs.countFontSize = 10
	E.db.unitframe.units.player.debuffs.countPosition = 'TOPRIGHT'
	E.db.unitframe.units.player.debuffs.countXOffset = 2
	E.db.unitframe.units.player.debuffs.countYOffset = 0
	E.db.unitframe.units.player.debuffs.desaturate = false
	E.db.unitframe.units.player.debuffs.numrows = 2
	E.db.unitframe.units.player.debuffs.perrow = 12
	E.db.unitframe.units.player.disableMouseoverGlow = true
	E.db.unitframe.units.player.healPrediction.absorbStyle = 'WRAPPED'
	E.db.unitframe.units.player.health.text_format = ''
	E.db.unitframe.units.player.height = 46
	E.db.unitframe.units.player.partyIndicator.enable = false
	E.db.unitframe.units.player.power.enable = false
	E.db.unitframe.units.player.power.height = 4
	E.db.unitframe.units.player.power.strataAndLevel.frameStrata = 'MEDIUM'
	E.db.unitframe.units.player.power.strataAndLevel.useCustomStrata = true
	E.db.unitframe.units.player.power.text_format = ''
	E.db.unitframe.units.player.pvp.text_format = ''
	E.db.unitframe.units.player.pvpIcon.scale = 0.85
	E.db.unitframe.units.player.raidicon.enable = false
	E.db.unitframe.units.player.raidRoleIcons.combatHide = true
	E.db.unitframe.units.player.raidRoleIcons.yOffset = 1
	E.db.unitframe.units.player.RestIcon.enable = false
	E.db.unitframe.units.player.threatStyle = 'NONE'
	E.db.unitframe.units.player.width = 260

	-- Shared Target
	E.db.unitframe.units.target.customTexts = {}
	E.db.unitframe.units.target.customTexts.Luckyone_HP = { attachTextTo = 'Frame', enable = true, font = Private.Font, fontOutline = Private.Outline, justifyH = 'LEFT', size = 14, text_format = '[luckyone:health:percent] • [health:current:shortvalue]', xOffset = 3, yOffset = 0 }
	E.db.unitframe.units.target.customTexts.Luckyone_Name = { attachTextTo = 'Frame', enable = true, font = Private.Font, fontOutline = Private.Outline, justifyH = 'RIGHT', size = 14, text_format = '[luckyone:level< |cffffffff- |r][luckyone:name:last-classcolor]', xOffset = -3, yOffset = 0 }
	E.db.unitframe.units.target.customTexts.Luckyone_Power = { attachTextTo = 'Power', enable = true, font = Private.Font, fontOutline = Private.Outline, justifyH = 'CENTER', size = 11, text_format = '[luckyone:power:percent-color]', xOffset = 0, yOffset = 0 }

	E.db.unitframe.units.target.aurabar.enable = false
	E.db.unitframe.units.target.buffs.attachTo = 'DEBUFFS'
	E.db.unitframe.units.target.buffs.countFont = Private.Font
	E.db.unitframe.units.target.buffs.countFontSize = 10
	E.db.unitframe.units.target.buffs.countPosition = 'TOPRIGHT'
	E.db.unitframe.units.target.buffs.countXOffset = 2
	E.db.unitframe.units.target.buffs.countYOffset = 0
	E.db.unitframe.units.target.buffs.numrows = 3
	E.db.unitframe.units.target.buffs.perrow = 12
	E.db.unitframe.units.target.buffs.yOffset = 1
	E.db.unitframe.units.target.castbar.customTextFont.enable = true
	E.db.unitframe.units.target.castbar.customTextFont.font = Private.Font
	E.db.unitframe.units.target.castbar.customTextFont.fontSize = 11
	E.db.unitframe.units.target.castbar.customTimeFont.enable = true
	E.db.unitframe.units.target.castbar.customTimeFont.font = Private.Font
	E.db.unitframe.units.target.castbar.customTimeFont.fontSize = 11
	E.db.unitframe.units.target.castbar.strataAndLevel.useCustomLevel = true
	E.db.unitframe.units.target.castbar.strataAndLevel.useCustomStrata = true
	E.db.unitframe.units.target.castbar.textColor.b = 1
	E.db.unitframe.units.target.castbar.textColor.g = 1
	E.db.unitframe.units.target.castbar.textColor.r = 1
	E.db.unitframe.units.target.castbar.timeToHold = 2
	E.db.unitframe.units.target.castbar.width = 261
	E.db.unitframe.units.target.castbar.xOffsetText = 2
	E.db.unitframe.units.target.castbar.xOffsetTime = -2
	E.db.unitframe.units.target.CombatIcon.enable = false
	E.db.unitframe.units.target.debuffs.attachTo = 'FRAME'
	E.db.unitframe.units.target.debuffs.countFont = Private.Font
	E.db.unitframe.units.target.debuffs.countFontSize = 10
	E.db.unitframe.units.target.debuffs.countPosition = 'TOPRIGHT'
	E.db.unitframe.units.target.debuffs.countXOffset = 2
	E.db.unitframe.units.target.debuffs.countYOffset = 0
	E.db.unitframe.units.target.debuffs.desaturate = false
	E.db.unitframe.units.target.debuffs.maxDuration = 0
	E.db.unitframe.units.target.debuffs.numrows = 2
	E.db.unitframe.units.target.debuffs.perrow = 12
	E.db.unitframe.units.target.debuffs.priority = 'Blacklist,Whitelist,Personal,CCDebuffs'
	E.db.unitframe.units.target.disableMouseoverGlow = true
	E.db.unitframe.units.target.fader.minAlpha = 0.5
	E.db.unitframe.units.target.fader.smooth = 0
	E.db.unitframe.units.target.healPrediction.absorbStyle = 'WRAPPED'
	E.db.unitframe.units.target.health.text_format = ''
	E.db.unitframe.units.target.height = 46
	E.db.unitframe.units.target.middleClickFocus = false
	E.db.unitframe.units.target.name.text_format = ''
	E.db.unitframe.units.target.orientation = 'LEFT'
	E.db.unitframe.units.target.phaseIndicator.scale = 0.5
	E.db.unitframe.units.target.power.autoHide = true
	E.db.unitframe.units.target.power.detachedWidth = 260
	E.db.unitframe.units.target.power.height = 4
	E.db.unitframe.units.target.power.strataAndLevel.frameStrata = 'MEDIUM'
	E.db.unitframe.units.target.power.strataAndLevel.useCustomStrata = true
	E.db.unitframe.units.target.power.text_format = ''
	E.db.unitframe.units.target.raidicon.attachTo = 'RIGHT'
	E.db.unitframe.units.target.raidicon.size = 40
	E.db.unitframe.units.target.raidicon.xOffset = 42
	E.db.unitframe.units.target.raidicon.yOffset = 1
	E.db.unitframe.units.target.raidRoleIcons.combatHide = true
	E.db.unitframe.units.target.raidRoleIcons.position = 'TOPRIGHT'
	E.db.unitframe.units.target.raidRoleIcons.yOffset = 1
	E.db.unitframe.units.target.smartAuraPosition = 'FLUID_BUFFS_ON_DEBUFFS'
	E.db.unitframe.units.target.threatStyle = 'NONE'
	E.db.unitframe.units.target.width = 260

	-- Shared TargetTarget
	E.db.unitframe.units.targettarget.customTexts = {}
	E.db.unitframe.units.targettarget.customTexts.Luckyone_Name = { attachTextTo = 'Frame', enable = true, font = Private.Font, fontOutline = Private.Outline, justifyH = 'CENTER', size = 14, text_format = '[luckyone:name:last-classcolor]', xOffset = 0, yOffset = 0 }

	E.db.unitframe.units.targettarget.debuffs.enable = false
	E.db.unitframe.units.targettarget.disableMouseoverGlow = true
	E.db.unitframe.units.targettarget.fader.minAlpha = 0.5
	E.db.unitframe.units.targettarget.fader.smooth = 0
	E.db.unitframe.units.targettarget.healPrediction.absorbStyle = 'WRAPPED'
	E.db.unitframe.units.targettarget.healPrediction.enable = true
	E.db.unitframe.units.targettarget.height = 24
	E.db.unitframe.units.targettarget.name.text_format = ''
	E.db.unitframe.units.targettarget.orientation = 'LEFT'
	E.db.unitframe.units.targettarget.power.enable = false
	E.db.unitframe.units.targettarget.raidicon.enable = false

	-- Shared Raidpet
	E.db.unitframe.units.raidpet.buffIndicator.countFont = Private.Font
	E.db.unitframe.units.raidpet.buffIndicator.countFontSize = 10
	E.db.unitframe.units.raidpet.buffIndicator.enable = true
	E.db.unitframe.units.raidpet.buffIndicator.size = 6
	E.db.unitframe.units.raidpet.buffs.priority = 'Blacklist,TurtleBuffs'
	E.db.unitframe.units.raidpet.classbar.enable = false
	E.db.unitframe.units.raidpet.debuffs.countFont = Private.Font
	E.db.unitframe.units.raidpet.debuffs.desaturate = false
	E.db.unitframe.units.raidpet.debuffs.maxDuration = 0
	E.db.unitframe.units.raidpet.debuffs.priority = 'Blacklist,RaidDebuffs,Dispellable'
	E.db.unitframe.units.raidpet.disableFocusGlow = true
	E.db.unitframe.units.raidpet.disableTargetGlow = true
	E.db.unitframe.units.raidpet.enable = E.Classic
	E.db.unitframe.units.raidpet.healPrediction.absorbStyle = 'WRAPPED'
	E.db.unitframe.units.raidpet.healPrediction.enable = true
	E.db.unitframe.units.raidpet.health.text_format = ''
	E.db.unitframe.units.raidpet.horizontalSpacing = 1
	E.db.unitframe.units.raidpet.name.attachTextTo = 'Frame'
	E.db.unitframe.units.raidpet.name.text_format = '[luckyone:name:veryshort-classcolor]'
	E.db.unitframe.units.raidpet.numGroups = 2
	E.db.unitframe.units.raidpet.phaseIndicator.anchorPoint = 'LEFT'
	E.db.unitframe.units.raidpet.phaseIndicator.scale = 0.5
	E.db.unitframe.units.raidpet.power.enable = false
	E.db.unitframe.units.raidpet.raidicon.attachTo = 'TOPRIGHT'
	E.db.unitframe.units.raidpet.raidicon.attachToObject = 'Health'
	E.db.unitframe.units.raidpet.raidicon.size = 12
	E.db.unitframe.units.raidpet.raidicon.xOffset = 1
	E.db.unitframe.units.raidpet.raidicon.yOffset = 1
	E.db.unitframe.units.raidpet.raidRoleIcons.scale = 0.8
	E.db.unitframe.units.raidpet.raidRoleIcons.yOffset = 1
	E.db.unitframe.units.raidpet.raidWideSorting = false
	E.db.unitframe.units.raidpet.rdebuffs.font = Private.Font
	E.db.unitframe.units.raidpet.rdebuffs.fontSize = 9
	E.db.unitframe.units.raidpet.rdebuffs.size = 14
	E.db.unitframe.units.raidpet.rdebuffs.stack.position = 'CENTER'
	E.db.unitframe.units.raidpet.rdebuffs.stack.xOffset = -10
	E.db.unitframe.units.raidpet.rdebuffs.stack.yOffset = 0
	E.db.unitframe.units.raidpet.rdebuffs.xOffset = 38
	E.db.unitframe.units.raidpet.rdebuffs.yOffset = 8
	E.db.unitframe.units.raidpet.readycheckIcon.position = 'RIGHT'
	E.db.unitframe.units.raidpet.readycheckIcon.yOffset = 0
	E.db.unitframe.units.raidpet.resurrectIcon.attachTo = 'RIGHT'
	E.db.unitframe.units.raidpet.resurrectIcon.size = 18
	E.db.unitframe.units.raidpet.roleIcon.attachTo = 'Frame'
	E.db.unitframe.units.raidpet.roleIcon.damager = false
	E.db.unitframe.units.raidpet.roleIcon.position = 'LEFT'
	E.db.unitframe.units.raidpet.roleIcon.size = 12
	E.db.unitframe.units.raidpet.roleIcon.xOffset = 0
	E.db.unitframe.units.raidpet.roleIcon.yOffset = 0
	E.db.unitframe.units.raidpet.summonIcon.attachTo = 'RIGHT'
	E.db.unitframe.units.raidpet.summonIcon.size = 18
	E.db.unitframe.units.raidpet.threatStyle = 'NONE'
	E.db.unitframe.units.raidpet.verticalSpacing = 1
	E.db.unitframe.units.raidpet.width = 92

	-- Shared growth directions
	E.db.unitframe.units.raidpet.growthDirection = 'RIGHT_DOWN'
	E.db.unitframe.units.raid1.growthDirection = 'RIGHT_DOWN'
	E.db.unitframe.units.raid2.growthDirection = 'RIGHT_DOWN'
	E.db.unitframe.units.raid3.growthDirection = 'RIGHT_DOWN'

	-- Shared Party
	E.db.unitframe.units.party.customTexts = {}
	E.db.unitframe.units.party.customTexts.Luckyone_Name = { attachTextTo = 'Health', enable = true, font = Private.Font, fontOutline = Private.Outline, justifyH = 'CENTER', size = 14, text_format = '', xOffset = 0, yOffset = 0 }

	E.db.unitframe.units.party.classbar.enable = false
	E.db.unitframe.units.party.debuffs.enable = false
	E.db.unitframe.units.party.disableFocusGlow = true
	E.db.unitframe.units.party.disableTargetGlow = true
	E.db.unitframe.units.party.fader.minAlpha = 0.5
	E.db.unitframe.units.party.fader.smooth = 0
	E.db.unitframe.units.party.growthDirection = 'DOWN_RIGHT'
	E.db.unitframe.units.party.healPrediction.absorbStyle = 'WRAPPED'
	E.db.unitframe.units.party.healPrediction.enable = true
	E.db.unitframe.units.party.health.text_format = ''
	E.db.unitframe.units.party.height = 40
	E.db.unitframe.units.party.horizontalSpacing = 1
	E.db.unitframe.units.party.name.text_format = ''
	E.db.unitframe.units.party.phaseIndicator.anchorPoint = 'LEFT'
	E.db.unitframe.units.party.phaseIndicator.scale = 0.5
	E.db.unitframe.units.party.phaseIndicator.xOffset = 15
	E.db.unitframe.units.party.power.enable = false
	E.db.unitframe.units.party.raidRoleIcons.combatHide = true
	E.db.unitframe.units.party.raidRoleIcons.yOffset = 1
	E.db.unitframe.units.party.rdebuffs.enable = false
	E.db.unitframe.units.party.readycheckIcon.attachTo = 'Frame'
	E.db.unitframe.units.party.readycheckIcon.position = 'RIGHT'
	E.db.unitframe.units.party.readycheckIcon.xOffset = -2
	E.db.unitframe.units.party.readycheckIcon.yOffset = 0
	E.db.unitframe.units.party.summonIcon.attachTo = 'RIGHT'
	E.db.unitframe.units.party.summonIcon.size = 24
	E.db.unitframe.units.party.summonIcon.xOffset = -15
	E.db.unitframe.units.party.threatStyle = 'NONE'
	E.db.unitframe.units.party.verticalSpacing = 1
	E.db.unitframe.units.party.width = 210

	-- Shared Raid1
	E.db.unitframe.units.raid1.buffIndicator.countFont = Private.Font
	E.db.unitframe.units.raid1.buffIndicator.countFontSize = 10
	E.db.unitframe.units.raid1.buffIndicator.size = 6
	E.db.unitframe.units.raid1.classbar.enable = false
	E.db.unitframe.units.raid1.disableFocusGlow = true
	E.db.unitframe.units.raid1.disableTargetGlow = true
	E.db.unitframe.units.raid1.fader.minAlpha = 0.5
	E.db.unitframe.units.raid1.fader.smooth = 0
	E.db.unitframe.units.raid1.healPrediction.absorbStyle = 'WRAPPED'
	E.db.unitframe.units.raid1.healPrediction.enable = true
	E.db.unitframe.units.raid1.health.text_format = ''
	E.db.unitframe.units.raid1.horizontalSpacing = 1
	E.db.unitframe.units.raid1.name.attachTextTo = 'Frame'
	E.db.unitframe.units.raid1.name.text_format = '[luckyone:name:veryshort-classcolor]'
	E.db.unitframe.units.raid1.numGroups = 4
	E.db.unitframe.units.raid1.phaseIndicator.anchorPoint = 'TOP'
	E.db.unitframe.units.raid1.phaseIndicator.scale = 0.5
	E.db.unitframe.units.raid1.power.enable = false
	E.db.unitframe.units.raid1.pvpclassificationindicator.enable = false
	E.db.unitframe.units.raid1.raidRoleIcons.combatHide = true
	E.db.unitframe.units.raid1.raidRoleIcons.scale = 0.8
	E.db.unitframe.units.raid1.raidRoleIcons.yOffset = 1
	E.db.unitframe.units.raid1.readycheckIcon.position = 'TOP'
	E.db.unitframe.units.raid1.readycheckIcon.size = 14
	E.db.unitframe.units.raid1.readycheckIcon.yOffset = 0
	E.db.unitframe.units.raid1.resurrectIcon.attachTo = 'RIGHT'
	E.db.unitframe.units.raid1.resurrectIcon.size = 18
	E.db.unitframe.units.raid1.roleIcon.attachTo = 'Frame'
	E.db.unitframe.units.raid1.roleIcon.damager = false
	E.db.unitframe.units.raid1.roleIcon.position = 'LEFT'
	E.db.unitframe.units.raid1.roleIcon.xOffset = 0
	E.db.unitframe.units.raid1.roleIcon.yOffset = 0
	E.db.unitframe.units.raid1.summonIcon.attachTo = 'RIGHT'
	E.db.unitframe.units.raid1.summonIcon.size = 18
	E.db.unitframe.units.raid1.threatStyle = 'NONE'
	E.db.unitframe.units.raid1.verticalSpacing = 1
	E.db.unitframe.units.raid1.visibility = E.Retail and '[@raid6,noexists][@raid21,exists] hide;show' or '[@raid6,noexists][@raid11,exists] hide;show'

	-- Shared Raid2
	E:CopyTable(E.db.unitframe.units.raid2, E.db.unitframe.units.raid1)
	E.db.unitframe.units.raid2.numGroups = E.Retail and 6 or 5
	E.db.unitframe.units.raid2.visibility = E.Retail and '[@raid21,noexists][@raid31,exists] hide;show' or '[@raid11,noexists][@raid26,exists] hide;show'

	-- Shared Raid3
	E.db.unitframe.units.raid3.buffIndicator.countFont = Private.Font
	E.db.unitframe.units.raid3.buffIndicator.countFontSize = 10
	E.db.unitframe.units.raid3.buffIndicator.size = 6
	E.db.unitframe.units.raid3.classbar.enable = false
	E.db.unitframe.units.raid3.debuffs.countFont = Private.Font
	E.db.unitframe.units.raid3.debuffs.desaturate = false
	E.db.unitframe.units.raid3.debuffs.maxDuration = 0
	E.db.unitframe.units.raid3.debuffs.priority = 'Blacklist,Dispellable,RaidDebuffs'
	E.db.unitframe.units.raid3.disableFocusGlow = true
	E.db.unitframe.units.raid3.disableTargetGlow = true
	E.db.unitframe.units.raid3.fader.minAlpha = 0.5
	E.db.unitframe.units.raid3.fader.smooth = 0
	E.db.unitframe.units.raid3.healPrediction.absorbStyle = 'WRAPPED'
	E.db.unitframe.units.raid3.health.text_format = ''
	E.db.unitframe.units.raid3.horizontalSpacing = 1
	E.db.unitframe.units.raid3.name.attachTextTo = 'Frame'
	E.db.unitframe.units.raid3.name.text_format = '[luckyone:name:veryshort-classcolor]'
	E.db.unitframe.units.raid3.phaseIndicator.anchorPoint = 'LEFT'
	E.db.unitframe.units.raid3.phaseIndicator.scale = 0.5
	E.db.unitframe.units.raid3.pvpclassificationindicator.enable = false
	E.db.unitframe.units.raid3.raidRoleIcons.combatHide = true
	E.db.unitframe.units.raid3.raidRoleIcons.scale = 0.8
	E.db.unitframe.units.raid3.raidRoleIcons.yOffset = 1
	E.db.unitframe.units.raid3.readycheckIcon.position = 'RIGHT'
	E.db.unitframe.units.raid3.readycheckIcon.yOffset = 0
	E.db.unitframe.units.raid3.resurrectIcon.attachTo = 'RIGHT'
	E.db.unitframe.units.raid3.resurrectIcon.size = 18
	E.db.unitframe.units.raid3.summonIcon.attachTo = 'RIGHT'
	E.db.unitframe.units.raid3.summonIcon.size = 18
	E.db.unitframe.units.raid3.threatStyle = 'NONE'
	E.db.unitframe.units.raid3.verticalSpacing = 1
	E.db.unitframe.units.raid3.visibility = E.Retail and '[@raid31,noexists] hide;show' or '[@raid26,noexists] hide;show'

	-- Shared movers
	E.db.movers.AddonCompartmentMover = 'TOPRIGHT,ElvUIParent,TOPRIGHT,-3,-66'
	E.db.movers.AlertFrameMover = 'TOP,ElvUIParent,TOP,0,-202'
	E.db.movers.AltPowerBarMover = 'TOP,ElvUIParent,TOP,0,-22'
	E.db.movers.ArenaHeaderMover = (scaled and 'TOPRIGHT,ElvUIParent,TOPRIGHT,-222,-240') or 'TOPRIGHT,ElvUIParent,TOPRIGHT,-240,-240'
	E.db.movers.BagsMover = 'BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-416,1'
	E.db.movers.BelowMinimapContainerMover = 'TOPRIGHT,ElvUIParent,TOPRIGHT,-176,-173'
	E.db.movers.BNETMover = (scaled and 'BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,1,156') or 'BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,1,190'
	E.db.movers.BossBannerMover = 'TOP,ElvUIParent,TOP,0,-202'
	E.db.movers.BossHeaderMover = (scaled and 'TOPRIGHT,ElvUIParent,TOPRIGHT,-222,-240') or 'TOPRIGHT,ElvUIParent,TOPRIGHT,-240,-240'
	E.db.movers.BuffsMover = 'TOPRIGHT,ElvUIParent,TOPRIGHT,-176,-1'
	E.db.movers.DebuffsMover = 'TOPRIGHT,ElvUIParent,TOPRIGHT,-176,-104'
	E.db.movers.DTPanelLuckyone_ActionBars_DTMover = 'BOTTOM,ElvUIParent,BOTTOM,0,1'
	E.db.movers.DTPanelLuckyone_MiniMap_DTMover = 'TOPRIGHT,ElvUIParent,TOPRIGHT,-56,-156'
	E.db.movers.DurabilityFrameMover = 'BOTTOM,ElvUIParent,BOTTOM,204,1'
	E.db.movers.ElvAB_1 = 'BOTTOM,ElvUIParent,BOTTOM,0,14'
	E.db.movers.ElvAB_2 = (scaled and 'BOTTOM,ElvUIParent,BOTTOM,0,64') or 'BOTTOM,ElvUIParent,BOTTOM,0,72'
	E.db.movers.ElvAB_3 = (scaled and 'BOTTOM,ElvUIParent,BOTTOM,0,39') or 'BOTTOM,ElvUIParent,BOTTOM,0,43'
	E.db.movers.ElvAB_4 = (scaled and 'BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,406,1') or 'BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,466,1'
	E.db.movers.ElvAB_5 = (scaled and 'TOPRIGHT,ElvUIParent,TOPRIGHT,-1,-390') or 'TOPRIGHT,ElvUIParent,TOPRIGHT,-1,-546'
	E.db.movers.ElvAB_6 = 'TOPLEFT,ElvUIParent,TOPLEFT,1,-541'
	E.db.movers.ElvAB_7 = 'TOPLEFT,ElvUIParent,TOPLEFT,1,-512'
	E.db.movers.ElvAB_8 = 'TOPLEFT,ElvUIParent,TOPLEFT,1,-483'
	E.db.movers.ElvAB_9 = 'TOPLEFT,ElvUIParent,TOPLEFT,1,-454'
	E.db.movers.ElvAB_10 = 'TOPLEFT,ElvUIParent,TOPLEFT,1,-425'
	E.db.movers.ElvAB_13 = 'TOPLEFT,ElvUIParent,TOPLEFT,1,-396'
	E.db.movers.ElvAB_14 = 'TOPLEFT,ElvUIParent,TOPLEFT,1,-367'
	E.db.movers.ElvAB_15 = 'TOPLEFT,ElvUIParent,TOPLEFT,1,-338'
	E.db.movers.ElvUIBagMover = (scaled and 'BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-1,156') or 'BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-1,192'
	E.db.movers.ElvUIBankMover = (scaled and 'BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,1,156') or 'BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,1,190'
	E.db.movers.EventToastMover = 'TOP,ElvUIParent,TOP,0,-66'
	E.db.movers.ExperienceBarMover = 'TOP,ElvUIParent,TOP,0,-1'
	E.db.movers.FocusPowerBarMover = 'BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-660,580'
	E.db.movers.GMMover = 'TOPRIGHT,ElvUIParent,TOPRIGHT,-453,-1'
	E.db.movers.LeftChatMover = 'BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,1,1'
	E.db.movers.LootFrameMover = 'TOP,UIParent,TOP,0,-87'
	E.db.movers.LossControlMover = (scaled and 'TOP,UIParent,TOP,0,-490') or 'TOP,UIParent,TOP,0,-670'
	E.db.movers.MicrobarMover = 'TOPLEFT,ElvUIParent,TOPLEFT,1,-1'
	E.db.movers.MinimapMover = 'TOPRIGHT,ElvUIParent,TOPRIGHT,-1,-1'
	E.db.movers.MirrorTimer1Mover = 'TOP,ElvUIParent,TOP,0,-60'
	E.db.movers.MirrorTimer2Mover = 'TOP,ElvUIParent,TOP,0,-79'
	E.db.movers.MirrorTimer3Mover = 'TOP,ElvUIParent,TOP,0,-98'
	E.db.movers.ObjectiveFrameMover = 'TOPRIGHT,ElvUIParent,TOPRIGHT,-120,-230'
	E.db.movers.PetAB = (scaled and 'BOTTOM,ElvUIParent,BOTTOM,0,89') or 'BOTTOM,ElvUIParent,BOTTOM,0,101'
	E.db.movers.PlayerChoiceToggle = 'BOTTOM,UIParent,BOTTOM,0,369'
	E.db.movers.PrivateRaidWarningMover = 'TOP,ElvUIParent,TOP,0,-420'
	E.db.movers.QuestWatchFrameMover = 'TOPRIGHT,ElvUIParent,TOPRIGHT,-120,-230'
	E.db.movers.QueueStatusMover = 'TOPRIGHT,ElvUIParent,TOPRIGHT,-6,-152'
	E.db.movers.ReputationBarMover = (scaled and 'BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-402,1') or 'BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-466,1'
	E.db.movers.RightChatMover = 'BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-1,1'
	E.db.movers.ShiftAB = 'TOPLEFT,ElvUIParent,TOPLEFT,232,-1'
	E.db.movers.TooltipMover = (scaled and 'BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,0,118') or 'BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,0,154'
	E.db.movers.TopCenterContainerMover = 'TOP,ElvUIParent,TOP,0,-45'
	E.db.movers.TorghastChoiceToggle = 'BOTTOM,ElvUIParent,BOTTOM,0,550'
	E.db.movers.UIErrorsFrameMover = 'TOP,ElvUIParent,TOP,0,-117'
	E.db.movers.VehicleSeatMover = E.Retail and 'BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,427,1' or 'BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,493,1'
	E.db.movers.VOICECHAT = 'TOPLEFT,ElvUIParent,TOPLEFT,1,-30'

	E:SaveMoverPosition('DTPanelLuckyone_ActionBars_DTMover')
	E:SaveMoverPosition('DTPanelLuckyone_MiniMap_DTMover')

	if layout == 'main' then

		-- Main growth direction
		E.db.unitframe.units.party.growthDirection = 'DOWN_RIGHT'

		-- Main Player
		E.db.unitframe.units.player.customTexts.Luckyone_Power.text_format = '[luckyone:power:percent-color]'
		E.db.unitframe.units.player.castbar.height = 24
		E.db.unitframe.units.player.castbar.width = 279
		E.db.unitframe.units.player.power.autoHide = true

		-- Main TargetTarget
		E.db.unitframe.units.targettarget.width = 278

		-- Main Party
		E.db.unitframe.units.party.customTexts.Luckyone_Name.text_format = not E.Classic and '[luckyone:name:short-classcolor]|r[ - >luckyone:healermana:percent]' or '[luckyone:name:short-classcolor]'
		E.db.unitframe.units.party.debuffs.countFont = Private.Font
		E.db.unitframe.units.party.debuffs.countXOffset = 2
		E.db.unitframe.units.party.debuffs.enable = true
		E.db.unitframe.units.party.debuffs.maxDuration = 0
		E.db.unitframe.units.party.debuffs.perrow = 2
		E.db.unitframe.units.party.debuffs.priority = 'Blacklist,Dispellable,RaidDebuffs'
		E.db.unitframe.units.party.debuffs.sizeOverride = 40
		E.db.unitframe.units.party.debuffs.xOffset = 1
		E.db.unitframe.units.party.debuffs.yOffset = -1
		E.db.unitframe.units.party.raidicon.attachTo = 'RIGHT'
		E.db.unitframe.units.party.raidicon.size = 14
		E.db.unitframe.units.party.raidicon.xOffset = -3
		E.db.unitframe.units.party.raidicon.yOffset = 0
		E.db.unitframe.units.party.roleIcon.damager = false
		E.db.unitframe.units.party.roleIcon.position = 'LEFT'
		E.db.unitframe.units.party.roleIcon.size = 14
		E.db.unitframe.units.party.roleIcon.xOffset = 0
		E.db.unitframe.units.party.showPlayer = false
		E.db.unitframe.units.party.width = 210

		-- Main Party (Classic Only)
		if E.Classic then
			E.db.unitframe.units.party.customTexts.Luckyone_Power = { attachTextTo = 'Power', enable = true, font = Private.Font, fontOutline = Private.Outline, justifyH = 'CENTER', size = 11, text_format = '[luckyone:power:percent-color<%]', xOffset = 88, yOffset = 20 }
			E.db.unitframe.units.party.power.autoHide = true
			E.db.unitframe.units.party.power.enable = true
			E.db.unitframe.units.party.power.height = 4
			E.db.unitframe.units.party.power.text_format = ''
		end

		-- Main Raid1
		E.db.unitframe.units.raid1.height = 40
		E.db.unitframe.units.raid1.raidicon.attachTo = 'TOPRIGHT'
		E.db.unitframe.units.raid1.raidicon.attachToObject = 'Health'
		E.db.unitframe.units.raid1.raidicon.size = 12
		E.db.unitframe.units.raid1.raidicon.xOffset = 1
		E.db.unitframe.units.raid1.raidicon.yOffset = 1
		E.db.unitframe.units.raid1.rdebuffs.font = Private.Font
		E.db.unitframe.units.raid1.rdebuffs.fontSize = 9
		E.db.unitframe.units.raid1.rdebuffs.size = 14
		E.db.unitframe.units.raid1.rdebuffs.stack.position = 'CENTER'
		E.db.unitframe.units.raid1.rdebuffs.stack.xOffset = -10
		E.db.unitframe.units.raid1.rdebuffs.stack.yOffset = 0
		E.db.unitframe.units.raid1.rdebuffs.xOffset = (scaled and 32) or 38
		E.db.unitframe.units.raid1.rdebuffs.yOffset = 13
		E.db.unitframe.units.raid1.roleIcon.size = 12
		E.db.unitframe.units.raid1.width = (scaled and 80) or 92

		-- Main Raid2
		E.db.unitframe.units.raid2.height = 40
		E.db.unitframe.units.raid2.raidicon.attachTo = 'TOPRIGHT'
		E.db.unitframe.units.raid2.raidicon.attachToObject = 'Health'
		E.db.unitframe.units.raid2.raidicon.size = 12
		E.db.unitframe.units.raid2.raidicon.xOffset = 1
		E.db.unitframe.units.raid2.raidicon.yOffset = 1
		E.db.unitframe.units.raid2.rdebuffs.font = Private.Font
		E.db.unitframe.units.raid2.rdebuffs.fontSize = 9
		E.db.unitframe.units.raid2.rdebuffs.size = 14
		E.db.unitframe.units.raid2.rdebuffs.stack.position = 'CENTER'
		E.db.unitframe.units.raid2.rdebuffs.stack.xOffset = -10
		E.db.unitframe.units.raid2.rdebuffs.stack.yOffset = 0
		E.db.unitframe.units.raid2.rdebuffs.xOffset = (scaled and 32) or 38
		E.db.unitframe.units.raid2.rdebuffs.yOffset = 13
		E.db.unitframe.units.raid2.roleIcon.size = 12
		E.db.unitframe.units.raid2.width = (scaled and 80) or 92

		-- Main Raid3
		E.db.unitframe.units.raid3.height = 30
		E.db.unitframe.units.raid3.raidicon.attachTo = 'TOPRIGHT'
		E.db.unitframe.units.raid3.raidicon.attachToObject = 'Health'
		E.db.unitframe.units.raid3.raidicon.size = 12
		E.db.unitframe.units.raid3.raidicon.xOffset = 1
		E.db.unitframe.units.raid3.raidicon.yOffset = 1
		E.db.unitframe.units.raid3.rdebuffs.enable = true
		E.db.unitframe.units.raid3.rdebuffs.font = Private.Font
		E.db.unitframe.units.raid3.rdebuffs.fontSize = 9
		E.db.unitframe.units.raid3.rdebuffs.size = 14
		E.db.unitframe.units.raid3.rdebuffs.stack.position = 'CENTER'
		E.db.unitframe.units.raid3.rdebuffs.stack.xOffset = -10
		E.db.unitframe.units.raid3.rdebuffs.stack.yOffset = 0
		E.db.unitframe.units.raid3.rdebuffs.xOffset = (scaled and 32) or 38
		E.db.unitframe.units.raid3.rdebuffs.yOffset = 8
		E.db.unitframe.units.raid3.roleIcon.attachTo = 'Frame'
		E.db.unitframe.units.raid3.roleIcon.damager = false
		E.db.unitframe.units.raid3.roleIcon.enable = true
		E.db.unitframe.units.raid3.roleIcon.position = 'LEFT'
		E.db.unitframe.units.raid3.roleIcon.size = 12
		E.db.unitframe.units.raid3.roleIcon.xOffset = 0
		E.db.unitframe.units.raid3.roleIcon.yOffset = 0
		E.db.unitframe.units.raid3.width = (scaled and 80) or 92

		-- Main misc
		E.global.datatexts.customPanels.Luckyone_ActionBars_DT.width = (scaled and 299) or 347

		-- Main movers
		E.db.movers.BossButton = (scaled and 'BOTTOM,UIParent,BOTTOM,-230,146') or 'BOTTOM,ElvUIParent,BOTTOM,-260,209'
		E.db.movers.ElvUF_FocusMover = (scaled and 'BOTTOM,ElvUIParent,BOTTOM,318,459') or 'BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-660,580'
		E.db.movers.ElvUF_PartyMover = (scaled and 'TOPLEFT,ElvUIParent,TOPLEFT,300,-300') or 'TOPLEFT,ElvUIParent,TOPLEFT,600,-480'
		E.db.movers.ElvUF_PetMover = (scaled and 'BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,461,324') or 'BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,781,474'
		E.db.movers.ElvUF_PlayerCastbarMover = (scaled and 'BOTTOM,UIParent,BOTTOM,0,247') or 'BOTTOM,ElvUIParent,BOTTOM,0,397'
		E.db.movers.ElvUF_PlayerMover = (scaled and 'BOTTOM,ElvUIParent,BOTTOM,-288,324') or 'BOTTOM,ElvUIParent,BOTTOM,-288,474'
		E.db.movers.ElvUF_Raid1Mover = (scaled and 'BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,1,156') or 'BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,1,190'
		E.db.movers.ElvUF_Raid2Mover = (scaled and 'BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,1,156') or 'BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,1,190'
		E.db.movers.ElvUF_Raid3Mover = (scaled and 'BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,1,156') or 'BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,1,190'
		E.db.movers.ElvUF_RaidpetMover = 'BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,1,438'
		E.db.movers.ElvUF_TargetCastbarMover = (scaled and 'BOTTOM,ElvUIParent,BOTTOM,288,305') or 'BOTTOM,ElvUIParent,BOTTOM,288,455'
		E.db.movers.ElvUF_TargetMover = (scaled and 'BOTTOM,ElvUIParent,BOTTOM,288,324') or 'BOTTOM,ElvUIParent,BOTTOM,288,474'
		E.db.movers.ElvUF_TargetTargetMover = (scaled and 'BOTTOM,ElvUIParent,BOTTOM,0,272') or 'BOTTOM,ElvUIParent,BOTTOM,0,422'
		E.db.movers.PowerBarContainerMover = (scaled and 'BOTTOM,ElvUIParent,BOTTOM,0,226') or 'BOTTOM,ElvUIParent,BOTTOM,0,376'
		E.db.movers.PrivateAurasMover = (scaled and 'TOPRIGHT,ElvUIParent,TOPRIGHT,-542,-422') or 'TOPRIGHT,ElvUIParent,TOPRIGHT,-661,-670'
		E.db.movers.VehicleLeaveButton = (scaled and 'BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,542,289') or 'BOTTOM,ElvUIParent,BOTTOM,-401,440'
		E.db.movers.ZoneAbility = (scaled and 'BOTTOM,ElvUIParent,BOTTOM,230,146') or 'BOTTOM,ElvUIParent,BOTTOM,260,209'

	elseif layout == 'healing' then

		-- Healing growth direction
		E.db.unitframe.units.party.growthDirection = 'RIGHT_DOWN'

		-- Healing Player
		E.db.unitframe.units.player.customTexts.Luckyone_Power.text_format = E.Retail and '[luckyone:power:percent-nocolor<%]' or '[curpp< • ][luckyone:power:percent-nocolor<%]'
		E.db.unitframe.units.player.castbar.customTextFont.fontSize = 14
		E.db.unitframe.units.player.castbar.customTimeFont.fontSize = 14
		E.db.unitframe.units.player.castbar.height = 26
		E.db.unitframe.units.player.castbar.width = (scaled and 505) or 605
		E.db.unitframe.units.player.power.attachTextTo = 'Power'
		E.db.unitframe.units.player.power.autoHide = false
		E.db.unitframe.units.player.power.detachedWidth = 260
		E.db.unitframe.units.player.power.detachFromFrame = true
		E.db.unitframe.units.player.power.enable = true
		E.db.unitframe.units.player.power.height = 18
		E.db.unitframe.units.player.power.position = 'CENTER'
		E.db.unitframe.units.player.power.powerPrediction = true

		if E.Classic then
			E.db.unitframe.units.player.power.EnergyManaRegen = true
		end

		-- Healing TargetTarget
		E.db.unitframe.units.targettarget.width = 260

		-- Healing Party
		E.db.unitframe.units.party.customTexts.Luckyone_Name.text_format = '[luckyone:name:short-classcolor]'
		E.db.unitframe.units.party.buffIndicator.size = 14
		E.db.unitframe.units.party.debuffs.enable = false
		E.db.unitframe.units.party.height = 65
		E.db.unitframe.units.party.raidicon.attachTo = 'RIGHT'
		E.db.unitframe.units.party.raidicon.size = 14
		E.db.unitframe.units.party.raidicon.xOffset = -2
		E.db.unitframe.units.party.raidicon.yOffset = 0
		E.db.unitframe.units.party.rdebuffs.enable = true
		E.db.unitframe.units.party.rdebuffs.font = Private.Font
		E.db.unitframe.units.party.rdebuffs.fontSize = 9
		E.db.unitframe.units.party.rdebuffs.size = 18
		E.db.unitframe.units.party.rdebuffs.stack.position = 'CENTER'
		E.db.unitframe.units.party.rdebuffs.stack.xOffset = 14
		E.db.unitframe.units.party.rdebuffs.stack.yOffset = 0
		E.db.unitframe.units.party.roleIcon.attachTo = 'Frame'
		E.db.unitframe.units.party.roleIcon.damager = false
		E.db.unitframe.units.party.roleIcon.position = 'LEFT'
		E.db.unitframe.units.party.roleIcon.size = 16
		E.db.unitframe.units.party.roleIcon.xOffset = 0
		E.db.unitframe.units.party.roleIcon.yOffset = 0
		E.db.unitframe.units.party.width = (scaled and 100) or 120

		-- Healing Raid1
		E.db.unitframe.units.raid1.buffIndicator.size = 14
		E.db.unitframe.units.raid1.height = 65
		E.db.unitframe.units.raid1.raidicon.attachTo = 'RIGHT'
		E.db.unitframe.units.raid1.raidicon.size = 14
		E.db.unitframe.units.raid1.raidicon.xOffset = -2
		E.db.unitframe.units.raid1.raidicon.yOffset = 0
		E.db.unitframe.units.raid1.rdebuffs.font = Private.Font
		E.db.unitframe.units.raid1.rdebuffs.fontSize = 9
		E.db.unitframe.units.raid1.rdebuffs.size = 18
		E.db.unitframe.units.raid1.rdebuffs.stack.position = 'CENTER'
		E.db.unitframe.units.raid1.rdebuffs.stack.xOffset = 14
		E.db.unitframe.units.raid1.rdebuffs.stack.yOffset = 0
		E.db.unitframe.units.raid1.roleIcon.attachTo = 'Frame'
		E.db.unitframe.units.raid1.roleIcon.damager = false
		E.db.unitframe.units.raid1.roleIcon.position = 'LEFT'
		E.db.unitframe.units.raid1.roleIcon.size = 16
		E.db.unitframe.units.raid1.roleIcon.xOffset = 0
		E.db.unitframe.units.raid1.roleIcon.yOffset = 0
		E.db.unitframe.units.raid1.width = (scaled and 100) or 120

		-- Healing Raid2
		E.db.unitframe.units.raid2.buffIndicator.size = 14
		E.db.unitframe.units.raid2.height = (scaled and 42) or 59
		E.db.unitframe.units.raid2.raidicon.attachTo = 'RIGHT'
		E.db.unitframe.units.raid2.raidicon.size = 14
		E.db.unitframe.units.raid2.raidicon.xOffset = -2
		E.db.unitframe.units.raid2.raidicon.yOffset = 0
		E.db.unitframe.units.raid2.rdebuffs.font = Private.Font
		E.db.unitframe.units.raid2.rdebuffs.fontSize = 9
		E.db.unitframe.units.raid2.rdebuffs.size = 18
		E.db.unitframe.units.raid2.rdebuffs.stack.position = 'CENTER'
		E.db.unitframe.units.raid2.rdebuffs.stack.xOffset = 14
		E.db.unitframe.units.raid2.rdebuffs.stack.yOffset = 0
		E.db.unitframe.units.raid2.roleIcon.attachTo = 'Frame'
		E.db.unitframe.units.raid2.roleIcon.damager = false
		E.db.unitframe.units.raid2.roleIcon.position = 'LEFT'
		E.db.unitframe.units.raid2.roleIcon.size = 16
		E.db.unitframe.units.raid2.roleIcon.xOffset = 0
		E.db.unitframe.units.raid2.roleIcon.yOffset = 0
		E.db.unitframe.units.raid2.width = (scaled and 100) or 120

		-- Healing Raid3
		E.db.unitframe.units.raid3.height = (scaled and 32) or 34
		E.db.unitframe.units.raid3.raidicon.attachTo = 'RIGHT'
		E.db.unitframe.units.raid3.raidicon.size = 12
		E.db.unitframe.units.raid3.raidicon.xOffset = -2
		E.db.unitframe.units.raid3.raidicon.yOffset = 0
		E.db.unitframe.units.raid3.rdebuffs.enable = true
		E.db.unitframe.units.raid3.rdebuffs.font = Private.Font
		E.db.unitframe.units.raid3.rdebuffs.fontSize = 9
		E.db.unitframe.units.raid3.rdebuffs.size = 14
		E.db.unitframe.units.raid3.rdebuffs.stack.position = 'CENTER'
		E.db.unitframe.units.raid3.rdebuffs.stack.xOffset = 12
		E.db.unitframe.units.raid3.rdebuffs.stack.yOffset = 0
		E.db.unitframe.units.raid3.roleIcon.attachTo = 'Frame'
		E.db.unitframe.units.raid3.roleIcon.damager = false
		E.db.unitframe.units.raid3.roleIcon.enable = true
		E.db.unitframe.units.raid3.roleIcon.position = 'LEFT'
		E.db.unitframe.units.raid3.roleIcon.size = 12
		E.db.unitframe.units.raid3.roleIcon.xOffset = 0
		E.db.unitframe.units.raid3.roleIcon.yOffset = 0
		E.db.unitframe.units.raid3.width = (scaled and 100) or 120

		-- Healing misc
		E.global.datatexts.customPanels.Luckyone_ActionBars_DT.width = (scaled and 299) or 347

		-- Healing movers
		E.db.movers.BossButton = (scaled and 'BOTTOM,UIParent,BOTTOM,-280,146') or 'BOTTOM,ElvUIParent,BOTTOM,-330,241'
		E.db.movers.ElvUF_FocusMover = (scaled and 'BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-447,492') or 'BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-514,580'
		E.db.movers.ElvUF_PartyMover = (scaled and 'BOTTOM,ElvUIParent,BOTTOM,0,339') or 'BOTTOM,ElvUIParent,BOTTOM,0,455'
		E.db.movers.ElvUF_PetMover = (scaled and 'BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,366,358') or 'BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,636,474'
		E.db.movers.ElvUF_PlayerCastbarMover = (scaled and 'BOTTOM,ElvUIParent,BOTTOM,0,114') or 'BOTTOM,ElvUIParent,BOTTOM,0,134'
		E.db.movers.ElvUF_PlayerMover = (scaled and 'BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,447,358') or 'BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,717,474'
		E.db.movers.ElvUF_Raid1Mover = (scaled and 'BOTTOM,ElvUIParent,BOTTOM,0,141') or 'BOTTOM,ElvUIParent,BOTTOM,0,257'
		E.db.movers.ElvUF_Raid2Mover = (scaled and 'BOTTOM,ElvUIParent,BOTTOM,0,147') or 'BOTTOM,ElvUIParent,BOTTOM,0,161'
		E.db.movers.ElvUF_Raid3Mover = (scaled and 'BOTTOM,ElvUIParent,BOTTOM,0,141') or 'BOTTOM,UIParent,BOTTOM,0,241'
		E.db.movers.ElvUF_RaidpetMover = 'BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,1,438'
		E.db.movers.ElvUF_TargetCastbarMover = (scaled and 'BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-447,339') or 'BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-717,455'
		E.db.movers.ElvUF_TargetMover = (scaled and 'BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-447,358') or 'BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-716,474'
		E.db.movers.ElvUF_TargetTargetMover = (scaled and 'BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-447,314') or 'BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-716,430'
		E.db.movers.PlayerPowerBarMover = (scaled and 'BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,447,339') or 'BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,717,455'
		E.db.movers.PowerBarContainerMover = 'TOP,ElvUIParent,TOP,0,-110'
		E.db.movers.PrivateAurasMover = (scaled and 'TOPRIGHT,ElvUIParent,TOPRIGHT,-450,-388') or 'TOPRIGHT,ElvUIParent,TOPRIGHT,-515,-670'
		E.db.movers.VehicleLeaveButton = (scaled and 'BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,450,304') or 'BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,718,421'
		E.db.movers.ZoneAbility = (scaled and 'BOTTOM,ElvUIParent,BOTTOM,280,146') or 'BOTTOM,ElvUIParent,BOTTOM,330,241'

	elseif layout == 'support' then

		-- Support growth direction
		E.db.unitframe.units.party.growthDirection = 'DOWN_RIGHT'

		-- Support Player
		E.db.unitframe.units.player.customTexts.Luckyone_Power.text_format = '[luckyone:power:percent-color]'
		E.db.unitframe.units.player.castbar.height = 24
		E.db.unitframe.units.player.castbar.width = 279
		E.db.unitframe.units.player.power.autoHide = true

		-- Support TargetTarget
		E.db.unitframe.units.targettarget.width = 278

		-- Support Party
		E.db.unitframe.units.party.customTexts.Luckyone_Name.text_format = '[luckyone:name:short-classcolor]|r[ - >luckyone:healermana:percent]'
		E.db.unitframe.units.party.debuffs.countFont = Private.Font
		E.db.unitframe.units.party.debuffs.countXOffset = 2
		E.db.unitframe.units.party.debuffs.enable = true
		E.db.unitframe.units.party.debuffs.maxDuration = 0
		E.db.unitframe.units.party.debuffs.perrow = 2
		E.db.unitframe.units.party.debuffs.priority = 'Blacklist,Dispellable,RaidDebuffs'
		E.db.unitframe.units.party.debuffs.sizeOverride = 40
		E.db.unitframe.units.party.debuffs.xOffset = 1
		E.db.unitframe.units.party.debuffs.yOffset = -1
		E.db.unitframe.units.party.raidicon.attachTo = 'RIGHT'
		E.db.unitframe.units.party.raidicon.size = 14
		E.db.unitframe.units.party.raidicon.xOffset = -3
		E.db.unitframe.units.party.raidicon.yOffset = 0
		E.db.unitframe.units.party.roleIcon.damager = false
		E.db.unitframe.units.party.roleIcon.position = 'LEFT'
		E.db.unitframe.units.party.roleIcon.size = 14
		E.db.unitframe.units.party.roleIcon.xOffset = 0
		E.db.unitframe.units.party.showPlayer = false
		E.db.unitframe.units.party.width = 210

		-- Support Raid1
		E.db.unitframe.units.raid1.height = 40
		E.db.unitframe.units.raid1.raidicon.attachTo = 'TOPRIGHT'
		E.db.unitframe.units.raid1.raidicon.attachToObject = 'Health'
		E.db.unitframe.units.raid1.raidicon.size = 12
		E.db.unitframe.units.raid1.raidicon.xOffset = 1
		E.db.unitframe.units.raid1.raidicon.yOffset = 1
		E.db.unitframe.units.raid1.rdebuffs.font = Private.Font
		E.db.unitframe.units.raid1.rdebuffs.fontSize = 9
		E.db.unitframe.units.raid1.rdebuffs.size = 14
		E.db.unitframe.units.raid1.rdebuffs.stack.position = 'CENTER'
		E.db.unitframe.units.raid1.rdebuffs.stack.xOffset = -10
		E.db.unitframe.units.raid1.rdebuffs.stack.yOffset = 0
		E.db.unitframe.units.raid1.rdebuffs.xOffset = (scaled and 32) or 38
		E.db.unitframe.units.raid1.rdebuffs.yOffset = 13
		E.db.unitframe.units.raid1.roleIcon.size = 12
		E.db.unitframe.units.raid1.width = (scaled and 80) or 92

		-- Support Raid2
		E.db.unitframe.units.raid2.height = (scaled and 30) or 40
		E.db.unitframe.units.raid2.raidicon.attachTo = 'TOPRIGHT'
		E.db.unitframe.units.raid2.raidicon.attachToObject = 'Health'
		E.db.unitframe.units.raid2.raidicon.size = 12
		E.db.unitframe.units.raid2.raidicon.xOffset = 1
		E.db.unitframe.units.raid2.raidicon.yOffset = 1
		E.db.unitframe.units.raid2.rdebuffs.font = Private.Font
		E.db.unitframe.units.raid2.rdebuffs.fontSize = 9
		E.db.unitframe.units.raid2.rdebuffs.size = 14
		E.db.unitframe.units.raid2.rdebuffs.stack.position = 'CENTER'
		E.db.unitframe.units.raid2.rdebuffs.stack.xOffset = -10
		E.db.unitframe.units.raid2.rdebuffs.stack.yOffset = 0
		E.db.unitframe.units.raid2.rdebuffs.xOffset = (scaled and 32) or 38
		E.db.unitframe.units.raid2.rdebuffs.yOffset = (scaled and 7) or 13
		E.db.unitframe.units.raid2.roleIcon.size = 12
		E.db.unitframe.units.raid2.width = (scaled and 80) or 92

		-- Support Raid3
		E.db.unitframe.units.raid3.height = (scaled and 22) or 30
		E.db.unitframe.units.raid3.raidicon.attachTo = 'TOPRIGHT'
		E.db.unitframe.units.raid3.raidicon.attachToObject = 'Health'
		E.db.unitframe.units.raid3.raidicon.size = 12
		E.db.unitframe.units.raid3.raidicon.xOffset = 1
		E.db.unitframe.units.raid3.raidicon.yOffset = 1
		E.db.unitframe.units.raid3.rdebuffs.enable = true
		E.db.unitframe.units.raid3.rdebuffs.font = Private.Font
		E.db.unitframe.units.raid3.rdebuffs.fontSize = 9
		E.db.unitframe.units.raid3.rdebuffs.size = 14
		E.db.unitframe.units.raid3.rdebuffs.stack.position = 'CENTER'
		E.db.unitframe.units.raid3.rdebuffs.stack.xOffset = -10
		E.db.unitframe.units.raid3.rdebuffs.stack.yOffset = 0
		E.db.unitframe.units.raid3.rdebuffs.xOffset = (scaled and 32) or 38
		E.db.unitframe.units.raid3.rdebuffs.yOffset = (scaled and 4) or 8
		E.db.unitframe.units.raid3.roleIcon.attachTo = 'Frame'
		E.db.unitframe.units.raid3.roleIcon.damager = false
		E.db.unitframe.units.raid3.roleIcon.enable = true
		E.db.unitframe.units.raid3.roleIcon.position = 'LEFT'
		E.db.unitframe.units.raid3.roleIcon.size = 12
		E.db.unitframe.units.raid3.roleIcon.xOffset = 0
		E.db.unitframe.units.raid3.roleIcon.yOffset = 0
		E.db.unitframe.units.raid3.width = (scaled and 80) or 92

		-- Special misc
		E.global.datatexts.customPanels.Luckyone_ActionBars_DT.width = (scaled and 404) or 464
		E.db.actionbar.bar1.mouseover = true
		E.db.actionbar.bar2.mouseover = true
		E.db.actionbar.bar3.mouseover = true
		E.db.actionbar.barPet.mouseover = true

		-- Support movers
		E.db.movers.BossButton = (scaled and 'BOTTOM,UIParent,BOTTOM,-230,146') or 'BOTTOM,ElvUIParent,BOTTOM,-260,209'
		E.db.movers.ElvAB_1 = (scaled and 'BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,1,156') or 'BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,1,190'
		E.db.movers.ElvAB_2 = (scaled and 'BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,1,206') or 'BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,1,248'
		E.db.movers.ElvAB_3 = (scaled and 'BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,1,181') or 'BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,1,219'
		E.db.movers.ElvUF_FocusMover = (scaled and 'BOTTOM,ElvUIParent,BOTTOM,318,459') or 'BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-660,580'
		E.db.movers.ElvUF_PartyMover = (scaled and 'TOPLEFT,ElvUIParent,TOPLEFT,300,-300') or 'TOPLEFT,ElvUIParent,TOPLEFT,600,-480'
		E.db.movers.ElvUF_PetMover = (scaled and 'BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,461,324') or 'BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,781,474'
		E.db.movers.ElvUF_PlayerCastbarMover = (scaled and 'BOTTOM,UIParent,BOTTOM,0,247') or 'BOTTOM,ElvUIParent,BOTTOM,0,397'
		E.db.movers.ElvUF_PlayerMover = (scaled and 'BOTTOM,ElvUIParent,BOTTOM,-288,324') or 'BOTTOM,ElvUIParent,BOTTOM,-288,474'
		E.db.movers.ElvUF_Raid1Mover = 'BOTTOM,ElvUIParent,BOTTOM,0,14'
		E.db.movers.ElvUF_Raid2Mover = 'BOTTOM,ElvUIParent,BOTTOM,0,14'
		E.db.movers.ElvUF_Raid3Mover = 'BOTTOM,ElvUIParent,BOTTOM,0,14'
		E.db.movers.ElvUF_RaidpetMover = 'BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,1,438'
		E.db.movers.ElvUF_TargetCastbarMover = (scaled and 'BOTTOM,ElvUIParent,BOTTOM,288,305') or 'BOTTOM,ElvUIParent,BOTTOM,288,455'
		E.db.movers.ElvUF_TargetMover = (scaled and 'BOTTOM,ElvUIParent,BOTTOM,288,324') or 'BOTTOM,ElvUIParent,BOTTOM,288,474'
		E.db.movers.ElvUF_TargetTargetMover = (scaled and 'BOTTOM,ElvUIParent,BOTTOM,0,272') or 'BOTTOM,ElvUIParent,BOTTOM,0,422'
		E.db.movers.PetAB = (scaled and 'BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,1,231') or 'BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,1,277'
		E.db.movers.PowerBarContainerMover = (scaled and 'BOTTOM,ElvUIParent,BOTTOM,0,226') or 'BOTTOM,ElvUIParent,BOTTOM,0,376'
		E.db.movers.PrivateAurasMover = (scaled and 'TOPRIGHT,ElvUIParent,TOPRIGHT,-542,-422') or 'TOPRIGHT,ElvUIParent,TOPRIGHT,-661,-670'
		E.db.movers.VehicleLeaveButton = (scaled and 'BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,542,289') or 'BOTTOM,ElvUIParent,BOTTOM,-401,440'
		E.db.movers.ZoneAbility = (scaled and 'BOTTOM,ElvUIParent,BOTTOM,230,146') or 'BOTTOM,ElvUIParent,BOTTOM,260,209'
	end
end

-- Dragonflight layout db
function Private:Layout_Dragonflight(layout)
	-- AB conversion
	E.db.convertPages = true
	-- Protect movers error
	E.db.movers = E.db.movers or {}

	-- General
	E.db.general.afkChat = false
	E.db.general.altPowerBar.font = Private.Font
	E.db.general.altPowerBar.statusBar = Private.Texture
	E.db.general.altPowerBar.statusBarColorGradient = true
	E.db.general.autoAcceptInvite = true
	E.db.general.autoRepair = E.Retail and 'GUILD' or 'PLAYER'
	E.db.general.backdropcolor.b = 0.12
	E.db.general.backdropcolor.g = 0.12
	E.db.general.backdropcolor.r = 0.12
	E.db.general.backdropfadecolor.a = 0.90
	E.db.general.backdropfadecolor.b = 0.05
	E.db.general.backdropfadecolor.g = 0.05
	E.db.general.backdropfadecolor.r = 0.05
	E.db.general.bonusObjectivePosition = 'AUTO'
	E.db.general.bottomPanel = false
	E.db.general.customGlow.color.a = 1
	E.db.general.customGlow.color.b = 1
	E.db.general.customGlow.color.g = 1
	E.db.general.customGlow.color.r = 1
	E.db.general.customGlow.useColor = true
	E.db.general.durabilityScale = 0.5
	E.db.general.enhancedPvpMessages = false
	E.db.general.interruptAnnounce = 'EMOTE'
	E.db.general.itemLevel.itemLevelFont = Private.Font
	E.db.general.itemLevel.itemLevelFontSize = 10
	E.db.general.loginmessage = false
	E.db.general.lootRoll.buttonSize = 22
	E.db.general.lootRoll.spacing = 3
	E.db.general.lootRoll.statusBarTexture = Private.Texture
	E.db.general.lootRoll.style = 'fullbar'
	E.db.general.lootRoll.width = 340
	E.db.general.minimap.icons.classHall.scale = 0.5
	E.db.general.minimap.icons.mail.texture = 'Mail1'
	E.db.general.minimap.icons.mail.xOffset = -2
	E.db.general.minimap.icons.mail.yOffset = 2
	E.db.general.minimap.locationFontSize = 11
	E.db.general.minimap.locationText = 'HIDE'
	E.db.general.minimap.size = 153
	E.db.general.objectiveFrameAutoHide = false
	E.db.general.objectiveFrameHeight = 600
	E.db.general.queueStatus.scale = 0.4
	E.db.general.talkingHeadFrameBackdrop = true
	E.db.general.talkingHeadFrameScale = 0.7
	E.db.general.vehicleSeatIndicatorSize = 64

	if E.Retail then
		E.db.general.addonCompartment.fontOutline = Private.Outline
		E.db.general.addonCompartment.hide = true
		E.db.general.addonCompartment.size = 20
		E.db.general.privateAuras.icon.size = 64
	end

	if not E.Classic then
		E.db.general.guildBank.countFont = Private.Font
		E.db.general.guildBank.countFontOutline = Private.Outline
		E.db.general.guildBank.itemLevelFont = Private.Font
		E.db.general.guildBank.itemLevelFontOutline = Private.Outline
	end

	-- ActionBars
	E.db.actionbar.bar1.buttonSize = 26
	E.db.actionbar.bar1.buttonSpacing = 1
	E.db.actionbar.bar1.countFont = Private.Font
	E.db.actionbar.bar1.countFontOutline = Private.Outline
	E.db.actionbar.bar1.countFontSize = 9
	E.db.actionbar.bar1.countTextPosition = 'BOTTOM'
	E.db.actionbar.bar1.hotkeyFont = Private.Font
	E.db.actionbar.bar1.hotkeyFontOutline = Private.Outline
	E.db.actionbar.bar1.hotkeyFontSize = 9
	E.db.actionbar.bar1.hotkeyTextPosition = 'TOP'
	E.db.actionbar.bar1.hotkeyTextYOffset = -1
	E.db.actionbar.bar1.macroFont = Private.Font
	E.db.actionbar.bar1.macroFontOutline = Private.Outline
	E.db.actionbar.bar1.macroFontSize = 9
	E.db.actionbar.bar1.macrotext = true
	E.db.actionbar.bar1.macroTextPosition = 'BOTTOM'
	E.db.actionbar.bar1.macroTextYOffset = 1
	E.db.actionbar.bar1.professionQuality.enable = false
	E.db.actionbar.bar2.buttonSize = 26
	E.db.actionbar.bar2.buttonSpacing = 1
	E.db.actionbar.bar2.countFont = Private.Font
	E.db.actionbar.bar2.countFontOutline = Private.Outline
	E.db.actionbar.bar2.countFontSize = 9
	E.db.actionbar.bar2.countTextPosition = 'BOTTOM'
	E.db.actionbar.bar2.enabled = true
	E.db.actionbar.bar2.hotkeyFont = Private.Font
	E.db.actionbar.bar2.hotkeyFontOutline = Private.Outline
	E.db.actionbar.bar2.hotkeyFontSize = 9
	E.db.actionbar.bar2.hotkeyTextPosition = 'TOP'
	E.db.actionbar.bar2.hotkeyTextYOffset = -1
	E.db.actionbar.bar2.macroFont = Private.Font
	E.db.actionbar.bar2.macroFontOutline = Private.Outline
	E.db.actionbar.bar2.macroFontSize = 9
	E.db.actionbar.bar2.macrotext = true
	E.db.actionbar.bar2.macroTextPosition = 'BOTTOM'
	E.db.actionbar.bar2.macroTextYOffset = 1
	E.db.actionbar.bar2.professionQuality.enable = false
	E.db.actionbar.bar3.buttons = 12
	E.db.actionbar.bar3.buttonSize = 26
	E.db.actionbar.bar3.buttonSpacing = 1
	E.db.actionbar.bar3.buttonsPerRow = 12
	E.db.actionbar.bar3.countFont = Private.Font
	E.db.actionbar.bar3.countFontOutline = Private.Outline
	E.db.actionbar.bar3.countFontSize = 9
	E.db.actionbar.bar3.countTextPosition = 'BOTTOM'
	E.db.actionbar.bar3.hotkeyFont = Private.Font
	E.db.actionbar.bar3.hotkeyFontOutline = Private.Outline
	E.db.actionbar.bar3.hotkeyFontSize = 9
	E.db.actionbar.bar3.hotkeyTextPosition = 'TOP'
	E.db.actionbar.bar3.hotkeyTextYOffset = -1
	E.db.actionbar.bar3.macroFont = Private.Font
	E.db.actionbar.bar3.macroFontOutline = Private.Outline
	E.db.actionbar.bar3.macroFontSize = 9
	E.db.actionbar.bar3.macrotext = true
	E.db.actionbar.bar3.macroTextPosition = 'BOTTOM'
	E.db.actionbar.bar3.macroTextYOffset = 1
	E.db.actionbar.bar3.professionQuality.enable = false
	E.db.actionbar.bar4.backdrop = false
	E.db.actionbar.bar4.buttons = 12
	E.db.actionbar.bar4.buttonSize = 26
	E.db.actionbar.bar4.buttonSpacing = 1
	E.db.actionbar.bar4.buttonsPerRow = 12
	E.db.actionbar.bar4.countFont = Private.Font
	E.db.actionbar.bar4.countFontOutline = Private.Outline
	E.db.actionbar.bar4.countFontSize = 9
	E.db.actionbar.bar4.countTextPosition = 'BOTTOM'
	E.db.actionbar.bar4.enabled = false
	E.db.actionbar.bar4.hotkeyFont = Private.Font
	E.db.actionbar.bar4.hotkeyFontOutline = Private.Outline
	E.db.actionbar.bar4.hotkeyFontSize = 9
	E.db.actionbar.bar4.hotkeyTextPosition = 'TOP'
	E.db.actionbar.bar4.hotkeyTextYOffset = -1
	E.db.actionbar.bar4.macroFont = Private.Font
	E.db.actionbar.bar4.macroFontOutline = Private.Outline
	E.db.actionbar.bar4.macroFontSize = 9
	E.db.actionbar.bar4.macrotext = true
	E.db.actionbar.bar4.macroTextPosition = 'BOTTOM'
	E.db.actionbar.bar4.macroTextYOffset = 1
	E.db.actionbar.bar4.point = 'BOTTOMLEFT'
	E.db.actionbar.bar4.professionQuality.enable = false
	E.db.actionbar.bar5.buttons = 12
	E.db.actionbar.bar5.buttonSize = 26
	E.db.actionbar.bar5.buttonSpacing = 1
	E.db.actionbar.bar5.buttonsPerRow = 1
	E.db.actionbar.bar5.countFont = Private.Font
	E.db.actionbar.bar5.countFontOutline = Private.Outline
	E.db.actionbar.bar5.countFontSize = 9
	E.db.actionbar.bar5.countTextPosition = 'BOTTOM'
	E.db.actionbar.bar5.enabled = true
	E.db.actionbar.bar5.hotkeyFont = Private.Font
	E.db.actionbar.bar5.hotkeyFontOutline = Private.Outline
	E.db.actionbar.bar5.hotkeyFontSize = 9
	E.db.actionbar.bar5.hotkeyTextPosition = 'TOP'
	E.db.actionbar.bar5.hotkeyTextYOffset = -1
	E.db.actionbar.bar5.macroFont = Private.Font
	E.db.actionbar.bar5.macroFontOutline = Private.Outline
	E.db.actionbar.bar5.macroFontSize = 9
	E.db.actionbar.bar5.macrotext = true
	E.db.actionbar.bar5.macroTextPosition = 'BOTTOM'
	E.db.actionbar.bar5.macroTextYOffset = 1
	E.db.actionbar.bar5.mouseover = true
	E.db.actionbar.bar5.professionQuality.enable = false
	E.db.actionbar.bar6.buttons = 12
	E.db.actionbar.bar6.buttonSize = 26
	E.db.actionbar.bar6.buttonSpacing = 1
	E.db.actionbar.bar6.buttonsPerRow = 12
	E.db.actionbar.bar6.countFont = Private.Font
	E.db.actionbar.bar6.countFontOutline = Private.Outline
	E.db.actionbar.bar6.countFontSize = 9
	E.db.actionbar.bar6.countTextPosition = 'BOTTOM'
	E.db.actionbar.bar6.enabled = false
	E.db.actionbar.bar6.hotkeyFont = Private.Font
	E.db.actionbar.bar6.hotkeyFontOutline = Private.Outline
	E.db.actionbar.bar6.hotkeyFontSize = 9
	E.db.actionbar.bar6.hotkeyTextPosition = 'TOP'
	E.db.actionbar.bar6.hotkeyTextYOffset = -1
	E.db.actionbar.bar6.macroFont = Private.Font
	E.db.actionbar.bar6.macroFontOutline = Private.Outline
	E.db.actionbar.bar6.macroFontSize = 9
	E.db.actionbar.bar6.macrotext = true
	E.db.actionbar.bar6.macroTextPosition = 'BOTTOM'
	E.db.actionbar.bar6.macroTextYOffset = 1
	E.db.actionbar.bar6.professionQuality.enable = false
	E.db.actionbar.bar7.buttonSize = 26
	E.db.actionbar.bar7.buttonSpacing = 1
	E.db.actionbar.bar7.countFont = Private.Font
	E.db.actionbar.bar7.countFontOutline = Private.Outline
	E.db.actionbar.bar7.countFontSize = 9
	E.db.actionbar.bar7.countTextPosition = 'BOTTOM'
	E.db.actionbar.bar7.hotkeyFont = Private.Font
	E.db.actionbar.bar7.hotkeyFontOutline = Private.Outline
	E.db.actionbar.bar7.hotkeyFontSize = 9
	E.db.actionbar.bar7.hotkeyTextPosition = 'TOP'
	E.db.actionbar.bar7.hotkeyTextYOffset = -1
	E.db.actionbar.bar7.macroFont = Private.Font
	E.db.actionbar.bar7.macroFontOutline = Private.Outline
	E.db.actionbar.bar7.macroFontSize = 9
	E.db.actionbar.bar7.macrotext = true
	E.db.actionbar.bar7.macroTextPosition = 'BOTTOM'
	E.db.actionbar.bar7.macroTextYOffset = 1
	E.db.actionbar.bar7.professionQuality.enable = false
	E.db.actionbar.bar8.buttonSize = 26
	E.db.actionbar.bar8.buttonSpacing = 1
	E.db.actionbar.bar8.countFont = Private.Font
	E.db.actionbar.bar8.countFontOutline = Private.Outline
	E.db.actionbar.bar8.countFontSize = 9
	E.db.actionbar.bar8.countTextPosition = 'BOTTOM'
	E.db.actionbar.bar8.hotkeyFont = Private.Font
	E.db.actionbar.bar8.hotkeyFontOutline = Private.Outline
	E.db.actionbar.bar8.hotkeyFontSize = 9
	E.db.actionbar.bar8.hotkeyTextPosition = 'TOP'
	E.db.actionbar.bar8.hotkeyTextYOffset = -1
	E.db.actionbar.bar8.macroFont = Private.Font
	E.db.actionbar.bar8.macroFontOutline = Private.Outline
	E.db.actionbar.bar8.macroFontSize = 9
	E.db.actionbar.bar8.macrotext = true
	E.db.actionbar.bar8.macroTextPosition = 'BOTTOM'
	E.db.actionbar.bar8.macroTextYOffset = 1
	E.db.actionbar.bar8.professionQuality.enable = false
	E.db.actionbar.bar9.buttonSize = 26
	E.db.actionbar.bar9.buttonSpacing = 1
	E.db.actionbar.bar9.countFont = Private.Font
	E.db.actionbar.bar9.countFontOutline = Private.Outline
	E.db.actionbar.bar9.countFontSize = 9
	E.db.actionbar.bar9.countTextPosition = 'BOTTOM'
	E.db.actionbar.bar9.hotkeyFont = Private.Font
	E.db.actionbar.bar9.hotkeyFontOutline = Private.Outline
	E.db.actionbar.bar9.hotkeyFontSize = 9
	E.db.actionbar.bar9.hotkeyTextPosition = 'TOP'
	E.db.actionbar.bar9.hotkeyTextYOffset = -1
	E.db.actionbar.bar9.macroFont = Private.Font
	E.db.actionbar.bar9.macroFontOutline = Private.Outline
	E.db.actionbar.bar9.macroFontSize = 9
	E.db.actionbar.bar9.macrotext = true
	E.db.actionbar.bar9.macroTextPosition = 'BOTTOM'
	E.db.actionbar.bar9.macroTextYOffset = 1
	E.db.actionbar.bar9.professionQuality.enable = false
	E.db.actionbar.bar10.buttonSize = 26
	E.db.actionbar.bar10.buttonSpacing = 1
	E.db.actionbar.bar10.countFont = Private.Font
	E.db.actionbar.bar10.countFontOutline = Private.Outline
	E.db.actionbar.bar10.countFontSize = 9
	E.db.actionbar.bar10.countTextPosition = 'BOTTOM'
	E.db.actionbar.bar10.hotkeyFont = Private.Font
	E.db.actionbar.bar10.hotkeyFontOutline = Private.Outline
	E.db.actionbar.bar10.hotkeyFontSize = 9
	E.db.actionbar.bar10.hotkeyTextPosition = 'TOP'
	E.db.actionbar.bar10.hotkeyTextYOffset = -1
	E.db.actionbar.bar10.macroFont = Private.Font
	E.db.actionbar.bar10.macroFontOutline = Private.Outline
	E.db.actionbar.bar10.macroFontSize = 9
	E.db.actionbar.bar10.macrotext = true
	E.db.actionbar.bar10.macroTextPosition = 'BOTTOM'
	E.db.actionbar.bar10.macroTextYOffset = 1
	E.db.actionbar.bar10.professionQuality.enable = false
	E.db.actionbar.bar13.buttonSize = 26
	E.db.actionbar.bar13.buttonSpacing = 1
	E.db.actionbar.bar13.countFont = Private.Font
	E.db.actionbar.bar13.countFontOutline = Private.Outline
	E.db.actionbar.bar13.countFontSize = 9
	E.db.actionbar.bar13.countTextPosition = 'BOTTOM'
	E.db.actionbar.bar13.hotkeyFont = Private.Font
	E.db.actionbar.bar13.hotkeyFontOutline = Private.Outline
	E.db.actionbar.bar13.hotkeyFontSize = 9
	E.db.actionbar.bar13.hotkeyTextPosition = 'TOP'
	E.db.actionbar.bar13.hotkeyTextYOffset = -1
	E.db.actionbar.bar13.macroFont = Private.Font
	E.db.actionbar.bar13.macroFontOutline = Private.Outline
	E.db.actionbar.bar13.macroFontSize = 9
	E.db.actionbar.bar13.macrotext = true
	E.db.actionbar.bar13.macroTextPosition = 'BOTTOM'
	E.db.actionbar.bar13.macroTextYOffset = 1
	E.db.actionbar.bar13.professionQuality.enable = false
	E.db.actionbar.bar14.buttonSize = 26
	E.db.actionbar.bar14.buttonSpacing = 1
	E.db.actionbar.bar14.countFont = Private.Font
	E.db.actionbar.bar14.countFontOutline = Private.Outline
	E.db.actionbar.bar14.countFontSize = 9
	E.db.actionbar.bar14.countTextPosition = 'BOTTOM'
	E.db.actionbar.bar14.hotkeyFont = Private.Font
	E.db.actionbar.bar14.hotkeyFontOutline = Private.Outline
	E.db.actionbar.bar14.hotkeyFontSize = 9
	E.db.actionbar.bar14.hotkeyTextPosition = 'TOP'
	E.db.actionbar.bar14.hotkeyTextYOffset = -1
	E.db.actionbar.bar14.macroFont = Private.Font
	E.db.actionbar.bar14.macroFontOutline = Private.Outline
	E.db.actionbar.bar14.macroFontSize = 9
	E.db.actionbar.bar14.macrotext = true
	E.db.actionbar.bar14.macroTextPosition = 'BOTTOM'
	E.db.actionbar.bar14.macroTextYOffset = 1
	E.db.actionbar.bar14.professionQuality.enable = false
	E.db.actionbar.bar15.buttonSize = 26
	E.db.actionbar.bar15.buttonSpacing = 1
	E.db.actionbar.bar15.countFont = Private.Font
	E.db.actionbar.bar15.countFontOutline = Private.Outline
	E.db.actionbar.bar15.countFontSize = 9
	E.db.actionbar.bar15.countTextPosition = 'BOTTOM'
	E.db.actionbar.bar15.hotkeyFont = Private.Font
	E.db.actionbar.bar15.hotkeyFontOutline = Private.Outline
	E.db.actionbar.bar15.hotkeyFontSize = 9
	E.db.actionbar.bar15.hotkeyTextPosition = 'TOP'
	E.db.actionbar.bar15.hotkeyTextYOffset = -1
	E.db.actionbar.bar15.macroFont = Private.Font
	E.db.actionbar.bar15.macroFontOutline = Private.Outline
	E.db.actionbar.bar15.macroFontSize = 9
	E.db.actionbar.bar15.macrotext = true
	E.db.actionbar.bar15.macroTextPosition = 'BOTTOM'
	E.db.actionbar.bar15.macroTextYOffset = 1
	E.db.actionbar.bar15.professionQuality.enable = false

	E.db.actionbar.barPet.backdrop = false
	E.db.actionbar.barPet.buttonSize = 26
	E.db.actionbar.barPet.buttonSpacing = 1
	E.db.actionbar.barPet.buttonsPerRow = 10
	E.db.actionbar.barPet.countFont = Private.Font
	E.db.actionbar.barPet.countFontOutline = Private.Outline
	E.db.actionbar.barPet.countFontSize = 9
	E.db.actionbar.barPet.hotkeyFont = Private.Font
	E.db.actionbar.barPet.hotkeyFontOutline = Private.Outline
	E.db.actionbar.barPet.hotkeyFontSize = 9
	E.db.actionbar.barPet.hotkeyTextPosition = 'TOP'
	E.db.actionbar.barPet.hotkeyTextYOffset = -1
	E.db.actionbar.barPet.point = 'TOPLEFT'
	E.db.actionbar.cooldown.override = false
	E.db.actionbar.countTextPosition = 'BOTTOM'
	E.db.actionbar.countTextYOffset = 1
	E.db.actionbar.extraActionButton.clean = true
	E.db.actionbar.extraActionButton.hotkeyFont = Private.Font
	E.db.actionbar.extraActionButton.hotkeyFontOutline = Private.Outline
	E.db.actionbar.extraActionButton.hotkeyFontSize = 9
	E.db.actionbar.extraActionButton.hotkeyTextPosition = 'TOP'
	E.db.actionbar.extraActionButton.hotkeyTextYOffset = -1
	E.db.actionbar.flyoutSize = 26
	E.db.actionbar.font = Private.Font
	E.db.actionbar.fontOutline = Private.Outline
	E.db.actionbar.fontSize = 9
	E.db.actionbar.hotkeyTextPosition = 'TOP'
	E.db.actionbar.macroTextPosition = 'BOTTOM'
	E.db.actionbar.microbar.buttonHeight = 26
	E.db.actionbar.microbar.buttonSize = 18
	E.db.actionbar.microbar.buttonSpacing = 1
	E.db.actionbar.microbar.enabled = true
	E.db.actionbar.microbar.mouseover = true
	E.db.actionbar.microbar.useIcons = false
	E.db.actionbar.stanceBar.buttonHeight = 24
	E.db.actionbar.stanceBar.buttonSize = 26
	E.db.actionbar.stanceBar.buttonSpacing = 1
	E.db.actionbar.stanceBar.hotkeyFont = Private.Font
	E.db.actionbar.stanceBar.hotkeyFontOutline = Private.Outline
	E.db.actionbar.stanceBar.hotkeyFontSize = 9
	E.db.actionbar.stanceBar.hotkeyTextPosition = 'TOPLEFT'
	E.db.actionbar.stanceBar.hotkeyTextYOffset = -1
	E.db.actionbar.stanceBar.mouseover = true
	E.db.actionbar.stanceBar.style = 'classic'
	E.db.actionbar.transparent = true
	E.db.actionbar.vehicleExitButton.hotkeyFont = Private.Font
	E.db.actionbar.vehicleExitButton.hotkeyFontOutline = Private.Outline
	E.db.actionbar.vehicleExitButton.hotkeyFontSize = 9
	E.db.actionbar.vehicleExitButton.hotkeyTextPosition = 'TOP'
	E.db.actionbar.vehicleExitButton.hotkeyTextYOffset = -1
	E.db.actionbar.zoneActionButton.clean = true

	-- Bags
	E.db.bags.autoToggle.guildBank = true
	E.db.bags.autoToggle.soulBind = false
	E.db.bags.bagBar.backdropSpacing = 1
	E.db.bags.bagBar.size = 23
	E.db.bags.bagBar.spacing = 0
	E.db.bags.bagSize = 30
	E.db.bags.bagWidth = 414
	E.db.bags.bankSize = 30
	E.db.bags.bankWidth = 414
	E.db.bags.clearSearchOnClose = true
	E.db.bags.countFont = Private.Font
	E.db.bags.countFontOutline = Private.Outline
	E.db.bags.countFontSize = 11
	E.db.bags.itemInfoFont = Private.Font
	E.db.bags.itemInfoFontOutline = Private.Outline
	E.db.bags.itemInfoFontSize = 11
	E.db.bags.itemLevelFont = Private.Font
	E.db.bags.itemLevelFontOutline = Private.Outline
	E.db.bags.itemLevelFontSize = 11
	E.db.bags.moneyFormat = 'FULL'
	E.db.bags.transparent = true
	E.db.bags.upgradeIcon = false
	E.db.bags.vendorGrays.enable = true
	E.db.bags.vendorGrays.interval = 0.1

	if E.Retail then
		E.db.bags.specialtyColors = false
		E.db.bags.split.bag5 = true
		E.db.bags.split.bagSpacing = 1
		E.db.bags.split.player = true
	end

	-- Auras
	E.db.auras.buffs.countFont = Private.Font
	E.db.auras.buffs.countFontOutline = Private.Outline
	E.db.auras.buffs.countFontSize = 12
	E.db.auras.buffs.countXOffset = 1
	E.db.auras.buffs.countYOffset = 2
	E.db.auras.buffs.fadeThreshold = -1
	E.db.auras.buffs.horizontalSpacing = 1
	E.db.auras.buffs.seperateOwn = 0
	E.db.auras.buffs.size = 22
	E.db.auras.buffs.timeFont = Private.Font
	E.db.auras.buffs.timeFontOutline = Private.Outline
	E.db.auras.buffs.timeXOffset = 1
	E.db.auras.buffs.verticalSpacing = 14
	E.db.auras.debuffs.countFont = Private.Font
	E.db.auras.debuffs.countFontOutline = Private.Outline
	E.db.auras.debuffs.countFontSize = 12
	E.db.auras.debuffs.countXOffset = 1
	E.db.auras.debuffs.countYOffset = 2
	E.db.auras.debuffs.fadeThreshold = -1
	E.db.auras.debuffs.horizontalSpacing = 1
	E.db.auras.debuffs.maxWraps = 2
	E.db.auras.debuffs.seperateOwn = 0
	E.db.auras.debuffs.size = 22
	E.db.auras.debuffs.timeFont = Private.Font
	E.db.auras.debuffs.timeFontOutline = Private.Outline
	E.db.auras.debuffs.timeXOffset = 1
	E.db.auras.debuffs.verticalSpacing = 14

	-- Chat
	E.db.chat.customTimeColor.b = 1
	E.db.chat.customTimeColor.g = 1
	E.db.chat.customTimeColor.r = 1
	E.db.chat.desaturateVoiceIcons = false
	E.db.chat.editboxHistorySize = 5
	E.db.chat.editBoxPosition = 'ABOVE_CHAT_INSIDE'
	E.db.chat.enableCombatRepeat = false
	E.db.chat.fade = false
	E.db.chat.fadeTabsNoBackdrop = false
	E.db.chat.font = Private.Font
	E.db.chat.fontOutline = Private.Outline
	E.db.chat.hideChatToggles = true
	E.db.chat.historySize = 200
	E.db.chat.lfgIcons = false
	E.db.chat.maxLines = 500
	E.db.chat.numScrollMessages = 2
	E.db.chat.panelColor.a = 0.9
	E.db.chat.panelColor.b = 0.05
	E.db.chat.panelColor.g = 0.05
	E.db.chat.panelColor.r = 0.05
	E.db.chat.panelHeight = 138
	E.db.chat.panelWidth = 414
	E.db.chat.showHistory.CHANNEL = false
	E.db.chat.showHistory.EMOTE = false
	E.db.chat.showHistory.GUILD = false
	E.db.chat.showHistory.INSTANCE = false
	E.db.chat.showHistory.PARTY = false
	E.db.chat.showHistory.RAID = false
	E.db.chat.showHistory.SAY = false
	E.db.chat.showHistory.YELL = false
	E.db.chat.tabFont = Private.Font
	E.db.chat.tabFontOutline = Private.Outline
	E.db.chat.tabFontSize = 10
	E.db.chat.tabSelector = 'NONE'
	E.db.chat.throttleInterval = 0
	E.db.chat.timeStampFormat = '%H:%M '
	E.db.chat.timeStampLocalTime = true
	E.db.chat.useBTagName = true

	-- Cooldown Text
	E.db.cooldown.checkSeconds = true
	E.db.cooldown.daysIndicator.b = 0.8
	E.db.cooldown.daysIndicator.g = 0.8
	E.db.cooldown.daysIndicator.r = 0.8
	E.db.cooldown.expireIndicator.b = 0.8
	E.db.cooldown.expireIndicator.g = 0.8
	E.db.cooldown.expireIndicator.r = 0.8
	E.db.cooldown.fonts.font = Private.Font
	E.db.cooldown.fonts.fontSize = 16
	E.db.cooldown.hhmmColor.b = 1
	E.db.cooldown.hhmmColor.g = 1
	E.db.cooldown.hhmmColor.r = 0.4
	E.db.cooldown.hoursIndicator.b = 0.8
	E.db.cooldown.hoursIndicator.g = 0.8
	E.db.cooldown.hoursIndicator.r = 0.8
	E.db.cooldown.minutesIndicator.b = 0.8
	E.db.cooldown.minutesIndicator.g = 0.8
	E.db.cooldown.minutesIndicator.r = 0.8
	E.db.cooldown.mmssColor.b = 1
	E.db.cooldown.mmssColor.g = 1
	E.db.cooldown.mmssColor.r = 1
	E.db.cooldown.mmssThreshold = 120
	E.db.cooldown.secondsColor.b = 1
	E.db.cooldown.secondsIndicator.b = 0.8
	E.db.cooldown.secondsIndicator.g = 0.8
	E.db.cooldown.secondsIndicator.r = 0.8
	E.db.cooldown.targetAura = false
	E.db.cooldown.threshold = 4

	if E.Retail then
		E.db.cooldown.showModRate = true
	end

	-- DataBars
	E.db.databars.azerite.enable = false
	E.db.databars.experience.font = Private.Font
	E.db.databars.experience.height = 138
	E.db.databars.experience.orientation = 'VERTICAL'
	E.db.databars.experience.questCompletedOnly = true
	E.db.databars.experience.showBubbles = true
	E.db.databars.experience.width = 10
	E.db.databars.honor.enable = false
	E.db.databars.petExperience.enable = false
	E.db.databars.reputation.enable = true
	E.db.databars.reputation.font = Private.Font
	E.db.databars.reputation.height = 138
	E.db.databars.reputation.orientation = 'VERTICAL'
	E.db.databars.reputation.width = 10
	E.db.databars.threat.enable = false

	-- DataTexts default
	E.db.datatexts.battlePanel.LeftChatDataPanel[1] = ''
	E.db.datatexts.battlePanel.LeftChatDataPanel[2] = ''
	E.db.datatexts.battlePanel.LeftChatDataPanel[3] = ''
	E.db.datatexts.battlePanel.RightChatDataPanel[1] = ''
	E.db.datatexts.battlePanel.RightChatDataPanel[2] = ''
	E.db.datatexts.battlePanel.RightChatDataPanel[3] = ''
	E.db.datatexts.font = Private.Font
	E.db.datatexts.fontOutline = Private.Outline
	E.db.datatexts.fontSize = 11
	E.db.datatexts.panels.LeftChatDataPanel.battleground = false
	E.db.datatexts.panels.LeftChatDataPanel.enable = false
	E.db.datatexts.panels.LeftChatDataPanel.panelTransparency = true
	E.db.datatexts.panels.LeftChatDataPanel[1] = ''
	E.db.datatexts.panels.LeftChatDataPanel[2] = ''
	E.db.datatexts.panels.LeftChatDataPanel[3] = ''
	E.db.datatexts.panels.MinimapPanel.enable = false
	E.db.datatexts.panels.MinimapPanel.panelTransparency = true
	E.db.datatexts.panels.MinimapPanel[1] = ''
	E.db.datatexts.panels.MinimapPanel[2] = ''
	E.db.datatexts.panels.RightChatDataPanel.battleground = false
	E.db.datatexts.panels.RightChatDataPanel.enable = false
	E.db.datatexts.panels.RightChatDataPanel.panelTransparency = true
	E.db.datatexts.panels.RightChatDataPanel[1] = ''
	E.db.datatexts.panels.RightChatDataPanel[2] = ''
	E.db.datatexts.panels.RightChatDataPanel[3] = ''

	-- Tooltip
	E.db.tooltip.alwaysShowRealm = true
	E.db.tooltip.colorAlpha = 0.9
	E.db.tooltip.font = Private.Font
	E.db.tooltip.fontOutline = Private.Outline
	E.db.tooltip.headerFont = Private.Font
	E.db.tooltip.headerFontOutline = Private.Outline
	E.db.tooltip.headerFontSize = 11
	E.db.tooltip.healthBar.font = Private.Font
	E.db.tooltip.healthBar.fontOutline = Private.Outline
	E.db.tooltip.healthBar.fontSize = 11
	E.db.tooltip.healthBar.height = 2
	E.db.tooltip.healthBar.statusPosition = 'TOP'
	E.db.tooltip.inspectDataEnable = false
	E.db.tooltip.itemCount = 'NONE'
	E.db.tooltip.itemQuality = true
	E.db.tooltip.mythicDataEnable = false
	E.db.tooltip.role = false
	E.db.tooltip.showElvUIUsers = true
	E.db.tooltip.smallTextFontSize = 11
	E.db.tooltip.textFontSize = 11

	-- Shared UnitFrames media
	E.db.unitframe.colors.castbar_backdrop.b = 0.05
	E.db.unitframe.colors.castbar_backdrop.g = 0.05
	E.db.unitframe.colors.castbar_backdrop.r = 0.05
	E.db.unitframe.colors.castColor.b = 0
	E.db.unitframe.colors.castColor.g = 1
	E.db.unitframe.colors.castColor.r = 0.02
	E.db.unitframe.colors.castNoInterrupt.b = 0
	E.db.unitframe.colors.castNoInterrupt.g = 0
	E.db.unitframe.colors.castNoInterrupt.r = 1
	E.db.unitframe.colors.colorhealthbyvalue = false
	E.db.unitframe.colors.customcastbarbackdrop = true
	E.db.unitframe.colors.customhealthbackdrop = true
	E.db.unitframe.colors.frameGlow.mouseoverGlow.texture = Private.Texture
	E.db.unitframe.colors.healPrediction.overabsorbs.b = 1
	E.db.unitframe.colors.healPrediction.overabsorbs.r = 0
	E.db.unitframe.colors.health_backdrop_dead.b = 0.14
	E.db.unitframe.colors.health_backdrop_dead.g = 0.20
	E.db.unitframe.colors.health_backdrop_dead.r = 1
	E.db.unitframe.colors.health_backdrop.b = 0.61
	E.db.unitframe.colors.health_backdrop.g = 0.56
	E.db.unitframe.colors.health_backdrop.r = 0.54
	E.db.unitframe.colors.health.b = 0.05
	E.db.unitframe.colors.health.g = 0.05
	E.db.unitframe.colors.health.r = 0.05
	E.db.unitframe.colors.healthMultiplier = 0.75
	E.db.unitframe.colors.power.MANA.b = 0.97
	E.db.unitframe.colors.power.MANA.g = 1
	E.db.unitframe.colors.power.MANA.r = 0
	E.db.unitframe.colors.tapped.g = 0.56
	E.db.unitframe.colors.tapped.r = 0.54
	E.db.unitframe.colors.transparentHealth = true
	E.db.unitframe.colors.useDeadBackdrop = true
	E.db.unitframe.cooldown.fonts.font = Private.Font
	E.db.unitframe.cooldown.override = false
	E.db.unitframe.font = Private.Font
	E.db.unitframe.fontOutline = Private.Outline
	E.db.unitframe.fontSize = 11
	E.db.unitframe.statusbar = Private.Texture

	-- Shared MA/MT
	E.db.unitframe.units.assist.enable = false
	E.db.unitframe.units.tank.enable = false

	-- Shared Arena
	E.db.unitframe.units.arena.customTexts = {}
	E.db.unitframe.units.arena.customTexts.Luckyone_Power = { attachTextTo = 'Frame', enable = true, font = Private.Font, fontOutline = Private.Outline, justifyH = 'RIGHT', size = 12, text_format = '[powercolor][perpp<%]', xOffset = -1, yOffset = 0 }

	E.db.unitframe.units.arena.buffs.anchorPoint = 'RIGHT'
	E.db.unitframe.units.arena.buffs.countFont = Private.Font
	E.db.unitframe.units.arena.buffs.countFontSize = 10
	E.db.unitframe.units.arena.buffs.countXOffset = 1
	E.db.unitframe.units.arena.buffs.growthY = 'DOWN'
	E.db.unitframe.units.arena.buffs.maxDuration = 0
	E.db.unitframe.units.arena.buffs.perrow = 2
	E.db.unitframe.units.arena.buffs.priority = 'Blacklist,Whitelist,Dispellable,RaidBuffsElvUI'
	E.db.unitframe.units.arena.buffs.sizeOverride = 32
	E.db.unitframe.units.arena.buffs.xOffset = 1
	E.db.unitframe.units.arena.buffs.yOffset = 1
	E.db.unitframe.units.arena.castbar.customTextFont.enable = true
	E.db.unitframe.units.arena.castbar.customTextFont.font = Private.Font
	E.db.unitframe.units.arena.castbar.customTextFont.fontSize = 9
	E.db.unitframe.units.arena.castbar.customTimeFont.enable = true
	E.db.unitframe.units.arena.castbar.customTimeFont.font = Private.Font
	E.db.unitframe.units.arena.castbar.customTimeFont.fontSize = 9
	E.db.unitframe.units.arena.castbar.height = 14
	E.db.unitframe.units.arena.castbar.iconAttachedTo = 'Castbar'
	E.db.unitframe.units.arena.castbar.spark = false
	E.db.unitframe.units.arena.castbar.textColor.b = 1
	E.db.unitframe.units.arena.castbar.textColor.g = 1
	E.db.unitframe.units.arena.castbar.textColor.r = 1
	E.db.unitframe.units.arena.castbar.width = 191
	E.db.unitframe.units.arena.castbar.xOffsetText = 2
	E.db.unitframe.units.arena.castbar.xOffsetTime = -2
	E.db.unitframe.units.arena.debuffs.countFont = Private.Font
	E.db.unitframe.units.arena.debuffs.countFontSize = 10
	E.db.unitframe.units.arena.debuffs.countXOffset = 1
	E.db.unitframe.units.arena.debuffs.desaturate = true
	E.db.unitframe.units.arena.debuffs.growthX = 'LEFT'
	E.db.unitframe.units.arena.debuffs.growthY = 'DOWN'
	E.db.unitframe.units.arena.debuffs.maxDuration = 0
	E.db.unitframe.units.arena.debuffs.priority = 'Blacklist,Whitelist,Personal,CCDebuffs'
	E.db.unitframe.units.arena.debuffs.sizeOverride = 32
	E.db.unitframe.units.arena.debuffs.xOffset = -34
	E.db.unitframe.units.arena.debuffs.yOffset = 1
	E.db.unitframe.units.arena.disableTargetGlow = true
	E.db.unitframe.units.arena.fader.minAlpha = 0.5
	E.db.unitframe.units.arena.fader.smooth = 0
	E.db.unitframe.units.arena.healPrediction.enable = false
	E.db.unitframe.units.arena.health.attachTextTo = 'Frame'
	E.db.unitframe.units.arena.health.text_format = '[luckyone:health:percent]'
	E.db.unitframe.units.arena.height = 32
	E.db.unitframe.units.arena.infoPanel.height = 16
	E.db.unitframe.units.arena.name.attachTextTo = 'Frame'
	E.db.unitframe.units.arena.name.text_format = '[classcolor][name:last]'
	E.db.unitframe.units.arena.power.enable = false
	E.db.unitframe.units.arena.pvpclassificationindicator.size = 24
	E.db.unitframe.units.arena.pvpclassificationindicator.xOffset = -40
	E.db.unitframe.units.arena.pvpSpecIcon = false
	E.db.unitframe.units.arena.pvpTrinket.position = 'LEFT'
	E.db.unitframe.units.arena.pvpTrinket.size = 32
	E.db.unitframe.units.arena.pvpTrinket.xOffset = -1
	E.db.unitframe.units.arena.spacing = 16
	E.db.unitframe.units.arena.width = 190

	-- Shared Focus
	E.db.unitframe.units.focus.customTexts = {}
	E.db.unitframe.units.focus.customTexts.Luckyone_HP = { attachTextTo = 'Frame', enable = true, font = Private.Font, fontOutline = Private.Outline, justifyH = 'LEFT', size = 14, text_format = '[luckyone:health:percent] • [health:current:shortvalue]', xOffset = 3, yOffset = 0 }
	E.db.unitframe.units.focus.customTexts.Luckyone_Name = { attachTextTo = 'Frame', enable = true, font = Private.Font, fontOutline = Private.Outline, justifyH = 'RIGHT', size = 14, text_format = '[classcolor][name:last]', xOffset = -3, yOffset = 0 }

	E.db.unitframe.units.focus.buffs.anchorPoint = 'TOPRIGHT'
	E.db.unitframe.units.focus.buffs.countFont = Private.Font
	E.db.unitframe.units.focus.buffs.countPosition = 'TOP'
	E.db.unitframe.units.focus.buffs.countYOffset = 14
	E.db.unitframe.units.focus.buffs.enable = true
	E.db.unitframe.units.focus.buffs.growthX = 'LEFT'
	E.db.unitframe.units.focus.buffs.maxDuration = 0
	E.db.unitframe.units.focus.buffs.perrow = 10
	E.db.unitframe.units.focus.buffs.priority = 'Blacklist,Whitelist,Dispellable,RaidBuffsElvUI'
	E.db.unitframe.units.focus.castbar.customTextFont.enable = true
	E.db.unitframe.units.focus.castbar.customTextFont.font = Private.Font
	E.db.unitframe.units.focus.castbar.customTextFont.fontSize = 11
	E.db.unitframe.units.focus.castbar.customTimeFont.enable = true
	E.db.unitframe.units.focus.castbar.customTimeFont.font = Private.Font
	E.db.unitframe.units.focus.castbar.customTimeFont.fontSize = 11
	E.db.unitframe.units.focus.castbar.spark = false
	E.db.unitframe.units.focus.castbar.textColor.b = 1
	E.db.unitframe.units.focus.castbar.textColor.g = 1
	E.db.unitframe.units.focus.castbar.textColor.r = 1
	E.db.unitframe.units.focus.castbar.timeToHold = 2
	E.db.unitframe.units.focus.castbar.width = 241
	E.db.unitframe.units.focus.castbar.xOffsetText = 2
	E.db.unitframe.units.focus.castbar.xOffsetTime = -2
	E.db.unitframe.units.focus.CombatIcon.enable = false
	E.db.unitframe.units.focus.debuffs.anchorPoint = 'TOPLEFT'
	E.db.unitframe.units.focus.debuffs.countFont = Private.Font
	E.db.unitframe.units.focus.debuffs.countPosition = 'TOP'
	E.db.unitframe.units.focus.debuffs.countYOffset = 14
	E.db.unitframe.units.focus.debuffs.desaturate = false
	E.db.unitframe.units.focus.debuffs.growthX = 'RIGHT'
	E.db.unitframe.units.focus.debuffs.maxDuration = 0
	E.db.unitframe.units.focus.debuffs.perrow = 10
	E.db.unitframe.units.focus.debuffs.priority = 'Blacklist,Whitelist,Personal,CCDebuffs'
	E.db.unitframe.units.focus.disableMouseoverGlow = true
	E.db.unitframe.units.focus.disableTargetGlow = true
	E.db.unitframe.units.focus.fader.minAlpha = 0.5
	E.db.unitframe.units.focus.fader.smooth = 0
	E.db.unitframe.units.focus.healPrediction.absorbStyle = 'WRAPPED'
	E.db.unitframe.units.focus.height = 40
	E.db.unitframe.units.focus.name.text_format = ''
	E.db.unitframe.units.focus.orientation = 'LEFT'
	E.db.unitframe.units.focus.power.enable = false
	E.db.unitframe.units.focus.raidicon.attachTo = 'CENTER'
	E.db.unitframe.units.focus.raidicon.enable = true
	E.db.unitframe.units.focus.raidicon.yOffset = 0
	E.db.unitframe.units.focus.threatStyle = 'NONE'
	E.db.unitframe.units.focus.width = 240
	E.db.unitframe.units.focustarget.enable = false

	-- Shared Boss
	E.db.unitframe.units.boss.customTexts = {}
	E.db.unitframe.units.boss.customTexts.Luckyone_Power = { attachTextTo = 'Frame', enable = true, font = Private.Font, fontOutline = Private.Outline, justifyH = 'RIGHT', size = 12, text_format = '[powercolor][perpp<%]', xOffset = -1, yOffset = 0 }

	E.db.unitframe.units.boss.buffIndicator.enable = false
	E.db.unitframe.units.boss.buffs.anchorPoint = 'RIGHT'
	E.db.unitframe.units.boss.buffs.countFont = Private.Font
	E.db.unitframe.units.boss.buffs.countFontSize = 10
	E.db.unitframe.units.boss.buffs.countXOffset = 1
	E.db.unitframe.units.boss.buffs.growthY = 'DOWN'
	E.db.unitframe.units.boss.buffs.perrow = 2
	E.db.unitframe.units.boss.buffs.priority = 'Blacklist,Whitelist,Dispellable,RaidBuffsElvUI'
	E.db.unitframe.units.boss.buffs.sizeOverride = 32
	E.db.unitframe.units.boss.buffs.xOffset = 1
	E.db.unitframe.units.boss.buffs.yOffset = 1
	E.db.unitframe.units.boss.castbar.customTextFont.enable = true
	E.db.unitframe.units.boss.castbar.customTextFont.font = Private.Font
	E.db.unitframe.units.boss.castbar.customTextFont.fontSize = 9
	E.db.unitframe.units.boss.castbar.customTimeFont.enable = true
	E.db.unitframe.units.boss.castbar.customTimeFont.font = Private.Font
	E.db.unitframe.units.boss.castbar.customTimeFont.fontSize = 9
	E.db.unitframe.units.boss.castbar.height = 14
	E.db.unitframe.units.boss.castbar.iconAttachedTo = 'Castbar'
	E.db.unitframe.units.boss.castbar.spark = false
	E.db.unitframe.units.boss.castbar.textColor.b = 1
	E.db.unitframe.units.boss.castbar.textColor.g = 1
	E.db.unitframe.units.boss.castbar.textColor.r = 1
	E.db.unitframe.units.boss.castbar.width = 191
	E.db.unitframe.units.boss.castbar.xOffsetText = 2
	E.db.unitframe.units.boss.castbar.xOffsetTime = -2
	E.db.unitframe.units.boss.debuffs.countFont = Private.Font
	E.db.unitframe.units.boss.debuffs.countFontSize = 10
	E.db.unitframe.units.boss.debuffs.countXOffset = 1
	E.db.unitframe.units.boss.debuffs.growthX = 'LEFT'
	E.db.unitframe.units.boss.debuffs.growthY = 'DOWN'
	E.db.unitframe.units.boss.debuffs.priority = 'Blacklist,Whitelist,Personal,CCDebuffs'
	E.db.unitframe.units.boss.debuffs.sizeOverride = 32
	E.db.unitframe.units.boss.debuffs.xOffset = -1
	E.db.unitframe.units.boss.debuffs.yOffset = 1
	E.db.unitframe.units.boss.disableTargetGlow = true
	E.db.unitframe.units.boss.fader.minAlpha = 0.5
	E.db.unitframe.units.boss.fader.smooth = 0
	E.db.unitframe.units.boss.health.attachTextTo = 'Frame'
	E.db.unitframe.units.boss.health.text_format = '[luckyone:health:percent]'
	E.db.unitframe.units.boss.height = 32
	E.db.unitframe.units.boss.name.attachTextTo = 'Frame'
	E.db.unitframe.units.boss.name.text_format = '[classcolor][name:last]'
	E.db.unitframe.units.boss.power.enable = false
	E.db.unitframe.units.boss.raidicon.size = 10
	E.db.unitframe.units.boss.raidicon.yOffset = -1
	E.db.unitframe.units.boss.spacing = 16
	E.db.unitframe.units.boss.width = 190

	-- Shared Pet
	E.db.unitframe.units.pet.customTexts = {}
	E.db.unitframe.units.pet.customTexts.Luckyone_HP = { attachTextTo = 'Frame', enable = true, font = Private.Font, fontOutline = Private.Outline, justifyH = 'RIGHT', size = 12, text_format = '[health:current:shortvalue] • [luckyone:health:percent]', xOffset = -3, yOffset = 0 }
	E.db.unitframe.units.pet.customTexts.Luckyone_Name = { attachTextTo = 'Frame', enable = true, font = Private.Font, fontOutline = Private.Outline, justifyH = 'LEFT', size = 12, text_format = E.Classic and '[happiness:color][name][ >happiness:full]' or '[classcolor][name]', xOffset = 3, yOffset = 0 }

	E.db.unitframe.units.pet.buffs.enable = false
	E.db.unitframe.units.pet.castbar.enable = false
	E.db.unitframe.units.pet.debuffs.enable = false
	E.db.unitframe.units.pet.disableMouseoverGlow = true
	E.db.unitframe.units.pet.fader.minAlpha = 0.5
	E.db.unitframe.units.pet.fader.smooth = 0
	E.db.unitframe.units.pet.healPrediction.absorbStyle = 'WRAPPED'
	E.db.unitframe.units.pet.health.colorHappiness = false
	E.db.unitframe.units.pet.height = 20
	E.db.unitframe.units.pet.name.text_format = ''
	E.db.unitframe.units.pet.power.enable = false
	E.db.unitframe.units.pet.raidicon.enable = false
	E.db.unitframe.units.pet.threatStyle = 'NONE'
	E.db.unitframe.units.pet.width = 269

	-- Shared Player
	E.db.unitframe.units.player.customTexts = {}
	E.db.unitframe.units.player.customTexts.Luckyone_HP = { attachTextTo = 'Frame', enable = true, font = Private.Font, fontOutline = Private.Outline, justifyH = 'RIGHT', size = 14, text_format = '', xOffset = -2, yOffset = 0 }
	E.db.unitframe.units.player.customTexts.Luckyone_Name = { attachTextTo = 'Frame', enable = true, font = Private.Font, fontOutline = Private.Outline, justifyH = 'LEFT', size = 14, text_format = '[classcolor][name:short]', xOffset = 5, yOffset = 0 }

	E.db.unitframe.units.player.aurabar.enable = false
	E.db.unitframe.units.player.buffs.attachTo = 'FRAME'
	E.db.unitframe.units.player.buffs.countFont = Private.Font
	E.db.unitframe.units.player.buffs.perrow = 10
	E.db.unitframe.units.player.buffs.priority = 'Blacklist,Personal,nonPersonal'
	E.db.unitframe.units.player.buffs.yOffset = 1
	E.db.unitframe.units.player.castbar.customTextFont.enable = true
	E.db.unitframe.units.player.castbar.customTextFont.font = Private.Font
	E.db.unitframe.units.player.castbar.customTextFont.fontSize = 11
	E.db.unitframe.units.player.castbar.customTimeFont.enable = true
	E.db.unitframe.units.player.castbar.customTimeFont.font = Private.Font
	E.db.unitframe.units.player.castbar.customTimeFont.fontSize = 11
	E.db.unitframe.units.player.castbar.latency = false
	E.db.unitframe.units.player.castbar.spark = false
	E.db.unitframe.units.player.castbar.textColor.b = 1
	E.db.unitframe.units.player.castbar.textColor.g = 1
	E.db.unitframe.units.player.castbar.textColor.r = 1
	E.db.unitframe.units.player.castbar.tickColor.a = 0.90
	E.db.unitframe.units.player.castbar.tickColor.b = 0.05
	E.db.unitframe.units.player.castbar.tickColor.g = 0.05
	E.db.unitframe.units.player.castbar.tickColor.r = 0.05
	E.db.unitframe.units.player.castbar.timeToHold = 2
	E.db.unitframe.units.player.castbar.xOffsetText = 2
	E.db.unitframe.units.player.castbar.xOffsetTime = -2
	E.db.unitframe.units.player.classbar.enable = false
	E.db.unitframe.units.player.CombatIcon.enable = false
	E.db.unitframe.units.player.debuffs.anchorPoint = 'TOPRIGHT'
	E.db.unitframe.units.player.debuffs.countFont = Private.Font
	E.db.unitframe.units.player.debuffs.countPosition = 'TOP'
	E.db.unitframe.units.player.debuffs.countYOffset = 14
	E.db.unitframe.units.player.debuffs.desaturate = false
	E.db.unitframe.units.player.debuffs.growthX = 'LEFT'
	E.db.unitframe.units.player.debuffs.perrow = 10
	E.db.unitframe.units.player.disableMouseoverGlow = true
	E.db.unitframe.units.player.healPrediction.absorbStyle = 'WRAPPED'
	E.db.unitframe.units.player.health.text_format = ''
	E.db.unitframe.units.player.height = 40
	E.db.unitframe.units.player.partyIndicator.enable = false
	E.db.unitframe.units.player.power.enable = false
	E.db.unitframe.units.player.power.height = 5
	E.db.unitframe.units.player.power.text_format = ''
	E.db.unitframe.units.player.power.width = 'inset'
	E.db.unitframe.units.player.pvp.text_format = ''
	E.db.unitframe.units.player.pvpIcon.scale = 0.85
	E.db.unitframe.units.player.raidicon.enable = false
	E.db.unitframe.units.player.raidRoleIcons.yOffset = 1
	E.db.unitframe.units.player.RestIcon.enable = false
	E.db.unitframe.units.player.threatStyle = 'NONE'
	E.db.unitframe.units.player.width = 240

	-- Shared Target
	E.db.unitframe.units.target.customTexts = {}
	E.db.unitframe.units.targettarget.customTexts = {}
	E.db.unitframe.units.target.customTexts.Luckyone_HP = { attachTextTo = 'Frame', enable = true, font = Private.Font, fontOutline = Private.Outline, justifyH = 'LEFT', size = 14, text_format = '[luckyone:health:percent] • [health:current:shortvalue]', xOffset = 3, yOffset = 0 }
	E.db.unitframe.units.target.customTexts.Luckyone_Name = { attachTextTo = 'Frame', enable = true, font = Private.Font, fontOutline = Private.Outline, justifyH = 'RIGHT', size = 14, text_format = E.Retail and '[classcolor][name:last]' or '[difficultycolor][level< - ]|r[classcolor][name:last]', xOffset = -3, yOffset = 0 }
	E.db.unitframe.units.targettarget.customTexts.Luckyone_Name = { attachTextTo = 'Frame', enable = true, font = Private.Font, fontOutline = Private.Outline, justifyH = 'CENTER', size = 12, text_format = '[classcolor][name:last]', xOffset = 0, yOffset = 0 }

	E.db.unitframe.units.target.aurabar.enable = false
	E.db.unitframe.units.target.buffs.countFont = Private.Font
	E.db.unitframe.units.target.buffs.countPosition = 'TOP'
	E.db.unitframe.units.target.buffs.countYOffset = 14
	E.db.unitframe.units.target.buffs.perrow = 10
	E.db.unitframe.units.target.buffs.priority = 'Blacklist,Dispellable,RaidBuffsElvUI,TurtleBuffs'
	E.db.unitframe.units.target.castbar.customTextFont.enable = true
	E.db.unitframe.units.target.castbar.customTextFont.font = Private.Font
	E.db.unitframe.units.target.castbar.customTextFont.fontSize = 11
	E.db.unitframe.units.target.castbar.customTimeFont.enable = true
	E.db.unitframe.units.target.castbar.customTimeFont.font = Private.Font
	E.db.unitframe.units.target.castbar.customTimeFont.fontSize = 11
	E.db.unitframe.units.target.castbar.spark = false
	E.db.unitframe.units.target.castbar.textColor.b = 1
	E.db.unitframe.units.target.castbar.textColor.g = 1
	E.db.unitframe.units.target.castbar.textColor.r = 1
	E.db.unitframe.units.target.castbar.timeToHold = 2
	E.db.unitframe.units.target.castbar.width = 241
	E.db.unitframe.units.target.castbar.xOffsetText = 2
	E.db.unitframe.units.target.castbar.xOffsetTime = -2
	E.db.unitframe.units.target.CombatIcon.enable = false
	E.db.unitframe.units.target.debuffs.anchorPoint = 'TOPLEFT'
	E.db.unitframe.units.target.debuffs.attachTo = 'FRAME'
	E.db.unitframe.units.target.debuffs.countFont = Private.Font
	E.db.unitframe.units.target.debuffs.countPosition = 'TOP'
	E.db.unitframe.units.target.debuffs.countYOffset = 14
	E.db.unitframe.units.target.debuffs.desaturate = false
	E.db.unitframe.units.target.debuffs.growthX = 'RIGHT'
	E.db.unitframe.units.target.debuffs.maxDuration = 0
	E.db.unitframe.units.target.debuffs.perrow = 10
	E.db.unitframe.units.target.debuffs.priority = 'Blacklist,Whitelist,Personal,CCDebuffs'
	E.db.unitframe.units.target.disableMouseoverGlow = true
	E.db.unitframe.units.target.fader.minAlpha = 0.5
	E.db.unitframe.units.target.fader.smooth = 0
	E.db.unitframe.units.target.healPrediction.absorbStyle = 'WRAPPED'
	E.db.unitframe.units.target.health.text_format = ''
	E.db.unitframe.units.target.height = 40
	E.db.unitframe.units.target.middleClickFocus = false
	E.db.unitframe.units.target.name.text_format = ''
	E.db.unitframe.units.target.orientation = 'LEFT'
	E.db.unitframe.units.target.phaseIndicator.scale = 0.5
	E.db.unitframe.units.target.power.enable = false
	E.db.unitframe.units.target.raidicon.attachTo = 'CENTER'
	E.db.unitframe.units.target.raidicon.enable = true
	E.db.unitframe.units.target.raidicon.yOffset = 0
	E.db.unitframe.units.target.raidRoleIcons.position = 'TOPRIGHT'
	E.db.unitframe.units.target.raidRoleIcons.yOffset = 1
	E.db.unitframe.units.target.threatStyle = 'NONE'
	E.db.unitframe.units.target.width = 240
	E.db.unitframe.units.targettarget.debuffs.enable = false
	E.db.unitframe.units.targettarget.disableMouseoverGlow = true
	E.db.unitframe.units.targettarget.fader.minAlpha = 0.5
	E.db.unitframe.units.targettarget.fader.smooth = 0
	E.db.unitframe.units.targettarget.height = 20
	E.db.unitframe.units.targettarget.name.text_format = ''
	E.db.unitframe.units.targettarget.power.enable = false
	E.db.unitframe.units.targettarget.raidicon.enable = false
	E.db.unitframe.units.targettarget.width = 278

	-- Shared Party
	E.db.unitframe.units.party.customTexts = {}
	E.db.unitframe.units.party.customTexts.Luckyone_Name = { attachTextTo = 'Health', enable = true, font = Private.Font, fontOutline = Private.Outline, justifyH = 'CENTER', size = 14, text_format = '', xOffset = 0, yOffset = 0 }

	E.db.unitframe.units.party.classbar.enable = false
	E.db.unitframe.units.party.CombatIcon.enable = false
	E.db.unitframe.units.party.debuffs.countFont = Private.Font
	E.db.unitframe.units.party.debuffs.countXOffset = 2
	E.db.unitframe.units.party.debuffs.enable = true
	E.db.unitframe.units.party.debuffs.maxDuration = 0
	E.db.unitframe.units.party.debuffs.perrow = 2
	E.db.unitframe.units.party.debuffs.priority = 'Blacklist,RaidDebuffs,Dispellable'
	E.db.unitframe.units.party.debuffs.xOffset = 1
	E.db.unitframe.units.party.debuffs.yOffset = -1
	E.db.unitframe.units.party.disableFocusGlow = true
	E.db.unitframe.units.party.disableTargetGlow = true
	E.db.unitframe.units.party.fader.minAlpha = 0.5
	E.db.unitframe.units.party.fader.smooth = 0
	E.db.unitframe.units.party.healPrediction.absorbStyle = 'WRAPPED'
	E.db.unitframe.units.party.healPrediction.enable = true
	E.db.unitframe.units.party.health.text_format = ''
	E.db.unitframe.units.party.horizontalSpacing = 1
	E.db.unitframe.units.party.name.text_format = ''
	E.db.unitframe.units.party.orientation = 'MIDDLE'
	E.db.unitframe.units.party.phaseIndicator.anchorPoint = 'LEFT'
	E.db.unitframe.units.party.phaseIndicator.scale = 0.5
	E.db.unitframe.units.party.phaseIndicator.xOffset = 15
	E.db.unitframe.units.party.power.enable = false
	E.db.unitframe.units.party.raidicon.attachTo = 'RIGHT'
	E.db.unitframe.units.party.raidicon.size = 14
	E.db.unitframe.units.party.raidicon.xOffset = -3
	E.db.unitframe.units.party.raidicon.yOffset = 0
	E.db.unitframe.units.party.raidRoleIcons.yOffset = 1
	E.db.unitframe.units.party.rdebuffs.enable = false
	E.db.unitframe.units.party.readycheckIcon.attachTo = 'Frame'
	E.db.unitframe.units.party.readycheckIcon.position = 'RIGHT'
	E.db.unitframe.units.party.readycheckIcon.xOffset = -2
	E.db.unitframe.units.party.readycheckIcon.yOffset = 0
	E.db.unitframe.units.party.roleIcon.enable = true
	E.db.unitframe.units.party.roleIcon.position = 'LEFT'
	E.db.unitframe.units.party.roleIcon.size = 11
	E.db.unitframe.units.party.roleIcon.xOffset = 0
	E.db.unitframe.units.party.showPlayer = false
	E.db.unitframe.units.party.summonIcon.attachTo = 'RIGHT'
	E.db.unitframe.units.party.summonIcon.size = 24
	E.db.unitframe.units.party.summonIcon.xOffset = -15
	E.db.unitframe.units.party.threatStyle = 'NONE'
	E.db.unitframe.units.party.verticalSpacing = 1

	-- Shared growth directions
	E.db.unitframe.units.party.growthDirection = 'DOWN_RIGHT'
	E.db.unitframe.units.raid1.growthDirection = 'RIGHT_DOWN'
	E.db.unitframe.units.raid2.growthDirection = 'RIGHT_DOWN'
	E.db.unitframe.units.raid3.growthDirection = 'RIGHT_DOWN'

	-- Shared Raid1
	E.db.unitframe.units.raid1.buffIndicator.countFont = Private.Font
	E.db.unitframe.units.raid1.buffIndicator.countFontSize = 10
	E.db.unitframe.units.raid1.buffIndicator.enable = true
	E.db.unitframe.units.raid1.buffIndicator.size = 6
	E.db.unitframe.units.raid1.classbar.enable = false
	E.db.unitframe.units.raid1.disableFocusGlow = true
	E.db.unitframe.units.raid1.disableTargetGlow = true
	E.db.unitframe.units.raid1.fader.minAlpha = 0.5
	E.db.unitframe.units.raid1.fader.smooth = 0
	E.db.unitframe.units.raid1.healPrediction.absorbStyle = 'WRAPPED'
	E.db.unitframe.units.raid1.healPrediction.enable = true
	E.db.unitframe.units.raid1.health.text_format = ''
	E.db.unitframe.units.raid1.horizontalSpacing = 1
	E.db.unitframe.units.raid1.name.attachTextTo = 'Frame'
	E.db.unitframe.units.raid1.name.position = 'CENTER'
	E.db.unitframe.units.raid1.name.text_format = '[classcolor][name:veryshort]'
	E.db.unitframe.units.raid1.name.yOffset = 0
	E.db.unitframe.units.raid1.numGroups = E.Retail and 4 or 2
	E.db.unitframe.units.raid1.phaseIndicator.anchorPoint = 'TOP'
	E.db.unitframe.units.raid1.phaseIndicator.scale = 0.5
	E.db.unitframe.units.raid1.phaseIndicator.xOffset = 0
	E.db.unitframe.units.raid1.power.enable = false
	E.db.unitframe.units.raid1.pvpclassificationindicator.enable = false
	E.db.unitframe.units.raid1.raidicon.attachTo = 'TOPRIGHT'
	E.db.unitframe.units.raid1.raidicon.attachToObject = 'Health'
	E.db.unitframe.units.raid1.raidicon.size = 12
	E.db.unitframe.units.raid1.raidicon.xOffset = 1
	E.db.unitframe.units.raid1.raidicon.yOffset = 1
	E.db.unitframe.units.raid1.raidRoleIcons.scale = 0.8
	E.db.unitframe.units.raid1.raidRoleIcons.yOffset = 1
	E.db.unitframe.units.raid1.rdebuffs.font = Private.Font
	E.db.unitframe.units.raid1.rdebuffs.fontOutline = Private.Outline
	E.db.unitframe.units.raid1.rdebuffs.fontSize = 9
	E.db.unitframe.units.raid1.rdebuffs.size = 14
	E.db.unitframe.units.raid1.rdebuffs.stack.position = 'CENTER'
	E.db.unitframe.units.raid1.rdebuffs.stack.xOffset = 1
	E.db.unitframe.units.raid1.rdebuffs.stack.yOffset = 0
	E.db.unitframe.units.raid1.rdebuffs.yOffset = 1
	E.db.unitframe.units.raid1.readycheckIcon.attachToObject = 'Frame'
	E.db.unitframe.units.raid1.readycheckIcon.position = 'TOP'
	E.db.unitframe.units.raid1.readycheckIcon.size = 14
	E.db.unitframe.units.raid1.readycheckIcon.xOffset = 0
	E.db.unitframe.units.raid1.readycheckIcon.yOffset = 0
	E.db.unitframe.units.raid1.resurrectIcon.attachTo = 'RIGHT'
	E.db.unitframe.units.raid1.resurrectIcon.size = 18
	E.db.unitframe.units.raid1.roleIcon.attachTo = 'Frame'
	E.db.unitframe.units.raid1.roleIcon.damager = false
	E.db.unitframe.units.raid1.roleIcon.enable = true
	E.db.unitframe.units.raid1.roleIcon.position = 'LEFT'
	E.db.unitframe.units.raid1.roleIcon.size = 12
	E.db.unitframe.units.raid1.roleIcon.xOffset = 0
	E.db.unitframe.units.raid1.roleIcon.yOffset = 0
	E.db.unitframe.units.raid1.summonIcon.attachTo = 'RIGHT'
	E.db.unitframe.units.raid1.summonIcon.size = 18
	E.db.unitframe.units.raid1.threatStyle = 'NONE'
	E.db.unitframe.units.raid1.verticalSpacing = 1
	E.db.unitframe.units.raid1.visibility = E.Retail and '[@raid6,noexists][@raid21,exists] hide;show' or '[@raid6,noexists][@raid11,exists] hide;show'

	-- Shared Raid2
	E:CopyTable(E.db.unitframe.units.raid2, E.db.unitframe.units.raid1)
	E.db.unitframe.units.raid2.numGroups = E.Retail and 6 or 5
	E.db.unitframe.units.raid2.visibility = E.Retail and '[@raid21,noexists][@raid31,exists] hide;show' or '[@raid11,noexists][@raid26,exists] hide;show'

	-- Shared Raid3
	E.db.unitframe.units.raid3.buffIndicator.countFont = Private.Font
	E.db.unitframe.units.raid3.buffIndicator.countFontSize = 10
	E.db.unitframe.units.raid3.buffIndicator.enable = true
	E.db.unitframe.units.raid3.buffIndicator.size = 6
	E.db.unitframe.units.raid3.classbar.enable = false
	E.db.unitframe.units.raid3.debuffs.countFont = Private.Font
	E.db.unitframe.units.raid3.debuffs.desaturate = false
	E.db.unitframe.units.raid3.debuffs.maxDuration = 0
	E.db.unitframe.units.raid3.debuffs.priority = 'Blacklist,RaidDebuffs,Dispellable'
	E.db.unitframe.units.raid3.disableFocusGlow = true
	E.db.unitframe.units.raid3.disableTargetGlow = true
	E.db.unitframe.units.raid3.fader.minAlpha = 0.5
	E.db.unitframe.units.raid3.fader.smooth = 0
	E.db.unitframe.units.raid3.healPrediction.absorbStyle = 'WRAPPED'
	E.db.unitframe.units.raid3.health.text_format = ''
	E.db.unitframe.units.raid3.horizontalSpacing = 1
	E.db.unitframe.units.raid3.name.attachTextTo = 'Frame'
	E.db.unitframe.units.raid3.name.position = 'CENTER'
	E.db.unitframe.units.raid3.name.text_format = '[classcolor][name:veryshort]'
	E.db.unitframe.units.raid3.name.yOffset = 0
	E.db.unitframe.units.raid3.phaseIndicator.anchorPoint = 'LEFT'
	E.db.unitframe.units.raid3.phaseIndicator.scale = 0.5
	E.db.unitframe.units.raid3.phaseIndicator.xOffset = 0
	E.db.unitframe.units.raid3.pvpclassificationindicator.enable = false
	E.db.unitframe.units.raid3.raidicon.attachTo = 'TOPRIGHT'
	E.db.unitframe.units.raid3.raidicon.attachToObject = 'Health'
	E.db.unitframe.units.raid3.raidicon.size = 12
	E.db.unitframe.units.raid3.raidicon.xOffset = 1
	E.db.unitframe.units.raid3.raidicon.yOffset = 1
	E.db.unitframe.units.raid3.raidRoleIcons.scale = 0.8
	E.db.unitframe.units.raid3.raidRoleIcons.yOffset = 1
	E.db.unitframe.units.raid3.rdebuffs.enable = true
	E.db.unitframe.units.raid3.rdebuffs.font = Private.Font
	E.db.unitframe.units.raid3.rdebuffs.fontOutline = Private.Outline
	E.db.unitframe.units.raid3.rdebuffs.fontSize = 9
	E.db.unitframe.units.raid3.rdebuffs.size = 14
	E.db.unitframe.units.raid3.rdebuffs.stack.position = 'CENTER'
	E.db.unitframe.units.raid3.rdebuffs.stack.yOffset = 0
	E.db.unitframe.units.raid3.readycheckIcon.attachToObject = 'Frame'
	E.db.unitframe.units.raid3.readycheckIcon.position = 'RIGHT'
	E.db.unitframe.units.raid3.readycheckIcon.xOffset = 0
	E.db.unitframe.units.raid3.readycheckIcon.yOffset = 0
	E.db.unitframe.units.raid3.resurrectIcon.attachTo = 'RIGHT'
	E.db.unitframe.units.raid3.resurrectIcon.size = 18
	E.db.unitframe.units.raid3.roleIcon.attachTo = 'Frame'
	E.db.unitframe.units.raid3.roleIcon.damager = false
	E.db.unitframe.units.raid3.roleIcon.enable = true
	E.db.unitframe.units.raid3.roleIcon.position = 'LEFT'
	E.db.unitframe.units.raid3.roleIcon.size = 12
	E.db.unitframe.units.raid3.roleIcon.xOffset = 0
	E.db.unitframe.units.raid3.roleIcon.yOffset = 0
	E.db.unitframe.units.raid3.summonIcon.attachTo = 'RIGHT'
	E.db.unitframe.units.raid3.summonIcon.size = 18
	E.db.unitframe.units.raid3.threatStyle = 'NONE'
	E.db.unitframe.units.raid3.verticalSpacing = 1
	E.db.unitframe.units.raid3.visibility = E.Retail and '[@raid31,noexists] hide;show' or '[@raid26,noexists] hide;show'

	-- Shared movers
	E.db.movers.AddonCompartmentMover = 'TOPRIGHT,ElvUIParent,TOPRIGHT,-3,-66'
	E.db.movers.AlertFrameMover = 'TOP,ElvUIParent,TOP,0,-178'
	E.db.movers.AltPowerBarMover = 'TOP,ElvUIParent,TOP,0,-16'
	E.db.movers.ArenaHeaderMover = 'TOPRIGHT,ElvUIParent,TOPRIGHT,-300,-210'
	E.db.movers.BagsMover = 'BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-416,1'
	E.db.movers.BelowMinimapContainerMover = 'TOPRIGHT,ElvUIParent,TOPRIGHT,-84,-210'
	E.db.movers.BNETMover = 'BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,1,140'
	E.db.movers.BossBannerMover = 'TOP,ElvUIParent,TOP,0,-199'
	E.db.movers.BossButton = 'BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,416,102'
	E.db.movers.BossHeaderMover = 'TOPRIGHT,ElvUIParent,TOPRIGHT,-300,-210'
	E.db.movers.BuffsMover = 'TOPRIGHT,ElvUIParent,TOPRIGHT,-157,-1'
	E.db.movers.DebuffsMover = 'TOPRIGHT,ElvUIParent,TOPRIGHT,-157,-110'
	E.db.movers.DurabilityFrameMover = 'BOTTOM,ElvUIParent,BOTTOM,192,1'
	E.db.movers.ElvAB_1 = 'BOTTOM,ElvUIParent,BOTTOM,0,14'
	E.db.movers.ElvAB_2 = 'BOTTOM,ElvUIParent,BOTTOM,0,68'
	E.db.movers.ElvAB_3 = 'BOTTOM,ElvUIParent,BOTTOM,0,41'
	E.db.movers.ElvAB_4 = 'BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,1,490'
	E.db.movers.ElvAB_5 = 'TOPRIGHT,ElvUIParent,TOPRIGHT,-1,-370'
	E.db.movers.ElvAB_6 = 'BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,1,517'
	E.db.movers.ElvAB_7 = 'TOPLEFT,ElvUIParent,TOPLEFT,1,-510'
	E.db.movers.ElvAB_8 = 'TOPLEFT,ElvUIParent,TOPLEFT,1,-483'
	E.db.movers.ElvAB_9 = 'TOPLEFT,ElvUIParent,TOPLEFT,1,-456'
	E.db.movers.ElvAB_10 = 'TOPLEFT,ElvUIParent,TOPLEFT,1,-429'
	E.db.movers.ElvAB_13 = 'TOPLEFT,ElvUIParent,TOPLEFT,1,-402'
	E.db.movers.ElvAB_14 = 'TOPLEFT,ElvUIParent,TOPLEFT,1,-375'
	E.db.movers.ElvAB_15 = 'TOPLEFT,ElvUIParent,TOPLEFT,1,-348'
	E.db.movers.ElvUIBagMover = 'BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-1,140'
	E.db.movers.ElvUIBankMover = 'BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,1,140'
	E.db.movers.EventToastMover = 'TOP,ElvUIParent,TOP,0,-166'
	E.db.movers.ExperienceBarMover = 'BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,416,1'
	E.db.movers.GMMover = 'TOPRIGHT,ElvUIParent,TOPRIGHT,-434,-1'
	E.db.movers.LeftChatMover = 'BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,1,1'
	E.db.movers.LootFrameMover = 'TOP,ElvUIParent,TOP,0,-187'
	E.db.movers.LossControlMover = 'TOP,ElvUIParent,TOP,0,-490'
	E.db.movers.MawBuffsBelowMinimapMover = 'TOPLEFT,ElvUIParent,TOPLEFT,1,-28'
	E.db.movers.MicrobarMover = 'TOPLEFT,ElvUIParent,TOPLEFT,1,-1'
	E.db.movers.MinimapMover = 'TOPRIGHT,ElvUIParent,TOPRIGHT,-1,-1'
	E.db.movers.MirrorTimer1Mover = 'TOP,ElvUIParent,TOP,0,-60'
	E.db.movers.MirrorTimer2Mover = 'TOP,ElvUIParent,TOP,0,-79'
	E.db.movers.MirrorTimer3Mover = 'TOP,ElvUIParent,TOP,0,-98'
	E.db.movers.ObjectiveFrameMover = 'TOPRIGHT,ElvUIParent,TOPRIGHT,-80,-184'
	E.db.movers.PetAB = 'BOTTOM,ElvUIParent,BOTTOM,0,114'
	E.db.movers.PlayerChoiceToggle = 'BOTTOM,UIParent,BOTTOM,0,369'
	E.db.movers.PowerBarContainerMover = 'BOTTOM,UIParent,BOTTOM,0,163'
	E.db.movers.PrivateAurasMover = 'BOTTOM,UIParent,BOTTOM,174,452'
	E.db.movers.PrivateRaidWarningMover = 'TOP,ElvUIParent,TOP,0,-258'
	E.db.movers.QuestWatchFrameMover = 'TOPRIGHT,ElvUIParent,TOPRIGHT,-80,-184'
	E.db.movers.QueueStatusMover = 'TOPRIGHT,ElvUIParent,TOPRIGHT,-3,-131'
	E.db.movers.ReputationBarMover = 'BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-416,1'
	E.db.movers.RightChatMover = 'BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-1,1'
	E.db.movers.ShiftAB = 'TOPLEFT,ElvUIParent,TOPLEFT,210,-1'
	E.db.movers.TalkingHeadFrameMover = 'BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-2,140'
	E.db.movers.TooltipMover = 'BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,0,102'
	E.db.movers.TopCenterContainerMover = 'TOP,ElvUIParent,TOP,0,-46'
	E.db.movers.TorghastBuffsMover = 'TOPLEFT,ElvUIParent,TOPLEFT,4,-51'
	E.db.movers.TorghastChoiceToggle = 'BOTTOM,UIParent,BOTTOM,0,369'
	E.db.movers.UIErrorsFrameMover = 'TOP,ElvUIParent,TOP,0,-117'
	E.db.movers.VehicleSeatMover = 'BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,427,1'
	E.db.movers.VOICECHAT = 'TOPLEFT,ElvUIParent,TOPLEFT,1,-28'
	E.db.movers.ZoneAbility = 'BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,416,49'

	if layout == 'main' then

		-- Main Custom Texts
		E.db.unitframe.units.party.customTexts.Luckyone_Name.text_format = E.Retail and '[classcolor][name:short]|r[manacolor][ - >luckyone:healermana:percent]' or '[classcolor][name:short]'
		E.db.unitframe.units.player.customTexts.Luckyone_HP.text_format = '[health:current:shortvalue] • [luckyone:health:percent]'

		-- Main Misc
		E.db.unitframe.units.targettarget.enable = true

		-- Main Player
		E.db.unitframe.units.player.castbar.width = 279

		-- Main Party
		E.db.unitframe.units.party.debuffs.sizeOverride = 32
		E.db.unitframe.units.party.height = 32
		E.db.unitframe.units.party.width = 190

		-- Main Raid1
		E.db.unitframe.units.raid1.height = 38
		E.db.unitframe.units.raid1.rdebuffs.xOffset = 33
		E.db.unitframe.units.raid1.rdebuffs.yOffset = 12
		E.db.unitframe.units.raid1.width = 82

		-- Main Raid2
		E.db.unitframe.units.raid2.height = 32
		E.db.unitframe.units.raid2.rdebuffs.xOffset = 33
		E.db.unitframe.units.raid2.rdebuffs.yOffset = 12
		E.db.unitframe.units.raid2.width = 82

		-- Main Raid3
		E.db.unitframe.units.raid3.height = 24
		E.db.unitframe.units.raid3.rdebuffs.xOffset = 33
		E.db.unitframe.units.raid3.rdebuffs.yOffset = 5
		E.db.unitframe.units.raid3.width = 82

		-- Main movers
		E.db.movers.ElvUF_FocusCastbarMover = 'BOTTOM,ElvUIParent,BOTTOM,278,391'
		E.db.movers.ElvUF_FocusMover = 'BOTTOM,ElvUIParent,BOTTOM,278,410'
		E.db.movers.ElvUF_PartyMover = 'TOPLEFT,ElvUIParent,TOPLEFT,360,-360'
		E.db.movers.ElvUF_PetMover = 'BOTTOM,ElvUIParent,BOTTOM,0,141'
		E.db.movers.ElvUF_PlayerCastbarMover = 'BOTTOM,UIParent,BOTTOM,0,233'
		E.db.movers.ElvUF_PlayerMover = 'BOTTOM,ElvUIParent,BOTTOM,-278,300'
		E.db.movers.ElvUF_Raid1Mover = 'BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,1,140'
		E.db.movers.ElvUF_Raid2Mover = 'BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,1,140'
		E.db.movers.ElvUF_Raid3Mover = 'BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,1,140'
		E.db.movers.ElvUF_TargetCastbarMover = 'BOTTOM,ElvUIParent,BOTTOM,278,281'
		E.db.movers.ElvUF_TargetMover = 'BOTTOM,ElvUIParent,BOTTOM,278,300'
		E.db.movers.ElvUF_TargetTargetMover = 'BOTTOM,ElvUIParent,BOTTOM,0,252'
		E.db.movers.VehicleLeaveButton = 'BOTTOM,ElvUIParent,BOTTOM,0,185'

	elseif layout == 'healing' then

		-- Healing Custom Texts
		E.db.unitframe.units.party.customTexts.Luckyone_Name.text_format = '[classcolor][name:short]'
		E.db.unitframe.units.player.customTexts.Luckyone_HP.text_format = '[manacolor][perpp<%]|r • [health:current:shortvalue] • [luckyone:health:percent]'

		-- Healing Misc
		E.db.unitframe.units.targettarget.enable = false

		-- Healing Player
		E.db.unitframe.units.player.castbar.width = 324

		-- Healing Party
		E.db.unitframe.units.party.debuffs.sizeOverride = 40
		E.db.unitframe.units.party.height = 40
		E.db.unitframe.units.party.width = 240

		-- Healing Raid1
		E.db.unitframe.units.raid1.height = 36
		E.db.unitframe.units.raid1.rdebuffs.xOffset = 39
		E.db.unitframe.units.raid1.rdebuffs.yOffset = 11
		E.db.unitframe.units.raid1.width = 94

		-- Healing Raid2
		E.db.unitframe.units.raid2.height = 36
		E.db.unitframe.units.raid2.rdebuffs.xOffset = 39
		E.db.unitframe.units.raid2.rdebuffs.yOffset = 11
		E.db.unitframe.units.raid2.width = 94

		-- Healing Raid3
		E.db.unitframe.units.raid3.height = 23
		E.db.unitframe.units.raid3.rdebuffs.xOffset = 39
		E.db.unitframe.units.raid3.rdebuffs.yOffset = 4
		E.db.unitframe.units.raid3.width = 94

		-- Healing Movers
		E.db.movers.ElvUF_FocusCastbarMover = 'BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-482,391'
		E.db.movers.ElvUF_FocusMover = 'BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-482,410'
		E.db.movers.ElvUF_PartyMover = 'TOPLEFT,ElvUIParent,TOPLEFT,482,-390'
		E.db.movers.ElvUF_PetMover = 'BOTTOM,ElvUIParent,BOTTOM,0,141'
		E.db.movers.ElvUF_PlayerCastbarMover = 'BOTTOM,ElvUIParent,BOTTOM,-1,95'
		E.db.movers.ElvUF_PlayerMover = 'BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,482,300'
		E.db.movers.ElvUF_Raid1Mover = E.Retail and 'BOTTOM,ElvUIParent,BOTTOM,0,193' or 'BOTTOM,UIParent,BOTTOM,0,267'
		E.db.movers.ElvUF_Raid2Mover = E.Retail and 'BOTTOM,ElvUIParent,BOTTOM,0,119' or 'BOTTOM,UIParent,BOTTOM,0,156'
		E.db.movers.ElvUF_Raid3Mover = 'BOTTOM,ElvUIParent,BOTTOM,0,149'
		E.db.movers.ElvUF_TargetCastbarMover = 'BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-482,281'
		E.db.movers.ElvUF_TargetMover = 'BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-482,300'
		E.db.movers.ElvUF_TargetTargetMover = 'BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-202,320'
		E.db.movers.VehicleLeaveButton = 'BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,382,141'

	elseif layout == 'support' then

		-- Support Custom Texts
		E.db.unitframe.units.party.customTexts.Luckyone_Name.text_format = E.Retail and '[classcolor][name:short]|r[manacolor][ - >luckyone:healermana:percent]' or '[classcolor][name:short]'
		E.db.unitframe.units.player.customTexts.Luckyone_HP.text_format = '[health:current:shortvalue] • [luckyone:health:percent]'

		-- Support Misc
		E.db.actionbar.bar1.mouseover = true
		E.db.actionbar.bar2.mouseover = true
		E.db.actionbar.bar3.mouseover = true
		E.db.actionbar.stanceBar.buttonSize = 19
		E.db.actionbar.stanceBar.buttonSpacing = 2
		E.db.actionbar.stanceBar.buttonsPerRow = 1
		E.db.actionbar.stanceBar.hotkeyFontSize = 8
		E.db.actionbar.stanceBar.hotkeyTextPosition = 'TOP'
		E.db.actionbar.stanceBar.hotkeyTextXOffset = 1
		E.db.actionbar.stanceBar.mouseover = false

		E.db.unitframe.units.targettarget.enable = true

		-- Support Player
		E.db.unitframe.units.player.castbar.width = 279

		-- Support Party
		E.db.unitframe.units.party.debuffs.sizeOverride = 32
		E.db.unitframe.units.party.height = 32
		E.db.unitframe.units.party.raidRoleIcons.enable = false
		E.db.unitframe.units.party.width = 190

		-- Support Raid1
		E.db.unitframe.units.raid1.height = 38
		E.db.unitframe.units.raid1.raidRoleIcons.enable = false
		E.db.unitframe.units.raid1.rdebuffs.xOffset = -33
		E.db.unitframe.units.raid1.rdebuffs.yOffset = 1
		E.db.unitframe.units.raid1.width = 82

		-- Support Raid2
		E.db.unitframe.units.raid2.height = 32
		E.db.unitframe.units.raid2.raidRoleIcons.enable = false
		E.db.unitframe.units.raid2.rdebuffs.xOffset = -33
		E.db.unitframe.units.raid2.rdebuffs.yOffset = 1
		E.db.unitframe.units.raid2.width = 82

		-- Support Raid3
		E.db.unitframe.units.raid3.height = 24
		E.db.unitframe.units.raid3.raidRoleIcons.enable = false
		E.db.unitframe.units.raid3.rdebuffs.xOffset = -33
		E.db.unitframe.units.raid3.rdebuffs.yOffset = 1
		E.db.unitframe.units.raid3.width = 82

		-- Support Movers
		E.db.movers.ElvAB_1 = 'BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,1,140'
		E.db.movers.ElvAB_2 = 'BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,1,194'
		E.db.movers.ElvAB_3 = 'BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,1,167'
		E.db.movers.ElvUF_FocusCastbarMover = 'BOTTOM,ElvUIParent,BOTTOM,278,419'
		E.db.movers.ElvUF_FocusMover = 'BOTTOM,ElvUIParent,BOTTOM,278,438'
		E.db.movers.ElvUF_PartyMover = 'TOPLEFT,ElvUIParent,TOPLEFT,360,-360'
		E.db.movers.ElvUF_PetMover = 'BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,416,28'
		E.db.movers.ElvUF_PlayerCastbarMover = 'BOTTOM,UIParent,BOTTOM,0,233'
		E.db.movers.ElvUF_PlayerMover = 'BOTTOM,ElvUIParent,BOTTOM,-278,300'
		E.db.movers.ElvUF_Raid1Mover = 'BOTTOM,ElvUIParent,BOTTOM,0,14'
		E.db.movers.ElvUF_Raid2Mover = 'BOTTOM,ElvUIParent,BOTTOM,0,14'
		E.db.movers.ElvUF_Raid3Mover = 'BOTTOM,ElvUIParent,BOTTOM,0,14'
		E.db.movers.ElvUF_TargetCastbarMover = 'BOTTOM,ElvUIParent,BOTTOM,278,281'
		E.db.movers.ElvUF_TargetMover = 'BOTTOM,ElvUIParent,BOTTOM,278,300'
		E.db.movers.ElvUF_TargetTargetMover = 'BOTTOM,ElvUIParent,BOTTOM,0,252'
		E.db.movers.PetAB = 'BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,416,1'
		E.db.movers.PrivateAurasMover = 'TOP,ElvUIParent,TOP,174,-504'
		E.db.movers.PrivateRaidWarningMover = 'TOP,ElvUIParent,TOP,0,-258'
		E.db.movers.ShiftAB = 'BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,542,300'
		E.db.movers.VehicleLeaveButton = 'BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,509,301'
	end
end

-- Shadowlands layout db
function Private:Layout_Shadowlands(layout)
	-- AB conversion
	E.db.convertPages = true
	-- Protect movers error
	E.db.movers = E.db.movers or {}

	-- General
	E.db.general.afkChat = false
	E.db.general.altPowerBar.font = Private.Font
	E.db.general.altPowerBar.statusBar = Private.Texture
	E.db.general.autoAcceptInvite = true
	E.db.general.autoRepair = E.Retail and 'GUILD' or 'PLAYER'
	E.db.general.backdropcolor.b = 0.10
	E.db.general.backdropcolor.g = 0.10
	E.db.general.backdropcolor.r = 0.10
	E.db.general.backdropfadecolor.a = 0.80
	E.db.general.backdropfadecolor.b = 0.05
	E.db.general.backdropfadecolor.g = 0.05
	E.db.general.backdropfadecolor.r = 0.05
	E.db.general.bonusObjectivePosition = 'AUTO'
	E.db.general.bottomPanel = false
	E.db.general.customGlow.color.a = 1
	E.db.general.customGlow.color.b = 1
	E.db.general.customGlow.color.g = 1
	E.db.general.customGlow.color.r = 1
	E.db.general.customGlow.style = 'Autocast Shine'
	E.db.general.customGlow.useColor = true
	E.db.general.durabilityScale = 0.5
	E.db.general.enhancedPvpMessages = false
	E.db.general.interruptAnnounce = 'EMOTE'
	E.db.general.itemLevel.itemLevelFont = Private.Font
	E.db.general.itemLevel.itemLevelFontSize = 11
	E.db.general.loginmessage = false
	E.db.general.lootRoll.buttonSize = 22
	E.db.general.lootRoll.spacing = 3
	E.db.general.lootRoll.statusBarTexture = Private.Texture
	E.db.general.lootRoll.style = 'fullbar'
	E.db.general.lootRoll.width = 340
	E.db.general.minimap.locationFont = Private.Font
	E.db.general.minimap.locationFontSize = 13
	E.db.general.minimap.locationText = 'SHOW'
	E.db.general.minimap.size = 161
	E.db.general.objectiveFrameAutoHide = false
	E.db.general.objectiveFrameHeight = 600
	E.db.general.talkingHeadFrameBackdrop = true
	E.db.general.talkingHeadFrameScale = 0.7
	E.db.general.vehicleSeatIndicatorSize = 64

	-- ActionBars
	E.db.actionbar.bar1.alpha = 1
	E.db.actionbar.bar1.buttonSize = 28
	E.db.actionbar.bar1.countFont = Private.Font
	E.db.actionbar.bar1.countFontOutline = Private.Outline
	E.db.actionbar.bar1.countTextPosition = 'BOTTOM'
	E.db.actionbar.bar1.hotkeyFont = Private.Font
	E.db.actionbar.bar1.hotkeyFontOutline = Private.Outline
	E.db.actionbar.bar1.hotkeyTextPosition = 'TOPLEFT'
	E.db.actionbar.bar1.hotkeyTextYOffset = -1
	E.db.actionbar.bar1.macroFont = Private.Font
	E.db.actionbar.bar1.macroFontOutline = Private.Outline
	E.db.actionbar.bar1.macrotext = true
	E.db.actionbar.bar1.macroTextPosition = 'BOTTOM'
	E.db.actionbar.bar1.macroTextYOffset = 1
	E.db.actionbar.bar2.alpha = 1
	E.db.actionbar.bar2.buttonSize = 28
	E.db.actionbar.bar2.countFont = Private.Font
	E.db.actionbar.bar2.countFontOutline = Private.Outline
	E.db.actionbar.bar2.countTextPosition = 'BOTTOM'
	E.db.actionbar.bar2.enabled = true
	E.db.actionbar.bar2.hotkeyFont = Private.Font
	E.db.actionbar.bar2.hotkeyFontOutline = Private.Outline
	E.db.actionbar.bar2.hotkeyTextPosition = 'TOPLEFT'
	E.db.actionbar.bar2.hotkeyTextYOffset = -1
	E.db.actionbar.bar2.macroFont = Private.Font
	E.db.actionbar.bar2.macroFontOutline = Private.Outline
	E.db.actionbar.bar2.macrotext = true
	E.db.actionbar.bar2.macroTextPosition = 'BOTTOM'
	E.db.actionbar.bar2.macroTextYOffset = 1
	E.db.actionbar.bar3.alpha = 1
	E.db.actionbar.bar3.buttons = 12
	E.db.actionbar.bar3.buttonSize = 28
	E.db.actionbar.bar3.buttonsPerRow = 12
	E.db.actionbar.bar3.countFont = Private.Font
	E.db.actionbar.bar3.countFontOutline = Private.Outline
	E.db.actionbar.bar3.countTextPosition = 'BOTTOM'
	E.db.actionbar.bar3.hotkeyFont = Private.Font
	E.db.actionbar.bar3.hotkeyFontOutline = Private.Outline
	E.db.actionbar.bar3.hotkeyTextPosition = 'TOPLEFT'
	E.db.actionbar.bar3.hotkeyTextYOffset = -1
	E.db.actionbar.bar3.macroFont = Private.Font
	E.db.actionbar.bar3.macroFontOutline = Private.Outline
	E.db.actionbar.bar3.macrotext = true
	E.db.actionbar.bar3.macroTextPosition = 'BOTTOM'
	E.db.actionbar.bar3.macroTextYOffset = 1
	E.db.actionbar.bar4.alpha = 1
	E.db.actionbar.bar4.backdrop = false
	E.db.actionbar.bar4.buttons = 12
	E.db.actionbar.bar4.buttonSize = 28
	E.db.actionbar.bar4.buttonsPerRow = E.Retail and 12 or 6
	E.db.actionbar.bar4.countFont = Private.Font
	E.db.actionbar.bar4.countFontOutline = Private.Outline
	E.db.actionbar.bar4.countTextPosition = 'BOTTOM'
	E.db.actionbar.bar4.enabled = not E.Retail
	E.db.actionbar.bar4.hotkeyFont = Private.Font
	E.db.actionbar.bar4.hotkeyFontOutline = Private.Outline
	E.db.actionbar.bar4.hotkeyTextPosition = 'TOPLEFT'
	E.db.actionbar.bar4.hotkeyTextYOffset = -1
	E.db.actionbar.bar4.macroFont = Private.Font
	E.db.actionbar.bar4.macroFontOutline = Private.Outline
	E.db.actionbar.bar4.macrotext = true
	E.db.actionbar.bar4.macroTextPosition = 'BOTTOM'
	E.db.actionbar.bar4.macroTextYOffset = 1
	E.db.actionbar.bar4.mouseover = not E.Retail
	E.db.actionbar.bar4.point = 'BOTTOMLEFT'
	E.db.actionbar.bar5.alpha = 1
	E.db.actionbar.bar5.buttons = 12
	E.db.actionbar.bar5.buttonSize = 28
	E.db.actionbar.bar5.buttonsPerRow = 1
	E.db.actionbar.bar5.countFont = Private.Font
	E.db.actionbar.bar5.countFontOutline = Private.Outline
	E.db.actionbar.bar5.countTextPosition = 'BOTTOM'
	E.db.actionbar.bar5.enabled = true
	E.db.actionbar.bar5.hotkeyFont = Private.Font
	E.db.actionbar.bar5.hotkeyFontOutline = Private.Outline
	E.db.actionbar.bar5.hotkeyTextPosition = 'TOPLEFT'
	E.db.actionbar.bar5.hotkeyTextYOffset = -1
	E.db.actionbar.bar5.macroFont = Private.Font
	E.db.actionbar.bar5.macroFontOutline = Private.Outline
	E.db.actionbar.bar5.macrotext = true
	E.db.actionbar.bar5.macroTextPosition = 'BOTTOM'
	E.db.actionbar.bar5.macroTextYOffset = 1
	E.db.actionbar.bar5.mouseover = true
	E.db.actionbar.bar6.alpha = 1
	E.db.actionbar.bar6.buttons = 12
	E.db.actionbar.bar6.buttonSize = 28
	E.db.actionbar.bar6.buttonsPerRow = E.Retail and 12 or 6
	E.db.actionbar.bar6.countFont = Private.Font
	E.db.actionbar.bar6.countFontOutline = Private.Outline
	E.db.actionbar.bar6.countTextPosition = 'BOTTOM'
	E.db.actionbar.bar6.enabled = not E.Retail
	E.db.actionbar.bar6.hotkeyFont = Private.Font
	E.db.actionbar.bar6.hotkeyFontOutline = Private.Outline
	E.db.actionbar.bar6.hotkeyTextPosition = 'TOPLEFT'
	E.db.actionbar.bar6.hotkeyTextYOffset = -1
	E.db.actionbar.bar6.macroFont = Private.Font
	E.db.actionbar.bar6.macroFontOutline = Private.Outline
	E.db.actionbar.bar6.macrotext = true
	E.db.actionbar.bar6.macroTextPosition = 'BOTTOM'
	E.db.actionbar.bar6.macroTextYOffset = 1
	E.db.actionbar.bar6.mouseover = not E.Retail
	E.db.actionbar.bar7.alpha = 1
	E.db.actionbar.bar7.buttonSize = 28
	E.db.actionbar.bar7.countFont = Private.Font
	E.db.actionbar.bar7.countFontOutline = Private.Outline
	E.db.actionbar.bar7.countTextPosition = 'BOTTOM'
	E.db.actionbar.bar7.hotkeyFont = Private.Font
	E.db.actionbar.bar7.hotkeyFontOutline = Private.Outline
	E.db.actionbar.bar7.hotkeyTextPosition = 'TOPLEFT'
	E.db.actionbar.bar7.hotkeyTextYOffset = -1
	E.db.actionbar.bar7.macroFont = Private.Font
	E.db.actionbar.bar7.macroFontOutline = Private.Outline
	E.db.actionbar.bar7.macrotext = true
	E.db.actionbar.bar7.macroTextPosition = 'BOTTOM'
	E.db.actionbar.bar7.macroTextYOffset = 1
	E.db.actionbar.bar8.alpha = 1
	E.db.actionbar.bar8.buttonSize = 28
	E.db.actionbar.bar8.countFont = Private.Font
	E.db.actionbar.bar8.countFontOutline = Private.Outline
	E.db.actionbar.bar8.countTextPosition = 'BOTTOM'
	E.db.actionbar.bar8.hotkeyFont = Private.Font
	E.db.actionbar.bar8.hotkeyFontOutline = Private.Outline
	E.db.actionbar.bar8.hotkeyTextPosition = 'TOPLEFT'
	E.db.actionbar.bar8.hotkeyTextYOffset = -1
	E.db.actionbar.bar8.macroFont = Private.Font
	E.db.actionbar.bar8.macroFontOutline = Private.Outline
	E.db.actionbar.bar8.macrotext = true
	E.db.actionbar.bar8.macroTextPosition = 'BOTTOM'
	E.db.actionbar.bar8.macroTextYOffset = 1
	E.db.actionbar.bar9.alpha = 1
	E.db.actionbar.bar9.buttonSize = 28
	E.db.actionbar.bar9.countFont = Private.Font
	E.db.actionbar.bar9.countFontOutline = Private.Outline
	E.db.actionbar.bar9.countTextPosition = 'BOTTOM'
	E.db.actionbar.bar9.hotkeyFont = Private.Font
	E.db.actionbar.bar9.hotkeyFontOutline = Private.Outline
	E.db.actionbar.bar9.hotkeyTextPosition = 'TOPLEFT'
	E.db.actionbar.bar9.hotkeyTextYOffset = -1
	E.db.actionbar.bar9.macroFont = Private.Font
	E.db.actionbar.bar9.macroFontOutline = Private.Outline
	E.db.actionbar.bar9.macrotext = true
	E.db.actionbar.bar9.macroTextPosition = 'BOTTOM'
	E.db.actionbar.bar9.macroTextYOffset = 1
	E.db.actionbar.bar10.alpha = 1
	E.db.actionbar.bar10.buttonSize = 28
	E.db.actionbar.bar10.countFont = Private.Font
	E.db.actionbar.bar10.countFontOutline = Private.Outline
	E.db.actionbar.bar10.countTextPosition = 'BOTTOM'
	E.db.actionbar.bar10.hotkeyFont = Private.Font
	E.db.actionbar.bar10.hotkeyFontOutline = Private.Outline
	E.db.actionbar.bar10.hotkeyTextPosition = 'TOPLEFT'
	E.db.actionbar.bar10.hotkeyTextYOffset = -1
	E.db.actionbar.bar10.macroFont = Private.Font
	E.db.actionbar.bar10.macroFontOutline = Private.Outline
	E.db.actionbar.bar10.macrotext = true
	E.db.actionbar.bar10.macroTextPosition = 'BOTTOM'
	E.db.actionbar.bar10.macroTextYOffset = 1
	E.db.actionbar.barPet.alpha = 1
	E.db.actionbar.barPet.backdrop = false
	E.db.actionbar.barPet.buttonSize = 28
	E.db.actionbar.barPet.buttonsPerRow = 10
	E.db.actionbar.barPet.countFont = Private.Font
	E.db.actionbar.barPet.countFontOutline = Private.Outline
	E.db.actionbar.barPet.hotkeyFont = Private.Font
	E.db.actionbar.barPet.hotkeyFontOutline = Private.Outline
	E.db.actionbar.barPet.hotkeyTextPosition = 'TOPLEFT'
	E.db.actionbar.barPet.hotkeyTextYOffset = -1
	E.db.actionbar.barPet.point = 'TOPLEFT'
	E.db.actionbar.cooldown.override = false
	E.db.actionbar.countTextPosition = 'BOTTOM'
	E.db.actionbar.countTextYOffset = 1
	E.db.actionbar.extraActionButton.alpha = 1
	E.db.actionbar.extraActionButton.clean = true
	E.db.actionbar.extraActionButton.hotkeyFont = Private.Font
	E.db.actionbar.extraActionButton.hotkeyFontOutline = Private.Outline
	E.db.actionbar.extraActionButton.hotkeyTextPosition = 'TOPLEFT'
	E.db.actionbar.extraActionButton.hotkeyTextYOffset = -1
	E.db.actionbar.extraActionButton.scale = 0.65
	E.db.actionbar.flyoutSize = 28
	E.db.actionbar.font = Private.Font
	E.db.actionbar.fontOutline = Private.Outline
	E.db.actionbar.hotkeyTextPosition = 'TOPLEFT'
	E.db.actionbar.macroTextPosition = 'BOTTOM'
	E.db.actionbar.microbar.buttonHeight = 25
	E.db.actionbar.microbar.buttonSize = 18
	E.db.actionbar.microbar.buttonSpacing = 1
	E.db.actionbar.microbar.enabled = true
	E.db.actionbar.microbar.mouseover = true
	E.db.actionbar.stanceBar.buttonHeight = 24
	E.db.actionbar.stanceBar.buttonSize = 25
	E.db.actionbar.stanceBar.buttonSpacing = 1
	E.db.actionbar.stanceBar.hotkeyFont = Private.Font
	E.db.actionbar.stanceBar.hotkeyFontOutline = Private.Outline
	E.db.actionbar.stanceBar.hotkeyTextPosition = 'TOPLEFT'
	E.db.actionbar.stanceBar.hotkeyTextYOffset = -1
	E.db.actionbar.stanceBar.mouseover = true
	E.db.actionbar.transparent = true
	E.db.actionbar.vehicleExitButton.hotkeyFont = Private.Font
	E.db.actionbar.vehicleExitButton.hotkeyFontOutline = Private.Outline
	E.db.actionbar.zoneActionButton.alpha = 1
	E.db.actionbar.zoneActionButton.clean = true
	E.db.actionbar.zoneActionButton.scale = 0.65

	-- Bags
	E.db.bags.bagWidth = 414
	E.db.bags.bankWidth = 414
	E.db.bags.clearSearchOnClose = true
	E.db.bags.countFont = Private.Font
	E.db.bags.countFontOutline = Private.Outline
	E.db.bags.countFontSize = 12
	E.db.bags.itemInfoFont = Private.Font
	E.db.bags.itemInfoFontOutline = Private.Outline
	E.db.bags.itemInfoFontSize = 12
	E.db.bags.itemLevelFont = Private.Font
	E.db.bags.itemLevelFontOutline = Private.Outline
	E.db.bags.itemLevelFontSize = 12
	E.db.bags.moneyFormat = 'BLIZZARD'
	E.db.bags.transparent = true
	E.db.bags.vendorGrays.enable = true

	-- Auras
	E.db.auras.buffs.countFont = Private.Font
	E.db.auras.buffs.countFontOutline = Private.Outline
	E.db.auras.buffs.countFontSize = 12
	E.db.auras.buffs.countYOffset = 2
	E.db.auras.buffs.horizontalSpacing = 2
	E.db.auras.buffs.seperateOwn = 0
	E.db.auras.buffs.size = 26
	E.db.auras.buffs.timeFont = Private.Font
	E.db.auras.buffs.timeFontOutline = Private.Outline
	E.db.auras.buffs.timeFontSize = 11
	E.db.auras.debuffs.countFont = Private.Font
	E.db.auras.debuffs.countFontOutline = Private.Outline
	E.db.auras.debuffs.countFontSize = 12
	E.db.auras.debuffs.countYOffset = 2
	E.db.auras.debuffs.horizontalSpacing = 2
	E.db.auras.debuffs.maxWraps = 2
	E.db.auras.debuffs.seperateOwn = 0
	E.db.auras.debuffs.size = 26
	E.db.auras.debuffs.timeFont = Private.Font
	E.db.auras.debuffs.timeFontOutline = Private.Outline
	E.db.auras.debuffs.timeFontSize = 11

	-- Chat
	E.db.chat.desaturateVoiceIcons = false
	E.db.chat.editboxHistorySize = 5
	E.db.chat.editBoxPosition = 'ABOVE_CHAT_INSIDE'
	E.db.chat.enableCombatRepeat = false
	E.db.chat.fade = false
	E.db.chat.fadeTabsNoBackdrop = false
	E.db.chat.font = Private.Font
	E.db.chat.fontOutline = Private.Outline
	E.db.chat.hideChatToggles = true
	E.db.chat.historySize = 200
	E.db.chat.keywords = '%MYNAME%'
	E.db.chat.lfgIcons = false
	E.db.chat.maxLines = 500
	E.db.chat.numScrollMessages = 2
	E.db.chat.panelColor.b = 0.05
	E.db.chat.panelColor.g = 0.05
	E.db.chat.panelColor.r = 0.05
	E.db.chat.panelHeight = 171
	E.db.chat.panelHeightRight = 171
	E.db.chat.panelWidth = 414
	E.db.chat.panelWidthRight = 414
	E.db.chat.separateSizes = true
	E.db.chat.showHistory.CHANNEL = false
	E.db.chat.showHistory.EMOTE = false
	E.db.chat.showHistory.GUILD = false
	E.db.chat.showHistory.INSTANCE = false
	E.db.chat.showHistory.PARTY = false
	E.db.chat.showHistory.RAID = false
	E.db.chat.showHistory.SAY = false
	E.db.chat.showHistory.YELL = false
	E.db.chat.tabFont = Private.Font
	E.db.chat.tabFontOutline = Private.Outline
	E.db.chat.tabFontSize = 10
	E.db.chat.tabSelector = 'NONE'
	E.db.chat.throttleInterval = 0

	-- Cooldown Text
	E.db.cooldown.daysIndicator.g = 0.4
	E.db.cooldown.daysIndicator.r = 0.4
	E.db.cooldown.expireIndicator.b = 0
	E.db.cooldown.expireIndicator.g = 0
	E.db.cooldown.fonts.font = Private.Font
	E.db.cooldown.fonts.fontSize = 12
	E.db.cooldown.hoursIndicator.r = 0.4
	E.db.cooldown.secondsColor.b = 1
	E.db.cooldown.targetAura = false
	E.db.cooldown.threshold = 5

	-- DataBars
	E.db.databars.azerite.enable = false
	E.db.databars.experience.font = Private.Font
	E.db.databars.experience.height = 171
	E.db.databars.experience.orientation = 'VERTICAL'
	E.db.databars.experience.questCompletedOnly = true
	E.db.databars.experience.showBubbles = true
	E.db.databars.experience.width = 10
	E.db.databars.honor.enable = false
	E.db.databars.petExperience.enable = false
	E.db.databars.reputation.enable = true
	E.db.databars.reputation.font = Private.Font
	E.db.databars.reputation.height = 171
	E.db.databars.reputation.orientation = 'VERTICAL'
	E.db.databars.reputation.width = 10
	E.db.databars.threat.enable = false

	-- DataTexts
	E.db.datatexts.font = Private.Font
	E.db.datatexts.fontOutline = Private.Outline
	E.db.datatexts.fontSize = 13
	E.db.datatexts.panels.LeftChatDataPanel.enable = false
	E.db.datatexts.panels.MinimapPanel.numPoints = 1
	E.db.datatexts.panels.MinimapPanel.panelTransparency = true
	E.db.datatexts.panels.MinimapPanel[1] = 'Time'
	E.db.datatexts.panels.RightChatDataPanel.enable = false

	-- Tooltip
	E.db.tooltip.alwaysShowRealm = true
	E.db.tooltip.colorAlpha = 0.80
	E.db.tooltip.font = Private.Font
	E.db.tooltip.fontOutline = Private.Outline
	E.db.tooltip.headerFont = Private.Font
	E.db.tooltip.headerFontOutline = Private.Outline
	E.db.tooltip.headerFontSize = 11
	E.db.tooltip.healthBar.font = Private.Font
	E.db.tooltip.healthBar.fontSize = 11
	E.db.tooltip.healthBar.height = 4
	E.db.tooltip.healthBar.statusPosition = 'DISABLED'
	E.db.tooltip.inspectDataEnable = false
	E.db.tooltip.itemCount = 'NONE'
	E.db.tooltip.itemQuality = true
	E.db.tooltip.mythicDataEnable = false
	E.db.tooltip.role = false
	E.db.tooltip.showElvUIUsers = true
	E.db.tooltip.showMount = false
	E.db.tooltip.smallTextFontSize = 11
	E.db.tooltip.targetInfo = false
	E.db.tooltip.textFontSize = 11

	-- Custom Texts: Creation
	E.db.unitframe.units.arena.customTexts = {}
	E.db.unitframe.units.boss.customTexts = {}
	E.db.unitframe.units.focus.customTexts = {}
	E.db.unitframe.units.focustarget.customTexts = {}
	E.db.unitframe.units.party.customTexts = {}
	E.db.unitframe.units.pet.customTexts = {}
	E.db.unitframe.units.player.customTexts = {}
	E.db.unitframe.units.raid1.customTexts = {}
	E.db.unitframe.units.raid2.customTexts = {}
	E.db.unitframe.units.target.customTexts = {}
	E.db.unitframe.units.targettarget.customTexts = {}

	-- Custom Text: Arena
	E.db.unitframe.units.arena.customTexts.Luckyone_HP = { attachTextTo = 'Health', enable = true, font = Private.Font, fontOutline = Private.Outline, justifyH = 'LEFT', size = 14, text_format = '[luckyone:health:percent]', xOffset = 1, yOffset = 0 }
	E.db.unitframe.units.arena.customTexts.Luckyone_Name = { attachTextTo = 'Health', enable = true, font = Private.Font, fontOutline = Private.Outline, justifyH = 'CENTER', size = 14, text_format = '[classcolor][name:short]', xOffset = 0, yOffset = 0 }
	E.db.unitframe.units.arena.customTexts.Luckyone_Power = { attachTextTo = 'Health', enable = true, font = Private.Font, fontOutline = Private.Outline, justifyH = 'RIGHT', size = 14, text_format = '[powercolor][perpp<%]', xOffset = 0, yOffset = 0 }

	-- Custom Text: Boss
	E.db.unitframe.units.boss.customTexts.Luckyone_HP = { attachTextTo = 'Health', enable = true, font = Private.Font, fontOutline = Private.Outline, justifyH = 'LEFT', size = 14, text_format = '[luckyone:health:percent]', xOffset = 1, yOffset = 0 }
	E.db.unitframe.units.boss.customTexts.Luckyone_Name = { attachTextTo = 'Health', enable = true, font = Private.Font, fontOutline = Private.Outline, justifyH = 'CENTER', size = 14, text_format = '[classcolor][name:last]', xOffset = 0, yOffset = 0 }
	E.db.unitframe.units.boss.customTexts.Luckyone_Power = { attachTextTo = 'Health', enable = true, font = Private.Font, fontOutline = Private.Outline, justifyH = 'RIGHT', size = 14, text_format = '[powercolor][perpp<%]', xOffset = 0, yOffset = 0 }

	-- Custom Text: Focus
	E.db.unitframe.units.focus.customTexts.Luckyone_HP = { attachTextTo = 'Health', enable = true, font = Private.Font, fontOutline = Private.Outline, justifyH = 'CENTER', size = 14, text_format = '[luckyone:health:percent] | [health:current:shortvalue]', xOffset = 0, yOffset = 0 }
	E.db.unitframe.units.focus.customTexts.Luckyone_Level = { attachTextTo = 'InfoPanel', enable = true, font = Private.Font, fontOutline = Private.Outline, justifyH = 'RIGHT', size = 12, text_format = E.Retail and '[classcolor][level]' or '[difficultycolor][level][classificationcolor][ >shortclassification]', xOffset = 0, yOffset = 1 }
	E.db.unitframe.units.focus.customTexts.Luckyone_Name = { attachTextTo = 'InfoPanel', enable = true, font = Private.Font, fontOutline = Private.Outline, justifyH = 'CENTER', size = 12, text_format = '[classcolor][name:medium]', xOffset = 0, yOffset = 1 }
	E.db.unitframe.units.focus.customTexts.Luckyone_Power = { attachTextTo = 'InfoPanel', enable = true, font = Private.Font, fontOutline = Private.Outline, justifyH = 'LEFT', size = 12, text_format = '[powercolor][perpp<%]', xOffset = 1, yOffset = 1 }

	-- Custom Text: Focus Target
	E.db.unitframe.units.focustarget.customTexts.Luckyone_HP = { attachTextTo = 'Health', enable = true, font = Private.Font, fontOutline = Private.Outline, justifyH = 'CENTER', size = 14, text_format = '[luckyone:health:percent]', xOffset = 0, yOffset = 0 }
	E.db.unitframe.units.focustarget.customTexts.Luckyone_Name = { attachTextTo = 'InfoPanel', enable = true, font = Private.Font, fontOutline = Private.Outline, justifyH = 'CENTER', size = 12, text_format = '[classcolor][name:short]', xOffset = 0, yOffset = 1 }

	-- Custom Text: Party
	E.db.unitframe.units.party.customTexts.Luckyone_Name = { attachTextTo = 'Health', enable = true, font = Private.Font, fontOutline = Private.Outline, justifyH = 'CENTER', size = 14, text_format = '[classcolor][name:short]', xOffset = 0, yOffset = 0 }

	-- Custom Text: Pet
	E.db.unitframe.units.pet.customTexts.Luckyone_HP = { attachTextTo = 'Health', enable = true, font = Private.Font, fontOutline = Private.Outline, justifyH = 'CENTER', size = 14, text_format = '[luckyone:health:percent]', xOffset = 0, yOffset = 0 }
	E.db.unitframe.units.pet.customTexts.Luckyone_Name = { attachTextTo = 'InfoPanel', enable = true, font = Private.Font, fontOutline = Private.Outline, justifyH = 'CENTER', size = 12, text_format = E.Classic and '[happiness:color]Pet[ >happiness:full]' or '[classcolor]Pet', xOffset = 0, yOffset = 1 }

	-- Custom Text: Player
	E.db.unitframe.units.player.customTexts.Luckyone_HP = { attachTextTo = 'Health', enable = true, font = Private.Font, fontOutline = Private.Outline, justifyH = 'CENTER', size = 14, text_format = '[health:current:shortvalue] | [luckyone:health:percent]', xOffset = 0, yOffset = 0 }
	E.db.unitframe.units.player.customTexts.Luckyone_Level = { attachTextTo = 'InfoPanel', enable = true, font = Private.Font, fontOutline = Private.Outline, justifyH = 'LEFT', size = 12, text_format = '[classcolor][level]', xOffset = 1, yOffset = 1 }
	E.db.unitframe.units.player.customTexts.Luckyone_Name = { attachTextTo = 'InfoPanel', enable = true, font = Private.Font, fontOutline = Private.Outline, justifyH = 'CENTER', size = 12, text_format = '[classcolor][name]', xOffset = 0, yOffset = 1 }
	E.db.unitframe.units.player.customTexts.Luckyone_Power = { attachTextTo = 'InfoPanel', enable = true, font = Private.Font, fontOutline = Private.Outline, justifyH = 'RIGHT', size = 12, text_format = '[powercolor][perpp<%]', xOffset = 0, yOffset = 1 }

	-- Custom Text: Raid1
	E.db.unitframe.units.raid1.customTexts.Luckyone_Name = { attachTextTo = 'Health', enable = true, font = Private.Font, fontOutline = Private.Outline, justifyH = 'CENTER', size = 12, text_format = '[classcolor][name:short]', xOffset = 0, yOffset = 0 }

	-- Custom Text: Raid2
	E.db.unitframe.units.raid2.customTexts.Luckyone_Name = { attachTextTo = 'Health', enable = true, font = Private.Font, fontOutline = Private.Outline, justifyH = 'CENTER', size = 12, text_format = '[classcolor][name:short]', xOffset = 0, yOffset = 0 }

	-- Custom Text: Target
	E.db.unitframe.units.target.customTexts.Luckyone_HP = { attachTextTo = 'Health', enable = true, font = Private.Font, fontOutline = Private.Outline, justifyH = 'CENTER', size = 14, text_format = '[luckyone:health:percent] | [health:current:shortvalue]', xOffset = 0, yOffset = 0 }
	E.db.unitframe.units.target.customTexts.Luckyone_Level = { attachTextTo = 'InfoPanel', enable = true, font = Private.Font, fontOutline = Private.Outline, justifyH = 'RIGHT', size = 12, text_format = E.Retail and '[classcolor][level]' or '[difficultycolor][level][classificationcolor][ >shortclassification]', xOffset = 0, yOffset = 1 }
	E.db.unitframe.units.target.customTexts.Luckyone_Name = { attachTextTo = 'InfoPanel', enable = true, font = Private.Font, fontOutline = Private.Outline, justifyH = 'CENTER', size = 12, text_format = '[classcolor][name:last]', xOffset = 0, yOffset = 1 }
	E.db.unitframe.units.target.customTexts.Luckyone_Power = { attachTextTo = 'InfoPanel', enable = true, font = Private.Font, fontOutline = Private.Outline, justifyH = 'LEFT', size = 12, text_format = '[powercolor][perpp<%]', xOffset = 1, yOffset = 1 }

	-- Custom Text: TargetTarget
	E.db.unitframe.units.targettarget.customTexts.Luckyone_HP = { attachTextTo = 'Health', enable = true, font = Private.Font, fontOutline = Private.Outline, justifyH = 'CENTER', size = 14, text_format = '[luckyone:health:percent]', xOffset = 0, yOffset = 0 }
	E.db.unitframe.units.targettarget.customTexts.Luckyone_Name = { attachTextTo = 'InfoPanel', enable = true, font = Private.Font, fontOutline = Private.Outline, justifyH = 'CENTER', size = 12, text_format = '[classcolor][name:short]', xOffset = 0, yOffset = 1 }

	-- Shared UnitFrames media
	E.db.unitframe.colors.castbar_backdrop.a = 0.80
	E.db.unitframe.colors.castbar_backdrop.b = 0.05
	E.db.unitframe.colors.castbar_backdrop.g = 0.05
	E.db.unitframe.colors.castbar_backdrop.r = 0.05
	E.db.unitframe.colors.castColor.b = 0
	E.db.unitframe.colors.castColor.g = 1
	E.db.unitframe.colors.castColor.r = 0.02
	E.db.unitframe.colors.castInterruptedColor.b = 0.30
	E.db.unitframe.colors.castInterruptedColor.g = 0.30
	E.db.unitframe.colors.castInterruptedColor.r = 0.30
	E.db.unitframe.colors.castNoInterrupt.b = 0
	E.db.unitframe.colors.castNoInterrupt.g = 0
	E.db.unitframe.colors.castNoInterrupt.r = 1
	E.db.unitframe.colors.colorhealthbyvalue = false
	E.db.unitframe.colors.customcastbarbackdrop = true
	E.db.unitframe.colors.customhealthbackdrop = true
	E.db.unitframe.colors.frameGlow.mouseoverGlow.texture = Private.Texture
	E.db.unitframe.colors.healPrediction.overabsorbs.b = 1
	E.db.unitframe.colors.healPrediction.overabsorbs.r = 0
	E.db.unitframe.colors.health_backdrop_dead.b = 0.09
	E.db.unitframe.colors.health_backdrop_dead.g = 0.12
	E.db.unitframe.colors.health_backdrop_dead.r = 0.61
	E.db.unitframe.colors.health_backdrop.b = 0.61
	E.db.unitframe.colors.health_backdrop.g = 0.56
	E.db.unitframe.colors.health_backdrop.r = 0.54
	E.db.unitframe.colors.health.b = 0.05
	E.db.unitframe.colors.health.g = 0.05
	E.db.unitframe.colors.health.r = 0.05
	E.db.unitframe.colors.healthMultiplier = 0.75
	E.db.unitframe.colors.power_backdrop.b = 0.50
	E.db.unitframe.colors.power_backdrop.g = 0.50
	E.db.unitframe.colors.power_backdrop.r = 0.50
	E.db.unitframe.colors.power.LUNAR_POWER.b = 0.90
	E.db.unitframe.colors.power.LUNAR_POWER.g = 0.52
	E.db.unitframe.colors.power.LUNAR_POWER.r = 0.30
	E.db.unitframe.colors.tapped.b = 0.61
	E.db.unitframe.colors.tapped.g = 0.56
	E.db.unitframe.colors.tapped.r = 0.54
	E.db.unitframe.colors.transparentAurabars = true
	E.db.unitframe.colors.transparentHealth = true
	E.db.unitframe.colors.transparentPower = true
	E.db.unitframe.colors.useDeadBackdrop = true
	E.db.unitframe.cooldown.override = false
	E.db.unitframe.cooldown.threshold = 4
	E.db.unitframe.font = Private.Font
	E.db.unitframe.fontOutline = Private.Outline
	E.db.unitframe.fontSize = 12
	E.db.unitframe.statusbar = Private.Texture

	-- Shared Arena
	E.db.unitframe.units.arena.buffs.anchorPoint = 'TOPRIGHT'
	E.db.unitframe.units.arena.buffs.countFont = Private.Font
	E.db.unitframe.units.arena.buffs.countFontSize = 10
	E.db.unitframe.units.arena.buffs.countXOffset = 1
	E.db.unitframe.units.arena.buffs.maxDuration = 0
	E.db.unitframe.units.arena.buffs.numrows = 2
	E.db.unitframe.units.arena.buffs.priority = 'Blacklist,Whitelist,Dispellable,RaidBuffsElvUI'
	E.db.unitframe.units.arena.buffs.sizeOverride = 22
	E.db.unitframe.units.arena.buffs.xOffset = 23
	E.db.unitframe.units.arena.buffs.yOffset = -46
	E.db.unitframe.units.arena.castbar.customTextFont.enable = true
	E.db.unitframe.units.arena.castbar.customTextFont.font = Private.Font
	E.db.unitframe.units.arena.castbar.customTextFont.fontSize = 11
	E.db.unitframe.units.arena.castbar.customTimeFont.enable = true
	E.db.unitframe.units.arena.castbar.customTimeFont.font = Private.Font
	E.db.unitframe.units.arena.castbar.customTimeFont.fontSize = 11
	E.db.unitframe.units.arena.castbar.spark = false
	E.db.unitframe.units.arena.castbar.textColor.b = 1
	E.db.unitframe.units.arena.castbar.textColor.g = 1
	E.db.unitframe.units.arena.castbar.textColor.r = 1
	E.db.unitframe.units.arena.castbar.width = 240
	E.db.unitframe.units.arena.castbar.xOffsetText = 2
	E.db.unitframe.units.arena.castbar.xOffsetTime = -2
	E.db.unitframe.units.arena.debuffs.anchorPoint = 'TOPLEFT'
	E.db.unitframe.units.arena.debuffs.countFont = Private.Font
	E.db.unitframe.units.arena.debuffs.countFontSize = 10
	E.db.unitframe.units.arena.debuffs.countXOffset = 1
	E.db.unitframe.units.arena.debuffs.desaturate = true
	E.db.unitframe.units.arena.debuffs.growthX = 'LEFT'
	E.db.unitframe.units.arena.debuffs.growthY = 'DOWN'
	E.db.unitframe.units.arena.debuffs.maxDuration = 0
	E.db.unitframe.units.arena.debuffs.numrows = 2
	E.db.unitframe.units.arena.debuffs.priority = 'Blacklist,Whitelist,Personal,CCDebuffs'
	E.db.unitframe.units.arena.debuffs.sizeOverride = 22
	E.db.unitframe.units.arena.debuffs.spacing = 0
	E.db.unitframe.units.arena.debuffs.xOffset = -69
	E.db.unitframe.units.arena.debuffs.yOffset = -21
	E.db.unitframe.units.arena.disableTargetGlow = true
	E.db.unitframe.units.arena.healPrediction.absorbStyle = 'WRAPPED'
	E.db.unitframe.units.arena.health.text_format = ''
	E.db.unitframe.units.arena.health.xOffset = 0
	E.db.unitframe.units.arena.height = 45
	E.db.unitframe.units.arena.infoPanel.height = 16
	E.db.unitframe.units.arena.name.text_format = ''
	E.db.unitframe.units.arena.power.height = 6
	E.db.unitframe.units.arena.power.text_format = ''
	E.db.unitframe.units.arena.pvpclassificationindicator.size = 25
	E.db.unitframe.units.arena.pvpclassificationindicator.xOffset = -20
	E.db.unitframe.units.arena.pvpTrinket.position = 'LEFT'
	E.db.unitframe.units.arena.pvpTrinket.size = 45
	E.db.unitframe.units.arena.pvpTrinket.xOffset = -1
	E.db.unitframe.units.arena.spacing = 20
	E.db.unitframe.units.arena.width = 240

	-- Shared MA/MT
	E.db.unitframe.units.assist.enable = false
	E.db.unitframe.units.tank.enable = false

	-- Shared Boss
	E.db.unitframe.units.boss.buffs.anchorPoint = 'TOPRIGHT'
	E.db.unitframe.units.boss.buffs.countFont = Private.Font
	E.db.unitframe.units.boss.buffs.countFontSize = 10
	E.db.unitframe.units.boss.buffs.countXOffset = 1
	E.db.unitframe.units.boss.buffs.growthY = 'DOWN'
	E.db.unitframe.units.boss.buffs.numrows = 2
	E.db.unitframe.units.boss.buffs.priority = 'Blacklist,Whitelist,Dispellable,RaidBuffsElvUI'
	E.db.unitframe.units.boss.buffs.xOffset = 23
	E.db.unitframe.units.boss.buffs.yOffset = -21
	E.db.unitframe.units.boss.castbar.customTextFont.enable = true
	E.db.unitframe.units.boss.castbar.customTextFont.font = Private.Font
	E.db.unitframe.units.boss.castbar.customTextFont.fontSize = 11
	E.db.unitframe.units.boss.castbar.customTimeFont.enable = true
	E.db.unitframe.units.boss.castbar.customTimeFont.font = Private.Font
	E.db.unitframe.units.boss.castbar.customTimeFont.fontSize = 11
	E.db.unitframe.units.boss.castbar.spark = false
	E.db.unitframe.units.boss.castbar.textColor.b = 1
	E.db.unitframe.units.boss.castbar.textColor.g = 1
	E.db.unitframe.units.boss.castbar.textColor.r = 1
	E.db.unitframe.units.boss.castbar.width = 200
	E.db.unitframe.units.boss.castbar.xOffsetText = 2
	E.db.unitframe.units.boss.castbar.xOffsetTime = -2
	E.db.unitframe.units.boss.debuffs.anchorPoint = 'TOPLEFT'
	E.db.unitframe.units.boss.debuffs.countFont = Private.Font
	E.db.unitframe.units.boss.debuffs.countFontSize = 10
	E.db.unitframe.units.boss.debuffs.countXOffset = 1
	E.db.unitframe.units.boss.debuffs.growthX = 'LEFT'
	E.db.unitframe.units.boss.debuffs.growthY = 'DOWN'
	E.db.unitframe.units.boss.debuffs.numrows = 2
	E.db.unitframe.units.boss.debuffs.priority = 'Blacklist,Whitelist,Personal,CCDebuffs'
	E.db.unitframe.units.boss.debuffs.spacing = 0
	E.db.unitframe.units.boss.debuffs.xOffset = -23
	E.db.unitframe.units.boss.debuffs.yOffset = -21
	E.db.unitframe.units.boss.disableTargetGlow = true
	E.db.unitframe.units.boss.health.text_format = ''
	E.db.unitframe.units.boss.health.xOffset = 0
	E.db.unitframe.units.boss.height = 45
	E.db.unitframe.units.boss.name.text_format = ''
	E.db.unitframe.units.boss.power.height = 6
	E.db.unitframe.units.boss.power.text_format = ''
	E.db.unitframe.units.boss.spacing = 20
	E.db.unitframe.units.boss.width = 200

	-- Shared Focus
	E.db.unitframe.units.focus.buffs.anchorPoint = 'TOPRIGHT'
	E.db.unitframe.units.focus.buffs.countFont = Private.Font
	E.db.unitframe.units.focus.buffs.countFontSize = 13
	E.db.unitframe.units.focus.buffs.countPosition = 'TOP'
	E.db.unitframe.units.focus.buffs.countYOffset = 14
	E.db.unitframe.units.focus.buffs.enable = true
	E.db.unitframe.units.focus.buffs.growthX = 'LEFT'
	E.db.unitframe.units.focus.buffs.maxDuration = 0
	E.db.unitframe.units.focus.buffs.perrow = 2
	E.db.unitframe.units.focus.buffs.priority = 'Blacklist,Whitelist,Dispellable,RaidBuffsElvUI'
	E.db.unitframe.units.focus.buffs.sizeOverride = 23
	E.db.unitframe.units.focus.castbar.customTextFont.enable = true
	E.db.unitframe.units.focus.castbar.customTextFont.font = Private.Font
	E.db.unitframe.units.focus.castbar.customTextFont.fontSize = 11
	E.db.unitframe.units.focus.castbar.customTimeFont.enable = true
	E.db.unitframe.units.focus.castbar.customTimeFont.font = Private.Font
	E.db.unitframe.units.focus.castbar.customTimeFont.fontSize = 11
	E.db.unitframe.units.focus.castbar.spark = false
	E.db.unitframe.units.focus.castbar.textColor.b = 1
	E.db.unitframe.units.focus.castbar.textColor.g = 1
	E.db.unitframe.units.focus.castbar.textColor.r = 1
	E.db.unitframe.units.focus.castbar.timeToHold = 2
	E.db.unitframe.units.focus.castbar.width = 191
	E.db.unitframe.units.focus.castbar.xOffsetText = 2
	E.db.unitframe.units.focus.castbar.xOffsetTime = -2
	E.db.unitframe.units.focus.CombatIcon.enable = false
	E.db.unitframe.units.focus.debuffs.anchorPoint = 'TOPLEFT'
	E.db.unitframe.units.focus.debuffs.countFont = Private.Font
	E.db.unitframe.units.focus.debuffs.countFontSize = 13
	E.db.unitframe.units.focus.debuffs.countPosition = 'TOP'
	E.db.unitframe.units.focus.debuffs.countYOffset = 14
	E.db.unitframe.units.focus.debuffs.desaturate = false
	E.db.unitframe.units.focus.debuffs.growthX = 'RIGHT'
	E.db.unitframe.units.focus.debuffs.maxDuration = 0
	E.db.unitframe.units.focus.debuffs.perrow = 8
	E.db.unitframe.units.focus.debuffs.priority = 'Blacklist,Whitelist,Personal,CCDebuffs'
	E.db.unitframe.units.focus.disableMouseoverGlow = true
	E.db.unitframe.units.focus.disableTargetGlow = true
	E.db.unitframe.units.focus.healPrediction.absorbStyle = 'WRAPPED'
	E.db.unitframe.units.focus.health.position = 'CENTER'
	E.db.unitframe.units.focus.health.xOffset = 0
	E.db.unitframe.units.focus.height = 30
	E.db.unitframe.units.focus.infoPanel.enable = true
	E.db.unitframe.units.focus.infoPanel.height = 17
	E.db.unitframe.units.focus.infoPanel.transparent = true
	E.db.unitframe.units.focus.name.position = 'TOPLEFT'
	E.db.unitframe.units.focus.name.text_format = ''
	E.db.unitframe.units.focus.name.yOffset = 20
	E.db.unitframe.units.focus.orientation = 'LEFT'
	E.db.unitframe.units.focus.power.detachedWidth = 189
	E.db.unitframe.units.focus.power.height = 6
	E.db.unitframe.units.focus.power.position = 'RIGHT'
	E.db.unitframe.units.focus.power.powerPrediction = true
	E.db.unitframe.units.focus.power.xOffset = -2
	E.db.unitframe.units.focus.raidicon.attachTo = 'RIGHT'
	E.db.unitframe.units.focus.raidicon.attachToObject = 'Health'
	E.db.unitframe.units.focus.raidicon.xOffset = -2
	E.db.unitframe.units.focus.raidicon.yOffset = 0
	E.db.unitframe.units.focus.threatStyle = 'NONE'
	E.db.unitframe.units.focustarget.buffs.countFont = Private.Font
	E.db.unitframe.units.focustarget.buffs.priority = 'Blacklist,Personal,Dispellable'
	E.db.unitframe.units.focustarget.debuffs.attachTo = 'BUFFS'
	E.db.unitframe.units.focustarget.debuffs.countFont = Private.Font
	E.db.unitframe.units.focustarget.debuffs.maxDuration = 0
	E.db.unitframe.units.focustarget.disableMouseoverGlow = true
	E.db.unitframe.units.focustarget.disableTargetGlow = true
	E.db.unitframe.units.focustarget.enable = true
	E.db.unitframe.units.focustarget.health.position = 'CENTER'
	E.db.unitframe.units.focustarget.health.xOffset = 0
	E.db.unitframe.units.focustarget.height = 30
	E.db.unitframe.units.focustarget.infoPanel.enable = true
	E.db.unitframe.units.focustarget.infoPanel.height = 17
	E.db.unitframe.units.focustarget.infoPanel.transparent = true
	E.db.unitframe.units.focustarget.name.text_format = ''
	E.db.unitframe.units.focustarget.power.height = 6
	E.db.unitframe.units.focustarget.power.powerPrediction = true
	E.db.unitframe.units.focustarget.raidicon.attachTo = 'RIGHT'
	E.db.unitframe.units.focustarget.raidicon.attachToObject = 'Health'
	E.db.unitframe.units.focustarget.raidicon.xOffset = -2
	E.db.unitframe.units.focustarget.raidicon.yOffset = 0
	E.db.unitframe.units.focustarget.width = 80

	-- Shared Pet
	E.db.unitframe.units.pet.buffs.countFont = Private.Font
	E.db.unitframe.units.pet.buffs.countFontSize = 11
	E.db.unitframe.units.pet.buffs.countYOffset = 1
	E.db.unitframe.units.pet.buffs.enable = false
	E.db.unitframe.units.pet.buffs.maxDuration = 0
	E.db.unitframe.units.pet.buffs.numrows = 2
	E.db.unitframe.units.pet.buffs.perrow = 4
	E.db.unitframe.units.pet.buffs.priority = 'Blacklist,blockNoDuration,Personal,MyPet'
	E.db.unitframe.units.pet.buffs.sizeOverride = 20
	E.db.unitframe.units.pet.buffs.spacing = 0
	E.db.unitframe.units.pet.buffs.yOffset = -2
	E.db.unitframe.units.pet.castbar.enable = false
	E.db.unitframe.units.pet.debuffs.anchorPoint = 'TOPLEFT'
	E.db.unitframe.units.pet.debuffs.countFont = Private.Font
	E.db.unitframe.units.pet.debuffs.countPosition = 'TOP'
	E.db.unitframe.units.pet.debuffs.countYOffset = 13
	E.db.unitframe.units.pet.debuffs.enable = false
	E.db.unitframe.units.pet.debuffs.growthX = 'RIGHT'
	E.db.unitframe.units.pet.debuffs.maxDuration = 0
	E.db.unitframe.units.pet.debuffs.perrow = 4
	E.db.unitframe.units.pet.debuffs.priority = 'Blacklist,Personal,nonPersonal'
	E.db.unitframe.units.pet.debuffs.sizeOverride = 20
	E.db.unitframe.units.pet.debuffs.spacing = 0
	E.db.unitframe.units.pet.disableMouseoverGlow = true
	E.db.unitframe.units.pet.healPrediction.absorbStyle = 'WRAPPED'
	E.db.unitframe.units.pet.health.position = 'CENTER'
	E.db.unitframe.units.pet.health.xOffset = 0
	E.db.unitframe.units.pet.height = 30
	E.db.unitframe.units.pet.infoPanel.enable = true
	E.db.unitframe.units.pet.infoPanel.height = 17
	E.db.unitframe.units.pet.infoPanel.transparent = true
	E.db.unitframe.units.pet.name.text_format = ''
	E.db.unitframe.units.pet.power.enable = true
	E.db.unitframe.units.pet.power.height = 6
	E.db.unitframe.units.pet.power.powerPrediction = true
	E.db.unitframe.units.pet.raidicon.attachTo = 'LEFT'
	E.db.unitframe.units.pet.raidicon.attachToObject = 'Health'
	E.db.unitframe.units.pet.raidicon.xOffset = 2
	E.db.unitframe.units.pet.raidicon.yOffset = 0
	E.db.unitframe.units.pet.threatStyle = 'NONE'
	E.db.unitframe.units.pet.width = 80
	E.db.unitframe.units.player.aurabar.enable = false
	E.db.unitframe.units.player.buffs.attachTo = 'FRAME'
	E.db.unitframe.units.player.buffs.countFont = Private.Font
	E.db.unitframe.units.player.buffs.priority = 'Blacklist,Personal,nonPersonal'
	E.db.unitframe.units.player.buffs.yOffset = 1
	E.db.unitframe.units.player.castbar.customTextFont.enable = true
	E.db.unitframe.units.player.castbar.customTextFont.font = Private.Font
	E.db.unitframe.units.player.castbar.customTextFont.fontSize = 11
	E.db.unitframe.units.player.castbar.customTimeFont.enable = true
	E.db.unitframe.units.player.castbar.customTimeFont.font = Private.Font
	E.db.unitframe.units.player.castbar.customTimeFont.fontSize = 11
	E.db.unitframe.units.player.castbar.height = 20
	E.db.unitframe.units.player.castbar.latency = false
	E.db.unitframe.units.player.castbar.spark = false
	E.db.unitframe.units.player.castbar.textColor.b = 1
	E.db.unitframe.units.player.castbar.textColor.g = 1
	E.db.unitframe.units.player.castbar.textColor.r = 1
	E.db.unitframe.units.player.castbar.timeToHold = 2
	E.db.unitframe.units.player.castbar.width = 359
	E.db.unitframe.units.player.castbar.xOffsetText = 2
	E.db.unitframe.units.player.castbar.xOffsetTime = -2
	E.db.unitframe.units.player.classbar.enable = false
	E.db.unitframe.units.player.CombatIcon.enable = false
	E.db.unitframe.units.player.debuffs.anchorPoint = 'TOPRIGHT'
	E.db.unitframe.units.player.debuffs.countFont = Private.Font
	E.db.unitframe.units.player.debuffs.countFontSize = 13
	E.db.unitframe.units.player.debuffs.countPosition = 'TOP'
	E.db.unitframe.units.player.debuffs.countYOffset = 14
	E.db.unitframe.units.player.debuffs.desaturate = false
	E.db.unitframe.units.player.debuffs.growthX = 'LEFT'
	E.db.unitframe.units.player.disableMouseoverGlow = true
	E.db.unitframe.units.player.healPrediction.absorbStyle = 'WRAPPED'
	E.db.unitframe.units.player.health.position = 'CENTER'
	E.db.unitframe.units.player.health.text_format = ''
	E.db.unitframe.units.player.health.xOffset = 0
	E.db.unitframe.units.player.height = 30
	E.db.unitframe.units.player.infoPanel.enable = true
	E.db.unitframe.units.player.infoPanel.height = 17
	E.db.unitframe.units.player.infoPanel.transparent = true
	E.db.unitframe.units.player.name.position = 'TOPRIGHT'
	E.db.unitframe.units.player.name.yOffset = 20
	E.db.unitframe.units.player.partyIndicator.enable = false
	E.db.unitframe.units.player.power.height = 6
	E.db.unitframe.units.player.power.position = 'LEFT'
	E.db.unitframe.units.player.power.powerPrediction = true
	E.db.unitframe.units.player.power.text_format = ''
	E.db.unitframe.units.player.power.xOffset = 2
	E.db.unitframe.units.player.pvp.position = 'CENTER'
	E.db.unitframe.units.player.pvp.text_format = ''
	E.db.unitframe.units.player.pvpIcon.scale = 0.85
	E.db.unitframe.units.player.raidicon.attachTo = 'LEFT'
	E.db.unitframe.units.player.raidicon.attachToObject = 'Health'
	E.db.unitframe.units.player.raidicon.xOffset = 2
	E.db.unitframe.units.player.raidicon.yOffset = 0
	E.db.unitframe.units.player.raidRoleIcons.yOffset = 1
	E.db.unitframe.units.player.RestIcon.enable = false
	E.db.unitframe.units.player.threatStyle = 'NONE'
	E.db.unitframe.units.player.width = 190

	-- Shared Target
	E.db.unitframe.units.target.aurabar.enable = false
	E.db.unitframe.units.target.buffs.countFont = Private.Font
	E.db.unitframe.units.target.buffs.countFontSize = 13
	E.db.unitframe.units.target.buffs.countPosition = 'TOP'
	E.db.unitframe.units.target.buffs.countYOffset = 14
	E.db.unitframe.units.target.buffs.perrow = 2
	E.db.unitframe.units.target.buffs.priority = 'Blacklist,Whitelist,Dispellable,RaidBuffsElvUI'
	E.db.unitframe.units.target.buffs.sizeOverride = 23
	E.db.unitframe.units.target.castbar.customTextFont.enable = true
	E.db.unitframe.units.target.castbar.customTextFont.font = Private.Font
	E.db.unitframe.units.target.castbar.customTextFont.fontSize = 11
	E.db.unitframe.units.target.castbar.customTimeFont.enable = true
	E.db.unitframe.units.target.castbar.customTimeFont.font = Private.Font
	E.db.unitframe.units.target.castbar.customTimeFont.fontSize = 11
	E.db.unitframe.units.target.castbar.spark = false
	E.db.unitframe.units.target.castbar.textColor.b = 1
	E.db.unitframe.units.target.castbar.textColor.g = 1
	E.db.unitframe.units.target.castbar.textColor.r = 1
	E.db.unitframe.units.target.castbar.timeToHold = 2
	E.db.unitframe.units.target.castbar.width = 191
	E.db.unitframe.units.target.castbar.xOffsetText = 2
	E.db.unitframe.units.target.castbar.xOffsetTime = -2
	E.db.unitframe.units.target.CombatIcon.enable = false
	E.db.unitframe.units.target.debuffs.anchorPoint = 'TOPLEFT'
	E.db.unitframe.units.target.debuffs.attachTo = 'FRAME'
	E.db.unitframe.units.target.debuffs.countFont = Private.Font
	E.db.unitframe.units.target.debuffs.countFontSize = 13
	E.db.unitframe.units.target.debuffs.countPosition = 'TOP'
	E.db.unitframe.units.target.debuffs.countYOffset = 14
	E.db.unitframe.units.target.debuffs.desaturate = false
	E.db.unitframe.units.target.debuffs.growthX = 'RIGHT'
	E.db.unitframe.units.target.debuffs.maxDuration = 0
	E.db.unitframe.units.target.debuffs.priority = 'Blacklist,Whitelist,Personal,CCDebuffs'
	E.db.unitframe.units.target.disableMouseoverGlow = true
	E.db.unitframe.units.target.healPrediction.absorbStyle = 'WRAPPED'
	E.db.unitframe.units.target.health.position = 'CENTER'
	E.db.unitframe.units.target.health.text_format = ''
	E.db.unitframe.units.target.health.xOffset = 0
	E.db.unitframe.units.target.height = 30
	E.db.unitframe.units.target.infoPanel.enable = true
	E.db.unitframe.units.target.infoPanel.height = 17
	E.db.unitframe.units.target.infoPanel.transparent = true
	E.db.unitframe.units.target.middleClickFocus = false
	E.db.unitframe.units.target.name.position = 'TOPLEFT'
	E.db.unitframe.units.target.name.text_format = ''
	E.db.unitframe.units.target.name.yOffset = 20
	E.db.unitframe.units.target.orientation = 'LEFT'
	E.db.unitframe.units.target.phaseIndicator.anchorPoint = 'LEFT'
	E.db.unitframe.units.target.phaseIndicator.scale = 0.5
	E.db.unitframe.units.target.phaseIndicator.xOffset = 5
	E.db.unitframe.units.target.power.detachedWidth = 189
	E.db.unitframe.units.target.power.height = 6
	E.db.unitframe.units.target.power.position = 'RIGHT'
	E.db.unitframe.units.target.power.powerPrediction = true
	E.db.unitframe.units.target.power.text_format = ''
	E.db.unitframe.units.target.power.xOffset = -2
	E.db.unitframe.units.target.raidicon.attachTo = 'RIGHT'
	E.db.unitframe.units.target.raidicon.attachToObject = 'Health'
	E.db.unitframe.units.target.raidicon.xOffset = -2
	E.db.unitframe.units.target.raidicon.yOffset = 0
	E.db.unitframe.units.target.raidRoleIcons.position = 'TOPRIGHT'
	E.db.unitframe.units.target.raidRoleIcons.yOffset = 1
	E.db.unitframe.units.target.threatStyle = 'NONE'
	E.db.unitframe.units.target.width = 190
	E.db.unitframe.units.targettarget.debuffs.enable = false
	E.db.unitframe.units.targettarget.disableMouseoverGlow = true
	E.db.unitframe.units.targettarget.health.position = 'CENTER'
	E.db.unitframe.units.targettarget.health.xOffset = 0
	E.db.unitframe.units.targettarget.height = 30
	E.db.unitframe.units.targettarget.infoPanel.enable = true
	E.db.unitframe.units.targettarget.infoPanel.height = 17
	E.db.unitframe.units.targettarget.infoPanel.transparent = true
	E.db.unitframe.units.targettarget.name.text_format = ''
	E.db.unitframe.units.targettarget.power.height = 6
	E.db.unitframe.units.targettarget.power.powerPrediction = true
	E.db.unitframe.units.targettarget.raidicon.attachTo = 'RIGHT'
	E.db.unitframe.units.targettarget.raidicon.attachToObject = 'Health'
	E.db.unitframe.units.targettarget.raidicon.xOffset = -2
	E.db.unitframe.units.targettarget.raidicon.yOffset = 0
	E.db.unitframe.units.targettarget.width = 80

	-- Growth Directions shared
	E.db.unitframe.units.raid1.growthDirection = 'RIGHT_DOWN'
	E.db.unitframe.units.raid2.growthDirection = 'RIGHT_DOWN'
	E.db.unitframe.units.raid3.growthDirection = 'RIGHT_DOWN'

	-- Shared movers
	E.db.movers.AlertFrameMover = 'TOP,ElvUIParent,TOP,0,-135'
	E.db.movers.ArenaHeaderMover = 'TOPRIGHT,ElvUIParent,TOPRIGHT,-271,-235'
	E.db.movers.ArtifactBarMover = 'BOTTOM,ElvUIParent,BOTTOM,1,16'
	E.db.movers.AzeriteBarMover = 'BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,427,1'
	E.db.movers.BelowMinimapContainerMover = E.Retail and 'BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,70,485' or 'TOP,UIParent,TOP,0,-26'
	E.db.movers.BNETMover = 'BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,1,173'
	E.db.movers.BossBannerMover = 'TOP,ElvUIParent,TOP,0,-139'
	E.db.movers.BossButton = 'BOTTOM,ElvUIParent,BOTTOM,-168,128'
	E.db.movers.BossHeaderMover = 'TOPRIGHT,ElvUIParent,TOPRIGHT,-271,-235'
	E.db.movers.BuffsMover = 'TOPRIGHT,ElvUIParent,TOPRIGHT,-166,-1'
	E.db.movers.DebuffsMover = 'TOPRIGHT,ElvUIParent,TOPRIGHT,-166,-128'
	E.db.movers.DurabilityFrameMover = 'TOPRIGHT,ElvUIParent,TOPRIGHT,-1,-214'
	E.db.movers.ElvAB_1 = 'BOTTOM,ElvUIParent,BOTTOM,0,16'
	E.db.movers.ElvAB_2 = 'BOTTOM,ElvUIParent,BOTTOM,0,76'
	E.db.movers.ElvAB_3 = 'BOTTOM,ElvUIParent,BOTTOM,0,46'
	E.db.movers.ElvAB_4 = E.Retail and 'BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-1,203' or 'BOTTOM,ElvUIParent,BOTTOM,-270,1'
	E.db.movers.ElvAB_5 = 'TOPRIGHT,ElvUIParent,TOPRIGHT,-1,-343'
	E.db.movers.ElvAB_6 = E.Retail and 'BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-1,173' or 'BOTTOM,ElvUIParent,BOTTOM,270,1'
	E.db.movers.ElvAB_7 = 'BOTTOM,ElvUIParent,BOTTOM,0,168'
	E.db.movers.ElvAB_8 = 'BOTTOM,ElvUIParent,BOTTOM,0,197'
	E.db.movers.ElvAB_9 = 'BOTTOM,ElvUIParent,BOTTOM,0,226'
	E.db.movers.ElvAB_10 = 'BOTTOM,ElvUIParent,BOTTOM,0,255'
	E.db.movers.ElvUIBagMover = 'BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-1,173'
	E.db.movers.ElvUIBankMover = 'BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,1,173'
	E.db.movers.EventToastMover = 'TOP,ElvUIParent,TOP,0,-139'
	E.db.movers.ExperienceBarMover = 'BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,416,1'
	E.db.movers.GMMover = 'TOPRIGHT,ElvUIParent,TOPRIGHT,-503,-1'
	E.db.movers.HonorBarMover = 'BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-427,1'
	E.db.movers.LeftChatMover = 'BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,1,1'
	E.db.movers.LootFrameMover = 'TOP,ElvUIParent,TOP,0,-156'
	E.db.movers.LossControlMover = 'TOP,ElvUIParent,TOP,0,-492'
	E.db.movers.MawBuffsBelowMinimapMover = 'TOPRIGHT,ElvUIParent,TOPRIGHT,-15,-380'
	E.db.movers.MinimapMover = 'TOPRIGHT,ElvUIParent,TOPRIGHT,-1,-1'
	E.db.movers.MirrorTimer1Mover = 'TOP,ElvUIParent,TOP,0,-78'
	E.db.movers.MirrorTimer2Mover = 'TOP,ElvUIParent,TOP,0,-97'
	E.db.movers.MirrorTimer3Mover = 'TOP,ElvUIParent,TOP,0,-116'
	E.db.movers.ObjectiveFrameMover = 'TOPRIGHT,ElvUIParent,TOPRIGHT,-100,-215'
	E.db.movers.PetAB = 'BOTTOM,ElvUIParent,BOTTOM,0,128'
	E.db.movers.PetExperienceBarMover = 'BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,427,1'
	E.db.movers.QuestWatchFrameMover = 'TOPRIGHT,ElvUIParent,TOPRIGHT,-115,-215'
	E.db.movers.ReputationBarMover = 'BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-416,1'
	E.db.movers.RightChatMover = 'BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-1,1'
	E.db.movers.ShiftAB = 'TOPLEFT,ElvUIParent,TOPLEFT,1,-1'
	E.db.movers.SocialMenuMover = 'BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,4,196'
	E.db.movers.TalkingHeadFrameMover = 'BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-2,173'
	E.db.movers.ThreatBarMover = 'BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-438,1'
	E.db.movers.TooltipMover = 'BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,0,135'
	E.db.movers.TopCenterContainerMover = 'TOP,ElvUIParent,TOP,0,-57'
	E.db.movers.TorghastBuffsMover = 'TOPLEFT,ElvUIParent,TOPLEFT,4,-51'
	E.db.movers.VOICECHAT = 'TOPLEFT,ElvUIParent,TOPLEFT,1,-27'
	E.db.movers.ZoneAbility = 'BOTTOM,ElvUIParent,BOTTOM,168,128'

	if layout == 'main' then

		-- Main growth directions
		E.db.unitframe.units.party.growthDirection = 'DOWN_RIGHT'

		-- Main movers
		E.db.movers.AltPowerBarMover = 'BOTTOM,ElvUIParent,BOTTOM,0,158'
		E.db.movers.ElvUF_AssistMover = 'TOPLEFT,ElvUIParent,BOTTOMLEFT,0,1048'
		E.db.movers.ElvUF_FocusCastbarMover = 'BOTTOM,ElvUIParent,BOTTOM,253,451'
		E.db.movers.ElvUF_FocusMover = 'BOTTOM,ElvUIParent,BOTTOM,253,470'
		E.db.movers.ElvUF_FocusTargetMover = 'BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-530,470'
		E.db.movers.ElvUF_PartyMover = 'TOPLEFT,ElvUIParent,TOPLEFT,450,-323'
		E.db.movers.ElvUF_PetMover = 'BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,531,320'
		E.db.movers.ElvUF_PlayerCastbarMover = 'BOTTOM,ElvUIParent,BOTTOM,0,106'
		E.db.movers.ElvUF_PlayerMover = 'BOTTOM,ElvUIParent,BOTTOM,-253,320'
		E.db.movers.ElvUF_Raid1Mover = 'BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,1,173'
		E.db.movers.ElvUF_Raid2Mover = 'BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,1,173'
		E.db.movers.ElvUF_Raid3Mover = 'BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,1,173'
		E.db.movers.ElvUF_TargetCastbarMover = 'BOTTOM,ElvUIParent,BOTTOM,253,301'
		E.db.movers.ElvUF_TargetMover = 'BOTTOM,ElvUIParent,BOTTOM,253,320'
		E.db.movers.ElvUF_TargetTargetMover = 'BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-530,320'
		E.db.movers.MicrobarMover = 'TOPLEFT,ElvUIParent,TOPLEFT,157,-1'
		E.db.movers.PlayerChoiceToggle = 'BOTTOM,UIParent,BOTTOM,0,182'
		E.db.movers.VehicleLeaveButton = 'BOTTOM,ElvUIParent,BOTTOM,0,182'
		E.db.movers.VehicleSeatMover = 'BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,486,1'

		-- Main Party
		E.db.unitframe.units.party.buffIndicator.size = 12
		E.db.unitframe.units.party.buffs.countFont = Private.Font
		E.db.unitframe.units.party.buffs.perrow = 3
		E.db.unitframe.units.party.classbar.enable = false
		E.db.unitframe.units.party.debuffs.countFont = Private.Font
		E.db.unitframe.units.party.debuffs.countFontSize = 13
		E.db.unitframe.units.party.debuffs.countXOffset = 1
		E.db.unitframe.units.party.debuffs.maxDuration = 0
		E.db.unitframe.units.party.debuffs.perrow = 2
		E.db.unitframe.units.party.debuffs.priority = 'Blacklist,RaidDebuffs,Dispellable'
		E.db.unitframe.units.party.debuffs.sizeOverride = 40
		E.db.unitframe.units.party.debuffs.xOffset = 1
		E.db.unitframe.units.party.debuffs.yOffset = -1
		E.db.unitframe.units.party.disableMouseoverGlow = true
		E.db.unitframe.units.party.disableTargetGlow = true
		E.db.unitframe.units.party.healPrediction.absorbStyle = 'WRAPPED'
		E.db.unitframe.units.party.healPrediction.enable = true
		E.db.unitframe.units.party.health.position = 'BOTTOM'
		E.db.unitframe.units.party.health.text_format = ''
		E.db.unitframe.units.party.health.xOffset = 0
		E.db.unitframe.units.party.health.yOffset = 2
		E.db.unitframe.units.party.height = 40
		E.db.unitframe.units.party.horizontalSpacing = 1
		E.db.unitframe.units.party.infoPanel.height = 17
		E.db.unitframe.units.party.name.attachTextTo = 'Frame'
		E.db.unitframe.units.party.name.text_format = ''
		E.db.unitframe.units.party.orientation = 'MIDDLE'
		E.db.unitframe.units.party.petsGroup.anchorPoint = 'LEFT'
		E.db.unitframe.units.party.petsGroup.height = 20
		E.db.unitframe.units.party.phaseIndicator.scale = 0.5
		E.db.unitframe.units.party.phaseIndicator.xOffset = -50
		E.db.unitframe.units.party.power.enable = false
		E.db.unitframe.units.party.raidicon.attachTo = 'CENTER'
		E.db.unitframe.units.party.raidicon.attachToObject = 'Health'
		E.db.unitframe.units.party.raidicon.size = 14
		E.db.unitframe.units.party.raidicon.yOffset = 12
		E.db.unitframe.units.party.raidRoleIcons.yOffset = 1
		E.db.unitframe.units.party.rdebuffs.enable = false
		E.db.unitframe.units.party.roleIcon.enable = false
		E.db.unitframe.units.party.roleIcon.position = 'LEFT'
		E.db.unitframe.units.party.roleIcon.size = 16
		E.db.unitframe.units.party.roleIcon.xOffset = 0
		E.db.unitframe.units.party.roleIcon.yOffset = 0
		E.db.unitframe.units.party.summonIcon.size = 25
		E.db.unitframe.units.party.summonIcon.xOffset = 50
		E.db.unitframe.units.party.targetsGroup.height = 10
		E.db.unitframe.units.party.threatStyle = 'NONE'
		E.db.unitframe.units.party.verticalSpacing = 2
		E.db.unitframe.units.party.width = 150

		-- Main Raid1
		E.db.unitframe.units.raid1.classbar.enable = false
		E.db.unitframe.units.raid1.debuffs.anchorPoint = 'BOTTOM'
		E.db.unitframe.units.raid1.debuffs.countFont = Private.Font
		E.db.unitframe.units.raid1.debuffs.countFontSize = 14
		E.db.unitframe.units.raid1.debuffs.desaturate = false
		E.db.unitframe.units.raid1.debuffs.maxDuration = 0
		E.db.unitframe.units.raid1.debuffs.priority = 'Blacklist,RaidDebuffs,Dispellable'
		E.db.unitframe.units.raid1.debuffs.sizeOverride = 16
		E.db.unitframe.units.raid1.debuffs.spacing = 0
		E.db.unitframe.units.raid1.debuffs.yOffset = 16
		E.db.unitframe.units.raid1.disableMouseoverGlow = true
		E.db.unitframe.units.raid1.disableTargetGlow = true
		E.db.unitframe.units.raid1.healPrediction.absorbStyle = 'WRAPPED'
		E.db.unitframe.units.raid1.healPrediction.enable = true
		E.db.unitframe.units.raid1.health.text_format = ''
		E.db.unitframe.units.raid1.height = 40
		E.db.unitframe.units.raid1.horizontalSpacing = 1
		E.db.unitframe.units.raid1.name.attachTextTo = 'Frame'
		E.db.unitframe.units.raid1.name.position = 'LEFT'
		E.db.unitframe.units.raid1.name.text_format = ''
		E.db.unitframe.units.raid1.numGroups = E.Retail and 4 or 5
		E.db.unitframe.units.raid1.phaseIndicator.anchorPoint = 'BOTTOM'
		E.db.unitframe.units.raid1.phaseIndicator.scale = 0.5
		E.db.unitframe.units.raid1.power.enable = false
		E.db.unitframe.units.raid1.raidicon.attachTo = 'BOTTOM'
		E.db.unitframe.units.raid1.raidicon.attachToObject = 'Health'
		E.db.unitframe.units.raid1.raidicon.size = 12
		E.db.unitframe.units.raid1.raidicon.yOffset = 1
		E.db.unitframe.units.raid1.raidRoleIcons.yOffset = 1
		E.db.unitframe.units.raid1.rdebuffs.font = Private.Font
		E.db.unitframe.units.raid1.rdebuffs.fontOutline = Private.Outline
		E.db.unitframe.units.raid1.rdebuffs.size = 18
		E.db.unitframe.units.raid1.rdebuffs.stack.position = 'CENTER'
		E.db.unitframe.units.raid1.rdebuffs.stack.yOffset = 0
		E.db.unitframe.units.raid1.readycheckIcon.attachTo = 'Frame'
		E.db.unitframe.units.raid1.readycheckIcon.xOffset = 1
		E.db.unitframe.units.raid1.resurrectIcon.size = 25
		E.db.unitframe.units.raid1.roleIcon.attachTo = 'Frame'
		E.db.unitframe.units.raid1.roleIcon.damager = false
		E.db.unitframe.units.raid1.roleIcon.position = 'TOP'
		E.db.unitframe.units.raid1.roleIcon.size = 12
		E.db.unitframe.units.raid1.roleIcon.xOffset = 0
		E.db.unitframe.units.raid1.roleIcon.yOffset = 0
		E.db.unitframe.units.raid1.summonIcon.attachTo = 'BOTTOM'
		E.db.unitframe.units.raid1.summonIcon.size = 25
		E.db.unitframe.units.raid1.threatStyle = 'NONE'
		E.db.unitframe.units.raid1.verticalSpacing = 1
		E.db.unitframe.units.raid1.visibility = E.Retail and '[@raid6,noexists][@raid21,exists] hide;show' or '[@raid6,noexists][@raid11,exists] hide;show'
		E.db.unitframe.units.raid1.width = 82

		-- Main Raid2
		E:CopyTable(E.db.unitframe.units.raid2, E.db.unitframe.units.raid1)
		E.db.unitframe.units.raid2.numGroups = 6
		E.db.unitframe.units.raid2.visibility = E.Retail and '[@raid21,noexists][@raid31,exists] hide;show' or '[@raid11,noexists][@raid26,exists] hide;show'

		-- Main Raid3
		E.db.unitframe.units.raid3.classbar.enable = false
		E.db.unitframe.units.raid3.debuffs.countFont = Private.Font
		E.db.unitframe.units.raid3.debuffs.desaturate = false
		E.db.unitframe.units.raid3.debuffs.maxDuration = 0
		E.db.unitframe.units.raid3.debuffs.priority = 'Blacklist,RaidDebuffs,Dispellable'
		E.db.unitframe.units.raid3.disableMouseoverGlow = true
		E.db.unitframe.units.raid3.disableTargetGlow = true
		E.db.unitframe.units.raid3.healPrediction.absorbStyle = 'WRAPPED'
		E.db.unitframe.units.raid3.healPrediction.enable = true
		E.db.unitframe.units.raid3.health.text_format = ''
		E.db.unitframe.units.raid3.height = 26
		E.db.unitframe.units.raid3.horizontalSpacing = 1
		E.db.unitframe.units.raid3.name.text_format = '[classcolor][name:veryshort]'
		E.db.unitframe.units.raid3.phaseIndicator.anchorPoint = 'RIGHT'
		E.db.unitframe.units.raid3.phaseIndicator.scale = 0.5
		E.db.unitframe.units.raid3.raidicon.attachTo = 'LEFT'
		E.db.unitframe.units.raid3.raidicon.attachToObject = 'Health'
		E.db.unitframe.units.raid3.raidicon.size = 14
		E.db.unitframe.units.raid3.raidicon.xOffset = 2
		E.db.unitframe.units.raid3.raidicon.yOffset = 0
		E.db.unitframe.units.raid3.raidRoleIcons.yOffset = 1
		E.db.unitframe.units.raid3.rdebuffs.enable = true
		E.db.unitframe.units.raid3.rdebuffs.font = Private.Font
		E.db.unitframe.units.raid3.rdebuffs.fontOutline = Private.Outline
		E.db.unitframe.units.raid3.rdebuffs.size = 18
		E.db.unitframe.units.raid3.rdebuffs.stack.position = 'CENTER'
		E.db.unitframe.units.raid3.rdebuffs.stack.yOffset = 0
		E.db.unitframe.units.raid3.summonIcon.attachTo = 'LEFT'
		E.db.unitframe.units.raid3.threatStyle = 'NONE'
		E.db.unitframe.units.raid3.verticalSpacing = 1
		E.db.unitframe.units.raid3.visibility = E.Retail and '[@raid31,noexists] hide;show' or '[@raid26,noexists] hide;show'
		E.db.unitframe.units.raid3.width = 82

	elseif layout == 'healing' then

		-- Healing growth directions
		E.db.unitframe.units.party.growthDirection = 'RIGHT_DOWN'

		-- Healing movers
		E.db.movers.AltPowerBarMover = 'BOTTOM,ElvUIParent,BOTTOM,0,368'
		E.db.movers.ElvUF_AssistMover = 'TOPLEFT,ElvUIParent,BOTTOMLEFT,0,1048'
		E.db.movers.ElvUF_FocusCastbarMover = 'BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-542,451'
		E.db.movers.ElvUF_FocusMover = 'BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-542,470'
		E.db.movers.ElvUF_FocusTargetMover = 'BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-460,470'
		E.db.movers.ElvUF_PartyMover = 'BOTTOM,UIParent,BOTTOM,0,320'
		E.db.movers.ElvUF_PetMover = 'BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,461,320'
		E.db.movers.ElvUF_PlayerCastbarMover = 'BOTTOM,ElvUIParent,BOTTOM,0,106'
		E.db.movers.ElvUF_PlayerMover = 'BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,542,320'
		E.db.movers.ElvUF_Raid1Mover = 'BOTTOM,UIParent,BOTTOM,0,134'
		E.db.movers.ElvUF_Raid2Mover = 'BOTTOM,UIParent,BOTTOM,0,134'
		E.db.movers.ElvUF_Raid3Mover = 'BOTTOM,UIParent,BOTTOM,0,136'
		E.db.movers.ElvUF_TargetCastbarMover = 'BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-542,301'
		E.db.movers.ElvUF_TargetMover = 'BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-542,320'
		E.db.movers.ElvUF_TargetTargetMover = 'BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-460,320'
		E.db.movers.MicrobarMover = 'TOPLEFT,ElvUIParent,TOPLEFT,174,-1'
		E.db.movers.PlayerChoiceToggle = 'BOTTOM,UIParent,BOTTOM,0,158'
		E.db.movers.VehicleLeaveButton = 'BOTTOM,ElvUIParent,BOTTOM,0,368'
		E.db.movers.VehicleSeatMover = 'BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,438,1'

		-- Healing Party
		E.db.unitframe.units.party.classbar.enable = false
		E.db.unitframe.units.party.debuffs.enable = false
		E.db.unitframe.units.party.disableMouseoverGlow = true
		E.db.unitframe.units.party.disableTargetGlow = true
		E.db.unitframe.units.party.groupBy = 'GROUP'
		E.db.unitframe.units.party.healPrediction.absorbStyle = 'WRAPPED'
		E.db.unitframe.units.party.healPrediction.enable = true
		E.db.unitframe.units.party.health.position = 'BOTTOM'
		E.db.unitframe.units.party.health.text_format = ''
		E.db.unitframe.units.party.health.yOffset = 2
		E.db.unitframe.units.party.height = 47
		E.db.unitframe.units.party.horizontalSpacing = 1
		E.db.unitframe.units.party.infoPanel.height = 12
		E.db.unitframe.units.party.name.text_format = ''
		E.db.unitframe.units.party.orientation = 'MIDDLE'
		E.db.unitframe.units.party.petsGroup.anchorPoint = 'LEFT'
		E.db.unitframe.units.party.petsGroup.height = 20
		E.db.unitframe.units.party.phaseIndicator.anchorPoint = 'LEFT'
		E.db.unitframe.units.party.phaseIndicator.scale = 0.5
		E.db.unitframe.units.party.power.enable = false
		E.db.unitframe.units.party.power.position = 'BOTTOMRIGHT'
		E.db.unitframe.units.party.power.text_format = ''
		E.db.unitframe.units.party.power.yOffset = 2
		E.db.unitframe.units.party.raidicon.attachTo = 'BOTTOM'
		E.db.unitframe.units.party.raidicon.size = 12
		E.db.unitframe.units.party.raidicon.yOffset = 0
		E.db.unitframe.units.party.raidRoleIcons.yOffset = 1
		E.db.unitframe.units.party.rdebuffs.font = Private.Font
		E.db.unitframe.units.party.rdebuffs.fontOutline = Private.Outline
		E.db.unitframe.units.party.rdebuffs.size = 18
		E.db.unitframe.units.party.roleIcon.damager = false
		E.db.unitframe.units.party.roleIcon.position = 'TOP'
		E.db.unitframe.units.party.roleIcon.size = 14
		E.db.unitframe.units.party.summonIcon.attachTo = 'LEFT'
		E.db.unitframe.units.party.summonIcon.size = 22
		E.db.unitframe.units.party.targetsGroup.height = 10
		E.db.unitframe.units.party.threatStyle = 'NONE'
		E.db.unitframe.units.party.verticalSpacing = 1
		E.db.unitframe.units.party.width = 90

		-- Healing Raid
		E.db.unitframe.units.raid1.classbar.enable = false
		E.db.unitframe.units.raid1.debuffs.countFont = Private.Font
		E.db.unitframe.units.raid1.debuffs.desaturate = false
		E.db.unitframe.units.raid1.debuffs.maxDuration = 0
		E.db.unitframe.units.raid1.debuffs.priority = 'Blacklist,RaidDebuffs,Dispellable'
		E.db.unitframe.units.raid1.disableMouseoverGlow = true
		E.db.unitframe.units.raid1.disableTargetGlow = true
		E.db.unitframe.units.raid1.healPrediction.absorbStyle = 'WRAPPED'
		E.db.unitframe.units.raid1.healPrediction.enable = true
		E.db.unitframe.units.raid1.health.text_format = ''
		E.db.unitframe.units.raid1.height = 38
		E.db.unitframe.units.raid1.horizontalSpacing = 1
		E.db.unitframe.units.raid1.name.text_format = ''
		E.db.unitframe.units.raid1.numGroups = 6
		E.db.unitframe.units.raid1.phaseIndicator.anchorPoint = 'LEFT'
		E.db.unitframe.units.raid1.phaseIndicator.scale = 0.5
		E.db.unitframe.units.raid1.power.enable = false
		E.db.unitframe.units.raid1.raidicon.attachTo = 'BOTTOM'
		E.db.unitframe.units.raid1.raidicon.size = 12
		E.db.unitframe.units.raid1.raidicon.yOffset = 0
		E.db.unitframe.units.raid1.raidRoleIcons.yOffset = 1
		E.db.unitframe.units.raid1.rdebuffs.font = Private.Font
		E.db.unitframe.units.raid1.rdebuffs.fontOutline = Private.Outline
		E.db.unitframe.units.raid1.rdebuffs.size = 18
		E.db.unitframe.units.raid1.roleIcon.damager = false
		E.db.unitframe.units.raid1.roleIcon.position = 'TOP'
		E.db.unitframe.units.raid1.roleIcon.size = 12
		E.db.unitframe.units.raid1.summonIcon.attachTo = 'LEFT'
		E.db.unitframe.units.raid1.summonIcon.size = 22
		E.db.unitframe.units.raid1.threatStyle = 'NONE'
		E.db.unitframe.units.raid1.verticalSpacing = 1
		E.db.unitframe.units.raid1.visibility = E.Retail and '[@raid6,noexists][@raid21,exists] hide;show' or '[@raid6,noexists][@raid11,exists] hide;show'
		E.db.unitframe.units.raid1.width = 90

		-- Healing Raid2
		E:CopyTable(E.db.unitframe.units.raid2, E.db.unitframe.units.raid1)
		E.db.unitframe.units.raid2.numGroups = 6
		E.db.unitframe.units.raid2.visibility = E.Retail and '[@raid21,noexists][@raid31,exists] hide;show' or '[@raid11,noexists][@raid26,exists] hide;show'

		-- Healing Raid3
		E.db.unitframe.units.raid3.classbar.enable = false
		E.db.unitframe.units.raid3.debuffs.countFont = Private.Font
		E.db.unitframe.units.raid3.debuffs.desaturate = false
		E.db.unitframe.units.raid3.debuffs.maxDuration = 0
		E.db.unitframe.units.raid3.debuffs.priority = 'Blacklist,RaidDebuffs,Dispellable'
		E.db.unitframe.units.raid3.disableMouseoverGlow = true
		E.db.unitframe.units.raid3.disableTargetGlow = true
		E.db.unitframe.units.raid3.healPrediction.absorbStyle = 'WRAPPED'
		E.db.unitframe.units.raid3.healPrediction.enable = true
		E.db.unitframe.units.raid3.health.text_format = ''
		E.db.unitframe.units.raid3.height = 28
		E.db.unitframe.units.raid3.horizontalSpacing = 1
		E.db.unitframe.units.raid3.name.text_format = '[classcolor][name:veryshort]'
		E.db.unitframe.units.raid3.phaseIndicator.anchorPoint = 'RIGHT'
		E.db.unitframe.units.raid3.phaseIndicator.scale = 0.5
		E.db.unitframe.units.raid3.raidicon.attachTo = 'LEFT'
		E.db.unitframe.units.raid3.raidicon.attachToObject = 'Health'
		E.db.unitframe.units.raid3.raidicon.size = 14
		E.db.unitframe.units.raid3.raidicon.xOffset = 2
		E.db.unitframe.units.raid3.raidicon.yOffset = 0
		E.db.unitframe.units.raid3.raidRoleIcons.yOffset = 1
		E.db.unitframe.units.raid3.rdebuffs.enable = true
		E.db.unitframe.units.raid3.rdebuffs.font = Private.Font
		E.db.unitframe.units.raid3.rdebuffs.fontOutline = Private.Outline
		E.db.unitframe.units.raid3.rdebuffs.size = 18
		E.db.unitframe.units.raid3.summonIcon.attachTo = 'LEFT'
		E.db.unitframe.units.raid3.threatStyle = 'NONE'
		E.db.unitframe.units.raid3.verticalSpacing = 1
		E.db.unitframe.units.raid3.visibility = E.Retail and '[@raid31,noexists] hide;show' or '[@raid26,noexists] hide;show'
		E.db.unitframe.units.raid3.width = 90
	end
end
