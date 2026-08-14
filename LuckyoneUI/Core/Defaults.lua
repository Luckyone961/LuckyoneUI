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
			TalkingHead = false,
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
			combatText = {
				enable = false,
				enterText = '+Combat',
				leaveText = '-Combat',
				font = Private.Font,
				fontOutline = Private.Outline,
				fontSize = 22,
				enterColor = { r = 0, g = 1, b = 0 },
				leaveColor = { r = 1, g = 0, b = 0 },
				anchor = Private.ElvUI and 'ElvUIParent' or 'UIParent',
				xOffset = 0,
				yOffset = -100,
				fadeTime = 2,
			},
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
