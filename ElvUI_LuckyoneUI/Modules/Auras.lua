local L1UI, E, L, V, P, G = unpack(select(2, ...))

-- Auras config section: Buffs
function L1UI:Setup_Buffs(frame, type)

	local all = 'Blacklist,Personal,nonPersonal'
	local min = 'Blacklist,Dispellable,RaidBuffsElvUI'

	if frame == 'player' then
		if type == 'all' then
			E.db.unitframe.units.player.buffs.priority = all
		else
			E.db.unitframe.units.player.buffs.priority = min
		end
	elseif frame == 'target' then
		if type == 'all' then
			E.db.unitframe.units.target.buffs.priority = all
		else
			E.db.unitframe.units.target.buffs.priority = min
		end
	elseif frame == 'focus' then
		if type == 'all' then
			E.db.unitframe.units.focus.buffs.priority = all
		else
			E.db.unitframe.units.focus.buffs.priority = min
		end
	elseif frame == 'boss' then
		if type == 'all' then
			E.db.unitframe.units.boss.buffs.priority = all
		else
			E.db.unitframe.units.boss.buffs.priority = min
		end
	end

	E:UpdateUnitFrames()

	L1UI:Print(L["Buff filters updated."])
end

-- Auras config section: Debuffs
function L1UI:Setup_Debuffs(frame, type)

	local all = 'Blacklist,Personal,nonPersonal'
	local min = 'Blacklist,Personal,CCDebuffs'

	if frame == 'player' then
		if type == 'all' then
			E.db.unitframe.units.player.debuffs.priority = all
		else
			E.db.unitframe.units.player.debuffs.priority = min
		end
	elseif frame == 'target' then
		if type == 'all' then
			E.db.unitframe.units.target.debuffs.priority = all
		else
			E.db.unitframe.units.target.debuffs.priority = min
		end
	elseif frame == 'focus' then
		if type == 'all' then
			E.db.unitframe.units.focus.debuffs.priority = all
		else
			E.db.unitframe.units.focus.debuffs.priority = min
		end
	elseif frame == 'boss' then
		if type == 'all' then
			E.db.unitframe.units.boss.debuffs.priority = all
		else
			E.db.unitframe.units.boss.debuffs.priority = min
		end
	end

	E:UpdateUnitFrames()

	L1UI:Print(L["Debuff filters updated."])
end
