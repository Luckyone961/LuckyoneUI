local L1UI, E, L, V, P, G = unpack(select(2, ...))

-- Update Layout Buttons (Ingame Config)
if L1UI.Retail then

	function L1UI:UpdateLayout(layout)

		-- Protect some rare nil errors
		if not E.db.movers then E.db.movers = {} end

		-- Update ElvUI NamePlates
		if E.private.nameplates.enable then L1UI:SetupNamePlates('ElvUI') end

		-- Tooltip
		E.db["tooltip"]["dungeonScore"] = false
		E.db["tooltip"]["dungeonScoreColor"] = false
		E.db["tooltip"]["mythicDataEnable"] = false

		-- Arena Rework
		E.db["unitframe"]["units"]["arena"]["buffs"]["anchorPoint"] = "TOPRIGHT"
		E.db["unitframe"]["units"]["arena"]["buffs"]["countFontSize"] = 10
		E.db["unitframe"]["units"]["arena"]["buffs"]["countXOffset"] = 1
		E.db["unitframe"]["units"]["arena"]["buffs"]["numrows"] = 2
		E.db["unitframe"]["units"]["arena"]["buffs"]["priority"] = "Blacklist,Dispellable,RaidBuffsElvUI"
		E.db["unitframe"]["units"]["arena"]["buffs"]["sizeOverride"] = 22
		E.db["unitframe"]["units"]["arena"]["buffs"]["xOffset"] = 23
		E.db["unitframe"]["units"]["arena"]["buffs"]["yOffset"] = -46
		E.db["unitframe"]["units"]["arena"]["castbar"]["customTextFont"]["enable"] = true
		E.db["unitframe"]["units"]["arena"]["castbar"]["customTextFont"]["font"] = "Expressway"
		E.db["unitframe"]["units"]["arena"]["castbar"]["customTextFont"]["fontSize"] = 11
		E.db["unitframe"]["units"]["arena"]["castbar"]["customTimeFont"]["enable"] = true
		E.db["unitframe"]["units"]["arena"]["castbar"]["customTimeFont"]["font"] = "Expressway"
		E.db["unitframe"]["units"]["arena"]["castbar"]["customTimeFont"]["fontSize"] = 11
		E.db["unitframe"]["units"]["arena"]["castbar"]["textColor"]["b"] = 1
		E.db["unitframe"]["units"]["arena"]["castbar"]["textColor"]["g"] = 1
		E.db["unitframe"]["units"]["arena"]["castbar"]["textColor"]["r"] = 1
		E.db["unitframe"]["units"]["arena"]["castbar"]["xOffsetText"] = 2
		E.db["unitframe"]["units"]["arena"]["castbar"]["xOffsetTime"] = -2
		E.db["unitframe"]["units"]["arena"]["debuffs"]["anchorPoint"] = "TOPLEFT"
		E.db["unitframe"]["units"]["arena"]["debuffs"]["countFontSize"] = 10
		E.db["unitframe"]["units"]["arena"]["debuffs"]["countXOffset"] = 1
		E.db["unitframe"]["units"]["arena"]["debuffs"]["desaturate"] = true
		E.db["unitframe"]["units"]["arena"]["debuffs"]["growthX"] = "LEFT"
		E.db["unitframe"]["units"]["arena"]["debuffs"]["growthY"] = "DOWN"
		E.db["unitframe"]["units"]["arena"]["debuffs"]["numrows"] = 2
		E.db["unitframe"]["units"]["arena"]["debuffs"]["priority"] = "Blacklist,Personal,CCDebuffs"
		E.db["unitframe"]["units"]["arena"]["debuffs"]["sizeOverride"] = 22
		E.db["unitframe"]["units"]["arena"]["debuffs"]["spacing"] = 0
		E.db["unitframe"]["units"]["arena"]["debuffs"]["xOffset"] = -69
		E.db["unitframe"]["units"]["arena"]["debuffs"]["yOffset"] = -21

		-- Boss updates
		E.db["unitframe"]["units"]["boss"]["buffs"]["anchorPoint"] = "TOPRIGHT"
		E.db["unitframe"]["units"]["boss"]["buffs"]["countFontSize"] = 10
		E.db["unitframe"]["units"]["boss"]["buffs"]["countXOffset"] = 1
		E.db["unitframe"]["units"]["boss"]["buffs"]["xOffset"] = 23
		E.db["unitframe"]["units"]["boss"]["buffs"]["yOffset"] = -46
		E.db["unitframe"]["units"]["boss"]["castbar"]["customTextFont"]["enable"] = true
		E.db["unitframe"]["units"]["boss"]["castbar"]["customTextFont"]["font"] = "Expressway"
		E.db["unitframe"]["units"]["boss"]["castbar"]["customTextFont"]["fontSize"] = 11
		E.db["unitframe"]["units"]["boss"]["castbar"]["customTimeFont"]["enable"] = true
		E.db["unitframe"]["units"]["boss"]["castbar"]["customTimeFont"]["font"] = "Expressway"
		E.db["unitframe"]["units"]["boss"]["castbar"]["customTimeFont"]["fontSize"] = 11
		E.db["unitframe"]["units"]["boss"]["castbar"]["textColor"]["b"] = 1
		E.db["unitframe"]["units"]["boss"]["castbar"]["textColor"]["g"] = 1
		E.db["unitframe"]["units"]["boss"]["castbar"]["textColor"]["r"] = 1
		E.db["unitframe"]["units"]["boss"]["castbar"]["xOffsetText"] = 2
		E.db["unitframe"]["units"]["boss"]["castbar"]["xOffsetTime"] = -2
		E.db["unitframe"]["units"]["boss"]["debuffs"]["anchorPoint"] = "TOPLEFT"
		E.db["unitframe"]["units"]["boss"]["debuffs"]["countFontSize"] = 10
		E.db["unitframe"]["units"]["boss"]["debuffs"]["countXOffset"] = 1
		E.db["unitframe"]["units"]["boss"]["debuffs"]["growthX"] = "LEFT"
		E.db["unitframe"]["units"]["boss"]["debuffs"]["growthY"] = "DOWN"
		E.db["unitframe"]["units"]["boss"]["debuffs"]["xOffset"] = -23
		E.db["unitframe"]["units"]["boss"]["debuffs"]["yOffset"] = -21

		-- Focus updates
		E.db["unitframe"]["units"]["focus"]["buffs"]["countFontSize"] = 13
		E.db["unitframe"]["units"]["focus"]["buffs"]["countPosition"] = "TOP"
		E.db["unitframe"]["units"]["focus"]["buffs"]["countYOffset"] = 14
		E.db["unitframe"]["units"]["focus"]["buffs"]["growthX"] = "LEFT"
		E.db["unitframe"]["units"]["focus"]["castbar"]["customTextFont"]["enable"] = true
		E.db["unitframe"]["units"]["focus"]["castbar"]["customTextFont"]["font"] = "Expressway"
		E.db["unitframe"]["units"]["focus"]["castbar"]["customTextFont"]["fontSize"] = 11
		E.db["unitframe"]["units"]["focus"]["castbar"]["customTimeFont"]["enable"] = true
		E.db["unitframe"]["units"]["focus"]["castbar"]["customTimeFont"]["font"] = "Expressway"
		E.db["unitframe"]["units"]["focus"]["castbar"]["customTimeFont"]["fontSize"] = 11
		E.db["unitframe"]["units"]["focus"]["castbar"]["textColor"]["b"] = 1
		E.db["unitframe"]["units"]["focus"]["castbar"]["textColor"]["g"] = 1
		E.db["unitframe"]["units"]["focus"]["castbar"]["textColor"]["r"] = 1
		E.db["unitframe"]["units"]["focus"]["castbar"]["timeToHold"] = 2
		E.db["unitframe"]["units"]["focus"]["castbar"]["xOffsetText"] = 2
		E.db["unitframe"]["units"]["focus"]["castbar"]["xOffsetTime"] = -2
		E.db["unitframe"]["units"]["focus"]["debuffs"]["countFontSize"] = 13
		E.db["unitframe"]["units"]["focus"]["debuffs"]["countPosition"] = "TOP"
		E.db["unitframe"]["units"]["focus"]["debuffs"]["countYOffset"] = 14
		E.db["unitframe"]["units"]["focus"]["debuffs"]["growthX"] = "RIGHT"

		-- Party updates
		E.db["unitframe"]["units"]["party"]["debuffs"]["countFontSize"] = 13
		E.db["unitframe"]["units"]["party"]["debuffs"]["countXOffset"] = 1
		E.db["unitframe"]["units"]["party"]["debuffs"]["perrow"] = 2
		E.db["unitframe"]["units"]["party"]["debuffs"]["yOffset"] = -1
		E.db["unitframe"]["units"]["party"]["verticalSpacing"] = 2

		-- Player updates
		E.db["unitframe"]["units"]["player"]["castbar"]["customTextFont"]["enable"] = true
		E.db["unitframe"]["units"]["player"]["castbar"]["customTextFont"]["font"] = "Expressway"
		E.db["unitframe"]["units"]["player"]["castbar"]["customTextFont"]["fontSize"] = 11
		E.db["unitframe"]["units"]["player"]["castbar"]["customTimeFont"]["enable"] = true
		E.db["unitframe"]["units"]["player"]["castbar"]["customTimeFont"]["font"] = "Expressway"
		E.db["unitframe"]["units"]["player"]["castbar"]["customTimeFont"]["fontSize"] = 11
		E.db["unitframe"]["units"]["player"]["castbar"]["latency"] = false
		E.db["unitframe"]["units"]["player"]["castbar"]["textColor"]["b"] = 1
		E.db["unitframe"]["units"]["player"]["castbar"]["textColor"]["g"] = 1
		E.db["unitframe"]["units"]["player"]["castbar"]["textColor"]["r"] = 1
		E.db["unitframe"]["units"]["player"]["castbar"]["timeToHold"] = 2
		E.db["unitframe"]["units"]["player"]["castbar"]["xOffsetText"] = 2
		E.db["unitframe"]["units"]["player"]["castbar"]["xOffsetTime"] = -2
		E.db["unitframe"]["units"]["player"]["debuffs"]["countFontSize"] = 13
		E.db["unitframe"]["units"]["player"]["debuffs"]["countPosition"] = "TOP"
		E.db["unitframe"]["units"]["player"]["debuffs"]["countYOffset"] = 14
		E.db["unitframe"]["units"]["player"]["debuffs"]["growthX"] = "LEFT"

		-- Target updates
		E.db["unitframe"]["units"]["target"]["buffs"]["countFontSize"] = 13
		E.db["unitframe"]["units"]["target"]["buffs"]["countPosition"] = "TOP"
		E.db["unitframe"]["units"]["target"]["buffs"]["countYOffset"] = 14
		E.db["unitframe"]["units"]["target"]["castbar"]["customTextFont"]["enable"] = true
		E.db["unitframe"]["units"]["target"]["castbar"]["customTextFont"]["font"] = "Expressway"
		E.db["unitframe"]["units"]["target"]["castbar"]["customTextFont"]["fontSize"] = 11
		E.db["unitframe"]["units"]["target"]["castbar"]["customTimeFont"]["enable"] = true
		E.db["unitframe"]["units"]["target"]["castbar"]["customTimeFont"]["font"] = "Expressway"
		E.db["unitframe"]["units"]["target"]["castbar"]["customTimeFont"]["fontSize"] = 11
		E.db["unitframe"]["units"]["target"]["castbar"]["textColor"]["b"] = 1
		E.db["unitframe"]["units"]["target"]["castbar"]["textColor"]["g"] = 1
		E.db["unitframe"]["units"]["target"]["castbar"]["textColor"]["r"] = 1
		E.db["unitframe"]["units"]["target"]["castbar"]["timeToHold"] = 2
		E.db["unitframe"]["units"]["target"]["castbar"]["xOffsetText"] = 2
		E.db["unitframe"]["units"]["target"]["castbar"]["xOffsetTime"] = -2
		E.db["unitframe"]["units"]["target"]["debuffs"]["countFontSize"] = 13
		E.db["unitframe"]["units"]["target"]["debuffs"]["countPosition"] = "TOP"
		E.db["unitframe"]["units"]["target"]["debuffs"]["countYOffset"] = 14
		E.db["unitframe"]["units"]["target"]["debuffs"]["growthX"] = "RIGHT"

		if layout == 'dps' then
			-- DPS/TANK db changes
		elseif layout == 'healer' then
			-- Healing db changes
		end

		E:StaggeredUpdateAll(nil, true)
	end

elseif L1UI.TBC then

	function L1UI:UpdateLayout(layout)

		-- Protect some rare nil errors
		if not E.db.movers then E.db.movers = {} end

		if layout == 'dps' then
			-- DPS/TANK db changes
		elseif layout == 'healer' then
			-- Healing db changes
		end

		E:StaggeredUpdateAll(nil, true)
	end

elseif L1UI.Classic then

	function L1UI:UpdateLayout(layout)

		-- Protect some rare nil errors
		if not E.db.movers then E.db.movers = {} end

		if layout == 'dps' then
			-- DPS/TANK db changes
		elseif layout == 'healer' then
			-- Healing db changes
		end

		E:StaggeredUpdateAll(nil, true)
	end

end
