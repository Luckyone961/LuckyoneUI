local L1UI, E, L, V, P, G = unpack(select(2, ...))

-- Update Layout Buttons (Ingame Config)
function L1UI:UpdateLayout(layout)

	-- Classic and TBC only
	if not E.Retail then
		-- Level color changes
		E.db["unitframe"]["units"]["focus"]["customTexts"]["Luckyone_Level"]["text_format"] = E.Retail and "[classcolor][level]" or "[difficultycolor][level][classificationcolor][ >shortclassification]"
		E.db["unitframe"]["units"]["target"]["customTexts"]["Luckyone_Level"]["text_format"] = E.Retail and "[classcolor][level]" or "[difficultycolor][level][classificationcolor][ >shortclassification]"

		-- Pet debuff changes
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

	-- LootRoll changes
	E.db["general"]["lootRoll"]["height"] = 34
	E.db["general"]["lootRoll"]["statusBarTexture"] = "Minimalist"
	E.db["general"]["lootRoll"]["style"] = "fullbar"
	E.db["general"]["lootRoll"]["width"] = 340

	-- NamePlate changes
	if E.private.nameplates.enable then
		E.db["nameplates"]["units"]["ENEMY_NPC"]["debuffs"]["yOffset"] = -9
		E.db["nameplates"]["units"]["ENEMY_PLAYER"]["debuffs"]["yOffset"] = -9
	end

	E:StaggeredUpdateAll()
end
