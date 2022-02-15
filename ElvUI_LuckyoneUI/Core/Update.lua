local L1UI, E, L, V, P, G = unpack(select(2, ...))

-- Update Layout Buttons (Ingame Config)
function L1UI:UpdateLayout(layout)

	if layout == 'dps' then
		-- DPS/Tank db
	elseif layout == 'healer' then
		-- Healing db
	end

	-- Tooltip db changes
	if E.Retail then
		E.db["tooltip"]["inspectDataEnable"] = false
		E.db["tooltip"]["role"] = false
	end

	E:StaggeredUpdateAll()

	L1UI:Print(L["Successfully updated your current layout to LuckyoneUI version "]..L1UI.Version)
end
