local Name, Private = ...
local E, L, V, P, G = unpack(ElvUI)
local CH = E:GetModule('Chat')
local DT = E:GetModule('DataTexts')

local C_UI_Reload = C_UI.Reload
local format, print = format, print
local hooksecurefunc = hooksecurefunc
local SetCVar = SetCVar

-- Chat print
function Private:Print(msg)
	print(Private.Name .. ': ' .. msg)
end

-- Reload popup
E.PopupDialogs.L1UI_RL = {
	text = L["Reload required - continue?"],
	button1 = ACCEPT,
	button2 = CANCEL,
	OnAccept = C_UI_Reload,
	whileDead = 1,
	hideOnEscape = false,
}

-- Version check popup
E.PopupDialogs.L1UI_VC = {
	text = format('|cffC80000%s|r', L["Your ElvUI is outdated - please update and reload."]),
	whileDead = 1,
	hideOnEscape = false,
}

-- Editbox popup from ElvUI\Core\General\StaticPopups.lua:78
-- Slightly modified for title text and additional chat print
E.PopupDialogs.L1UI_EDITBOX = {
	text = Private.Name,
	button1 = OKAY,
	hasEditBox = 1,
	OnShow = function(self, data)
		self.editBox:SetAutoFocus(false)
		self.editBox.width = self.editBox:GetWidth()
		self.editBox:Width(280)
		self.editBox:AddHistoryLine('text')
		self.editBox.temptxt = data
		self.editBox:SetText(data)
		self.editBox:HighlightText()
		self.editBox:SetJustifyH('CENTER')
		Private:Print(data)
	end,
	OnHide = function(self)
		self.editBox:Width(self.editBox.width or 50)
		self.editBox.width = nil
		self.temptxt = nil
	end,
	EditBoxOnEnterPressed = function(self)
		self:GetParent():Hide()
	end,
	EditBoxOnEscapePressed = function(self)
		self:GetParent():Hide()
	end,
	EditBoxOnTextChanged = function(self)
		if self:GetText() ~= self.temptxt then
			self:SetText(self.temptxt)
		end
		self:HighlightText()
		self:ClearFocus()
	end,
	OnAccept = E.noop,
	whileDead = 1,
	preferredIndex = 3,
	hideOnEscape = 1,
}

-- Version check
function L1UI:VersionCheck()
	if E.version < Private.RequiredElvUI then
		E:StaticPopup_Show('L1UI_VC')
		Private:Print(format('|cffbf0008%s|r', L["Your ElvUI is outdated - please update and reload."]))
	end
end

-- General CVars
function L1UI:Setup_CVars(noPrint)
	-- Core CVars
	SetCVar('advancedCombatLogging', 1)
	SetCVar('alwaysShowActionBars', 1)
	SetCVar('autoLootDefault', 1)
	SetCVar('AutoPushSpellToActionBar', 0)
	SetCVar('cameraDistanceMaxZoomFactor', 2.6)
	SetCVar('ffxDeath', 0)
	SetCVar('ffxGlow', 0)
	SetCVar('ffxNether', 0)
	SetCVar('fstack_preferParentKeys', 0)
	SetCVar('lockActionBars', 1)
	SetCVar('nameplateShowOnlyNames', 1)
	SetCVar('profanityFilter', 0)
	SetCVar('rawMouseEnable', 1)
	SetCVar('screenshotQuality', 10)
	SetCVar('showNPETutorials', 0)
	SetCVar('showTutorials', 0)
	SetCVar('threatWarning', 3)
	SetCVar('UberTooltips', 1)

	-- Wrath CVars
	if E.Wrath then
		SetCVar('equipmentManager', 1)
		SetCVar('previewTalents', 1)
	end

	-- Developer CVars
	if E.global.L1UI.dev then
		SetCVar('blockChannelInvites', 1)
		SetCVar('CameraReduceUnexpectedMovement', 1)
		SetCVar('DisableAdvancedFlyingVelocityVFX', 1)
		SetCVar('disableServerNagle', 0)
		SetCVar('displaySpellActivationOverlays', 0)
		SetCVar('doNotFlashLowHealthWarning', 1)
		SetCVar('empowerTapControls', 1)
		SetCVar('floatingCombatTextCombatDamage', 0)
		SetCVar('floatingCombatTextCombatHealing', 0)
		SetCVar('GxAllowCachelessShaderMode', 0)
		SetCVar('LowLatencyMode', 2)
		SetCVar('maxFPSLoading', 30)
		SetCVar('RAIDweatherDensity', 0)
		SetCVar('showToastOffline', 0)
		SetCVar('showToastOnline', 0)
		SetCVar('showToastWindow', 0)
		SetCVar('SpellQueueWindow', 180)
		SetCVar('useIPv6', 0)
		SetCVar('weatherDensity', 0)
	end

	if not noPrint then
		Private:Print(L["CVars have been set."])
	end
end

-- NamePlate CVars
function L1UI:NameplateCVars(noPrint)
	SetCVar('NamePlateHorizontalScale', 1)
	SetCVar('nameplateLargerScale', 1)
	SetCVar('nameplateLargeTopInset', -1)
	SetCVar('nameplateMinAlpha', 1)
	SetCVar('nameplateMinScale', 1)
	SetCVar('nameplateMotion', 1)
	SetCVar('nameplateOccludedAlphaMult', 1)
	SetCVar('nameplateOtherBottomInset', -1)
	SetCVar('nameplateOtherTopInset', -1)
	SetCVar('nameplateOverlapH', 1)
	SetCVar('nameplateOverlapV', 1.4)
	SetCVar('nameplateSelectedScale', 1)
	SetCVar('nameplateSelfAlpha', 1)
	SetCVar('nameplateSelfTopInset', -1)
	SetCVar('NamePlateVerticalScale', 1)

	SetCVar('UnitNameEnemyGuardianName', 1)
	SetCVar('UnitNameEnemyMinionName', 1)
	SetCVar('UnitNameEnemyPetName', 1)
	SetCVar('UnitNameEnemyPlayerName', 1)

	if not E.Classic then
		SetCVar('UnitNameEnemyTotem', 1)
	end

	if not E.Retail then
		SetCVar('nameplateNotSelectedAlpha', 1)
	end

	if not noPrint then
		Private:Print(L["NamePlate CVars have been set."])
	end
end

-- E.private & Media
function L1UI:Setup_PrivateDB()
	E.db.general.font = Private.Font
	E.db.general.fontSize = 11
	E.db.general.fontStyle = 'OUTLINE'

	E.private.bags.bagBar = false
	E.private.general.chatBubbleFont = Private.Font
	E.private.general.chatBubbleFontOutline = 'OUTLINE'
	E.private.general.dmgfont = Private.Font
	E.private.general.glossTex = Private.Texture
	E.private.general.minimap.hideTracking = not E.Classic
	E.private.general.namefont = Private.Font
	E.private.general.nameplateFont = Private.Font
	E.private.general.nameplateLargeFont = Private.Font
	E.private.general.normTex = Private.Texture
	E.private.general.totemTracker = false

	E.private.install_complete = E.version

	E.private.nameplates.enable = false
	E.private.skins.parchmentRemoverEnable = true

	-- Developer db
	if E.global.L1UI.dev then
		E.private.general.chatBubbles = 'disabled'
		E.private.L1UI.disabledFrames.AlertFrame = true
		E.private.L1UI.disabledFrames.BossBanner = true
		E.private.L1UI.qualityOfLife.easyDelete = true
		E.private.L1UI.skins.BugSack = true
		E.private.L1UI.skins.TalentLoadoutsEx = true
	end
end

-- E.global & Custom DataText
function L1UI:Setup_GlobalDB()
	SetCVar('uiScale', 0.71111111111111)
	E.global.general.UIScale = 0.71111111111111

	E.global.datatexts.settings.Combat.NoLabel = true
	E.global.datatexts.settings.Combat.TimeFull = false
	E.global.datatexts.settings.Durability.NoLabel = true
	E.global.datatexts.settings.System.latency = 'HOME'
	E.global.datatexts.settings.System.NoLabel = true
	E.global.datatexts.settings.Time.time24 = true
	E.global.general.commandBarSetting = 'DISABLED'
	E.global.general.fadeMapWhenMoving = false
	E.global.general.mapAlphaWhenMoving = 0.35
	E.global.general.smallerWorldMapScale = 0.8
	E.global.general.WorldMapCoordinates.position = 'TOPLEFT'

	DT:BuildPanelFrame('Luckyone_ActionBars_DT')
	DT:BuildPanelFrame('Luckyone_MiniMap_DT')

	E.db.datatexts.panels.Luckyone_ActionBars_DT = E.db.datatexts.panels.Luckyone_ActionBars_DT or {}
	E.db.datatexts.panels.Luckyone_MiniMap_DT = E.db.datatexts.panels.Luckyone_MiniMap_DT or {}

	local ActionBarsDT = E.global.datatexts.customPanels.Luckyone_ActionBars_DT
	ActionBarsDT.backdrop = true
	ActionBarsDT.border = true
	ActionBarsDT.enable = true
	ActionBarsDT.fonts.enable = true
	ActionBarsDT.fonts.font = Private.Font
	ActionBarsDT.fonts.fontOutline = 'OUTLINE'
	ActionBarsDT.fonts.fontSize = 10
	ActionBarsDT.frameLevel = 1
	ActionBarsDT.frameStrata = 'BACKGROUND'
	ActionBarsDT.growth = 'HORIZONTAL'
	ActionBarsDT.height = 12
	ActionBarsDT.mouseover = false
	ActionBarsDT.name = 'Luckyone_ActionBars_DT'
	ActionBarsDT.numPoints = 3
	ActionBarsDT.panelTransparency = true
	ActionBarsDT.textJustify = 'CENTER'
	ActionBarsDT.tooltipAnchor = 'ANCHOR_TOP'
	ActionBarsDT.tooltipXOffset = 0
	ActionBarsDT.tooltipYOffset = 5
	ActionBarsDT.visibility = E.Retail and '[petbattle] hide;show' or 'show'
	ActionBarsDT.width = 323

	local MiniMapDT = E.global.datatexts.customPanels.Luckyone_MiniMap_DT
	MiniMapDT.backdrop = false
	MiniMapDT.border = false
	MiniMapDT.fonts.enable = true
	MiniMapDT.fonts.font = Private.Font
	MiniMapDT.fonts.fontOutline = 'OUTLINE'
	MiniMapDT.fonts.fontSize = 15
	MiniMapDT.frameLevel = 1
	MiniMapDT.frameStrata = 'HIGH'
	MiniMapDT.growth = 'HORIZONTAL'
	MiniMapDT.height = 18
	MiniMapDT.mouseover = false
	MiniMapDT.name = 'Luckyone_MiniMap_DT'
	MiniMapDT.numPoints = 1
	MiniMapDT.panelTransparency = true
	MiniMapDT.textJustify = 'CENTER'
	MiniMapDT.tooltipAnchor = 'ANCHOR_BOTTOMLEFT'
	MiniMapDT.tooltipXOffset = -53
	MiniMapDT.tooltipYOffset = -3
	MiniMapDT.visibility = E.Retail and '[petbattle] hide;show' or 'show'
	MiniMapDT.width = 56
end

-- Dragonflight layouts
function L1UI:Setup_Layout_Dragonflight(layout)
	-- Disable LibDualSpec to set the profile
	if E.Retail or E.Wrath then
		ElvDB['namespaces']['LibDualSpec-1.0'] = ElvDB['namespaces']['LibDualSpec-1.0'] or {}
		ElvDB['namespaces']['LibDualSpec-1.0']['char'] = ElvDB['namespaces']['LibDualSpec-1.0']['char'] or {}
		ElvDB['namespaces']['LibDualSpec-1.0']['char'][E.mynameRealm] = ElvDB['namespaces']['LibDualSpec-1.0']['char'][E.mynameRealm] or {}
		ElvDB['namespaces']['LibDualSpec-1.0']['char'][E.mynameRealm]['enabled'] = false
	end

	-- Create a fresh profile in ElvUI
	if layout == 'main' then
		E.data:SetProfile(E.global.L1UI.dev and 'Luckyone Main' or 'Luckyone Main ' .. Private.Version)
	elseif layout == 'healing' then
		E.data:SetProfile(E.global.L1UI.dev and 'Luckyone Healing' or 'Luckyone Healing ' .. Private.Version)
	elseif layout == 'support' then
		E.data:SetProfile(E.global.L1UI.dev and 'Luckyone Support' or 'Luckyone Support ' .. Private.Version)
	end

	-- E.global & Custom DataText
	L1UI:Setup_GlobalDB()

	-- E.private & Media
	L1UI:Setup_PrivateDB()

	-- E.db & Movers
	if layout == 'main' then
		L1UI:Layout_Dragonflight('main')
	elseif layout == 'healing' then
		L1UI:Layout_Dragonflight('healing')
	elseif layout == 'support' then
		L1UI:Layout_Dragonflight('support')
	end

	-- Push the update
	E:StaggeredUpdateAll()

	Private:Print(L["Layout has been set."])
end

-- Shadowlands layouts
function L1UI:Setup_Layout_Shadowlands(layout)
	-- Disable LibDualSpec to set the profile
	if E.Retail or E.Wrath then
		ElvDB['namespaces']['LibDualSpec-1.0'] = ElvDB['namespaces']['LibDualSpec-1.0'] or {}
		ElvDB['namespaces']['LibDualSpec-1.0']['char'] = ElvDB['namespaces']['LibDualSpec-1.0']['char'] or {}
		ElvDB['namespaces']['LibDualSpec-1.0']['char'][E.mynameRealm] = ElvDB['namespaces']['LibDualSpec-1.0']['char'][E.mynameRealm] or {}
		ElvDB['namespaces']['LibDualSpec-1.0']['char'][E.mynameRealm]['enabled'] = false
	end

	-- Create a fresh profile in ElvUI
	if layout == 'main' then
		E.data:SetProfile('Luckyone Shadowlands Main')
	elseif layout == 'healing' then
		E.data:SetProfile('Luckyone Shadowlands Healing')
	end

	-- E.global & Custom DataText
	SetCVar('uiScale', 0.71111111111111)
	E.global.general.UIScale = 0.71111111111111
	E.global.datatexts.settings.Combat.TimeFull = false
	E.global.datatexts.settings.System.latency = 'HOME'
	E.global.datatexts.settings.Time.time24 = true
	E.global.general.commandBarSetting = 'DISABLED'
	E.global.general.fadeMapWhenMoving = false
	E.global.general.mapAlphaWhenMoving = 0.35
	E.global.general.smallerWorldMapScale = 0.8
	E.global.general.WorldMapCoordinates.position = 'TOPLEFT'

	-- E.private & Media
	L1UI:Setup_PrivateDB()

	-- E.db & Movers
	if layout == 'main' then
		L1UI:Layout_Shadowlands('main')
	elseif layout == 'healing' then
		L1UI:Layout_Shadowlands('healing')
	end

	-- Push the update
	E:StaggeredUpdateAll()

	Private:Print(L["Layout has been set."])
end

-- Performance config section
function L1UI:Cleanup_Cache(addon, frame)
	if addon == 'elvui' and E.private.chat.enable then
		if frame == 'chat' then
			CH:ResetHistory()
			Private:Print(L["Cleared ElvUI Chat History."])
		elseif frame == 'editbox' then
			CH:ResetEditboxHistory()
			Private:Print(L["Cleared ElvUI Editbox History."])
		end
	elseif addon == 'details' and E:IsAddOnEnabled('Details') then
		_detalhes.boss_mods_timers = {}
		_detalhes.encounter_spell_pool = {}
		_detalhes.npcid_pool = {}
		_detalhes.spell_pool = {}
		_detalhes.spell_school_cache = {}
		Private:Print(L["Cleared Details Cache."])
	elseif addon == 'plater' and E:IsAddOnEnabled('Plater') then
		PlaterDB.captured_casts = {}
		PlaterDB.captured_spells = {}
		Private:Print(L["Cleared Plater Cache."])
	elseif addon == 'rc' and E:IsAddOnEnabled('RCLootCouncil') then
		RCLootCouncilDB.global.cache = {}
		RCLootCouncilDB.global.errors = {}
		RCLootCouncilDB.global.log = {}
		RCLootCouncilDB.global.verTestCandidates = {}
		Private:Print(L["Cleared RCLootCouncil Cache."])
	elseif addon == 'mrt' and E:IsAddOnEnabled('MRT') then
		VMRT.ExCD2.gnGUIDs = {}
		VMRT.Inspect.Soulbinds = {}
		Private:Print(L["Cleared Method Raid Tools Cache."])
	end
end

-- Easy delete
function L1UI:EasyDelete()
	if not E.private.L1UI.qualityOfLife.easyDelete then return end

	-- Higher quality than green
	hooksecurefunc(StaticPopupDialogs.DELETE_GOOD_ITEM, 'OnShow', function(frame)
		frame.editBox:SetText(DELETE_ITEM_CONFIRM_STRING)
	end)

	-- Quests and Quest starters
	hooksecurefunc(StaticPopupDialogs.DELETE_GOOD_QUEST_ITEM, 'OnShow', function(frame)
		frame.editBox:SetText(DELETE_ITEM_CONFIRM_STRING)
	end)
end

----------------------------------------------------------------------
------------------------------- Events -------------------------------
----------------------------------------------------------------------

function L1UI:PLAYER_ENTERING_WORLD(_, initLogin, isReload)
	if initLogin or not ElvDB.LuckyoneDisabledAddOns then
		ElvDB.LuckyoneDisabledAddOns = {}
	end

	if initLogin or isReload then
		L1UI:VersionCheck()
	end

	L1UI:DisabledFrames()
	L1UI:EasyDelete()
	L1UI:LoadCommands()
end

function L1UI:RegisterEvents()
	L1UI:RegisterEvent('PLAYER_ENTERING_WORLD')
end
