local L1UI, E, L, V, P, G = unpack(select(2, ...))

local pairs = pairs
local SetCVar = SetCVar

-- NamePlate Setup for ElvUI and Plater (addon arg 'ElvUI' and 'Plater' available)
function L1UI:SetupNamePlates(addon)

	if addon == 'ElvUI' then

		-- Make sure to enable ElvUI NamePlates
		E.private["nameplates"]["enable"] = true

		-- Setup StyleFilters (includes Nameplate CVars)
		L1UI:SetupStyleFilters()

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
		E.db["nameplates"]["lowHealthThreshold"] = 0
		E.db["nameplates"]["overlapH"] = 1
		E.db["nameplates"]["overlapV"] = 1.7
		E.db["nameplates"]["plateSize"]["enemyHeight"] = 40
		E.db["nameplates"]["plateSize"]["enemyWidth"] = 175
		E.db["nameplates"]["plateSize"]["friendlyHeight"] = 40
		E.db["nameplates"]["plateSize"]["friendlyWidth"] = 175
		E.db["nameplates"]["plateSize"]["personalHeight"] = 40
		E.db["nameplates"]["plateSize"]["personalWidth"] = 175
		E.db["nameplates"]["statusbar"] = "Minimalist"
		E.db["nameplates"]["units"]["ENEMY_NPC"]["buffs"]["anchorPoint"] = "TOPRIGHT"
		E.db["nameplates"]["units"]["ENEMY_NPC"]["buffs"]["countFont"] = "Expressway"
		E.db["nameplates"]["units"]["ENEMY_NPC"]["buffs"]["countFontSize"] = 14
		E.db["nameplates"]["units"]["ENEMY_NPC"]["buffs"]["countPosition"] = "TOP"
		E.db["nameplates"]["units"]["ENEMY_NPC"]["buffs"]["countYOffset"] = 14
		E.db["nameplates"]["units"]["ENEMY_NPC"]["buffs"]["font"] = "Expressway"
		E.db["nameplates"]["units"]["ENEMY_NPC"]["buffs"]["fontSize"] = 10
		E.db["nameplates"]["units"]["ENEMY_NPC"]["buffs"]["numAuras"] = 3
		E.db["nameplates"]["units"]["ENEMY_NPC"]["buffs"]["priority"] = "Blacklist,Dispellable,RaidBuffsElvUI"
		E.db["nameplates"]["units"]["ENEMY_NPC"]["buffs"]["size"] = 22
		E.db["nameplates"]["units"]["ENEMY_NPC"]["buffs"]["spacing"] = 0
		E.db["nameplates"]["units"]["ENEMY_NPC"]["buffs"]["xOffset"] = 24
		E.db["nameplates"]["units"]["ENEMY_NPC"]["buffs"]["yOffset"] = -32
		E.db["nameplates"]["units"]["ENEMY_NPC"]["castbar"]["castTimeFormat"] = "REMAINING"
		E.db["nameplates"]["units"]["ENEMY_NPC"]["castbar"]["channelTimeFormat"] = "REMAINING"
		E.db["nameplates"]["units"]["ENEMY_NPC"]["castbar"]["font"] = "Expressway"
		E.db["nameplates"]["units"]["ENEMY_NPC"]["castbar"]["height"] = 16
		E.db["nameplates"]["units"]["ENEMY_NPC"]["castbar"]["iconOffsetY"] = -1
		E.db["nameplates"]["units"]["ENEMY_NPC"]["castbar"]["iconPosition"] = "LEFT"
		E.db["nameplates"]["units"]["ENEMY_NPC"]["castbar"]["iconSize"] = 39
		E.db["nameplates"]["units"]["ENEMY_NPC"]["castbar"]["textPosition"] = "ONBAR"
		E.db["nameplates"]["units"]["ENEMY_NPC"]["castbar"]["textXOffset"] = 2
		E.db["nameplates"]["units"]["ENEMY_NPC"]["castbar"]["timeToHold"] = 2
		E.db["nameplates"]["units"]["ENEMY_NPC"]["castbar"]["timeXOffset"] = -2
		E.db["nameplates"]["units"]["ENEMY_NPC"]["castbar"]["width"] = 175
		E.db["nameplates"]["units"]["ENEMY_NPC"]["castbar"]["yOffset"] = -19
		E.db["nameplates"]["units"]["ENEMY_NPC"]["debuffs"]["anchorPoint"] = "TOP"
		E.db["nameplates"]["units"]["ENEMY_NPC"]["debuffs"]["countFont"] = "Expressway"
		E.db["nameplates"]["units"]["ENEMY_NPC"]["debuffs"]["countFontSize"] = 13
		E.db["nameplates"]["units"]["ENEMY_NPC"]["debuffs"]["countPosition"] = "TOP"
		E.db["nameplates"]["units"]["ENEMY_NPC"]["debuffs"]["countYOffset"] = 14
		E.db["nameplates"]["units"]["ENEMY_NPC"]["debuffs"]["desaturate"] = false
		E.db["nameplates"]["units"]["ENEMY_NPC"]["debuffs"]["font"] = "Expressway"
		E.db["nameplates"]["units"]["ENEMY_NPC"]["debuffs"]["fontSize"] = 10
		E.db["nameplates"]["units"]["ENEMY_NPC"]["debuffs"]["numAuras"] = 7
		E.db["nameplates"]["units"]["ENEMY_NPC"]["debuffs"]["size"] = 22
		E.db["nameplates"]["units"]["ENEMY_NPC"]["debuffs"]["yOffset"] = -9
		E.db["nameplates"]["units"]["ENEMY_NPC"]["eliteIcon"]["size"] = 14
		E.db["nameplates"]["units"]["ENEMY_NPC"]["eliteIcon"]["xOffset"] = 3
		E.db["nameplates"]["units"]["ENEMY_NPC"]["health"]["height"] = 20
		E.db["nameplates"]["units"]["ENEMY_NPC"]["health"]["text"]["font"] = "Expressway"
		E.db["nameplates"]["units"]["ENEMY_NPC"]["health"]["text"]["fontSize"] = 12
		E.db["nameplates"]["units"]["ENEMY_NPC"]["health"]["text"]["format"] = "[luckyone:health:percent]"
		E.db["nameplates"]["units"]["ENEMY_NPC"]["health"]["text"]["parent"] = "Health"
		E.db["nameplates"]["units"]["ENEMY_NPC"]["health"]["text"]["position"] = "TOPRIGHT"
		E.db["nameplates"]["units"]["ENEMY_NPC"]["health"]["text"]["yOffset"] = -16
		E.db["nameplates"]["units"]["ENEMY_NPC"]["level"]["font"] = "Expressway"
		E.db["nameplates"]["units"]["ENEMY_NPC"]["level"]["format"] = ""
		E.db["nameplates"]["units"]["ENEMY_NPC"]["level"]["xOffset"] = 3
		E.db["nameplates"]["units"]["ENEMY_NPC"]["level"]["yOffset"] = -10
		E.db["nameplates"]["units"]["ENEMY_NPC"]["name"]["font"] = "Expressway"
		E.db["nameplates"]["units"]["ENEMY_NPC"]["name"]["fontSize"] = 12
		E.db["nameplates"]["units"]["ENEMY_NPC"]["name"]["format"] = "[name:last]"
		E.db["nameplates"]["units"]["ENEMY_NPC"]["name"]["parent"] = "Health"
		E.db["nameplates"]["units"]["ENEMY_NPC"]["name"]["xOffset"] = 2
		E.db["nameplates"]["units"]["ENEMY_NPC"]["name"]["yOffset"] = -16
		E.db["nameplates"]["units"]["ENEMY_NPC"]["power"]["text"]["font"] = "Expressway"
		E.db["nameplates"]["units"]["ENEMY_NPC"]["pvpindicator"]["size"] = 35
		E.db["nameplates"]["units"]["ENEMY_NPC"]["questIcon"]["enable"] = false
		E.db["nameplates"]["units"]["ENEMY_NPC"]["questIcon"]["font"] = "Expressway"
		E.db["nameplates"]["units"]["ENEMY_NPC"]["questIcon"]["size"] = 25
		E.db["nameplates"]["units"]["ENEMY_NPC"]["questIcon"]["textPosition"] = "CENTER"
		E.db["nameplates"]["units"]["ENEMY_NPC"]["raidTargetIndicator"]["size"] = 20
		E.db["nameplates"]["units"]["ENEMY_NPC"]["raidTargetIndicator"]["xOffset"] = -3
		E.db["nameplates"]["units"]["ENEMY_NPC"]["title"]["font"] = "Expressway"
		E.db["nameplates"]["units"]["ENEMY_PLAYER"]["buffs"]["anchorPoint"] = "TOPRIGHT"
		E.db["nameplates"]["units"]["ENEMY_PLAYER"]["buffs"]["countFont"] = "Expressway"
		E.db["nameplates"]["units"]["ENEMY_PLAYER"]["buffs"]["countFontSize"] = 14
		E.db["nameplates"]["units"]["ENEMY_PLAYER"]["buffs"]["countPosition"] = "TOP"
		E.db["nameplates"]["units"]["ENEMY_PLAYER"]["buffs"]["countYOffset"] = 14
		E.db["nameplates"]["units"]["ENEMY_PLAYER"]["buffs"]["font"] = "Expressway"
		E.db["nameplates"]["units"]["ENEMY_PLAYER"]["buffs"]["fontSize"] = 10
		E.db["nameplates"]["units"]["ENEMY_PLAYER"]["buffs"]["maxDuration"] = 0
		E.db["nameplates"]["units"]["ENEMY_PLAYER"]["buffs"]["numAuras"] = 3
		E.db["nameplates"]["units"]["ENEMY_PLAYER"]["buffs"]["priority"] = "Blacklist,Dispellable,RaidBuffsElvUI"
		E.db["nameplates"]["units"]["ENEMY_PLAYER"]["buffs"]["size"] = 22
		E.db["nameplates"]["units"]["ENEMY_PLAYER"]["buffs"]["spacing"] = 0
		E.db["nameplates"]["units"]["ENEMY_PLAYER"]["buffs"]["xOffset"] = 24
		E.db["nameplates"]["units"]["ENEMY_PLAYER"]["buffs"]["yOffset"] = -32
		E.db["nameplates"]["units"]["ENEMY_PLAYER"]["castbar"]["castTimeFormat"] = "REMAINING"
		E.db["nameplates"]["units"]["ENEMY_PLAYER"]["castbar"]["channelTimeFormat"] = "REMAINING"
		E.db["nameplates"]["units"]["ENEMY_PLAYER"]["castbar"]["font"] = "Expressway"
		E.db["nameplates"]["units"]["ENEMY_PLAYER"]["castbar"]["height"] = 16
		E.db["nameplates"]["units"]["ENEMY_PLAYER"]["castbar"]["iconOffsetY"] = -1
		E.db["nameplates"]["units"]["ENEMY_PLAYER"]["castbar"]["iconPosition"] = "LEFT"
		E.db["nameplates"]["units"]["ENEMY_PLAYER"]["castbar"]["iconSize"] = 39
		E.db["nameplates"]["units"]["ENEMY_PLAYER"]["castbar"]["textPosition"] = "ONBAR"
		E.db["nameplates"]["units"]["ENEMY_PLAYER"]["castbar"]["timeToHold"] = 2
		E.db["nameplates"]["units"]["ENEMY_PLAYER"]["castbar"]["width"] = 175
		E.db["nameplates"]["units"]["ENEMY_PLAYER"]["castbar"]["yOffset"] = -19
		E.db["nameplates"]["units"]["ENEMY_PLAYER"]["debuffs"]["anchorPoint"] = "TOP"
		E.db["nameplates"]["units"]["ENEMY_PLAYER"]["debuffs"]["countFont"] = "Expressway"
		E.db["nameplates"]["units"]["ENEMY_PLAYER"]["debuffs"]["countFontSize"] = 13
		E.db["nameplates"]["units"]["ENEMY_PLAYER"]["debuffs"]["countPosition"] = "TOP"
		E.db["nameplates"]["units"]["ENEMY_PLAYER"]["debuffs"]["countYOffset"] = 14
		E.db["nameplates"]["units"]["ENEMY_PLAYER"]["debuffs"]["desaturate"] = false
		E.db["nameplates"]["units"]["ENEMY_PLAYER"]["debuffs"]["font"] = "Expressway"
		E.db["nameplates"]["units"]["ENEMY_PLAYER"]["debuffs"]["fontSize"] = 10
		E.db["nameplates"]["units"]["ENEMY_PLAYER"]["debuffs"]["numAuras"] = 7
		E.db["nameplates"]["units"]["ENEMY_PLAYER"]["debuffs"]["priority"] = "Blacklist,Personal,CCDebuffs"
		E.db["nameplates"]["units"]["ENEMY_PLAYER"]["debuffs"]["size"] = 22
		E.db["nameplates"]["units"]["ENEMY_PLAYER"]["debuffs"]["yOffset"] = -9
		E.db["nameplates"]["units"]["ENEMY_PLAYER"]["health"]["height"] = 20
		E.db["nameplates"]["units"]["ENEMY_PLAYER"]["health"]["text"]["font"] = "Expressway"
		E.db["nameplates"]["units"]["ENEMY_PLAYER"]["health"]["text"]["fontSize"] = 12
		E.db["nameplates"]["units"]["ENEMY_PLAYER"]["health"]["text"]["format"] = "[luckyone:health:percent]"
		E.db["nameplates"]["units"]["ENEMY_PLAYER"]["health"]["text"]["parent"] = "Health"
		E.db["nameplates"]["units"]["ENEMY_PLAYER"]["health"]["text"]["position"] = "TOPRIGHT"
		E.db["nameplates"]["units"]["ENEMY_PLAYER"]["health"]["text"]["xOffset"] = -1
		E.db["nameplates"]["units"]["ENEMY_PLAYER"]["health"]["text"]["yOffset"] = -15
		E.db["nameplates"]["units"]["ENEMY_PLAYER"]["level"]["font"] = "Expressway"
		E.db["nameplates"]["units"]["ENEMY_PLAYER"]["level"]["format"] = ""
		E.db["nameplates"]["units"]["ENEMY_PLAYER"]["level"]["xOffset"] = 3
		E.db["nameplates"]["units"]["ENEMY_PLAYER"]["level"]["yOffset"] = -10
		E.db["nameplates"]["units"]["ENEMY_PLAYER"]["name"]["font"] = "Expressway"
		E.db["nameplates"]["units"]["ENEMY_PLAYER"]["name"]["fontSize"] = 12
		E.db["nameplates"]["units"]["ENEMY_PLAYER"]["name"]["format"] = "[name:last]"
		E.db["nameplates"]["units"]["ENEMY_PLAYER"]["name"]["parent"] = "Health"
		E.db["nameplates"]["units"]["ENEMY_PLAYER"]["name"]["xOffset"] = 2
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
		E.db["nameplates"]["units"]["FRIENDLY_NPC"]["health"]["text"]["format"] = "[luckyone:health:percent]"
		E.db["nameplates"]["units"]["FRIENDLY_NPC"]["level"]["font"] = "Expressway"
		E.db["nameplates"]["units"]["FRIENDLY_NPC"]["level"]["format"] = "[level]"
		E.db["nameplates"]["units"]["FRIENDLY_NPC"]["level"]["xOffset"] = 3
		E.db["nameplates"]["units"]["FRIENDLY_NPC"]["level"]["yOffset"] = -10
		E.db["nameplates"]["units"]["FRIENDLY_NPC"]["name"]["font"] = "Expressway"
		E.db["nameplates"]["units"]["FRIENDLY_NPC"]["name"]["yOffset"] = -10
		E.db["nameplates"]["units"]["FRIENDLY_NPC"]["power"]["text"]["font"] = "Expressway"
		E.db["nameplates"]["units"]["FRIENDLY_NPC"]["pvpindicator"]["size"] = 35
		E.db["nameplates"]["units"]["FRIENDLY_NPC"]["questIcon"]["enable"] = false
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
		E.db["nameplates"]["units"]["FRIENDLY_PLAYER"]["health"]["text"]["format"] = "[luckyone:health:percent]"
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
		E.db["nameplates"]["units"]["PLAYER"]["enable"] = false
		E.db["nameplates"]["visibility"]["enemy"]["guardians"] = true
		E.db["nameplates"]["visibility"]["enemy"]["minions"] = true

	elseif addon == 'Plater' then

		-- Make sure to disable ElvUI NamePlates if Plater is selected
		E.private["nameplates"]["enable"] = false

		-- Load Plater profile
		L1UI:Setup_Plater()

		-- Set NamePlate CVars
		L1UI:NameplateCVars()
	end
end

-- Custom StyleFilters for all Shadowlands Dungeons
function L1UI:SetupStyleFilters()

	if E.Retail then

		-- Enable all filters from the pairs table and copy default tree options
		for _, filterName in pairs({'Luckyone_Encrypted', 'Luckyone_TZ', 'Luckyone_HOA', 'Luckyone_MISTS', 'Luckyone_PF', 'Luckyone_NW', 'Luckyone_TOP', 'Luckyone_SD', 'Luckyone_SOA', 'Luckyone_DOS'}) do
			E.global["nameplates"]["filters"][filterName] = {}
			E.NamePlates:StyleFilterCopyDefaults(E.global["nameplates"]["filters"][filterName])
			E.db["nameplates"]["filters"][filterName] = { triggers = { enable = true } }
		end

		-- De Other Side [DOS]
		E.global["nameplates"]["filters"]["Luckyone_DOS"]["actions"]["color"]["health"] = true
		E.global["nameplates"]["filters"]["Luckyone_DOS"]["actions"]["color"]["healthColor"]["g"] = 0.75686274509804
		E.global["nameplates"]["filters"]["Luckyone_DOS"]["actions"]["color"]["healthColor"]["r"] = 0
		E.global["nameplates"]["filters"]["Luckyone_DOS"]["triggers"]["names"]["164857"] = true -- Spriggan Mendbender
		E.global["nameplates"]["filters"]["Luckyone_DOS"]["triggers"]["names"]["167965"] = true -- Lubricator
		E.global["nameplates"]["filters"]["Luckyone_DOS"]["triggers"]["names"]["168934"] = true -- Enraged Spirit
		E.global["nameplates"]["filters"]["Luckyone_DOS"]["triggers"]["names"]["168942"] = true -- Death Speaker
		E.global["nameplates"]["filters"]["Luckyone_DOS"]["triggers"]["names"]["169905"] = true -- Risen Warlord
		E.global["nameplates"]["filters"]["Luckyone_DOS"]["triggers"]["names"]["170572"] = true -- Atal'ai Hoodoo Hexxer
		E.global["nameplates"]["filters"]["Luckyone_DOS"]["triggers"]["names"]["171341"] = true -- Bladebeak Hatchling
		E.global["nameplates"]["filters"]["Luckyone_DOS"]["triggers"]["names"]["171343"] = true -- Bladebeak Matriarch
		E.global["nameplates"]["filters"]["Luckyone_DOS"]["triggers"]["priority"] = 2

		-- Halls of Atonement [HOA]
		E.global["nameplates"]["filters"]["Luckyone_HOA"]["actions"]["color"]["health"] = true
		E.global["nameplates"]["filters"]["Luckyone_HOA"]["actions"]["color"]["healthColor"]["g"] = 0.75686274509804
		E.global["nameplates"]["filters"]["Luckyone_HOA"]["actions"]["color"]["healthColor"]["r"] = 0
		E.global["nameplates"]["filters"]["Luckyone_HOA"]["triggers"]["names"]["164562"] = true -- Depraved Houndmaster
		E.global["nameplates"]["filters"]["Luckyone_HOA"]["triggers"]["names"]["165529"] = true -- Depraved Collector
		E.global["nameplates"]["filters"]["Luckyone_HOA"]["triggers"]["names"]["167612"] = true -- Stoneborn Reaver
		E.global["nameplates"]["filters"]["Luckyone_HOA"]["triggers"]["names"]["167892"] = true -- Tormented Soul
		E.global["nameplates"]["filters"]["Luckyone_HOA"]["triggers"]["priority"] = 2

		-- Mists of Tirna Scithe [MISTS]
		E.global["nameplates"]["filters"]["Luckyone_MISTS"]["actions"]["color"]["health"] = true
		E.global["nameplates"]["filters"]["Luckyone_MISTS"]["actions"]["color"]["healthColor"]["g"] = 0.75686274509804
		E.global["nameplates"]["filters"]["Luckyone_MISTS"]["actions"]["color"]["healthColor"]["r"] = 0
		E.global["nameplates"]["filters"]["Luckyone_MISTS"]["triggers"]["names"]["164804"] = true -- Droman Oulfarran
		E.global["nameplates"]["filters"]["Luckyone_MISTS"]["triggers"]["names"]["164921"] = true -- Drust Harvester
		E.global["nameplates"]["filters"]["Luckyone_MISTS"]["triggers"]["names"]["166299"] = true -- Mistveil Tender
		E.global["nameplates"]["filters"]["Luckyone_MISTS"]["triggers"]["names"]["167111"] = true -- Spinemaw Staghorn
		E.global["nameplates"]["filters"]["Luckyone_MISTS"]["triggers"]["priority"] = 2

		-- The Necrotic Wake [NW]
		E.global["nameplates"]["filters"]["Luckyone_NW"]["actions"]["color"]["health"] = true
		E.global["nameplates"]["filters"]["Luckyone_NW"]["actions"]["color"]["healthColor"]["g"] = 0.75686274509804
		E.global["nameplates"]["filters"]["Luckyone_NW"]["actions"]["color"]["healthColor"]["r"] = 0
		E.global["nameplates"]["filters"]["Luckyone_NW"]["triggers"]["names"]["163618"] = true -- Zolramus Necromancer
		E.global["nameplates"]["filters"]["Luckyone_NW"]["triggers"]["names"]["165824"] = true -- Nar'zudah
		E.global["nameplates"]["filters"]["Luckyone_NW"]["triggers"]["names"]["165872"] = true -- Flesh Crafter
		E.global["nameplates"]["filters"]["Luckyone_NW"]["triggers"]["names"]["166302"] = true -- Corpse Harvester
		E.global["nameplates"]["filters"]["Luckyone_NW"]["triggers"]["names"]["173016"] = true -- Corpse Collector
		E.global["nameplates"]["filters"]["Luckyone_NW"]["triggers"]["priority"] = 2

		-- Plaguefall [PF]
		E.global["nameplates"]["filters"]["Luckyone_PF"]["actions"]["color"]["health"] = true
		E.global["nameplates"]["filters"]["Luckyone_PF"]["actions"]["color"]["healthColor"]["g"] = 0.75686274509804
		E.global["nameplates"]["filters"]["Luckyone_PF"]["actions"]["color"]["healthColor"]["r"] = 0
		E.global["nameplates"]["filters"]["Luckyone_PF"]["triggers"]["names"]["163882"] = true -- Decaying Flesh Giant
		E.global["nameplates"]["filters"]["Luckyone_PF"]["triggers"]["names"]["163894"] = true -- Blighted Spinebreaker
		E.global["nameplates"]["filters"]["Luckyone_PF"]["triggers"]["names"]["164737"] = true -- Brood Ambusher
		E.global["nameplates"]["filters"]["Luckyone_PF"]["triggers"]["names"]["168572"] = true -- Fungi Stormer
		E.global["nameplates"]["filters"]["Luckyone_PF"]["triggers"]["names"]["168627"] = true -- Plaguebinder
		E.global["nameplates"]["filters"]["Luckyone_PF"]["triggers"]["names"]["169861"] = true -- Ickor Bileflesh
		E.global["nameplates"]["filters"]["Luckyone_PF"]["triggers"]["priority"] = 2

		-- Sanguine Depths [SD]
		E.global["nameplates"]["filters"]["Luckyone_SD"]["actions"]["color"]["health"] = true
		E.global["nameplates"]["filters"]["Luckyone_SD"]["actions"]["color"]["healthColor"]["g"] = 0.75686274509804
		E.global["nameplates"]["filters"]["Luckyone_SD"]["actions"]["color"]["healthColor"]["r"] = 0
		E.global["nameplates"]["filters"]["Luckyone_SD"]["triggers"]["names"]["162038"] = true -- Regal Mistdancer
		E.global["nameplates"]["filters"]["Luckyone_SD"]["triggers"]["names"]["162040"] = true -- Grand Overseer
		E.global["nameplates"]["filters"]["Luckyone_SD"]["triggers"]["names"]["162057"] = true -- Chamber Sentinel
		E.global["nameplates"]["filters"]["Luckyone_SD"]["triggers"]["names"]["171376"] = true -- Head Custodian Javlin
		E.global["nameplates"]["filters"]["Luckyone_SD"]["triggers"]["names"]["171799"] = true -- Depths Warden
		E.global["nameplates"]["filters"]["Luckyone_SD"]["triggers"]["priority"] = 2

		-- Spires of Ascension [SOA]
		E.global["nameplates"]["filters"]["Luckyone_SOA"]["actions"]["color"]["health"] = true
		E.global["nameplates"]["filters"]["Luckyone_SOA"]["actions"]["color"]["healthColor"]["g"] = 0.75686274509804
		E.global["nameplates"]["filters"]["Luckyone_SOA"]["actions"]["color"]["healthColor"]["r"] = 0
		E.global["nameplates"]["filters"]["Luckyone_SOA"]["triggers"]["names"]["163459"] = true -- Forsworn Mender
		E.global["nameplates"]["filters"]["Luckyone_SOA"]["triggers"]["names"]["163520"] = true -- Forsworn Squad-Leader
		E.global["nameplates"]["filters"]["Luckyone_SOA"]["triggers"]["names"]["168318"] = true -- Forsworn Goliath
		E.global["nameplates"]["filters"]["Luckyone_SOA"]["triggers"]["names"]["168681"] = true -- Forsworn Helion
		E.global["nameplates"]["filters"]["Luckyone_SOA"]["triggers"]["priority"] = 2

		-- Theater of Pain [TOP]
		E.global["nameplates"]["filters"]["Luckyone_TOP"]["actions"]["color"]["health"] = true
		E.global["nameplates"]["filters"]["Luckyone_TOP"]["actions"]["color"]["healthColor"]["g"] = 0.75686274509804
		E.global["nameplates"]["filters"]["Luckyone_TOP"]["actions"]["color"]["healthColor"]["r"] = 0
		E.global["nameplates"]["filters"]["Luckyone_TOP"]["triggers"]["names"]["164451"]= true -- Dessia the Decapitator
		E.global["nameplates"]["filters"]["Luckyone_TOP"]["triggers"]["names"]["160495"] = true -- Maniacal Soulbinder
		E.global["nameplates"]["filters"]["Luckyone_TOP"]["triggers"]["names"]["164506"] = true -- Ancient Captain
		E.global["nameplates"]["filters"]["Luckyone_TOP"]["triggers"]["names"]["170850"] = true -- Raging Bloodhorn
		E.global["nameplates"]["filters"]["Luckyone_TOP"]["triggers"]["names"]["174210"] = true -- Blighted Sludge-Spewer
		E.global["nameplates"]["filters"]["Luckyone_TOP"]["triggers"]["priority"] = 2

		-- Tazavesh [TZ]
		E.global["nameplates"]["filters"]["Luckyone_TZ"]["actions"]["color"]["health"] = true
		E.global["nameplates"]["filters"]["Luckyone_TZ"]["actions"]["color"]["healthColor"]["g"] = 0.75686274509804
		E.global["nameplates"]["filters"]["Luckyone_TZ"]["actions"]["color"]["healthColor"]["r"] = 0
		E.global["nameplates"]["filters"]["Luckyone_TZ"]["triggers"]["names"]["178141"] = true -- Murkbrine Scalebinder
		E.global["nameplates"]["filters"]["Luckyone_TZ"]["triggers"]["names"]["179733"] = true -- Invigorating Fish Stick
		E.global["nameplates"]["filters"]["Luckyone_TZ"]["triggers"]["names"]["180431"] = true -- Focused Ritualist
		E.global["nameplates"]["filters"]["Luckyone_TZ"]["triggers"]["names"]["180433"] = true -- Wandering Pulsar
		E.global["nameplates"]["filters"]["Luckyone_TZ"]["triggers"]["priority"] = 2

		-- Encrypted Affix Shadowlands Season 3
		E.global["nameplates"]["filters"]["Luckyone_Encrypted"]["actions"]["color"]["health"] = true
		E.global["nameplates"]["filters"]["Luckyone_Encrypted"]["actions"]["color"]["healthColor"]["b"] = 0.42745098039216
		E.global["nameplates"]["filters"]["Luckyone_Encrypted"]["actions"]["color"]["healthColor"]["g"] = 0.6078431372549
		E.global["nameplates"]["filters"]["Luckyone_Encrypted"]["actions"]["color"]["healthColor"]["r"] = 0.77647058823529
		E.global["nameplates"]["filters"]["Luckyone_Encrypted"]["actions"]["tags"]["name"] = "[name]"
		E.global["nameplates"]["filters"]["Luckyone_Encrypted"]["triggers"]["names"]["184908"] = true -- Vy Interceptor
		E.global["nameplates"]["filters"]["Luckyone_Encrypted"]["triggers"]["names"]["184910"] = true -- Wo Drifter
		E.global["nameplates"]["filters"]["Luckyone_Encrypted"]["triggers"]["names"]["184911"] = true -- Urh Dismantler
		E.global["nameplates"]["filters"]["Luckyone_Encrypted"]["triggers"]["names"]["185680"] = true -- Vy Relic
		E.global["nameplates"]["filters"]["Luckyone_Encrypted"]["triggers"]["names"]["185683"] = true -- Wo Relic
		E.global["nameplates"]["filters"]["Luckyone_Encrypted"]["triggers"]["names"]["185685"] = true -- Urh Relic
		E.global["nameplates"]["filters"]["Luckyone_Encrypted"]["triggers"]["priority"] = 2

		-- Edited default filters
		E.global["nameplates"]["filters"]["ElvUI_Explosives"]["actions"]["color"]["healthColor"]["b"] = 1
		E.global["nameplates"]["filters"]["ElvUI_Explosives"]["actions"]["color"]["healthColor"]["g"] = 0
		E.global["nameplates"]["filters"]["ElvUI_Explosives"]["actions"]["color"]["healthColor"]["r"] = 0.49019607843137
		E.global["nameplates"]["filters"]["ElvUI_Explosives"]["actions"]["scale"] = 1
		E.global["nameplates"]["filters"]["ElvUI_Explosives"]["actions"]["usePortrait"] = false
		E.global["nameplates"]["filters"]["ElvUI_Explosives"]["triggers"]["priority"] = 1
	end

	E.global["nameplates"]["filters"]["ElvUI_NonTarget"]["actions"]["alpha"] = -1
	E.global["nameplates"]["filters"]["ElvUI_Target"]["actions"]["scale"] = 1

	-- Set NamePlate CVars
	L1UI:NameplateCVars()

	E:StaggeredUpdateAll()

	L1UI:Print(L["NamePlate StyleFilters and CVars have been set."])
end
