-- AddOn namespace
local _, Private = ...
local L = Private.Libs.ACL

-- ElvUI file
if not Private.ElvUI then
	return
end

-- Lua functions
local ipairs = ipairs
local pairs = pairs
local unpack = unpack

-- API cache
local SetCVar = C_CVar.SetCVar

-- Global environment
local _G = _G
local StaticPopup_Show = _G.StaticPopup_Show

-- ElvUI modules
local E, _, _, P = unpack(ElvUI)
local DT = E:GetModule('DataTexts')
local NP = E:GetModule('NamePlates')

-- Disable LibDualSpec to set the profile
local function HandleLibDualSpec()
	ElvDB['namespaces']['LibDualSpec-1.0'] = ElvDB['namespaces']['LibDualSpec-1.0'] or {}
	ElvDB['namespaces']['LibDualSpec-1.0']['char'] = ElvDB['namespaces']['LibDualSpec-1.0']['char'] or {}
	ElvDB['namespaces']['LibDualSpec-1.0']['char'][Private.myNameRealm] = {}
	ElvDB['namespaces']['LibDualSpec-1.0']['char'][Private.myNameRealm]['enabled'] = false
end

-- Full frontend refresh
local function Refresh()
	E:StaggeredUpdateAll()
	E:UIMult()
	E:UIScale()
	E:Config_UpdateSize(true)
end

-- Wipe any existing Luckyone filters
local function Cleanup()
	for filterName, _ in pairs(E.global.nameplates.filters) do
		if filterName:match('^Luckyone_') then
			E.global.nameplates.filters[filterName] = nil
		end
	end
end

-- E.global & Custom DataText
function Private:Setup_GlobalDB()
	-- 1080p
	local scaled = Private.Addon.db.global.scaled

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
	ActionBarsDT.visibility = (Private.isRetail or Private.isMists) and '[petbattle] hide;show' or 'show'
	ActionBarsDT.width = (scaled and 299) or 347

	DT:BuildPanelFrame('Luckyone_MiniMap_DT')

	local MiniMapDT = E.global.datatexts.customPanels.Luckyone_MiniMap_DT
	MiniMapDT.backdrop = false
	MiniMapDT.border = false
	MiniMapDT.fonts.enable = true
	MiniMapDT.fonts.font = Private.Font
	MiniMapDT.fonts.fontSize = 14
	MiniMapDT.frameStrata = 'HIGH'
	MiniMapDT.height = 18
	MiniMapDT.name = 'Luckyone_MiniMap_DT'
	MiniMapDT.numPoints = 1
	MiniMapDT.panelTransparency = true
	MiniMapDT.tooltipAnchor = 'ANCHOR_BOTTOMLEFT'
	MiniMapDT.tooltipXOffset = -41
	MiniMapDT.tooltipYOffset = -29
	MiniMapDT.visibility = (Private.isRetail or Private.isMists) and '[petbattle] hide;show' or 'show'
	MiniMapDT.width = 56
end

-- E.private & Media
function Private:Setup_PrivateDB(includePlugins)
	-- 1080p
	local scaled = Private.Addon.db.global.scaled

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
	E.private.general.minimap.hideTracking = not Private.isClassic
	E.private.general.nameplateFont = Private.Font
	E.private.general.nameplateFontSize = 9
	E.private.general.nameplateLargeFont = Private.Font
	E.private.general.nameplateLargeFontSize = 11
	E.private.general.normTex = Private.Texture
	E.private.general.totemTracker = false

	E.private.install_complete = E.version

	E.private.skins.parchmentRemoverEnable = true

	if includePlugins and Private.isRetail then
		if Private.IsAddOnLoaded('ElvUI_SLE') then
			Private:Setup_Private_ShadowAndLight()
		end
		if Private.IsAddOnLoaded('ElvUI_WindTools') then
			Private:Setup_Private_WindTools()
		end
	end

	if Private.isClassic then
		-- This will make sure Shaman is blue instead of pink
		E.private.general.classColors = true
	end

	if Private.Addon.db.global.dev then
		-- Private keys for the dev profile
		E.private.general.chatBubbles = 'disabled'
		Private.Addon.db.profile.disabledFrames.AlertFrame = true
		Private.Addon.db.profile.disabledFrames.BossBanner = true
		Private.Addon.db.profile.qualityOfLife.easyDelete = true
		Private.Addon.db.profile.qualityOfLife.privacyOverlay = true

		-- Enable these modules only if the alternative is not loaded
		E.private.bags.enable = (not Private.IsAddOnLoaded('Baganator'))
		E.private.nameplates.enable = (not Private.IsAddOnLoaded('Plater'))
	end
end

-- Handler for existing profiles (Quick install on alts)
function Private:HandleAlts(layout)
	-- 1080p
	local scaled = Private.Addon.db.global.scaled

	local mostRecentProfile = Private:GetMostRecentProfile(layout)

	if not mostRecentProfile then
		Private:Print(L["No existing LuckyoneUI profile found."])
		return
	end

	if not Private.isClassic then
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
	Private:Setup_PrivateDB(true)

	-- Chat setup
	Private:Setup_Chat()

	-- Push the update
	Refresh()

	StaticPopup_Show('LUCKYONE_RL')

	Private:Print(L["Applied profile: "] .. mostRecentProfile)
end

-- Setup The War Within layout
function Private:Setup_Layout(layout, installer)
	if not Private.isClassic then
		HandleLibDualSpec()
	end

	-- Create a fresh profile in ElvUI
	if layout == 'main' then
		E.data:SetProfile(Private.Addon.db.global.dev and 'Luckyone Main' or 'Luckyone Main ' .. Private.Version)
	elseif layout == 'healing' then
		E.data:SetProfile(Private.Addon.db.global.dev and 'Luckyone Healing' or 'Luckyone Healing ' .. Private.Version)
	elseif layout == 'support' then
		E.data:SetProfile(Private.Addon.db.global.dev and 'Luckyone Support' or 'Luckyone Support ' .. Private.Version)
	end

	-- E.global & Custom DataText
	Private:Setup_GlobalDB()

	-- E.private & Media
	Private:Setup_PrivateDB()

	-- E.db & Movers
	if layout == 'main' then
		Private:Setup_ElvUI('main')
	elseif layout == 'healing' then
		Private:Setup_ElvUI('healing')
	elseif layout == 'support' then
		Private:Setup_ElvUI('support')
	end

	-- Push the update
	Refresh()

	if installer then
		_G.LuckyoneInstallStepComplete:ShowMessage(L["Layout has been set."])
	end

	Private:Print(L["Layout has been set."])
end

-- Custom StyleFilters
function Private:Setup_StyleFilters(skipVars)
	if not E.private.nameplates.enable then return end

	-- Wipe old filters
	Cleanup()

	-- Base filters
	local baseFilters = {
		'Luckyone_Quest_H',
		'Luckyone_Quest_N',
	}

	-- NonClassic specific filters
	local nonClassicFilters = {
		'Luckyone_Focus',
	}

	-- Retail specific filters
	local retailFilters = {
		-- Global
		'Luckyone_SPECIAL',
		-- Raid
		'Luckyone_MF',
		-- Dungeons
		'Luckyone_ARAK',
		'Luckyone_EDA',
		'Luckyone_HOA',
		'Luckyone_PSF',
		'Luckyone_FLOOD',
		'Luckyone_GMBT',
		'Luckyone_STRT',
		'Luckyone_DAWN',
	}

	-- Create base filters
	for _, filterName in ipairs(baseFilters) do
		E.global.nameplates.filters[filterName] = {}
		E.NamePlates:StyleFilterCopyDefaults(E.global.nameplates.filters[filterName])
		E.db.nameplates.filters[filterName] = { triggers = { enable = true } }
	end

	-- Disable alpha fading and scaling for ElvUI_Target and ElvUI_NonTarget
	E.global.nameplates.filters.ElvUI_NonTarget.actions.alpha = -1
	E.global.nameplates.filters.ElvUI_Target.actions.scale = 1

	-- Turn off both default filters
	E.db.nameplates.filters.ElvUI_NonTarget.triggers.enable = false
	E.db.nameplates.filters.ElvUI_Target.triggers.enable = false

	-- Quest Hostile
	E.global.nameplates.filters.Luckyone_Quest_H.actions.health.colors.color.b = 0
	E.global.nameplates.filters.Luckyone_Quest_H.actions.health.colors.color.g = 0.37
	E.global.nameplates.filters.Luckyone_Quest_H.actions.health.colors.enable = true
	E.global.nameplates.filters.Luckyone_Quest_H.triggers.isNotTapDenied = true
	E.global.nameplates.filters.Luckyone_Quest_H.triggers.isQuest = true
	E.global.nameplates.filters.Luckyone_Quest_H.triggers.outOfCombatUnit = true
	E.global.nameplates.filters.Luckyone_Quest_H.triggers.priority = 2
	E.global.nameplates.filters.Luckyone_Quest_H.triggers.reactionType.enable = true
	E.global.nameplates.filters.Luckyone_Quest_H.triggers.reactionType.hostile = true

	-- Quest Neutral
	E.global.nameplates.filters.Luckyone_Quest_N.actions.health.colors.color.b = 0
	E.global.nameplates.filters.Luckyone_Quest_N.actions.health.colors.color.g = 0.65
	E.global.nameplates.filters.Luckyone_Quest_N.actions.health.colors.enable = true
	E.global.nameplates.filters.Luckyone_Quest_N.triggers.isNotTapDenied = true
	E.global.nameplates.filters.Luckyone_Quest_N.triggers.isQuest = true
	E.global.nameplates.filters.Luckyone_Quest_N.triggers.outOfCombatUnit = true
	E.global.nameplates.filters.Luckyone_Quest_N.triggers.priority = 2
	E.global.nameplates.filters.Luckyone_Quest_N.triggers.reactionType.enable = true
	E.global.nameplates.filters.Luckyone_Quest_N.triggers.reactionType.neutral = true

	if not Private.isClassic then

		-- Create NonClassic specific filters
		for _, filterName in ipairs(nonClassicFilters) do
			E.global.nameplates.filters[filterName] = {}
			E.NamePlates:StyleFilterCopyDefaults(E.global.nameplates.filters[filterName])
			E.db.nameplates.filters[filterName] = { triggers = { enable = true } }
		end

		-- Focus target [FOCUS]
		E.global.nameplates.filters.Luckyone_Focus.actions.health.texture.enable = true
		E.global.nameplates.filters.Luckyone_Focus.actions.health.texture.texture = 'Luckyone Focus'
		E.global.nameplates.filters.Luckyone_Focus.triggers.isFocus = true
		E.global.nameplates.filters.Luckyone_Focus.triggers.priority = 2
	end

	if Private.isRetail then

		-- Create retail specific filters
		for _, filterName in ipairs(retailFilters) do
			E.global.nameplates.filters[filterName] = {}
			E.NamePlates:StyleFilterCopyDefaults(E.global.nameplates.filters[filterName])
			E.db.nameplates.filters[filterName] = { triggers = { enable = true } }
		end

		-- Special coloring [SPECIAL]
		E.global.nameplates.filters.Luckyone_SPECIAL.actions.health.colors.enable = true
		E.global.nameplates.filters.Luckyone_SPECIAL.actions.health.colors.color.r = 1
		E.global.nameplates.filters.Luckyone_SPECIAL.actions.health.colors.color.g = 0.25
		E.global.nameplates.filters.Luckyone_SPECIAL.actions.health.colors.color.b = 0.99
		E.global.nameplates.filters.Luckyone_SPECIAL.triggers.instanceDifficulty.dungeon['mythic'] = true
		E.global.nameplates.filters.Luckyone_SPECIAL.triggers.instanceDifficulty.dungeon['mythic+'] = true
		E.global.nameplates.filters.Luckyone_SPECIAL.triggers.instanceType['party'] = true
		E.global.nameplates.filters.Luckyone_SPECIAL.triggers.names['231176'] = true -- Scaffolding [FLOOD]
		E.global.nameplates.filters.Luckyone_SPECIAL.triggers.names['179733'] = true -- Invigorating Fish Stick [GMBT]
		E.global.nameplates.filters.Luckyone_SPECIAL.triggers.names['180433'] = true -- Wandering Pulsar [GMBT]
		E.global.nameplates.filters.Luckyone_SPECIAL.triggers.names['175576'] = true -- Containment Cell [STRT]
		E.global.nameplates.filters.Luckyone_SPECIAL.triggers.names['177237'] = true -- Chains of Damnation [STRT]
		E.global.nameplates.filters.Luckyone_SPECIAL.triggers.names['244302'] = true -- Binding Javelin [EDA]
		E.global.nameplates.filters.Luckyone_SPECIAL.triggers.names['240952'] = true -- Evoked Spirit [EDA]
		E.global.nameplates.filters.Luckyone_SPECIAL.triggers.priority = 2

		-- Manaforge Omega [MF]
		E.global.nameplates.filters.Luckyone_MF.actions.health.colors.enable = true
		E.global.nameplates.filters.Luckyone_MF.actions.health.colors.color.r = 1
		E.global.nameplates.filters.Luckyone_MF.actions.health.colors.color.g = 0.25
		E.global.nameplates.filters.Luckyone_MF.actions.health.colors.color.b = 0.99
		E.global.nameplates.filters.Luckyone_MF.triggers.instanceType['raid'] = true
		E.global.nameplates.filters.Luckyone_MF.triggers.names['241800'] = true -- Manaforged Titan [Nexus-King Salhadaar]
		E.global.nameplates.filters.Luckyone_MF.triggers.names['242587'] = true -- Living Mass [Dimensius]
		E.global.nameplates.filters.Luckyone_MF.triggers.priority = 2

		-- Ara-Kara, City of Echoes [ARAK]
		E.global.nameplates.filters.Luckyone_ARAK.actions.health.colors.enable = true
		E.global.nameplates.filters.Luckyone_ARAK.actions.health.colors.color.g = 0.75
		E.global.nameplates.filters.Luckyone_ARAK.actions.health.colors.color.r = 0
		E.global.nameplates.filters.Luckyone_ARAK.triggers.instanceDifficulty.dungeon['mythic'] = true
		E.global.nameplates.filters.Luckyone_ARAK.triggers.instanceDifficulty.dungeon['mythic+'] = true
		E.global.nameplates.filters.Luckyone_ARAK.triggers.instanceType['party'] = true
		E.global.nameplates.filters.Luckyone_ARAK.triggers.names['216293'] = true -- Trilling Attendant
		E.global.nameplates.filters.Luckyone_ARAK.triggers.names['218961'] = true -- Starved Crawler
		E.global.nameplates.filters.Luckyone_ARAK.triggers.names['223253'] = true -- Bloodstained Webmage
		E.global.nameplates.filters.Luckyone_ARAK.triggers.names['216340'] = true -- Sentry Stagshell
		E.global.nameplates.filters.Luckyone_ARAK.triggers.names['216364'] = true -- Blood Overseer
		E.global.nameplates.filters.Luckyone_ARAK.triggers.priority = 2

		-- Eco-Dome Al'dani [EDA]
		E.global.nameplates.filters.Luckyone_EDA.actions.health.colors.enable = true
		E.global.nameplates.filters.Luckyone_EDA.actions.health.colors.color.g = 0.75
		E.global.nameplates.filters.Luckyone_EDA.actions.health.colors.color.r = 0
		E.global.nameplates.filters.Luckyone_EDA.triggers.instanceDifficulty.dungeon['mythic'] = true
		E.global.nameplates.filters.Luckyone_EDA.triggers.instanceDifficulty.dungeon['mythic+'] = true
		E.global.nameplates.filters.Luckyone_EDA.triggers.instanceType['party'] = true
		E.global.nameplates.filters.Luckyone_EDA.triggers.names['234957'] = true -- Wastelander Ritualist
		E.global.nameplates.filters.Luckyone_EDA.triggers.names['234955'] = true -- Wastelander Pactspeaker
		E.global.nameplates.filters.Luckyone_EDA.triggers.priority = 2

		-- Halls of Atonement [HOA]
		E.global.nameplates.filters.Luckyone_HOA.actions.health.colors.enable = true
		E.global.nameplates.filters.Luckyone_HOA.actions.health.colors.color.g = 0.75
		E.global.nameplates.filters.Luckyone_HOA.actions.health.colors.color.r = 0
		E.global.nameplates.filters.Luckyone_HOA.triggers.instanceDifficulty.dungeon['mythic'] = true
		E.global.nameplates.filters.Luckyone_HOA.triggers.instanceDifficulty.dungeon['mythic+'] = true
		E.global.nameplates.filters.Luckyone_HOA.triggers.instanceType['party'] = true
		E.global.nameplates.filters.Luckyone_HOA.triggers.names['165414'] = true -- Depraved Obliterator
		E.global.nameplates.filters.Luckyone_HOA.triggers.names['164562'] = true -- Depraved Houndmaster
		E.global.nameplates.filters.Luckyone_HOA.triggers.priority = 2

		-- Priory of the Sacred Flame [PSF]
		E.global.nameplates.filters.Luckyone_PSF.actions.health.colors.enable = true
		E.global.nameplates.filters.Luckyone_PSF.actions.health.colors.color.g = 0.75
		E.global.nameplates.filters.Luckyone_PSF.actions.health.colors.color.r = 0
		E.global.nameplates.filters.Luckyone_PSF.triggers.instanceDifficulty.dungeon['mythic'] = true
		E.global.nameplates.filters.Luckyone_PSF.triggers.instanceDifficulty.dungeon['mythic+'] = true
		E.global.nameplates.filters.Luckyone_PSF.triggers.instanceType['party'] = true
		E.global.nameplates.filters.Luckyone_PSF.triggers.names['206697'] = true -- Devout Priest
		E.global.nameplates.filters.Luckyone_PSF.triggers.names['206698'] = true -- Fanatical Conjuror
		E.global.nameplates.filters.Luckyone_PSF.triggers.names['221760'] = true -- Risen Mage
		E.global.nameplates.filters.Luckyone_PSF.triggers.priority = 2

		-- Operation: Floodgate [FLOOD]
		E.global.nameplates.filters.Luckyone_FLOOD.actions.health.colors.enable = true
		E.global.nameplates.filters.Luckyone_FLOOD.actions.health.colors.color.g = 0.75
		E.global.nameplates.filters.Luckyone_FLOOD.actions.health.colors.color.r = 0
		E.global.nameplates.filters.Luckyone_FLOOD.triggers.instanceDifficulty.dungeon['mythic'] = true
		E.global.nameplates.filters.Luckyone_FLOOD.triggers.instanceDifficulty.dungeon['mythic+'] = true
		E.global.nameplates.filters.Luckyone_FLOOD.triggers.instanceType['party'] = true
		E.global.nameplates.filters.Luckyone_FLOOD.triggers.names['229686'] = true -- Venture Co. Surveyor
		E.global.nameplates.filters.Luckyone_FLOOD.triggers.names['229251'] = true -- Venture Co. Architect
		E.global.nameplates.filters.Luckyone_FLOOD.triggers.names['229212'] = true -- Darkfuse Demolitionist
		E.global.nameplates.filters.Luckyone_FLOOD.triggers.names['231312'] = true -- Venture Co. Electrician
		E.global.nameplates.filters.Luckyone_FLOOD.triggers.priority = 2

		-- Tazavesh: So'leah's Gambit [GMBT]
		E.global.nameplates.filters.Luckyone_GMBT.actions.health.colors.enable = true
		E.global.nameplates.filters.Luckyone_GMBT.actions.health.colors.color.g = 0.75
		E.global.nameplates.filters.Luckyone_GMBT.actions.health.colors.color.r = 0
		E.global.nameplates.filters.Luckyone_GMBT.triggers.instanceDifficulty.dungeon['mythic'] = true
		E.global.nameplates.filters.Luckyone_GMBT.triggers.instanceDifficulty.dungeon['mythic+'] = true
		E.global.nameplates.filters.Luckyone_GMBT.triggers.instanceType['party'] = true
		E.global.nameplates.filters.Luckyone_GMBT.triggers.names['178142'] = true -- Murkbrine Fishmancer
		E.global.nameplates.filters.Luckyone_GMBT.triggers.names['176551'] = true -- Vault Purifier
		E.global.nameplates.filters.Luckyone_GMBT.triggers.names['179388'] = true -- Hourglass Tidesage
		E.global.nameplates.filters.Luckyone_GMBT.triggers.names['180431'] = true -- Focused Ritualist
		E.global.nameplates.filters.Luckyone_GMBT.triggers.priority = 2

		-- Tazavesh: Streets of Wonder [STRT]
		E.global.nameplates.filters.Luckyone_STRT.actions.health.colors.enable = true
		E.global.nameplates.filters.Luckyone_STRT.actions.health.colors.color.g = 0.75
		E.global.nameplates.filters.Luckyone_STRT.actions.health.colors.color.r = 0
		E.global.nameplates.filters.Luckyone_STRT.triggers.instanceDifficulty.dungeon['mythic'] = true
		E.global.nameplates.filters.Luckyone_STRT.triggers.instanceDifficulty.dungeon['mythic+'] = true
		E.global.nameplates.filters.Luckyone_STRT.triggers.instanceType['party'] = true
		E.global.nameplates.filters.Luckyone_STRT.triggers.names['177817'] = true -- Support Officer
		E.global.nameplates.filters.Luckyone_STRT.triggers.names['180336'] = true -- Cartel Wiseguy
		E.global.nameplates.filters.Luckyone_STRT.triggers.names['176395'] = true -- Overloaded Mailemental
		E.global.nameplates.filters.Luckyone_STRT.triggers.names['179841'] = true -- Veteran Sparkcaster
		E.global.nameplates.filters.Luckyone_STRT.triggers.priority = 2

		-- The Dawnbreaker [DAWN]
		E.global.nameplates.filters.Luckyone_DAWN.actions.health.colors.enable = true
		E.global.nameplates.filters.Luckyone_DAWN.actions.health.colors.color.g = 0.75
		E.global.nameplates.filters.Luckyone_DAWN.actions.health.colors.color.r = 0
		E.global.nameplates.filters.Luckyone_DAWN.triggers.instanceDifficulty.dungeon['mythic'] = true
		E.global.nameplates.filters.Luckyone_DAWN.triggers.instanceDifficulty.dungeon['mythic+'] = true
		E.global.nameplates.filters.Luckyone_DAWN.triggers.instanceType['party'] = true
		E.global.nameplates.filters.Luckyone_DAWN.triggers.names['213892'] = true -- Nightfall Shadowmage
		E.global.nameplates.filters.Luckyone_DAWN.triggers.names['214761'] = true -- Nightfall Ritualist
		E.global.nameplates.filters.Luckyone_DAWN.triggers.names['213893'] = true -- Nightfall Darkcaster
		E.global.nameplates.filters.Luckyone_DAWN.triggers.priority = 2
	end

	-- Set NamePlate CVars
	if not skipVars then
		Private:NameplateCVars(true)
	end

	Private:Print(L["NamePlate StyleFilters and CVars have been set."])
end

-- NamePlate Setup for ElvUI
function Private:Setup_NamePlates(installer)
	-- Make sure to enable the module
	E.private.nameplates.enable = true

	-- Restore defaults
	E.db.nameplates = E:CopyTable({}, P.nameplates)

	-- Setup StyleFilters (includes NamePlate CVars)
	Private:Setup_StyleFilters()

	-- NamePlates colors
	E.db.nameplates.colors.auraByType = false
	E.db.nameplates.colors.castbarDesaturate = false
	E.db.nameplates.colors.castColor.g = 1
	E.db.nameplates.colors.castColor.r = 0.02
	E.db.nameplates.colors.castNoInterruptColor.b = 0
	E.db.nameplates.colors.castNoInterruptColor.g = 0
	E.db.nameplates.colors.castNoInterruptColor.r = 1
	E.db.nameplates.colors.glowColor.b = 0.97
	E.db.nameplates.colors.glowColor.r = 0
	E.db.nameplates.colors.selection[0].b = 0.07
	E.db.nameplates.colors.selection[0].g = 0.13
	E.db.nameplates.colors.selection[0].r = 0.92
	E.db.nameplates.colors.selection[2].b = 0.27
	E.db.nameplates.colors.selection[2].g = 0.8
	E.db.nameplates.colors.selection[2].r = 0.93
	E.db.nameplates.colors.selection[3].b = 0.02
	E.db.nameplates.colors.selection[3].g = 0.82
	E.db.nameplates.colors.selection[3].r = 0.02
	E.db.nameplates.colors.threat.badColor.b = 0
	E.db.nameplates.colors.threat.badColor.g = 0
	E.db.nameplates.colors.threat.badTransition.b = 0
	E.db.nameplates.colors.threat.badTransition.g = 0.8
	E.db.nameplates.colors.threat.goodColor.b = 1
	E.db.nameplates.colors.threat.goodColor.g = 0.5
	E.db.nameplates.colors.threat.goodColor.r = 0.5
	E.db.nameplates.colors.threat.goodTransition.b = 0
	E.db.nameplates.colors.threat.goodTransition.g = 1
	E.db.nameplates.colors.threat.offTankColor.g = 0.92
	E.db.nameplates.colors.threat.offTankColor.r = 0.73
	E.db.nameplates.colors.threat.offTankColorBadTransition.b = 1
	E.db.nameplates.colors.threat.offTankColorBadTransition.g = 0.92
	E.db.nameplates.colors.threat.offTankColorBadTransition.r = 0.73
	E.db.nameplates.colors.threat.offTankColorGoodTransition.b = 1
	E.db.nameplates.colors.threat.offTankColorGoodTransition.g = 0.92
	E.db.nameplates.colors.threat.offTankColorGoodTransition.r = 0.73
	E.db.nameplates.colors.threat.soloColor.b = 1
	E.db.nameplates.colors.threat.soloColor.g = 0.5
	E.db.nameplates.colors.threat.soloColor.r = 0.5

	-- NamePlates general
	E.db.nameplates.cooldown.override = false
	E.db.nameplates.fadeIn = false
	E.db.nameplates.lowHealthThreshold = 0
	E.db.nameplates.overlapH = 1
	E.db.nameplates.overlapV = 2.2
	E.db.nameplates.plateSize.enemyWidth = 210
	E.db.nameplates.plateSize.friendlyHeight = 8
	E.db.nameplates.plateSize.friendlyWidth = 210
	E.db.nameplates.plateSize.personalWidth = 210
	E.db.nameplates.statusbar = Private.Texture
	E.db.nameplates.threat.useSoloColor = true

	-- NamePlates misc
	E.db.nameplates.visibility.enemy.guardians = true
	E.db.nameplates.visibility.enemy.minions = true
	E.db.nameplates.widgets.below = false

	-- Target indicator
	E.db.nameplates.units.TARGET.arrowScale = 0.7
	E.db.nameplates.units.TARGET.arrowSpacing = 25
	E.db.nameplates.units.TARGET.glowStyle = 'style2'

	-- Enemy NPC
	E.db.nameplates.units.ENEMY_NPC.auras.countFont = Private.Font
	E.db.nameplates.units.ENEMY_NPC.auras.countFontSize = 12
	E.db.nameplates.units.ENEMY_NPC.auras.countXOffset = 1
	E.db.nameplates.units.ENEMY_NPC.auras.countYOffset = 1
	E.db.nameplates.units.ENEMY_NPC.auras.desaturate = false
	E.db.nameplates.units.ENEMY_NPC.auras.height = 24
	E.db.nameplates.units.ENEMY_NPC.auras.keepSizeRatio = false
	E.db.nameplates.units.ENEMY_NPC.auras.numAuras = 3
	E.db.nameplates.units.ENEMY_NPC.auras.priority = Private.isRetail and 'ImportantCC' or 'CCDebuffs'
	E.db.nameplates.units.ENEMY_NPC.auras.size = 30
	E.db.nameplates.units.ENEMY_NPC.auras.sortMethod = 'INDEX'
	E.db.nameplates.units.ENEMY_NPC.auras.sourceText.font = Private.Font
	E.db.nameplates.units.ENEMY_NPC.auras.sourceText.fontSize = 11
	E.db.nameplates.units.ENEMY_NPC.auras.sourceText.length = 5
	E.db.nameplates.units.ENEMY_NPC.auras.sourceText.xOffset = 2
	E.db.nameplates.units.ENEMY_NPC.auras.sourceText.yOffset = 13
	E.db.nameplates.units.ENEMY_NPC.auras.yOffset = -1
	E.db.nameplates.units.ENEMY_NPC.buffs.anchorPoint = 'TOPRIGHT'
	E.db.nameplates.units.ENEMY_NPC.buffs.countFont = Private.Font
	E.db.nameplates.units.ENEMY_NPC.buffs.countFontSize = 12
	E.db.nameplates.units.ENEMY_NPC.buffs.countPosition = 'TOP'
	E.db.nameplates.units.ENEMY_NPC.buffs.countXOffset = 1
	E.db.nameplates.units.ENEMY_NPC.buffs.countYOffset = 14
	E.db.nameplates.units.ENEMY_NPC.buffs.desaturate = false
	E.db.nameplates.units.ENEMY_NPC.buffs.font = Private.Font
	E.db.nameplates.units.ENEMY_NPC.buffs.fontSize = 10
	E.db.nameplates.units.ENEMY_NPC.buffs.growthX = 'LEFT'
	E.db.nameplates.units.ENEMY_NPC.buffs.maxDuration = 300
	E.db.nameplates.units.ENEMY_NPC.buffs.numAuras = 4
	E.db.nameplates.units.ENEMY_NPC.buffs.priority = 'Dispellable'
	E.db.nameplates.units.ENEMY_NPC.buffs.size = 22
	E.db.nameplates.units.ENEMY_NPC.buffs.xOffset = 1
	E.db.nameplates.units.ENEMY_NPC.buffs.yOffset = -3
	E.db.nameplates.units.ENEMY_NPC.castbar.anchorPoint = 'BOTTOMLEFT'
	E.db.nameplates.units.ENEMY_NPC.castbar.castTimeFormat = 'REMAINING'
	E.db.nameplates.units.ENEMY_NPC.castbar.channelTimeFormat = 'REMAINING'
	E.db.nameplates.units.ENEMY_NPC.castbar.displayTarget = true
	E.db.nameplates.units.ENEMY_NPC.castbar.font = Private.Font
	E.db.nameplates.units.ENEMY_NPC.castbar.fontSize = 10
	E.db.nameplates.units.ENEMY_NPC.castbar.height = 14
	E.db.nameplates.units.ENEMY_NPC.castbar.iconOffsetX = 2
	E.db.nameplates.units.ENEMY_NPC.castbar.iconOffsetY = -1
	E.db.nameplates.units.ENEMY_NPC.castbar.iconPosition = 'LEFT'
	E.db.nameplates.units.ENEMY_NPC.castbar.iconSize = 16
	E.db.nameplates.units.ENEMY_NPC.castbar.targetAnchorPoint = 'RIGHT'
	E.db.nameplates.units.ENEMY_NPC.castbar.targetFont = Private.Font
	E.db.nameplates.units.ENEMY_NPC.castbar.targetStyle = 'SEPARATE'
	E.db.nameplates.units.ENEMY_NPC.castbar.targetXOffset = 2
	E.db.nameplates.units.ENEMY_NPC.castbar.textPosition = 'ONBAR'
	E.db.nameplates.units.ENEMY_NPC.castbar.textXOffset = 4
	E.db.nameplates.units.ENEMY_NPC.castbar.timeToHold = 2
	E.db.nameplates.units.ENEMY_NPC.castbar.timeXOffset = -1
	E.db.nameplates.units.ENEMY_NPC.castbar.width = 197
	E.db.nameplates.units.ENEMY_NPC.castbar.xOffset = 13
	E.db.nameplates.units.ENEMY_NPC.castbar.yOffset = 3
	E.db.nameplates.units.ENEMY_NPC.debuffs.anchorPoint = 'LEFT'
	E.db.nameplates.units.ENEMY_NPC.debuffs.countFont = Private.Font
	E.db.nameplates.units.ENEMY_NPC.debuffs.countFontSize = 12
	E.db.nameplates.units.ENEMY_NPC.debuffs.countPosition = 'TOP'
	E.db.nameplates.units.ENEMY_NPC.debuffs.countXOffset = 1
	E.db.nameplates.units.ENEMY_NPC.debuffs.countYOffset = 14
	E.db.nameplates.units.ENEMY_NPC.debuffs.desaturate = false
	E.db.nameplates.units.ENEMY_NPC.debuffs.font = Private.Font
	E.db.nameplates.units.ENEMY_NPC.debuffs.fontSize = 10
	E.db.nameplates.units.ENEMY_NPC.debuffs.numAuras = 4
	E.db.nameplates.units.ENEMY_NPC.debuffs.priority = Private.isRetail and 'blockNonPersonal,ClassDebuffs' or 'blockCCDebuffs,Personal'
	E.db.nameplates.units.ENEMY_NPC.debuffs.size = 24
	E.db.nameplates.units.ENEMY_NPC.debuffs.xOffset = -2
	E.db.nameplates.units.ENEMY_NPC.debuffs.yOffset = -1
	E.db.nameplates.units.ENEMY_NPC.eliteIcon.size = 14
	E.db.nameplates.units.ENEMY_NPC.eliteIcon.xOffset = 3
	E.db.nameplates.units.ENEMY_NPC.health.height = 22
	E.db.nameplates.units.ENEMY_NPC.health.text.font = Private.Font
	E.db.nameplates.units.ENEMY_NPC.health.text.format = '[luckyone:health:percent]'
	E.db.nameplates.units.ENEMY_NPC.health.text.position = 'TOPRIGHT'
	E.db.nameplates.units.ENEMY_NPC.health.text.yOffset = -20
	E.db.nameplates.units.ENEMY_NPC.level.enable = false
	E.db.nameplates.units.ENEMY_NPC.name.font = Private.Font
	E.db.nameplates.units.ENEMY_NPC.name.format = '[luckyone:level< ||cffffffff- ][luckyone:name:last-nocolor]'
	E.db.nameplates.units.ENEMY_NPC.name.xOffset = 2
	E.db.nameplates.units.ENEMY_NPC.name.yOffset = -20
	E.db.nameplates.units.ENEMY_NPC.pvpindicator.size = 35
	E.db.nameplates.units.ENEMY_NPC.questIcon.enable = false
	E.db.nameplates.units.ENEMY_NPC.questIcon.font = Private.Font
	E.db.nameplates.units.ENEMY_NPC.questIcon.size = 25
	E.db.nameplates.units.ENEMY_NPC.questIcon.textPosition = 'CENTER'
	E.db.nameplates.units.ENEMY_NPC.raidTargetIndicator.position = 'CENTER'
	E.db.nameplates.units.ENEMY_NPC.raidTargetIndicator.size = 16
	E.db.nameplates.units.ENEMY_NPC.raidTargetIndicator.xOffset = 0
	E.db.nameplates.units.ENEMY_NPC.raidTargetIndicator.yOffset = 1

	-- Enemy Player
	E.db.nameplates.units.ENEMY_PLAYER.auras.countFont = Private.Font
	E.db.nameplates.units.ENEMY_PLAYER.auras.countFontSize = 12
	E.db.nameplates.units.ENEMY_PLAYER.auras.countXOffset = 1
	E.db.nameplates.units.ENEMY_PLAYER.auras.countYOffset = 1
	E.db.nameplates.units.ENEMY_PLAYER.auras.desaturate = false
	E.db.nameplates.units.ENEMY_PLAYER.auras.height = 24
	E.db.nameplates.units.ENEMY_PLAYER.auras.keepSizeRatio = false
	E.db.nameplates.units.ENEMY_PLAYER.auras.numAuras = 3
	E.db.nameplates.units.ENEMY_PLAYER.auras.priority = Private.isRetail and 'ImportantCC' or 'CCDebuffs'
	E.db.nameplates.units.ENEMY_PLAYER.auras.size = 30
	E.db.nameplates.units.ENEMY_PLAYER.auras.sortMethod = 'INDEX'
	E.db.nameplates.units.ENEMY_PLAYER.auras.sourceText.font = Private.Font
	E.db.nameplates.units.ENEMY_PLAYER.auras.sourceText.fontSize = 11
	E.db.nameplates.units.ENEMY_PLAYER.auras.sourceText.length = 5
	E.db.nameplates.units.ENEMY_PLAYER.auras.sourceText.xOffset = 2
	E.db.nameplates.units.ENEMY_PLAYER.auras.sourceText.yOffset = 13
	E.db.nameplates.units.ENEMY_PLAYER.auras.yOffset = -1
	E.db.nameplates.units.ENEMY_PLAYER.buffs.anchorPoint = 'TOPRIGHT'
	E.db.nameplates.units.ENEMY_PLAYER.buffs.countFont = Private.Font
	E.db.nameplates.units.ENEMY_PLAYER.buffs.countFontSize = 12
	E.db.nameplates.units.ENEMY_PLAYER.buffs.countPosition = 'TOP'
	E.db.nameplates.units.ENEMY_PLAYER.buffs.countXOffset = 1
	E.db.nameplates.units.ENEMY_PLAYER.buffs.countYOffset = 14
	E.db.nameplates.units.ENEMY_PLAYER.buffs.desaturate = false
	E.db.nameplates.units.ENEMY_PLAYER.buffs.font = Private.Font
	E.db.nameplates.units.ENEMY_PLAYER.buffs.fontSize = 10
	E.db.nameplates.units.ENEMY_PLAYER.buffs.growthX = 'LEFT'
	E.db.nameplates.units.ENEMY_PLAYER.buffs.numAuras = 4
	E.db.nameplates.units.ENEMY_PLAYER.buffs.priority = 'Dispellable'
	E.db.nameplates.units.ENEMY_PLAYER.buffs.size = 22
	E.db.nameplates.units.ENEMY_PLAYER.buffs.xOffset = 1
	E.db.nameplates.units.ENEMY_PLAYER.buffs.yOffset = -3
	E.db.nameplates.units.ENEMY_PLAYER.castbar.anchorPoint = 'BOTTOMLEFT'
	E.db.nameplates.units.ENEMY_PLAYER.castbar.castTimeFormat = 'REMAINING'
	E.db.nameplates.units.ENEMY_PLAYER.castbar.channelTimeFormat = 'REMAINING'
	E.db.nameplates.units.ENEMY_PLAYER.castbar.displayTarget = true
	E.db.nameplates.units.ENEMY_PLAYER.castbar.font = Private.Font
	E.db.nameplates.units.ENEMY_PLAYER.castbar.fontSize = 10
	E.db.nameplates.units.ENEMY_PLAYER.castbar.height = 14
	E.db.nameplates.units.ENEMY_PLAYER.castbar.iconOffsetX = 2
	E.db.nameplates.units.ENEMY_PLAYER.castbar.iconOffsetY = -1
	E.db.nameplates.units.ENEMY_PLAYER.castbar.iconPosition = 'LEFT'
	E.db.nameplates.units.ENEMY_PLAYER.castbar.iconSize = 16
	E.db.nameplates.units.ENEMY_PLAYER.castbar.textPosition = 'ONBAR'
	E.db.nameplates.units.ENEMY_PLAYER.castbar.textXOffset = 4
	E.db.nameplates.units.ENEMY_PLAYER.castbar.timeToHold = 2
	E.db.nameplates.units.ENEMY_PLAYER.castbar.timeXOffset = -1
	E.db.nameplates.units.ENEMY_PLAYER.castbar.width = 197
	E.db.nameplates.units.ENEMY_PLAYER.castbar.xOffset = 13
	E.db.nameplates.units.ENEMY_PLAYER.castbar.yOffset = 3
	E.db.nameplates.units.ENEMY_PLAYER.debuffs.anchorPoint = 'LEFT'
	E.db.nameplates.units.ENEMY_PLAYER.debuffs.countFont = Private.Font
	E.db.nameplates.units.ENEMY_PLAYER.debuffs.countFontSize = 12
	E.db.nameplates.units.ENEMY_PLAYER.debuffs.countPosition = 'TOP'
	E.db.nameplates.units.ENEMY_PLAYER.debuffs.countXOffset = 1
	E.db.nameplates.units.ENEMY_PLAYER.debuffs.countYOffset = 14
	E.db.nameplates.units.ENEMY_PLAYER.debuffs.desaturate = false
	E.db.nameplates.units.ENEMY_PLAYER.debuffs.font = Private.Font
	E.db.nameplates.units.ENEMY_PLAYER.debuffs.fontSize = 10
	E.db.nameplates.units.ENEMY_PLAYER.debuffs.numAuras = 4
	E.db.nameplates.units.ENEMY_PLAYER.debuffs.priority = Private.isRetail and 'blockNonPersonal,ClassDebuffs' or 'blockCCDebuffs,Personal'
	E.db.nameplates.units.ENEMY_PLAYER.debuffs.size = 24
	E.db.nameplates.units.ENEMY_PLAYER.debuffs.xOffset = -2
	E.db.nameplates.units.ENEMY_PLAYER.debuffs.yOffset = -1
	E.db.nameplates.units.ENEMY_PLAYER.health.height = 22
	E.db.nameplates.units.ENEMY_PLAYER.health.text.font = Private.Font
	E.db.nameplates.units.ENEMY_PLAYER.health.text.format = '[luckyone:health:percent]'
	E.db.nameplates.units.ENEMY_PLAYER.health.text.position = 'TOPRIGHT'
	E.db.nameplates.units.ENEMY_PLAYER.health.text.yOffset = -20
	E.db.nameplates.units.ENEMY_PLAYER.level.enable = false
	E.db.nameplates.units.ENEMY_PLAYER.level.format = '[luckyone:level]'
	E.db.nameplates.units.ENEMY_PLAYER.markHealers = false
	E.db.nameplates.units.ENEMY_PLAYER.name.font = Private.Font
	E.db.nameplates.units.ENEMY_PLAYER.name.format = '[luckyone:level< ||cffffffff- ][luckyone:name:last-nocolor]'
	E.db.nameplates.units.ENEMY_PLAYER.name.xOffset = 2
	E.db.nameplates.units.ENEMY_PLAYER.name.yOffset = -20
	E.db.nameplates.units.ENEMY_PLAYER.pvpindicator.size = 35
	E.db.nameplates.units.ENEMY_PLAYER.raidTargetIndicator.position = 'CENTER'
	E.db.nameplates.units.ENEMY_PLAYER.raidTargetIndicator.size = 16
	E.db.nameplates.units.ENEMY_PLAYER.raidTargetIndicator.xOffset = 0
	E.db.nameplates.units.ENEMY_PLAYER.raidTargetIndicator.yOffset = 1
	E.db.nameplates.units.ENEMY_PLAYER.title.format = ''

	-- Friendly NPC
	E.db.nameplates.units.FRIENDLY_NPC.buffs.enable = false
	E.db.nameplates.units.FRIENDLY_NPC.debuffs.enable = false
	E.db.nameplates.units.FRIENDLY_NPC.health.text.format = '[luckyone:health:percent]'
	E.db.nameplates.units.FRIENDLY_NPC.name.font = Private.Font
	E.db.nameplates.units.FRIENDLY_NPC.name.fontSize = 14
	E.db.nameplates.units.FRIENDLY_NPC.name.yOffset = 0
	E.db.nameplates.units.FRIENDLY_NPC.questIcon.enable = false
	E.db.nameplates.units.FRIENDLY_NPC.raidTargetIndicator.size = 20
	E.db.nameplates.units.FRIENDLY_NPC.title.enable = true
	E.db.nameplates.units.FRIENDLY_NPC.title.font = Private.Font

	-- Friendly Player
	E.db.nameplates.units.FRIENDLY_PLAYER.auras.enable = false
	E.db.nameplates.units.FRIENDLY_PLAYER.buffs.enable = false
	E.db.nameplates.units.FRIENDLY_PLAYER.debuffs.enable = false
	E.db.nameplates.units.FRIENDLY_PLAYER.health.text.format = '[luckyone:health:percent]'
	E.db.nameplates.units.FRIENDLY_PLAYER.markHealers = false
	E.db.nameplates.units.FRIENDLY_PLAYER.markTanks = false
	E.db.nameplates.units.FRIENDLY_PLAYER.name.font = Private.Font
	E.db.nameplates.units.FRIENDLY_PLAYER.name.fontSize = 14
	E.db.nameplates.units.FRIENDLY_PLAYER.name.yOffset = 0
	E.db.nameplates.units.FRIENDLY_PLAYER.nameOnly = true
	E.db.nameplates.units.FRIENDLY_PLAYER.raidTargetIndicator.size = 20
	E.db.nameplates.units.FRIENDLY_PLAYER.title.enable = true
	E.db.nameplates.units.FRIENDLY_PLAYER.title.font = Private.Font

	if NP.Initialized then
		E:UpdateNamePlates(true)
	end

	if installer then
		_G.LuckyoneInstallStepComplete:ShowMessage(L["NamePlate StyleFilters and CVars have been set."])
	end
end

-- ElvUI profile
-- LC: 25/09/2025
function Private:Setup_ElvUI(layout)
	-- Global db
	local scaled = Private.Addon.db.global.scaled
	-- AB conversion
	E.db.convertPages = true
	-- Protect movers error
	E.db.movers = E.db.movers or {}

	-- General
	E.db.general.addonCompartment.fontOutline = Private.Outline
	E.db.general.addonCompartment.hide = true
	E.db.general.addonCompartment.size = 20
	E.db.general.afk = false
	E.db.general.afkChat = false
	E.db.general.altPowerBar.font = Private.Font
	E.db.general.altPowerBar.statusBar = Private.Texture
	E.db.general.altPowerBar.statusBarColorGradient = true
	E.db.general.autoAcceptInvite = true
	E.db.general.autoRepair = (Private.isRetail and 'GUILD') or 'PLAYER'
	E.db.general.backdropcolor.b = 0.12
	E.db.general.backdropcolor.g = 0.12
	E.db.general.backdropcolor.r = 0.12
	E.db.general.backdropfadecolor.a = 0.9
	E.db.general.backdropfadecolor.b = 0.05
	E.db.general.backdropfadecolor.g = 0.05
	E.db.general.backdropfadecolor.r = 0.05
	E.db.general.bonusObjectivePosition = 'AUTO'
	E.db.general.bottomPanel = false
	E.db.general.customGlow.color.a = 1
	E.db.general.customGlow.color.b = 1
	E.db.general.customGlow.color.g = 1
	E.db.general.customGlow.color.r = 1
	E.db.general.customGlow.useColor = true
	E.db.general.durabilityScale = 0.5
	E.db.general.enhancedPvpMessages = false
	E.db.general.gameMenuScale = 0.8
	E.db.general.guildBank.countFont = Private.Font
	E.db.general.guildBank.countFontOutline = Private.Outline
	E.db.general.guildBank.itemLevelFont = Private.Font
	E.db.general.guildBank.itemLevelFontOutline = Private.Outline
	E.db.general.itemLevel.enchantAbbrev = false
	E.db.general.itemLevel.itemLevelFont = Private.Font
	E.db.general.itemLevel.itemLevelFontSize = 10
	E.db.general.itemLevel.totalLevelFont = Private.Font
	E.db.general.itemLevel.totalLevelFontSize = 22
	E.db.general.loginmessage = false
	E.db.general.lootRoll.buttonSize = 22
	E.db.general.lootRoll.spacing = 3
	E.db.general.lootRoll.statusBarTexture = Private.Texture
	E.db.general.lootRoll.style = 'fullbar'
	E.db.general.lootRoll.width = 340
	E.db.general.minimap.icons.battlefield.position = 'BOTTOMLEFT'
	E.db.general.minimap.icons.battlefield.xOffset = 0
	E.db.general.minimap.icons.battlefield.yOffset = 0
	E.db.general.minimap.icons.calendar.position = 'RIGHT'
	E.db.general.minimap.icons.calendar.scale = 1
	E.db.general.minimap.icons.calendar.xOffset = 2
	E.db.general.minimap.icons.classHall.scale = 0.6
	E.db.general.minimap.icons.classHall.xOffset = -4
	E.db.general.minimap.icons.classHall.yOffset = -4
	E.db.general.minimap.icons.crafting.position = 'LEFT'
	E.db.general.minimap.icons.crafting.xOffset = 2
	E.db.general.minimap.icons.crafting.yOffset = 0
	E.db.general.minimap.icons.difficulty.scale = 0.7
	E.db.general.minimap.icons.difficulty.xOffset = 1
	E.db.general.minimap.icons.difficulty.yOffset = -1
	E.db.general.minimap.icons.mail.texture = 'Mail1'
	E.db.general.minimap.icons.mail.xOffset = -2
	E.db.general.minimap.icons.mail.yOffset = 2
	E.db.general.minimap.icons.tracking.scale = 1
	E.db.general.minimap.icons.tracking.xOffset = 1
	E.db.general.minimap.icons.tracking.yOffset = 0
	E.db.general.minimap.locationFontSize = 11
	E.db.general.minimap.locationText = 'SHOW'
	E.db.general.minimap.size = 172
	E.db.general.objectiveFrameAutoHide = false
	E.db.general.objectiveFrameHeight = 600
	E.db.general.privateAuras.icon.size = 64
	E.db.general.privateRaidWarning.scale = 2
	E.db.general.queueStatus.scale = 0.3
	E.db.general.tagUpdateRate = 0.33
	E.db.general.talkingHeadFrameBackdrop = true
	E.db.general.talkingHeadFrameScale = 1
	E.db.general.vehicleSeatIndicatorSize = 64

	-- ActionBars
	E.db.actionbar.bar1.buttonSize = (scaled and 24) or 28
	E.db.actionbar.bar1.buttonSpacing = 1
	E.db.actionbar.bar1.countFont = Private.Font
	E.db.actionbar.bar1.countFontOutline = Private.Outline
	E.db.actionbar.bar1.countFontSize = 9
	E.db.actionbar.bar1.countTextPosition = 'BOTTOM'
	E.db.actionbar.bar1.hotkeyFont = Private.Font
	E.db.actionbar.bar1.hotkeyFontOutline = Private.Outline
	E.db.actionbar.bar1.hotkeyFontSize = 9
	E.db.actionbar.bar1.hotkeyTextPosition = 'TOP'
	E.db.actionbar.bar1.hotkeyTextYOffset = -1
	E.db.actionbar.bar1.macroFont = Private.Font
	E.db.actionbar.bar1.macroFontOutline = Private.Outline
	E.db.actionbar.bar1.macroFontSize = 9
	E.db.actionbar.bar1.macrotext = true
	E.db.actionbar.bar1.macroTextPosition = 'BOTTOM'
	E.db.actionbar.bar1.macroTextYOffset = 1
	E.db.actionbar.bar1.professionQuality.enable = false
	E.db.actionbar.bar1.targetReticle = false
	E.db.actionbar.bar2.buttonSize = (scaled and 24) or 28
	E.db.actionbar.bar2.buttonSpacing = 1
	E.db.actionbar.bar2.countFont = Private.Font
	E.db.actionbar.bar2.countFontOutline = Private.Outline
	E.db.actionbar.bar2.countFontSize = 9
	E.db.actionbar.bar2.countTextPosition = 'BOTTOM'
	E.db.actionbar.bar2.enabled = true
	E.db.actionbar.bar2.hotkeyFont = Private.Font
	E.db.actionbar.bar2.hotkeyFontOutline = Private.Outline
	E.db.actionbar.bar2.hotkeyFontSize = 9
	E.db.actionbar.bar2.hotkeyTextPosition = 'TOP'
	E.db.actionbar.bar2.hotkeyTextYOffset = -1
	E.db.actionbar.bar2.macroFont = Private.Font
	E.db.actionbar.bar2.macroFontOutline = Private.Outline
	E.db.actionbar.bar2.macroFontSize = 9
	E.db.actionbar.bar2.macrotext = true
	E.db.actionbar.bar2.macroTextPosition = 'BOTTOM'
	E.db.actionbar.bar2.macroTextYOffset = 1
	E.db.actionbar.bar2.professionQuality.enable = false
	E.db.actionbar.bar2.targetReticle = false
	E.db.actionbar.bar3.buttons = 12
	E.db.actionbar.bar3.buttonSize = (scaled and 24) or 28
	E.db.actionbar.bar3.buttonSpacing = 1
	E.db.actionbar.bar3.buttonsPerRow = 12
	E.db.actionbar.bar3.countFont = Private.Font
	E.db.actionbar.bar3.countFontOutline = Private.Outline
	E.db.actionbar.bar3.countFontSize = 9
	E.db.actionbar.bar3.countTextPosition = 'BOTTOM'
	E.db.actionbar.bar3.hotkeyFont = Private.Font
	E.db.actionbar.bar3.hotkeyFontOutline = Private.Outline
	E.db.actionbar.bar3.hotkeyFontSize = 9
	E.db.actionbar.bar3.hotkeyTextPosition = 'TOP'
	E.db.actionbar.bar3.hotkeyTextYOffset = -1
	E.db.actionbar.bar3.macroFont = Private.Font
	E.db.actionbar.bar3.macroFontOutline = Private.Outline
	E.db.actionbar.bar3.macroFontSize = 9
	E.db.actionbar.bar3.macrotext = true
	E.db.actionbar.bar3.macroTextPosition = 'BOTTOM'
	E.db.actionbar.bar3.macroTextYOffset = 1
	E.db.actionbar.bar3.professionQuality.enable = false
	E.db.actionbar.bar3.targetReticle = false
	E.db.actionbar.bar4.backdrop = false
	E.db.actionbar.bar4.buttons = 7
	E.db.actionbar.bar4.buttonSize = (scaled and 21) or 26
	E.db.actionbar.bar4.buttonSpacing = 1
	E.db.actionbar.bar4.countFont = Private.Font
	E.db.actionbar.bar4.countFontOutline = Private.Outline
	E.db.actionbar.bar4.countFontSize = 9
	E.db.actionbar.bar4.countTextPosition = 'BOTTOM'
	E.db.actionbar.bar4.enabled = not Private.isRetail
	E.db.actionbar.bar4.hotkeyFont = Private.Font
	E.db.actionbar.bar4.hotkeyFontOutline = Private.Outline
	E.db.actionbar.bar4.hotkeyFontSize = 9
	E.db.actionbar.bar4.hotkeyTextPosition = 'TOP'
	E.db.actionbar.bar4.hotkeyTextYOffset = -1
	E.db.actionbar.bar4.macroFont = Private.Font
	E.db.actionbar.bar4.macroFontOutline = Private.Outline
	E.db.actionbar.bar4.macroFontSize = 9
	E.db.actionbar.bar4.macrotext = true
	E.db.actionbar.bar4.macroTextPosition = 'BOTTOM'
	E.db.actionbar.bar4.macroTextYOffset = 1
	E.db.actionbar.bar4.point = 'BOTTOMLEFT'
	E.db.actionbar.bar4.professionQuality.enable = false
	E.db.actionbar.bar4.targetReticle = false
	E.db.actionbar.bar5.buttons = 12
	E.db.actionbar.bar5.buttonSize = (scaled and 24) or 28
	E.db.actionbar.bar5.buttonSpacing = 1
	E.db.actionbar.bar5.buttonsPerRow = 1
	E.db.actionbar.bar5.countFont = Private.Font
	E.db.actionbar.bar5.countFontOutline = Private.Outline
	E.db.actionbar.bar5.countFontSize = 9
	E.db.actionbar.bar5.countTextPosition = 'BOTTOM'
	E.db.actionbar.bar5.enabled = true
	E.db.actionbar.bar5.hotkeyFont = Private.Font
	E.db.actionbar.bar5.hotkeyFontOutline = Private.Outline
	E.db.actionbar.bar5.hotkeyFontSize = 9
	E.db.actionbar.bar5.hotkeyTextPosition = 'TOP'
	E.db.actionbar.bar5.hotkeyTextYOffset = -1
	E.db.actionbar.bar5.macroFont = Private.Font
	E.db.actionbar.bar5.macroFontOutline = Private.Outline
	E.db.actionbar.bar5.macroFontSize = 9
	E.db.actionbar.bar5.macrotext = true
	E.db.actionbar.bar5.macroTextPosition = 'BOTTOM'
	E.db.actionbar.bar5.macroTextYOffset = 1
	E.db.actionbar.bar5.mouseover = true
	E.db.actionbar.bar5.professionQuality.enable = false
	E.db.actionbar.bar5.targetReticle = false
	E.db.actionbar.bar6.buttonSize = (scaled and 24) or 28
	E.db.actionbar.bar6.buttonSpacing = 1
	E.db.actionbar.bar6.countFont = Private.Font
	E.db.actionbar.bar6.countFontOutline = Private.Outline
	E.db.actionbar.bar6.countFontSize = 9
	E.db.actionbar.bar6.countTextPosition = 'BOTTOM'
	E.db.actionbar.bar6.enabled = false
	E.db.actionbar.bar6.hotkeyFont = Private.Font
	E.db.actionbar.bar6.hotkeyFontOutline = Private.Outline
	E.db.actionbar.bar6.hotkeyFontSize = 9
	E.db.actionbar.bar6.hotkeyTextPosition = 'TOP'
	E.db.actionbar.bar6.hotkeyTextYOffset = -1
	E.db.actionbar.bar6.macroFont = Private.Font
	E.db.actionbar.bar6.macroFontOutline = Private.Outline
	E.db.actionbar.bar6.macroFontSize = 9
	E.db.actionbar.bar6.macrotext = true
	E.db.actionbar.bar6.macroTextPosition = 'BOTTOM'
	E.db.actionbar.bar6.macroTextYOffset = 1
	E.db.actionbar.bar6.professionQuality.enable = false
	E.db.actionbar.bar6.targetReticle = false
	E.db.actionbar.bar7.buttonSize = (scaled and 24) or 28
	E.db.actionbar.bar7.buttonSpacing = 1
	E.db.actionbar.bar7.countFont = Private.Font
	E.db.actionbar.bar7.countFontOutline = Private.Outline
	E.db.actionbar.bar7.countFontSize = 9
	E.db.actionbar.bar7.countTextPosition = 'BOTTOM'
	E.db.actionbar.bar7.hotkeyFont = Private.Font
	E.db.actionbar.bar7.hotkeyFontOutline = Private.Outline
	E.db.actionbar.bar7.hotkeyFontSize = 9
	E.db.actionbar.bar7.hotkeyTextPosition = 'TOP'
	E.db.actionbar.bar7.hotkeyTextYOffset = -1
	E.db.actionbar.bar7.macroFont = Private.Font
	E.db.actionbar.bar7.macroFontOutline = Private.Outline
	E.db.actionbar.bar7.macroFontSize = 9
	E.db.actionbar.bar7.macrotext = true
	E.db.actionbar.bar7.macroTextPosition = 'BOTTOM'
	E.db.actionbar.bar7.macroTextYOffset = 1
	E.db.actionbar.bar7.professionQuality.enable = false
	E.db.actionbar.bar7.targetReticle = false
	E.db.actionbar.bar8.buttonSize = (scaled and 24) or 28
	E.db.actionbar.bar8.buttonSpacing = 1
	E.db.actionbar.bar8.countFont = Private.Font
	E.db.actionbar.bar8.countFontOutline = Private.Outline
	E.db.actionbar.bar8.countFontSize = 9
	E.db.actionbar.bar8.countTextPosition = 'BOTTOM'
	E.db.actionbar.bar8.hotkeyFont = Private.Font
	E.db.actionbar.bar8.hotkeyFontOutline = Private.Outline
	E.db.actionbar.bar8.hotkeyFontSize = 9
	E.db.actionbar.bar8.hotkeyTextPosition = 'TOP'
	E.db.actionbar.bar8.hotkeyTextYOffset = -1
	E.db.actionbar.bar8.macroFont = Private.Font
	E.db.actionbar.bar8.macroFontOutline = Private.Outline
	E.db.actionbar.bar8.macroFontSize = 9
	E.db.actionbar.bar8.macrotext = true
	E.db.actionbar.bar8.macroTextPosition = 'BOTTOM'
	E.db.actionbar.bar8.macroTextYOffset = 1
	E.db.actionbar.bar8.professionQuality.enable = false
	E.db.actionbar.bar8.targetReticle = false
	E.db.actionbar.bar9.buttonSize = (scaled and 24) or 28
	E.db.actionbar.bar9.buttonSpacing = 1
	E.db.actionbar.bar9.countFont = Private.Font
	E.db.actionbar.bar9.countFontOutline = Private.Outline
	E.db.actionbar.bar9.countFontSize = 9
	E.db.actionbar.bar9.countTextPosition = 'BOTTOM'
	E.db.actionbar.bar9.hotkeyFont = Private.Font
	E.db.actionbar.bar9.hotkeyFontOutline = Private.Outline
	E.db.actionbar.bar9.hotkeyFontSize = 9
	E.db.actionbar.bar9.hotkeyTextPosition = 'TOP'
	E.db.actionbar.bar9.hotkeyTextYOffset = -1
	E.db.actionbar.bar9.macroFont = Private.Font
	E.db.actionbar.bar9.macroFontOutline = Private.Outline
	E.db.actionbar.bar9.macroFontSize = 9
	E.db.actionbar.bar9.macrotext = true
	E.db.actionbar.bar9.macroTextPosition = 'BOTTOM'
	E.db.actionbar.bar9.macroTextYOffset = 1
	E.db.actionbar.bar9.professionQuality.enable = false
	E.db.actionbar.bar9.targetReticle = false
	E.db.actionbar.bar10.buttonSize = (scaled and 24) or 28
	E.db.actionbar.bar10.buttonSpacing = 1
	E.db.actionbar.bar10.countFont = Private.Font
	E.db.actionbar.bar10.countFontOutline = Private.Outline
	E.db.actionbar.bar10.countFontSize = 9
	E.db.actionbar.bar10.countTextPosition = 'BOTTOM'
	E.db.actionbar.bar10.hotkeyFont = Private.Font
	E.db.actionbar.bar10.hotkeyFontOutline = Private.Outline
	E.db.actionbar.bar10.hotkeyFontSize = 9
	E.db.actionbar.bar10.hotkeyTextPosition = 'TOP'
	E.db.actionbar.bar10.hotkeyTextYOffset = -1
	E.db.actionbar.bar10.macroFont = Private.Font
	E.db.actionbar.bar10.macroFontOutline = Private.Outline
	E.db.actionbar.bar10.macroFontSize = 9
	E.db.actionbar.bar10.macrotext = true
	E.db.actionbar.bar10.macroTextPosition = 'BOTTOM'
	E.db.actionbar.bar10.macroTextYOffset = 1
	E.db.actionbar.bar10.professionQuality.enable = false
	E.db.actionbar.bar10.targetReticle = false
	E.db.actionbar.bar13.buttonSize = (scaled and 24) or 28
	E.db.actionbar.bar13.buttonSpacing = 1
	E.db.actionbar.bar13.countFont = Private.Font
	E.db.actionbar.bar13.countFontOutline = Private.Outline
	E.db.actionbar.bar13.countFontSize = 9
	E.db.actionbar.bar13.countTextPosition = 'BOTTOM'
	E.db.actionbar.bar13.hotkeyFont = Private.Font
	E.db.actionbar.bar13.hotkeyFontOutline = Private.Outline
	E.db.actionbar.bar13.hotkeyFontSize = 9
	E.db.actionbar.bar13.hotkeyTextPosition = 'TOP'
	E.db.actionbar.bar13.hotkeyTextYOffset = -1
	E.db.actionbar.bar13.macroFont = Private.Font
	E.db.actionbar.bar13.macroFontOutline = Private.Outline
	E.db.actionbar.bar13.macroFontSize = 9
	E.db.actionbar.bar13.macrotext = true
	E.db.actionbar.bar13.macroTextPosition = 'BOTTOM'
	E.db.actionbar.bar13.macroTextYOffset = 1
	E.db.actionbar.bar13.professionQuality.enable = false
	E.db.actionbar.bar13.targetReticle = false
	E.db.actionbar.bar14.buttonSize = (scaled and 24) or 28
	E.db.actionbar.bar14.buttonSpacing = 1
	E.db.actionbar.bar14.countFont = Private.Font
	E.db.actionbar.bar14.countFontOutline = Private.Outline
	E.db.actionbar.bar14.countFontSize = 9
	E.db.actionbar.bar14.countTextPosition = 'BOTTOM'
	E.db.actionbar.bar14.hotkeyFont = Private.Font
	E.db.actionbar.bar14.hotkeyFontOutline = Private.Outline
	E.db.actionbar.bar14.hotkeyFontSize = 9
	E.db.actionbar.bar14.hotkeyTextPosition = 'TOP'
	E.db.actionbar.bar14.hotkeyTextYOffset = -1
	E.db.actionbar.bar14.macroFont = Private.Font
	E.db.actionbar.bar14.macroFontOutline = Private.Outline
	E.db.actionbar.bar14.macroFontSize = 9
	E.db.actionbar.bar14.macrotext = true
	E.db.actionbar.bar14.macroTextPosition = 'BOTTOM'
	E.db.actionbar.bar14.macroTextYOffset = 1
	E.db.actionbar.bar14.professionQuality.enable = false
	E.db.actionbar.bar14.targetReticle = false
	E.db.actionbar.bar15.buttonSize = (scaled and 24) or 28
	E.db.actionbar.bar15.buttonSpacing = 1
	E.db.actionbar.bar15.countFont = Private.Font
	E.db.actionbar.bar15.countFontOutline = Private.Outline
	E.db.actionbar.bar15.countFontSize = 9
	E.db.actionbar.bar15.countTextPosition = 'BOTTOM'
	E.db.actionbar.bar15.hotkeyFont = Private.Font
	E.db.actionbar.bar15.hotkeyFontOutline = Private.Outline
	E.db.actionbar.bar15.hotkeyFontSize = 9
	E.db.actionbar.bar15.hotkeyTextPosition = 'TOP'
	E.db.actionbar.bar15.hotkeyTextYOffset = -1
	E.db.actionbar.bar15.macroFont = Private.Font
	E.db.actionbar.bar15.macroFontOutline = Private.Outline
	E.db.actionbar.bar15.macroFontSize = 9
	E.db.actionbar.bar15.macrotext = true
	E.db.actionbar.bar15.macroTextPosition = 'BOTTOM'
	E.db.actionbar.bar15.macroTextYOffset = 1
	E.db.actionbar.bar15.professionQuality.enable = false
	E.db.actionbar.bar15.targetReticle = false
	E.db.actionbar.barPet.backdrop = false
	E.db.actionbar.barPet.buttonSize = (scaled and 24) or 28
	E.db.actionbar.barPet.buttonSpacing = 1
	E.db.actionbar.barPet.buttonsPerRow = 10
	E.db.actionbar.barPet.countFont = Private.Font
	E.db.actionbar.barPet.countFontOutline = Private.Outline
	E.db.actionbar.barPet.countFontSize = 9
	E.db.actionbar.barPet.hotkeyFont = Private.Font
	E.db.actionbar.barPet.hotkeyFontOutline = Private.Outline
	E.db.actionbar.barPet.hotkeyFontSize = 9
	E.db.actionbar.barPet.hotkeyTextPosition = 'TOP'
	E.db.actionbar.barPet.hotkeyTextYOffset = -1
	E.db.actionbar.barPet.point = 'TOPLEFT'
	E.db.actionbar.cooldown.override = false
	E.db.actionbar.countTextPosition = 'BOTTOM'
	E.db.actionbar.countTextYOffset = 1
	E.db.actionbar.extraActionButton.clean = true
	E.db.actionbar.extraActionButton.hotkeyFont = Private.Font
	E.db.actionbar.extraActionButton.hotkeyFontOutline = Private.Outline
	E.db.actionbar.extraActionButton.hotkeyFontSize = 9
	E.db.actionbar.extraActionButton.hotkeyTextPosition = 'TOP'
	E.db.actionbar.extraActionButton.hotkeyTextYOffset = -1
	E.db.actionbar.flyoutSize = (scaled and 24) or 28
	E.db.actionbar.font = Private.Font
	E.db.actionbar.fontOutline = Private.Outline
	E.db.actionbar.fontSize = 9
	E.db.actionbar.hotkeyTextPosition = 'TOP'
	E.db.actionbar.macroTextPosition = 'BOTTOM'
	E.db.actionbar.microbar.buttonSpacing = 1
	E.db.actionbar.microbar.enabled = true
	E.db.actionbar.microbar.mouseover = true
	E.db.actionbar.microbar.useIcons = false
	E.db.actionbar.stanceBar.buttonHeight = 24
	E.db.actionbar.stanceBar.buttonSize = 28
	E.db.actionbar.stanceBar.buttonSpacing = 1
	E.db.actionbar.stanceBar.hotkeyFont = Private.Font
	E.db.actionbar.stanceBar.hotkeyFontOutline = Private.Outline
	E.db.actionbar.stanceBar.hotkeyFontSize = 9
	E.db.actionbar.stanceBar.hotkeyTextPosition = 'TOP'
	E.db.actionbar.stanceBar.hotkeyTextYOffset = -1
	E.db.actionbar.stanceBar.mouseover = true
	E.db.actionbar.stanceBar.style = 'classic'
	E.db.actionbar.transparent = true
	E.db.actionbar.vehicleExitButton.hotkeyFont = Private.Font
	E.db.actionbar.vehicleExitButton.hotkeyFontOutline = Private.Outline
	E.db.actionbar.vehicleExitButton.hotkeyFontSize = 9
	E.db.actionbar.vehicleExitButton.hotkeyTextPosition = 'TOP'
	E.db.actionbar.vehicleExitButton.hotkeyTextYOffset = -1
	E.db.actionbar.zoneActionButton.clean = true

	-- Bags
	E.db.bags.autoToggle.guildBank = true
	E.db.bags.bagBar.backdropSpacing = 1
	E.db.bags.bagBar.font = Private.Font
	E.db.bags.bagBar.size = 23
	E.db.bags.bagBar.spacing = 0
	E.db.bags.bagSize = (scaled and 28) or 30
	E.db.bags.bagWidth = (scaled and 400) or 464
	E.db.bags.bankCombined = true
	E.db.bags.bankSize = (scaled and 28) or 30
	E.db.bags.bankWidth = (scaled and 520) or 700
	E.db.bags.clearSearchOnClose = true
	E.db.bags.countFont = Private.Font
	E.db.bags.countFontOutline = Private.Outline
	E.db.bags.countFontSize = 11
	E.db.bags.itemInfoFont = Private.Font
	E.db.bags.itemInfoFontOutline = Private.Outline
	E.db.bags.itemInfoFontSize = 11
	E.db.bags.itemLevelFont = Private.Font
	E.db.bags.itemLevelFontOutline = Private.Outline
	E.db.bags.itemLevelFontSize = 11
	E.db.bags.moneyFormat = 'FULL'
	E.db.bags.specialtyColors = false
	E.db.bags.spinner.size = 60
	E.db.bags.split.bag5 = true
	E.db.bags.split.bagSpacing = 1
	E.db.bags.split.player = true
	E.db.bags.upgradeIcon = false
	E.db.bags.useBlizzardCleanupBank = false
	E.db.bags.vendorGrays.enable = true
	E.db.bags.vendorGrays.interval = 0.1
	E.db.bags.warbandSize = (scaled and 28) or 30
	E.db.bags.warbandWidth = (scaled and 520) or 700

	-- Auras
	E.db.auras.buffs.countFont = Private.Font
	E.db.auras.buffs.countFontOutline = Private.Outline
	E.db.auras.buffs.countFontSize = 12
	E.db.auras.buffs.countXOffset = 1
	E.db.auras.buffs.countYOffset = 2
	E.db.auras.buffs.fadeThreshold = -1
	E.db.auras.buffs.horizontalSpacing = 1
	E.db.auras.buffs.seperateOwn = 0
	E.db.auras.buffs.size = 22
	E.db.auras.buffs.sortMethod = 'INDEX'
	E.db.auras.buffs.timeFont = Private.Font
	E.db.auras.buffs.timeFontOutline = Private.Outline
	E.db.auras.buffs.timeXOffset = 1
	E.db.auras.buffs.timeYOffset = -1
	E.db.auras.buffs.verticalSpacing = 12
	E.db.auras.debuffs.countFont = Private.Font
	E.db.auras.debuffs.countFontOutline = Private.Outline
	E.db.auras.debuffs.countFontSize = 12
	E.db.auras.debuffs.countXOffset = 1
	E.db.auras.debuffs.countYOffset = 2
	E.db.auras.debuffs.fadeThreshold = -1
	E.db.auras.debuffs.horizontalSpacing = 1
	E.db.auras.debuffs.maxWraps = 2
	E.db.auras.debuffs.seperateOwn = 0
	E.db.auras.debuffs.size = 22
	E.db.auras.debuffs.sortMethod = 'INDEX'
	E.db.auras.debuffs.timeFont = Private.Font
	E.db.auras.debuffs.timeFontOutline = Private.Outline
	E.db.auras.debuffs.timeXOffset = 1
	E.db.auras.debuffs.timeYOffset = -1
	E.db.auras.debuffs.verticalSpacing = 12

	-- Chat
	E.db.chat.customTimeColor.b = 1
	E.db.chat.customTimeColor.g = 1
	E.db.chat.customTimeColor.r = 1
	E.db.chat.desaturateVoiceIcons = false
	E.db.chat.editboxHistorySize = 5
	E.db.chat.editBoxPosition = 'ABOVE_CHAT_INSIDE'
	E.db.chat.enableCombatRepeat = false
	E.db.chat.fade = false
	E.db.chat.fadeTabsNoBackdrop = false
	E.db.chat.font = Private.Font
	E.db.chat.fontOutline = Private.Outline
	E.db.chat.hideChatToggles = true
	E.db.chat.historySize = 200
	E.db.chat.lfgIcons = false
	E.db.chat.maxLines = 500
	E.db.chat.numScrollMessages = 2
	E.db.chat.panelColor.a = 0.9
	E.db.chat.panelColor.b = 0.05
	E.db.chat.panelColor.g = 0.05
	E.db.chat.panelColor.r = 0.05
	E.db.chat.panelHeight = (scaled and 154) or 188
	E.db.chat.panelHeightRight = (scaled and 154) or 190
	E.db.chat.panelWidth = (scaled and 404) or 464
	E.db.chat.panelWidthRight = (scaled and 400) or 464
	E.db.chat.separateSizes = true
	E.db.chat.showHistory.CHANNEL = false
	E.db.chat.showHistory.EMOTE = false
	E.db.chat.showHistory.GUILD = false
	E.db.chat.showHistory.INSTANCE = false
	E.db.chat.showHistory.PARTY = false
	E.db.chat.showHistory.RAID = false
	E.db.chat.showHistory.SAY = false
	E.db.chat.showHistory.YELL = false
	E.db.chat.tabFont = Private.Font
	E.db.chat.tabFontOutline = Private.Outline
	E.db.chat.tabFontSize = 11
	E.db.chat.tabSelector = 'NONE'
	E.db.chat.throttleInterval = 0
	E.db.chat.timeStampFormat = '%H:%M '
	E.db.chat.timeStampLocalTime = true
	E.db.chat.useBTagName = true

	-- Cooldown Text
	E.db.cooldown.checkSeconds = true
	E.db.cooldown.fonts.font = Private.Font
	E.db.cooldown.fonts.fontSize = 16
	E.db.cooldown.hhmmColor.b = 1
	E.db.cooldown.hhmmColor.g = 1
	E.db.cooldown.hhmmColor.r = 0.4
	E.db.cooldown.mmssColor.b = 1
	E.db.cooldown.mmssColor.g = 1
	E.db.cooldown.mmssColor.r = 1
	E.db.cooldown.mmssThreshold = 120
	E.db.cooldown.secondsColor.b = 1
	E.db.cooldown.showModRate = true
	E.db.cooldown.targetAura = false
	E.db.cooldown.threshold = 4

	-- DataBars
	E.db.databars.azerite.enable = false
	E.db.databars.experience.font = Private.Font
	E.db.databars.experience.fontOutline = Private.Outline
	E.db.databars.experience.height = 20
	E.db.databars.experience.orientation = 'HORIZONTAL'
	E.db.databars.experience.questCompletedOnly = true
	E.db.databars.experience.showLevel = true
	E.db.databars.experience.textFormat = 'PERCENT'
	E.db.databars.experience.width = 420
	E.db.databars.honor.enable = false
	E.db.databars.petExperience.enable = false
	E.db.databars.reputation.enable = true
	E.db.databars.reputation.font = Private.Font
	E.db.databars.reputation.height = (scaled and 154) or 190
	E.db.databars.reputation.orientation = 'VERTICAL'
	E.db.databars.reputation.width = 12
	E.db.databars.threat.enable = false

	-- DataTexts custom
	E.db.datatexts.panels.Luckyone_ActionBars_DT.battleground = false
	E.db.datatexts.panels.Luckyone_ActionBars_DT.enable = true
	E.db.datatexts.panels.Luckyone_ActionBars_DT[1] = 'System'
	E.db.datatexts.panels.Luckyone_ActionBars_DT[2] = 'Combat'
	E.db.datatexts.panels.Luckyone_ActionBars_DT[3] = 'Durability'
	E.db.datatexts.panels.Luckyone_MiniMap_DT.battleground = false
	E.db.datatexts.panels.Luckyone_MiniMap_DT.enable = true
	E.db.datatexts.panels.Luckyone_MiniMap_DT[1] = 'Time'

	-- DataTexts default
	E.db.datatexts.battlePanel.LeftChatDataPanel[1] = ''
	E.db.datatexts.battlePanel.LeftChatDataPanel[2] = ''
	E.db.datatexts.battlePanel.LeftChatDataPanel[3] = ''
	E.db.datatexts.battlePanel.RightChatDataPanel[1] = ''
	E.db.datatexts.battlePanel.RightChatDataPanel[2] = ''
	E.db.datatexts.battlePanel.RightChatDataPanel[3] = ''
	E.db.datatexts.font = Private.Font
	E.db.datatexts.fontOutline = Private.Outline
	E.db.datatexts.fontSize = 11
	E.db.datatexts.noCombatClick = true
	E.db.datatexts.noCombatHover = true
	E.db.datatexts.panels.LeftChatDataPanel.battleground = false
	E.db.datatexts.panels.LeftChatDataPanel.enable = false
	E.db.datatexts.panels.LeftChatDataPanel.panelTransparency = true
	E.db.datatexts.panels.LeftChatDataPanel[1] = ''
	E.db.datatexts.panels.LeftChatDataPanel[2] = ''
	E.db.datatexts.panels.LeftChatDataPanel[3] = ''
	E.db.datatexts.panels.MinimapPanel.enable = false
	E.db.datatexts.panels.MinimapPanel.panelTransparency = true
	E.db.datatexts.panels.MinimapPanel[1] = ''
	E.db.datatexts.panels.MinimapPanel[2] = ''
	E.db.datatexts.panels.RightChatDataPanel.battleground = false
	E.db.datatexts.panels.RightChatDataPanel.enable = false
	E.db.datatexts.panels.RightChatDataPanel.panelTransparency = true
	E.db.datatexts.panels.RightChatDataPanel[1] = ''
	E.db.datatexts.panels.RightChatDataPanel[2] = ''
	E.db.datatexts.panels.RightChatDataPanel[3] = ''

	-- Tooltip
	E.db.tooltip.alwaysShowRealm = true
	E.db.tooltip.anchorToBags = 'DISABLED'
	E.db.tooltip.colorAlpha = 0.9
	E.db.tooltip.font = Private.Font
	E.db.tooltip.fontOutline = Private.Outline
	E.db.tooltip.headerFont = Private.Font
	E.db.tooltip.headerFontOutline = Private.Outline
	E.db.tooltip.headerFontSize = 11
	E.db.tooltip.healthBar.font = Private.Font
	E.db.tooltip.healthBar.fontOutline = Private.Outline
	E.db.tooltip.healthBar.fontSize = 10
	E.db.tooltip.healthBar.height = 6
	E.db.tooltip.healthBar.statusPosition = 'DISABLED'
	E.db.tooltip.inspectDataEnable = false
	E.db.tooltip.itemCount.bags = false
	E.db.tooltip.itemQuality = true
	E.db.tooltip.mythicDataEnable = false
	E.db.tooltip.role = false
	E.db.tooltip.showElvUIUsers = true
	E.db.tooltip.showMount = false
	E.db.tooltip.smallTextFontSize = 10
	E.db.tooltip.targetInfo = false
	E.db.tooltip.textFontSize = 11

	-- Shared UnitFrames
	E.db.unitframe.colors.castbar_backdrop.b = 0.05
	E.db.unitframe.colors.castbar_backdrop.g = 0.05
	E.db.unitframe.colors.castbar_backdrop.r = 0.05
	E.db.unitframe.colors.castColor.b = 0
	E.db.unitframe.colors.castColor.g = 1
	E.db.unitframe.colors.castColor.r = 0.02
	E.db.unitframe.colors.castNoInterrupt.b = 0
	E.db.unitframe.colors.castNoInterrupt.g = 0
	E.db.unitframe.colors.castNoInterrupt.r = 1
	E.db.unitframe.colors.colorhealthbyvalue = false
	E.db.unitframe.colors.customcastbarbackdrop = true
	E.db.unitframe.colors.customhealthbackdrop = true
	E.db.unitframe.colors.custompowerbackdrop = true
	E.db.unitframe.colors.frameGlow.mouseoverGlow.texture = Private.Texture
	E.db.unitframe.colors.healPrediction.overabsorbs.b = 1
	E.db.unitframe.colors.healPrediction.overabsorbs.r = 0
	E.db.unitframe.colors.health_backdrop_dead.b = 0.14
	E.db.unitframe.colors.health_backdrop_dead.g = 0.2
	E.db.unitframe.colors.health_backdrop_dead.r = 1
	E.db.unitframe.colors.health_backdrop.b = 0.61
	E.db.unitframe.colors.health_backdrop.g = 0.56
	E.db.unitframe.colors.health_backdrop.r = 0.54
	E.db.unitframe.colors.health.b = 0.05
	E.db.unitframe.colors.health.g = 0.05
	E.db.unitframe.colors.health.r = 0.05
	E.db.unitframe.colors.healthMultiplier = 0.75
	E.db.unitframe.colors.power_backdrop.b = 0.05
	E.db.unitframe.colors.power_backdrop.g = 0.05
	E.db.unitframe.colors.power_backdrop.r = 0.05
	E.db.unitframe.colors.power.MANA.b = 0.97
	E.db.unitframe.colors.power.MANA.g = 1
	E.db.unitframe.colors.power.MANA.r = 0
	E.db.unitframe.colors.tapped.g = 0.56
	E.db.unitframe.colors.tapped.r = 0.54
	E.db.unitframe.colors.transparentCastbar = false
	E.db.unitframe.colors.transparentHealth = true
	E.db.unitframe.colors.transparentPower = true
	E.db.unitframe.colors.useDeadBackdrop = true
	E.db.unitframe.cooldown.fonts.font = Private.Font
	E.db.unitframe.cooldown.override = false
	E.db.unitframe.font = Private.Font
	E.db.unitframe.fontOutline = Private.Outline
	E.db.unitframe.fontSize = 11
	E.db.unitframe.statusbar = Private.Texture
	E.db.unitframe.targetOnMouseDown = true
	E.db.unitframe.targetSound = true

	-- Shared MA/MT
	E.db.unitframe.units.assist.enable = false
	E.db.unitframe.units.tank.enable = false

	-- Shared Arena
	E.db.unitframe.units.arena.customTexts = {}
	E.db.unitframe.units.arena.customTexts.Luckyone_HP = {
		attachTextTo = 'Health',
		enable = true,
		font = Private.Font,
		fontOutline = Private.Outline,
		justifyH = 'LEFT',
		size = 12,
		text_format = '[luckyone:health:percent] • [health:current:shortvalue]',
		xOffset = 3,
		yOffset = 0
	}
	E.db.unitframe.units.arena.customTexts.Luckyone_Name = {
		attachTextTo = 'Health',
		enable = true,
		font = Private.Font,
		fontOutline = Private.Outline,
		justifyH = 'RIGHT',
		size = 12,
		text_format = '[luckyone:name:last-classcolor]',
		xOffset = -3,
		yOffset = 0
	}
	E.db.unitframe.units.arena.customTexts.Luckyone_Power = {
		attachTextTo = 'Power',
		enable = true,
		font = Private.Font,
		fontOutline = Private.Outline,
		justifyH = 'CENTER',
		size = 11,
		text_format = '[luckyone:power:percent-color]',
		xOffset = 0,
		yOffset = 0
	}

	E.db.unitframe.units.arena.buffs.countFont = Private.Font
	E.db.unitframe.units.arena.buffs.countFontSize = 10
	E.db.unitframe.units.arena.buffs.countPosition = 'TOPRIGHT'
	E.db.unitframe.units.arena.buffs.countXOffset = 2
	E.db.unitframe.units.arena.buffs.countYOffset = 0
	E.db.unitframe.units.arena.buffs.growthY = 'DOWN'
	E.db.unitframe.units.arena.buffs.maxDuration = 0
	E.db.unitframe.units.arena.buffs.perrow = 5
	E.db.unitframe.units.arena.buffs.priority = 'Whitelist,TurtleBuffs,Dispellable'
	E.db.unitframe.units.arena.buffs.sizeOverride = 20
	E.db.unitframe.units.arena.buffs.xOffset = -1
	E.db.unitframe.units.arena.buffs.yOffset = -10
	E.db.unitframe.units.arena.castbar.customTextFont.enable = true
	E.db.unitframe.units.arena.castbar.customTextFont.font = Private.Font
	E.db.unitframe.units.arena.castbar.customTextFont.fontSize = 9
	E.db.unitframe.units.arena.castbar.customTimeFont.enable = true
	E.db.unitframe.units.arena.castbar.customTimeFont.font = Private.Font
	E.db.unitframe.units.arena.castbar.customTimeFont.fontSize = 9
	E.db.unitframe.units.arena.castbar.height = 16
	E.db.unitframe.units.arena.castbar.iconAttachedTo = 'Castbar'
	E.db.unitframe.units.arena.castbar.positionsGroup.yOffset = -1
	E.db.unitframe.units.arena.castbar.strataAndLevel.useCustomLevel = true
	E.db.unitframe.units.arena.castbar.strataAndLevel.useCustomStrata = true
	E.db.unitframe.units.arena.castbar.textColor.b = 1
	E.db.unitframe.units.arena.castbar.textColor.g = 1
	E.db.unitframe.units.arena.castbar.textColor.r = 1
	E.db.unitframe.units.arena.castbar.width = 211
	E.db.unitframe.units.arena.castbar.xOffsetText = 2
	E.db.unitframe.units.arena.castbar.xOffsetTime = -2
	E.db.unitframe.units.arena.debuffs.anchorPoint = 'TOPLEFT'
	E.db.unitframe.units.arena.debuffs.countFont = Private.Font
	E.db.unitframe.units.arena.debuffs.countFontSize = 10
	E.db.unitframe.units.arena.debuffs.countPosition = 'TOPRIGHT'
	E.db.unitframe.units.arena.debuffs.countXOffset = 2
	E.db.unitframe.units.arena.debuffs.countYOffset = 0
	E.db.unitframe.units.arena.debuffs.desaturate = true
	E.db.unitframe.units.arena.debuffs.growthX = 'LEFT'
	E.db.unitframe.units.arena.debuffs.growthY = 'DOWN'
	E.db.unitframe.units.arena.debuffs.maxDuration = 0
	E.db.unitframe.units.arena.debuffs.perrow = 5
	E.db.unitframe.units.arena.debuffs.priority = Private.isRetail and 'ImportantCC,blockNonPersonal,ClassDebuffs' or 'Blacklist,Personal,CCDebuffs'
	E.db.unitframe.units.arena.debuffs.sizeOverride = 20
	E.db.unitframe.units.arena.debuffs.xOffset = -1
	E.db.unitframe.units.arena.debuffs.yOffset = 1
	E.db.unitframe.units.arena.disableFocusGlow = true
	E.db.unitframe.units.arena.disableTargetGlow = true
	E.db.unitframe.units.arena.fader.minAlpha = 0.5
	E.db.unitframe.units.arena.fader.smooth = 0
	E.db.unitframe.units.arena.healPrediction.absorbStyle = 'WRAPPED'
	E.db.unitframe.units.arena.health.attachTextTo = 'Frame'
	E.db.unitframe.units.arena.health.text_format = ''
	E.db.unitframe.units.arena.height = 41
	E.db.unitframe.units.arena.infoPanel.height = 16
	E.db.unitframe.units.arena.middleClickFocus = true
	E.db.unitframe.units.arena.name.attachTextTo = 'Frame'
	E.db.unitframe.units.arena.name.text_format = ''
	E.db.unitframe.units.arena.orientation = 'LEFT'
	E.db.unitframe.units.arena.power.autoHide = true
	E.db.unitframe.units.arena.power.height = 4
	E.db.unitframe.units.arena.power.strataAndLevel.frameStrata = 'MEDIUM'
	E.db.unitframe.units.arena.power.strataAndLevel.useCustomStrata = true
	E.db.unitframe.units.arena.power.text_format = ''
	E.db.unitframe.units.arena.pvpclassificationindicator.size = 24
	E.db.unitframe.units.arena.pvpclassificationindicator.xOffset = -40
	E.db.unitframe.units.arena.pvpSpecIcon = false
	E.db.unitframe.units.arena.pvpTrinket.size = 41
	E.db.unitframe.units.arena.raidicon.attachTo = 'RIGHT'
	E.db.unitframe.units.arena.raidicon.size = 60
	E.db.unitframe.units.arena.raidicon.xOffset = 82
	E.db.unitframe.units.arena.raidicon.yOffset = 1
	E.db.unitframe.units.arena.spacing = 18
	E.db.unitframe.units.arena.width = 210

	-- Shared Boss
	E.db.unitframe.units.boss.customTexts = {}
	E.db.unitframe.units.boss.customTexts.Luckyone_HP = {
		attachTextTo = 'Health',
		enable = true,
		font = Private.Font,
		fontOutline = Private.Outline,
		justifyH = 'LEFT',
		size = 12,
		text_format = '[luckyone:health:percent] • [health:current:shortvalue]',
		xOffset = 3,
		yOffset = 0
	}
	E.db.unitframe.units.boss.customTexts.Luckyone_Name = {
		attachTextTo = 'Health',
		enable = true,
		font = Private.Font,
		fontOutline = Private.Outline,
		justifyH = 'RIGHT',
		size = 12,
		text_format = '[luckyone:name:last-classcolor]',
		xOffset = -3,
		yOffset = 0
	}
	E.db.unitframe.units.boss.customTexts.Luckyone_Power = {
		attachTextTo = 'Power',
		enable = true,
		font = Private.Font,
		fontOutline = Private.Outline,
		justifyH = 'CENTER',
		size = 11,
		text_format = '[luckyone:power:percent-color]',
		xOffset = 0,
		yOffset = 0
	}

	E.db.unitframe.units.boss.buffIndicator.enable = false
	E.db.unitframe.units.boss.buffs.countFont = Private.Font
	E.db.unitframe.units.boss.buffs.countFontSize = 10
	E.db.unitframe.units.boss.buffs.countPosition = 'TOPRIGHT'
	E.db.unitframe.units.boss.buffs.countXOffset = 2
	E.db.unitframe.units.boss.buffs.countYOffset = 0
	E.db.unitframe.units.boss.buffs.growthY = 'DOWN'
	E.db.unitframe.units.boss.buffs.perrow = 5
	E.db.unitframe.units.boss.buffs.priority = 'Dispellable,RaidBuffsElvUI'
	E.db.unitframe.units.boss.buffs.sizeOverride = 20
	E.db.unitframe.units.boss.buffs.xOffset = -1
	E.db.unitframe.units.boss.buffs.yOffset = -10
	E.db.unitframe.units.boss.castbar.customTextFont.enable = true
	E.db.unitframe.units.boss.castbar.customTextFont.font = Private.Font
	E.db.unitframe.units.boss.castbar.customTextFont.fontSize = 9
	E.db.unitframe.units.boss.castbar.customTimeFont.enable = true
	E.db.unitframe.units.boss.castbar.customTimeFont.font = Private.Font
	E.db.unitframe.units.boss.castbar.customTimeFont.fontSize = 9
	E.db.unitframe.units.boss.castbar.displayTargetClass = false
	E.db.unitframe.units.boss.castbar.height = 16
	E.db.unitframe.units.boss.castbar.iconAttachedTo = 'Castbar'
	E.db.unitframe.units.boss.castbar.positionsGroup.yOffset = -1
	E.db.unitframe.units.boss.castbar.strataAndLevel.useCustomLevel = true
	E.db.unitframe.units.boss.castbar.strataAndLevel.useCustomStrata = true
	E.db.unitframe.units.boss.castbar.textColor.b = 1
	E.db.unitframe.units.boss.castbar.textColor.g = 1
	E.db.unitframe.units.boss.castbar.textColor.r = 1
	E.db.unitframe.units.boss.castbar.width = 211
	E.db.unitframe.units.boss.castbar.xOffsetText = 2
	E.db.unitframe.units.boss.castbar.xOffsetTime = -2
	E.db.unitframe.units.boss.debuffs.anchorPoint = 'TOPLEFT'
	E.db.unitframe.units.boss.debuffs.countFont = Private.Font
	E.db.unitframe.units.boss.debuffs.countFontSize = 10
	E.db.unitframe.units.boss.debuffs.countPosition = 'TOPRIGHT'
	E.db.unitframe.units.boss.debuffs.countXOffset = 2
	E.db.unitframe.units.boss.debuffs.countYOffset = 0
	E.db.unitframe.units.boss.debuffs.growthX = 'LEFT'
	E.db.unitframe.units.boss.debuffs.growthY = 'DOWN'
	E.db.unitframe.units.boss.debuffs.perrow = 5
	E.db.unitframe.units.boss.debuffs.priority = Private.isRetail and 'blockNonPersonal,ClassDebuffs' or 'Blacklist,Personal'
	E.db.unitframe.units.boss.debuffs.sizeOverride = 20
	E.db.unitframe.units.boss.debuffs.xOffset = -1
	E.db.unitframe.units.boss.debuffs.yOffset = 1
	E.db.unitframe.units.boss.disableFocusGlow = true
	E.db.unitframe.units.boss.disableTargetGlow = true
	E.db.unitframe.units.boss.fader.minAlpha = 0.5
	E.db.unitframe.units.boss.fader.smooth = 0
	E.db.unitframe.units.boss.healPrediction.absorbStyle = 'WRAPPED'
	E.db.unitframe.units.boss.healPrediction.enable = true
	E.db.unitframe.units.boss.health.attachTextTo = 'Frame'
	E.db.unitframe.units.boss.health.text_format = ''
	E.db.unitframe.units.boss.height = 41
	E.db.unitframe.units.boss.middleClickFocus = true
	E.db.unitframe.units.boss.name.attachTextTo = 'Frame'
	E.db.unitframe.units.boss.name.text_format = ''
	E.db.unitframe.units.boss.orientation = 'LEFT'
	E.db.unitframe.units.boss.power.autoHide = true
	E.db.unitframe.units.boss.power.height = 4
	E.db.unitframe.units.boss.power.strataAndLevel.frameStrata = 'MEDIUM'
	E.db.unitframe.units.boss.power.strataAndLevel.useCustomStrata = true
	E.db.unitframe.units.boss.power.text_format = ''
	E.db.unitframe.units.boss.raidicon.attachTo = 'RIGHT'
	E.db.unitframe.units.boss.raidicon.size = 40
	E.db.unitframe.units.boss.raidicon.xOffset = 42
	E.db.unitframe.units.boss.raidicon.yOffset = 1
	E.db.unitframe.units.boss.spacing = 18
	E.db.unitframe.units.boss.width = 210

	-- Shared Focus
	E.db.unitframe.units.focus.customTexts = {}
	E.db.unitframe.units.focus.customTexts.Luckyone_Name = {
		attachTextTo = 'Frame',
		enable = true,
		font = Private.Font,
		fontOutline = Private.Outline,
		justifyH = 'CENTER',
		size = 12,
		text_format = '[luckyone:name:last-classcolor]',
		xOffset = 0,
		yOffset = 0
	}
	E.db.unitframe.units.focus.customTexts.Luckyone_Power = {
		attachTextTo = 'Power',
		enable = true,
		font = Private.Font,
		fontOutline = Private.Outline,
		justifyH = 'CENTER',
		size = 11,
		text_format = '[luckyone:power:percent-color]',
		xOffset = 0,
		yOffset = 0
	}

	E.db.unitframe.units.focus.buffs.anchorPoint = 'TOPRIGHT'
	E.db.unitframe.units.focus.buffs.attachTo = 'DEBUFFS'
	E.db.unitframe.units.focus.buffs.countFont = Private.Font
	E.db.unitframe.units.focus.buffs.countFontSize = 8
	E.db.unitframe.units.focus.buffs.countPosition = 'TOPRIGHT'
	E.db.unitframe.units.focus.buffs.countXOffset = 2
	E.db.unitframe.units.focus.buffs.countYOffset = 0
	E.db.unitframe.units.focus.buffs.enable = true
	E.db.unitframe.units.focus.buffs.growthX = 'LEFT'
	E.db.unitframe.units.focus.buffs.maxDuration = 0
	E.db.unitframe.units.focus.buffs.numrows = 3
	E.db.unitframe.units.focus.buffs.perrow = 12
	E.db.unitframe.units.focus.buffs.priority = 'Dispellable,RaidBuffsElvUI,Mount'
	E.db.unitframe.units.focus.buffs.yOffset = 1
	E.db.unitframe.units.focus.castbar.customTextFont.enable = true
	E.db.unitframe.units.focus.castbar.customTextFont.font = Private.Font
	E.db.unitframe.units.focus.castbar.customTimeFont.enable = true
	E.db.unitframe.units.focus.castbar.customTimeFont.font = Private.Font
	E.db.unitframe.units.focus.castbar.iconAttached = false
	E.db.unitframe.units.focus.castbar.iconAttachedTo = 'Castbar'
	E.db.unitframe.units.focus.castbar.iconSize = 40
	E.db.unitframe.units.focus.castbar.iconXOffset = 0
	E.db.unitframe.units.focus.castbar.overlayOnFrame = 'Health'
	E.db.unitframe.units.focus.castbar.textColor.b = 1
	E.db.unitframe.units.focus.castbar.textColor.g = 1
	E.db.unitframe.units.focus.castbar.textColor.r = 1
	E.db.unitframe.units.focus.castbar.timeToHold = 2
	E.db.unitframe.units.focus.castbar.width = 181
	E.db.unitframe.units.focus.castbar.xOffsetText = 2
	E.db.unitframe.units.focus.castbar.xOffsetTime = -2
	E.db.unitframe.units.focus.CombatIcon.enable = false
	E.db.unitframe.units.focus.debuffs.countFont = Private.Font
	E.db.unitframe.units.focus.debuffs.countFontSize = 8
	E.db.unitframe.units.focus.debuffs.countPosition = 'TOPRIGHT'
	E.db.unitframe.units.focus.debuffs.countXOffset = 2
	E.db.unitframe.units.focus.debuffs.countYOffset = 0
	E.db.unitframe.units.focus.debuffs.desaturate = false
	E.db.unitframe.units.focus.debuffs.maxDuration = 0
	E.db.unitframe.units.focus.debuffs.numrows = 2
	E.db.unitframe.units.focus.debuffs.perrow = 12
	E.db.unitframe.units.focus.debuffs.priority = Private.isRetail and 'ImportantCC,blockNonPersonal,ClassDebuffs' or 'Blacklist,Personal,CCDebuffs'
	E.db.unitframe.units.focus.disableMouseoverGlow = true
	E.db.unitframe.units.focus.disableTargetGlow = true
	E.db.unitframe.units.focus.fader.minAlpha = 0.5
	E.db.unitframe.units.focus.fader.smooth = 0
	E.db.unitframe.units.focus.healPrediction.absorbStyle = 'WRAPPED'
	E.db.unitframe.units.focus.height = 40
	E.db.unitframe.units.focus.name.text_format = ''
	E.db.unitframe.units.focus.orientation = 'LEFT'
	E.db.unitframe.units.focus.power.autoHide = true
	E.db.unitframe.units.focus.power.detachedWidth = 200
	E.db.unitframe.units.focus.power.height = 4
	E.db.unitframe.units.focus.raidicon.attachTo = 'RIGHT'
	E.db.unitframe.units.focus.raidicon.size = 40
	E.db.unitframe.units.focus.raidicon.xOffset = 42
	E.db.unitframe.units.focus.raidicon.yOffset = 1
	E.db.unitframe.units.focus.smartAuraPosition = 'FLUID_BUFFS_ON_DEBUFFS'
	E.db.unitframe.units.focus.threatStyle = 'NONE'
	E.db.unitframe.units.focus.width = 200

	-- Shared Pet
	E.db.unitframe.units.pet.customTexts = {}
	E.db.unitframe.units.pet.customTexts.Luckyone_Name = {
		attachTextTo = 'Frame',
		enable = true,
		font = Private.Font,
		fontOutline = Private.Outline,
		justifyH = 'CENTER',
		size = 12,
		text_format = '[luckyone:pet:name-and-happiness]',
		xOffset = 0,
		yOffset = 0
	}
	E.db.unitframe.units.pet.customTexts.Luckyone_Power = {
		attachTextTo = 'Power',
		enable = true,
		font = Private.Font,
		fontOutline = Private.Outline,
		justifyH = 'CENTER',
		size = 11,
		text_format = '[luckyone:power:percent-color]',
		xOffset = 0,
		yOffset = 0
	}

	E.db.unitframe.units.pet.castbar.enable = false
	E.db.unitframe.units.pet.disableMouseoverGlow = true
	E.db.unitframe.units.pet.fader.minAlpha = 0.5
	E.db.unitframe.units.pet.fader.smooth = 0
	E.db.unitframe.units.pet.healPrediction.absorbStyle = 'WRAPPED'
	E.db.unitframe.units.pet.health.colorHappiness = false
	E.db.unitframe.units.pet.height = 46
	E.db.unitframe.units.pet.name.text_format = ''
	E.db.unitframe.units.pet.orientation = 'LEFT'
	E.db.unitframe.units.pet.power.autoHide = true
	E.db.unitframe.units.pet.power.height = 4
	E.db.unitframe.units.pet.power.strataAndLevel.frameStrata = 'MEDIUM'
	E.db.unitframe.units.pet.power.strataAndLevel.useCustomStrata = true
	E.db.unitframe.units.pet.raidicon.enable = false
	E.db.unitframe.units.pet.threatStyle = 'NONE'
	E.db.unitframe.units.pet.width = 80

	-- Shared Player
	E.db.unitframe.units.player.customTexts = {}
	E.db.unitframe.units.player.customTexts.Luckyone_HP = {
		attachTextTo = 'Frame',
		enable = true,
		font = Private.Font,
		fontOutline = Private.Outline,
		justifyH = 'RIGHT',
		size = 12,
		text_format = '[health:current:shortvalue] • [luckyone:health:percent]',
		xOffset = -2,
		yOffset = 0
	}
	E.db.unitframe.units.player.customTexts.Luckyone_Name = {
		attachTextTo = 'Frame',
		enable = true,
		font = Private.Font,
		fontOutline = Private.Outline,
		justifyH = 'LEFT',
		size = 12,
		text_format = '[luckyone:name:last-classcolor]',
		xOffset = 5,
		yOffset = 0
	}
	E.db.unitframe.units.player.customTexts.Luckyone_Power = {
		attachTextTo = 'Power',
		enable = true,
		font = Private.Font,
		fontOutline = Private.Outline,
		justifyH = 'CENTER',
		size = 11,
		text_format = '',
		xOffset = 0,
		yOffset = 0
	}

	E.db.unitframe.units.player.aurabar.enable = false
	E.db.unitframe.units.player.buffs.attachTo = 'FRAME'
	E.db.unitframe.units.player.buffs.countFont = Private.Font
	E.db.unitframe.units.player.buffs.perrow = 10
	E.db.unitframe.units.player.buffs.priority = 'Blacklist,Personal,NonPersonal'
	E.db.unitframe.units.player.buffs.yOffset = 1
	E.db.unitframe.units.player.castbar.customColor.color.b = 0.05
	E.db.unitframe.units.player.castbar.customColor.color.g = 0.05
	E.db.unitframe.units.player.castbar.customColor.color.r = 0.05
	E.db.unitframe.units.player.castbar.customColor.colorBackdrop.a = 0.9
	E.db.unitframe.units.player.castbar.customColor.colorBackdrop.b = 0.61
	E.db.unitframe.units.player.castbar.customColor.colorBackdrop.g = 0.56
	E.db.unitframe.units.player.castbar.customColor.colorBackdrop.r = 0.54
	E.db.unitframe.units.player.castbar.customColor.colorInterrupted.b = 0.30
	E.db.unitframe.units.player.castbar.customColor.colorInterrupted.g = 0.30
	E.db.unitframe.units.player.castbar.customColor.colorInterrupted.r = 0.30
	E.db.unitframe.units.player.castbar.customColor.colorNoInterrupt.b = 0.05
	E.db.unitframe.units.player.castbar.customColor.colorNoInterrupt.g = 0.05
	E.db.unitframe.units.player.castbar.customColor.colorNoInterrupt.r = 0.05
	E.db.unitframe.units.player.castbar.customColor.enable = true
	E.db.unitframe.units.player.castbar.customColor.transparent = true
	E.db.unitframe.units.player.castbar.customColor.useCustomBackdrop = true
	E.db.unitframe.units.player.castbar.customTextFont.enable = true
	E.db.unitframe.units.player.castbar.customTextFont.font = Private.Font
	E.db.unitframe.units.player.castbar.customTextFont.fontSize = 14
	E.db.unitframe.units.player.castbar.customTimeFont.enable = true
	E.db.unitframe.units.player.castbar.customTimeFont.font = Private.Font
	E.db.unitframe.units.player.castbar.customTimeFont.fontSize = 14
	E.db.unitframe.units.player.castbar.height = 30
	E.db.unitframe.units.player.castbar.hideName = true
	E.db.unitframe.units.player.castbar.latency = false
	E.db.unitframe.units.player.castbar.spark = true
	E.db.unitframe.units.player.castbar.textColor.b = 1
	E.db.unitframe.units.player.castbar.textColor.g = 1
	E.db.unitframe.units.player.castbar.textColor.r = 1
	E.db.unitframe.units.player.castbar.tickColor.a = 1
	E.db.unitframe.units.player.castbar.tickColor.b = 1
	E.db.unitframe.units.player.castbar.tickColor.g = 1
	E.db.unitframe.units.player.castbar.tickColor.r = 1
	E.db.unitframe.units.player.castbar.tickWidth = 2
	E.db.unitframe.units.player.castbar.timeToHold = 2
	E.db.unitframe.units.player.castbar.xOffsetText = 2
	E.db.unitframe.units.player.castbar.xOffsetTime = -2
	E.db.unitframe.units.player.classbar.enable = false
	E.db.unitframe.units.player.CombatIcon.enable = false
	E.db.unitframe.units.player.debuffs.countFont = Private.Font
	E.db.unitframe.units.player.debuffs.countFontSize = 10
	E.db.unitframe.units.player.debuffs.countPosition = 'TOPRIGHT'
	E.db.unitframe.units.player.debuffs.countXOffset = 2
	E.db.unitframe.units.player.debuffs.countYOffset = 0
	E.db.unitframe.units.player.debuffs.desaturate = false
	E.db.unitframe.units.player.debuffs.enable = false
	E.db.unitframe.units.player.debuffs.numrows = 2
	E.db.unitframe.units.player.debuffs.perrow = 12
	E.db.unitframe.units.player.disableMouseoverGlow = true
	E.db.unitframe.units.player.healPrediction.absorbStyle = 'WRAPPED'
	E.db.unitframe.units.player.health.text_format = ''
	E.db.unitframe.units.player.height = 46
	E.db.unitframe.units.player.partyIndicator.enable = false
	E.db.unitframe.units.player.power.enable = false
	E.db.unitframe.units.player.power.height = 4
	E.db.unitframe.units.player.power.strataAndLevel.frameStrata = 'MEDIUM'
	E.db.unitframe.units.player.power.strataAndLevel.useCustomStrata = true
	E.db.unitframe.units.player.power.text_format = ''
	E.db.unitframe.units.player.pvp.text_format = ''
	E.db.unitframe.units.player.pvpIcon.scale = 0.85
	E.db.unitframe.units.player.raidicon.enable = false
	E.db.unitframe.units.player.raidRoleIcons.combatHide = true
	E.db.unitframe.units.player.raidRoleIcons.yOffset = 1
	E.db.unitframe.units.player.RestIcon.enable = false
	E.db.unitframe.units.player.threatStyle = 'NONE'
	E.db.unitframe.units.player.width = 260

	-- Shared Target
	E.db.unitframe.units.target.customTexts = {}
	E.db.unitframe.units.target.customTexts.Luckyone_HP = {
		attachTextTo = 'Frame',
		enable = true,
		font = Private.Font,
		fontOutline = Private.Outline,
		justifyH = 'LEFT',
		size = 12,
		text_format = '[luckyone:health:percent] • [health:current:shortvalue]',
		xOffset = 3,
		yOffset = 0
	}
	E.db.unitframe.units.target.customTexts.Luckyone_Name = {
		attachTextTo = 'Frame',
		enable = true,
		font = Private.Font,
		fontOutline = Private.Outline,
		justifyH = 'RIGHT',
		size = 12,
		text_format = '[luckyone:name:last-classcolor][ |r» >luckyone:target:last-classcolor]',
		xOffset = -3,
		yOffset = 0
	}
	E.db.unitframe.units.target.customTexts.Luckyone_Power = {
		attachTextTo = 'Power',
		enable = true,
		font = Private.Font,
		fontOutline = Private.Outline,
		justifyH = 'CENTER',
		size = 11,
		text_format = '[luckyone:power:percent-color]',
		xOffset = 0,
		yOffset = 0
	}

	E.db.unitframe.units.target.aurabar.enable = false
	E.db.unitframe.units.target.auras.enable = false
	E.db.unitframe.units.target.buffs.attachTo = 'DEBUFFS'
	E.db.unitframe.units.target.buffs.countFont = Private.Font
	E.db.unitframe.units.target.buffs.countFontSize = 10
	E.db.unitframe.units.target.buffs.countPosition = 'TOPRIGHT'
	E.db.unitframe.units.target.buffs.countXOffset = 2
	E.db.unitframe.units.target.buffs.countYOffset = 0
	E.db.unitframe.units.target.buffs.numrows = 3
	E.db.unitframe.units.target.buffs.perrow = 12
	E.db.unitframe.units.target.buffs.priority = 'Dispellable,RaidBuffsElvUI,Mount'
	E.db.unitframe.units.target.buffs.yOffset = 1
	E.db.unitframe.units.target.castbar.customTextFont.enable = true
	E.db.unitframe.units.target.castbar.customTextFont.font = Private.Font
	E.db.unitframe.units.target.castbar.customTextFont.fontSize = 11
	E.db.unitframe.units.target.castbar.customTimeFont.enable = true
	E.db.unitframe.units.target.castbar.customTimeFont.font = Private.Font
	E.db.unitframe.units.target.castbar.customTimeFont.fontSize = 11
	E.db.unitframe.units.target.castbar.height = 20
	E.db.unitframe.units.target.castbar.strataAndLevel.useCustomLevel = true
	E.db.unitframe.units.target.castbar.strataAndLevel.useCustomStrata = true
	E.db.unitframe.units.target.castbar.textColor.b = 1
	E.db.unitframe.units.target.castbar.textColor.g = 1
	E.db.unitframe.units.target.castbar.textColor.r = 1
	E.db.unitframe.units.target.castbar.timeToHold = 2
	E.db.unitframe.units.target.castbar.width = 261
	E.db.unitframe.units.target.castbar.xOffsetText = 2
	E.db.unitframe.units.target.castbar.xOffsetTime = -2
	E.db.unitframe.units.target.CombatIcon.enable = false
	E.db.unitframe.units.target.debuffs.attachTo = 'FRAME'
	E.db.unitframe.units.target.debuffs.countFont = Private.Font
	E.db.unitframe.units.target.debuffs.countFontSize = 10
	E.db.unitframe.units.target.debuffs.countPosition = 'TOPRIGHT'
	E.db.unitframe.units.target.debuffs.countXOffset = 2
	E.db.unitframe.units.target.debuffs.countYOffset = 0
	E.db.unitframe.units.target.debuffs.desaturate = false
	E.db.unitframe.units.target.debuffs.maxDuration = 0
	E.db.unitframe.units.target.debuffs.numrows = 2
	E.db.unitframe.units.target.debuffs.perrow = 12
	E.db.unitframe.units.target.debuffs.priority = Private.isRetail and 'ImportantCC,blockNonPersonal,ClassDebuffs' or 'Blacklist,Personal'
	E.db.unitframe.units.target.disableMouseoverGlow = true
	E.db.unitframe.units.target.fader.minAlpha = 0.5
	E.db.unitframe.units.target.fader.smooth = 0
	E.db.unitframe.units.target.healPrediction.absorbStyle = 'WRAPPED'
	E.db.unitframe.units.target.health.text_format = ''
	E.db.unitframe.units.target.height = 46
	E.db.unitframe.units.target.middleClickFocus = false
	E.db.unitframe.units.target.name.text_format = ''
	E.db.unitframe.units.target.orientation = 'LEFT'
	E.db.unitframe.units.target.phaseIndicator.scale = 0.5
	E.db.unitframe.units.target.power.autoHide = true
	E.db.unitframe.units.target.power.detachedWidth = 260
	E.db.unitframe.units.target.power.height = 4
	E.db.unitframe.units.target.power.strataAndLevel.frameStrata = 'MEDIUM'
	E.db.unitframe.units.target.power.strataAndLevel.useCustomStrata = true
	E.db.unitframe.units.target.power.text_format = ''
	E.db.unitframe.units.target.raidicon.attachTo = 'RIGHT'
	E.db.unitframe.units.target.raidicon.size = 40
	E.db.unitframe.units.target.raidicon.xOffset = 42
	E.db.unitframe.units.target.raidicon.yOffset = 1
	E.db.unitframe.units.target.raidRoleIcons.combatHide = true
	E.db.unitframe.units.target.raidRoleIcons.position = 'TOPRIGHT'
	E.db.unitframe.units.target.raidRoleIcons.yOffset = 1
	E.db.unitframe.units.target.smartAuraPosition = 'FLUID_BUFFS_ON_DEBUFFS'
	E.db.unitframe.units.target.threatStyle = 'NONE'
	E.db.unitframe.units.target.width = 260

	-- Shared TargetTarget
	E.db.unitframe.units.targettarget.customTexts = {}
	E.db.unitframe.units.targettarget.customTexts.Luckyone_Name = {
		attachTextTo = 'Frame',
		enable = true,
		font = Private.Font,
		fontOutline = Private.Outline,
		justifyH = 'CENTER',
		size = 12,
		text_format = '[luckyone:name:last-classcolor]',
		xOffset = 0,
		yOffset = 0
	}

	E.db.unitframe.units.targettarget.enable = false
	E.db.unitframe.units.targettarget.debuffs.enable = false
	E.db.unitframe.units.targettarget.disableMouseoverGlow = true
	E.db.unitframe.units.targettarget.fader.minAlpha = 0.5
	E.db.unitframe.units.targettarget.fader.smooth = 0
	E.db.unitframe.units.targettarget.healPrediction.absorbStyle = 'WRAPPED'
	E.db.unitframe.units.targettarget.healPrediction.enable = true
	E.db.unitframe.units.targettarget.height = 24
	E.db.unitframe.units.targettarget.name.text_format = ''
	E.db.unitframe.units.targettarget.orientation = 'LEFT'
	E.db.unitframe.units.targettarget.power.enable = false
	E.db.unitframe.units.targettarget.raidicon.enable = false

	-- Shared Raidpet
	E.db.unitframe.units.raidpet.buffIndicator.countFont = Private.Font
	E.db.unitframe.units.raidpet.buffIndicator.countFontSize = 10
	E.db.unitframe.units.raidpet.buffIndicator.enable = true
	E.db.unitframe.units.raidpet.buffIndicator.size = 6
	E.db.unitframe.units.raidpet.classbar.enable = false
	E.db.unitframe.units.raidpet.debuffs.countFont = Private.Font
	E.db.unitframe.units.raidpet.debuffs.desaturate = false
	E.db.unitframe.units.raidpet.debuffs.maxDuration = 0
	E.db.unitframe.units.raidpet.debuffs.priority = 'Dispellable,RaidDebuffs'
	E.db.unitframe.units.raidpet.disableFocusGlow = true
	E.db.unitframe.units.raidpet.disableTargetGlow = true
	E.db.unitframe.units.raidpet.enable = Private.isClassic
	E.db.unitframe.units.raidpet.healPrediction.absorbStyle = 'WRAPPED'
	E.db.unitframe.units.raidpet.healPrediction.enable = true
	E.db.unitframe.units.raidpet.health.text_format = ''
	E.db.unitframe.units.raidpet.horizontalSpacing = 1
	E.db.unitframe.units.raidpet.name.attachTextTo = 'Frame'
	E.db.unitframe.units.raidpet.name.text_format = '[luckyone:name:veryshort-classcolor]'
	E.db.unitframe.units.raidpet.numGroups = 2
	E.db.unitframe.units.raidpet.phaseIndicator.anchorPoint = 'LEFT'
	E.db.unitframe.units.raidpet.phaseIndicator.scale = 0.5
	E.db.unitframe.units.raidpet.power.enable = false
	E.db.unitframe.units.raidpet.raidicon.attachTo = 'TOPRIGHT'
	E.db.unitframe.units.raidpet.raidicon.attachToObject = 'Health'
	E.db.unitframe.units.raidpet.raidicon.size = 12
	E.db.unitframe.units.raidpet.raidicon.xOffset = 1
	E.db.unitframe.units.raidpet.raidicon.yOffset = 1
	E.db.unitframe.units.raidpet.raidRoleIcons.scale = 0.8
	E.db.unitframe.units.raidpet.raidRoleIcons.yOffset = 1
	E.db.unitframe.units.raidpet.raidWideSorting = false
	E.db.unitframe.units.raidpet.rdebuffs.font = Private.Font
	E.db.unitframe.units.raidpet.rdebuffs.fontSize = 9
	E.db.unitframe.units.raidpet.rdebuffs.size = 14
	E.db.unitframe.units.raidpet.rdebuffs.stack.position = 'CENTER'
	E.db.unitframe.units.raidpet.rdebuffs.stack.xOffset = -10
	E.db.unitframe.units.raidpet.rdebuffs.stack.yOffset = 0
	E.db.unitframe.units.raidpet.rdebuffs.xOffset = 38
	E.db.unitframe.units.raidpet.rdebuffs.yOffset = 8
	E.db.unitframe.units.raidpet.readycheckIcon.position = 'RIGHT'
	E.db.unitframe.units.raidpet.readycheckIcon.yOffset = 0
	E.db.unitframe.units.raidpet.resurrectIcon.attachTo = 'RIGHT'
	E.db.unitframe.units.raidpet.resurrectIcon.size = 18
	E.db.unitframe.units.raidpet.roleIcon.attachTo = 'Frame'
	E.db.unitframe.units.raidpet.roleIcon.damager = false
	E.db.unitframe.units.raidpet.roleIcon.position = 'LEFT'
	E.db.unitframe.units.raidpet.roleIcon.size = 12
	E.db.unitframe.units.raidpet.roleIcon.xOffset = 0
	E.db.unitframe.units.raidpet.roleIcon.yOffset = 0
	E.db.unitframe.units.raidpet.summonIcon.attachTo = 'RIGHT'
	E.db.unitframe.units.raidpet.summonIcon.size = 18
	E.db.unitframe.units.raidpet.threatStyle = 'NONE'
	E.db.unitframe.units.raidpet.verticalSpacing = 1
	E.db.unitframe.units.raidpet.width = 92

	-- Shared growth directions
	E.db.unitframe.units.raidpet.growthDirection = 'RIGHT_DOWN'
	E.db.unitframe.units.raid1.growthDirection = 'RIGHT_DOWN'
	E.db.unitframe.units.raid2.growthDirection = 'RIGHT_DOWN'
	E.db.unitframe.units.raid3.growthDirection = 'RIGHT_DOWN'

	-- Shared Party
	E.db.unitframe.units.party.customTexts = {}
	E.db.unitframe.units.party.customTexts.Luckyone_Name = {
		attachTextTo = 'Health',
		enable = true,
		font = Private.Font,
		fontOutline = Private.Outline,
		justifyH = 'CENTER',
		size = 12,
		text_format = '',
		xOffset = 0,
		yOffset = 0
	}

	E.db.unitframe.units.party.classbar.enable = false
	E.db.unitframe.units.party.debuffs.enable = false
	E.db.unitframe.units.party.debuffs.priority = 'Dispellable,RaidDebuffs'
	E.db.unitframe.units.party.disableFocusGlow = true
	E.db.unitframe.units.party.disableTargetGlow = true
	E.db.unitframe.units.party.fader.minAlpha = 0.5
	E.db.unitframe.units.party.fader.smooth = 0
	E.db.unitframe.units.party.growthDirection = 'DOWN_RIGHT'
	E.db.unitframe.units.party.healPrediction.absorbStyle = 'WRAPPED'
	E.db.unitframe.units.party.healPrediction.enable = true
	E.db.unitframe.units.party.health.text_format = ''
	E.db.unitframe.units.party.height = 40
	E.db.unitframe.units.party.horizontalSpacing = 1
	E.db.unitframe.units.party.name.text_format = ''
	E.db.unitframe.units.party.phaseIndicator.anchorPoint = 'LEFT'
	E.db.unitframe.units.party.phaseIndicator.scale = 0.5
	E.db.unitframe.units.party.phaseIndicator.xOffset = 15
	E.db.unitframe.units.party.power.enable = false
	E.db.unitframe.units.party.raidRoleIcons.combatHide = true
	E.db.unitframe.units.party.raidRoleIcons.yOffset = 1
	E.db.unitframe.units.party.rdebuffs.enable = false
	E.db.unitframe.units.party.readycheckIcon.attachTo = 'Frame'
	E.db.unitframe.units.party.readycheckIcon.position = 'RIGHT'
	E.db.unitframe.units.party.readycheckIcon.xOffset = -2
	E.db.unitframe.units.party.readycheckIcon.yOffset = 0
	E.db.unitframe.units.party.summonIcon.attachTo = 'RIGHT'
	E.db.unitframe.units.party.summonIcon.size = 24
	E.db.unitframe.units.party.summonIcon.xOffset = -15
	E.db.unitframe.units.party.threatStyle = 'NONE'
	E.db.unitframe.units.party.verticalSpacing = 1
	E.db.unitframe.units.party.width = 210

	-- Shared Raid1
	E.db.unitframe.units.raid1.buffIndicator.countFont = Private.Font
	E.db.unitframe.units.raid1.buffIndicator.countFontSize = 10
	E.db.unitframe.units.raid1.buffIndicator.size = 6
	E.db.unitframe.units.raid1.classbar.enable = false
	E.db.unitframe.units.raid1.debuffs.priority = 'Dispellable,RaidDebuffs'
	E.db.unitframe.units.raid1.disableFocusGlow = true
	E.db.unitframe.units.raid1.disableTargetGlow = true
	E.db.unitframe.units.raid1.fader.minAlpha = 0.5
	E.db.unitframe.units.raid1.fader.smooth = 0
	E.db.unitframe.units.raid1.healPrediction.absorbStyle = 'WRAPPED'
	E.db.unitframe.units.raid1.healPrediction.enable = true
	E.db.unitframe.units.raid1.health.text_format = ''
	E.db.unitframe.units.raid1.horizontalSpacing = 1
	E.db.unitframe.units.raid1.name.attachTextTo = 'Frame'
	E.db.unitframe.units.raid1.name.text_format = '[luckyone:name:veryshort-classcolor]'
	E.db.unitframe.units.raid1.numGroups = 4
	E.db.unitframe.units.raid1.phaseIndicator.anchorPoint = 'TOP'
	E.db.unitframe.units.raid1.phaseIndicator.scale = 0.5
	E.db.unitframe.units.raid1.power.enable = false
	E.db.unitframe.units.raid1.pvpclassificationindicator.enable = false
	E.db.unitframe.units.raid1.raidRoleIcons.combatHide = true
	E.db.unitframe.units.raid1.raidRoleIcons.scale = 0.8
	E.db.unitframe.units.raid1.raidRoleIcons.yOffset = 1
	E.db.unitframe.units.raid1.readycheckIcon.position = 'TOP'
	E.db.unitframe.units.raid1.readycheckIcon.size = 14
	E.db.unitframe.units.raid1.readycheckIcon.yOffset = 0
	E.db.unitframe.units.raid1.resurrectIcon.attachTo = 'RIGHT'
	E.db.unitframe.units.raid1.resurrectIcon.size = 18
	E.db.unitframe.units.raid1.roleIcon.attachTo = 'Frame'
	E.db.unitframe.units.raid1.roleIcon.damager = false
	E.db.unitframe.units.raid1.roleIcon.position = 'LEFT'
	E.db.unitframe.units.raid1.roleIcon.xOffset = 0
	E.db.unitframe.units.raid1.roleIcon.yOffset = 0
	E.db.unitframe.units.raid1.summonIcon.attachTo = 'RIGHT'
	E.db.unitframe.units.raid1.summonIcon.size = 18
	E.db.unitframe.units.raid1.threatStyle = 'NONE'
	E.db.unitframe.units.raid1.verticalSpacing = 1
	E.db.unitframe.units.raid1.visibility = Private.isRetail and '[@raid6,noexists][@raid21,exists] hide;show' or '[@raid6,noexists][@raid11,exists] hide;show'

	-- Shared Raid2
	E:CopyTable(E.db.unitframe.units.raid2, E.db.unitframe.units.raid1)
	E.db.unitframe.units.raid2.numGroups = Private.isRetail and 6 or 5
	E.db.unitframe.units.raid2.visibility = Private.isRetail and '[@raid21,noexists][@raid31,exists] hide;show' or '[@raid11,noexists][@raid26,exists] hide;show'

	-- Shared Raid3
	E.db.unitframe.units.raid3.buffIndicator.countFont = Private.Font
	E.db.unitframe.units.raid3.buffIndicator.countFontSize = 10
	E.db.unitframe.units.raid3.buffIndicator.size = 6
	E.db.unitframe.units.raid3.classbar.enable = false
	E.db.unitframe.units.raid3.debuffs.countFont = Private.Font
	E.db.unitframe.units.raid3.debuffs.desaturate = false
	E.db.unitframe.units.raid3.debuffs.maxDuration = 0
	E.db.unitframe.units.raid3.debuffs.priority = 'Dispellable,RaidDebuffs'
	E.db.unitframe.units.raid3.disableFocusGlow = true
	E.db.unitframe.units.raid3.disableTargetGlow = true
	E.db.unitframe.units.raid3.fader.minAlpha = 0.5
	E.db.unitframe.units.raid3.fader.smooth = 0
	E.db.unitframe.units.raid3.healPrediction.absorbStyle = 'WRAPPED'
	E.db.unitframe.units.raid3.health.text_format = ''
	E.db.unitframe.units.raid3.horizontalSpacing = 1
	E.db.unitframe.units.raid3.name.attachTextTo = 'Frame'
	E.db.unitframe.units.raid3.name.text_format = '[luckyone:name:veryshort-classcolor]'
	E.db.unitframe.units.raid3.phaseIndicator.anchorPoint = 'LEFT'
	E.db.unitframe.units.raid3.phaseIndicator.scale = 0.5
	E.db.unitframe.units.raid3.pvpclassificationindicator.enable = false
	E.db.unitframe.units.raid3.raidRoleIcons.combatHide = true
	E.db.unitframe.units.raid3.raidRoleIcons.scale = 0.8
	E.db.unitframe.units.raid3.raidRoleIcons.yOffset = 1
	E.db.unitframe.units.raid3.readycheckIcon.position = 'RIGHT'
	E.db.unitframe.units.raid3.readycheckIcon.yOffset = 0
	E.db.unitframe.units.raid3.resurrectIcon.attachTo = 'RIGHT'
	E.db.unitframe.units.raid3.resurrectIcon.size = 18
	E.db.unitframe.units.raid3.summonIcon.attachTo = 'RIGHT'
	E.db.unitframe.units.raid3.summonIcon.size = 18
	E.db.unitframe.units.raid3.threatStyle = 'NONE'
	E.db.unitframe.units.raid3.verticalSpacing = 1
	E.db.unitframe.units.raid3.visibility = Private.isRetail and '[@raid31,noexists] hide;show' or '[@raid26,noexists] hide;show'

	-- Shared movers
	E.db.movers.AddonCompartmentMover = 'TOPRIGHT,ElvUIParent,TOPRIGHT,-3,-66'
	E.db.movers.AlertFrameMover = 'TOP,ElvUIParent,TOP,0,-202'
	E.db.movers.AltPowerBarMover = 'TOP,ElvUIParent,TOP,0,-22'
	E.db.movers.ArenaHeaderMover = (scaled and 'TOPRIGHT,ElvUIParent,TOPRIGHT,-200,-330') or 'TOPRIGHT,ElvUIParent,TOPRIGHT,-420,-240'
	E.db.movers.BagsMover = 'BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-416,1'
	E.db.movers.BelowMinimapContainerMover = 'TOPRIGHT,ElvUIParent,TOPRIGHT,-176,-173'
	E.db.movers.BNETMover = (scaled and 'BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,1,156') or 'BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,1,190'
	E.db.movers.BossBannerMover = 'TOP,ElvUIParent,TOP,0,-202'
	E.db.movers.BossHeaderMover = (scaled and 'BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-200,296') or 'TOPRIGHT,ElvUIParent,TOPRIGHT,-420,-240'
	E.db.movers.BuffsMover = 'TOPRIGHT,ElvUIParent,TOPRIGHT,-176,-1'
	E.db.movers.DebuffsMover = 'TOPRIGHT,ElvUIParent,TOPRIGHT,-176,-104'
	E.db.movers.DTPanelLuckyone_ActionBars_DTMover = 'BOTTOM,ElvUIParent,BOTTOM,0,1'
	E.db.movers.DTPanelLuckyone_MiniMap_DTMover = 'TOPRIGHT,ElvUIParent,TOPRIGHT,-56,-156'
	E.db.movers.DurabilityFrameMover = 'BOTTOM,ElvUIParent,BOTTOM,204,1'
	E.db.movers.ElvAB_1 = 'BOTTOM,ElvUIParent,BOTTOM,0,14'
	E.db.movers.ElvAB_2 = (scaled and 'BOTTOM,ElvUIParent,BOTTOM,0,64') or 'BOTTOM,ElvUIParent,BOTTOM,0,72'
	E.db.movers.ElvAB_3 = (scaled and 'BOTTOM,ElvUIParent,BOTTOM,0,39') or 'BOTTOM,ElvUIParent,BOTTOM,0,43'
	E.db.movers.ElvAB_4 = (scaled and 'BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,406,1') or 'BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,466,1'
	E.db.movers.ElvAB_5 = (scaled and 'TOPRIGHT,ElvUIParent,TOPRIGHT,-1,-390') or 'TOPRIGHT,ElvUIParent,TOPRIGHT,-1,-546'
	E.db.movers.ElvAB_6 = 'TOPLEFT,ElvUIParent,TOPLEFT,1,-541'
	E.db.movers.ElvAB_7 = 'TOPLEFT,ElvUIParent,TOPLEFT,1,-512'
	E.db.movers.ElvAB_8 = 'TOPLEFT,ElvUIParent,TOPLEFT,1,-483'
	E.db.movers.ElvAB_9 = 'TOPLEFT,ElvUIParent,TOPLEFT,1,-454'
	E.db.movers.ElvAB_10 = 'TOPLEFT,ElvUIParent,TOPLEFT,1,-425'
	E.db.movers.ElvAB_13 = 'TOPLEFT,ElvUIParent,TOPLEFT,1,-396'
	E.db.movers.ElvAB_14 = 'TOPLEFT,ElvUIParent,TOPLEFT,1,-367'
	E.db.movers.ElvAB_15 = 'TOPLEFT,ElvUIParent,TOPLEFT,1,-338'
	E.db.movers.ElvUIBagMover = (scaled and 'BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-1,156') or 'BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-1,192'
	E.db.movers.ElvUIBankMover = (scaled and 'BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,1,156') or 'BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,1,190'
	E.db.movers.EventToastMover = 'TOP,ElvUIParent,TOP,0,-100'
	E.db.movers.ExperienceBarMover = 'TOP,ElvUIParent,TOP,0,-1'
	E.db.movers.FocusPowerBarMover = 'BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-660,580'
	E.db.movers.GMMover = 'TOPRIGHT,ElvUIParent,TOPRIGHT,-453,-1'
	E.db.movers.LeftChatMover = 'BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,1,1'
	E.db.movers.LootFrameMover = 'TOP,ElvUIParent,TOP,0,-88'
	E.db.movers.LossControlMover = (scaled and 'TOP,ElvUIParent,TOP,0,-460') or 'TOP,ElvUIParent,TOP,0,-640'
	E.db.movers.MicrobarMover = 'TOPLEFT,ElvUIParent,TOPLEFT,1,-1'
	E.db.movers.MinimapMover = 'TOPRIGHT,ElvUIParent,TOPRIGHT,-1,-1'
	E.db.movers.MirrorTimer1Mover = 'TOP,ElvUIParent,TOP,0,-60'
	E.db.movers.MirrorTimer2Mover = 'TOP,ElvUIParent,TOP,0,-79'
	E.db.movers.MirrorTimer3Mover = 'TOP,ElvUIParent,TOP,0,-98'
	E.db.movers.ObjectiveFrameMover = 'TOPRIGHT,ElvUIParent,TOPRIGHT,-120,-230'
	E.db.movers.PetAB = (scaled and 'BOTTOM,ElvUIParent,BOTTOM,0,89') or 'BOTTOM,ElvUIParent,BOTTOM,0,101'
	E.db.movers.PrivateRaidWarningMover = 'TOP,ElvUIParent,TOP,0,-200'
	E.db.movers.QuestTimerFrameMover = 'TOP,ElvUIParent,TOP,0,-24'
	E.db.movers.QuestWatchFrameMover = 'TOPRIGHT,ElvUIParent,TOPRIGHT,-120,-230'
	E.db.movers.QueueStatusMover = Private.isRetail and 'TOPRIGHT,ElvUIParent,TOPRIGHT,-6,-152' or 'TOPRIGHT,ElvUIParent,TOPRIGHT,-6,-150'
	E.db.movers.ReputationBarMover = (scaled and 'BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-402,1') or 'BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-466,1'
	E.db.movers.RightChatMover = 'BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-1,1'
	E.db.movers.ShiftAB = 'TOPLEFT,ElvUIParent,TOPLEFT,232,-1'
	E.db.movers.TooltipMover = (scaled and 'BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-1,118') or 'BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-1,154'
	E.db.movers.TopCenterContainerMover = 'TOP,ElvUIParent,TOP,0,-80'
	E.db.movers.UIErrorsFrameMover = 'TOP,ElvUIParent,TOP,0,-117'
	E.db.movers.VehicleSeatMover = Private.isRetail and 'BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,427,1' or 'BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,493,1'
	E.db.movers.VOICECHAT = 'TOPLEFT,ElvUIParent,TOPLEFT,1,-30'

	E:SaveMoverPosition('DTPanelLuckyone_ActionBars_DTMover')
	E:SaveMoverPosition('DTPanelLuckyone_MiniMap_DTMover')

	if layout == 'main' then

		-- Main growth direction
		E.db.unitframe.units.party.growthDirection = 'DOWN_RIGHT'

		-- Main Player
		E.db.unitframe.units.player.customTexts.Luckyone_Power.text_format = '[luckyone:power:percent-color]'
		E.db.unitframe.units.player.castbar.width = 279
		E.db.unitframe.units.player.power.autoHide = true

		-- Main TargetTarget
		E.db.unitframe.units.targettarget.width = 278

		-- Main Party
		E.db.unitframe.units.party.customTexts.Luckyone_Name.text_format = not Private.isClassic and '[luckyone:name:short-classcolor]|r[ - >luckyone:healermana:percent]' or '[luckyone:name:short-classcolor]'
		E.db.unitframe.units.party.debuffs.countFont = Private.Font
		E.db.unitframe.units.party.debuffs.countXOffset = 2
		E.db.unitframe.units.party.debuffs.enable = true
		E.db.unitframe.units.party.debuffs.maxDuration = 0
		E.db.unitframe.units.party.debuffs.perrow = 2
		E.db.unitframe.units.party.debuffs.sizeOverride = 40
		E.db.unitframe.units.party.debuffs.xOffset = 1
		E.db.unitframe.units.party.debuffs.yOffset = -1
		E.db.unitframe.units.party.raidicon.attachTo = 'RIGHT'
		E.db.unitframe.units.party.raidicon.size = 14
		E.db.unitframe.units.party.raidicon.xOffset = -3
		E.db.unitframe.units.party.raidicon.yOffset = 0
		E.db.unitframe.units.party.roleIcon.damager = false
		E.db.unitframe.units.party.roleIcon.position = 'LEFT'
		E.db.unitframe.units.party.roleIcon.size = 14
		E.db.unitframe.units.party.roleIcon.xOffset = 0
		E.db.unitframe.units.party.showPlayer = false
		E.db.unitframe.units.party.width = 210

		-- Main Party (Classic Only)
		if Private.isClassic then
			E.db.unitframe.units.party.customTexts.Luckyone_Power = {
				attachTextTo = 'Power',
				enable = true,
				font = Private.Font,
				fontOutline = Private.Outline,
				justifyH = 'CENTER',
				size = 11,
				text_format = '[luckyone:power:percent-color<%]',
				xOffset = 88,
				yOffset = 20
			}
			E.db.unitframe.units.party.power.autoHide = true
			E.db.unitframe.units.party.power.enable = true
			E.db.unitframe.units.party.power.height = 4
			E.db.unitframe.units.party.power.text_format = ''
		end

		-- Main Raid1
		E.db.unitframe.units.raid1.height = 40
		E.db.unitframe.units.raid1.raidicon.attachTo = 'TOPRIGHT'
		E.db.unitframe.units.raid1.raidicon.attachToObject = 'Health'
		E.db.unitframe.units.raid1.raidicon.size = 12
		E.db.unitframe.units.raid1.raidicon.xOffset = 1
		E.db.unitframe.units.raid1.raidicon.yOffset = 1
		E.db.unitframe.units.raid1.rdebuffs.font = Private.Font
		E.db.unitframe.units.raid1.rdebuffs.fontSize = 9
		E.db.unitframe.units.raid1.rdebuffs.size = 14
		E.db.unitframe.units.raid1.rdebuffs.stack.position = 'CENTER'
		E.db.unitframe.units.raid1.rdebuffs.stack.xOffset = -10
		E.db.unitframe.units.raid1.rdebuffs.stack.yOffset = 0
		E.db.unitframe.units.raid1.rdebuffs.xOffset = (scaled and 32) or 38
		E.db.unitframe.units.raid1.rdebuffs.yOffset = 13
		E.db.unitframe.units.raid1.roleIcon.size = 12
		E.db.unitframe.units.raid1.width = (scaled and 80) or 92

		-- Main Raid2
		E.db.unitframe.units.raid2.height = 40
		E.db.unitframe.units.raid2.raidicon.attachTo = 'TOPRIGHT'
		E.db.unitframe.units.raid2.raidicon.attachToObject = 'Health'
		E.db.unitframe.units.raid2.raidicon.size = 12
		E.db.unitframe.units.raid2.raidicon.xOffset = 1
		E.db.unitframe.units.raid2.raidicon.yOffset = 1
		E.db.unitframe.units.raid2.rdebuffs.font = Private.Font
		E.db.unitframe.units.raid2.rdebuffs.fontSize = 9
		E.db.unitframe.units.raid2.rdebuffs.size = 14
		E.db.unitframe.units.raid2.rdebuffs.stack.position = 'CENTER'
		E.db.unitframe.units.raid2.rdebuffs.stack.xOffset = -10
		E.db.unitframe.units.raid2.rdebuffs.stack.yOffset = 0
		E.db.unitframe.units.raid2.rdebuffs.xOffset = (scaled and 32) or 38
		E.db.unitframe.units.raid2.rdebuffs.yOffset = 13
		E.db.unitframe.units.raid2.roleIcon.size = 12
		E.db.unitframe.units.raid2.width = (scaled and 80) or 92

		-- Main Raid3
		E.db.unitframe.units.raid3.height = 30
		E.db.unitframe.units.raid3.raidicon.attachTo = 'TOPRIGHT'
		E.db.unitframe.units.raid3.raidicon.attachToObject = 'Health'
		E.db.unitframe.units.raid3.raidicon.size = 12
		E.db.unitframe.units.raid3.raidicon.xOffset = 1
		E.db.unitframe.units.raid3.raidicon.yOffset = 1
		E.db.unitframe.units.raid3.rdebuffs.enable = true
		E.db.unitframe.units.raid3.rdebuffs.font = Private.Font
		E.db.unitframe.units.raid3.rdebuffs.fontSize = 9
		E.db.unitframe.units.raid3.rdebuffs.size = 14
		E.db.unitframe.units.raid3.rdebuffs.stack.position = 'CENTER'
		E.db.unitframe.units.raid3.rdebuffs.stack.xOffset = -10
		E.db.unitframe.units.raid3.rdebuffs.stack.yOffset = 0
		E.db.unitframe.units.raid3.rdebuffs.xOffset = (scaled and 32) or 38
		E.db.unitframe.units.raid3.rdebuffs.yOffset = 8
		E.db.unitframe.units.raid3.roleIcon.attachTo = 'Frame'
		E.db.unitframe.units.raid3.roleIcon.damager = false
		E.db.unitframe.units.raid3.roleIcon.enable = true
		E.db.unitframe.units.raid3.roleIcon.position = 'LEFT'
		E.db.unitframe.units.raid3.roleIcon.size = 12
		E.db.unitframe.units.raid3.roleIcon.xOffset = 0
		E.db.unitframe.units.raid3.roleIcon.yOffset = 0
		E.db.unitframe.units.raid3.width = (scaled and 80) or 92

		-- Main misc
		E.global.datatexts.customPanels.Luckyone_ActionBars_DT.width = (scaled and 299) or 347

		-- Main movers
		E.db.movers.BossButton = (scaled and 'BOTTOM,ElvUIParent,BOTTOM,-230,146') or 'BOTTOM,ElvUIParent,BOTTOM,-260,209'
		E.db.movers.ElvUF_FocusMover = (scaled and 'BOTTOM,ElvUIParent,BOTTOM,318,459') or 'BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-660,580'
		E.db.movers.ElvUF_PartyMover = (scaled and 'TOPLEFT,ElvUIParent,TOPLEFT,300,-300') or 'TOPLEFT,ElvUIParent,TOPLEFT,600,-480'
		E.db.movers.ElvUF_PetMover = (scaled and 'BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,461,324') or 'BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,781,474'
		E.db.movers.ElvUF_PlayerCastbarMover = (scaled and 'BOTTOM,ElvUIParent,BOTTOM,0,266') or 'BOTTOM,ElvUIParent,BOTTOM,0,416'
		E.db.movers.ElvUF_PlayerMover = (scaled and 'BOTTOM,ElvUIParent,BOTTOM,-288,324') or 'BOTTOM,ElvUIParent,BOTTOM,-288,474'
		E.db.movers.ElvUF_Raid1Mover = (scaled and 'BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,1,156') or 'BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,1,190'
		E.db.movers.ElvUF_Raid2Mover = (scaled and 'BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,1,156') or 'BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,1,190'
		E.db.movers.ElvUF_Raid3Mover = (scaled and 'BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,1,156') or 'BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,1,190'
		E.db.movers.ElvUF_RaidpetMover = 'BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,1,438'
		E.db.movers.ElvUF_TargetCastbarMover = (scaled and 'BOTTOM,ElvUIParent,BOTTOM,288,303') or 'BOTTOM,ElvUIParent,BOTTOM,288,453'
		E.db.movers.ElvUF_TargetMover = (scaled and 'BOTTOM,ElvUIParent,BOTTOM,288,324') or 'BOTTOM,ElvUIParent,BOTTOM,288,474'
		E.db.movers.ElvUF_TargetTargetMover = (scaled and 'BOTTOM,ElvUIParent,BOTTOM,0,272') or 'BOTTOM,ElvUIParent,BOTTOM,0,422'
		E.db.movers.PowerBarContainerMover = (scaled and 'BOTTOM,ElvUIParent,BOTTOM,0,226') or 'BOTTOM,ElvUIParent,BOTTOM,0,376'
		E.db.movers.PrivateAurasMover = (scaled and 'TOPRIGHT,ElvUIParent,TOPRIGHT,-542,-422') or 'TOP,ElvUIParent,TOP,330,-408'
		E.db.movers.VehicleLeaveButton = (scaled and 'BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,543,416') or 'BOTTOM,ElvUIParent,BOTTOM,-401,566'
		E.db.movers.ZoneAbility = (scaled and 'BOTTOM,ElvUIParent,BOTTOM,230,146') or 'BOTTOM,ElvUIParent,BOTTOM,260,209'

	elseif layout == 'healing' then

		-- Healing growth direction
		E.db.unitframe.units.party.growthDirection = 'RIGHT_DOWN'

		-- Healing Player
		E.db.unitframe.units.player.customTexts.Luckyone_Power.text_format = Private.isRetail and '[luckyone:power:percent-nocolor<%]' or '[curpp< • ][luckyone:power:percent-nocolor<%]'
		E.db.unitframe.units.player.castbar.width = (scaled and 505) or 605
		E.db.unitframe.units.player.power.attachTextTo = 'Power'
		E.db.unitframe.units.player.power.autoHide = false
		E.db.unitframe.units.player.power.detachedWidth = 260
		E.db.unitframe.units.player.power.detachFromFrame = true
		E.db.unitframe.units.player.power.enable = true
		E.db.unitframe.units.player.power.height = 18
		E.db.unitframe.units.player.power.position = 'CENTER'
		E.db.unitframe.units.player.power.powerPrediction = true

		if Private.isClassic then
			E.db.unitframe.units.player.power.EnergyManaRegen = true
		end

		-- Healing TargetTarget
		E.db.unitframe.units.targettarget.width = 260

		-- Healing Party
		E.db.unitframe.units.party.customTexts.Luckyone_Name.text_format = '[luckyone:name:short-classcolor]'
		E.db.unitframe.units.party.buffIndicator.size = 14
		E.db.unitframe.units.party.debuffs.enable = false
		E.db.unitframe.units.party.height = 65
		E.db.unitframe.units.party.raidicon.attachTo = 'RIGHT'
		E.db.unitframe.units.party.raidicon.size = 14
		E.db.unitframe.units.party.raidicon.xOffset = -2
		E.db.unitframe.units.party.raidicon.yOffset = 0
		E.db.unitframe.units.party.rdebuffs.enable = true
		E.db.unitframe.units.party.rdebuffs.font = Private.Font
		E.db.unitframe.units.party.rdebuffs.fontSize = 9
		E.db.unitframe.units.party.rdebuffs.size = 18
		E.db.unitframe.units.party.rdebuffs.stack.position = 'CENTER'
		E.db.unitframe.units.party.rdebuffs.stack.xOffset = 14
		E.db.unitframe.units.party.rdebuffs.stack.yOffset = 0
		E.db.unitframe.units.party.roleIcon.attachTo = 'Frame'
		E.db.unitframe.units.party.roleIcon.damager = false
		E.db.unitframe.units.party.roleIcon.position = 'LEFT'
		E.db.unitframe.units.party.roleIcon.size = 16
		E.db.unitframe.units.party.roleIcon.xOffset = 0
		E.db.unitframe.units.party.roleIcon.yOffset = 0
		E.db.unitframe.units.party.width = (scaled and 100) or 120

		-- Healing Raid1
		E.db.unitframe.units.raid1.buffIndicator.size = 14
		E.db.unitframe.units.raid1.height = 65
		E.db.unitframe.units.raid1.raidicon.attachTo = 'RIGHT'
		E.db.unitframe.units.raid1.raidicon.size = 14
		E.db.unitframe.units.raid1.raidicon.xOffset = -2
		E.db.unitframe.units.raid1.raidicon.yOffset = 0
		E.db.unitframe.units.raid1.rdebuffs.font = Private.Font
		E.db.unitframe.units.raid1.rdebuffs.fontSize = 9
		E.db.unitframe.units.raid1.rdebuffs.size = 18
		E.db.unitframe.units.raid1.rdebuffs.stack.position = 'CENTER'
		E.db.unitframe.units.raid1.rdebuffs.stack.xOffset = 14
		E.db.unitframe.units.raid1.rdebuffs.stack.yOffset = 0
		E.db.unitframe.units.raid1.roleIcon.attachTo = 'Frame'
		E.db.unitframe.units.raid1.roleIcon.damager = false
		E.db.unitframe.units.raid1.roleIcon.position = 'LEFT'
		E.db.unitframe.units.raid1.roleIcon.size = 16
		E.db.unitframe.units.raid1.roleIcon.xOffset = 0
		E.db.unitframe.units.raid1.roleIcon.yOffset = 0
		E.db.unitframe.units.raid1.width = (scaled and 100) or 120

		-- Healing Raid2
		E.db.unitframe.units.raid2.buffIndicator.size = 14
		E.db.unitframe.units.raid2.height = (scaled and 42) or 59
		E.db.unitframe.units.raid2.raidicon.attachTo = 'RIGHT'
		E.db.unitframe.units.raid2.raidicon.size = 14
		E.db.unitframe.units.raid2.raidicon.xOffset = -2
		E.db.unitframe.units.raid2.raidicon.yOffset = 0
		E.db.unitframe.units.raid2.rdebuffs.font = Private.Font
		E.db.unitframe.units.raid2.rdebuffs.fontSize = 9
		E.db.unitframe.units.raid2.rdebuffs.size = 18
		E.db.unitframe.units.raid2.rdebuffs.stack.position = 'CENTER'
		E.db.unitframe.units.raid2.rdebuffs.stack.xOffset = 14
		E.db.unitframe.units.raid2.rdebuffs.stack.yOffset = 0
		E.db.unitframe.units.raid2.roleIcon.attachTo = 'Frame'
		E.db.unitframe.units.raid2.roleIcon.damager = false
		E.db.unitframe.units.raid2.roleIcon.position = 'LEFT'
		E.db.unitframe.units.raid2.roleIcon.size = 16
		E.db.unitframe.units.raid2.roleIcon.xOffset = 0
		E.db.unitframe.units.raid2.roleIcon.yOffset = 0
		E.db.unitframe.units.raid2.width = (scaled and 100) or 120

		-- Healing Raid3
		E.db.unitframe.units.raid3.height = (scaled and 32) or 34
		E.db.unitframe.units.raid3.raidicon.attachTo = 'RIGHT'
		E.db.unitframe.units.raid3.raidicon.size = 12
		E.db.unitframe.units.raid3.raidicon.xOffset = -2
		E.db.unitframe.units.raid3.raidicon.yOffset = 0
		E.db.unitframe.units.raid3.rdebuffs.enable = true
		E.db.unitframe.units.raid3.rdebuffs.font = Private.Font
		E.db.unitframe.units.raid3.rdebuffs.fontSize = 9
		E.db.unitframe.units.raid3.rdebuffs.size = 14
		E.db.unitframe.units.raid3.rdebuffs.stack.position = 'CENTER'
		E.db.unitframe.units.raid3.rdebuffs.stack.xOffset = 12
		E.db.unitframe.units.raid3.rdebuffs.stack.yOffset = 0
		E.db.unitframe.units.raid3.roleIcon.attachTo = 'Frame'
		E.db.unitframe.units.raid3.roleIcon.damager = false
		E.db.unitframe.units.raid3.roleIcon.enable = true
		E.db.unitframe.units.raid3.roleIcon.position = 'LEFT'
		E.db.unitframe.units.raid3.roleIcon.size = 12
		E.db.unitframe.units.raid3.roleIcon.xOffset = 0
		E.db.unitframe.units.raid3.roleIcon.yOffset = 0
		E.db.unitframe.units.raid3.width = (scaled and 100) or 120

		-- Healing misc
		E.global.datatexts.customPanels.Luckyone_ActionBars_DT.width = (scaled and 299) or 347

		-- Healing movers
		E.db.movers.BossButton = (scaled and 'BOTTOM,ElvUIParent,BOTTOM,-280,146') or 'BOTTOM,ElvUIParent,BOTTOM,-330,241'
		E.db.movers.ElvUF_FocusMover = (scaled and 'BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-447,492') or 'BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-514,580'
		E.db.movers.ElvUF_PartyMover = (scaled and 'BOTTOM,ElvUIParent,BOTTOM,0,339') or 'BOTTOM,ElvUIParent,BOTTOM,0,455'
		E.db.movers.ElvUF_PetMover = (scaled and 'BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,366,358') or 'BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,636,474'
		E.db.movers.ElvUF_PlayerCastbarMover = (scaled and 'BOTTOM,ElvUIParent,BOTTOM,0,110') or 'BOTTOM,ElvUIParent,BOTTOM,0,130'
		E.db.movers.ElvUF_PlayerMover = (scaled and 'BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,447,358') or 'BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,717,474'
		E.db.movers.ElvUF_Raid1Mover = (scaled and 'BOTTOM,ElvUIParent,BOTTOM,0,141') or 'BOTTOM,ElvUIParent,BOTTOM,0,257'
		E.db.movers.ElvUF_Raid2Mover = (scaled and 'BOTTOM,ElvUIParent,BOTTOM,0,147') or 'BOTTOM,ElvUIParent,BOTTOM,0,161'
		E.db.movers.ElvUF_Raid3Mover = (scaled and 'BOTTOM,ElvUIParent,BOTTOM,0,141') or 'BOTTOM,ElvUIParent,BOTTOM,0,241'
		E.db.movers.ElvUF_RaidpetMover = 'BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,1,438'
		E.db.movers.ElvUF_TargetCastbarMover = (scaled and 'BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-447,337') or 'BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-717,453'
		E.db.movers.ElvUF_TargetMover = (scaled and 'BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-447,358') or 'BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-716,474'
		E.db.movers.ElvUF_TargetTargetMover = (scaled and 'BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-447,314') or 'BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-716,430'
		E.db.movers.PlayerPowerBarMover = (scaled and 'BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,447,339') or 'BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,717,455'
		E.db.movers.PowerBarContainerMover = 'TOP,ElvUIParent,TOP,0,-110'
		E.db.movers.PrivateAurasMover = (scaled and 'TOPRIGHT,ElvUIParent,TOPRIGHT,-450,-388') or 'TOP,ElvUIParent,TOP,330,-408'
		E.db.movers.VehicleLeaveButton = (scaled and 'BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,448,450') or 'BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,718,566'
		E.db.movers.ZoneAbility = (scaled and 'BOTTOM,ElvUIParent,BOTTOM,280,146') or 'BOTTOM,ElvUIParent,BOTTOM,330,241'

		if Private.itsLuckyone then
			E.db.actionbar.bar1.mouseover = true
			E.db.actionbar.bar2.mouseover = true
			E.db.actionbar.bar3.mouseover = true
			E.db.movers.ElvAB_1 = 'BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,1,190'
			E.db.movers.ElvAB_2 = 'BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,1,248'
			E.db.movers.ElvAB_3 = 'BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,1,219'
			E.db.movers.ElvUF_PlayerCastbarMover = 'BOTTOM,ElvUIParent,BOTTOM,0,14'
			E.db.unitframe.units.player.power.powerPrediction = false
		end

	elseif layout == 'support' then

		-- Support growth direction
		E.db.unitframe.units.party.growthDirection = 'DOWN_RIGHT'

		-- Support Player
		E.db.unitframe.units.player.customTexts.Luckyone_Power.text_format = '[luckyone:power:percent-color]'
		E.db.unitframe.units.player.castbar.width = 279
		E.db.unitframe.units.player.power.autoHide = true

		-- Support TargetTarget
		E.db.unitframe.units.targettarget.width = 278

		-- Support Party
		E.db.unitframe.units.party.customTexts.Luckyone_Name.text_format = '[luckyone:name:short-classcolor]|r[ - >luckyone:healermana:percent]'
		E.db.unitframe.units.party.debuffs.countFont = Private.Font
		E.db.unitframe.units.party.debuffs.countXOffset = 2
		E.db.unitframe.units.party.debuffs.enable = true
		E.db.unitframe.units.party.debuffs.maxDuration = 0
		E.db.unitframe.units.party.debuffs.perrow = 2
		E.db.unitframe.units.party.debuffs.sizeOverride = 40
		E.db.unitframe.units.party.debuffs.xOffset = 1
		E.db.unitframe.units.party.debuffs.yOffset = -1
		E.db.unitframe.units.party.raidicon.attachTo = 'RIGHT'
		E.db.unitframe.units.party.raidicon.size = 14
		E.db.unitframe.units.party.raidicon.xOffset = -3
		E.db.unitframe.units.party.raidicon.yOffset = 0
		E.db.unitframe.units.party.roleIcon.damager = false
		E.db.unitframe.units.party.roleIcon.position = 'LEFT'
		E.db.unitframe.units.party.roleIcon.size = 14
		E.db.unitframe.units.party.roleIcon.xOffset = 0
		E.db.unitframe.units.party.showPlayer = false
		E.db.unitframe.units.party.width = 210

		-- Support Raid1
		E.db.unitframe.units.raid1.height = 40
		E.db.unitframe.units.raid1.raidicon.attachTo = 'TOPRIGHT'
		E.db.unitframe.units.raid1.raidicon.attachToObject = 'Health'
		E.db.unitframe.units.raid1.raidicon.size = 12
		E.db.unitframe.units.raid1.raidicon.xOffset = 1
		E.db.unitframe.units.raid1.raidicon.yOffset = 1
		E.db.unitframe.units.raid1.rdebuffs.font = Private.Font
		E.db.unitframe.units.raid1.rdebuffs.fontSize = 9
		E.db.unitframe.units.raid1.rdebuffs.size = 14
		E.db.unitframe.units.raid1.rdebuffs.stack.position = 'CENTER'
		E.db.unitframe.units.raid1.rdebuffs.stack.xOffset = -10
		E.db.unitframe.units.raid1.rdebuffs.stack.yOffset = 0
		E.db.unitframe.units.raid1.rdebuffs.xOffset = (scaled and 32) or 38
		E.db.unitframe.units.raid1.rdebuffs.yOffset = 13
		E.db.unitframe.units.raid1.roleIcon.size = 12
		E.db.unitframe.units.raid1.width = (scaled and 80) or 92

		-- Support Raid2
		E.db.unitframe.units.raid2.height = (scaled and 30) or 40
		E.db.unitframe.units.raid2.raidicon.attachTo = 'TOPRIGHT'
		E.db.unitframe.units.raid2.raidicon.attachToObject = 'Health'
		E.db.unitframe.units.raid2.raidicon.size = 12
		E.db.unitframe.units.raid2.raidicon.xOffset = 1
		E.db.unitframe.units.raid2.raidicon.yOffset = 1
		E.db.unitframe.units.raid2.rdebuffs.font = Private.Font
		E.db.unitframe.units.raid2.rdebuffs.fontSize = 9
		E.db.unitframe.units.raid2.rdebuffs.size = 14
		E.db.unitframe.units.raid2.rdebuffs.stack.position = 'CENTER'
		E.db.unitframe.units.raid2.rdebuffs.stack.xOffset = -10
		E.db.unitframe.units.raid2.rdebuffs.stack.yOffset = 0
		E.db.unitframe.units.raid2.rdebuffs.xOffset = (scaled and 32) or 38
		E.db.unitframe.units.raid2.rdebuffs.yOffset = (scaled and 7) or 13
		E.db.unitframe.units.raid2.roleIcon.size = 12
		E.db.unitframe.units.raid2.width = (scaled and 80) or 92

		-- Support Raid3
		E.db.unitframe.units.raid3.height = (scaled and 22) or 30
		E.db.unitframe.units.raid3.raidicon.attachTo = 'TOPRIGHT'
		E.db.unitframe.units.raid3.raidicon.attachToObject = 'Health'
		E.db.unitframe.units.raid3.raidicon.size = 12
		E.db.unitframe.units.raid3.raidicon.xOffset = 1
		E.db.unitframe.units.raid3.raidicon.yOffset = 1
		E.db.unitframe.units.raid3.rdebuffs.enable = true
		E.db.unitframe.units.raid3.rdebuffs.font = Private.Font
		E.db.unitframe.units.raid3.rdebuffs.fontSize = 9
		E.db.unitframe.units.raid3.rdebuffs.size = 14
		E.db.unitframe.units.raid3.rdebuffs.stack.position = 'CENTER'
		E.db.unitframe.units.raid3.rdebuffs.stack.xOffset = -10
		E.db.unitframe.units.raid3.rdebuffs.stack.yOffset = 0
		E.db.unitframe.units.raid3.rdebuffs.xOffset = (scaled and 32) or 38
		E.db.unitframe.units.raid3.rdebuffs.yOffset = (scaled and 4) or 8
		E.db.unitframe.units.raid3.roleIcon.attachTo = 'Frame'
		E.db.unitframe.units.raid3.roleIcon.damager = false
		E.db.unitframe.units.raid3.roleIcon.enable = true
		E.db.unitframe.units.raid3.roleIcon.position = 'LEFT'
		E.db.unitframe.units.raid3.roleIcon.size = 12
		E.db.unitframe.units.raid3.roleIcon.xOffset = 0
		E.db.unitframe.units.raid3.roleIcon.yOffset = 0
		E.db.unitframe.units.raid3.width = (scaled and 80) or 92

		-- Special misc
		E.global.datatexts.customPanels.Luckyone_ActionBars_DT.width = (scaled and 404) or 464
		E.db.actionbar.bar1.mouseover = true
		E.db.actionbar.bar2.mouseover = true
		E.db.actionbar.bar3.mouseover = true
		E.db.actionbar.barPet.mouseover = true

		-- Support movers
		E.db.movers.BossButton = (scaled and 'BOTTOM,ElvUIParent,BOTTOM,-230,146') or 'BOTTOM,ElvUIParent,BOTTOM,-260,209'
		E.db.movers.ElvAB_1 = (scaled and 'BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,1,156') or 'BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,1,190'
		E.db.movers.ElvAB_2 = (scaled and 'BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,1,206') or 'BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,1,248'
		E.db.movers.ElvAB_3 = (scaled and 'BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,1,181') or 'BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,1,219'
		E.db.movers.ElvUF_FocusMover = (scaled and 'BOTTOM,ElvUIParent,BOTTOM,318,459') or 'BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-660,580'
		E.db.movers.ElvUF_PartyMover = (scaled and 'TOPLEFT,ElvUIParent,TOPLEFT,300,-300') or 'TOPLEFT,ElvUIParent,TOPLEFT,600,-480'
		E.db.movers.ElvUF_PetMover = (scaled and 'BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,461,324') or 'BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,781,474'
		E.db.movers.ElvUF_PlayerCastbarMover = (scaled and 'BOTTOM,ElvUIParent,BOTTOM,0,266') or 'BOTTOM,ElvUIParent,BOTTOM,0,416'
		E.db.movers.ElvUF_PlayerMover = (scaled and 'BOTTOM,ElvUIParent,BOTTOM,-288,324') or 'BOTTOM,ElvUIParent,BOTTOM,-288,474'
		E.db.movers.ElvUF_Raid1Mover = 'BOTTOM,ElvUIParent,BOTTOM,0,14'
		E.db.movers.ElvUF_Raid2Mover = 'BOTTOM,ElvUIParent,BOTTOM,0,14'
		E.db.movers.ElvUF_Raid3Mover = 'BOTTOM,ElvUIParent,BOTTOM,0,14'
		E.db.movers.ElvUF_RaidpetMover = 'BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,1,438'
		E.db.movers.ElvUF_TargetCastbarMover = (scaled and 'BOTTOM,ElvUIParent,BOTTOM,288,303') or 'BOTTOM,ElvUIParent,BOTTOM,288,453'
		E.db.movers.ElvUF_TargetMover = (scaled and 'BOTTOM,ElvUIParent,BOTTOM,288,324') or 'BOTTOM,ElvUIParent,BOTTOM,288,474'
		E.db.movers.ElvUF_TargetTargetMover = (scaled and 'BOTTOM,ElvUIParent,BOTTOM,0,272') or 'BOTTOM,ElvUIParent,BOTTOM,0,422'
		E.db.movers.PetAB = (scaled and 'BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,1,231') or 'BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,1,277'
		E.db.movers.PowerBarContainerMover = (scaled and 'BOTTOM,ElvUIParent,BOTTOM,0,226') or 'BOTTOM,ElvUIParent,BOTTOM,0,376'
		E.db.movers.PrivateAurasMover = (scaled and 'TOPRIGHT,ElvUIParent,TOPRIGHT,-542,-422') or 'TOP,ElvUIParent,TOP,330,-408'
		E.db.movers.VehicleLeaveButton = (scaled and 'BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,543,416') or 'BOTTOM,ElvUIParent,BOTTOM,-401,566'
		E.db.movers.ZoneAbility = (scaled and 'BOTTOM,ElvUIParent,BOTTOM,230,146') or 'BOTTOM,ElvUIParent,BOTTOM,260,209'
	end
end
