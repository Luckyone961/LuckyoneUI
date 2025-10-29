-- Lua functions
local unpack = unpack

-- API cache
local GetAddOnMetadata = C_AddOns.GetAddOnMetadata

-- Global environment
local _G = _G

-- AddOn namespace
local _, Private = ...

-- ElvUI modules
local E, L, V, P, G = unpack(ElvUI)

-- Shadow & Light ProfileDB
-- LC: 09/09/2025
function Private:Setup_ShadowAndLight(installer)
	if not (Private.IsAddOnLoaded('ElvUI_SLE') and Private.isRetail) then Private:Print('|cff9482c9Shadow & Light|r ' .. L["is not installed or enabled."]) return end

	-- Restore defaults
	E.db.sle = E:CopyTable({}, P.sle)
	E.global.sle = E:CopyTable({}, G.sle)

	-- Global DB
	E.global.sle.advanced.confirmed = true
	E.global.sle.advanced.general = true

	-- Private DB
	Private:Setup_Private_ShadowAndLight()

	-- Profile DB
	E.db.sle.actionbar.vehicle.enabled = false
	E.db.sle.afk.chat.show = false
	E.db.sle.afk.defaultGraphics.classCrest.enable = false
	E.db.sle.afk.defaultGraphics.elvuiLogo.enable = false
	E.db.sle.afk.defaultGraphics.exPack.enable = false
	E.db.sle.afk.defaultGraphics.factionCrest.enable = false
	E.db.sle.afk.defaultGraphics.factionLogo.enable = false
	E.db.sle.afk.defaultGraphics.raceCrest.enable = false
	E.db.sle.afk.defaultGraphics.slLogo.enable = false
	E.db.sle.afk.defaultTexts.SL_AFKMessage.anchorPoint = 'CENTER'
	E.db.sle.afk.defaultTexts.SL_AFKMessage.attachTo = 'SL_BottomPanel'
	E.db.sle.afk.defaultTexts.SL_AFKMessage.font = Private.Font
	E.db.sle.afk.defaultTexts.SL_AFKMessage.yOffset = 0
	E.db.sle.afk.defaultTexts.SL_AFKTimePassed.font = Private.Font
	E.db.sle.afk.defaultTexts.SL_AFKTimePassed.xOffset = 3
	E.db.sle.afk.defaultTexts.SL_Date.anchorPoint = 'CENTER'
	E.db.sle.afk.defaultTexts.SL_Date.font = Private.Font
	E.db.sle.afk.defaultTexts.SL_Date.size = 26
	E.db.sle.afk.defaultTexts.SL_Date.xOffset = 0
	E.db.sle.afk.defaultTexts.SL_Date.yOffset = 40
	E.db.sle.afk.defaultTexts.SL_GuildName.enable = false
	E.db.sle.afk.defaultTexts.SL_GuildRank.enable = false
	E.db.sle.afk.defaultTexts.SL_PlayerClass.enable = false
	E.db.sle.afk.defaultTexts.SL_PlayerLevel.enable = false
	E.db.sle.afk.defaultTexts.SL_PlayerName.enable = false
	E.db.sle.afk.defaultTexts.SL_ScrollFrame.enable = false
	E.db.sle.afk.defaultTexts.SL_SubText.enable = false
	E.db.sle.afk.defaultTexts.SL_SubText.font = Private.Font
	E.db.sle.afk.defaultTexts.SL_Time.font = Private.Font
	E.db.sle.afk.defaultTexts.SL_Time.size = 26
	E.db.sle.afk.defaultTexts.SL_Time.yOffset = -10
	E.db.sle.afk.enable = false
	E.db.sle.afk.playermodel.enable = false
	E.db.sle.armory.character.background.overlay = false
	E.db.sle.armory.character.background.selectedBG = 'HIDE'
	E.db.sle.armory.character.durability.display = 'Hide'
	E.db.sle.armory.character.durability.font = Private.Font
	E.db.sle.armory.character.durability.fontSize = 11
	E.db.sle.armory.character.enable = true
	E.db.sle.armory.character.enchant.font = Private.Font
	E.db.sle.armory.character.enchant.fontSize = 9
	E.db.sle.armory.character.enchant.showReal = false
	E.db.sle.armory.character.enchant.yOffset = -1
	E.db.sle.armory.character.gem.xOffset = 4
	E.db.sle.armory.character.gem.yOffset = -1
	E.db.sle.armory.character.ilvl.font = Private.Font
	E.db.sle.armory.character.ilvl.fontSize = 11
	E.db.sle.armory.character.transmog.enableArrow = false
	E.db.sle.armory.inspect.background.overlay = false
	E.db.sle.armory.inspect.background.selectedBG = 'HIDE'
	E.db.sle.armory.inspect.enable = true
	E.db.sle.armory.inspect.enchant.font = Private.Font
	E.db.sle.armory.inspect.enchant.fontSize = 9
	E.db.sle.armory.inspect.enchant.showReal = false
	E.db.sle.armory.inspect.enchant.yOffset = -1
	E.db.sle.armory.inspect.gem.xOffset = 4
	E.db.sle.armory.inspect.gem.yOffset = -1
	E.db.sle.armory.inspect.ilvl.font = Private.Font
	E.db.sle.armory.inspect.ilvl.fontSize = 11
	E.db.sle.armory.inspect.transmog.enableArrow = false
	E.db.sle.armory.stats.itemLevel.font = Private.Font
	E.db.sle.armory.stats.itemLevel.fontOutline = Private.Outline
	E.db.sle.armory.stats.itemLevel.fontSize = 18
	E.db.sle.armory.stats.itemLevel.gradient.style = ''
	E.db.sle.armory.stats.List.ATTACK_DAMAGE = false
	E.db.sle.armory.stats.List.MOVESPEED = false
	E.db.sle.armory.stats.List.SPELLPOWER = false
	E.db.sle.armory.stats.statHeaders.font = Private.Font
	E.db.sle.armory.stats.statHeaders.fontOutline = Private.Outline
	E.db.sle.armory.stats.statLabels.font = Private.Font
	E.db.sle.armory.stats.statLabels.fontOutline = Private.Outline
	E.db.sle.armory.stats.statLabels.fontSize = 11
	E.db.sle.raidmarkers.enable = false
	E.db.sle.skins.objectiveTracker.classHeader = true
	E.db.sle.skins.objectiveTracker.underlineClass = true

	-- To avoid compatibility popup
	if Private.IsAddOnLoaded('ElvUI_WindTools') then
		E.db.sle.skins.objectiveTracker.underline = false
	end

	if installer then
		_G.LuckyoneInstallStepComplete:ShowMessage(L["Shadow&Light profile has been set."])
	end

	Private:Print(L["Shadow&Light profile has been set."])
end

-- Shadow & Light PrivateDB
-- LC: 09/09/2025
function Private:Setup_Private_ShadowAndLight()

	-- Get version
	local version = GetAddOnMetadata('ElvUI_SLE', 'Version')

	-- Restore defaults
	E.private.sle = E:CopyTable({}, V.sle)

	-- Private DB
	E.private.sle.install_complete = version
	E.private.sle.module.shadows.enable = false
	E.private.sle.professions.deconButton.enable = false
	E.private.sle.skins.objectiveTracker.BGbackdrop = false
	E.private.sle.skins.objectiveTracker.texture = Private.Texture
	E.private.sle.skins.objectiveTracker.underlineHeight = 2
	E.private.sle.skins.petbattles.enable = false
end
