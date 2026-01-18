-- Addon namespace
local _, Private = ...

-- ElvUI file
if not Private.ElvUI then
	return
end

-- Lua functions
local unpack = unpack

-- ElvUI modules
local E = unpack(ElvUI)
local S = E:GetModule('Skins')

function Private:Skin_LFGBulletinBoard()
	if not (Private.isClassic or Private.isTBC) and not Private.Addon.db.profile.skins.LFGBulletinBoard then return end

	if GroupBulletinBoardFrame and not GroupBulletinBoardFrame.isSkinned then
		-- Main Frame
		S:HandleFrame(GroupBulletinBoardFrame)

		-- Tabs
		S:HandleTab(GroupBulletinBoardFrameTab1)
		GroupBulletinBoardFrameTab1:ClearAllPoints()
		GroupBulletinBoardFrameTab1:Point('TOPLEFT', GroupBulletinBoardFrame, 'BOTTOMLEFT', -10, 0)

		if GroupBulletinBoardFrameTab2 then
			S:HandleTab(GroupBulletinBoardFrameTab2)
			GroupBulletinBoardFrameTab2:ClearAllPoints()
			GroupBulletinBoardFrameTab2:Point('LEFT', GroupBulletinBoardFrameTab1, 'RIGHT', -19, 0)
		end

		-- Edit Box
		S:HandleEditBox(GroupBulletinBoardFrameResultsFilter)
		GroupBulletinBoardFrameResultsFilter:Height(20)

		-- Close Button
		GroupBulletinBoardFrameHeaderContainerCloseButton:StripTextures()
		S:HandleCloseButton(GroupBulletinBoardFrameHeaderContainerCloseButton)

		-- Scroll Bars
		S:HandleScrollBar(GroupBulletinBoardFrame_ScrollFrameScrollBar)
		S:HandleTrimScrollBar(LFGBulletinBoardLFGToolFrame.scrollBar)

		GroupBulletinBoardFrame.isSkinned = true
	end
end

S:AddCallbackForAddon('LFGBulletinBoard', 'LuckyoneUI_LFGBulletinBoard', Private.Skin_LFGBulletinBoard)
