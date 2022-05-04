local L1UI, E, L, V, P, G = unpack(select(2, ...))

-- UnitFrame color themes
function L1UI:SetupTheme(theme)

	if theme == 'dark' then

		E.db["unitframe"]["colors"]["classbackdrop"] = true
		E.db["unitframe"]["colors"]["customhealthbackdrop"] = false
		E.db["unitframe"]["colors"]["healthMultiplier"] = 0.75

		E.db["unitframe"]["colors"]["health"]["b"] = 0.058823529411765
		E.db["unitframe"]["colors"]["health"]["g"] = 0.058823529411765
		E.db["unitframe"]["colors"]["health"]["r"] = 0.058823529411765
		E.db["unitframe"]["colors"]["healthclass"] = false

		E.db["unitframe"]["colors"]["transparentHealth"] = true
		E.db["unitframe"]["colors"]["useDeadBackdrop"] = true

		E.db["unitframe"]["units"]["arena"]["customTexts"]["Luckyone_Name"]["text_format"] = "[classcolor][name:short]"
		E.db["unitframe"]["units"]["boss"]["customTexts"]["Luckyone_Name"]["text_format"] = "[classcolor][name:last]"
		E.db["unitframe"]["units"]["party"]["customTexts"]["Luckyone_Name"]["text_format"] = "[classcolor][name:short]"
		E.db["unitframe"]["units"]["raid"]["customTexts"]["Luckyone_Name"]["text_format"] = "[classcolor][name:short]"
		E.db["unitframe"]["units"]["raid40"]["name"]["text_format"] = "[classcolor][name:veryshort]"

	elseif theme == 'class' then

		E.db["unitframe"]["colors"]["classbackdrop"] = false
		E.db["unitframe"]["colors"]["customhealthbackdrop"] = true
		E.db["unitframe"]["colors"]["healthMultiplier"] = 0

		E.db["unitframe"]["colors"]["health_backdrop"]["b"] = 0.10196078431373
		E.db["unitframe"]["colors"]["health_backdrop"]["g"] = 0.10196078431373
		E.db["unitframe"]["colors"]["health_backdrop"]["r"] = 0.10196078431373
		E.db["unitframe"]["colors"]["healthclass"] = true

		E.db["unitframe"]["colors"]["transparentHealth"] = true
		E.db["unitframe"]["colors"]["useDeadBackdrop"] = true

		E.db["unitframe"]["units"]["arena"]["customTexts"]["Luckyone_Name"]["text_format"] = "[name:short]"
		E.db["unitframe"]["units"]["boss"]["customTexts"]["Luckyone_Name"]["text_format"] = "[name:last]"
		E.db["unitframe"]["units"]["party"]["customTexts"]["Luckyone_Name"]["text_format"] = "[name:short]"
		E.db["unitframe"]["units"]["raid"]["customTexts"]["Luckyone_Name"]["text_format"] = "[name:short]"
		E.db["unitframe"]["units"]["raid40"]["name"]["text_format"] = "[name:veryshort]"

	end

	E:StaggeredUpdateAll()

	L1UI:Print(L["Theme has been set."])
end
