local _, Private = ...

if not Private.ElvUI then
	return
end

-- We only skin the View Houses frame of Plumber
-- Modules, options and everything else remain untouched

local next = next
local unpack = unpack

local hooksecurefunc = hooksecurefunc

local _G = _G

local E = unpack(ElvUI)
local S = E:GetModule('Skins')

-- Crop cards to the inner art so the ElvUI border "skin" applies properly
local function CropArtwork(background)
	local left, top, _, bottom, right = background:GetTexCoord()
	background:SetTexCoord(left + 64 / 512, right - 24 / 512, top + 24 / 512, bottom - 24 / 512)
end

-- Plumber resets the tex coords on every refresh
local function Card_SetHouseInfo(card, houseInfo)
	if houseInfo then
		CropArtwork(card.Background)
	end
end

-- House cards are created on a list update, right after their first refresh
local function HouseList_Update(frame)
	for _, card in next, frame.cards do
		if not card.IsSkinned then
			card:SetTemplate('Transparent')
			card.Background:SetInside()
			CropArtwork(card.Background)
			hooksecurefunc(card, 'SetHouseInfo', Card_SetHouseInfo)

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

local function Skin_Plumber()
	if not Private.Addon.db.profile.skins.Plumber then return end

	hooksecurefunc(_G.UnitPopupViewHousesButtonMixin, 'OnClick', ViewHouses_OnClick)
end

S:AddCallbackForAddon('Plumber', 'LuckyoneUI_Plumber', Skin_Plumber)
