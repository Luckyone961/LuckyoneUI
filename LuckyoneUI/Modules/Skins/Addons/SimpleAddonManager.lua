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

local function SkinRows(scrollFrame)
	local buttons = scrollFrame.buttons
	if not buttons then return end

	local r, g, b = unpack(E.media.rgbvaluecolor)

	for _, button in next, buttons do
		if not button.isSkinned then
			S:HandleCheckBox(button.EnabledButton)

			button.HighlightTexture:SetColorTexture(r, g, b, 0.25)
			button.PushedTexture:SetColorTexture(r, g, b, 0.1)

			-- Dependency tree view expand/collapse (addon list rows only)
			local expandButton = button.ExpandOrCollapseButton
			if expandButton then
				S:HandleCollapseTexture(expandButton, nil, true)
				expandButton:SetHighlightTexture(E.ClearTexture)
			end

			button.isSkinned = true
		end
	end
end

local function SkinScrollFrame(scrollFrame)
	S:HandleScrollBar(scrollFrame.ScrollBar)

	SkinRows(scrollFrame)
	hooksecurefunc(scrollFrame, 'update', function() SkinRows(scrollFrame) end)
end

-- Shrink the 20px title icons to 16px so they stay inside the 20px rows
local function ResizeAddonIcons(scrollFrame)
	for _, button in next, scrollFrame.buttons do
		local text = button.Name:GetText()
		if text then
			button.Name:SetText((text:gsub('^(|[TA][^|]-):20:20:', '%1:16:16:', 1)))
		end
	end
end

local function SkinProfilerFrame(frame)
	local r, g, b = unpack(E.media.bordercolor)

	frame.Divider:SetColorTexture(r, g, b)
	frame.Divider:Height(1)

	r, g, b = unpack(E.media.rgbvaluecolor)

	for _, button in next, { frame.Left.CurrentCPUButton, frame.Left.AverageCPUButton, frame.Right.EncounterCPUButton, frame.Right.PeakCPUButton } do
		button:GetHighlightTexture():SetColorTexture(r, g, b, 0.25)
	end
end

local function SkinSimpleAddonManager(frame)
	if frame.isSkinned then return end

	-- Main Frame
	S:HandleFrame(frame)

	-- Header
	S:HandleDropDownBox(frame.CharacterDropDown, 120)
	S:HandleEditBox(frame.SearchBox)

	for _, button in next, { frame.ResultOptionsButton, frame.ConfigButton, frame.CategoryButton } do
		S:HandleButton(button)
		button.icon:SetDrawLayer('OVERLAY')
	end

	-- Header, bottom and category frame buttons
	local categoryFrame = frame.CategoryFrame

	for _, button in next, { frame.SetsButton, frame.EnableAllButton, frame.DisableAllButton, frame.OkButton, frame.CancelButton, categoryFrame.NewButton, categoryFrame.SelectAllButton, categoryFrame.ClearSelectionButton } do
		S:HandleButton(button)
	end

	-- Addon and Category Lists
	local addonScrollFrame = frame.AddonListFrame.ScrollFrame
	SkinScrollFrame(addonScrollFrame)
	SkinScrollFrame(categoryFrame.ScrollFrame)

	ResizeAddonIcons(addonScrollFrame)
	hooksecurefunc(addonScrollFrame, 'update', function() ResizeAddonIcons(addonScrollFrame) end)

	-- CPU Profiler
	SkinProfilerFrame(frame.ProfilerFrame)

	frame.isSkinned = true
end

local function Skin_SimpleAddonManager()
	if not Private.Addon.db.profile.skins.SimpleAddonManager then return end

	local frame = _G.SimpleAddonManager
	if not frame then return end

	frame:HookScript('OnShow', SkinSimpleAddonManager)

	-- Dropdown Menus (also opened by the minimap button without the main frame)
	local EDDM = LibStub('ElioteDropDownMenu-1.0', true)
	if EDDM then
		SkinDropDownLists(EDDM)
		hooksecurefunc(EDDM, 'UIDropDownMenu_CreateFrames', function() SkinDropDownLists(EDDM) end)
	end
end

S:AddCallbackForAddon('SimpleAddonManager', 'LuckyoneUI_SimpleAddonManager', Skin_SimpleAddonManager)
