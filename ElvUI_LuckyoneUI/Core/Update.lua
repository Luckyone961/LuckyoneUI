local Name, Private = ...
local E, L, V, P, G = unpack(ElvUI)

-- Ingame config buttons 'Update Main' & 'Update Healing'
function L1UI:UpdateLayout(layout)
	-- Bump install version
	E.global.L1UI.install_version = Private.Version

	-- UnitFrames updates
	E.db.unitframe.units.raid1.roleIcon.enable = true
	E.db.unitframe.units.raid2.roleIcon.enable = true
	E.db.unitframe.units.raid3.roleIcon.enable = true

	Private:Print(L["Successfully updated your current layout to LuckyoneUI version "] .. Private.Version)
end
