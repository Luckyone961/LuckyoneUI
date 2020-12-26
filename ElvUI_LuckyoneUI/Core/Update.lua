local L1UI, E, L, V, P, G = unpack(select(2, ...))

function L1UI:UpdateLayout(layout)

	if not E.db.movers then
		E.db.movers = {}
	end

	--General db
	E.db["unitframe"]["units"]["boss"]["buffs"]["priority"] = "Blacklist,Dispellable,RaidBuffsElvUI"
	E.db["unitframe"]["units"]["target"]["buffs"]["priority"] = "Blacklist,Dispellable,RaidBuffsElvUI"
	E.db["nameplates"]["units"]["ENEMY_NPC"]["buffs"]["priority"] = "Blacklist,Dispellable,RaidBuffsElvUI"

	if layout == 'dps' then
		-- DPS/TANK db
	elseif layout == 'healer' then
		-- Healing db
	end

	E:StaggeredUpdateAll(nil, true)

	L1UI:Print('Layout has been updated.')
end
