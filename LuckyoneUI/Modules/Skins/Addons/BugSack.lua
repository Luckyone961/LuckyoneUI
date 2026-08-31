local _, Private = ...

-- ElvUI file
if not Private.ElvUI then
	return
end

local format = string.format
local unpack = unpack

local hooksecurefunc = hooksecurefunc

local _G = _G

local E = unpack(ElvUI)
local S = E:GetModule('Skins')

local function SkinBugSackFrame()
	local BugSack = _G.BugSack
	if not BugSack or BugSack.Skinned then return end

	local BugSackFrame = _G.BugSackFrame
	if not BugSackFrame then return end

	-- Main Frame
	S:HandleFrame(BugSackFrame)

	-- Scroll Frame
	local BugSackScrollScrollBar = _G.BugSackScrollScrollBar
	if BugSackScrollScrollBar then
		S:HandleScrollBar(BugSackScrollScrollBar)
	end

	-- Buttons
	local buttonHeight = 24
	local BugSackNextButton = _G.BugSackNextButton
	local BugSackSendButton = _G.BugSackSendButton
	local BugSackPrevButton = _G.BugSackPrevButton

	if BugSackNextButton then
		S:HandleButton(BugSackNextButton)
		BugSackNextButton:Height(buttonHeight)
		BugSackNextButton:ClearAllPoints()
		BugSackNextButton:Point('BOTTOMRIGHT', BugSackFrame, 'BOTTOMRIGHT', -12, 6)
	end

	if BugSackSendButton then
		S:HandleButton(BugSackSendButton)
		BugSackSendButton:Height(buttonHeight)
	end

	if BugSackPrevButton then
		S:HandleButton(BugSackPrevButton)
		BugSackPrevButton:Height(buttonHeight)
		BugSackPrevButton:ClearAllPoints()
		BugSackPrevButton:Point('BOTTOMLEFT', BugSackFrame, 'BOTTOMLEFT', 12, 6)
	end

	-- Tabs
	local BugSackTabAll = _G.BugSackTabAll
	local BugSackTabSession = _G.BugSackTabSession
	local BugSackTabLast = _G.BugSackTabLast

	if BugSackTabSession then
		S:HandleTab(BugSackTabSession)
		BugSackTabSession:ClearAllPoints()
		BugSackTabSession:Point('CENTER', BugSackFrame, 'BOTTOM', 0, -16)
	end

	if BugSackTabAll then
		S:HandleTab(BugSackTabAll)
		if BugSackTabSession then
			BugSackTabAll:ClearAllPoints()
			BugSackTabAll:Point('LEFT', BugSackTabSession, 'RIGHT', -5, 0)
		end
	end

	if BugSackTabLast then
		S:HandleTab(BugSackTabLast)
		if BugSackTabSession then
			BugSackTabLast:ClearAllPoints()
			BugSackTabLast:Point('RIGHT', BugSackTabSession, 'LEFT', 5, 0)
		end
	end

	-- Close Button(s)
	local children = { BugSackFrame:GetChildren() }
	for i = 1, #children do
		local child = children[i]
		if child:IsObjectType('Button') and child:GetScript('OnClick') == BugSack.CloseSack then
			S:HandleCloseButton(child)
		end
	end

	-- Game version left of page count (top right)
	local countLabel
	local regions = { BugSackFrame:GetRegions() }
	for i = 1, #regions do
		local region = regions[i]
		if region:IsObjectType('FontString') and region:GetJustifyH() == 'RIGHT' then
			countLabel = region
			break
		end
	end

	if countLabel then
		local _, elvVersion = E:ParseVersionString('ElvUI')
		local classColor = E:ClassColor(Private.myClass)
		local hex = format('|cff%02x%02x%02x', classColor.r * 255, classColor.g * 255, classColor.b * 255)
		local versionLabel = BugSackFrame:CreateFontString(nil, 'ARTWORK')
		versionLabel:SetFontObject(countLabel:GetFontObject())
		versionLabel:SetTextColor(countLabel:GetTextColor())
		versionLabel:SetText(format('%sElvUI:|r %s %sPatch:|r %s %sPage:|r', hex, elvVersion, hex, Private.GameVersion, hex))
		versionLabel:SetPoint('RIGHT', countLabel, 'LEFT', -6, 0)
	end

	BugSack.Skinned = true
end

local function Skin_BugSack()
	if not Private.Addon.db.profile.skins.BugSack then return end

	local BugSack = _G.BugSack
	if BugSack then
		hooksecurefunc(BugSack, 'OpenSack', SkinBugSackFrame)
	end
end

S:AddCallbackForAddon('BugSack', 'LuckyoneUI_BugSack', Skin_BugSack)
