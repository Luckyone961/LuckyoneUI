local L1UI, E, L, V, P, G = unpack(select(2, ...))

function L1UI:UpdateLayout(layout)

	-- NamePlates
	E.db["nameplates"]["units"]["ENEMY_NPC"]["name"]["format"] = "[name:last][classificationcolor][ >luckyone:classification]"
	E.db["nameplates"]["units"]["FRIENDLY_NPC"]["level"]["format"] = "[level]"
	E.db["nameplates"]["units"]["FRIENDLY_PLAYER"]["level"]["format"] = "[level]"

	-- Custom Texts
	E.db["unitframe"]["units"]["focus"]["customTexts"]["Luckyone_Level"]["text_format"] = "[namecolor][level][classificationcolor][ >luckyone:classification]"
	E.db["unitframe"]["units"]["target"]["customTexts"]["Luckyone_Level"]["text_format"] = "[namecolor][level][classificationcolor][ >luckyone:classification]"

	E.db["databars"]["experience"]["questCompletedOnly"] = true

	E.db["datatexts"]["panels"]["Luckyone_ActionBars_DT"][2] = "Combat"

	if layout == 'dps' then
		-- DPS/TANK db
	elseif layout == 'healer' then
		-- Healing db
	end

	E:StaggeredUpdateAll(nil, true)

	L1UI:Print('Layout has been updated.')
end
