-- Addon namespace
local _, Private = ...
local L = Private.Libs.ACL

-- Global environment
local _G = _G

-- Plumber profile
function Private:Setup_Plumber()
	if not Private.IsAddOnLoaded('Plumber') then Private:Print('Plumber ' .. L["is not installed or enabled."]) return end

	if not PlumberDB then PlumberDB = {} end

	PlumberDB.AlternativePlayerChoiceUI = true
	PlumberDB.AppearanceTab = true
	PlumberDB.AppearanceTab_ModelCount = 1
	PlumberDB.AutoJoinEvents = false
	PlumberDB.BackpackItemTracker = false
	PlumberDB.BlizzardSuperTrack = false
	PlumberDB.BlizzFixEventToast = true
	PlumberDB.BlizzFixFishingArtifact = true

	PlumberDB.BossBanner_HideLootWhenSolo = true
	PlumberDB.BossBanner_MasterSwitch = false
	PlumberDB.BossBanner_ValuableItemOnly = true

	PlumberDB.BreakTime = false
	PlumberDB.BreakTime_Cycle = 30
	PlumberDB.BreakTime_Delay = 5
	PlumberDB.BreakTime_DNDCombat = true
	PlumberDB.BreakTime_DNDInstances = false
	PlumberDB.BreakTime_FlashTaskbar = false
	PlumberDB.BreakTime_Rest = 5
	PlumberDB.BreakTimeFlag_Cancelled = false

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
	PlumberDB.Housing_Clock_AnalogClock = true
	PlumberDB.Housing_CustomizeMode = true
	PlumberDB.Housing_DecorHover = true
	PlumberDB.Housing_DecorHover_DuplicateKey = 2
	PlumberDB.Housing_DecorHover_EnableDupe = true
	PlumberDB.Housing_ItemAcquiredAlert = false
	PlumberDB.Housing_Macro = true

	PlumberDB.HuntTable = true
	PlumberDB.InstanceDifficulty = true
	PlumberDB.ItemUpgradeUI = true

	PlumberDB.LandingButton_DarkColor = false
	PlumberDB.LandingButton_HideWhenIdle = false
	PlumberDB.LandingButton_PrimaryUI = 1
	PlumberDB.LandingButton_ReduceSize = false
	PlumberDB.LandingButton_ShowButton = false
	PlumberDB.LandingButton_SmartExpansion = false
	PlumberDB.LandingButton_Unaffected = false
	PlumberDB.LandingButton_UseLibDBIcon_NoBorder = true
	PlumberDB.LandingPage_Activity_HideCompleted = true
	PlumberDB.LandingPage_AdvancedTooltip = true
	PlumberDB.LandingPage_Raid_CollapsedAchievement = false

	PlumberDB.LootUI = false
	PlumberDB.LootUI_BackgroundAlpha = 0.5
	PlumberDB.LootUI_CombineItems = false
	PlumberDB.LootUI_FadeDelayPerItem = 0.25
	PlumberDB.LootUI_FontSize = 12
	PlumberDB.LootUI_ForceAutoLoot = true
	PlumberDB.LootUI_GrowUpwards = false
	PlumberDB.LootUI_HideTitle = false
	PlumberDB.LootUI_HotkeyName = 'E'
	PlumberDB.LootUI_ItemsPerPage = 6
	PlumberDB.LootUI_LootUnderMouse = false
	PlumberDB.LootUI_LowFrameStrata = false
	PlumberDB.LootUI_NewTransmogIcon = true
	PlumberDB.LootUI_ReplaceDefaultAlert = false
	PlumberDB.LootUI_ShowAllCurrencyChange = false
	PlumberDB.LootUI_ShowAllMoneyChange = false
	PlumberDB.LootUI_ShowItemCount = false
	PlumberDB.LootUI_ShowReputation = false
	PlumberDB.LootUI_UseCustomColor = false
	PlumberDB.LootUI_UseHotkey = true
	PlumberDB.LootUI_UseStockUI = false
	PlumberDB.LootUI_WindowHide = false

	PlumberDB.MerchantPrice = false

	PlumberDB.NameplateQuest = false
	PlumberDB.NameplateQuest_IconSize = 2
	PlumberDB.NameplateQuest_ProgressFormat = 1
	PlumberDB.NameplateQuest_ProgressShowIcon = false
	PlumberDB.NameplateQuest_ShowPartyQuest = false
	PlumberDB.NameplateQuest_ShowProgressModifierKey = 'ALT'
	PlumberDB.NameplateQuest_ShowProgressOnHover = false
	PlumberDB.NameplateQuest_ShowProgressOnKeyPress = false
	PlumberDB.NameplateQuest_ShowTargetProgress = false
	PlumberDB.NameplateQuest_TextOutline = true
	PlumberDB.NameplateQuest_WidgetOffsetX = 0
	PlumberDB.NameplateQuest_WidgetOffsetY = 0

	PlumberDB.NameplateWidget = true
	PlumberDB.Navigator_Dreamseed = false
	PlumberDB.Navigator_MasterSwitch = true
	PlumberDB.NewExpansionLandingPage = true

	PlumberDB.PartyInviter_Faction = false
	PlumberDB.PartyInviter_Race = false
	PlumberDB.PartyInviterInfo = false

	PlumberDB.PlayerChoiceFrameToken = true
	PlumberDB.PlayerTitleUI = true
	PlumberDB.Plunderstore = true
	PlumberDB.Plunderstore_HideCollected = true
	PlumberDB.ProfessionsBook = true
	PlumberDB.QuestItemDestroyAlert = true

	PlumberDB.QueueStatus = false
	PlumberDB.QueueStatus_ShowTime = false
	PlumberDB.QueueStatus_TextPosition = 1

	PlumberDB.quickslotFromRadian = 0
	PlumberDB.QuickSlotHighContrastMode = false

	PlumberDB.SettingsPanel_AutoShowChangelog = false
	PlumberDB.SettingsPanel_ChangelogFontSize = 1

	PlumberDB.SoftTarget_CastBar = true
	PlumberDB.SoftTarget_FontSize = 2
	PlumberDB.SoftTarget_House_HideIcon = false
	PlumberDB.SoftTarget_House_HideName = false
	PlumberDB.SoftTarget_IconSize = 2
	PlumberDB.SoftTarget_Objectives = false
	PlumberDB.SoftTarget_TextOutline = false
	PlumberDB.SoftTargetName = false

	PlumberDB.SourceAchievementLink = true
	PlumberDB.SpellcastingInfo = false

	PlumberDB.SpellFlyout_CloseAfterClick = true
	PlumberDB.SpellFlyout_HideUnusable = false
	PlumberDB.SpellFlyout_SingleRow = false
	PlumberDB.SpellFlyout_UpdateFrequently = false

	PlumberDB.StaticPopup_Confirm = true

	PlumberDB.TalkingHead_BelowWorldMap = false
	PlumberDB.TalkingHead_FontSize = 100
	PlumberDB.TalkingHead_HideInInstance = false
	PlumberDB.TalkingHead_HideWorldQuest = false
	PlumberDB.TalkingHead_InstantText = false
	PlumberDB.TalkingHead_MasterSwitch = false
	PlumberDB.TalkingHead_TextOutline = false

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
