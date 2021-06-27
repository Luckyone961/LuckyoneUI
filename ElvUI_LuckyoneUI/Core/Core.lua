local L1UI, E, L, V, P, G = unpack(select(2, ...))

local IsAddOnLoaded = IsAddOnLoaded
local SetCVar = SetCVar

-- LuckyoneUI chat print
function L1UI:Print(msg)
	print(L1UI.Name..': '..msg)
end

-- Load AddOnSkins Profile
function L1UI:AddonSetupAS()

	if IsAddOnLoaded('AddOnSkins') then
		L1UI:GetASProfile()
		L1UI:Print('AddOnSkins profile has been set.')
	end
end

-- Load BigWigs Profile
function L1UI:AddonSetupBW()

	if IsAddOnLoaded('BigWigs') then
		L1UI:GetBigWigsProfile()
		L1UI:Print('BigWigs profile has been set.')
	end
end

-- Load DBM Profile
function L1UI:AddonSetupDBM()

	if IsAddOnLoaded('DBM-Core') then
		L1UI:GetDBMProfile()
		L1UI:Print('DBM profile has been set.')
	end
end

-- Load Details Profile
function L1UI:AddonSetupDT()

	if IsAddOnLoaded('Details') then
		L1UI:GetDetailsProfile()
		L1UI:Print('Details profile has been set.')
	end
end

-- Load OmniCD Profile
function L1UI:AddonSetupOCD()

	if IsAddOnLoaded('OmniCD') then
		L1UI:GetOmniCDProfile()
		L1UI:Print('OmniCD profile has been set.')
	end
end

-- Load Plater Profile
function L1UI:AddonSetupPlater()

	if IsAddOnLoaded('Plater') then
		L1UI:GetPlaterProfile()
		L1UI:Print('Plater profile has been set.')
	end
end

-- Load ProjectAzilroka Profile
function L1UI:AddonSetupPA()

	if IsAddOnLoaded('ProjectAzilroka') then
		L1UI:GetPAProfile()
		L1UI:Print('ProjectAzilroka profile has been set.')
	end
end

-- Load Shadow&Light Profile
function L1UI:AddonSetupSLE()

	if IsAddOnLoaded('ElvUI_SLE') then
		L1UI:GetSLEProfile()
		L1UI:Print('Shadow&Light profile has been set.')
	end
end

-- Set UI Scale
function L1UI:SetupScale()

	E.global["general"]["UIScale"] = 0.71111111111111
	SetCVar('uiScale', 0.71111111111111)
end

-- General CVars
function L1UI:SetupCVars()

	E:SetupCVars(noDisplayMsg)

	SetCVar('advancedCombatLogging', 1)
	SetCVar('cameraDistanceMaxZoomFactor', 2.6)
	SetCVar('ffxDeath', 0)
	SetCVar('ffxGlow', 0)
	SetCVar('rawMouseEnable', 1)

	L1UI:Print('CVars have been set.')
end

-- NamePlate CVars
function L1UI:NameplateCVars()

	SetCVar('nameplateLargerScale', 1)
	SetCVar('nameplateMinAlpha', 1)
	SetCVar('nameplateMinScale', 1)
	SetCVar('nameplateMotion', 1)
	SetCVar('nameplateOccludedAlphaMult', 1)
	SetCVar('nameplateOverlapH', 1)
	SetCVar('nameplateOverlapV', 1.7)
	SetCVar('nameplateSelectedScale', 1)
	SetCVar('nameplateSelfAlpha', 1)

	SetCVar('UnitNameEnemyGuardianName', 1)
	SetCVar('UnitNameEnemyMinionName', 1)
	SetCVar('UnitNameEnemyPetName', 1)
	SetCVar('UnitNameEnemyPlayerName', 1)

	if not L1UI.Classic then
		SetCVar('UnitNameEnemyTotem', 1)
	end

	if not L1UI.Retail then
		SetCVar('nameplateNotSelectedAlpha', 1)
	end

	L1UI:Print('NamePlate CVars have been set.')
end

-- E.private
function L1UI:SetupPrivate()

	E.private["general"]["chatBubbleFont"] = "Expressway"
	E.private["general"]["chatBubbleFontOutline"] = "OUTLINE"
	E.private["general"]["dmgfont"] = "Expressway"
	E.private["general"]["glossTex"] = "Minimalist"
	E.private["general"]["namefont"] = "Expressway"
	E.private["general"]["normTex"] = "Minimalist"
	E.private["skins"]["parchmentRemoverEnable"] = true

	if L1UI.Retail then
		E.private["install_complete"] = "12.24"
		E.private["general"]["totemBar"] = false
	elseif L1UI.TBC then
		E.private["install_complete"] = "2.10"
		E.private["general"]["totemBar"] = true
	elseif L1UI.Classic then
		E.private["install_complete"] = "1.43"
	end
end

-- E.global
function L1UI:SetupGlobal()

	if L1UI.Retail then
		E.global["general"]["commandBarSetting"] = "DISABLED"
	end

	E.global["general"]["fadeMapWhenMoving"] = false
	E.global["general"]["mapAlphaWhenMoving"] = 0.35
	E.global["general"]["smallerWorldMapScale"] = 0.8
	E.global["general"]["WorldMapCoordinates"]["position"] = "TOPLEFT"

	-- Luckyone Custom DataText (below ActionBars)
	do
		E.DataTexts:BuildPanelFrame("Luckyone_ActionBars_DT")
		E.global["datatexts"]["customPanels"]["Luckyone_ActionBars_DT"]["backdrop"] = true
		E.global["datatexts"]["customPanels"]["Luckyone_ActionBars_DT"]["border"] = true
		E.global["datatexts"]["customPanels"]["Luckyone_ActionBars_DT"]["enable"] = true
		E.global["datatexts"]["customPanels"]["Luckyone_ActionBars_DT"]["fonts"]["enable"] = true
		E.global["datatexts"]["customPanels"]["Luckyone_ActionBars_DT"]["fonts"]["font"] = "Expressway"
		E.global["datatexts"]["customPanels"]["Luckyone_ActionBars_DT"]["fonts"]["fontOutline"] = "NONE"
		E.global["datatexts"]["customPanels"]["Luckyone_ActionBars_DT"]["fonts"]["fontSize"] = 12
		E.global["datatexts"]["customPanels"]["Luckyone_ActionBars_DT"]["frameLevel"] = 1
		E.global["datatexts"]["customPanels"]["Luckyone_ActionBars_DT"]["frameStrata"] = "LOW"
		E.global["datatexts"]["customPanels"]["Luckyone_ActionBars_DT"]["growth"] = "HORIZONTAL"
		E.global["datatexts"]["customPanels"]["Luckyone_ActionBars_DT"]["height"] = 13
		E.global["datatexts"]["customPanels"]["Luckyone_ActionBars_DT"]["mouseover"] = false
		E.global["datatexts"]["customPanels"]["Luckyone_ActionBars_DT"]["name"] = "Luckyone_ActionBars_DT"
		E.global["datatexts"]["customPanels"]["Luckyone_ActionBars_DT"]["numPoints"] = 3
		E.global["datatexts"]["customPanels"]["Luckyone_ActionBars_DT"]["panelTransparency"] = true
		E.global["datatexts"]["customPanels"]["Luckyone_ActionBars_DT"]["textJustify"] = "CENTER"
		E.global["datatexts"]["customPanels"]["Luckyone_ActionBars_DT"]["tooltipAnchor"] = "ANCHOR_TOP"
		E.global["datatexts"]["customPanels"]["Luckyone_ActionBars_DT"]["tooltipXOffset"] = 0
		E.global["datatexts"]["customPanels"]["Luckyone_ActionBars_DT"]["tooltipYOffset"] = 5
		E.global["datatexts"]["customPanels"]["Luckyone_ActionBars_DT"]["visibility"] = "[petbattle] hide;show"
		E.global["datatexts"]["customPanels"]["Luckyone_ActionBars_DT"]["width"] = 358
	end
end
