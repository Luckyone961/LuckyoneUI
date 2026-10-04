local _, Private = ...

-- Both objective tracker header tabs share these
local function ObjectiveTrackerHeader()
	return {
		font = Private.Font,
		fontOutline = 'OUTLINESLUG',
		fontSize = 14,
		colorType = 'CLASS',
		color = { r = 1, g = 1, b = 1 },
		hideBackground = true,
		underline = true,
		underlineTexture = Private.Texture,
		underlineBorder = true,
		underlineColorType = 'CLASS',
		underlineColor = { r = 1, g = 1, b = 1 },
		underlineHeight = 4,
		underlineWidth = 0,
		underlineOffset = 0,
	}
end

-- Session windows, the meter type each one starts on
local function DamageMeterWindow(meterType)
	return {
		meterType = meterType,
		sessionType = 1, -- Current
		width = 240,
		height = 208,
		xOffset = 0, -- Custom placement without ElvUI movers
		yOffset = 0,
		placement = 'AUTO',
		attachTo = 0,
		attachSize = 50,
		showSessionButton = true,
		showResetButton = true,
		showSettingsButton = false,
		mouseoverButtons = false,
		backdrop = not Private.ElvUI, -- No chat panel behind the windows without ElvUI
		backdropColorType = 'ELVUI',
		backdropColor = { r = 0, g = 0, b = 0, a = 0.8 },
		backdropWidth = 0,
		backdropHeight = 0,
	}
end

-- LuckyoneDB defaults
Private.Defaults = {
	global = {
		DebugDisabledAddOns = {},
		dev = false,
		scaled = false,
	},
	profile = {
		-- Modules
		damageMeter = {
			enable = false,
			visibility = 'SHOW',
			updateInterval = 0.33,
			autoReset = 'NONE',
			autoResetTypes = { party = true, raid = true, scenario = true },
			resetOnLogout = false,
			contentWindows = { world = 0, dungeon = 0, raid = 0, pvp = 0 },
			orientation = 'HORIZONTAL',
			windowCount = 2,
			width = 0, -- Without ElvUI, zero follows the LuckyoneUI chat panel of the chosen scale
			height = 0,
			xOffset = -1, -- Without ElvUI, from the bottom right corner like the ElvUI chat panel
			yOffset = 2,
			innerSpacing = 2,
			outerSpacing = 2,
			barStyle = 'DEFAULT',
			barTexture = Private.ElvUI and Private.Texture or 'Solid', -- Minimalist ships with ElvUI
			barHeight = 20,
			thinBarHeight = 0,
			barSpacing = 1,
			barColorType = 'CLASS',
			barColor = { r = 0.5, g = 0.5, b = 1 },
			barAlpha = 1,
			backdropColorType = 'CUSTOM',
			backdropColor = { r = 1, g = 1, b = 1 },
			backdropAlpha = 0,
			showIcons = true,
			mouseoverHighlight = true,
			pinLocalPlayer = true,
			deathLogPopup = true,
			font = Private.Font,
			fontOutline = 'OUTLINESLUG',
			fontSize = 14,
			nameColorType = 'CUSTOM',
			nameColor = { r = 1, g = 1, b = 1 },
			valueColorType = 'CUSTOM',
			valueColor = { r = 1, g = 1, b = 1 },
			numberDisplay = 'COMPACT',
			bracketStyle = 'NONE',
			valueSpacing = 1,
			showRank = false,
			rankSpacing = 0,
			stripRealm = true,
			nameXOffset = 0,
			nameYOffset = 0,
			valueXOffset = 0,
			valueYOffset = 0,
			headerHeight = 20,
			headerIconSize = 20,
			headerFont = Private.Font,
			headerFontOutline = 'OUTLINESLUG',
			headerFontSize = 14,
			useValueColor = false,
			headerTypeXOffset = 0,
			headerTypeYOffset = 0,
			headerSessionXOffset = 0,
			headerSessionYOffset = 0,
			headerResetXOffset = 0,
			headerResetYOffset = 0,
			headerSettingsXOffset = -1,
			headerSettingsYOffset = 0,
			showBookmarks = true,
			bookmarkDragDrop = true,
			bookmarks = { -- Meter type = its place in the panel
				[0] = 1, -- Damage Done
				[2] = 2, -- Healing Done
				[9] = 3, -- Deaths
				[6] = 4, -- Dispels
				[5] = 5, -- Interrupts
				[10] = 6, -- Enemy Damage Taken
			},
			windows = {
				DamageMeterWindow(0), -- Damage Done
				DamageMeterWindow(2), -- Healing Done
				DamageMeterWindow(9), -- Deaths
				DamageMeterWindow(10), -- Enemy Damage Taken
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
					size = 26,
					spacing = 1,
					perRow = 8,
					xOffset = 0,
					yOffset = -1,
					blizzard = {
						expansionLandingPage = false,
					},
				},
			},
			worldMap = {
				fog = {
					enable = false,
					color = { r = 0.294, g = 0.922, b = 0.173 }, -- #4beb2c
					alpha = 0.8,
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
				fontOutline = 'OUTLINESLUG',
				fontSize = 22,
				enterColor = { r = 1, g = 0, b = 0 },
				leaveColor = { r = 0, g = 1, b = 0 },
				anchor = Private.ElvUI and 'ElvUIParent' or 'UIParent',
				xOffset = 0,
				yOffset = -100,
				fadeTime = 2,
			},
			dataTextsTweaks = false,
			friendsList = {
				enable = false,
				classColor = true,
				level = true,
				bracketStyle = 'NONE',
				factionIcon = true,
				statusIcon = 'SQUARE',
				favoritePosition = 'RIGHT',
				realm = true,
				realmSeparator = 'DASH',
				infoColorType = 'CUSTOM',
				infoColor = { r = 1, g = 1, b = 1 },
				font = Private.Font,
				fontOutline = 'OUTLINESLUG',
				fontSize = 12,
				infoFont = Private.Font,
				infoFontOutline = 'OUTLINESLUG',
				infoFontSize = 11,
			},
			mailbox = {
				currentRealm = false,
				enable = false,
				-- { name = 'Luckyone-LaughingSkull', class = 'DRUID', faction = 'Alliance' }
				favorites = {},
				font = Private.Font,
				fontOutline = 'OUTLINESLUG',
				fontSize = 14,
			},
			mythicVisibility = false,
			objectiveTracker = {
				enable = false,
				findGroupSkin = true,
				scenarioSkin = true,
				mainHeader = ObjectiveTrackerHeader(),
				categoryHeader = ObjectiveTrackerHeader(),
				content = {
					font = Private.Font,
					fontOutline = 'OUTLINESLUG',
					fontSize = 13,
					titleColorType = 'CLASS',
					titleColor = { r = 1, g = 1, b = 1 },
					lineColorType = 'DEFAULT',
					lineColor = { r = 1, g = 1, b = 1 },
					completeColor = { r = 0.6, g = 0.6, b = 0.6 },
					failedColor = { r = 0.8, g = 0.1, b = 0.1 },
					poiScale = 0.9,
					poiOffset = -6,
				},
			},
			removeNameplateRealm = false,
		},
		movableFrames = {
			autoReset = true,
			enable = false,
			modifier = 'NONE',
		},
		nameplates = {
			absorbTexture = 'Solid',
			absorbTextureEnable = false,
			focusTexture = 'Luckyone Focus',
			focusTextureEnable = false,
			healAbsorbTexture = 'Solid',
			healAbsorbTextureEnable = false,
			targetTexture = 'Solid',
			targetTextureEnable = false,
		},
		qualityOfLife = {
			autoAcceptRole = false,
			autoDismount = false,
			easyDelete = false,
			expandMerchant = false,
			expandQuestLog = false,
			fasterLoot = false,
			preventLootAutoShow = false,
			privacyOverlay = false,
			quickSignup = false,
		},
		skins = {
			Attune = false,
			Auctionator = false,
			BigWigs = false,
			BugSack = false,
			ForeverDungeonJournal = false,
			LFGBulletinBoard = false,
			NovaSpellRankChecker = false,
			NovaWorldBuffs = false,
			Plumber = false,
			PremadeGroupsFilter = false,
			RCLootCouncil = false,
			RXPGuides = false,
			SimpleAddonManager = false,
			Simulationcraft = false,
			Tabardy = false,
			WhatsTraining = false,
			Blizzard = {
				CooldownViewer = false,
				DeveloperConsole = false,
			}
		},
		unitframes = {
			absorbTexture = 'Solid',
			absorbTextureEnable = false,
			healAbsorbTexture = 'Solid',
			healAbsorbTextureEnable = false,
		},
	}
}
