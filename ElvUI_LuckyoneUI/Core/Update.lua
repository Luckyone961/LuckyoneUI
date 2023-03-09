local L1UI, E, L, V, P, G = unpack(select(2, ...))

-- Ingame config buttons 'Update Main' & 'Update Healing'
function L1UI:UpdateLayout(layout)
	-- Bump install version
	E.global.L1UI.install_version = L1UI.Version

	-- UnitFrame updates
	E.db.unitframe.units.arena.fader.minAlpha = 0.5
	E.db.unitframe.units.arena.fader.smooth = 0
	E.db.unitframe.units.boss.fader.minAlpha = 0.5
	E.db.unitframe.units.boss.fader.smooth = 0
	E.db.unitframe.units.focus.fader.minAlpha = 0.5
	E.db.unitframe.units.focus.fader.smooth = 0
	E.db.unitframe.units.party.fader.minAlpha = 0.5
	E.db.unitframe.units.party.fader.smooth = 0
	E.db.unitframe.units.pet.fader.minAlpha = 0.5
	E.db.unitframe.units.pet.fader.smooth = 0
	E.db.unitframe.units.raid1.fader.minAlpha = 0.5
	E.db.unitframe.units.raid1.fader.smooth = 0
	E.db.unitframe.units.raid2.fader.minAlpha = 0.5
	E.db.unitframe.units.raid2.fader.smooth = 0
	E.db.unitframe.units.raid3.fader.minAlpha = 0.5
	E.db.unitframe.units.raid3.fader.smooth = 0
	E.db.unitframe.units.target.fader.minAlpha = 0.5
	E.db.unitframe.units.target.fader.smooth = 0
	E.db.unitframe.units.targettarget.fader.minAlpha = 0.5
	E.db.unitframe.units.targettarget.fader.smooth = 0

	L1UI:Print(L["Successfully updated your current layout to LuckyoneUI version "] .. L1UI.Version)
end
