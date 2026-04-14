-- Addon namespace
local _, Private = ...
local L = Private.Libs.ACL
local ACH = Private.Libs.ACH

-- Lua functions
local format = string.format
local pairs = pairs
local concat = table.concat
local tinsert = table.insert
local tostring = tostring

-- API cache
local GetCVarBool = C_CVar.GetCVarBool
local SetCVar = C_CVar.SetCVar
local HideUIPanel = HideUIPanel

-- Global environment
local _G = _G
local StaticPopup_Show = _G.StaticPopup_Show
local SettingsPanel = _G.SettingsPanel

-- Constants
local RELOAD_POPUP = 'LUCKYONE_RL'
local RESET_DEFAULTS_TEXT = L["Reset to LuckyoneUI defaults."]

-- Credits
Private.Credits = {}

local AUTHOR = { '|cff33937FLucky|r - LaughingSkull', '|cffFF7D0ALuckyone|r - LaughingSkull' }
local CODING = { '|cff0070DEAzilroka|r', '|cFF8866ccSimpy|r', '|cffF58CBARepooc|r', '|cffFF7D0AMerathilis|r' }
local SUPPORT = { '|cffe6cc80Calmcacil|r', '|cffe6cc80DaPaKnat|r', '|cffe6cc80Debeleus|r', '|cffe6cc80DevinDog|r', '|cffe6cc80Dukes|r', '|cffe6cc80Garbar|r', '|cffe6cc80Kenneth|r', '|cffe6cc80Liam|r', '|cffe6cc80Littlesack|r', '|cffe6cc80Lox|r', '|cffe6cc80Midnatt|r', '|cffe6cc80MonkeyHack|r', '|cffe6cc80Onlyne|r', '|cffe6cc80ShowNoMercy|r', '|cffe6cc80Treelyté|r', '|cffe6cc80Triplebeamdreams|r', '|cffe6cc80Tykk|r', '|cffe6cc80Logan|r' }
local TESTERS = { '|cff00FF96AltBridge|r', '|cffABD473Badbrain|r', '|cff00FF96Doctorio|r', '|cffC41F3BKringel|r', '|cffF58CBAIllusion|r', '|cffABD473Dlarge|r', '|cffe6cc80Hollicsh|r', '|cff3FC7EBEltreum|r', '|cffFFFFFFOniria|r' }

local function ProcessList(list)
	for _, name in pairs(list) do
		tinsert(Private.Credits, name)
	end
	return concat(list, '|n')
end

local AUTHOR_STRING = ProcessList(AUTHOR)
local CODING_STRING = ProcessList(CODING)
local TESTER_STRING = ProcessList(TESTERS)
local SUPPORT_STRING = ProcessList(SUPPORT)

-- Build Setup Section
local function BuildSetupSection()
	local section = ACH:Group('', nil, 2)
	section.inline = true
	section.args.installer = ACH:Execute(Private.Name .. ' ' .. L["Install"], L["Re-Run the installation process."], 3, function() Private.Installer:Show(Private.InstallerData) if Private.ElvUI then ElvUI[1]:ToggleOptions() else HideUIPanel(SettingsPanel) end end)
	section.args.spacer2 = ACH:Spacer(4, 'full')

	if Private.ElvUI then
		section.args.header1 = ACH:Header(Private.Name, 1)
		section.args.spacer1 = ACH:Spacer(2, 'full')
		section.args.header2 = ACH:Header(L["Quick setup for alts"], 5)
		section.args.spacer3 = ACH:Spacer(6, 'full')
		section.args.altMain = ACH:Execute(L["Alt: "] .. L["DPS & Tanks"], L["This will load your most recent LuckyoneUI profile."], 7, function() Private:HandleAlts('Main') end, nil, true)
		section.args.altHealing = ACH:Execute(L["Alt: "] .. L["Healing"], L["This will load your most recent LuckyoneUI profile."], 8, function() Private:HandleAlts('Healing') end, nil, true)
	end
	return section
end

-- Build General Section
local function BuildGeneralSection()
	local section = ACH:Group(L["General"], nil, 5)
	section.args.header = ACH:Header(L["Blizzard Improvements"], 1)
	section.args.disabledFrames = ACH:Group(L["Hide Blizzard Frames"], nil, 2, nil, function(info) return Private.Addon.db.profile.disabledFrames[info[#info]] end, function(info, value) Private.Addon.db.profile.disabledFrames[info[#info]] = value StaticPopup_Show(RELOAD_POPUP) end)
	section.args.disabledFrames.inline = true
	section.args.disabledFrames.args.ZoneTextFrame = ACH:Toggle(L["Zone Text"], L["Hide the Zone Text"], 1)
	section.args.disabledFrames.args.AlertFrame = ACH:Toggle(L["Alert Frame"], L["Hide the Loot/Alert Frame"], 2)
	section.args.disabledFrames.args.BossBanner = ACH:Toggle(L["Boss Banner"], L["Hide the Boss Banner"], 3, nil, nil, nil, nil, nil, nil, not Private.isRetail)
	section.args.disabledFrames.args.HousingDecorAlerts = ACH:Toggle(L["Housing Decor Alerts"], L["Hide the Housing Alerts for \n\'New Decor Added\'"], 4, nil, nil, nil, nil, nil, nil, not Private.isRetail)
	section.args.disabledFrames.args.ApplicationCover = ACH:Toggle(L["Application Cover"], L["Removes the LFG frame overlay and animation which blocks your mouse inputs and tooltip when you are not the party leader."], 5, nil, nil, nil, nil, nil, nil, not Private.isRetail)
	section.args.qualityOfLife = ACH:Group(L["Quality of Life"], nil, 3, nil, function(info) return Private.Addon.db.profile.qualityOfLife[info[#info]] end, function(info, value) Private.Addon.db.profile.qualityOfLife[info[#info]] = value StaticPopup_Show(RELOAD_POPUP) end)
	section.args.qualityOfLife.inline = true
	section.args.qualityOfLife.args.easyDelete = ACH:Toggle(L["Easy Delete"], L["Automatically fill out the confirmation text to delete items."], 1)
	section.args.qualityOfLife.args.privacyOverlay = ACH:Toggle(L["Privacy Overlay"], L["Creates an overlay to hide the chat frame in the Communities Frame until you click on it."], 2)
	section.args.strings = ACH:Group(L["Profile strings"], nil, 4, nil, nil, nil, nil, not Private.isRetail)
	section.args.strings.inline = true
	section.args.strings.args.editModeString = ACH:Execute(L["Copy Import String"], nil, 1, function() Private:Return_EditModeString() end)
	section.args.strings.args.editModeToggle = ACH:Execute(format('|cff4beb2c%s|r', L["Enter Edit Mode"]), nil, 2, function() Private:ToggleEditMode() if Private.ElvUI then ElvUI[1]:ToggleOptions() end end)
	section.args.performance = ACH:Group(L["Performance Tweaks"], nil, 5, nil, nil, nil, nil, not Private.isRetail)
	section.args.performance.inline = true
	section.args.performance.args.performance = ACH:Execute(L["Untrack Hidden Quests"], L["People found out some characters have a big amount of hidden quests which will cause performance issues. This button will untrack all your quests, including the hidden ones and might give you an increase in average FPS."], 1, function() Private:UntrackAllQuests() end)
	return section
end

-- Build Auras Section
local function BuildAurasSection()
	if not Private.ElvUI then return end -- ElvUI section
	local section = ACH:Group(L["Auras"], nil, 10)
	section.args.header = ACH:Header(L["Auras"], 1)
	section.args.filters = ACH:Group(L["Filters"], nil, 2)
	section.args.filters.inline = true
	section.args.filters.args.setup = ACH:Execute((Private.isRetail and L["Setup Aura Indicators"]) or L["Setup Aura Filters"], nil, 1, function() Private:Setup_Filters() StaticPopup_Show(RELOAD_POPUP) end)
	section.args.Desc = ACH:Group(L["Description"], nil, 3)
	section.args.Desc.inline = true
	section.args.Desc.args.cvars = ACH:Description((Private.isRetail and L["This will apply Luckyones Aura Indicator edit and set the style to Textured."]) or L["This will apply Luckyones Aura Indicator edit and set the style to Textured.\nIt will also add custom IDs to Whitelist & Blacklist.\n"], 2, 'medium')
	return section
end

-- Build PrivateDB Section
local function BuildPrivateDBSection()
	if not Private.ElvUI then return end -- ElvUI section
	local section = ACH:Group(L["Character Specific"], nil, 15)
	section.args.header = ACH:Header(L["Character Specific"], 1)
	section.args.defaults = ACH:Group(L["Restore LuckyoneUI Defaults"], nil, 2)
	section.args.defaults.inline = true
	section.args.defaults.args.private = ACH:Execute(L["Restore Defaults"], nil, 1, function() Private:Setup_PrivateDB(true) ElvUI[1]:UpdateMediaItems(true) end, nil, true)
	section.args.defaultsDesc = ACH:Group(L["The following data will be updated"], nil, 3)
	section.args.defaultsDesc.inline = true
	section.args.defaultsDesc.args.cvars = ACH:Description('- All Fonts: Expressway\n- All Font Outlines: Outline\n- All Textures: Minimalist\n\n- Friendly Nameplate Font Sizes\n- Totem Tracker: disabled\n- Parchment Remover: enabled\n\n- (Classic Only) Make Shamans blue instead of pink\n- (Retail Only) Character specific settings for Shadow&Light and WindTools', 1, 'medium')
	return section
end

-- Build Chat Section
local function BuildChatSection()
	local section = ACH:Group(L["Chat"], nil, 20)
	section.args.header = ACH:Header(L["Chat"], 1)
	section.args.chatSetup = ACH:Group(L["Setup Chat"], nil, 2)
	section.args.chatSetup.inline = true
	section.args.chatSetup.args.chat = ACH:Execute(L["Setup Chat"], nil, 1, function() Private:Setup_Chat() end)
	section.args.chatSetup.args.chattynator = ACH:Execute(L["Use Chattynator Addon"], nil, 2, function() Private:Setup_Chattynator() StaticPopup_Show(RELOAD_POPUP) end, nil, true)
	section.args.chatDesc = ACH:Group(L["Description"], nil, 3)
	section.args.chatDesc.inline = true
	section.args.chatDesc.args.desc = ACH:Description(L["Setup Chat will reset your chat panels to default and create custom chat tabs.\n\nChat tabs: [ Main - Log - Whisper - Guild - Party ]"], 1, 'medium')
	section.args.chatVars = ACH:Group(L["Chat CVars"], nil, 4)
	section.args.chatVars.inline = true
	section.args.chatVars.args.desc = ACH:Description('- chatClassColorOverride 0\n- chatMouseScroll 1\n- chatStyle classic\n- colorChatNamesByClass 1\n- whisperMode inline\n- wholeChatWindowClickable 0', 1, 'medium')
	return section
end

-- Build CVars Section
local function BuildCVarsSection()
	local section = ACH:Group(L["Console Variables"], nil, 25)
	section.args.header = ACH:Header(L["Console Variables"], 1)
	section.args.setup = ACH:Group(L["Setup CVars"], nil, 2)
	section.args.setup.inline = true
	section.args.setup.args.generalVars = ACH:Execute(L["General CVars"], nil, 1, function() Private:Setup_CVars() end, nil, true)
	section.args.setup.args.nameplateVars = ACH:Execute(L["Nameplate CVars"], nil, 2, function() Private:NameplateCVars() end, nil, true)
	section.args.generalDesc = ACH:Group(L["General CVars"], nil, 3)
	section.args.generalDesc.inline = true
	section.args.generalDesc.args.cvars = ACH:Description('- AutoPushSpellToActionBar 0\n- cameraDistanceMaxZoomFactor 2.6\n- countdownForCooldowns 1\n- fstack_preferParentKeys 0\n- lockActionBars 1\n- minimapTrackingShowAll 1\n- screenshotQuality 10\n- showNPETutorials 0\n- showTutorials 0\n- threatWarning 3\n- UberTooltips 1\n', 1, 'medium')
	section.args.nameplateDesc = ACH:Group(L["Nameplate CVars"], nil, 4)
	section.args.nameplateDesc.inline = true
	section.args.nameplateDesc.args.cvars = ACH:Description('- nameplateLargerScale 1\n- nameplateMinAlpha 1\n- nameplateMinScale 1\n- nameplateOccludedAlphaMult 1\n- nameplateOverlapH 1.2\n- nameplateOverlapV 1.6\n- nameplateSelectedScale 1\n- nameplateSelfAlpha 1\n\n- UnitNameEnemyGuardianName 1\n- UnitNameEnemyMinionName 1\n- UnitNameEnemyPetName 1\n- UnitNameEnemyPlayerName 1\n- UnitNameEnemyTotemName 1', 1, 'medium')
	return section
end

-- Build ElvUI Layouts Section
local function BuildElvUILayoutSection()
	if not Private.ElvUI then return end -- ElvUI section
	local section = ACH:Group(L["ElvUI Layouts"], nil, 30)
	section.args.header1 = ACH:Header(L["LuckyoneUI Scale"], 1)
	section.args.scaling = ACH:Group(L["1440p = Default | 1080p = Downscaled"], nil, 2)
	section.args.scaling.inline = true
	section.args.scaling.args.native = ACH:Toggle('1440p', nil, 1, nil, nil, nil, function() return not Private.Addon.db.global.scaled end, function(_, value) Private.Addon.db.global.scaled = not value end)
	section.args.scaling.args.scaled = ACH:Toggle('1080p', nil, 2, nil, nil, nil, function() return Private.Addon.db.global.scaled end, function(_, value) Private.Addon.db.global.scaled = value end)
	section.args.header2 = ACH:Header(L["ElvUI Layouts"], 3)
	section.args.midnight = ACH:Group(L["Midnight Layouts"] .. ' (v' .. tostring(Private.Version) .. ') (' .. format('|cff4beb2c%s', L["Current"]) .. ')', nil, 4)
	section.args.midnight.inline = true
	section.args.midnight.args.main = ACH:Execute(L["DPS & Tanks"], nil, 1, function() Private:Setup_Layout('main') StaticPopup_Show(RELOAD_POPUP) end, nil, true)
	section.args.midnight.args.healing = ACH:Execute(L["Healing"], nil, 2, function() Private:Setup_Layout('healing') StaticPopup_Show(RELOAD_POPUP) end, nil, true)
	section.args.midnight.args.support = ACH:Execute(format('|cff33937F%s', L["Augmentation"]), nil, 3, function() Private:Setup_Layout('support') StaticPopup_Show(RELOAD_POPUP) end, nil, true)
	return section
end

-- Build ElvUI Themes Section
local function BuildElvUIThemesSection()
	if not Private.ElvUI then return end -- ElvUI section
	local section = ACH:Group(L["ElvUI Themes"], nil, 35)
	section.args.header = ACH:Header(L["ElvUI Themes"], 1)
	section.args.raid = ACH:Group(L["UnitFrames Color Theme"], nil, 2)
	section.args.raid.inline = true
	section.args.raid.args.dark = ACH:Execute(L["Dark"], L["Dark Style (Default)"], 1, function() Private:Setup_Theme('dark') end, nil, true)
	section.args.raid.args.class = ACH:Execute(L["Class Color"], L["Class Color Style"], 2, function() Private:Setup_Theme('class') end, nil, true)
	return section
end

-- Build ElvUI Tweaks Section
local function BuildElvUITweaksSection()
	if not (Private.ElvUI and Private.isRetail) then return end -- ElvUI (Retail only) section
	local section = ACH:Group(L["ElvUI Tweaks"], nil, 40)
	section.args.header = ACH:Header(L["ElvUI Tweaks"], 1)
	section.args.toggles = ACH:Group(L["Toggles"], nil, 2)
	section.args.toggles.inline = true
	section.args.toggles.args.mythicVisibility = ACH:Toggle(L["Mythic Raidframe Visibility"], L["Feature explained in the description below"], 1, nil, nil, nil, function() return Private.Addon.db.profile.misc.mythicVisibility end, function(_, value) Private.Addon.db.profile.misc.mythicVisibility = value end, nil, not Private.isRetail)
	section.args.toggles.args.dataTextsTweaks = ACH:Toggle(L["DataTexts Tweaks"], L["Feature explained in the description below"], 2, nil, nil, nil, function() return Private.Addon.db.profile.misc.dataTextsTweaks end, function(_, value) Private.Addon.db.profile.misc.dataTextsTweaks = value end, nil, not Private.isRetail)
	section.args.mythicVisibilityDesc = ACH:Group(L["Mythic Raidframe Visibility explained"], nil, 3, nil, nil, nil, nil, not Private.isRetail)
	section.args.mythicVisibilityDesc.inline = true
	section.args.mythicVisibilityDesc.args.desc = ACH:Description(L["Your Raid 1 frames will be enabled if you enter Mythic difficulty (Triggers after loading screen)\nYour Raid 2 frames will be disabled if you enter Mythic difficulty (Triggers after loading screen)\n\nAdditionally the maxAllowedGroups setting will be enabled and the visibility state gets modified\nBenched people in groups 5-8 while not show up when you're Mythic raiding\n\nAll changes mentioned above will revert back to default upon leaving the raid"], 1, 'medium', nil, nil, nil, nil, nil, not Private.isRetail)
	section.args.dataTextsTweaksDesc = ACH:Group(L["DataTexts Tweaks explained"], nil, 4, nil, nil, nil, nil, not Private.isRetail)
	section.args.dataTextsTweaksDesc.inline = true
	section.args.dataTextsTweaksDesc.args.desc = ACH:Description(L["Adjusts the width of the 'FPS - Combat Time - Durability' DataText based on your LuckyoneUI layout\n\nThe DPS & Tanks layout will match the default width of my Action Bars\nThe Healing layout will match the default width of my Raidframes\n\nAll changes mentioned above will trigger upon changing your specialization\nIt also assumes you have properly setup specialization-based profile loading in ElvUI profiles"], 1, 'medium', nil, nil, nil, nil, nil, not Private.isRetail)
	return section
end

-- Build Graphics Section
local function BuildGraphicsSection()
	local section = ACH:Group(L["Graphics"], nil, 45)
	section.args.header = ACH:Header(L["Graphics"], 1)
	section.args.toggles = ACH:Group(L["General"], nil, 2)
	section.args.toggles.inline = true
	section.args.toggles.args.ResampleAlwaysSharpen = ACH:Toggle('ResampleAlwaysSharpen', 'Game Default: off | Suggestion: on', 1, nil, nil, nil, function() return GetCVarBool('ResampleAlwaysSharpen') end, function(_, value) SetCVar('ResampleAlwaysSharpen', value and 1 or 0) end)
	section.args.toggles.args.GxAllowCachelessShaderMode = ACH:Toggle('CachelessShaderMode', 'Game Default: off | Suggestion: off', 2, nil, nil, nil, function() return GetCVarBool('GxAllowCachelessShaderMode') end, function(_, value) SetCVar('GxAllowCachelessShaderMode', value and 1 or 0) end)
	section.args.cosmetic = ACH:Group(L["Cosmetic"], nil, 3)
	section.args.cosmetic.inline = true
	section.args.cosmetic.args.ffxDeath = ACH:Toggle('ffx Death', 'Game Default: on | Suggestion: off', 1, nil, nil, nil, function() return GetCVarBool('ffxDeath') end, function(_, value) SetCVar('ffxDeath', value and 1 or 0) end)
	section.args.cosmetic.args.ffxGlow = ACH:Toggle('ffx Glow', 'Game Default: on | Suggestion: off', 2, nil, nil, nil, function() return GetCVarBool('ffxGlow') end, function(_, value) SetCVar('ffxGlow', value and 1 or 0) end)
	section.args.cosmetic.args.ffxNether = ACH:Toggle('ffx Nether', 'Game Default: on | Suggestion: off', 3, nil, nil, nil, function() return GetCVarBool('ffxNether') end, function(_, value) SetCVar('ffxNether', value and 1 or 0) end)
	section.args.cosmetic.args.ffxVenari = ACH:Toggle('ffx Venari', 'Game Default: on | Suggestion: off', 4, nil, nil, nil, function() return GetCVarBool('ffxVenari') end, function(_, value) SetCVar('ffxVenari', value and 1 or 0) end)
	section.args.cosmetic.args.ffxLingeringVenari = ACH:Toggle('ffx Lingering Venari', 'Game Default: on | Suggestion: off', 5, nil, nil, nil, function() return GetCVarBool('ffxLingeringVenari') end, function(_, value) SetCVar('ffxLingeringVenari', value and 1 or 0) end)
	return section
end

-- Build Profiles Section
local function BuildProfilesSection()
	local section = ACH:Group(L["Profiles"], nil, 50)
	section.args.header1 = ACH:Header(L["Profiles"], 1)
	section.args.plugins = ACH:Group(L["ElvUI Plugins"], nil, 2, nil, nil, nil, nil, not Private.ElvUI)
	section.args.plugins.inline = true
	section.args.plugins.args.wt = ACH:Execute('|cff5385edWindTools|r', RESET_DEFAULTS_TEXT, 1, function() Private:Setup_WindTools() StaticPopup_Show(RELOAD_POPUP) end, nil, true, nil, nil, nil, nil, not (Private.isRetail and Private.ElvUI))
	section.args.plugins.args.sle = ACH:Execute('|cff9482c9Shadow & Light|r', RESET_DEFAULTS_TEXT, 2, function() Private:Setup_ShadowAndLight() StaticPopup_Show(RELOAD_POPUP) end, nil, true, nil, nil, nil, nil, not (Private.isRetail and Private.ElvUI))
	section.args.nameplates = ACH:Group(L["Nameplate Profiles"], nil, 3)
	section.args.nameplates.inline = true
	section.args.nameplates.args.elvui = ACH:Execute('ElvUI', RESET_DEFAULTS_TEXT, 1, function() Private:Setup_NamePlates() StaticPopup_Show(RELOAD_POPUP) end, nil, true, nil, nil, nil, nil, not (Private.isRetail and Private.ElvUI))
	section.args.nameplates.args.plater = ACH:Execute('Plater', RESET_DEFAULTS_TEXT, 2, function() Private:Setup_Plater() StaticPopup_Show(RELOAD_POPUP) end, nil, true)
	section.args.bossmods = ACH:Group(L["BossMods Profiles"], nil, 4)
	section.args.bossmods.inline = true
	section.args.bossmods.args.bigwigsMain = ACH:Execute(L["BigWigs Main"], RESET_DEFAULTS_TEXT, 1, function() Private:Setup_BigWigs('main') end, nil, true)
	section.args.bossmods.args.bigwigsHealing = ACH:Execute(L["BigWigs Healing"], RESET_DEFAULTS_TEXT, 2, function() Private:Setup_BigWigs('healing') end, nil, true)
	section.args.addons = ACH:Group(L["Addon Profiles"], nil, 5)
	section.args.addons.inline = true
	section.args.addons.args.acdm = ACH:Execute('AyijeCDM', RESET_DEFAULTS_TEXT, 1, function() Private:Setup_ACDM() StaticPopup_Show(RELOAD_POPUP) end, nil, true, nil, nil, nil, nil, not Private.isRetail)
	section.args.addons.args.bcdm = ACH:Execute('BetterCooldownManager', RESET_DEFAULTS_TEXT, 2, function() Private:Setup_BCDM() StaticPopup_Show(RELOAD_POPUP) end, nil, true, nil, nil, nil, nil, not Private.isRetail)
	section.args.addons.args.buffReminders = ACH:Execute('BuffReminders', RESET_DEFAULTS_TEXT, 3, function() Private:Setup_BuffReminders() StaticPopup_Show(RELOAD_POPUP) end, nil, true, nil, nil, nil, nil, not Private.isRetail)
	section.args.addons.args.details = ACH:Execute('Details', RESET_DEFAULTS_TEXT, 4, function() Private:Setup_Details() StaticPopup_Show(RELOAD_POPUP) end, nil, true)
	section.args.addons.args.permoksAccountManager = ACH:Execute('PermoksAccountManager', RESET_DEFAULTS_TEXT, 5, function() Private:Setup_PermoksAccountManager() StaticPopup_Show(RELOAD_POPUP) end, nil, true, nil, nil, nil, nil, not Private.isRetail)
	section.args.addons.args.plumber = ACH:Execute('Plumber', RESET_DEFAULTS_TEXT, 6, function() Private:Setup_Plumber() StaticPopup_Show(RELOAD_POPUP) end, nil, true, nil, nil, nil, nil, not Private.isRetail)
	section.args.addons.args.warpDeplete = ACH:Execute('WarpDeplete', RESET_DEFAULTS_TEXT, 7, function() Private:Setup_WarpDeplete() StaticPopup_Show(RELOAD_POPUP) end, nil, true, nil, nil, nil, nil, not Private.isRetail)
	return section
end

-- Build Skins Section
local function BuildSkinsSection()
	if not Private.ElvUI then return end -- ElvUI section
	local section = ACH:Group('Skins', nil, 55)
	section.args.header = ACH:Header('Skins', 1)
	section.args.addons = ACH:Group('AddOns', nil, 2, nil, function(info) return Private.Addon.db.profile.skins[info[#info]] end, function(info, value) Private.Addon.db.profile.skins[info[#info]] = value StaticPopup_Show(RELOAD_POPUP) end)
	section.args.addons.inline = true
	section.args.addons.args.BugSack = ACH:Toggle('BugSack', L["Skin the Addon in ElvUI style"], 1, nil, nil, nil, nil, nil, nil, not Private.IsAddOnLoaded('BugSack'))
	section.args.addons.args.DejaClassicStats = ACH:Toggle('Deja Classic Stats', L["Skin the Addon in ElvUI style"], 2, nil, nil, nil, nil, nil, nil, (Private.isRetail or Private.isMists) and not Private.IsAddOnLoaded('DejaClassicStats'))
	section.args.addons.args.LeatrixPlus = ACH:Toggle('Leatrix Plus', L["Skin the two small Head/Cloak toggle checkboxes on the character frame in ElvUI style"], 3, nil, nil, nil, nil, nil, nil, (Private.isRetail or Private.isMists) and not Private.IsAddOnLoaded('Leatrix_Plus'))
	section.args.addons.args.LFGBulletinBoard = ACH:Toggle('LFG Bulletin Board', L["Skin the full bulletin board frame in ElvUI style"], 4, nil, nil, nil, nil, nil, nil, (Private.isRetail or Private.isMists) and not Private.IsAddOnLoaded('LFGBulletinBoard'))
	section.args.addons.args.NovaSpellRankChecker = ACH:Toggle('Nova Spell Rank Checker', L["Skin the Spell Rank Checker button in ElvUI style"], 5, nil, nil, nil, nil, nil, nil, (Private.isRetail or Private.isMists) and not Private.IsAddOnLoaded('NovaSpellRankChecker'))
	section.args.addons.args.NovaWorldBuffs = ACH:Toggle('Nova World Buffs', L["Skin the small layer frame on the Minimap in ElvUI style and move it to the bottom left"], 6, nil, nil, nil, nil, nil, nil, (Private.isRetail or Private.isMists) and not Private.IsAddOnLoaded('NovaWorldBuffs'))
	section.args.addons.args.Tabardy = ACH:Toggle('Tabardy', L["Skin the Addon in ElvUI style"], 7, nil, nil, nil, nil, nil, nil, not Private.IsAddOnLoaded('Tabardy'))
	section.args.addons.args.WhatsTraining = ACH:Toggle('WhatsTraining', L["Skin the WhatsTraining page in the Spellbook in ElvUI style"], 8, nil, nil, nil, nil, nil, nil, (Private.isRetail or Private.isMists) and not Private.IsAddOnLoaded('WhatsTraining'))
	return section
end

-- Build Tags Section
local function BuildTagsSection()
	if not Private.ElvUI then return end -- ElvUI section
	local section = ACH:Group(L["Tags"], nil, 60)
	section.args.header = ACH:Header(L["Tags"], 1)
	section.args.spacer = ACH:Spacer(2, 'full')
	section.args.shortcut = ACH:Execute(L["Available Tags"], nil, 3, function() ElvUI[1].Libs.AceConfigDialog:SelectGroup('ElvUI', 'tagGroup', Private.Name) end)
	return section
end

-- Build Credits Section
local function BuildCreditsSection()
	local section = ACH:Group(format('|cfd9b9b9b%s|r', L["Credits"]), nil, 65)
	section.args.header = ACH:Header(L["Credits"], 1)
	section.args.author = ACH:Group(L["Author"], nil, 2)
	section.args.author.inline = true
	section.args.author.args.desc = ACH:Description(AUTHOR_STRING, 1, 'medium')
	section.args.coding = ACH:Group(L["Coding"], nil, 3)
	section.args.coding.inline = true
	section.args.coding.args.desc = ACH:Description(CODING_STRING, 1, 'medium')
	section.args.testers = ACH:Group(L["Testers and Translation"], nil, 4)
	section.args.testers.inline = true
	section.args.testers.args.desc = ACH:Description(TESTER_STRING, 1, 'medium')
	section.args.supporter = ACH:Group(L["Supporters"], nil, 5)
	section.args.supporter.inline = true
	section.args.supporter.args.desc = ACH:Description(SUPPORT_STRING, 1, 'medium')
	return section
end

-- Build Links Section
local function BuildLinksSection()
	local section = ACH:Group(format('|cfd9b9b9b%s|r', L["Links"]), nil, 70)
	section.args.header = ACH:Header(L["Links"], 1)
	section.args.spacer = ACH:Spacer(2, 'full')
	section.args.website = ACH:Input(L["Addon download:"], nil, 3, nil, 'full', function() return 'https://download.luckyone.dev' end)
	section.args.changelog = ACH:Input(L["Changelog:"], nil, 4, nil, 'full', function() return 'https://changelog.luckyone.dev' end)
	section.args.discord = ACH:Input('Discord:', nil, 5, nil, 'full', function() return 'https://discord.luckyone.dev' end)
	section.args.issues = ACH:Input(L["Report issues here:"], nil, 6, nil, 'full', function() return 'https://tickets.luckyone.dev' end)
	section.args.guide = ACH:Input(L["Wowhead guide:"], nil, 7, nil, 'full', function() return 'https://guide.luckyone.dev' end)
	section.args.twitch = ACH:Input('Twitch:', nil, 8, nil, 'full', function() return 'https://twitch.luckyone.dev' end)
	section.args.youtube = ACH:Input('YouTube:', nil, 9, nil, 'full', function() return 'https://youtube.luckyone.dev' end)
	section.args.homepage = ACH:Input(L["Homepage:"], nil, 10, nil, 'full', function() return 'https://luckyone.dev' end)
	return section
end

-- Build Dev Section
local function BuildDevSection()
	local section = ACH:Group(format('|cff4beb2c%s|r', 'Developer'), nil, 100)
	section.args.header1 = ACH:Header('Developer', 1)
	section.args.toggles = ACH:Group(L["Toggles"], nil, 2)
	section.args.toggles.inline = true
	section.args.toggles.args.dev = ACH:Toggle('Developer Mode', 'Enable this toggle to apply Luckyone\'s personal adjustments during the installation process.\n\nAdditional information section will show up at the bottom of the config after ReloadUI.\n\n|cffC80000There is no support for this.\n\nUse at own risk.|r', 1, nil, nil, nil, function() return Private.Addon.db.global.dev end, function(_, value) Private.Addon.db.global.dev = value end)
	section.args.devInfo = ACH:Group('Information', nil, 3)
	section.args.devInfo.inline = true
	section.args.devInfo.args.desc = ACH:Description('While this developer mode is enabled, the following will change:\n\n- Profiles created by the installer will no longer add the version suffix to the profile name.\n- Profile installer make additional database adjustments as listed below.', 1, 'medium')
	section.args.db = ACH:Group('Database adjustments', nil, 4)
	section.args.db.inline = true
	section.args.db.args.desc = ACH:Description('- Chat bubble skinning disabled (To use texture replacements)\n- Bags module disabled (To use Baganator)\n- Alert Frame hider enabled\n- Boss Banner hider enabled\n- Housing Decor Alerts hider enabled\n- Easy Delete enabled\n- Privacy Overlay enabled\n- Mythic Raidframe Visibility enabled\n- DataTexts Tweaks enabled\n- All LuckyoneUI custom skins enabled', 1, 'medium')
	section.args.header2 = ACH:Header('Luckyone\'s Private Section', 5)
	section.args.syncInfo = ACH:Group('Important information', nil, 6)
	section.args.syncInfo.inline = true
	section.args.syncInfo.args.desc = ACH:Description('Clicking this button will override every single option of the games ESC > Options with Luckyone\'s settings.\n\nThis includes all of gameplay, accessibility, graphics, audio and network.\n\n|cffC80000There is no support for this.\n\nUse at own risk.|r', 1, 'medium')
	section.args.spacer = ACH:Spacer(7, 'full')
	section.args.execute = ACH:Execute('Sync Game Settings', '|cffC80000Do not click without reading the important information!|r', 8, function() Private:SyncSettings() end, nil, true)
	return section
end

-- LuckyoneUI config panel
function Private:BuildConfig()

	-- Header
	Private.Config = ACH:Group((Private.ElvUI and Private.Name) or format('%s %s', Private.Name, Private.Version), nil, 20, (Private.ElvUI and nil) or 'tree')

	-- Add sections
	Private.Config.args.setup = BuildSetupSection() -- 2
	Private.Config.args.blizzard = BuildGeneralSection() -- 5

	Private.Config.args.auras = BuildAurasSection() -- 10
	Private.Config.args.privateDB = BuildPrivateDBSection() -- 15
	Private.Config.args.chat = BuildChatSection() -- 20
	Private.Config.args.cvars = BuildCVarsSection() -- 25
	Private.Config.args.elvuiLayouts = BuildElvUILayoutSection() -- 30
	Private.Config.args.elvuiThemes = BuildElvUIThemesSection() -- 35
	Private.Config.args.elvuiTweaks = BuildElvUITweaksSection() -- 40
	Private.Config.args.graphics = BuildGraphicsSection() -- 45
	Private.Config.args.profiles = BuildProfilesSection() -- 50
	Private.Config.args.skins = BuildSkinsSection() -- 55
	Private.Config.args.tags = BuildTagsSection() -- 60
	Private.Config.args.credits = BuildCreditsSection() -- 65
	Private.Config.args.links = BuildLinksSection() -- 70
	Private.Config.args.dev = BuildDevSection() -- 100

	-- ElvUI config integration
	if Private.ElvUI then
		ElvUI[1].Options.name = format('%s + %s |cff99ff33%.2f|r', ElvUI[1].Options.name, Private.Name, Private.Version)
		ElvUI[1].Options.args.LuckyoneUI = Private.Config
	end
end

--[[
	ACH:Color(name, desc, order, alpha, width, get, set, disabled, hidden)
	ACH:Description(name, order, fontSize, image, imageCoords, imageWidth, imageHeight, width, hidden)
	ACH:Execute(name, desc, order, func, image, confirm, width, get, set, disabled, hidden)
	ACH:Group(name, desc, order, childGroups, get, set, disabled, hidden, func)
	ACH:Header(name, order, get, set, hidden)
	ACH:Input(name, desc, order, multiline, width, get, set, disabled, hidden, validate)
	ACH:MultiSelect(name, desc, order, values, confirm, width, get, set, disabled, hidden)
	ACH:Range(name, desc, order, values, width, get, set, disabled, hidden)
	ACH:Select(name, desc, order, values, confirm, width, get, set, disabled, hidden)
	ACH:Spacer(order, width, hidden)
	ACH:Toggle(name, desc, order, tristate, confirm, width, get, set, disabled, hidden)
]]
