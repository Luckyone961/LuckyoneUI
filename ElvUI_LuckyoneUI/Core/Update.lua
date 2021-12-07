local L1UI, E, L, V, P, G = unpack(select(2, ...))

-- Update Layout Buttons (Ingame Config)
function L1UI:UpdateLayout(layout)

	-- Pet debuff changes
	if not E.Retail then
		E.db["unitframe"]["units"]["pet"]["debuffs"]["anchorPoint"] = "TOPLEFT"
		E.db["unitframe"]["units"]["pet"]["debuffs"]["countFont"] = "Expressway"
		E.db["unitframe"]["units"]["pet"]["debuffs"]["enable"] = true
		E.db["unitframe"]["units"]["pet"]["debuffs"]["growthX"] = "RIGHT"
		E.db["unitframe"]["units"]["pet"]["debuffs"]["maxDuration"] = 0
		E.db["unitframe"]["units"]["pet"]["debuffs"]["numrows"] = 2
		E.db["unitframe"]["units"]["pet"]["debuffs"]["perrow"] = 4
		E.db["unitframe"]["units"]["pet"]["debuffs"]["priority"] = "Blacklist,Personal,nonPersonal"
		E.db["unitframe"]["units"]["pet"]["debuffs"]["sizeOverride"] = 20
		E.db["unitframe"]["units"]["pet"]["debuffs"]["spacing"] = 0
	end

	-- NamePlate changes
	E.db["nameplates"]["units"]["ENEMY_NPC"]["debuffs"]["yOffset"] = -9
	E.db["nameplates"]["units"]["ENEMY_PLAYER"]["debuffs"]["yOffset"] = -9

	-- LootRoll changes
	E.db["general"]["lootRoll"]["height"] = 34
	E.db["general"]["lootRoll"]["statusBarTexture"] = "Minimalist"
	E.db["general"]["lootRoll"]["style"] = "fullbar"
	E.db["general"]["lootRoll"]["width"] = 340

	if layout == 'dps' then

		-- DPS/TANK db changes

	elseif layout == 'healer' then

		-- Healing db changes

	end

	E:StaggeredUpdateAll()
end
