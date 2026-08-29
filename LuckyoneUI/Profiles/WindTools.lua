local _, Private = ...
local L = Private.Libs.ACL

-- ElvUI file
if not Private.ElvUI then
	return
end

local pairs = pairs
local unpack = unpack

local SetCVar = C_CVar.SetCVar

local E, _, V, P, G = unpack(ElvUI)

-- WindTools ProfileDB
function Private:Setup_WindTools(installer)
	if not (Private.IsAddOnLoaded('ElvUI_WindTools') and Private.isRetail) then Private:Print('|cff5385edWindTools|r ' .. L["is not installed or enabled."]) return end

	-- 1080p
	local scaled = Private.Addon.db.global.scaled

	-- Restore defaults
	E.db.WT = E:CopyTable({}, P.WT)
	E.global.WT = E:CopyTable({}, G.WT)

	-- Avoid recent db convert, seems to run after import and re-enables stuff we don't want
	E.db.WT.version = 4.20
	E.global.WT.version = 4.20
	E.private.WT.version = 4.20

	-- Protect movers error
	E.db.movers = E.db.movers or {}

	-- Global db
	E.global.WT.core.elvUIVersionPopup = false
	E.global.WT.core.loginMessage = false

	-- Private db
	Private:Setup_Private_WindTools()

	-- Profile db
	E.db.WT.announcement.enable = false
	E.db.WT.combat.combatAlert.enable = false
	E.db.WT.combat.quickKeystone.enable = false
	E.db.WT.combat.raidMarkers.enable = false
	E.db.WT.item.alreadyKnown.enable = false
	E.db.WT.item.delete.enable = false
	E.db.WT.item.extraItemsBar.enable = false
	E.db.WT.item.fastLoot.limit = 0.05
	E.db.WT.item.inspect.enable = false
	E.db.WT.item.itemLevel.enable = false
	E.db.WT.item.trade.enable = false
	E.db.WT.maps.eventTracker.enable = false
	E.db.WT.misc.exitPhaseDiving.enable = false
	E.db.WT.misc.gameBar.enable = false
	E.db.WT.misc.noLootPanel = true
	E.db.WT.quest.achievementTracker.show = false
	E.db.WT.quest.progress.enable = false
	E.db.WT.quest.switchButtons.enable = false
	E.db.WT.quest.turnIn.enable = false
	E.db.WT.skins.vignetting.enable = false
	E.db.WT.social.chatBar.enable = false
	E.db.WT.social.chatLink.enable = false
	E.db.WT.social.chatText.enable = false
	E.db.WT.social.contextMenu.enable = false
	E.db.WT.social.emote.enable = false
	E.db.WT.social.friendList.hideMaxLevel = false
	E.db.WT.social.friendList.infoFont.size = 10
	E.db.WT.social.friendList.nameFont.size = 11
	E.db.WT.social.friendList.textures.gameIcon = 'FACTION'
	E.db.WT.social.friendList.useClientColor = false
	E.db.WT.social.smartTab.enable = false
	E.db.WT.tooltips.elvUITweaks.betterMythicPlusInfo.enable = false
	E.db.WT.tooltips.elvUITweaks.raceIcon.enable = false
	E.db.WT.tooltips.elvUITweaks.specIcon.enable = false
	E.db.WT.tooltips.groupInfo.enable = false
	E.db.WT.tooltips.keystone.enable = false

	-- Movers
	E.db.movers.WTMinimapButtonBarAnchor = 'TOPRIGHT,ElvUIParent,TOPRIGHT,-2,-202'
	E.db.movers.WTParagonReputationToastFrameMover = 'TOP,ElvUIParent,TOP,0,-110'

	-- Blizzard Damage Meter
	if not Private.IsAddOnLoaded('Details') then
		SetCVar('damageMeterEnabled', 1)
		SetCVar('damageMeterResetOnNewInstance', 1)
		E.db.WT.combat.damageMeterLayout.animation.enable = false
		E.db.WT.combat.damageMeterLayout.backdrop = false
		E.db.WT.combat.damageMeterLayout.enable = true
		E.db.WT.combat.damageMeterLayout.height = (scaled and 178) or 216
		E.db.WT.combat.damageMeterLayout.shadow = false
		E.db.WT.combat.damageMeterLayout.width = (scaled and 440) or 486

		E.db.movers.WTDamageMeterLayoutMover = 'BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-1,1'

		E.db.WT.combat.damageMeterLayout.layouts[1].direction = 'HORIZONTAL'
		E.db.WT.combat.damageMeterLayout.layouts[1].innerPadding = 1
		E.db.WT.combat.damageMeterLayout.layouts[1].meters[1].weight = 10
		E.db.WT.combat.damageMeterLayout.layouts[1].name = 'Luckyone'
		E.db.WT.combat.damageMeterLayout.layouts[1].outerPadding = 2
	end

	-- Mailbox favorite list
	if Private.itsLuckyone then
		E.global.WT.item.contacts.alts = {}
		E.global.WT.item.contacts.alts['Laughing Skull'] = {}
		E.global.WT.item.contacts.alts['Laughing Skull']['Horde'] = {
			['Notlucky'] = 'WARRIOR',
			['Lucky'] = 'EVOKER',
			['Luckyhunter'] = 'HUNTER',
			['Luckytwo'] = 'EVOKER',
			['Luckypala'] = 'PALADIN',
			['Luckypriest'] = 'PRIEST',
			['Unluckyone'] = 'SHAMAN',
			['Luckydk'] = 'DEATHKNIGHT',
			['Luckywl'] = 'WARLOCK',
			['Luckymage'] = 'MAGE',
			['Luckyrogue'] = 'ROGUE',
		}
		E.global.WT.item.contacts.alts['Laughing Skull']['Alliance'] = {
			['Luckyone'] = 'DRUID',
			['Luckymonkas'] = 'MONK',
			['Taylorswift'] = 'DEMONHUNTER',
		}
		E.global.WT.item.contacts.updateAlts = false
	end

	Private:Print(L["WindTools profile has been set."], installer)
end

-- WindTools PrivateDB
function Private:Setup_Private_WindTools()

	-- Restore defaults
	E.private.WT = E:CopyTable({}, V.WT)

	-- Private db
	E.private.WT.item.extendMerchantPages.enable = true
	E.private.WT.maps.minimapButtons.enable = false
	E.private.WT.maps.superTracker.enable = false
	E.private.WT.maps.superTracker.waypointParse.enable = false
	E.private.WT.maps.worldMap.enable = false
	E.private.WT.misc.lfgList.enable = false
	E.private.WT.misc.moveFrames.elvUIBags = false
	E.private.WT.quest.objectiveTracker.cosmeticBar.border = 'ONEPIXEL'
	E.private.WT.quest.objectiveTracker.cosmeticBar.color.mode = 'CLASS'
	E.private.WT.quest.objectiveTracker.cosmeticBar.texture = Private.Texture
	E.private.WT.quest.objectiveTracker.cosmeticBar.width = 252
	E.private.WT.quest.objectiveTracker.enable = true
	E.private.WT.quest.objectiveTracker.header.classColor = true
	E.private.WT.quest.objectiveTracker.header.size = 13
	E.private.WT.quest.objectiveTracker.info.size = 12
	E.private.WT.quest.objectiveTracker.infoColor.customColorHighlight.b = 1
	E.private.WT.quest.objectiveTracker.infoColor.customColorHighlight.g = 1
	E.private.WT.quest.objectiveTracker.infoColor.customColorHighlight.r = 1
	E.private.WT.quest.objectiveTracker.infoColor.customColorNormal.b = 1
	E.private.WT.quest.objectiveTracker.infoColor.customColorNormal.g = 1
	E.private.WT.quest.objectiveTracker.infoColor.customColorNormal.r = 1
	E.private.WT.quest.objectiveTracker.menuTitle.classColor = true
	E.private.WT.quest.objectiveTracker.menuTitle.font.size = 13
	E.private.WT.quest.objectiveTracker.title.size = 13
	E.private.WT.quest.objectiveTracker.titleColor.classColor = true
	E.private.WT.skins.actionStatus.size = 12
	E.private.WT.skins.addons.bugSack = false
	E.private.WT.skins.addons.warpDeplete = false
	E.private.WT.skins.bigWigsSkin.emphasizedBar.colorOverride = false
	E.private.WT.skins.bigWigsSkin.emphasizedBar.smooth = false
	E.private.WT.skins.bigWigsSkin.emphasizedBar.spark = false
	E.private.WT.skins.bigWigsSkin.normalBar.colorOverride = false
	E.private.WT.skins.bigWigsSkin.normalBar.smooth = false
	E.private.WT.skins.bigWigsSkin.normalBar.spark = false
	E.private.WT.skins.bigWigsSkin.queueTimer.countDown.name = Private.Font
	E.private.WT.skins.bigWigsSkin.queueTimer.countDown.size = 12
	E.private.WT.skins.cooldownViewer.enable = false
	E.private.WT.skins.damageMeter.bar.texture = Private.Texture
	E.private.WT.skins.damageMeter.minimizeButton = false
	E.private.WT.skins.damageMeter.scrollBar = 'hide'
	E.private.WT.skins.damageMeter.sessionTimer = false
	E.private.WT.skins.elvui.enable = false
	E.private.WT.skins.ime.label.name = Private.Font
	E.private.WT.skins.ime.label.size = 12
	E.private.WT.skins.lossOfControl.enable = false
	E.private.WT.skins.shadow = false
	E.private.WT.skins.uiErrors.enable = false
	E.private.WT.skins.widgets.button.backdrop.classColor = true
	E.private.WT.skins.widgets.button.backdrop.texture = Private.Texture
	E.private.WT.skins.widgets.button.selected.backdropAlpha = 1
	E.private.WT.skins.widgets.button.selected.backdropClassColor = true
	E.private.WT.skins.widgets.button.selected.borderClassColor = true
	E.private.WT.skins.widgets.checkBox.classColor = true
	E.private.WT.skins.widgets.checkBox.texture = Private.Texture
	E.private.WT.skins.widgets.slider.classColor = true
	E.private.WT.skins.widgets.slider.texture = Private.Texture
	E.private.WT.skins.widgets.tab.backdrop.classColor = true
	E.private.WT.skins.widgets.tab.backdrop.texture = Private.Texture
	E.private.WT.skins.widgets.tab.selected.backdropAlpha = 1
	E.private.WT.skins.widgets.tab.selected.backdropClassColor = true
	E.private.WT.skins.widgets.tab.selected.borderAlpha = 0
	E.private.WT.skins.widgets.tab.selected.borderClassColor = true
	E.private.WT.skins.widgets.tab.selected.texture = Private.Texture
	E.private.WT.skins.widgets.treeGroupButton.backdrop.classColor = true
	E.private.WT.skins.widgets.treeGroupButton.backdrop.texture = Private.Texture
	E.private.WT.skins.widgets.treeGroupButton.selected.backdropAlpha = 1
	E.private.WT.skins.widgets.treeGroupButton.selected.backdropClassColor = true
	E.private.WT.skins.widgets.treeGroupButton.selected.borderClassColor = true
	E.private.WT.skins.widgets.treeGroupButton.selected.texture = Private.Texture
	E.private.WT.tooltips.factionIcon = false
	E.private.WT.tooltips.objectiveProgress.enable = false
	E.private.WT.tooltips.petIcon = false
	E.private.WT.tooltips.petId = false
	E.private.WT.tooltips.progression.enable = false
	E.private.WT.tooltips.tierSet = false
	E.private.WT.tooltips.titleIcon.enable = false
	E.private.WT.unitFrames.roleIcon.enable = false
	E.private.WT.unitFrames.tags.enable = false

	-- Handle Blizzard skins
	E.private.WT.skins.blizzard.enable = true

	-- Disable all Blizzard skins
	for key in pairs(V.WT.skins.blizzard) do
		if key ~= 'enable' then
			E.private.WT.skins.blizzard[key] = false
		end
	end

	-- Enable the skins we want
	E.private.WT.skins.blizzard.objectiveTracker = true
	E.private.WT.skins.blizzard.scenario = true
end
