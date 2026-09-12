local _, Private = ...

local floor = math.floor
local strfind = string.find

local CreateFrame = CreateFrame
local hooksecurefunc = hooksecurefunc

local _G = _G

local initialized

-- Blizzard re-anchors the odd slots on every update
local function LayoutItems(count)
	local firstItem = _G.MerchantItem1
	if not firstItem then return end

	-- ElvUI moves the first slot around and the rest of the grid should follow it
	local _, _, _, offsetX, offsetY = firstItem:GetPoint()
	if not offsetX then return end

	local itemWidth, itemHeight = firstItem:GetSize()

	for i = 1, count do
		local item = _G['MerchantItem' .. i]
		if item then
			local column = (i - 1) % 4
			local row = floor((i - 1) / 4)

			-- 12 and 8 are Blizzards own column and row gaps
			item:ClearAllPoints()
			item:SetPoint('TOPLEFT', _G.MerchantFrame, 'TOPLEFT', offsetX + column * (itemWidth + 12), offsetY - row * (itemHeight + 8))
			item:Show()
		end
	end
end

-- Blizzard hides slot eleven and twelve here because they belong to the buyback tab
local function Merchant_UpdateMerchantInfo()
	LayoutItems(20)
end

-- The buyback tab only fills its own twelve slots
local function Merchant_UpdateBuybackInfo()
	local buybackItems = _G.BUYBACK_ITEMS_PER_PAGE

	LayoutItems(buybackItems)

	for i = buybackItems + 1, 20 do
		local item = _G['MerchantItem' .. i]
		if item then
			item:Hide()
		end
	end
end

local function GetAnchor(frame, anchor, keyword)
	for i = 1, frame:GetNumPoints() do
		local point, relativeTo, relativePoint, x, y = frame:GetPoint(i)
		if relativeTo == anchor and relativePoint and (not keyword or strfind(relativePoint, keyword)) then
			return point, relativePoint, x, y
		end
	end
end

local function SetAnchor(frame, anchor, point, relativePoint, x, y)
	frame:ClearAllPoints()
	frame:SetPoint(point, anchor, relativePoint, x, y)
end

local function LayoutPageButtons(grown)
	local MerchantFrame = _G.MerchantFrame
	local nextPage = _G.MerchantNextPageButton
	local prevPage = _G.MerchantPrevPageButton
	if not (MerchantFrame and nextPage and prevPage) then return end

	local point, relativePoint, x, y = GetAnchor(nextPage, MerchantFrame, 'RIGHT')

	if point then
		SetAnchor(nextPage, MerchantFrame, point, relativePoint, x, y)

		point, relativePoint, x, y = GetAnchor(prevPage, nextPage)
		if point then
			SetAnchor(prevPage, nextPage, point, relativePoint, x, y)
		end

		return
	end

	point, relativePoint, x, y = GetAnchor(nextPage, MerchantFrame, 'LEFT')
	if point then
		SetAnchor(nextPage, MerchantFrame, point, relativePoint, x + grown, y)
	end
end

-- Doubles the merchant frame so it shows four rows of items instead of two
function Private:ExpandMerchant()
	if initialized then return end
	if not Private.Addon.db.profile.qualityOfLife.expandMerchant then return end

	local MerchantFrame = _G.MerchantFrame
	local firstItem = _G.MerchantItem1
	if not (MerchantFrame and firstItem) then return end

	local _, _, _, offsetX = firstItem:GetPoint()
	if not offsetX then return end

	-- Blizzard indexes the slots by name
	-- The template carries the item button, money and currency frames
	local itemWidth, itemHeight = firstItem:GetSize()

	for i = 1, 20 do
		if not _G['MerchantItem' .. i] then
			local item = CreateFrame('Frame', 'MerchantItem' .. i, MerchantFrame, 'MerchantItemTemplate')
			item:SetSize(itemWidth, itemHeight)
		end
	end

	-- ElvUI stops skinning the slots at twelve
	if Private.Skin_Merchant then
		Private:Skin_Merchant(_G.BUYBACK_ITEMS_PER_PAGE + 1, 20)
	end

	local oldWidth = MerchantFrame:GetWidth()

	-- Keep whatever space is left over on the right of the last column
	local margin = oldWidth - (offsetX + itemWidth * 2 + 12)
	local width = offsetX + itemWidth * 4 + 12 * 3 + margin
	local grown = width - oldWidth

	MerchantFrame:SetWidth(width)

	-- Fixed size texture, on Classic the right half of the border is anchored to it and follows
	local border = _G.MerchantFrameBottomLeftBorder
	if border then
		border:SetWidth(border:GetWidth() + grown)
	end

	LayoutPageButtons(grown)

	local buyback = _G.MerchantBuyBackItem
	if buyback then
		local point, relativeTo, relativePoint, x, y = buyback:GetPoint()
		if relativeTo == _G.MerchantItem10 then
			buyback:ClearAllPoints()
			buyback:SetPoint(point, _G.MerchantItem18, relativePoint, x, y)
		end
	end

	-- Merchant paths are not protected
	_G.MERCHANT_ITEMS_PER_PAGE = 20

	hooksecurefunc('MerchantFrame_UpdateMerchantInfo', Merchant_UpdateMerchantInfo)
	hooksecurefunc('MerchantFrame_UpdateBuybackInfo', Merchant_UpdateBuybackInfo)

	LayoutItems(20)

	initialized = true
end
