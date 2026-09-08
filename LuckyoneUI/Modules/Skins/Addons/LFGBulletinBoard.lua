local _, Private = ...

if not Private.ElvUI or not (Private.isClassic or Private.isTBC) then
	return
end

local unpack = unpack

local E = unpack(ElvUI)
local S = E:GetModule('Skins')

local function Skin_LFGBulletinBoard()
	if not Private.Addon.db.profile.skins.LFGBulletinBoard then return end

	local frame = GroupBulletinBoardFrame
	if not frame or frame.isSkinned then return end

	-- Main Frame
	S:HandleFrame(frame)

	-- Tabs
	local tab1 = GroupBulletinBoardFrameTab1
	S:HandleTab(tab1)
	tab1:ClearAllPoints()
	tab1:Point('TOPLEFT', frame, 'BOTTOMLEFT', -10, 0)

	local tab2 = GroupBulletinBoardFrameTab2
	if tab2 then
		S:HandleTab(tab2)
		tab2:ClearAllPoints()
		tab2:Point('LEFT', tab1, 'RIGHT', -19, 0)
	end

	-- Edit Box
	local filter = GroupBulletinBoardFrameResultsFilter
	S:HandleEditBox(filter)
	filter:Height(20)

	-- Close Button
	local closeButton = GroupBulletinBoardFrameHeaderContainerCloseButton
	closeButton:StripTextures()
	S:HandleCloseButton(closeButton)

	-- Scroll Bars
	S:HandleScrollBar(GroupBulletinBoardFrame_ScrollFrameScrollBar)
	S:HandleTrimScrollBar(LFGBulletinBoardLFGToolFrame.scrollBar)

	frame.isSkinned = true
end

S:AddCallbackForAddon('LFGBulletinBoard', 'LuckyoneUI_LFGBulletinBoard', Skin_LFGBulletinBoard)
