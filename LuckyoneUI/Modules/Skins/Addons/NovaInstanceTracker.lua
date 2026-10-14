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

-- Windows built on NIT_InputScrollFrameTemplate
local function SkinScrollWindow(frame, close)
	frame:SetBackdrop()
	S:HandleFrame(frame, true, nil, -8, 8, 8, -8)
	S:HandleScrollBar(frame.ScrollBar)

	-- Most close buttons are only 20px, keep their full hit area
	S:HandleCloseButton(close)
	close:SetHitRectInsets(0, 0, 0, 0)
end

-- Lockouts and Level Log windows
local function SkinSimpleScrollWindow(frame, scrollTop)
	S:HandleFrame(frame)

	local scrollBar = frame.scrollFrame.ScrollBar
	S:HandleScrollBar(scrollBar)
	scrollBar:ClearAllPoints()
	scrollBar:Point('TOPRIGHT', frame, 'TOPRIGHT', -5, scrollTop)
	scrollBar:Point('BOTTOMRIGHT', frame, 'BOTTOMRIGHT', -5, 22)

	S:HandleCloseButton(frame.close)
	frame.close:SetHitRectInsets(0, 0, 0, 0)
end

-- Delete buttons
local function SkinRemoveButton(button)
	S:HandleButton(button, nil, nil, nil, nil, nil, nil, true)

	local icon = button:GetNormalTexture()
	icon:SetInside()
	button:SetPushedTexture(icon:GetTexture())
	button:GetPushedTexture():SetInside()

	S:HandleFrame(button.tooltip)
end

-- Filter checkboxes and the character dropdown
local function NIT_OpenInstanceLogFrame(addon)
	local menu = addon.instanceFrameSelectAltMenu
	if menu.IsSkinned then return end

	for _, checkbox in next, { addon.instanceFramePvpButton, addon.instanceFramePveButton, addon.instanceFrameShowsAltsButton } do
		S:HandleCheckBox(checkbox)
	end

	S:HandleDropDownBox(menu, 160, nil, true)
	S:HandleFrame(menu.tooltip)

	menu.IsSkinned = true
end

local function NIT_CreateInstanceLineFrame(_, index)
	local line = _G[index..'NITInstanceLine']

	S:HandleFrame(line.tooltip)
	SkinRemoveButton(line.removeButton)
end

-- Format checkboxes and the records slider
local function NIT_OpenTradeCopyFrame(addon)
	local slider = addon.copyTradeRecordsSlider
	if slider.IsSkinned then return end

	for _, checkbox in next, { addon.copyTradeTimeButton, addon.copyTradeZoneButton, addon.copyTradeTimeAgoButton } do
		S:HandleCheckBox(checkbox)
	end

	S:HandleSliderFrame(slider)

	slider.IsSkinned = true
end

-- Rested filter, level slider and the Season of Discovery loot button
local function NIT_OpenAltsFrame(addon)
	local slider = addon.charsMinLevelSlider
	if slider.IsSkinned then return end

	S:HandleCheckBox(addon.altsFrameCheckbox)
	S:HandleSliderFrame(slider)

	if addon.altsLootReminderButton then
		S:HandleButton(addon.altsLootReminderButton)
	end

	slider.IsSkinned = true
end

-- NIT runs this for every line on each open of the window
local function NIT_CreateAltsLineFrame(_, index)
	local line = _G[index..'NITAltsLine']
	if line.IsSkinned then return end

	S:HandleFrame(line.tooltip)
	SkinRemoveButton(line.removeButton)

	local levelLog = line.levelLogButton
	S:HandleButton(levelLog)
	S:HandleFrame(levelLog.tooltip)

	line.IsSkinned = true
end

-- Lockouts window, built on its first open
local function NIT_CreateSimpleScrollFrame(_, name)
	SkinSimpleScrollWindow(_G[name], -44)
end

local function LevelLog_CreateSimpleLineFrame(index)
	S:HandleFrame(_G['NITLevelLogFrameLineTooltip'..index])
end

-- Level Log window, built on its first open
local function NIT_CreateLevelLogFrame()
	local frame = _G.NITLevelLogFrame
	SkinSimpleScrollWindow(frame, -22)

	-- Title bar above the window
	local topFrame = frame.topFrame
	topFrame:SetBackdrop()
	S:HandleFrame(topFrame, true)
	topFrame.backdrop:Point('BOTTOMRIGHT', frame, 'TOPRIGHT', 0, -1)

	hooksecurefunc(frame, 'createSimpleLineFrame', LevelLog_CreateSimpleLineFrame)
end

local function Skin_NovaInstanceTracker()
	if not Private.Addon.db.profile.skins.NovaInstanceTracker then return end

	local addon = LibStub('AceAddon-3.0'):GetAddon('NovaInstanceTracker', true)
	if not addon then return end

	-- Instance Log
	SkinScrollWindow(_G.NITInstanceFrame, _G.NITInstanceFrameClose)
	S:HandleFrame(_G.NITInstanceDragTooltip)

	for _, button in next, { _G.NITInstanceFrameRestedButton, _G.NITInstanceFrameConfButton, _G.NITInstanceFrameLockoutsButton, _G.NITInstanceFrameTradesButton } do
		S:HandleButton(button)
	end

	-- Your Characters overlapped Options by 2px
	_G.NITInstanceFrameRestedButton:Height(23)

	-- Post Stats popup on a line click
	_G.NITPostInstanceStatsFrame:SetTemplate()

	SkinScrollWindow(_G.NITInstanceFrameDC, _G.NITInstanceDCFrameClose)
	S:HandleButton(_G.NITInstanceFrameDCDelete)

	hooksecurefunc(addon, 'openInstanceLogFrame', NIT_OpenInstanceLogFrame)
	hooksecurefunc(addon, 'createInstanceLineFrame', NIT_CreateInstanceLineFrame)

	-- Copy Paste window
	local copyFrame = _G.NITCopyFrame
	copyFrame:SetBackdrop()
	S:HandleFrame(copyFrame, true, nil, -8, 26, 8, -27)
	S:HandleScrollBar(copyFrame.ScrollBar)
	S:HandleButton(_G.NITCopyFrameBottomButton)
	_G.NITCopyFrameTopBar:StripTextures()

	-- Trade Log
	SkinScrollWindow(_G.NITTradeLogFrame, _G.NITTradeLogFrameClose)
	S:HandleFrame(_G.NITTradeLogDragTooltip)
	S:HandleButton(_G.NITTradeLogFrameResetButton)
	S:HandleButton(_G.NITTradeFrameCopyButton)

	-- Trade Copy window
	local tradeCopy = _G.NITTradeCopyFrame
	SkinScrollWindow(tradeCopy, _G.NITTradeCopyFrameClose)

	local tradeCopyOptions = _G.NITTradeCopyDragFrame
	tradeCopyOptions:SetTemplate('Transparent')
	tradeCopyOptions:ClearAllPoints()
	tradeCopyOptions:Point('BOTTOM', tradeCopy.backdrop, 'TOP', 0, 1)

	hooksecurefunc(addon, 'openTradeCopyFrame', NIT_OpenTradeCopyFrame)

	-- Your Characters
	SkinScrollWindow(_G.NITAltsFrame, _G.NITAltsFrameClose)
	S:HandleFrame(_G.NITAltsDragTooltip)

	SkinScrollWindow(_G.NITCharsFrameDC, _G.NITCharsDCFrameClose)
	S:HandleButton(_G.NITCharsFrameDCDelete)

	hooksecurefunc(addon, 'openAltsFrame', NIT_OpenAltsFrame)
	hooksecurefunc(addon, 'createAltsLineFrame', NIT_CreateAltsLineFrame)

	-- Lockouts and Level Log
	hooksecurefunc(addon, 'createSimpleScrollFrame', NIT_CreateSimpleScrollFrame)
	hooksecurefunc(addon, 'createLevelLogFrame', NIT_CreateLevelLogFrame)
end

S:AddCallbackForAddon('NovaInstanceTracker', 'LuckyoneUI_NovaInstanceTracker', Skin_NovaInstanceTracker)
