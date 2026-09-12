local _, Private = ...
local L = Private.Libs.ACL
local ACH = Private.Libs.ACH
local LSM = Private.Libs.LSM

local ipairs = ipairs
local concat = table.concat
local format = string.format

local GetCVarBool = C_CVar.GetCVarBool
local SetCVar = C_CVar.SetCVar
local HideUIPanel = HideUIPanel
local strtrim = strtrim

local _G = _G
local StaticPopup_Show = _G.StaticPopup_Show
local SettingsPanel = _G.SettingsPanel
local CLASS_SORT_ORDER = _G.CLASS_SORT_ORDER
local LOCALIZED_CLASS_NAMES_MALE = _G.LOCALIZED_CLASS_NAMES_MALE
local RAID_CLASS_COLORS = _G.RAID_CLASS_COLORS

local function GetIconName(name, icon)
	return format('|T%s%s.png:14:14:0:0|t %s', Private.IconPath, icon, name)
end

-- Font compatibility (Fallbacks if ElvUI is not installed)
local function FontValues()
	local values = {}

	for _, name in ipairs(LSM:List('font')) do
		values[name] = name
	end

	return values
end

local function FontSelect(order)
	return (Private.ElvUI and ACH:SharedMediaFont(L["Font"], nil, order)) or ACH:Select(L["Font"], nil, order, FontValues)
end

local function OutlineSelect(order)
	return (Private.ElvUI and ACH:FontFlags(L["Font Outline"], nil, order)) or ACH:Select(L["Font Outline"], nil, order, ACH.FontValues)
end

local function FontGroup(name, order, maxSize, disabled, prefix)
	prefix = prefix or 'font'
	local group = ACH:Group(name, nil, order, nil, nil, nil, disabled)
	group.inline = true
	group.args[prefix] = FontSelect(1)
	group.args[prefix .. 'Outline'] = OutlineSelect(2)
	group.args[prefix .. 'Size'] = ACH:Range(L["Font Size"], nil, 3, { min = 8, max = maxSize, step = 1 })
	return group
end

local function TextureValues()
	local values = {}

	for _, name in ipairs(LSM:List('statusbar')) do
		values[name] = name
	end

	return values
end

local function TextureSelect(order, disabled)
	return (Private.ElvUI and ACH:SharedMediaStatusbar(L["Texture"], nil, order, nil, nil, nil, disabled)) or ACH:Select(L["Texture"], nil, order, TextureValues, nil, nil, nil, nil, disabled)
end

-- Credits
local CREDITS = {
	author = {
		'|cff33937FLucky|r - LaughingSkull',
		'|cffFF7D0ALuckyone|r - LaughingSkull',
	},
	coding = {
		'|cff0070DEAzilroka|r',
		'|cffFF7D0AMerathilis|r',
		'|cffF58CBARepooc|r',
		'|cFF8866ccSimpy|r',
	},
	testers = {
		'|cff00FF96AltBridge|r',
		'|cffABD473Badbrain|r',
		'|cffABD473Dlarge|r',
		'|cff00FF96Doctorio|r',
		'|cff3FC7EBEltreum|r',
		'|cffe6cc80Hollicsh|r',
		'|cffF58CBAIllusion|r',
		'|cffC41F3BKringel|r',
		'|cffABD473Nightwalker|r',
		'|cffFFFFFFOniria|r',
	},
	support = {
		'|cffe6cc80Calmcacil|r',
		'|cffe6cc80DaPaKnat|r',
		'|cffe6cc80Debeleus|r',
		'|cffe6cc80DevinDog|r',
		'|cffe6cc80Dukes|r',
		'|cffe6cc80Garbar|r',
		'|cffe6cc80Kenneth|r',
		'|cffe6cc80Liam|r',
		'|cffe6cc80Littlesack|r',
		'|cffe6cc80Logan|r',
		'|cffe6cc80Lox|r',
		'|cffe6cc80Midnatt|r',
		'|cffe6cc80MonkeyHack|r',
		'|cffe6cc80Onlyne|r',
		'|cffe6cc80ShowNoMercy|r',
		'|cffe6cc80Treelyté|r',
		'|cffe6cc80Triplebeamdreams|r',
		'|cffe6cc80Tykk|r',
	},
}

-- Build Setup Section
local function BuildSetupSection()
	local section = ACH:Group('', nil, 2)
	section.inline = true
	section.args.header = ACH:Header(Private.Name, 1, nil, nil, not Private.ElvUI)
	section.args.spacer1 = ACH:Spacer(2, 'full', not Private.ElvUI)
	section.args.installer = ACH:Execute(Private.Name .. ' ' .. L["Install"], L["Run the installation process."], 3, function() Private.Installer:Show() if Private.ElvUI then ElvUI[1]:ToggleOptions() else HideUIPanel(SettingsPanel) end end)
	section.args.alts = ACH:Execute(L["Alt Setup"], L["Loads your existing LuckyoneUI profile in every enabled addon that has one.\n\nIt also applies the console variables and can create your chat tabs.\n\nHealer specializations get the healing profiles, everyone else the main ones."], 4, function() StaticPopup_Show('LUCKYONE_ALTS') end)
	section.args.spacer2 = ACH:Spacer(5, 0.20)
	section.args.native = ACH:Toggle('1440p',L["1440p = Default | 1080p = Downscaled"], 6, nil, nil, 'half', function() return not Private.Addon.db.global.scaled end, function(_, value) Private.Addon.db.global.scaled = not value end)
	section.args.scaled = ACH:Toggle('1080p',L["1440p = Default | 1080p = Downscaled"], 7, nil, nil, 'half', function() return Private.Addon.db.global.scaled end, function(_, value) Private.Addon.db.global.scaled = value end)
	section.args.spacer3 = ACH:Spacer(8, 'full')
	return section
end

-- Build General Section
local function BuildGeneralSection()
	local section = ACH:Group(GetIconName(L["General"], 'General'), nil, 5)
	section.args.header = ACH:Header(L["General"], 1)
	section.args.disabledFrames = ACH:Group(L["Hide Blizzard Frames"], nil, 2, nil, function(info) return Private.Addon.db.profile.disabledFrames[info[#info]] end, function(info, value) Private.Addon.db.profile.disabledFrames[info[#info]] = value StaticPopup_Show('LUCKYONE_RL') end)
	section.args.disabledFrames.inline = true
	section.args.disabledFrames.args.AlertFrame = ACH:Toggle(L["Alert Frame"], L["Hide the Loot/Alert Frame"], 1)
	section.args.disabledFrames.args.ApplicationCover = ACH:Toggle(L["Application Cover"], L["Removes the LFG frame overlay and animation which blocks your mouse inputs and tooltip when you are not the party leader."], 2, nil, nil, nil, nil, nil, nil, not (Private.isRetail or Private.isMists))
	section.args.disabledFrames.args.BossBanner = ACH:Toggle(L["Boss Banner"], L["Hide the Boss Banner"], 3, nil, nil, nil, nil, nil, nil, not Private.isRetail)
	section.args.disabledFrames.args.HousingDecorAlerts = ACH:Toggle(L["Housing Decor Alerts"], L["Hide the Housing Alerts for \n\'New Decor Added\'"], 4, nil, nil, nil, nil, nil, nil, not Private.isRetail)
	section.args.disabledFrames.args.LossOfControl = ACH:Toggle(L["Loss of Control Frame"], L["Hide the Loss of Control Frame"], 5, nil, nil, nil, nil, nil, nil, not (Private.isRetail or Private.isMists))
	section.args.disabledFrames.args.TalkingHead = ACH:Toggle(L["Talking Head"], L["Hide the Talking Head Frame but keep it's sounds and voicelines."], 6, nil, nil, nil, nil, nil, nil, not Private.isRetail)
	section.args.disabledFrames.args.UIErrorsFrame = ACH:Toggle(L["UI Errors Frame"], L["Hide the UI Errors Frame which usually displays messages like 'Out of range', 'Not enough mana', 'You have no target' - This will also block all quest progress update messages."], 7)
	section.args.disabledFrames.args.ZoneTextFrame = ACH:Toggle(L["Zone Text"], L["Hide the Zone Text"], 8)
	section.args.qualityOfLife = ACH:Group(L["Quality of Life"], nil, 3, nil, function(info) return Private.Addon.db.profile.qualityOfLife[info[#info]] end, function(info, value) Private.Addon.db.profile.qualityOfLife[info[#info]] = value StaticPopup_Show('LUCKYONE_RL') end)
	section.args.qualityOfLife.inline = true
	section.args.qualityOfLife.args.autoAcceptRole = ACH:Toggle(L["Auto Accept Role"], L["Automatically accept the role check popup when signing up for groups and raids. Hold down the shift key to add a signup note."], 1, nil, nil, nil, nil, nil, nil, not (Private.isRetail or Private.isMists))
	section.args.qualityOfLife.args.autoDismount = ACH:Toggle(L["Auto Dismount"], L["Automatically dismounts you if all of the following conditions are true:\n\n- You are on a skyriding mount\n- You are on the ground\n- You press any skyriding spell except Skyward Ascent\n\nDoes not work for Druid Travel Form."], 2, nil, nil, nil, nil, nil, nil, not Private.isRetail)
	section.args.qualityOfLife.args.easyDelete = ACH:Toggle(L["Easy Delete"], L["Automatically fill out the confirmation text to delete items."], 3)
	section.args.qualityOfLife.args.expandMerchant = ACH:Toggle(L["Expand Merchant Frame"], L["Doubles the width of the merchant frame to show 20 items per page in four columns instead of 10 in two columns."], 4)
	section.args.qualityOfLife.args.expandQuestLog = ACH:Toggle(L["Expand Quest Log"], L["Doubles the width of the quest log to show the quest list and the quest details side by side.\n\nRequires the ElvUI quest skin."], 5, nil, nil, nil, nil, nil, function() return not (ElvUI[1].private.skins.blizzard.enable and ElvUI[1].private.skins.blizzard.quest) end, not (Private.ElvUI and (Private.isClassic or Private.isTBC)))
	section.args.qualityOfLife.args.fasterLoot = ACH:Toggle(L["Faster Loot"], L["Speed up auto looting by grabbing everything the moment the loot becomes available instead of waiting for the loot window."], 6)
	section.args.qualityOfLife.args.preventLootAutoShow = ACH:Toggle(L["Prevent Loot Overview"], L["Prevents the Blizzard group loot overview frame from auto opening after a boss kill."], 7, nil, nil, nil, nil, nil, nil, not Private.isRetail)
	section.args.qualityOfLife.args.privacyOverlay = ACH:Toggle(L["Privacy Overlay"], L["Creates an overlay to hide the chat frame in the Communities Frame until you click on it."], 8)
	section.args.qualityOfLife.args.quickSignup = ACH:Toggle(L["Quick Signup"], L["Speed up the signup process for party and raid applications by double clicking the listing instead of clicking the signup button."], 9, nil, nil, nil, nil, nil, nil, not (Private.isRetail or Private.isMists))
	section.args.movableFrames = ACH:Group(L["Movable Frames"], nil, 4, nil, function(info) return Private.Addon.db.profile.movableFrames[info[#info]] end, function(info, value) Private.Addon.db.profile.movableFrames[info[#info]] = value StaticPopup_Show('LUCKYONE_RL') end)
	section.args.movableFrames.inline = true
	section.args.movableFrames.args.enable = ACH:Toggle(L["Enable"], L["Allows you to move Blizzard panels.\n\nRight-Click restores Blizzard default position.\n\nPosition is not stored and resets on reload and relog."], 1)
	section.args.movableFrames.args.autoReset = ACH:Toggle(L["Auto Reset"], L["Panels return to the Blizzard default position when they open or close.\n\nDisable this to keep a moved panel where you left it until you reload."], 2, nil, nil, nil, nil, function(_, value) Private.Addon.db.profile.movableFrames.autoReset = value end, function() return not Private.Addon.db.profile.movableFrames.enable end)
	section.args.movableFrames.args.modifier = ACH:Select(L["Modifier"], L["Hold this key down to drag or reset a panel."], 3, { NONE = _G.NONE, SHIFT = _G.SHIFT_KEY_TEXT, ALT = _G.ALT_KEY_TEXT, CTRL = _G.CTRL_KEY_TEXT }, nil, nil, nil, function(_, value) Private.Addon.db.profile.movableFrames.modifier = value end, function() return not Private.Addon.db.profile.movableFrames.enable end)
	section.args.misc = ACH:Group(L["Misc"], nil, 5, nil, nil, nil, nil, not Private.isRetail)
	section.args.misc.inline = true
	section.args.misc.args.removeNameplateRealm = ACH:Toggle(L["Remove Nameplate Realms"], L["Removes the realm names from friendly nameplates in name-only mode while in a Dungeon/Raid/Battleground."], 1, nil, nil, nil, function() return Private.Addon.db.profile.misc.removeNameplateRealm end, function(_, value) Private.Addon.db.profile.misc.removeNameplateRealm = value StaticPopup_Show('LUCKYONE_RL') end)
	section.args.performance = ACH:Group(L["Performance Tweaks"], nil, 6, nil, nil, nil, nil, not Private.isRetail)
	section.args.performance.inline = true
	section.args.performance.args.performance = ACH:Execute(L["Untrack Hidden Quests"], L["People found out some characters have a big amount of hidden quests which will cause performance issues. This button will untrack all your quests, including the hidden ones and might give you an increase in average FPS."], 1, function() Private:UntrackAllQuests() end)
	return section
end

-- Build Addon Profiles Section
local function BuildAddonProfilesSection()
	local section = ACH:Group(GetIconName(L["Addon Profiles"], 'Addons'), nil, 10)
	section.args.header1 = ACH:Header(L["Addon Profiles"], 1)
	section.args.addons = ACH:Group(L["Profiles"], nil, 2)
	section.args.addons.inline = true
	section.args.addons.args.baganator = ACH:Execute('Baganator', L["Import LuckyoneUI defaults."], 1, function() Private:Setup_Baganator() StaticPopup_Show('LUCKYONE_RL') end, nil, true)
	section.args.addons.args.buffReminders = ACH:Execute('BuffReminders', L["Import LuckyoneUI defaults."], 2, function() Private:Setup_BuffReminders() StaticPopup_Show('LUCKYONE_RL') end, nil, true, nil, nil, nil, nil, not Private.isRetail)
	section.args.addons.args.details = ACH:Execute('Details', L["Import LuckyoneUI defaults."], 3, function() Private:Setup_Details() StaticPopup_Show('LUCKYONE_RL') end, nil, true)
	section.args.addons.args.mplustimer = ACH:Execute('MPlusTimer', L["Import LuckyoneUI defaults."], 4, function() Private:Setup_MPlusTimer() StaticPopup_Show('LUCKYONE_RL') end, nil, true, nil, nil, nil, nil, not Private.isRetail)
	section.args.addons.args.nsrt = ACH:Execute('Northern Sky Raid Tools', L["Import LuckyoneUI defaults."], 5, function() Private:Setup_NSRT() StaticPopup_Show('LUCKYONE_RL') end, nil, true, nil, nil, nil, nil, not Private.isRetail)
	section.args.addons.args.permoksAccountManager = ACH:Execute('PermoksAccountManager', L["Import LuckyoneUI defaults."], 6, function() Private:Setup_PermoksAccountManager() StaticPopup_Show('LUCKYONE_RL') end, nil, true, nil, nil, nil, nil, not Private.isRetail)
	section.args.addons.args.plumber = ACH:Execute('Plumber', L["Import LuckyoneUI defaults."], 7, function() Private:Setup_Plumber() StaticPopup_Show('LUCKYONE_RL') end, nil, true, nil, nil, nil, nil, not Private.isRetail)
	section.args.nameplates = ACH:Group(L["Nameplate Profiles"], nil, 3)
	section.args.nameplates.inline = true
	section.args.nameplates.args.elvui = ACH:Execute('ElvUI', L["Import LuckyoneUI defaults."], 1, function() Private:Setup_NamePlates() StaticPopup_Show('LUCKYONE_RL') end, nil, true, nil, nil, nil, nil, not Private.ElvUI)
	section.args.nameplates.args.platynator = ACH:Execute('Platynator', L["Import LuckyoneUI defaults."], 2, function() Private:Setup_Platynator() StaticPopup_Show('LUCKYONE_RL') end, nil, true)
	section.args.bossmods = ACH:Group(L["BossMods Profiles"], nil, 4)
	section.args.bossmods.inline = true
	section.args.bossmods.args.bigwigsMain = ACH:Execute(L["BigWigs Main"], L["Import LuckyoneUI defaults."], 1, function() Private:Setup_BigWigs('main') end, nil, true)
	section.args.bossmods.args.bigwigsHealing = ACH:Execute(L["BigWigs Healing"], L["Import LuckyoneUI defaults."], 2, function() Private:Setup_BigWigs('healing') end, nil, true)
	section.args.header2 = ACH:Header(L["Blizzard Profiles"], 6, nil, nil, not Private.isRetail)
	section.args.strings = ACH:Group(L["Profile strings"], nil, 7, nil, nil, nil, nil, not Private.isRetail)
	section.args.strings.inline = true
	section.args.strings.args.editModeString = ACH:Execute(L["Copy Editmode String"], nil, 1, function() Private:Return_EditModeString() end)
	section.args.strings.args.editModeToggle = ACH:Execute(format('|cff4beb2c%s|r', L["Enter Edit Mode"]), nil, 2, function() Private:ToggleEditMode() if Private.ElvUI then ElvUI[1]:ToggleOptions() end end)
	return section
end

-- Build PrivateDB Section
local function BuildPrivateDBSection()
	if not Private.ElvUI then return end -- ElvUI section
	local section = ACH:Group(GetIconName(L["Character Specific"], 'Character'), nil, 15)
	section.args.header = ACH:Header(L["Character Specific"], 1)
	section.args.defaults = ACH:Group(L["Restore LuckyoneUI Defaults"], nil, 2)
	section.args.defaults.inline = true
	section.args.defaults.args.private = ACH:Execute(L["Restore Defaults"], nil, 1, function() Private:Setup_PrivateDB() ElvUI[1]:UpdateMediaItems() end, nil, true)
	section.args.defaultsDesc = ACH:Group(L["The following data will be updated"], nil, 3)
	section.args.defaultsDesc.inline = true
	section.args.defaultsDesc.args.cvars = ACH:Description(L["- All Fonts: Expressway\n- All Font Outlines: Outline\n- All Textures: Minimalist\n- General Font Size: 11\n- Quest, Objective and Error Text Font Sizes\n- Chat Bubble Font Size: 12\n\n- Friendly Nameplate Font Sizes\n- Totem Tracker: disabled\n- Bag Bar: disabled\n- Minimap Tracking Icon: hidden (not Classic)\n- Parchment Remover: enabled\n- ElvUI Cooldown Manager Skin: disabled\n\n- (Classic Only) Make Shamans blue instead of pink"], 1, 'medium')
	return section
end

-- Build Chat Section
local function BuildChatSection()
	local section = ACH:Group(GetIconName(L["Chat"], 'Chat'), nil, 20)
	section.args.header = ACH:Header(L["Chat"], 1)
	section.args.chatSetup = ACH:Group(L["Setup Chat"], nil, 2)
	section.args.chatSetup.inline = true
	section.args.chatSetup.args.chat = ACH:Execute(L["Setup Chat"], nil, 1, function() Private:Setup_Chat() end)
	section.args.chatSetup.args.chattynator = ACH:Execute(L["Use Chattynator Addon"], nil, 2, function() Private:Setup_Chattynator() StaticPopup_Show('LUCKYONE_RL') end, nil, true)
	section.args.chatDesc = ACH:Group(L["Description"], nil, 3)
	section.args.chatDesc.inline = true
	section.args.chatDesc.args.desc = ACH:Description(L["Setup Chat will reset your chat panels to default and create custom chat tabs.\n\nChat tabs: [ Main - Log - Whisper - Guild - Party ]"], 1, 'medium')
	section.args.chatVars = ACH:Group(L["Chat CVars"], nil, 4)
	section.args.chatVars.inline = true
	section.args.chatVars.args.desc = ACH:Description('- chatClassColorOverride 0\n- chatMouseScroll 1\n- chatStyle classic\n- colorChatNamesByClass 1\n- showTimestamps %H:%M\n- speechToText 0\n- textToSpeech 0\n- whisperMode inline\n- wholeChatWindowClickable 0', 1, 'medium')
	return section
end

-- Build CVars Section
local function BuildCVarsSection()
	local section = ACH:Group(GetIconName(L["Console Variables"], 'Console'), nil, 25)
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
	section.args.nameplateDesc.args.cvars = ACH:Description('- nameplateMinAlpha 1\n- nameplateMinScale 1\n- nameplateOccludedAlphaMult 1\n- nameplateOverlapH 1.1\n- nameplateOverlapV 1.7\n- nameplateSelectedScale 1\n- nameplateMaxDistance ' .. (Private.isRetail and 100 or 41) .. '\n- nameplateShowOnlyNameForFriendlyPlayerUnits 1\n- nameplateUseClassColorForFriendlyPlayerUnitNames 1\n' .. (Private.isRetail and '- nameplateShowFriendlyRealmName 0' or '- nameplateNotSelectedAlpha 1\n- nameplateStackingTypes Enemy') .. '\n\n- UnitNameEnemyGuardianName 1\n- UnitNameEnemyMinionName 1\n- UnitNameEnemyPetName 1\n- UnitNameEnemyPlayerName 1\n- UnitNameEnemyTotemName 1', 1, 'medium')
	return section
end

-- Cooldown Manager wago profiles, only the class you are logged into gets built
local CDMSpecs = {
	HUNTER = { name = L["Hunter"], { L["Beast Mastery"], 'Beastmastery' }, { L["Marksmanship"], 'Marksmanship' }, { L["Survival"], 'Survival' } },
	SHAMAN = { name = L["Shaman"], { L["Enhancement"], 'Enhancement' }, { L["Elemental"], 'Elemental' }, { L["Restoration"], 'Restoration-Shaman' } },
	MONK = { name = L["Monk"], { L["Windwalker"], 'Windwalker' }, { L["Brewmaster"], 'Brewmaster' }, { L["Mistweaver"], 'Mistweaver' } },
	PALADIN = { name = L["Paladin"], { L["Retribution"], 'Retribution' }, { L["Protection"], 'Protection-Paladin' }, { L["Holy"], 'Holy-Paladin' } },
	DRUID = { name = L["Druid"], { L["Feral"], 'Feral' }, { L["Balance"], 'Balance' }, { L["Guardian"], 'Guardian' }, { L["Restoration"], 'Restoration-Druid' } },
	EVOKER = { name = L["Evoker"], { L["Devastation"], 'Devastation' }, { L["Preservation"], 'Preservation' }, { L["Augmentation"], 'Augmentation' } },
	WARRIOR = { name = L["Warrior"], { L["Arms"], 'Arms' }, { L["Fury"], 'Fury' }, { L["Protection"], 'Protection-Warrior' } },
	DEATHKNIGHT = { name = L["Death Knight"], { L["Unholy"], 'Unholy' }, { L["Frost"], 'Frost-DK' }, { L["Blood"], 'Blood' } },
	DEMONHUNTER = { name = L["Demon Hunter"], { L["Havoc"], 'Havoc' }, { L["Vengeance"], 'Vengeance' }, { L["Devourer"], 'Devourer' } },
	PRIEST = { name = L["Priest"], { L["Shadow"], 'Shadow' }, { L["Discipline"], 'Discipline' }, { L["Holy"], 'Holy-Priest' } },
	WARLOCK = { name = L["Warlock"], { L["Destruction"], 'Destruction' }, { L["Affliction"], 'Affliction' }, { L["Demonology"], 'Demonology' } },
	MAGE = { name = L["Mage"], { L["Fire"], 'Fire' }, { L["Frost"], 'Frost-Mage' }, { L["Arcane"], 'Arcane' } },
	ROGUE = { name = L["Rogue"], { L["Assassination"], 'Assassination' }, { L["Outlaw"], 'Outlaw' }, { L["Subtlety"], 'Subtlety' } },
}

-- Build Cooldown Manager Section
local function BuildCDMSection()
	if not Private.isRetail then return end -- Retail only section
	local section = ACH:Group(GetIconName(L["Cooldown Manager"], 'Cdm'), nil, 30)
	section.args.header1 = ACH:Header(L["Cooldown Manager"], 1)
	local specs = CDMSpecs[Private.myClass]
	local color = RAID_CLASS_COLORS[Private.myClass]
	section.args.specs = ACH:Group(specs.name, nil, 2)
	section.args.specs.inline = true

	for index, spec in ipairs(specs) do
		section.args.specs.args['spec' .. index] = ACH:Execute(color:WrapTextInColorCode(spec[1]), nil, index, function() StaticPopup_Show('LUCKYONE_EDITBOX', nil, nil, 'https://wago.io/LuckyoneUI-' .. spec[2]) end)
	end

	section.args.desc = ACH:Group(L["Description"], nil, 15)
	section.args.desc.inline = true
	section.args.desc.args.desc = ACH:Description(L["Specializations are only displayed for the class you're currently logged into.\n\nGrab the updated import string from the Wago URL and import it manually.\n\nFor quick access to the Blizzard cooldown viewer panel use the button below."], 1, 'medium')
	section.args.header2 = ACH:Header(L["Cooldown Settings"], 16)
	section.args.addons = ACH:Group(L["Addon Profiles"], nil, 17)
	section.args.addons.inline = true
	section.args.addons.args.scm = ACH:Execute('SkironCooldownManager', L["Import LuckyoneUI defaults."], 1, function() Private:Setup_SCM() StaticPopup_Show('LUCKYONE_RL') end, nil, true)
	section.args.utilities = ACH:Group(L["Utilities"], nil, 18)
	section.args.utilities.inline = true
	section.args.utilities.args.toggleViewer = ACH:Execute(format('|cff4beb2c%s|r', L["Toggle Cooldown Settings"]), L["Shortcut to the Cooldown Settings.\nYou can import the profiles in the bottom left dropdown."], 1, function() Private:ShowCooldownViewerSettings() end)
	return section
end

local WINDOW_NAMES = {}
local PlacementValues = { AUTO = L["Automatic"], ATTACH = L["Attached"], CUSTOM = L["Custom"] }
local SoloPlacementValues = { AUTO = L["Automatic"], CUSTOM = L["Custom"] }

local function DamageMeterGet(info)
	return Private.Addon.db.profile.damageMeter[info[#info]]
end

local function DamageMeterSet(info, value)
	Private.Addon.db.profile.damageMeter[info[#info]] = value
	Private:DamageMeter_UpdateAll()
end

local function DamageMeterDisabled()
	return not Private.Addon.db.profile.damageMeter.enable
end

local function DamageMeterNoSecondary()
	local db = Private.Addon.db.profile.damageMeter

	return not db.enable or db.numberDisplay == 'MINIMAL'
end

local function DamageMeterTypes()
	return Private.Modules.DamageMeter.TypeMenuNames
end

local function DamageMeterColorGet(info)
	local color = Private.Addon.db.profile.damageMeter[info[#info]]

	return color.r, color.g, color.b
end

local function DamageMeterColorSet(info, r, g, b)
	local color = Private.Addon.db.profile.damageMeter[info[#info]]
	color.r, color.g, color.b = r, g, b

	Private:DamageMeter_UpdateAll()
end

local function ReleaseAttached(db, index)
	for other = 1, 4 do
		local wdb = db.windows[other]

		if wdb.attachTo == index then
			wdb.attachTo = 0
			wdb.placement = 'AUTO'
		end
	end
end

-- Damage Meter window group, one per session window
local function BuildWindowGroup(index, order)
	WINDOW_NAMES[index] = format(L["Window %d"], index) -- The attach menu picks them up from here

	local function WindowGet(info) return Private.Addon.db.profile.damageMeter.windows[index][info[#info]] end
	local function WindowSet(info, value) Private.Addon.db.profile.damageMeter.windows[index][info[#info]] = value Private:DamageMeter_UpdateAll() end
	local function NotCustom() return Private.Addon.db.profile.damageMeter.windows[index].placement ~= 'CUSTOM' end
	local function NoBackdrop() return not Private.Addon.db.profile.damageMeter.windows[index].backdrop end

	local group = ACH:Group(WINDOW_NAMES[index], nil, order, nil, WindowGet, WindowSet, nil, function() return Private.Addon.db.profile.damageMeter.windowCount < index end)
	group.inline = true
	group.args.meterType = ACH:Select(L["Type"], nil, 1, DamageMeterTypes, nil, nil, nil, function(_, value) Private.Addon.db.profile.damageMeter.windows[index].meterType = value local DM = Private.Modules.DamageMeter local window = DM.windows[index] if window then DM:SetWindowType(window, value) end end)
	group.args.placement = ACH:Select(L["Placement"], L["Give this window its own slot, attach it to another window or move it with its own mover."], 2, function() return Private.Addon.db.profile.damageMeter.windowCount > 1 and PlacementValues or SoloPlacementValues end, nil, nil, nil, function(_, value) local db = Private.Addon.db.profile.damageMeter db.windows[index].placement = value if value == 'ATTACH' then ReleaseAttached(db, index) else db.windows[index].attachTo = 0 end Private:DamageMeter_UpdateAll() end)
	group.args.attachTo = ACH:Select(L["Attach To"], L["Stack this window under another one instead of giving it its own slot."], 3, function() local db = Private.Addon.db.profile.damageMeter local values = { [0] = _G.NONE } for target = 1, db.windowCount do if target ~= index and db.windows[target].placement ~= 'ATTACH' then values[target] = WINDOW_NAMES[target] end end return values end, nil, nil, nil, function(_, value) local db = Private.Addon.db.profile.damageMeter db.windows[index].attachTo = value if value ~= 0 then ReleaseAttached(db, index) end Private:DamageMeter_UpdateAll() end, nil, function() local db = Private.Addon.db.profile.damageMeter return db.windowCount < 2 or db.windows[index].placement ~= 'ATTACH' end)
	group.args.attachSize = ACH:Range(L["Attached Size"], L["Share of the parent window taken by the attached window."], 4, { min = 10, max = 90, step = 1 }, nil, nil, nil, nil, function() local wdb = Private.Addon.db.profile.damageMeter.windows[index] return wdb.placement ~= 'ATTACH' or wdb.attachTo == 0 end)
	group.args.width = ACH:Range(L["Width"], nil, 5, { min = 100, max = 1200, step = 1 }, nil, nil, nil, nil, NotCustom)
	group.args.height = ACH:Range(L["Height"], nil, 6, { min = 60, max = 800, step = 1 }, nil, nil, nil, nil, NotCustom)
	group.args.showSessionButton = ACH:Toggle(L["Session Button"], L["Show the session button in the header."], 7)
	group.args.showResetButton = ACH:Toggle(L["Reset Button"], L["Show the reset button in the header. Shift click to reset without confirmation."], 8)
	group.args.showSettingsButton = ACH:Toggle(L["Settings Button"], L["Show the settings button in the header."], 9)
	group.args.mouseoverButtons = ACH:Toggle(L["Mouseover"], L["Only show the header buttons while the cursor is over the window."], 10)
	group.args.backdrop = ACH:Toggle(L["Frame Backdrop"], L["Show a backdrop behind this window."], 11)
	group.args.backdropColorType = ACH:Select(L["Backdrop Color"], L["Follow the ElvUI backdrop fade color or use a custom color."], 12, { ELVUI = 'ElvUI', CUSTOM = L["Custom"] }, nil, nil, nil, nil, nil, NoBackdrop)
	group.args.backdropColor = ACH:Color(L["Custom Color"], nil, 13, true, nil, function() local color = Private.Addon.db.profile.damageMeter.windows[index].backdropColor return color.r, color.g, color.b, color.a end, function(_, r, g, b, a) local color = Private.Addon.db.profile.damageMeter.windows[index].backdropColor color.r, color.g, color.b, color.a = r, g, b, a Private:DamageMeter_UpdateAll() end, nil, function() local wdb = Private.Addon.db.profile.damageMeter.windows[index] return not wdb.backdrop or wdb.backdropColorType ~= 'CUSTOM' end)
	group.args.backdropWidth = ACH:Range(L["Backdrop Width"], L["Grow or shrink the backdrop horizontally, 0 matches the window."], 14, { min = -20, max = 50, step = 1 }, nil, nil, nil, nil, NoBackdrop)
	group.args.backdropHeight = ACH:Range(L["Backdrop Height"], L["Grow or shrink the backdrop vertically, 0 matches the window."], 15, { min = -20, max = 50, step = 1 }, nil, nil, nil, nil, NoBackdrop)
	return group
end

-- Build Damage Meter Section
local function BuildDamageMeterSection()
	if not (Private.ElvUI and Private.isRetail) then return end -- Retail + ElvUI section
	local section = ACH:Group(GetIconName(L["Damage Meter"], 'DamageMeter'), nil, 35, 'tab')
	section.args.header = ACH:Header(L["Damage Meter"], 1)
	section.args.general = ACH:Group(L["General"], nil, 2, nil, DamageMeterGet, DamageMeterSet)
	section.args.general.args.generalOptions = ACH:Group(L["General"], nil, 1)
	section.args.general.args.generalOptions.inline = true
	section.args.general.args.generalOptions.args.enable = ACH:Toggle(L["Enable"], L["Lightweight Damage Meter powered by the native Blizzard combat data."], 1)
	section.args.general.args.generalOptions.args.testMode = ACH:Toggle(L["Test Mode"], L["Show fake bars to preview settings. Resets on reload."], 2, nil, nil, nil, function() return Private.Modules.DamageMeter.testMode end, function(_, value) Private.Modules.DamageMeter:SetTestMode(value) end, DamageMeterDisabled)
	section.args.general.args.generalOptions.args.visibility = ACH:Select(L["Visibility"], nil, 3, { SHOW = L["Always"], COMBAT = L["In Combat"], GROUP = L["In Group"] }, nil, nil, nil, nil, DamageMeterDisabled)
	section.args.general.args.resetOptions = ACH:Group(L["Reset"], nil, 2)
	section.args.general.args.resetOptions.inline = true
	section.args.general.args.resetOptions.args.autoReset = ACH:Select(L["Auto Reset"], L["Reset all Damage Meter data when you enter a new instance."], 1, { NONE = _G.NONE, ASK = L["Ask"], AUTO = L["Automatic"] }, nil, nil, nil, nil, DamageMeterDisabled)
	section.args.general.args.resetOptions.args.autoResetTypes = ACH:MultiSelect(L["Instances"], L["Which instance types trigger the reset. Scenarios include Delves."], 2, { party = L["Dungeon"], raid = L["Raid"], scenario = L["Scenario"] }, nil, nil, function(_, key) return Private.Addon.db.profile.damageMeter.autoResetTypes[key] end, function(_, key, value) Private.Addon.db.profile.damageMeter.autoResetTypes[key] = value Private:DamageMeter_UpdateAll() end, DamageMeterDisabled, function() return Private.Addon.db.profile.damageMeter.autoReset == 'NONE' end)
	section.args.general.args.resetOptions.args.resetOnLogout = ACH:Toggle(L["Reset on Logout"], L["Wipe all Damage Meter data when you log out. Reloading the UI keeps the data."], 3, nil, nil, nil, nil, nil, DamageMeterDisabled)
	section.args.general.args.defaults = ACH:Group(L["Restore LuckyoneUI Defaults"], nil, 3)
	section.args.general.args.defaults.inline = true
	section.args.general.args.defaults.args.damageMeter = ACH:Execute(L["Restore Defaults"], L["Wipe all Damage Meter settings, the module itself stays enabled."], 1, function() Private:DamageMeter_ResetDefaults() end, nil, true)
	section.args.windows = ACH:Group(L["Windows"], nil, 3, nil, nil, nil, DamageMeterDisabled)
	section.args.windows.args.generalOptions = ACH:Group(L["General"], nil, 1, nil, DamageMeterGet, DamageMeterSet)
	section.args.windows.args.generalOptions.inline = true
	section.args.windows.args.generalOptions.args.windowCount = ACH:Range(L["Windows"], L["Number of session windows."], 1, { min = 1, max = 4, step = 1 })
	section.args.windows.args.generalOptions.args.orientation = ACH:Select(L["Orientation"], L["Place the session windows next to each other or stacked."], 2, { HORIZONTAL = L["Horizontal"], VERTICAL = L["Vertical"] })
	section.args.windows.args.spacingOptions = ACH:Group(L["Spacing"], nil, 2, nil, DamageMeterGet, DamageMeterSet)
	section.args.windows.args.spacingOptions.inline = true
	section.args.windows.args.spacingOptions.args.innerSpacing = ACH:Range(L["Inner Spacing"], L["Space between the session windows."], 1, { min = -20, max = 20, step = 1 }, nil, nil, nil, function() local db = Private.Addon.db.profile.damageMeter return not db.enable or db.windowCount < 2 end)
	section.args.windows.args.spacingOptions.args.outerSpacing = ACH:Range(L["Outer Spacing"], L["Space between the frame border and the session windows."], 2, { min = -20, max = 20, step = 1 })

	for index = 1, 4 do
		section.args.windows.args['window' .. index] = BuildWindowGroup(index, index + 2)
	end

	section.args.bars = ACH:Group(L["Bars"], nil, 4, nil, DamageMeterGet, DamageMeterSet, DamageMeterDisabled)
	section.args.bars.args.generalOptions = ACH:Group(L["General"], nil, 1)
	section.args.bars.args.generalOptions.inline = true
	section.args.bars.args.generalOptions.args.barStyle = ACH:Select(L["Bar Style"], L["Layout of each bar, matches the Blizzard Edit Mode styles."], 1, { DEFAULT = L["Default"], BORDERED = L["Bordered"], THIN = L["Thin"] })
	section.args.bars.args.generalOptions.args.thinBarHeight = ACH:Range(L["Thin Bar Height"], L["Height of the bar below the text. Zero attempts to match Blizzards default."], 2, { min = 0, max = 50, step = 1 }, nil, nil, nil, nil, function() return Private.Addon.db.profile.damageMeter.barStyle ~= 'THIN' end)
	section.args.bars.args.generalOptions.args.barTexture = ACH:SharedMediaStatusbar(L["Bar Texture"], nil, 3)
	section.args.bars.args.generalOptions.args.showIcons = ACH:Toggle(L["Bar Icons"], L["Show the class or spec icon in front of each bar."], 4)
	section.args.bars.args.generalOptions.args.mouseoverHighlight = ACH:Toggle(L["Mouseover Highlight"], L["Highlight the bar under your cursor."], 5)
	section.args.bars.args.generalOptions.args.pinLocalPlayer = ACH:Toggle(L["Always Show Yourself"], L["Pin your own bar to the closest edge of the list while it would be scrolled out of view."], 6)
	section.args.bars.args.generalOptions.args.deathLogPopup = ACH:Toggle(L["Death Log Popup"], L["Open the death log of a death entry at your cursor instead of the Blizzard Death Recap frame."], 7)
	section.args.bars.args.sizeOptions = ACH:Group(L["Size and Spacing"], nil, 2)
	section.args.bars.args.sizeOptions.inline = true
	section.args.bars.args.sizeOptions.args.barHeight = ACH:Range(L["Bar Height"], nil, 1, { min = 8, max = 50, step = 1 })
	section.args.bars.args.sizeOptions.args.barSpacing = ACH:Range(L["Bar Spacing"], nil, 2, { min = 0, max = 20, step = 1 })
	section.args.bars.args.colorOptions = ACH:Group(L["Colors"], nil, 3)
	section.args.bars.args.colorOptions.inline = true
	section.args.bars.args.colorOptions.args.barColorType = ACH:Select(L["Bar Color"], nil, 1, { CLASS = L["Class Color"], CUSTOM = L["Custom"] })
	section.args.bars.args.colorOptions.args.barColor = ACH:Color(L["Custom Color"], L["Also used for creatures and sources without a class."], 2, nil, nil, DamageMeterColorGet, DamageMeterColorSet)
	section.args.bars.args.colorOptions.args.barAlpha = ACH:Range(L["Bar Alpha"], L["Transparency of the bar foreground."], 3, { min = 0, max = 1, step = 0.01, isPercent = true })
	section.args.bars.args.colorOptions.args.spacer = ACH:Spacer(4, 'full')
	section.args.bars.args.colorOptions.args.backdropColorType = ACH:Select(L["Backdrop Color"], L["Follow the bar color or use a custom color."], 5, { BAR = L["Bar Color"], CUSTOM = L["Custom"] })
	section.args.bars.args.colorOptions.args.backdropColor = ACH:Color(L["Custom Color"], nil, 6, nil, nil, DamageMeterColorGet, DamageMeterColorSet, nil, function() return Private.Addon.db.profile.damageMeter.backdropColorType ~= 'CUSTOM' end)
	section.args.bars.args.colorOptions.args.backdropAlpha = ACH:Range(L["Backdrop Alpha"], L["Transparency of the bar backdrop behind each bar."], 7, { min = 0, max = 1, step = 0.01, isPercent = true })
	section.args.text = ACH:Group(L["Text"], nil, 5, nil, DamageMeterGet, DamageMeterSet, DamageMeterDisabled)
	section.args.text.args.generalOptions = ACH:Group(L["General"], nil, 1)
	section.args.text.args.generalOptions.inline = true
	section.args.text.args.generalOptions.args.numberDisplay = ACH:Select(L["Number Display"], nil, 1, { MINIMAL = L["Minimal"], COMPACT = L["Compact"], COMPLETE = L["Complete"] })
	section.args.text.args.generalOptions.args.bracketStyle = ACH:Select(L["Brackets"], L["Bracket style around the secondary number."], 2, { PARENTHESES = '( )', SQUARE = '[ ]', NONE = _G.NONE }, nil, nil, nil, nil, DamageMeterNoSecondary)
	section.args.text.args.generalOptions.args.valueSpacing = ACH:Range(L["Number Spacing"], L["Space between the primary and the secondary number."], 3, { min = 0, max = 30, step = 1 }, nil, nil, nil, DamageMeterNoSecondary)
	section.args.text.args.generalOptions.args.showRank = ACH:Toggle(L["Show Rank Numbers"], L["Show the rank number in front of each name."], 4)
	section.args.text.args.generalOptions.args.rankSpacing = ACH:Range(L["Rank Spacing"], L["Space between the rank number and the name. Every name lines up at the same position."], 5, { min = 0, max = 30, step = 1 }, nil, nil, nil, nil, function() return not Private.Addon.db.profile.damageMeter.showRank end)
	section.args.text.args.generalOptions.args.stripRealm = ACH:Toggle(L["Strip Realm Names"], L["Remove the realm name from cross realm players."], 6)
	section.args.text.args.positionOptions = ACH:Group(L["Position"], nil, 2)
	section.args.text.args.positionOptions.inline = true
	section.args.text.args.positionOptions.args.nameXOffset = ACH:Range(L["Name X Offset"], nil, 1, { min = -100, max = 100, step = 1 })
	section.args.text.args.positionOptions.args.nameYOffset = ACH:Range(L["Name Y Offset"], nil, 2, { min = -100, max = 100, step = 1 })
	section.args.text.args.positionOptions.args.valueXOffset = ACH:Range(L["Number X Offset"], nil, 3, { min = -100, max = 100, step = 1 })
	section.args.text.args.positionOptions.args.valueYOffset = ACH:Range(L["Number Y Offset"], nil, 4, { min = -100, max = 100, step = 1 })
	section.args.text.args.colorOptions = ACH:Group(L["Colors"], nil, 3)
	section.args.text.args.colorOptions.inline = true
	section.args.text.args.colorOptions.args.nameColorType = ACH:Select(L["Name Color"], L["Color of the name text on each bar."], 1, { CUSTOM = L["Custom"], CLASS = L["Class Color"] })
	section.args.text.args.colorOptions.args.nameColor = ACH:Color(L["Custom Color"], nil, 2, nil, nil, DamageMeterColorGet, DamageMeterColorSet, nil, function() return Private.Addon.db.profile.damageMeter.nameColorType ~= 'CUSTOM' end)
	section.args.text.args.colorOptions.args.valueColorType = ACH:Select(L["Number Color"], L["Color of the number text on each bar."], 3, { CUSTOM = L["Custom"], CLASS = L["Class Color"] })
	section.args.text.args.colorOptions.args.valueColor = ACH:Color(L["Custom Color"], nil, 4, nil, nil, DamageMeterColorGet, DamageMeterColorSet, nil, function() return Private.Addon.db.profile.damageMeter.valueColorType ~= 'CUSTOM' end)
	section.args.text.args.fontOptions = FontGroup(L["Font"], 4, 26)
	section.args.headerOptions = ACH:Group(L["Header"], nil, 6, nil, DamageMeterGet, DamageMeterSet, DamageMeterDisabled)
	section.args.headerOptions.args.generalOptions = ACH:Group(L["General"], nil, 1)
	section.args.headerOptions.args.generalOptions.inline = true
	section.args.headerOptions.args.generalOptions.args.useValueColor = ACH:Toggle(L["Use Value Color"], L["Color the header text with the ElvUI value color instead of white."], 1)
	section.args.headerOptions.args.sizeOptions = ACH:Group(L["Size"], nil, 2)
	section.args.headerOptions.args.sizeOptions.inline = true
	section.args.headerOptions.args.sizeOptions.args.headerHeight = ACH:Range(L["Header Height"], nil, 1, { min = 12, max = 40, step = 1 })
	section.args.headerOptions.args.sizeOptions.args.headerIconSize = ACH:Range(L["Icon Size"], L["Size of the icons in the header."], 2, { min = 8, max = 40, step = 1 })
	section.args.headerOptions.args.positionOptions = ACH:Group(L["Position"], nil, 3)
	section.args.headerOptions.args.positionOptions.inline = true
	section.args.headerOptions.args.positionOptions.args.headerTypeXOffset = ACH:Range(L["Title X Offset"], nil, 1, { min = -100, max = 100, step = 1 })
	section.args.headerOptions.args.positionOptions.args.headerTypeYOffset = ACH:Range(L["Title Y Offset"], nil, 2, { min = -100, max = 100, step = 1 })
	section.args.headerOptions.args.positionOptions.args.headerSettingsXOffset = ACH:Range(GetIconName(L["X Offset"], 'DM_Settings'), nil, 3, { min = -100, max = 100, step = 1 })
	section.args.headerOptions.args.positionOptions.args.headerSettingsYOffset = ACH:Range(GetIconName(L["Y Offset"], 'DM_Settings'), nil, 4, { min = -100, max = 100, step = 1 })
	section.args.headerOptions.args.positionOptions.args.headerSessionXOffset = ACH:Range(GetIconName(L["X Offset"], 'DM_Sessions'), nil, 5, { min = -100, max = 100, step = 1 })
	section.args.headerOptions.args.positionOptions.args.headerSessionYOffset = ACH:Range(GetIconName(L["Y Offset"], 'DM_Sessions'), nil, 6, { min = -100, max = 100, step = 1 })
	section.args.headerOptions.args.positionOptions.args.headerResetXOffset = ACH:Range(GetIconName(L["X Offset"], 'DM_Reset'), nil, 7, { min = -100, max = 100, step = 1 })
	section.args.headerOptions.args.positionOptions.args.headerResetYOffset = ACH:Range(GetIconName(L["Y Offset"], 'DM_Reset'), nil, 8, { min = -100, max = 100, step = 1 })
	section.args.headerOptions.args.fontOptions = FontGroup(L["Font"], 4, 26, nil, 'headerFont')
	section.args.bookmarkOptions = ACH:Group(L["Bookmarks"], nil, 7, nil, DamageMeterGet, DamageMeterSet, DamageMeterDisabled)
	section.args.bookmarkOptions.args.bookmarkDesc = ACH:Group(L["Description"], nil, 1)
	section.args.bookmarkOptions.args.bookmarkDesc.inline = true
	section.args.bookmarkOptions.args.bookmarkDesc.args.desc = ACH:Description(L["Right click a session window to open the bookmark panel over its bars.\n\nLeft click a bookmark to switch the window to it, right click one to drop it again. Drag one up or down to give it another place. The last slot opens a menu with the types you are missing."], 1, 'medium')
	section.args.bookmarkOptions.args.generalOptions = ACH:Group(L["General"], nil, 2)
	section.args.bookmarkOptions.args.generalOptions.inline = true
	section.args.bookmarkOptions.args.generalOptions.args.showBookmarks = ACH:Toggle(L["Enable"], L["Open the bookmark panel with a right click on a session window."], 1)
	section.args.bookmarkOptions.args.generalOptions.args.bookmarkDragDrop = ACH:Toggle(L["Drag and Drop"], L["Drag a bookmark up or down to change its place in the panel."], 2, nil, nil, nil, nil, nil, function() return not Private.Addon.db.profile.damageMeter.showBookmarks end)
	section.args.bookmarkOptions.args.bookmarks = ACH:MultiSelect(L["Bookmarks"], L["Types the panel offers, new ones are added to the end of the list."], 3, DamageMeterTypes, nil, nil, function(_, key) return Private.Addon.db.profile.damageMeter.bookmarks[key] and true or false end, function(_, key, value) Private.Modules.DamageMeter:SetBookmark(key, value) Private:DamageMeter_UpdateAll() end, function() local db = Private.Addon.db.profile.damageMeter return not db.enable or not db.showBookmarks end)
	return section
end

-- Build ElvUI Layouts Section
local function BuildElvUILayoutSection()
	if not Private.ElvUI then return end -- ElvUI section
	local section = ACH:Group(GetIconName(L["ElvUI Layouts"], 'Layouts'), nil, 40)
	section.args.header1 = ACH:Header(L["ElvUI Layouts"], 1)
	section.args.midnight = ACH:Group(L["Midnight Layouts"], nil, 2)
	section.args.midnight.inline = true
	section.args.midnight.args.main = ACH:Execute(L["DPS & Tanks"], nil, 1, function() Private:Setup_Layout('main') StaticPopup_Show('LUCKYONE_RL') end, nil, true)
	section.args.midnight.args.healingVertical = ACH:Execute(L["Healing Vertical"], nil, 2, function() Private:Setup_Layout('healing') StaticPopup_Show('LUCKYONE_RL') end, nil, true)
	section.args.midnight.args.healingHorizontal = ACH:Execute(L["Healing Horizontal"], nil, 3, function() Private:Setup_Layout('healing', nil, 'horizontal') StaticPopup_Show('LUCKYONE_RL') end, nil, true)
	section.args.header2 = ACH:Header(L["ElvUI Themes"], 3)
	section.args.themes = ACH:Group(L["UnitFrames Color Theme"], nil, 4)
	section.args.themes.inline = true
	section.args.themes.args.dark = ACH:Execute(L["Dark"], L["Dark Style (Default)"], 1, function() Private:Setup_Theme('dark') end, nil, true)
	section.args.themes.args.class = ACH:Execute(L["Class Color"], L["Class Color Style"], 2, function() Private:Setup_Theme('class') end, nil, true)
	section.args.header3 = ACH:Header(L["Auras"], 5)
	section.args.filters = ACH:Group(L["Filters"], nil, 6)
	section.args.filters.inline = true
	section.args.filters.args.setup = ACH:Execute(L["Setup Aura Indicators"], nil, 1, function() Private:Setup_Filters() StaticPopup_Show('LUCKYONE_RL') end)
	section.args.Desc = ACH:Group(L["Description"], nil, 7)
	section.args.Desc.inline = true
	section.args.Desc.args.cvars = ACH:Description(L["This will apply Luckyones Aura Indicator edit and set the style to Textured."], 2, 'medium')
	return section
end

-- Build ElvUI Tweaks Section
local function BuildElvUITweaksSection()
	if not Private.ElvUI then return end -- ElvUI section
	local section = ACH:Group(GetIconName(L["ElvUI Tweaks"], 'Tweaks'), nil, 45)
	section.args.header = ACH:Header(L["ElvUI Tweaks"], 1)
	section.args.toggles = ACH:Group(L["Toggles"], nil, 2)
	section.args.toggles.inline = true
	section.args.toggles.args.mythicVisibility = ACH:Toggle(L["Mythic Raidframe Visibility"], L["Feature explained in the description below"], 1, nil, nil, nil, function() return Private.Addon.db.profile.misc.mythicVisibility end, function(_, value) Private.Addon.db.profile.misc.mythicVisibility = value Private:MythicVisibility() end, nil, not Private.isRetail)
	section.args.toggles.args.dataTextsTweaks = ACH:Toggle(L["DataTexts Tweaks"], L["Feature explained in the description below"], 2, nil, nil, nil, function() return Private.Addon.db.profile.misc.dataTextsTweaks end, function(_, value) Private.Addon.db.profile.misc.dataTextsTweaks = value Private:DataTextsTweaks() end)
	section.args.nameplates = ACH:Group(L["Nameplates"], nil, 3)
	section.args.nameplates.inline = true
	section.args.nameplates.args.focusTextureEnable = ACH:Toggle(L["Enable Focus Texture"], nil, 1, nil, nil, nil, function() return Private.Addon.db.profile.nameplates.focusTextureEnable end, function(_, value) Private.Addon.db.profile.nameplates.focusTextureEnable = value Private:UpdateSpecialNameplateTextures() end, nil, Private.isClassic)
	section.args.nameplates.args.focusTexture = ACH:SharedMediaStatusbar(L["Select Texture"], nil, 2, nil, function() return Private.Addon.db.profile.nameplates.focusTexture end, function(_, value) Private.Addon.db.profile.nameplates.focusTexture = value Private:UpdateSpecialNameplateTextures() end, function() return not Private.Addon.db.profile.nameplates.focusTextureEnable end, Private.isClassic)
	section.args.nameplates.args.spacer = ACH:Spacer(3, 'full', Private.isClassic)
	section.args.nameplates.args.targetTextureEnable = ACH:Toggle(L["Enable Target Texture"], nil, 4, nil, nil, nil, function() return Private.Addon.db.profile.nameplates.targetTextureEnable end, function(_, value) Private.Addon.db.profile.nameplates.targetTextureEnable = value Private:UpdateSpecialNameplateTextures() end)
	section.args.nameplates.args.targetTexture = ACH:SharedMediaStatusbar(L["Select Texture"], nil, 5, nil, function() return Private.Addon.db.profile.nameplates.targetTexture end, function(_, value) Private.Addon.db.profile.nameplates.targetTexture = value Private:UpdateSpecialNameplateTextures() end, function() return not Private.Addon.db.profile.nameplates.targetTextureEnable end)
	section.args.mythicVisibilityDesc = ACH:Group(L["Mythic Raidframe Visibility explained"], nil, 4, nil, nil, nil, nil, not Private.isRetail)
	section.args.mythicVisibilityDesc.inline = true
	section.args.mythicVisibilityDesc.args.desc = ACH:Description(L["Your Raid 1 frames will be enabled if you enter Mythic difficulty (Triggers after loading screen)\nYour Raid 2 frames will be disabled if you enter Mythic difficulty (Triggers after loading screen)\n\nAdditionally the maxAllowedGroups setting will be enabled and the visibility state gets modified\nBenched people in groups 5-8 while not show up when you're Mythic raiding\n\nAll changes mentioned above will revert back to default upon leaving the raid"], 1, 'medium')
	section.args.dataTextsTweaksDesc = ACH:Group(L["DataTexts Tweaks explained"], nil, 5)
	section.args.dataTextsTweaksDesc.inline = true
	section.args.dataTextsTweaksDesc.args.desc = ACH:Description(L["Adjusts the width of the 'FPS - Combat Time - Durability' DataText based on your LuckyoneUI layout\n\nThe DPS & Tanks layout will match the default width of my Action Bars\nThe Healing layout will match the default width of my Raidframes\n\nAll changes mentioned above will trigger upon changing your ElvUI profile\nThis includes specialization-based profile loading in ElvUI profiles"], 1, 'medium')
	return section
end

-- Build Graphics Section
local function BuildGraphicsSection()
	local section = ACH:Group(GetIconName(L["Graphics"], 'Graphics'), nil, 50, nil, function(info) return GetCVarBool(info[#info]) end, function(info, value) SetCVar(info[#info], value and 1 or 0) end)
	section.args.header = ACH:Header(L["Graphics"], 1)
	section.args.toggles = ACH:Group(L["General"], nil, 2)
	section.args.toggles.inline = true
	section.args.toggles.args.ResampleAlwaysSharpen = ACH:Toggle('ResampleAlwaysSharpen', L["Game Default: off | Suggestion: on\n\nBox checked means on/enabled"], 1)
	section.args.toggles.args.GxAllowCachelessShaderMode = ACH:Toggle('CachelessShaderMode', L["Game Default: off | Suggestion: off\n\nBox checked means on/enabled"], 2)
	section.args.cosmetic = ACH:Group(L["Cosmetic"], nil, 3)
	section.args.cosmetic.inline = true
	section.args.cosmetic.args.ffxDeath = ACH:Toggle('ffx Death', L["Game Default: on | Suggestion: off\n\nBox checked means on/enabled"], 1)
	section.args.cosmetic.args.ffxGlow = ACH:Toggle('ffx Glow', L["Game Default: on | Suggestion: off\n\nBox checked means on/enabled"], 2)
	section.args.cosmetic.args.ffxNether = ACH:Toggle('ffx Nether', L["Game Default: on | Suggestion: off\n\nBox checked means on/enabled"], 3)
	section.args.cosmetic.args.ffxVenari = ACH:Toggle('ffx Venari', L["Game Default: on | Suggestion: off\n\nBox checked means on/enabled"], 4)
	section.args.cosmetic.args.ffxLingeringVenari = ACH:Toggle('ffx Lingering Venari', L["Game Default: on | Suggestion: off\n\nBox checked means on/enabled"], 5)
	return section
end

-- Build Map Section
local function BuildMapSection()
	if not Private.ElvUI then return end -- ElvUI section
	local section = ACH:Group(GetIconName(L["Map"], 'Map'), nil, 55)
	section.args.header = ACH:Header(L["Map"], 1)
	section.args.minimapButtons = ACH:Group(L["Minimap Buttons"], nil, 2, nil, function(info) return Private.Addon.db.profile.map.minimap.buttons[info[#info]] end, function(info, value) Private.Addon.db.profile.map.minimap.buttons[info[#info]] = value Private:UpdateMinimapButtonBar() end)
	section.args.minimapButtons.inline = true
	section.args.minimapButtons.args.enable = ACH:Toggle(L["Enable"], L["Collect LibDBIcon minimap buttons into a squared bar under the Minimap."], 1, nil, nil, nil, nil, function(_, value) Private.Addon.db.profile.map.minimap.buttons.enable = value StaticPopup_Show('LUCKYONE_RL') end)
	section.args.minimapButtons.args.mouseover = ACH:Toggle(L["Mouseover"], L["Show the Minimap button bar only on mouseover."], 2, nil, nil, nil, nil, nil, function() return not Private.Addon.db.profile.map.minimap.buttons.enable end)
	section.args.minimapButtons.args.holder = ACH:Input(L["Anchor"], L["Frame name the Minimap button bar is anchored to."], 3, nil, nil, nil, nil, function() return not Private.Addon.db.profile.map.minimap.buttons.enable end)
	section.args.minimapButtons.args.xOffset = ACH:Range(L["X Offset"], nil, 4, { min = -200, max = 200, step = 1 }, nil, nil, nil, function() return not Private.Addon.db.profile.map.minimap.buttons.enable end)
	section.args.minimapButtons.args.yOffset = ACH:Range(L["Y Offset"], nil, 5, { min = -200, max = 200, step = 1 }, nil, nil, nil, function() return not Private.Addon.db.profile.map.minimap.buttons.enable end)
	section.args.minimapButtons.args.size = ACH:Range(L["Icon Size"], nil, 6, { min = 8, max = 54, step = 1 }, nil, nil, nil, function() return not Private.Addon.db.profile.map.minimap.buttons.enable end)
	section.args.minimapButtons.args.spacing = ACH:Range(L["Spacing"], nil, 7, { min = -1, max = 12, step = 1 }, nil, nil, nil, function() return not Private.Addon.db.profile.map.minimap.buttons.enable end)
	section.args.minimapButtons.args.perRow = ACH:Range(L["Buttons Per Row"], nil, 8, { min = 1, max = 20, step = 1 }, nil, nil, nil, function() return not Private.Addon.db.profile.map.minimap.buttons.enable end)
	section.args.blizzardButtons = ACH:Group(L["Blizzard Buttons"], nil, 3, nil, function(info) return Private.Addon.db.profile.map.minimap.buttons.blizzard[info[#info]] end, function(info, value) Private.Addon.db.profile.map.minimap.buttons.blizzard[info[#info]] = value StaticPopup_Show('LUCKYONE_RL') end, function() return not Private.Addon.db.profile.map.minimap.buttons.enable end, not Private.isRetail)
	section.args.blizzardButtons.inline = true
	section.args.blizzardButtons.args.expansionLandingPage = ACH:Toggle(L["Expansion Landing Page"], L["Include the Expansion Landing Page button in the Minimap button bar."], 1)
	section.args.minimapButtonsDesc = ACH:Group(L["Minimap Buttons explained"], nil, 4)
	section.args.minimapButtonsDesc.inline = true
	section.args.minimapButtonsDesc.args.desc = ACH:Description(L["The order of icons is sorted alphabetically, starting on the right side.\nException 1: BugSack - it's hardcoded to be the right-most icon.\nException 2: Blizzard buttons - they're hardcoded to be the last icon."], 1, 'medium')
	section.args.defaults = ACH:Group(L["Restore LuckyoneUI Defaults"], nil, 5)
	section.args.defaults.inline = true
	section.args.defaults.args.minimapButtons = ACH:Execute(L["Restore Defaults"], L["Wipe all Minimap button settings, the module itself stays enabled."], 1, function() Private:MinimapButtons_ResetDefaults() end, nil, true)
	return section
end

-- Mailbox favorites
local mailboxSelected -- Name of the entry the class and faction options change
local mailboxName = '' -- Character of the entry being added
local mailboxRealm = Private.myNormalizedRealm -- Realm of the entry being added, our current one by default

local function MailboxColor(class, name)
	local color = RAID_CLASS_COLORS[class]
	return color and color:WrapTextInColorCode(name) or name
end

local function MailboxEntries()
	local values = {}

	for _, favorite in ipairs(Private.Addon.db.profile.misc.mailbox.favorites) do
		values[favorite.name] = MailboxColor(favorite.class, favorite.name)
	end

	return values
end

local function MailboxClasses()
	local values = {}

	for _, class in ipairs(CLASS_SORT_ORDER) do
		values[class] = MailboxColor(class, LOCALIZED_CLASS_NAMES_MALE[class])
	end

	return values
end

local function MailboxEntry()
	if not mailboxSelected then return end

	for _, favorite in ipairs(Private.Addon.db.profile.misc.mailbox.favorites) do
		if favorite.name == mailboxSelected then return favorite end
	end
end

local function FriendsListDisabled()
	return not Private.Addon.db.profile.misc.friendsList.enable
end

-- Objective tracker, both header tabs share the same options
local ObjectiveTrackerColors = { DEFAULT = L["Default"], CLASS = L["Class Color"], CUSTOM = L["Custom"] }

local function ObjectiveTrackerDisabled()
	return not Private.Addon.db.profile.misc.objectiveTracker.enable
end

local function ObjectiveTrackerSkinDisabled()
	return ObjectiveTrackerDisabled() or not (ElvUI[1].private.skins.blizzard.enable and ElvUI[1].private.skins.blizzard.objectiveTracker)
end

local function ObjectiveTrackerHeaderGroup(name, key, order)
	local function NoUnderline() return not Private.Addon.db.profile.misc.objectiveTracker[key].underline end

	local group = ACH:Group(name, nil, order, nil, function(info) return Private.Addon.db.profile.misc.objectiveTracker[key][info[#info]] end, function(info, value) Private.Addon.db.profile.misc.objectiveTracker[key][info[#info]] = value Private:ObjectiveTracker_Update() end, ObjectiveTrackerDisabled)
	group.args.fontGroup = FontGroup(L["Font"], 1, 32)
	group.args.colorGroup = ACH:Group(L["Colors"], nil, 2)
	group.args.colorGroup.inline = true
	group.args.colorGroup.args.colorType = ACH:Select(L["Text Color"], nil, 1, ObjectiveTrackerColors)
	group.args.colorGroup.args.color = ACH:Color(L["Custom Color"], nil, 2, nil, nil, function() local color = Private.Addon.db.profile.misc.objectiveTracker[key].color return color.r, color.g, color.b end, function(_, r, g, b) local color = Private.Addon.db.profile.misc.objectiveTracker[key].color color.r, color.g, color.b = r, g, b Private:ObjectiveTracker_Update() end, nil, function() return Private.Addon.db.profile.misc.objectiveTracker[key].colorType ~= 'CUSTOM' end)
	group.args.colorGroup.args.hideBackground = ACH:Toggle(L["Hide Background"], L["Hide the Blizzard artwork behind the header text."], 3)
	group.args.underlineGroup = ACH:Group(L["Underline"], nil, 3)
	group.args.underlineGroup.inline = true
	group.args.underlineGroup.args.underline = ACH:Toggle(L["Enable"], L["Show a colored bar below the header."], 1)
	group.args.underlineGroup.args.underlineBorder = ACH:Toggle(L["Border"], L["Black one pixel border around the bar."], 2, nil, nil, nil, nil, nil, NoUnderline)
	group.args.underlineGroup.args.underlineTexture = TextureSelect(3, NoUnderline)
	group.args.underlineGroup.args.underlineColorType = ACH:Select(_G.COLOR, nil, 4, { CLASS = L["Class Color"], CUSTOM = L["Custom"] }, nil, nil, nil, nil, NoUnderline)
	group.args.underlineGroup.args.underlineColor = ACH:Color(L["Custom Color"], nil, 5, nil, nil, function() local color = Private.Addon.db.profile.misc.objectiveTracker[key].underlineColor return color.r, color.g, color.b end, function(_, r, g, b) local color = Private.Addon.db.profile.misc.objectiveTracker[key].underlineColor color.r, color.g, color.b = r, g, b Private:ObjectiveTracker_Update() end, NoUnderline, function() return Private.Addon.db.profile.misc.objectiveTracker[key].underlineColorType ~= 'CUSTOM' end)
	group.args.underlineGroup.args.underlineHeight = ACH:Range(L["Height"], L["Grows upward from the bottom edge of the header, a big value turns the bar into a background behind the text."], 6, { min = 1, max = 30, step = 1 }, nil, nil, nil, NoUnderline)
	group.args.underlineGroup.args.underlineWidth = ACH:Range(L["Width"], L["Zero follows the width of the header."], 7, { min = 0, max = 400, step = 1 }, nil, nil, nil, NoUnderline)
	group.args.underlineGroup.args.underlineOffset = ACH:Range(L["Y Offset"], nil, 8, { min = -30, max = 30, step = 1 }, nil, nil, nil, NoUnderline)
	return group
end

-- Build Misc Section
local function BuildMiscSection()
	local section = ACH:Group(GetIconName(L["Misc"], 'Misc'), nil, 60, 'tab')
	section.args.header = ACH:Header(L["Misc"], 1)
	section.args.combatText = ACH:Group(L["Combat Text"], nil, 2, nil, function(info) return Private.Addon.db.profile.misc.combatText[info[#info]] end, function(info, value) Private.Addon.db.profile.misc.combatText[info[#info]] = value Private:CombatText_Update() end)
	section.args.combatText.args.generalOptions = ACH:Group(L["General"], nil, 1)
	section.args.combatText.args.generalOptions.inline = true
	section.args.combatText.args.generalOptions.args.enable = ACH:Toggle(L["Enable"], L["Show a customizable text on screen when entering and leaving combat."], 1)
	section.args.combatText.args.generalOptions.args.enterText = ACH:Input(L["Entering Text"], nil, 2, nil, nil, nil, nil, function() return not Private.Addon.db.profile.misc.combatText.enable end)
	section.args.combatText.args.generalOptions.args.leaveText = ACH:Input(L["Leaving Text"], nil, 3, nil, nil, nil, nil, function() return not Private.Addon.db.profile.misc.combatText.enable end)
	section.args.combatText.args.generalOptions.args.fadeTime = ACH:Range(L["Fade Time"], L["Duration of the fade out in seconds."], 4, { min = 0.1, max = 10, step = 0.1 }, nil, nil, nil, function() return not Private.Addon.db.profile.misc.combatText.enable end)
	section.args.combatText.args.generalOptions.args.enterColor = ACH:Color(L["Entering Color"], nil, 5, nil, nil, function() local color = Private.Addon.db.profile.misc.combatText.enterColor return color.r, color.g, color.b end, function(_, r, g, b) local color = Private.Addon.db.profile.misc.combatText.enterColor color.r, color.g, color.b = r, g, b end, function() return not Private.Addon.db.profile.misc.combatText.enable end)
	section.args.combatText.args.generalOptions.args.leaveColor = ACH:Color(L["Leaving Color"], nil, 6, nil, nil, function() local color = Private.Addon.db.profile.misc.combatText.leaveColor return color.r, color.g, color.b end, function(_, r, g, b) local color = Private.Addon.db.profile.misc.combatText.leaveColor color.r, color.g, color.b = r, g, b end, function() return not Private.Addon.db.profile.misc.combatText.enable end)
	section.args.combatText.args.anchorGroup = ACH:Group(L["Anchor"], nil, 2, nil, nil, nil, function() return not Private.Addon.db.profile.misc.combatText.enable end)
	section.args.combatText.args.anchorGroup.inline = true
	section.args.combatText.args.anchorGroup.args.anchor = ACH:Input(L["Anchor"], L["Frame name the combat text is anchored to."], 1)
	section.args.combatText.args.anchorGroup.args.xOffset = ACH:Range(L["X Offset"], nil, 2, { min = -1000, max = 1000, step = 1 })
	section.args.combatText.args.anchorGroup.args.yOffset = ACH:Range(L["Y Offset"], nil, 3, { min = -1000, max = 1000, step = 1 })
	section.args.combatText.args.fontGroup = FontGroup(L["Font"], 3, 64, function() return not Private.Addon.db.profile.misc.combatText.enable end)
	section.args.combatText.args.defaults = ACH:Group(L["Restore LuckyoneUI Defaults"], nil, 4)
	section.args.combatText.args.defaults.inline = true
	section.args.combatText.args.defaults.args.combatText = ACH:Execute(L["Restore Defaults"], L["Wipe all combat text settings, the option itself stays enabled."], 1, function() Private:CombatText_ResetDefaults() end, nil, true)
	section.args.mailbox = ACH:Group(L["Mailbox Favorites"], nil, 3, nil, function(info) return Private.Addon.db.profile.misc.mailbox[info[#info]] end, function(info, value) Private.Addon.db.profile.misc.mailbox[info[#info]] = value Private:MailboxFavorites() Private:MailboxFavorites_Update() end)
	section.args.mailbox.args.generalOptions = ACH:Group(L["General"], nil, 1)
	section.args.mailbox.args.generalOptions.inline = true
	section.args.mailbox.args.generalOptions.args.enable = ACH:Toggle(L["Enable"], L["Show a favorite list next to the Mailbox while the Send Mail tab is open."], 1)
	section.args.mailbox.args.generalOptions.args.currentRealm = ACH:Toggle(L["Current Realm Only"], L["Only show favorites that are on the realm you are playing on."], 2, nil, nil, nil, nil, nil, function() return not Private.Addon.db.profile.misc.mailbox.enable end)
	section.args.mailbox.args.favorites = ACH:Group(L["Favorites"], nil, 2, nil, nil, nil, function() return not Private.Addon.db.profile.misc.mailbox.enable end)
	section.args.mailbox.args.favorites.inline = true
	section.args.mailbox.args.favorites.args.name = ACH:Input(_G.NAME, nil, 1, nil, 'full', function() return mailboxName end, function(_, value) mailboxName = strtrim(value) end)
	section.args.mailbox.args.favorites.args.realm = ACH:Input(L["Realm"], nil, 2, nil, 'full', function() return mailboxRealm end, function(_, value) mailboxRealm = strtrim(value) end)
	section.args.mailbox.args.favorites.args.add = ACH:Execute(_G.ADD, nil, 3, function() local entry = Private:MailboxFavorites_Add(mailboxName, mailboxRealm) if entry then mailboxSelected = entry mailboxName = '' end end, nil, nil, nil, nil, nil, function() return mailboxName == '' or mailboxRealm == '' end)
	section.args.mailbox.args.favoriteOptions = ACH:Group(L["Options"], nil, 3, nil, nil, nil, function() return not Private.Addon.db.profile.misc.mailbox.enable end)
	section.args.mailbox.args.favoriteOptions.inline = true
	section.args.mailbox.args.favoriteOptions.args.selected = ACH:Select(L["Favorite"], L["Pick the entry the options below change."], 1, MailboxEntries, nil, 'full', function() return mailboxSelected end, function(_, value) mailboxSelected = value end)
	section.args.mailbox.args.favoriteOptions.args.class = ACH:Select(_G.CLASS, nil, 2, MailboxClasses, nil, nil, function() local favorite = MailboxEntry() return favorite and favorite.class end, function(_, value) local favorite = MailboxEntry() if favorite then favorite.class = value Private:MailboxFavorites_Update() end end, function() return not MailboxEntry() end)
	section.args.mailbox.args.favoriteOptions.args.faction = ACH:Select(_G.FACTION, nil, 3, { Alliance = _G.FACTION_ALLIANCE, Horde = _G.FACTION_HORDE }, nil, nil, function() local favorite = MailboxEntry() return favorite and favorite.faction end, function(_, value) local favorite = MailboxEntry() if favorite then favorite.faction = value Private:MailboxFavorites_Update() end end, function() return not MailboxEntry() end)
	section.args.mailbox.args.favoriteOptions.args.remove = ACH:Execute(_G.REMOVE, nil, 4, function() Private:MailboxFavorites_Remove(mailboxSelected) mailboxSelected = nil end, nil, true, nil, nil, nil, function() return not MailboxEntry() end)
	section.args.mailbox.args.fontGroup = FontGroup(L["Font"], 4, 26, function() return not Private.Addon.db.profile.misc.mailbox.enable end)
	section.args.friendsList = ACH:Group(L["Friends List"], nil, 4, nil, function(info) return Private.Addon.db.profile.misc.friendsList[info[#info]] end, function(info, value) Private.Addon.db.profile.misc.friendsList[info[#info]] = value Private:FriendsList() Private:FriendsList_Update() end)
	section.args.friendsList.args.generalOptions = ACH:Group(L["General"], nil, 1)
	section.args.friendsList.args.generalOptions.inline = true
	section.args.friendsList.args.generalOptions.args.enable = ACH:Toggle(L["Enable"], L["Tweak the Blizzard friends list with class colors, levels, faction icons, realm names and custom fonts."], 1)
	section.args.friendsList.args.generalOptions.args.level = ACH:Toggle(L["Show Level"], L["Show the character level behind the name."], 2, nil, nil, nil, nil, nil, FriendsListDisabled)
	section.args.friendsList.args.generalOptions.args.factionIcon = ACH:Toggle(L["Faction Icon"], L["Replace the game icon next to the invite button with the faction icon of the character."], 3, nil, nil, nil, nil, nil, FriendsListDisabled)
	section.args.friendsList.args.generalOptions.args.realm = ACH:Toggle(L["Realm Name"], L["Show the realm name next to the zone text."], 4, nil, nil, nil, nil, nil, FriendsListDisabled)
	section.args.friendsList.args.generalOptions.args.bracketStyle = ACH:Select(L["Brackets"], L["Bracket style around the character name of Battle.net friends."], 6, { PARENTHESES = '( )', SQUARE = '[ ]', NONE = _G.NONE }, nil, nil, nil, nil, FriendsListDisabled)
	section.args.friendsList.args.generalOptions.args.realmSeparator = ACH:Select(L["Separator"], L["Separator between the zone and the realm name."], 5, { DASH = '-', PIPE = '||' }, nil, nil, nil, nil, FriendsListDisabled, function() return not Private.Addon.db.profile.misc.friendsList.realm end)
	section.args.friendsList.args.generalOptions.args.statusIcon = ACH:Select(L["Status Icon"], L["Style of the status icon in front of each friend."], 7, { DEFAULT = L["Default"], SQUARE = L["Square"] }, nil, nil, nil, nil, FriendsListDisabled)
	section.args.friendsList.args.colorOptions = ACH:Group(L["Colors"], nil, 2, nil, nil, nil, FriendsListDisabled)
	section.args.friendsList.args.colorOptions.inline = true
	section.args.friendsList.args.colorOptions.args.classColor = ACH:Toggle(L["Class Color"], L["Color the character names by class."], 1)
	section.args.friendsList.args.colorOptions.args.infoColorType = ACH:Select(L["Zone Color"], L["Color of the zone and realm text of online friends."], 2, { DEFAULT = L["Default"], CUSTOM = L["Custom"] })
	section.args.friendsList.args.colorOptions.args.infoColor = ACH:Color(L["Custom Color"], nil, 3, nil, nil, function() local color = Private.Addon.db.profile.misc.friendsList.infoColor return color.r, color.g, color.b end, function(_, r, g, b) local color = Private.Addon.db.profile.misc.friendsList.infoColor color.r, color.g, color.b = r, g, b Private:FriendsList_Update() end, nil, function() return Private.Addon.db.profile.misc.friendsList.infoColorType ~= 'CUSTOM' end)
	section.args.friendsList.args.nameFont = FontGroup(L["Name Font"], 3, 20, FriendsListDisabled)
	section.args.friendsList.args.infoFont = FontGroup(L["Zone Font"], 4, 20, FriendsListDisabled, 'infoFont')
	section.args.friendsList.args.defaults = ACH:Group(L["Restore LuckyoneUI Defaults"], nil, 5)
	section.args.friendsList.args.defaults.inline = true
	section.args.friendsList.args.defaults.args.friendsList = ACH:Execute(L["Restore Defaults"], L["Wipe all friends list settings, the option itself stays enabled."], 1, function() Private:FriendsList_ResetDefaults() end, nil, true)
	section.args.objectiveTracker = ACH:Group(L["Objective Tracker"], nil, 5, 'tab', nil, nil, Private.IsAddOnLoaded('!KalielsTracker'), not Private.isRetail)
	section.args.objectiveTracker.args.general = ACH:Group(L["General"], nil, 1, nil, function(info) return Private.Addon.db.profile.misc.objectiveTracker[info[#info]] end, function(info, value) Private.Addon.db.profile.misc.objectiveTracker[info[#info]] = value if value then Private:ObjectiveTracker() else StaticPopup_Show('LUCKYONE_RL') end end)
	section.args.objectiveTracker.args.general.args.kalielsTracker = ACH:Description(L["Disabled while Kaliel's Tracker is loaded."], 0, 'medium', nil, nil, nil, nil, nil, not Private.IsAddOnLoaded('!KalielsTracker'))
	section.args.objectiveTracker.args.general.args.generalOptions = ACH:Group(L["General"], nil, 1)
	section.args.objectiveTracker.args.general.args.generalOptions.inline = true
	section.args.objectiveTracker.args.general.args.generalOptions.args.enable = ACH:Toggle(L["Enable"], L["Customize the fonts and colors of the Blizzard objective tracker and put an underline below its headers.\n\nDisabling needs a reload."], 1)
	section.args.objectiveTracker.args.general.args.generalOptions.args.findGroupSkin = ACH:Toggle(L["Find Group Button"], L["Skin the group finder button next to quests in ElvUI style.\n\nDisabling needs a reload."] .. '\n\n' .. L["Requires the ElvUI objective tracker skin."], 2, nil, nil, nil, nil, nil, ObjectiveTrackerSkinDisabled, not Private.ElvUI)
	section.args.objectiveTracker.args.general.args.generalOptions.args.scenarioSkin = ACH:Toggle(L["Scenario Block"], L["Skin the block with the dungeon, delve or scenario stage name in ElvUI style.\n\nDisabling needs a reload."] .. '\n\n' .. L["Requires the ElvUI objective tracker skin."], 3, nil, nil, nil, nil, nil, ObjectiveTrackerSkinDisabled, not Private.ElvUI)
	section.args.objectiveTracker.args.general.args.defaults = ACH:Group(L["Restore LuckyoneUI Defaults"], nil, 2)
	section.args.objectiveTracker.args.general.args.defaults.inline = true
	section.args.objectiveTracker.args.general.args.defaults.args.objectiveTracker = ACH:Execute(L["Restore Defaults"], L["Wipe all objective tracker settings, the option itself stays enabled."], 1, function() Private:ObjectiveTracker_ResetDefaults() end, nil, true)
	section.args.objectiveTracker.args.mainHeader = ObjectiveTrackerHeaderGroup(L["Main Header"], 'mainHeader', 2)
	section.args.objectiveTracker.args.categoryHeader = ObjectiveTrackerHeaderGroup(L["Category Header"], 'categoryHeader', 3)
	section.args.objectiveTracker.args.content = ACH:Group(L["Content"], nil, 4, nil, function(info) return Private.Addon.db.profile.misc.objectiveTracker.content[info[#info]] end, function(info, value) Private.Addon.db.profile.misc.objectiveTracker.content[info[#info]] = value Private:ObjectiveTracker_Update() end, ObjectiveTrackerDisabled)
	section.args.objectiveTracker.args.content.args.fontGroup = FontGroup(L["Font"], 1, 24)
	section.args.objectiveTracker.args.content.args.fontGroup.args.fontSize.desc = L["Quest titles and objectives share one font. Size changes settle on the next tracker update, quest progress or a zone change."]
	section.args.objectiveTracker.args.content.args.colorGroup = ACH:Group(L["Colors"], nil, 2)
	section.args.objectiveTracker.args.content.args.colorGroup.inline = true
	section.args.objectiveTracker.args.content.args.colorGroup.args.titleColorType = ACH:Select(L["Title Color"], nil, 1, ObjectiveTrackerColors)
	section.args.objectiveTracker.args.content.args.colorGroup.args.titleColor = ACH:Color(L["Custom Color"], nil, 2, nil, nil, function() local color = Private.Addon.db.profile.misc.objectiveTracker.content.titleColor return color.r, color.g, color.b end, function(_, r, g, b) local color = Private.Addon.db.profile.misc.objectiveTracker.content.titleColor color.r, color.g, color.b = r, g, b Private:ObjectiveTracker_Update() end, nil, function() return Private.Addon.db.profile.misc.objectiveTracker.content.titleColorType ~= 'CUSTOM' end)
	section.args.objectiveTracker.args.content.args.colorGroup.args.lineColorType = ACH:Select(L["Objective Color"], nil, 3, ObjectiveTrackerColors)
	section.args.objectiveTracker.args.content.args.colorGroup.args.lineColor = ACH:Color(L["Custom Color"], nil, 4, nil, nil, function() local color = Private.Addon.db.profile.misc.objectiveTracker.content.lineColor return color.r, color.g, color.b end, function(_, r, g, b) local color = Private.Addon.db.profile.misc.objectiveTracker.content.lineColor color.r, color.g, color.b = r, g, b Private:ObjectiveTracker_Update() end, nil, function() return Private.Addon.db.profile.misc.objectiveTracker.content.lineColorType ~= 'CUSTOM' end)
	section.args.objectiveTracker.args.content.args.colorGroup.args.completeColor = ACH:Color(L["Completed Color"], nil, 5, nil, nil, function() local color = Private.Addon.db.profile.misc.objectiveTracker.content.completeColor return color.r, color.g, color.b end, function(_, r, g, b) local color = Private.Addon.db.profile.misc.objectiveTracker.content.completeColor color.r, color.g, color.b = r, g, b Private:ObjectiveTracker_Update() end)
	section.args.objectiveTracker.args.content.args.colorGroup.args.failedColor = ACH:Color(L["Failed Color"], nil, 6, nil, nil, function() local color = Private.Addon.db.profile.misc.objectiveTracker.content.failedColor return color.r, color.g, color.b end, function(_, r, g, b) local color = Private.Addon.db.profile.misc.objectiveTracker.content.failedColor color.r, color.g, color.b = r, g, b Private:ObjectiveTracker_Update() end)
	section.args.objectiveTracker.args.content.args.poiGroup = ACH:Group(L["POI Button"], nil, 3)
	section.args.objectiveTracker.args.content.args.poiGroup.inline = true
	section.args.objectiveTracker.args.content.args.poiGroup.args.poiScale = ACH:Range(L["Scale"], L["The quest icon left of the title."], 1, { min = 0.5, max = 2, step = 0.05, isPercent = true })
	section.args.objectiveTracker.args.content.args.poiGroup.args.poiOffset = ACH:Range(L["Y Offset"], nil, 2, { min = -20, max = 20, step = 1 })
	return section
end

-- Build Skins Section
local function BuildSkinsSection()
	if not Private.ElvUI then return end -- ElvUI section
	local section = ACH:Group(GetIconName('Skins', 'Skins'), nil, 65)
	section.args.header = ACH:Header('Skins', 1)
	section.args.addons = ACH:Group('AddOns', nil, 2, nil, function(info) return Private.Addon.db.profile.skins[info[#info]] end, function(info, value) Private.Addon.db.profile.skins[info[#info]] = value StaticPopup_Show('LUCKYONE_RL') end)
	section.args.addons.inline = true
	section.args.addons.args.Auctionator = ACH:Toggle('Auctionator', L["Skin the Addon in ElvUI style"], 1, nil, nil, nil, nil, nil, nil, not Private.IsAddOnLoaded('Auctionator'))
	section.args.addons.args.BigWigs = ACH:Toggle('BigWigs', L["Skin the Keystones viewer (/keys, Retail only) and the LFG queue timer bar in ElvUI style. The rest of the Addon is not skinned."], 2, nil, nil, nil, nil, nil, nil, not ((Private.isRetail or Private.isMists) and Private.IsAddOnLoaded('BigWigs')))
	section.args.addons.args.BugSack = ACH:Toggle('BugSack', L["Skin the Addon in ElvUI style"], 3, nil, nil, nil, nil, nil, nil, not Private.IsAddOnLoaded('BugSack'))
	section.args.addons.args.LFGBulletinBoard = ACH:Toggle('LFG Bulletin Board', L["Skin the full bulletin board frame in ElvUI style"], 4, nil, nil, nil, nil, nil, nil, not ((Private.isClassic or Private.isTBC) and Private.IsAddOnLoaded('LFGBulletinBoard')))
	section.args.addons.args.NovaSpellRankChecker = ACH:Toggle('Nova Spell Rank Checker', L["Skin the Spell Rank Checker button in ElvUI style"], 5, nil, nil, nil, nil, nil, nil, not ((Private.isClassic or Private.isTBC) and Private.IsAddOnLoaded('NovaSpellRankChecker')))
	section.args.addons.args.NovaWorldBuffs = ACH:Toggle('Nova World Buffs', L["Skin the small layer frame on the Minimap in ElvUI style and move it to the bottom left"], 6, nil, nil, nil, nil, nil, nil, not ((Private.isClassic or Private.isTBC) and Private.IsAddOnLoaded('NovaWorldBuffs')))
	section.args.addons.args.SimpleAddonManager = ACH:Toggle('Simple Addon Manager', L["Skin the Addon in ElvUI style"], 7, nil, nil, nil, nil, nil, nil, not Private.IsAddOnLoaded('SimpleAddonManager'))
	section.args.addons.args.Simulationcraft = ACH:Toggle('Simulationcraft', L["Skin the Addon in ElvUI style"], 8, nil, nil, nil, nil, nil, nil, not (Private.isRetail and Private.IsAddOnLoaded('Simulationcraft')))
	section.args.addons.args.Tabardy = ACH:Toggle('Tabardy', L["Skin the Addon in ElvUI style"], 9, nil, nil, nil, nil, nil, nil, not Private.IsAddOnLoaded('Tabardy'))
	section.args.addons.args.WhatsTraining = ACH:Toggle('WhatsTraining', L["Skin the WhatsTraining page in the Spellbook in ElvUI style"], 10, nil, nil, nil, nil, nil, nil, not ((Private.isClassic or Private.isTBC) and Private.IsAddOnLoaded('WhatsTraining')))
	section.args.blizzard = ACH:Group('Blizzard', nil, 2, nil, function(info) return Private.Addon.db.profile.skins.Blizzard[info[#info]] end, function(info, value) Private.Addon.db.profile.skins.Blizzard[info[#info]] = value StaticPopup_Show('LUCKYONE_RL') end)
	section.args.blizzard.inline = true
	section.args.blizzard.args.CooldownViewer = ACH:Toggle(L["Cooldown Settings"], nil, 1, nil, nil, nil, nil, nil, nil, not Private.isRetail)
	section.args.blizzard.args.DeveloperConsole = ACH:Toggle('Developer Console', nil, 2)
	return section
end

-- Build Credits Section
local function BuildCreditsSection()
	local section = ACH:Group(GetIconName(format('|cfd9b9b9b%s|r', L["Credits"]), 'Credits'), nil, 70)
	section.args.header = ACH:Header(L["Credits"], 1)
	section.args.author = ACH:Group(L["Author"], nil, 2)
	section.args.author.inline = true
	section.args.author.args.desc = ACH:Description(concat(CREDITS.author, '|n'), 1, 'medium')
	section.args.coding = ACH:Group(L["Coding"], nil, 3)
	section.args.coding.inline = true
	section.args.coding.args.desc = ACH:Description(concat(CREDITS.coding, '|n'), 1, 'medium')
	section.args.testers = ACH:Group(L["Testers and Translation"], nil, 4)
	section.args.testers.inline = true
	section.args.testers.args.desc = ACH:Description(concat(CREDITS.testers, '|n'), 1, 'medium')
	section.args.supporter = ACH:Group(L["Supporters"], nil, 5)
	section.args.supporter.inline = true
	section.args.supporter.args.desc = ACH:Description(concat(CREDITS.support, '|n'), 1, 'medium')
	return section
end

-- Build Links Section
local function BuildLinksSection()
	local section = ACH:Group(GetIconName(format('|cfd9b9b9b%s|r', L["Links"]), 'Links'), nil, 75)
	section.args.header = ACH:Header(L["Links"], 1)
	section.args.spacer = ACH:Spacer(2, 'full')
	section.args.website = ACH:Input(L["Addon download:"], nil, 3, nil, 'full', function() return 'https://download.luckyone.dev' end)
	section.args.changelog = ACH:Input(L["Changelog:"], nil, 4, nil, 'full', function() return 'https://changelog.luckyone.dev' end)
	section.args.discord = ACH:Input('Discord:', nil, 5, nil, 'full', function() return 'https://discord.luckyone.dev' end)
	section.args.issues = ACH:Input(L["Report issues here:"], nil, 6, nil, 'full', function() return 'https://tickets.luckyone.dev' end)
	section.args.twitch = ACH:Input('Twitch:', nil, 7, nil, 'full', function() return 'https://twitch.luckyone.dev' end)
	section.args.youtube = ACH:Input('YouTube:', nil, 8, nil, 'full', function() return 'https://youtube.luckyone.dev' end)
	section.args.homepage = ACH:Input(L["Homepage:"], nil, 9, nil, 'full', function() return 'https://luckyone.dev' end)
	return section
end

-- Build Dev Section
local function BuildDevSection()
	local section = ACH:Group(GetIconName(format('|cff4beb2c%s|r', 'Developer'), 'Developer'), nil, 100)
	section.args.header1 = ACH:Header('Developer', 1)
	section.args.toggles = ACH:Group(L["Toggles"], nil, 2)
	section.args.toggles.inline = true
	section.args.toggles.args.dev = ACH:Toggle('Developer Mode', 'Enable this toggle to apply Luckyone\'s personal adjustments during the installation process.\n\n|cffC80000There is no support for this.\n\nUse at own risk.|r', 1, nil, nil, nil, function() return Private.Addon.db.global.dev end, function(_, value) Private.Addon.db.global.dev = value end)
	section.args.devInfo = ACH:Group('Information', nil, 3)
	section.args.devInfo.inline = true
	section.args.devInfo.args.desc = ACH:Description('While this developer mode is enabled, the following will change:\n\n- Profiles created by the installer will no longer add the version suffix to the profile name.\n- Profile installer make additional database adjustments as listed below.', 1, 'medium')
	section.args.db = ACH:Group('Database adjustments', nil, 4)
	section.args.db.inline = true
	section.args.db.args.desc = ACH:Description('- Chat bubble skinning disabled (To use texture replacements)\n- Bags module disabled while Baganator is loaded\n- Chat module disabled while Chattynator is loaded\n- Nameplates disabled while Platynator is loaded\n- Blizzard player castbar kept while SkironCooldownManager is loaded', 1, 'medium')
	section.args.header2 = ACH:Header('Luckyone\'s Private Section', 5, nil, nil, function() return not Private.Addon.db.global.dev end)
	section.args.syncInfo = ACH:Group('Important information', nil, 6, nil, nil, nil, nil, function() return not Private.Addon.db.global.dev end)
	section.args.syncInfo.inline = true
	section.args.syncInfo.args.desc = ACH:Description('Clicking this button will override every single option of the games ESC > Options with Luckyone\'s settings.\n\nThis includes all of gameplay, accessibility, graphics, audio and network.\n\n|cffC80000There is no support for this.\n\nUse at own risk.|r', 1, 'medium')
	section.args.spacer = ACH:Spacer(7, 'full', function() return not Private.Addon.db.global.dev end)
	section.args.execute = ACH:Execute('Sync Game Settings', '|cffC80000Do not click without reading the important information!|r', 8, function() Private:SyncSettings() end, nil, true, nil, nil, nil, nil, function() return not Private.Addon.db.global.dev end)
	return section
end

-- LuckyoneUI config panel
-- Built once, the installer reads names and descriptions from it before ElvUI_Options is loaded
function Private:BuildConfig()
	if Private.Config then return end

	-- Header
	Private.Config = ACH:Group((Private.ElvUI and Private.Name) or format('%s %s', Private.Name, Private.VersionString), nil, 20)

	-- Add sections
	Private.Config.args.setup = BuildSetupSection() -- 2
	Private.Config.args.blizzard = BuildGeneralSection() -- 5
	Private.Config.args.addonProfiles = BuildAddonProfilesSection() -- 10
	Private.Config.args.privateDB = BuildPrivateDBSection() -- 15
	Private.Config.args.chat = BuildChatSection() -- 20
	Private.Config.args.cvars = BuildCVarsSection() -- 25
	Private.Config.args.cdm = BuildCDMSection() -- 30
	Private.Config.args.damageMeter = BuildDamageMeterSection() -- 35
	Private.Config.args.elvuiLayouts = BuildElvUILayoutSection() -- 40
	Private.Config.args.elvuiTweaks = BuildElvUITweaksSection() -- 45
	Private.Config.args.graphics = BuildGraphicsSection() -- 50
	Private.Config.args.map = BuildMapSection() -- 55
	Private.Config.args.misc = BuildMiscSection() -- 60
	Private.Config.args.skins = BuildSkinsSection() -- 65
	Private.Config.args.credits = BuildCreditsSection() -- 70
	Private.Config.args.links = BuildLinksSection() -- 75
	Private.Config.args.dev = BuildDevSection() -- 100
end

-- ElvUI config integration, LibElvUIPlugin calls this once ElvUI_Options is loaded
function Private:RegisterElvUIConfig()
	Private:BuildConfig()

	local E = ElvUI[1]

	E.Options.name = format('%s + %s |cff99ff33%s|r', E.Options.name, Private.Name, Private.VersionString)
	E.Options.args.LuckyoneUI = Private.Config

	local scaling = E.Options.args.general and E.Options.args.general.args.general and E.Options.args.general.args.general.args.scaling
	if scaling then
		scaling.hidden = true
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
