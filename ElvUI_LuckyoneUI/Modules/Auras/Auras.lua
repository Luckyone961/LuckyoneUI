-- Lua functions
local unpack = unpack

-- AddOn namespace
local _, Private = ...

-- ElvUI modules
local E, L = unpack(ElvUI)

-- Auras config section: Buffs
function Private:Setup_Buffs(frame, option)
	local all = 'Blacklist,Personal,NonPersonal'

	if frame == 'player' then
		if option == 'all' then
			E.db.unitframe.units.player.buffs.priority = all
		else
			E.db.unitframe.units.player.buffs.priority = 'Blacklist,Personal,NonPersonal'
		end
	elseif frame == 'target' then
		if option == 'all' then
			E.db.unitframe.units.target.buffs.priority = all
		else
			E.db.unitframe.units.target.buffs.priority = 'Dispellable,RaidBuffsElvUI,Mount'
		end
	elseif frame == 'focus' then
		if option == 'all' then
			E.db.unitframe.units.focus.buffs.priority = all
		else
			E.db.unitframe.units.focus.buffs.priority = 'Dispellable,RaidBuffsElvUI,Mount'
		end
	elseif frame == 'boss' then
		if option == 'all' then
			E.db.unitframe.units.boss.buffs.priority = all
		else
			E.db.unitframe.units.boss.buffs.priority = 'Dispellable,RaidBuffsElvUI'
		end
	end

	E:UpdateUnitFrames()

	Private:Print(L["Buff filters updated."])
end

-- Auras config section: Debuffs
function Private:Setup_Debuffs(frame, option)
	local all = 'Blacklist,Personal,NonPersonal'

	if frame == 'player' then
		if option == 'all' then
			E.db.unitframe.units.player.debuffs.priority = all
		else
			E.db.unitframe.units.player.debuffs.priority = 'Blacklist,Personal,NonPersonal'
		end
	elseif frame == 'target' then
		if option == 'all' then
			E.db.unitframe.units.target.debuffs.priority = all
		else
			E.db.unitframe.units.target.debuffs.priority = E.Retail and 'ImportantCC,blockNonPersonal,ClassDebuffs' or 'Blacklist,Personal'
		end
	elseif frame == 'focus' then
		if option == 'all' then
			E.db.unitframe.units.focus.debuffs.priority = all
		else
			E.db.unitframe.units.focus.debuffs.priority = E.Retail and 'ImportantCC,blockNonPersonal,ClassDebuffs' or 'Blacklist,Personal,CCDebuffs'
		end
	elseif frame == 'boss' then
		if option == 'all' then
			E.db.unitframe.units.boss.debuffs.priority = all
		else
			E.db.unitframe.units.boss.debuffs.priority = E.Retail and 'blockNonPersonal,ClassDebuffs' or 'Blacklist,Personal'
		end
	end

	E:UpdateUnitFrames()

	Private:Print(L["Debuff filters updated."])
end
