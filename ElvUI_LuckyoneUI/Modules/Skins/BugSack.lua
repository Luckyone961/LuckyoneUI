local Name, Private = ...
local E, L, V, P, G = unpack(ElvUI)
local S = E:GetModule('Skins')

local hooksecurefunc = hooksecurefunc
local pairs = pairs

function L1UI:Skin_BugSack()
	if not E.private.L1UI.skins.BugSack then return end

	hooksecurefunc(BugSack, 'OpenSack', function()
		if BugSack.Skinned then return end

		-- Main Frame
		S:HandleFrame(BugSackFrame)

		-- Scroll Frame
		S:HandleScrollBar(BugSackScrollScrollBar)

		-- Buttons
		S:HandleButton(BugSackNextButton)
		S:HandleButton(BugSackSendButton)
		S:HandleButton(BugSackPrevButton)
		BugSackNextButton:Height(24)
		BugSackSendButton:Height(24)
		BugSackPrevButton:Height(24)

		BugSackPrevButton:ClearAllPoints()
		BugSackPrevButton:Point('BOTTOMLEFT', BugSackFrame, 'BOTTOMLEFT', 12, 6)
		BugSackNextButton:ClearAllPoints()
		BugSackNextButton:Point('BOTTOMRIGHT', BugSackFrame, 'BOTTOMRIGHT', -12, 6)

		-- Tabs
		S:HandleTab(BugSackTabAll)
		S:HandleTab(BugSackTabSession)
		S:HandleTab(BugSackTabLast)
		BugSackTabSession:ClearAllPoints()
		BugSackTabAll:ClearAllPoints()
		BugSackTabLast:ClearAllPoints()
		BugSackTabSession:Point('CENTER', BugSackFrame, 'BOTTOM', 0, -16)
		BugSackTabAll:Point('LEFT', BugSackTabSession, 'RIGHT', -5, 0)
		BugSackTabLast:Point('RIGHT', BugSackTabSession, 'LEFT', 5, 0)

		-- Close Button(s)
		for _, child in pairs({ BugSackFrame:GetChildren() }) do
			if child:IsObjectType('Button') and child:GetScript('OnClick') == BugSack.CloseSack then
				S:HandleCloseButton(child)
			end
		end

		BugSack.Skinned = true
	end)
end

S:AddCallbackForAddon('BugSack', 'LuckyoneUI_BugSack', L1UI.Skin_BugSack)
