local Name, Private = ...
local E, L, V, P, G = unpack(ElvUI)

-- Ingame config buttons 'Update Main' & 'Update Healing'
function L1UI:UpdateLayout(layout)
	-- Bump install version
	E.global.L1UI.install_version = Private.Version

	-- Private aura db updates
	if E.Retail then
		E.db.general.privateAuras.icon.size = 64
		E.db.movers.PrivateAurasMover = 'BOTTOM,UIParent,BOTTOM,174,452'
		E.db.movers.PrivateRaidWarningMover = 'TOP,ElvUIParent,TOP,0,-226'
	end

	Private:Print(L["Successfully updated your current layout to LuckyoneUI version "] .. Private.Version)
end
