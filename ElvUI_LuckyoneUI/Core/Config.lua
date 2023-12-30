local Name, Private = ...
local E, L, V, P, G = unpack(ElvUI)
local D = E:GetModule('Distributor')
local PI = E:GetModule('PluginInstaller')

local ACH

local pairs, sort = pairs, sort
local format, tonumber, tostring = format, tonumber, tostring
local tconcat, tinsert = table.concat, table.insert

local GetCVar, GetCVarBool = GetCVar, GetCVarBool
local SetCVar = SetCVar

local AUTHOR = { '|cffFF7D0ALuckyone|r (EU) - LaughingSkull', '|cff33937FLucky|r (EU) - LaughingSkull' }
local CODING = { '|cff0070DEAzilroka|r', '|cFF8866ccSimpy|r', '|cffF58CBARepooc|r', '|cffFF7D0AMerathilis|r' }
local SUPPORT = { '|cffe6cc80Calmcacil|r', '|cffe6cc80DaPaKnat|r', '|cffe6cc80Debeleus|r', '|cffe6cc80DevinDog|r', '|cffe6cc80Dukes|r', '|cffe6cc80Fooseq|r', '|cffe6cc80Garbar|r', '|cffe6cc80Kenneth|r', '|cffe6cc80Liam|r', '|cffe6cc80Littlesack|r', '|cffe6cc80Lox|r', '|cffe6cc80Midnatt|r', '|cffe6cc80MonkeyHack|r', '|cffe6cc80Onlyne|r', '|cffe6cc80ShowNoMercy|r', '|cffe6cc80Treelyté|r', '|cffe6cc80Triplebeamdreams|r', '|cffe6cc80Tykk|r', '|cffe6cc80Logan|r' }
local TESTERS = { '|cff00FF96AltBridge|r', '|cff69CCF0Sniefer|r', '|cffABD473Badbrain|r', '|cffABD473Xyf|r', '|cffC41F3BKringel|r', '|cffF58CBAIllusion|r', '|cffABD473Dlarge|r', '|cffe6cc80Hollicsh|r', '|cff3FC7EBEltreum|r' }

local function CheckRaid()
	if tonumber(GetCVar('RAIDsettingsEnabled')) == 0 then
		return true
	end
end

local function SortList(a, b)
	return E:StripString(a) < E:StripString(b)
end

sort(CODING, SortList)
sort(SUPPORT, SortList)
sort(TESTERS, SortList)

for _, name in pairs(AUTHOR) do
	tinsert(Private.Credits, name)
end
Private.AUTHOR_STRING = tconcat(AUTHOR, '|n')

for _, name in pairs(CODING) do
	tinsert(Private.Credits, name)
end
Private.CODING_STRING = tconcat(CODING, '|n')

for _, name in pairs(TESTERS) do
	tinsert(Private.Credits, name)
end
Private.TESTER_STRING = tconcat(TESTERS, '|n')

for _, name in pairs(SUPPORT) do
	tinsert(Private.Credits, name)
end
Private.SUPPORT_STRING = tconcat(SUPPORT, '|n')

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
	L1UI.Options.args.setup = ACH:Group('', nil, 1, nil, function(info) return E.db.L1UI.general[info[#info]] end, function(info, value) E.db.L1UI.general[info[#info]] = value end)
	L1UI.Options.args.setup.inline = true
	L1UI.Options.args.setup.args.auto_update = ACH:Toggle(L["Auto Update"], L["Automatically update after a new release."], 1)
	L1UI.Options.args.setup.args.installer = ACH:Execute(L["Install"], L["Re-Run the installation process."], 2, function() PI:Queue(L1UI.InstallerData) E:ToggleOptions() end)
	L1UI.Options.args.setup.args.updateMain = ACH:Execute(L["Update Main Layout"], L["Update Main layout to LuckyoneUI version: "]..Private.Version, 3, function() L1UI:UpdateLayout('main') end, nil, true)
	L1UI.Options.args.setup.args.updateHealing = ACH:Execute(L["Update Healing Layout"], L["Update Healing layout to LuckyoneUI version: "]..Private.Version, 4, function() L1UI:UpdateLayout('healing') end, nil, true)

	-- Spacer
	L1UI.Options.args.header = ACH:Spacer(2, 'full')

	-- Auras [Buffs]
	L1UI.Options.args.auras = ACH:Group(L["Auras"], nil, 3, 'tab')
	L1UI.Options.args.auras.args.desc = ACH:Header(L["Auras"], 1)
	L1UI.Options.args.auras.args.buffs = ACH:Group(format('|cff3296ff%s|r', L["Buffs"]), nil, 2)
	L1UI.Options.args.auras.args.buffs.args.player = ACH:Group(L["Player Frame Buffs"], nil, 1)
	L1UI.Options.args.auras.args.buffs.args.player.inline = true
	L1UI.Options.args.auras.args.buffs.args.player.args.min = ACH:Execute(L["Minimalistic"], L["Minimalistic. Only important auras."], 1, function() L1UI:Setup_Buffs('player', 'min') end)
	L1UI.Options.args.auras.args.buffs.args.player.args.all = ACH:Execute(L["Show All"], L["Show all auras except blacklisted."], 2, function() L1UI:Setup_Buffs('player', 'all') end)
	L1UI.Options.args.auras.args.buffs.args.target = ACH:Group(L["Target Frame Buffs"], nil, 2)
	L1UI.Options.args.auras.args.buffs.args.target.inline = true
	L1UI.Options.args.auras.args.buffs.args.target.args.min = ACH:Execute(L["Minimalistic"], L["Minimalistic. Only important auras."], 1, function() L1UI:Setup_Buffs('target', 'min') end)
	L1UI.Options.args.auras.args.buffs.args.target.args.all = ACH:Execute(L["Show All"], L["Show all auras except blacklisted."], 2, function() L1UI:Setup_Buffs('target', 'all') end)
	L1UI.Options.args.auras.args.buffs.args.focus = ACH:Group(L["Focus Frame Buffs"], nil, 3, nil, nil, nil, nil, E.Classic)
	L1UI.Options.args.auras.args.buffs.args.focus.inline = true
	L1UI.Options.args.auras.args.buffs.args.focus.args.min = ACH:Execute(L["Minimalistic"], L["Minimalistic. Only important auras."], 1, function() L1UI:Setup_Buffs('focus', 'min') end)
	L1UI.Options.args.auras.args.buffs.args.focus.args.all = ACH:Execute(L["Show All"], L["Show all auras except blacklisted."], 2, function() L1UI:Setup_Buffs('focus', 'all') end)
	L1UI.Options.args.auras.args.buffs.args.boss = ACH:Group(L["Boss Frame Buffs"], nil, 4, nil, nil, nil, nil, not E.Retail)
	L1UI.Options.args.auras.args.buffs.args.boss.inline = true
	L1UI.Options.args.auras.args.buffs.args.boss.args.min = ACH:Execute(L["Minimalistic"], L["Minimalistic. Only important auras."], 1, function() L1UI:Setup_Buffs('boss', 'min') end)
	L1UI.Options.args.auras.args.buffs.args.boss.args.all = ACH:Execute(L["Show All"], L["Show all auras except blacklisted."], 2, function() L1UI:Setup_Buffs('boss', 'all') end)

	-- Auras [Debuffs]
	L1UI.Options.args.auras.args.debuffs = ACH:Group(format('|cffC80000%s|r', L["Debuffs"]), nil, 3)
	L1UI.Options.args.auras.args.debuffs.args.player = ACH:Group(L["Player Frame Debuffs"], nil, 1)
	L1UI.Options.args.auras.args.debuffs.args.player.inline = true
	L1UI.Options.args.auras.args.debuffs.args.player.args.min = ACH:Execute(L["Minimalistic"], L["Minimalistic. Only important auras."], 1, function() L1UI:Setup_Debuffs('player', 'min') end)
	L1UI.Options.args.auras.args.debuffs.args.player.args.all = ACH:Execute(L["Show All"], L["Show all auras except blacklisted."], 2, function() L1UI:Setup_Debuffs('player', 'all') end)
	L1UI.Options.args.auras.args.debuffs.args.target = ACH:Group(L["Target Frame Debuffs"], nil, 2)
	L1UI.Options.args.auras.args.debuffs.args.target.inline = true
	L1UI.Options.args.auras.args.debuffs.args.target.args.min = ACH:Execute(L["Minimalistic"], L["Minimalistic. Only important auras."], 1, function() L1UI:Setup_Debuffs('target', 'min') end)
	L1UI.Options.args.auras.args.debuffs.args.target.args.all = ACH:Execute(L["Show All"], L["Show all auras except blacklisted."], 2, function() L1UI:Setup_Debuffs('target', 'all') end)
	L1UI.Options.args.auras.args.debuffs.args.focus = ACH:Group(L["Focus Frame Debuffs"], nil, 3, nil, nil, nil, nil, E.Classic)
	L1UI.Options.args.auras.args.debuffs.args.focus.inline = true
	L1UI.Options.args.auras.args.debuffs.args.focus.args.min = ACH:Execute(L["Minimalistic"], L["Minimalistic. Only important auras."], 1, function() L1UI:Setup_Debuffs('focus', 'min') end)
	L1UI.Options.args.auras.args.debuffs.args.focus.args.all = ACH:Execute(L["Show All"], L["Show all auras except blacklisted."], 2, function() L1UI:Setup_Debuffs('focus', 'all') end)
	L1UI.Options.args.auras.args.debuffs.args.boss = ACH:Group(L["Boss Frame Debuffs"], nil, 4, nil, nil, nil, nil, not E.Retail)
	L1UI.Options.args.auras.args.debuffs.args.boss.inline = true
	L1UI.Options.args.auras.args.debuffs.args.boss.args.min = ACH:Execute(L["Minimalistic"], L["Minimalistic. Only important auras."], 1, function() L1UI:Setup_Debuffs('boss', 'min') end)
	L1UI.Options.args.auras.args.debuffs.args.boss.args.all = ACH:Execute(L["Show All"], L["Show all auras except blacklisted."], 2, function() L1UI:Setup_Debuffs('boss', 'all') end)

	-- Blizzard
	L1UI.Options.args.blizzard = ACH:Group(L["Blizzard"], nil, 4)
	L1UI.Options.args.blizzard.args.desc = ACH:Header(L["Blizzard"], 1)
	L1UI.Options.args.blizzard.args.disabledFrames = ACH:Group(L["Hide Blizzard Frames"], nil, 2, nil, function(info) return E.private.L1UI.disabledFrames[info[#info]] end, function(info, value) E.private.L1UI.disabledFrames[info[#info]] = value E:StaticPopup_Show('L1UI_RL') end)
	L1UI.Options.args.blizzard.args.disabledFrames.inline = true
	L1UI.Options.args.blizzard.args.disabledFrames.args.AlertFrame = ACH:Toggle(L["Alert Frame"], L["Hide the Loot/Alert Frame"], 1)
	L1UI.Options.args.blizzard.args.disabledFrames.args.BossBanner = ACH:Toggle(L["Boss Banner"], L["Hide the Boss Banner"], 2, nil, nil, nil, nil, nil, nil, not E.Retail)
	L1UI.Options.args.blizzard.args.disabledFrames.args.ZoneTextFrame = ACH:Toggle(L["Zone Text"], L["Hide the Zone Text"], 3)
	L1UI.Options.args.blizzard.args.qualityOfLife = ACH:Group(L["Quality of Life"], nil, 3, nil, function(info) return E.private.L1UI.qualityOfLife[info[#info]] end, function(info, value) E.private.L1UI.qualityOfLife[info[#info]] = value E:StaticPopup_Show('L1UI_RL') end)
	L1UI.Options.args.blizzard.args.qualityOfLife.inline = true
	L1UI.Options.args.blizzard.args.qualityOfLife.args.easyDelete = ACH:Toggle(L["Easy Delete"], L["Automatically fill out the confirmation text to delete items."], 1)
	L1UI.Options.args.blizzard.args.strings = ACH:Group(L["Strings"], nil, 4, nil, nil, nil, nil, not E.Retail)
	L1UI.Options.args.blizzard.args.strings.inline = true
	L1UI.Options.args.blizzard.args.strings.args.editMode = ACH:Execute(L["Blizzard Edit Mode"], nil, 1, function() E:StaticPopup_Show('L1UI_EDITBOX', nil, nil, 'https://wago.io/LuckyoneUI-BlizzHUD') end)

	-- Chat
	L1UI.Options.args.chat = ACH:Group(L["Chat"], nil, 5)
	L1UI.Options.args.chat.args.desc = ACH:Header(L["Chat"], 1)
	L1UI.Options.args.chat.args.chatSetup = ACH:Group(L["Setup Chat"], nil, 2)
	L1UI.Options.args.chat.args.chatSetup.inline = true
	L1UI.Options.args.chat.args.chatSetup.args.chat = ACH:Execute(L["Setup Chat"], nil, 1, function() L1UI:Setup_Chat() end)
	L1UI.Options.args.chat.args.chatDesc = ACH:Group(L["Description"], nil, 3)
	L1UI.Options.args.chat.args.chatDesc.inline = true
	L1UI.Options.args.chat.args.chatDesc.args.desc = ACH:Description(L["Setup Chat will reset your chat panels to default and create custom chat tabs.\n\nLeft Chat: [ General - Log - Whisper - Guild - Party ]\n\nRight Chat: [ No Tabs - Details! Damage Meter ]"], 1, 'medium')
	L1UI.Options.args.chat.args.chatVars = ACH:Group(L["Chat CVars"], nil, 4)
	L1UI.Options.args.chat.args.chatVars.inline = true
	L1UI.Options.args.chat.args.chatVars.args.desc = ACH:Description('- chatClassColorOverride 0\n- chatMouseScroll 1\n- chatStyle classic\n- colorChatNamesByClass 1\n- whisperMode inline\n- wholeChatWindowClickable 0', 1, 'medium')

	-- CVars
	L1UI.Options.args.cvars = ACH:Group(L["Console Variables"], nil, 6)
	L1UI.Options.args.cvars.args.desc = ACH:Header(L["Console Variables"], 1)
	L1UI.Options.args.cvars.args.setup = ACH:Group(L["Setup CVars"], nil, 2)
	L1UI.Options.args.cvars.args.setup.inline = true
	L1UI.Options.args.cvars.args.setup.args.generalVars = ACH:Execute(L["General CVars"], nil, 1, function() L1UI:Setup_CVars() end, nil, true)
	L1UI.Options.args.cvars.args.setup.args.nameplateVars = ACH:Execute(L["NamePlate CVars"], nil, 2, function() L1UI:NameplateCVars() end, nil, true)
	L1UI.Options.args.cvars.args.generalDesc = ACH:Group(L["General CVars"], nil, 3)
	L1UI.Options.args.cvars.args.generalDesc.inline = true
	L1UI.Options.args.cvars.args.generalDesc.args.cvars = ACH:Description('- advancedCombatLogging 1\n- alwaysShowActionBars 1\n- autoLootDefault 1\n- AutoPushSpellToActionBar 0\n- cameraDistanceMaxZoomFactor 2.6\n- ffxDeath 0\n- ffxGlow 0\n- ffxNether 0\n- fstack_preferParentKeys 0\n- lockActionBars 1\n- nameplateShowOnlyNames 1\n- profanityFilter 0\n- rawMouseEnable 1\n- screenshotQuality 10\n- showNPETutorials 0\n- showTutorials 0\n- threatWarning 3\n- UberTooltips 1', 1, 'medium')
	L1UI.Options.args.cvars.args.nameplateDesc = ACH:Group(L["NamePlate CVars"], nil, 4)
	L1UI.Options.args.cvars.args.nameplateDesc.inline = true
	L1UI.Options.args.cvars.args.nameplateDesc.args.cvars = ACH:Description('- NamePlateHorizontalScale 1\n- nameplateLargerScale 1\n- nameplateLargeTopInset -1\n- nameplateMinAlpha 1\n- nameplateMinScale 1\n- nameplateMotion 1\n- nameplateOccludedAlphaMult 1\n- nameplateOtherBottomInset -1\n- nameplateOtherTopInset -1\n- nameplateOverlapH 1\n- nameplateOverlapV 1.6\n- nameplateSelectedScale 1\n- nameplateSelfAlpha 1\n- nameplateSelfTopInset -1\n- NamePlateVerticalScale 1\n\n- UnitNameEnemyGuardianName 1\n- UnitNameEnemyMinionName 1\n- UnitNameEnemyPetName 1\n- UnitNameEnemyPlayerName 1', 1, 'medium')

	-- Graphics
	L1UI.Options.args.graphics = ACH:Group(L["Graphics"], nil, 7, nil, nil, nil, nil, not E.Retail)
	L1UI.Options.args.graphics.args.desc = ACH:Header(L["Graphics"], 1)
	L1UI.Options.args.graphics.args.enableRaid = ACH:Toggle(L["Enable Raid Graphics profile"], nil, 2, nil, nil, nil, function() return GetCVarBool('RAIDsettingsEnabled') end, function(_, value) SetCVar('RAIDsettingsEnabled', value and 1 or 0) end)
	L1UI.Options.args.graphics.args.toggles = ACH:Group(L["General"], nil, 3)
	L1UI.Options.args.graphics.args.toggles.inline = true
	L1UI.Options.args.graphics.args.toggles.args.ResampleAlwaysSharpen = ACH:Toggle('ResampleAlwaysSharpen', 'Default: off | Suggestion: on', 1, nil, nil, nil, function() return GetCVarBool('ResampleAlwaysSharpen') end, function(_, value) SetCVar('ResampleAlwaysSharpen', value and 1 or 0) end)
	L1UI.Options.args.graphics.args.toggles.args.GxAllowCachelessShaderMode = ACH:Toggle('CachelessShaderMode', 'Default: off | Suggestion: off', 2, nil, nil, nil, function() return GetCVarBool('GxAllowCachelessShaderMode') end, function(_, value) SetCVar('GxAllowCachelessShaderMode', value and 1 or 0) end)
	L1UI.Options.args.graphics.args.sliders = ACH:Group(L["Raids / Battlegrounds / Dungeons"], nil, 4)
	L1UI.Options.args.graphics.args.sliders.inline = true
	L1UI.Options.args.graphics.args.sliders.args.raidGraphicsSpellDensity = ACH:Range('Spell Density', 'Default: 4 | Suggestion: 0', 1, { min = 0, max = 5, step = 1 }, nil, function() return tonumber(GetCVar('raidGraphicsSpellDensity')) end, function(_, value) SetCVar('raidGraphicsSpellDensity', value) end, CheckRaid)
	L1UI.Options.args.graphics.args.sliders.args.raidGraphicsComputeEffects = ACH:Range('Compute Effects', 'Default: 2 | Suggestion: 0', 2, { min = 0, max = 4, step = 1 }, nil, function() return tonumber(GetCVar('raidGraphicsComputeEffects')) end, function(_, value) SetCVar('raidGraphicsComputeEffects', value) end, CheckRaid)
	L1UI.Options.args.graphics.args.sliders.args.raidGraphicsSSAO = ACH:Range('SSAO', 'Default: 3 | Suggestion: 0', 3, { min = 0, max = 4, step = 1 }, nil, function() return tonumber(GetCVar('raidGraphicsSSAO')) end, function(_, value) SetCVar('raidGraphicsSSAO', value) end, CheckRaid)
	L1UI.Options.args.graphics.args.sliders.args.raidGraphicsEnvironmentDetail = ACH:Range('Environment Detail', 'Default: 5 | Suggestion: 0', 4, { min = 0, max = 9, step = 1 }, nil, function() return tonumber(GetCVar('raidGraphicsEnvironmentDetail')) end, function(_, value) SetCVar('raidGraphicsEnvironmentDetail', value) end, CheckRaid)
	L1UI.Options.args.graphics.args.sliders.args.raidGraphicsGroundClutter = ACH:Range('Ground Clutter', 'Default: 5 | Suggestion: 0', 5, { min = 0, max = 9, step = 1 }, nil, function() return tonumber(GetCVar('raidGraphicsGroundClutter')) end, function(_, value) SetCVar('raidGraphicsGroundClutter', value) end, CheckRaid)
	L1UI.Options.args.graphics.args.sliders.args.raidGraphicsViewDistance = ACH:Range('View Distance', 'Default: 5 | Suggestion: 0', 6, { min = 0, max = 9, step = 1 }, nil, function() return tonumber(GetCVar('raidGraphicsViewDistance')) end, function(_, value) SetCVar('raidGraphicsViewDistance', value) end, CheckRaid)
	L1UI.Options.args.graphics.args.sliders.args.RAIDweatherDensity = ACH:Range('Weather Density', 'Default: 2 | Suggestion: 0', 99, { min = 0, max = 2, step = 1 }, nil, function() return tonumber(GetCVar('RAIDweatherDensity')) end, function(_, value) SetCVar('RAIDweatherDensity', value) end)
	L1UI.Options.args.graphics.args.cosmetic = ACH:Group(L["Cosmetic"], nil, 5)
	L1UI.Options.args.graphics.args.cosmetic.inline = true
	L1UI.Options.args.graphics.args.cosmetic.args.ffxDeath = ACH:Toggle('ffx Death', 'Default: on | Suggestion: off', 1, nil, nil, nil, function() return GetCVarBool('ffxDeath') end, function(_, value) SetCVar('ffxDeath', value and 1 or 0) end)
	L1UI.Options.args.graphics.args.cosmetic.args.ffxGlow = ACH:Toggle('ffx Glow', 'Default: on | Suggestion: off', 2, nil, nil, nil, function() return GetCVarBool('ffxGlow') end, function(_, value) SetCVar('ffxGlow', value and 1 or 0) end)
	L1UI.Options.args.graphics.args.cosmetic.args.ffxNether = ACH:Toggle('ffx Nether', 'Default: on | Suggestion: off', 3, nil, nil, nil, function() return GetCVarBool('ffxNether') end, function(_, value) SetCVar('ffxNether', value and 1 or 0) end)
	L1UI.Options.args.graphics.args.cosmetic.args.raidGraphicsOutlineMode = ACH:Range('Outline Mode (Raid)', 'Default: 1 | Suggestion: 2', 4, { min = 0, max = 2, step = 1 }, nil, function() return tonumber(GetCVar('raidGraphicsOutlineMode')) end, function(_, value) SetCVar('raidGraphicsOutlineMode', value) end, CheckRaid)
	L1UI.Options.args.graphics.args.gx = ACH:Group(L["Restart Graphics Engine"], nil, 6)
	L1UI.Options.args.graphics.args.gx.inline = true
	L1UI.Options.args.graphics.args.gx.args.gxRestart = ACH:Execute(format('|cff3296ff%s|r', L["Restart Graphics Engine"]), nil, 1, function() RestartGx() end, nil, true)
	L1UI.Options.args.graphics.args.gx.args.desc = ACH:Description(L["This will restart your Games Graphics Engine and is only required,\nif you've touched the CachelessShaderMode option above."], 2, 'medium')

	-- Layouts
	L1UI.Options.args.layouts = ACH:Group(L["Layouts"], nil, 8)
	L1UI.Options.args.layouts.args.desc = ACH:Header(L["Layouts"], 1)
	L1UI.Options.args.layouts.args.dragonflight = ACH:Group(L["Dragonflight Layouts"] .. ' (v' .. tostring(Private.Version) .. ') (' .. format('|cff4beb2c%s', L["Current"]) .. ')', nil, 2)
	L1UI.Options.args.layouts.args.dragonflight.inline = true
	L1UI.Options.args.layouts.args.dragonflight.args.main = ACH:Execute(L["DPS & Tanks"], nil, 1, function() L1UI:Setup_Layout_Dragonflight('main') E:StaticPopup_Show('L1UI_RL') end, nil, true)
	L1UI.Options.args.layouts.args.dragonflight.args.healing = ACH:Execute(L["Healing"], nil, 2, function() L1UI:Setup_Layout_Dragonflight('healing') E:StaticPopup_Show('L1UI_RL') end, nil, true)
	L1UI.Options.args.layouts.args.dragonflight.args.support = ACH:Execute(L["Support"], nil, 3, function() L1UI:Setup_Layout_Dragonflight('support') E:StaticPopup_Show('L1UI_RL') end, nil, true)
	L1UI.Options.args.layouts.args.shadowlands = ACH:Group(L["Shadowlands Layouts"] .. ' (' .. 'v1.00' .. ') (' .. format('|cffC80000%s', L["Outdated"]) .. ')', nil, 3)
	L1UI.Options.args.layouts.args.shadowlands.inline = true
	L1UI.Options.args.layouts.args.shadowlands.args.main = ACH:Execute(L["DPS & Tanks"], nil, 1, function() L1UI:Setup_Layout_Shadowlands('main') E:StaticPopup_Show('L1UI_RL') end, nil, true)
	L1UI.Options.args.layouts.args.shadowlands.args.healing = ACH:Execute(L["Healing"], nil, 2, function() L1UI:Setup_Layout_Shadowlands('healing') E:StaticPopup_Show('L1UI_RL') end, nil, true)

	-- Media
	L1UI.Options.args.media = ACH:Group(L["Media"], nil, 9)
	L1UI.Options.args.media.args.header = ACH:Header(L["Media"], 1)
	L1UI.Options.args.media.args.defaults = ACH:Group(L["Fonts and Textures"], nil, 2)
	L1UI.Options.args.media.args.defaults.inline = true
	L1UI.Options.args.media.args.defaults.args.private = ACH:Execute(L["Reset Media"], L["Reset Fonts, Textures, Skins to LuckyoneUI defaults."], 1, function() L1UI:Setup_PrivateDB() E:UpdateMediaItems(true) end, nil, true)
	L1UI.Options.args.media.args.defaultsDesc = ACH:Group(L["Fonts and Textures"], nil, 3)
	L1UI.Options.args.media.args.defaultsDesc.inline = true
	L1UI.Options.args.media.args.defaultsDesc.args.cvars = ACH:Description('- Expressway\n- Outline\n- Minimalist', 1, 'medium')

	-- Performance
	L1UI.Options.args.performance = ACH:Group(L["Performance"], nil, 10, nil, nil, nil, nil, not E.Retail)
	L1UI.Options.args.performance.args.desc = ACH:Header(L["Performance"], 1)
	L1UI.Options.args.performance.args.elvui = ACH:Group('ElvUI', nil, 2)
	L1UI.Options.args.performance.args.elvui.inline = true
	L1UI.Options.args.performance.args.elvui.args.chat = ACH:Execute(L["Clear Chat History"], nil, 1, function() L1UI:Cleanup_Cache('elvui', 'chat') end)
	L1UI.Options.args.performance.args.elvui.args.edit = ACH:Execute(L["Clear Editbox History"], nil, 2, function() L1UI:Cleanup_Cache('elvui', 'editbox') end)
	L1UI.Options.args.performance.args.details = ACH:Group('Details', nil, 3)
	L1UI.Options.args.performance.args.details.inline = true
	L1UI.Options.args.performance.args.details.args.cache = ACH:Execute(L["Clear Cache"], nil, 1, function() L1UI:Cleanup_Cache('details') end)
	L1UI.Options.args.performance.args.plater = ACH:Group('Plater', nil, 4)
	L1UI.Options.args.performance.args.plater.inline = true
	L1UI.Options.args.performance.args.plater.args.cache = ACH:Execute(L["Clear Cache"], nil, 1, function() L1UI:Cleanup_Cache('plater') end)
	L1UI.Options.args.performance.args.rcLoot = ACH:Group('RCLootCouncil', nil, 5)
	L1UI.Options.args.performance.args.rcLoot.inline = true
	L1UI.Options.args.performance.args.rcLoot.args.cache = ACH:Execute(L["Clear Cache"], nil, 1, function() L1UI:Cleanup_Cache('rc') end)
	L1UI.Options.args.performance.args.mrt = ACH:Group('Method Raid Tools', nil, 6)
	L1UI.Options.args.performance.args.mrt.inline = true
	L1UI.Options.args.performance.args.mrt.args.cache = ACH:Execute(L["Clear Cache"], nil, 1, function() L1UI:Cleanup_Cache('mrt') end)
	L1UI.Options.args.performance.args.descAll = ACH:Header('', 7)
	L1UI.Options.args.performance.args.all = ACH:Group(L["Clear Cache for all AddOns listed above"], nil, 8)
	L1UI.Options.args.performance.args.all.inline = true
	L1UI.Options.args.performance.args.all.args.cache = ACH:Execute(format('|cff3296ff%s|r', L["Clear All"]), nil, 1, function() L1UI:Cleanup_Cache('details') L1UI:Cleanup_Cache('plater') L1UI:Cleanup_Cache('rc') L1UI:Cleanup_Cache('mrt') E:StaticPopup_Show('L1UI_RL') end)

	-- Profiles
	L1UI.Options.args.profiles = ACH:Group(L["Profiles"], nil, 11)
	L1UI.Options.args.profiles.args.header1 = ACH:Header(L["Profiles"], 1)
	L1UI.Options.args.profiles.args.plugins = ACH:Group(L["ElvUI Plugins"], nil, 2)
	L1UI.Options.args.profiles.args.plugins.inline = true
	L1UI.Options.args.profiles.args.plugins.args.as = ACH:Execute('|cff16C3F2AddOn|r|cFFFFFFFFSkins|r', L["Reset to LuckyoneUI defaults."], 1, function() L1UI:Setup_AddOnSkins() E:StaticPopup_Show('L1UI_RL') end, nil, true)
	L1UI.Options.args.profiles.args.plugins.args.pa = ACH:Execute('|cff16C3F2Project|r|cFFFFFFFFAzilroka|r', L["Reset to LuckyoneUI defaults."], 2, function() L1UI:Setup_ProjectAzilroka() E:StaticPopup_Show('L1UI_RL') end, nil, true)
	L1UI.Options.args.profiles.args.plugins.args.sle = ACH:Execute('|cff9482c9Shadow & Light|r', L["Reset to LuckyoneUI defaults."], 3, function() L1UI:Setup_ShadowAndLight() E:StaticPopup_Show('L1UI_RL') end, nil, true, nil, nil, nil, nil, not E.Retail)
	L1UI.Options.args.profiles.args.plugins.args.wt = ACH:Execute('|cff5385edWindTools|r', L["Reset to LuckyoneUI defaults."], 4, function() L1UI:Setup_WindTools() E:StaticPopup_Show('L1UI_RL') end, nil, true, nil, nil, nil, nil, not E.Retail)
	L1UI.Options.args.profiles.args.nameplates = ACH:Group(L["NamePlate Profiles"], nil, 3)
	L1UI.Options.args.profiles.args.nameplates.inline = true
	L1UI.Options.args.profiles.args.nameplates.args.plater = ACH:Execute('Plater', L["Reset to LuckyoneUI defaults."], 1, function() E:StaticPopup_Show('L1UI_EDITBOX', nil, nil, 'https://wago.io/LuckyoneUI-Plater') end)
	L1UI.Options.args.profiles.args.nameplates.args.elvui = ACH:Execute('ElvUI', L["Reset to LuckyoneUI defaults."], 2, function() L1UI:Setup_NamePlates() E:StaticPopup_Show('L1UI_RL') end, nil, true)
	L1UI.Options.args.profiles.args.nameplates.args.styleFilters = ACH:Execute('ElvUI StyleFilters', L["Reset to LuckyoneUI defaults."], 3, function() L1UI:Setup_StyleFilters() E:StaticPopup_Show('L1UI_RL') end, nil, true)
	L1UI.Options.args.profiles.args.addons = ACH:Group(L["Addon Profiles"], nil, 4)
	L1UI.Options.args.profiles.args.addons.inline = true
	L1UI.Options.args.profiles.args.addons.args.details = ACH:Execute('Details', L["Reset to LuckyoneUI defaults."], 1, function() L1UI:Setup_Details() E:StaticPopup_Show('L1UI_RL') end, nil, true)
	L1UI.Options.args.profiles.args.addons.args.warpDeplete = ACH:Execute('WarpDeplete', L["Reset to LuckyoneUI defaults."], 2, function() L1UI:Setup_WarpDeplete() E:StaticPopup_Show('L1UI_RL') end, nil, true, nil, nil, nil, nil, not E.Retail)
	L1UI.Options.args.profiles.args.header2 = ACH:Header(L["Profiles for DPS & Tanks"], 5)
	L1UI.Options.args.profiles.args.bossmods = ACH:Group(L["BossMods Profiles"], nil, 6)
	L1UI.Options.args.profiles.args.bossmods.inline = true
	L1UI.Options.args.profiles.args.bossmods.args.bigwigs = ACH:Execute(L["BigWigs Main"], L["Reset to LuckyoneUI defaults."], 1, function() L1UI:Setup_BigWigs('main') E:StaticPopup_Show('L1UI_RL') end, nil, true)
	L1UI.Options.args.profiles.args.bossmods.args.dbm = ACH:Execute(L["DBM Main"], L["Reset to LuckyoneUI defaults."], 2, function() L1UI:Setup_DBM('main') E:StaticPopup_Show('L1UI_RL') end, nil, true)
	L1UI.Options.args.profiles.args.addonsMain = ACH:Group(L["Addon Profiles"], nil, 7)
	L1UI.Options.args.profiles.args.addonsMain.inline = true
	L1UI.Options.args.profiles.args.addonsMain.args.omnicd = ACH:Execute(L["OmniCD Main"], L["Reset to LuckyoneUI defaults."], 1, function() L1UI:Setup_OmniCD('main') E:StaticPopup_Show('L1UI_RL') end, nil, true, nil, nil, nil, nil, not E.Retail)
	L1UI.Options.args.profiles.args.header3 = ACH:Header(L["Profiles for Healing"], 8)
	L1UI.Options.args.profiles.args.bossmodsHealing = ACH:Group(L["BossMods Profiles"], nil, 9)
	L1UI.Options.args.profiles.args.bossmodsHealing.inline = true
	L1UI.Options.args.profiles.args.bossmodsHealing.args.bigwigs = ACH:Execute(L["BigWigs Healing"], L["Reset to LuckyoneUI defaults."], 1, function() L1UI:Setup_BigWigs('healing') E:StaticPopup_Show('L1UI_RL') end, nil, true)
	L1UI.Options.args.profiles.args.bossmodsHealing.args.dbm = ACH:Execute(L["DBM Healing"], L["Reset to LuckyoneUI defaults."], 2, function() L1UI:Setup_DBM('healing') E:StaticPopup_Show('L1UI_RL') end, nil, true)
	L1UI.Options.args.profiles.args.addonsHealing = ACH:Group(L["Addon Profiles"], nil, 10)
	L1UI.Options.args.profiles.args.addonsHealing.inline = true
	L1UI.Options.args.profiles.args.addonsHealing.args.omnicd = ACH:Execute(L["OmniCD Healing"], L["Reset to LuckyoneUI defaults."], 1, function() L1UI:Setup_OmniCD('healing') E:StaticPopup_Show('L1UI_RL') end, nil, true, nil, nil, nil, nil, not E.Retail)

	-- Skins
	L1UI.Options.args.skins = ACH:Group('Skins', nil, 12)
	L1UI.Options.args.skins.args.header = ACH:Header('Skins', 1)
	L1UI.Options.args.skins.args.addons = ACH:Group('AddOns', nil, 2, nil, function(info) return E.private.L1UI.skins[info[#info]] end, function(info, value) E.private.L1UI.skins[info[#info]] = value E:StaticPopup_Show('L1UI_RL') end)
	L1UI.Options.args.skins.args.addons.inline = true
	L1UI.Options.args.skins.args.addons.args.BugSack = ACH:Toggle('BugSack', nil, 1, nil, nil, nil, nil, nil, not E:IsAddOnEnabled('BugSack'))
	L1UI.Options.args.skins.args.addons.args.TalentLoadoutsEx = ACH:Toggle('TalentLoadoutsEx', nil, 2, nil, nil, nil, nil, nil, not E:IsAddOnEnabled('TalentLoadoutsEx'))

	-- Tags
	L1UI.Options.args.tags = ACH:Group(L["Tags"], nil, 13)
	L1UI.Options.args.tags.args.header = ACH:Header(L["Tags"], 1)
	L1UI.Options.args.tags.args.spacer = ACH:Spacer(2, 'full')
	L1UI.Options.args.tags.args.tag1 = ACH:Input(L["Displays percentage health with 1 decimal below 100%, 2 decimals below 10% and hides decimals at 100%"], nil, 3, nil, 'full', function() return '[luckyone:health:percent]' end, nil, nil)
	L1UI.Options.args.tags.args.tag2 = ACH:Input(L["Displays percentage mana without decimals"], nil, 4, nil, 'full', function() return '[luckyone:mana:percent]' end, nil, nil)
	L1UI.Options.args.tags.args.tag3 = ACH:Input(L["Displays the unit's classification (e.g 'Elite' and 'Rare') but without 'Affix'"], nil, 5, nil, 'full', function() return '[luckyone:classification]' end, nil, nil)
	L1UI.Options.args.tags.args.tag4 = ACH:Input(L["Displays the unit's Mana (Role: Healer)"], nil, 6, nil, 'full', function() return '[luckyone:healermana:current]' end, nil, nil, not E.Retail)
	L1UI.Options.args.tags.args.tag5 = ACH:Input(L["Displays the unit's Mana in percent (Role: Healer)"], nil, 7, nil, 'full', function() return '[luckyone:healermana:percent]' end, nil, nil, not E.Retail)

	-- Themes
	L1UI.Options.args.themes = ACH:Group(L["Themes"], nil, 14)
	L1UI.Options.args.themes.args.header = ACH:Header(L["Themes"], 1)
	L1UI.Options.args.themes.args.raid = ACH:Group(L["UnitFrames Color Theme"], nil, 2)
	L1UI.Options.args.themes.args.raid.inline = true
	L1UI.Options.args.themes.args.raid.args.dark = ACH:Execute(L["Dark"], L["Dark Style (Default)"], 1, function() L1UI:Setup_Theme('dark') end, nil, true)
	L1UI.Options.args.themes.args.raid.args.class = ACH:Execute(L["Class Color"], L["Class Color Style"], 2, function() L1UI:Setup_Theme('class') end, nil, true)

	-- WeakAuras Retail
	L1UI.Options.args.weakauras = ACH:Group('WeakAuras', nil, 15, nil, nil, nil, nil, not E.Retail)
	L1UI.Options.args.weakauras.args.header1 = ACH:Header(L["WeakAuras - Maintained"], 1)
	L1UI.Options.args.weakauras.args.spacer1 = ACH:Spacer(2, 'full')
	L1UI.Options.args.weakauras.args.druid = ACH:Execute(format('|cffFF7C0A%s|r', L["Druid"]), nil, 3, function() E:StaticPopup_Show('L1UI_EDITBOX', nil, nil, 'https://wago.io/LuckyoneUI-Druid') end)
	L1UI.Options.args.weakauras.args.evoker = ACH:Execute(format('|cff33937F%s|r', L["Evoker"]), nil, 4, function() E:StaticPopup_Show('L1UI_EDITBOX', nil, nil, 'https://wago.io/LuckyoneUI-Evoker') end)
	L1UI.Options.args.weakauras.args.spacer2 = ACH:Spacer(5, 'full')
	L1UI.Options.args.weakauras.args.header2 = ACH:Header(L["WeakAuras - Discontinued"], 6)
	L1UI.Options.args.weakauras.args.spacer3 = ACH:Spacer(7, 'full')
	L1UI.Options.args.weakauras.args.priest = ACH:Execute(format('|cffFFFFFF%s|r', L["Priest"]), nil, 8, function() E:StaticPopup_Show('L1UI_EDITBOX', nil, nil, 'https://wago.io/LuckyoneUI-Priest') end)
	L1UI.Options.args.weakauras.args.monk = ACH:Execute(format('|cff00FF98%s|r', L["Monk"]), nil, 9, function() E:StaticPopup_Show('L1UI_EDITBOX', nil, nil, 'https://wago.io/LuckyoneUI-Monk') end)
	L1UI.Options.args.weakauras.args.warlock = ACH:Execute(format('|cff8788EE%s|r', L["Warlock"]), nil, 10, function() E:StaticPopup_Show('L1UI_EDITBOX', nil, nil, 'https://wago.io/LuckyoneUI-Warlock') end)
	L1UI.Options.args.weakauras.args.hunter = ACH:Execute(format('|cffAAD372%s|r', L["Hunter"]), nil, 11, function() E:StaticPopup_Show('L1UI_EDITBOX', nil, nil, 'https://wago.io/LuckyoneUI-Hunter') end)
	L1UI.Options.args.weakauras.args.rogue = ACH:Execute(format('|cffFFF468%s|r', L["Rogue"]), nil, 12, function() E:StaticPopup_Show('L1UI_EDITBOX', nil, nil, 'https://wago.io/LuckyoneUI-Rogue') end)
	L1UI.Options.args.weakauras.args.mage = ACH:Execute(format('|cff3FC7EB%s|r', L["Mage"]), nil, 13, function() E:StaticPopup_Show('L1UI_EDITBOX', nil, nil, 'https://wago.io/LuckyoneUI-Mage') end)
	L1UI.Options.args.weakauras.args.dh = ACH:Execute(format('|cffA330C9%s|r', L["Demon Hunter"]), nil, 14, function() E:StaticPopup_Show('L1UI_EDITBOX', nil, nil, 'https://wago.io/LuckyoneUI-DH') end)
	L1UI.Options.args.weakauras.args.dk = ACH:Execute(format('|cffC41E3A%s|r', L["Death Knight"]), nil, 15, function() E:StaticPopup_Show('L1UI_EDITBOX', nil, nil, 'https://wago.io/LuckyoneUI-DK') end)
	L1UI.Options.args.weakauras.args.paladin = ACH:Execute(format('|cffF48CBA%s|r', L["Paladin"]), nil, 16, function() E:StaticPopup_Show('L1UI_EDITBOX', nil, nil, 'https://wago.io/LuckyoneUI-Paladin') end)
	L1UI.Options.args.weakauras.args.shaman = ACH:Execute(format('|cff0070DD%s|r', L["Shaman"]), nil, 17, function() E:StaticPopup_Show('L1UI_EDITBOX', nil, nil, 'https://wago.io/LuckyoneUI-Shaman') end)
	L1UI.Options.args.weakauras.args.warrior = ACH:Execute(format('|cffC69B6D%s|r', L["Warrior"]), nil, 18, function() E:StaticPopup_Show('L1UI_EDITBOX', nil, nil, 'https://wago.io/LuckyoneUI-Warrior') end)
	L1UI.Options.args.weakauras.args.spacer4 = ACH:Spacer(19, 'full')
	L1UI.Options.args.weakauras.args.header3 = ACH:Header(L["WeakAuras - Dragonflight"], 20)
	L1UI.Options.args.weakauras.args.spacer5 = ACH:Spacer(21, 'full')
	L1UI.Options.args.weakauras.args.keys = ACH:Execute('Link Keystones', nil, 22, function() E:StaticPopup_Show('L1UI_EDITBOX', nil, nil, 'https://wago.io/keystones') end)
	L1UI.Options.args.weakauras.args.affixes = ACH:Execute('Mythic+ Affixes', nil, 23, function() E:StaticPopup_Show('L1UI_EDITBOX', nil, nil, 'https://wago.io/affixes') end)
	L1UI.Options.args.weakauras.args.dragonriding = ACH:Execute('Dragonriding HUD', nil, 24, function() E:StaticPopup_Show('L1UI_EDITBOX', nil, nil, 'https://wago.io/LuckyoneUI-Dragonriding') end)
	L1UI.Options.args.weakauras.args.spacer6 = ACH:Spacer(25, 'full')
	L1UI.Options.args.weakauras.args.header4 = ACH:Header(L["WeakAuras - Useful Stuff"], 26)
	L1UI.Options.args.weakauras.args.spacer7 = ACH:Spacer(27, 'full')
	L1UI.Options.args.weakauras.args.trinket = ACH:Execute('Trinket Tracking', nil, 28, function() E:StaticPopup_Show('L1UI_EDITBOX', nil, nil, 'https://wago.io/Trinket') end)
	L1UI.Options.args.weakauras.args.swapblaster = ACH:Execute('Swapblaster Alert', nil, 29, function() E:StaticPopup_Show('L1UI_EDITBOX', nil, nil, 'https://wago.io/swapblaster') end)
	L1UI.Options.args.weakauras.args.groupfinderClasses = ACH:Execute('Groupfinder Classes', nil, 30, function() E:StaticPopup_Show('L1UI_EDITBOX', nil, nil, 'https://wago.io/groupfinderClasses') end)
	L1UI.Options.args.weakauras.args.groupfinderApptext = ACH:Execute('Groupfinder Applicants', nil, 31, function() E:StaticPopup_Show('L1UI_EDITBOX', nil, nil, 'https://wago.io/appTextHide') end)
	L1UI.Options.args.weakauras.args.innervate = ACH:Execute('Better InnervateMe', nil, 32, function() E:StaticPopup_Show('L1UI_EDITBOX', nil, nil, 'https://wago.io/betterInnervate') end)
	L1UI.Options.args.weakauras.args.handleFriendlyNP = ACH:Execute('Handle Friendly NP', nil, 33, function() E:StaticPopup_Show('L1UI_EDITBOX', nil, nil, 'https://wago.io/handleFriendlyNamePlates') end)
	L1UI.Options.args.weakauras.args.handleNameplateFont = ACH:Execute('Handle NP Font', nil, 34, function() E:StaticPopup_Show('L1UI_EDITBOX', nil, nil, 'https://wago.io/handleNamePlatesFont') end)

	-- WeakAuras Wrath
	L1UI.Options.args.weakaurasWrath = ACH:Group('WeakAuras', nil, 16, nil, nil, nil, nil, not E.Wrath)
	L1UI.Options.args.weakaurasWrath.args.header1 = ACH:Header('WeakAuras', 1)
	L1UI.Options.args.weakaurasWrath.args.hunter = ACH:Execute(format('|cffAAD372%s|r', L["Hunter"]), nil, 2, function() E:StaticPopup_Show('L1UI_EDITBOX', nil, nil, 'https://wago.io/luckyoneHunterWrath') end)
	L1UI.Options.args.weakaurasWrath.args.druid = ACH:Execute(format('|cffFF7C0A%s|r', L["Druid"]), nil, 3, function() E:StaticPopup_Show('L1UI_EDITBOX', nil, nil, 'https://wago.io/luckyoneDruidWrath') end)
	L1UI.Options.args.weakaurasWrath.args.priest = ACH:Execute(format('|cffFFFFFF%s|r', L["Priest"]), nil, 4, function() E:StaticPopup_Show('L1UI_EDITBOX', nil, nil, 'https://wago.io/luckyonePriestWrath') end)

	-- Credits
	L1UI.Options.args.credits = ACH:Group(format('|cfd9b9b9b%s|r', L["Credits"]), nil, 17)
	L1UI.Options.args.credits.args.header = ACH:Header(L["Credits"], 1)
	L1UI.Options.args.credits.args.author = ACH:Group(L["Author"], nil, 2)
	L1UI.Options.args.credits.args.author.inline = true
	L1UI.Options.args.credits.args.author.args.desc = ACH:Description(Private.AUTHOR_STRING, 1, 'medium')
	L1UI.Options.args.credits.args.coding = ACH:Group(L["Coding"], nil, 3)
	L1UI.Options.args.credits.args.coding.inline = true
	L1UI.Options.args.credits.args.coding.args.desc = ACH:Description(Private.CODING_STRING, 1, 'medium')
	L1UI.Options.args.credits.args.testers = ACH:Group(L["Testers and Translation"], nil, 4)
	L1UI.Options.args.credits.args.testers.inline = true
	L1UI.Options.args.credits.args.testers.args.desc = ACH:Description(Private.TESTER_STRING, 1, 'medium')
	L1UI.Options.args.credits.args.supporter = ACH:Group(L["Supporters"], nil, 5)
	L1UI.Options.args.credits.args.supporter.inline = true
	L1UI.Options.args.credits.args.supporter.args.desc = ACH:Description(Private.SUPPORT_STRING, 1, 'medium')

	-- Links
	L1UI.Options.args.links = ACH:Group(format('|cfd9b9b9b%s|r', L["Links"]), nil, 18)
	L1UI.Options.args.links.args.header = ACH:Header(L["Links"], 1)
	L1UI.Options.args.links.args.spacer = ACH:Spacer(2, 'full')
	L1UI.Options.args.links.args.website = ACH:Input(L["Addon Download:"], nil, 3, nil, 'full', function() return 'https://www.curseforge.com/wow/addons/elvui_luckyoneui' end)
	L1UI.Options.args.links.args.changelog = ACH:Input(L["Changelog:"], nil, 4, nil, 'full', function() return 'https://github.com/Luckyone961/LuckyoneUI/blob/development/CHANGELOG.md' end)
	L1UI.Options.args.links.args.discord = ACH:Input('Discord:', nil, 5, nil, 'full', function() return 'https://discord.gg/xRY4bwA' end)
	L1UI.Options.args.links.args.issues = ACH:Input(L["Report issues here:"], nil, 6, nil, 'full', function() return 'https://github.com/Luckyone961/LuckyoneUI/issues' end)
	L1UI.Options.args.links.args.guide = ACH:Input(L["Wowhead Guide:"], nil, 7, nil, 'full', function() return 'https://www.wowhead.com/guide=10680/elvui-luckyoneui-addon-plugin-guide' end)

	-- Developer config
	L1UI.Options.args.dev = ACH:Group(format('|cff4beb2c%s|r', 'Developer'), nil, 99, nil, nil, nil, nil, not E.global.L1UI.dev)
	L1UI.Options.args.dev.args.header = ACH:Header('Developer config', 1)
	L1UI.Options.args.dev.args.information = ACH:Group('Information', nil, 2)
	L1UI.Options.args.dev.args.information.inline = true
	L1UI.Options.args.dev.args.information.args.desc = ACH:Description('If you can see this section of the config, it means you enabled the LuckyoneUI developer mode.\n\nWhile this mode is enabled, the following will change:\n\n- Setup CVars button will set additional values as listed below.\n- Profiles created by the installer will no longer add the version suffix.\n- Profile installer will set additional values as listed below.\n\nIf you did not intend to turn this on please use the following chat command.', 1, 'medium')
	L1UI.Options.args.dev.args.information.args.cmd = ACH:Input('', nil, 2, nil, 'full', function() return '/luckydev off' end)
	L1UI.Options.args.dev.args.cvars = ACH:Group('Developer CVars', nil, 3)
	L1UI.Options.args.dev.args.cvars.inline = true
	L1UI.Options.args.dev.args.cvars.args.desc = ACH:Description('- blockChannelInvites 1\n- CameraReduceUnexpectedMovement 1\n- DisableAdvancedFlyingVelocityVFX 1\n- disableServerNagle 0\n- displaySpellActivationOverlays 0\n- doNotFlashLowHealthWarning 1\n- empowerTapControls 1\n- floatingCombatTextCombatDamage 0\n- floatingCombatTextCombatHealing 0\n- GxAllowCachelessShaderMode 0\n- LowLatencyMode 2\n- maxFPSLoading 30\n- RAIDweatherDensity 0\n- showToastOffline 0\n- showToastOnline 0\n- showToastWindow 0\n- SpellQueueWindow 180\n- useIPv6 0\n- weatherDensity 0', 1, 'medium')
	L1UI.Options.args.dev.args.db = ACH:Group('Developer ProfileDB', nil, 4)
	L1UI.Options.args.dev.args.db.inline = true
	L1UI.Options.args.dev.args.db.args.desc = ACH:Description('- ElvUI chat bubble skinning disabled\n- LuckyoneUI Alert Frame hider enabled\n- LuckyoneUI Boss Banner hider enabled\n- LuckyoneUI Easy Delete enabled\n- LuckyoneUI BugSack skin enabled', 1, 'medium')

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
