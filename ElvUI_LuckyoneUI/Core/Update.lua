local L1UI, E, L, V, P, G = unpack(select(2, ...))

-- Ingame config buttons 'Update Main' & 'Update Healing'
function L1UI:UpdateLayout(layout)

	-- ActionBar db updates
	E.db.actionbar.microbar.useIcons = false

	-- Auras db updates
	E.db.auras.cooldown.checkSeconds = true
	E.db.auras.cooldown.hhmmThreshold = 120

	-- Cooldown Text db updates
	E.db.cooldown.hhmmColor.b = 1
	E.db.cooldown.hhmmColor.g = 1
	E.db.cooldown.hhmmColor.r = 0.4
	E.db.cooldown.mmssColor.b = 1
	E.db.cooldown.mmssColor.g = 1
	E.db.cooldown.mmssColor.r = 1

	-- NamePlate db updates
	if E.private.nameplates.enable then
		E.db.nameplates.units.ENEMY_PLAYER.buffs.priority = 'Blacklist,Dispellable,TurtleBuffs'
	end

	-- Bump install version
	E.db.L1UI.install_version = L1UI.Version

	L1UI:Print(L["Successfully updated your current layout to LuckyoneUI version "]..L1UI.Version)
end
