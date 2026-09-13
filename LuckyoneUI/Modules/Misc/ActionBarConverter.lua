local _, Private = ...

if not Private.ElvUI then
	return
end

local format = string.format
local ipairs = ipairs
local select = select
local tinsert = table.insert
local unpack = unpack

local CreateFrame = CreateFrame
local GameTooltip_Hide = GameTooltip_Hide
local GetBindingKey = GetBindingKey
local GetCurrentBindingSet = GetCurrentBindingSet
local GetCursorInfo = GetCursorInfo
local GetSpellName = C_Spell.GetSpellName
local hooksecurefunc = hooksecurefunc
local InCombatLockdown = InCombatLockdown
local PickupAction = PickupAction
local PlaceAction = PlaceAction
local SaveBindings = SaveBindings
local SetBinding = SetBinding

local GetActionTexture = C_ActionBar.GetActionTexture or GetActionTexture
local HasAction = C_ActionBar.HasAction or HasAction

local _G = _G
local BindingSet = Enum.BindingSet
local CANCEL = CANCEL
local CHARACTER_SPECIFIC_KEYBINDINGS = CHARACTER_SPECIFIC_KEYBINDINGS
local GameTooltip = GameTooltip
local HUD_EDIT_MODE_ACTION_BAR_LABEL = HUD_EDIT_MODE_ACTION_BAR_LABEL
local Settings_SetValue = _G.Settings.SetValue
local StaticPopup_Show = _G.StaticPopup_Show

local E = unpack(ElvUI)
local AB = E:GetModule('ActionBars')
local S = E:GetModule('Skins')

local frame, selected
local cells = {} -- Per slot

-- Edit Mode numbers the Blizzard bars differently than the slots
local blizzardIndex = { [1] = 1, [3] = 4, [4] = 5, [5] = 3, [6] = 2, [13] = 6, [14] = 7, [15] = 8 }

-- The form or stance that pages bar 1 onto each bonus bar
local forms = {}
if Private.myClass == 'DRUID' then
	forms[1], forms[2], forms[3], forms[4] = 768, 5215, 5487, 24858 -- Cat Form, Prowl, Bear Form, Moonkin Form
elseif Private.myClass == 'ROGUE' then
	forms[1] = 1784 -- Stealth
	if Private.isMists then
		forms[2] = 51713 -- Shadow Dance
	end
elseif Private.myClass == 'WARRIOR' and not Private.isRetail then
	forms[1], forms[2], forms[3] = 2457, 71, 2458 -- Battle Stance, Defensive Stance, Berserker Stance
elseif Private.myClass == 'PRIEST' and Private.isMists then
	forms[1] = 15473 -- Shadowform
elseif Private.myClass == 'WARLOCK' and Private.isMists then
	forms[1] = 103958 -- Metamorphosis
end

local function BlizzardLabel(page)
	if blizzardIndex[page] then
		return format(HUD_EDIT_MODE_ACTION_BAR_LABEL, blizzardIndex[page])
	elseif page == 2 then
		return format('%s - Page 2', format(HUD_EDIT_MODE_ACTION_BAR_LABEL, 1))
	elseif page == 11 and Private.isRetail then
		return 'Skyriding'
	end
	-- Bonus bars the class has no form for keep their number
	local name = forms[page - 6] and GetSpellName(forms[page - 6])
	return name or format('Bonus Bar %d', page - 6)
end

local function CreateText(parent, size, justify)
	local text = parent:CreateFontString(nil, 'OVERLAY')
	text:SetJustifyH(justify or 'LEFT')
	text:SetWordWrap(false)
	Private:SetFont(text, Private.Font, size, Private.Outline)

	return text
end

-- Same raw key and shortening ElvUI runs on its own buttons
local function UpdateCell(cell)
	cell.icon:SetTexture(GetActionTexture(cell.slot))

	local key = cell.command and GetBindingKey(cell.command)
	cell.HotKey:SetText(key or '')
	AB:FixKeybindText(cell)
end

local function Refresh()
	if InCombatLockdown() then return end

	for slot = 1, 180 do
		UpdateCell(cells[slot])
	end
end

local function SwapSlots(a, b)
	if HasAction(a) then
		PickupAction(a)
		PlaceAction(b)
		if GetCursorInfo() then
			PlaceAction(a)
		end
	elseif HasAction(b) then
		PickupAction(b)
		PlaceAction(a)
	end
end

local function SwapKeys(a, b)
	local keysA, keysB = { GetBindingKey(a) }, { GetBindingKey(b) }

	for _, key in ipairs(keysA) do
		if key ~= '' then
			SetBinding(key, b)
		end
	end
	for _, key in ipairs(keysB) do
		if key ~= '' then
			SetBinding(key, a)
		end
	end
end

local function SwapBars(source, target)
	if InCombatLockdown() then return end

	-- Picking up with something on the cursor would drop that into the slot instead
	if GetCursorInfo() then
		Private:Print('Clear your cursor first.')
		return
	end

	-- The skyriding page and the unused one after it have no keybinds of their own
	local keys = frame.keybinds:GetChecked() and source.bindButtons and target.bindButtons
	for i = 1, 12 do
		SwapSlots(source.first + i - 1, target.first + i - 1)

		if keys then
			SwapKeys(AB:GetKeyTarget(source.bindButtons, i), AB:GetKeyTarget(target.bindButtons, i))
		end
	end

	if keys then
		SaveBindings(GetCurrentBindingSet())
	end

	Refresh()
end

local function SetSelected(row)
	if selected then
		selected.selection:Hide()
		selected.swap:SetText('Swap')
	end

	selected = row

	if row then
		row.selection:Show()
		row.swap:SetText(CANCEL)
	end
end

-- First click picks the bar, the second one on another bar swaps, on the same bar cancels
local function Swap_OnClick(button)
	local row = button.row

	if not selected then
		SetSelected(row)
	elseif selected == row then
		SetSelected(nil)
	else
		local source = selected
		SetSelected(nil)
		SwapBars(source, row)
	end
end

local function UpdateCharacter()
	frame.character:SetChecked(GetCurrentBindingSet() == BindingSet.Character)
end

-- Blizzard's own setting, overwrites the character set so it goes through the Blizzard confirmation popup
local function Character_OnClick(check)
	if InCombatLockdown() then
		UpdateCharacter()
		return
	end

	if check:GetChecked() then
		Settings_SetValue('PROXY_CHARACTER_SPECIFIC_BINDINGS', true)
	else
		-- The box follows the answer through the hooks
		check:SetChecked(true)
		StaticPopup_Show('CONFIRM_DELETING_CHARACTER_SPECIFIC_BINDINGS')
	end
end

local function Cell_OnEnter(cell)
	if not HasAction(cell.slot) then return end

	GameTooltip:SetOwner(cell, 'ANCHOR_RIGHT')
	GameTooltip:SetAction(cell.slot)
	GameTooltip:Show()
end

local function CreateRow(page)
	local defaults = AB.barDefaults['bar' .. page]

	local row = CreateFrame('Frame', nil, frame)
	row:SetSize(782, 40)
	row:SetPoint('TOPLEFT', 10, -(90 + (page - 1) * 40))
	row.first = (page - 1) * 12 + 1
	row.bindButtons = defaults and defaults.bindButtons

	row.selection = row:CreateTexture(nil, 'BACKGROUND')
	row.selection:SetAllPoints()
	row.selection:SetColorTexture(0.294, 0.922, 0.173, 0.15)
	row.selection:Hide()

	row.elvui = CreateText(row, 12)
	row.elvui:SetPoint('LEFT')
	row.elvui:SetWidth(70)
	row.elvui:SetText(defaults and format('Bar %d', page) or '-')

	row.blizzard = CreateText(row, 12)
	row.blizzard:SetPoint('LEFT', row.elvui, 'RIGHT', 6, 0)
	row.blizzard:SetWidth(170)
	row.blizzard:SetText(BlizzardLabel(page))

	-- Hotkey preview
	local color = select(10, AB:GetHotkeyConfig(AB.db.bar1))
	for i = 1, 12 do
		local cell = CreateFrame('Frame', nil, row, 'BackdropTemplate')
		cell:SetSize(36, 36)
		cell:SetPoint('LEFT', row.blizzard, 'RIGHT', 6 + (i - 1) * 38, 0)
		cell:SetTemplate()
		cell:EnableMouse(true)
		cell:SetScript('OnEnter', Cell_OnEnter)
		cell:SetScript('OnLeave', GameTooltip_Hide)
		cell.slot = row.first + i - 1
		cell.command = row.bindButtons and AB:GetKeyTarget(row.bindButtons, i)

		cell.icon = cell:CreateTexture(nil, 'ARTWORK')
		cell.icon:SetInside()
		cell.icon:SetTexCoords()

		cell.HotKey = CreateText(cell, 14, 'CENTER')
		cell.HotKey:SetPoint('CENTER')
		cell.HotKey:SetTextColor(unpack(color))

		cells[cell.slot] = cell
	end

	row.swap = CreateFrame('Button', nil, row, 'UIPanelButtonTemplate')
	row.swap:SetSize(70, 36)
	row.swap:SetPoint('RIGHT')
	row.swap:SetText('Swap')
	row.swap:SetScript('OnClick', Swap_OnClick)
	row.swap.row = row
	S:HandleButton(row.swap)
end

local function Frame_OnEvent(_, event, slot)
	if InCombatLockdown() then return end

	if event == 'ACTIONBAR_SLOT_CHANGED' and slot and slot > 0 then
		local cell = cells[slot]
		if cell then
			UpdateCell(cell)
		end
	else
		Refresh()
	end
end

local function Frame_OnShow(self)
	self:RegisterEvent('ACTIONBAR_SLOT_CHANGED')
	self:RegisterEvent('UPDATE_BINDINGS')
	self:RegisterEvent('PLAYER_REGEN_ENABLED')

	-- Keybinds follow the content unless the box gets unchecked for another spec
	self.keybinds:SetChecked(true)
	UpdateCharacter()
	Refresh()
end

local function Frame_OnHide(self)
	self:UnregisterAllEvents()
	SetSelected(nil)
end

local function CreateConverter()
	frame = CreateFrame('Frame', 'LuckyoneUI_ActionBarConverter', E.UIParent, 'BackdropTemplate')
	frame:SetSize(802, 700)
	frame:SetPoint('CENTER')
	frame:SetFrameStrata('DIALOG')
	frame:SetMovable(true)
	frame:SetClampedToScreen(true)
	frame:EnableMouse(true)
	frame:SetTemplate('Transparent')
	frame:SetScript('OnShow', Frame_OnShow)
	frame:SetScript('OnHide', Frame_OnHide)
	frame:SetScript('OnEvent', Frame_OnEvent)
	frame:Hide()

	tinsert(_G.UISpecialFrames, 'LuckyoneUI_ActionBarConverter')

	-- The header doubles as the drag handle
	local header = CreateFrame('Frame', nil, frame)
	header:SetHeight(30)
	header:SetPoint('TOPLEFT')
	header:SetPoint('TOPRIGHT')
	header:EnableMouse(true)
	header:RegisterForDrag('LeftButton')
	header:SetScript('OnDragStart', function() frame:StartMoving() end)
	header:SetScript('OnDragStop', function() frame:StopMovingOrSizing() end)

	local title = CreateText(header, 14, 'CENTER')
	title:SetPoint('CENTER')
	title:SetText(Private.Name .. ' Bar Converter')

	local close = CreateFrame('Button', nil, frame, 'UIPanelCloseButton')
	close:SetPoint('TOPRIGHT', 2, 2)
	close:SetScript('OnClick', function() frame:Hide() end)
	S:HandleCloseButton(close)

	local keybinds = CreateFrame('CheckButton', nil, frame, 'UICheckButtonTemplate')
	keybinds:SetSize(20, 20)
	keybinds:SetPoint('TOPLEFT', 10, -36)
	S:HandleCheckBox(keybinds)
	frame.keybinds = keybinds

	keybinds.text = CreateText(frame, 12)
	keybinds.text:SetPoint('LEFT', keybinds, 'RIGHT', 4, 0)
	keybinds.text:SetText('Swap keybinds')

	local character = CreateFrame('CheckButton', nil, frame, 'UICheckButtonTemplate')
	character:SetSize(20, 20)
	character:SetPoint('LEFT', keybinds.text, 'RIGHT', 16, 0)
	character:SetScript('OnClick', Character_OnClick)
	S:HandleCheckBox(character)
	frame.character = character

	character.text = CreateText(frame, 12)
	character.text:SetPoint('LEFT', character, 'RIGHT', 4, 0)
	character.text:SetText(CHARACTER_SPECIFIC_KEYBINDINGS)

	-- UPDATE_BINDINGS fires halfway through a switch while the old set is still current, these run once it is done
	-- Covers the Blizzard options panel as well
	hooksecurefunc(_G.Settings, 'SelectCharacterBindings', UpdateCharacter)
	hooksecurefunc(_G.Settings, 'SelectAccountBindings', UpdateCharacter)

	local line = frame:CreateTexture(nil, 'ARTWORK')
	line:SetColorTexture(0, 0, 0, 1)
	line:SetHeight(1)
	line:SetPoint('TOPLEFT', 0, -62)
	line:SetPoint('TOPRIGHT', 0, -62)

	-- Column headers line up with the row labels
	for index, name in ipairs({ 'ElvUI', 'Blizzard' }) do
		local text = CreateText(frame, 12)
		text:SetPoint('TOPLEFT', 10 + (index - 1) * 76, -70)
		text:SetTextColor(0.294, 0.922, 0.173)
		text:SetText(name)
	end

	for page = 1, 15 do
		CreateRow(page)
	end
end

function Private:ToggleActionBarConverter()
	if not frame then
		CreateConverter()
	end

	frame:SetShown(not frame:IsShown())
end
