local L1UI, E, L, V, P, G = unpack(select(2, ...))

local ReloadUI = ReloadUI

function L1UI:UpdateLayout(layout)

	if not E.db.movers then E.db.movers = {} end

	-- Tooltip
	E.db["tooltip"]["healthBar"]["statusPosition"] = "TOP"

	if layout == 'dps' then

		E.db["unitframe"]["units"]["party"]["disableMouseoverGlow"] = true
		E.db["unitframe"]["units"]["party"]["disableTargetGlow"] = true

		E.db["unitframe"]["units"]["raid40"]["disableMouseoverGlow"] = true
		E.db["unitframe"]["units"]["raid40"]["disableTargetGlow"] = true

		E.db["unitframe"]["units"]["player"]["aurabar"]["maxDuration"] = 0

		E.db["unitframe"]["units"]["focus"]["raidicon"]["attachTo"] = "RIGHT"
		E.db["unitframe"]["units"]["focus"]["raidicon"]["attachToObject"] = "Health"
		E.db["unitframe"]["units"]["focus"]["raidicon"]["xOffset"] = -2
		E.db["unitframe"]["units"]["focus"]["raidicon"]["yOffset"] = 0

		E.db["unitframe"]["units"]["focustarget"]["raidicon"]["attachTo"] = "RIGHT"
		E.db["unitframe"]["units"]["focustarget"]["raidicon"]["attachToObject"] = "Health"
		E.db["unitframe"]["units"]["focustarget"]["raidicon"]["xOffset"] = -2
		E.db["unitframe"]["units"]["focustarget"]["raidicon"]["yOffset"] = 0

		E.db["unitframe"]["units"]["party"]["raidicon"]["attachToObject"] = "Health"
		E.db["unitframe"]["units"]["party"]["raidicon"]["yOffset"] = 12

		E.db["unitframe"]["units"]["pet"]["raidicon"]["attachTo"] = "LEFT"
		E.db["unitframe"]["units"]["pet"]["raidicon"]["attachToObject"] = "Health"
		E.db["unitframe"]["units"]["pet"]["raidicon"]["xOffset"] = 2
		E.db["unitframe"]["units"]["pet"]["raidicon"]["yOffset"] = 0

		E.db["unitframe"]["units"]["player"]["raidicon"]["enable"] = true
		E.db["unitframe"]["units"]["player"]["raidicon"]["attachTo"] = "LEFT"
		E.db["unitframe"]["units"]["player"]["raidicon"]["attachToObject"] = "Health"
		E.db["unitframe"]["units"]["player"]["raidicon"]["xOffset"] = 2
		E.db["unitframe"]["units"]["player"]["raidicon"]["yOffset"] = 0

		E.db["unitframe"]["units"]["raid40"]["raidicon"]["attachTo"] = "LEFT"
		E.db["unitframe"]["units"]["raid40"]["raidicon"]["attachToObject"] = "Health"
		E.db["unitframe"]["units"]["raid40"]["raidicon"]["size"] = 14
		E.db["unitframe"]["units"]["raid40"]["raidicon"]["xOffset"] = 2
		E.db["unitframe"]["units"]["raid40"]["raidicon"]["yOffset"] = 0

		E.db["unitframe"]["units"]["target"]["raidicon"]["attachTo"] = "RIGHT"
		E.db["unitframe"]["units"]["target"]["raidicon"]["attachToObject"] = "Health"
		E.db["unitframe"]["units"]["target"]["raidicon"]["xOffset"] = -2
		E.db["unitframe"]["units"]["target"]["raidicon"]["yOffset"] = 0

		E.db["unitframe"]["units"]["targettarget"]["raidicon"]["attachTo"] = "RIGHT"
		E.db["unitframe"]["units"]["targettarget"]["raidicon"]["attachToObject"] = "Health"
		E.db["unitframe"]["units"]["targettarget"]["raidicon"]["xOffset"] = -2
		E.db["unitframe"]["units"]["targettarget"]["raidicon"]["yOffset"] = 0

	elseif layout == 'healer' then

		E.db["unitframe"]["units"]["party"]["disableMouseoverGlow"] = true
		E.db["unitframe"]["units"]["party"]["disableTargetGlow"] = true

		E.db["unitframe"]["units"]["raid"]["disableMouseoverGlow"] = true
		E.db["unitframe"]["units"]["raid"]["disableTargetGlow"] = true

		E.db["unitframe"]["units"]["raid40"]["disableMouseoverGlow"] = true
		E.db["unitframe"]["units"]["raid40"]["disableTargetGlow"] = true

		E.db["unitframe"]["units"]["party"]["raidicon"]["yOffset"] = 12

		E.db["unitframe"]["units"]["raid"]["summonIcon"]["size"] = 22

		E.db["unitframe"]["units"]["focus"]["raidicon"]["attachTo"] = "RIGHT"
		E.db["unitframe"]["units"]["focus"]["raidicon"]["attachToObject"] = "Health"
		E.db["unitframe"]["units"]["focus"]["raidicon"]["xOffset"] = -2
		E.db["unitframe"]["units"]["focus"]["raidicon"]["yOffset"] = 0

		E.db["unitframe"]["units"]["focustarget"]["raidicon"]["attachTo"] = "RIGHT"
		E.db["unitframe"]["units"]["focustarget"]["raidicon"]["attachToObject"] = "Health"
		E.db["unitframe"]["units"]["focustarget"]["raidicon"]["xOffset"] = -2
		E.db["unitframe"]["units"]["focustarget"]["raidicon"]["yOffset"] = 0

		E.db["unitframe"]["units"]["pet"]["raidicon"]["attachTo"] = "LEFT"
		E.db["unitframe"]["units"]["pet"]["raidicon"]["attachToObject"] = "Health"
		E.db["unitframe"]["units"]["pet"]["raidicon"]["xOffset"] = 2
		E.db["unitframe"]["units"]["pet"]["raidicon"]["yOffset"] = 0

		E.db["unitframe"]["units"]["player"]["raidicon"]["enable"] = true
		E.db["unitframe"]["units"]["player"]["raidicon"]["attachTo"] = "LEFT"
		E.db["unitframe"]["units"]["player"]["raidicon"]["attachToObject"] = "Health"
		E.db["unitframe"]["units"]["player"]["raidicon"]["xOffset"] = 2
		E.db["unitframe"]["units"]["player"]["raidicon"]["yOffset"] = 0

		E.db["unitframe"]["units"]["raid40"]["raidicon"]["attachTo"] = "LEFT"
		E.db["unitframe"]["units"]["raid40"]["raidicon"]["attachToObject"] = "Health"
		E.db["unitframe"]["units"]["raid40"]["raidicon"]["size"] = 14
		E.db["unitframe"]["units"]["raid40"]["raidicon"]["xOffset"] = 2
		E.db["unitframe"]["units"]["raid40"]["raidicon"]["yOffset"] = 0

		E.db["unitframe"]["units"]["target"]["raidicon"]["attachTo"] = "RIGHT"
		E.db["unitframe"]["units"]["target"]["raidicon"]["attachToObject"] = "Health"
		E.db["unitframe"]["units"]["target"]["raidicon"]["xOffset"] = -2
		E.db["unitframe"]["units"]["target"]["raidicon"]["yOffset"] = 0

		E.db["unitframe"]["units"]["targettarget"]["raidicon"]["attachTo"] = "RIGHT"
		E.db["unitframe"]["units"]["targettarget"]["raidicon"]["attachToObject"] = "Health"
		E.db["unitframe"]["units"]["targettarget"]["raidicon"]["xOffset"] = -2
		E.db["unitframe"]["units"]["targettarget"]["raidicon"]["yOffset"] = 0
	end

	E:StaggeredUpdateAll(nil, true)

	L1UI:Print('Layout has been updated. A /reload is suggested.')
end
