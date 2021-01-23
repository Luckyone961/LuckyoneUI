local L1UI, E, L, V, P, G = unpack(select(2, ...))

local ReloadUI = ReloadUI

-- Option to choose between Dark (Default) and Class color
function L1UI:SetupTheme(theme)

	if theme == 'dark' then

		-- Health Backdrop
		E.db["unitframe"]["colors"]["classbackdrop"] = true
		E.db["unitframe"]["colors"]["customhealthbackdrop"] = false
		E.db["unitframe"]["colors"]["healthMultiplier"] = 0.75

		-- Health Color
		E.db["unitframe"]["colors"]["health"]["b"] = 0.058823529411765
		E.db["unitframe"]["colors"]["health"]["g"] = 0.058823529411765
		E.db["unitframe"]["colors"]["health"]["r"] = 0.058823529411765
		E.db["unitframe"]["colors"]["healthclass"] = false

		-- Misc
		E.db["unitframe"]["colors"]["transparentHealth"] = true
		E.db["unitframe"]["colors"]["useDeadBackdrop"] = true

	elseif theme == 'class' then

		-- Health Backdrop
		E.db["unitframe"]["colors"]["classbackdrop"] = false
		E.db["unitframe"]["colors"]["customhealthbackdrop"] = true
		E.db["unitframe"]["colors"]["health_backdrop"]["b"] = 0.10196078431373
		E.db["unitframe"]["colors"]["health_backdrop"]["g"] = 0.10196078431373
		E.db["unitframe"]["colors"]["health_backdrop"]["r"] = 0.10196078431373
		E.db["unitframe"]["colors"]["healthMultiplier"] = 0

		-- Health Color
		E.db["unitframe"]["colors"]["healthclass"] = true

		-- Misc
		E.db["unitframe"]["colors"]["transparentHealth"] = true
		E.db["unitframe"]["colors"]["useDeadBackdrop"] = true

	end

	E:StaggeredUpdateAll(nil, true)

	L1UI:Print('Theme has been set.')
end

-- Raidframe Theme
function L1UI:RaidFrames(style)

	if not E.db.movers then
		E.db.movers = {}
	end

	if style == 'vertical' then

		-- Growth / Mover
		E.db["movers"]["ElvUF_RaidMover"] = "TOPLEFT,ElvUIParent,TOPLEFT,1,-76"
		E.db["unitframe"]["units"]["raid"]["growthDirection"] = "DOWN_RIGHT"

		-- Custom Text
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

		-- Setup
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

		-- Growth / Mover
		E.db["movers"]["ElvUF_RaidMover"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,1,173"
		E.db["unitframe"]["units"]["raid"]["growthDirection"] = "RIGHT_DOWN"

		-- Custom Text
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

		-- Setup
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
