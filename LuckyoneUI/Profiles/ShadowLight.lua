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

-- Shadow & Light ProfileDB
-- LC: 20/11/2025
function Private:Setup_ShadowAndLight(installer)
	if not (Private.IsAddOnLoaded('ElvUI_SLE') and Private.isRetail) then Private:Print('|cff9482c9Shadow & Light|r ' .. L["is not installed or enabled."]) return end

	-- Restore defaults
	E.db.sle = E:CopyTable({}, P.sle)
	E.global.sle = E:CopyTable({}, G.sle)

	-- Global DB
	Set(E.global, 'sle.advanced.confirmed', true)
	Set(E.global, 'sle.advanced.general', true)

	-- Private DB
	Private:Setup_Private_ShadowAndLight()

	-- Profile DB
	Set(E.db, 'sle.actionbar.vehicle.enabled', false)
	Set(E.db, 'sle.afk.chat.show', false)
	Set(E.db, 'sle.afk.defaultGraphics.classCrest.enable', false)
	Set(E.db, 'sle.afk.defaultGraphics.elvuiLogo.enable', false)
	Set(E.db, 'sle.afk.defaultGraphics.exPack.enable', false)
	Set(E.db, 'sle.afk.defaultGraphics.factionCrest.enable', false)
	Set(E.db, 'sle.afk.defaultGraphics.factionLogo.enable', false)
	Set(E.db, 'sle.afk.defaultGraphics.raceCrest.enable', false)
	Set(E.db, 'sle.afk.defaultGraphics.slLogo.enable', false)
	Set(E.db, 'sle.afk.defaultTexts.SL_AFKMessage.anchorPoint', 'CENTER')
	Set(E.db, 'sle.afk.defaultTexts.SL_AFKMessage.attachTo', 'SL_BottomPanel')
	Set(E.db, 'sle.afk.defaultTexts.SL_AFKMessage.font', Private.Font)
	Set(E.db, 'sle.afk.defaultTexts.SL_AFKMessage.yOffset', 0)
	Set(E.db, 'sle.afk.defaultTexts.SL_AFKTimePassed.font', Private.Font)
	Set(E.db, 'sle.afk.defaultTexts.SL_AFKTimePassed.xOffset', 3)
	Set(E.db, 'sle.afk.defaultTexts.SL_Date.anchorPoint', 'CENTER')
	Set(E.db, 'sle.afk.defaultTexts.SL_Date.font', Private.Font)
	Set(E.db, 'sle.afk.defaultTexts.SL_Date.size', 26)
	Set(E.db, 'sle.afk.defaultTexts.SL_Date.xOffset', 0)
	Set(E.db, 'sle.afk.defaultTexts.SL_Date.yOffset', 40)
	Set(E.db, 'sle.afk.defaultTexts.SL_GuildName.enable', false)
	Set(E.db, 'sle.afk.defaultTexts.SL_GuildRank.enable', false)
	Set(E.db, 'sle.afk.defaultTexts.SL_PlayerClass.enable', false)
	Set(E.db, 'sle.afk.defaultTexts.SL_PlayerLevel.enable', false)
	Set(E.db, 'sle.afk.defaultTexts.SL_PlayerName.enable', false)
	Set(E.db, 'sle.afk.defaultTexts.SL_ScrollFrame.enable', false)
	Set(E.db, 'sle.afk.defaultTexts.SL_SubText.enable', false)
	Set(E.db, 'sle.afk.defaultTexts.SL_SubText.font', Private.Font)
	Set(E.db, 'sle.afk.defaultTexts.SL_Time.font', Private.Font)
	Set(E.db, 'sle.afk.defaultTexts.SL_Time.size', 26)
	Set(E.db, 'sle.afk.defaultTexts.SL_Time.yOffset', -10)
	Set(E.db, 'sle.afk.enable', false)
	Set(E.db, 'sle.afk.playermodel.enable', false)
	Set(E.db, 'sle.armory.character.background.overlay', false)
	Set(E.db, 'sle.armory.character.background.selectedBG', 'HIDE')
	Set(E.db, 'sle.armory.character.durability.display', 'Hide')
	Set(E.db, 'sle.armory.character.durability.font', Private.Font)
	Set(E.db, 'sle.armory.character.durability.fontSize', 11)
	Set(E.db, 'sle.armory.character.enable', true)
	Set(E.db, 'sle.armory.character.enchant.font', Private.Font)
	Set(E.db, 'sle.armory.character.enchant.fontSize', 9)
	Set(E.db, 'sle.armory.character.enchant.showReal', false)
	Set(E.db, 'sle.armory.character.enchant.yOffset', -1)
	Set(E.db, 'sle.armory.character.gem.xOffset', 4)
	Set(E.db, 'sle.armory.character.gem.yOffset', -1)
	Set(E.db, 'sle.armory.character.ilvl.font', Private.Font)
	Set(E.db, 'sle.armory.character.ilvl.fontSize', 11)
	Set(E.db, 'sle.armory.character.transmog.enableArrow', false)
	Set(E.db, 'sle.armory.inspect.background.overlay', false)
	Set(E.db, 'sle.armory.inspect.background.selectedBG', 'HIDE')
	Set(E.db, 'sle.armory.inspect.enable', true)
	Set(E.db, 'sle.armory.inspect.enchant.font', Private.Font)
	Set(E.db, 'sle.armory.inspect.enchant.fontSize', 9)
	Set(E.db, 'sle.armory.inspect.enchant.showReal', false)
	Set(E.db, 'sle.armory.inspect.enchant.yOffset', -1)
	Set(E.db, 'sle.armory.inspect.gem.xOffset', 4)
	Set(E.db, 'sle.armory.inspect.gem.yOffset', -1)
	Set(E.db, 'sle.armory.inspect.ilvl.font', Private.Font)
	Set(E.db, 'sle.armory.inspect.ilvl.fontSize', 11)
	Set(E.db, 'sle.armory.inspect.transmog.enableArrow', false)
	Set(E.db, 'sle.armory.stats.itemLevel.font', Private.Font)
	Set(E.db, 'sle.armory.stats.itemLevel.fontOutline', Private.Outline)
	Set(E.db, 'sle.armory.stats.itemLevel.fontSize', 18)
	Set(E.db, 'sle.armory.stats.itemLevel.gradient.style', '')
	Set(E.db, 'sle.armory.stats.List.ATTACK_DAMAGE', false)
	Set(E.db, 'sle.armory.stats.List.MOVESPEED', false)
	Set(E.db, 'sle.armory.stats.List.SPELLPOWER', false)
	Set(E.db, 'sle.armory.stats.statHeaders.font', Private.Font)
	Set(E.db, 'sle.armory.stats.statHeaders.fontOutline', Private.Outline)
	Set(E.db, 'sle.armory.stats.statLabels.font', Private.Font)
	Set(E.db, 'sle.armory.stats.statLabels.fontOutline', Private.Outline)
	Set(E.db, 'sle.armory.stats.statLabels.fontSize', 11)
	Set(E.db, 'sle.raidmarkers.enable', false)
	Set(E.db, 'sle.skins.objectiveTracker.classHeader', true)
	Set(E.db, 'sle.skins.objectiveTracker.underlineClass', true)

	-- To avoid compatibility popup
	if Private.IsAddOnLoaded('ElvUI_WindTools') then
		Set(E.db, 'sle.skins.objectiveTracker.underline', false)
	end

	if installer then
		_G.LuckyoneInstallStepComplete:ShowMessage(L["Shadow&Light profile has been set."])
	end

	Private:Print(L["Shadow&Light profile has been set."])
end

-- Shadow & Light PrivateDB
-- LC: 20/11/2025
function Private:Setup_Private_ShadowAndLight()

	-- Get version
	local version = GetAddOnMetadata('ElvUI_SLE', 'Version')

	-- Restore defaults
	E.private.sle = E:CopyTable({}, V.sle)

	-- Private DB
	Set(E.private, 'sle.install_complete', version)
	Set(E.private, 'sle.module.shadows.enable', false)
	Set(E.private, 'sle.professions.deconButton.enable', false)
	Set(E.private, 'sle.skins.objectiveTracker.BGbackdrop', false)
	Set(E.private, 'sle.skins.objectiveTracker.texture', Private.Texture)
	Set(E.private, 'sle.skins.objectiveTracker.underlineHeight', 2)
	Set(E.private, 'sle.skins.petbattles.enable', false)
end
