local L1UI, E, L, V, P, G = unpack(select(2, ...))
local CH = E:GetModule('Chat')

local format, print = format, print

local _G = _G
local IsAddOnLoaded = IsAddOnLoaded
local ReloadUI = ReloadUI
local SetCVar = SetCVar

-- Chat print
function L1UI:Print(msg)
	print(L1UI.Name..': '..msg)
end

-- Reload popup
E.PopupDialogs.L1UI_RL = {
	text = L["Reload required - continue?"],
	button1 = ACCEPT,
	button2 = CANCEL,
	OnAccept = ReloadUI,
	whileDead = 1,
	hideOnEscape = false,
}

-- Version check popup
E.PopupDialogs.L1UI_VC = {
	text = format('|cffbf0008%s|r', L["Your ElvUI is outdated - please update and reload."]),
	button1 = OKAY,
	whileDead = 1,
	hideOnEscape = false,
}

-- Version check
function L1UI:VersionCheck()
	if E.version < L1UI.RequiredVersion then
		E:StaticPopup_Show('L1UI_VC')
		L1UI:Print(format('|cffbf0008%s|r', L["Your ElvUI is outdated - please update and reload."]))
	end
end

-- General CVars
function L1UI:Setup_CVars()

	-- Core CVars
	SetCVar('advancedCombatLogging', 1)
	SetCVar('alwaysShowActionBars', 1)
	SetCVar('autoLootDefault', 1)
	SetCVar('cameraDistanceMaxZoomFactor', 2.6)
	SetCVar('ffxDeath', 0)
	SetCVar('ffxGlow', 0)
	SetCVar('ffxNether', 0)
	SetCVar('fstack_preferParentKeys', 0)
	SetCVar('lockActionBars', 1)
	SetCVar('profanityFilter', 0)
	SetCVar('rawMouseEnable', 1)
	SetCVar('screenshotQuality', 10)
	SetCVar('showNPETutorials', 0)
	SetCVar('showTutorials', 0)
	SetCVar('threatWarning', 3)
	SetCVar('UberTooltips', 1)

	-- Wrath | TBC | Classic
	if not E.Retail then
		SetCVar('instantQuestText', 1)
	end

	-- My CVars
	if L1UI.Me then
		SetCVar('disableServerNagle', 0)
		SetCVar('doNotFlashLowHealthWarning', 1)
		SetCVar('floatingCombatTextCombatDamage', 0)
		SetCVar('floatingCombatTextCombatHealing', 0)
		SetCVar('maxFPSLoading', 30)
		SetCVar('nameplateShowOnlyNames', 1)
		SetCVar('RAIDweatherDensity', 0)
		SetCVar('showToastOffline', 0)
		SetCVar('showToastOnline', 0)
		SetCVar('showToastWindow', 0)
		SetCVar('SpellQueueWindow', 180)
		SetCVar('useIPv6', 0)
		SetCVar('weatherDensity', 0)
	end

	_G.InterfaceOptionsActionBarsPanelPickupActionKeyDropDown:SetValue('SHIFT')
	_G.InterfaceOptionsActionBarsPanelPickupActionKeyDropDown:RefreshValue()

	L1UI:Print(L["CVars have been set."])
end

-- NamePlate CVars
function L1UI:NameplateCVars()

	SetCVar('nameplateLargerScale', 1)
	SetCVar('nameplateLargeTopInset', -1)
	SetCVar('nameplateMinAlpha', 1)
	SetCVar('nameplateMinScale', 1)
	SetCVar('nameplateMotion', 1)
	SetCVar('nameplateOccludedAlphaMult', 1)
	SetCVar('nameplateOtherBottomInset', -1)
	SetCVar('nameplateOtherTopInset', -1)
	SetCVar('nameplateOverlapH', 1.1)
	SetCVar('nameplateOverlapV', 1.8)
	SetCVar('nameplateSelectedScale', 1)
	SetCVar('nameplateSelfAlpha', 1)
	SetCVar('nameplateSelfTopInset', -1)

	SetCVar('UnitNameEnemyGuardianName', 1)
	SetCVar('UnitNameEnemyMinionName', 1)
	SetCVar('UnitNameEnemyPetName', 1)
	SetCVar('UnitNameEnemyPlayerName', 1)

	if not E.Classic then SetCVar('UnitNameEnemyTotem', 1) end

	if not E.Retail then SetCVar('nameplateNotSelectedAlpha', 1) end

	L1UI:Print(L["NamePlate CVars have been set."])
end

-- E.private & Media
function L1UI:Setup_PrivateDB()

	E.db.general.font = "Expressway"
	E.db.general.fontSize = 11
	E.db.general.fontStyle = "OUTLINE"

	E.private.general.chatBubbleFont = "Expressway"
	E.private.general.chatBubbleFontOutline = "OUTLINE"
	E.private.general.dmgfont = "Expressway"
	E.private.general.glossTex = "Minimalist"
	E.private.general.namefont = "Expressway"
	E.private.general.nameplateFont = "Expressway"
	E.private.general.nameplateLargeFont = "Expressway"
	E.private.general.normTex = "Minimalist"
	E.private.skins.parchmentRemoverEnable = true

	E.private.general.totemBar = E.Retail and false or true
	E.private.install_complete = E.Retail and "12.81" or E.TBC and "2.48" or E.Classic and "1.73" or E.Wrath and "0.17"
end

-- E.global & Custom DataText
function L1UI:Setup_GlobalDB()

	SetCVar('uiScale', 0.71111111111111)
	E.global.general.UIScale = 0.71111111111111

	E.global.datatexts.settings.Combat.TimeFull = false
	E.global.datatexts.settings.System.latency = "HOME"
	E.global.general.commandBarSetting = "DISABLED"
	E.global.general.fadeMapWhenMoving = false
	E.global.general.mapAlphaWhenMoving = 0.35
	E.global.general.smallerWorldMapScale = 0.8
	E.global.general.WorldMapCoordinates.position = "TOPLEFT"

	do
		E.DataTexts:BuildPanelFrame('Luckyone_ActionBars_DT')
		E.global.datatexts.customPanels.Luckyone_ActionBars_DT.backdrop = true
		E.global.datatexts.customPanels.Luckyone_ActionBars_DT.border = true
		E.global.datatexts.customPanels.Luckyone_ActionBars_DT.enable = true
		E.global.datatexts.customPanels.Luckyone_ActionBars_DT.fonts.enable = true
		E.global.datatexts.customPanels.Luckyone_ActionBars_DT.fonts.font = "Expressway"
		E.global.datatexts.customPanels.Luckyone_ActionBars_DT.fonts.fontOutline = "OUTLINE"
		E.global.datatexts.customPanels.Luckyone_ActionBars_DT.fonts.fontSize = 11
		E.global.datatexts.customPanels.Luckyone_ActionBars_DT.frameLevel = 1
		E.global.datatexts.customPanels.Luckyone_ActionBars_DT.frameStrata = "BACKGROUND"
		E.global.datatexts.customPanels.Luckyone_ActionBars_DT.growth = "HORIZONTAL"
		E.global.datatexts.customPanels.Luckyone_ActionBars_DT.height = 13
		E.global.datatexts.customPanels.Luckyone_ActionBars_DT.mouseover = false
		E.global.datatexts.customPanels.Luckyone_ActionBars_DT.name = "Luckyone_ActionBars_DT"
		E.global.datatexts.customPanels.Luckyone_ActionBars_DT.numPoints = 3
		E.global.datatexts.customPanels.Luckyone_ActionBars_DT.panelTransparency = true
		E.global.datatexts.customPanels.Luckyone_ActionBars_DT.textJustify = "CENTER"
		E.global.datatexts.customPanels.Luckyone_ActionBars_DT.tooltipAnchor = "ANCHOR_TOP"
		E.global.datatexts.customPanels.Luckyone_ActionBars_DT.tooltipXOffset = 0
		E.global.datatexts.customPanels.Luckyone_ActionBars_DT.tooltipYOffset = 5
		E.global.datatexts.customPanels.Luckyone_ActionBars_DT.visibility = E.Retail and "[petbattle] hide;show" or "show"
		E.global.datatexts.customPanels.Luckyone_ActionBars_DT.width = 358
	end
end

-- ElvUI Layouts setup
function L1UI:Setup_Layout(layout)

	-- Create a fresh profile in ElvUI
	if layout == 'main' then
		E.data:SetProfile('Luckyone DPS/TANK v'..L1UI.Version)
	elseif layout == 'healing' then
		E.data:SetProfile('Luckyone Healing v'..L1UI.Version)
	end

	-- E.global & Custom DataText
	L1UI:Setup_GlobalDB()

	-- E.private & Media
	L1UI:Setup_PrivateDB()

	-- AddOnSkins profile
	if IsAddOnLoaded('AddOnSkins') then L1UI:Setup_AddOnSkins('noPrint') end

	-- ProjectAzilroka profile
	if IsAddOnLoaded('ProjectAzilroka') then L1UI:Setup_ProjectAzilroka('noPrint') end

	-- Shadow & Light profile
	if IsAddOnLoaded('ElvUI_SLE') and E.Retail then L1UI:Setup_ShadowAndLight('noPrint') end

	-- E.db & movers
	if layout == 'main' then
		L1UI:Layout_Shadowlands('main')
	elseif layout == 'healing' then
		L1UI:Layout_Shadowlands('healing')
	end

	E:StaggeredUpdateAll()

	L1UI:Print(L["Layout has been set."])
end

-- Performance config section
function L1UI:Cleanup_Cache(addon, type)
	if addon == 'elvui' and E.private.chat.enable then
		if type == 'chat' then
			CH:ResetHistory()
		elseif type == 'editbox' then
			CH:ResetEditboxHistory()
		end
	elseif addon == 'details' and IsAddOnLoaded('Details') then
		_detalhes.boss_mods_timers = {}
		_detalhes.encounter_spell_pool = {}
		_detalhes.npcid_pool = {}
		_detalhes.spell_pool = {}
		_detalhes.spell_school_cache = {}
	elseif addon == 'plater' and IsAddOnLoaded('Plater') then
		PlaterDB.captured_casts = {}
		PlaterDB.captured_spells = {}
		if PlaterDB.profiles.Luckyone then PlaterDB.profiles.Luckyone.npc_cache = {} end
	elseif addon == 'rc' and IsAddOnLoaded('RCLootCouncil') then
		RCLootCouncilDB.global.cache = {}
		RCLootCouncilDB.global.errors = {}
		RCLootCouncilDB.global.log = {}
		RCLootCouncilDB.global.verTestCandidates = {}
	elseif addon == 'mrt' and IsAddOnLoaded('MRT') then
		VMRT.Encounter.list = {}
		VMRT.Encounter.names = {}
		VMRT.ExCD2.gnGUIDs = {}
		VMRT.Inspect.Soulbinds = {}
	end
end
