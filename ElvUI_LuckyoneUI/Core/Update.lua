local L1UI, E, L, V, P, G = unpack(select(2, ...))

-- Ingame config buttons 'Update Main' & 'Update Healing'
function L1UI:UpdateLayout(layout)
	-- Bump install version
	E.global.L1UI.install_version = L1UI.Version

	if E.global.L1UI.dev then
		-- Raid1 updates
		E.db.unitframe.units.raid1.health.text_format = ''
		E.db.unitframe.units.raid1.name.position = 'CENTER'
		E.db.unitframe.units.raid1.name.yOffset = 0
		E.db.unitframe.units.raid1.phaseIndicator.anchorPoint = 'TOP'
		E.db.unitframe.units.raid1.phaseIndicator.xOffset = 0
		E.db.unitframe.units.raid1.pvpclassificationindicator.enable = false
		E.db.unitframe.units.raid1.readycheckIcon.attachToObject = 'Frame'
		E.db.unitframe.units.raid1.readycheckIcon.position = 'TOP'
		E.db.unitframe.units.raid1.readycheckIcon.size = 14
		E.db.unitframe.units.raid1.readycheckIcon.xOffset = 0
		E.db.unitframe.units.raid1.resurrectIcon.attachTo = 'RIGHT'
		E.db.unitframe.units.raid1.roleIcon.position = 'LEFT'
		E.db.unitframe.units.raid1.summonIcon.attachTo = 'RIGHT'

		-- Raid2 updates
		E.db.unitframe.units.raid2.health.text_format = ''
		E.db.unitframe.units.raid2.name.position = 'CENTER'
		E.db.unitframe.units.raid2.name.yOffset = 0
		E.db.unitframe.units.raid2.phaseIndicator.anchorPoint = 'TOP'
		E.db.unitframe.units.raid2.phaseIndicator.xOffset = 0
		E.db.unitframe.units.raid2.pvpclassificationindicator.enable = false
		E.db.unitframe.units.raid2.readycheckIcon.attachToObject = 'Frame'
		E.db.unitframe.units.raid2.readycheckIcon.position = 'TOP'
		E.db.unitframe.units.raid2.readycheckIcon.size = 14
		E.db.unitframe.units.raid2.readycheckIcon.xOffset = 0
		E.db.unitframe.units.raid2.resurrectIcon.attachTo = 'RIGHT'
		E.db.unitframe.units.raid2.roleIcon.position = 'LEFT'
		E.db.unitframe.units.raid2.summonIcon.attachTo = 'RIGHT'

		-- Raid3 updates
		E.db.unitframe.units.raid3.name.attachTextTo = 'Frame'
		E.db.unitframe.units.raid3.name.position = 'CENTER'
		E.db.unitframe.units.raid3.name.yOffset = 0
		E.db.unitframe.units.raid3.phaseIndicator.anchorPoint = 'LEFT'
		E.db.unitframe.units.raid3.phaseIndicator.xOffset = 0
		E.db.unitframe.units.raid3.pvpclassificationindicator.enable = false
		E.db.unitframe.units.raid3.readycheckIcon.attachToObject = 'Frame'
		E.db.unitframe.units.raid3.readycheckIcon.position = 'RIGHT'
		E.db.unitframe.units.raid3.readycheckIcon.xOffset = 0
		E.db.unitframe.units.raid3.resurrectIcon.attachTo = 'RIGHT'
		E.db.unitframe.units.raid3.roleIcon.position = 'LEFT'
		E.db.unitframe.units.raid3.summonIcon.attachTo = 'RIGHT'
	end

	L1UI:Print(L["Successfully updated your current layout to LuckyoneUI version "] .. L1UI.Version)
end
