-- Addon namespace
local _, Private = ...
local L = Private.Libs.ACL

-- ElvUI file
if not Private.ElvUI then
	return
end

-- Lua functions
local unpack = unpack

-- API cache
local GetAddOnMetadata = C_AddOns.GetAddOnMetadata

-- Global environment
local _G = _G

-- ElvUI modules
local E, _, V, P, G = unpack(ElvUI)

local function Set(tbl, path, value)
	Private:DBSetValue(tbl, path, value)
end

-- WindTools ProfileDB
-- LC: 20/11/2025
function Private:Setup_WindTools(installer)
	if not (Private.IsAddOnLoaded('ElvUI_WindTools') and Private.isRetail) then Private:Print('|cff5385edWindTools|r ' .. L["is not installed or enabled."]) return end

	-- 1080p
	local scaled = Private.Addon.db.global.scaled

	-- Get version
	local version = GetAddOnMetadata('ElvUI_WindTools', 'X-Version')

	-- Restore defaults
	E.db.WT = E:CopyTable({}, P.WT)
	E.global.WT = E:CopyTable({}, G.WT)

	-- Avoid recent db convert, seems to run after import and re-enables stuff we don't want
	E.db.WT.version = version
	E.global.WT.version = version
	E.private.WT.version = version

	-- Keep this, it won't get exported by default
	Set(E.db, 'WT.quest.switchButtons.hideWithObjectiveTracker', true)

	-- Global db
	Set(E.global, 'WT.core.loginMessage', false)

	-- Private db
	Private:Setup_Private_WindTools()

	-- Profile db
	Set(E.db, 'WT.announcement.combatResurrection.enable', false)
	Set(E.db, 'WT.announcement.enable', false)
	Set(E.db, 'WT.announcement.interrupt.enable', false)
	Set(E.db, 'WT.announcement.keystone.enable', false)
	Set(E.db, 'WT.announcement.resetInstance.enable', false)
	Set(E.db, 'WT.announcement.threatTransfer.enable', false)
	Set(E.db, 'WT.announcement.utility.enable', false)
	Set(E.db, 'WT.combat.combatAlert.animation', false)
	Set(E.db, 'WT.combat.combatAlert.enterText', '+Combat')
	Set(E.db, 'WT.combat.combatAlert.font.size', 24)
	Set(E.db, 'WT.combat.combatAlert.leaveText', '-Combat')
	Set(E.db, 'WT.combat.combatAlert.speed', 0.5)
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
	Set(E.db, 'WT.maps.whoClicked.font.size', 12)
	Set(E.db, 'WT.maps.whoClicked.onlyOnCombat', false)
	Set(E.db, 'WT.maps.whoClicked.stayTime', 2)
	Set(E.db, 'WT.maps.whoClicked.yOffset', 19)
	Set(E.db, 'WT.misc.disableTalkingHead', true)
	Set(E.db, 'WT.misc.exitPhaseDiving.enable', false)
	Set(E.db, 'WT.misc.gameBar.enable', false)
	Set(E.db, 'WT.misc.noLootPanel', true)
	Set(E.db, 'WT.quest.achievementTracker.show', false)
	Set(E.db, 'WT.quest.progress.enable', false)
	Set(E.db, 'WT.quest.switchButtons.announcement', false)
	Set(E.db, 'WT.quest.switchButtons.font.color.b', 1)
	Set(E.db, 'WT.quest.switchButtons.font.color.g', 1)
	Set(E.db, 'WT.quest.turnIn.enable', false)
	Set(E.db, 'WT.quest.turnIn.mode', 'COMPLETE')
	Set(E.db, 'WT.quest.turnIn.pauseModifier', 'ANY')
	Set(E.db, 'WT.quest.turnIn.selectReward', false)
	Set(E.db, 'WT.skins.vignetting.enable', false)
	Set(E.db, 'WT.social.chatBar.enable', false)
	Set(E.db, 'WT.social.chatLink.armorCategory', false)
	Set(E.db, 'WT.social.chatLink.icon', false)
	Set(E.db, 'WT.social.chatLink.iconHeight', 12)
	Set(E.db, 'WT.social.chatLink.iconWidth', 12)
	Set(E.db, 'WT.social.chatLink.level', false)
	Set(E.db, 'WT.social.chatLink.numericalQualityTier', true)
	Set(E.db, 'WT.social.chatLink.translateItem', false)
	Set(E.db, 'WT.social.chatLink.weaponCategory', false)
	Set(E.db, 'WT.social.chatText.bnetFriendOnline', false)
	Set(E.db, 'WT.social.chatText.classIcon', false)
	Set(E.db, 'WT.social.chatText.factionIcon', false)
	Set(E.db, 'WT.social.chatText.guildMemberStatusInviteLink', false)
	Set(E.db, 'WT.social.chatText.mergeAchievement', false)
	Set(E.db, 'WT.social.chatText.roleIconSize', 12)
	Set(E.db, 'WT.social.chatText.roleIconStyle', 'DEFAULT')
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
	Set(E.db, 'WT.tooltips.groupInfo.mode', 'COMPACT')
	Set(E.db, 'WT.tooltips.groupInfo.template', '{{classColorStart}}{{specName}}{{classColorEnd}}{{amountStart}} x {{amount}}{{amountEnd}}')
	Set(E.db, 'WT.tooltips.keystone.enable', false)

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
			['Luckydh'] = 'DEMONHUNTER',
			['Luckydk'] = 'DEATHKNIGHT',
			['Luckywl'] = 'WARLOCK',
			['Luckymage'] = 'MAGE',
			['Luckyrogue'] = 'ROGUE',
		}
		E.global.WT.item.contacts.alts['Laughing Skull']['Alliance'] = {
			['Luckyone'] = 'DRUID',
			['Luckymonkas'] = 'MONK',
		}
		E.global.WT.item.contacts.updateAlts = false
	end

	-- Protect movers error
	E.db.movers = E.db.movers or {}

	-- Movers
	E.db.movers.WTCombatAlertFrameMover = (scaled and 'BOTTOM,ElvUIParent,BOTTOM,0,405') or 'BOTTOM,ElvUIParent,BOTTOM,0,590'
	E.db.movers.WTMinimapButtonBarAnchor = 'TOPRIGHT,ElvUIParent,TOPRIGHT,-2,-177'
	E.db.movers.WTParagonReputationToastFrameMover = 'TOP,ElvUIParent,TOP,0,-110'

	if installer then
		_G.LuckyoneInstallStepComplete:ShowMessage(L["WindTools profile has been set."])
	end

	Private:Print(L["WindTools profile has been set."])
end

-- WindTools PrivateDB
-- LC: 20/11/2025
function Private:Setup_Private_WindTools()

	-- Restore defaults
	E.private.WT = E:CopyTable({}, V.WT)

	-- Private db
	Set(E.private, 'WT.item.extendMerchantPages.enable', true)
	Set(E.private, 'WT.maps.minimapButtons.backdrop', false)
	Set(E.private, 'WT.maps.minimapButtons.backdropSpacing', 0)
	Set(E.private, 'WT.maps.minimapButtons.buttonSize', 22)
	Set(E.private, 'WT.maps.minimapButtons.buttonsPerRow', 7)
	Set(E.private, 'WT.maps.minimapButtons.expansionLandingPage', true)
	Set(E.private, 'WT.maps.minimapButtons.spacing', 3)
	Set(E.private, 'WT.maps.superTracker.enable', false)
	Set(E.private, 'WT.maps.superTracker.waypointParse.enable', false)
	Set(E.private, 'WT.maps.worldMap.enable', false)
	Set(E.private, 'WT.maps.worldMap.reveal.enable', false)
	Set(E.private, 'WT.maps.worldMap.scale.enable', false)
	Set(E.private, 'WT.misc.lfgList.icon.pack', 'LYNUI')
	Set(E.private, 'WT.misc.lfgList.icon.size', 14)
	Set(E.private, 'WT.misc.lfgList.line.height', 4)
	Set(E.private, 'WT.misc.lfgList.line.tex', Private.Texture)
	Set(E.private, 'WT.misc.lfgList.partyKeystone.enable', false)
	Set(E.private, 'WT.misc.lfgList.rightPanel.enable', false)
	Set(E.private, 'WT.misc.moveFrames.elvUIBags', false)
	Set(E.private, 'WT.misc.moveSpeed', true)
	Set(E.private, 'WT.misc.pauseToSlash', false)
	Set(E.private, 'WT.misc.tags', false)
	Set(E.private, 'WT.quest.objectiveTracker.cosmeticBar.border', 'ONEPIXEL')
	Set(E.private, 'WT.quest.objectiveTracker.cosmeticBar.color.mode', 'CLASS')
	Set(E.private, 'WT.quest.objectiveTracker.cosmeticBar.texture', Private.Texture)
	Set(E.private, 'WT.quest.objectiveTracker.cosmeticBar.width', 252)
	Set(E.private, 'WT.quest.objectiveTracker.enable', true)
	Set(E.private, 'WT.quest.objectiveTracker.header.classColor', true)
	Set(E.private, 'WT.quest.objectiveTracker.header.size', 12)
	Set(E.private, 'WT.quest.objectiveTracker.info.size', 11)
	Set(E.private, 'WT.quest.objectiveTracker.infoColor.customColorHighlight.b', 1)
	Set(E.private, 'WT.quest.objectiveTracker.infoColor.customColorHighlight.g', 1)
	Set(E.private, 'WT.quest.objectiveTracker.infoColor.customColorHighlight.r', 1)
	Set(E.private, 'WT.quest.objectiveTracker.infoColor.customColorNormal.b', 1)
	Set(E.private, 'WT.quest.objectiveTracker.infoColor.customColorNormal.g', 1)
	Set(E.private, 'WT.quest.objectiveTracker.infoColor.customColorNormal.r', 1)
	Set(E.private, 'WT.quest.objectiveTracker.menuTitle.classColor', true)
	Set(E.private, 'WT.quest.objectiveTracker.menuTitle.font.size', 12)
	Set(E.private, 'WT.quest.objectiveTracker.titleColor.classColor', true)
	Set(E.private, 'WT.skins.actionStatus.size', 12)
	Set(E.private, 'WT.skins.addons.angryKeystones', false)
	Set(E.private, 'WT.skins.addons.bigWigs', false)
	Set(E.private, 'WT.skins.addons.bugSack', false)
	Set(E.private, 'WT.skins.addons.hekili', false)
	Set(E.private, 'WT.skins.addons.immersion', false)
	Set(E.private, 'WT.skins.addons.myslot', false)
	Set(E.private, 'WT.skins.addons.omniCD', false)
	Set(E.private, 'WT.skins.addons.omniCDIcon', false)
	Set(E.private, 'WT.skins.addons.omniCDStatusBar', false)
	Set(E.private, 'WT.skins.addons.premadeGroupsFilter', false)
	Set(E.private, 'WT.skins.addons.tinyInspect', false)
	Set(E.private, 'WT.skins.addons.tomCats', false)
	Set(E.private, 'WT.skins.addons.warpDeplete', false)
	Set(E.private, 'WT.skins.addons.weakAuras', false)
	Set(E.private, 'WT.skins.addons.weakAurasOptions', false)
	Set(E.private, 'WT.skins.addons.worldQuestTab', false)
	Set(E.private, 'WT.skins.bigWigsSkin.queueTimer.countDown.name', Private.Font)
	Set(E.private, 'WT.skins.bigWigsSkin.queueTimer.countDown.size', 12)
	Set(E.private, 'WT.skins.blizzard.enable', false)
	Set(E.private, 'WT.skins.elvui.enable', false)
	Set(E.private, 'WT.skins.ime.label.name', Private.Font)
	Set(E.private, 'WT.skins.ime.label.size', 12)
	Set(E.private, 'WT.skins.shadow', false)
	Set(E.private, 'WT.skins.weakAurasShadow', false)
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
	Set(E.private, 'WT.tooltips.petIcon', false)
	Set(E.private, 'WT.tooltips.petId', false)
	Set(E.private, 'WT.tooltips.progression.enable', false)
	Set(E.private, 'WT.tooltips.tierSet', false)
	Set(E.private, 'WT.tooltips.titleIcon.enable', false)
	Set(E.private, 'WT.unitFrames.roleIcon.enable', false)
end
