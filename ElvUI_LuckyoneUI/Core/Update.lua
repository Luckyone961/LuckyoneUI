local L1UI, E, L, V, P, G = unpack(select(2, ...))

-- Update Layout Buttons (Ingame Config)
function L1UI:UpdateLayout(layout)

	E.db["general"]["customGlow"]["color"]["a"] = 1
	E.db["general"]["customGlow"]["color"]["b"] = 1
	E.db["general"]["customGlow"]["color"]["g"] = 1
	E.db["general"]["customGlow"]["color"]["r"] = 1
	E.db["general"]["customGlow"]["style"] = "Autocast Shine"
	E.db["general"]["customGlow"]["useColor"] = true

	E:StaggeredUpdateAll()

	L1UI:Print(L["Successfully updated your current layout to LuckyoneUI version "]..L1UI.Version)
end
