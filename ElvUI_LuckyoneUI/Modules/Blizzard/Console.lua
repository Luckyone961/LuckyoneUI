local Name, Private = ...
local E, L, V, P, G = unpack(ElvUI)

local _G = _G
local SetCVar = SetCVar

-- General CVars
function Private:Setup_CVars(noPrint, installer)
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

	-- Developer CVars
	if E.global.L1UI.dev then
		SetCVar('blockChannelInvites', 1)
		SetCVar('CameraReduceUnexpectedMovement', 1)
		SetCVar('DisableAdvancedFlyingVelocityVFX', 1)
		SetCVar('disableServerNagle', 1)
		SetCVar('displaySpellActivationOverlays', 0)
		SetCVar('doNotFlashLowHealthWarning', 1)
		SetCVar('empowerTapControls', 1)
		SetCVar('floatingCombatTextCombatDamage', 0)
		SetCVar('floatingCombatTextCombatHealing', 0)
		SetCVar('GxAllowCachelessShaderMode', 0)
		SetCVar('LowLatencyMode', 2)
		SetCVar('maxFPSLoading', 30)
		SetCVar('RAIDweatherDensity', 0)
		SetCVar('ResampleAlwaysSharpen', 1)
		SetCVar('showToastOffline', 0)
		SetCVar('showToastOnline', 0)
		SetCVar('showToastWindow', 0)
		SetCVar('SpellQueueWindow', 180)
		SetCVar('useIPv6', 1)
		SetCVar('weatherDensity', 0)
	end

	if installer then
		_G.LuckyoneInstallStepComplete.message = L["CVars have been set."]
		_G.LuckyoneInstallStepComplete:Show()
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
