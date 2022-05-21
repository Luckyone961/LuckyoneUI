local L1UI, E, L, V, P, G = unpack(select(2, ...))
local CH = E:GetModule('Chat')
local LuckyDT

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

-- DB conversion
function L1UI:ConvertDB()
	if E.private.L1UI.install_version ~= nil then
		E.db.L1UI.install_version = E.private.L1UI.install_version
		E.private.L1UI.install_version = nil
	end
end

-- Set UI Scale
function L1UI:SetupScale()
	E.global.general.UIScale = 0.71111111111111
	SetCVar('uiScale', 0.71111111111111)
end

-- General CVars
function L1UI:SetupCVars()

	-- Core CVars
	SetCVar('advancedCombatLogging', 1)
	SetCVar('alwaysShowActionBars', 1)
	SetCVar('cameraDistanceMaxZoomFactor', 2.6)
	SetCVar('ffxDeath', 0)
	SetCVar('ffxGlow', 0)
	SetCVar('ffxNether', 0)
	SetCVar('fstack_preferParentKeys', 0)
	SetCVar('lockActionBars', 1)
	SetCVar('rawMouseEnable', 1)
	SetCVar('screenshotQuality', 10)
	SetCVar('showNPETutorials', 0)
	SetCVar('showTutorials', 0)
	SetCVar('threatWarning', 3)
	SetCVar('UberTooltips', 1)

	-- Classic and TBC CVars
	if not E.Retail then
		SetCVar('autoLootDefault', 1)
		SetCVar('instantQuestText', 1)
		SetCVar('profanityFilter', 0)
	end

	-- My CVars
	if L1UI.Me then
		SetCVar('doNotFlashLowHealthWarning', 1)
		SetCVar('floatingCombatTextCombatDamage', 0)
		SetCVar('floatingCombatTextCombatHealing', 0)
		SetCVar('maxFPS', 144)
		SetCVar('maxFPSBk', 60)
		SetCVar('maxFPSLoading', 30)
		SetCVar('nameplateShowOnlyNames', 1)
		SetCVar('RAIDweatherDensity', 0)
		SetCVar('showToastOffline', 0)
		SetCVar('showToastOnline', 0)
		SetCVar('showToastWindow', 0)
		SetCVar('SpellQueueWindow', 180)
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
function L1UI:SetupPrivate()

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

	if E.Retail then
		E.private.install_complete = "12.79"
		E.private.general.totemBar = false
	elseif E.TBC then
		E.private.install_complete = "2.46"
		E.private.general.totemBar = true
	elseif E.Classic then
		E.private.install_complete = "1.71"
		E.private.general.totemBar = true
	end
end

-- E.global
function L1UI:SetupGlobal()

	E.global.datatexts.settings.Combat.TimeFull = false
	E.global.datatexts.settings.System.latency = "HOME"
	E.global.general.commandBarSetting = "DISABLED"
	E.global.general.fadeMapWhenMoving = false
	E.global.general.mapAlphaWhenMoving = 0.35
	E.global.general.smallerWorldMapScale = 0.8
	E.global.general.WorldMapCoordinates.position = "TOPLEFT"

	do -- Luckyone Custom DataText (below ActionBars)
		E.DataTexts:BuildPanelFrame('Luckyone_ActionBars_DT')
		LuckyDT = E.global.datatexts.customPanels.Luckyone_ActionBars_DT
		LuckyDT.backdrop = true
		LuckyDT.border = true
		LuckyDT.enable = true
		LuckyDT.fonts.enable = true
		LuckyDT.fonts.font = "Expressway"
		LuckyDT.fonts.fontOutline = "OUTLINE"
		LuckyDT.fonts.fontSize = 11
		LuckyDT.frameLevel = 1
		LuckyDT.frameStrata = "BACKGROUND"
		LuckyDT.growth = "HORIZONTAL"
		LuckyDT.height = 13
		LuckyDT.mouseover = false
		LuckyDT.name = "Luckyone_ActionBars_DT"
		LuckyDT.numPoints = 3
		LuckyDT.panelTransparency = true
		LuckyDT.textJustify = "CENTER"
		LuckyDT.tooltipAnchor = "ANCHOR_TOP"
		LuckyDT.tooltipXOffset = 0
		LuckyDT.tooltipYOffset = 5
		LuckyDT.visibility = E.Retail and "[petbattle] hide;show" or "show"
		LuckyDT.width = 358
	end
end

-- Performance config section
function L1UI:Cleanup_Cache(addon, type)

	if addon == 'elvui' then

		if type == 'chat' then

			CH:ResetHistory()

		elseif type == 'editbox' then

			CH:ResetEditboxHistory()

		end

	elseif addon == 'details' then
		if not IsAddOnLoaded('Details') then return end

		_detalhes.encounter_spell_pool = {}
		_detalhes.npcid_pool = {}
		_detalhes.spell_pool = {}
		_detalhes.spell_school_cache = {}

	elseif addon == 'plater' then
		if not IsAddOnLoaded('Plater') then return end

		PlaterDB.captured_casts = {}
		PlaterDB.captured_spells = {}
		PlaterDB.profiles.Luckyone.npc_cache = {}

	elseif addon == 'rc' then
		if not IsAddOnLoaded('RCLootCouncil') then return end

		RCLootCouncilDB.global.cache = {}
		RCLootCouncilDB.global.log = {}
		RCLootCouncilDB.global.verTestCandidates = {}

	elseif addon == 'mrt' then
		if not IsAddOnLoaded('MRT') then return end

		VMRT.Encounter.list = {}
		VMRT.Encounter.names = {}
		VMRT.ExCD2.gnGUIDs = {}
		VMRT.Inspect.Soulbinds = {}

	end
end
