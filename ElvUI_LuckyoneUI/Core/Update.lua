local L1UI, E, L, V, P, G = unpack(select(2, ...))

-- Update Layout Buttons (Ingame Config)
function L1UI:UpdateLayout(layout)

	if layout == 'main' then

		-- DPS/Tank db

	elseif layout == 'healing' then

		-- Custom Text: Party Healing
		E.db["unitframe"]["units"]["party"]["customTexts"]["Luckyone_Name"]["text_format"] = "[classcolor][name]"

	end

	-- New tooltip font options
	E.db["tooltip"]["headerFont"] = "Expressway"
	E.db["tooltip"]["headerFontOutline"] = "OUTLINE"

	E:StaggeredUpdateAll()

	L1UI:Print(L["Successfully updated your current layout to LuckyoneUI version "]..L1UI.Version)
end
