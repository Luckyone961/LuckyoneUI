local L1UI, E, L, V, P, G = unpack(select(2, ...))

-- Update Layout Buttons (Ingame Config)
function L1UI:UpdateLayout(layout)

	if layout == 'dps' then
		-- DPS/Tank db
	elseif layout == 'healer' then
		-- Healing db
	end

	-- Home latency instead of World
	E.global.datatexts.settings.System.latency = "HOME"

	E:StaggeredUpdateAll()

	L1UI:Print(L["Successfully updated your current layout to LuckyoneUI version "]..L1UI.Version)
end
