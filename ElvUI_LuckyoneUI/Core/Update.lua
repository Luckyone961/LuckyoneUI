local L1UI, E, L, V, P, G = unpack(select(2, ...))

function L1UI:UpdateLayout(layout)

	if not E.db.movers then
		E.db.movers = {}
	end

	-- Filters
	E.db["unitframe"]["units"]["boss"]["buffs"]["priority"] = "Blacklist,Dispellable,RaidBuffsElvUI"
	E.db["unitframe"]["units"]["target"]["buffs"]["priority"] = "Blacklist,Dispellable,RaidBuffsElvUI"
	E.db["nameplates"]["units"]["ENEMY_NPC"]["buffs"]["priority"] = "Blacklist,Dispellable,RaidBuffsElvUI"

	-- PvP Flag
	E.db["unitframe"]["units"]["arena"]["pvpclassificationindicator"]["size"] = 25
	E.db["unitframe"]["units"]["arena"]["pvpclassificationindicator"]["xOffset"] = -20

	-- Boss Frame
	E.db["unitframe"]["units"]["boss"]["buffs"]["countFont"] = "Expressway"
	E.db["unitframe"]["units"]["boss"]["buffs"]["sizeOverride"] = 22
	E.db["unitframe"]["units"]["boss"]["buffs"]["numrows"] = 2
	E.db["unitframe"]["units"]["boss"]["buffs"]["yOffset"] = 11

	-- ActionBar dev changes
	E.db["actionbar"]["bar1"]["alpha"] = 0.75
	E.db["actionbar"]["bar1"]["buttonSize"] = 28
	E.db["actionbar"]["bar1"]["countFont"] = "Expressway"
	E.db["actionbar"]["bar1"]["countFontOutline"] = "OUTLINE"
	E.db["actionbar"]["bar1"]["countTextPosition"] = "BOTTOM"
	E.db["actionbar"]["bar1"]["hotkeyFont"] = "Expressway"
	E.db["actionbar"]["bar1"]["hotkeyFontOutline"] = "OUTLINE"
	E.db["actionbar"]["bar1"]["hotkeyTextPosition"] = "TOPLEFT"
	E.db["actionbar"]["bar1"]["hotkeyTextYOffset"] = -1
	E.db["actionbar"]["bar1"]["macroFont"] = "Expressway"
	E.db["actionbar"]["bar1"]["macroFontOutline"] = "OUTLINE"
	E.db["actionbar"]["bar1"]["macrotext"] = true
	E.db["actionbar"]["bar1"]["macroTextPosition"] = "BOTTOM"
	E.db["actionbar"]["bar1"]["macroTextYOffset"] = 1
	E.db["actionbar"]["bar2"]["alpha"] = 0.75
	E.db["actionbar"]["bar2"]["buttonSize"] = 28
	E.db["actionbar"]["bar2"]["countFont"] = "Expressway"
	E.db["actionbar"]["bar2"]["countFontOutline"] = "OUTLINE"
	E.db["actionbar"]["bar2"]["countTextPosition"] = "BOTTOM"
	E.db["actionbar"]["bar2"]["enabled"] = true
	E.db["actionbar"]["bar2"]["hotkeyFont"] = "Expressway"
	E.db["actionbar"]["bar2"]["hotkeyFontOutline"] = "OUTLINE"
	E.db["actionbar"]["bar2"]["hotkeyTextPosition"] = "TOPLEFT"
	E.db["actionbar"]["bar2"]["hotkeyTextYOffset"] = -1
	E.db["actionbar"]["bar2"]["macroFont"] = "Expressway"
	E.db["actionbar"]["bar2"]["macroFontOutline"] = "OUTLINE"
	E.db["actionbar"]["bar2"]["macrotext"] = true
	E.db["actionbar"]["bar2"]["macroTextPosition"] = "BOTTOM"
	E.db["actionbar"]["bar2"]["macroTextYOffset"] = 1
	E.db["actionbar"]["bar3"]["alpha"] = 0.75
	E.db["actionbar"]["bar3"]["buttons"] = 12
	E.db["actionbar"]["bar3"]["buttonSize"] = 28
	E.db["actionbar"]["bar3"]["buttonsPerRow"] = 12
	E.db["actionbar"]["bar3"]["countFont"] = "Expressway"
	E.db["actionbar"]["bar3"]["countFontOutline"] = "OUTLINE"
	E.db["actionbar"]["bar3"]["countTextPosition"] = "BOTTOM"
	E.db["actionbar"]["bar3"]["hotkeyFont"] = "Expressway"
	E.db["actionbar"]["bar3"]["hotkeyFontOutline"] = "OUTLINE"
	E.db["actionbar"]["bar3"]["hotkeyTextPosition"] = "TOPLEFT"
	E.db["actionbar"]["bar3"]["hotkeyTextYOffset"] = -1
	E.db["actionbar"]["bar3"]["macroFont"] = "Expressway"
	E.db["actionbar"]["bar3"]["macroFontOutline"] = "OUTLINE"
	E.db["actionbar"]["bar3"]["macrotext"] = true
	E.db["actionbar"]["bar3"]["macroTextPosition"] = "BOTTOM"
	E.db["actionbar"]["bar3"]["macroTextYOffset"] = 1
	E.db["actionbar"]["bar4"]["alpha"] = 0.75
	E.db["actionbar"]["bar4"]["backdrop"] = false
	E.db["actionbar"]["bar4"]["buttonSize"] = 28
	E.db["actionbar"]["bar4"]["buttonsPerRow"] = 12
	E.db["actionbar"]["bar4"]["countFont"] = "Expressway"
	E.db["actionbar"]["bar4"]["countFontOutline"] = "OUTLINE"
	E.db["actionbar"]["bar4"]["countTextPosition"] = "BOTTOM"
	E.db["actionbar"]["bar4"]["enabled"] = false
	E.db["actionbar"]["bar4"]["hotkeyFont"] = "Expressway"
	E.db["actionbar"]["bar4"]["hotkeyFontOutline"] = "OUTLINE"
	E.db["actionbar"]["bar4"]["hotkeyTextPosition"] = "TOPLEFT"
	E.db["actionbar"]["bar4"]["hotkeyTextYOffset"] = -1
	E.db["actionbar"]["bar4"]["macroFont"] = "Expressway"
	E.db["actionbar"]["bar4"]["macroFontOutline"] = "OUTLINE"
	E.db["actionbar"]["bar4"]["macrotext"] = true
	E.db["actionbar"]["bar4"]["macroTextPosition"] = "BOTTOM"
	E.db["actionbar"]["bar4"]["macroTextYOffset"] = 1
	E.db["actionbar"]["bar4"]["point"] = "BOTTOMLEFT"
	E.db["actionbar"]["bar5"]["alpha"] = 0.75
	E.db["actionbar"]["bar5"]["buttons"] = 12
	E.db["actionbar"]["bar5"]["buttonSize"] = 28
	E.db["actionbar"]["bar5"]["buttonsPerRow"] = 1
	E.db["actionbar"]["bar5"]["countFont"] = "Expressway"
	E.db["actionbar"]["bar5"]["countFontOutline"] = "OUTLINE"
	E.db["actionbar"]["bar5"]["countTextPosition"] = "BOTTOM"
	E.db["actionbar"]["bar5"]["hotkeyFont"] = "Expressway"
	E.db["actionbar"]["bar5"]["hotkeyFontOutline"] = "OUTLINE"
	E.db["actionbar"]["bar5"]["hotkeyTextPosition"] = "TOPLEFT"
	E.db["actionbar"]["bar5"]["hotkeyTextYOffset"] = -1
	E.db["actionbar"]["bar5"]["macroFont"] = "Expressway"
	E.db["actionbar"]["bar5"]["macroFontOutline"] = "OUTLINE"
	E.db["actionbar"]["bar5"]["macrotext"] = true
	E.db["actionbar"]["bar5"]["macroTextPosition"] = "BOTTOM"
	E.db["actionbar"]["bar5"]["macroTextYOffset"] = 1
	E.db["actionbar"]["bar5"]["mouseover"] = true
	E.db["actionbar"]["bar6"]["alpha"] = 0.75
	E.db["actionbar"]["bar6"]["buttonSize"] = 28
	E.db["actionbar"]["bar6"]["countFont"] = "Expressway"
	E.db["actionbar"]["bar6"]["countFontOutline"] = "OUTLINE"
	E.db["actionbar"]["bar6"]["countTextPosition"] = "BOTTOM"
	E.db["actionbar"]["bar6"]["hotkeyFont"] = "Expressway"
	E.db["actionbar"]["bar6"]["hotkeyFontOutline"] = "OUTLINE"
	E.db["actionbar"]["bar6"]["hotkeyTextPosition"] = "TOPLEFT"
	E.db["actionbar"]["bar6"]["hotkeyTextYOffset"] = -1
	E.db["actionbar"]["bar6"]["macroFont"] = "Expressway"
	E.db["actionbar"]["bar6"]["macroFontOutline"] = "OUTLINE"
	E.db["actionbar"]["bar6"]["macrotext"] = true
	E.db["actionbar"]["bar6"]["macroTextPosition"] = "BOTTOM"
	E.db["actionbar"]["bar6"]["macroTextYOffset"] = 1
	E.db["actionbar"]["bar7"]["alpha"] = 0.75
	E.db["actionbar"]["bar7"]["buttonSize"] = 28
	E.db["actionbar"]["bar7"]["countFont"] = "Expressway"
	E.db["actionbar"]["bar7"]["countFontOutline"] = "OUTLINE"
	E.db["actionbar"]["bar7"]["countTextPosition"] = "BOTTOM"
	E.db["actionbar"]["bar7"]["hotkeyFont"] = "Expressway"
	E.db["actionbar"]["bar7"]["hotkeyFontOutline"] = "OUTLINE"
	E.db["actionbar"]["bar7"]["hotkeyTextPosition"] = "TOPLEFT"
	E.db["actionbar"]["bar7"]["hotkeyTextYOffset"] = -1
	E.db["actionbar"]["bar7"]["macroFont"] = "Expressway"
	E.db["actionbar"]["bar7"]["macroFontOutline"] = "OUTLINE"
	E.db["actionbar"]["bar7"]["macrotext"] = true
	E.db["actionbar"]["bar7"]["macroTextPosition"] = "BOTTOM"
	E.db["actionbar"]["bar7"]["macroTextYOffset"] = 1
	E.db["actionbar"]["bar8"]["alpha"] = 0.75
	E.db["actionbar"]["bar8"]["buttonSize"] = 28
	E.db["actionbar"]["bar8"]["countFont"] = "Expressway"
	E.db["actionbar"]["bar8"]["countFontOutline"] = "OUTLINE"
	E.db["actionbar"]["bar8"]["countTextPosition"] = "BOTTOM"
	E.db["actionbar"]["bar8"]["hotkeyFont"] = "Expressway"
	E.db["actionbar"]["bar8"]["hotkeyFontOutline"] = "OUTLINE"
	E.db["actionbar"]["bar8"]["hotkeyTextPosition"] = "TOPLEFT"
	E.db["actionbar"]["bar8"]["hotkeyTextYOffset"] = -1
	E.db["actionbar"]["bar8"]["macroFont"] = "Expressway"
	E.db["actionbar"]["bar8"]["macroFontOutline"] = "OUTLINE"
	E.db["actionbar"]["bar8"]["macrotext"] = true
	E.db["actionbar"]["bar8"]["macroTextPosition"] = "BOTTOM"
	E.db["actionbar"]["bar8"]["macroTextYOffset"] = 1
	E.db["actionbar"]["bar9"]["alpha"] = 0.75
	E.db["actionbar"]["bar9"]["buttonSize"] = 28
	E.db["actionbar"]["bar9"]["countFont"] = "Expressway"
	E.db["actionbar"]["bar9"]["countFontOutline"] = "OUTLINE"
	E.db["actionbar"]["bar9"]["countTextPosition"] = "BOTTOM"
	E.db["actionbar"]["bar9"]["hotkeyFont"] = "Expressway"
	E.db["actionbar"]["bar9"]["hotkeyFontOutline"] = "OUTLINE"
	E.db["actionbar"]["bar9"]["hotkeyTextPosition"] = "TOPLEFT"
	E.db["actionbar"]["bar9"]["hotkeyTextYOffset"] = -1
	E.db["actionbar"]["bar9"]["macroFont"] = "Expressway"
	E.db["actionbar"]["bar9"]["macroFontOutline"] = "OUTLINE"
	E.db["actionbar"]["bar9"]["macrotext"] = true
	E.db["actionbar"]["bar9"]["macroTextPosition"] = "BOTTOM"
	E.db["actionbar"]["bar9"]["macroTextYOffset"] = 1
	E.db["actionbar"]["bar10"]["alpha"] = 0.75
	E.db["actionbar"]["bar10"]["buttonSize"] = 28
	E.db["actionbar"]["bar10"]["countFont"] = "Expressway"
	E.db["actionbar"]["bar10"]["countFontOutline"] = "OUTLINE"
	E.db["actionbar"]["bar10"]["countTextPosition"] = "BOTTOM"
	E.db["actionbar"]["bar10"]["hotkeyFont"] = "Expressway"
	E.db["actionbar"]["bar10"]["hotkeyFontOutline"] = "OUTLINE"
	E.db["actionbar"]["bar10"]["hotkeyTextPosition"] = "TOPLEFT"
	E.db["actionbar"]["bar10"]["hotkeyTextYOffset"] = -1
	E.db["actionbar"]["bar10"]["macroFont"] = "Expressway"
	E.db["actionbar"]["bar10"]["macroFontOutline"] = "OUTLINE"
	E.db["actionbar"]["bar10"]["macrotext"] = true
	E.db["actionbar"]["bar10"]["macroTextPosition"] = "BOTTOM"
	E.db["actionbar"]["bar10"]["macroTextYOffset"] = 1
	E.db["actionbar"]["barPet"]["alpha"] = 0.75
	E.db["actionbar"]["barPet"]["backdrop"] = false
	E.db["actionbar"]["barPet"]["buttonSize"] = 28
	E.db["actionbar"]["barPet"]["buttonsPerRow"] = 10
	E.db["actionbar"]["barPet"]["countFont"] = "Expressway"
	E.db["actionbar"]["barPet"]["countFontOutline"] = "OUTLINE"
	E.db["actionbar"]["barPet"]["hotkeyFont"] = "Expressway"
	E.db["actionbar"]["barPet"]["hotkeyFontOutline"] = "OUTLINE"
	E.db["actionbar"]["barPet"]["hotkeyTextPosition"] = "TOPLEFT"
	E.db["actionbar"]["barPet"]["hotkeyTextYOffset"] = -1
	E.db["actionbar"]["barPet"]["point"] = "TOPLEFT"
	E.db["actionbar"]["cooldown"]["daysIndicator"]["g"] = 0.4
	E.db["actionbar"]["cooldown"]["daysIndicator"]["r"] = 0.4
	E.db["actionbar"]["cooldown"]["expireIndicator"]["b"] = 0
	E.db["actionbar"]["cooldown"]["expireIndicator"]["g"] = 0
	E.db["actionbar"]["cooldown"]["hoursIndicator"]["r"] = 0.4
	E.db["actionbar"]["cooldown"]["override"] = false
	E.db["actionbar"]["countTextPosition"] = "BOTTOM"
	E.db["actionbar"]["countTextYOffset"] = 1
	E.db["actionbar"]["extraActionButton"]["alpha"] = 0.8
	E.db["actionbar"]["extraActionButton"]["clean"] = true
	E.db["actionbar"]["extraActionButton"]["hotkeyFont"] = "Expressway"
	E.db["actionbar"]["extraActionButton"]["hotkeyFontOutline"] = "OUTLINE"
	E.db["actionbar"]["extraActionButton"]["hotkeyTextPosition"] = "TOPLEFT"
	E.db["actionbar"]["extraActionButton"]["hotkeyTextYOffset"] = -1
	E.db["actionbar"]["extraActionButton"]["scale"] = 0.65
	E.db["actionbar"]["flyoutSize"] = 28
	E.db["actionbar"]["font"] = "Expressway"
	E.db["actionbar"]["fontOutline"] = "OUTLINE"
	E.db["actionbar"]["microbar"]["buttonHeight"] = 25
	E.db["actionbar"]["microbar"]["buttonSize"] = 18
	E.db["actionbar"]["microbar"]["buttonSpacing"] = 1
	E.db["actionbar"]["microbar"]["enabled"] = true
	E.db["actionbar"]["microbar"]["mouseover"] = true
	E.db["actionbar"]["stanceBar"]["buttonHeight"] = 24
	E.db["actionbar"]["stanceBar"]["buttonSize"] = 25
	E.db["actionbar"]["stanceBar"]["buttonSpacing"] = 1
	E.db["actionbar"]["stanceBar"]["hotkeyFont"] = "Expressway"
	E.db["actionbar"]["stanceBar"]["hotkeyFontOutline"] = "OUTLINE"
	E.db["actionbar"]["stanceBar"]["hotkeyTextPosition"] = "TOPLEFT"
	E.db["actionbar"]["stanceBar"]["hotkeyTextYOffset"] = -1
	E.db["actionbar"]["stanceBar"]["mouseover"] = true
	E.db["actionbar"]["transparent"] = true
	E.db["actionbar"]["vehicleExitButton"]["hotkeyFont"] = "Expressway"
	E.db["actionbar"]["vehicleExitButton"]["hotkeyFontOutline"] = "OUTLINE"
	E.db["actionbar"]["zoneActionButton"]["alpha"] = 0.8
	E.db["actionbar"]["zoneActionButton"]["clean"] = true
	E.db["actionbar"]["zoneActionButton"]["hotkeyFont"] = "Expressway"
	E.db["actionbar"]["zoneActionButton"]["hotkeyFontOutline"] = "OUTLINE"
	E.db["actionbar"]["zoneActionButton"]["hotkeyTextPosition"] = "TOPLEFT"
	E.db["actionbar"]["zoneActionButton"]["hotkeyTextYOffset"] = -1
	E.db["actionbar"]["zoneActionButton"]["scale"] = 0.65

	-- Chat
	E.db["chat"]["editBoxPosition"] = "ABOVE_CHAT_INSIDE"

	-- General
	E.db["general"]["autoRepair"] = "GUILD"

	E.db["unitframe"]["units"]["target"]["customTexts"] = E.db["unitframe"]["units"]["target"]["customTexts"] or {}
	E.db["unitframe"]["units"]["target"]["customTexts"]["Luckyone_HP"] = {
		["attachTextTo"] = "Health",
		["enable"] = true,
		["font"] = "Expressway",
		["fontOutline"] = "OUTLINE",
		["justifyH"] = "CENTER",
		["size"] = 14,
		["text_format"] = "[perhp<%] || [health:current:shortvalue]",
		["xOffset"] = 0,
		["yOffset"] = 0
	}

	E.db["unitframe"]["units"]["player"]["customTexts"] = E.db["unitframe"]["units"]["player"]["customTexts"] or {}
	E.db["unitframe"]["units"]["player"]["customTexts"]["Luckyone_HP"] = {
		["attachTextTo"] = "Health",
		["enable"] = true,
		["font"] = "Expressway",
		["fontOutline"] = "OUTLINE",
		["justifyH"] = "CENTER",
		["size"] = 14,
		["text_format"] = "[health:current:shortvalue] || [perhp<%]",
		["xOffset"] = 0,
		["yOffset"] = 0
	}

	E.db["unitframe"]["units"]["focus"]["customTexts"] = E.db["unitframe"]["units"]["focus"]["customTexts"] or {}
	E.db["unitframe"]["units"]["focus"]["customTexts"]["Luckyone_HP"] = {
		["attachTextTo"] = "Health",
		["enable"] = true,
		["font"] = "Expressway",
		["fontOutline"] = "OUTLINE",
		["justifyH"] = "CENTER",
		["size"] = 14,
		["text_format"] = "[perhp<%] || [health:current:shortvalue]",
		["xOffset"] = 0,
		["yOffset"] = 0
	}

	if layout == 'dps' then
		-- DPS/TANK db
	elseif layout == 'healer' then
		-- Healing db
	end

	E:StaggeredUpdateAll(nil, true)

	L1UI:Print('Layout has been updated.')
end
