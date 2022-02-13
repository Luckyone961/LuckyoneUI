--local L1UI, E, L, V, P, G = unpack(select(2, ...))
--local M = E:GetModule('Misc')

--[[function GetLootRollTimeLeft(rollid)
	return 20
end

function GetLootRollItemLink(rollID)
	return '|cffffffff|Hitem:25::::::::1:::::::::|h[Worn Shortsword]|h|r'
end

function GetLootRollItemInfo(RollID)
	local Texture = 135226
	local Name = "Atiesh, Greatstaff of the Guardian"
	local Count = RollID
	local Quality = RollID + 1
	local BindOnPickUp = random(0, 1) > 0.5
	local CanNeed = true
	local CanGreed = true
	local ReasonNeed = 0
	local ReasonGreed = 0

	return Texture, Name, Count, Quality, BindOnPickUp, CanNeed, CanGreed, ReasonNeed, ReasonGreed
end

function TestLootFrames()
	for rollID = 1, NUM_GROUP_LOOT_FRAMES do
		M:START_LOOT_ROLL(_, rollID, GetLootRollTimeLeft(rollID))
	end
end]]
