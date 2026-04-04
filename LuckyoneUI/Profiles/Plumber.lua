-- Addon namespace
local _, Private = ...
local L = Private.Libs.ACL

-- Plumber profile
function Private:Setup_Plumber()
	if not Private.IsAddOnLoaded('Plumber') then Private:Print('Plumber ' .. L["is not installed or enabled."]) return end

	if not PlumberDB then
		PlumberDB = {}
	end

	PlumberDB.AlternativePlayerChoiceUI = true
	PlumberDB.AppearanceTab = true
	PlumberDB.AppearanceTab_ModelCount = 1
	PlumberDB.AutoJoinEvents = false
	PlumberDB.BackpackItemTracker = false
	PlumberDB.BlizzardSuperTrack = false
	PlumberDB.BlizzFixEventToast = true
	PlumberDB.BlizzFixFishingArtifact = true

	PlumberDB.BossBanner_MasterSwitch = false

	PlumberDB.BreakTime = false

	PlumberDB.CatalystUI = true
	PlumberDB.ChatOptions = false
	PlumberDB.ConciseTokenTooltip = true
	PlumberDB.CraftSearchExtended = false

	PlumberDB.DecorModelScaleRef = true
	PlumberDB.DecorModelScaleRef_ShowBanana = false

	PlumberDB.Delves_Automation = true
	PlumberDB.Delves_Dashboard = true
	PlumberDB.Delves_SeasonProgress = true

	PlumberDB.EditModeShowPlumberUI = true
	PlumberDB.EmeraldBountySeedList = true
	PlumberDB.EnableNewByDefault = false
	PlumberDB.ExpansionLandingPage = true
	PlumberDB.GossipFrameMedal = true
	PlumberDB.HandyLockpick = true
	PlumberDB.HideZeroCountItem = true
	PlumberDB.HolidayDungeon = true

	PlumberDB.Housing_CatalogSearch = true
	PlumberDB.Housing_Clock = true
	PlumberDB.Housing_Clock_AnalogClock = false
	PlumberDB.Housing_CustomizeMode = true
	PlumberDB.Housing_DecorHover = true
	PlumberDB.Housing_DecorHover_DuplicateKey = 2
	PlumberDB.Housing_DecorHover_EnableDupe = true
	PlumberDB.Housing_ItemAcquiredAlert = false
	PlumberDB.Housing_Macro = true

	PlumberDB.HuntTable = true
	PlumberDB.InstanceDifficulty = true
	PlumberDB.ItemUpgradeUI = true

	PlumberDB.LandingButton_ShowButton = false

	PlumberDB.LandingPage_Activity_HideCompleted = true
	PlumberDB.LandingPage_AdvancedTooltip = true
	PlumberDB.LandingPage_Raid_CollapsedAchievement = false

	PlumberDB.LootUI = false
	PlumberDB.MerchantPrice = false
	PlumberDB.NameplateQuest = false

	PlumberDB.NameplateWidget = true
	PlumberDB.Navigator_Dreamseed = false
	PlumberDB.Navigator_MasterSwitch = true
	PlumberDB.NewExpansionLandingPage = true

	PlumberDB.PartyInviterInfo = false

	PlumberDB.PlayerChoiceFrameToken = true
	PlumberDB.PlayerTitleUI = true
	PlumberDB.Plunderstore = true
	PlumberDB.Plunderstore_HideCollected = true
	PlumberDB.ProfessionsBook = true
	PlumberDB.QuestItemDestroyAlert = true

	PlumberDB.QueueStatus = false

	PlumberDB.quickslotFromRadian = 0
	PlumberDB.QuickSlotHighContrastMode = false

	PlumberDB.SettingsPanel_AutoShowChangelog = false
	PlumberDB.SettingsPanel_ChangelogFontSize = 1

	PlumberDB.SoftTargetName = false

	PlumberDB.SourceAchievementLink = true
	PlumberDB.SpellcastingInfo = false

	PlumberDB.SpellFlyout_CloseAfterClick = true
	PlumberDB.SpellFlyout_HideUnusable = false
	PlumberDB.SpellFlyout_SingleRow = false
	PlumberDB.SpellFlyout_UpdateFrequently = false

	PlumberDB.StaticPopup_Confirm = true

	PlumberDB.TalkingHead_MasterSwitch = false

	PlumberDB.Technoscryers = true
	PlumberDB.timeSpentInHouseEditor = 0

	PlumberDB.TooltipChestKeys = true
	PlumberDB.TooltipDelvesItem = false
	PlumberDB.TooltipDyeDeez = true
	PlumberDB.TooltipItemQuest = true
	PlumberDB.TooltipItemReagents = false
	PlumberDB.TooltipProfessionKnowledge = true
	PlumberDB.TooltipRepTokens = true
	PlumberDB.TooltipRichSoil = true
	PlumberDB.TooltipSnapdragonTreats = true
	PlumberDB.TooltipTransmogEnsemble = true

	PlumberDB.TrackerBarInsideSeparateBag = false
	PlumberDB.TrackHolidayItem = true
	PlumberDB.TrackItemUpgradeCurrency = true

	PlumberDB.TransmogChatCommand = false
	PlumberDB.TransmogOutfitSelect = false

	PlumberDB.VotingResultsExpanded = true

	PlumberDB.WorldMapPin_PlayerPing = true
	PlumberDB.WorldMapPin_Size = 1
	PlumberDB.WorldMapPin_TWW = true
	PlumberDB.WorldMapPin_TWW_Delve = true
	PlumberDB.WorldMapPin_TWW_Quest = true
	PlumberDB.WorldMapPinSeedPlanting = true

	PlumberDB.WoWAnniversary = true

	Private:Print(L["Plumber profile has been set."])
end
