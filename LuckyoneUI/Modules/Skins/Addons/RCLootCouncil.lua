local _, Private = ...

if not Private.ElvUI then
	return
end

local ipairs = ipairs
local next = next
local strfind = strfind
local type = type
local unpack = unpack

local hooksecurefunc = hooksecurefunc

local LibStub = LibStub

local _G = _G

local E = unpack(ElvUI)
local S = E:GetModule('Skins')

-- Windows: transparent content with a solid title
-- The addon reapplies its own backdrop on every skin update
local function SkinContent(content)
	content:SetTemplate('Transparent')
end

local function SkinTitle(title)
	title:SetTemplate()
end

local function SkinFrame(frame)
	SkinContent(frame.content)
	hooksecurefunc(frame.content, 'Update', SkinContent)

	SkinTitle(frame.title)
	hooksecurefunc(frame.title, 'Update', SkinTitle)
end

-- Item icons
local function SkinIconBordered(button)
	button:SetTemplate()

	-- The addon draws the icon in the backdrop layer, keep the backdrop below it
	button.Center:SetDrawLayer('BACKGROUND', -1)

	local normal = button:GetNormalTexture()
	S:HandleIcon(normal)
	normal:SetInside()

	local highlight = button:GetHighlightTexture()
	highlight:SetColorTexture(1, 1, 1, .3)
	highlight:SetInside()
end

local function SkinButton(button)
	S:HandleButton(button)
end

local Elements = {
	RCFrame = SkinFrame,
	RCButton = SkinButton,
	IconBordered = SkinIconBordered,
}

-- Every window, button and item icon goes through the addon's element factory
local function UI_New(ui, elementType)
	local skin = Elements[elementType]
	if not skin then return end

	local frames = ui:GetCreatedFramesOfType(elementType)
	local frame = frames[#frames]
	if frame and not frame.isSkinned then
		skin(frame)
		frame.isSkinned = true
	end
end

-- lib-st tables
local function SkinScrollTable(lib, _, _, _, _, parent)
	local parentName = parent and parent.GetName and parent:GetName()
	if not (parentName and strfind(parentName, '^RC')) then return end

	local frame = _G['ScrollTable' .. (lib.framecount - 1)]
	if not frame then return end

	frame:SetTemplate('Transparent')

	local name = frame:GetName()
	S:HandleScrollBar(_G[name .. 'ScrollFrameScrollBar'])
	_G[name .. 'ScrollTrough']:Hide()
	_G[name .. 'ScrollTroughBorder']:Hide()
end

-- LibDialog popups, the dialog frames and their widgets
local function Dialog_Reset(dialog)
	dialog:SetTemplate('Transparent')
end

local function SkinDialogs(lib)
	for _, dialog in next, lib.active_dialogs do
		if not dialog.isSkinned then
			Dialog_Reset(dialog)
			hooksecurefunc(dialog, 'Reset', Dialog_Reset)
			S:HandleCloseButton(dialog.close_button)

			dialog.isSkinned = true
		end

		for _, button in next, dialog.buttons or {} do
			S:HandleButton(button)
		end

		for _, editBox in next, dialog.editboxes or {} do
			S:HandleEditBox(editBox)
		end

		for _, checkBox in next, dialog.checkboxes or {} do
			S:HandleCheckBox(checkBox)
		end
	end
end

-- MSA dropdown menus
local function SkinDropDownLists()
	for level = 1, _G.MSA_DROPDOWNMENU_MAXLEVELS do
		local name = 'MSA_DropDownList' .. level
		local list = _G[name]

		if list and not list.isSkinned then
			for _, backdrop in next, { _G[name .. 'Backdrop'], _G[name .. 'MenuBackdrop'] } do
				if backdrop then
					backdrop:SetTemplate('Transparent')
				end
			end

			list.isSkinned = true
		end
	end
end

-- More info toggle on the voting and history frames
local function PageButton_SetTexture(button, texture)
	if type(texture) ~= 'string' or texture == E.Media.Textures.ArrowUp then return end

	local rotation = S.ArrowRotation[strfind(texture, 'PrevPage') and 'left' or 'right']

	button:SetNormalTexture(E.Media.Textures.ArrowUp)
	button:SetPushedTexture(E.Media.Textures.ArrowUp)

	for _, arrow in next, { button:GetNormalTexture(), button:GetPushedTexture() } do
		arrow:SetTexCoord(0, 1, 0, 1)
		arrow:SetRotation(rotation)
		arrow:SetInside(button, 5, 5)
	end
end

local function SkinPageButton(button, direction)
	if button.isSkinned then return end

	S:HandleButton(button)
	PageButton_SetTexture(button, direction == 'left' and 'PrevPage' or 'NextPage')

	hooksecurefunc(button, 'SetNormalTexture', PageButton_SetTexture)
	hooksecurefunc(button, 'SetPushedTexture', PageButton_SetTexture)

	button.isSkinned = true
end

local function SkinStatusBar(bar)
	if bar.backdrop then return end

	bar:SetStatusBarTexture(E.media.normTex)
	bar:CreateBackdrop('Transparent')
	E:RegisterStatusBar(bar)
end

-- Voting Frame
local function VotingFrame_GetFrame()
	local frame = _G.DefaultRCLootCouncilFrame
	if not frame then return end

	local db = _G.RCLootCouncil:Getdb().modules.RCVotingFrame
	SkinPageButton(frame.moreInfoBtn, db and db.moreInfo and 'left' or 'right')
end

-- Loot History
local function LootHistory_GetFrame()
	local frame = _G.DefaultRCLootHistoryFrame
	if not frame then return end

	SkinPageButton(frame.moreInfoBtn, 'left')
end

-- Responses popup on history entries
local function SessionData_GetFrame(sessionData)
	local frame = sessionData.frame
	if not frame or frame.isSkinned then return end

	if frame.NineSlice then
		frame.NineSlice:SetAlpha(0)
	end

	frame:SetTemplate('Transparent')

	frame.isSkinned = true
end

-- Session Setup
local function SessionFrame_GetFrame()
	local toggle = _G.DefaultRCSessionSetupFrameToggle
	if toggle then
		S:HandleCheckBox(toggle)
	end
end

-- Synchronizer
local function Sync_Spawn()
	local frame = _G.DefaultRCLootCouncilSyncFrame
	if frame then
		SkinStatusBar(frame.statusBar)
	end
end

-- Loot Frame entries
local function LootEntry_Update(entry)
	if entry.frame:GetBackdrop() then
		entry.frame:SetBackdrop({ edgeFile = E.media.blankTex, edgeSize = E.mult })
		entry.frame:SetBackdropBorderColor(0, 1, 1)
	end
end

local function SkinLootEntry(entry)
	entry.timeoutBar:SetStatusBarTexture(E.media.normTex)
	E:RegisterStatusBar(entry.timeoutBar)

	entry.noteEditbox:SetBackdrop(nil)
	S:HandleEditBox(entry.noteEditbox)

	LootEntry_Update(entry)
	hooksecurefunc(entry, 'Update', LootEntry_Update)
end

-- Entries are pooled
local function EntryManager_GetEntry(manager)
	for _, entry in ipairs(manager.entries) do
		if not entry.isSkinned then
			SkinLootEntry(entry)

			entry.isSkinned = true
		end
	end
end

local function HookModule(addon, name, method, func)
	local module = addon:GetModule(name, true)
	if module and module[method] then
		hooksecurefunc(module, method, func)
	end
end

local function Skin_RCLootCouncil()
	if not Private.Addon.db.profile.skins.RCLootCouncil then return end

	local addon = _G.RCLootCouncil
	if not addon then return end

	-- Element factory
	hooksecurefunc(addon.UI, 'New', UI_New)
	hooksecurefunc(addon.UI, 'NewNamed', UI_New)

	-- Tables
	local ScrollingTable = LibStub('ScrollingTable', true)
	if ScrollingTable then
		hooksecurefunc(ScrollingTable, 'CreateST', SkinScrollTable)
	end

	-- Popups
	local LibDialog = LibStub('LibDialog-1.1', true)
	if LibDialog then
		hooksecurefunc(LibDialog, 'Spawn', SkinDialogs)
	end

	-- Module specific widgets, everything else is covered by the hooks above
	HookModule(addon, 'RCVotingFrame', 'GetFrame', VotingFrame_GetFrame)
	HookModule(addon, 'RCLootHistory', 'GetFrame', LootHistory_GetFrame)
	HookModule(addon, 'RCSessionFrame', 'GetFrame', SessionFrame_GetFrame)
	HookModule(addon, 'Sync', 'Spawn', Sync_Spawn)

	local lootHistory = addon:GetModule('RCLootHistory', true)
	if lootHistory and lootHistory.SessionData then
		hooksecurefunc(lootHistory.SessionData, 'GetSessionResponsesFrame', SessionData_GetFrame)
	end

	local lootFrame = addon:GetModule('RCLootFrame', true)
	if lootFrame and lootFrame.EntryManager then
		hooksecurefunc(lootFrame.EntryManager, 'GetEntry', EntryManager_GetEntry)
	end

	-- Right click and filter menus
	if _G.MSA_DropDownMenu_CreateFrames then
		SkinDropDownLists()
		hooksecurefunc('MSA_DropDownMenu_CreateFrames', SkinDropDownLists)
	end
end

S:AddCallbackForAddon('RCLootCouncil', 'LuckyoneUI_RCLootCouncil', Skin_RCLootCouncil)
