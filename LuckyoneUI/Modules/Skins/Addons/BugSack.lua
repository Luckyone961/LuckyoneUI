local _, Private = ...

if not Private.ElvUI then
	return
end

local format = string.format
local ipairs = ipairs
local next = next
local unpack = unpack

local hooksecurefunc = hooksecurefunc

local _G = _G

local E = unpack(ElvUI)
local S = E:GetModule('Skins')

local skinned

local function SkinBugSackFrame()
	if skinned then return end

	local frame = _G.BugSackFrame
	if not frame then return end

	-- Main Frame
	S:HandleFrame(frame)

	-- Scroll Bar
	local scrollBar = _G.BugSackScrollScrollBar
	if scrollBar then
		S:HandleScrollBar(scrollBar)
	end

	-- Buttons
	local prevButton = _G.BugSackPrevButton
	local nextButton = _G.BugSackNextButton

	for _, button in next, { prevButton, nextButton, _G.BugSackSendButton } do
		S:HandleButton(button)
		button:Height(24)
	end

	-- Move the paging buttons into the bottom corners
	if prevButton then
		prevButton:ClearAllPoints()
		prevButton:Point('BOTTOMLEFT', frame, 'BOTTOMLEFT', 12, 6)
	end

	if nextButton then
		nextButton:ClearAllPoints()
		nextButton:Point('BOTTOMRIGHT', frame, 'BOTTOMRIGHT', -12, 6)
	end

	-- Tabs
	local sessionTab = _G.BugSackTabSession
	local allTab = _G.BugSackTabAll
	local lastTab = _G.BugSackTabLast

	for _, tab in next, { sessionTab, allTab, lastTab } do
		S:HandleTab(tab)
	end

	-- Center the session tab below the frame, the other two attach to it
	if sessionTab then
		sessionTab:ClearAllPoints()
		sessionTab:Point('CENTER', frame, 'BOTTOM', 0, -16)

		if allTab then
			allTab:ClearAllPoints()
			allTab:Point('LEFT', sessionTab, 'RIGHT', -5, 0)
		end

		if lastTab then
			lastTab:ClearAllPoints()
			lastTab:Point('RIGHT', sessionTab, 'LEFT', 5, 0)
		end
	end

	-- Close Button(s)
	local BugSack = _G.BugSack

	for _, child in ipairs({ frame:GetChildren() }) do
		if child:IsObjectType('Button') and child:GetScript('OnClick') == BugSack.CloseSack then
			S:HandleCloseButton(child)
		end
	end

	-- Game version left of page count (top right)
	local countLabel

	for _, region in ipairs({ frame:GetRegions() }) do
		if region:IsObjectType('FontString') and region:GetJustifyH() == 'RIGHT' then
			countLabel = region
			break
		end
	end

	if countLabel then
		local _, elvVersion = E:ParseVersionString('ElvUI')
		local hex = '|c' .. E:ClassColor(Private.myClass).colorStr

		local versionLabel = frame:CreateFontString(nil, 'ARTWORK')
		versionLabel:SetFontObject(countLabel:GetFontObject())
		versionLabel:SetTextColor(countLabel:GetTextColor())
		versionLabel:SetText(format('%sElvUI:|r %s %sPatch:|r %s %sPage:|r', hex, elvVersion, hex, Private.GameVersion, hex))
		versionLabel:SetPoint('RIGHT', countLabel, 'LEFT', -6, 0)
	end

	skinned = true
end

local function Skin_BugSack()
	if not Private.Addon.db.profile.skins.BugSack then return end

	local BugSack = _G.BugSack
	if BugSack then
		hooksecurefunc(BugSack, 'OpenSack', SkinBugSackFrame)
	end
end

S:AddCallbackForAddon('BugSack', 'LuckyoneUI_BugSack', Skin_BugSack)
