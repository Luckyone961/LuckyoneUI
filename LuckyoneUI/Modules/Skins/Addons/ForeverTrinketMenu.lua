local _, Private = ...

if not Private.ElvUI then
	return
end

local next = next
local unpack = unpack

local ceil = math.ceil
local floor = math.floor
local min = math.min
local sort = table.sort

local hooksecurefunc = hooksecurefunc
local InCombatLockdown = InCombatLockdown

local _G = _G

local E = unpack(ElvUI)
local S = E:GetModule('Skins')

local function HandleItemButton(button)
	if not button.IsSkinned then
		button:SetNormalTexture(E.ClearTexture)
		button:SetTemplate()
		button.Center:SetDrawLayer('BACKGROUND', -1)
		button:StyleButton()

		button.icon:SetInside()
		button.cooldown:SetInside()

		button.flatBorder:SetAlpha(0)

		if button.bisBorder then
			button.bisBorder:SetAlpha(0)
		end

		button.IsSkinned = true
	end

	-- The classic skin resets the crop
	button.icon:SetTexCoords()

	-- Gold border on a queued swap
	if button.queueBorder:IsShown() or (button.bisBorder and button.bisBorder:IsShown()) then
		button:SetBackdropBorderColor(1, 0.8, 0.1)
	else
		button:SetBackdropBorderColor(unpack(E.media.bordercolor))
	end
end

local function HandleBar(frame, buttons, hideBorder)
	if not frame.backdrop then
		frame:CreateBackdrop('Transparent', nil, nil, nil, nil, nil, nil, true)
	end

	frame:SetBackdrop()
	frame.backdrop:SetShown(not hideBorder)

	for _, button in next, buttons do
		HandleItemButton(button)
	end
end

local function SortByOffset(a, b)
	local _, _, _, ax, ay = a:GetPoint()
	local _, _, _, bx, by = b:GetPoint()

	return ax - ay < bx - by
end

local function Bar_Layout(frame, buttons)
	local shown = {}
	for _, button in next, buttons do
		if button:IsShown() and button:GetPoint() then
			shown[#shown + 1] = button
		end
	end

	local count = #shown
	if count == 0 then return end

	sort(shown, SortByOffset)

	local _, _, _, x, y = shown[1]:GetPoint()
	local inset, step = x - y, shown[1]:GetWidth() + 2
	local horizontal = _G.TrinketMenuDB.horizontal

	for index = 1, count do
		local button, offset = shown[index], inset + (index - 1) * step
		button:ClearAllPoints()

		if horizontal then
			button:SetPoint('LEFT', frame, 'LEFT', offset, 0)
		else
			button:SetPoint('TOP', frame, 'TOP', 0, -offset)
		end
	end

	local length = count * step - 2 + inset * 2
	if horizontal then
		frame:SetWidth(length)
	else
		frame:SetHeight(length)
	end
end

-- Item list, pinned list and combat list grid
local function List_Layout(frame, columns)
	local buttons = frame.buttons
	local first = buttons[1]
	if not first or not first:IsShown() then return end

	local _, _, _, pad = first:GetPoint()
	local step = first:GetWidth() + 2
	local count = 0

	for index = 1, #buttons do
		local button = buttons[index]
		if button:IsShown() then
			count = index

			button:ClearAllPoints()
			button:SetPoint('TOPLEFT', frame, 'TOPLEFT', pad + (index - 1) % columns * step, -pad - floor((index - 1) / columns) * step)
		end
	end

	frame:SetSize(min(count, columns) * step - 2 + pad * 2, ceil(count / columns) * step - 2 + pad * 2)
end

local function Update(addon)
	local window = addon.window
	if not window then return end

	local db = _G.TrinketMenuDB
	HandleBar(window, addon.slotButtons, db.hideFrameBorder)

	local gearFrame = addon.gearFrame
	if gearFrame then
		HandleBar(gearFrame, gearFrame.buttons, db.hideFrameBorder)
	end

	local menu = addon.itemMenu
	if menu then
		HandleBar(menu, menu.buttons, db.hideMenuBorder)

		if menu:IsShown() then
			List_Layout(menu, db.columns)

			if db.hideMenuBorder then
				local point, anchor, relativePoint, x, y = menu:GetPoint()
				menu:ClearAllPoints()
				menu:Point(point, anchor, relativePoint, x > 0.5 and 2 or x < -0.5 and -2 or 0, y > 0.5 and 2 or y < -0.5 and -2 or 0)
			end
		end
	end

	local pinned = addon.pinned
	if pinned then
		HandleBar(pinned, pinned.buttons, db.hideMenuBorder)

		if pinned:IsShown() then
			List_Layout(pinned, db.columns)
		end
	end
end

-- Secure weapon lists for combat
local function PrepareCombatLists(addon)
	local lists = addon.combatLists
	if not lists or InCombatLockdown() then return end

	for _, list in next, lists do
		HandleBar(list, list.buttons)
		List_Layout(list, _G.TrinketMenuDB.columns)
	end
end

local function UpdateLockAppearance(addon)
	Update(addon)

	local window = addon.window
	if not window or InCombatLockdown() then return end

	Bar_Layout(window, addon.slotButtons)

	local gearFrame = addon.gearFrame
	if gearFrame then
		Bar_Layout(gearFrame, gearFrame.buttons)
	end
end

local function Button_UpdateBorder(button)
	button:SetBackdropBorderColor(unpack(button:IsHighlightLocked() and E.media.rgbvaluecolor or E.media.bordercolor))
end

local function HandleButton(button)
	S:HandleButton(button)

	hooksecurefunc(button, 'LockHighlight', Button_UpdateBorder)
	hooksecurefunc(button, 'UnlockHighlight', Button_UpdateBorder)
	button:HookScript('OnLeave', Button_UpdateBorder)
	Button_UpdateBorder(button)
end

local function RefreshQueuePanel(addon)
	local options = addon.options
	local rows = options and options.queueContent.rows
	if not rows then return end

	for _, row in next, rows do
		if not row.IsSkinned then
			S:HandleIcon(row.icon, true)
			S:HandleButton(row.btn)
			S:HandleButton(row.hideBtn)
			HandleButton(row.optBtn)
			S:HandleNextPrevButton(row.up, 'up')
			S:HandleNextPrevButton(row.down, 'down')

			row.IsSkinned = true
		end
	end
end

-- Per item settings next to the options
local function ShowItemOptions(addon)
	local window = addon.options.itemOptions
	if window.IsSkinned then return end

	window:SetTemplate('Transparent')
	S:HandleCloseButton((window:GetChildren()))

	S:HandleCheckBox(window.priority)
	S:HandleCheckBox(window.keep)
	window.priority:Size(26)
	window.keep:Size(26)

	S:HandleEditBox(window.delay)

	window.IsSkinned = true
end

-- Saved queues next to the options
local function ToggleProfiles(addon)
	local window = addon.options.profiles
	if window.IsSkinned then return end

	window:SetTemplate('Transparent')
	S:HandleCloseButton((window:GetChildren()))

	S:HandleEditBox(window.name)
	S:HandleButton(window.save)

	for _, row in next, window.rows do
		S:HandleButton(row.load)
		S:HandleButton(row.delete)
	end

	window.IsSkinned = true
end

-- Gear bar slots next to the options
local function ToggleGearSlotPicker(addon)
	local window = addon.gearPicker
	if window.IsSkinned then return end

	window:SetTemplate('Transparent')
	S:HandleCloseButton((window:GetChildren()))

	for _, check in next, window.checks do
		S:HandleCheckBox(check)
	end

	for _, check in next, window.always do
		S:HandleCheckBox(check)
	end

	window.IsSkinned = true
end

local function Skin_Options(addon)
	local frame = addon.options
	if frame.IsSkinned then return end

	-- The close button
	S:HandleCloseButton((frame:GetChildren()))

	-- Main Frame
	frame:SetTemplate('Transparent')

	-- Tabs
	for _, tab in next, frame.tabs do
		HandleButton(tab)
	end

	for _, panel in next, frame.panels do
		for _, child in next, { panel:GetChildren() } do
			if child:IsObjectType('CheckButton') then
				S:HandleCheckBox(child)

				-- The rows are 24 apart
				child:Size(26)
			elseif child:IsObjectType('Button') then
				HandleButton(child)
			elseif child:IsObjectType('EditBox') then
				S:HandleEditBox(child)
			end
		end
	end

	S:HandleScrollBar(_G.ForeverTrinketMenuQueueScroll.ScrollBar)

	frame.IsSkinned = true
end

local function Skin_ForeverTrinketMenu()
	if not Private.Addon.db.profile.skins.ForeverTrinketMenu then return end

	local addon = _G.ForeverTrinketMenuEventFrame

	-- Bars, item list, pinned list and combat lists
	hooksecurefunc(addon, 'CreateGearBar', Update)
	hooksecurefunc(addon, 'PrepareCombatLists', PrepareCombatLists)
	hooksecurefunc(addon, 'RefreshPinned', Update)
	hooksecurefunc(addon, 'ShowItemMenu', Update)
	hooksecurefunc(addon, 'UpdateLockAppearance', UpdateLockAppearance)
	hooksecurefunc(addon, 'UpdateQueueIndicators', Update)

	-- Options
	hooksecurefunc(addon, 'RefreshQueuePanel', RefreshQueuePanel)
	hooksecurefunc(addon, 'ShowItemOptions', ShowItemOptions)
	hooksecurefunc(addon, 'ToggleGearSlotPicker', ToggleGearSlotPicker)
	hooksecurefunc(addon, 'ToggleOptions', Skin_Options)
	hooksecurefunc(addon, 'ToggleProfiles', ToggleProfiles)

	UpdateLockAppearance(addon)
end

S:AddCallbackForAddon('ForeverTrinketMenu', 'LuckyoneUI_ForeverTrinketMenu', Skin_ForeverTrinketMenu)
