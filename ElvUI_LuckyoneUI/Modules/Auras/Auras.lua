local Name, Private = ...
local E, L, V, P, G = unpack(ElvUI)

-- Auras config section: Buffs
function L1UI:Setup_Buffs(frame, option)
	local all = 'Blacklist,Personal,nonPersonal'
	local min = 'Blacklist,Dispellable,RaidBuffsElvUI'

	if frame == 'player' then
		if option == 'all' then
			E.db.unitframe.units.player.buffs.priority = all
		else
			E.db.unitframe.units.player.buffs.priority = min
		end
	elseif frame == 'target' then
		if option == 'all' then
			E.db.unitframe.units.target.buffs.priority = all
		else
			E.db.unitframe.units.target.buffs.priority = min
		end
	elseif frame == 'focus' then
		if option == 'all' then
			E.db.unitframe.units.focus.buffs.priority = all
		else
			E.db.unitframe.units.focus.buffs.priority = min
		end
	elseif frame == 'boss' then
		if option == 'all' then
			E.db.unitframe.units.boss.buffs.priority = all
		else
			E.db.unitframe.units.boss.buffs.priority = min
		end
	end

	E:UpdateUnitFrames()

	Private:Print(L["Buff filters updated."])
end

-- Auras config section: Debuffs
function L1UI:Setup_Debuffs(frame, option)
	local all = 'Blacklist,Personal,nonPersonal'
	local min = 'Blacklist,Personal,CCDebuffs'

	if frame == 'player' then
		if option == 'all' then
			E.db.unitframe.units.player.debuffs.priority = all
		else
			E.db.unitframe.units.player.debuffs.priority = min
		end
	elseif frame == 'target' then
		if option == 'all' then
			E.db.unitframe.units.target.debuffs.priority = all
		else
			E.db.unitframe.units.target.debuffs.priority = min
		end
	elseif frame == 'focus' then
		if option == 'all' then
			E.db.unitframe.units.focus.debuffs.priority = all
		else
			E.db.unitframe.units.focus.debuffs.priority = min
		end
	elseif frame == 'boss' then
		if option == 'all' then
			E.db.unitframe.units.boss.debuffs.priority = all
		else
			E.db.unitframe.units.boss.debuffs.priority = min
		end
	end

	E:UpdateUnitFrames()

	Private:Print(L["Debuff filters updated."])
end
