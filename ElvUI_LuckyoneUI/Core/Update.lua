local L1UI, E, L, V, P, G = unpack(select(2, ...))

-- Ingame config buttons 'Update Main' & 'Update Healing'
function L1UI:UpdateLayout(layout)

	-- UnitFrame updates
	E.db.unitframe.units.focus.raidicon.attachTo = 'CENTER'
	E.db.unitframe.units.focus.raidicon.enable = true
	E.db.unitframe.units.focus.raidicon.yOffset = 0

	E.db.unitframe.units.target.raidicon.attachTo = 'CENTER'
	E.db.unitframe.units.target.raidicon.enable = true
	E.db.unitframe.units.target.raidicon.yOffset = 0

	-- Bump install version
	E.db.L1UI.install_version = L1UI.Version

	L1UI:Print(L["Successfully updated your current layout to LuckyoneUI version "]..L1UI.Version)
end
