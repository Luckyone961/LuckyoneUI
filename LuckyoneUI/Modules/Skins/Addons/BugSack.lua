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

local function SkinBugSackFrame()
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

	-- Game version left of page count (top right)
	local countLabel
	for i = 1, BugSackFrame:GetNumRegions() do
		local region = select(i, BugSackFrame:GetRegions())
		if region:IsObjectType('FontString') and region:GetJustifyH() == 'RIGHT' then
			countLabel = region
			break
		end
	end

	if countLabel then
		local _, elvVersion = E:ParseVersionString('ElvUI')
		local classColor = RAID_CLASS_COLORS[Private.myClass]
		local hex = format('|cff%02x%02x%02x', classColor.r * 255, classColor.g * 255, classColor.b * 255)
		local versionLabel = BugSackFrame:CreateFontString(nil, 'ARTWORK')
		versionLabel:SetFontObject(countLabel:GetFontObject())
		versionLabel:SetTextColor(countLabel:GetTextColor())
		versionLabel:SetText(format('%sElvUI:|r %s %sPatch:|r %s %sPage:|r', hex, elvVersion, hex, Private.GameVersion, hex))
		versionLabel:SetPoint('RIGHT', countLabel, 'LEFT', -6, 0)
	end

	BugSack.Skinned = true
end

function Private:Skin_BugSack()
	if not Private.Addon.db.profile.skins.BugSack then return end
	hooksecurefunc(BugSack, 'OpenSack', SkinBugSackFrame)
end

S:AddCallbackForAddon('BugSack', 'LuckyoneUI_BugSack', Private.Skin_BugSack)
