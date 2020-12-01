local L1UI, E, L, V, P, G = unpack(select(2, ...))

function L1UI:UpdateLayout(layout)

	if not E.db.movers then
		E.db.movers = {}
	end

	--General db
	E.db["general"]["backdropfadecolor"]["a"] = 0.75

	E.db["movers"]["TopCenterContainerMover"] = "TOP,ElvUIParent,TOP,0,-37"
	E.db["movers"]["BelowMinimapContainerMover"] = "TOP,ElvUIParent,TOP,0,-57"

	if layout == 'dps' then
		-- DPS/TANK db
		E.db["unitframe"]["units"]["player"]["partyIndicator"]["enable"] = false
	elseif layout == 'healer' then
		-- Healing db
		E.db["unitframe"]["units"]["player"]["partyIndicator"]["enable"] = false
	end

	E:StaggeredUpdateAll(nil, true)

	L1UI:Print('Layout has been updated.')
end
