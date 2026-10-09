local _, Private = ...
local L = Private.L

local ipairs = ipairs

local ConsoleGetAllCommands = ConsoleGetAllCommands
local GetBuildInfo = GetBuildInfo
local GetCVarInfo = C_CVar.GetCVarInfo
local SetCVar = C_CVar.SetCVar
local SetCVarBitfield = C_CVar.SetCVarBitfield

-- General CVars
function Private:Setup_CVars(noPrint, installer)
	SetCVar('AutoPushSpellToActionBar', 0)
	SetCVar('cameraDistanceMaxZoomFactor', 2.6)
	SetCVar('countdownForCooldowns', 1)
	SetCVar('fstack_preferParentKeys', 0)
	SetCVar('lockActionBars', 1)
	SetCVar('minimapTrackingShowAll', 1)
	SetCVar('screenshotQuality', 10)
	SetCVar('showNPETutorials', 0)
	SetCVar('showTutorials', 0)
	SetCVar('threatWarning', 3)
	SetCVar('UberTooltips', 1)

	if Private.itsLuckyone then
		SetCVar('floatingCombatTextCombatDamage_v2', 0)
		SetCVar('floatingCombatTextCombatHealing_v2', 0)
	end

	if not noPrint then
		Private:Print(L["CVars have been set."], installer)
	end
end

-- NamePlate CVars
function Private:Setup_NameplateCVars(noPrint)
	SetCVar('nameplateMinAlpha', 1)
	SetCVar('nameplateMinScale', 1)
	SetCVar('nameplateOccludedAlphaMult', 1)
	SetCVar('nameplateOverlapH', 1.1)
	SetCVar('nameplateOverlapV', 1.7)
	SetCVar('nameplateSelectedScale', 1)

	SetCVar('UnitNameEnemyGuardianName', 1)
	SetCVar('UnitNameEnemyMinionName', 1)
	SetCVar('UnitNameEnemyPetName', 1)
	SetCVar('UnitNameEnemyPlayerName', 1)
	SetCVar('UnitNameEnemyTotemName', 1)

	SetCVar('nameplateMaxDistance', (Private.isRetail and 100) or 41)
	SetCVar('nameplateShowOnlyNameForFriendlyPlayerUnits', 1)
	SetCVar('nameplateUseClassColorForFriendlyPlayerUnitNames', 1)

	if Private.isModern then
		SetCVar('nameplateShowFriendlyRealmName', 0)
	else
		SetCVar('nameplateNotSelectedAlpha', 1)
		SetCVarBitfield('nameplateStackingTypes', Enum.NamePlateStackType.Enemy, true) -- Stacking plates, nameplateMotion is gone
	end

	if not noPrint then
		Private:Print(L["Nameplate CVars have been set."])
	end
end

-- Scale helper
function Private:Setup_Scale(native, installer)
	Private.Addon.db.global.scaled = not native

	SetCVar('useUiScale', 1)
	SetCVar('uiScale', native and Private.UIScale1440 or Private.UIScale1080)
	Private.Modules.Core:UpdateScale()
	Private:Print(L["LuckyoneUI Scale"] .. (native and ' 1440p' or ' 1080p'), installer)
end

-- Live value, default, scope and help text
-- 'Export CVars' button writes db.global.cvarDump
-- 'Wipe exported CVars' button wipes db.global.cvarDump
function Private:ExportCVars()
	local cvars = {}
	for _, info in ipairs(ConsoleGetAllCommands()) do
		if info.commandType == Enum.ConsoleCommandType.Cvar then
			local value, default, account, character, locked, _, readOnly = GetCVarInfo(info.command)
			if value then
				cvars[info.command] = { value, default, (character and 'character') or (account and 'account') or 'local', info.help or '', (readOnly and 'readonly') or (locked and 'locked') or nil }
			end
		end
	end

	local version, build = GetBuildInfo()
	Private.Addon.db.global.cvarDump = { version = version .. ' (' .. build .. ')', character = Private.myNameRealm, cvars = cvars }
	C_UI.Reload()
end

-- Full export of all game settings
-- 1: Every option back to its default
-- 2: Then override with our personal values
-- characterOnly: just the character CVars, for every other character of a client that already had the full run
function Private:SyncSettings(characterOnly)
	local function Set(cvar, value, index)
		local _, _, _, character = GetCVarInfo(cvar)
		if characterOnly and not character then return end

		if index then
			SetCVarBitfield(cvar, index, value)
		else
			SetCVar(cvar, value)
		end
	end

	-- 'python cvarsync.py --print-reset' (keeping it sorted)
	for _, cvar in ipairs({
		'accessibilityScreenNarrationSpeechRate', 'accessibilityScreenNarrationSpeechVolume', 'accessibilityScreenNarrationVoice', 'ActionButtonUseKeyHeldSpell',
		'advFlyKeyboardMaxPitchFactor', 'advFlyKeyboardMaxTurnFactor', 'advFlyKeyboardMinPitchFactor', 'advFlyKeyboardMinTurnFactor', 'advFlyPitchControl',
		'advFlyPitchControlCameraChase', 'advFlyPitchControlGroundDebounce', 'alwaysShowRuneIcons', 'arachnophobiaMode', 'assistedCombatHighlight',
		'assistedCombatReduceHighlights', 'autoAcceptQuickJoinRequests', 'autoClearAFK', 'autoInteract', 'autoQuestWatch', 'autoRangedCombat', 'autoSelfCast',
		'bankConfirmTabCleanUp', 'blockTrades', 'Brightness', 'CAADebuffSelfAlert', 'CAAEnabled', 'CAAInterruptCast', 'CAAInterruptCastSuccess',
		'CAAPartyHealthFrequency', 'CAAPartyHealthPercent', 'CAAPartyHealthVoice', 'CAAPartyHealthVolume', 'CAAPlayerCastFormat', 'CAAPlayerCastMinTime',
		'CAAPlayerCastMode', 'CAAPlayerCastThrottle', 'CAAPlayerCastVoice', 'CAAPlayerCastVolume', 'CAAPlayerHealthFormat', 'CAAPlayerHealthPercent',
		'CAAPlayerHealthThrottle', 'CAAPlayerHealthVoice', 'CAAPlayerHealthVolume', 'CAAPulsePlayerHealthPercent', 'CAAPulsePlayerHealthVolume', 'CAAResource1Formats',
		'CAAResource1Percents', 'CAAResource1Throttle', 'CAAResource1Voice', 'CAAResource1Volume', 'CAAResource2Formats', 'CAAResource2Percents',
		'CAAResource2Throttle', 'CAAResource2Voice', 'CAAResource2Volume', 'CAASayCombatEnd', 'CAASayCombatStart', 'CAASayIfTargeted', 'CAASayTargetName',
		'CAASayYourDebuffs', 'CAASayYourDebuffsFormat', 'CAASayYourDebuffsMinDuration', 'CAASayYourDebuffsVoice', 'CAASayYourDebuffsVolume', 'CAASpeed',
		'CAATargetCastFormat', 'CAATargetCastMinTime', 'CAATargetCastMode', 'CAATargetCastThrottle', 'CAATargetCastVoice', 'CAATargetCastVolume',
		'CAATargetDeathBehavior', 'CAATargetHealthFormat', 'CAATargetHealthPercent', 'CAATargetHealthThrottle', 'CAATargetHealthVoice', 'CAATargetHealthVolume',
		'CAAVoice', 'CAAVolume', 'cameraBobbing', 'cameraFov', 'cameraPivot', 'cameraSmoothTrackingStyle', 'cameraTerrainTilt', 'cameraWaterCollision', 'chatBubbles',
		'chatBubblesParty', 'chatBubblesRaid', 'classicStyleWorldText', 'ClipCursor', 'colorblindMode', 'colorblindSimulator', 'colorblindWeaknessFactor',
		'combatWarningsEnabled', 'componentTextureLevel', 'consolidateBuffs', 'Contrast', 'coordsByTenths', 'cursorSizePreferred', 'damageMeterResetOnNewInstance',
		'DepthBasedOpacity', 'disableServerNagle', 'discordDisplayName', 'displayFreeBagSlots', 'doodadLodScale', 'enableCollectionToasts', 'enableFloatingCombatText',
		'enableLearnedRecipeToasts', 'enableLootToasts', 'enableMouseoverCast', 'enableMouseSpeed', 'enableMovePad', 'enablePings',
		'encounterTimelineHideForOtherRoles', 'encounterTimelineHideLongCountdowns', 'encounterTimelineHideQueuedCountdowns',
		'encounterWarningsHideIfNotTargetingPlayer', 'encounterWarningsLevel', 'entityLodDist', 'equipmentManager', 'externalDefensivesEnabled', 'ffxAntiAliasingMode',
		'findYourselfAnywhere', 'findYourselfModeCircle', 'findYourselfModeIcon', 'floatingCombatTextAuraFade_v2', 'floatingCombatTextAuras_v2',
		'floatingCombatTextCombatLogPeriodicSpells_v2', 'floatingCombatTextCombatState_v2', 'floatingCombatTextComboPoints_v2', 'floatingCombatTextDamageReduction_v2',
		'floatingCombatTextDodgeParryMiss_v2', 'floatingCombatTextEnergyGains_v2', 'floatingCombatTextFloatMode_v2', 'floatingCombatTextFriendlyHealers_v2',
		'floatingCombatTextHonorGains_v2', 'floatingCombatTextLowManaHealth_v2', 'floatingCombatTextReactives_v2', 'floatingCombatTextRepChanges_v2',
		'GamePadBackPedalThreshold', 'GamepadCameraFollowOnStick', 'GamepadCameraFollowPitchOffset', 'GamePadCameraPitchSpeed', 'GamePadCameraYawSpeed',
		'GamePadFaceMovementFreeFlying', 'GamePadFaceMovementMaxAngle', 'GamePadFaceMovementMaxAngleCombat', 'GamePadFaceMovementMount', 'GamePadFaceMovementSwimming',
		'GamepadFocusStateColor', 'GamepadFocusStateOpacity', 'GamepadHudModifierUsesToggle', 'gamepadInvertPitch', 'gamepadInvertYaw', 'GamepadPossessBarOverride',
		'GamepadRaidTargetingHoverMode', 'GamePadRunThreshold', 'GamepadShowPersistentInputLegend', 'GamepadStanceBarOverride', 'GamepadSwapFriendlyTargetActions',
		'GamepadSwapHostileTargetActions', 'GamepadSwapTargetModifiers', 'GamePadTurnWithCamera', 'GamepadUsePartyTargeting', 'graphicsBloomUserMult',
		'graphicsDepthEffects', 'graphicsEnvironmentDetail', 'graphicsGroundClutter', 'graphicsLightMode', 'graphicsPBRLiquidDetail', 'graphicsProjectedTextures',
		'graphicsShadowQuality', 'graphicsSSAO', 'graphicsSunshafts', 'guildMemberNotify', 'GxAdapter', 'GxApi', 'GxCompatAsyncShaderCompilation',
		'GxCompatCommandListMultiThreading', 'GxCompatOptionalGpuFeatures', 'GxCompatWorkSubmitOptimizations', 'GxMaximize', 'GxMonitor', 'GxNewResolution',
		'hardcoreDeathAlertType', 'hardcoreDeathChatType', 'housingDecorLightRadiusIndicatorsEnabled', 'housingOtherDecorLightRadiusIndicatorType',
		'housingSelectedDecorLightRadiusIndicatorType', 'InputDeviceInterfaceStyle', 'lockActionBars', 'lodObjectFadeScale', 'lossOfControl', 'maxFPSBk',
		'minimapShowPlayerCoords', 'motionSicknessFocalCircle', 'motionSicknessLandscapeDarkening', 'mouseInvertPitch', 'movieSubtitle', 'movieSubtitleBackground',
		'movieSubtitleBackgroundAlpha', 'MSAAAlphaTest', 'MSAAQuality', 'nameplateAuraScale', 'nameplateCastBarDisplay', 'nameplateDebuffPadding',
		'nameplateEnemyNpcAuraDisplay', 'nameplateEnemyPlayerAuraDisplay', 'nameplateFriendlyPlayerAuraDisplay', 'nameplateInfoDisplay', 'nameplateShowClassColor',
		'nameplateShowEnemyPets', 'nameplateShowEnemyTotems', 'nameplateShowFriendlyClassColor', 'nameplateShowFriendlyNpcs', 'nameplateShowFriendlyPlayerGuardians',
		'nameplateShowFriendlyPlayerMinions', 'nameplateShowFriendlyPlayerPets', 'nameplateShowFriendlyPlayers', 'nameplateShowFriendlyPlayerTotems',
		'nameplateShowOffscreen', 'nameplateShowSelf', 'nameplateSimplifiedTypes', 'nameplateStyle', 'nameplateThreatDisplay', 'NotchedDisplayMode', 'pbrLiquidDetail',
		'physicsLevel', 'pingCategoryTutorialShown', 'pingMode', 'pingTarget', 'previewTalentsOption', 'pvpFramesDisplayClassColor',
		'pvpFramesDisplayOnlyHealerPowerBars', 'pvpFramesDisplayPowerBars', 'pvpFramesHealthText', 'pvpOptionDisplayPets', 'questTextContrast',
		'RAIDcomponentTextureLevel', 'raidFramesCenterBigDefensive', 'raidFramesDispelIndicatorAnimatedBorder', 'raidFramesDispelIndicatorOverlay',
		'raidFramesDispelIndicatorOverlayAnimation', 'raidFramesDispelIndicatorType', 'raidFramesDisplayAggroHighlight', 'raidFramesDisplayClassColor',
		'raidFramesDisplayDebuffs', 'raidFramesDisplayIncomingHeals', 'raidFramesDisplayLargerRoleSpecificDebuffs', 'raidFramesDisplayOnlyDispellableDebuffs',
		'raidFramesDisplayOnlyHealerPowerBars', 'raidFramesDisplayPowerBars', 'raidFramesHealthBarColor', 'raidFramesHealthBarColorBG', 'raidFramesHealthText',
		'raidGraphicsBloomUserMult', 'raidGraphicsLightMode', 'raidGraphicsPBRLiquidDetail', 'raidGraphicsProjectedTextures', 'raidGraphicsSunshafts',
		'RAIDgroundEffectDensity', 'raidOptionDisplayMainTankAndAssist', 'raidOptionDisplayPets', 'RAIDrefraction', 'RAIDshadowBlendCascades', 'RAIDshadowMode',
		'RAIDshadowNumCascades', 'RAIDshadowTextureSize', 'RAIDSSAO', 'RAIDsunShafts', 'RAIDterrainMipLevel', 'RAIDWaterDetail', 'reflectionMode',
		'remoteTextToSpeech', 'remoteTextToSpeechVoice', 'RenderScale', 'restrictCalendarInvites', 'rippleDetail', 'shadowRt', 'shadowSoft', 'showDynamicBuffSize',
		'showLoadingScreenTips', 'showMaxLevelAnnouncements', 'showMinimapClock', 'showPingsInChat', 'showPingsOnRaidFrames', 'ShowQuestUnitCircles', 'showSwingTimer',
		'showTargetCastbar', 'showToastBroadcast', 'showToastFriendRequest', 'SoftTargetIconEnemy', 'SoftTargetIconGameObject', 'SoftTargetIconInteract',
		'SoftTargetLowPriorityIcons', 'SoftTargetTooltipEnemy', 'SoftTargetTooltipInteract', 'Sound_EnableAllSound', 'Sound_EnableDialog', 'Sound_EnableEmoteSounds',
		'Sound_EnableEncounterWarningsSounds', 'Sound_EnableGameplaySFX', 'Sound_EnablePetSounds', 'Sound_EnablePingSounds', 'Sound_EnableSFX',
		'Sound_EncounterWarningsVolume', 'Sound_GameplaySFX', 'Sound_MaxCacheSizeInBytes', 'Sound_ZoneMusicNoDelay', 'speechToText',
		'spellDiminishPVPOnlyTriggerableByMe', 'targetFPS', 'terrainMipLevel', 'textToSpeech', 'textureFilteringMode', 'threatShowNumeric', 'threatWarning',
		'unitFramesDisplayIncomingHeals', 'UnitNameEnemyGuardianName', 'UnitNameEnemyMinionName', 'UnitNameEnemyPetName', 'UnitNameEnemyPlayerName',
		'UnitNameEnemyTotemName', 'UnitNameFriendlyPlayerName', 'UnitNameNonCombatCreatureName', 'UnitNameOwn', 'UnitSurnameOwn', 'useHighResTextures', 'useIPv6',
		'useMaxFPSBk', 'userFontScale', 'VoiceChatMasterVolumeScale', 'VoiceCommunicationMode', 'VoiceInputVolume', 'VoiceOutputVolume', 'VoiceVADSensitivity',
		'vrsValar', 'worldMapShowCursorCoords', 'worldMapShowPlayerCoords',
	}) do
		local value, default, _, character = GetCVarInfo(cvar) -- nothing on a client without the CVar
		if default and value ~= default and (not characterOnly or character) then
			SetCVar(cvar, default)
		end
	end

	-- Graphics quality masters first, the engine derives the leaf CVars from them
	-- They would otherwise override things like farClip, density, dist, etc
	Set('graphicsComputeEffects', 0)
	Set('graphicsLiquidDetail', 3)
	Set('graphicsOutlineMode', 2)
	Set('graphicsParticleDensity', 4)
	Set('graphicsQuality', 9)
	Set('graphicsSpellDensity', 0)
	Set('graphicsTextureResolution', 2)
	Set('graphicsViewDistance', 6)
	Set('raidGraphicsComputeEffects', 0)
	Set('raidGraphicsDepthEffects', 0)
	Set('raidGraphicsEnvironmentDetail', 0)
	Set('raidGraphicsGroundClutter', 0)
	Set('raidGraphicsLiquidDetail', 0)
	Set('raidGraphicsOutlineMode', 2)
	Set('raidGraphicsParticleDensity', 1)
	Set('RAIDgraphicsQuality', 9)
	Set('raidGraphicsShadowQuality', 0)
	Set('raidGraphicsSpellDensity', 0)
	Set('raidGraphicsSSAO', 0)
	Set('raidGraphicsTextureResolution', 2)
	Set('raidGraphicsViewDistance', 0)

	Set('accessibilityScreenNarrationEnabled', 0)
	Set('advancedCombatLogging', 1)
	Set('alwaysCompareItems', 0)
	Set('assaoSharpness', 1)
	Set('autoDismountFlying', 1)
	Set('autoLootDefault', 1)
	Set('AutoPushSpellToActionBar', 0)
	Set('autoQuestProgress', 0)
	Set('blockChannelInvites', 1)
	Set('cameraDistanceMaxZoomFactor', 2.6)
	Set('cameraIndirectOffset', 10)
	Set('CameraKeepCharacterCentered', 0)
	Set('cameraPitchMoveSpeed', 115)
	Set('cameraPitchSmoothSpeed', 67.5)
	Set('CameraReduceUnexpectedMovement', 1)
	Set('cameraSmoothStyle', 0)
	Set('cameraYawMoveSpeed', 230)
	Set('cameraYawSmoothSpeed', 270)
	Set('chatClassColorOverride', 0)
	Set('chatStyle', 'classic')
	Set('checkAddonVersion', 0)
	Set('clusteredShading', 0)
	Set('colorChatNamesByClass', 1)
	Set('combinedBags', 1)
	Set('cooldownViewerEnabled', 1)
	Set('countdownForCooldowns', 1)
	Set('CursorFreelookStartDelta', 0)
	Set('deselectOnClick', 1)
	Set('DisableAdvancedFlyingFullScreenEffects', 1)
	Set('DisableAdvancedFlyingVelocityVFX', 1)
	Set('displaySpellActivationOverlays', 0)
	Set('doNotFlashLowHealthWarning', 1)
	Set('emphasizeMySpellEffects', 0)
	Set('empowerTapControls', 1)
	Set('encounterTimelineEnabled', 0)
	Set('encounterWarningsEnabled', 0)
	Set('entityShadowFadeScale', 25)
	Set('excludedCensorSources', 255)
	Set('farclip', 7000)
	Set('ffxDeath', 0)
	Set('ffxGlow', 0)
	Set('ffxLingeringVenari', 0)
	Set('ffxNether', 0)
	Set('ffxVenari', 0)
	Set('findYourselfModeOutline', 1)
	Set('floatingCombatTextCombatDamage_v2', 0)
	Set('floatingCombatTextCombatHealing_v2', 0)
	Set('floatingCombatTextPetMeleeDamage_v2', 0)
	Set('floatingCombatTextPetSpellDamage_v2', 0)
	Set('Gamma', 1.1)
	Set('groundEffectDensity', 80)
	Set('groundEffectDist', 200)
	Set('guildShowOffline', 0)
	Set('GxMaxFrameLatency', 2)
	Set('horizonClip', 7000)
	Set('horizonStart', 1900)
	Set('housingDecorFreePlaceEnabled', 1)
	Set('housingDecorGridVisible', 0)
	Set('instantQuestText', 1)
	Set('interactOnLeftClick', 1)
	Set('lodObjectCullSize', 18)
	Set('lodObjectMinSize', 0)
	Set('lootUnderMouse', 1)
	Set('LowLatencyMode', 2)
	Set('maxFPS', 60)
	Set('maxFPSLoading', 30)
	Set('minimapTrackingShowAll', 1)
	Set('mountJournalShowPlayer', 1)
	Set('nameplateMaxDistance', (Private.isRetail and 100) or 41)
	Set('nameplateMinAlpha', 1)
	Set('nameplateMinScale', 1)
	if not Private.isModern then
		Set('nameplateNotSelectedAlpha', 1)
		Set('nameplateStackingTypes', true, Enum.NamePlateStackType.Enemy) -- Stacking plates, nameplateMotion is gone
	end
	Set('nameplateOccludedAlphaMult', 1)
	Set('nameplateSelectedScale', 1)
	Set('nameplateShowAll', 1)
	Set('nameplateShowEnemies', 1)
	Set('nameplateShowEnemyGuardians', 1)
	Set('nameplateShowEnemyMinions', 1)
	Set('nameplateShowEnemyMinus', 1)
	Set('nameplateShowFriendlyRealmName', 0)
	Set('nameplateShowOnlyNameForFriendlyPlayerUnits', 1)
	Set('nameplateSize', 3)
	Set('nameplateTargetRadialPosition', 1)
	Set('nameplateUseClassColorForFriendlyPlayerUnitNames', 1)
	Set('occludedSilhouettePlayer', 1)
	Set('Outline', 1)
	Set('OutlineEngineMode', 2)
	Set('overrideScreenFlash', 1)
	Set('particleDensity', 80)
	Set('particleMTDensity', 100)
	Set('particulatesEnabled', 0)
	Set('partyBackgroundOpacity', 1)
	Set('profanityFilter', 0)
	Set('projectedTextures', 1)
	Set('PushToTalkSound', 1)
	Set('RAIDclusteredShading', 0)
	Set('RAIDDepthBasedOpacity', 0)
	Set('RAIDdoodadLodScale', 50)
	Set('RAIDentityLodDist', 5)
	Set('RAIDentityShadowFadeScale', 10)
	Set('RAIDfarclip', 1500)
	Set('RAIDgroundEffectDist', 40)
	Set('RAIDhorizonClip', 1500)
	Set('RAIDhorizonStart', 400)
	Set('RAIDlodObjectCullSize', 35)
	Set('RAIDlodObjectFadeScale', 50)
	Set('RAIDlodObjectMinSize', 0)
	Set('RAIDOutlineEngineMode', 2)
	Set('RAIDparticleDensity', 10)
	Set('RAIDparticleMTDensity', 20)
	Set('RAIDParticulatesEnabled', 0)
	Set('RAIDprojectedTextures', 1)
	Set('RAIDreflectionMode', 0)
	Set('RAIDrippleDetail', 0)
	Set('RAIDsettingsEnabled', 1)
	Set('RAIDspellClutter', 1)
	Set('RAIDterrainLodDist', 200)
	Set('RAIDterrainLodDiv', 384)
	Set('RAIDVolumeFog', 0)
	Set('RAIDVolumeFogLevel', 0)
	Set('RAIDweatherDensity', 0)
	Set('RAIDwmoLodDist', 250)
	Set('RAIDworldBaseMip', 0)
	Set('refraction', 2)
	Set('ReplaceMyPlayerPortrait', 1)
	Set('ReplaceOtherPlayerPortraits', 1)
	Set('ResampleAlwaysSharpen', 1)
	Set('ResampleQuality', 2)
	Set('ResampleSharpness', 0)
	Set('screenshotQuality', 10)
	Set('scriptErrors', 1)
	Set('shadowBlendCascades', 1)
	Set('shadowMode', 3)
	Set('shadowNumCascades', 3)
	Set('shadowTextureSize', 2048)
	Set('ShakeStrengthCamera', 0.25)
	Set('ShakeStrengthUI', 0.25)
	Set('showInGameNavigation', 1)
	Set('showNewbieTips', 0)
	Set('showNPETutorials', 0)
	Set('showPhotosensitivityWarning', 11)
	Set('showTargetOfTarget', 1)
	Set('showTimestamps', '%H:%M ')
	Set('showToastOffline', 0)
	Set('showToastOnline', 0)
	Set('showToastWindow', 0)
	Set('showTutorials', 0)
	Set('SoftTargetEnemy', 1)
	Set('SoftTargetInteract', 1)
	Set('softTargettingInteractKeySound', 1)
	Set('Sound_AmbienceVolume', 0)
	Set('Sound_DialogVolume', 0.15)
	Set('Sound_EnableAmbience', 0)
	Set('Sound_EnableErrorSpeech', 0)
	Set('Sound_EnableMusic', 0)
	Set('Sound_EnablePetBattleMusic', 0)
	Set('Sound_EnablePositionalLowPassFilter', 1)
	Set('Sound_EnableReverb', 0)
	Set('Sound_EnableSoundWhenGameIsInBG', 1)
	Set('Sound_MasterVolume', 0.15)
	Set('Sound_MusicVolume', 0)
	Set('Sound_NumChannels', 128)
	Set('Sound_PingVolume', 0.8)
	Set('Sound_SFXVolume', 0.05)
	Set('spellActivationOverlayOpacity', 0)
	Set('spellClutter', 1)
	Set('spellDiminishPVPEnemiesEnabled', 0)
	Set('SpellQueueWindow', 180)
	Set('spellVisualDensityFilterSetting', 1)
	Set('SSAO', 3)
	Set('statusText', 1)
	Set('statusTextDisplay', 'BOTH')
	Set('sunShafts', 2)
	Set('terrainLodDist', 500)
	Set('TerrainLodDiv', 512)
	Set('ThreadPoolPerThreadAllocator', 2)
	Set('threatPlaySounds', 0)
	Set('timeMgrUseLocalTime', 1)
	Set('TurnSpeed', 100)
	Set('uiScale', (Private.Addon.db.global.scaled and Private.UIScale1080) or Private.UIScale1440)
	Set('UnitNameFriendlyGuardianName', 0)
	Set('UnitNameFriendlyMinionName', 0)
	Set('UnitNameFriendlyPetName', 0)
	Set('UnitNameFriendlySpecialNPCName', 0)
	Set('UnitNameFriendlyTotemName', 0)
	Set('UnitNameGuildTitle', 0)
	Set('UnitNameHostleNPC', 0)
	Set('UnitNameInteractiveNPC', 0)
	Set('UnitNameNPC', 1)
	Set('UnitNamePlayerGuild', 0)
	Set('UnitNamePlayerPVPTitle', 0)
	Set('useClassicGuildUI', 0)
	Set('useMaxFPS', 1)
	Set('userFontScaleGlue', 1)
	Set('useTargetFPS', 0)
	Set('useUiScale', 1)
	Set('volumeFog', 0)
	Set('volumeFogLevel', 0)
	Set('vsync', 0)
	Set('waterDetail', 3)
	Set('weatherDensity', 3)
	Set('whisperMode', 'inline')
	Set('wholeChatWindowClickable', 0)
	Set('wmoLodDist', 400)
	Set('worldBaseMip', 0)
	Set('WorldTextMinSize', 14)
	Set('xpBarText', 1)

	if not characterOnly then
		C_VoiceChat.SetPushToTalkBinding({ 'CAPSLOCK' }) -- Writes VoicePushToTalkKeybind the way Blizzard's settings do
	end

	C_UI.Reload()
end
