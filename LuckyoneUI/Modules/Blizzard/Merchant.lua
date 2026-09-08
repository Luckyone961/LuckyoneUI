local _, Private = ...

local floor = math.floor
local strfind = string.find

local CreateFrame = CreateFrame
local hooksecurefunc = hooksecurefunc

local _G = _G

local COLUMNS = 4
local ROWS = 5
local COLUMN_GAP = 12 -- Blizzards own gap between the two default columns
local ROW_GAP = 8 -- Blizzards own gap between the merchant rows

local DEFAULT_COLUMNS = 2
local ITEMS_PER_PAGE = COLUMNS * ROWS

local DEFAULT_BUYBACK_ANCHOR = 'MerchantItem' .. (DEFAULT_COLUMNS * ROWS)
local BUYBACK_ANCHOR = (ROWS - 1) * COLUMNS + DEFAULT_COLUMNS

local initialized

local function GetItem(index)
	return _G['MerchantItem' .. index]
end

-- Blizzard re-anchors the odd slots on every update
local function LayoutItems(count)
	local firstItem = GetItem(1)
	if not firstItem then return end

	-- ElvUI moves the first slot around and the rest of the grid should follow it
	local _, _, _, offsetX, offsetY = firstItem:GetPoint()
	if not offsetX then return end

	local itemWidth, itemHeight = firstItem:GetSize()

	for i = 1, count do
		local item = GetItem(i)
		if item then
			local column = (i - 1) % COLUMNS
			local row = floor((i - 1) / COLUMNS)

			item:ClearAllPoints()
			item:SetPoint('TOPLEFT', _G.MerchantFrame, 'TOPLEFT', offsetX + column * (itemWidth + COLUMN_GAP), offsetY - row * (itemHeight + ROW_GAP))
			item:Show()
		end
	end
end

-- Blizzard hides slot eleven and twelve here because they belong to the buyback tab
local function Merchant_UpdateMerchantInfo()
	LayoutItems(ITEMS_PER_PAGE)
end

-- The buyback tab only fills its own twelve slots
local function Merchant_UpdateBuybackInfo()
	local buybackItems = _G.BUYBACK_ITEMS_PER_PAGE

	LayoutItems(buybackItems)

	for i = buybackItems + 1, ITEMS_PER_PAGE do
		local item = GetItem(i)
		if item then
			item:Hide()
		end
	end
end

-- Doubles the merchant frame so it shows four rows of items instead of two
function Private:ExpandMerchant()
	if initialized then return end
	if not Private.Addon.db.profile.qualityOfLife.expandMerchant then return end

	local MerchantFrame = _G.MerchantFrame
	local firstItem = GetItem(1)
	if not (MerchantFrame and firstItem) then return end

	local _, _, _, offsetX = firstItem:GetPoint()
	if not offsetX then return end

	-- Blizzard indexes the slots by name
	-- The template carries the item button, money and currency frames
	local itemWidth, itemHeight = firstItem:GetSize()

	for i = 1, ITEMS_PER_PAGE do
		if not GetItem(i) then
			local item = CreateFrame('Frame', 'MerchantItem' .. i, MerchantFrame, 'MerchantItemTemplate')
			item:SetSize(itemWidth, itemHeight)
		end
	end

	-- ElvUI stops skinning the slots at twelve
	if Private.Skin_Merchant then
		Private:Skin_Merchant(_G.BUYBACK_ITEMS_PER_PAGE + 1, ITEMS_PER_PAGE)
	end

	local oldWidth = MerchantFrame:GetWidth()

	-- Keep whatever space is left over on the right of the last column
	local margin = oldWidth - (offsetX + itemWidth * DEFAULT_COLUMNS + COLUMN_GAP * (DEFAULT_COLUMNS - 1))
	local width = offsetX + itemWidth * COLUMNS + COLUMN_GAP * (COLUMNS - 1) + margin
	local grown = width - oldWidth

	MerchantFrame:SetWidth(width)

	-- Fixed size texture, on Classic the right half of the border is anchored to it and follows
	local border = _G.MerchantFrameBottomLeftBorder
	if border then
		border:SetWidth(border:GetWidth() + grown)
	end

	-- Only move it if it is pinned to the left edge, ElvUI already anchors it to the right side
	local nextPage = _G.MerchantNextPageButton
	if nextPage then
		local point, relativeTo, relativePoint, x, y = nextPage:GetPoint()
		if relativeTo == MerchantFrame and relativePoint and strfind(relativePoint, 'LEFT') then
			nextPage:ClearAllPoints()
			nextPage:SetPoint(point, MerchantFrame, relativePoint, x + grown, y)
		end
	end

	local buyback = _G.MerchantBuyBackItem
	if buyback then
		local point, relativeTo, relativePoint, x, y = buyback:GetPoint()
		if relativeTo == _G[DEFAULT_BUYBACK_ANCHOR] then
			buyback:ClearAllPoints()
			buyback:SetPoint(point, GetItem(BUYBACK_ANCHOR), relativePoint, x, y)
		end
	end

	-- Merchant paths are not protected
	_G.MERCHANT_ITEMS_PER_PAGE = ITEMS_PER_PAGE

	hooksecurefunc('MerchantFrame_UpdateMerchantInfo', Merchant_UpdateMerchantInfo)
	hooksecurefunc('MerchantFrame_UpdateBuybackInfo', Merchant_UpdateBuybackInfo)

	LayoutItems(ITEMS_PER_PAGE)

	initialized = true
end
