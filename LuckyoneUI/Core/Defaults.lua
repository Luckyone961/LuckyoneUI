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
		damageMeter = {
			enable = false,
			visibility = 'SHOW',
			secondWindow = true,
			backdrop = false,
			syncSize = true,
			width = 486,
			height = 208,
			innerSpacing = 2,
			outerSpacing = 2,
			barTexture = Private.Texture,
			barHeight = 18,
			barSpacing = 1,
			backdropAlpha = 0,
			classColors = true,
			othersColor = { r = 0.5, g = 0.5, b = 1 },
			showIcons = true,
			font = Private.Font,
			fontOutline = Private.Outline,
			fontSize = 12,
			numberDisplay = 'COMPACT',
			bracketStyle = 'PARENTHESES',
			valueSpacing = 1,
			showRank = false,
			stripRealm = true,
			nameXOffset = 0,
			nameYOffset = 0,
			valueXOffset = 0,
			valueYOffset = 0,
			headerHeight = 18,
			useValueColor = false,
			windowOne = {
				meterType = 0,
				sessionType = 1,
			},
			windowTwo = {
				meterType = 2,
				sessionType = 1,
			},
		},
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
					perRow = 8,
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
				enterColor = { r = 1, g = 0, b = 0 },
				leaveColor = { r = 0, g = 1, b = 0 },
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
