-- Addon namespace
local _, Private = ...
local L = Private.Libs.ACL

-- Global environment
local _G = _G

-- Plumber profile
function Private:Setup_Plumber()
	if not Private.IsAddOnLoaded('Plumber') then Private:Print('Plumber ' .. L["is not installed or enabled."]) return end

	local DB = _G.PlumberDB
	DB = DB or {}

	DB.AlternativePlayerChoiceUI = true
	DB.AppearanceTab = true
	DB.AppearanceTab_ModelCount = 1
	DB.AutoJoinEvents = false
	DB.BackpackItemTracker = false
	DB.BlizzardSuperTrack = false
	DB.BlizzFixEventToast = true
	DB.BlizzFixFishingArtifact = true

	DB.BossBanner_MasterSwitch = false

	DB.BreakTime = false

	DB.CatalystUI = true
	DB.ChatOptions = false
	DB.ConciseTokenTooltip = true
	DB.CraftSearchExtended = false

	DB.DecorModelScaleRef = true
	DB.DecorModelScaleRef_ShowBanana = false

	DB.Delves_Automation = true
	DB.Delves_Dashboard = true
	DB.Delves_SeasonProgress = true

	DB.EditModeShowPlumberUI = true
	DB.EmeraldBountySeedList = true
	DB.EnableNewByDefault = false
	DB.ExpansionLandingPage = true
	DB.GossipFrameMedal = true
	DB.HandyLockpick = true
	DB.HideZeroCountItem = true
	DB.HolidayDungeon = true

	DB.Housing_CatalogSearch = true
	DB.Housing_Clock = true
	DB.Housing_Clock_AnalogClock = false
	DB.Housing_CustomizeMode = true
	DB.Housing_DecorHover = true
	DB.Housing_DecorHover_DuplicateKey = 2
	DB.Housing_DecorHover_EnableDupe = true
	DB.Housing_ItemAcquiredAlert = false
	DB.Housing_Macro = true

	DB.HuntTable = true
	DB.InstanceDifficulty = true
	DB.ItemUpgradeUI = true

	DB.LandingButton_ShowButton = false

	DB.LandingPage_Activity_HideCompleted = true
	DB.LandingPage_AdvancedTooltip = true
	DB.LandingPage_Raid_CollapsedAchievement = false

	DB.LootUI = false
	DB.MerchantPrice = false
	DB.NameplateQuest = false

	DB.NameplateWidget = true
	DB.Navigator_Dreamseed = false
	DB.Navigator_MasterSwitch = true
	DB.NewExpansionLandingPage = true

	DB.PartyInviterInfo = false

	DB.PlayerChoiceFrameToken = true
	DB.PlayerTitleUI = true
	DB.Plunderstore = true
	DB.Plunderstore_HideCollected = true
	DB.ProfessionsBook = true
	DB.QuestItemDestroyAlert = true

	DB.QueueStatus = false

	DB.quickslotFromRadian = 0
	DB.QuickSlotHighContrastMode = false

	DB.SettingsPanel_AutoShowChangelog = false
	DB.SettingsPanel_ChangelogFontSize = 1

	DB.SoftTargetName = false

	DB.SourceAchievementLink = true
	DB.SpellcastingInfo = false

	DB.SpellFlyout_CloseAfterClick = true
	DB.SpellFlyout_HideUnusable = false
	DB.SpellFlyout_SingleRow = false
	DB.SpellFlyout_UpdateFrequently = false

	DB.StaticPopup_Confirm = true

	DB.TalkingHead_MasterSwitch = false

	DB.Technoscryers = true
	DB.timeSpentInHouseEditor = 0

	DB.TooltipChestKeys = true
	DB.TooltipDelvesItem = false
	DB.TooltipDyeDeez = true
	DB.TooltipItemQuest = true
	DB.TooltipItemReagents = false
	DB.TooltipProfessionKnowledge = true
	DB.TooltipRepTokens = true
	DB.TooltipRichSoil = true
	DB.TooltipSnapdragonTreats = true
	DB.TooltipTransmogEnsemble = true

	DB.TrackerBarInsideSeparateBag = false
	DB.TrackHolidayItem = true
	DB.TrackItemUpgradeCurrency = true

	DB.TransmogChatCommand = false
	DB.TransmogOutfitSelect = false

	DB.VotingResultsExpanded = true

	DB.WorldMapPin_PlayerPing = true
	DB.WorldMapPin_Size = 1
	DB.WorldMapPin_TWW = true
	DB.WorldMapPin_TWW_Delve = true
	DB.WorldMapPin_TWW_Quest = true
	DB.WorldMapPinSeedPlanting = true

	DB.WoWAnniversary = true

	Private:Print(L["Plumber profile has been set."])
end
