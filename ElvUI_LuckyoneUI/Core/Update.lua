local L1UI, E, L, V, P, G = unpack(select(2, ...))

-- Ingame config buttons 'Update Main' & 'Update Healing'
function L1UI:UpdateLayout(layout)

	-- Bump install version
	E.db.L1UI.install_version = L1UI.Version

	L1UI:Print(L["Successfully updated your current layout to LuckyoneUI version "]..L1UI.Version)

	-- ToDo: Remove me before 2.19
	L1UI:Print('If you are looking for the new NamePlates style please re-apply the profile:')
	L1UI:Print('For ElvUI NamePlates: in /luckyoneui config -> Profiles tab')
	L1UI:Print('For Plater: Re-import from https://wago.io/LuckyoneUI-Plater')
end
