local _, Private = ...

if not Private.ElvUI then
	return
end

local next = next
local unpack = unpack

local hooksecurefunc = hooksecurefunc

local _G = _G

local E = unpack(ElvUI)
local S = E:GetModule('Skins')

local function LayoutTabs(frame, position)
	local lastTab
	for _, tab in next, frame.Tabs do
		tab:ClearAllPoints()

		if not lastTab then
			if position == 'top' then
				tab:Point('BOTTOMLEFT', frame, 'TOPLEFT', -10, 0)
			else
				tab:Point('TOPLEFT', frame, 'BOTTOMLEFT', -10, 0)
			end
		else
			tab:Point('TOPLEFT', lastTab, 'TOPRIGHT', -19, 0)
		end

		lastTab = tab
	end
end

local function Skin_LFGBulletinBoard()
	if not Private.Addon.db.profile.skins.LFGBulletinBoard then return end

	local addon = _G.GroupBulletinBoard_Addon

	-- Main Frame
	local frame = _G.GroupBulletinBoardFrame
	S:HandleFrame(frame)
	_G.GroupBulletinBoardFrameBackdrop:Kill()

	-- Tabs
	for _, tab in next, frame.Tabs do
		S:HandleTab(tab)
	end

	LayoutTabs(frame, frame.Tabs[1].position)
	hooksecurefunc(addon.Tool, 'ChangeTabPositions', LayoutTabs)

	-- Header
	local header = _G.GroupBulletinBoardFrameHeaderContainer
	for _, button in next, { header.CloseButton, header.SettingsButton, header.RefreshButton } do
		S:HandleButton(button)
	end

	-- Footer
	local footer = _G.GroupBulletinBoardFrameFooterContainer
	S:HandleButton(footer.AnnounceChannelSelect)
	S:HandleButton(footer.AnnounceButton)
	S:HandleEditBox(footer.AnnounceInput)

	-- Chat Requests Tab
	local filter = _G.GroupBulletinBoardFrameResultsFilter
	S:HandleEditBox(filter)
	filter:Height(20)

	_G.GroupBulletinBoardFrame_ScrollFrameBackdrop:Kill()
	S:HandleScrollBar(_G.GroupBulletinBoardFrame_ScrollFrameScrollBar)

	-- LFG Tool Tab
	local tool = addon.LfgTool
	tool.CategoryButton:Height(20)
	S:HandleDropDownBox(tool.CategoryButton.Dropdown, 150)
	S:HandleTrimScrollBar(tool.ScrollContainer.scrollBar)
end

S:AddCallbackForAddon('LFGBulletinBoard', 'LuckyoneUI_LFGBulletinBoard', Skin_LFGBulletinBoard)
