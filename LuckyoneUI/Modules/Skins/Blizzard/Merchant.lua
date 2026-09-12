local _, Private = ...

if not Private.ElvUI then
	return
end

--[[
	Modified version of:
	ElvUI\Game\Mainline\Skins\Merchant.Lua
	ElvUI\Game\Classic\Skins\Merchant.Lua
	ElvUI skins the merchant slots by looping over BUYBACK_ITEMS_PER_PAGE, so it stops at twelve.
]]

local unpack = unpack

local CreateFrame = CreateFrame
local hooksecurefunc = hooksecurefunc

local GetItemQualityByID = C_Item.GetItemQualityByID
local GetMerchantNumItems = GetMerchantNumItems

local _G = _G

local E = unpack(ElvUI)
local S = E:GetModule('Skins')

local firstSlot, lastSlot

local function QuestIcon_SetTexture(iconQuest, texture)
	if texture == [[Interface\ContainerFrame\UI-Icon-QuestBang]] then
		iconQuest:SetTexture(E.Media.Textures.BagQuestIcon)
	end
end

-- Retail pulls the quality colors off the item border, the older clients color the button and label instead
local function Merchant_UpdateMerchantInfo()
	local numMerchantItems = GetMerchantNumItems()
	local offset = (_G.MerchantFrame.page - 1) * _G.MERCHANT_ITEMS_PER_PAGE

	for i = firstSlot, lastSlot do
		if offset + i > numMerchantItems then break end

		local button = _G['MerchantItem' .. i .. 'ItemButton']
		local name = _G['MerchantItem' .. i .. 'Name']
		local quality = button.link and GetItemQualityByID(button.link)

		if quality and quality > 1 then
			local r, g, b = E:GetItemQualityColor(quality)
			button:SetBackdropBorderColor(r, g, b)
			name:SetTextColor(r, g, b)
		else
			button:SetBackdropBorderColor(unpack(E.media.bordercolor))
			name:SetTextColor(1, 1, 1)
		end
	end
end

function Private:Skin_Merchant(first, last)
	if not (E.private.skins.blizzard.enable and E.private.skins.blizzard.merchant) then return end

	firstSlot, lastSlot = first, last

	for i = first, last do
		local item = _G['MerchantItem' .. i]
		local button = _G['MerchantItem' .. i .. 'ItemButton']
		local name = _G['MerchantItem' .. i .. 'Name']
		local slot = _G['MerchantItem' .. i .. 'SlotTexture']

		item:StripTextures(true)
		item:CreateBackdrop('Transparent')

		button:StripTextures()
		button:StyleButton()
		button:SetTemplate(nil, true)

		if Private.isRetail then
			item:Size(155, 45)
			item.backdrop:Point('TOPLEFT', -3, 2)
			item.backdrop:Point('BOTTOMRIGHT', 2, -3)

			name:Point('LEFT', slot, 'RIGHT', -5, 5)
			name:Size(110, 30)

			button:Point('TOPLEFT', item, 'TOPLEFT', 4, -4)

			local icon = button.icon
			icon:SetTexCoords()
			icon:ClearAllPoints()
			icon:Point('TOPLEFT', 1, -1)
			icon:Point('BOTTOMRIGHT', -1, 1)

			local questIcon = button.IconQuestTexture
			questIcon:SetTexCoord(0, 1, 0, 1)
			questIcon:SetInside()

			-- Decor items
			local iconOverlay = button.IconOverlay
			if iconOverlay then
				iconOverlay:SetInside(button, 1, 1)
			end

			hooksecurefunc(questIcon, 'SetTexture', QuestIcon_SetTexture)

			S:HandleIconBorder(button.IconBorder)
		else
			item.backdrop:Point('TOPLEFT', -1, 3)
			item.backdrop:Point('BOTTOMRIGHT', 2, -3)

			button:Size(40)
			button:Point('TOPLEFT', item, 'TOPLEFT', 4, -2)

			local icon = _G['MerchantItem' .. i .. 'ItemButtonIconTexture']
			icon:SetTexCoords()
			icon:SetInside()

			_G['MerchantItem' .. i .. 'NameFrame']:Point('LEFT', slot, 'RIGHT', -6, -17)
			name:Point('LEFT', slot, 'RIGHT', -4, 5)

			local money = _G['MerchantItem' .. i .. 'MoneyFrame']
			money:ClearAllPoints()
			money:Point('BOTTOMLEFT', button, 'BOTTOMRIGHT', 3, 0)

			if not Private.isMists then
				for j = 1, 2 do
					local currencyItem = _G['MerchantItem' .. i .. 'AltCurrencyFrameItem' .. j]
					local currencyIcon = _G['MerchantItem' .. i .. 'AltCurrencyFrameItem' .. j .. 'Texture']

					currencyIcon.backdrop = CreateFrame('Frame', nil, currencyItem)
					currencyIcon.backdrop:SetTemplate()
					currencyIcon.backdrop:OffsetFrameLevel(nil, currencyItem)

					if Private.isClassic then
						currencyIcon.backdrop:SetOutside(currencyIcon)
					end

					currencyIcon:SetTexCoords()
					currencyIcon:SetParent(currencyIcon.backdrop)
				end
			end
		end
	end

	if not Private.isRetail then
		hooksecurefunc('MerchantFrame_UpdateMerchantInfo', Merchant_UpdateMerchantInfo)
	end
end
