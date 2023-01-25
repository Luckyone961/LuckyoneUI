local L1UI, E, L, V, P, G = unpack(select(2, ...))

-- Ingame config buttons 'Update Main' & 'Update Healing'
function L1UI:UpdateLayout(layout)

	-- ActionBar db updates
	if E.Retail then
		E.db.actionbar.bar1.professionQuality.enable = false
		E.db.actionbar.bar2.professionQuality.enable = false
		E.db.actionbar.bar3.professionQuality.enable = false
		E.db.actionbar.bar4.professionQuality.enable = false
		E.db.actionbar.bar5.professionQuality.enable = false
		E.db.actionbar.bar6.professionQuality.enable = false
		E.db.actionbar.bar7.professionQuality.enable = false
		E.db.actionbar.bar8.professionQuality.enable = false
		E.db.actionbar.bar9.professionQuality.enable = false
		E.db.actionbar.bar10.professionQuality.enable = false
		E.db.actionbar.bar13.professionQuality.enable = false
		E.db.actionbar.bar14.professionQuality.enable = false
		E.db.actionbar.bar15.professionQuality.enable = false
	end

	-- Bump install version
	E.db.L1UI.install_version = L1UI.Version

	L1UI:Print(L["Successfully updated your current layout to LuckyoneUI version "]..L1UI.Version)
end
