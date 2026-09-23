local _, Private = ...

if not Private.ElvUI then
	return
end

-- We only skin two parts of Plumber
-- The View Houses frame and the Plumber checkbox next to Edit Mode
-- Modules, options and everything else remain untouched

local next = next
local unpack = unpack

local hooksecurefunc = hooksecurefunc

local _G = _G

local E = unpack(ElvUI)
local S = E:GetModule('Skins')

-- House cards are created on the first list update, the illustrated card art is dropped like on Blizzard's list
local function HouseList_Update(frame)
	for _, card in next, frame.cards do
		if not card.IsSkinned then
			card.Background:Hide()
			card:SetTemplate()
			S:HandleButton(card.VisitHouseButton)

			card.IsSkinned = true
		end
	end
end

-- Plumber swaps its own copy in as HouseListFrame, it only exists while the Plumber module is enabled
local function ViewHouses_OnClick()
	local frame = _G.PlumberHouseListFrame
	if not frame or frame.IsSkinned then return end

	frame:StripTextures()
	frame:CreateBackdrop('Transparent')
	S:HandleCloseButton(frame.CloseButton)

	hooksecurefunc(frame, 'OnHouseListUpdated', HouseList_Update)

	frame.IsSkinned = true
end

-- Edit Mode panel and its checkbox are unnamed, look for the panel Plumber attached to the Edit Mode frame
local function FindEditModePanel()
	local editMode = _G.EditModeManagerFrame

	for _, child in next, { _G.UIParent:GetChildren() } do
		if not child:IsForbidden() and child.owner == editMode and child.Checkbox then
			return child
		end
	end
end

-- Plumber builds the panel in its own Edit Mode callback, which has run by the time this hook fires
local searched
local function EditMode_Enter()
	if searched then return end
	searched = true

	local panel = FindEditModePanel()
	if not panel then return end

	panel.Border:Hide()
	panel:SetTemplate('Transparent')
	S:HandleCheckBox(panel.Checkbox.Button)
end

local function Skin_Plumber()
	if not Private.Addon.db.profile.skins.Plumber then return end

	hooksecurefunc(_G.UnitPopupViewHousesButtonMixin, 'OnClick', ViewHouses_OnClick)
	hooksecurefunc(_G.EditModeManagerFrame, 'EnterEditMode', EditMode_Enter)
end

S:AddCallbackForAddon('Plumber', 'LuckyoneUI_Plumber', Skin_Plumber)
