local _, Private = ...

if not Private.ElvUI then
	return
end

local next = next
local unpack = unpack

local RunNextFrame = RunNextFrame

local _G = _G

local E = unpack(ElvUI)
local S = E:GetModule('Skins')

-- Dropdown lists, parented to the open dropdown
local function DropDown_OnClick(button)
	for _, list in next, { button.par.frame:GetChildren() } do
		if list.buttons and not list.IsSkinned then
			-- Keep the category color
			local r, g, b, a = list:GetBackdropColor()
			list:SetTemplate()
			list:SetBackdropColor(r, g, b, a)

			list.IsSkinned = true
		end
	end
end

local function Skin_Frame()
	local frame = _G.AtlasLoot.GUI.frame
	if not frame then return end

	-- Main Frame
	frame:SetBackdrop()
	frame:CreateBackdrop('Transparent')

	-- Close Button
	S:HandleCloseButton(frame.CloseButton, frame, -4, -4)

	-- Module and Subcategory Dropdowns
	for _, dropdown in next, { frame.moduleSelect, frame.subCatSelect } do
		local box = dropdown.frame
		box:SetTemplate()

		local arrow = box.button
		S:HandleNextPrevButton(arrow, 'down')
		arrow:Point('RIGHT', box, 'RIGHT', -3, 0)

		box:HookScript('OnClick', DropDown_OnClick)
		arrow:HookScript('OnClick', DropDown_OnClick)
	end

	-- Difficulty, Boss and Extra Lists
	for _, list in next, { frame.difficulty, frame.boss, frame.extra } do
		list.frame:SetTemplate()
		S:HandleScrollBar(list.frame.scrollbar)
	end

	-- Content Frame
	local content = frame.contentFrame
	content:CreateBackdrop()

	for _, button in next, { content.itemsButton, content.modelButton, content.soundsButton } do
		S:HandleButton(button)
	end

	S:HandleNextPrevButton(content.prevPageButton, 'left', nil, true)
	S:HandleNextPrevButton(content.nextPageButton, 'right', nil, true)

	S:HandleEditBox(content.searchBox)
	content.searchBox:Height(22)

	-- BiS and PSA Footers below the window
	for _, footer in next, { _G.AtlasLoot_BiS_Footer, _G.AtlasLoot_PSA_Footer } do
		footer:SetBackdrop()
		footer:CreateBackdrop('Transparent')
		footer.backdrop:Point('TOPLEFT', footer, 'TOPLEFT', -E.Border, 0)
	end

	local phaseDropdown = _G.AtlasLoot_BiSPhaseDropdown
	if phaseDropdown then
		S:HandleDropDownBox(phaseDropdown, phaseDropdown:GetWidth(), nil, true)

		for _, child in next, { phaseDropdown:GetParent():GetChildren() } do
			if child:IsObjectType('CheckButton') then
				S:HandleCheckBox(child)
			end
		end
	end
end

local function Skin_AtlasLoot()
	if not Private.Addon.db.profile.skins.AtlasLoot then return end

	-- AtlasLoot adds the footers on PLAYER_LOGIN
	RunNextFrame(Skin_Frame)
end

S:AddCallbackForAddon('AtlasLootClassic', 'LuckyoneUI_AtlasLoot', Skin_AtlasLoot)
