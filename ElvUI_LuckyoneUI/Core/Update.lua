local L1UI, E, L, V, P, G = unpack(select(2, ...))

-- Ingame config buttons 'Update Main' & 'Update Healing'
function L1UI:UpdateLayout(layout)

	-- Movers updates
	E.db.movers = E.db.movers or {}
	E.db.movers.TopCenterContainerMover = 'TOP,ElvUIParent,TOP,0,-39'

	-- DataText updates
	local ActionBarsDT = E.global.datatexts.customPanels.Luckyone_ActionBars_DT
	if ActionBarsDT then
		ActionBarsDT.panelTransparency = true
	end

	E.db.L1UI.install_version = L1UI.Version

	L1UI:Print(L["Successfully updated your current layout to LuckyoneUI version "]..L1UI.Version)
end
