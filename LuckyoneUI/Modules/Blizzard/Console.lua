-- Addon namespace
local _, Private = ...
local L = Private.Libs.ACL

-- API cache
local SetCVar = C_CVar.SetCVar

-- Global environment
local _G = _G

-- General CVars
function Private:Setup_CVars(noPrint, installer)

	SetCVar('alwaysShowActionBars', 1)
	SetCVar('AutoPushSpellToActionBar', 0)
	SetCVar('cameraDistanceMaxZoomFactor', 2.6)
	SetCVar('fstack_preferParentKeys', 0)
	SetCVar('lockActionBars', 1)
	SetCVar('minimapTrackingShowAll', 1)
	SetCVar('screenshotQuality', 10)
	SetCVar('showNPETutorials', 0)
	SetCVar('showTutorials', 0)
	SetCVar('threatWarning', 3)
	SetCVar('UberTooltips', 1)

	if installer then
		_G.LuckyoneInstallStepComplete:ShowMessage(L["CVars have been set."])
	end

	if not noPrint then
		Private:Print(L["CVars have been set."])
	end
end

-- NamePlate CVars
function Private:NameplateCVars(noPrint)

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
	SetCVar('nameplateOverlapV', 2.2)
	SetCVar('nameplateSelectedScale', 1)
	SetCVar('nameplateSelfAlpha', 1)
	SetCVar('nameplateSelfTopInset', -1)
	SetCVar('nameplateShowOnlyNames', 1)
	SetCVar('NamePlateVerticalScale', 1)

	SetCVar('UnitNameEnemyGuardianName', 1)
	SetCVar('UnitNameEnemyMinionName', 1)
	SetCVar('UnitNameEnemyPetName', 1)
	SetCVar('UnitNameEnemyPlayerName', 1)

	if not Private.isClassic then
		SetCVar('UnitNameEnemyTotem', 1)
	end

	if not Private.isRetail then
		SetCVar('nameplateNotSelectedAlpha', 1)
	end

	if not noPrint then
		Private:Print(L["Nameplate CVars have been set."])
	end
end
