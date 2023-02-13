local L1UI, E, L, V, P, G = unpack(select(2, ...))

-- Ingame config buttons 'Update Main' & 'Update Healing'
function L1UI:UpdateLayout(layout)
	-- Bump install version
	E.db.L1UI.install_version = L1UI.Version

	-- WindTools updates
	if E:IsAddOnEnabled('ElvUI_WindTools') and E.Retail then
		L1UI:Setup_WindTools(true)
	end

	L1UI:Print(L["Successfully updated your current layout to LuckyoneUI version "] .. L1UI.Version)
end
