local E, L, V, P, G = unpack(ElvUI)
local MyPluginName = 'LuckyoneUI'
local L1UI = E:GetModule('LuckyoneUI');

local IsAddOnLoaded = IsAddOnLoaded
local SetCVar = SetCVar

function L1UI:AddonSetupBW(addon)
	if IsAddOnLoaded('BigWigs') then
		L1UI:GetBigWigsProfile()
		E:Print('BigWigs profile has been set.')
	end

	PluginInstallStepComplete.message = 'BigWigs profile has been set.'
	PluginInstallStepComplete:Show()
end

function L1UI:AddonSetupDT(addon)
	if IsAddOnLoaded('Details') then
		L1UI:GetDetailsProfile()
		E:Print('Details profile has been set.')
	end

	PluginInstallStepComplete.message = 'Details profile has been set.'
	PluginInstallStepComplete:Show()
end

function L1UI:AddonSetupPA(addon)
	if IsAddOnLoaded('ProjectAzilroka') then
		L1UI:GetPAProfile()
		E:Print('ProjectAzilroka profile has been set.')
	end

	PluginInstallStepComplete.message = 'ProjectAzilroka profile has been set.'
	PluginInstallStepComplete:Show()
end

function L1UI:AddonSetupGGF(addon)
	if IsAddOnLoaded('GottaGoFast') then
		L1UI:GetGGFProfile()
		E:Print('GottaGoFast profile has been set.')
	end

	PluginInstallStepComplete.message = 'GottaGoFast profile has been set.'
	PluginInstallStepComplete:Show()
end

function L1UI:SetupCVars()

	SetCVar('cameraDistanceMaxZoomFactor', 2.6)
	SetCVar('ffxDeath', 0)
	SetCVar('advancedCombatLogging', 1)
	SetCVar('chatStyle', 'classic')
	SetCVar('rawMouseEnable', 1)
	SetCVar('SpellQueueWindow', 50)

	--Chat print & Complete message
	E:Print('CVars have been set.')
	PluginInstallStepComplete.message = 'CVars have been set'
	PluginInstallStepComplete:Show()
end

function L1UI:SetupPrivate()

	--Paste Here

	if IsAddOnLoaded('ElvUI_SLE') then
	--Paste Here
	end

	E:StaggeredUpdateAll(nil, true)

	PluginInstallStepComplete.message = 'Fonts and Textures have been set.'
	PluginInstallStepComplete:Show()

	E:Print('Note: Fonts do not change until you restart WoW.')
end

function L1UI:NameplateReset()

	--NamePlate CVars
	SetCVar('nameplateLargerScale', 1)
	SetCVar('nameplateMinAlpha', 1)
	SetCVar('nameplateMinScale', 1)
	SetCVar('nameplateMotion', 1)
	SetCVar('nameplateOccludedAlphaMult', 1)
	SetCVar('nameplateOverlapH', 1)
	SetCVar('nameplateOverlapV', 1.6)
	SetCVar('nameplateSelectedScale', 1)
	SetCVar('nameplateSelfAlpha', 1)

	--Name CVars
	SetCVar('UnitNameEnemyGuardianName', 1)
	SetCVar('UnitNameEnemyMinionName', 1)
	SetCVar('UnitNameEnemyPetName', 1)
	SetCVar('UnitNameEnemyPlayerName', 1)
	SetCVar('UnitNameEnemyTotem', 1)

	E:Print('NamePlate CVars have been reset to default.')
end
