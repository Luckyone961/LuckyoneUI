local L1UI, E, L, V, P, G = unpack(select(2, ...))

function L1UI:UpdateLayout(layout)

	if layout == 'dps' then
		-- DPS/TANK db
		E.db["unitframe"]["units"]["targettarget"]["debuffs"]["maxDuration"] = 0
		E.db["unitframe"]["units"]["focustarget"]["debuffs"]["maxDuration"] = 0
	elseif layout == 'healer' then
		-- Healing db
	end

	E:StaggeredUpdateAll(nil, true)

	L1UI:Print('Layout has been updated.')
end
