local L1UI, E, L, V, P, G = unpack(select(2, ...))

-- Ingame config buttons "Update DPS/TANK" & "Update Healing"
function L1UI:UpdateLayout(layout)

	E.db.L1UI.install_version = L1UI.Version

	L1UI:Print(L["Successfully updated your current layout to LuckyoneUI version "]..L1UI.Version)
end
