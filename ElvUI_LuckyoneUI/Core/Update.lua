local L1UI, E, L, V, P, G = unpack(select(2, ...))

-- Ingame config buttons 'Update Main' & 'Update Healing'
function L1UI:UpdateLayout(layout)

	-- ActionBar updates
	E.db.actionbar.bar13.buttonSize = 26
	E.db.actionbar.bar13.buttonSpacing = 1
	E.db.actionbar.bar13.countFont = L1UI.DefaultFont
	E.db.actionbar.bar13.countFontOutline = 'OUTLINE'
	E.db.actionbar.bar13.countFontSize = 9
	E.db.actionbar.bar13.countTextPosition = 'BOTTOM'
	E.db.actionbar.bar13.hotkeyFont = L1UI.DefaultFont
	E.db.actionbar.bar13.hotkeyFontOutline = 'OUTLINE'
	E.db.actionbar.bar13.hotkeyFontSize = 9
	E.db.actionbar.bar13.hotkeyTextPosition = 'TOPLEFT'
	E.db.actionbar.bar13.hotkeyTextYOffset = -1
	E.db.actionbar.bar13.macroFont = L1UI.DefaultFont
	E.db.actionbar.bar13.macroFontOutline = 'OUTLINE'
	E.db.actionbar.bar13.macroFontSize = 9
	E.db.actionbar.bar13.macroTextPosition = 'BOTTOM'
	E.db.actionbar.bar13.macroTextYOffset = 1
	E.db.actionbar.bar13.macrotext = true
	E.db.actionbar.bar14.buttonSize = 26
	E.db.actionbar.bar14.buttonSpacing = 1
	E.db.actionbar.bar14.countFont = L1UI.DefaultFont
	E.db.actionbar.bar14.countFontOutline = 'OUTLINE'
	E.db.actionbar.bar14.countFontSize = 9
	E.db.actionbar.bar14.countTextPosition = 'BOTTOM'
	E.db.actionbar.bar14.hotkeyFont = L1UI.DefaultFont
	E.db.actionbar.bar14.hotkeyFontOutline = 'OUTLINE'
	E.db.actionbar.bar14.hotkeyFontSize = 9
	E.db.actionbar.bar14.hotkeyTextPosition = 'TOPLEFT'
	E.db.actionbar.bar14.hotkeyTextYOffset = -1
	E.db.actionbar.bar14.macroFont = L1UI.DefaultFont
	E.db.actionbar.bar14.macroFontOutline = 'OUTLINE'
	E.db.actionbar.bar14.macroFontSize = 9
	E.db.actionbar.bar14.macroTextPosition = 'BOTTOM'
	E.db.actionbar.bar14.macroTextYOffset = 1
	E.db.actionbar.bar14.macrotext = true
	E.db.actionbar.bar15.buttonSize = 26
	E.db.actionbar.bar15.buttonSpacing = 1
	E.db.actionbar.bar15.countFont = L1UI.DefaultFont
	E.db.actionbar.bar15.countFontOutline = 'OUTLINE'
	E.db.actionbar.bar15.countFontSize = 9
	E.db.actionbar.bar15.countTextPosition = 'BOTTOM'
	E.db.actionbar.bar15.hotkeyFont = L1UI.DefaultFont
	E.db.actionbar.bar15.hotkeyFontOutline = 'OUTLINE'
	E.db.actionbar.bar15.hotkeyFontSize = 9
	E.db.actionbar.bar15.hotkeyTextPosition = 'TOPLEFT'
	E.db.actionbar.bar15.hotkeyTextYOffset = -1
	E.db.actionbar.bar15.macroFont = L1UI.DefaultFont
	E.db.actionbar.bar15.macroFontOutline = 'OUTLINE'
	E.db.actionbar.bar15.macroFontSize = 9
	E.db.actionbar.bar15.macroTextPosition = 'BOTTOM'
	E.db.actionbar.bar15.macroTextYOffset = 1
	E.db.actionbar.bar15.macrotext = true

	-- Bump install version
	E.db.L1UI.install_version = L1UI.Version

	L1UI:Print(L["Successfully updated your current layout to LuckyoneUI version "]..L1UI.Version)
end
