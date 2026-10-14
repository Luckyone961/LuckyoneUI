local _, Private = ...
local L = Private.L

local pairs = pairs
local type = type

local _G = _G

-- Plumber profile
function Private:Setup_Plumber()
	if not Private.IsAddOnLoaded('Plumber') then Private:Print('Plumber ' .. L["is not installed or enabled."]) return end

	local DB = _G.PlumberDB
	if not DB then return end

	-- Reset to defaults, Plumber will rebuild them after our reload popup
	-- Tables are user data (tracking lists, positions), keep them
	for key, value in pairs(DB) do
		if type(value) ~= 'table' then
			DB[key] = nil
		end
	end

	DB.AutoJoinEvents = false
	DB.BackpackItemTracker = false
	DB.ChatOptions = false

	DB.Housing_Clock_AnalogClock = false
	DB.Housing_ItemAcquiredAlert = false

	DB.InstanceDifficulty = true
	DB.InstanceDifficulty_Position = { x = 0, y = -8 }

	DB.LandingButton_ShowButton = false
	DB.PlayerTitleUI = true
	DB.TooltipDelvesItem = false
	DB.TransmogOutfitSelect = false

	Private:Print(L["Plumber profile has been set."])
end
