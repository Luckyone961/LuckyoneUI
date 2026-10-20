local _, Private = ...

if not Private.ElvUI then
	return
end

local next = next
local pi = math.pi
local unpack = unpack

local hooksecurefunc = hooksecurefunc

local _G = _G

local E = unpack(ElvUI)
local S = E:GetModule('Skins')

local tooltipIcon

local backdropPieces = { 'TopLeftCorner', 'TopRightCorner', 'BottomLeftCorner', 'BottomRightCorner', 'TopEdge', 'BottomEdge', 'LeftEdge', 'RightEdge', 'Center' }

-- ATT re-applies its backdrop and colors on every settings load
local function Window_SetBackdrop(window)
	for _, key in next, backdropPieces do
		local piece = window[key]
		if piece then
			piece:Hide()
		end
	end
end

-- Rows are created on demand
local function Window_OnRefreshed(window)
	for _, row in next, window.Container.rows do
		if not row.IsSkinned then
			row:GetHighlightTexture():SetColorTexture(1, 1, 1, 0.25)
			row.IsSkinned = true
		end
	end
end

-- 1px gap to the profession window
local function Tradeskills_SetTSMCraftingVisible(window)
	local professions = _G.ProfessionsFrame
	local _, anchor = window:GetPoint()
	if professions and anchor == professions then
		window:ClearAllPoints()
		window:Point('TOPLEFT', professions, 'TOPRIGHT', 1, 0)
		window:Point('BOTTOMLEFT', professions, 'BOTTOMRIGHT', 1, 0)
	end
end

local function SkinWindow(window)
	window:CreateBackdrop('Transparent', nil, nil, nil, nil, nil, nil, true)

	hooksecurefunc(window, 'SetBackdrop', Window_SetBackdrop)
	Window_SetBackdrop(window)

	-- Close buttons
	local close = window.CloseButton
	S:HandleCloseButton(close)
	close:SetHitRectInsets(0, 0, 0, 0)

	S:HandleScrollBar(window.ScrollBar)

	-- Resize grip as an arrow into the corner
	local grip = window.Grip
	grip:SetTexture(E.Media.Textures.ArrowUp)
	grip:SetRotation(pi * 1.25)
	grip:Size(14)

	if window.Suffix == 'Tradeskills' and window.SetTSMCraftingVisible then
		hooksecurefunc(window, 'SetTSMCraftingVisible', Tradeskills_SetTSMCraftingVisible)
	end
end

-- Item icons get cropped with a border
local function Tooltip_SetATTReferenceForTexture(_, reference)
	local plain = tooltipIcon:IsShown() and not (reference.atlas or reference.preview or reference.texcoord)
	if plain then
		tooltipIcon.icon:SetTexCoords()
	end

	tooltipIcon.backdrop:SetShown(plain)
end

-- Text popup for reports and exports
local function ATT_ShowPopupDialogWithMultiLineEditBox()
	local frame = _G.ATTEditBox
	if frame.IsSkinned then return end

	S:HandleFrame(frame)
	S:HandleButton(_G.ATTEditBoxButton)
	S:HandleScrollBar(frame.ScrollFrame.ScrollBar)

	frame.IsSkinned = true
end

local function Skin_AllTheThings()
	if not Private.Addon.db.profile.skins.AllTheThings then return end

	local ATT = _G.AllTheThings
	if not ATT then return end

	for _, window in next, ATT.Windows do
		SkinWindow(window)
	end

	ATT.AddEventHandler('OnWindowCreated', SkinWindow)
	ATT.AddEventHandler('OnWindowRefreshed', Window_OnRefreshed)

	hooksecurefunc(ATT, 'ShowPopupDialogWithMultiLineEditBox', ATT_ShowPopupDialogWithMultiLineEditBox)

	-- Model preview beside the tooltip
	local model = _G.ATTGameTooltipModel1
	if model then
		model:GetParent():SetTemplate('Transparent')
	end

	-- Icon beside the tooltip
	for _, child in next, { _G.GameTooltip:GetChildren() } do
		if child.icon and child.icon.Border then
			tooltipIcon = child
			break
		end
	end

	if tooltipIcon then
		tooltipIcon.icon:SetInside()
		tooltipIcon:CreateBackdrop(nil, nil, nil, nil, nil, nil, nil, true)

		hooksecurefunc(_G.GameTooltip, 'SetATTReferenceForTexture', Tooltip_SetATTReferenceForTexture)
	end
end

S:AddCallbackForAddon('AllTheThings', 'LuckyoneUI_AllTheThings', Skin_AllTheThings)
