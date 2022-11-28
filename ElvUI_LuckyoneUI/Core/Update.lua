local L1UI, E, L, V, P, G = unpack(select(2, ...))

-- Ingame config buttons 'Update Main' & 'Update Healing'
function L1UI:UpdateLayout(layout)

	if E.Retail then -- Bag
		E.db.bags.specialtyColors = false
		E.db.bags.split.bag5 = true
		E.db.bags.split.bagSpacing = 1
		E.db.bags.split.player = true
	end

	if layout == 'main' then -- Dragonriding Power
		E.db.movers.PowerBarContainerMover = 'BOTTOM,UIParent,BOTTOM,0,163'
	end

	-- Bump install version
	E.db.L1UI.install_version = L1UI.Version

	L1UI:Print(L["Successfully updated your current layout to LuckyoneUI version "]..L1UI.Version)
end
