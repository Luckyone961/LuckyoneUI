local L1UI, E, L, V, P, G = unpack(select(2, ...))
if not E.Retail then return end

local _G = _G

-- WindTools profile
function L1UI:Setup_WindTools(noPrint)
	if not E:IsAddOnEnabled('ElvUI_WindTools') then return end

	-- Don't overlap with ProjectAzilroka
	if E:IsAddOnEnabled('ProjectAzilroka') then
		local PA = _G.ProjectAzilroka
		PA.db.EnhancedFriendsList.Enable = false
		PA.db.FasterLoot.Enable = false
		PA.db.SquareMinimapButtons.Enable = false
	end

	-- Global db
	E.global.WT.core.loginMessage = false
	E.global.WT.core.noDuplicatedParty = true

	-- Private db
	E.private.WT.maps.minimapButtons.backdrop = false
	E.private.WT.maps.minimapButtons.backdropSpacing = 0
	E.private.WT.maps.minimapButtons.buttonSize = 23
	E.private.WT.maps.minimapButtons.spacing = 3
	E.private.WT.maps.superTracker.enable = false
	E.private.WT.maps.superTracker.waypointParse.enable = false
	E.private.WT.maps.worldMap.enable = false
	E.private.WT.maps.worldMap.reveal.enable = false
	E.private.WT.maps.worldMap.scale.enable = false
	E.private.WT.misc.guildNewsItemLevel = false
	E.private.WT.misc.lfgList.icon.pack = 'LYNUI'
	E.private.WT.misc.lfgList.icon.size = 14
	E.private.WT.misc.lfgList.line.height = 4
	E.private.WT.misc.lfgList.line.tex = L1UI.DefaultTexture
	E.private.WT.misc.pauseToSlash = false
	E.private.WT.misc.tags = false
	E.private.WT.quest.objectiveTracker.cosmeticBar.border = 'ONEPIXEL'
	E.private.WT.quest.objectiveTracker.cosmeticBar.color.mode = 'CLASS'
	E.private.WT.quest.objectiveTracker.cosmeticBar.texture = L1UI.DefaultTexture
	E.private.WT.quest.objectiveTracker.titleColor.classColor = true
	E.private.WT.skins.addons.adiBags = false
	E.private.WT.skins.addons.angryKeystones = false
	E.private.WT.skins.addons.bigWigs = false
	E.private.WT.skins.addons.bugSack = false
	E.private.WT.skins.addons.hekili = false
	E.private.WT.skins.addons.immersion = false
	E.private.WT.skins.addons.meetingStone = false
	E.private.WT.skins.addons.myslot = false
	E.private.WT.skins.addons.mythicDungeonTools = false
	E.private.WT.skins.addons.omniCD = false
	E.private.WT.skins.addons.omniCDIcon = false
	E.private.WT.skins.addons.omniCDStatusBar = false
	E.private.WT.skins.addons.premadeGroupsFilter = false
	E.private.WT.skins.addons.rematch = false
	E.private.WT.skins.addons.simulationcraft = false
	E.private.WT.skins.addons.tinyInspect = false
	E.private.WT.skins.addons.tldrMissions = false
	E.private.WT.skins.addons.tomCats = false
	E.private.WT.skins.addons.warpDeplete = false
	E.private.WT.skins.addons.weakAuras = false
	E.private.WT.skins.bigWigsSkin.queueTimer.countDown.name = L1UI.DefaultFont
	E.private.WT.skins.bigWigsSkin.queueTimer.countDown.size = 12
	E.private.WT.skins.blizzard.enable = false
	E.private.WT.skins.elvui.enable = false
	E.private.WT.skins.ime.label.name = L1UI.DefaultFont
	E.private.WT.skins.rollResult.name = L1UI.DefaultFont
	E.private.WT.skins.shadow = false
	E.private.WT.skins.weakAurasShadow = false
	E.private.WT.skins.widgets.button.backdrop.texture = L1UI.DefaultTexture
	E.private.WT.skins.widgets.checkBox.classColor = true
	E.private.WT.skins.widgets.checkBox.texture = L1UI.DefaultTexture
	E.private.WT.skins.widgets.slider.classColor = true
	E.private.WT.skins.widgets.slider.texture = L1UI.DefaultTexture
	E.private.WT.skins.widgets.tab.backdrop.texture = L1UI.DefaultTexture
	E.private.WT.skins.widgets.tab.selected.texture = L1UI.DefaultTexture
	E.private.WT.skins.widgets.treeGroupButton.backdrop.texture = L1UI.DefaultTexture
	E.private.WT.skins.widgets.treeGroupButton.selected.texture = L1UI.DefaultTexture
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
	E.db.WT.combat.classHelper.enable = false
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
	E.db.WT.maps.whoClicked.enable = false
	E.db.WT.misc.disableTalkingHead = true
	E.db.WT.misc.gameBar.enable = false
	E.db.WT.quest.paragonReputation.toast.sound = false
	E.db.WT.quest.switchButtons.enable = false
	E.db.WT.quest.turnIn.selectReward = false
	E.db.WT.skins.vignetting.enable = false
	E.db.WT.social.chatBar.enable = false
	E.db.WT.social.chatLink.enable = false
	E.db.WT.social.chatText.enable = false
	E.db.WT.social.contextMenu.enable = false
	E.db.WT.social.emote.enable = false
	E.db.WT.social.friendList.hideMaxLevel = false
	E.db.WT.social.friendList.infoFont.size = 10
	E.db.WT.social.friendList.nameFont.size = 11
	E.db.WT.social.friendList.textures.factionIcon = true
	E.db.WT.social.friendList.useClientColor = false
	E.db.WT.social.smartTab.enable = false
	E.db.WT.tooltips.groupInfo.enable = false

	-- Protect movers error
	E.db.movers = E.db.movers or {}

	-- Movers
	E.db.movers.WTCombatAlertFrameMover = 'TOP,UIParent,TOP,0,-330'
	E.db.movers.WTMinimapButtonBarAnchor = 'TOPRIGHT,ElvUIParent,TOPRIGHT,-2,-158'
	E.db.movers.WTParagonReputationToastFrameMover = 'TOP,UIParent,TOP,0,-155'

	if not noPrint then
		L1UI:Print(L["WindTools profile has been set."])
	end
end
