local L1UI, E, L, V, P, G = unpack(select(2, ...))

function L1UI:UpdateLayout(layout)

	if not E.db.movers then E.db.movers = {} end

	-- Fix weird ActionBar stuff
	E.db["actionbar"]["bar4"]["buttons"] = 12
	E.db["actionbar"]["bar5"]["enabled"] = true
	E.db["actionbar"]["bar6"]["buttons"] = 12
	E.db["actionbar"]["bar6"]["buttonsPerRow"] = 12
	E.db["actionbar"]["bar6"]["enabled"] = false

	E.db["general"]["autoRepair"] = "PLAYER"
	E.db["general"]["interruptAnnounce"] = "EMOTE"

	if layout == 'dps' then
		-- DPS/TANK db
	elseif layout == 'healer' then
		-- Healing db
	end

	E:StaggeredUpdateAll(nil, true)

	L1UI:Print('Layout has been updated.')
end
