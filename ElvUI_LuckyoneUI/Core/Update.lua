local L1UI, E, L, V, P, G = unpack(select(2, ...))

-- WIP

function L1UI:UpdateLayout(layout)

	-- General
	E.db["nameplates"]["units"]["ENEMY_NPC"]["name"]["format"] = "[name:last][classificationcolor][ >luckyone:classification]"
	E.db["nameplates"]["units"]["FRIENDLY_NPC"]["level"]["format"] = "[level]"
	E.db["nameplates"]["units"]["FRIENDLY_PLAYER"]["level"]["format"] = "[level]"

	if layout == 'dps' then
		-- DPS/TANK db
	elseif layout == 'healer' then
		-- Healing db
	end

	E:StaggeredUpdateAll(nil, true)

	L1UI:Print('Layout has been updated.')
end
