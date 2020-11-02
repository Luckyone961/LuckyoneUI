local L1UI, E, L, V, P, G = unpack(select(2, ...))

-- WIP

function L1UI:UpdateLayout(layout)

	-- General

	if layout == 'dps' then
		-- DPS/TANK db
	elseif layout == 'healer' then
		-- Healing db
	end

	E:StaggeredUpdateAll(nil, true)

	L1UI:Print('Layout has been updated.')
end
