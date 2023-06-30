local Name, Private = ...
local E, L, V, P, G = unpack(ElvUI)

-- Ingame config buttons 'Update Main' & 'Update Healing'
function L1UI:UpdateLayout(layout)
	-- Bump install version
	E.global.L1UI.install_version = Private.Version

	if E.Retail then
		E.db.general.addonCompartment.hide = true
	end

	Private:Print(L["Successfully updated your current layout to LuckyoneUI version "] .. Private.Version)
end
