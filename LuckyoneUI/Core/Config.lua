local _, Private = ...
local L = Private.Libs.ACL
local ACH = Private.Libs.ACH

local concat = table.concat
local format = string.format
local tonumber = tonumber
local tostring = tostring

local GetCVarBool = C_CVar.GetCVarBool
local SetCVar = C_CVar.SetCVar
local HideUIPanel = HideUIPanel

local _G = _G
local StaticPopup_Show = _G.StaticPopup_Show
local SettingsPanel = _G.SettingsPanel

local RELOAD_POPUP = 'LUCKYONE_RL'
local IMPORT_DEFAULTS_TEXT = L["Import LuckyoneUI defaults."]

local ICON_PATH = 'Interface\\AddOns\\LuckyoneUI\\Media\\Icons\\'
local function GetIconName(name, icon)
	return format('|T%s%s.png:14:14:0:0|t %s', ICON_PATH, icon, name)
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
	section.args.installer = ACH:Execute(Private.Name .. ' ' .. L["Install"], L["Re-Run the installation process."], 3, function() Private.Installer:Show(Private.InstallerData) if Private.ElvUI then ElvUI[1]:ToggleOptions() else HideUIPanel(SettingsPanel) end end)
	section.args.altMain = ACH:Execute(L["Alt: "] .. L["DPS & Tanks"], L["This will load your most recent LuckyoneUI profile."], 4, function() Private:HandleAlts('Main') end, nil, true, nil, nil, nil, nil, not Private.ElvUI)
	section.args.altHealing = ACH:Execute(L["Alt: "] .. L["Healing"], L["This will load your most recent LuckyoneUI profile."], 5, function() Private:HandleAlts('Healing') end, nil, true, nil, nil, nil, nil, not Private.ElvUI)
	section.args.spacer2 = ACH:Spacer(6, 'full')
	return section
end

-- Build General Section
local function BuildGeneralSection()
	local section = ACH:Group(GetIconName(L["General"], 'General'), nil, 5)
	section.args.header = ACH:Header(L["General"], 1)
	section.args.disabledFrames = ACH:Group(L["Hide Blizzard Frames"], nil, 2, nil, function(info) return Private.Addon.db.profile.disabledFrames[info[#info]] end, function(info, value) Private.Addon.db.profile.disabledFrames[info[#info]] = value StaticPopup_Show(RELOAD_POPUP) end)
	section.args.disabledFrames.inline = true
	section.args.disabledFrames.args.AlertFrame = ACH:Toggle(L["Alert Frame"], L["Hide the Loot/Alert Frame"], 1)
	section.args.disabledFrames.args.ApplicationCover = ACH:Toggle(L["Application Cover"], L["Removes the LFG frame overlay and animation which blocks your mouse inputs and tooltip when you are not the party leader."], 2, nil, nil, nil, nil, nil, nil, not (Private.isRetail or Private.isMists))
	section.args.disabledFrames.args.BossBanner = ACH:Toggle(L["Boss Banner"], L["Hide the Boss Banner"], 3, nil, nil, nil, nil, nil, nil, not Private.isRetail)
	section.args.disabledFrames.args.HousingDecorAlerts = ACH:Toggle(L["Housing Decor Alerts"], L["Hide the Housing Alerts for \n\'New Decor Added\'"], 4, nil, nil, nil, nil, nil, nil, not Private.isRetail)
	section.args.disabledFrames.args.LossOfControl = ACH:Toggle(L["Loss of Control Frame"], L["Hide the Loss of Control Frame"], 5, nil, nil, nil, nil, nil, nil, not (Private.isRetail or Private.isMists))
	section.args.disabledFrames.args.TalkingHead = ACH:Toggle(L["Talking Head"], L["Hide the Talking Head Frame but keep it's sounds and voicelines."], 6, nil, nil, nil, nil, nil, nil, not Private.isRetail)
	section.args.disabledFrames.args.UIErrorsFrame = ACH:Toggle(L["UI Errors Frame"], L["Hide the UI Errors Frame which usually displays messages like 'Out of range', 'Not enough mana', 'You have no target' - This will also block all quest progress update messages."], 7)
	section.args.disabledFrames.args.ZoneTextFrame = ACH:Toggle(L["Zone Text"], L["Hide the Zone Text"], 8)
	section.args.qualityOfLife = ACH:Group(L["Quality of Life"], nil, 3, nil, function(info) return Private.Addon.db.profile.qualityOfLife[info[#info]] end, function(info, value) Private.Addon.db.profile.qualityOfLife[info[#info]] = value StaticPopup_Show(RELOAD_POPUP) end)
	section.args.qualityOfLife.inline = true
	section.args.qualityOfLife.args.autoAcceptRole = ACH:Toggle(L["Auto Accept Role"], L["Automatically accept the role check popup when signing up for groups and raids. Hold down the shift key to add a signup note."], 1, nil, nil, nil, nil, nil, nil, not (Private.isRetail or Private.isMists))
	section.args.qualityOfLife.args.autoDismount = ACH:Toggle(L["Auto Dismount"], L["Automatically dismounts you if all of the following conditions are true:\n\n- You are on a skyriding mount\n- You are on the ground\n- You press any skyriding spell except Skyward Ascent\n\nDoes not work for Druid Travel Form."], 2, nil, nil, nil, nil, nil, nil, not Private.isRetail)
	section.args.qualityOfLife.args.easyDelete = ACH:Toggle(L["Easy Delete"], L["Automatically fill out the confirmation text to delete items."], 3)
	section.args.qualityOfLife.args.preventLootAutoShow = ACH:Toggle(L["Prevent Loot Overview"], L["Prevents the Blizzard group loot overview frame from auto opening after a boss kill."], 4, nil, nil, nil, nil, nil, nil, not Private.isRetail)
	section.args.qualityOfLife.args.privacyOverlay = ACH:Toggle(L["Privacy Overlay"], L["Creates an overlay to hide the chat frame in the Communities Frame until you click on it."], 5)
	section.args.qualityOfLife.args.quickSignup = ACH:Toggle(L["Quick Signup"], L["Speed up the signup process for party and raid applications by double clicking the listing instead of clicking the signup button."], 6, nil, nil, nil, nil, nil, nil, not (Private.isRetail or Private.isMists))
	section.args.misc = ACH:Group(L["Misc"], nil, 4, nil, nil, nil, nil, not Private.isRetail)
	section.args.misc.inline = true
	section.args.misc.args.removeNameplateRealm = ACH:Toggle(L["Remove Nameplate Realms"], L["Removes the realm names from friendly nameplates in name-only mode while in a Dungeon/Raid/Battleground."], 1, nil, nil, nil, function() return Private.Addon.db.profile.misc.removeNameplateRealm end, function(_, value) Private.Addon.db.profile.misc.removeNameplateRealm = value StaticPopup_Show(RELOAD_POPUP) end)
	section.args.strings = ACH:Group(L["Profile strings"], nil, 5, nil, nil, nil, nil, not Private.isRetail)
	section.args.strings.inline = true
	section.args.strings.args.editModeString = ACH:Execute(L["Copy Editmode String"], nil, 1, function() Private:Return_EditModeString() end)
	section.args.strings.args.editModeToggle = ACH:Execute(format('|cff4beb2c%s|r', L["Enter Edit Mode"]), nil, 2, function() Private:ToggleEditMode() if Private.ElvUI then ElvUI[1]:ToggleOptions() end end)
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
	section.args.addons.args.baganator = ACH:Execute('Baganator', IMPORT_DEFAULTS_TEXT, 1, function() Private:Setup_Baganator() StaticPopup_Show(RELOAD_POPUP) end, nil, true)
	section.args.addons.args.buffReminders = ACH:Execute('BuffReminders', IMPORT_DEFAULTS_TEXT, 2, function() Private:Setup_BuffReminders() StaticPopup_Show(RELOAD_POPUP) end, nil, true, nil, nil, nil, nil, not Private.isRetail)
	section.args.addons.args.details = ACH:Execute('Details', IMPORT_DEFAULTS_TEXT, 3, function() Private:Setup_Details() StaticPopup_Show(RELOAD_POPUP) end, nil, true)
	section.args.addons.args.mplustimer = ACH:Execute('MPlusTimer', IMPORT_DEFAULTS_TEXT, 4, function() Private:Setup_MPlusTimer() StaticPopup_Show(RELOAD_POPUP) end, nil, true, nil, nil, nil, nil, not Private.isRetail)
	section.args.addons.args.nsrt = ACH:Execute('Northern Sky Raid Tools', IMPORT_DEFAULTS_TEXT, 5, function() Private:Setup_NSRT() StaticPopup_Show(RELOAD_POPUP) end, nil, true, nil, nil, nil, nil, not Private.isRetail)
	section.args.addons.args.permoksAccountManager = ACH:Execute('PermoksAccountManager', IMPORT_DEFAULTS_TEXT, 6, function() Private:Setup_PermoksAccountManager() StaticPopup_Show(RELOAD_POPUP) end, nil, true, nil, nil, nil, nil, not Private.isRetail)
	section.args.addons.args.plumber = ACH:Execute('Plumber', IMPORT_DEFAULTS_TEXT, 7, function() Private:Setup_Plumber() StaticPopup_Show(RELOAD_POPUP) end, nil, true, nil, nil, nil, nil, not Private.isRetail)
	section.args.addons.args.warpDeplete = ACH:Execute('WarpDeplete', IMPORT_DEFAULTS_TEXT, 8, function() Private:Setup_WarpDeplete() StaticPopup_Show(RELOAD_POPUP) end, nil, true, nil, nil, nil, nil, not Private.isRetail)
	section.args.nameplates = ACH:Group(L["Nameplate Profiles"], nil, 3)
	section.args.nameplates.inline = true
	section.args.nameplates.args.elvui = ACH:Execute('ElvUI', IMPORT_DEFAULTS_TEXT, 1, function() Private:Setup_NamePlates() StaticPopup_Show(RELOAD_POPUP) end, nil, true, nil, nil, nil, nil, not Private.ElvUI)
	section.args.nameplates.args.platynator = ACH:Execute('Platynator', IMPORT_DEFAULTS_TEXT, 2, function() Private:Setup_Platynator() StaticPopup_Show(RELOAD_POPUP) end, nil, true)
	section.args.nameplates.args.plater = ACH:Execute('Plater', IMPORT_DEFAULTS_TEXT, 3, function() Private:Setup_Plater() StaticPopup_Show(RELOAD_POPUP) end, nil, true)
	section.args.bossmods = ACH:Group(L["BossMods Profiles"], nil, 4)
	section.args.bossmods.inline = true
	section.args.bossmods.args.bigwigsMain = ACH:Execute(L["BigWigs Main"], IMPORT_DEFAULTS_TEXT, 1, function() Private:Setup_BigWigs('main') end, nil, true)
	section.args.bossmods.args.bigwigsHealing = ACH:Execute(L["BigWigs Healing"], IMPORT_DEFAULTS_TEXT, 2, function() Private:Setup_BigWigs('healing') end, nil, true)
	section.args.plugins = ACH:Group(L["ElvUI Plugins"], nil, 5, nil, nil, nil, nil, not (Private.isRetail and Private.ElvUI))
	section.args.plugins.inline = true
	section.args.plugins.args.wt = ACH:Execute('|cff5385edWindTools|r', IMPORT_DEFAULTS_TEXT, 1, function() Private:Setup_WindTools() StaticPopup_Show(RELOAD_POPUP) end, nil, true, nil, nil, nil, nil, not (Private.isRetail and Private.ElvUI))
	return section
end

-- Build PrivateDB Section
local function BuildPrivateDBSection()
	if not Private.ElvUI then return end -- ElvUI section
	local section = ACH:Group(GetIconName(L["Character Specific"], 'Character'), nil, 15)
	section.args.header = ACH:Header(L["Character Specific"], 1)
	section.args.defaults = ACH:Group(L["Restore LuckyoneUI Defaults"], nil, 2)
	section.args.defaults.inline = true
	section.args.defaults.args.private = ACH:Execute(L["Restore Defaults"], nil, 1, function() Private:Setup_PrivateDB(true) ElvUI[1]:UpdateMediaItems(true) end, nil, true)
	section.args.defaultsDesc = ACH:Group(L["The following data will be updated"], nil, 3)
	section.args.defaultsDesc.inline = true
	section.args.defaultsDesc.args.cvars = ACH:Description('- All Fonts: Expressway\n- All Font Outlines: Outline\n- All Textures: Minimalist\n\n- Friendly Nameplate Font Sizes\n- Totem Tracker: disabled\n- Parchment Remover: enabled\n\n- (Classic Only) Make Shamans blue instead of pink\n- (Retail Only) Character specific settings for WindTools', 1, 'medium')
	return section
end

-- Build Chat Section
local function BuildChatSection()
	local section = ACH:Group(GetIconName(L["Chat"], 'Chat'), nil, 20)
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
	section.args.nameplateDesc.args.cvars = ACH:Description('- nameplateLargerScale 1\n- nameplateMinAlpha 1\n- nameplateMinScale 1\n- nameplateOccludedAlphaMult 1\n- nameplateOverlapH 1.1\n- nameplateOverlapV 1.7\n- nameplateSelectedScale 1\n- nameplateSelfAlpha 1\n\n- UnitNameEnemyGuardianName 1\n- UnitNameEnemyMinionName 1\n- UnitNameEnemyPetName 1\n- UnitNameEnemyPlayerName 1\n- UnitNameEnemyTotemName 1', 1, 'medium')
	return section
end

-- Damage Meter window placement
local WINDOW_NAMES = { L["Window 1"], L["Window 2"], L["Window 3"] }

local function GetAttachTargets(index)
	return function()
		local db = Private.Addon.db.profile.damageMeter
		local values = { [0] = _G.NONE }

		-- Only windows that still sit on the main axis can host another one
		for target = 1, db.windowCount do
			if target ~= index and db.windows[target].attachTo == 0 then
				values[target] = WINDOW_NAMES[target]
			end
		end

		return values
	end
end

local function SetAttachTo(index, value)
	local db = Private.Addon.db.profile.damageMeter
	db.windows[index].attachTo = value

	-- A window hanging under another one cannot host one itself
	if value ~= 0 then
		for other = 1, #db.windows do
			if db.windows[other].attachTo == index then
				db.windows[other].attachTo = 0
			end
		end
	end

	Private:DamageMeter_UpdateAll()
end

-- Build Damage Meter Section
local function BuildDamageMeterSection()
	if not (Private.ElvUI and Private.isRetail) then return end -- Retail + ElvUI section
	local section = ACH:Group(GetIconName(L["Damage Meter"], 'DamageMeter'), nil, 30)
	section.args.header = ACH:Header(L["Damage Meter"], 1)
	section.args.general = ACH:Group(L["General"], nil, 2, nil, function(info) return Private.Addon.db.profile.damageMeter[info[#info]] end, function(info, value) Private.Addon.db.profile.damageMeter[info[#info]] = value Private:DamageMeter_UpdateAll() end)
	section.args.general.inline = true
	section.args.general.args.enable = ACH:Toggle(L["Enable"], L["Lightweight Damage Meter powered by the native Blizzard combat data."], 1)
	section.args.general.args.windowCount = ACH:Range(L["Windows"], L["Number of session windows."], 2, { min = 1, max = 3, step = 1 }, nil, nil, nil, function() return not Private.Addon.db.profile.damageMeter.enable end)
	section.args.general.args.orientation = ACH:Select(L["Orientation"], L["Place the session windows next to each other or stacked."], 3, { HORIZONTAL = L["Horizontal"], VERTICAL = L["Vertical"] }, nil, nil, nil, nil, function() return not Private.Addon.db.profile.damageMeter.enable end)
	section.args.general.args.backdrop = ACH:Toggle(L["Frame Backdrop"], L["Show a transparent ElvUI backdrop behind the frame."], 4, nil, nil, nil, nil, nil, function() return not Private.Addon.db.profile.damageMeter.enable end)
	section.args.general.args.visibility = ACH:Select(L["Visibility"], nil, 5, { SHOW = L["Always"], COMBAT = L["In Combat"], GROUP = L["In Group"] }, nil, nil, nil, nil, function() return not Private.Addon.db.profile.damageMeter.enable end)
	section.args.general.args.windowOneType = ACH:Select(L["Window 1"], nil, 6, function() local DM = Private.Modules.DamageMeter return DM and DM.TypeNames or {} end, nil, nil, function() return Private.Addon.db.profile.damageMeter.windows[1].meterType end, function(_, value) Private.Addon.db.profile.damageMeter.windows[1].meterType = value local DM = Private.Modules.DamageMeter local window = DM and DM.windows[1] if window then DM:SetWindowType(window, value) end end, function() return not Private.Addon.db.profile.damageMeter.enable end)
	section.args.general.args.windowTwoType = ACH:Select(L["Window 2"], nil, 7, function() local DM = Private.Modules.DamageMeter return DM and DM.TypeNames or {} end, nil, nil, function() return Private.Addon.db.profile.damageMeter.windows[2].meterType end, function(_, value) Private.Addon.db.profile.damageMeter.windows[2].meterType = value local DM = Private.Modules.DamageMeter local window = DM and DM.windows[2] if window then DM:SetWindowType(window, value) end end, function() return not Private.Addon.db.profile.damageMeter.enable end, function() return Private.Addon.db.profile.damageMeter.windowCount < 2 end)
	section.args.general.args.windowThreeType = ACH:Select(L["Window 3"], nil, 8, function() local DM = Private.Modules.DamageMeter return DM and DM.TypeNames or {} end, nil, nil, function() return Private.Addon.db.profile.damageMeter.windows[3].meterType end, function(_, value) Private.Addon.db.profile.damageMeter.windows[3].meterType = value local DM = Private.Modules.DamageMeter local window = DM and DM.windows[3] if window then DM:SetWindowType(window, value) end end, function() return not Private.Addon.db.profile.damageMeter.enable end, function() return Private.Addon.db.profile.damageMeter.windowCount < 3 end)
	section.args.size = ACH:Group(L["Size and Spacing"], nil, 3, nil, function(info) return Private.Addon.db.profile.damageMeter[info[#info]] end, function(info, value) Private.Addon.db.profile.damageMeter[info[#info]] = value Private:DamageMeter_UpdateAll() end, function() return not Private.Addon.db.profile.damageMeter.enable end)
	section.args.size.inline = true
	section.args.size.args.sizeMode = ACH:Select(L["Size Mode"], L["Where the window sizes come from."], 1, { CHAT = L["Chat Panel"], SHARED = L["Shared"], CUSTOM = L["Custom"] })
	section.args.size.args.width = ACH:Range(L["Width"], nil, 2, { min = 100, max = 1200, step = 1 }, nil, nil, nil, function() local db = Private.Addon.db.profile.damageMeter return not db.enable or db.sizeMode ~= 'SHARED' end)
	section.args.size.args.height = ACH:Range(L["Height"], nil, 3, { min = 60, max = 800, step = 1 }, nil, nil, nil, function() local db = Private.Addon.db.profile.damageMeter return not db.enable or db.sizeMode ~= 'SHARED' end)
	section.args.size.args.innerSpacing = ACH:Range(L["Inner Spacing"], L["Space between the session windows."], 4, { min = -20, max = 20, step = 1 }, nil, nil, nil, function() local db = Private.Addon.db.profile.damageMeter return not db.enable or db.windowCount < 2 end)
	section.args.size.args.outerSpacing = ACH:Range(L["Outer Spacing"], L["Space between the frame border and the session windows."], 5, { min = -20, max = 20, step = 1 })
	section.args.placement = ACH:Group(L["Window Placement"], nil, 4, nil, nil, nil, function() return not Private.Addon.db.profile.damageMeter.enable end, function() return Private.Addon.db.profile.damageMeter.windowCount < 2 end)
	section.args.placement.inline = true
	section.args.placement.args.windowOneAttach = ACH:Select(L["Window 1"] .. ' - ' .. L["Attach To"], L["Stack this window under another one instead of giving it its own slot."], 1, GetAttachTargets(1), nil, nil, function() return Private.Addon.db.profile.damageMeter.windows[1].attachTo end, function(_, value) SetAttachTo(1, value) end)
	section.args.placement.args.windowOneAttachSize = ACH:Range(L["Window 1"] .. ' - ' .. L["Attached Size"], L["Share of the parent window taken by the attached window."], 2, { min = 10, max = 90, step = 1 }, nil, function() return Private.Addon.db.profile.damageMeter.windows[1].attachSize end, function(_, value) Private.Addon.db.profile.damageMeter.windows[1].attachSize = value Private:DamageMeter_UpdateAll() end, nil, function() return Private.Addon.db.profile.damageMeter.windows[1].attachTo == 0 end)
	section.args.placement.args.windowTwoAttach = ACH:Select(L["Window 2"] .. ' - ' .. L["Attach To"], L["Stack this window under another one instead of giving it its own slot."], 3, GetAttachTargets(2), nil, nil, function() return Private.Addon.db.profile.damageMeter.windows[2].attachTo end, function(_, value) SetAttachTo(2, value) end, nil, function() return Private.Addon.db.profile.damageMeter.windowCount < 2 end)
	section.args.placement.args.windowTwoAttachSize = ACH:Range(L["Window 2"] .. ' - ' .. L["Attached Size"], L["Share of the parent window taken by the attached window."], 4, { min = 10, max = 90, step = 1 }, nil, function() return Private.Addon.db.profile.damageMeter.windows[2].attachSize end, function(_, value) Private.Addon.db.profile.damageMeter.windows[2].attachSize = value Private:DamageMeter_UpdateAll() end, nil, function() local db = Private.Addon.db.profile.damageMeter return db.windowCount < 2 or db.windows[2].attachTo == 0 end)
	section.args.placement.args.windowThreeAttach = ACH:Select(L["Window 3"] .. ' - ' .. L["Attach To"], L["Stack this window under another one instead of giving it its own slot."], 5, GetAttachTargets(3), nil, nil, function() return Private.Addon.db.profile.damageMeter.windows[3].attachTo end, function(_, value) SetAttachTo(3, value) end, nil, function() return Private.Addon.db.profile.damageMeter.windowCount < 3 end)
	section.args.placement.args.windowThreeAttachSize = ACH:Range(L["Window 3"] .. ' - ' .. L["Attached Size"], L["Share of the parent window taken by the attached window."], 6, { min = 10, max = 90, step = 1 }, nil, function() return Private.Addon.db.profile.damageMeter.windows[3].attachSize end, function(_, value) Private.Addon.db.profile.damageMeter.windows[3].attachSize = value Private:DamageMeter_UpdateAll() end, nil, function() local db = Private.Addon.db.profile.damageMeter return db.windowCount < 3 or db.windows[3].attachTo == 0 end)
	section.args.windowSizes = ACH:Group(L["Window Sizes"], nil, 5, nil, nil, nil, function() return not Private.Addon.db.profile.damageMeter.enable end, function() return Private.Addon.db.profile.damageMeter.sizeMode ~= 'CUSTOM' end)
	section.args.windowSizes.inline = true
	section.args.windowSizes.args.windowOneWidth = ACH:Range(L["Window 1"] .. ' - ' .. L["Width"], nil, 1, { min = 100, max = 1200, step = 1 }, nil, function() return Private.Addon.db.profile.damageMeter.windows[1].width end, function(_, value) Private.Addon.db.profile.damageMeter.windows[1].width = value Private:DamageMeter_UpdateAll() end, nil, function() return Private.Addon.db.profile.damageMeter.windows[1].attachTo ~= 0 end)
	section.args.windowSizes.args.windowOneHeight = ACH:Range(L["Window 1"] .. ' - ' .. L["Height"], nil, 2, { min = 60, max = 800, step = 1 }, nil, function() return Private.Addon.db.profile.damageMeter.windows[1].height end, function(_, value) Private.Addon.db.profile.damageMeter.windows[1].height = value Private:DamageMeter_UpdateAll() end, nil, function() return Private.Addon.db.profile.damageMeter.windows[1].attachTo ~= 0 end)
	section.args.windowSizes.args.windowTwoWidth = ACH:Range(L["Window 2"] .. ' - ' .. L["Width"], nil, 3, { min = 100, max = 1200, step = 1 }, nil, function() return Private.Addon.db.profile.damageMeter.windows[2].width end, function(_, value) Private.Addon.db.profile.damageMeter.windows[2].width = value Private:DamageMeter_UpdateAll() end, nil, function() local db = Private.Addon.db.profile.damageMeter return db.windowCount < 2 or db.windows[2].attachTo ~= 0 end)
	section.args.windowSizes.args.windowTwoHeight = ACH:Range(L["Window 2"] .. ' - ' .. L["Height"], nil, 4, { min = 60, max = 800, step = 1 }, nil, function() return Private.Addon.db.profile.damageMeter.windows[2].height end, function(_, value) Private.Addon.db.profile.damageMeter.windows[2].height = value Private:DamageMeter_UpdateAll() end, nil, function() local db = Private.Addon.db.profile.damageMeter return db.windowCount < 2 or db.windows[2].attachTo ~= 0 end)
	section.args.windowSizes.args.windowThreeWidth = ACH:Range(L["Window 3"] .. ' - ' .. L["Width"], nil, 5, { min = 100, max = 1200, step = 1 }, nil, function() return Private.Addon.db.profile.damageMeter.windows[3].width end, function(_, value) Private.Addon.db.profile.damageMeter.windows[3].width = value Private:DamageMeter_UpdateAll() end, nil, function() local db = Private.Addon.db.profile.damageMeter return db.windowCount < 3 or db.windows[3].attachTo ~= 0 end)
	section.args.windowSizes.args.windowThreeHeight = ACH:Range(L["Window 3"] .. ' - ' .. L["Height"], nil, 6, { min = 60, max = 800, step = 1 }, nil, function() return Private.Addon.db.profile.damageMeter.windows[3].height end, function(_, value) Private.Addon.db.profile.damageMeter.windows[3].height = value Private:DamageMeter_UpdateAll() end, nil, function() local db = Private.Addon.db.profile.damageMeter return db.windowCount < 3 or db.windows[3].attachTo ~= 0 end)
	section.args.bars = ACH:Group(L["Bars"], nil, 6, nil, function(info) return Private.Addon.db.profile.damageMeter[info[#info]] end, function(info, value) Private.Addon.db.profile.damageMeter[info[#info]] = value Private:DamageMeter_UpdateAll() end, function() return not Private.Addon.db.profile.damageMeter.enable end)
	section.args.bars.inline = true
	section.args.bars.args.barStyle = ACH:Select(L["Bar Style"], L["Layout of each bar, matches the Blizzard Edit Mode styles."], 1, { DEFAULT = L["Default"], BORDERED = L["Bordered"], THIN = L["Thin"] })
	section.args.bars.args.barTexture = ACH:SharedMediaStatusbar(L["Bar Texture"], nil, 2)
	section.args.bars.args.barHeight = ACH:Range(L["Bar Height"], nil, 3, { min = 8, max = 50, step = 1 })
	section.args.bars.args.barSpacing = ACH:Range(L["Bar Spacing"], nil, 4, { min = 0, max = 20, step = 1 })
	section.args.bars.args.backdropColorType = ACH:Select(L["Backdrop Color"], L["Follow the bar color or use a custom color."], 5, { CLASS = L["Class Color"], CUSTOM = L["Custom"] })
	section.args.bars.args.backdropColor = ACH:Color(L["Custom Color"], nil, 6, nil, nil, function() local color = Private.Addon.db.profile.damageMeter.backdropColor return color.r, color.g, color.b end, function(_, r, g, b) local color = Private.Addon.db.profile.damageMeter.backdropColor color.r, color.g, color.b = r, g, b Private:DamageMeter_UpdateAll() end, nil, function() return Private.Addon.db.profile.damageMeter.backdropColorType ~= 'CUSTOM' end)
	section.args.bars.args.backdropAlpha = ACH:Range(L["Backdrop Alpha"], L["Transparency of the bar backdrop behind each bar."], 7, { min = 0, max = 1, step = 0.01, isPercent = true })
	section.args.bars.args.showIcons = ACH:Toggle(L["Bar Icons"], L["Show the class or spec icon in front of each bar."], 8)
	section.args.bars.args.classColors = ACH:Toggle(L["Class Color"], nil, 9)
	section.args.bars.args.othersColor = ACH:Color(L["Fallback Color"], L["Bar color for creatures and sources without a class."], 10, nil, nil, function() local color = Private.Addon.db.profile.damageMeter.othersColor return color.r, color.g, color.b end, function(_, r, g, b) local color = Private.Addon.db.profile.damageMeter.othersColor color.r, color.g, color.b = r, g, b Private:DamageMeter_UpdateAll() end)
	section.args.text = ACH:Group(L["Text"], nil, 7, nil, function(info) return Private.Addon.db.profile.damageMeter[info[#info]] end, function(info, value) Private.Addon.db.profile.damageMeter[info[#info]] = value Private:DamageMeter_UpdateAll() end, function() return not Private.Addon.db.profile.damageMeter.enable end)
	section.args.text.inline = true
	section.args.text.args.numberDisplay = ACH:Select(L["Number Display"], nil, 1, { MINIMAL = L["Minimal"], COMPACT = L["Compact"], COMPLETE = L["Complete"] })
	section.args.text.args.font = ACH:SharedMediaFont(L["Font"], nil, 2)
	section.args.text.args.fontOutline = ACH:FontFlags(L["Font Outline"], nil, 3)
	section.args.text.args.fontSize = ACH:Range(L["Font Size"], nil, 4, { min = 8, max = 26, step = 1 })
	section.args.text.args.nameColorType = ACH:Select(L["Name Color"], L["Color of the name text on each bar."], 5, { CUSTOM = L["Custom"], CLASS = L["Class Color"] })
	section.args.text.args.nameColor = ACH:Color(L["Custom Color"], nil, 6, nil, nil, function() local color = Private.Addon.db.profile.damageMeter.nameColor return color.r, color.g, color.b end, function(_, r, g, b) local color = Private.Addon.db.profile.damageMeter.nameColor color.r, color.g, color.b = r, g, b Private:DamageMeter_UpdateAll() end, nil, function() return Private.Addon.db.profile.damageMeter.nameColorType ~= 'CUSTOM' end)
	section.args.text.args.valueColorType = ACH:Select(L["Number Color"], L["Color of the number text on each bar."], 7, { CUSTOM = L["Custom"], CLASS = L["Class Color"] })
	section.args.text.args.valueColor = ACH:Color(L["Custom Color"], nil, 8, nil, nil, function() local color = Private.Addon.db.profile.damageMeter.valueColor return color.r, color.g, color.b end, function(_, r, g, b) local color = Private.Addon.db.profile.damageMeter.valueColor color.r, color.g, color.b = r, g, b Private:DamageMeter_UpdateAll() end, nil, function() return Private.Addon.db.profile.damageMeter.valueColorType ~= 'CUSTOM' end)
	section.args.text.args.nameXOffset = ACH:Range(L["Name X Offset"], nil, 9, { min = -100, max = 100, step = 1 })
	section.args.text.args.nameYOffset = ACH:Range(L["Name Y Offset"], nil, 10, { min = -100, max = 100, step = 1 })
	section.args.text.args.valueXOffset = ACH:Range(L["Number X Offset"], nil, 11, { min = -100, max = 100, step = 1 })
	section.args.text.args.valueYOffset = ACH:Range(L["Number Y Offset"], nil, 12, { min = -100, max = 100, step = 1 })
	section.args.text.args.bracketStyle = ACH:Select(L["Brackets"], L["Bracket style around the secondary number."], 13, { PARENTHESES = '( )', SQUARE = '[ ]', NONE = _G.NONE }, nil, nil, nil, nil, function() local db = Private.Addon.db.profile.damageMeter return not db.enable or db.numberDisplay == 'MINIMAL' end)
	section.args.text.args.valueSpacing = ACH:Range(L["Number Spacing"], L["Space between the primary and the secondary number."], 14, { min = 0, max = 20, step = 1 }, nil, nil, nil, function() local db = Private.Addon.db.profile.damageMeter return not db.enable or db.numberDisplay == 'MINIMAL' end)
	section.args.text.args.showRank = ACH:Toggle(L["Show Rank Numbers"], L["Show the rank number in front of each name."], 15)
	section.args.text.args.stripRealm = ACH:Toggle(L["Strip Realm Names"], L["Remove the realm name from cross realm players."], 16)
	section.args.headerOptions = ACH:Group(L["Header"], nil, 8, nil, function(info) return Private.Addon.db.profile.damageMeter[info[#info]] end, function(info, value) Private.Addon.db.profile.damageMeter[info[#info]] = value Private:DamageMeter_UpdateAll() end, function() return not Private.Addon.db.profile.damageMeter.enable end)
	section.args.headerOptions.inline = true
	section.args.headerOptions.args.headerHeight = ACH:Range(L["Header Height"], nil, 1, { min = 12, max = 40, step = 1 })
	section.args.headerOptions.args.headerIconSize = ACH:Range(L["Icon Size"], L["Size of the settings icon in the header."], 2, { min = 8, max = 40, step = 1 })
	section.args.headerOptions.args.headerFont = ACH:SharedMediaFont(L["Font"], nil, 3)
	section.args.headerOptions.args.headerFontOutline = ACH:FontFlags(L["Font Outline"], nil, 4)
	section.args.headerOptions.args.headerFontSize = ACH:Range(L["Font Size"], nil, 5, { min = 8, max = 26, step = 1 })
	section.args.headerOptions.args.useValueColor = ACH:Toggle(L["Use Value Color"], L["Color the header text with the ElvUI value color instead of white."], 6)
	section.args.defaults = ACH:Group(L["Restore LuckyoneUI Defaults"], nil, 9)
	section.args.defaults.inline = true
	section.args.defaults.args.damageMeter = ACH:Execute(L["Restore Defaults"], L["Wipe all Damage Meter settings, the module itself stays enabled."], 1, function() Private:DamageMeter_ResetDefaults() end, nil, true)
	return section
end

-- Build Cooldown Manager Section
local function BuildCDMSection()
	if not Private.isRetail then return end -- Retail only section
	local section = ACH:Group(GetIconName(L["Cooldown Manager"], 'Cdm'), nil, 35)
	section.args.header1 = ACH:Header(L["Cooldown Manager"], 1)
	section.args.hunter = ACH:Group(L["Hunter"], nil, 2, nil, nil, nil, nil, Private.myClass ~= 'HUNTER')
	section.args.hunter.inline = true
	section.args.hunter.args.hunter1 = ACH:Execute(format('|cffAAD372%s|r', L["Beast Mastery"]), nil, 3, function() StaticPopup_Show('LUCKYONE_EDITBOX', nil, nil, 'https://wago.io/LuckyoneUI-Beastmastery') end)
	section.args.hunter.args.hunter2 = ACH:Execute(format('|cffAAD372%s|r', L["Marksmanship"]), nil, 4, function() StaticPopup_Show('LUCKYONE_EDITBOX', nil, nil, 'https://wago.io/LuckyoneUI-Marksmanship') end)
	section.args.hunter.args.hunter3 = ACH:Execute(format('|cffAAD372%s|r', L["Survival"]), nil, 5, function() StaticPopup_Show('LUCKYONE_EDITBOX', nil, nil, 'https://wago.io/LuckyoneUI-Survival') end)
	section.args.shaman = ACH:Group(L["Shaman"], nil, 3, nil, nil, nil, nil, Private.myClass ~= 'SHAMAN')
	section.args.shaman.inline = true
	section.args.shaman.args.shaman1 = ACH:Execute(format('|cff0070DD%s|r', L["Enhancement"]), nil, 6, function() StaticPopup_Show('LUCKYONE_EDITBOX', nil, nil, 'https://wago.io/LuckyoneUI-Enhancement') end)
	section.args.shaman.args.shaman2 = ACH:Execute(format('|cff0070DD%s|r', L["Elemental"]), nil, 7, function() StaticPopup_Show('LUCKYONE_EDITBOX', nil, nil, 'https://wago.io/LuckyoneUI-Elemental') end)
	section.args.shaman.args.shaman3 = ACH:Execute(format('|cff0070DD%s|r', L["Restoration"]), nil, 8, function() StaticPopup_Show('LUCKYONE_EDITBOX', nil, nil, 'https://wago.io/LuckyoneUI-Restoration-Shaman') end)
	section.args.monk = ACH:Group(L["Monk"], nil, 4, nil, nil, nil, nil, Private.myClass ~= 'MONK')
	section.args.monk.inline = true
	section.args.monk.args.monk1 = ACH:Execute(format('|cff00FF98%s|r', L["Windwalker"]), nil, 9, function() StaticPopup_Show('LUCKYONE_EDITBOX', nil, nil, 'https://wago.io/LuckyoneUI-Windwalker') end)
	section.args.monk.args.monk2 = ACH:Execute(format('|cff00FF98%s|r', L["Brewmaster"]), nil, 10, function() StaticPopup_Show('LUCKYONE_EDITBOX', nil, nil, 'https://wago.io/LuckyoneUI-Brewmaster') end)
	section.args.monk.args.monk3 = ACH:Execute(format('|cff00FF98%s|r', L["Mistweaver"]), nil, 11, function() StaticPopup_Show('LUCKYONE_EDITBOX', nil, nil, 'https://wago.io/LuckyoneUI-Mistweaver') end)
	section.args.paladin = ACH:Group(L["Paladin"], nil, 5, nil, nil, nil, nil, Private.myClass ~= 'PALADIN')
	section.args.paladin.inline = true
	section.args.paladin.args.paladin1 = ACH:Execute(format('|cffF48CBA%s|r', L["Retribution"]), nil, 12, function() StaticPopup_Show('LUCKYONE_EDITBOX', nil, nil, 'https://wago.io/LuckyoneUI-Retribution') end)
	section.args.paladin.args.paladin2 = ACH:Execute(format('|cffF48CBA%s|r', L["Protection"]), nil, 13, function() StaticPopup_Show('LUCKYONE_EDITBOX', nil, nil, 'https://wago.io/LuckyoneUI-Protection-Paladin') end)
	section.args.paladin.args.paladin3 = ACH:Execute(format('|cffF48CBA%s|r', L["Holy"]), nil, 14, function() StaticPopup_Show('LUCKYONE_EDITBOX', nil, nil, 'https://wago.io/LuckyoneUI-Holy-Paladin') end)
	section.args.druid = ACH:Group(L["Druid"], nil, 6, nil, nil, nil, nil, Private.myClass ~= 'DRUID')
	section.args.druid.inline = true
	section.args.druid.args.druid1 = ACH:Execute(format('|cffFF7C0A%s|r', L["Feral"]), nil, 15, function() StaticPopup_Show('LUCKYONE_EDITBOX', nil, nil, 'https://wago.io/LuckyoneUI-Feral') end)
	section.args.druid.args.druid2 = ACH:Execute(format('|cffFF7C0A%s|r', L["Balance"]), nil, 16, function() StaticPopup_Show('LUCKYONE_EDITBOX', nil, nil, 'https://wago.io/LuckyoneUI-Balance') end)
	section.args.druid.args.druid3 = ACH:Execute(format('|cffFF7C0A%s|r', L["Guardian"]), nil, 17, function() StaticPopup_Show('LUCKYONE_EDITBOX', nil, nil, 'https://wago.io/LuckyoneUI-Guardian') end)
	section.args.druid.args.druid4 = ACH:Execute(format('|cffFF7C0A%s|r', L["Restoration"]), nil, 18, function() StaticPopup_Show('LUCKYONE_EDITBOX', nil, nil, 'https://wago.io/LuckyoneUI-Restoration-Druid') end)
	section.args.evoker = ACH:Group(L["Evoker"], nil, 7, nil, nil, nil, nil, Private.myClass ~= 'EVOKER')
	section.args.evoker.inline = true
	section.args.evoker.args.evoker1 = ACH:Execute(format('|cff33937F%s|r', L["Devastation"]), nil, 19, function() StaticPopup_Show('LUCKYONE_EDITBOX', nil, nil, 'https://wago.io/LuckyoneUI-Devastation') end)
	section.args.evoker.args.evoker2 = ACH:Execute(format('|cff33937F%s|r', L["Preservation"]), nil, 20, function() StaticPopup_Show('LUCKYONE_EDITBOX', nil, nil, 'https://wago.io/LuckyoneUI-Preservation') end)
	section.args.evoker.args.evoker3 = ACH:Execute(format('|cff33937F%s|r', L["Augmentation"]), nil, 21, function() StaticPopup_Show('LUCKYONE_EDITBOX', nil, nil, 'https://wago.io/LuckyoneUI-Augmentation') end)
	section.args.warrior = ACH:Group(L["Warrior"], nil, 8, nil, nil, nil, nil, Private.myClass ~= 'WARRIOR')
	section.args.warrior.inline = true
	section.args.warrior.args.warrior1 = ACH:Execute(format('|cffC69B6D%s|r', L["Arms"]), nil, 22, function() StaticPopup_Show('LUCKYONE_EDITBOX', nil, nil, 'https://wago.io/LuckyoneUI-Arms') end)
	section.args.warrior.args.warrior2 = ACH:Execute(format('|cffC69B6D%s|r', L["Fury"]), nil, 23, function() StaticPopup_Show('LUCKYONE_EDITBOX', nil, nil, 'https://wago.io/LuckyoneUI-Fury') end)
	section.args.warrior.args.warrior3 = ACH:Execute(format('|cffC69B6D%s|r', L["Protection"]), nil, 24, function() StaticPopup_Show('LUCKYONE_EDITBOX', nil, nil, 'https://wago.io/LuckyoneUI-Protection-Warrior') end)
	section.args.dk = ACH:Group(L["Death Knight"], nil, 9, nil, nil, nil, nil, Private.myClass ~= 'DEATHKNIGHT')
	section.args.dk.inline = true
	section.args.dk.args.dk1 = ACH:Execute(format('|cffC41E3A%s|r', L["Unholy"]), nil, 25, function() StaticPopup_Show('LUCKYONE_EDITBOX', nil, nil, 'https://wago.io/LuckyoneUI-Unholy') end)
	section.args.dk.args.dk2 = ACH:Execute(format('|cffC41E3A%s|r', L["Frost"]), nil, 26, function() StaticPopup_Show('LUCKYONE_EDITBOX', nil, nil, 'https://wago.io/LuckyoneUI-Frost-DK') end)
	section.args.dk.args.dk3 = ACH:Execute(format('|cffC41E3A%s|r', L["Blood"]), nil, 27, function() StaticPopup_Show('LUCKYONE_EDITBOX', nil, nil, 'https://wago.io/LuckyoneUI-Blood') end)
	section.args.dh = ACH:Group(L["Demon Hunter"], nil, 10, nil, nil, nil, nil, Private.myClass ~= 'DEMONHUNTER')
	section.args.dh.inline = true
	section.args.dh.args.dh1 = ACH:Execute(format('|cffA330C9%s|r', L["Havoc"]), nil, 28, function() StaticPopup_Show('LUCKYONE_EDITBOX', nil, nil, 'https://wago.io/LuckyoneUI-Havoc') end)
	section.args.dh.args.dh2 = ACH:Execute(format('|cffA330C9%s|r', L["Vengeance"]), nil, 29, function() StaticPopup_Show('LUCKYONE_EDITBOX', nil, nil, 'https://wago.io/LuckyoneUI-Vengeance') end)
	section.args.dh.args.dh3 = ACH:Execute(format('|cffA330C9%s|r', L["Devourer"]), nil, 30, function() StaticPopup_Show('LUCKYONE_EDITBOX', nil, nil, 'https://wago.io/LuckyoneUI-Devourer') end)
	section.args.priest = ACH:Group(L["Priest"], nil, 11, nil, nil, nil, nil, Private.myClass ~= 'PRIEST')
	section.args.priest.inline = true
	section.args.priest.args.priest1 = ACH:Execute(format('|cffFFFFFF%s|r', L["Shadow"]), nil, 31, function() StaticPopup_Show('LUCKYONE_EDITBOX', nil, nil, 'https://wago.io/LuckyoneUI-Shadow') end)
	section.args.priest.args.priest2 = ACH:Execute(format('|cffFFFFFF%s|r', L["Discipline"]), nil, 32, function() StaticPopup_Show('LUCKYONE_EDITBOX', nil, nil, 'https://wago.io/LuckyoneUI-Discipline') end)
	section.args.priest.args.priest3 = ACH:Execute(format('|cffFFFFFF%s|r', L["Holy"]), nil, 33, function() StaticPopup_Show('LUCKYONE_EDITBOX', nil, nil, 'https://wago.io/LuckyoneUI-Holy-Priest') end)
	section.args.warlock = ACH:Group(L["Warlock"], nil, 12, nil, nil, nil, nil, Private.myClass ~= 'WARLOCK')
	section.args.warlock.inline = true
	section.args.warlock.args.warlock1 = ACH:Execute(format('|cff8788EE%s|r', L["Destruction"]), nil, 34, function() StaticPopup_Show('LUCKYONE_EDITBOX', nil, nil, 'https://wago.io/LuckyoneUI-Destruction') end)
	section.args.warlock.args.warlock2 = ACH:Execute(format('|cff8788EE%s|r', L["Affliction"]), nil, 35, function() StaticPopup_Show('LUCKYONE_EDITBOX', nil, nil, 'https://wago.io/LuckyoneUI-Affliction') end)
	section.args.warlock.args.warlock3 = ACH:Execute(format('|cff8788EE%s|r', L["Demonology"]), nil, 36, function() StaticPopup_Show('LUCKYONE_EDITBOX', nil, nil, 'https://wago.io/LuckyoneUI-Demonology') end)
	section.args.mage = ACH:Group(L["Mage"], nil, 13, nil, nil, nil, nil, Private.myClass ~= 'MAGE')
	section.args.mage.inline = true
	section.args.mage.args.mage1 = ACH:Execute(format('|cff3FC7EB%s|r', L["Fire"]), nil, 37, function() StaticPopup_Show('LUCKYONE_EDITBOX', nil, nil, 'https://wago.io/LuckyoneUI-Fire') end)
	section.args.mage.args.mage2 = ACH:Execute(format('|cff3FC7EB%s|r', L["Frost"]), nil, 38, function() StaticPopup_Show('LUCKYONE_EDITBOX', nil, nil, 'https://wago.io/LuckyoneUI-Frost-Mage') end)
	section.args.mage.args.mage3 = ACH:Execute(format('|cff3FC7EB%s|r', L["Arcane"]), nil, 39, function() StaticPopup_Show('LUCKYONE_EDITBOX', nil, nil, 'https://wago.io/LuckyoneUI-Arcane') end)
	section.args.rogue = ACH:Group(L["Rogue"], nil, 14, nil, nil, nil, nil, Private.myClass ~= 'ROGUE')
	section.args.rogue.inline = true
	section.args.rogue.args.rogue1 = ACH:Execute(format('|cffFFF468%s|r', L["Assassination"]), nil, 40, function() StaticPopup_Show('LUCKYONE_EDITBOX', nil, nil, 'https://wago.io/LuckyoneUI-Assassination') end)
	section.args.rogue.args.rogue2 = ACH:Execute(format('|cffFFF468%s|r', L["Outlaw"]), nil, 41, function() StaticPopup_Show('LUCKYONE_EDITBOX', nil, nil, 'https://wago.io/LuckyoneUI-Outlaw') end)
	section.args.rogue.args.rogue3 = ACH:Execute(format('|cffFFF468%s|r', L["Subtlety"]), nil, 42, function() StaticPopup_Show('LUCKYONE_EDITBOX', nil, nil, 'https://wago.io/LuckyoneUI-Subtlety') end)
	section.args.desc = ACH:Group(L["Description"], nil, 15)
	section.args.desc.inline = true
	section.args.desc.args.desc = ACH:Description(L["Specializations are only displayed for the class you're currently logged into.\n\nGrab the updated import string from the Wago URL and import it manually.\n\nFor quick access to the Blizzard cooldown viewer panel use the button below."], 1, 'medium')
	section.args.header2 = ACH:Header(L["Cooldown Settings"], 16)
	section.args.addons = ACH:Group(L["Addon Profiles"], nil, 17)
	section.args.addons.inline = true
	section.args.addons.args.scm = ACH:Execute('SkironCooldownManager', IMPORT_DEFAULTS_TEXT, 1, function() Private:Setup_SCM() StaticPopup_Show(RELOAD_POPUP) end, nil, true)
	section.args.utilities = ACH:Group(L["Utilities"], nil, 18)
	section.args.utilities.inline = true
	section.args.utilities.args.toggleViewer = ACH:Execute(format('|cff4beb2c%s|r', L["Toggle Cooldown Settings"]), L["Shortcut to the Cooldown Settings.\nYou can import the profiles in the bottom left dropdown."], 1, function() Private:ShowCooldownViewerSettings() end)
	return section
end

-- Build ElvUI Layouts Section
local function BuildElvUILayoutSection()
	if not Private.ElvUI then return end -- ElvUI section
	local section = ACH:Group(GetIconName(L["ElvUI Layouts"], 'Layouts'), nil, 40)
	section.args.header1 = ACH:Header(L["LuckyoneUI Scale"], 1)
	section.args.scaling = ACH:Group(L["1440p = Default | 1080p = Downscaled"], nil, 2)
	section.args.scaling.inline = true
	section.args.scaling.args.native = ACH:Toggle('1440p', nil, 1, nil, nil, nil, function() return not Private.Addon.db.global.scaled end, function(_, value) Private.Addon.db.global.scaled = not value end)
	section.args.scaling.args.scaled = ACH:Toggle('1080p', nil, 2, nil, nil, nil, function() return Private.Addon.db.global.scaled end, function(_, value) Private.Addon.db.global.scaled = value end)
	section.args.header2 = ACH:Header(L["ElvUI Layouts"], 3)
	section.args.midnight = ACH:Group(L["Midnight Layouts"], nil, 4)
	section.args.midnight.inline = true
	section.args.midnight.args.main = ACH:Execute(L["DPS & Tanks"], nil, 1, function() Private:Setup_Layout('main') StaticPopup_Show(RELOAD_POPUP) end, nil, true)
	section.args.midnight.args.healingVertical = ACH:Execute(L["Healing Vertical"], nil, 2, function() Private:Setup_Layout('healing') StaticPopup_Show(RELOAD_POPUP) end, nil, true)
	section.args.midnight.args.healingHorizontal = ACH:Execute(L["Healing Horizontal"], nil, 3, function() Private:Setup_Layout('healing', nil, 'horizontal') StaticPopup_Show(RELOAD_POPUP) end, nil, true)
	section.args.midnight.args.support = ACH:Execute(L["Support"], nil, 4, function() Private:Setup_Layout('support') StaticPopup_Show(RELOAD_POPUP) end, nil, true)
	section.args.header = ACH:Header(L["Auras"], 5)
	section.args.filters = ACH:Group(L["Filters"], nil, 6)
	section.args.filters.inline = true
	section.args.filters.args.setup = ACH:Execute((Private.isRetail and L["Setup Aura Indicators"]) or L["Setup Aura Filters"], nil, 1, function() Private:Setup_Filters() StaticPopup_Show(RELOAD_POPUP) end)
	section.args.Desc = ACH:Group(L["Description"], nil, 7)
	section.args.Desc.inline = true
	section.args.Desc.args.cvars = ACH:Description((Private.isRetail and L["This will apply Luckyones Aura Indicator edit and set the style to Textured."]) or L["This will apply Luckyones Aura Indicator edit and set the style to Textured.\nIt will also add custom IDs to Whitelist & Blacklist.\n"], 2, 'medium')
	return section
end

-- Build ElvUI Themes Section
local function BuildElvUIThemesSection()
	if not Private.ElvUI then return end -- ElvUI section
	local section = ACH:Group(GetIconName(L["ElvUI Themes"], 'Themes'), nil, 45)
	section.args.header = ACH:Header(L["ElvUI Themes"], 1)
	section.args.raid = ACH:Group(L["UnitFrames Color Theme"], nil, 2)
	section.args.raid.inline = true
	section.args.raid.args.dark = ACH:Execute(L["Dark"], L["Dark Style (Default)"], 1, function() Private:Setup_Theme('dark') end, nil, true)
	section.args.raid.args.class = ACH:Execute(L["Class Color"], L["Class Color Style"], 2, function() Private:Setup_Theme('class') end, nil, true)
	return section
end

-- Build ElvUI Tweaks Section
local function BuildElvUITweaksSection()
	if not Private.ElvUI then return end -- ElvUI section
	local section = ACH:Group(GetIconName(L["ElvUI Tweaks"], 'Tweaks'), nil, 50)
	section.args.header = ACH:Header(L["ElvUI Tweaks"], 1)
	section.args.toggles = ACH:Group(L["Toggles"], nil, 2, nil, nil, nil, nil, not Private.isRetail)
	section.args.toggles.inline = true
	section.args.toggles.args.mythicVisibility = ACH:Toggle(L["Mythic Raidframe Visibility"], L["Feature explained in the description below"], 1, nil, nil, nil, function() return Private.Addon.db.profile.misc.mythicVisibility end, function(_, value) Private.Addon.db.profile.misc.mythicVisibility = value end, nil, not Private.isRetail)
	section.args.toggles.args.dataTextsTweaks = ACH:Toggle(L["DataTexts Tweaks"], L["Feature explained in the description below"], 2, nil, nil, nil, function() return Private.Addon.db.profile.misc.dataTextsTweaks end, function(_, value) Private.Addon.db.profile.misc.dataTextsTweaks = value end, nil, not Private.isRetail)
	section.args.nameplates = ACH:Group(L["Nameplates"], nil, 3)
	section.args.nameplates.inline = true
	section.args.nameplates.args.focusTextureEnable = ACH:Toggle(L["Enable Focus Texture"], nil, 1, nil, nil, nil, function() return Private.Addon.db.profile.nameplates.focusTextureEnable end, function(_, value) local db = Private.Addon.db.profile.nameplates db.focusTextureEnable = value if value or db.targetTextureEnable then Private:UpdateSpecialNameplateTextures() else Private:RestoreNameplateTextures() end end, nil, Private.isClassic)
	section.args.nameplates.args.focusTexture = ACH:SharedMediaStatusbar(L["Select Texture"], nil, 2, nil, function() return Private.Addon.db.profile.nameplates.focusTexture end, function(_, value) Private.Addon.db.profile.nameplates.focusTexture = value Private:UpdateSpecialNameplateTextures() end, function() return not Private.Addon.db.profile.nameplates.focusTextureEnable end, Private.isClassic)
	section.args.nameplates.args.spacer = ACH:Spacer(3, 'full', Private.isClassic)
	section.args.nameplates.args.targetTextureEnable = ACH:Toggle(L["Enable Target Texture"], nil, 4, nil, nil, nil, function() return Private.Addon.db.profile.nameplates.targetTextureEnable end, function(_, value) local db = Private.Addon.db.profile.nameplates db.targetTextureEnable = value if value or db.focusTextureEnable then Private:UpdateSpecialNameplateTextures() else Private:RestoreNameplateTextures() end end)
	section.args.nameplates.args.targetTexture = ACH:SharedMediaStatusbar(L["Select Texture"], nil, 5, nil, function() return Private.Addon.db.profile.nameplates.targetTexture end, function(_, value) Private.Addon.db.profile.nameplates.targetTexture = value Private:UpdateSpecialNameplateTextures() end, function() return not Private.Addon.db.profile.nameplates.targetTextureEnable end)
	section.args.mythicVisibilityDesc = ACH:Group(L["Mythic Raidframe Visibility explained"], nil, 4, nil, nil, nil, nil, not Private.isRetail)
	section.args.mythicVisibilityDesc.inline = true
	section.args.mythicVisibilityDesc.args.desc = ACH:Description(L["Your Raid 1 frames will be enabled if you enter Mythic difficulty (Triggers after loading screen)\nYour Raid 2 frames will be disabled if you enter Mythic difficulty (Triggers after loading screen)\n\nAdditionally the maxAllowedGroups setting will be enabled and the visibility state gets modified\nBenched people in groups 5-8 while not show up when you're Mythic raiding\n\nAll changes mentioned above will revert back to default upon leaving the raid"], 1, 'medium', nil, nil, nil, nil, nil, not Private.isRetail)
	section.args.dataTextsTweaksDesc = ACH:Group(L["DataTexts Tweaks explained"], nil, 5, nil, nil, nil, nil, not Private.isRetail)
	section.args.dataTextsTweaksDesc.inline = true
	section.args.dataTextsTweaksDesc.args.desc = ACH:Description(L["Adjusts the width of the 'FPS - Combat Time - Durability' DataText based on your LuckyoneUI layout\n\nThe DPS & Tanks layout will match the default width of my Action Bars\nThe Healing layout will match the default width of my Raidframes\n\nAll changes mentioned above will trigger upon changing your specialization\nIt also assumes you have properly setup specialization-based profile loading in ElvUI profiles"], 1, 'medium', nil, nil, nil, nil, nil, not Private.isRetail)
	return section
end

-- Build Graphics Section
local function BuildGraphicsSection()
	local section = ACH:Group(GetIconName(L["Graphics"], 'Graphics'), nil, 55)
	section.args.header = ACH:Header(L["Graphics"], 1)
	section.args.toggles = ACH:Group(L["General"], nil, 2)
	section.args.toggles.inline = true
	section.args.toggles.args.ResampleAlwaysSharpen = ACH:Toggle('ResampleAlwaysSharpen', 'Game Default: off | Suggestion: on\n\nBox checked means on/enabled', 1, nil, nil, nil, function() return GetCVarBool('ResampleAlwaysSharpen') end, function(_, value) SetCVar('ResampleAlwaysSharpen', value and 1 or 0) end)
	section.args.toggles.args.GxAllowCachelessShaderMode = ACH:Toggle('CachelessShaderMode', 'Game Default: off | Suggestion: off\n\nBox checked means on/enabled', 2, nil, nil, nil, function() return GetCVarBool('GxAllowCachelessShaderMode') end, function(_, value) SetCVar('GxAllowCachelessShaderMode', value and 1 or 0) end)
	section.args.cosmetic = ACH:Group(L["Cosmetic"], nil, 3)
	section.args.cosmetic.inline = true
	section.args.cosmetic.args.ffxDeath = ACH:Toggle('ffx Death', 'Game Default: on | Suggestion: off\n\nBox checked means on/enabled', 1, nil, nil, nil, function() return GetCVarBool('ffxDeath') end, function(_, value) SetCVar('ffxDeath', value and 1 or 0) end)
	section.args.cosmetic.args.ffxGlow = ACH:Toggle('ffx Glow', 'Game Default: on | Suggestion: off\n\nBox checked means on/enabled', 2, nil, nil, nil, function() return GetCVarBool('ffxGlow') end, function(_, value) SetCVar('ffxGlow', value and 1 or 0) end)
	section.args.cosmetic.args.ffxNether = ACH:Toggle('ffx Nether', 'Game Default: on | Suggestion: off\n\nBox checked means on/enabled', 3, nil, nil, nil, function() return GetCVarBool('ffxNether') end, function(_, value) SetCVar('ffxNether', value and 1 or 0) end)
	section.args.cosmetic.args.ffxVenari = ACH:Toggle('ffx Venari', 'Game Default: on | Suggestion: off\n\nBox checked means on/enabled', 4, nil, nil, nil, function() return GetCVarBool('ffxVenari') end, function(_, value) SetCVar('ffxVenari', value and 1 or 0) end)
	section.args.cosmetic.args.ffxLingeringVenari = ACH:Toggle('ffx Lingering Venari', 'Game Default: on | Suggestion: off\n\nBox checked means on/enabled', 5, nil, nil, nil, function() return GetCVarBool('ffxLingeringVenari') end, function(_, value) SetCVar('ffxLingeringVenari', value and 1 or 0) end)
	return section
end

-- Build Map Section
local function BuildMapSection()
	if not Private.ElvUI then return end -- ElvUI section
	local section = ACH:Group(GetIconName(L["Map"], 'Map'), nil, 60)
	section.args.header = ACH:Header(L["Map"], 1)
	section.args.minimapButtons = ACH:Group(L["Minimap Buttons"], nil, 2, nil, function(info) return Private.Addon.db.profile.map.minimap.buttons[info[#info]] end, function(info, value) Private.Addon.db.profile.map.minimap.buttons[info[#info]] = value Private:UpdateMinimapButtonBar() end)
	section.args.minimapButtons.inline = true
	section.args.minimapButtons.args.enable = ACH:Toggle(L["Enable"], L["Collect LibDBIcon minimap buttons into a squared bar under the Minimap."], 1, nil, nil, nil, nil, function(_, value) Private.Addon.db.profile.map.minimap.buttons.enable = value StaticPopup_Show(RELOAD_POPUP) end)
	section.args.minimapButtons.args.mouseover = ACH:Toggle(L["Mouseover"], L["Show the Minimap button bar only on mouseover."], 2, nil, nil, nil, nil, nil, function() return not Private.Addon.db.profile.map.minimap.buttons.enable end)
	section.args.minimapButtons.args.holder = ACH:Input(L["Anchor"], L["Frame name the Minimap button bar is anchored to."], 3, nil, nil, nil, nil, function() return not Private.Addon.db.profile.map.minimap.buttons.enable end)
	section.args.minimapButtons.args.xOffset = ACH:Range(L["X Offset"], nil, 4, { min = -200, max = 200, step = 1 }, nil, nil, nil, function() return not Private.Addon.db.profile.map.minimap.buttons.enable end)
	section.args.minimapButtons.args.yOffset = ACH:Range(L["Y Offset"], nil, 5, { min = -200, max = 200, step = 1 }, nil, nil, nil, function() return not Private.Addon.db.profile.map.minimap.buttons.enable end)
	section.args.minimapButtons.args.size = ACH:Range(L["Icon Size"], nil, 6, { min = 8, max = 54, step = 1 }, nil, nil, nil, function() return not Private.Addon.db.profile.map.minimap.buttons.enable end)
	section.args.minimapButtons.args.spacing = ACH:Range(L["Spacing"], nil, 7, { min = -1, max = 12, step = 1 }, nil, nil, nil, function() return not Private.Addon.db.profile.map.minimap.buttons.enable end)
	section.args.minimapButtons.args.perRow = ACH:Range(L["Buttons Per Row"], nil, 8, { min = 1, max = 20, step = 1 }, nil, nil, nil, function() return not Private.Addon.db.profile.map.minimap.buttons.enable end)
	section.args.blizzardButtons = ACH:Group(L["Blizzard Buttons"], nil, 3, nil, function(info) return Private.Addon.db.profile.map.minimap.buttons.blizzard[info[#info]] end, function(info, value) Private.Addon.db.profile.map.minimap.buttons.blizzard[info[#info]] = value StaticPopup_Show(RELOAD_POPUP) end, function() return not Private.Addon.db.profile.map.minimap.buttons.enable end, not Private.isRetail)
	section.args.blizzardButtons.inline = true
	section.args.blizzardButtons.args.expansionLandingPage = ACH:Toggle(L["Expansion Landing Page"], L["Include the Expansion Landing Page button in the Minimap button bar."], 1)
	section.args.minimapButtonsDesc = ACH:Group(L["Minimap Buttons explained"], nil, 4)
	section.args.minimapButtonsDesc.inline = true
	section.args.minimapButtonsDesc.args.desc = ACH:Description(L["The order of icons is sorted alphabetically, starting on the right side.\nException 1: BugSack - it's hardcoded to be the right-most icon.\nException 2: Blizzard buttons - they're hardcoded to be the last icon."], 1, 'medium')
	return section
end

-- Build Misc Section
local function BuildMiscSection()
	local section = ACH:Group(GetIconName(L["Misc"], 'Misc'), nil, 65)
	section.args.header = ACH:Header(L["Misc"], 1)
	section.args.combatText = ACH:Group(L["Combat Text"], nil, 2, nil, function(info) return Private.Addon.db.profile.misc.combatText[info[#info]] end, function(info, value) Private.Addon.db.profile.misc.combatText[info[#info]] = value Private:CombatText_Update() end)
	section.args.combatText.inline = true
	section.args.combatText.args.enable = ACH:Toggle(L["Enable"], L["Show a customizable text on screen when entering and leaving combat."], 1)
	section.args.combatText.args.enterText = ACH:Input(L["Entering Text"], nil, 2, nil, nil, nil, nil, function() return not Private.Addon.db.profile.misc.combatText.enable end)
	section.args.combatText.args.leaveText = ACH:Input(L["Leaving Text"], nil, 3, nil, nil, nil, nil, function() return not Private.Addon.db.profile.misc.combatText.enable end)
	section.args.combatText.args.fadeTime = ACH:Range(L["Fade Time"], L["Duration of the fade out in seconds."], 4, { min = 0.1, max = 10, step = 0.1 }, nil, nil, nil, function() return not Private.Addon.db.profile.misc.combatText.enable end)
	section.args.combatText.args.enterColor = ACH:Color(L["Entering Color"], nil, 5, nil, nil, function() local color = Private.Addon.db.profile.misc.combatText.enterColor return color.r, color.g, color.b end, function(_, r, g, b) local color = Private.Addon.db.profile.misc.combatText.enterColor color.r, color.g, color.b = r, g, b end, function() return not Private.Addon.db.profile.misc.combatText.enable end)
	section.args.combatText.args.leaveColor = ACH:Color(L["Leaving Color"], nil, 6, nil, nil, function() local color = Private.Addon.db.profile.misc.combatText.leaveColor return color.r, color.g, color.b end, function(_, r, g, b) local color = Private.Addon.db.profile.misc.combatText.leaveColor color.r, color.g, color.b = r, g, b end, function() return not Private.Addon.db.profile.misc.combatText.enable end)
	section.args.combatText.args.anchorGroup = ACH:Group(L["Anchor"], nil, 7, nil, nil, nil, function() return not Private.Addon.db.profile.misc.combatText.enable end)
	section.args.combatText.args.anchorGroup.inline = true
	section.args.combatText.args.anchorGroup.args.anchor = ACH:Input(L["Anchor"], L["Frame name the combat text is anchored to."], 1)
	section.args.combatText.args.anchorGroup.args.xOffset = ACH:Range(L["X Offset"], nil, 2, { min = -1000, max = 1000, step = 1 })
	section.args.combatText.args.anchorGroup.args.yOffset = ACH:Range(L["Y Offset"], nil, 3, { min = -1000, max = 1000, step = 1 })
	section.args.combatText.args.fontGroup = ACH:Group(L["Font"], nil, 8, nil, nil, nil, function() return not Private.Addon.db.profile.misc.combatText.enable end)
	section.args.combatText.args.fontGroup.inline = true
	if Private.ElvUI then
		section.args.combatText.args.fontGroup.args.font = ACH:SharedMediaFont(L["Font"], nil, 1)
		section.args.combatText.args.fontGroup.args.fontOutline = ACH:FontFlags(L["Font Outline"], nil, 2)
	end
	section.args.combatText.args.fontGroup.args.fontSize = ACH:Range(L["Font Size"], nil, 3, { min = 8, max = 64, step = 1 })
	return section
end

-- Build Skins Section
local function BuildSkinsSection()
	if not Private.ElvUI then return end -- ElvUI section
	local section = ACH:Group(GetIconName('Skins', 'Skins'), nil, 70)
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
	section.args.blizzard = ACH:Group('Blizzard', nil, 2, nil, function(info) return Private.Addon.db.profile.skins.Blizzard[info[#info]] end, function(info, value) Private.Addon.db.profile.skins.Blizzard[info[#info]] = value StaticPopup_Show(RELOAD_POPUP) end, nil, not Private.isRetail)
	section.args.blizzard.inline = true
	section.args.blizzard.args.CooldownViewer = ACH:Toggle('Cooldown Manager Settings', nil, 1)
	return section
end

-- Build Credits Section
local function BuildCreditsSection()
	local section = ACH:Group(GetIconName(format('|cfd9b9b9b%s|r', L["Credits"]), 'Credits'), nil, 75)
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
	local section = ACH:Group(GetIconName(format('|cfd9b9b9b%s|r', L["Links"]), 'Links'), nil, 80)
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
	Private.Config.args.addonProfiles = BuildAddonProfilesSection() -- 10
	Private.Config.args.privateDB = BuildPrivateDBSection() -- 15
	Private.Config.args.chat = BuildChatSection() -- 20
	Private.Config.args.cvars = BuildCVarsSection() -- 25
	Private.Config.args.damageMeter = BuildDamageMeterSection() -- 30
	Private.Config.args.cdm = BuildCDMSection() -- 35
	Private.Config.args.elvuiLayouts = BuildElvUILayoutSection() -- 40
	Private.Config.args.elvuiThemes = BuildElvUIThemesSection() -- 45
	Private.Config.args.elvuiTweaks = BuildElvUITweaksSection() -- 50
	Private.Config.args.graphics = BuildGraphicsSection() -- 55
	Private.Config.args.map = BuildMapSection() -- 60
	Private.Config.args.misc = BuildMiscSection() -- 65
	Private.Config.args.skins = BuildSkinsSection() -- 70
	Private.Config.args.credits = BuildCreditsSection() -- 75
	Private.Config.args.links = BuildLinksSection() -- 80
	Private.Config.args.dev = BuildDevSection() -- 100

	-- ElvUI config integration
	if Private.ElvUI then
		local E = ElvUI[1]

		E.Options.name = format('%s + %s |cff99ff33%.2f|r', E.Options.name, Private.Name, Private.Version)
		E.Options.args.LuckyoneUI = Private.Config

		local scaling = E.Options.args.general and E.Options.args.general.args.general and E.Options.args.general.args.general.args.scaling
		if scaling then
			scaling.hidden = true
		end
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
