local L1UI, E, L, V, P, G = unpack(select(2, ...))

local ReloadUI = ReloadUI

function L1UI:UpdateLayout(layout)

	if not E.db.movers then E.db.movers = {} end

	if layout == 'dps' then

	elseif layout == 'healer' then

	end

	E:StaggeredUpdateAll(nil, true)

	L1UI:Print('Layout has been updated. A /reload is suggested.')

	ReloadUI()
end
