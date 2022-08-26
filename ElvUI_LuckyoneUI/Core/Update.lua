local L1UI, E, L, V, P, G = unpack(select(2, ...))

-- Ingame config buttons 'Update Main' & 'Update Healing'
function L1UI:UpdateLayout(layout)

	-- Boss frame updates
	E.db.unitframe.units.boss.raidicon.size = 10
	E.db.unitframe.units.boss.raidicon.yOffset = -1

	-- Party frame updates
	if layout == 'main' then
		E.db.unitframe.units.party.showPlayer = false
	end

	-- Custom Minimap DataText
	local MiniMapDT = E.global.datatexts.customPanels.Luckyone_MiniMap_DT
	if MiniMapDT then
		MiniMapDT.tooltipXOffset = -30
		MiniMapDT.tooltipYOffset = -6
		MiniMapDT.width = 60
		E.db.movers.DTPanelLuckyone_MiniMap_DTMover = 'TOPRIGHT,ElvUIParent,TOPRIGHT,-46,-141'
	end

	E.db.L1UI.install_version = L1UI.Version

	L1UI:Print(L["Successfully updated your current layout to LuckyoneUI version "]..L1UI.Version)
end
