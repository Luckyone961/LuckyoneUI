local L1UI, E, L, V, P, G = unpack(select(2, ...))

--[[
E.db["unitframe"]["units"]["player"]["buffs"]["priority"]
E.db["unitframe"]["units"]["player"]["debuffs"]["priority"]

E.db["unitframe"]["units"]["target"]["buffs"]["priority"]
E.db["unitframe"]["units"]["target"]["debuffs"]["priority"]

E.db["unitframe"]["units"]["focus"]["buffs"]["priority"]
E.db["unitframe"]["units"]["focus"]["debuffs"]["priority"]

E.db["nameplates"]["units"]["ENEMY_NPC"]["buffs"]["priority"]
E.db["nameplates"]["units"]["ENEMY_NPC"]["debuffs"]["priority"]
]]

-- Filters: Buffs
function L1UI:SetupBuffs(frame, type)

	local all = "Blacklist,Personal,nonPersonal"
	local min = "Blacklist,Dispellable,RaidBuffsElvUI"

	if frame == 'player' then

	elseif frame == 'target' then

	elseif frame == 'focus' then

	elseif frame == 'nameplate' then

	end

	E:StaggeredUpdateAll(nil, true)

	L1UI:Print('Buff filters updated.')
end

-- Filters: Debuffs
function L1UI:SetupDebuffs(frame, type)

	local all = "Blacklist,Personal,nonPersonal"
	local min = "Blacklist,Personal,CCDebuffs"

	if frame == 'player' then

	elseif frame == 'target' then

	elseif frame == 'focus' then

	elseif frame == 'nameplate' then

	end

	E:StaggeredUpdateAll(nil, true)

	L1UI:Print('Debuff filters updated.')
end
