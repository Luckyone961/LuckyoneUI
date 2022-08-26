local L1UI, E, L, V, P, G = unpack(select(2, ...))

-- Ingame config buttons 'Update Main' & 'Update Healing'
function L1UI:UpdateLayout(layout)

	-- Boss frame updates
	E.db.unitframe.units.boss.raidicon.size = 10
	E.db.unitframe.units.boss.raidicon.yOffset = -1

	-- Party frame updates
	if layout == 'main' then
		E.db.unitframe.units.party.showPlayer = false
	end

	E.db.L1UI.install_version = L1UI.Version

	L1UI:Print(L["Successfully updated your current layout to LuckyoneUI version "]..L1UI.Version)
end
