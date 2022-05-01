local L1UI, E, L, V, P, G = unpack(select(2, ...))

-- Update Layout Buttons (Ingame Config)
function L1UI:UpdateLayout(layout)

	E:StaggeredUpdateAll()

	E.db["tooltip"]["headerFont"] = "Expressway"
	E.db["tooltip"]["headerFontOutline"] = "OUTLINE"
	E.db["tooltip"]["headerFontSize"] = 11

	L1UI:Print(L["Successfully updated your current layout to LuckyoneUI version "]..L1UI.Version)
end
