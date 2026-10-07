local _, Private = ...

if not Private.ElvUI then
	return
end

-- We skin the loot window, its menus and the popup windows
-- The item cards in the drop and Mythic+ popups and the minimap button remain untouched

local next = next
local unpack = unpack

local hooksecurefunc = hooksecurefunc

local _G = _G

local E = unpack(ElvUI)
local S = E:GetModule('Skins')

-- KeystoneLoot ships its own copy of the Blizzard menu system
local menuBackdrops = {}

local function HandleMenu(menu)
	menu:StripTextures()

	local backdrop = menuBackdrops[menu]
	if not backdrop then
		menu:CreateBackdrop('Transparent')
		backdrop = menu.backdrop
		backdrop:SetInside(nil, 1, 5)
		menuBackdrops[menu] = backdrop

		S:HandleTrimScrollBar(menu.ScrollBar)
	end

	backdrop:OffsetFrameLevel(nil, menu)
end

-- Submenus get skinned when they are acquired
local function Menu_Open(manager, _, menuDescription)
	local menu = manager:GetOpenMenu()
	if not menu then return end

	HandleMenu(menu)
	menuDescription:AddMenuAcquiredCallback(HandleMenu)
end

-- Item icons get the ElvUI border in place of the quick slot frame
local function SkinIcon(icon, border)
	border:Hide()
	S:HandleIcon(icon, true)
end

local function LootIcon_OnLoad(button)
	SkinIcon(button.Content.Icon, button.Content.IconBorder)
end

local function Entry_OnLoad(entry)
	local teleport = entry.TeleportButton
	SkinIcon(teleport.Icon, teleport.IconBorder)
end

-- Reminder icons have no OnLoad, Init runs on every acquire
local function ReminderIcon_Init(button)
	SkinIcon(button.Icon, button.IconBorder)
end

-- The dungeon list and the raid blocks share the inset and the quest log border
local function List_OnLoad(list)
	list.BorderFrame:StripTextures()
	list.Inset:StripTextures()
	list.Inset:CreateBackdrop('Transparent')
end

-- Loot spec cards keep their spec art
local function ReminderSpec_OnLoad(card)
	card.NineSlice:Hide()
	card:CreateBackdrop()

	-- Three-slice button (SharedButtonSmallTemplate) needs the child backdrop
	S:HandleButton(card.LootSpecButton, nil, nil, nil, true)
end

local function TabSystem_AddTab(tabSystem)
	S:HandleTab(tabSystem.tabs[#tabSystem.tabs])
end

local function SkinSidePanel(panel, point, relativePoint, x)
	panel:StripTextures()
	panel:SetTemplate('Transparent')

	panel:ClearAllPoints()
	panel:Point(point, panel:GetParent(), relativePoint, x, -40)
end

local function SkinMainFrame(frame)
	S:HandlePortraitFrame(frame)

	-- Match the tab spacing of the ElvUI skins
	local tabSystem = frame.TabSystem
	tabSystem.spacing = -5
	tabSystem:ClearAllPoints()
	tabSystem:Point('TOPLEFT', frame, 'BOTTOMLEFT', -3, 0)
	hooksecurefunc(tabSystem, 'AddTab', TabSystem_AddTab)

	for _, dropdown in next, { frame.ClassDropdown, frame.SlotDropdown, frame.ItemLevelDropdown } do
		S:HandleDropDownBox(dropdown, dropdown:GetWidth())
	end

	SkinSidePanel(frame.CatalystFrame, 'TOPLEFT', 'TOPRIGHT', 1)
	SkinSidePanel(frame.CustomItemFrame, 'TOPRIGHT', 'TOPLEFT', -1)
end

local function Skin_KeystoneLoot()
	if not Private.Addon.db.profile.skins.KeystoneLoot then return end

	local frame = _G.KeystoneLootFrame
	if not frame then return end

	-- Main Frame
	SkinMainFrame(frame)

	-- Popups
	for _, popup in next, { _G.KeystoneLootReminderFrame, _G.KeystoneLootDropNotificationFrame, _G.KeystoneLootMythicPlusNotificationFrame } do
		S:HandleFrame(popup)
	end

	-- Lists, rows and icons are created from the first loading screen on
	hooksecurefunc(_G.KeystoneLootDungeonsFrameMixin, 'OnLoad', List_OnLoad)
	hooksecurefunc(_G.KeystoneLootRaidBlockMixin, 'OnLoad', List_OnLoad)
	hooksecurefunc(_G.KeystoneLootEntryFrameMixin, 'OnLoad', Entry_OnLoad)
	hooksecurefunc(_G.KeystoneLootLootIconButtonMixin, 'OnLoad', LootIcon_OnLoad)
	hooksecurefunc(_G.KeystoneLootReminderSpecMixin, 'OnLoad', ReminderSpec_OnLoad)
	hooksecurefunc(_G.KeystoneLootReminderIconMixin, 'Init', ReminderIcon_Init)

	-- Dropdown and context menus
	local manager = _G.KSLMenu.GetManager()
	hooksecurefunc(manager, 'OpenMenu', Menu_Open)
	hooksecurefunc(manager, 'OpenContextMenu', Menu_Open)
end

S:AddCallbackForAddon('KeystoneLoot', 'LuckyoneUI_KeystoneLoot', Skin_KeystoneLoot)
