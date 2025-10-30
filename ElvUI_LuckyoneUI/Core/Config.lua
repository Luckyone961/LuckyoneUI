-- Addon namespace
local _, Private = ...
local L = Private.Libs.ACL
local ACH = Private.Libs.ACH
local ACD = Private.Libs.ACD

-- Lua functions
local format = string.format
local pairs = pairs
local concat = table.concat
local tinsert = table.insert
local tostring = tostring

-- API cache
local GetCVar = C_CVar.GetCVar
local GetCVarBool = C_CVar.GetCVarBool
local SetCVar = C_CVar.SetCVar

-- Global environment
local _G = _G

-- Credits
Private.Credits = {}

local AUTHOR = { '|cff33937FLucky|r - LaughingSkull', '|cffFF7D0ALuckyone|r - LaughingSkull' }
local CODING = { '|cff0070DEAzilroka|r', '|cFF8866ccSimpy|r', '|cffF58CBARepooc|r', '|cffFF7D0AMerathilis|r' }
local SUPPORT = { '|cffe6cc80Calmcacil|r', '|cffe6cc80DaPaKnat|r', '|cffe6cc80Debeleus|r', '|cffe6cc80DevinDog|r', '|cffe6cc80Dukes|r', '|cffe6cc80Garbar|r', '|cffe6cc80Kenneth|r', '|cffe6cc80Liam|r', '|cffe6cc80Littlesack|r', '|cffe6cc80Lox|r', '|cffe6cc80Midnatt|r', '|cffe6cc80MonkeyHack|r', '|cffe6cc80Onlyne|r', '|cffe6cc80ShowNoMercy|r', '|cffe6cc80Treelyté|r', '|cffe6cc80Triplebeamdreams|r', '|cffe6cc80Tykk|r', '|cffe6cc80Logan|r' }
local TESTERS = { '|cff00FF96AltBridge|r', '|cffABD473Badbrain|r', '|cffC41F3BKringel|r', '|cffF58CBAIllusion|r', '|cffABD473Dlarge|r', '|cffe6cc80Hollicsh|r', '|cff3FC7EBEltreum|r' }

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
	section.args.header1 = ACH:Header(Private.Name, 1)
	section.args.spacer1 = ACH:Spacer(2, 'full')
	section.args.installer = ACH:Execute(Private.Name .. ' ' .. L["Install"], L["Re-Run the installation process."], 3, function() PI:Queue(Private.InstallerData) ElvUI[1]:ToggleOptions() end)
	section.args.spacer2 = ACH:Spacer(4, 'full')
	section.args.header2 = ACH:Header(L["Quick setup for alts"], 5)
	section.args.spacer3 = ACH:Spacer(6, 'full')
	section.args.altMain = ACH:Execute(L["Alt: "] .. L["DPS & Tanks"], L["This will load your most recent LuckyoneUI profile."], 7, function() Private:HandleAlts('Main') end, nil, true)
	section.args.altHealing = ACH:Execute(L["Alt: "] .. L["Healing"], L["This will load your most recent LuckyoneUI profile."], 8, function() Private:HandleAlts('Healing') end, nil, true)
	section.args.altSupport = ACH:Execute(L["Alt: "] .. format('|cff33937F%s', L["Augmentation"]), L["This will load your most recent LuckyoneUI profile."], 9, function() Private:HandleAlts('Support') end, nil, true)
	return section
end

-- Build Blizzard Section
local function BuildBlizzardSection()
	local section = ACH:Group(L["Blizzard improvements"], nil, 3)
	section.args.header = ACH:Header(L["Blizzard improvements"], 1)
	section.args.disabledFrames = ACH:Group(L["Hide Blizzard Frames"], nil, 2, nil, function(info) return Private.Addon.db.global.disabledFrames[info[#info]] end, function(info, value) Private.Addon.db.global.disabledFrames[info[#info]] = value _G.StaticPopup_Show('LUCKYONE_RL') end)
	section.args.disabledFrames.inline = true
	section.args.disabledFrames.args.AlertFrame = ACH:Toggle(L["Alert Frame"], L["Hide the Loot/Alert Frame"], 1)
	section.args.disabledFrames.args.BossBanner = ACH:Toggle(L["Boss Banner"], L["Hide the Boss Banner"], 2, nil, nil, nil, nil, nil, nil, not Private.isRetail)
	section.args.disabledFrames.args.ZoneTextFrame = ACH:Toggle(L["Zone Text"], L["Hide the Zone Text"], 3)
	section.args.qualityOfLife = ACH:Group(L["Quality of Life"], nil, 3, nil, function(info) return Private.Addon.db.global.qualityOfLife[info[#info]] end, function(info, value) Private.Addon.db.global.qualityOfLife[info[#info]] = value _G.StaticPopup_Show('LUCKYONE_RL') end)
	section.args.qualityOfLife.inline = true
	section.args.qualityOfLife.args.easyDelete = ACH:Toggle(L["Easy Delete"], L["Automatically fill out the confirmation text to delete items."], 1)
	section.args.qualityOfLife.args.privacyOverlay = ACH:Toggle(L["Privacy Overlay"], L["Creates an overlay to hide the chat frame in the Communities Frame until you click on it."], 2)
	section.args.strings = ACH:Group(L["Profile strings"], nil, 4, nil, nil, nil, nil, not Private.isRetail)
	section.args.strings.inline = true
	section.args.strings.args.editMode = ACH:Execute(L["Blizzard Edit Mode"], nil, 1, function() _G.StaticPopup_Show('LUCKYONE_EDITBOX', nil, nil, 'https://wago.io/LuckyoneUI-BlizzHUD') end)
	return section
end

-- Build Auras Section
local function BuildAurasSection()
	local section = ACH:Group(L["Buffs and Debuffs"], nil, 4, 'tab')
	section.args.header = ACH:Header(L["Buffs and Debuffs"], 1)
	section.args.buffs = ACH:Group(format('|cff3296ff%s|r', L["Buffs"]), nil, 1)
	section.args.buffs.args.player = ACH:Group(L["Player Frame Buffs"], nil, 1)
	section.args.buffs.args.player.inline = true
	section.args.buffs.args.player.args.min = ACH:Execute(L["LuckyoneUI Default"], L["Minimalistic. Only important auras."], 1, function() Private:Setup_Buffs('player', 'min') end)
	section.args.buffs.args.player.args.all = ACH:Execute(L["Show All"], L["Show all auras except blacklisted."], 2, function() Private:Setup_Buffs('player', 'all') end)
	section.args.buffs.args.target = ACH:Group(L["Target Frame Buffs"], nil, 2)
	section.args.buffs.args.target.inline = true
	section.args.buffs.args.target.args.min = ACH:Execute(L["LuckyoneUI Default"], L["Minimalistic. Only important auras."], 1, function() Private:Setup_Buffs('target', 'min') end)
	section.args.buffs.args.target.args.all = ACH:Execute(L["Show All"], L["Show all auras except blacklisted."], 2, function() Private:Setup_Buffs('target', 'all') end)
	section.args.buffs.args.focus = ACH:Group(L["Focus Frame Buffs"], nil, 3, nil, nil, nil, nil, Private.isClassic)
	section.args.buffs.args.focus.inline = true
	section.args.buffs.args.focus.args.min = ACH:Execute(L["LuckyoneUI Default"], L["Minimalistic. Only important auras."], 1, function() Private:Setup_Buffs('focus', 'min') end)
	section.args.buffs.args.focus.args.all = ACH:Execute(L["Show All"], L["Show all auras except blacklisted."], 2, function() Private:Setup_Buffs('focus', 'all') end)
	section.args.buffs.args.boss = ACH:Group(L["Boss Frame Buffs"], nil, 4, nil, nil, nil, nil, not Private.isRetail)
	section.args.buffs.args.boss.inline = true
	section.args.buffs.args.boss.args.min = ACH:Execute(L["LuckyoneUI Default"], L["Minimalistic. Only important auras."], 1, function() Private:Setup_Buffs('boss', 'min') end)
	section.args.buffs.args.boss.args.all = ACH:Execute(L["Show All"], L["Show all auras except blacklisted."], 2, function() Private:Setup_Buffs('boss', 'all') end)
	section.args.debuffs = ACH:Group(format('|cffC80000%s|r', L["Debuffs"]), nil, 2)
	section.args.debuffs.args.player = ACH:Group(L["Player Frame Debuffs"], nil, 1)
	section.args.debuffs.args.player.inline = true
	section.args.debuffs.args.player.args.min = ACH:Execute(L["LuckyoneUI Default"], L["Minimalistic. Only important auras."], 1, function() Private:Setup_Debuffs('player', 'min') end)
	section.args.debuffs.args.player.args.all = ACH:Execute(L["Show All"], L["Show all auras except blacklisted."], 2, function() Private:Setup_Debuffs('player', 'all') end)
	section.args.debuffs.args.target = ACH:Group(L["Target Frame Debuffs"], nil, 2)
	section.args.debuffs.args.target.inline = true
	section.args.debuffs.args.target.args.min = ACH:Execute(L["LuckyoneUI Default"], L["Minimalistic. Only important auras."], 1, function() Private:Setup_Debuffs('target', 'min') end)
	section.args.debuffs.args.target.args.all = ACH:Execute(L["Show All"], L["Show all auras except blacklisted."], 2, function() Private:Setup_Debuffs('target', 'all') end)
	section.args.debuffs.args.focus = ACH:Group(L["Focus Frame Debuffs"], nil, 3, nil, nil, nil, nil, Private.isClassic)
	section.args.debuffs.args.focus.inline = true
	section.args.debuffs.args.focus.args.min = ACH:Execute(L["LuckyoneUI Default"], L["Minimalistic. Only important auras."], 1, function() Private:Setup_Debuffs('focus', 'min') end)
	section.args.debuffs.args.focus.args.all = ACH:Execute(L["Show All"], L["Show all auras except blacklisted."], 2, function() Private:Setup_Debuffs('focus', 'all') end)
	section.args.debuffs.args.boss = ACH:Group(L["Boss Frame Debuffs"], nil, 4, nil, nil, nil, nil, not Private.isRetail)
	section.args.debuffs.args.boss.inline = true
	section.args.debuffs.args.boss.args.min = ACH:Execute(L["LuckyoneUI Default"], L["Minimalistic. Only important auras."], 1, function() Private:Setup_Debuffs('boss', 'min') end)
	section.args.debuffs.args.boss.args.all = ACH:Execute(L["Show All"], L["Show all auras except blacklisted."], 2, function() Private:Setup_Debuffs('boss', 'all') end)
	section.args.filters = ACH:Group(L["Filters"], nil, 3)
	section.args.filters.inline = true
	section.args.filters.args.setup = ACH:Execute(L["Setup Aura Filters"], nil, 1, function() Private:Setup_Filters() _G.StaticPopup_Show('LUCKYONE_RL') end)
	section.args.filters.args.desc = ACH:Description(L["This will apply Luckyones Aura Indicator edit and set the style to Textured.\nIt will also add custom IDs to Whitelist & Blacklist.\n"], 2, 'medium')
	return section
end

-- Build PrivateDB Section
local function BuildPrivateDBSection()
	local section = ACH:Group(L["Character specific"], nil, 5)
	section.args.header = ACH:Header(L["Character specific"], 1)
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
	local section = ACH:Group(L["Chat"], nil, 6)
	section.args.header = ACH:Header(L["Chat"], 1)
	section.args.chatSetup = ACH:Group(L["Setup Chat"], nil, 2)
	section.args.chatSetup.inline = true
	section.args.chatSetup.args.chat = ACH:Execute(L["Setup Chat"], nil, 1, function() Private:Setup_Chat() end)
	section.args.chatDesc = ACH:Group(L["Description"], nil, 3)
	section.args.chatDesc.inline = true
	section.args.chatDesc.args.desc = ACH:Description(L["Setup Chat will reset your chat panels to default and create custom chat tabs.\n\nChat tabs: [ General - Log - Whisper - Guild - Party ]"], 1, 'medium')
	section.args.chatVars = ACH:Group(L["Chat CVars"], nil, 4)
	section.args.chatVars.inline = true
	section.args.chatVars.args.desc = ACH:Description('- chatClassColorOverride 0\n- chatMouseScroll 1\n- chatStyle classic\n- colorChatNamesByClass 1\n- whisperMode inline\n- wholeChatWindowClickable 0', 1, 'medium')
	return section
end

-- Build CVars Section
local function BuildCVarsSection()
	local section = ACH:Group(L["Console Variables"], nil, 7)
	section.args.header = ACH:Header(L["Console Variables"], 1)
	section.args.setup = ACH:Group(L["Setup CVars"], nil, 2)
	section.args.setup.inline = true
	section.args.setup.args.generalVars = ACH:Execute(L["General CVars"], nil, 1, function() Private:Setup_CVars() end, nil, true)
	section.args.setup.args.nameplateVars = ACH:Execute(L["NamePlate CVars"], nil, 2, function() Private:NameplateCVars() end, nil, true)
	section.args.generalDesc = ACH:Group(L["General CVars"], nil, 3)
	section.args.generalDesc.inline = true
	section.args.generalDesc.args.cvars = ACH:Description('- alwaysShowActionBars 1\n- AutoPushSpellToActionBar 0\n- cameraDistanceMaxZoomFactor 2.6\n- fstack_preferParentKeys 0\n- lockActionBars 1\n- minimapTrackingShowAll 1\n- screenshotQuality 10\n- showNPETutorials 0\n- showTutorials 0\n- threatWarning 3\n- UberTooltips 1\n', 1, 'medium')
	section.args.nameplateDesc = ACH:Group(L["NamePlate CVars"], nil, 4)
	section.args.nameplateDesc.inline = true
	section.args.nameplateDesc.args.cvars = ACH:Description('- NamePlateHorizontalScale 1\n- nameplateLargerScale 1\n- nameplateLargeTopInset -1\n- nameplateMinAlpha 1\n- nameplateMinScale 1\n- nameplateMotion 1\n- nameplateOccludedAlphaMult 1\n- nameplateOtherBottomInset -1\n- nameplateOtherTopInset -1\n- nameplateOverlapH 1\n- nameplateOverlapV 2.2\n- nameplateSelectedScale 1\n- nameplateSelfAlpha 1\n- nameplateSelfTopInset -1\n- nameplateShowOnlyNames 1\n- NamePlateVerticalScale 1\n- UnitNameEnemyGuardianName 1\n- UnitNameEnemyMinionName 1\n- UnitNameEnemyPetName 1\n- UnitNameEnemyPlayerName 1\n', 1, 'medium')
	return section
end

-- Build Layouts Section
local function BuildLayoutsSection()
	local section = ACH:Group('ElvUI ' .. L["Layouts"], nil, 8)
	section.args.header1 = ACH:Header(L["Layout Scale"], 1)
	section.args.scaling = ACH:Group(L["1440p = Default | 1080p = Downscaled"], nil, 2)
	section.args.scaling.inline = true
	section.args.scaling.args.native = ACH:Toggle('1440p', nil, 1, nil, nil, nil, function() return not Private.Addon.db.global.scaled end, function(_, value) Private.Addon.db.global.scaled = not value end)
	section.args.scaling.args.scaled = ACH:Toggle('1080p', nil, 2, nil, nil, nil, function() return Private.Addon.db.global.scaled end, function(_, value) Private.Addon.db.global.scaled = value end)
	section.args.header2 = ACH:Header('ElvUI ' .. L["Layouts"], 3)
	section.args.thewarwithin = ACH:Group('The War Within ' .. L["Layouts"] .. ' (v' .. tostring(Private.Version) .. ') (' .. format('|cff4beb2c%s', L["Current"]) .. ')', nil, 4)
	section.args.thewarwithin.inline = true
	section.args.thewarwithin.args.main = ACH:Execute(L["DPS & Tanks"], nil, 1, function() Private:Setup_Layout('main') _G.StaticPopup_Show('LUCKYONE_RL') end, nil, true)
	section.args.thewarwithin.args.healing = ACH:Execute(L["Healing"], nil, 2, function() Private:Setup_Layout('healing') _G.StaticPopup_Show('LUCKYONE_RL') end, nil, true)
	section.args.thewarwithin.args.support = ACH:Execute(format('|cff33937F%s', L["Augmentation"]), L["No ActionBars and centered Raid Frames"], 3, function() Private:Setup_Layout('support') _G.StaticPopup_Show('LUCKYONE_RL') end, nil, true)
	return section
end

-- Build Graphics Section
local function BuildGraphicsSection()
	local section = ACH:Group(L["Graphics"], nil, 9)
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
	local section = ACH:Group(L["Profiles"], nil, 10)
	section.args.header1 = ACH:Header(L["Layout Scale"], 1)
	section.args.scaling = ACH:Group(L["1440p = Default | 1080p = Downscaled"], nil, 2)
	section.args.scaling.inline = true
	section.args.scaling.args.native = ACH:Toggle('1440p', nil, 1, nil, nil, nil, function() return not Private.Addon.db.global.scaled end, function(_, value) Private.Addon.db.global.scaled = not value end)
	section.args.scaling.args.scaled = ACH:Toggle('1080p', nil, 2, nil, nil, nil, function() return Private.Addon.db.global.scaled end, function(_, value) Private.Addon.db.global.scaled = value end)
	section.args.plugins = ACH:Group(L["ElvUI Plugins"], nil, 3)
	section.args.plugins.inline = true
	section.args.plugins.args.as = ACH:Execute('|cff16C3F2AddOn|r|cFFFFFFFFSkins|r', L["Reset to LuckyoneUI defaults."], 1, function() Private:Setup_AddOnSkins() _G.StaticPopup_Show('LUCKYONE_RL') end, nil, true)
	section.args.plugins.args.pa = ACH:Execute('|cff16C3F2Project|r|cFFFFFFFFAzilroka|r', L["Reset to LuckyoneUI defaults."], 2, function() Private:Setup_ProjectAzilroka() _G.StaticPopup_Show('LUCKYONE_RL') end, nil, true)
	section.args.plugins.args.sle = ACH:Execute('|cff9482c9Shadow & Light|r', L["Reset to LuckyoneUI defaults."], 3, function() Private:Setup_ShadowAndLight() _G.StaticPopup_Show('LUCKYONE_RL') end, nil, true, nil, nil, nil, nil, not (Private.isRetail and Private.ElvUI))
	section.args.plugins.args.wt = ACH:Execute('|cff5385edWindTools|r', L["Reset to LuckyoneUI defaults."], 4, function() Private:Setup_WindTools() _G.StaticPopup_Show('LUCKYONE_RL') end, nil, true, nil, nil, nil, nil, not (Private.isRetail and Private.ElvUI))
	section.args.nameplates = ACH:Group(L["NamePlate Profiles"], nil, 4)
	section.args.nameplates.inline = true
	section.args.nameplates.args.elvui = ACH:Execute('ElvUI', L["Reset to LuckyoneUI defaults."], 1, function() Private:Setup_NamePlates() _G.StaticPopup_Show('LUCKYONE_RL') end, nil, true, nil, nil, nil, nil, not (Private.isRetail and Private.ElvUI))
	section.args.nameplates.args.styleFilters = ACH:Execute('ElvUI StyleFilters', L["Reset to LuckyoneUI defaults."], 2, function() Private:Setup_StyleFilters() _G.StaticPopup_Show('LUCKYONE_RL') end, nil, true, nil, nil, nil, nil, not (Private.isRetail and Private.ElvUI))
	section.args.nameplates.args.plater = ACH:Execute('Plater', L["Reset to LuckyoneUI defaults."], 3, function() Private:Setup_Plater() _G.StaticPopup_Show('LUCKYONE_RL') end, nil, true)
	section.args.addons = ACH:Group(L["Addon Profiles"], nil, 5)
	section.args.addons.inline = true
	section.args.addons.args.details = ACH:Execute('Details', L["Reset to LuckyoneUI defaults."], 1, function() Private:Setup_Details() _G.StaticPopup_Show('LUCKYONE_RL') end, nil, true)
	section.args.addons.args.warpDeplete = ACH:Execute('WarpDeplete', L["Reset to LuckyoneUI defaults."], 2, function() Private:Setup_WarpDeplete() _G.StaticPopup_Show('LUCKYONE_RL') end, nil, true, nil, nil, nil, nil, not Private.isRetail)
	section.args.header2 = ACH:Header(L["Profiles for DPS & Tanks"], 6)
	section.args.addonsMain = ACH:Group(L["Addon Profiles"], nil, 7)
	section.args.addonsMain.inline = true
	section.args.addonsMain.args.bigwigs = ACH:Execute(L["BigWigs Main"], L["Reset to LuckyoneUI defaults."], 1, function() Private:Setup_BigWigs('main') end, nil, true)
	section.args.addonsMain.args.omnicd = ACH:Execute(L["OmniCD Main"], L["Reset to LuckyoneUI defaults."], 2, function() Private:Setup_OmniCD('main') _G.StaticPopup_Show('LUCKYONE_RL') end, nil, true)
	section.args.header3 = ACH:Header(L["Profiles for Healing"], 8)
	section.args.addonsHealing = ACH:Group(L["Addon Profiles"], nil, 9)
	section.args.addonsHealing.inline = true
	section.args.addonsHealing.args.bigwigs = ACH:Execute(L["BigWigs Healing"], L["Reset to LuckyoneUI defaults."], 1, function() Private:Setup_BigWigs('healing') end, nil, true)
	section.args.addonsHealing.args.omnicd = ACH:Execute(L["OmniCD Healing"], L["Reset to LuckyoneUI defaults."], 2, function() Private:Setup_OmniCD('healing') _G.StaticPopup_Show('LUCKYONE_RL') end, nil, true)
	return section
end

-- Build Skins Section
local function BuildSkinsSection()
	local section = ACH:Group('Skins', nil, 11)
	section.args.header = ACH:Header('Skins', 1)
	section.args.addons = ACH:Group('AddOns', nil, 2, nil, function(info) return Private.Addon.db.global.skins[info[#info]] end, function(info, value) Private.Addon.db.global.skins[info[#info]] = value _G.StaticPopup_Show('LUCKYONE_RL') end)
	section.args.addons.inline = true
	section.args.addons.args.BugSack = ACH:Toggle('BugSack', nil, 1, nil, nil, nil, nil, nil, not Private.IsAddOnLoaded('BugSack'))
	section.args.addons.args.Tabardy = ACH:Toggle('Tabardy', nil, 2, nil, nil, nil, nil, nil, not Private.IsAddOnLoaded('Tabardy'))
	return section
end

-- Build Tags Section
local function BuildTagsSection()
	local section = ACH:Group(L["Tags"], nil, 12)
	section.args.header = ACH:Header(L["Tags"], 1)
	section.args.spacer = ACH:Spacer(2, 'full')
	section.args.shortcut = ACH:Execute(L["Available Tags"], nil, 3, function() ElvUI[1].Libs.AceConfigDialog:SelectGroup('ElvUI', 'tagGroup', Private.Name) end)
	return section
end

-- Build Themes Section
local function BuildThemesSection()
	local section = ACH:Group(L["Themes"], nil, 13)
	section.args.header = ACH:Header(L["Themes"], 1)
	section.args.raid = ACH:Group(L["UnitFrames Color Theme"], nil, 2)
	section.args.raid.inline = true
	section.args.raid.args.dark = ACH:Execute(L["Dark"], L["Dark Style (Default)"], 1, function() Private:Setup_Theme('dark') end, nil, true)
	section.args.raid.args.class = ACH:Execute(L["Class Color"], L["Class Color Style"], 2, function() Private:Setup_Theme('class') end, nil, true)
	return section
end

-- Build WeakAuras Section
local function BuildWeakAurasSection()
	local section = ACH:Group('WeakAuras', nil, 14, nil, nil, nil, nil, not Private.isRetail)
	section.args.maintained = ACH:Group(L["WeakAuras - Maintained"], nil, 1)
	section.args.maintained.inline = true
	section.args.maintained.args.evoker = ACH:Execute(format('|cff33937F%s|r', L["Evoker"]), nil, 1, function() Private:WeakAurasImport('evoker') end)
	section.args.maintained.args.druid = ACH:Execute(format('|cffFF7C0A%s|r', L["Druid"]), nil, 2, function() Private:WeakAurasImport('druid') end)
	section.args.maintained.args.spacer = ACH:Spacer(3, 'full')
	section.args.maintained.args.auraList = ACH:Description('- |cff33937FEvoker|r: Augmentation, Devastation\n- |cffFF7C0ADruid|r: Balance', 5, 'medium')
	section.args.edits = ACH:Group(L["WeakAuras - Edits of other packs"], nil, 2)
	section.args.edits.inline = true
	section.args.edits.args.importButtonRanged = ACH:Execute(L["Ranged DPS"], nil, 1, function() Private:WeakAurasImport('customEditsRanged') end)
	section.args.edits.args.importButtonMelee = ACH:Execute(L["Melee DPS"], nil, 2, function() Private:WeakAurasImport('customEditsMelee') end)
	section.args.edits.args.spacer = ACH:Spacer(3, 'full')
	section.args.edits.args.importButtonTanks = ACH:Execute(L["Tanks"], nil, 4, function() Private:WeakAurasImport('customEditsTanks') end)
	section.args.edits.args.importButtonHealers = ACH:Execute(L["Healers"], nil, 5, function() Private:WeakAurasImport('customEditsHealers') end)
	section.args.general = ACH:Group(L["WeakAuras - General"], nil, 3)
	section.args.general.inline = true
	section.args.general.args.keys = ACH:Execute('!keys command', nil, 1, function() Private:WeakAurasImport('keys') end)
	section.args.general.args.elvuiMythicVisibility = ACH:Execute('ElvUI Mythic Handler', nil, 2, function() Private:WeakAurasImport('elvuiMythicVisibility') end, nil, nil, nil, nil, nil, nil, not (Private.isRetail and Private.ElvUI))
	section.args.general.args.spacerOne = ACH:Spacer(3, 'full')
	section.args.general.args.externals = ACH:Execute('Externals on You', nil, 4, function() Private:WeakAurasImport('externals') end)
	section.args.general.args.groupfinderAppTextHide = ACH:Execute('Groupfinder AppText Hide', nil, 5, function() Private:WeakAurasImport('groupfinderAppTextHide') end)
	section.args.general.args.handleFriendlyNamePlates = ACH:Execute('Handle Friendly Plates', nil, 6, function() Private:WeakAurasImport('handleFriendlyNamePlates') end)
	section.args.general.args.spacerTwo = ACH:Spacer(7, 'full')
	section.args.general.args.handleNamePlatesFont = ACH:Execute('Handle Plates Font ', nil, 8, function() Private:WeakAurasImport('handleNamePlatesFont') end)
	section.args.general.args.playerFrameUtilities = ACH:Execute('Player Frame Utility', nil, 9, function() Private:WeakAurasImport('playerFrameUtilities') end)
	section.args.general.args.trinket = ACH:Execute('Trinket Tracker', nil, 10, function() Private:WeakAurasImport('trinket') end)
	section.args.other = ACH:Group(L["WeakAuras - Other"], nil, 4)
	section.args.other.inline = true
	section.args.other.args.affixes = ACH:Execute('Affixes', nil, 1, function() Private:WeakAurasImport('affixes') end)
	section.args.other.args.dungeonCore = ACH:Execute('Season 3 Dungeon', nil, 2, function() Private:WeakAurasImport('dungeonCore') end)
	section.args.other.args.raidCore = ACH:Execute('Season 3 Raid', nil, 2, function() Private:WeakAurasImport('raidCore') end)
	return section
end

-- Build Credits Section
local function BuildCreditsSection()
	local section = ACH:Group(format('|cfd9b9b9b%s|r', L["Credits"]), nil, 15)
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
	local section = ACH:Group(format('|cfd9b9b9b%s|r', L["Links"]), nil, 16)
	section.args.header = ACH:Header(L["Links"], 1)
	section.args.spacer = ACH:Spacer(2, 'full')
	section.args.website = ACH:Input(L["Addon Download:"], nil, 3, nil, 'full', function() return 'https://download.luckyone.dev' end)
	section.args.changelog = ACH:Input(L["Changelog:"], nil, 4, nil, 'full', function() return 'https://changelog.luckyone.dev' end)
	section.args.discord = ACH:Input('Discord:', nil, 5, nil, 'full', function() return 'https://discord.luckyone.dev' end)
	section.args.issues = ACH:Input(L["Report issues here:"], nil, 6, nil, 'full', function() return 'https://tickets.luckyone.dev' end)
	section.args.guide = ACH:Input(L["Wowhead Guide:"], nil, 7, nil, 'full', function() return 'https://guide.luckyone.dev' end)
	section.args.twitch = ACH:Input('Twitch:', nil, 8, nil, 'full', function() return 'https://twitch.luckyone.dev' end)
	section.args.youtube = ACH:Input('YouTube:', nil, 9, nil, 'full', function() return 'https://youtube.luckyone.dev' end)
	section.args.homepage = ACH:Input(L["Homepage:"], nil, 10, nil, 'full', function() return 'https://luckyone.dev' end)
	return section
end

-- Build Dev Section
local function BuildDevSection()
	local section = ACH:Group(format('|cff4beb2c%s|r', 'Developer'), nil, 17)
	section.args.header1 = ACH:Header('Developer', 1)
	section.args.toggles = ACH:Group('Toggles', nil, 2)
	section.args.toggles.inline = true
	section.args.toggles.args.dev = ACH:Toggle('Developer Mode', 'Enable this toggle to apply Luckyone\'s personal adjustments during the installation process.\n\nAdditional information section will show up at the bottom of the config after ReloadUI.\n\n|cffC80000There is no support for this.\n\nUse at own risk.|r', 1, nil, nil, nil, function() return Private.Addon.db.global.dev end, function(_, value) Private.Addon.db.global.dev = value end)
	section.args.devInfo = ACH:Group('Information', nil, 3)
	section.args.devInfo.inline = true
	section.args.devInfo.args.desc = ACH:Description('While this developer mode is enabled, the following will change:\n\n- Profiles created by the installer will no longer add the version suffix to the profile name.\n- Profile installer make additional database adjustments as listed below.', 1, 'medium')
	section.args.db = ACH:Group('Developer Mode Changes', nil, 4)
	section.args.db.inline = true
	section.args.db.args.desc = ACH:Description('- ElvUI chat bubble skinning disabled (To use texture replacements)\n- ElvUI bags module disabled (To use Baganator)\n- LuckyoneUI Alert Frame hider enabled\n- LuckyoneUI Boss Banner hider enabled\n- LuckyoneUI Easy Delete enabled\n- LuckyoneUI Privacy Overlay enabled', 1, 'medium')
	section.args.header2 = ACH:Header('Luckyone\'s Private Section', 5)
	section.args.syncInfo = ACH:Group('Important information', nil, 6)
	section.args.syncInfo.inline = true
	section.args.syncInfo.args.desc = ACH:Description('Clicking this button will override every single option of the games ESC > Options with Luckyone\'s settings.\n\nThis includes all of gameplay, accessibility, graphics, audio and network.\n\nIf you decide to use this, copy the command from Step 1 and enter it in your chat, then click Step 2.\n\n|cffC80000There is no support for this.\n\nUse at own risk.|r', 1, 'medium')
	section.args.spacer = ACH:Spacer(7, 'full')
	section.args.command = ACH:Execute('Step 1', '|cffC80000Do not click without reading the important information!|r', 8, function() _G.StaticPopup_Show('LUCKYONE_EDITBOX', nil, nil, '/console cvar_default') end)
	section.args.execute = ACH:Execute('Step 2', '|cffC80000Do not click without reading the important information!|r', 9, function() Private:SyncSettings() end, nil, true)
	return section
end

-- LuckyoneUI config panel
function Private.Addon:BuildConfig()

	-- Header
	Private.Config = ACH:Group(Private.Name, nil, 20, (Private.ElvUI and nil) or 'tree')

	-- Add sections
	Private.Config.args.blizzard = BuildBlizzardSection() -- 3
	Private.Config.args.chat = BuildChatSection() -- 6
	Private.Config.args.cvars = BuildCVarsSection() -- 7
	Private.Config.args.graphics = BuildGraphicsSection() -- 9
	Private.Config.args.profiles = BuildProfilesSection() -- 10
	Private.Config.args.weakauras = BuildWeakAurasSection() -- 14
	Private.Config.args.credits = BuildCreditsSection() -- 15
	Private.Config.args.links = BuildLinksSection() -- 16
	Private.Config.args.dev = BuildDevSection() -- 17

	if Private.ElvUI then

		-- Add LuckyoneUI version on top of the ElvUI config
		ElvUI[1].Options.name = format('%s + %s |cff99ff33%.2f|r', ElvUI[1].Options.name, Private.Name, Private.Version)

		Private.Config.args.setup = BuildSetupSection() -- 2
		Private.Config.args.auras = BuildAurasSection() -- 4
		Private.Config.args.privateDB = BuildPrivateDBSection() -- 5
		Private.Config.args.layouts = BuildLayoutsSection() -- 8
		Private.Config.args.skins = BuildSkinsSection() -- 11
		Private.Config.args.tags = BuildTagsSection() -- 12
		Private.Config.args.themes = BuildThemesSection() -- 13

		ElvUI[1].Options.args.L1UI = Private.Config
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
