local E, L, V, P, G = unpack(ElvUI)
local MyPluginName = "LuckyoneUI"
local L1UI = E:GetModule("LuckyoneUI");

local IsAddOnLoaded = IsAddOnLoaded
local SetCVar = SetCVar

function L1UI:AddonSetupBW(addon)
	if IsAddOnLoaded('BigWigs') then
		L1UI:GetBigWigsProfile()
		E:Print('BigWigs profile has been set.')
	end

	PluginInstallStepComplete.message = "BigWigs profile has been set"
	PluginInstallStepComplete:Show()
end

function L1UI:AddonSetupDT(addon)
	if IsAddOnLoaded('Details') then
		L1UI:GetDetailsProfile()
		E:Print('Details profile has been set.')
	end

	PluginInstallStepComplete.message = "Details profile has been set"
	PluginInstallStepComplete:Show()
end

function L1UI:AddonSetupPA(addon)
	if IsAddOnLoaded('ProjectAzilroka') then
		L1UI:GetPAProfile()
		E:Print('ProjectAzilroka profile has been set.')
	end

	PluginInstallStepComplete.message = "ProjectAzilroka profile has been set"
	PluginInstallStepComplete:Show()
end

function L1UI:AddonSetupGGF(addon)
	if IsAddOnLoaded('GottaGoFast') then
		L1UI:GetGGFProfile()
		E:Print('GottaGoFast profile has been set.')
	end

	PluginInstallStepComplete.message = "GottaGoFast profile has been set"
	PluginInstallStepComplete:Show()
end

function L1UI:SetupCVars()

	SetCVar("cameraDistanceMaxZoomFactor", 2.6)
	SetCVar("ffxDeath", 0)
	SetCVar("advancedCombatLogging", 1)
	SetCVar("chatStyle", "classic")
	SetCVar("rawMouseEnable", 1)
	SetCVar("SpellQueueWindow", 50)

	--Chat print & Complete message
	E:Print('CVars have been set.')
	PluginInstallStepComplete.message = "CVars have been set"
	PluginInstallStepComplete:Show()
end

function L1UI:SetupPrivate()

	E.private["general"]["chatBubbleFont"] = "Expressway"
	E.private["general"]["dmgfont"] = "Expressway"
	E.private["general"]["glossTex"] = "Solid"
	E.private["general"]["namefont"] = "Expressway"
	E.private["general"]["normTex"] = "Solid"
	E.private["general"]["totemBar"] = false
	E.private["install_complete"] = "11.41"
	E.private["skins"]["cleanBossButton"] = true
	E.private["skins"]["parchmentRemoverEnable"] = true

	if IsAddOnLoaded('ElvUI_SLE') then
	E.private["sle"]["professions"]["deconButton"]["enable"] = false
	E.private["sle"]["skins"]["objectiveTracker"]["color"]["g"] = 0.41960784313725
	E.private["sle"]["skins"]["objectiveTracker"]["color"]["r"] = 0.25882352941176
	E.private["sle"]["skins"]["objectiveTracker"]["texture"] = "Solid"
	end

	E:StaggeredUpdateAll(nil, true)

	PluginInstallStepComplete.message = "Fonts and Textures have been set."
	PluginInstallStepComplete:Show()

	E:Print('Note: Fonts do not change until you restart WoW.')
end
