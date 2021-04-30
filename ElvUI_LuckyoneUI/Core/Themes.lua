local L1UI, E, L, V, P, G = unpack(select(2, ...))

local ReloadUI = ReloadUI

-- UnitFrame color themes
function L1UI:SetupTheme(theme)

	if theme == 'dark' then

		E.db["unitframe"]["colors"]["classbackdrop"] = true
		E.db["unitframe"]["colors"]["customhealthbackdrop"] = false
		E.db["unitframe"]["colors"]["healthMultiplier"] = 0.75

		E.db["unitframe"]["colors"]["health"]["b"] = 0.058823529411765
		E.db["unitframe"]["colors"]["health"]["g"] = 0.058823529411765
		E.db["unitframe"]["colors"]["health"]["r"] = 0.058823529411765
		E.db["unitframe"]["colors"]["healthclass"] = false

		E.db["unitframe"]["colors"]["transparentHealth"] = true
		E.db["unitframe"]["colors"]["useDeadBackdrop"] = true

	elseif theme == 'class' then

		E.db["unitframe"]["colors"]["classbackdrop"] = false
		E.db["unitframe"]["colors"]["customhealthbackdrop"] = true
		E.db["unitframe"]["colors"]["health_backdrop"]["b"] = 0.10196078431373
		E.db["unitframe"]["colors"]["health_backdrop"]["g"] = 0.10196078431373
		E.db["unitframe"]["colors"]["health_backdrop"]["r"] = 0.10196078431373
		E.db["unitframe"]["colors"]["healthMultiplier"] = 0

		E.db["unitframe"]["colors"]["healthclass"] = true

		E.db["unitframe"]["colors"]["transparentHealth"] = true
		E.db["unitframe"]["colors"]["useDeadBackdrop"] = true

	end

	E:StaggeredUpdateAll(nil, true)

	L1UI:Print('Theme has been set.')
end

-- RaidFrame layouts
function L1UI:RaidFrames(style)

	if not E.db.movers then E.db.movers = {} end

	if style == 'vertical' then

		E.db["movers"]["ElvUF_RaidMover"] = "TOPLEFT,ElvUIParent,TOPLEFT,1,-76"
		E.db["unitframe"]["units"]["raid"]["growthDirection"] = "DOWN_RIGHT"

		E.db["unitframe"]["units"]["raid"]["customTexts"] = E.db["unitframe"]["units"]["raid"]["customTexts"] or {}
		E.db["unitframe"]["units"]["raid"]["customTexts"]["Luckyone_Name"] = {
			["attachTextTo"] = "Health",
			["enable"] = true,
			["font"] = "Expressway",
			["fontOutline"] = "OUTLINE",
			["justifyH"] = "CENTER",
			["size"] = 14,
			["text_format"] = "[namecolor][name:medium]",
			["xOffset"] = 0,
			["yOffset"] = 0
		}

		E.db["unitframe"]["units"]["raid"]["classbar"]["fill"] = "spaced"
		E.db["unitframe"]["units"]["raid"]["classbar"]["height"] = 6
		E.db["unitframe"]["units"]["raid"]["debuffs"]["countFont"] = "Expressway"
		E.db["unitframe"]["units"]["raid"]["debuffs"]["desaturate"] = false
		E.db["unitframe"]["units"]["raid"]["debuffs"]["maxDuration"] = 0
		E.db["unitframe"]["units"]["raid"]["debuffs"]["priority"] = "Blacklist,RaidDebuffs,Dispellable"
		E.db["unitframe"]["units"]["raid"]["groupSpacing"] = 6
		E.db["unitframe"]["units"]["raid"]["groupsPerRowCol"] = 6
		E.db["unitframe"]["units"]["raid"]["growthDirection"] = "DOWN_RIGHT"
		E.db["unitframe"]["units"]["raid"]["healPrediction"]["absorbStyle"] = "WRAPPED"
		E.db["unitframe"]["units"]["raid"]["health"]["text_format"] = ""
		E.db["unitframe"]["units"]["raid"]["height"] = 24
		E.db["unitframe"]["units"]["raid"]["horizontalSpacing"] = -1
		E.db["unitframe"]["units"]["raid"]["name"]["attachTextTo"] = "Frame"
		E.db["unitframe"]["units"]["raid"]["name"]["position"] = "LEFT"
		E.db["unitframe"]["units"]["raid"]["name"]["text_format"] = ""
		E.db["unitframe"]["units"]["raid"]["numGroups"] = 6
		E.db["unitframe"]["units"]["raid"]["phaseIndicator"]["anchorPoint"] = "LEFT"
		E.db["unitframe"]["units"]["raid"]["phaseIndicator"]["scale"] = 0.5
		E.db["unitframe"]["units"]["raid"]["power"]["enable"] = false
		E.db["unitframe"]["units"]["raid"]["raidicon"]["attachTo"] = "RIGHT"
		E.db["unitframe"]["units"]["raid"]["raidicon"]["attachToObject"] = "Health"
		E.db["unitframe"]["units"]["raid"]["raidicon"]["size"] = 12
		E.db["unitframe"]["units"]["raid"]["raidicon"]["xOffset"] = -15
		E.db["unitframe"]["units"]["raid"]["raidicon"]["yOffset"] = 0
		E.db["unitframe"]["units"]["raid"]["rdebuffs"]["font"] = "Expressway"
		E.db["unitframe"]["units"]["raid"]["rdebuffs"]["fontOutline"] = "OUTLINE"
		E.db["unitframe"]["units"]["raid"]["rdebuffs"]["size"] = 23
		E.db["unitframe"]["units"]["raid"]["rdebuffs"]["stack"]["position"] = "CENTER"
		E.db["unitframe"]["units"]["raid"]["rdebuffs"]["stack"]["yOffset"] = 0
		E.db["unitframe"]["units"]["raid"]["rdebuffs"]["xOffset"] = 82
		E.db["unitframe"]["units"]["raid"]["readycheckIcon"]["attachTo"] = "Frame"
		E.db["unitframe"]["units"]["raid"]["readycheckIcon"]["xOffset"] = 48
		E.db["unitframe"]["units"]["raid"]["resurrectIcon"]["size"] = 25
		E.db["unitframe"]["units"]["raid"]["roleIcon"]["attachTo"] = "Frame"
		E.db["unitframe"]["units"]["raid"]["roleIcon"]["damager"] = false
		E.db["unitframe"]["units"]["raid"]["roleIcon"]["position"] = "RIGHT"
		E.db["unitframe"]["units"]["raid"]["roleIcon"]["size"] = 14
		E.db["unitframe"]["units"]["raid"]["roleIcon"]["xOffset"] = -5
		E.db["unitframe"]["units"]["raid"]["roleIcon"]["yOffset"] = 0
		E.db["unitframe"]["units"]["raid"]["summonIcon"]["attachTo"] = "LEFT"
		E.db["unitframe"]["units"]["raid"]["summonIcon"]["size"] = 25
		E.db["unitframe"]["units"]["raid"]["summonIcon"]["xOffset"] = 35
		E.db["unitframe"]["units"]["raid"]["threatStyle"] = "NONE"
		E.db["unitframe"]["units"]["raid"]["verticalSpacing"] = 1
		E.db["unitframe"]["units"]["raid"]["visibility"] = "[@raid6,noexists][@raid31,exists] hide;show"
		E.db["unitframe"]["units"]["raid"]["width"] = 140
	
	elseif style == 'block' then

		E.db["movers"]["ElvUF_RaidMover"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,1,173"
		E.db["unitframe"]["units"]["raid"]["growthDirection"] = "RIGHT_DOWN"

		E.db["unitframe"]["units"]["raid"]["customTexts"] = E.db["unitframe"]["units"]["raid"]["customTexts"] or {}
		E.db["unitframe"]["units"]["raid"]["customTexts"]["Luckyone_Name"] = {
			["attachTextTo"] = "Health",
			["enable"] = true,
			["font"] = "Expressway",
			["fontOutline"] = "OUTLINE",
			["justifyH"] = "CENTER",
			["size"] = 12,
			["text_format"] = "[namecolor][name:short]",
			["xOffset"] = 0,
			["yOffset"] = 0
		}

		E.db["unitframe"]["units"]["raid"]["classbar"]["fill"] = "spaced"
		E.db["unitframe"]["units"]["raid"]["classbar"]["height"] = 6
		E.db["unitframe"]["units"]["raid"]["debuffs"]["countFont"] = "Expressway"
		E.db["unitframe"]["units"]["raid"]["debuffs"]["desaturate"] = false
		E.db["unitframe"]["units"]["raid"]["debuffs"]["maxDuration"] = 0
		E.db["unitframe"]["units"]["raid"]["debuffs"]["priority"] = "Blacklist,RaidDebuffs,Dispellable"
		E.db["unitframe"]["units"]["raid"]["groupSpacing"] = 0
		E.db["unitframe"]["units"]["raid"]["groupsPerRowCol"] = 1
		E.db["unitframe"]["units"]["raid"]["healPrediction"]["absorbStyle"] = "WRAPPED"
		E.db["unitframe"]["units"]["raid"]["health"]["text_format"] = ""
		E.db["unitframe"]["units"]["raid"]["height"] = 40
		E.db["unitframe"]["units"]["raid"]["horizontalSpacing"] = 1
		E.db["unitframe"]["units"]["raid"]["name"]["text_format"] = ""
		E.db["unitframe"]["units"]["raid"]["numGroups"] = 6
		E.db["unitframe"]["units"]["raid"]["phaseIndicator"]["anchorPoint"] = "BOTTOM"
		E.db["unitframe"]["units"]["raid"]["phaseIndicator"]["scale"] = 0.5
		E.db["unitframe"]["units"]["raid"]["power"]["enable"] = false
		E.db["unitframe"]["units"]["raid"]["raidicon"]["attachTo"] = "RIGHT"
		E.db["unitframe"]["units"]["raid"]["raidicon"]["attachToObject"] = "Health"
		E.db["unitframe"]["units"]["raid"]["raidicon"]["size"] = 12
		E.db["unitframe"]["units"]["raid"]["raidicon"]["xOffset"] = -15
		E.db["unitframe"]["units"]["raid"]["raidicon"]["yOffset"] = 0
		E.db["unitframe"]["units"]["raid"]["rdebuffs"]["font"] = "Expressway"
		E.db["unitframe"]["units"]["raid"]["rdebuffs"]["fontOutline"] = "OUTLINE"
		E.db["unitframe"]["units"]["raid"]["rdebuffs"]["size"] = 18
		E.db["unitframe"]["units"]["raid"]["rdebuffs"]["stack"]["position"] = "CENTER"
		E.db["unitframe"]["units"]["raid"]["rdebuffs"]["stack"]["yOffset"] = 0
		E.db["unitframe"]["units"]["raid"]["rdebuffs"]["xOffset"] = 0
		E.db["unitframe"]["units"]["raid"]["readycheckIcon"]["attachTo"] = "Frame"
		E.db["unitframe"]["units"]["raid"]["readycheckIcon"]["xOffset"] = 1
		E.db["unitframe"]["units"]["raid"]["resurrectIcon"]["size"] = 25
		E.db["unitframe"]["units"]["raid"]["roleIcon"]["attachTo"] = "Frame"
		E.db["unitframe"]["units"]["raid"]["roleIcon"]["damager"] = false
		E.db["unitframe"]["units"]["raid"]["roleIcon"]["position"] = "TOP"
		E.db["unitframe"]["units"]["raid"]["roleIcon"]["size"] = 12
		E.db["unitframe"]["units"]["raid"]["roleIcon"]["xOffset"] = 0
		E.db["unitframe"]["units"]["raid"]["roleIcon"]["yOffset"] = 0
		E.db["unitframe"]["units"]["raid"]["summonIcon"]["attachTo"] = "BOTTOM"
		E.db["unitframe"]["units"]["raid"]["summonIcon"]["size"] = 25
		E.db["unitframe"]["units"]["raid"]["summonIcon"]["xOffset"] = 0
		E.db["unitframe"]["units"]["raid"]["threatStyle"] = "NONE"
		E.db["unitframe"]["units"]["raid"]["verticalSpacing"] = 1
		E.db["unitframe"]["units"]["raid"]["visibility"] = "[@raid6,noexists][@raid31,exists] hide;show"
		E.db["unitframe"]["units"]["raid"]["width"] = 82
	end

	E:StaggeredUpdateAll(nil, true)

	ReloadUI()
end

-- Switch between LuckyoneUI and ElvUI text formats
function L1UI:SwapTags(group)

	E.db["unitframe"]["units"]["arena"]["customTexts"] = E.db["unitframe"]["units"]["arena"]["customTexts"] or {}
	E.db["unitframe"]["units"]["boss"]["customTexts"] = E.db["unitframe"]["units"]["boss"]["customTexts"] or {}
	E.db["unitframe"]["units"]["focus"]["customTexts"] = E.db["unitframe"]["units"]["focus"]["customTexts"] or {}
	E.db["unitframe"]["units"]["focustarget"]["customTexts"] = E.db["unitframe"]["units"]["focustarget"]["customTexts"] or {}
	E.db["unitframe"]["units"]["party"]["customTexts"] = E.db["unitframe"]["units"]["party"]["customTexts"] or {}
	E.db["unitframe"]["units"]["pet"]["customTexts"] = E.db["unitframe"]["units"]["pet"]["customTexts"] or {}
	E.db["unitframe"]["units"]["player"]["customTexts"] = E.db["unitframe"]["units"]["player"]["customTexts"] or {}
	E.db["unitframe"]["units"]["raid"]["customTexts"] = E.db["unitframe"]["units"]["raid"]["customTexts"] or {}
	E.db["unitframe"]["units"]["target"]["customTexts"] = E.db["unitframe"]["units"]["target"]["customTexts"] or {}
	E.db["unitframe"]["units"]["targettarget"]["customTexts"] = E.db["unitframe"]["units"]["targettarget"]["customTexts"] or {}

	if group == 'elvui' then

		E.db["nameplates"]["units"]["ENEMY_NPC"]["health"]["text"]["format"] = "[perhp<%]"
		E.db["nameplates"]["units"]["ENEMY_NPC"]["level"]["format"] = ""
		E.db["nameplates"]["units"]["ENEMY_NPC"]["name"]["format"] = "[name:last][classificationcolor][ >classification]"
		E.db["nameplates"]["units"]["ENEMY_PLAYER"]["health"]["text"]["format"] = "[perhp<%]"
		E.db["nameplates"]["units"]["ENEMY_PLAYER"]["level"]["format"] = ""
		E.db["nameplates"]["units"]["ENEMY_PLAYER"]["name"]["format"] = "[name:medium]"
		E.db["nameplates"]["units"]["ENEMY_PLAYER"]["title"]["format"] = "[npctitle]"
		E.db["nameplates"]["units"]["FRIENDLY_NPC"]["health"]["text"]["format"] = "[perhp<%]"
		E.db["nameplates"]["units"]["FRIENDLY_NPC"]["level"]["format"] = "[level]"
		E.db["nameplates"]["units"]["FRIENDLY_PLAYER"]["health"]["text"]["format"] = "[perhp<%]"
		E.db["nameplates"]["units"]["FRIENDLY_PLAYER"]["level"]["format"] = "[level]"
		E.db["unitframe"]["units"]["arena"]["customTexts"]["Luckyone_HP"]["text_format"] = "[perhp<%]"
		E.db["unitframe"]["units"]["arena"]["customTexts"]["Luckyone_Name"]["text_format"] = "[namecolor][name:medium]"
		E.db["unitframe"]["units"]["arena"]["customTexts"]["Luckyone_Power"]["text_format"] = "[powercolor][perpp<%]"
		E.db["unitframe"]["units"]["boss"]["customTexts"]["Luckyone_HP"]["text_format"] = "[perhp<%]"
		E.db["unitframe"]["units"]["boss"]["customTexts"]["Luckyone_Name"]["text_format"] = "[namecolor][name:last]"
		E.db["unitframe"]["units"]["boss"]["customTexts"]["Luckyone_Power"]["text_format"] = "[powercolor][perpp<%]"
		E.db["unitframe"]["units"]["focus"]["customTexts"]["Luckyone_HP"]["text_format"] = "[perhp<%] | [health:current:shortvalue]"
		E.db["unitframe"]["units"]["focus"]["customTexts"]["Luckyone_Level"]["text_format"] = "[namecolor][level][classificationcolor][ >classification]"
		E.db["unitframe"]["units"]["focus"]["customTexts"]["Luckyone_Name"]["text_format"] = "[namecolor][name:last]"
		E.db["unitframe"]["units"]["focus"]["customTexts"]["Luckyone_Power"]["text_format"] = "[powercolor][perpp<%]"
		E.db["unitframe"]["units"]["focustarget"]["customTexts"]["Luckyone_HP"]["text_format"] = "[perhp<%]"
		E.db["unitframe"]["units"]["focustarget"]["customTexts"]["Luckyone_Name"]["text_format"] = "[namecolor][name:last]"
		E.db["unitframe"]["units"]["party"]["customTexts"]["Luckyone_Name"]["text_format"] = "[namecolor][name:short]"
		E.db["unitframe"]["units"]["pet"]["customTexts"]["Luckyone_HP"]["text_format"] = "[perhp<%]"
		E.db["unitframe"]["units"]["pet"]["customTexts"]["Luckyone_Name"]["text_format"] = "[namecolor]Pet"
		E.db["unitframe"]["units"]["player"]["customTexts"]["Luckyone_HP"]["text_format"] = "[health:current:shortvalue] | [perhp<%]"
		E.db["unitframe"]["units"]["player"]["customTexts"]["Luckyone_Level"]["text_format"] = "[namecolor][level]"
		E.db["unitframe"]["units"]["player"]["customTexts"]["Luckyone_Name"]["text_format"] = "[namecolor][name:veryshort]"
		E.db["unitframe"]["units"]["player"]["customTexts"]["Luckyone_Power"]["text_format"] = "[powercolor][perpp<%]"
		E.db["unitframe"]["units"]["raid"]["customTexts"]["Luckyone_Name"]["text_format"] = "[namecolor][name:short]"
		E.db["unitframe"]["units"]["target"]["customTexts"]["Luckyone_HP"]["text_format"] = "[perhp<%] | [health:current:shortvalue]"
		E.db["unitframe"]["units"]["target"]["customTexts"]["Luckyone_Level"]["text_format"] = "[namecolor][level][classificationcolor][ >classification]"
		E.db["unitframe"]["units"]["target"]["customTexts"]["Luckyone_Name"]["text_format"] = "[namecolor][name:last]"
		E.db["unitframe"]["units"]["target"]["customTexts"]["Luckyone_Power"]["text_format"] = "[powercolor][perpp<%]"
		E.db["unitframe"]["units"]["targettarget"]["customTexts"]["Luckyone_HP"]["text_format"] = "[perhp<%]"
		E.db["unitframe"]["units"]["targettarget"]["customTexts"]["Luckyone_Name"]["text_format"] = "[namecolor][name:last]"

	elseif group == 'luckyone' then

		E.db["nameplates"]["units"]["ENEMY_NPC"]["health"]["text"]["format"] = "[luckyone:health:percent]"
		E.db["nameplates"]["units"]["ENEMY_NPC"]["level"]["format"] = ""
		E.db["nameplates"]["units"]["ENEMY_NPC"]["name"]["format"] = "[name:last][classificationcolor][ >luckyone:classification]"
		E.db["nameplates"]["units"]["ENEMY_PLAYER"]["health"]["text"]["format"] = "[luckyone:health:percent]"
		E.db["nameplates"]["units"]["ENEMY_PLAYER"]["level"]["format"] = ""
		E.db["nameplates"]["units"]["ENEMY_PLAYER"]["name"]["format"] = "[name:medium]"
		E.db["nameplates"]["units"]["ENEMY_PLAYER"]["title"]["format"] = "[npctitle]"
		E.db["nameplates"]["units"]["FRIENDLY_NPC"]["health"]["text"]["format"] = "[luckyone:health:percent]"
		E.db["nameplates"]["units"]["FRIENDLY_NPC"]["level"]["format"] = "[level]"
		E.db["nameplates"]["units"]["FRIENDLY_PLAYER"]["health"]["text"]["format"] = "[luckyone:health:percent]"
		E.db["nameplates"]["units"]["FRIENDLY_PLAYER"]["level"]["format"] = "[level]"
		E.db["unitframe"]["units"]["arena"]["customTexts"]["Luckyone_HP"]["text_format"] = "[luckyone:health:percent]"
		E.db["unitframe"]["units"]["arena"]["customTexts"]["Luckyone_Name"]["text_format"] = "[namecolor][name:medium]"
		E.db["unitframe"]["units"]["arena"]["customTexts"]["Luckyone_Power"]["text_format"] = "[powercolor][perpp<%]"
		E.db["unitframe"]["units"]["boss"]["customTexts"]["Luckyone_HP"]["text_format"] = "[luckyone:health:percent]"
		E.db["unitframe"]["units"]["boss"]["customTexts"]["Luckyone_Name"]["text_format"] = "[namecolor][name:last]"
		E.db["unitframe"]["units"]["boss"]["customTexts"]["Luckyone_Power"]["text_format"] = "[powercolor][perpp<%]"
		E.db["unitframe"]["units"]["focus"]["customTexts"]["Luckyone_HP"]["text_format"] = "[luckyone:health:percent] | [health:current:shortvalue]"
		E.db["unitframe"]["units"]["focus"]["customTexts"]["Luckyone_Level"]["text_format"] = "[namecolor][level][classificationcolor][ >luckyone:classification]"
		E.db["unitframe"]["units"]["focus"]["customTexts"]["Luckyone_Name"]["text_format"] = "[namecolor][name:last]"
		E.db["unitframe"]["units"]["focus"]["customTexts"]["Luckyone_Power"]["text_format"] = "[powercolor][perpp<%]"
		E.db["unitframe"]["units"]["focustarget"]["customTexts"]["Luckyone_HP"]["text_format"] = "[luckyone:health:percent]"
		E.db["unitframe"]["units"]["focustarget"]["customTexts"]["Luckyone_Name"]["text_format"] = "[namecolor][name:last]"
		E.db["unitframe"]["units"]["party"]["customTexts"]["Luckyone_Name"]["text_format"] = "[namecolor][name:short][ >luckyone:healermana:percent]"
		E.db["unitframe"]["units"]["pet"]["customTexts"]["Luckyone_HP"]["text_format"] = "[luckyone:health:percent]"
		E.db["unitframe"]["units"]["pet"]["customTexts"]["Luckyone_Name"]["text_format"] = "[namecolor]Pet"
		E.db["unitframe"]["units"]["player"]["customTexts"]["Luckyone_HP"]["text_format"] = "[health:current:shortvalue] | [luckyone:health:percent]"
		E.db["unitframe"]["units"]["player"]["customTexts"]["Luckyone_Level"]["text_format"] = "[namecolor][level]"
		E.db["unitframe"]["units"]["player"]["customTexts"]["Luckyone_Name"]["text_format"] = "[namecolor][name:veryshort]"
		E.db["unitframe"]["units"]["player"]["customTexts"]["Luckyone_Power"]["text_format"] = "[powercolor][perpp<%]"
		E.db["unitframe"]["units"]["raid"]["customTexts"]["Luckyone_Name"]["text_format"] = "[namecolor][name:short]"
		E.db["unitframe"]["units"]["target"]["customTexts"]["Luckyone_HP"]["text_format"] = "[luckyone:health:percent] | [health:current:shortvalue]"
		E.db["unitframe"]["units"]["target"]["customTexts"]["Luckyone_Level"]["text_format"] = "[namecolor][level][classificationcolor][ >luckyone:classification]"
		E.db["unitframe"]["units"]["target"]["customTexts"]["Luckyone_Name"]["text_format"] = "[namecolor][name:last]"
		E.db["unitframe"]["units"]["target"]["customTexts"]["Luckyone_Power"]["text_format"] = "[powercolor][perpp<%]"
		E.db["unitframe"]["units"]["targettarget"]["customTexts"]["Luckyone_HP"]["text_format"] = "[luckyone:health:percent]"
		E.db["unitframe"]["units"]["targettarget"]["customTexts"]["Luckyone_Name"]["text_format"] = "[namecolor][name:last]"

	end

	E:StaggeredUpdateAll(nil, true)
end
