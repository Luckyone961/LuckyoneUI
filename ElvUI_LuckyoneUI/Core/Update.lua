local L1UI, E, L, V, P, G = unpack(select(2, ...))

-- Ingame config buttons 'Update Main' & 'Update Healing'
function L1UI:UpdateLayout(layout)

	if layout == 'healing' then
		-- Healing Party Pets [nonRetail only]
		E.db.unitframe.units.party.petsGroup.anchorPoint = 'BOTTOM'
		E.db.unitframe.units.party.petsGroup.enable = not E.Retail
		E.db.unitframe.units.party.petsGroup.healPrediction.enable = true
		E.db.unitframe.units.party.petsGroup.threatStyle = 'NONE'
		E.db.unitframe.units.party.petsGroup.width = 94
		E.db.unitframe.units.party.petsGroup.xOffset = 0
		E.db.unitframe.units.party.petsGroup.yOffset = -1
	end

	-- Bump install version
	E.db.L1UI.install_version = L1UI.Version

	L1UI:Print(L["Successfully updated your current layout to LuckyoneUI version "]..L1UI.Version)
end
