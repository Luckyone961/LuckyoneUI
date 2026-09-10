local _, Private = ...

if not Private.ElvUI then
	return
end

local ipairs = ipairs
local next = next
local unpack = unpack

local hooksecurefunc = hooksecurefunc

local _G = _G

local E = unpack(ElvUI)
local S = E:GetModule('Skins')

-- Only Retail and Mists run the modern auction house for now
local isModernAH = Private.isRetail or Private.isMists

local ConfigPanels = {
	'AuctionatorConfigAdvancedFrame',
	'AuctionatorConfigBasicOptionsFrame',
	'AuctionatorConfigCancellingFrame',
	'AuctionatorConfigProfileFrame',
	'AuctionatorConfigQuantitiesFrame',
	'AuctionatorConfigSellingAllItemsFrame',
	'AuctionatorConfigSellingFrame',
	'AuctionatorConfigSellingShortcutsFrame',
	'AuctionatorConfigShoppingAltFrame',
	'AuctionatorConfigTooltipsFrame',
}

local CraftingFrames = {
	'AuctionatorCraftingInfo',
	'AuctionatorCraftingInfoObjectiveTrackerFrame',
	'AuctionatorCraftingInfoProfessionsFrame',
	'AuctionatorCraftingInfoProfessionsOrderFrame',
	'AuctionatorEnchantInfoFrame',
}

-- Option widget editboxes
local EditBoxKeys = { 'InputBox', 'MaxBox', 'MinBox', 'NumStacks', 'Quantity', 'QuantityInput', 'SearchString', 'StackSize' }

local auctionHouseSkinned

-- Classic & TBC borders (InsetFrameTemplate4)
local function IsInsetBorder(frame)
	return frame.BorderTopLeft or frame.NineSlice or frame.Bg
end

local function SkinInsetBorder(frame)
	frame:StripTextures()
	S:HandleInsetFrame(frame)

	if frame.NineSlice then
		frame.NineSlice:StripTextures()
	end
end

local function SkinInset(inset)
	if not inset or inset.isSkinned then return end

	SkinInsetBorder(inset)

	for _, child in next, { inset:GetChildren() } do
		if IsInsetBorder(child) then
			SkinInsetBorder(child)
		end
	end

	inset:SetTemplate('Transparent')
	inset.isSkinned = true
end

-- The popups spawn on top of the auction house, a solid background keeps them readable
local function SkinPanel(panel)
	if not panel or panel.isSkinned then return end

	panel:StripTextures()

	for _, key in next, { 'Background', 'Border', 'NineSlice' } do
		local border = panel[key]
		if border then
			if border.StripTextures then
				border:StripTextures()
			else
				border:SetTexture(E.ClearTexture)
			end
		end
	end

	panel:SetTemplate()
	panel.isSkinned = true
end

local function SkinResetButton(button)
	if not button or button.IsSkinned then return end

	S:HandleButton(button)

	if button.texture then
		button.texture:SetDrawLayer('OVERLAY')
		button.texture:SetInside(button, 2, 2)
	end
end

local function SkinRefreshButton(parent)
	if not parent then return end

	for _, child in next, { parent:GetChildren() } do
		if child.Icon and not child.IconBorder and not child.IsSkinned and child:IsObjectType('Button') then
			S:HandleButton(child)
			child:Size(22)
		end
	end
end

local function SkinMoneyInput(frame)
	if not frame then return end

	for _, box in next, { frame.GoldBox, frame.SilverBox, frame.CopperBox } do
		if box then
			S:HandleEditBox(box)
		end
	end
end

local function SkinItemIcon(frame)
	if not frame or not frame.Icon then return end

	S:HandleIcon(frame.Icon, true)

	if frame.QualityBorder then
		S:HandleIconBorder(frame.QualityBorder, frame.Icon.backdrop)
	end
end

local function SkinItemButton(button)
	if not button or button.isSkinned then return end

	button:SetTemplate()
	button:SetPushedTexture(E.ClearTexture)

	S:HandleIcon(button.Icon)
	button.Icon:SetInside()

	if button.EmptySlot then
		button.EmptySlot:SetTexture(E.ClearTexture)
	end

	if button.IconBorder then
		S:HandleIconBorder(button.IconBorder, button)
	end

	if button.Highlight then
		button.Highlight:SetColorTexture(1, 1, 1, .25)
		button.Highlight:SetInside()
	end

	button.isSkinned = true
end

local function SkinBagItems(view)
	for button in view.buttonPool:EnumerateActive() do
		SkinItemButton(button)
	end

	for group in view.groupPool:EnumerateActive() do
		local title = group.GroupTitle
		if title and not title.IsSkinned then
			title:StripTextures()
			S:HandleButton(title)
		end
	end
end

local function SkinBagListing(listing)
	if not listing or listing.isSkinned then return end

	local view = listing.View
	if not view then return end

	S:HandleTrimScrollBar(view.ScrollBar)

	SkinBagItems(view)
	hooksecurefunc(view, 'UpdateFromExisting', SkinBagItems)

	listing.isSkinned = true
end

local function SkinColumnHeaders(container)
	if not container then return end

	for _, header in next, { container:GetChildren() } do
		if not header.isSkinned then
			header:DisableDrawLayer('BACKGROUND')
			header:CreateBackdrop('Transparent')

			header.isSkinned = true
		end
	end
end

local function SkinRowCells(row)
	if not row.cells then return end

	for _, cell in next, row.cells do
		if cell.Icon and not cell.isSkinned then
			S:HandleIcon(cell.Icon)

			if cell.IconBorder then
				cell.IconBorder:SetTexture(E.ClearTexture)
			end

			cell.isSkinned = true
		end
	end
end

local function SkinResultRows(scrollBox)
	local r, g, b = unpack(E.media.rgbvaluecolor)

	scrollBox:ForEachFrame(function(row)
		SkinRowCells(row)

		if row.isSkinned then return end

		if row.NormalTexture then row.NormalTexture:SetAlpha(0) end
		if row.HighlightTexture then row.HighlightTexture:SetColorTexture(r, g, b, .25) end
		if row.SelectedHighlight then row.SelectedHighlight:SetColorTexture(r, g, b, .35) end

		row.isSkinned = true
	end)
end

local function SkinResultsListing(listing)
	if not listing or listing.isSkinned then return end

	local scrollArea = listing.ScrollArea
	if not scrollArea then return end

	S:HandleTrimScrollBar(scrollArea.ScrollBar)

	SkinColumnHeaders(listing.HeaderContainer)
	SkinResultRows(scrollArea.ScrollBox)

	-- The columns are rebuilt whenever the layout of a listing changes
	hooksecurefunc(listing, 'InitializeTable', function(frame) SkinColumnHeaders(frame.HeaderContainer) end)
	hooksecurefunc(scrollArea.ScrollBox, 'Update', SkinResultRows)

	listing.isSkinned = true
end

local function SkinOptions(frame)
	if not frame then return end

	for _, child in next, { frame:GetChildren() } do
		if not child.isSkinned then
			for _, key in next, EditBoxKeys do
				local box = child[key]
				if box and box.IsObjectType and box:IsObjectType('EditBox') then
					S:HandleEditBox(box)
				end
			end

			if child.CheckBox then S:HandleCheckBox(child.CheckBox) end
			if child.IsExact then S:HandleCheckBox(child.IsExact) end
			if child.RadioButton then S:HandleRadioButton(child.RadioButton) end
			if child.DropDown and child.DropDown:IsObjectType('Button') then
				S:HandleDropDownBox(child.DropDown, child.DropDown:GetWidth())
			end
			if child.MoneyInput then SkinMoneyInput(child.MoneyInput) end
			if child.ResetButton then SkinResetButton(child.ResetButton) end
			if child.Button and child.Description then S:HandleButton(child.Button) end

			if child:IsObjectType('Button') and not child:IsObjectType('CheckButton') then
				if child.texture then
					SkinResetButton(child)
				else
					S:HandleButton(child)
				end
			end

			child.isSkinned = true
		end

		SkinOptions(child)
	end
end

local function SkinConfigPanels()
	for _, name in next, ConfigPanels do
		local panel = _G[name]
		if panel and not panel.isSkinned then
			SkinOptions(panel)

			panel.isSkinned = true
		end
	end
end

local function SkinExportLists(dialog)
	for checkBox in dialog.checkBoxPool:EnumerateActive() do
		if not checkBox.isSkinned then
			S:HandleCheckBox(checkBox.CheckBox)

			checkBox.isSkinned = true
		end
	end
end

local function SkinShoppingDialogs(frame)
	-- Search Term Options
	local itemDialog = frame.itemDialog
	if itemDialog then
		S:HandlePortraitFrame(itemDialog)
		itemDialog:SetTemplate() -- Overwrite the transparent template of the portrait handler
		SkinOptions(itemDialog)
	end

	-- Import, Export and Price History
	for _, dialog in next, { frame.exportDialog, frame.importDialog, frame.exportCSVDialog, frame.itemHistoryDialog } do
		if dialog then
			SkinPanel(dialog)
			SkinInset(dialog.Inset)
			SkinResultsListing(dialog.ResultsListing)

			if dialog.ScrollBar then
				S:HandleTrimScrollBar(dialog.ScrollBar)
			end

			if dialog.Recipient then
				S:HandleEditBox(dialog.Recipient.InputBox)
			end

			if dialog.CloseDialog then
				S:HandleCloseButton(dialog.CloseDialog)
			end

			-- One checkbox per shopping list, they are pooled and rebuilt whenever the lists change
			if dialog.checkBoxPool then
				SkinExportLists(dialog)
				hooksecurefunc(dialog, 'RefreshLists', SkinExportLists)
			end

			for _, button in next, { dialog.Close, dialog.Dock, dialog.Export, dialog.Import, dialog.SelectAll, dialog.UnselectAll } do
				if button then
					S:HandleButton(button)
				end
			end
		end
	end
end

local function SkinShoppingTab(frame)
	if not frame or frame.isSkinned then return end

	SkinInset(frame.ShoppingResultsInset)
	SkinResultsListing(frame.ResultsListing)

	-- Search Options
	local options = frame.SearchOptions
	if options then
		S:HandleEditBox(options.SearchString)
		SkinResetButton(options.ResetSearchStringButton)

		for _, button in next, { options.SearchButton, options.MoreButton, options.AddToListButton } do
			S:HandleButton(button)
		end
	end

	-- Lists and Recent Searches
	for _, container in next, { frame.ListsContainer, frame.RecentsContainer } do
		if container then
			SkinInset(container.Inset)
			S:HandleTrimScrollBar(container.ScrollBar)
		end
	end

	local containerTabs = frame.ContainerTabs
	if containerTabs then
		S:HandleTab(containerTabs.ListsTab)
		S:HandleTab(containerTabs.RecentsTab)
	end

	-- Buttons
	for _, button in next, { frame.NewListButton, frame.ExportButton, frame.ImportButton, frame.ExportCSV, frame.LoadAllPagesButton } do
		if button then
			S:HandleButton(button)
		end
	end

	SkinShoppingDialogs(frame)

	frame.isSkinned = true
end

local function SkinSaleItem(saleItem)
	if not saleItem then return end

	SkinItemButton(saleItem.Icon)
	SkinRefreshButton(saleItem)
	SkinOptions(saleItem)
end

local function SkinSellingTab(frame)
	if not frame or frame.isSkinned then return end

	SkinInset(frame.BagInset)
	SkinInset(frame.HistoricalPriceInset)
	SkinBagListing(frame.BagListing)
	SkinSaleItem(frame.SaleItemFrame)

	for _, listing in next, { frame.CurrentPricesListing, frame.HistoricalPriceListing, frame.PostingHistoryListing } do
		SkinResultsListing(listing)
	end

	local tabs = frame.PricesTabsContainer
	if tabs then
		S:HandleTab(tabs.CurrentPricesTab)
		S:HandleTab(tabs.PriceHistoryTab)
		S:HandleTab(tabs.YourHistoryTab)
	end

	frame.isSkinned = true
end

local function SkinCancellingTab(frame)
	if not frame or frame.isSkinned then return end

	SkinInset(frame.HistoricalPriceInset)
	SkinResultsListing(frame.ResultsListing)
	SkinRefreshButton(frame)

	if frame.SearchFilter then
		S:HandleEditBox(frame.SearchFilter)
	end

	local scan = frame.UndercutScanContainer
	if scan then
		for _, button in next, { scan.CancelNextButton, scan.StartScanButton } do
			if button then
				S:HandleButton(button)
			end
		end
	end

	frame.isSkinned = true
end

local function SkinConfigTab(frame)
	if not frame or frame.isSkinned then return end

	SkinInset(frame)

	for _, button in next, { frame.ScanButton, frame.OptionsButton } do
		if button then
			S:HandleButton(button)
		end
	end

	for _, link in next, { frame.ContributeLink, frame.DiscordLink, frame.BugReportLink } do
		if link and link.InputBox then
			S:HandleEditBox(link.InputBox)
		end
	end

	frame.isSkinned = true
end

-- Modern auction house item and commodity purchase frames
local function SkinBuyFrame(frame)
	if not frame or frame.isSkinned then return end

	SkinInset(frame.Inset)
	SkinResultsListing(frame.ResultsListing)
	SkinItemIcon(frame.IconAndName)
	SkinRefreshButton(frame)

	if frame.BackButton then
		S:HandleButton(frame.BackButton)
	end

	local details = frame.DetailsContainer
	if details then
		S:HandleEditBox(details.Quantity)
		S:HandleButton(details.BuyButton)
	end

	for _, dialog in next, { frame.BuyDialog, frame.WidePriceRangeWarningDialog, frame.FinalConfirmationDialog, frame.QuantityCheckConfirmationDialog } do
		if dialog then
			SkinPanel(dialog)
			SkinItemIcon(dialog.IconAndName)

			if dialog.QuantityInput then
				S:HandleEditBox(dialog.QuantityInput)
			end

			for _, button in next, { dialog.AcceptButton, dialog.ContinueButton, dialog.CancelButton, dialog.Cancel, dialog.Buy } do
				if button then
					S:HandleButton(button)
				end
			end
		end
	end

	frame.isSkinned = true
end

-- Legacy auction house purchase frame
local function SkinLegacyBuyFrame(frame)
	if not frame or frame.isSkinned then return end

	for _, button in next, { frame.HistoryButton, frame.ReturnButton } do
		if button then
			S:HandleButton(button)
		end
	end

	local current = frame.CurrentPrices
	if current then
		SkinInset(current.Inset)
		SkinResultsListing(current.SearchResultsListing)

		for _, button in next, { current.LoadAllPagesButton, current.StopLoadingNowButton, current.CancelButton, current.BuyButton, current.RefreshButton } do
			if button then
				S:HandleButton(button)
			end
		end

		local dialog = current.BuyDialog
		if dialog then
			SkinPanel(dialog)
			SkinPanel(dialog.WarningDialog)
			SkinOptions(dialog)
		end
	end

	local history = frame.HistoryPrices
	if history then
		SkinInset(history.Inset)
		SkinResultsListing(history.RealmHistoryResultsListing)
		SkinResultsListing(history.PostingHistoryResultsListing)

		for _, button in next, { history.PostingHistoryButton, history.RealmHistoryButton } do
			if button then
				S:HandleButton(button)
			end
		end
	end

	frame.isSkinned = true
end

local function SkinTabs()
	local container = _G.AuctionatorAHTabsContainer
	if not container or not container.Tabs then return end

	-- ElvUI insets the tab backdrop by three pixels on Retail and by ten on every other client
	local offset = E.Retail and -5 or -19

	local auctionHouse = _G.AuctionHouseFrame
	local lastTab = isModernAH and auctionHouse and auctionHouse.Tabs and auctionHouse.Tabs[#auctionHouse.Tabs]

	for _, tab in ipairs(container.Tabs) do
		S:HandleTab(tab)

		if isModernAH then
			tab:SetHitRectInsets(0, 0, 0, 0)
		else
			lastTab = lastTab or _G['AuctionFrameTab' .. (tab:GetID() - 1)]
		end

		if lastTab then
			tab:ClearAllPoints()
			tab:Point('TOPLEFT', lastTab, 'TOPRIGHT', offset, 0)
		end

		lastTab = tab
	end
end

-- The popups are created on demand
local function SkinDialogs()
	local index, dialog = 1, _G.AuctionatorDialog1

	while dialog do
		if not dialog.isSkinned then
			SkinPanel(dialog)

			if dialog.editBox then
				S:HandleEditBox(dialog.editBox)
			end

			for _, button in next, { dialog.acceptButton, dialog.altButton, dialog.cancelButton } do
				if button then
					S:HandleButton(button)
				end
			end

			dialog.isSkinned = true
		end

		index = index + 1
		dialog = _G['AuctionatorDialog' .. index]
	end
end

local function SkinAuctionHouse()
	if auctionHouseSkinned then return end

	local shopping = _G.AuctionatorShoppingFrame
	if not shopping then return end

	SkinTabs()
	SkinShoppingTab(shopping)
	SkinSellingTab(_G.AuctionatorSellingFrame)
	SkinCancellingTab(_G.AuctionatorCancellingFrame)
	SkinConfigTab(_G.AuctionatorConfigFrame)

	if isModernAH then
		SkinBuyFrame(_G.AuctionatorBuyItemFrame)
		SkinBuyFrame(_G.AuctionatorBuyCommodityFrame)
	else
		SkinLegacyBuyFrame(_G.AuctionatorBuyFrame)

		local selling = _G.AuctionatorSellingFrame
		if selling then
			SkinLegacyBuyFrame(selling.BuyFrame)
		end

		SkinPanel(_G.AuctionatorPageStatusDialogFrame)
		SkinPanel(_G.AuctionatorThrottlingTimeoutDialogFrame)
	end

	auctionHouseSkinned = true
end

-- The crafting and enchanting info frames attach to the profession windows
local function SkinCraftingInfo()
	for _, name in next, CraftingFrames do
		local frame = _G[name]
		if frame and not frame.isSkinned then
			if frame.SearchButton then
				S:HandleButton(frame.SearchButton)
			end

			local quantity = frame.CustomQuantity
			if quantity then
				S:HandlePortraitFrame(quantity)
				quantity:SetTemplate() -- Overwrite the transparent template of the portrait handler
				SkinOptions(quantity)
			end

			frame.isSkinned = true
		end
	end

	local search = _G.AuctionatorTradeSkillSearch
	if search and not search.IsSkinned then
		S:HandleButton(search)
	end
end

local function Skin_Auctionator()
	if not Private.Addon.db.profile.skins.Auctionator then return end

	local Auctionator = _G.Auctionator
	if not Auctionator then return end

	SkinConfigPanels()

	for _, dialog in next, { 'ShowConfirm', 'ShowConfirmAlt', 'ShowEditBox', 'ShowMoney' } do
		if Auctionator.Dialogs[dialog] then
			hooksecurefunc(Auctionator.Dialogs, dialog, SkinDialogs)
		end
	end

	-- The tracked recipe search is added to the objective tracker on login
	E:Delay(0, SkinCraftingInfo)
end

local function Skin_AuctionatorAuctionHouse()
	if not Private.Addon.db.profile.skins.Auctionator then return end
	if not Private.IsAddOnLoaded('Auctionator') then return end

	local frame = _G.AuctionHouseFrame or _G.AuctionFrame
	if not frame then return end

	-- Frames are build when the auction house opens. Skin them one frame later.
	frame:HookScript('OnShow', function() E:Delay(0, SkinAuctionHouse) end)

	if frame:IsShown() then
		E:Delay(0, SkinAuctionHouse)
	end
end

local function Skin_AuctionatorProfessions()
	if not Private.Addon.db.profile.skins.Auctionator then return end
	if not Private.IsAddOnLoaded('Auctionator') then return end

	-- Search buttons are added while the profession window opens. Skin them one frame later.
	for _, name in next, { 'CraftFrame', 'ProfessionsCustomerOrdersFrame', 'ProfessionsFrame', 'TradeSkillFrame' } do
		local frame = _G[name]
		if frame and not frame.LuckyoneUI_Auctionator then
			frame:HookScript('OnShow', function() E:Delay(0, SkinCraftingInfo) end)

			frame.LuckyoneUI_Auctionator = true
		end
	end

	E:Delay(0, SkinCraftingInfo)
end

S:AddCallbackForAddon('Auctionator', 'LuckyoneUI_Auctionator', Skin_Auctionator)
S:AddCallbackForAddon(isModernAH and 'Blizzard_AuctionHouseUI' or 'Blizzard_AuctionUI', 'LuckyoneUI_Auctionator_AuctionHouse', Skin_AuctionatorAuctionHouse)

if Private.isRetail then
	S:AddCallbackForAddon('Blizzard_Professions', 'LuckyoneUI_Auctionator_Professions', Skin_AuctionatorProfessions)
	S:AddCallbackForAddon('Blizzard_ProfessionsCustomerOrders', 'LuckyoneUI_Auctionator_CustomerOrders', Skin_AuctionatorProfessions)
else
	S:AddCallbackForAddon('Blizzard_CraftUI', 'LuckyoneUI_Auctionator_Craft', Skin_AuctionatorProfessions)
	S:AddCallbackForAddon('Blizzard_TradeSkillUI', 'LuckyoneUI_Auctionator_TradeSkill', Skin_AuctionatorProfessions)
end
