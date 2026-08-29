local _, Private = ...
local L = Private.Libs.ACL

-- ElvUI file
if not Private.ElvUI then
	return
end

local pairs = pairs
local unpack = unpack

local GetAddOnMetadata = C_AddOns.GetAddOnMetadata

local E, _, V, P, G = unpack(ElvUI)

local function Set(tbl, path, value)
	Private:DBSetValue(tbl, path, value)
end

-- WindTools ProfileDB
function Private:Setup_WindTools(installer)
	if not (Private.IsAddOnLoaded('ElvUI_WindTools') and Private.isRetail) then Private:Print('|cff5385edWindTools|r ' .. L["is not installed or enabled."]) return end

	-- Get version
	local version = GetAddOnMetadata('ElvUI_WindTools', 'X-Version')

	-- Restore defaults
	E.db.WT = E:CopyTable({}, P.WT)
	E.global.WT = E:CopyTable({}, G.WT)

	-- Avoid recent db convert, seems to run after import and re-enables stuff we don't want
	E.db.WT.version = version
	E.global.WT.version = version
	E.private.WT.version = version

	-- Global db
	Set(E.global, 'WT.core.elvUIVersionPopup', false)
	Set(E.global, 'WT.core.loginMessage', false)

	-- Private db
	Private:Setup_Private_WindTools()

	-- Profile db
	Set(E.db, 'WT.announcement.enable', false)
	Set(E.db, 'WT.combat.combatAlert.enable', false)
	Set(E.db, 'WT.combat.quickKeystone.enable', false)
	Set(E.db, 'WT.combat.raidMarkers.enable', false)
	Set(E.db, 'WT.item.alreadyKnown.enable', false)
	Set(E.db, 'WT.item.delete.enable', false)
	Set(E.db, 'WT.item.extraItemsBar.enable', false)
	Set(E.db, 'WT.item.fastLoot.limit', 0.05)
	Set(E.db, 'WT.item.inspect.enable', false)
	Set(E.db, 'WT.item.itemLevel.enable', false)
	Set(E.db, 'WT.item.trade.enable', false)
	Set(E.db, 'WT.maps.eventTracker.enable', false)
	Set(E.db, 'WT.misc.exitPhaseDiving.enable', false)
	Set(E.db, 'WT.misc.gameBar.enable', false)
	Set(E.db, 'WT.misc.noLootPanel', true)
	Set(E.db, 'WT.quest.achievementTracker.show', false)
	Set(E.db, 'WT.quest.progress.enable', false)
	Set(E.db, 'WT.quest.switchButtons.enable', false)
	Set(E.db, 'WT.quest.turnIn.enable', false)
	Set(E.db, 'WT.skins.vignetting.enable', false)
	Set(E.db, 'WT.social.chatBar.enable', false)
	Set(E.db, 'WT.social.chatLink.enable', false)
	Set(E.db, 'WT.social.chatText.enable', false)
	Set(E.db, 'WT.social.contextMenu.enable', false)
	Set(E.db, 'WT.social.emote.enable', false)
	Set(E.db, 'WT.social.friendList.hideMaxLevel', false)
	Set(E.db, 'WT.social.friendList.infoFont.size', 10)
	Set(E.db, 'WT.social.friendList.nameFont.size', 11)
	Set(E.db, 'WT.social.friendList.textures.gameIcon', 'FACTION')
	Set(E.db, 'WT.social.friendList.useClientColor', false)
	Set(E.db, 'WT.social.smartTab.enable', false)
	Set(E.db, 'WT.tooltips.elvUITweaks.betterMythicPlusInfo.enable', false)
	Set(E.db, 'WT.tooltips.elvUITweaks.raceIcon.enable', false)
	Set(E.db, 'WT.tooltips.elvUITweaks.specIcon.enable', false)
	Set(E.db, 'WT.tooltips.groupInfo.enable', false)
	Set(E.db, 'WT.tooltips.keystone.enable', false)

	-- WIP Blizzard Damage Meter
	Set(E.db, 'WT.combat.damageMeterLayout.animation.enable', false)
	Set(E.db, 'WT.combat.damageMeterLayout.backdrop', false)
	Set(E.db, 'WT.combat.damageMeterLayout.enable', true)
	Set(E.db, 'WT.combat.damageMeterLayout.height', 224)
	Set(E.db, 'WT.combat.damageMeterLayout.shadow', false)
	Set(E.db, 'WT.combat.damageMeterLayout.width', 486)
	E.db.WT.combat.damageMeterLayout.layouts[1].direction = 'HORIZONTAL'
	E.db.WT.combat.damageMeterLayout.layouts[1].innerPadding = 16
	E.db.WT.combat.damageMeterLayout.layouts[1].meters[1].weight = 10
	E.db.WT.combat.damageMeterLayout.layouts[1].name = 'Luckyone'
	E.db.WT.combat.damageMeterLayout.layouts[1].outerPadding = 10

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

	-- Movers
	E.db.movers = E.db.movers or {} -- Protect movers error
	E.db.movers.WTDamageMeterLayoutMover = 'BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-1,1'
	E.db.movers.WTMinimapButtonBarAnchor = 'TOPRIGHT,ElvUIParent,TOPRIGHT,-2,-202'
	E.db.movers.WTParagonReputationToastFrameMover = 'TOP,ElvUIParent,TOP,0,-110'

	Private:Print(L["WindTools profile has been set."], installer)
end

-- WindTools PrivateDB
function Private:Setup_Private_WindTools()

	-- Restore defaults
	E.private.WT = E:CopyTable({}, V.WT)

	-- Private db
	Set(E.private, 'WT.item.extendMerchantPages.enable', true)
	Set(E.private, 'WT.maps.minimapButtons.enable', false)
	Set(E.private, 'WT.maps.superTracker.enable', false)
	Set(E.private, 'WT.maps.superTracker.waypointParse.enable', false)
	Set(E.private, 'WT.maps.worldMap.enable', false)
	Set(E.private, 'WT.misc.lfgList.enable', false)
	Set(E.private, 'WT.misc.moveFrames.elvUIBags', false)
	Set(E.private, 'WT.quest.objectiveTracker.cosmeticBar.border', 'ONEPIXEL')
	Set(E.private, 'WT.quest.objectiveTracker.cosmeticBar.color.mode', 'CLASS')
	Set(E.private, 'WT.quest.objectiveTracker.cosmeticBar.texture', Private.Texture)
	Set(E.private, 'WT.quest.objectiveTracker.cosmeticBar.width', 252)
	Set(E.private, 'WT.quest.objectiveTracker.enable', true)
	Set(E.private, 'WT.quest.objectiveTracker.header.classColor', true)
	Set(E.private, 'WT.quest.objectiveTracker.header.size', 13)
	Set(E.private, 'WT.quest.objectiveTracker.info.size', 12)
	Set(E.private, 'WT.quest.objectiveTracker.infoColor.customColorHighlight.b', 1)
	Set(E.private, 'WT.quest.objectiveTracker.infoColor.customColorHighlight.g', 1)
	Set(E.private, 'WT.quest.objectiveTracker.infoColor.customColorHighlight.r', 1)
	Set(E.private, 'WT.quest.objectiveTracker.infoColor.customColorNormal.b', 1)
	Set(E.private, 'WT.quest.objectiveTracker.infoColor.customColorNormal.g', 1)
	Set(E.private, 'WT.quest.objectiveTracker.infoColor.customColorNormal.r', 1)
	Set(E.private, 'WT.quest.objectiveTracker.menuTitle.classColor', true)
	Set(E.private, 'WT.quest.objectiveTracker.menuTitle.font.size', 13)
	Set(E.private, 'WT.quest.objectiveTracker.title.size', 13)
	Set(E.private, 'WT.quest.objectiveTracker.titleColor.classColor', true)
	Set(E.private, 'WT.skins.actionStatus.size', 12)
	Set(E.private, 'WT.skins.addons.bugSack', false)
	Set(E.private, 'WT.skins.addons.warpDeplete', false)
	Set(E.private, 'WT.skins.bigWigsSkin.emphasizedBar.colorOverride', false)
	Set(E.private, 'WT.skins.bigWigsSkin.emphasizedBar.smooth', false)
	Set(E.private, 'WT.skins.bigWigsSkin.emphasizedBar.spark', false)
	Set(E.private, 'WT.skins.bigWigsSkin.normalBar.colorOverride', false)
	Set(E.private, 'WT.skins.bigWigsSkin.normalBar.smooth', false)
	Set(E.private, 'WT.skins.bigWigsSkin.normalBar.spark', false)
	Set(E.private, 'WT.skins.bigWigsSkin.queueTimer.countDown.name', Private.Font)
	Set(E.private, 'WT.skins.bigWigsSkin.queueTimer.countDown.size', 12)
	Set(E.private, 'WT.skins.cooldownViewer.enable', false)
	Set(E.private, 'WT.skins.damageMeter.bar.texture', Private.Texture)
	Set(E.private, 'WT.skins.damageMeter.scrollBar', 'hide')
	Set(E.private, 'WT.skins.elvui.enable', false)
	Set(E.private, 'WT.skins.ime.label.name', Private.Font)
	Set(E.private, 'WT.skins.ime.label.size', 12)
	Set(E.private, 'WT.skins.lossOfControl.enable', false)
	Set(E.private, 'WT.skins.shadow', false)
	Set(E.private, 'WT.skins.uiErrors.enable', false)
	Set(E.private, 'WT.skins.widgets.button.backdrop.classColor', true)
	Set(E.private, 'WT.skins.widgets.button.backdrop.texture', Private.Texture)
	Set(E.private, 'WT.skins.widgets.button.selected.backdropAlpha', 1)
	Set(E.private, 'WT.skins.widgets.button.selected.backdropClassColor', true)
	Set(E.private, 'WT.skins.widgets.button.selected.borderClassColor', true)
	Set(E.private, 'WT.skins.widgets.checkBox.classColor', true)
	Set(E.private, 'WT.skins.widgets.checkBox.texture', Private.Texture)
	Set(E.private, 'WT.skins.widgets.slider.classColor', true)
	Set(E.private, 'WT.skins.widgets.slider.texture', Private.Texture)
	Set(E.private, 'WT.skins.widgets.tab.backdrop.classColor', true)
	Set(E.private, 'WT.skins.widgets.tab.backdrop.texture', Private.Texture)
	Set(E.private, 'WT.skins.widgets.tab.selected.backdropAlpha', 1)
	Set(E.private, 'WT.skins.widgets.tab.selected.backdropClassColor', true)
	Set(E.private, 'WT.skins.widgets.tab.selected.borderAlpha', 0)
	Set(E.private, 'WT.skins.widgets.tab.selected.borderClassColor', true)
	Set(E.private, 'WT.skins.widgets.tab.selected.texture', Private.Texture)
	Set(E.private, 'WT.skins.widgets.treeGroupButton.backdrop.classColor', true)
	Set(E.private, 'WT.skins.widgets.treeGroupButton.backdrop.texture', Private.Texture)
	Set(E.private, 'WT.skins.widgets.treeGroupButton.selected.backdropAlpha', 1)
	Set(E.private, 'WT.skins.widgets.treeGroupButton.selected.backdropClassColor', true)
	Set(E.private, 'WT.skins.widgets.treeGroupButton.selected.borderClassColor', true)
	Set(E.private, 'WT.skins.widgets.treeGroupButton.selected.texture', Private.Texture)
	Set(E.private, 'WT.tooltips.factionIcon', false)
	Set(E.private, 'WT.tooltips.objectiveProgress.enable', false)
	Set(E.private, 'WT.tooltips.petIcon', false)
	Set(E.private, 'WT.tooltips.petId', false)
	Set(E.private, 'WT.tooltips.progression.enable', false)
	Set(E.private, 'WT.tooltips.tierSet', false)
	Set(E.private, 'WT.tooltips.titleIcon.enable', false)
	Set(E.private, 'WT.unitFrames.roleIcon.enable', false)
	Set(E.private, 'WT.unitFrames.tags.enable', false)

	-- Handle Blizzard skins
	Set(E.private, 'WT.skins.blizzard.enable', true)

	-- Disable all Blizzard skins
	for key in pairs(V.WT.skins.blizzard) do
		if key ~= 'enable' then
			E.private.WT.skins.blizzard[key] = false
		end
	end

	-- Enable the skins we want
	Set(E.private, 'WT.skins.blizzard.objectiveTracker', true)
	Set(E.private, 'WT.skins.blizzard.scenario', true)
end
