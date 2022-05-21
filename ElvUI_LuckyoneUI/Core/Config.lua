local L1UI, E, L, V, P, G = unpack(select(2, ...))
local ACH

local format = format

-- Load this on init
function L1UI:GetOptions()

	-- Add LuckyoneUI version on top of the ElvUI config
	E.Options.name = format('%s + %s |cff99ff33%.2f|r', E.Options.name, L1UI.Name, L1UI.Version)

	-- LibAceConfigHelper from ElvUI OptionsUI
	ACH = E.Libs.ACH

	-- Header
	L1UI.Options = ACH:Group(L1UI.Name, nil, 100)
	L1UI.Options.args.header = ACH:Header(L1UI.Name..' '..L1UI.Version, 1)

	-- Install & Update
	L1UI.Options.args.installer = ACH:Group(L["Installer & Update"], nil, 2)
	L1UI.Options.args.installer.inline = true
	L1UI.Options.args.installer.args.install = ACH:Execute(L["Install"], L["Re-Run the installation process."], 1, function() E.PluginInstaller:Queue(L1UI.InstallerData) E:ToggleOptionsUI() end)
	L1UI.Options.args.installer.args.updateD = ACH:Execute(L["Update DPS/TANK Layout"], L["Update DPS/TANK layout to LuckyoneUI version: "]..L1UI.Version, 2, function() L1UI:UpdateLayout('main') end, nil, true)
	L1UI.Options.args.installer.args.updateH = ACH:Execute(L["Update Healing Layout"], L["Update Healing layout to LuckyoneUI version: "]..L1UI.Version, 3, function() L1UI:UpdateLayout('healing') end, nil, true)

	-- Auras [Buffs]
	L1UI.Options.args.auras = ACH:Group(format('|cff4beb2c%s|r', L["Auras"]), nil, 3, 'tab')
	L1UI.Options.args.auras.args.buffs = ACH:Group(format('|cff3296ff%s|r', L["Buffs"]), nil, 1)
	L1UI.Options.args.auras.args.debuffs = ACH:Group(format('|cffC80000%s|r', L["Debuffs"]), nil, 2)
	L1UI.Options.args.auras.args.classic = ACH:Group(format('|cffFF7E40%s|r', L["Party Buffs"]), nil, 3, nil, nil, nil, nil, E.Retail)
	L1UI.Options.args.auras.args.buffs.args.player = ACH:Group(L["Player Frame Buffs"], nil, 1)
	L1UI.Options.args.auras.args.buffs.args.player.inline = true
	L1UI.Options.args.auras.args.buffs.args.player.args.min = ACH:Execute(L["Minimalistic"], L["Minimalistic. Only important auras."], 1, function() L1UI:SetupBuffs('player', 'min') end)
	L1UI.Options.args.auras.args.buffs.args.player.args.all = ACH:Execute(L["Show All"], L["Show all auras except blacklisted."], 2, function() L1UI:SetupBuffs('player', 'all') end)
	L1UI.Options.args.auras.args.buffs.args.target = ACH:Group(L["Target Frame Buffs"], nil, 2)
	L1UI.Options.args.auras.args.buffs.args.target.inline = true
	L1UI.Options.args.auras.args.buffs.args.target.args.min = ACH:Execute(L["Minimalistic"], L["Minimalistic. Only important auras."], 1, function() L1UI:SetupBuffs('target', 'min') end)
	L1UI.Options.args.auras.args.buffs.args.target.args.all = ACH:Execute(L["Show All"], L["Show all auras except blacklisted."], 2, function() L1UI:SetupBuffs('target', 'all') end)
	L1UI.Options.args.auras.args.buffs.args.focus = ACH:Group(L["Focus Frame Buffs"], nil, 3, nil, nil, nil, nil, E.Classic)
	L1UI.Options.args.auras.args.buffs.args.focus.inline = true
	L1UI.Options.args.auras.args.buffs.args.focus.args.min = ACH:Execute(L["Minimalistic"], L["Minimalistic. Only important auras."], 1, function() L1UI:SetupBuffs('focus', 'min') end)
	L1UI.Options.args.auras.args.buffs.args.focus.args.all = ACH:Execute(L["Show All"], L["Show all auras except blacklisted."], 2, function() L1UI:SetupBuffs('focus', 'all') end)
	L1UI.Options.args.auras.args.buffs.args.nameplateEnemyNPC = ACH:Group(L["NamePlates: Enemy NPC Buffs"], nil, 5)
	L1UI.Options.args.auras.args.buffs.args.nameplateEnemyNPC.inline = true
	L1UI.Options.args.auras.args.buffs.args.nameplateEnemyNPC.args.min = ACH:Execute(L["Minimalistic"], L["Minimalistic. Only important auras."], 1, function() L1UI:SetupBuffs('nameplate', 'min') end)
	L1UI.Options.args.auras.args.buffs.args.nameplateEnemyNPC.args.all = ACH:Execute(L["Show All"], L["Show all auras except blacklisted."], 2, function() L1UI:SetupBuffs('nameplate', 'all') end)
	L1UI.Options.args.auras.args.buffs.args.boss = ACH:Group(L["Boss Frame Buffs"], nil, 4, nil, nil, nil, nil, not E.Retail)
	L1UI.Options.args.auras.args.buffs.args.boss.inline = true
	L1UI.Options.args.auras.args.buffs.args.boss.args.min = ACH:Execute(L["Minimalistic"], L["Minimalistic. Only important auras."], 1, function() L1UI:SetupBuffs('boss', 'min') end)
	L1UI.Options.args.auras.args.buffs.args.boss.args.all = ACH:Execute(L["Show All"], L["Show all auras except blacklisted."], 2, function() L1UI:SetupBuffs('boss', 'all') end)

	-- Auras [Debuffs]
	L1UI.Options.args.auras.args.debuffs.args.player = ACH:Group(L["Player Frame Debuffs"], nil, 1)
	L1UI.Options.args.auras.args.debuffs.args.player.inline = true
	L1UI.Options.args.auras.args.debuffs.args.player.args.min = ACH:Execute(L["Minimalistic"], L["Minimalistic. Only important auras."], 1, function() L1UI:SetupDebuffs('player', 'min') end)
	L1UI.Options.args.auras.args.debuffs.args.player.args.all = ACH:Execute(L["Show All"], L["Show all auras except blacklisted."], 2, function() L1UI:SetupDebuffs('player', 'all') end)
	L1UI.Options.args.auras.args.debuffs.args.target = ACH:Group(L["Target Frame Debuffs"], nil, 2)
	L1UI.Options.args.auras.args.debuffs.args.target.inline = true
	L1UI.Options.args.auras.args.debuffs.args.target.args.min = ACH:Execute(L["Minimalistic"], L["Minimalistic. Only important auras."], 1, function() L1UI:SetupDebuffs('target', 'min') end)
	L1UI.Options.args.auras.args.debuffs.args.target.args.all = ACH:Execute(L["Show All"], L["Show all auras except blacklisted."], 2, function() L1UI:SetupDebuffs('target', 'all') end)
	L1UI.Options.args.auras.args.debuffs.args.focus = ACH:Group(L["Focus Frame Debuffs"], nil, 3, nil, nil, nil, nil, E.Classic)
	L1UI.Options.args.auras.args.debuffs.args.focus.inline = true
	L1UI.Options.args.auras.args.debuffs.args.focus.args.min = ACH:Execute(L["Minimalistic"], L["Minimalistic. Only important auras."], 1, function() L1UI:SetupDebuffs('focus', 'min') end)
	L1UI.Options.args.auras.args.debuffs.args.focus.args.all = ACH:Execute(L["Show All"], L["Show all auras except blacklisted."], 2, function() L1UI:SetupDebuffs('focus', 'all') end)
	L1UI.Options.args.auras.args.debuffs.args.nameplateEnemyNPC = ACH:Group(L["NamePlates: Enemy NPC Debuffs"], nil, 5)
	L1UI.Options.args.auras.args.debuffs.args.nameplateEnemyNPC.inline = true
	L1UI.Options.args.auras.args.debuffs.args.nameplateEnemyNPC.args.min = ACH:Execute(L["Minimalistic"], L["Minimalistic. Only important auras."], 1, function() L1UI:SetupDebuffs('nameplate', 'min') end)
	L1UI.Options.args.auras.args.debuffs.args.nameplateEnemyNPC.args.all = ACH:Execute(L["Show All"], L["Show all auras except blacklisted."], 2, function() L1UI:SetupDebuffs('nameplate', 'all') end)
	L1UI.Options.args.auras.args.debuffs.args.boss = ACH:Group(L["Boss Frame Debuffs"], nil, 4, nil, nil, nil, nil, not E.Retail)
	L1UI.Options.args.auras.args.debuffs.args.boss.inline = true
	L1UI.Options.args.auras.args.debuffs.args.boss.args.min = ACH:Execute(L["Minimalistic"], L["Minimalistic. Only important auras."], 1, function() L1UI:SetupDebuffs('boss', 'min') end)
	L1UI.Options.args.auras.args.debuffs.args.boss.args.all = ACH:Execute(L["Show All"], L["Show all auras except blacklisted."], 2, function() L1UI:SetupDebuffs('boss', 'all') end)

	-- Auras [Classic and TBC]
	L1UI.Options.args.auras.args.classic.args.dps = ACH:Group(L["DPS/TANK Layout"], nil, 1, nil, nil, nil, nil, E.Retail)
	L1UI.Options.args.auras.args.classic.args.dps.inline = true
	L1UI.Options.args.auras.args.classic.args.dps.args.on = ACH:Execute(L["Enable Party Buffs"], nil, 1, function() L1UI:LegacyAuras('on', 'main') end, nil, true)
	L1UI.Options.args.auras.args.classic.args.dps.args.off = ACH:Execute(L["Disable Party Buffs"], nil, 2, function() L1UI:LegacyAuras('off') end, nil, true)
	L1UI.Options.args.auras.args.classic.args.healing = ACH:Group(L["Healing Layout"], nil, 2, nil, nil, nil, nil, E.Retail)
	L1UI.Options.args.auras.args.classic.args.healing.inline = true
	L1UI.Options.args.auras.args.classic.args.healing.args.on = ACH:Execute(L["Enable Party Buffs"], nil, 1, function() L1UI:LegacyAuras('on', 'healing') end, nil, true)
	L1UI.Options.args.auras.args.classic.args.healing.args.off = ACH:Execute(L["Disable Party Buffs"], nil, 2, function() L1UI:LegacyAuras('off') end, nil, true)

	-- Blizzard
	L1UI.Options.args.blizzard = ACH:Group(format('|cff4beb2c%s|r', L["Blizzard"]), nil, 4)
	L1UI.Options.args.blizzard.args.disabledFrames = ACH:Group(L["Hide Blizzard Frames"], nil, 1, nil, function(info) return E.private.L1UI.disabledFrames[info[#info]] end, function(info, value) E.private.L1UI.disabledFrames[info[#info]] = value E:StaticPopup_Show('L1UI_RL') end)
	L1UI.Options.args.blizzard.args.disabledFrames.inline = true
	L1UI.Options.args.blizzard.args.disabledFrames.args.AlertFrame = ACH:Toggle(L["Alert Frame"], L["Hide the Loot/Alert Frame"], 1)
	L1UI.Options.args.blizzard.args.disabledFrames.args.BossBanner = ACH:Toggle(L["Boss Banner"], L["Hide the Boss Banner"], 2, nil, nil, nil, nil, nil, nil, not E.Retail)
	L1UI.Options.args.blizzard.args.disabledFrames.args.ZoneTextFrame = ACH:Toggle(L["Zone Text"], L["Hide the Zone Text"], 3)

	-- Chat
	L1UI.Options.args.chat = ACH:Group(format('|cff4beb2c%s|r', L["Chat"]), nil, 5)
	L1UI.Options.args.chat.args.chatSetup = ACH:Group(L["Setup Chat"], nil, 1)
	L1UI.Options.args.chat.args.chatSetup.inline = true
	L1UI.Options.args.chat.args.chatSetup.args.chat = ACH:Execute(L["Setup Chat"], nil, 1, function() L1UI:SetupChat() end)
	L1UI.Options.args.chat.args.chatDesc = ACH:Group(L["Description"], nil, 2)
	L1UI.Options.args.chat.args.chatDesc.inline = true
	L1UI.Options.args.chat.args.chatDesc.args.desc = ACH:Description(L["Setup Chat will reset your chat panels to default and create custom chat tabs.\n\nLeft Chat: [ General - Log - Whisper - Guild - Party ]\n\nRight Chat: [ No Tabs - Details! Damage Meter ]"], 1, 'medium')
	L1UI.Options.args.chat.args.chatVars = ACH:Group(L["Chat CVars"], nil, 3)
	L1UI.Options.args.chat.args.chatVars.inline = true
	L1UI.Options.args.chat.args.chatVars.args.desc = ACH:Description('- chatStyle classic\n- whisperMode inline\n- chatClassColorOverride 0\n- colorChatNamesByClass 1', 1, 'medium')

	-- CVars
	L1UI.Options.args.cvars = ACH:Group(format('|cff4beb2c%s|r', L["CVars"]), nil, 6)
	L1UI.Options.args.cvars.args.setup = ACH:Group(L["Setup CVars"], nil, 1)
	L1UI.Options.args.cvars.args.setup.inline = true
	L1UI.Options.args.cvars.args.setup.args.generalVars = ACH:Execute(L["General CVars"], nil, 1, function() L1UI:SetupCVars() end, nil, true)
	L1UI.Options.args.cvars.args.setup.args.nameplateVars = ACH:Execute(L["NamePlate CVars"], nil, 2, function() L1UI:NameplateCVars() end, nil, true)
	L1UI.Options.args.cvars.args.generalDesc = ACH:Group(L["General CVars"], nil, 2)
	L1UI.Options.args.cvars.args.generalDesc.inline = true
	L1UI.Options.args.cvars.args.generalDesc.args.cvars = ACH:Description('- advancedCombatLogging 1\n- alwaysShowActionBars 1\n- cameraDistanceMaxZoomFactor 2.6\n- ffxDeath 0\n- ffxGlow 0\n- ffxNether 0\n- fstack_preferParentKeys 0\n- lockActionBars 1\n- rawMouseEnable 1\n- screenshotQuality 10\n- showNPETutorials 0\n- showTutorials 0\n- threatWarning 3\n- UberTooltips 1', 1, 'medium')
	L1UI.Options.args.cvars.args.nameplateDesc = ACH:Group(L["NamePlate CVars"], nil, 3)
	L1UI.Options.args.cvars.args.nameplateDesc.inline = true
	L1UI.Options.args.cvars.args.nameplateDesc.args.cvars = ACH:Description('- nameplateLargerScale 1\n- nameplateLargeTopInset -1\n- nameplateMinAlpha 1\n- nameplateMinScale 1\n- nameplateMotion 1\n- nameplateOccludedAlphaMult 1\n- nameplateOtherBottomInset -1\n- nameplateOtherTopInset -1\n- nameplateOverlapH 1.1\n- nameplateOverlapV 1.8\n- nameplateSelectedScale 1\n- nameplateSelfAlpha 1\n- nameplateSelfTopInset -1', 1, 'medium')

	-- Media
	L1UI.Options.args.media = ACH:Group(format('|cff4beb2c%s|r', L["Media"]), nil, 7)
	L1UI.Options.args.media.args.defaults = ACH:Group(L["Fonts, Textures & Skins"], nil, 1)
	L1UI.Options.args.media.args.defaults.inline = true
	L1UI.Options.args.media.args.defaults.args.private = ACH:Execute(L["Reset Media"], L["Reset Fonts, Textures, Skins to LuckyoneUI defaults."], 1, function() L1UI:SetupPrivate() E:StaggeredUpdateAll() end, nil, true)

	-- Performance
	L1UI.Options.args.performance = ACH:Group(format('|cff4beb2c%s|r', L["Performance"]), nil, 8, nil, nil, nil, nil, not E.Retail)
	L1UI.Options.args.performance.args.desc = ACH:Header(format('|cffFF0000%s|r', L["This will only clear AddOn Cache and not wipe your settings"]), 1)
	L1UI.Options.args.performance.args.elvui = ACH:Group('ElvUI', nil, 2)
	L1UI.Options.args.performance.args.elvui.inline = true
	L1UI.Options.args.performance.args.elvui.args.chat = ACH:Execute(L["Clear Chat History"], nil, 1, function() if not E.private.chat.enable then return end L1UI:Cleanup_Cache('elvui', 'chat') E:StaticPopup_Show('L1UI_RL') end)
	L1UI.Options.args.performance.args.elvui.args.edit = ACH:Execute(L["Clear Editbox History"], nil, 2, function() if not E.private.chat.enable then return end L1UI:Cleanup_Cache('elvui', 'editbox') E:StaticPopup_Show('L1UI_RL') end)
	L1UI.Options.args.performance.args.details = ACH:Group('Details', nil, 3)
	L1UI.Options.args.performance.args.details.inline = true
	L1UI.Options.args.performance.args.details.args.cache = ACH:Execute(L["Clear Cache"], nil, 1, function() L1UI:Cleanup_Cache('details') E:StaticPopup_Show('L1UI_RL') end)
	L1UI.Options.args.performance.args.plater = ACH:Group('Plater', nil, 4)
	L1UI.Options.args.performance.args.plater.inline = true
	L1UI.Options.args.performance.args.plater.args.cache = ACH:Execute(L["Clear Cache"], nil, 1, function() L1UI:Cleanup_Cache('plater') E:StaticPopup_Show('L1UI_RL') end)
	L1UI.Options.args.performance.args.rcLoot = ACH:Group('RCLootCouncil', nil, 5)
	L1UI.Options.args.performance.args.rcLoot.inline = true
	L1UI.Options.args.performance.args.rcLoot.args.cache = ACH:Execute(L["Clear Cache"], nil, 1, function() L1UI:Cleanup_Cache('rc') E:StaticPopup_Show('L1UI_RL') end)
	L1UI.Options.args.performance.args.mrt = ACH:Group('Method Raid Tools', nil, 6)
	L1UI.Options.args.performance.args.mrt.inline = true
	L1UI.Options.args.performance.args.mrt.args.cache = ACH:Execute(L["Clear Cache"], nil, 1, function() L1UI:Cleanup_Cache('mrt') E:StaticPopup_Show('L1UI_RL') end)

	-- Profiles
	L1UI.Options.args.profiles = ACH:Group(format('|cff4beb2c%s|r', L["Profiles"]), nil, 9)
	L1UI.Options.args.profiles.args.header1 = ACH:Header(L["Global Profiles"], 1)
	L1UI.Options.args.profiles.args.plugins = ACH:Group(L["ElvUI Plugins"], nil, 2)
	L1UI.Options.args.profiles.args.plugins.inline = true
	L1UI.Options.args.profiles.args.plugins.args.as = ACH:Execute('|cff16C3F2AddOn|r|cFFFFFFFFSkins|r', L["Reset to LuckyoneUI defaults."], 1, function() L1UI:Setup_AddOnSkins() E:StaticPopup_Show('L1UI_RL') end, nil, true)
	L1UI.Options.args.profiles.args.plugins.args.pa = ACH:Execute('|cFF16C3F2Project|r|cFFFFFFFFAzilroka|r', L["Reset to LuckyoneUI defaults."], 2, function() L1UI:Setup_ProjectAzilroka() E:StaticPopup_Show('L1UI_RL') end, nil, true)
	L1UI.Options.args.profiles.args.plugins.args.sle = ACH:Execute('|cff9482c9Shadow & Light|r', L["Reset to LuckyoneUI defaults."], 3, function() L1UI:Setup_ShadowAndLight() E:StaticPopup_Show('L1UI_RL') end, nil, true, nil, nil, nil, nil, not E.Retail)
	L1UI.Options.args.profiles.args.nameplates = ACH:Group(L["NamePlate Profiles"], nil, 3)
	L1UI.Options.args.profiles.args.nameplates.inline = true
	L1UI.Options.args.profiles.args.nameplates.args.elvui = ACH:Execute('ElvUI', L["Reset to LuckyoneUI defaults."], 1, function() L1UI:SetupNamePlates('ElvUI') E:StaticPopup_Show('L1UI_RL') end, nil, true)
	L1UI.Options.args.profiles.args.nameplates.args.plater = ACH:Execute('Plater', L["Reset to LuckyoneUI defaults."], 2, function() L1UI:SetupNamePlates('Plater') E:StaticPopup_Show('L1UI_RL') end, nil, true)
	L1UI.Options.args.profiles.args.addons = ACH:Group(L["Addon Profiles"], nil, 4)
	L1UI.Options.args.profiles.args.addons.inline = true
	L1UI.Options.args.profiles.args.addons.args.details = ACH:Execute('Details', L["Reset to LuckyoneUI defaults."], 1, function() L1UI:Setup_Details() E:StaticPopup_Show('L1UI_RL') end, nil, true)
	L1UI.Options.args.profiles.args.header2 = ACH:Header(L["DPS/TANK Profiles"], 5)
	L1UI.Options.args.profiles.args.bossmods = ACH:Group(L["BossMods Profiles"], nil, 6)
	L1UI.Options.args.profiles.args.bossmods.inline = true
	L1UI.Options.args.profiles.args.bossmods.args.bigwigs = ACH:Execute('BigWigs DPS/TANK', L["Reset to LuckyoneUI defaults."], 1, function() L1UI:Setup_BigWigs('main') E:StaticPopup_Show('L1UI_RL') end, nil, true)
	L1UI.Options.args.profiles.args.bossmods.args.dbm = ACH:Execute('DBM DPS/TANK', L["Reset to LuckyoneUI defaults."], 2, function() L1UI:Setup_DBM('main') E:StaticPopup_Show('L1UI_RL') end, nil, true)
	L1UI.Options.args.profiles.args.addonsMain = ACH:Group(L["Addon Profiles"], nil, 7)
	L1UI.Options.args.profiles.args.addonsMain.inline = true
	L1UI.Options.args.profiles.args.addonsMain.args.omnicd = ACH:Execute('OmniCD DPS/TANK', L["Reset to LuckyoneUI defaults."], 1, function() L1UI:Setup_OmniCD('main') E:StaticPopup_Show('L1UI_RL') end, nil, true, nil, nil, nil, nil, not E.Retail)
	L1UI.Options.args.profiles.args.header3 = ACH:Header(L["Healing Profiles"], 8)
	L1UI.Options.args.profiles.args.bossmodsHealing = ACH:Group(L["BossMods Profiles"], nil, 9)
	L1UI.Options.args.profiles.args.bossmodsHealing.inline = true
	L1UI.Options.args.profiles.args.bossmodsHealing.args.bigwigs = ACH:Execute('BigWigs Healing', L["Reset to LuckyoneUI defaults."], 1, function() L1UI:Setup_BigWigs('healing') E:StaticPopup_Show('L1UI_RL') end, nil, true)
	L1UI.Options.args.profiles.args.bossmodsHealing.args.dbm = ACH:Execute('DBM Healing', L["Reset to LuckyoneUI defaults."], 2, function() L1UI:Setup_DBM('healing') E:StaticPopup_Show('L1UI_RL') end, nil, true)
	L1UI.Options.args.profiles.args.addonsHealing = ACH:Group(L["Addon Profiles"], nil, 10)
	L1UI.Options.args.profiles.args.addonsHealing.inline = true
	L1UI.Options.args.profiles.args.addonsHealing.args.omnicd = ACH:Execute('OmniCD Healing', L["Reset to LuckyoneUI defaults."], 1, function() L1UI:Setup_OmniCD('healing') E:StaticPopup_Show('L1UI_RL') end, nil, true, nil, nil, nil, nil, not E.Retail)

	-- Tags
	L1UI.Options.args.tags = ACH:Group(format('|cff4beb2c%s|r', L["Tags"]), nil, 10)
	L1UI.Options.args.tags.args.groups = ACH:Group(L["Tags"], nil, 1)
	L1UI.Options.args.tags.args.groups.inline = true
	L1UI.Options.args.tags.args.groups.args.available = ACH:Execute(L["Available Tags"], L["Jump to the Available Tag list."], 1, function() E.Libs.AceConfigDialog:SelectGroup('ElvUI', 'tagGroup', L1UI.Name) end)

	-- Themes
	L1UI.Options.args.themes = ACH:Group(format('|cff4beb2c%s|r', L["Themes"]), nil, 11)
	L1UI.Options.args.themes.args.raid = ACH:Group(L["UnitFrames Color Theme"], nil, 1)
	L1UI.Options.args.themes.args.raid.inline = true
	L1UI.Options.args.themes.args.raid.args.dark = ACH:Execute(L["Dark"], L["Dark Style (Default)"], 1, function() L1UI:SetupTheme('dark') end, nil, true)
	L1UI.Options.args.themes.args.raid.args.class = ACH:Execute(L["Class Color"], L["Class Color Style"], 2, function() L1UI:SetupTheme('class') end, nil, true)

	-- WeakAuras Retail
	L1UI.Options.args.weakauras = ACH:Group(format('|cff4beb2c%s|r', 'WeakAuras'), nil, 12, nil, nil, nil, nil, not E.Retail)
	L1UI.Options.args.weakauras.args.header1 = ACH:Header(L["WeakAuras DPS/TANK"], 1)
	L1UI.Options.args.weakauras.args.druid = ACH:Input(format('|cffFF7C0A%s|r', L["Druid"]), nil, 2, nil, 'normal', function() return 'wago.io/luckyoneDruid' end)
	L1UI.Options.args.weakauras.args.priest = ACH:Input(format('|cffFFFFFF%s|r', L["Priest"]), nil, 3, nil, 'normal', function() return 'wago.io/luckyonePriest' end)
	L1UI.Options.args.weakauras.args.monk = ACH:Input(format('|cff00FF98%s|r', L["Monk"]), nil, 4, nil, 'normal', function() return 'wago.io/luckyoneMonk' end)
	L1UI.Options.args.weakauras.args.warlock = ACH:Input(format('|cff8788EE%s|r', L["Warlock"]), nil, 5, nil, 'normal', function() return 'wago.io/luckyoneWarlock' end)
	L1UI.Options.args.weakauras.args.hunter = ACH:Input(format('|cffAAD372%s|r', L["Hunter"]), nil, 6, nil, 'normal', function() return 'wago.io/luckyoneHunter' end)
	L1UI.Options.args.weakauras.args.rogue = ACH:Input(format('|cffFFF468%s|r', L["Rogue"]), nil, 7, nil, 'normal', function() return 'wago.io/luckyoneRogue' end)
	L1UI.Options.args.weakauras.args.mage = ACH:Input(format('|cff3FC7EB%s|r', L["Mage"]), nil, 8, nil, 'normal', function() return 'wago.io/luckyoneMage' end)
	L1UI.Options.args.weakauras.args.dh = ACH:Input(format('|cffA330C9%s|r', L["Demon Hunter"]), nil, 9, nil, 'normal', function() return 'wago.io/luckyoneDH' end)
	L1UI.Options.args.weakauras.args.dk = ACH:Input(format('|cffC41E3A%s|r', L["Death Knight"]), nil, 10, nil, 'normal', function() return 'wago.io/luckyoneDK' end)
	L1UI.Options.args.weakauras.args.paladin = ACH:Input(format('|cffF48CBA%s|r', L["Paladin"]), nil, 11, nil, 'normal', function() return 'wago.io/luckyonePaladin' end)
	L1UI.Options.args.weakauras.args.shaman = ACH:Input(format('|cff0070DD%s|r', L["Shaman"]), nil, 12, nil, 'normal', function() return 'wago.io/luckyoneShaman' end)
	L1UI.Options.args.weakauras.args.warrior = ACH:Input(format('|cffC69B6D%s|r', L["Warrior"]), nil, 13, nil, 'normal', function() return 'wago.io/luckyoneWarrior' end)
	L1UI.Options.args.weakauras.args.header2 = ACH:Header(L["General WeakAuras"], 14)
	L1UI.Options.args.weakauras.args.keys = ACH:Input('Link Keystones', nil, 15, nil, 'normal', function() return 'wago.io/keystones' end)
	L1UI.Options.args.weakauras.args.covenant = ACH:Input('Link Covenant', nil, 16, nil, 'normal', function() return 'wago.io/covenant' end)
	L1UI.Options.args.weakauras.args.trinket = ACH:Input('Trinket Tracking', nil, 17, nil, 'normal', function() return 'wago.io/Trinket' end)
	L1UI.Options.args.weakauras.args.affixes = ACH:Input('Mythic+ Affixes', nil, 18, nil, 'normal', function() return 'wago.io/affixes' end)
	L1UI.Options.args.weakauras.args.signature = ACH:Input('Covenant Signature', nil, 19, nil, 'normal', function() return 'wago.io/signature' end)
	L1UI.Options.args.weakauras.args.swapblaster = ACH:Input('Swapblaster Alert', nil, 20, nil, 'normal', function() return 'wago.io/swapblaster' end)
	L1UI.Options.args.weakauras.args.groupfinderClasses = ACH:Input('Groupfinder Classes', nil, 21, nil, 'normal', function() return 'wago.io/groupfinderClasses' end)
	L1UI.Options.args.weakauras.args.groupfinderApptext = ACH:Input('Groupfinder Applicants', nil, 22, nil, 'normal', function() return 'wago.io/appTextHide' end)
	L1UI.Options.args.weakauras.args.header3 = ACH:Header(L["Note about WeakAuras"], 23)
	L1UI.Options.args.weakauras.args.desc = ACH:Group('', nil, 24)
	L1UI.Options.args.weakauras.args.desc.inline = true
	L1UI.Options.args.weakauras.args.desc.args.waDesc = ACH:Description(L["\nAll Class WeakAuras above are for DPS and Tank specializations only.\nThere is currently no plan to support Healers at all.\n\n"], 25, 'medium')

	-- WeakAuras TBC
	L1UI.Options.args.weakaurasTBC = ACH:Group(format('|cff4beb2c%s|r', 'WeakAuras'), nil, 12, nil, nil, nil, nil, not E.TBC)
	L1UI.Options.args.weakaurasTBC.args.header1 = ACH:Header(L["WeakAuras DPS/TANK"], 1)
	L1UI.Options.args.weakaurasTBC.args.hunter = ACH:Input(format('|cffAAD372%s|r', L["Hunter"]), nil, 2, nil, 'normal', function() return 'wago.io/luckyoneHunterTBC' end)
	L1UI.Options.args.weakaurasTBC.args.header2 = ACH:Header(L["General WeakAuras"], 3)
	L1UI.Options.args.weakaurasTBC.args.trinket = ACH:Input('Trinket Tracking', nil, 4, nil, 'normal', function() return 'wago.io/TrinketTBC' end)
	L1UI.Options.args.weakaurasTBC.args.combat = ACH:Input('Combat Tracking', nil, 5, nil, 'normal', function() return 'wago.io/combatStateTBC' end)

	-- WeakAuras Classic
	L1UI.Options.args.weakaurasClassic = ACH:Group(format('|cff4beb2c%s|r', 'WeakAuras'), nil, 12, nil, nil, nil, nil, not E.Classic)
	L1UI.Options.args.weakaurasClassic.args.header1 = ACH:Header(L["WeakAuras DPS/TANK"], 1)
	L1UI.Options.args.weakaurasClassic.args.hunter = ACH:Input(format('|cffAAD372%s|r', L["Hunter"]), nil, 2, nil, 'normal', function() return 'wago.io/luckyoneClassicHunter' end)
	L1UI.Options.args.weakaurasClassic.args.header2 = ACH:Header(L["General WeakAuras"], 3)
	L1UI.Options.args.weakaurasClassic.args.layer = ACH:Input('Layer Hopping', nil, 4, nil, 'normal', function() return 'wago.io/layerInvite' end)
	L1UI.Options.args.weakaurasClassic.args.combat = ACH:Input('Combat Tracking', nil, 5, nil, 'normal', function() return 'wago.io/combatStateClassic' end)

	-- Credits
	L1UI.Options.args.credits = ACH:Group(format('|cffFF7D0A%s|r', L["Credits"]), nil, 13)
	L1UI.Options.args.credits.args.author = ACH:Group(L["Author"], nil, 1)
	L1UI.Options.args.credits.args.author.inline = true
	L1UI.Options.args.credits.args.author.args.desc = ACH:Description(L1UI.AUTHORS_STRING, 1, 'medium')
	L1UI.Options.args.credits.args.coding = ACH:Group(L["Coding"], nil, 2)
	L1UI.Options.args.credits.args.coding.inline = true
	L1UI.Options.args.credits.args.coding.args.desc = ACH:Description(L1UI.CODING_STRING, 1, 'medium')
	L1UI.Options.args.credits.args.testers = ACH:Group(L["Testers and Translation"], nil, 3)
	L1UI.Options.args.credits.args.testers.inline = true
	L1UI.Options.args.credits.args.testers.args.desc = ACH:Description(L1UI.TESTER_STRING, 1, 'medium')
	L1UI.Options.args.credits.args.supporter = ACH:Group(L["Supporters"], nil, 4)
	L1UI.Options.args.credits.args.supporter.inline = true
	L1UI.Options.args.credits.args.supporter.args.desc = ACH:Description(L1UI.SUPPORT_STRING, 1, 'medium')

	-- Links
	L1UI.Options.args.links = ACH:Group(format('|cffFF7D0A%s|r', L["Links"]), nil, 14)
	L1UI.Options.args.links.args.changelog = ACH:Input(L["Changelog:"], nil, 1, nil, 'full', function() return 'https://github.com/Luckyone961/LuckyoneUI/blob/development/CHANGELOG.md' end)
	L1UI.Options.args.links.args.issues = ACH:Input(L["Report issues here:"], nil, 2, nil, 'full', function() return 'https://github.com/Luckyone961/LuckyoneUI/issues' end)
	L1UI.Options.args.links.args.website = ACH:Input(L["Addon link:"], nil, 3, nil, 'full', function() return 'https://www.curseforge.com/wow/addons/elvui_luckyoneui' end)
	L1UI.Options.args.links.args.discord = ACH:Input('Discord:', nil, 4, nil, 'full', function() return 'https://discord.gg/xRY4bwA' end)
	L1UI.Options.args.links.args.guide = ACH:Input(L["Wowhead Guide:"], nil, 5, nil, 'full', function() return 'https://www.wowhead.com/guide=10680/elvui-luckyoneui-addon-plugin-guide' end)

	-- LuckyoneUI config
	E.Options.args.L1UI = L1UI.Options
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
