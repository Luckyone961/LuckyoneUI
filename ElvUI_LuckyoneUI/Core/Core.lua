local E, L, V, P, G = unpack(ElvUI)
local MyPluginName = "LuckyoneUI"
local L1UI = E:GetModule("LuckyoneUI");

local IsAddOnLoaded = IsAddOnLoaded
local SetCVar = SetCVar

--Setup AddOns[1]
function L1UI:AddonSetupBW(addon)

	if IsAddOnLoaded('BigWigs') then
		L1UI:GetBigWigsProfile()
		E:Print('BigWigs profile has been set.')
	end

	PluginInstallStepComplete.message = "BigWigs profile has been set"
	PluginInstallStepComplete:Show()
end

--Setup AddOns[2]
function L1UI:AddonSetupDT(addon)

	if IsAddOnLoaded('Details') then
		L1UI:GetDetailsProfile()
		E:Print('Details profile has been set.')
	end

	PluginInstallStepComplete.message = "Details profile has been set"
	PluginInstallStepComplete:Show()
end

--Setup AddOns[3]
function L1UI:AddonSetupPA(addon)

	if IsAddOnLoaded('ProjectAzilroka') then
		L1UI:GetPAProfile()
		E:Print('ProjectAzilroka profile has been set.')
	end

	PluginInstallStepComplete.message = "ProjectAzilroka profile has been set"
	PluginInstallStepComplete:Show()
end

--Setup AddOns[4]
function L1UI:AddonSetupGGF(addon)

	if IsAddOnLoaded('GottaGoFast') then
		L1UI:GetGGFProfile()
		E:Print('GottaGoFast profile has been set.')
	end

	PluginInstallStepComplete.message = "GottaGoFast profile has been set"
	PluginInstallStepComplete:Show()
end

--Setup CVars
function L1UI:SetupCVars()
	--Maximize the camera zoom
	SetCVar("cameraDistanceMaxZoomFactor", 2.6)

	--Remove ugly colors while dead
	SetCVar("ffxDeath", 0)

	--Enable advanced logging
	SetCVar("advancedCombatLogging", 1)

	--Chat editbox style
	SetCVar("chatStyle", "classic")

	--NamePlate setup
	SetCVar("nameplateMinAlpha", 1)
	SetCVar("nameplateMinScale", 1)
	SetCVar("nameplateSelfAlpha", 1)
	SetCVar("nameplateLargerScale", 0)
	SetCVar("nameplateSelectedScale", 1)
	SetCVar("nameplateMotion", 1)
	SetCVar("nameplateOverlapH", 1)
	SetCVar("nameplateOverlapV", 1.6)

	--Hardware cursor
	SetCVar("rawMouseEnable", 1)

	--Quality of life
	SetCVar("SpellQueueWindow", 50)

	--Chat print
	E:Print('CVars have been set.')

	PluginInstallStepComplete.message = "CVars have been set"
	PluginInstallStepComplete:Show()
end
