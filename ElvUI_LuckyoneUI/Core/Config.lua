-- Lua functions
local format = format
local pairs = pairs
local sort = sort
local concat = table.concat
local tinsert = table.insert
local tostring = tostring
local unpack = unpack

-- API cache
local GetCVar = C_CVar.GetCVar
local GetCVarBool = C_CVar.GetCVarBool
local SetCVar = C_CVar.SetCVar

-- AddOn namespace
local _, Private = ...

-- ElvUI modules
local E, L = unpack(ElvUI)
local D = E:GetModule('Distributor')
local PI = E:GetModule('PluginInstaller')

-- LibAceConfigHelper does not exist yet
local ACH

-- Credits
local AUTHOR = { '|cff33937FLucky|r - LaughingSkull', '|cffFF7D0ALuckyone|r - LaughingSkull' }
local CODING = { '|cff0070DEAzilroka|r', '|cFF8866ccSimpy|r', '|cffF58CBARepooc|r', '|cffFF7D0AMerathilis|r' }
local SUPPORT = { '|cffe6cc80Calmcacil|r', '|cffe6cc80DaPaKnat|r', '|cffe6cc80Debeleus|r', '|cffe6cc80DevinDog|r', '|cffe6cc80Dukes|r', '|cffe6cc80Garbar|r', '|cffe6cc80Kenneth|r', '|cffe6cc80Liam|r', '|cffe6cc80Littlesack|r', '|cffe6cc80Lox|r', '|cffe6cc80Midnatt|r', '|cffe6cc80MonkeyHack|r', '|cffe6cc80Onlyne|r', '|cffe6cc80ShowNoMercy|r', '|cffe6cc80Treelyté|r', '|cffe6cc80Triplebeamdreams|r', '|cffe6cc80Tykk|r', '|cffe6cc80Logan|r' }
local TESTERS = { '|cff00FF96AltBridge|r', '|cffABD473Badbrain|r', '|cffC41F3BKringel|r', '|cffF58CBAIllusion|r', '|cffABD473Dlarge|r', '|cffe6cc80Hollicsh|r', '|cff3FC7EBEltreum|r' }

local function SortList(a, b)
	return E:StripString(a) < E:StripString(b)
end

local function ProcessList(list)
	sort(list, SortList)
	for _, name in pairs(list) do
		tinsert(Private.Credits, name)
	end
	return concat(list, '|n')
end

local AUTHOR_STRING = ProcessList(AUTHOR)
local CODING_STRING = ProcessList(CODING)
local TESTER_STRING = ProcessList(TESTERS)
local SUPPORT_STRING = ProcessList(SUPPORT)

-- LuckyoneUI config panel
function L1UI:Config()

	-- Add LuckyoneUI version on top of the ElvUI config
	E.Options.name = format('%s + %s |cff99ff33%.2f|r', E.Options.name, Private.Name, Private.Version)

	-- LibAceConfigHelper
	ACH = E.Libs.ACH

	-- Don't export this
	D.blacklistedKeys.global.L1UI = {}
	D.blacklistedKeys.global.L1UI.dev = true

	-- Header
	L1UI.Options = ACH:Group(Private.Name, nil, 20)

	-- Installer & Update
	L1UI.Options.args.setup = ACH:Group('', nil, 1)
	L1UI.Options.args.setup.inline = true
	L1UI.Options.args.setup.args.header1 = ACH:Header(Private.Name, 1)
	L1UI.Options.args.setup.args.spacer1 = ACH:Spacer(2, 'full')
	L1UI.Options.args.setup.args.installer = ACH:Execute(Private.Name .. ' ' .. L["Install"], L["Re-Run the installation process."], 3, function() PI:Queue(L1UI.InstallerData) E:ToggleOptions() end)
	L1UI.Options.args.setup.args.spacer2 = ACH:Spacer(4, 'full')
	L1UI.Options.args.setup.args.header2 = ACH:Header(L["Quick setup for alts"], 5)
	L1UI.Options.args.setup.args.spacer3 = ACH:Spacer(6, 'full')
	L1UI.Options.args.setup.args.altMain = ACH:Execute(L["Alt: "] .. L["DPS & Tanks"], L["This will load your most recent LuckyoneUI profile."], 7, function() Private:HandleAlts('Main') end, nil, true)
	L1UI.Options.args.setup.args.altHealing = ACH:Execute(L["Alt: "] .. L["Healing"], L["This will load your most recent LuckyoneUI profile."], 8, function() Private:HandleAlts('Healing') end, nil, true)
	L1UI.Options.args.setup.args.altSupport = ACH:Execute(L["Alt: "] .. format('|cff33937F%s', L["Augmentation"]), L["This will load your most recent LuckyoneUI profile."], 9, function() Private:HandleAlts('Support') end, nil, true)

	-- Spacer
	L1UI.Options.args.header = ACH:Spacer(2, 'full')

	-- Blizzard
	L1UI.Options.args.blizzard = ACH:Group(L["Blizzard improvements"], nil, 3)
	L1UI.Options.args.blizzard.args.header = ACH:Header(L["Blizzard improvements"], 1)
	L1UI.Options.args.blizzard.args.disabledFrames = ACH:Group(L["Hide Blizzard Frames"], nil, 2, nil, function(info) return E.private.L1UI.disabledFrames[info[#info]] end, function(info, value) E.private.L1UI.disabledFrames[info[#info]] = value E:StaticPopup_Show('L1UI_RL') end)
	L1UI.Options.args.blizzard.args.disabledFrames.inline = true
	L1UI.Options.args.blizzard.args.disabledFrames.args.AlertFrame = ACH:Toggle(L["Alert Frame"], L["Hide the Loot/Alert Frame"], 1)
	L1UI.Options.args.blizzard.args.disabledFrames.args.BossBanner = ACH:Toggle(L["Boss Banner"], L["Hide the Boss Banner"], 2, nil, nil, nil, nil, nil, nil, not E.Retail)
	L1UI.Options.args.blizzard.args.disabledFrames.args.ZoneTextFrame = ACH:Toggle(L["Zone Text"], L["Hide the Zone Text"], 3)
	L1UI.Options.args.blizzard.args.qualityOfLife = ACH:Group(L["Quality of Life"], nil, 3, nil, function(info) return E.private.L1UI.qualityOfLife[info[#info]] end, function(info, value) E.private.L1UI.qualityOfLife[info[#info]] = value E:StaticPopup_Show('L1UI_RL') end)
	L1UI.Options.args.blizzard.args.qualityOfLife.inline = true
	L1UI.Options.args.blizzard.args.qualityOfLife.args.easyDelete = ACH:Toggle(L["Easy Delete"], L["Automatically fill out the confirmation text to delete items."], 1)
	L1UI.Options.args.blizzard.args.qualityOfLife.args.privacyOverlay = ACH:Toggle(L["Privacy Overlay"], L["Creates an overlay to hide the chat frame in the Communities Frame until you click on it."], 2)
	L1UI.Options.args.blizzard.args.strings = ACH:Group(L["Profile strings"], nil, 4, nil, nil, nil, nil, not E.Retail)
	L1UI.Options.args.blizzard.args.strings.inline = true
	L1UI.Options.args.blizzard.args.strings.args.editMode = ACH:Execute(L["Blizzard Edit Mode"], nil, 1, function() E:StaticPopup_Show('L1UI_EDITBOX', nil, nil, 'https://wago.io/LuckyoneUI-BlizzHUD') end)

	-- Auras [Buffs]
	L1UI.Options.args.auras = ACH:Group(L["Buffs and Debuffs"], nil, 4, 'tab')
	L1UI.Options.args.auras.args.header = ACH:Header(L["Buffs and Debuffs"], 1)
	L1UI.Options.args.auras.args.buffs = ACH:Group(format('|cff3296ff%s|r', L["Buffs"]), nil, 1)
	L1UI.Options.args.auras.args.buffs.args.player = ACH:Group(L["Player Frame Buffs"], nil, 1)
	L1UI.Options.args.auras.args.buffs.args.player.inline = true
	L1UI.Options.args.auras.args.buffs.args.player.args.min = ACH:Execute(L["LuckyoneUI Default"], L["Minimalistic. Only important auras."], 1, function() Private:Setup_Buffs('player', 'min') end)
	L1UI.Options.args.auras.args.buffs.args.player.args.all = ACH:Execute(L["Show All"], L["Show all auras except blacklisted."], 2, function() Private:Setup_Buffs('player', 'all') end)
	L1UI.Options.args.auras.args.buffs.args.target = ACH:Group(L["Target Frame Buffs"], nil, 2)
	L1UI.Options.args.auras.args.buffs.args.target.inline = true
	L1UI.Options.args.auras.args.buffs.args.target.args.min = ACH:Execute(L["LuckyoneUI Default"], L["Minimalistic. Only important auras."], 1, function() Private:Setup_Buffs('target', 'min') end)
	L1UI.Options.args.auras.args.buffs.args.target.args.all = ACH:Execute(L["Show All"], L["Show all auras except blacklisted."], 2, function() Private:Setup_Buffs('target', 'all') end)
	L1UI.Options.args.auras.args.buffs.args.focus = ACH:Group(L["Focus Frame Buffs"], nil, 3, nil, nil, nil, nil, E.Classic)
	L1UI.Options.args.auras.args.buffs.args.focus.inline = true
	L1UI.Options.args.auras.args.buffs.args.focus.args.min = ACH:Execute(L["LuckyoneUI Default"], L["Minimalistic. Only important auras."], 1, function() Private:Setup_Buffs('focus', 'min') end)
	L1UI.Options.args.auras.args.buffs.args.focus.args.all = ACH:Execute(L["Show All"], L["Show all auras except blacklisted."], 2, function() Private:Setup_Buffs('focus', 'all') end)
	L1UI.Options.args.auras.args.buffs.args.boss = ACH:Group(L["Boss Frame Buffs"], nil, 4, nil, nil, nil, nil, not E.Retail)
	L1UI.Options.args.auras.args.buffs.args.boss.inline = true
	L1UI.Options.args.auras.args.buffs.args.boss.args.min = ACH:Execute(L["LuckyoneUI Default"], L["Minimalistic. Only important auras."], 1, function() Private:Setup_Buffs('boss', 'min') end)
	L1UI.Options.args.auras.args.buffs.args.boss.args.all = ACH:Execute(L["Show All"], L["Show all auras except blacklisted."], 2, function() Private:Setup_Buffs('boss', 'all') end)

	-- Auras [Debuffs]
	L1UI.Options.args.auras.args.debuffs = ACH:Group(format('|cffC80000%s|r', L["Debuffs"]), nil, 2)
	L1UI.Options.args.auras.args.debuffs.args.player = ACH:Group(L["Player Frame Debuffs"], nil, 1)
	L1UI.Options.args.auras.args.debuffs.args.player.inline = true
	L1UI.Options.args.auras.args.debuffs.args.player.args.min = ACH:Execute(L["LuckyoneUI Default"], L["Minimalistic. Only important auras."], 1, function() Private:Setup_Debuffs('player', 'min') end)
	L1UI.Options.args.auras.args.debuffs.args.player.args.all = ACH:Execute(L["Show All"], L["Show all auras except blacklisted."], 2, function() Private:Setup_Debuffs('player', 'all') end)
	L1UI.Options.args.auras.args.debuffs.args.target = ACH:Group(L["Target Frame Debuffs"], nil, 2)
	L1UI.Options.args.auras.args.debuffs.args.target.inline = true
	L1UI.Options.args.auras.args.debuffs.args.target.args.min = ACH:Execute(L["LuckyoneUI Default"], L["Minimalistic. Only important auras."], 1, function() Private:Setup_Debuffs('target', 'min') end)
	L1UI.Options.args.auras.args.debuffs.args.target.args.all = ACH:Execute(L["Show All"], L["Show all auras except blacklisted."], 2, function() Private:Setup_Debuffs('target', 'all') end)
	L1UI.Options.args.auras.args.debuffs.args.focus = ACH:Group(L["Focus Frame Debuffs"], nil, 3, nil, nil, nil, nil, E.Classic)
	L1UI.Options.args.auras.args.debuffs.args.focus.inline = true
	L1UI.Options.args.auras.args.debuffs.args.focus.args.min = ACH:Execute(L["LuckyoneUI Default"], L["Minimalistic. Only important auras."], 1, function() Private:Setup_Debuffs('focus', 'min') end)
	L1UI.Options.args.auras.args.debuffs.args.focus.args.all = ACH:Execute(L["Show All"], L["Show all auras except blacklisted."], 2, function() Private:Setup_Debuffs('focus', 'all') end)
	L1UI.Options.args.auras.args.debuffs.args.boss = ACH:Group(L["Boss Frame Debuffs"], nil, 4, nil, nil, nil, nil, not E.Retail)
	L1UI.Options.args.auras.args.debuffs.args.boss.inline = true
	L1UI.Options.args.auras.args.debuffs.args.boss.args.min = ACH:Execute(L["LuckyoneUI Default"], L["Minimalistic. Only important auras."], 1, function() Private:Setup_Debuffs('boss', 'min') end)
	L1UI.Options.args.auras.args.debuffs.args.boss.args.all = ACH:Execute(L["Show All"], L["Show all auras except blacklisted."], 2, function() Private:Setup_Debuffs('boss', 'all') end)

	-- Auras [Filters]
	L1UI.Options.args.auras.args.filters = ACH:Group(L["Filters"], nil, 3)
	L1UI.Options.args.auras.args.filters.inline = true
	L1UI.Options.args.auras.args.filters.args.setup = ACH:Execute(L["Setup Aura Filters"], nil, 1, function() if E.Retail then Private:Setup_Filters_Retail() elseif E.Mists then Private:Setup_Filters_Mists() elseif E.Classic then Private:Setup_Filters_Classic() end E:StaticPopup_Show('L1UI_RL') end)
	L1UI.Options.args.auras.args.filters.args.desc = ACH:Description(L["This will apply Luckyones Aura Indicator edit and set the style to Textured.\nIt will also add custom IDs to Whitelist & Blacklist.\n"], 2, 'medium')

	-- Character specific db
	L1UI.Options.args.privateDB = ACH:Group(L["Character specific"], nil, 5)
	L1UI.Options.args.privateDB.args.header = ACH:Header(L["Character specific"], 1)
	L1UI.Options.args.privateDB.args.defaults = ACH:Group(L["Restore LuckyoneUI Defaults"], nil, 2)
	L1UI.Options.args.privateDB.args.defaults.inline = true
	L1UI.Options.args.privateDB.args.defaults.args.private = ACH:Execute(L["Restore Defaults"], nil, 1, function() Private:Setup_PrivateDB() E:UpdateMediaItems(true) end, nil, true)
	L1UI.Options.args.privateDB.args.defaultsDesc = ACH:Group(L["The following data will be updated"], nil, 3)
	L1UI.Options.args.privateDB.args.defaultsDesc.inline = true
	L1UI.Options.args.privateDB.args.defaultsDesc.args.cvars = ACH:Description('- All Fonts: Expressway\n- All Font Outlines: Outline\n- All Textures: Minimalist\n\n- Friendly Nameplate Font Sizes\n- Totem Tracker: disabled\n- Parchment Remover: enabled\n\n- (Classic Only) Make Shamans blue instead of pink\n- (Retail Only) Character specific settings for Shadow&Light and WindTools', 1, 'medium')

	-- Chat
	L1UI.Options.args.chat = ACH:Group(L["Chat"], nil, 6)
	L1UI.Options.args.chat.args.header = ACH:Header(L["Chat"], 1)
	L1UI.Options.args.chat.args.chatSetup = ACH:Group(L["Setup Chat"], nil, 2)
	L1UI.Options.args.chat.args.chatSetup.inline = true
	L1UI.Options.args.chat.args.chatSetup.args.chat = ACH:Execute(L["Setup Chat"], nil, 1, function() Private:Setup_Chat() end)
	L1UI.Options.args.chat.args.chatDesc = ACH:Group(L["Description"], nil, 3)
	L1UI.Options.args.chat.args.chatDesc.inline = true
	L1UI.Options.args.chat.args.chatDesc.args.desc = ACH:Description(L["Setup Chat will reset your chat panels to default and create custom chat tabs.\n\nLeft Chat: [ General - Log - Whisper - Guild - Party ]\n\nRight Chat: [ No Tabs - Details! Damage Meter ]"], 1, 'medium')
	L1UI.Options.args.chat.args.chatVars = ACH:Group(L["Chat CVars"], nil, 4)
	L1UI.Options.args.chat.args.chatVars.inline = true
	L1UI.Options.args.chat.args.chatVars.args.desc = ACH:Description('- chatClassColorOverride 0\n- chatMouseScroll 1\n- chatStyle classic\n- colorChatNamesByClass 1\n- whisperMode inline\n- wholeChatWindowClickable 0', 1, 'medium')

	-- CVars
	L1UI.Options.args.cvars = ACH:Group(L["Console Variables"], nil, 7)
	L1UI.Options.args.cvars.args.header = ACH:Header(L["Console Variables"], 1)
	L1UI.Options.args.cvars.args.setup = ACH:Group(L["Setup CVars"], nil, 2)
	L1UI.Options.args.cvars.args.setup.inline = true
	L1UI.Options.args.cvars.args.setup.args.generalVars = ACH:Execute(L["General CVars"], nil, 1, function() Private:Setup_CVars() end, nil, true)
	L1UI.Options.args.cvars.args.setup.args.nameplateVars = ACH:Execute(L["NamePlate CVars"], nil, 2, function() Private:NameplateCVars() end, nil, true)
	L1UI.Options.args.cvars.args.generalDesc = ACH:Group(L["General CVars"], nil, 3)
	L1UI.Options.args.cvars.args.generalDesc.inline = true
	L1UI.Options.args.cvars.args.generalDesc.args.cvars = ACH:Description('- alwaysShowActionBars 1\n- AutoPushSpellToActionBar 0\n- cameraDistanceMaxZoomFactor 2.6\n- fstack_preferParentKeys 0\n- lockActionBars 1\n- minimapTrackingShowAll 1\n- screenshotQuality 10\n- showNPETutorials 0\n- showTutorials 0\n- threatWarning 3\n- UberTooltips 1\n', 1, 'medium')
	L1UI.Options.args.cvars.args.nameplateDesc = ACH:Group(L["NamePlate CVars"], nil, 4)
	L1UI.Options.args.cvars.args.nameplateDesc.inline = true
	L1UI.Options.args.cvars.args.nameplateDesc.args.cvars = ACH:Description('- NamePlateHorizontalScale 1\n- nameplateLargerScale 1\n- nameplateLargeTopInset -1\n- nameplateMinAlpha 1\n- nameplateMinScale 1\n- nameplateMotion 1\n- nameplateOccludedAlphaMult 1\n- nameplateOtherBottomInset -1\n- nameplateOtherTopInset -1\n- nameplateOverlapH 1\n- nameplateOverlapV 2\n- nameplateSelectedScale 1\n- nameplateSelfAlpha 1\n- nameplateSelfTopInset -1\n- nameplateShowOnlyNames 1\n- NamePlateVerticalScale 1\n- UnitNameEnemyGuardianName 1\n- UnitNameEnemyMinionName 1\n- UnitNameEnemyPetName 1\n- UnitNameEnemyPlayerName 1\n', 1, 'medium')

	-- ElvUI Layouts
	L1UI.Options.args.layouts = ACH:Group('ElvUI ' .. L["Layouts"], nil, 8)
	L1UI.Options.args.layouts.args.header1 = ACH:Header(L["Layout Scale"], 1)
	L1UI.Options.args.layouts.args.scaling = ACH:Group(L["1440p = Default | 1080p = Downscaled"], nil, 2)
	L1UI.Options.args.layouts.args.scaling.inline = true
	L1UI.Options.args.layouts.args.scaling.args.native = ACH:Toggle('1440p', nil, 1, nil, nil, nil, function() return not E.global.L1UI.scaled end, function(_, value) E.global.L1UI.scaled = not value end)
	L1UI.Options.args.layouts.args.scaling.args.scaled = ACH:Toggle('1080p', nil, 2, nil, nil, nil, function() return E.global.L1UI.scaled end, function(_, value) E.global.L1UI.scaled = value end)
	L1UI.Options.args.layouts.args.header2 = ACH:Header('ElvUI ' .. L["Layouts"], 3)
	L1UI.Options.args.layouts.args.thewarwithin = ACH:Group('The War Within ' .. L["Layouts"] .. ' (v' .. tostring(Private.Version) .. ') (' .. format('|cff4beb2c%s', L["Current"]) .. ')', nil, 4)
	L1UI.Options.args.layouts.args.thewarwithin.inline = true
	L1UI.Options.args.layouts.args.thewarwithin.args.main = ACH:Execute(L["DPS & Tanks"], nil, 1, function() Private:Setup_Layout_TheWarWithin('main') E:StaticPopup_Show('L1UI_RL') end, nil, true)
	L1UI.Options.args.layouts.args.thewarwithin.args.healing = ACH:Execute(L["Healing"], nil, 2, function() Private:Setup_Layout_TheWarWithin('healing') E:StaticPopup_Show('L1UI_RL') end, nil, true)
	L1UI.Options.args.layouts.args.thewarwithin.args.support = ACH:Execute(format('|cff33937F%s', L["Augmentation"]), L["No ActionBars and centered Raid Frames"], 3, function() Private:Setup_Layout_TheWarWithin('support') E:StaticPopup_Show('L1UI_RL') end, nil, true)

	-- Graphics
	L1UI.Options.args.graphics = ACH:Group(L["Graphics"], nil, 9)
	L1UI.Options.args.graphics.args.header = ACH:Header(L["Graphics"], 1)
	L1UI.Options.args.graphics.args.toggles = ACH:Group(L["General"], nil, 2)
	L1UI.Options.args.graphics.args.toggles.inline = true
	L1UI.Options.args.graphics.args.toggles.args.ResampleAlwaysSharpen = ACH:Toggle('ResampleAlwaysSharpen', 'Game Default: off | Suggestion: on', 1, nil, nil, nil, function() return GetCVarBool('ResampleAlwaysSharpen') end, function(_, value) SetCVar('ResampleAlwaysSharpen', value and 1 or 0) end)
	L1UI.Options.args.graphics.args.toggles.args.GxAllowCachelessShaderMode = ACH:Toggle('CachelessShaderMode', 'Game Default: off | Suggestion: off', 2, nil, nil, nil, function() return GetCVarBool('GxAllowCachelessShaderMode') end, function(_, value) SetCVar('GxAllowCachelessShaderMode', value and 1 or 0) end)
	L1UI.Options.args.graphics.args.cosmetic = ACH:Group(L["Cosmetic"], nil, 3)
	L1UI.Options.args.graphics.args.cosmetic.inline = true
	L1UI.Options.args.graphics.args.cosmetic.args.ffxDeath = ACH:Toggle('ffx Death', 'Game Default: on | Suggestion: off', 1, nil, nil, nil, function() return GetCVarBool('ffxDeath') end, function(_, value) SetCVar('ffxDeath', value and 1 or 0) end)
	L1UI.Options.args.graphics.args.cosmetic.args.ffxGlow = ACH:Toggle('ffx Glow', 'Game Default: on | Suggestion: off', 2, nil, nil, nil, function() return GetCVarBool('ffxGlow') end, function(_, value) SetCVar('ffxGlow', value and 1 or 0) end)
	L1UI.Options.args.graphics.args.cosmetic.args.ffxNether = ACH:Toggle('ffx Nether', 'Game Default: on | Suggestion: off', 3, nil, nil, nil, function() return GetCVarBool('ffxNether') end, function(_, value) SetCVar('ffxNether', value and 1 or 0) end)
	L1UI.Options.args.graphics.args.cosmetic.args.ffxVenari = ACH:Toggle('ffx Venari', 'Game Default: on | Suggestion: off', 4, nil, nil, nil, function() return GetCVarBool('ffxVenari') end, function(_, value) SetCVar('ffxVenari', value and 1 or 0) end)
	L1UI.Options.args.graphics.args.cosmetic.args.ffxLingeringVenari = ACH:Toggle('ffx Lingering Venari', 'Game Default: on | Suggestion: off', 5, nil, nil, nil, function() return GetCVarBool('ffxLingeringVenari') end, function(_, value) SetCVar('ffxLingeringVenari', value and 1 or 0) end)

	-- Profiles
	L1UI.Options.args.profiles = ACH:Group(L["Profiles"], nil, 10)
	L1UI.Options.args.profiles.args.header1 = ACH:Header(L["Layout Scale"], 1)
	L1UI.Options.args.profiles.args.scaling = ACH:Group(L["1440p = Default | 1080p = Downscaled"], nil, 2)
	L1UI.Options.args.profiles.args.scaling.inline = true
	L1UI.Options.args.profiles.args.scaling.args.native = ACH:Toggle('1440p', nil, 1, nil, nil, nil, function() return not E.global.L1UI.scaled end, function(_, value) E.global.L1UI.scaled = not value end)
	L1UI.Options.args.profiles.args.scaling.args.scaled = ACH:Toggle('1080p', nil, 2, nil, nil, nil, function() return E.global.L1UI.scaled end, function(_, value) E.global.L1UI.scaled = value end)
	L1UI.Options.args.profiles.args.plugins = ACH:Group(L["ElvUI Plugins"], nil, 3)
	L1UI.Options.args.profiles.args.plugins.inline = true
	L1UI.Options.args.profiles.args.plugins.args.as = ACH:Execute('|cff16C3F2AddOn|r|cFFFFFFFFSkins|r', L["Reset to LuckyoneUI defaults."], 1, function() Private:Setup_AddOnSkins() E:StaticPopup_Show('L1UI_RL') end, nil, true)
	L1UI.Options.args.profiles.args.plugins.args.pa = ACH:Execute('|cff16C3F2Project|r|cFFFFFFFFAzilroka|r', L["Reset to LuckyoneUI defaults."], 2, function() Private:Setup_ProjectAzilroka() E:StaticPopup_Show('L1UI_RL') end, nil, true)
	L1UI.Options.args.profiles.args.plugins.args.sle = ACH:Execute('|cff9482c9Shadow & Light|r', L["Reset to LuckyoneUI defaults."], 3, function() Private:Setup_ShadowAndLight() E:StaticPopup_Show('L1UI_RL') end, nil, true, nil, nil, nil, nil, not E.Retail)
	L1UI.Options.args.profiles.args.plugins.args.wt = ACH:Execute('|cff5385edWindTools|r', L["Reset to LuckyoneUI defaults."], 4, function() Private:Setup_WindTools() E:StaticPopup_Show('L1UI_RL') end, nil, true, nil, nil, nil, nil, not E.Retail)
	L1UI.Options.args.profiles.args.nameplates = ACH:Group(L["NamePlate Profiles"], nil, 4)
	L1UI.Options.args.profiles.args.nameplates.inline = true
	L1UI.Options.args.profiles.args.nameplates.args.elvui = ACH:Execute('ElvUI', L["Reset to LuckyoneUI defaults."], 1, function() Private:Setup_NamePlates() E:StaticPopup_Show('L1UI_RL') end, nil, true)
	L1UI.Options.args.profiles.args.nameplates.args.styleFilters = ACH:Execute('ElvUI StyleFilters', L["Reset to LuckyoneUI defaults."], 2, function() Private:Setup_StyleFilters() E:StaticPopup_Show('L1UI_RL') end, nil, true)
	L1UI.Options.args.profiles.args.nameplates.args.plater = ACH:Execute('Plater', L["Reset to LuckyoneUI defaults."], 3, function() Private:Setup_Plater() E:StaticPopup_Show('L1UI_RL') end, nil, true)
	L1UI.Options.args.profiles.args.addons = ACH:Group(L["Addon Profiles"], nil, 5)
	L1UI.Options.args.profiles.args.addons.inline = true
	L1UI.Options.args.profiles.args.addons.args.details = ACH:Execute('Details', L["Reset to LuckyoneUI defaults."], 1, function() Private:Setup_Details() E:StaticPopup_Show('L1UI_RL') end, nil, true)
	L1UI.Options.args.profiles.args.addons.args.warpDeplete = ACH:Execute('WarpDeplete', L["Reset to LuckyoneUI defaults."], 2, function() Private:Setup_WarpDeplete() E:StaticPopup_Show('L1UI_RL') end, nil, true, nil, nil, nil, nil, not E.Retail)
	L1UI.Options.args.profiles.args.header2 = ACH:Header(L["Profiles for DPS & Tanks"], 6)
	L1UI.Options.args.profiles.args.addonsMain = ACH:Group(L["Addon Profiles"], nil, 7)
	L1UI.Options.args.profiles.args.addonsMain.inline = true
	L1UI.Options.args.profiles.args.addonsMain.args.bigwigs = ACH:Execute(L["BigWigs Main"], L["Reset to LuckyoneUI defaults."], 1, function() Private:Setup_BigWigs('main') end, nil, true)
	L1UI.Options.args.profiles.args.addonsMain.args.omnicd = ACH:Execute(L["OmniCD Main"], L["Reset to LuckyoneUI defaults."], 2, function() Private:Setup_OmniCD('main') E:StaticPopup_Show('L1UI_RL') end, nil, true)
	L1UI.Options.args.profiles.args.header3 = ACH:Header(L["Profiles for Healing"], 8)
	L1UI.Options.args.profiles.args.addonsHealing = ACH:Group(L["Addon Profiles"], nil, 9)
	L1UI.Options.args.profiles.args.addonsHealing.inline = true
	L1UI.Options.args.profiles.args.addonsHealing.args.bigwigs = ACH:Execute(L["BigWigs Healing"], L["Reset to LuckyoneUI defaults."], 1, function() Private:Setup_BigWigs('healing') end, nil, true)
	L1UI.Options.args.profiles.args.addonsHealing.args.omnicd = ACH:Execute(L["OmniCD Healing"], L["Reset to LuckyoneUI defaults."], 2, function() Private:Setup_OmniCD('healing') E:StaticPopup_Show('L1UI_RL') end, nil, true)

	-- Skins
	L1UI.Options.args.skins = ACH:Group('Skins', nil, 11)
	L1UI.Options.args.skins.args.header = ACH:Header('Skins', 1)
	L1UI.Options.args.skins.args.addons = ACH:Group('AddOns', nil, 2, nil, function(info) return E.private.L1UI.skins[info[#info]] end, function(info, value) E.private.L1UI.skins[info[#info]] = value E:StaticPopup_Show('L1UI_RL') end)
	L1UI.Options.args.skins.args.addons.inline = true
	L1UI.Options.args.skins.args.addons.args.BugSack = ACH:Toggle('BugSack', nil, 1, nil, nil, nil, nil, nil, not E:IsAddOnEnabled('BugSack'))
	L1UI.Options.args.skins.args.addons.args.Tabardy = ACH:Toggle('Tabardy', nil, 2, nil, nil, nil, nil, nil, not E:IsAddOnEnabled('Tabardy'))

	-- Tags
	L1UI.Options.args.tags = ACH:Group(L["Tags"], nil, 12)
	L1UI.Options.args.tags.args.header = ACH:Header(L["Tags"], 1)
	L1UI.Options.args.tags.args.spacer = ACH:Spacer(2, 'full')
	L1UI.Options.args.tags.args.shortcut = ACH:Execute(L["Available Tags"], nil, 3, function() E.Libs.AceConfigDialog:SelectGroup('ElvUI', 'tagGroup', Private.Name) end)

	-- Themes
	L1UI.Options.args.themes = ACH:Group(L["Themes"], nil, 13)
	L1UI.Options.args.themes.args.header = ACH:Header(L["Themes"], 1)
	L1UI.Options.args.themes.args.raid = ACH:Group(L["UnitFrames Color Theme"], nil, 2)
	L1UI.Options.args.themes.args.raid.inline = true
	L1UI.Options.args.themes.args.raid.args.dark = ACH:Execute(L["Dark"], L["Dark Style (Default)"], 1, function() Private:Setup_Theme('dark') end, nil, true)
	L1UI.Options.args.themes.args.raid.args.class = ACH:Execute(L["Class Color"], L["Class Color Style"], 2, function() Private:Setup_Theme('class') end, nil, true)

	-- WeakAuras Retail
	L1UI.Options.args.weakauras = ACH:Group('WeakAuras', nil, 14, nil, nil, nil, nil, not E.Retail)
	L1UI.Options.args.weakauras.args.maintained = ACH:Group(L["WeakAuras - Maintained"], nil, 1)
	L1UI.Options.args.weakauras.args.maintained.inline = true
	L1UI.Options.args.weakauras.args.maintained.args.evoker = ACH:Execute(format('|cff33937F%s|r', L["Evoker"]), nil, 1, function() Private:WeakAurasImport('evoker') end)
	L1UI.Options.args.weakauras.args.maintained.args.druid = ACH:Execute(format('|cffFF7C0A%s|r', L["Druid"]), nil, 2, function() Private:WeakAurasImport('druid') end)
	L1UI.Options.args.weakauras.args.maintained.args.spacer = ACH:Spacer(3, 'full')
	L1UI.Options.args.weakauras.args.maintained.args.auraList = ACH:Description('- |cff33937FEvoker|r: Augmentation, Devastation\n- |cffFF7C0ADruid|r: Balance', 5, 'medium')
	L1UI.Options.args.weakauras.args.edits = ACH:Group(L["WeakAuras - Edits of other packs"], nil, 2)
	L1UI.Options.args.weakauras.args.edits.inline = true
	L1UI.Options.args.weakauras.args.edits.args.importButtonRanged = ACH:Execute(L["Ranged DPS"], nil, 1, function() Private:WeakAurasImport('customEditsRanged') end)
	L1UI.Options.args.weakauras.args.edits.args.importButtonMelee = ACH:Execute(L["Melee DPS"], nil, 2, function() Private:WeakAurasImport('customEditsMelee') end)
	L1UI.Options.args.weakauras.args.edits.args.spacer = ACH:Spacer(3, 'full')
	L1UI.Options.args.weakauras.args.edits.args.importButtonTanks = ACH:Execute(L["Tanks"], nil, 4, function() Private:WeakAurasImport('customEditsTanks') end)
	L1UI.Options.args.weakauras.args.edits.args.importButtonHealers = ACH:Execute(L["Healers"], nil, 5, function() Private:WeakAurasImport('customEditsHealers') end)
	L1UI.Options.args.weakauras.args.general = ACH:Group(L["WeakAuras - General"], nil, 3)
	L1UI.Options.args.weakauras.args.general.inline = true
	L1UI.Options.args.weakauras.args.general.args.keys = ACH:Execute('!keys command', nil, 1, function() Private:WeakAurasImport('keys') end)
	L1UI.Options.args.weakauras.args.general.args.elvuiMythicVisibility = ACH:Execute('ElvUI Mythic Handler', nil, 2, function() Private:WeakAurasImport('elvuiMythicVisibility') end)
	L1UI.Options.args.weakauras.args.general.args.spacerOne = ACH:Spacer(3, 'full')
	L1UI.Options.args.weakauras.args.general.args.externals = ACH:Execute('Externals on You', nil, 4, function() Private:WeakAurasImport('externals') end)
	L1UI.Options.args.weakauras.args.general.args.groupfinderAppTextHide = ACH:Execute('Groupfinder AppText Hide', nil, 5, function() Private:WeakAurasImport('groupfinderAppTextHide') end)
	L1UI.Options.args.weakauras.args.general.args.handleFriendlyNamePlates = ACH:Execute('Handle Friendly Plates', nil, 6, function() Private:WeakAurasImport('handleFriendlyNamePlates') end)
	L1UI.Options.args.weakauras.args.general.args.spacerTwo = ACH:Spacer(7, 'full')
	L1UI.Options.args.weakauras.args.general.args.handleNamePlatesFont = ACH:Execute('Handle Plates Font ', nil, 8, function() Private:WeakAurasImport('handleNamePlatesFont') end)
	L1UI.Options.args.weakauras.args.general.args.playerFrameUtilities = ACH:Execute('Player Frame Utility', nil, 9, function() Private:WeakAurasImport('playerFrameUtilities') end)
	L1UI.Options.args.weakauras.args.general.args.trinket = ACH:Execute('Trinket Tracker', nil, 10, function() Private:WeakAurasImport('trinket') end)
	L1UI.Options.args.weakauras.args.other = ACH:Group(L["WeakAuras - Other"], nil, 4)
	L1UI.Options.args.weakauras.args.other.inline = true
	L1UI.Options.args.weakauras.args.other.args.affixes = ACH:Execute('Affixes', nil, 1, function() Private:WeakAurasImport('affixes') end)
	L1UI.Options.args.weakauras.args.other.args.dungeonCore = ACH:Execute('Season 3 Dungeon', nil, 2, function() Private:WeakAurasImport('dungeonCore') end)
	L1UI.Options.args.weakauras.args.other.args.raidCore = ACH:Execute('Season 3 Raid', nil, 2, function() Private:WeakAurasImport('raidCore') end)

	-- Credits
	L1UI.Options.args.credits = ACH:Group(format('|cfd9b9b9b%s|r', L["Credits"]), nil, 15)
	L1UI.Options.args.credits.args.header = ACH:Header(L["Credits"], 1)
	L1UI.Options.args.credits.args.author = ACH:Group(L["Author"], nil, 2)
	L1UI.Options.args.credits.args.author.inline = true
	L1UI.Options.args.credits.args.author.args.desc = ACH:Description(AUTHOR_STRING, 1, 'medium')
	L1UI.Options.args.credits.args.coding = ACH:Group(L["Coding"], nil, 3)
	L1UI.Options.args.credits.args.coding.inline = true
	L1UI.Options.args.credits.args.coding.args.desc = ACH:Description(CODING_STRING, 1, 'medium')
	L1UI.Options.args.credits.args.testers = ACH:Group(L["Testers and Translation"], nil, 4)
	L1UI.Options.args.credits.args.testers.inline = true
	L1UI.Options.args.credits.args.testers.args.desc = ACH:Description(TESTER_STRING, 1, 'medium')
	L1UI.Options.args.credits.args.supporter = ACH:Group(L["Supporters"], nil, 5)
	L1UI.Options.args.credits.args.supporter.inline = true
	L1UI.Options.args.credits.args.supporter.args.desc = ACH:Description(SUPPORT_STRING, 1, 'medium')

	-- Links
	L1UI.Options.args.links = ACH:Group(format('|cfd9b9b9b%s|r', L["Links"]), nil, 16)
	L1UI.Options.args.links.args.header = ACH:Header(L["Links"], 1)
	L1UI.Options.args.links.args.spacer = ACH:Spacer(2, 'full')
	L1UI.Options.args.links.args.website = ACH:Input(L["Addon Download:"], nil, 3, nil, 'full', function() return 'https://www.curseforge.com/wow/addons/elvui_luckyoneui' end)
	L1UI.Options.args.links.args.changelog = ACH:Input(L["Changelog:"], nil, 4, nil, 'full', function() return 'https://github.com/Luckyone961/LuckyoneUI/blob/development/CHANGELOG.md' end)
	L1UI.Options.args.links.args.discord = ACH:Input('Discord:', nil, 5, nil, 'full', function() return 'https://discord.gg/xRY4bwA' end)
	L1UI.Options.args.links.args.issues = ACH:Input(L["Report issues here:"], nil, 6, nil, 'full', function() return 'https://github.com/Luckyone961/LuckyoneUI/issues' end)
	L1UI.Options.args.links.args.guide = ACH:Input(L["Wowhead Guide:"], nil, 7, nil, 'full', function() return 'https://www.wowhead.com/guide=10680/elvui-luckyoneui-addon-plugin-guide' end)
	L1UI.Options.args.links.args.homepage = ACH:Input(L["Homepage:"], nil, 8, nil, 'full', function() return 'https://luckyone.dev' end)

	-- Developer config
	L1UI.Options.args.dev = ACH:Group(format('|cff4beb2c%s|r', 'Developer'), nil, 17)
	L1UI.Options.args.dev.args.header1 = ACH:Header('Developer', 1)
	L1UI.Options.args.dev.args.spacer1 = ACH:Spacer(2, 'full')
	L1UI.Options.args.dev.args.toggles = ACH:Group('Toggles', nil, 3)
	L1UI.Options.args.dev.args.toggles.inline = true
	L1UI.Options.args.dev.args.toggles.args.dev = ACH:Toggle('Developer Mode', 'Enable this toggle to apply Luckyone\'s personal adjustments during the installation process.\n\nAdditional information section will show up at the bottom of the config after ReloadUI.\n\n|cffC80000There is no support for this.\n\nUse at own risk.|r', 1, nil, nil, nil, function() return E.global.L1UI.dev end, function(_, value) E.global.L1UI.dev = value end)
	L1UI.Options.args.dev.args.spacer2 = ACH:Spacer(4, 'full')
	L1UI.Options.args.dev.args.information = ACH:Group('Information', nil, 5)
	L1UI.Options.args.dev.args.information.inline = true
	L1UI.Options.args.dev.args.information.args.desc = ACH:Description('While this developer mode is enabled, the following will change:\n\n- Profiles created by the installer will no longer add the version suffix to the profile name.\n- Profile installer make additional database adjustments as listed below.', 1, 'medium')
	L1UI.Options.args.dev.args.spacer3 = ACH:Spacer(6, 'full')
	L1UI.Options.args.dev.args.db = ACH:Group('Developer Mode Changes', nil, 7)
	L1UI.Options.args.dev.args.db.inline = true
	L1UI.Options.args.dev.args.db.args.desc = ACH:Description('- ElvUI chat bubble skinning disabled (To use texture replacements)\n- ElvUI bags module disabled (To use Baganator)\n- LuckyoneUI Alert Frame hider enabled\n- LuckyoneUI Boss Banner hider enabled\n- LuckyoneUI Easy Delete enabled\n- LuckyoneUI Privacy Overlay enabled', 1, 'medium')
	L1UI.Options.args.dev.args.header2 = ACH:Header(format('|cffC80000%s|r','Luckys Private Section'), 8)
	L1UI.Options.args.dev.args.spacer4 = ACH:Spacer(9, 'full')
	L1UI.Options.args.dev.args.privateInfo = ACH:Group('Important information', nil, 10)
	L1UI.Options.args.dev.args.privateInfo.inline = true
	L1UI.Options.args.dev.args.privateInfo.args.desc = ACH:Description('This is a private button of the config, it is not meant for public use.\nYou should not touch it.\nIf you do make sure to use /console cvar_default before you click it.\nKeep in mind there is no support.', 1, 'medium')
	L1UI.Options.args.dev.args.spacer5 = ACH:Spacer(11, 'full')
	L1UI.Options.args.dev.args.privateFunc = ACH:Execute('Sync Game Settings', 'Clicking this button will reset every single option in your game (Pretty much everything you can see in ESC > Options) and replace it with a copy of Luckys settings. |cffC80000Think twice about it, there is no going back. This is meant only for myself.|r', 12, function() Private:SyncSettings() end, nil, true)

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
