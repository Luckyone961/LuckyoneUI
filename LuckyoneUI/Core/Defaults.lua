-- Addon namespace
local _, Private = ...

-- LuckyoneDB defaults
Private.Defaults = {
	global = {
		dev = false,
		install_version = nil,
		scaled = false,
	},
	profile = {
		-- Modules
		disabledFrames = {
			AlertFrame = false,
			BossBanner = false,
			HousingDecorAlerts = false,
			ZoneTextFrame = false,
		},
		minimap = {
			hide = false,
		},
		qualityOfLife = {
			easyDelete = false,
			privacyOverlay = false,
		},
		skins = {
			BugSack = false,
			DejaClassicStats = false,
			LeatrixPlus = false,
			LFGBulletinBoard = false,
			NovaSpellRankChecker = false,
			NovaWorldBuffs = false,
			Tabardy = false,
			WhatsTraining = false,
		},
	}
}
