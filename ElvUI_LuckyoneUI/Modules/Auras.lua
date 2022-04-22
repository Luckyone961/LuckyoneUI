local L1UI, E, L, V, P, G = unpack(select(2, ...))

-- Auras config section: Buffs
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

	E:StaggeredUpdateAll()

	L1UI:Print(L["Buff filters updated."])
end

-- Auras config section: Debuffs
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

	E:StaggeredUpdateAll()

	L1UI:Print(L["Debuff filters updated."])
end

-- Auras for Classic and TBC
function L1UI:LegacyAuras(toggle, layout)

	if toggle == 'on' then

		if layout == 'main' then

			E.db["unitframe"]["units"]["party"]["buffs"]["anchorPoint"] = "TOPLEFT"
			E.db["unitframe"]["units"]["party"]["buffs"]["countFont"] = "Expressway"
			E.db["unitframe"]["units"]["party"]["buffs"]["countFontSize"] = 11
			E.db["unitframe"]["units"]["party"]["buffs"]["countXOffset"] = 1
			E.db["unitframe"]["units"]["party"]["buffs"]["countYOffset"] = 1
			E.db["unitframe"]["units"]["party"]["buffs"]["enable"] = true
			E.db["unitframe"]["units"]["party"]["buffs"]["growthX"] = "LEFT"
			E.db["unitframe"]["units"]["party"]["buffs"]["growthY"] = "DOWN"
			E.db["unitframe"]["units"]["party"]["buffs"]["maxDuration"] = 0
			E.db["unitframe"]["units"]["party"]["buffs"]["minDuration"] = 30
			E.db["unitframe"]["units"]["party"]["buffs"]["numrows"] = 2
			E.db["unitframe"]["units"]["party"]["buffs"]["perrow"] = 4
			E.db["unitframe"]["units"]["party"]["buffs"]["priority"] = "Blacklist,blockNoDuration,Personal"
			E.db["unitframe"]["units"]["party"]["buffs"]["sizeOverride"] = 19
			E.db["unitframe"]["units"]["party"]["buffs"]["spacing"] = 2
			E.db["unitframe"]["units"]["party"]["buffs"]["xOffset"] = -20
			E.db["unitframe"]["units"]["party"]["buffs"]["yOffset"] = -18

		elseif layout == 'healing' then

			E.db["unitframe"]["units"]["party"]["buffs"]["anchorPoint"] = "BOTTOMLEFT"
			E.db["unitframe"]["units"]["party"]["buffs"]["countFont"] = "Expressway"
			E.db["unitframe"]["units"]["party"]["buffs"]["countFontSize"] = 11
			E.db["unitframe"]["units"]["party"]["buffs"]["countXOffset"] = -1
			E.db["unitframe"]["units"]["party"]["buffs"]["countYOffset"] = 1
			E.db["unitframe"]["units"]["party"]["buffs"]["enable"] = true
			E.db["unitframe"]["units"]["party"]["buffs"]["maxDuration"] = 0
			E.db["unitframe"]["units"]["party"]["buffs"]["minDuration"] = 30
			E.db["unitframe"]["units"]["party"]["buffs"]["numrows"] = 2
			E.db["unitframe"]["units"]["party"]["buffs"]["perrow"] = 4
			E.db["unitframe"]["units"]["party"]["buffs"]["priority"] = "Blacklist,blockNoDuration,Personal"
			E.db["unitframe"]["units"]["party"]["buffs"]["sizeOverride"] = 19
			E.db["unitframe"]["units"]["party"]["buffs"]["yOffset"] = -2

		end

	elseif toggle == 'off' then

		E.db["unitframe"]["units"]["party"]["buffs"]["enable"] = false

	end

	E:StaggeredUpdateAll()
end
