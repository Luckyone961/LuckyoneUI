local L1UI, E, L, V, P, G = unpack(select(2, ...))

-- Ingame config buttons 'Update Main' & 'Update Healing'
function L1UI:UpdateLayout(layout)

	-- Turn off new 'module'
	E.db.cooldown.targetAura = false

	-- UnitFrames updates
	E.db.unitframe.colors.transparentHealth = true
	E.db.unitframe.units.raid1.numGroups = E.Retail and 4 or 2
	E.db.unitframe.units.raid1.visibility = E.Retail and '[@raid6,noexists][@raid21,exists] hide;show' or '[@raid6,noexists][@raid11,exists] hide;show'
	E.db.unitframe.units.raid3.visibility = E.Retail and '[@raid31,noexists] hide;show' or '[@raid26,noexists] hide;show'

	-- Match raid1 and raid2
	E:CopyTable(E.db.unitframe.units.raid2, E.db.unitframe.units.raid1)
	E.db.unitframe.units.raid2.numGroups = E.Retail and 6 or 5
	E.db.unitframe.units.raid2.visibility = E.Retail and '[@raid21,noexists][@raid31,exists] hide;show' or '[@raid11,noexists][@raid26,exists] hide;show'

	-- Party
	E.db.unitframe.units.party.CombatIcon.enable = false

	-- ElvUI NamePlate updates
	if E.private.nameplates.enable then
		E.db.nameplates.units.ENEMY_PLAYER.buffs.priority = 'Blacklist,Dispellable,RaidBuffsElvUI,TurtleBuffs'
	end

	-- Bump install version
	E.db.L1UI.install_version = L1UI.Version

	L1UI:Print(L["Successfully updated your current layout to LuckyoneUI version "]..L1UI.Version)
end
