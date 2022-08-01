local L1UI, E, L, V, P, G = unpack(select(2, ...))
local NP = E:GetModule('NamePlates')

local pairs = pairs
local SetCVar = SetCVar

-- NamePlate Setup for ElvUI and Plater (addon arg 'ElvUI' and 'Plater' available)
function L1UI:Setup_NamePlates(addon)

	if addon == 'ElvUI' then

		-- Make sure to enable ElvUI NamePlates
		E.private.nameplates.enable = true

		-- Setup StyleFilters (includes NamePlate CVars)
		L1UI:Setup_StyleFilters()

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

		-- Update the module so we don't require a ReloadUI
		if NP.Initialized then E:UpdateNamePlates(true) end

	elseif addon == 'Plater' then

		-- Disable ElvUI NamePlates
		E.private.nameplates.enable = false

		-- Set NamePlate CVars
		L1UI:NameplateCVars()

		-- Load Plater profile
		L1UI:Setup_Plater()
	end
end

-- Custom StyleFilters for all current Dungeons
function L1UI:Setup_StyleFilters()
	if not E.private.nameplates.enable then return end

	if E.Retail then

		-- {'Luckyone_DOCKS'}
		for _, filterName in pairs({'Luckyone_DEPOT', 'Luckyone_LOWER', 'Luckyone_UPPER', 'Luckyone_WORK', 'Luckyone_YARD', 'Luckyone_TZ'}) do
			E.global["nameplates"]["filters"][filterName] = {}
			E.NamePlates:StyleFilterCopyDefaults(E.global["nameplates"]["filters"][filterName])
			E.db["nameplates"]["filters"][filterName] = { triggers = { enable = true } }
		end

		-- Grimrail Depot [DEPOT]
		E.global["nameplate"]["filters"]["Luckyone_DEPOT"]["actions"]["color"]["health"] = true
		E.global["nameplate"]["filters"]["Luckyone_DEPOT"]["actions"]["color"]["healthColor"]["g"] = 0.75686274509804
		E.global["nameplate"]["filters"]["Luckyone_DEPOT"]["actions"]["color"]["healthColor"]["r"] = 0
		E.global["nameplate"]["filters"]["Luckyone_DEPOT"]["triggers"]["names"]["81236"] = true -- Grimrail Technician
		E.global["nameplate"]["filters"]["Luckyone_DEPOT"]["triggers"]["names"]["81407"] = true -- Grimrail Bombardier
		E.global["nameplate"]["filters"]["Luckyone_DEPOT"]["triggers"]["names"]["80937"] = true -- Grom'kar Gunner
		E.global["nameplate"]["filters"]["Luckyone_DEPOT"]["triggers"]["names"]["88163"] = true -- Grom'kar Cinderseer
		E.global["nameplate"]["filters"]["Luckyone_DEPOT"]["triggers"]["names"]["82597"] = true -- Grom'kar Captain
		E.global["nameplate"]["filters"]["Luckyone_DEPOT"]["triggers"]["priority"] = 2

		-- Iron Docks [DOCKS]
		-- E.global["nameplate"]["filters"]["Luckyone_DOCKS"]["actions"]["color"]["health"] = true
		-- E.global["nameplate"]["filters"]["Luckyone_DOCKS"]["actions"]["color"]["healthColor"]["g"] = 0.75686274509804
		-- E.global["nameplate"]["filters"]["Luckyone_DOCKS"]["actions"]["color"]["healthColor"]["r"] = 0
		-- E.global["nameplate"]["filters"]["Luckyone_DOCKS"]["triggers"]["names"][""] = true
		-- E.global["nameplate"]["filters"]["Luckyone_DOCKS"]["triggers"]["names"][""] = true
		-- E.global["nameplate"]["filters"]["Luckyone_DOCKS"]["triggers"]["names"][""] = true
		-- E.global["nameplate"]["filters"]["Luckyone_DOCKS"]["triggers"]["names"][""] = true
		-- E.global["nameplate"]["filters"]["Luckyone_DOCKS"]["triggers"]["priority"] = 2

		-- Karazhan Lower [LOWER]
		E.global["nameplate"]["filters"]["Luckyone_LOWER"]["actions"]["color"]["health"] = true
		E.global["nameplate"]["filters"]["Luckyone_LOWER"]["actions"]["color"]["healthColor"]["g"] = 0.75686274509804
		E.global["nameplate"]["filters"]["Luckyone_LOWER"]["actions"]["color"]["healthColor"]["r"] = 0
		E.global["nameplate"]["filters"]["Luckyone_LOWER"]["triggers"]["names"]["114584"] = true -- Phantom Crew
		E.global["nameplate"]["filters"]["Luckyone_LOWER"]["triggers"]["names"]["114628"] = true -- Skeletal Waiter
		E.global["nameplate"]["filters"]["Luckyone_LOWER"]["triggers"]["names"]["114802"] = true -- Spectral Journeyman
		E.global["nameplate"]["filters"]["Luckyone_LOWER"]["triggers"]["priority"] = 2

		-- Karazhan Upper [UPPER]
		E.global["nameplate"]["filters"]["Luckyone_UPPER"]["actions"]["color"]["health"] = true
		E.global["nameplate"]["filters"]["Luckyone_UPPER"]["actions"]["color"]["healthColor"]["g"] = 0.75686274509804
		E.global["nameplate"]["filters"]["Luckyone_UPPER"]["actions"]["color"]["healthColor"]["r"] = 0
		E.global["nameplate"]["filters"]["Luckyone_UPPER"]["triggers"]["names"]["114338"] = true -- Mana Confluence
		E.global["nameplate"]["filters"]["Luckyone_UPPER"]["triggers"]["names"]["114249"] = true -- Volatile Energy
		E.global["nameplate"]["filters"]["Luckyone_UPPER"]["triggers"]["names"]["115757"] = true -- Wrathguard Flamebringer
		E.global["nameplate"]["filters"]["Luckyone_UPPER"]["triggers"]["names"]["115418"] = true -- Spider
		E.global["nameplate"]["filters"]["Luckyone_UPPER"]["triggers"]["names"]["115488"] = true -- Infused Pyromancer
		E.global["nameplate"]["filters"]["Luckyone_UPPER"]["triggers"]["priority"] = 2

		-- Mechagon Workshop [WORK]
		E.global["nameplate"]["filters"]["Luckyone_WORK"]["actions"]["color"]["health"] = true
		E.global["nameplate"]["filters"]["Luckyone_WORK"]["actions"]["color"]["healthColor"]["g"] = 0.75686274509804
		E.global["nameplate"]["filters"]["Luckyone_WORK"]["actions"]["color"]["healthColor"]["r"] = 0
		E.global["nameplate"]["filters"]["Luckyone_WORK"]["triggers"]["names"]["144293"] = true -- Waste Processing Unit
		E.global["nameplate"]["filters"]["Luckyone_WORK"]["triggers"]["names"]["144294"] = true -- Mechagon Tinkerer
		E.global["nameplate"]["filters"]["Luckyone_WORK"]["triggers"]["names"]["151325"] = true -- Alarm o Bot
		E.global["nameplate"]["filters"]["Luckyone_WORK"]["triggers"]["names"]["151657"] = true -- Bomb Tonk
		E.global["nameplate"]["filters"]["Luckyone_WORK"]["triggers"]["priority"] = 2

		-- Mechagon Junkyard [YARD]
		E.global["nameplate"]["filters"]["Luckyone_YARD"]["actions"]["color"]["health"] = true
		E.global["nameplate"]["filters"]["Luckyone_YARD"]["actions"]["color"]["healthColor"]["g"] = 0.75686274509804
		E.global["nameplate"]["filters"]["Luckyone_YARD"]["actions"]["color"]["healthColor"]["r"] = 0
		E.global["nameplate"]["filters"]["Luckyone_YARD"]["triggers"]["names"]["150146"] = true -- Scrapbone Shaman
		E.global["nameplate"]["filters"]["Luckyone_YARD"]["triggers"]["names"]["150160"] = true -- Scrapbone Bully
		E.global["nameplate"]["filters"]["Luckyone_YARD"]["triggers"]["names"]["150168"] = true -- Toxic Monstrosity
		E.global["nameplate"]["filters"]["Luckyone_YARD"]["triggers"]["names"]["150250"] = true -- Pistonhead Blaster
		E.global["nameplate"]["filters"]["Luckyone_YARD"]["triggers"]["names"]["150251"] = true -- Pistonhead Mechanic
		E.global["nameplate"]["filters"]["Luckyone_YARD"]["triggers"]["names"]["150292"] = true -- Mechagon Cavalry
		E.global["nameplate"]["filters"]["Luckyone_YARD"]["triggers"]["names"]["150297"] = true -- Mechagon Renormalizer
		E.global["nameplate"]["filters"]["Luckyone_YARD"]["triggers"]["priority"] = 2

		-- Tazavesh [TZ]
		E.global["nameplates"]["filters"]["Luckyone_TZ"]["actions"]["color"]["health"] = true
		E.global["nameplates"]["filters"]["Luckyone_TZ"]["actions"]["color"]["healthColor"]["g"] = 0.75686274509804
		E.global["nameplates"]["filters"]["Luckyone_TZ"]["actions"]["color"]["healthColor"]["r"] = 0
		E.global["nameplates"]["filters"]["Luckyone_TZ"]["triggers"]["names"]["178141"] = true -- Murkbrine Scalebinder
		E.global["nameplates"]["filters"]["Luckyone_TZ"]["triggers"]["names"]["179733"] = true -- Invigorating Fish Stick
		E.global["nameplates"]["filters"]["Luckyone_TZ"]["triggers"]["names"]["180431"] = true -- Focused Ritualist
		E.global["nameplates"]["filters"]["Luckyone_TZ"]["triggers"]["names"]["180433"] = true -- Wandering Pulsar
		E.global["nameplates"]["filters"]["Luckyone_TZ"]["triggers"]["priority"] = 2

		-- Edited version of ElvUI_Explosives
		E.global["nameplates"]["filters"]["ElvUI_Explosives"]["actions"]["color"]["healthColor"]["b"] = 1
		E.global["nameplates"]["filters"]["ElvUI_Explosives"]["actions"]["color"]["healthColor"]["g"] = 0
		E.global["nameplates"]["filters"]["ElvUI_Explosives"]["actions"]["color"]["healthColor"]["r"] = 0.49019607843137
		E.global["nameplates"]["filters"]["ElvUI_Explosives"]["actions"]["scale"] = 1
		E.global["nameplates"]["filters"]["ElvUI_Explosives"]["actions"]["usePortrait"] = false
		E.global["nameplates"]["filters"]["ElvUI_Explosives"]["triggers"]["priority"] = 1
	end

	-- Disable alpha fading and scaling for ElvUI_Target and ElvUI_NonTarget
	E.global["nameplates"]["filters"]["ElvUI_NonTarget"]["actions"]["alpha"] = -1
	E.global["nameplates"]["filters"]["ElvUI_Target"]["actions"]["scale"] = 1

	-- Set NamePlate CVars
	L1UI:NameplateCVars()

	L1UI:Print(L["NamePlate StyleFilters and CVars have been set."])
end
