local L1UI, E, L, V, P, G = unpack(select(2, ...))

-- Update Layout Buttons (Ingame Config)
function L1UI:UpdateLayout(layout)

	if layout == 'dps' then
		-- DPS/Tank db
	elseif layout == 'healer' then
		-- Healing db
	end

	E:StaggeredUpdateAll()

	--L1UI:Print(L["Successfully updated your current layout to LuckyoneUI version "]..L1UI.Version)
	L1UI:Print('If you want updated ElvUI NamePlates or Plater for Shadowlands Season 3, please re-apply the NamePlate profile in ElvUI - LuckyoneUI - Profiles - NamePlates')
end
