local L1UI, E, L, V, P, G = unpack(select(2, ...))

-- Update Layout Buttons (Ingame Config)
function L1UI:UpdateLayout(layout)

	E.db["general"]["durabilityScale"] = 1

	E.db["general"]["fontStyle"] = "OUTLINE"

	if layout == 'dps' then

		-- DPS/TANK db changes

	elseif layout == 'healer' then

		-- Healing db changes
		E.db["unitframe"]["units"]["target"]["raidRoleIcons"]["yOffset"] = 1

	end

	E:StaggeredUpdateAll()
end
