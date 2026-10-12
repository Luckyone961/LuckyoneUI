local _, Private = ...

if not Private.ElvUI then
	return
end

local format = string.format
local ipairs = ipairs
local next = next
local select = select
local unpack = unpack

local GetBuildInfo = GetBuildInfo
local hooksecurefunc = hooksecurefunc

local _G = _G

local E = unpack(ElvUI)
local S = E:GetModule('Skins')

local skinned, versionLabel

-- Hide it while there is no page count (Options tab, empty sack)
local function CountLabel_SetText(_, text)
	versionLabel:SetShown(text and text ~= '')
end

-- Options tab
local function SkinOptions(options)
	for _, child in next, { options:GetChildren() } do
		if child:IsObjectType('CheckButton') then
			S:HandleCheckBox(child)
		else
			for _, dropdown in next, { child:GetChildren() } do
				if dropdown.SetupMenu then
					S:HandleDropDownBox(dropdown, dropdown:GetWidth())
				end
			end
		end
	end
end

local function SkinBugSackFrame()
	if skinned then return end

	local frame = _G.BugSackFrame
	if not frame then return end

	-- Main Frame
	S:HandleFrame(frame)

	-- Scroll Bar (the scroll frame is unnamed, reach it through the text area)
	local textArea = _G.BugSackScrollText
	local scrollArea = textArea and textArea:GetParent()
	local scrollBar = scrollArea and scrollArea.ScrollBar
	if scrollBar then
		if Private.isModern then
			S:HandleTrimScrollBar(scrollBar)
		else
			S:HandleScrollBar(scrollBar)
		end
	end

	-- Buttons
	local prevButton = _G.BugSackPrevButton
	local nextButton = _G.BugSackNextButton
	local sendButton = _G.BugSackSendButton
	local wipeButton = _G.BugSackWipeButton

	-- Three-slice buttons (SharedButtonTemplate) need the child backdrop
	for _, button in next, { prevButton, nextButton, sendButton, wipeButton } do
		S:HandleButton(button, nil, nil, nil, true)
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

	-- Send (bug tabs) and Wipe (Options tab) fill the space between them with a 1px gap on each side
	for _, button in next, { sendButton, wipeButton } do
		button:ClearAllPoints()
		button:Point('LEFT', prevButton, 'RIGHT', 1, 0)
		button:Point('RIGHT', nextButton, 'LEFT', -1, 0)
	end

	-- Tabs under the bottom left corner with a 1px gap, ElvUI insets the tab backdrop by 3px on modern clients and 10px on classic
	local inset = Private.isModern and 3 or 10
	local lastTab

	for _, tab in next, { _G.BugSackTabAll, _G.BugSackTabSession, _G.BugSackTabLast, _G.BugSackTabOptions } do
		S:HandleTab(tab)
		tab:ClearAllPoints()

		if lastTab then
			tab:Point('TOPLEFT', lastTab, 'TOPRIGHT', 1 - inset * 2, 0)
		else
			tab:Point('TOPLEFT', frame, 'BOTTOMLEFT', -inset, 0)
		end

		lastTab = tab
	end

	-- Close Button (classic) and the Options tab
	local BugSack = _G.BugSack

	for _, child in ipairs({ frame:GetChildren() }) do
		if child:IsObjectType('Button') and child:GetScript('OnClick') == BugSack.CloseSack then
			S:HandleCloseButton(child)
		elseif select(2, child:GetPoint()) == scrollArea then
			SkinOptions(child)
		end
	end

	-- Addon and game versions left of page count (top right), modern clients keep the count label in the title container
	local labelParent = frame.TitleContainer or frame
	local countLabel

	for _, region in ipairs({ labelParent:GetRegions() }) do
		if region:IsObjectType('FontString') and region:GetJustifyH() == 'RIGHT' then
			countLabel = region
			break
		end
	end

	if countLabel then
		local _, elvVersion = E:ParseVersionString('ElvUI')
		local gameVersion = GetBuildInfo()
		local hex = '|c' .. E:ClassColor(Private.myClass).colorStr

		versionLabel = labelParent:CreateFontString(nil, 'ARTWORK')
		versionLabel:SetFontObject(countLabel:GetFontObject())
		versionLabel:SetTextColor(countLabel:GetTextColor())
		versionLabel:SetText(format('%sElvUI:|r %s %sLuckyoneUI:|r %s %sPatch:|r %s %sPage:|r', hex, elvVersion, hex, Private.VersionString, hex, gameVersion, hex))
		versionLabel:SetPoint('RIGHT', countLabel, 'LEFT', -6, 0)

		hooksecurefunc(countLabel, 'SetText', CountLabel_SetText)
		CountLabel_SetText(countLabel, countLabel:GetText())
	end

	skinned = true
end

local function Skin_BugSack()
	if not Private.Addon.db.profile.skins.BugSack then return end

	local BugSack = _G.BugSack
	if BugSack then
		hooksecurefunc(BugSack, 'OpenSack', SkinBugSackFrame)

		-- Minimap/broker right-click opens the Options tab directly, BugSack 12.1.6+
		if BugSack.OpenConfig then
			hooksecurefunc(BugSack, 'OpenConfig', SkinBugSackFrame)
		end
	end

	-- With auto popup on, errors during login open the sack ahead of this skin
	SkinBugSackFrame()
end

S:AddCallbackForAddon('BugSack', 'LuckyoneUI_BugSack', Skin_BugSack)
