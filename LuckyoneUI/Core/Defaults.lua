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
			ApplicationCover = false,
			BossBanner = false,
			HousingDecorAlerts = false,
			LossOfControl = false,
			UIErrorsFrame = false,
			ZoneTextFrame = false,
		},
		map = {
			minimap = {
				buttons = {
					enable = false,
					mouseover = false,
					holder = 'ElvUI_MinimapHolder',
					size = 24,
					spacing = 1,
					xOffset = 0,
					yOffset = -1,
					blizzard = {
						expansionLandingPage = false,
					},
				},
			},
		},
		minimap = {
			hide = false,
		},
		misc = {
			dataTextsTweaks = false,
			mythicVisibility = false,
			removeNameplateRealm = false,
		},
		nameplates = {
			focusTexture = 'Luckyone Focus',
			focusTextureEnable = false,
			targetTexture = 'ElvUI Blank',
			targetTextureEnable = false,
		},
		qualityOfLife = {
			autoAcceptRole = false,
			autoDismount = false,
			easyDelete = false,
			preventLootAutoShow = false,
			privacyOverlay = false,
			quickSignup = false,
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
			Blizzard = {
				CooldownViewer = false,
			}
		},
	}
}
