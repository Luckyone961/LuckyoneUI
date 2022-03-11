local L1UI, E, L, V, P, G = unpack(select(2, ...))

-- Update Layout Buttons (Ingame Config)
function L1UI:UpdateLayout(layout)

	if layout == 'dps' then
		-- DPS/Tank db
	elseif layout == 'healer' then
		-- Healing db
	end

	-- Disable alternative power on party, raid, raid40
	E.db["unitframe"]["units"]["party"]["classbar"]["enable"] = false
	E.db["unitframe"]["units"]["raid"]["classbar"]["enable"] = false
	E.db["unitframe"]["units"]["raid40"]["classbar"]["enable"] = false

	-- NamePlate changes
	if E.private.nameplates.enable then
		E.db["nameplates"]["lowHealthThreshold"] = 0
		L1UI:SetupStyleFilters()
	end

	E:StaggeredUpdateAll()

	L1UI:Print(L["Successfully updated your current layout to LuckyoneUI version "]..L1UI.Version)
end
