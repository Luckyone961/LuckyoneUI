local _, Private = ...

local CreateFrame = CreateFrame
local GetNumLootItems = GetNumLootItems
local LootSlot = LootSlot

local _G = _G

-- Blizzards pacing for the classic loot window
local AUTOLOOT_DELAY = 0.1
local AUTOLOOT_RATE = 0.1

local EventFrame
local lootedSlots = 0

-- Both loot events pass the auto loot state, it already accounts for the modifier key
-- Reverse order because Blizzard clears the slots
local function LootItems(autoLoot)
	if not autoLoot then return end

	-- Looted slots keep their index until the loot closes
	local numItems = GetNumLootItems()
	if numItems <= lootedSlots then return end

	for i = numItems, lootedSlots + 1, -1 do
		LootSlot(i)
	end

	lootedSlots = numItems
end

-- LOOT_READY and LOOT_OPENED both fire for the same loot
local function OnEvent(_, event, autoLoot)
	if event == 'LOOT_CLOSED' then
		lootedSlots = 0
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
