local _, Private = ...

if not Private.ElvUI then
	return
end

-- We only skin two parts of BigWigs
-- The /keys frame and the queue timer on popups
-- Bars, messages, options and plugins remain untouched

local next = next
local unpack = unpack

local _G = _G

local E = unpack(ElvUI)
local S = E:GetModule('Skins')

-- Stretched to the ready dialog width
local function SkinQueueTimer(bar)
	local dialog = _G.LFGDungeonReadyDialog

	bar:StripTextures()
	bar:SetStatusBarTexture(E.media.normTex)
	bar:SetStatusBarColor(0.294, 0.922, 0.173)
	bar:CreateBackdrop('Transparent')
	E:RegisterStatusBar(bar)

	bar:ClearAllPoints()
	bar:Point('TOPLEFT', dialog, 'BOTTOMLEFT', E.Border, -(E.Border * 2 + E.Spacing))
	bar:Point('TOPRIGHT', dialog, 'BOTTOMRIGHT', -E.Border, -(E.Border * 2 + E.Spacing))
	bar:Height(15)

	bar.text:FontTemplate()
	bar.text:Point('CENTER', 0, 1)
end

-- BigWigs announces the bar through its own message system
local function BigWigs_FrameCreated(_, frame, name)
	if name == 'QueueTimer' then
		SkinQueueTimer(frame)
	end
end

-- /keys main frame
local function SkinPanel(panel)
	if panel.isSkinned then return end

	S:HandlePortraitFrame(panel)
	panel.PortraitContainer:Hide()

	panel.isSkinned = true
end

local function SkinCells(scrollChild)
	-- Solid backdrop on the entry cells for better readability
	for _, cell in next, { scrollChild:GetChildren() } do
		if cell.bg and not cell.backdrop then
			cell.bg:Hide()
			cell:CreateBackdrop()
		end
	end
end

-- The cell pool grows with the list, the height update after each build catches new ones
local function SkinScrollFrame(scrollFrame)
	if scrollFrame.isSkinned then return end

	S:HandleTrimScrollBar(scrollFrame.ScrollBar)

	local scrollChild = scrollFrame:GetScrollChild()
	SkinCells(scrollChild)
	scrollChild:HookScript('OnSizeChanged', SkinCells)

	scrollFrame.isSkinned = true
end

-- Reposition tabs and match tab spacing of our other skins, tabs are expected in display order
local function SkinTabs(panel, tabs)
	for i = 1, #tabs do
		local tab = tabs[i]
		S:HandleTab(tab)
		tab:ClearAllPoints()

		if i == 1 then
			tab:Point('TOPLEFT', panel, 'BOTTOMLEFT', -3, 0)
		else
			tab:Point('TOPLEFT', tabs[i - 1], 'TOPRIGHT', -5, 0)
		end
	end
end

local function SkinTip(tip)
	if tip.isSkinned then return end

	tip:StripTextures()
	tip:SetTemplate('Transparent')

	for _, arrow in next, { tip:GetChildren() } do
		arrow:Hide()
	end

	tip.isSkinned = true
end

-- /keys frame and childs are unnamed, look for BigWigs Keystones title
local function FindKeystonesPanel()
	local L = _G.BigWigsAPI:GetLocale('BigWigs')

	for _, child in next, { _G.UIParent:GetChildren() } do
		if not child:IsForbidden() then
			local title = child.TitleContainer and child.TitleContainer.TitleText
			if title and title:GetText() == L.keystoneTitle then
				return child
			end
		end
	end
end

local function SkinKeystonesPanel(panel)
	SkinPanel(panel)
	SkinTip(panel.tip)

	local tabs = {}

	for _, child in next, { panel:GetChildren() } do
		if child:IsObjectType('ScrollFrame') then
			SkinScrollFrame(child)
		elseif child.LeftActive then
			tabs[#tabs + 1] = child
		end
	end

	SkinTabs(panel, tabs)
end

local function Skin_BigWigs()
	if not Private.Addon.db.profile.skins.BigWigs then return end

	local BigWigsLoader = _G.BigWigsLoader
	if not BigWigsLoader then return end

	-- Skin queue timer bar
	BigWigsLoader.RegisterMessage({}, 'BigWigs_FrameCreated', BigWigs_FrameCreated)

	-- Skin /keys frame
	if Private.isRetail then
		local panel = FindKeystonesPanel()
		if panel then
			SkinKeystonesPanel(panel)
		end
	end
end

S:AddCallbackForAddon('BigWigs', 'LuckyoneUI_BigWigs', Skin_BigWigs)
