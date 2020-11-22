local L1UI, E, L, V, P, G = unpack(select(2, ...))

function L1UI:UpdateLayout(layout)

	--General db
	E.db["auras"]["buffs"]["countFont"] = "Expressway"
	E.db["auras"]["buffs"]["countFontOutline"] = "OUTLINE"
	E.db["auras"]["buffs"]["countFontSize"] = 14
	E.db["auras"]["buffs"]["horizontalSpacing"] = 2
	E.db["auras"]["buffs"]["size"] = 26
	E.db["auras"]["buffs"]["timeFont"] = "Expressway"
	E.db["auras"]["buffs"]["timeFontOutline"] = "OUTLINE"
	E.db["auras"]["buffs"]["timeFontSize"] = 12
	E.db["auras"]["cooldown"]["daysIndicator"]["g"] = 0.4
	E.db["auras"]["cooldown"]["daysIndicator"]["r"] = 0.4
	E.db["auras"]["cooldown"]["expireIndicator"]["b"] = 0
	E.db["auras"]["cooldown"]["expireIndicator"]["g"] = 0
	E.db["auras"]["cooldown"]["hoursIndicator"]["r"] = 0.4
	E.db["auras"]["debuffs"]["countFont"] = "Expressway"
	E.db["auras"]["debuffs"]["countFontOutline"] = "OUTLINE"
	E.db["auras"]["debuffs"]["countFontSize"] = 14
	E.db["auras"]["debuffs"]["horizontalSpacing"] = 2
	E.db["auras"]["debuffs"]["maxWraps"] = 2
	E.db["auras"]["debuffs"]["size"] = 26
	E.db["auras"]["debuffs"]["timeFont"] = "Expressway"
	E.db["auras"]["debuffs"]["timeFontOutline"] = "OUTLINE"
	E.db["auras"]["debuffs"]["timeFontSize"] = 12

	if layout == 'dps' then
		-- DPS/TANK db
		E.db["unitframe"]["units"]["targettarget"]["debuffs"]["maxDuration"] = 0
		E.db["unitframe"]["units"]["focustarget"]["debuffs"]["maxDuration"] = 0
	elseif layout == 'healer' then
		-- Healing db
	end

	E:StaggeredUpdateAll(nil, true)

	L1UI:Print('Layout has been updated.')
end
