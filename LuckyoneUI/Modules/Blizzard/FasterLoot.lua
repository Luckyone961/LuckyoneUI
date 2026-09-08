local _, Private = ...

local CreateFrame = CreateFrame
local GetNumLootItems = GetNumLootItems
local LootSlot = LootSlot

local _G = _G

-- Blizzards pacing for the classic loot window
local AUTOLOOT_DELAY = 0.1
local AUTOLOOT_RATE = 0.1

local EventFrame
local isLooting

-- Both loot events pass the auto loot state, it already accounts for the modifier key
-- Reverse order because Blizzard clears the slots
local function LootItems(autoLoot)
	if isLooting or not autoLoot then return end

	local numItems = GetNumLootItems()
	if numItems == 0 then return end

	isLooting = true

	for i = numItems, 1, -1 do
		LootSlot(i)
	end
end

-- LOOT_READY and LOOT_OPENED both fire for the same loot, only run the loop once
local function OnEvent(_, event, autoLoot)
	if event == 'LOOT_CLOSED' then
		isLooting = false
	else
		LootItems(autoLoot)
	end
end

-- Loots everything the moment the data arrives instead of waiting for the loot window
-- Source and Credits: Azilroka (ProjectAzilroka - FasterLoot) (Re-used with permission)
function Private:FasterLoot()
	if EventFrame then return end
	if not Private.Addon.db.profile.qualityOfLife.fasterLoot then return end

	-- Retail dropped both globals, only the classic loot frame paces its own auto loot
	if not Private.isRetail then
		_G.LOOTFRAME_AUTOLOOT_DELAY = AUTOLOOT_DELAY
		_G.LOOTFRAME_AUTOLOOT_RATE = AUTOLOOT_RATE
	end

	EventFrame = CreateFrame('Frame')
	EventFrame:SetScript('OnEvent', OnEvent)
	EventFrame:RegisterEvent('LOOT_READY')
	EventFrame:RegisterEvent('LOOT_OPENED')
	EventFrame:RegisterEvent('LOOT_CLOSED')
end
