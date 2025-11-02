-- Addon namespace
local _, Private = ...

-- ElvUI file
if not Private.ElvUI then
	return
end

-- Lua functions
local pairs = pairs
local select = select
local unpack = unpack

-- API cache
local hooksecurefunc = hooksecurefunc

-- ElvUI modules
local E = unpack(ElvUI)
local S = E:GetModule('Skins')

function Private:Skin_BugSack()
	if not Private.Addon.db.profile.skins.BugSack then return end

	hooksecurefunc(BugSack, 'OpenSack', function()
		if BugSack.Skinned then return end

		-- Main Frame
		S:HandleFrame(BugSackFrame)

		-- Scroll Frame
		S:HandleScrollBar(BugSackScrollScrollBar)

		-- Buttons
		local buttonHeight = 24
		S:HandleButton(BugSackNextButton)
		S:HandleButton(BugSackSendButton)
		S:HandleButton(BugSackPrevButton)
		BugSackNextButton:Height(buttonHeight)
		BugSackSendButton:Height(buttonHeight)
		BugSackPrevButton:Height(buttonHeight)

		BugSackPrevButton:ClearAllPoints()
		BugSackPrevButton:Point('BOTTOMLEFT', BugSackFrame, 'BOTTOMLEFT', 12, 6)
		BugSackNextButton:ClearAllPoints()
		BugSackNextButton:Point('BOTTOMRIGHT', BugSackFrame, 'BOTTOMRIGHT', -12, 6)

		-- Tabs
		S:HandleTab(BugSackTabAll)
		S:HandleTab(BugSackTabSession)
		S:HandleTab(BugSackTabLast)

		BugSackTabSession:ClearAllPoints()
		BugSackTabSession:Point('CENTER', BugSackFrame, 'BOTTOM', 0, -16)
		BugSackTabAll:ClearAllPoints()
		BugSackTabAll:Point('LEFT', BugSackTabSession, 'RIGHT', -5, 0)
		BugSackTabLast:ClearAllPoints()
		BugSackTabLast:Point('RIGHT', BugSackTabSession, 'LEFT', 5, 0)

		-- Close Button(s)
		local numChildren = select('#', BugSackFrame:GetChildren())
		for i = 1, numChildren do
			local child = select(i, BugSackFrame:GetChildren())
			if child:IsObjectType('Button') and child:GetScript('OnClick') == BugSack.CloseSack then
				S:HandleCloseButton(child)
			end
		end

		BugSack.Skinned = true
	end)
end

S:AddCallbackForAddon('BugSack', 'LuckyoneUI_BugSack', Private.Skin_BugSack)
