local _, Private = ...
local L = Private.L

local ipairs = ipairs

local GetCVarDefault = C_CVar.GetCVarDefault
local InCombatLockdown = InCombatLockdown
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
function Private:NameplateCVars(noPrint)
	if InCombatLockdown() then return end -- Secure CVars

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

-- Full export of all game settings
-- From top to bottom in ESC > Options
-- Not accessible for the normal user (Developer mode only)
function Private:SyncSettings()
	if InCombatLockdown() then return end -- Secure CVars

	-- 1080p
	local scaled = Private.Addon.db.global.scaled

	-- Blizzard defaults, everything below only sets values that differ
	for _, cvar in ipairs({
		-- Gameplay > Controls > General
		'autoClearAFK',
		-- Gameplay > Controls > Mouse
		'ClipCursor', 'mouseInvertPitch', 'enableMouseSpeed', 'autoInteract',
		-- Gameplay > Controls > Camera
		'cameraWaterCollision',
		-- Gameplay > Interface > Display
		'chatBubbles', 'chatBubblesParty', 'chatBubblesRaid',
		-- Gameplay > Action Bars > General
		'enableMultiActionBars',
		-- Gameplay > Combat > General
		'nameplateShowSelf', 'findYourselfModeIcon', 'lossOfControl', 'enableFloatingCombatText', 'enableMouseoverCast', 'autoSelfCast', 'ActionButtonUseKeyHeldSpell',
		-- Gameplay > Social > General
		'guildMemberNotify', 'blockTrades', 'restrictCalendarInvites', 'showToastBroadcast', 'showToastFriendRequest', 'autoAcceptQuickJoinRequests',
		-- Gameplay > Ping System > General
		'enablePings', 'pingMode', 'Sound_EnablePingSounds', 'showPingsInChat',
		-- Gameplay > Gameplay Enhancements
		'assistedCombatHighlight', 'combatWarningsEnabled',
		-- Gameplay > Interface > Nameplates > Names
		'UnitNameOwn', 'ShowQuestUnitCircles', 'UnitNameNonCombatCreatureName', 'UnitNameFriendlyPlayerName',
		-- Gameplay > Interface > Nameplates > Nameplates
		'nameplateShowEnemyPets', 'nameplateShowEnemyTotems', 'nameplateShowFriendlyPlayerPets', 'nameplateShowFriendlyPlayerGuardians', 'nameplateShowFriendlyPlayerTotems', 'nameplateShowFriendlyPlayerMinions', 'nameplateShowOffscreen',
		-- Accessibility > Interface
		'userFontScale', 'questTextContrast',
		-- Accessibility > General
		'enableMovePad', 'cursorSizePreferred', 'SoftTargetTooltipEnemy', 'SoftTargetTooltipInteract', 'SoftTargetIconEnemy', 'SoftTargetIconGameObject', 'SoftTargetLowPriorityIcons',
		-- Accessibility > Colors
		'colorblindMode', 'colorblindSimulator',
		-- Accessibility > Audio Assist > Chat Text to Speech
		'remoteTextToSpeech',
		-- Accessibility > Audio Assist > Combat Audio Alerts
		'CAAEnabled',
		-- Accessibility > Mounts
		'motionSicknessLandscapeDarkening', 'advFlyPitchControl', 'advFlyPitchControlGroundDebounce', 'advFlyPitchControlCameraChase', 'advFlyKeyboardMinPitchFactor', 'advFlyKeyboardMaxPitchFactor', 'advFlyKeyboardMinTurnFactor', 'advFlyKeyboardMaxTurnFactor',
		-- Accessibility > Subtitles
		'movieSubtitle',
		-- System > Graphics > General
		'GxMonitor', 'GxMaximize', 'GxNewResolution', 'RenderScale', 'ffxAntiAliasingMode', 'cameraFov',
		-- System > Graphics > Quality Base
		'shadowSoft', 'graphicsShadowQuality', 'reflectionMode', 'rippleDetail', 'graphicsSSAO', 'DepthBasedOpacity', 'graphicsDepthEffects', 'terrainMipLevel', 'componentTextureLevel', 'graphicsProjectedTextures', 'entityLodDist', 'lodObjectFadeScale', 'doodadLodScale', 'graphicsEnvironmentDetail', 'graphicsGroundClutter',
		-- System > Graphics > Quality Raid and Battleground
		'RAIDshadowMode', 'RAIDshadowTextureSize', 'RAIDshadowBlendCascades', 'RAIDshadowNumCascades', 'RAIDWaterDetail', 'RAIDSSAO', 'RAIDsunShafts', 'RAIDrefraction', 'RAIDterrainMipLevel', 'RAIDcomponentTextureLevel', 'raidGraphicsProjectedTextures', 'RAIDgroundEffectDensity',
		-- System > Graphics > Advanced
		'textureFilteringMode', 'shadowRt', 'vrsValar', 'physicsLevel', 'GxAdapter', 'useMaxFPSBk', 'targetFPS', 'Brightness',
		-- System > Audio > General
		'Sound_EnableAllSound', 'Sound_ZoneMusicNoDelay', 'Sound_EnableSFX', 'Sound_EnablePetSounds', 'Sound_EnableEmoteSounds', 'Sound_EnableDialog', 'Sound_MaxCacheSizeInBytes',
		-- System > Audio > Voice Chat
		'VoiceOutputVolume', 'VoiceChatMasterVolumeScale', 'VoiceInputVolume', 'VoiceCommunicationMode',
		-- System > Network
		'disableServerNagle', 'useIPv6',
		-- Hidden & Unlisted
		'GxAllowCachelessShaderMode', 'rawMouseEnable',
	}) do
		SetCVar(cvar, GetCVarDefault(cvar))
	end

	-- LuckyoneUI modules
	Private:Setup_Chat()
	Private:Setup_CVars(true)
	Private:NameplateCVars(true)

	-- Gameplay > Controls > General
	SetCVar('deselectOnClick', 1)
	SetCVar('autoDismountFlying', 1)
	SetCVar('interactOnLeftClick', 1)
	SetCVar('lootUnderMouse', 1)
	SetCVar('autoLootDefault', 1)
	SetCVar('combinedBags', 1)
	SetCVar('SoftTargetInteract', 1)
	SetCVar('softTargettingInteractKeySound', 1)

	-- Gameplay > Controls > Mouse
	SetCVar('cameraYawMoveSpeed', 230)
	SetCVar('cameraPitchMoveSpeed', 115)

	-- Gameplay > Controls > Camera
	SetCVar('cameraYawSmoothSpeed', 270)
	SetCVar('cameraPitchSmoothSpeed', 67.5)
	SetCVar('cameraSmoothStyle', 0)

	-- Gameplay > Interface > Display
	SetCVar('showInGameNavigation', 1)
	SetCVar('Outline', 1)
	SetCVar('statusTextDisplay', 'BOTH')
	SetCVar('statusText', 1)
	SetCVar('instantQuestText', 1)
	SetCVar('ReplaceOtherPlayerPortraits', 1)
	SetCVar('ReplaceMyPlayerPortrait', 1)
	SetCVar('showNewbieTips', 0)
	SetCVar('useClassicGuildUI', 0)

	-- Gameplay > Combat > General
	SetCVar('findYourselfModeOutline', 1)
	SetCVar('occludedSilhouettePlayer', 1)
	SetCVar('showTargetOfTarget', 1)
	SetCVar('doNotFlashLowHealthWarning', 1)
	SetCVar('empowerTapControls', 1)
	SetCVar('spellActivationOverlayOpacity', 0)
	SetCVar('displaySpellActivationOverlays', 0)
	SetCVar('SoftTargetEnemy', 1)

	-- Gameplay > Social > General
	SetCVar('excludedCensorSources', 255)
	SetCVar('profanityFilter', 0)
	SetCVar('blockChannelInvites', 1)
	SetCVar('showToastOnline', 0)
	SetCVar('showToastOffline', 0)
	SetCVar('showToastWindow', 0)

	-- Gameplay > Ping System > General
	SetCVar('Sound_PingVolume', 0.8)

	-- Gameplay > Gameplay Enhancements
	SetCVar('encounterWarningsEnabled', 0)
	SetCVar('encounterTimelineEnabled', 0)
	SetCVar('cooldownViewerEnabled', 1)
	SetCVar('externalDefensivesEnabled', 1)
	SetCVar('spellDiminishPVPEnemiesEnabled', 0)

	-- Gameplay > Interface > Nameplates > Names
	SetCVar('UnitNameFriendlySpecialNPCName', 0)
	SetCVar('UnitNameNPC', 1)
	SetCVar('UnitNameHostleNPC', 0)
	SetCVar('UnitNameInteractiveNPC', 0)
	SetCVar('UnitNameFriendlyPetName', 0)
	SetCVar('UnitNameFriendlyGuardianName', 0)
	SetCVar('UnitNameFriendlyTotemName', 0)
	SetCVar('UnitNameFriendlyMinionName', 0)

	-- Gameplay > Interface > Nameplates > Nameplates
	SetCVar('nameplateShowAll', 1)
	SetCVar('nameplateShowEnemies', 1)
	SetCVar('nameplateShowEnemyGuardians', 1)
	SetCVar('nameplateShowEnemyMinions', 1)
	SetCVar('nameplateShowEnemyMinus', 1)
	SetCVar('nameplateSize', 3)

	-- Accessibility > General
	SetCVar('overrideScreenFlash', 1)
	SetCVar('WorldTextMinSize', 14)
	SetCVar('CameraKeepCharacterCentered', 0)
	SetCVar('CameraReduceUnexpectedMovement', 1)
	SetCVar('ShakeStrengthCamera', 0.25)
	SetCVar('ShakeStrengthUI', 0.25)

	-- Accessibility > Audio Assist > Screen Narrator
	SetCVar('accessibilityScreenNarrationEnabled', 0)

	-- Accessibility > Mounts
	SetCVar('DisableAdvancedFlyingFullScreenEffects', 1)
	SetCVar('DisableAdvancedFlyingVelocityVFX', 1)

	-- Accessibility > Subtitles
	SetCVar('movieSubtitleBackground', 1)

	-- System > Graphics > General
	SetCVar('useUiScale', 1)
	SetCVar('uiScale', (scaled and Private.UIScale1080) or Private.UIScale1440)
	SetCVar('vsync', 0)
	SetCVar('LowLatencyMode', 2)

	-- System > Graphics > Quality Base
	SetCVar('graphicsQuality', 9)
	SetCVar('shadowMode', 3)
	SetCVar('shadowTextureSize', 2048)
	SetCVar('shadowBlendCascades', 1)
	SetCVar('shadowNumCascades', 3)
	SetCVar('waterDetail', 3)
	SetCVar('graphicsLiquidDetail', 3)
	SetCVar('particleDensity', 80)
	SetCVar('particleMTDensity', 100)
	SetCVar('weatherDensity', 3)
	SetCVar('graphicsParticleDensity', 4)
	SetCVar('SSAO', 3)
	SetCVar('sunShafts', 2)
	SetCVar('refraction', 2)
	SetCVar('volumeFog', 0)
	SetCVar('volumeFogLevel', 0)
	SetCVar('particulatesEnabled', 0)
	SetCVar('clusteredShading', 0)
	SetCVar('graphicsComputeEffects', 0)
	SetCVar('OutlineEngineMode', 2)
	SetCVar('graphicsOutlineMode', 2)
	SetCVar('worldBaseMip', 0)
	SetCVar('graphicsTextureResolution', 2)
	SetCVar('spellVisualDensityFilterSetting', 1)
	SetCVar('spellClutter', 1)
	SetCVar('graphicsSpellDensity', 0)
	SetCVar('projectedTextures', 1)
	SetCVar('farclip', 7000)
	SetCVar('horizonClip', 7000)
	SetCVar('horizonStart', 1900)
	SetCVar('wmoLodDist', 400)
	SetCVar('terrainLodDist', 500)
	SetCVar('TerrainLodDiv', 512)
	SetCVar('entityShadowFadeScale', 25)
	SetCVar('graphicsViewDistance', 6)
	SetCVar('lodObjectCullSize', 18)
	SetCVar('lodObjectMinSize', 0)
	SetCVar('groundEffectDist', 200)
	SetCVar('groundEffectDensity', 80)

	-- System > Graphics > Quality Raid and Battleground
	SetCVar('RAIDsettingsEnabled', 1)
	SetCVar('RAIDgraphicsQuality', 9)
	SetCVar('raidGraphicsShadowQuality', 0)
	SetCVar('RAIDreflectionMode', 0)
	SetCVar('RAIDrippleDetail', 0)
	SetCVar('raidGraphicsLiquidDetail', 0)
	SetCVar('RAIDparticleDensity', 10)
	SetCVar('RAIDparticleMTDensity', 20)
	SetCVar('raidGraphicsParticleDensity', 1)
	SetCVar('raidGraphicsSSAO', 0)
	SetCVar('RAIDDepthBasedOpacity', 0)
	SetCVar('raidGraphicsDepthEffects', 0)
	SetCVar('RAIDVolumeFog', 0)
	SetCVar('RAIDVolumeFogLevel', 0)
	SetCVar('RAIDParticulatesEnabled', 0)
	SetCVar('RAIDclusteredShading', 0)
	SetCVar('raidGraphicsComputeEffects', 0)
	SetCVar('RAIDOutlineEngineMode', 2)
	SetCVar('raidGraphicsOutlineMode', 2)
	SetCVar('RAIDworldBaseMip', 0)
	SetCVar('raidGraphicsTextureResolution', 2)
	SetCVar('RAIDspellClutter', 1)
	SetCVar('raidGraphicsSpellDensity', 0)
	SetCVar('RAIDprojectedTextures', 1)
	SetCVar('RAIDfarclip', 1500)
	SetCVar('RAIDhorizonClip', 1500)
	SetCVar('RAIDhorizonStart', 400)
	SetCVar('RAIDwmoLodDist', 250)
	SetCVar('RAIDterrainLodDist', 200)
	SetCVar('RAIDterrainLodDiv', 384)
	SetCVar('RAIDentityLodDist', 5)
	SetCVar('RAIDentityShadowFadeScale', 10)
	SetCVar('raidGraphicsViewDistance', 0)
	SetCVar('RAIDlodObjectFadeScale', 50)
	SetCVar('RAIDlodObjectCullSize', 35)
	SetCVar('RAIDlodObjectMinSize', 0)
	SetCVar('RAIDdoodadLodScale', 50)
	SetCVar('raidGraphicsEnvironmentDetail', 0)
	SetCVar('RAIDgroundEffectDist', 40)
	SetCVar('raidGraphicsGroundClutter', 0)

	-- System > Graphics > Advanced
	SetCVar('GxMaxFrameLatency', 2)
	SetCVar('ResampleQuality', 2)
	SetCVar('GxApi', 'd3d12')
	SetCVar('useMaxFPS', 1)
	SetCVar('maxFPS', 60)
	SetCVar('maxFPSBk', 60)
	SetCVar('useTargetFPS', 0)
	SetCVar('ResampleSharpness', 0)
	SetCVar('Contrast', 55)
	SetCVar('Gamma', 1.1)

	-- System > Audio > General
	SetCVar('Sound_MasterVolume', 0.15)
	SetCVar('Sound_MusicVolume', 0)
	SetCVar('Sound_SFXVolume', 0.05)
	SetCVar('Sound_AmbienceVolume', 0)
	SetCVar('Sound_DialogVolume', 0.15)
	SetCVar('Sound_EnableMusic', 0)
	SetCVar('Sound_EnablePetBattleMusic', 0)
	SetCVar('Sound_GameplaySFX', 0.8)
	SetCVar('Sound_EnableErrorSpeech', 0)
	SetCVar('Sound_EnableAmbience', 0)
	SetCVar('Sound_EnableSoundWhenGameIsInBG', 1)
	SetCVar('Sound_EnableReverb', 0)
	SetCVar('Sound_EnablePositionalLowPassFilter', 1)
	SetCVar('Sound_NumChannels', 128)

	-- System > Audio > Voice Chat
	SetCVar('VoiceVADSensitivity', 45)
	SetCVar('PushToTalkSound', 1)
	C_VoiceChat.SetPushToTalkBinding({ 'CAPSLOCK' }) -- Writes VoicePushToTalkKeybind the way Blizzard's settings do

	-- System > Network
	SetCVar('advancedCombatLogging', 1)

	-- Hidden & Unlisted
	SetCVar('alwaysCompareItems', 0)
	SetCVar('assaoSharpness', 1)
	SetCVar('autoQuestProgress', 0)
	SetCVar('cameraIndirectOffset', 10)
	SetCVar('checkAddonVersion', 0)
	SetCVar('CursorFreelookStartDelta', 0)
	SetCVar('emphasizeMySpellEffects', 0)
	SetCVar('ffxDeath', 0)
	SetCVar('ffxGlow', 0)
	SetCVar('ffxNether', 0)
	SetCVar('ffxVenari', 0)
	SetCVar('ffxLingeringVenari', 0)
	SetCVar('floatingCombatTextPetMeleeDamage_v2', 0)
	SetCVar('floatingCombatTextPetSpellDamage_v2', 0)
	SetCVar('guildShowOffline', 0)
	SetCVar('housingDecorFreePlaceEnabled', 1)
	SetCVar('housingDecorGridVisible', 0)
	SetCVar('maxFPSLoading', 30)
	SetCVar('mountJournalShowPlayer', 1)
	SetCVar('nameplateTargetRadialPosition', 1)
	SetCVar('partyBackgroundOpacity', 1)
	SetCVar('RAIDweatherDensity', 0)
	SetCVar('ResampleAlwaysSharpen', 1)
	SetCVar('scriptErrors', 1)
	SetCVar('showPhotosensitivityWarning', 11)
	SetCVar('SpellQueueWindow', 180)
	SetCVar('ThreadPoolPerThreadAllocator', 2)
	SetCVar('threatPlaySounds', 0)
	SetCVar('timeMgrUseLocalTime', 1)
	SetCVar('TurnSpeed', 100)
	SetCVar('UnitNameGuildTitle', 0)
	SetCVar('UnitNamePlayerGuild', 0)
	SetCVar('UnitNamePlayerPVPTitle', 0)
	SetCVar('userFontScaleGlue', 1)
	SetCVar('xpBarText', 1)

	C_UI.Reload()
end
