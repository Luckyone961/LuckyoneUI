local L1UI, E, L, V, P, G = unpack(select(2, ...))

local pairs = pairs
local SetCVar = SetCVar

-- NamePlate Setup
function L1UI:SetupNamePlates(addon)

	if addon == 'ElvUI' then

		-- Toggle on
		E.private["nameplates"]["enable"] = true

		-- Style Filters & CVars
		L1UI:SetupStyleFilters()

		-- NamePlate DB
		E.db["nameplates"]["colors"]["castbarDesaturate"] = false
		E.db["nameplates"]["colors"]["castColor"]["g"] = 1
		E.db["nameplates"]["colors"]["castColor"]["r"] = 0.023529411764706
		E.db["nameplates"]["colors"]["castNoInterruptColor"]["b"] = 0.007843137254902
		E.db["nameplates"]["colors"]["castNoInterruptColor"]["g"] = 0
		E.db["nameplates"]["colors"]["castNoInterruptColor"]["r"] = 1
		E.db["nameplates"]["colors"]["glowColor"]["b"] = 0.054901960784314
		E.db["nameplates"]["colors"]["glowColor"]["r"] = 0
		E.db["nameplates"]["cooldown"]["daysIndicator"]["g"] = 0.4
		E.db["nameplates"]["cooldown"]["daysIndicator"]["r"] = 0.4
		E.db["nameplates"]["cooldown"]["expireIndicator"]["b"] = 0
		E.db["nameplates"]["cooldown"]["expireIndicator"]["g"] = 0
		E.db["nameplates"]["cooldown"]["hoursIndicator"]["r"] = 0.4
		E.db["nameplates"]["cooldown"]["override"] = false
		E.db["nameplates"]["lowHealthThreshold"] = 0.5
		E.db["nameplates"]["plateSize"]["enemyHeight"] = 40
		E.db["nameplates"]["plateSize"]["enemyWidth"] = 165
		E.db["nameplates"]["plateSize"]["friendlyHeight"] = 40
		E.db["nameplates"]["plateSize"]["friendlyWidth"] = 165
		E.db["nameplates"]["plateSize"]["personalHeight"] = 40
		E.db["nameplates"]["plateSize"]["personalWidth"] = 165
		E.db["nameplates"]["statusbar"] = "Solid"
		E.db["nameplates"]["units"]["ENEMY_NPC"]["buffs"]["countFont"] = "Expressway"
		E.db["nameplates"]["units"]["ENEMY_NPC"]["buffs"]["countFontSize"] = 10
		E.db["nameplates"]["units"]["ENEMY_NPC"]["buffs"]["countPosition"] = "TOP"
		E.db["nameplates"]["units"]["ENEMY_NPC"]["buffs"]["font"] = "Expressway"
		E.db["nameplates"]["units"]["ENEMY_NPC"]["buffs"]["fontSize"] = 10
		E.db["nameplates"]["units"]["ENEMY_NPC"]["buffs"]["numAuras"] = 2
		E.db["nameplates"]["units"]["ENEMY_NPC"]["buffs"]["priority"] = "Blacklist,Dispellable,RaidBuffsElvUI"
		E.db["nameplates"]["units"]["ENEMY_NPC"]["buffs"]["size"] = 22
		E.db["nameplates"]["units"]["ENEMY_NPC"]["buffs"]["spacing"] = 0
		E.db["nameplates"]["units"]["ENEMY_NPC"]["buffs"]["xOffset"] = -1
		E.db["nameplates"]["units"]["ENEMY_NPC"]["buffs"]["yOffset"] = -10
		E.db["nameplates"]["units"]["ENEMY_NPC"]["castbar"]["font"] = "Expressway"
		E.db["nameplates"]["units"]["ENEMY_NPC"]["castbar"]["fontSize"] = 10
		E.db["nameplates"]["units"]["ENEMY_NPC"]["castbar"]["height"] = 12
		E.db["nameplates"]["units"]["ENEMY_NPC"]["castbar"]["iconOffsetY"] = -1
		E.db["nameplates"]["units"]["ENEMY_NPC"]["castbar"]["iconPosition"] = "LEFT"
		E.db["nameplates"]["units"]["ENEMY_NPC"]["castbar"]["iconSize"] = 33
		E.db["nameplates"]["units"]["ENEMY_NPC"]["castbar"]["textPosition"] = "ONBAR"
		E.db["nameplates"]["units"]["ENEMY_NPC"]["castbar"]["timeToHold"] = 2
		E.db["nameplates"]["units"]["ENEMY_NPC"]["castbar"]["width"] = 165
		E.db["nameplates"]["units"]["ENEMY_NPC"]["castbar"]["yOffset"] = -16
		E.db["nameplates"]["units"]["ENEMY_NPC"]["debuffs"]["countFont"] = "Expressway"
		E.db["nameplates"]["units"]["ENEMY_NPC"]["debuffs"]["countFontSize"] = 10
		E.db["nameplates"]["units"]["ENEMY_NPC"]["debuffs"]["countPosition"] = "TOP"
		E.db["nameplates"]["units"]["ENEMY_NPC"]["debuffs"]["font"] = "Expressway"
		E.db["nameplates"]["units"]["ENEMY_NPC"]["debuffs"]["fontSize"] = 10
		E.db["nameplates"]["units"]["ENEMY_NPC"]["debuffs"]["numAuras"] = 6
		E.db["nameplates"]["units"]["ENEMY_NPC"]["debuffs"]["size"] = 22
		E.db["nameplates"]["units"]["ENEMY_NPC"]["debuffs"]["spacing"] = 0
		E.db["nameplates"]["units"]["ENEMY_NPC"]["debuffs"]["xOffset"] = 1
		E.db["nameplates"]["units"]["ENEMY_NPC"]["debuffs"]["yOffset"] = -10
		E.db["nameplates"]["units"]["ENEMY_NPC"]["eliteIcon"]["size"] = 14
		E.db["nameplates"]["units"]["ENEMY_NPC"]["eliteIcon"]["xOffset"] = 3
		E.db["nameplates"]["units"]["ENEMY_NPC"]["health"]["height"] = 18
		E.db["nameplates"]["units"]["ENEMY_NPC"]["health"]["text"]["font"] = "Expressway"
		E.db["nameplates"]["units"]["ENEMY_NPC"]["health"]["text"]["fontSize"] = 12
		E.db["nameplates"]["units"]["ENEMY_NPC"]["health"]["text"]["format"] = "[perhp<%]"
		E.db["nameplates"]["units"]["ENEMY_NPC"]["health"]["text"]["parent"] = "Health"
		E.db["nameplates"]["units"]["ENEMY_NPC"]["health"]["text"]["position"] = "TOPRIGHT"
		E.db["nameplates"]["units"]["ENEMY_NPC"]["health"]["text"]["yOffset"] = -15
		E.db["nameplates"]["units"]["ENEMY_NPC"]["level"]["font"] = "Expressway"
		E.db["nameplates"]["units"]["ENEMY_NPC"]["level"]["format"] = ""
		E.db["nameplates"]["units"]["ENEMY_NPC"]["level"]["xOffset"] = 3
		E.db["nameplates"]["units"]["ENEMY_NPC"]["level"]["yOffset"] = -10
		E.db["nameplates"]["units"]["ENEMY_NPC"]["name"]["font"] = "Expressway"
		E.db["nameplates"]["units"]["ENEMY_NPC"]["name"]["fontSize"] = 12
		E.db["nameplates"]["units"]["ENEMY_NPC"]["name"]["format"] = "[name:last][classificationcolor][ >luckyone:classification]"
		E.db["nameplates"]["units"]["ENEMY_NPC"]["name"]["parent"] = "Health"
		E.db["nameplates"]["units"]["ENEMY_NPC"]["name"]["xOffset"] = 1
		E.db["nameplates"]["units"]["ENEMY_NPC"]["name"]["yOffset"] = -15
		E.db["nameplates"]["units"]["ENEMY_NPC"]["power"]["text"]["font"] = "Expressway"
		E.db["nameplates"]["units"]["ENEMY_NPC"]["pvpindicator"]["size"] = 35
		E.db["nameplates"]["units"]["ENEMY_NPC"]["questIcon"]["font"] = "Expressway"
		E.db["nameplates"]["units"]["ENEMY_NPC"]["questIcon"]["size"] = 25
		E.db["nameplates"]["units"]["ENEMY_NPC"]["questIcon"]["textPosition"] = "CENTER"
		E.db["nameplates"]["units"]["ENEMY_NPC"]["raidTargetIndicator"]["size"] = 20
		E.db["nameplates"]["units"]["ENEMY_NPC"]["raidTargetIndicator"]["xOffset"] = -3
		E.db["nameplates"]["units"]["ENEMY_NPC"]["title"]["font"] = "Expressway"
		E.db["nameplates"]["units"]["ENEMY_PLAYER"]["buffs"]["countFont"] = "Expressway"
		E.db["nameplates"]["units"]["ENEMY_PLAYER"]["buffs"]["countFontSize"] = 10
		E.db["nameplates"]["units"]["ENEMY_PLAYER"]["buffs"]["countPosition"] = "TOP"
		E.db["nameplates"]["units"]["ENEMY_PLAYER"]["buffs"]["font"] = "Expressway"
		E.db["nameplates"]["units"]["ENEMY_PLAYER"]["buffs"]["fontSize"] = 10
		E.db["nameplates"]["units"]["ENEMY_PLAYER"]["buffs"]["maxDuration"] = 0
		E.db["nameplates"]["units"]["ENEMY_PLAYER"]["buffs"]["numAuras"] = 2
		E.db["nameplates"]["units"]["ENEMY_PLAYER"]["buffs"]["priority"] = "Blacklist,Dispellable"
		E.db["nameplates"]["units"]["ENEMY_PLAYER"]["buffs"]["size"] = 22
		E.db["nameplates"]["units"]["ENEMY_PLAYER"]["buffs"]["spacing"] = 0
		E.db["nameplates"]["units"]["ENEMY_PLAYER"]["buffs"]["xOffset"] = -1
		E.db["nameplates"]["units"]["ENEMY_PLAYER"]["buffs"]["yOffset"] = -10
		E.db["nameplates"]["units"]["ENEMY_PLAYER"]["castbar"]["font"] = "Expressway"
		E.db["nameplates"]["units"]["ENEMY_PLAYER"]["castbar"]["fontSize"] = 10
		E.db["nameplates"]["units"]["ENEMY_PLAYER"]["castbar"]["height"] = 12
		E.db["nameplates"]["units"]["ENEMY_PLAYER"]["castbar"]["iconOffsetY"] = -1
		E.db["nameplates"]["units"]["ENEMY_PLAYER"]["castbar"]["iconPosition"] = "LEFT"
		E.db["nameplates"]["units"]["ENEMY_PLAYER"]["castbar"]["iconSize"] = 33
		E.db["nameplates"]["units"]["ENEMY_PLAYER"]["castbar"]["textPosition"] = "ONBAR"
		E.db["nameplates"]["units"]["ENEMY_PLAYER"]["castbar"]["timeToHold"] = 2
		E.db["nameplates"]["units"]["ENEMY_PLAYER"]["castbar"]["width"] = 165
		E.db["nameplates"]["units"]["ENEMY_PLAYER"]["castbar"]["yOffset"] = -16
		E.db["nameplates"]["units"]["ENEMY_PLAYER"]["debuffs"]["countFont"] = "Expressway"
		E.db["nameplates"]["units"]["ENEMY_PLAYER"]["debuffs"]["countFontSize"] = 10
		E.db["nameplates"]["units"]["ENEMY_PLAYER"]["debuffs"]["countPosition"] = "TOP"
		E.db["nameplates"]["units"]["ENEMY_PLAYER"]["debuffs"]["font"] = "Expressway"
		E.db["nameplates"]["units"]["ENEMY_PLAYER"]["debuffs"]["fontSize"] = 10
		E.db["nameplates"]["units"]["ENEMY_PLAYER"]["debuffs"]["numAuras"] = 6
		E.db["nameplates"]["units"]["ENEMY_PLAYER"]["debuffs"]["priority"] = "Blacklist,Personal,CCDebuffs"
		E.db["nameplates"]["units"]["ENEMY_PLAYER"]["debuffs"]["size"] = 22
		E.db["nameplates"]["units"]["ENEMY_PLAYER"]["debuffs"]["spacing"] = 0
		E.db["nameplates"]["units"]["ENEMY_PLAYER"]["debuffs"]["xOffset"] = 1
		E.db["nameplates"]["units"]["ENEMY_PLAYER"]["debuffs"]["yOffset"] = -10
		E.db["nameplates"]["units"]["ENEMY_PLAYER"]["health"]["height"] = 18
		E.db["nameplates"]["units"]["ENEMY_PLAYER"]["health"]["text"]["font"] = "Expressway"
		E.db["nameplates"]["units"]["ENEMY_PLAYER"]["health"]["text"]["fontSize"] = 12
		E.db["nameplates"]["units"]["ENEMY_PLAYER"]["health"]["text"]["format"] = "[perhp<%]"
		E.db["nameplates"]["units"]["ENEMY_PLAYER"]["health"]["text"]["parent"] = "Health"
		E.db["nameplates"]["units"]["ENEMY_PLAYER"]["health"]["text"]["position"] = "TOPRIGHT"
		E.db["nameplates"]["units"]["ENEMY_PLAYER"]["health"]["text"]["yOffset"] = -15
		E.db["nameplates"]["units"]["ENEMY_PLAYER"]["level"]["font"] = "Expressway"
		E.db["nameplates"]["units"]["ENEMY_PLAYER"]["level"]["format"] = ""
		E.db["nameplates"]["units"]["ENEMY_PLAYER"]["level"]["xOffset"] = 3
		E.db["nameplates"]["units"]["ENEMY_PLAYER"]["level"]["yOffset"] = -10
		E.db["nameplates"]["units"]["ENEMY_PLAYER"]["name"]["font"] = "Expressway"
		E.db["nameplates"]["units"]["ENEMY_PLAYER"]["name"]["fontSize"] = 12
		E.db["nameplates"]["units"]["ENEMY_PLAYER"]["name"]["format"] = "[name:medium]"
		E.db["nameplates"]["units"]["ENEMY_PLAYER"]["name"]["parent"] = "Health"
		E.db["nameplates"]["units"]["ENEMY_PLAYER"]["name"]["xOffset"] = 1
		E.db["nameplates"]["units"]["ENEMY_PLAYER"]["name"]["yOffset"] = -15
		E.db["nameplates"]["units"]["ENEMY_PLAYER"]["power"]["text"]["font"] = "Expressway"
		E.db["nameplates"]["units"]["ENEMY_PLAYER"]["pvpindicator"]["size"] = 35
		E.db["nameplates"]["units"]["ENEMY_PLAYER"]["raidTargetIndicator"]["size"] = 20
		E.db["nameplates"]["units"]["ENEMY_PLAYER"]["raidTargetIndicator"]["xOffset"] = -3
		E.db["nameplates"]["units"]["ENEMY_PLAYER"]["title"]["font"] = "Expressway"
		E.db["nameplates"]["units"]["ENEMY_PLAYER"]["title"]["format"] = "[npctitle]"
		E.db["nameplates"]["units"]["FRIENDLY_NPC"]["buffs"]["countFont"] = "Expressway"
		E.db["nameplates"]["units"]["FRIENDLY_NPC"]["buffs"]["countFontSize"] = 10
		E.db["nameplates"]["units"]["FRIENDLY_NPC"]["buffs"]["countPosition"] = "TOP"
		E.db["nameplates"]["units"]["FRIENDLY_NPC"]["buffs"]["font"] = "Expressway"
		E.db["nameplates"]["units"]["FRIENDLY_NPC"]["buffs"]["fontSize"] = 10
		E.db["nameplates"]["units"]["FRIENDLY_NPC"]["buffs"]["numAuras"] = 2
		E.db["nameplates"]["units"]["FRIENDLY_NPC"]["buffs"]["priority"] = "Blacklist,Dispellable"
		E.db["nameplates"]["units"]["FRIENDLY_NPC"]["buffs"]["size"] = 20
		E.db["nameplates"]["units"]["FRIENDLY_NPC"]["buffs"]["spacing"] = 0
		E.db["nameplates"]["units"]["FRIENDLY_NPC"]["buffs"]["yOffset"] = 1
		E.db["nameplates"]["units"]["FRIENDLY_NPC"]["castbar"]["font"] = "Expressway"
		E.db["nameplates"]["units"]["FRIENDLY_NPC"]["castbar"]["fontSize"] = 10
		E.db["nameplates"]["units"]["FRIENDLY_NPC"]["castbar"]["iconPosition"] = "LEFT"
		E.db["nameplates"]["units"]["FRIENDLY_NPC"]["castbar"]["iconSize"] = 22
		E.db["nameplates"]["units"]["FRIENDLY_NPC"]["castbar"]["textPosition"] = "ONBAR"
		E.db["nameplates"]["units"]["FRIENDLY_NPC"]["castbar"]["timeToHold"] = 2
		E.db["nameplates"]["units"]["FRIENDLY_NPC"]["castbar"]["width"] = 160
		E.db["nameplates"]["units"]["FRIENDLY_NPC"]["castbar"]["yOffset"] = -11
		E.db["nameplates"]["units"]["FRIENDLY_NPC"]["debuffs"]["countFont"] = "Expressway"
		E.db["nameplates"]["units"]["FRIENDLY_NPC"]["debuffs"]["countFontSize"] = 10
		E.db["nameplates"]["units"]["FRIENDLY_NPC"]["debuffs"]["countPosition"] = "TOP"
		E.db["nameplates"]["units"]["FRIENDLY_NPC"]["debuffs"]["font"] = "Expressway"
		E.db["nameplates"]["units"]["FRIENDLY_NPC"]["debuffs"]["fontSize"] = 10
		E.db["nameplates"]["units"]["FRIENDLY_NPC"]["debuffs"]["numAuras"] = 6
		E.db["nameplates"]["units"]["FRIENDLY_NPC"]["debuffs"]["priority"] = "Blacklist,Personal,CCDebuffs"
		E.db["nameplates"]["units"]["FRIENDLY_NPC"]["debuffs"]["size"] = 20
		E.db["nameplates"]["units"]["FRIENDLY_NPC"]["debuffs"]["spacing"] = 0
		E.db["nameplates"]["units"]["FRIENDLY_NPC"]["debuffs"]["xOffset"] = 1
		E.db["nameplates"]["units"]["FRIENDLY_NPC"]["debuffs"]["yOffset"] = 1
		E.db["nameplates"]["units"]["FRIENDLY_NPC"]["eliteIcon"]["size"] = 14
		E.db["nameplates"]["units"]["FRIENDLY_NPC"]["eliteIcon"]["xOffset"] = 3
		E.db["nameplates"]["units"]["FRIENDLY_NPC"]["health"]["height"] = 12
		E.db["nameplates"]["units"]["FRIENDLY_NPC"]["health"]["text"]["font"] = "Expressway"
		E.db["nameplates"]["units"]["FRIENDLY_NPC"]["health"]["text"]["format"] = "[perhp<%]"
		E.db["nameplates"]["units"]["FRIENDLY_NPC"]["level"]["font"] = "Expressway"
		E.db["nameplates"]["units"]["FRIENDLY_NPC"]["level"]["format"] = "[level]"
		E.db["nameplates"]["units"]["FRIENDLY_NPC"]["level"]["xOffset"] = 3
		E.db["nameplates"]["units"]["FRIENDLY_NPC"]["level"]["yOffset"] = -10
		E.db["nameplates"]["units"]["FRIENDLY_NPC"]["name"]["font"] = "Expressway"
		E.db["nameplates"]["units"]["FRIENDLY_NPC"]["name"]["yOffset"] = -10
		E.db["nameplates"]["units"]["FRIENDLY_NPC"]["power"]["text"]["font"] = "Expressway"
		E.db["nameplates"]["units"]["FRIENDLY_NPC"]["pvpindicator"]["size"] = 35
		E.db["nameplates"]["units"]["FRIENDLY_NPC"]["questIcon"]["font"] = "Expressway"
		E.db["nameplates"]["units"]["FRIENDLY_NPC"]["questIcon"]["fontSize"] = 14
		E.db["nameplates"]["units"]["FRIENDLY_NPC"]["questIcon"]["size"] = 16
		E.db["nameplates"]["units"]["FRIENDLY_NPC"]["questIcon"]["textPosition"] = "CENTER"
		E.db["nameplates"]["units"]["FRIENDLY_NPC"]["raidTargetIndicator"]["size"] = 20
		E.db["nameplates"]["units"]["FRIENDLY_NPC"]["raidTargetIndicator"]["xOffset"] = -3
		E.db["nameplates"]["units"]["FRIENDLY_NPC"]["title"]["enable"] = true
		E.db["nameplates"]["units"]["FRIENDLY_NPC"]["title"]["font"] = "Expressway"
		E.db["nameplates"]["units"]["FRIENDLY_PLAYER"]["buffs"]["countFont"] = "Expressway"
		E.db["nameplates"]["units"]["FRIENDLY_PLAYER"]["buffs"]["countFontSize"] = 10
		E.db["nameplates"]["units"]["FRIENDLY_PLAYER"]["buffs"]["countPosition"] = "TOP"
		E.db["nameplates"]["units"]["FRIENDLY_PLAYER"]["buffs"]["font"] = "Expressway"
		E.db["nameplates"]["units"]["FRIENDLY_PLAYER"]["buffs"]["fontSize"] = 10
		E.db["nameplates"]["units"]["FRIENDLY_PLAYER"]["buffs"]["numAuras"] = 2
		E.db["nameplates"]["units"]["FRIENDLY_PLAYER"]["buffs"]["priority"] = "Blacklist,Dispellable"
		E.db["nameplates"]["units"]["FRIENDLY_PLAYER"]["buffs"]["size"] = 20
		E.db["nameplates"]["units"]["FRIENDLY_PLAYER"]["buffs"]["spacing"] = 0
		E.db["nameplates"]["units"]["FRIENDLY_PLAYER"]["buffs"]["yOffset"] = 1
		E.db["nameplates"]["units"]["FRIENDLY_PLAYER"]["castbar"]["font"] = "Expressway"
		E.db["nameplates"]["units"]["FRIENDLY_PLAYER"]["castbar"]["fontSize"] = 10
		E.db["nameplates"]["units"]["FRIENDLY_PLAYER"]["castbar"]["iconPosition"] = "LEFT"
		E.db["nameplates"]["units"]["FRIENDLY_PLAYER"]["castbar"]["iconSize"] = 22
		E.db["nameplates"]["units"]["FRIENDLY_PLAYER"]["castbar"]["textPosition"] = "ONBAR"
		E.db["nameplates"]["units"]["FRIENDLY_PLAYER"]["castbar"]["timeToHold"] = 2
		E.db["nameplates"]["units"]["FRIENDLY_PLAYER"]["castbar"]["width"] = 160
		E.db["nameplates"]["units"]["FRIENDLY_PLAYER"]["castbar"]["yOffset"] = -11
		E.db["nameplates"]["units"]["FRIENDLY_PLAYER"]["debuffs"]["countFont"] = "Expressway"
		E.db["nameplates"]["units"]["FRIENDLY_PLAYER"]["debuffs"]["countFontSize"] = 10
		E.db["nameplates"]["units"]["FRIENDLY_PLAYER"]["debuffs"]["countPosition"] = "TOP"
		E.db["nameplates"]["units"]["FRIENDLY_PLAYER"]["debuffs"]["font"] = "Expressway"
		E.db["nameplates"]["units"]["FRIENDLY_PLAYER"]["debuffs"]["fontSize"] = 10
		E.db["nameplates"]["units"]["FRIENDLY_PLAYER"]["debuffs"]["numAuras"] = 6
		E.db["nameplates"]["units"]["FRIENDLY_PLAYER"]["debuffs"]["priority"] = "Blacklist,Personal,CCDebuffs"
		E.db["nameplates"]["units"]["FRIENDLY_PLAYER"]["debuffs"]["size"] = 20
		E.db["nameplates"]["units"]["FRIENDLY_PLAYER"]["debuffs"]["spacing"] = 0
		E.db["nameplates"]["units"]["FRIENDLY_PLAYER"]["debuffs"]["xOffset"] = 1
		E.db["nameplates"]["units"]["FRIENDLY_PLAYER"]["debuffs"]["yOffset"] = 1
		E.db["nameplates"]["units"]["FRIENDLY_PLAYER"]["health"]["height"] = 12
		E.db["nameplates"]["units"]["FRIENDLY_PLAYER"]["health"]["text"]["font"] = "Expressway"
		E.db["nameplates"]["units"]["FRIENDLY_PLAYER"]["health"]["text"]["format"] = "[perhp<%]"
		E.db["nameplates"]["units"]["FRIENDLY_PLAYER"]["level"]["font"] = "Expressway"
		E.db["nameplates"]["units"]["FRIENDLY_PLAYER"]["level"]["format"] = "[level]"
		E.db["nameplates"]["units"]["FRIENDLY_PLAYER"]["level"]["xOffset"] = 3
		E.db["nameplates"]["units"]["FRIENDLY_PLAYER"]["level"]["yOffset"] = -10
		E.db["nameplates"]["units"]["FRIENDLY_PLAYER"]["markHealers"] = false
		E.db["nameplates"]["units"]["FRIENDLY_PLAYER"]["markTanks"] = false
		E.db["nameplates"]["units"]["FRIENDLY_PLAYER"]["name"]["font"] = "Expressway"
		E.db["nameplates"]["units"]["FRIENDLY_PLAYER"]["name"]["yOffset"] = -10
		E.db["nameplates"]["units"]["FRIENDLY_PLAYER"]["nameOnly"] = true
		E.db["nameplates"]["units"]["FRIENDLY_PLAYER"]["power"]["text"]["font"] = "Expressway"
		E.db["nameplates"]["units"]["FRIENDLY_PLAYER"]["pvpindicator"]["size"] = 35
		E.db["nameplates"]["units"]["FRIENDLY_PLAYER"]["raidTargetIndicator"]["size"] = 20
		E.db["nameplates"]["units"]["FRIENDLY_PLAYER"]["raidTargetIndicator"]["xOffset"] = -3
		E.db["nameplates"]["units"]["FRIENDLY_PLAYER"]["title"]["enable"] = true
		E.db["nameplates"]["units"]["FRIENDLY_PLAYER"]["title"]["font"] = "Expressway"
		E.db["nameplates"]["units"]["PLAYER"]["buffs"]["countFont"] = "Expressway"
		E.db["nameplates"]["units"]["PLAYER"]["buffs"]["maxDuration"] = 0
		E.db["nameplates"]["units"]["PLAYER"]["buffs"]["priority"] = "Blacklist,blockNoDuration,Personal,TurtleBuffs"
		E.db["nameplates"]["units"]["PLAYER"]["castbar"]["font"] = "Expressway"
		E.db["nameplates"]["units"]["PLAYER"]["castbar"]["timeToHold"] = 2
		E.db["nameplates"]["units"]["PLAYER"]["castbar"]["yOffset"] = -10
		E.db["nameplates"]["units"]["PLAYER"]["debuffs"]["countFont"] = "Expressway"
		E.db["nameplates"]["units"]["PLAYER"]["debuffs"]["priority"] = "Blacklist,Dispellable,blockNoDuration,Personal,Boss,CCDebuffs"
		E.db["nameplates"]["units"]["PLAYER"]["health"]["text"]["font"] = "Expressway"
		E.db["nameplates"]["units"]["PLAYER"]["level"]["enable"] = true
		E.db["nameplates"]["units"]["PLAYER"]["level"]["font"] = "Expressway"
		E.db["nameplates"]["units"]["PLAYER"]["level"]["yOffset"] = 0
		E.db["nameplates"]["units"]["PLAYER"]["name"]["enable"] = true
		E.db["nameplates"]["units"]["PLAYER"]["name"]["font"] = "Expressway"
		E.db["nameplates"]["units"]["PLAYER"]["name"]["format"] = "[namecolor][name]"
		E.db["nameplates"]["units"]["PLAYER"]["name"]["yOffset"] = 0
		E.db["nameplates"]["units"]["PLAYER"]["nameOnly"] = true
		E.db["nameplates"]["units"]["PLAYER"]["power"]["enable"] = false
		E.db["nameplates"]["units"]["PLAYER"]["power"]["text"]["font"] = "Expressway"
		E.db["nameplates"]["units"]["PLAYER"]["title"]["enable"] = true
		E.db["nameplates"]["units"]["PLAYER"]["title"]["font"] = "Expressway"
		E.db["nameplates"]["units"]["PLAYER"]["title"]["yOffset"] = 0
		E.db["nameplates"]["units"]["PLAYER"]["visibility"]["hideDelay"] = 0
		E.db["nameplates"]["units"]["PLAYER"]["visibility"]["showInCombat"] = false
		E.db["nameplates"]["visibility"]["enemy"]["guardians"] = true
		E.db["nameplates"]["visibility"]["enemy"]["minions"] = true

		-- Set CVars
		L1UI:NameplateCVars()

	elseif addon == 'Plater' then

		-- Toggle off ElvUI Module
		E.private["nameplates"]["enable"] = false

		-- Setup Plater Layout
		L1UI:AddonSetupPlater()

		-- Set CVars
		L1UI:NameplateCVars()

	end
end

-- Style Filter Setup
function L1UI:SetupStyleFilters()

	for _, filterName in pairs({'Luckyone_HOA', 'Luckyone_MISTS', 'Luckyone_PF', 'Luckyone_NW', 'Luckyone_TOP', 'Luckyone_SD', 'Luckyone_SOA', 'Luckyone_DOS'}) do
		E.global["nameplate"]["filters"][filterName] = {}
		E.NamePlates:StyleFilterCopyDefaults(E.global["nameplate"]["filters"][filterName])
		E.db["nameplates"]["filters"][filterName] = { triggers = { enable = true } }
	end

	-- De Other Side [DOS]
	E.global["nameplate"]["filters"]["Luckyone_DOS"]["actions"]["color"]["health"] = true
	E.global["nameplate"]["filters"]["Luckyone_DOS"]["actions"]["color"]["healthColor"]["g"] = 0.75686274509804
	E.global["nameplate"]["filters"]["Luckyone_DOS"]["actions"]["color"]["healthColor"]["r"] = 0
	E.global["nameplate"]["filters"]["Luckyone_DOS"]["triggers"]["names"]["164857"] = true
	E.global["nameplate"]["filters"]["Luckyone_DOS"]["triggers"]["names"]["167965"] = true
	E.global["nameplate"]["filters"]["Luckyone_DOS"]["triggers"]["names"]["168934"] = true
	E.global["nameplate"]["filters"]["Luckyone_DOS"]["triggers"]["names"]["168942"] = true
	E.global["nameplate"]["filters"]["Luckyone_DOS"]["triggers"]["names"]["169905"] = true
	E.global["nameplate"]["filters"]["Luckyone_DOS"]["triggers"]["names"]["170572"] = true
	E.global["nameplate"]["filters"]["Luckyone_DOS"]["triggers"]["names"]["171343"] = true
	E.global["nameplate"]["filters"]["Luckyone_DOS"]["triggers"]["priority"] = 2

	-- Halls of Atonement [HOA]
	E.global["nameplate"]["filters"]["Luckyone_HOA"]["actions"]["color"]["health"] = true
	E.global["nameplate"]["filters"]["Luckyone_HOA"]["actions"]["color"]["healthColor"]["g"] = 0.75686274509804
	E.global["nameplate"]["filters"]["Luckyone_HOA"]["actions"]["color"]["healthColor"]["r"] = 0
	E.global["nameplate"]["filters"]["Luckyone_HOA"]["triggers"]["names"]["164562"] = true
	E.global["nameplate"]["filters"]["Luckyone_HOA"]["triggers"]["names"]["165529"] = true
	E.global["nameplate"]["filters"]["Luckyone_HOA"]["triggers"]["names"]["167612"] = true
	E.global["nameplate"]["filters"]["Luckyone_HOA"]["triggers"]["names"]["167892"] = true
	E.global["nameplate"]["filters"]["Luckyone_HOA"]["triggers"]["priority"] = 2

	-- Mists of Tirna Scithe [MISTS]
	E.global["nameplate"]["filters"]["Luckyone_MISTS"]["actions"]["color"]["health"] = true
	E.global["nameplate"]["filters"]["Luckyone_MISTS"]["actions"]["color"]["healthColor"]["g"] = 0.75686274509804
	E.global["nameplate"]["filters"]["Luckyone_MISTS"]["actions"]["color"]["healthColor"]["r"] = 0
	E.global["nameplate"]["filters"]["Luckyone_MISTS"]["triggers"]["names"]["164804"] = true
	E.global["nameplate"]["filters"]["Luckyone_MISTS"]["triggers"]["names"]["164921"] = true
	E.global["nameplate"]["filters"]["Luckyone_MISTS"]["triggers"]["names"]["166299"] = true
	E.global["nameplate"]["filters"]["Luckyone_MISTS"]["triggers"]["names"]["167111"] = true
	E.global["nameplate"]["filters"]["Luckyone_MISTS"]["triggers"]["priority"] = 2

	-- The Necrotic Wake [NW]
	E.global["nameplate"]["filters"]["Luckyone_NW"]["actions"]["color"]["health"] = true
	E.global["nameplate"]["filters"]["Luckyone_NW"]["actions"]["color"]["healthColor"]["g"] = 0.75686274509804
	E.global["nameplate"]["filters"]["Luckyone_NW"]["actions"]["color"]["healthColor"]["r"] = 0
	E.global["nameplate"]["filters"]["Luckyone_NW"]["triggers"]["names"]["163618"] = true
	E.global["nameplate"]["filters"]["Luckyone_NW"]["triggers"]["names"]["165824"] = true
	E.global["nameplate"]["filters"]["Luckyone_NW"]["triggers"]["names"]["165872"] = true
	E.global["nameplate"]["filters"]["Luckyone_NW"]["triggers"]["names"]["166302"] = true
	E.global["nameplate"]["filters"]["Luckyone_NW"]["triggers"]["names"]["173016"] = true
	E.global["nameplate"]["filters"]["Luckyone_NW"]["triggers"]["priority"] = 2

	-- Plaguefall [PF]
	E.global["nameplate"]["filters"]["Luckyone_PF"]["actions"]["color"]["health"] = true
	E.global["nameplate"]["filters"]["Luckyone_PF"]["actions"]["color"]["healthColor"]["g"] = 0.75686274509804
	E.global["nameplate"]["filters"]["Luckyone_PF"]["actions"]["color"]["healthColor"]["r"] = 0
	E.global["nameplate"]["filters"]["Luckyone_PF"]["triggers"]["names"]["163882"] = true
	E.global["nameplate"]["filters"]["Luckyone_PF"]["triggers"]["names"]["163894"] = true
	E.global["nameplate"]["filters"]["Luckyone_PF"]["triggers"]["names"]["164737"] = true
	E.global["nameplate"]["filters"]["Luckyone_PF"]["triggers"]["names"]["168572"] = true
	E.global["nameplate"]["filters"]["Luckyone_PF"]["triggers"]["names"]["168627"] = true
	E.global["nameplate"]["filters"]["Luckyone_PF"]["triggers"]["names"]["169861"] = true
	E.global["nameplate"]["filters"]["Luckyone_PF"]["triggers"]["priority"] = 2

	-- Sanguine Depths [SD]
	E.global["nameplate"]["filters"]["Luckyone_SD"]["actions"]["color"]["health"] = true
	E.global["nameplate"]["filters"]["Luckyone_SD"]["actions"]["color"]["healthColor"]["g"] = 0.75686274509804
	E.global["nameplate"]["filters"]["Luckyone_SD"]["actions"]["color"]["healthColor"]["r"] = 0
	E.global["nameplate"]["filters"]["Luckyone_SD"]["triggers"]["names"]["162038"] = true
	E.global["nameplate"]["filters"]["Luckyone_SD"]["triggers"]["names"]["162040"] = true
	E.global["nameplate"]["filters"]["Luckyone_SD"]["triggers"]["names"]["162057"] = true
	E.global["nameplate"]["filters"]["Luckyone_SD"]["triggers"]["names"]["171376"] = true
	E.global["nameplate"]["filters"]["Luckyone_SD"]["triggers"]["names"]["171799"] = true
	E.global["nameplate"]["filters"]["Luckyone_SD"]["triggers"]["priority"] = 2

	-- Spires of Ascension [SOA]
	E.global["nameplate"]["filters"]["Luckyone_SOA"]["actions"]["color"]["health"] = true
	E.global["nameplate"]["filters"]["Luckyone_SOA"]["actions"]["color"]["healthColor"]["g"] = 0.75686274509804
	E.global["nameplate"]["filters"]["Luckyone_SOA"]["actions"]["color"]["healthColor"]["r"] = 0
	E.global["nameplate"]["filters"]["Luckyone_SOA"]["triggers"]["names"]["163459"] = true
	E.global["nameplate"]["filters"]["Luckyone_SOA"]["triggers"]["names"]["163520"] = true
	E.global["nameplate"]["filters"]["Luckyone_SOA"]["triggers"]["names"]["168318"] = true
	E.global["nameplate"]["filters"]["Luckyone_SOA"]["triggers"]["names"]["168681"] = true
	E.global["nameplate"]["filters"]["Luckyone_SOA"]["triggers"]["priority"] = 2

	-- Theater of Pain [TOP]
	E.global["nameplate"]["filters"]["Luckyone_TOP"]["actions"]["color"]["health"] = true
	E.global["nameplate"]["filters"]["Luckyone_TOP"]["actions"]["color"]["healthColor"]["g"] = 0.75686274509804
	E.global["nameplate"]["filters"]["Luckyone_TOP"]["actions"]["color"]["healthColor"]["r"] = 0
	E.global["nameplate"]["filters"]["Luckyone_TOP"]["triggers"]["names"]["160495"] = true
	E.global["nameplate"]["filters"]["Luckyone_TOP"]["triggers"]["names"]["164506"] = true
	E.global["nameplate"]["filters"]["Luckyone_TOP"]["triggers"]["names"]["170850"] = true
	E.global["nameplate"]["filters"]["Luckyone_TOP"]["triggers"]["names"]["174210"] = true
	E.global["nameplate"]["filters"]["Luckyone_TOP"]["triggers"]["priority"] = 2

	-- Edited default filters
	E.global["nameplate"]["filters"]["ElvUI_Explosives"]["actions"]["color"]["healthColor"]["r"] = 0.49019607843137
	E.global["nameplate"]["filters"]["ElvUI_Explosives"]["actions"]["color"]["healthColor"]["g"] = 0
	E.global["nameplate"]["filters"]["ElvUI_Explosives"]["actions"]["color"]["healthColor"]["b"] = 1
	E.global["nameplate"]["filters"]["ElvUI_Explosives"]["actions"]["scale"] = 1
	E.global["nameplate"]["filters"]["ElvUI_Explosives"]["triggers"]["priority"] = 1
	E.global["nameplate"]["filters"]["ElvUI_NonTarget"]["actions"]["alpha"] = 70
	E.global["nameplate"]["filters"]["ElvUI_Target"]["actions"]["scale"] = 1

	E:StaggeredUpdateAll(nil, true)

	-- NamePlate CVars
	SetCVar('nameplateLargerScale', 1)
	SetCVar('nameplateMinAlpha', 1)
	SetCVar('nameplateMinScale', 1)
	SetCVar('nameplateMotion', 1)
	SetCVar('nameplateOccludedAlphaMult', 1)
	SetCVar('nameplateOverlapH', 1)
	SetCVar('nameplateOverlapV', 1.6)
	SetCVar('nameplateSelectedScale', 1)
	SetCVar('nameplateSelfAlpha', 1)

	-- Name CVars
	SetCVar('UnitNameEnemyGuardianName', 1)
	SetCVar('UnitNameEnemyMinionName', 1)
	SetCVar('UnitNameEnemyPetName', 1)
	SetCVar('UnitNameEnemyPlayerName', 1)
	SetCVar('UnitNameEnemyTotem', 1)

	L1UI:Print('NamePlate StyleFilters and CVars have been set.')
end
