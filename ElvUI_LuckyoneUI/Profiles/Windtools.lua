local Name, Private = ...
local E, L, V, P, G = unpack(ElvUI)

-- WindTools profile
function L1UI:Setup_WindTools(noPrint)
	if not E:IsAddOnEnabled('ElvUI_WindTools') and E.Retail then Private:Print('WindTools ' .. L["is not installed or enabled."]) return end

	-- Fix for garrison icon not moving to MinimapButtonBar
	E.db.general.minimap.icons.classHall.scale = 1
	E.db.general.minimap.icons.classHall.xOffset = 0
	E.db.general.minimap.icons.classHall.yOffset = 0

	-- Restore defaults
	E.db.WT = E:CopyTable({}, P.WT)
	E.global.WT = E:CopyTable({}, G.WT)
	E.private.WT = E:CopyTable({}, V.WT)

	-- Global db
	E.global.WT.core.loginMessage = false
	E.global.WT.core.noDuplicatedParty = true

	-- Private db
	E.private.WT.maps.minimapButtons.backdrop = false
	E.private.WT.maps.minimapButtons.backdropSpacing = 0
	E.private.WT.maps.minimapButtons.buttonSize = 23
	E.private.WT.maps.minimapButtons.expansionLandingPage = true
	E.private.WT.maps.minimapButtons.spacing = 3
	E.private.WT.maps.superTracker.enable = false
	E.private.WT.maps.superTracker.waypointParse.enable = false
	E.private.WT.maps.worldMap.enable = false
	E.private.WT.maps.worldMap.reveal.enable = false
	E.private.WT.maps.worldMap.scale.enable = false
	E.private.WT.misc.lfgList.icon.pack = 'LYNUI'
	E.private.WT.misc.lfgList.icon.size = 14
	E.private.WT.misc.lfgList.line.height = 4
	E.private.WT.misc.lfgList.line.tex = Private.Texture
	E.private.WT.misc.lfgList.partyKeystone.enable = false
	E.private.WT.misc.lfgList.rightPanel.enable = false
	E.private.WT.misc.moveFrames.elvUIBags = false
	E.private.WT.misc.moveSpeed = true
	E.private.WT.misc.pauseToSlash = false
	E.private.WT.misc.tags = false
	E.private.WT.quest.objectiveTracker.cosmeticBar.border = 'ONEPIXEL'
	E.private.WT.quest.objectiveTracker.cosmeticBar.color.mode = 'CLASS'
	E.private.WT.quest.objectiveTracker.cosmeticBar.enable = not E:IsAddOnEnabled('ElvUI_SLE')
	E.private.WT.quest.objectiveTracker.cosmeticBar.texture = Private.Texture
	E.private.WT.quest.objectiveTracker.cosmeticBar.width = 228
	E.private.WT.quest.objectiveTracker.titleColor.classColor = true
	E.private.WT.skins.addons.adiBags = false
	E.private.WT.skins.addons.angryKeystones = false
	E.private.WT.skins.addons.bigWigs = false
	E.private.WT.skins.addons.bugSack = false
	E.private.WT.skins.addons.hekili = false
	E.private.WT.skins.addons.immersion = false
	E.private.WT.skins.addons.myslot = false
	E.private.WT.skins.addons.omniCD = false
	E.private.WT.skins.addons.omniCDIcon = false
	E.private.WT.skins.addons.omniCDStatusBar = false
	E.private.WT.skins.addons.premadeGroupsFilter = false
	E.private.WT.skins.addons.rematch = false
	E.private.WT.skins.addons.tinyInspect = false
	E.private.WT.skins.addons.tldrMissions = false
	E.private.WT.skins.addons.tomCats = false
	E.private.WT.skins.addons.warpDeplete = false
	E.private.WT.skins.addons.weakAuras = false
	E.private.WT.skins.bigWigsSkin.queueTimer.countDown.name = Private.Font
	E.private.WT.skins.bigWigsSkin.queueTimer.countDown.size = 12
	E.private.WT.skins.blizzard.enable = false
	E.private.WT.skins.elvui.enable = false
	E.private.WT.skins.ime.label.name = Private.Font
	E.private.WT.skins.rollResult.name = Private.Font
	E.private.WT.skins.shadow = false
	E.private.WT.skins.weakAurasShadow = false
	E.private.WT.skins.widgets.button.backdrop.classColor = true
	E.private.WT.skins.widgets.button.backdrop.texture = Private.Texture
	E.private.WT.skins.widgets.button.selected.backdropClassColor = true
	E.private.WT.skins.widgets.button.selected.borderClassColor = true
	E.private.WT.skins.widgets.checkBox.classColor = true
	E.private.WT.skins.widgets.checkBox.texture = Private.Texture
	E.private.WT.skins.widgets.slider.classColor = true
	E.private.WT.skins.widgets.slider.texture = Private.Texture
	E.private.WT.skins.widgets.tab.backdrop.classColor = true
	E.private.WT.skins.widgets.tab.backdrop.texture = Private.Texture
	E.private.WT.skins.widgets.tab.selected.backdropClassColor = true
	E.private.WT.skins.widgets.tab.selected.borderClassColor = true
	E.private.WT.skins.widgets.tab.selected.texture = Private.Texture
	E.private.WT.skins.widgets.treeGroupButton.backdrop.classColor = true
	E.private.WT.skins.widgets.treeGroupButton.backdrop.texture = Private.Texture
	E.private.WT.skins.widgets.treeGroupButton.selected.backdropClassColor = true
	E.private.WT.skins.widgets.treeGroupButton.selected.borderClassColor = true
	E.private.WT.skins.widgets.treeGroupButton.selected.texture = Private.Texture
	E.private.WT.tooltips.factionIcon = false
	E.private.WT.tooltips.icon = false
	E.private.WT.tooltips.objectiveProgress = false
	E.private.WT.tooltips.petIcon = false
	E.private.WT.tooltips.petId = false
	E.private.WT.tooltips.progression.enable = false
	E.private.WT.tooltips.tierSet = false
	E.private.WT.unitFrames.roleIcon.enable = false

	-- Profile db
	E.db.WT.announcement.combatResurrection.enable = false
	E.db.WT.announcement.enable = false
	E.db.WT.announcement.interrupt.enable = false
	E.db.WT.announcement.keystone.enable = false
	E.db.WT.announcement.resetInstance.enable = false
	E.db.WT.announcement.threatTransfer.enable = false
	E.db.WT.announcement.utility.enable = false
	E.db.WT.combat.combatAlert.animation = false
	E.db.WT.combat.combatAlert.enterText = '+Combat'
	E.db.WT.combat.combatAlert.leaveText = '-Combat'
	E.db.WT.combat.combatAlert.speed = 0.5
	E.db.WT.combat.quickKeystone.enable = false
	E.db.WT.combat.raidMarkers.enable = false
	E.db.WT.item.alreadyKnown.enable = false
	E.db.WT.item.contacts.enable = false
	E.db.WT.item.delete.enable = false
	E.db.WT.item.extraItemsBar.enable = false
	E.db.WT.item.fastLoot.limit = 0.05
	E.db.WT.item.inspect.enable = false
	E.db.WT.item.itemLevel.enable = false
	E.db.WT.item.trade.enable = false
	E.db.WT.maps.eventTracker.communityFeast.alert = false
	E.db.WT.maps.eventTracker.height = 30
	E.db.WT.maps.eventTracker.iskaaranFishingNet.alert = false
	E.db.WT.maps.eventTracker.siegeOnDragonbaneKeep.alert = false
	E.db.WT.maps.eventTracker.spacing = 20
	E.db.WT.maps.eventTracker.yOffset = 0
	E.db.WT.maps.whoClicked.font.size = 12
	E.db.WT.maps.whoClicked.onlyOnCombat = false
	E.db.WT.maps.whoClicked.stayTime = 2
	E.db.WT.maps.whoClicked.yOffset = 19
	E.db.WT.misc.disableTalkingHead = true
	E.db.WT.misc.gameBar.enable = false
	E.db.WT.quest.paragonReputation.toast.sound = false
	E.db.WT.quest.switchButtons.enable = false
	E.db.WT.quest.turnIn.mode = 'COMPLETE'
	E.db.WT.quest.turnIn.selectReward = false
	E.db.WT.skins.vignetting.enable = false
	E.db.WT.social.chatBar.enable = false
	E.db.WT.social.chatLink.armorCategory = false
	E.db.WT.social.chatLink.icon = false
	E.db.WT.social.chatLink.level = false
	E.db.WT.social.chatLink.numbericalQualityTier = true
	E.db.WT.social.chatLink.translateItem = false
	E.db.WT.social.chatLink.weaponCategory = false
	E.db.WT.social.chatText.enable = false
	E.db.WT.social.contextMenu.enable = false
	E.db.WT.social.emote.enable = false
	E.db.WT.social.friendList.hideMaxLevel = false
	E.db.WT.social.friendList.infoFont.size = 10
	E.db.WT.social.friendList.nameFont.size = 11
	E.db.WT.social.friendList.textures.factionIcon = true
	E.db.WT.social.friendList.textures.status = 'default'
	E.db.WT.social.friendList.useClientColor = false
	E.db.WT.social.smartTab.enable = false
	E.db.WT.tooltips.groupInfo.mode = 'COMPACT'
	E.db.WT.tooltips.groupInfo.template = '{{classColorStart}}{{specName}}{{classColorEnd}}{{amountStart}} x {{amount}}{{amountEnd}}'
	E.db.WT.tooltips.groupInfo.title = false

	-- Protect movers error
	E.db.movers = E.db.movers or {}

	-- Movers
	E.db.movers.WTCombatAlertFrameMover = 'BOTTOM,ElvUIParent,BOTTOM,0,410'
	E.db.movers.WTMinimapButtonBarAnchor = 'TOPRIGHT,ElvUIParent,TOPRIGHT,-2,-158'
	E.db.movers.WTParagonReputationToastFrameMover = 'TOP,ElvUIParent,TOP,0,-187'

	if not noPrint then
		Private:Print(L["WindTools profile has been set."])
	end
end
