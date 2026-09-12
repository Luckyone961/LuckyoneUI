local _, Private = ...

if not Private.ElvUI then
	return
end

local next = next
local unpack = unpack

local hooksecurefunc = hooksecurefunc

local LibStub = LibStub

local _G = _G

local E = unpack(ElvUI)
local S = E:GetModule('Skins')

local function SkinDropDownLists(lib)
	for level = 1, lib.UIDROPDOWNMENU_MAXLEVELS do
		local name = 'ElioteDDM_DropDownList' .. level
		local list = _G[name]

		if list and not list.isSkinned then
			for _, backdrop in next, { _G[name .. 'Backdrop'], _G[name .. 'MenuBackdrop'] } do
				backdrop:SetTemplate('Transparent')
			end

			list.isSkinned = true
		end
	end
end

local function SkinSquareButton(button)
	S:HandleButton(button)
	button.icon:SetDrawLayer('OVERLAY')
end

local function SkinRows(scrollFrame)
	local buttons = scrollFrame.buttons
	if not buttons then return end

	local r, g, b = unpack(E.media.rgbvaluecolor)

	for _, button in next, buttons do
		if not button.isSkinned then
			S:HandleCheckBox(button.EnabledButton)

			button.HighlightTexture:SetColorTexture(r, g, b, .25)
			button.PushedTexture:SetColorTexture(r, g, b, .1)

			button.isSkinned = true
		end
	end
end

local function SkinScrollFrame(scrollFrame)
	S:HandleScrollBar(scrollFrame.ScrollBar)

	SkinRows(scrollFrame)
	hooksecurefunc(scrollFrame, 'update', function() SkinRows(scrollFrame) end)
end

local function SkinProfilerFrame(frame)
	local r, g, b = unpack(E.media.bordercolor)

	frame.Divider:SetColorTexture(r, g, b)
	frame.Divider:Height(1)

	r, g, b = unpack(E.media.rgbvaluecolor)

	for _, button in next, { frame.Left.CurrentCPUButton, frame.Left.AverageCPUButton, frame.Right.EncounterCPUButton, frame.Right.PeakCPUButton } do
		button:GetHighlightTexture():SetColorTexture(r, g, b, .25)
	end
end

local function SkinSimpleAddonManager(frame)
	if frame.isSkinned then return end

	-- Main Frame
	S:HandleFrame(frame)

	-- Header
	S:HandleDropDownBox(frame.CharacterDropDown, 120)
	S:HandleButton(frame.SetsButton)
	S:HandleEditBox(frame.SearchBox)

	SkinSquareButton(frame.ResultOptionsButton)
	SkinSquareButton(frame.ConfigButton)
	SkinSquareButton(frame.CategoryButton)

	-- Bottom Buttons
	for _, button in next, { frame.EnableAllButton, frame.DisableAllButton, frame.OkButton, frame.CancelButton } do
		S:HandleButton(button)
	end

	-- Category Frame
	local categoryFrame = frame.CategoryFrame

	for _, button in next, { categoryFrame.NewButton, categoryFrame.SelectAllButton, categoryFrame.ClearSelectionButton } do
		S:HandleButton(button)
	end

	-- Addon and Category Lists
	SkinScrollFrame(frame.AddonListFrame.ScrollFrame)
	SkinScrollFrame(categoryFrame.ScrollFrame)

	-- CPU Profiler
	SkinProfilerFrame(frame.ProfilerFrame)

	-- Dropdown Menus
	local EDDM = LibStub('ElioteDropDownMenu-1.0', true)
	if EDDM then
		SkinDropDownLists(EDDM)
		hooksecurefunc(EDDM, 'UIDropDownMenu_CreateFrames', function() SkinDropDownLists(EDDM) end)
	end

	frame.isSkinned = true
end

local function Skin_SimpleAddonManager()
	if not Private.Addon.db.profile.skins.SimpleAddonManager then return end

	local frame = _G.SimpleAddonManager
	if not frame then return end

	frame:HookScript('OnShow', SkinSimpleAddonManager)
end

S:AddCallbackForAddon('SimpleAddonManager', 'LuckyoneUI_SimpleAddonManager', Skin_SimpleAddonManager)
