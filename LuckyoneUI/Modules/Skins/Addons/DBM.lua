local _, Private = ...

if not Private.ElvUI then
	return
end

local next = next
local select = select
local unpack = unpack

local hooksecurefunc = hooksecurefunc
local RunNextFrame = RunNextFrame

local _G = _G

local E = unpack(ElvUI)
local S = E:GetModule('Skins')

local lastWidgetID = 0
local profilePopup

local function Area_BackdropColor(area)
	area:SetBackdropColor(0, 0, 0, 0.25)
end

-- Option groups and spell groups (TooltipBorderBackdropTemplate)
local function SkinArea(area)
	area.NineSlice:SetAlpha(0)
	area.callbackBackdropColor = Area_BackdropColor
	area:SetTemplate('Transparent')

	if area.mytype == 'ability' then
		local name = area:GetName()
		local toggle = _G[name..'Button'].toggle
		S:HandleCollapseTexture(toggle, true)
		toggle:SetHighlightTexture(E.ClearTexture)

		toggle:SetPushedTexture(E.ClearTexture)

		for _, suffix in next, { 'Rename', 'RenameReset', 'SpellTest' } do
			local button = _G[name..suffix]
			if button then
				S:HandleButton(button)
			end
		end
	end
end

local function SkinColorSelect(button)
	for _, region in next, { button:GetRegions() } do
		if region:IsObjectType('Texture') then
			if region:GetDrawLayer() == 'OVERLAY' then
				region:SetTexture(E.media.blankTex)
				region:Size(16)
				region:CreateBackdrop()
			else
				region:Hide()
			end
		end
	end
end

local function SkinWidget(widget)
	local widgetType = widget.mytype

	if widgetType == 'area' or widgetType == 'ability' then
		SkinArea(widget)
	elseif widgetType == 'checkbutton' then
		S:HandleCheckBox(widget)
	elseif widgetType == 'dropdown2' then
		S:HandleDropDownBox(widget, widget:GetWidth())
	elseif widgetType == 'slider' then
		S:HandleSliderFrame(widget)
		S:HandleEditBox(widget.editbox)
	elseif widgetType == 'textbox' then
		S:HandleEditBox(widget)
	elseif widget.SetColorRGB then
		SkinColorSelect(widget)
	elseif widget:IsObjectType('Button') then
		-- Buttons, note buttons and the color Reset buttons
		S:HandleButton(widget)
	end
end

local function SkinNewWidgets()
	for id = lastWidgetID + 1, _G.DBM_GUI:GetCurrentID() do
		lastWidgetID = id
		local widget = _G['DBM_GUI_Option_'..id] or _G['DBM_GUI_DropDown'..id]
		if widget then
			SkinWidget(widget)
		end
	end
end

-- Minimal tabs, top tabs on Retail
local function SkinTab(tab)
	tab:StripTextures(nil, true)
	tab:CreateBackdrop('Transparent')
	tab.backdrop:Point('TOPLEFT', 1, -10)
	tab.backdrop:Point('BOTTOMRIGHT', -1, Private.isRetail and -2 or -1)

	if Private.isRetail then
		tab.selectedTextY = -1
		tab.deselectedTextY = 0
	end
end

local function SkinOptionsFrame(frame)
	S:HandleFrame(frame, true)
	S:HandleCloseButton(_G.DBM_GUI_OptionsFrameClosePanelButton)

	for _, button in next, { _G.DBM_GUI_OptionsFrameCollapseButton, _G.DBM_GUI_OptionsFrameOkay, _G.DBM_GUI_OptionsFrameWebsiteButton } do
		S:HandleButton(button)
	end

	-- Tabs, search box and Clear button
	for i = 1, #frame.tabs do
		SkinTab(_G['DBM_GUI_OptionsFrameTab'..i])
	end

	S:HandleEditBox(frame.searchBox)
	S:HandleButton(frame.searchClearButton)
	frame.searchClearButton:Point('LEFT', frame.searchBox, 'RIGHT', 5, 0)

	-- Category list and panels
	local list = _G.DBM_GUI_OptionsFrameList
	local container = _G.DBM_GUI_OptionsFramePanelContainer
	local wrapper = list:GetParent()
	wrapper:SetTemplate('Transparent')
	wrapper:Point('TOPLEFT', 15, -64)

	-- Divider
	for _, region in next, { wrapper:GetRegions() } do
		if select(2, region:GetPoint()) == list then
			region:SetColorTexture(unpack(E.media.bordercolor))
			region:SetVertexColor(1, 1, 1)
			region:ClearAllPoints()
			region:Point('TOPLEFT', container, 'TOPLEFT', 0, 1)
			region:Point('BOTTOMRIGHT', container, 'BOTTOMLEFT', 1, -1)
		end
	end

	S:HandleScrollBar(_G.DBM_GUI_OptionsFrameListScrollBar)

	-- Category rows
	local r, g, b = unpack(E.media.rgbvaluecolor)
	for _, button in next, list.buttons do
		local highlight = button:GetHighlightTexture()
		highlight:SetColorTexture(r, g, b, 0.25)
		highlight:SetVertexColor(1, 1, 1)

		local toggle = button.toggle
		S:HandleBlizzardRegions(toggle)
		toggle:SetHighlightTexture(E.ClearTexture)
		toggle:SetNormalTexture(E.Media.Textures.PlusButton)
		S:HandleCollapseTexture(toggle, true)
	end

	local scrollBar = _G.DBM_GUI_OptionsFramePanelContainerFOVScrollBar
	for _, child in next, { scrollBar:GetChildren() } do
		if not child:IsObjectType('Button') then
			child:Hide()
		end
	end

	S:HandleScrollBar(scrollBar)
end

-- Copy link dialog, note editor, import and export popup, Midnight setup wizard
local function SkinDialog(frame)
	if frame.IsSkinned then return end

	for _, child in next, { frame:GetChildren() } do
		if child:IsObjectType('EditBox') then
			child:StripTextures()
			S:HandleEditBox(child)

			child.backdrop:Point('TOPLEFT', -4, -6)
			child.backdrop:Point('BOTTOMRIGHT', 4, 6)
		elseif child:IsObjectType('ScrollFrame') then
			S:HandleScrollBar(child.ScrollBar)
		elseif child:IsObjectType('CheckButton') then
			S:HandleCheckBox(child)
		elseif child:IsObjectType('DropdownButton') then
			S:HandleDropDownBox(child, child:GetWidth())
		elseif child:IsObjectType('Button') then
			S:HandleButton(child)
		else
			-- Import and export text area box
			child:SetTemplate()
		end
	end

	frame:SetTemplate('Transparent')
	frame.IsSkinned = true
end

-- Import and export popup, created on the first export or import
local function SkinProfilePopup()
	if profilePopup then return end

	for _, child in next, { _G.UIParent:GetChildren() } do
		if not child:IsForbidden() and child.import and child.SetFooterText then
			profilePopup = child
			SkinDialog(child)
			break
		end
	end
end

-- Refresh icon inside a button border
local function SkinRefreshButton(button)
	S:HandleButton(button, nil, nil, nil, nil, nil, nil, true)

	local icon = button:GetNormalTexture()
	if not icon then return end

	icon:SetInside()
	button:SetPushedTexture(icon:GetTexture())
	button:GetPushedTexture():SetInside()
end

-- Raid Checks and Keystones windows (DefaultPanelTemplate with bottom tabs)
local function SkinToolWindow(frame)
	S:HandleFrame(frame)

	-- Classic keeps a title bar texture
	frame.TitleContainer:StripTextures()

	for _, child in next, { frame:GetChildren() } do
		if child:IsObjectType('ScrollFrame') then
			S:HandleTrimScrollBar(child.ScrollBar)
		elseif child:IsObjectType('Button') and not (child.LeftActive or child.LeftDisabled) then
			if child:GetScript('OnClick') == _G.UIPanelCloseButton_OnClick then
				S:HandleCloseButton(child)
			elseif child.Left then
				-- Gear tab Group and Guild buttons
				S:HandleButton(child)
				child:StyleButton(nil, true, true)
			else
				SkinRefreshButton(child)
			end
		end
	end

	local inset = Private.isModern and 3 or 10
	local lastTab

	-- Classic Raid Checks tabs use TabButtonTemplate
	local tabs = frame.Tabs
	local name = frame:GetName()

	for i = 1, frame.numTabs do
		local tab = tabs and tabs[i] or _G[name..'Tab'..i]
		S:HandleTab(tab)
		tab:ClearAllPoints()

		if lastTab then
			tab:Point('TOPLEFT', lastTab, 'TOPRIGHT', 1 - inset * 2, 0)
		else
			tab:Point('TOPLEFT', frame, 'BOTTOMLEFT', -inset, 0)
		end

		lastTab = tab
	end
end

local function RaidChecks_Show()
	local frame = _G.DBMRaidChecksFrame
	if not frame or frame.IsSkinned then return end

	SkinToolWindow(frame)
	frame.IsSkinned = true
end

-- Midnight setup wizard (Retail)
local function MidnightPopup_ShowMidnightPopup()
	local frame = select(-1, _G.UIParent:GetChildren())
	if not frame:IsForbidden() and frame.button then
		SkinDialog(frame)
	end
end

local function Skin_DBMCore()
	if not Private.Addon.db.profile.skins.DBM then return end

	local DBM = _G.DBM
	if not DBM then return end

	-- Raid Checks window
	if DBM.RaidChecks then
		hooksecurefunc(DBM.RaidChecks, 'Show', RaidChecks_Show)
	end

	-- Keystones window and Midnight setup wizard, Retail only
	local keystones = _G.DBMKeystonesFrame
	if keystones then
		SkinToolWindow(keystones)
	end

	if DBM.MidnightPopup then
		hooksecurefunc(DBM.MidnightPopup, 'ShowMidnightPopup', MidnightPopup_ShowMidnightPopup)
	end

	-- Copy link dialog and note editor
	hooksecurefunc(DBM, 'ShowUpdateReminder', function() SkinDialog(_G.DBMUpdateReminder) end)
	hooksecurefunc(DBM, 'ShowNoteEditor', function() SkinDialog(_G.DBMNotesEditor) end)
	hooksecurefunc(DBM, 'ShowTextEditor', function() SkinDialog(_G.DBMNotesEditor) end)
end

local function Skin_DBMGUI()
	if not Private.Addon.db.profile.skins.DBM then return end

	local frame = _G.DBM_GUI_OptionsFrame
	if not frame then return end

	SkinOptionsFrame(frame)

	-- Widgets only once DBM filled their panel
	hooksecurefunc(frame, 'DisplayFrame', SkinNewWidgets)

	local DBM_GUI = _G.DBM_GUI
	hooksecurefunc(DBM_GUI, 'CreateExportProfile', SkinProfilePopup)
	hooksecurefunc(DBM_GUI, 'CreateImportProfile', SkinProfilePopup)

	-- First pass over the static panels
	RunNextFrame(SkinNewWidgets)
end

S:AddCallbackForAddon('DBM-Core', 'LuckyoneUI_DBMCore', Skin_DBMCore)
S:AddCallbackForAddon('DBM-GUI', 'LuckyoneUI_DBMGUI', Skin_DBMGUI)
