-- API cache
local SetCVar = C_CVar.SetCVar

-- AddOn namespace
local _, Private = ...

-- Full export of all game settings
-- From top to bottom in ESC > Options
function Private:SyncSettings()

	-- Run general functions first
	Private:Setup_Chat()
	Private:Setup_CVars(true)
	Private:NameplateCVars(true)

	-- Gameplay > Controls > General
	SetCVar('deselectOnClick', 0)
	SetCVar('autoDismountFlying', 1)
	SetCVar('autoClearAFK', 1)
	SetCVar('interactOnLeftClick', 1)
	SetCVar('lootUnderMouse', 1)
	SetCVar('autoLootDefault', 1)
	SetCVar('combinedBags', 1)
	SetCVar('SoftTargetInteract', 1)
	SetCVar('softTargettingInteractKeySound', 1)

	-- Gameplay > Controls > Mouse
	SetCVar('ClipCursor', 0)
	SetCVar('mouseInvertPitch', 0)
	SetCVar('cameraYawMoveSpeed', 230)
	SetCVar('cameraPitchMoveSpeed', 115)
	SetCVar('enableMouseSpeed', 0)
	SetCVar('autoInteract', 0)

	-- Gameplay > Controls > Camera
	SetCVar('cameraWaterCollision', 1)
	SetCVar('cameraYawSmoothSpeed', 270)
	SetCVar('cameraPitchSmoothSpeed', 67.5)
	SetCVar('cameraSmoothStyle', 0)

	-- Gameplay > Interface > Names
	SetCVar('UnitNameOwn', 1)
	SetCVar('UnitNameFriendlySpecialNPCName', 1)
	SetCVar('ShowQuestUnitCircles', 0)
	SetCVar('UnitNameNonCombatCreatureName', 0)
	SetCVar('UnitNameFriendlyPlayerName', 1)
	SetCVar('UnitNameFriendlyPetName', 0)
	SetCVar('UnitNameFriendlyGuardianName', 0)
	SetCVar('UnitNameFriendlyTotemName', 0)
	SetCVar('UnitNameFriendlyMinionName', 0)
	SetCVar('UnitNameEnemyPlayerName', 1)
	SetCVar('UnitNameEnemyPetName', 1)
	SetCVar('UnitNameEnemyGuardianName', 1)
	SetCVar('UnitNameEnemyTotemName', 1)
	SetCVar('UnitNameEnemyMinionName', 1)

	-- Gameplay > Interface > Nameplates
	SetCVar('nameplateShowAll', 1)
	SetCVar('NamePlateHorizontalScale', 1)
	SetCVar('NamePlateVerticalScale', 1)
	SetCVar('NamePlateClassificationScale', 1)
	SetCVar('nameplateShowEnemies', 1)
	SetCVar('nameplateShowEnemyPets', 1)
	SetCVar('nameplateShowEnemyGuardians', 1)
	SetCVar('nameplateShowEnemyTotems', 1)
	SetCVar('nameplateShowEnemyMinions', 1)
	SetCVar('nameplateShowEnemyMinus', 1)
	SetCVar('nameplateShowFriends', 0)
	SetCVar('nameplateShowFriendlyPets', 0)
	SetCVar('nameplateShowFriendlyGuardians', 0)
	SetCVar('nameplateShowFriendlyTotems', 0)
	SetCVar('nameplateShowFriendlyMinions', 0)
	SetCVar('ShowNamePlateLoseAggroFlash', 0)
	SetCVar('nameplateMotion', 1)

	-- Gameplay > Interface > Display
	SetCVar('hideAdventureJournalAlerts', 1)
	SetCVar('showInGameNavigation', 1)
	SetCVar('showTutorials', 0)
	SetCVar('Outline', 2)
	SetCVar('statusTextDisplay', 'BOTH')
	SetCVar('statusText', 1)
	SetCVar('chatBubbles', 1)
	SetCVar('chatBubblesParty', 1)
	SetCVar('ReplaceOtherPlayerPortraits', 1)
	SetCVar('ReplaceMyPlayerPortrait', 1)

	-- Gameplay > Action Bars > General
	SetCVar('enableMultiActionBars', 0)
	SetCVar('lockActionBars', 1)
	SetCVar('countdownForCooldowns', 0)

	-- Gameplay > Combat > General
	SetCVar('nameplateShowSelf', 0)
	SetCVar('findYourselfModeOutline', 1)
	SetCVar('findYourselfModeCircle', 0)
	SetCVar('occludedSilhouettePlayer', 1)
	SetCVar('showTargetOfTarget', 1)
	SetCVar('doNotFlashLowHealthWarning', 1)
	SetCVar('lossOfControl', 1)
	SetCVar('enableFloatingCombatText', 0)
	SetCVar('enableMouseoverCast', 0)
	SetCVar('autoSelfCast', 1)
	SetCVar('empowerTapControls', 1)
	SetCVar('spellActivationOverlayOpacity', 0)
	SetCVar('displaySpellActivationOverlays', 0)
	SetCVar('ActionButtonUseKeyHeldSpell', 0)
	SetCVar('SoftTargetEnemy', 1)

	-- Gameplay > Social > General
	SetCVar('excludedCensorSources', 255)
	SetCVar('profanityFilter', 0)
	SetCVar('guildMemberNotify', 1)
	SetCVar('blockTrades', 0)
	SetCVar('restrictCalendarInvites', 1)
	SetCVar('blockChannelInvites', 1)
	SetCVar('showToastOnline', 0)
	SetCVar('showToastOffline', 0)
	SetCVar('showToastBroadcast', 1)
	SetCVar('showToastFriendRequest', 1)
	SetCVar('showToastWindow', 0)
	SetCVar('autoAcceptQuickJoinRequests', 0)

	-- Gameplay > Ping System > General
	SetCVar('enablePings', 1)
	SetCVar('pingMode', 0)
	SetCVar('Sound_EnablePingSounds', 1)
	SetCVar('Sound_PingVolume', 1)
	SetCVar('showPingsInChat', 1)

	-- Accessibility > General
	SetCVar('enableMovePad', 0)
	SetCVar('overrideScreenFlash', 1)
	SetCVar('questTextContrast', 0)
	SetCVar('WorldTextMinSize', 10)
	SetCVar('CameraKeepCharacterCentered', 0)
	SetCVar('CameraReduceUnexpectedMovement', 1)
	SetCVar('ShakeStrengthCamera', 0.25)
	SetCVar('ShakeStrengthUI', 0.25)
	SetCVar('cursorSizePreferred', -1)
	SetCVar('occludedSilhouettePlayer', 1)
	SetCVar('SoftTargetTooltipEnemy', 0)
	SetCVar('SoftTargetTooltipInteract', 0)
	SetCVar('SoftTargetIconEnemy', 0)
	SetCVar('SoftTargetIconGameObject', 0)
	SetCVar('SoftTargetLowPriorityIcons', 0)

	-- Accessibility > Colorblind Mode
	SetCVar('colorblindMode', 0)
	SetCVar('colorblindSimulator', 0)

	-- Accessibility > Text To Speech
	SetCVar('remoteTextToSpeech', 0)

	-- Accessibility > Mounts
	SetCVar('motionSicknessLandscapeDarkening', 0)
	SetCVar('DisableAdvancedFlyingFullScreenEffects', 1)
	SetCVar('DisableAdvancedFlyingVelocityVFX', 1)
	SetCVar('advFlyPitchControl', 3)
	SetCVar('advFlyPitchControlGroundDebounce', 0)

	-- Accessibility > Subtitles
	SetCVar('movieSubtitle', 1)
	SetCVar('movieSubtitleBackground', 1)

	-- System > Graphics > General
	SetCVar('GxMonitor', 0)
	SetCVar('GxMaximize', 1)
	SetCVar('GxNewResolution', '0x0')
	SetCVar('RenderScale', 1)
	SetCVar('useUiScale', 1)
	SetCVar('uiScale', 0.53333333333333)
	SetCVar('vsync', 0)
	SetCVar('LowLatencyMode', 3)
	SetCVar('ffxAntiAliasingMode', 4)
	SetCVar('cameraFov', 90)

	-- System > Graphics > Quality Base
	SetCVar('graphicsQuality', 9)
	SetCVar('shadowMode', 3)
	SetCVar('shadowTextureSize', 2048)
	SetCVar('shadowBlendCascades', 1)
	SetCVar('shadowNumCascades', 3)
	SetCVar('graphicsShadowQuality', 3)
	SetCVar('waterDetail', 3)
	SetCVar('reflectionMode', 3)
	SetCVar('rippleDetail', 2)
	SetCVar('graphicsLiquidDetail', 3)
	SetCVar('particleDensity', 80)
	SetCVar('particleMTDensity', 100)
	SetCVar('weatherDensity', 3)
	SetCVar('graphicsParticleDensity', 4)
	SetCVar('SSAO', 3)
	SetCVar('graphicsSSAO', 3)
	SetCVar('sunShafts', 2)
	SetCVar('refraction', 2)
	SetCVar('graphicsDepthEffects', 3)
	SetCVar('volumeFogLevel', 2)
	SetCVar('graphicsComputeEffects', 3)
	SetCVar('OutlineEngineMode', 2)
	SetCVar('graphicsOutlineMode', 2)
	SetCVar('terrainMipLevel', 0)
	SetCVar('componentTextureLevel', 0)
	SetCVar('worldBaseMip', 0)
	SetCVar('graphicsTextureResolution', 2)
	SetCVar('spellClutter', 100)
	SetCVar('graphicsSpellDensity', 0)
	SetCVar('projectedTextures', 1)
	SetCVar('graphicsProjectedTextures', 1)
	SetCVar('farclip', 8000)
	SetCVar('horizonClip', 8000)
	SetCVar('horizonStart', 2400)
	SetCVar('terrainLodDist', 600)
	SetCVar('TerrainLodDiv', 768)
	SetCVar('entityShadowFadeScale', 30)
	SetCVar('graphicsViewDistance', 7)
	SetCVar('lodObjectFadeScale', 110)
	SetCVar('lodObjectCullSize', 17)
	SetCVar('doodadLodScale', 125)
	SetCVar('graphicsEnvironmentDetail', 7)
	SetCVar('groundEffectDist', 260)
	SetCVar('groundEffectDensity', 128)
	SetCVar('graphicsGroundClutter', 7)

	-- System > Graphics > Quality Raid and Battleground
	SetCVar('RAIDsettingsEnabled', 1)
	SetCVar('RAIDgraphicsQuality', 9)
	SetCVar('RAIDshadowMode', 1)
	SetCVar('RAIDshadowTextureSize', 1024)
	SetCVar('RAIDshadowBlendCascades', 0)
	SetCVar('RAIDshadowNumCascades', 1)
	SetCVar('raidGraphicsShadowQuality', 1)
	SetCVar('RAIDWaterDetail', 1)
	SetCVar('raidGraphicsLiquidDetail', 1)
	SetCVar('RAIDparticleDensity', 50)
	SetCVar('RAIDparticleMTDensity', 70)
	SetCVar('raidGraphicsParticleDensity', 3)
	SetCVar('RAIDSSAO', 0)
	SetCVar('raidGraphicsSSAO', 0)
	SetCVar('RAIDDepthBasedOpacity', 0)
	SetCVar('raidGraphicsDepthEffects', 0)
	SetCVar('RAIDVolumeFog', 0)
	SetCVar('RAIDParticulatesEnabled', 0)
	SetCVar('RAIDclusteredShading', 0)
	SetCVar('raidGraphicsComputeEffects', 0)
	SetCVar('RAIDOutlineEngineMode', 2)
	SetCVar('raidGraphicsOutlineMode', 2)
	SetCVar('RAIDterrainMipLevel', 0)
	SetCVar('RAIDcomponentTextureLevel', 0)
	SetCVar('RAIDworldBaseMip', 0)
	SetCVar('raidGraphicsTextureResolution', 2)
	SetCVar('RAIDspellClutter', 100)
	SetCVar('raidGraphicsSpellDensity', 0)
	SetCVar('RAIDprojectedTextures', 1)
	SetCVar('raidGraphicsProjectedTextures', 1)
	SetCVar('RAIDfarclip', 1500)
	SetCVar('RAIDhorizonClip', 1500)
	SetCVar('RAIDhorizonStart', 400)
	SetCVar('RAIDterrainLodDist', 200)
	SetCVar('raidGraphicsViewDistance', 0)
	SetCVar('RAIDlodObjectCullSize', 35)
	SetCVar('raidGraphicsEnvironmentDetail', 0)
	SetCVar('RAIDgroundEffectDist', 40)
	SetCVar('raidGraphicsGroundClutter', 0)

	-- System > Graphics > Advanced
	SetCVar('GxMaxFrameLatency', 2)
	SetCVar('textureFilteringMode', 5)
	SetCVar('shadowRt', 0)
	SetCVar('ResampleQuality', 3)
	SetCVar('vrsValar', 0)
	SetCVar('GxApi', 'd3d12')
	SetCVar('physicsLevel', 1)
	SetCVar('GxAdapter', '')
	SetCVar('useMaxFPS', 1)
	SetCVar('maxFPS', 120)
	SetCVar('useMaxFPSBk', 1)
	SetCVar('maxFPSBk', 30)
	SetCVar('useTargetFPS', 0)
	SetCVar('targetFPS', 60)
	SetCVar('ResampleSharpness', 0.2)
	SetCVar('Contrast', 55)
	SetCVar('Brightness', 50)
	SetCVar('Gamma', 1.1)

	-- System > Audio > General
	SetCVar('Sound_EnableAllSound', 1)
	SetCVar('Sound_MasterVolume', 0.2)
	SetCVar('Sound_MusicVolume', 0)
	SetCVar('Sound_SFXVolume', 0.1)
	SetCVar('Sound_AmbienceVolume', 0)
	SetCVar('Sound_DialogVolume', 0.3)
	SetCVar('Sound_EnableMusic', 0)
	SetCVar('Sound_ZoneMusicNoDelay', 0)
	SetCVar('Sound_EnablePetBattleMusic', 0)
	SetCVar('Sound_EnableSFX', 1)
	SetCVar('Sound_EnablePetSounds', 1)
	SetCVar('Sound_EnableEmoteSounds', 1)
	SetCVar('Sound_EnableDialog', 1)
	SetCVar('Sound_EnableErrorSpeech', 0)
	SetCVar('Sound_EnableAmbience', 0)
	SetCVar('Sound_EnableSoundWhenGameIsInBG', 1)
	SetCVar('Sound_EnableReverb', 0)
	SetCVar('Sound_EnablePositionalLowPassFilter', 1)
	SetCVar('Sound_NumChannels', 128)
	SetCVar('Sound_MaxCacheSizeInBytes', 134217728)

	-- System > Audio > Voice Chat
	SetCVar('VoiceOutputVolume', 50)
	SetCVar('VoiceChatMasterVolumeScale', 1)
	SetCVar('VoiceInputVolume', 50)
	SetCVar('VoiceVADSensitivity', 45)
	SetCVar('VoiceCommunicationMode', 0)

	-- System > Network
	SetCVar('disableServerNagle', 1)
	SetCVar('useIPv6', 1)
	SetCVar('advancedCombatLogging', 1)

	-- Custom
	SetCVar('assaoSharpness', 1)
	SetCVar('cameraIndirectOffset', 10)
	SetCVar('ffxDeath', 0)
	SetCVar('ffxGlow', 0)
	SetCVar('ffxNether', 0)
	SetCVar('floatingCombatTextCombatDamage', 0)
	SetCVar('floatingCombatTextCombatHealing', 0)
	SetCVar('GxAllowCachelessShaderMode', 0)
	SetCVar('maxFPSLoading', 30)
	SetCVar('RAIDweatherDensity', 0)
	SetCVar('rawMouseEnable', 1)
	SetCVar('ResampleAlwaysSharpen', 1)
	SetCVar('SpellQueueWindow', 180)

	Private:Print('Synced game settings.')
end
