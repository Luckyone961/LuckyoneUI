local L1UI, E, L, V, P, G = unpack(select(2, ...))

-- Option to choose between Dark (Default) and Class color
function L1UI:SetupTheme(theme)

	if theme == 'dark' then

		E.db["unitframe"]["colors"]["classbackdrop"] = true
		E.db["unitframe"]["colors"]["health"]["b"] = 0.058823529411765
		E.db["unitframe"]["colors"]["health"]["g"] = 0.058823529411765
		E.db["unitframe"]["colors"]["health"]["r"] = 0.058823529411765
		E.db["unitframe"]["colors"]["healthclass"] = false
		E.db["unitframe"]["colors"]["healthMultiplier"] = 0.75
		E.db["unitframe"]["colors"]["transparentAurabars"] = true
		E.db["unitframe"]["colors"]["transparentHealth"] = true
		E.db["unitframe"]["colors"]["transparentPower"] = true
		E.db["unitframe"]["colors"]["useDeadBackdrop"] = true
		E.db["unitframe"]["statusbar"] = "Solid"

	elseif theme == 'class' then

		E.db["unitframe"]["colors"]["classbackdrop"] = false
		E.db["unitframe"]["colors"]["customhealthbackdrop"] = true
		E.db["unitframe"]["colors"]["health_backdrop"]["b"] = 0.10196078431373
		E.db["unitframe"]["colors"]["health_backdrop"]["g"] = 0.10196078431373
		E.db["unitframe"]["colors"]["health_backdrop"]["r"] = 0.10196078431373
		E.db["unitframe"]["colors"]["healthclass"] = true
		E.db["unitframe"]["colors"]["healthMultiplier"] = 0
		E.db["unitframe"]["colors"]["transparentAurabars"] = true
		E.db["unitframe"]["colors"]["transparentHealth"] = true
		E.db["unitframe"]["colors"]["transparentPower"] = true
		E.db["unitframe"]["colors"]["useDeadBackdrop"] = true
		E.db["unitframe"]["statusbar"] = "Solid"

	end

	E:StaggeredUpdateAll(nil, true)

	L1UI:Print('Theme has been set.')
end
