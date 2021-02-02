local L1UI, E, L, V, P, G = unpack(select(2, ...))

-- Filters: Buffs
function L1UI:SetupBuffs(frame, type)

	local all = "Blacklist,Personal,nonPersonal"
	local min = "Blacklist,Dispellable,RaidBuffsElvUI"

	if frame == 'player' then
		if type == 'all' then
			E.db["unitframe"]["units"]["player"]["buffs"]["perrow"] = 8
			E.db["unitframe"]["units"]["player"]["buffs"]["priority"] = all
		else
			E.db["unitframe"]["units"]["player"]["buffs"]["perrow"] = 2
			E.db["unitframe"]["units"]["player"]["buffs"]["priority"] = min
		end
	elseif frame == 'target' then
		if type == 'all' then
			E.db["unitframe"]["units"]["target"]["buffs"]["perrow"] = 8
			E.db["unitframe"]["units"]["target"]["buffs"]["priority"] = all
		else
			E.db["unitframe"]["units"]["target"]["buffs"]["perrow"] = 2
			E.db["unitframe"]["units"]["target"]["buffs"]["priority"] = min
		end
	elseif frame == 'focus' then
		if type == 'all' then
			E.db["unitframe"]["units"]["focus"]["buffs"]["perrow"] = 8
			E.db["unitframe"]["units"]["focus"]["buffs"]["priority"] = all
		else
			E.db["unitframe"]["units"]["focus"]["buffs"]["perrow"] = 2
			E.db["unitframe"]["units"]["focus"]["buffs"]["priority"] = min
		end
	elseif frame == 'boss' then
		if type == 'all' then
			E.db["unitframe"]["units"]["boss"]["buffs"]["perrow"] = 8
			E.db["unitframe"]["units"]["boss"]["buffs"]["priority"] = all
		else
			E.db["unitframe"]["units"]["boss"]["buffs"]["perrow"] = 3
			E.db["unitframe"]["units"]["boss"]["buffs"]["priority"] = min
		end
	elseif frame == 'nameplate' then
		if type == 'all' then
			E.db["nameplates"]["units"]["ENEMY_NPC"]["buffs"]["numAuras"] = 8
			E.db["nameplates"]["units"]["ENEMY_NPC"]["buffs"]["priority"] = all
		else
			E.db["nameplates"]["units"]["ENEMY_NPC"]["buffs"]["numAuras"] = 2
			E.db["nameplates"]["units"]["ENEMY_NPC"]["buffs"]["priority"] = min
		end
	end

	E:StaggeredUpdateAll(nil, true)

	L1UI:Print('Buff filters updated.')
end

-- Filters: Debuffs
function L1UI:SetupDebuffs(frame, type)

	local all = "Blacklist,Personal,nonPersonal"
	local min = "Blacklist,Personal,CCDebuffs"

	if frame == 'player' then
		if type == 'all' then
			E.db["unitframe"]["units"]["player"]["debuffs"]["priority"] = all
		else
			E.db["unitframe"]["units"]["player"]["debuffs"]["priority"] = min
		end
	elseif frame == 'target' then
		if type == 'all' then
			E.db["unitframe"]["units"]["target"]["debuffs"]["priority"] = all
		else
			E.db["unitframe"]["units"]["target"]["debuffs"]["priority"] = min
		end
	elseif frame == 'focus' then
		if type == 'all' then
			E.db["unitframe"]["units"]["focus"]["debuffs"]["priority"] = all
		else
			E.db["unitframe"]["units"]["focus"]["debuffs"]["priority"] = min
		end
	elseif frame == 'boss' then
		if type == 'all' then
			E.db["unitframe"]["units"]["boss"]["debuffs"]["priority"] = all
		else
			E.db["unitframe"]["units"]["boss"]["debuffs"]["priority"] = min
		end
	elseif frame == 'nameplate' then
		if type == 'all' then
			E.db["nameplates"]["units"]["ENEMY_NPC"]["debuffs"]["priority"] = all
		else
			E.db["nameplates"]["units"]["ENEMY_NPC"]["debuffs"]["priority"] = min
		end
	end

	E:StaggeredUpdateAll(nil, true)

	L1UI:Print('Debuff filters updated.')
end
