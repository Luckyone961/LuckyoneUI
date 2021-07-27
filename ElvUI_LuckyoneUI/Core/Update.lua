local L1UI, E, L, V, P, G = unpack(select(2, ...))

-- Update Layout Buttons (Ingame Config)
if L1UI.Retail then

	function L1UI:UpdateLayout(layout)

		-- Protect some rare nil errors
		if not E.db.movers then E.db.movers = {} end

		-- Tooltip
		E.db["tooltip"]["dungeonScore"] = false
		E.db["tooltip"]["dungeonScoreColor"] = false
		E.db["tooltip"]["mythicDataEnable"] = false

		-- Arena Rework
		E.db["unitframe"]["units"]["arena"]["buffs"]["countFontSize"] = 10
		E.db["unitframe"]["units"]["arena"]["buffs"]["countXOffset"] = 1
		E.db["unitframe"]["units"]["arena"]["buffs"]["numrows"] = 2
		E.db["unitframe"]["units"]["arena"]["buffs"]["priority"] = "Blacklist,Dispellable,RaidBuffsElvUI"
		E.db["unitframe"]["units"]["arena"]["buffs"]["sizeOverride"] = 22
		E.db["unitframe"]["units"]["arena"]["buffs"]["yOffset"] = 11
		E.db["unitframe"]["units"]["arena"]["castbar"]["width"] = 240
		E.db["unitframe"]["units"]["arena"]["debuffs"]["countFontSize"] = 10
		E.db["unitframe"]["units"]["arena"]["debuffs"]["countXOffset"] = 1
		E.db["unitframe"]["units"]["arena"]["debuffs"]["desaturate"] = true
		E.db["unitframe"]["units"]["arena"]["debuffs"]["numrows"] = 2
		E.db["unitframe"]["units"]["arena"]["debuffs"]["priority"] = "Blacklist,Personal,CCDebuffs"
		E.db["unitframe"]["units"]["arena"]["debuffs"]["sizeOverride"] = 22
		E.db["unitframe"]["units"]["arena"]["debuffs"]["spacing"] = 0
		E.db["unitframe"]["units"]["arena"]["debuffs"]["yOffset"] = 11
		E.db["unitframe"]["units"]["arena"]["disableTargetGlow"] = true
		E.db["unitframe"]["units"]["arena"]["infoPanel"]["height"] = 16

		-- Boss updates
		E.db["unitframe"]["units"]["boss"]["buffs"]["countFontSize"] = 10
		E.db["unitframe"]["units"]["boss"]["buffs"]["countXOffset"] = 1
		E.db["unitframe"]["units"]["boss"]["debuffs"]["countFontSize"] = 10
		E.db["unitframe"]["units"]["boss"]["debuffs"]["countXOffset"] = 1

		-- Focus updates
		E.db["unitframe"]["units"]["focus"]["buffs"]["countFontSize"] = 13
		E.db["unitframe"]["units"]["focus"]["buffs"]["countPosition"] = "TOP"
		E.db["unitframe"]["units"]["focus"]["buffs"]["countYOffset"] = 14
		E.db["unitframe"]["units"]["focus"]["buffs"]["priority"] = "Blacklist,Dispellable,RaidBuffsElvUI"
		E.db["unitframe"]["units"]["focus"]["debuffs"]["countFontSize"] = 13
		E.db["unitframe"]["units"]["focus"]["debuffs"]["countPosition"] = "TOP"
		E.db["unitframe"]["units"]["focus"]["debuffs"]["countYOffset"] = 14

		-- Party updates
		E.db["unitframe"]["units"]["party"]["debuffs"]["countFontSize"] = 13
		E.db["unitframe"]["units"]["party"]["debuffs"]["countXOffset"] = 1

		-- Player updates
		E.db["unitframe"]["units"]["player"]["debuffs"]["countFontSize"] = 13
		E.db["unitframe"]["units"]["player"]["debuffs"]["countPosition"] = "TOP"
		E.db["unitframe"]["units"]["player"]["debuffs"]["countYOffset"] = 14
		E.db["unitframe"]["units"]["player"]["raidRoleIcons"]["yOffset"] = 1

		-- Raid updates
		E.db["unitframe"]["units"]["raid"]["readycheckIcon"]["xOffset"] = 1

		-- Target updates
		E.db["unitframe"]["units"]["target"]["buffs"]["countFontSize"] = 13
		E.db["unitframe"]["units"]["target"]["buffs"]["countPosition"] = "TOP"
		E.db["unitframe"]["units"]["target"]["buffs"]["countYOffset"] = 14
		E.db["unitframe"]["units"]["target"]["debuffs"]["countFontSize"] = 13
		E.db["unitframe"]["units"]["target"]["debuffs"]["countPosition"] = "TOP"
		E.db["unitframe"]["units"]["target"]["debuffs"]["countYOffset"] = 14

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
