local L1UI, E, L, V, P, G = unpack(select(2, ...))
local ACH

local format = format
local ReloadUI = ReloadUI

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
	L1UI.Options.args.installer = ACH:Group('Installer & Update', nil, 2)
	L1UI.Options.args.installer.inline = true
	L1UI.Options.args.installer.args.install = ACH:Execute('Install', '(Re)-Run the installation process.', 1, function() E.PluginInstaller:Queue(L1UI.InstallerData) E:ToggleOptionsUI() end)
	L1UI.Options.args.installer.args.updateD = ACH:Execute('Update DPS/TANK', 'Update DPS/TANK layout to LuckyoneUI version: '..L1UI.Version, 2, function() L1UI:UpdateLayout('dps') end, nil, true)
	L1UI.Options.args.installer.args.updateH = ACH:Execute('Update Healing', 'Update Healing layout to LuckyoneUI version: '..L1UI.Version, 3, function() L1UI:UpdateLayout('healer') end, nil, true)

	-- Auras [Buffs]
	L1UI.Options.args.auras = ACH:Group(format('|cff4beb2c%s|r', 'Auras'), nil, 3, 'tab')
	L1UI.Options.args.auras.args.buffs = ACH:Group(format('|cff3296ff%s|r', 'Buffs'), nil, 1)
	L1UI.Options.args.auras.args.debuffs = ACH:Group(format('|cffC80000%s|r', 'Debuffs'), nil, 2)
	L1UI.Options.args.auras.args.classic = ACH:Group(format('|cffFF7E40%s|r', E.TBC and 'TBC Party Buffs' or E.Classic and 'Classic Party Buffs'), nil, 3, nil, nil, nil, nil, E.Retail)
	L1UI.Options.args.auras.args.buffs.args.player = ACH:Group('Player Frame Buffs', nil, 1)
	L1UI.Options.args.auras.args.buffs.args.player.inline = true
	L1UI.Options.args.auras.args.buffs.args.player.args.min = ACH:Execute('Minimalistic', 'Minimalistic. Only important auras.', 1, function() L1UI:SetupBuffs('player', 'min') end)
	L1UI.Options.args.auras.args.buffs.args.player.args.all = ACH:Execute('Show All', 'Show all auras except blacklisted.', 2, function() L1UI:SetupBuffs('player', 'all') end)
	L1UI.Options.args.auras.args.buffs.args.target = ACH:Group('Target Frame Buffs', nil, 2)
	L1UI.Options.args.auras.args.buffs.args.target.inline = true
	L1UI.Options.args.auras.args.buffs.args.target.args.min = ACH:Execute('Minimalistic', 'Minimalistic. Only important auras.', 1, function() L1UI:SetupBuffs('target', 'min') end)
	L1UI.Options.args.auras.args.buffs.args.target.args.all = ACH:Execute('Show All', 'Show all auras except blacklisted.', 2, function() L1UI:SetupBuffs('target', 'all') end)
	L1UI.Options.args.auras.args.buffs.args.focus = ACH:Group('Focus Frame Buffs', nil, 3, nil, nil, nil, nil, E.Classic)
	L1UI.Options.args.auras.args.buffs.args.focus.inline = true
	L1UI.Options.args.auras.args.buffs.args.focus.args.min = ACH:Execute('Minimalistic', 'Minimalistic. Only important auras.', 1, function() L1UI:SetupBuffs('focus', 'min') end)
	L1UI.Options.args.auras.args.buffs.args.focus.args.all = ACH:Execute('Show All', 'Show all auras except blacklisted.', 2, function() L1UI:SetupBuffs('focus', 'all') end)
	L1UI.Options.args.auras.args.buffs.args.nameplateEnemyNPC = ACH:Group('NamePlates: Enemy NPC Buffs', nil, 5)
	L1UI.Options.args.auras.args.buffs.args.nameplateEnemyNPC.inline = true
	L1UI.Options.args.auras.args.buffs.args.nameplateEnemyNPC.args.min = ACH:Execute('Minimalistic', 'Minimalistic. Only important auras.', 1, function() L1UI:SetupBuffs('nameplate', 'min') end)
	L1UI.Options.args.auras.args.buffs.args.nameplateEnemyNPC.args.all = ACH:Execute('Show All', 'Show all auras except blacklisted.', 2, function() L1UI:SetupBuffs('nameplate', 'all') end)
	L1UI.Options.args.auras.args.buffs.args.boss = ACH:Group('Boss Frame Buffs', nil, 4, nil, nil, nil, nil, not E.Retail)
	L1UI.Options.args.auras.args.buffs.args.boss.inline = true
	L1UI.Options.args.auras.args.buffs.args.boss.args.min = ACH:Execute('Minimalistic', 'Minimalistic. Only important auras.', 1, function() L1UI:SetupBuffs('boss', 'min') end)
	L1UI.Options.args.auras.args.buffs.args.boss.args.all = ACH:Execute('Show All', 'Show all auras except blacklisted.', 2, function() L1UI:SetupBuffs('boss', 'all') end)

	-- Auras [Debuffs]
	L1UI.Options.args.auras.args.debuffs.args.player = ACH:Group('Player Frame Debuffs', nil, 1)
	L1UI.Options.args.auras.args.debuffs.args.player.inline = true
	L1UI.Options.args.auras.args.debuffs.args.player.args.min = ACH:Execute('Minimalistic', 'Minimalistic. Only important auras.', 1, function() L1UI:SetupDebuffs('player', 'min') end)
	L1UI.Options.args.auras.args.debuffs.args.player.args.all = ACH:Execute('Show All', 'Show all auras except blacklisted.', 2, function() L1UI:SetupDebuffs('player', 'all') end)
	L1UI.Options.args.auras.args.debuffs.args.target = ACH:Group('Target Frame Debuffs', nil, 2)
	L1UI.Options.args.auras.args.debuffs.args.target.inline = true
	L1UI.Options.args.auras.args.debuffs.args.target.args.min = ACH:Execute('Minimalistic', 'Minimalistic. Only important auras.', 1, function() L1UI:SetupDebuffs('target', 'min') end)
	L1UI.Options.args.auras.args.debuffs.args.target.args.all = ACH:Execute('Show All', 'Show all auras except blacklisted.', 2, function() L1UI:SetupDebuffs('target', 'all') end)
	L1UI.Options.args.auras.args.debuffs.args.focus = ACH:Group('Focus Frame Debuffs', nil, 3, nil, nil, nil, nil, E.Classic)
	L1UI.Options.args.auras.args.debuffs.args.focus.inline = true
	L1UI.Options.args.auras.args.debuffs.args.focus.args.min = ACH:Execute('Minimalistic', 'Minimalistic. Only important auras.', 1, function() L1UI:SetupDebuffs('focus', 'min') end)
	L1UI.Options.args.auras.args.debuffs.args.focus.args.all = ACH:Execute('Show All', 'Show all auras except blacklisted.', 2, function() L1UI:SetupDebuffs('focus', 'all') end)
	L1UI.Options.args.auras.args.debuffs.args.nameplateEnemyNPC = ACH:Group('NamePlates: Enemy NPC Debuffs', nil, 5)
	L1UI.Options.args.auras.args.debuffs.args.nameplateEnemyNPC.inline = true
	L1UI.Options.args.auras.args.debuffs.args.nameplateEnemyNPC.args.min = ACH:Execute('Minimalistic', 'Minimalistic. Only important auras.', 1, function() L1UI:SetupDebuffs('nameplate', 'min') end)
	L1UI.Options.args.auras.args.debuffs.args.nameplateEnemyNPC.args.all = ACH:Execute('Show All', 'Show all auras except blacklisted.', 2, function() L1UI:SetupDebuffs('nameplate', 'all') end)
	L1UI.Options.args.auras.args.debuffs.args.boss = ACH:Group('Boss Frame Debuffs', nil, 4, nil, nil, nil, nil, not E.Retail)
	L1UI.Options.args.auras.args.debuffs.args.boss.inline = true
	L1UI.Options.args.auras.args.debuffs.args.boss.args.min = ACH:Execute('Minimalistic', 'Minimalistic. Only important auras.', 1, function() L1UI:SetupDebuffs('boss', 'min') end)
	L1UI.Options.args.auras.args.debuffs.args.boss.args.all = ACH:Execute('Show All', 'Show all auras except blacklisted.', 2, function() L1UI:SetupDebuffs('boss', 'all') end)

	-- Auras [Classic and TBC]
	L1UI.Options.args.auras.args.classic.args.dps = ACH:Group('DPS/TANK Layout', nil, 1, nil, nil, nil, nil, E.Retail)
	L1UI.Options.args.auras.args.classic.args.dps.inline = true
	L1UI.Options.args.auras.args.classic.args.dps.args.on = ACH:Execute('Enable Party Buffs', nil, 1, function() L1UI:LegacyAuras('on', 'dps') end, nil, true)
	L1UI.Options.args.auras.args.classic.args.dps.args.off = ACH:Execute('Disable Party Buffs', nil, 2, function() L1UI:LegacyAuras('off') end, nil, true)
	L1UI.Options.args.auras.args.classic.args.healing = ACH:Group('Healing Layout', nil, 2, nil, nil, nil, nil, E.Retail)
	L1UI.Options.args.auras.args.classic.args.healing.inline = true
	L1UI.Options.args.auras.args.classic.args.healing.args.on = ACH:Execute('Enable Party Buffs', nil, 1, function() L1UI:LegacyAuras('on', 'healing') end, nil, true)
	L1UI.Options.args.auras.args.classic.args.healing.args.off = ACH:Execute('Disable Party Buffs', nil, 2, function() L1UI:LegacyAuras('off') end, nil, true)

	-- Blizzard
	L1UI.Options.args.blizzard = ACH:Group(format('|cff4beb2c%s|r', 'Blizzard'), nil, 4)
	L1UI.Options.args.blizzard.args.disabledFrames = ACH:Group('Hide Blizzard Frames', nil, 1, nil, function(info) return E.private.L1UI.disabledFrames[info[#info]] end, function(info, value) E.private.L1UI.disabledFrames[info[#info]] = value E:StaticPopup_Show('L1UI_RL') end)
	L1UI.Options.args.blizzard.args.disabledFrames.inline = true
	L1UI.Options.args.blizzard.args.disabledFrames.args.ZoneTextFrame = ACH:Toggle('Zone Text', 'Hide the Zone Text', 3, nil, nil, nil, function(info) return E.private.L1UI.disabledFrames.ZoneTextFrame end, function(info, value) E.private.L1UI.disabledFrames.ZoneTextFrame = value E:StaticPopup_Show('L1UI_RL') end)
	L1UI.Options.args.blizzard.args.disabledFrames.args.AlertFrame = ACH:Toggle('Alert Frame', 'Hide the Loot/Alert Frame', 4, nil, nil, nil, function(info) return E.private.L1UI.disabledFrames.AlertFrame end, function(info, value) E.private.L1UI.disabledFrames.AlertFrame = value E:StaticPopup_Show('L1UI_RL') end)
	L1UI.Options.args.blizzard.args.disabledFrames.args.BossBanner = ACH:Toggle('Boss Banner', 'Hide the Boss Banner', 1, nil, nil, nil, function(info) return E.private.L1UI.disabledFrames.BossBanner end, function(info, value) E.private.L1UI.disabledFrames.BossBanner = value E:StaticPopup_Show('L1UI_RL') end, nil, not E.Retail)

	-- Chat
	L1UI.Options.args.chat = ACH:Group(format('|cff4beb2c%s|r', 'Chat'), nil, 5)
	L1UI.Options.args.chat.args.chatSetup = ACH:Group('Setup Chat', nil, 1)
	L1UI.Options.args.chat.args.chatSetup.inline = true
	L1UI.Options.args.chat.args.chatSetup.args.chat = ACH:Execute('Setup Chat', nil, 1, function() L1UI:SetupChat() end)
	L1UI.Options.args.chat.args.chatDesc = ACH:Group('Description', nil, 2)
	L1UI.Options.args.chat.args.chatDesc.inline = true
	L1UI.Options.args.chat.args.chatDesc.args.desc = ACH:Description('Setup Chat will reset your chat panels to default and create custom chat tabs.\n\nLeft Chat: [ General - Log - Whisper - Guild - Party ]\n\nRight Chat: [ No Tabs - Details! Damage Meter ]', 1, 'medium')
	L1UI.Options.args.chat.args.chatVars = ACH:Group('Chat CVars', nil, 3)
	L1UI.Options.args.chat.args.chatVars.inline = true
	L1UI.Options.args.chat.args.chatVars.args.desc = ACH:Description('- chatStyle classic\n- whisperMode inline\n- chatClassColorOverride 0\n- colorChatNamesByClass 1', 1, 'medium')

	-- CVars
	L1UI.Options.args.cvars = ACH:Group(format('|cff4beb2c%s|r', 'CVars'), nil, 6)
	L1UI.Options.args.cvars.args.setup = ACH:Group('Setup CVars', nil, 1)
	L1UI.Options.args.cvars.args.setup.inline = true
	L1UI.Options.args.cvars.args.setup.args.generalVars = ACH:Execute('General CVars', nil, 1, function() L1UI:SetupCVars() end, nil, true)
	L1UI.Options.args.cvars.args.setup.args.nameplateVars = ACH:Execute('NamePlate CVars', nil, 2, function() L1UI:NameplateCVars() end, nil, true)
	L1UI.Options.args.cvars.args.generalDesc = ACH:Group('General CVars', nil, 2)
	L1UI.Options.args.cvars.args.generalDesc.inline = true
	L1UI.Options.args.cvars.args.generalDesc.args.cvars = ACH:Description('- advancedCombatLogging 1\n- rawMouseEnable 1\n- ffxDeath 0\n- ffxGlow 0', 1, 'medium')
	L1UI.Options.args.cvars.args.nameplateDesc = ACH:Group('NamePlate CVars', nil, 3)
	L1UI.Options.args.cvars.args.nameplateDesc.inline = true
	L1UI.Options.args.cvars.args.nameplateDesc.args.cvars = ACH:Description('- nameplateLargerScale 1\n- nameplateMinAlpha 1\n- nameplateMinScale 1\n- nameplateMotion 1\n- nameplateOccludedAlphaMult 1\n- nameplateOverlapH 1\n- nameplateOverlapV 1.6\n- nameplateSelectedScale 1\n- nameplateSelfAlpha 1', 1, 'medium')

	-- Media
	L1UI.Options.args.media = ACH:Group(format('|cff4beb2c%s|r', 'Media'), nil, 7)
	L1UI.Options.args.media.args.defaults = ACH:Group('Fonts, Textures & Skins', nil, 1)
	L1UI.Options.args.media.args.defaults.inline = true
	L1UI.Options.args.media.args.defaults.args.private = ACH:Execute('Reset Media', 'Reset Fonts, Textures, Skins to LuckyoneUI defaults.', 1, function() L1UI:SetupPrivate() E:StaggeredUpdateAll() end, nil, true)

	-- Performance
	L1UI.Options.args.performance = ACH:Group(format('|cff4beb2c%s|r', 'Performance'), nil, 8, nil, nil, nil, nil, not E.Retail)
	L1UI.Options.args.performance.args.desc = ACH:Header(format('|cffFF0000%s|r', 'This will clear AddOn Cache and not wipe your settings'), 1)
	L1UI.Options.args.performance.args.elvui = ACH:Group('ElvUI', nil, 2)
	L1UI.Options.args.performance.args.elvui.inline = true
	L1UI.Options.args.performance.args.elvui.args.chat = ACH:Execute('Clear Chat History', nil, 1, function() if not E.private.chat.enable then return end L1UI:Cleanup_Cache('elvui', 'chat') E:StaticPopup_Show('L1UI_RL') end)
	L1UI.Options.args.performance.args.elvui.args.edit = ACH:Execute('Clear Editbox History', nil, 2, function() if not E.private.chat.enable then return end L1UI:Cleanup_Cache('elvui', 'editbox') E:StaticPopup_Show('L1UI_RL') end)
	L1UI.Options.args.performance.args.details = ACH:Group('Details', nil, 3)
	L1UI.Options.args.performance.args.details.inline = true
	L1UI.Options.args.performance.args.details.args.cache = ACH:Execute('Clear Cache', nil, 1, function() if not IsAddOnLoaded('Details') then return end L1UI:Cleanup_Cache('details') E:StaticPopup_Show('L1UI_RL') end)
	L1UI.Options.args.performance.args.plater = ACH:Group('Plater', nil, 4)
	L1UI.Options.args.performance.args.plater.inline = true
	L1UI.Options.args.performance.args.plater.args.cache = ACH:Execute('Clear Cache', nil, 1, function() if not IsAddOnLoaded('Plater') then return end L1UI:Cleanup_Cache('plater') E:StaticPopup_Show('L1UI_RL') end)

	-- Profiles
	L1UI.Options.args.profiles = ACH:Group(format('|cff4beb2c%s|r', 'Profiles'), nil, 9)
	L1UI.Options.args.profiles.args.plugins = ACH:Group('ElvUI Plugins', nil, 1)
	L1UI.Options.args.profiles.args.plugins.inline = true
	L1UI.Options.args.profiles.args.plugins.args.as = ACH:Execute('|cff16C3F2AddOn|r|cFFFFFFFFSkins|r', 'Reset to LuckyoneUI defaults.', 1, function() L1UI:Setup_AddOnSkins() ReloadUI() end, nil, true)
	L1UI.Options.args.profiles.args.plugins.args.pa = ACH:Execute('|cFF16C3F2Project|r|cFFFFFFFFAzilroka|r', 'Reset to LuckyoneUI defaults.', 2, function() L1UI:Setup_ProjectAzilroka() ReloadUI() end, nil, true)
	L1UI.Options.args.profiles.args.bossmods = ACH:Group('BossMods Profiles', nil, 2)
	L1UI.Options.args.profiles.args.bossmods.inline = true
	L1UI.Options.args.profiles.args.bossmods.args.bigwigs = ACH:Execute('BigWigs', 'Reset to LuckyoneUI defaults.', 1, function() L1UI:Setup_BigWigs() ReloadUI() end, nil, true)
	L1UI.Options.args.profiles.args.bossmods.args.dbm = ACH:Execute('DBM', 'Reset to LuckyoneUI defaults.', 2, function() L1UI:Setup_DBM() ReloadUI() end, nil, true)
	L1UI.Options.args.profiles.args.nameplates = ACH:Group('NamePlate Profiles', nil, 3)
	L1UI.Options.args.profiles.args.nameplates.inline = true
	L1UI.Options.args.profiles.args.nameplates.args.elvui = ACH:Execute('ElvUI', 'Reset to LuckyoneUI defaults.', 1, function() L1UI:SetupNamePlates('ElvUI') ReloadUI() end, nil, true)
	L1UI.Options.args.profiles.args.nameplates.args.plater = ACH:Execute('Plater', 'Reset to LuckyoneUI defaults.', 2, function() L1UI:SetupNamePlates('Plater') ReloadUI() end, nil, true)
	L1UI.Options.args.profiles.args.addons = ACH:Group('Addon Profiles', nil, 4)
	L1UI.Options.args.profiles.args.addons.inline = true
	L1UI.Options.args.profiles.args.addons.args.details = ACH:Execute('Details', 'Reset to LuckyoneUI defaults.', 1, function() L1UI:Setup_Details() ReloadUI() end, nil, true)
	L1UI.Options.args.profiles.args.plugins.args.sle = ACH:Execute('|cff9482c9Shadow & Light|r', 'Reset to LuckyoneUI defaults.', 3, function() L1UI:Setup_ShadowAndLight() ReloadUI() end, nil, true, nil, nil, nil, nil, not E.Retail)
	L1UI.Options.args.profiles.args.addons.args.omnicd = ACH:Execute('OmniCD', 'Reset to LuckyoneUI defaults.', 2, function() L1UI:Setup_OmniCD() ReloadUI() end, nil, true, nil, nil, nil, nil, not E.Retail)

	-- Tags
	L1UI.Options.args.tags = ACH:Group(format('|cff4beb2c%s|r', 'Tags'), nil, 10)
	L1UI.Options.args.tags.args.groups = ACH:Group('Tags', nil, 1)
	L1UI.Options.args.tags.args.groups.inline = true
	L1UI.Options.args.tags.args.groups.args.available = ACH:Execute('Available Tags', 'Jump to the Available Tag list.', 1, function() E.Libs.AceConfigDialog:SelectGroup('ElvUI', 'tagGroup', L1UI.Name) end)
	L1UI.Options.args.tags.args.luckyoneDesc = ACH:Group('Luckyone Tags', nil, 2)
	L1UI.Options.args.tags.args.luckyoneDesc.inline = true
	L1UI.Options.args.tags.args.luckyoneDesc.args.luckyone = ACH:Description('- luckyone:health:percent\n- luckyone:classification\n- luckyone:healermana:current\n- luckyone:healermana:percent', 1, 'medium', nil, nil, nil, nil, nil, not E.Retail)
	L1UI.Options.args.tags.args.luckyoneDesc.args.luckyone = ACH:Description('- luckyone:health:percent\n- luckyone:classification', 1, 'medium', nil, nil, nil, nil, nil, E.Retail)

	-- Themes
	L1UI.Options.args.themes = ACH:Group(format('|cff4beb2c%s|r', 'Themes'), nil, 11)
	L1UI.Options.args.themes.args.raid = ACH:Group('UnitFrames Color Theme', nil, 1)
	L1UI.Options.args.themes.args.raid.inline = true
	L1UI.Options.args.themes.args.raid.args.dark = ACH:Execute('Dark', 'Dark Style (Default)', 1, function() L1UI:SetupTheme('dark') end, nil, true)
	L1UI.Options.args.themes.args.raid.args.class = ACH:Execute('Class Color', 'Class Color Style', 2, function() L1UI:SetupTheme('class') end, nil, true)

	-- UnitFrames
	L1UI.Options.args.unitframes = ACH:Group(format('|cff4beb2c%s|r', 'UnitFrames'), nil, 12, nil, nil, nil, nil, not E.Retail)
	L1UI.Options.args.unitframes.args.raid = ACH:Group('Raidframe Style', nil, 1)
	L1UI.Options.args.unitframes.args.raid.inline = true
	L1UI.Options.args.unitframes.args.raid.args.vertical = ACH:Execute('Vertical', 'Vertical Style', 1, function() L1UI:RaidFrames('vertical') end, nil, true)
	L1UI.Options.args.unitframes.args.raid.args.block = ACH:Execute('Block', 'Block Style', 2, function() L1UI:RaidFrames('block') end, nil, true)
	L1UI.Options.args.unitframes.args.desc = ACH:Group('Note', nil, 2)
	L1UI.Options.args.unitframes.args.desc.inline = true
	L1UI.Options.args.unitframes.args.desc.args.raidDesc = ACH:Description('The options above are for the DPS/TANK layout.', 1, 'medium')

	-- WeakAuras
	L1UI.Options.args.weakauras = ACH:Group(format('|cff4beb2c%s|r', 'WeakAuras'), nil, 13, nil, nil, nil, nil, not E.Retail)
	L1UI.Options.args.weakauras.args.header1 = ACH:Header('WeakAuras DPS/TANK', 1)
	L1UI.Options.args.weakauras.args.druid = ACH:Input('|cffFF7C0ADruid:|r', nil, 2, nil, 'normal', function() return 'wago.io/luckyoneDruid' end)
	L1UI.Options.args.weakauras.args.priest = ACH:Input('|cffFFFFFFPriest:|r', nil, 3, nil, 'normal', function() return 'wago.io/luckyonePriest' end)
	L1UI.Options.args.weakauras.args.monk = ACH:Input('|cff00FF98Monk:|r', nil, 4, nil, 'normal', function() return 'wago.io/luckyoneMonk' end)
	L1UI.Options.args.weakauras.args.warlock = ACH:Input('|cff8788EEWarlock:|r', nil, 5, nil, 'normal', function() return 'wago.io/luckyoneWarlock' end)
	L1UI.Options.args.weakauras.args.hunter = ACH:Input('|cffAAD372Hunter:|r', nil, 6, nil, 'normal', function() return 'wago.io/luckyoneHunter' end)
	L1UI.Options.args.weakauras.args.rogue = ACH:Input('|cffFFF468Rogue:|r', nil, 7, nil, 'normal', function() return 'wago.io/luckyoneRogue' end)
	L1UI.Options.args.weakauras.args.mage = ACH:Input('|cff3FC7EBMage:|r', nil, 8, nil, 'normal', function() return 'wago.io/luckyoneMage' end)
	L1UI.Options.args.weakauras.args.dh = ACH:Input('|cffA330C9Demon Hunter:|r', nil, 9, nil, 'normal', function() return 'wago.io/luckyoneDH' end)
	L1UI.Options.args.weakauras.args.dk = ACH:Input('|cffC41E3ADeath Knight:|r', nil, 10, nil, 'normal', function() return 'wago.io/luckyoneDK' end)
	L1UI.Options.args.weakauras.args.paladin = ACH:Input('|cffF48CBAPaladin:|r', nil, 11, nil, 'normal', function() return 'wago.io/luckyonePaladin' end)
	L1UI.Options.args.weakauras.args.shaman = ACH:Input('|cff0070DDShaman:|r', nil, 12, nil, 'normal', function() return 'wago.io/luckyoneShaman' end)
	L1UI.Options.args.weakauras.args.warrior = ACH:Input('|cffC69B6DWarrior:|r', nil, 13, nil, 'normal', function() return 'wago.io/luckyoneWarrior' end)
	L1UI.Options.args.weakauras.args.header3 = ACH:Header('General WeakAuras', 14)
	L1UI.Options.args.weakauras.args.keys = ACH:Input('Link !keys', nil, 15, nil, 'normal', function() return 'wago.io/bfakeys' end)
	L1UI.Options.args.weakauras.args.covenant = ACH:Input('Link !covenant', nil, 16, nil, 'normal', function() return 'wago.io/covenant' end)
	L1UI.Options.args.weakauras.args.trinket = ACH:Input('Trinket tracker', nil, 17, nil, 'normal', function() return 'wago.io/Trinket' end)
	L1UI.Options.args.weakauras.args.affixes = ACH:Input('Mythic+ Affixes', nil, 18, nil, 'normal', function() return 'wago.io/affixes' end)

	-- Credits
	L1UI.Options.args.credits = ACH:Group(format('|cffFF7D0A%s|r', 'Credits'), nil, 14)
	L1UI.Options.args.credits.args.author = ACH:Group('Author', nil, 1)
	L1UI.Options.args.credits.args.author.inline = true
	L1UI.Options.args.credits.args.author.args.desc = ACH:Description(L1UI.AUTHORS_STRING, 1, 'medium')
	L1UI.Options.args.credits.args.coding = ACH:Group('Coding', nil, 2)
	L1UI.Options.args.credits.args.coding.inline = true
	L1UI.Options.args.credits.args.coding.args.desc = ACH:Description(L1UI.CODING_STRING, 1, 'medium')
	L1UI.Options.args.credits.args.testers = ACH:Group('Testers', nil, 3)
	L1UI.Options.args.credits.args.testers.inline = true
	L1UI.Options.args.credits.args.testers.args.desc = ACH:Description(L1UI.TESTER_STRING, 1, 'medium')
	L1UI.Options.args.credits.args.supporter = ACH:Group('Supporters', nil, 4)
	L1UI.Options.args.credits.args.supporter.inline = true
	L1UI.Options.args.credits.args.supporter.args.desc = ACH:Description(L1UI.SUPPORT_STRING, 1, 'medium')

	-- Links
	L1UI.Options.args.links = ACH:Group(format('|cffFF7D0A%s|r', 'Links'), nil, 15)
	L1UI.Options.args.links.args.changelog = ACH:Input('Changelog:', nil, 1, nil, 'full', function() return 'https://github.com/Luckyone961/LuckyoneUI/blob/development/CHANGELOG.md' end)
	L1UI.Options.args.links.args.issues = ACH:Input('Report issues here:', nil, 2, nil, 'full', function() return 'https://github.com/Luckyone961/LuckyoneUI/issues' end)
	L1UI.Options.args.links.args.website = ACH:Input('Addon link:', nil, 3, nil, 'full', function() return 'https://www.curseforge.com/wow/addons/elvui_luckyoneui' end)
	L1UI.Options.args.links.args.discord = ACH:Input('Discord:', nil, 4, nil, 'full', function() return 'https://discord.gg/xRY4bwA' end)
	L1UI.Options.args.links.args.guide = ACH:Input('Wowhead Guide:', nil, 5, nil, 'full', function() return 'https://www.wowhead.com/guide=10680/elvui-luckyoneui-addon-plugin-guide' end)

	-- LuckyoneUI config
	E.Options.args.L1UI = L1UI.Options
end
