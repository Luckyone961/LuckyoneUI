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

-- The filter bar and the input bar share DeveloperConsoleBackgroundTemplate
local function SkinBarBackground(frame)
	if not frame then return end

	frame:StripTextures()
	frame:SetTemplate('Transparent')
end

local function SkinClearButton(button)
	S:HandleCloseButton(button)

	button:SetAlpha(1)
	button:OffsetFrameLevel(4, button:GetParent())
	button.Texture:SetDrawLayer('OVERLAY', 7)
end

local function GetInputBackground(editBox)
	for _, child in next, { editBox:GetChildren() } do
		if child.BorderTop and child.BorderBottom then
			return child
		end
	end
end

-- Entries come from a pool
local function AutoComplete_DisplayResults(frame)
	frame.backdrop:SetShown(frame.Background:IsShown())

	local entries = frame.entryByIndex
	if not entries then return end

	local r, g, b = unpack(E.media.rgbvaluecolor)

	for _, entry in next, entries do
		if not entry.IsSkinned then
			entry.Selected:SetColorTexture(r, g, b, .4)
			entry.Highlight:SetColorTexture(r, g, b, .25)

			entry.IsSkinned = true
		end
	end
end

local function SkinAutoComplete(frame)
	for _, element in next, frame.BackgroundElements do
		element:SetAlpha(0)
	end

	frame:CreateBackdrop('Transparent')
	frame.backdrop:SetOutside(frame.Background)

	local tooltip = frame.Tooltip
	tooltip.Background:SetAlpha(0)
	tooltip.BorderTop:SetAlpha(0)
	tooltip.BorderLeft:SetAlpha(0)
	tooltip.BorderRight:SetAlpha(0)
	tooltip.BorderBottom:SetAlpha(0)

	tooltip:CreateBackdrop('Transparent')
	tooltip.backdrop:SetOutside(tooltip.Background)

	hooksecurefunc(frame, 'DisplayResults', AutoComplete_DisplayResults)
end

local function Skin_DeveloperConsole()
	if not Private.Addon.db.profile.skins.Blizzard.DeveloperConsole then return end

	local console = _G.DeveloperConsole
	if not console then return end

	-- Filter Bar
	local filters = console.Filters
	SkinBarBackground(filters.Background)

	-- Cover the spacing between screen edge and console skin
	filters.Background:NudgePoint(0, 2, nil, 'TOPLEFT')

	local r, g, b = unpack(E.media.bordercolor)
	filters.BorderLeft:SetColorTexture(r, g, b)

	local progressBar = filters.ProgressBar
	progressBar:SetStatusBarTexture(E.media.normTex)

	r, g, b = unpack(E.media.rgbvaluecolor)
	progressBar:SetStatusBarColor(r, g, b, .2)

	SkinClearButton(filters.EditBox.ClearTextButton)

	-- Message Frame
	local messageFrame = console.MessageFrame
	messageFrame.Background:SetAlpha(0)
	messageFrame:CreateBackdrop('Transparent')
	messageFrame.backdrop:Point('TOPLEFT', -1, 2)
	messageFrame.backdrop:Point('BOTTOMRIGHT', 15, -2)

	S:HandleTrimScrollBar(console.ScrollBar)

	-- Input Bar
	local editBox = console.EditBox
	SkinBarBackground(GetInputBackground(editBox))
	SkinClearButton(editBox.ClearTextButton)

	-- Auto Complete
	SkinAutoComplete(console.AutoComplete)
end

S:AddCallbackForAddon('Blizzard_Console', 'LuckyoneUI_DeveloperConsole', Skin_DeveloperConsole)
