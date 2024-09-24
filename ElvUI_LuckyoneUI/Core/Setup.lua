-- Lua functions
local unpack = unpack

-- API cache
local SetCVar = C_CVar.SetCVar

-- Global environment
local _G = _G

-- AddOn namespace
local _, Private = ...

-- ElvUI modules
local E, L = unpack(ElvUI)
local DT = E:GetModule('DataTexts')

-- Disable LibDualSpec to set the profile
local function HandleLibDualSpec()
	ElvDB['namespaces']['LibDualSpec-1.0'] = ElvDB['namespaces']['LibDualSpec-1.0'] or {}
	ElvDB['namespaces']['LibDualSpec-1.0']['char'] = ElvDB['namespaces']['LibDualSpec-1.0']['char'] or {}
	ElvDB['namespaces']['LibDualSpec-1.0']['char'][E.mynameRealm] = {}
	ElvDB['namespaces']['LibDualSpec-1.0']['char'][E.mynameRealm]['enabled'] = false
end

-- Full frontend refresh
local function Refresh()
	E:StaggeredUpdateAll()
	E:UIMult()
	E:UIScale()
	E:Config_UpdateSize(true)
end

-- Handler for existing profiles (Quick install on alts)
function Private:HandleAlts(layout)
	-- 1080p
	local scaled = E.global.L1UI.scaled

	local mostRecentProfile = Private:GetMostRecentProfile(layout)

	if not mostRecentProfile then
		Private:Print(L["No existing LuckyoneUI profile found."])
		return
	end

	if not E.Classic then
		HandleLibDualSpec()
	end

	-- Load the most recent profile
	E.data:SetProfile(mostRecentProfile)

	-- Fix our custom DataTexts
	if layout == 'Main' or layout == 'Healing' then
		E.global.datatexts.customPanels.Luckyone_ActionBars_DT.width = (scaled and 299) or 347
	elseif layout == 'Support' then
		E.global.datatexts.customPanels.Luckyone_ActionBars_DT.width = (scaled and 404) or 464
	end

	-- PrivateDB for ElvUI, Shadow&Light, WindTools
	Private:Setup_PrivateDB()

	-- Chat setup
	Private:Setup_Chat()

	-- Push the update
	Refresh()

	E:StaticPopup_Show('L1UI_RL')

	Private:Print(L["Applied profile: "] .. mostRecentProfile)
end

-- E.global & Custom DataText
function Private:Setup_GlobalDB()
	-- 1080p
	local scaled = E.global.L1UI.scaled

	SetCVar('uiScale', (scaled and 0.71111111111111) or 0.53333333333333)
	SetCVar('useUiScale', 1)
	E.global.general.UIScale = (scaled and 0.71111111111111) or 0.53333333333333

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

	local ActionBarsDT = E.global.datatexts.customPanels.Luckyone_ActionBars_DT
	ActionBarsDT.enable = true
	ActionBarsDT.fonts.enable = true
	ActionBarsDT.fonts.font = Private.Font
	ActionBarsDT.fonts.fontSize = 10
	ActionBarsDT.frameStrata = 'BACKGROUND'
	ActionBarsDT.height = 12
	ActionBarsDT.name = 'Luckyone_ActionBars_DT'
	ActionBarsDT.panelTransparency = true
	ActionBarsDT.tooltipAnchor = 'ANCHOR_TOP'
	ActionBarsDT.tooltipXOffset = 0
	ActionBarsDT.tooltipYOffset = 5
	ActionBarsDT.visibility = E.Retail and '[petbattle] hide;show' or 'show'
	ActionBarsDT.width = (scaled and 299) or 347

	DT:BuildPanelFrame('Luckyone_MiniMap_DT')

	local MiniMapDT = E.global.datatexts.customPanels.Luckyone_MiniMap_DT
	MiniMapDT.backdrop = false
	MiniMapDT.border = false
	MiniMapDT.fonts.enable = true
	MiniMapDT.fonts.font = Private.Font
	MiniMapDT.fonts.fontSize = 16
	MiniMapDT.frameStrata = 'HIGH'
	MiniMapDT.height = 18
	MiniMapDT.name = 'Luckyone_MiniMap_DT'
	MiniMapDT.numPoints = 1
	MiniMapDT.panelTransparency = true
	MiniMapDT.tooltipAnchor = 'ANCHOR_BOTTOMLEFT'
	MiniMapDT.tooltipXOffset = -41
	MiniMapDT.tooltipYOffset = -29
	MiniMapDT.visibility = E.Retail and '[petbattle] hide;show' or 'show'
	MiniMapDT.width = 56
end

-- E.private & Media
function Private:Setup_PrivateDB()
	-- 1080p
	local scaled = E.global.L1UI.scaled

	E.db.general.font = Private.Font
	E.db.general.fonts.cooldown.outline = Private.Outline
	E.db.general.fonts.errortext.outline = Private.Outline
	E.db.general.fonts.errortext.size = 16
	E.db.general.fonts.mailbody.outline = Private.Outline
	E.db.general.fonts.objective.enable = true
	E.db.general.fonts.objective.outline = Private.Outline
	E.db.general.fonts.objective.size = 12
	E.db.general.fonts.questsmall.enable = true
	E.db.general.fonts.questsmall.outline = Private.Outline
	E.db.general.fonts.questsmall.size = 12
	E.db.general.fonts.questtext.enable = true
	E.db.general.fonts.questtext.outline = Private.Outline
	E.db.general.fonts.questtext.size = 12
	E.db.general.fonts.questtitle.enable = true
	E.db.general.fonts.questtitle.outline = Private.Outline
	E.db.general.fonts.questtitle.size = 14
	E.db.general.fonts.talkingtext.outline = Private.Outline
	E.db.general.fonts.talkingtitle.outline = Private.Outline
	E.db.general.fontSize = 11

	E.private.bags.bagBar = false
	E.private.general.chatBubbleFont = Private.Font
	E.private.general.chatBubbleFontOutline = Private.Outline
	E.private.general.glossTex = Private.Texture
	E.private.general.minimap.hideTracking = not E.Classic
	E.private.general.nameplateFont = Private.Font
	E.private.general.nameplateFontSize = 9
	E.private.general.nameplateLargeFont = Private.Font
	E.private.general.nameplateLargeFontSize = 11
	E.private.general.normTex = Private.Texture
	E.private.general.totemTracker = false

	E.private.install_complete = E.version

	E.private.nameplates.enable = false
	E.private.skins.parchmentRemoverEnable = true

	if E.Retail and E:IsAddOnEnabled('ElvUI_SLE') then
		Private:Setup_Private_ShadowAndLight()
	end

	if E.Retail and E:IsAddOnEnabled('ElvUI_WindTools') then
		Private:Setup_Private_WindTools()
	end

	if E.global.L1UI.dev then
		E.private.bags.enable = false
		E.private.general.chatBubbles = 'disabled'
		E.private.L1UI.disabledFrames.AlertFrame = true
		E.private.L1UI.disabledFrames.BossBanner = true
		E.private.L1UI.qualityOfLife.easyDelete = true
		E.private.L1UI.qualityOfLife.privacyOverlay = true
	end
end

-- Setup The War Within layout
function Private:Setup_Layout_TheWarWithin(layout, installer)
	if not E.Classic then
		HandleLibDualSpec()
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
	Private:Setup_GlobalDB()

	-- E.private & Media
	Private:Setup_PrivateDB()

	-- E.db & Movers
	if layout == 'main' then
		Private:Layout_TheWarWithin('main')
	elseif layout == 'healing' then
		Private:Layout_TheWarWithin('healing')
	elseif layout == 'support' then
		Private:Layout_TheWarWithin('support')
	end

	-- Push the update
	Refresh()

	if installer then
		_G.LuckyoneInstallStepComplete.message = L["Layout has been set."]
		_G.LuckyoneInstallStepComplete:Show()
	end

	Private:Print(L["Layout has been set."])
end

-- Setup Dragonflight layout
function Private:Setup_Layout_Dragonflight(layout)
	if not E.Classic then
		HandleLibDualSpec()
	end

	-- Create a fresh profile in ElvUI
	if layout == 'main' then
		E.data:SetProfile('Luckyone Dragonflight Main')
	elseif layout == 'healing' then
		E.data:SetProfile('Luckyone Dragonflight Healing')
	elseif layout == 'support' then
		E.data:SetProfile('Luckyone Dragonflight Support')
	end

	-- E.global & Custom DataText
	SetCVar('uiScale', 0.71111111111111)
	SetCVar('useUiScale', 1)
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

	-- E.private & Media
	Private:Setup_PrivateDB()

	-- E.db & Movers
	if layout == 'main' then
		Private:Layout_Dragonflight('main')
	elseif layout == 'healing' then
		Private:Layout_Dragonflight('healing')
	elseif layout == 'support' then
		Private:Layout_Dragonflight('support')
	end

	-- Push the update
	Refresh()

	Private:Print(L["Layout has been set."])
end

-- Setup Shadowlands layout
function Private:Setup_Layout_Shadowlands(layout)
	if not E.Classic then
		HandleLibDualSpec()
	end

	-- Create a fresh profile in ElvUI
	if layout == 'main' then
		E.data:SetProfile('Luckyone Shadowlands Main')
	elseif layout == 'healing' then
		E.data:SetProfile('Luckyone Shadowlands Healing')
	end

	-- E.global & Custom DataText
	SetCVar('uiScale', 0.71111111111111)
	SetCVar('useUiScale', 1)
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
	Private:Setup_PrivateDB()

	-- E.db & Movers
	if layout == 'main' then
		Private:Layout_Shadowlands('main')
	elseif layout == 'healing' then
		Private:Layout_Shadowlands('healing')
	end

	-- Push the update
	Refresh()

	Private:Print(L["Layout has been set."])
end
