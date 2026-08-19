local _, Private = ...
local Map = Private.Modules.Map
local LDBI = Private.Libs.LDBI

-- ElvUI file
if not Private.ElvUI then
	return
end

-- Credits: MinimapButtonButton, ProjectAzilroka, WindTools
-- I've used them across multiple wow versions and wanted an all-in-one approach.
-- Even if no code was re-used, the module is inspired by their work.

local floor = math.floor
local ipairs = ipairs
local pairs = pairs
local sort = table.sort
local tinsert = table.insert
local unpack = unpack
local wipe = table.wipe

local CreateFrame = CreateFrame
local hooksecurefunc = hooksecurefunc

local _G = _G
local Minimap = _G.Minimap

local E = unpack(ElvUI)
local M = E:GetModule('Minimap')

-- List for non-LibDBIcon minimap buttons (frame names)
Private.CustomMinimapButtons = {
	-- 'AddonName_MinimapButton',
}

-- Called in UpdateMinimapButtonBar when enabled
local RegisterHooks

local function IsLandingPageButton(button)
	return Private.isRetail and button == _G.ExpansionLandingPageMinimapButton
end

local function ApplyHighlight(button)
	button:SetHighlightTexture(E.Media.Textures.White8x8)
	local highlight = button:GetHighlightTexture()
	if highlight then
		highlight:SetVertexColor(1, 1, 1, 0.3)
		highlight:SetInside()
	end
end

-- Keep the ElvUI crop when LibDBIcon refreshes the coords
local function UpdateCoord(self)
	self:SetTexCoord(unpack(E.TexCoords))
end

-- Blizzard art uses SetAtlas(..., UseAtlasSize) and ElvUI re-applies the classHall scale.
-- Instead of fighting both, hide the original art and draw our own copy of the icon.
local function FitLandingPageButton(button, size)
	button:SetIgnoreParentScale(false)
	button:SetScale(1)
	button:SetSize(size, size)
	button:SetHitRectInsets(0, 0, 0, 0)

	local normal = button:GetNormalTexture()
	local pushed = button:GetPushedTexture()

	if normal then normal:SetAlpha(0) end
	if pushed then pushed:SetAlpha(0) end
	if button.LoopingGlow then button.LoopingGlow:SetAlpha(0) end
	if button.AlertBG then button.AlertBG:SetAlpha(0) end
	if button.AlertText then button.AlertText:SetAlpha(0) end

	-- Our own icon respects the bar size, unlike the UseAtlasSize textures
	local icon = button.LuckyoneIcon
	if not icon then
		icon = button:CreateTexture(nil, 'ARTWORK')
		button.LuckyoneIcon = icon
	end

	local atlas = normal and normal.GetAtlas and normal:GetAtlas()
	if atlas then
		icon:SetAtlas(atlas, false)
	end

	-- Atlas art sits slightly high-left: Small down-right nudge to optically center it
	local inset = 2
	icon:ClearAllPoints()
	icon:SetSize(size - (inset * 2), size - (inset * 2))
	icon:SetPoint('CENTER', -1, -1)
	icon:Show()

	-- Blizzard UpdateIcon also resets the highlight to a huge atlas
	ApplyHighlight(button)
end

-- Save the original state so hidden buttons can be restored to the Minimap
local function CaptureState(button)
	if button.LuckyoneState then return end

	local points = {}
	for i = 1, button:GetNumPoints() do
		local point, relativeTo, relativePoint, xOfs, yOfs = button:GetPoint(i)
		points[i] = { point, relativeTo, relativePoint, xOfs, yOfs }
	end

	button.LuckyoneState = {
		parent = button:GetParent(),
		width = button:GetWidth(),
		height = button:GetHeight(),
		scale = button:GetScale(),
		points = points,
		level = button:GetFrameLevel(),
		strata = button:GetFrameStrata(),
		onDragStart = button:GetScript('OnDragStart'),
		onDragStop = button:GetScript('OnDragStop'),
	}
end

local function SkinLandingPageButton(button)
	if not button.LuckyoneSkinned then
		button:SetTemplate()
		button:SetFixedFrameStrata(false)
		button:SetFixedFrameLevel(false)
		button.LuckyoneSkinned = true
	end

	-- UpdateIcon resets atlas size and points: Always re-fit to our bar size
	FitLandingPageButton(button, Private.Addon.db.profile.map.minimap.buttons.size)
end

local function SkinButton(button)
	if IsLandingPageButton(button) then
		SkinLandingPageButton(button)
		return
	end

	if button.LuckyoneSkinned then return end

	local name = button:GetName()
	local icon = button.icon or button.Icon or (name and _G[name .. 'Icon'])

	-- MRT and some other addons place the visible artwork on names like "iconMini"
	if button.iconMini and button.iconMini:GetTexture() and (not icon or not icon:GetTexture()) then
		icon = button.iconMini
	end
	button.icon = icon

	-- Hide every texture that is not the main icon (file IDs, overlays, shadows, etc.)
	local regions = { button:GetRegions() }
	for i = 1, #regions do
		local region = regions[i]
		if region:IsObjectType('Texture') and region ~= icon then
			region:SetAlpha(0)
		end
	end

	if button.iconMini and button.iconMini ~= icon then
		button.iconMini:SetAlpha(0)
	end

	button:SetTemplate()
	button:SetFixedFrameStrata(false)
	button:SetFixedFrameLevel(false)

	if icon then
		icon:SetAlpha(1)
		icon:SetDrawLayer('ARTWORK')
		icon:SetTexCoord(unpack(E.TexCoords))
		icon:SetInside()
		if icon.UpdateCoord then
			icon.UpdateCoord = UpdateCoord
		end
	end

	ApplyHighlight(button)

	button.LuckyoneSkinned = true
end

local function ReleaseButton(button)
	local state = button.LuckyoneState
	if not state then return end

	button:SetParent(state.parent or Minimap)
	button:SetScale(state.scale or 1)
	button:SetSize(state.width, state.height)
	button:SetFrameStrata(state.strata)
	button:SetFrameLevel(state.level)
	button:ClearAllPoints()

	for i = 1, #state.points do
		local p = state.points[i]
		button:SetPoint(p[1], p[2], p[3], p[4], p[5])
	end

	button:SetScript('OnDragStart', state.onDragStart)
	button:SetScript('OnDragStop', state.onDragStop)
	button.LuckyoneState = nil

	-- Restore Blizzard art and let UpdateIcon reapply atlas sizes and anchors
	if IsLandingPageButton(button) then
		if button.LuckyoneIcon then
			button.LuckyoneIcon:Hide()
		end

		local normal = button:GetNormalTexture()
		local pushed = button:GetPushedTexture()
		if normal then normal:SetAlpha(1) end
		if pushed then pushed:SetAlpha(1) end
		if button.LoopingGlow then button.LoopingGlow:SetAlpha(1) end
		if button.AlertBG then button.AlertBG:SetAlpha(1) end
		if button.AlertText then button.AlertText:SetAlpha(1) end

		if button.UpdateIcon then
			button:UpdateIcon()
		end
	end
end

-- Layout grows from TOPRIGHT leftward: index 1 = top-right, last index = far left.
-- BugSack pinned first, Blizzard buttons pinned last, everything else A-Z by name.
local function GetButtonSortRank(button)
	if IsLandingPageButton(button) then
		return 2
	end

	local name = button.GetName and button:GetName() or ''
	if name:match('BugSack$') then
		return 0
	end

	return 1
end

local function SortCollectedButtons(buttons)
	local keys = {}
	for i = 1, #buttons do
		local button = buttons[i]
		keys[button] = { GetButtonSortRank(button), button.GetName and button:GetName() or '' }
	end

	sort(buttons, function(a, b)
		local keyA, keyB = keys[a], keys[b]
		if keyA[1] ~= keyB[1] then
			return keyA[1] < keyB[1]
		end
		return keyA[2] < keyB[2]
	end)
end

local function CollectLibDBIconChildren(parent, buttons, seen)
	if not parent then return end

	local children = { parent:GetChildren() }
	for i = 1, #children do
		local child = children[i]
		local childName = child.GetName and child:GetName()
		if childName and not seen[child] and child:IsShown() and childName:match('^LibDBIcon10_') then
			seen[child] = true
			tinsert(buttons, child)
		end
	end
end

local function CollectButtons()
	local buttons = {}
	local seen = {}
	local bar = Map.buttonBar

	-- Keep buttons we already manage. They are parented to the bar, so the Minimap
	-- fallback below cannot see them and a missed LDBI lookup would Hide() them for good.
	if bar then
		for button in pairs(bar.buttons) do
			if button:IsShown() then
				seen[button] = true
				tinsert(buttons, button)
			end
		end
	end

	-- Blizzard Expansion Landing Page (Garrison / Covenant / DF / TWW) - Retail only
	if Private.isRetail then
		local blizzardDB = Private.Addon.db.profile.map.minimap.buttons.blizzard
		local landing = _G.ExpansionLandingPageMinimapButton
		if blizzardDB.expansionLandingPage and landing and landing:IsShown() and not seen[landing] then
			seen[landing] = true
			tinsert(buttons, landing)
		end
	end

	local names = LDBI:GetButtonList()
	for i = 1, #names do
		local button = LDBI:GetMinimapButton(names[i])
		-- Trust visibility only. Some addons keep db.hide = true while still showing the button.
		if button and not seen[button] and button:IsShown() then
			seen[button] = true
			tinsert(buttons, button)
		end
	end

	-- Fallback: LibDBIcon buttons the list missed (Minimap on first grab, bar after reparent)
	CollectLibDBIconChildren(Minimap, buttons, seen)
	CollectLibDBIconChildren(bar, buttons, seen)

	for i = 1, #Private.CustomMinimapButtons do
		local button = _G[Private.CustomMinimapButtons[i]]
		if button and not seen[button] and button:IsShown() then
			seen[button] = true
			tinsert(buttons, button)
		end
	end

	SortCollectedButtons(buttons)
	return buttons
end

local function ShowBarOnHover(self)
	local bar = Map.buttonBar
	if not bar or not Private.Addon.db.profile.map.minimap.buttons.mouseover then return end
	if self ~= bar and not bar.buttons[self] then return end
	bar:SetAlpha(1)
end

local function HideBarOnHover(self)
	local bar = Map.buttonBar
	if not bar or not Private.Addon.db.profile.map.minimap.buttons.mouseover then return end
	if self ~= bar and not bar.buttons[self] then return end
	if bar:IsMouseOver() then return end
	bar:SetAlpha(0)
end

local function HookButtonMouseover(button)
	if button.LuckyoneMouseoverHooked then return end
	button.LuckyoneMouseoverHooked = true
	button:HookScript('OnEnter', ShowBarOnHover)
	button:HookScript('OnLeave', HideBarOnHover)
end

local function ApplyMouseover(bar)
	local mouseover = Private.Addon.db.profile.map.minimap.buttons.mouseover
	bar:EnableMouse(mouseover)
	bar:SetScript('OnEnter', mouseover and ShowBarOnHover or nil)
	bar:SetScript('OnLeave', mouseover and HideBarOnHover or nil)
	bar:SetAlpha((mouseover and not bar:IsMouseOver()) and 0 or 1)
end

local function EnsureBar(holder)
	local bar = Map.buttonBar
	if bar then
		if bar:GetParent() ~= holder then
			bar:SetParent(holder)
		end
		return bar
	end

	bar = CreateFrame('Frame', 'LuckyoneUI_MinimapButtonBar', holder)
	bar:SetFrameStrata('MEDIUM')
	bar.buttons = {}
	bar:Hide()

	Map.buttonBar = bar
	return bar
end

local function LayoutButtons(holder, buttons)
	local bar = EnsureBar(holder)
	local db = Private.Addon.db.profile.map.minimap.buttons
	local size = db.size
	local perRow = db.perRow
	local xStep = size + db.spacing
	local yStep = size + 1 -- Vertical row gap is always 1px

	local count = #buttons
	local rows = count > 0 and floor((count - 1) / perRow) + 1 or 0
	local height = rows > 0 and (rows * yStep - 1) or 0

	Map.updating = true

	bar:ClearAllPoints()
	bar:SetPoint('TOP', holder, 'BOTTOM', db.xOffset, db.yOffset)
	bar:SetSize(holder:GetWidth(), height)
	wipe(bar.buttons)

	for index, button in ipairs(buttons) do
		CaptureState(button)

		-- Anchor first so a skin/fit error cannot leave buttons unpositioned
		button:SetParent(bar)
		button:SetSize(size, size)
		button:SetScript('OnDragStart', nil)
		button:SetScript('OnDragStop', nil)
		button:ClearAllPoints()

		local slot = index - 1
		button:SetPoint('TOPRIGHT', bar, 'TOPRIGHT', -((slot % perRow) * xStep), -(floor(slot / perRow) * yStep))

		SkinButton(button)
		HookButtonMouseover(button)

		bar.buttons[button] = true
		button:Show()
	end

	bar:SetShown(count > 0)
	if count > 0 then
		ApplyMouseover(bar)
	end
	Map.updating = nil
end

local function ReleaseAll()
	local bar = Map.buttonBar
	if not bar then return end

	Map.updating = true

	for button in pairs(bar.buttons) do
		-- Clear before releasing so the UpdateIcon hook does not re-fit during restore
		bar.buttons[button] = nil
		ReleaseButton(button)
	end

	bar:Hide()
	bar:SetSize(0, 0)

	-- Restore LibDBIcon positioning for released buttons
	local names = LDBI:GetButtonList()
	for i = 1, #names do
		LDBI:Refresh(names[i])
	end

	Map.updating = nil
end

local function RunUpdate()
	Map.updateTimer = nil
	Private:UpdateMinimapButtonBar()
end

local function ScheduleUpdate()
	if Map.updating or Map.updateTimer then return end
	Map.updateTimer = Private.Addon:ScheduleTimer(RunUpdate, 0.1)
end

function Private:UpdateMinimapButtonBar()
	local db = Private.Addon.db.profile.map.minimap.buttons
	if not db.enable or not E.private.general.minimap.enable then
		ReleaseAll()
		return
	end

	-- Covers enable and expansionLandingPage toggles from config
	RegisterHooks()

	local holder = _G[db.holder]
	if not (holder and holder.IsObjectType and holder:IsObjectType('Frame')) then
		holder = Minimap
	end

	if not holder.LuckyoneHooked then
		holder.LuckyoneHooked = true
		holder:HookScript('OnSizeChanged', ScheduleUpdate)
	end

	local buttons = CollectButtons()

	-- Release buttons that left the set (hidden or unregistered)
	local bar = Map.buttonBar
	if bar then
		local keep = {}
		for i = 1, #buttons do
			keep[buttons[i]] = true
		end
		for button in pairs(bar.buttons) do
			if not keep[button] then
				bar.buttons[button] = nil
				ReleaseButton(button)
				-- LibDBIcon hides stay hidden: Leave Expansion Landing Page to Blizzard show/hide events
				if not IsLandingPageButton(button) then
					button:Hide()
				end
			end
		end
	end

	LayoutButtons(holder, buttons)
end

local function RegisterLandingPageHooks()
	if not Private.isRetail then return end

	local button = _G.ExpansionLandingPageMinimapButton
	if not button or button.LuckyoneLandingHooked then return end
	if not Private.Addon.db.profile.map.minimap.buttons.blizzard.expansionLandingPage then return end

	button.LuckyoneLandingHooked = true

	-- UpdateIcon swaps garrison/expansion atlases and calls SetSize with atlas dimensions
	hooksecurefunc(button, 'UpdateIcon', function(self)
		if Map.buttonBar and Map.buttonBar.buttons[self] then
			FitLandingPageButton(self, Private.Addon.db.profile.map.minimap.buttons.size)
		end
		ScheduleUpdate()
	end)

	-- RefreshButton does Hide -> UpdateIcon -> Show when the overlay changes
	hooksecurefunc(button, 'RefreshButton', ScheduleUpdate)
	button:HookScript('OnShow', ScheduleUpdate)
	button:HookScript('OnHide', ScheduleUpdate)

	-- ElvUI re-anchors the button to the Minimap and re-applies the classHall scale
	if M.HandleExpansionButton then
		hooksecurefunc(M, 'HandleExpansionButton', function()
			if Map.buttonBar and Map.buttonBar.buttons[button] then
				FitLandingPageButton(button, Private.Addon.db.profile.map.minimap.buttons.size)
				ScheduleUpdate()
			end
		end)
	end
end

RegisterHooks = function()
	if not Map.buttonBarHooks then
		Map.buttonBarHooks = true

		LDBI.RegisterCallback(Map, 'LibDBIcon_IconCreated', ScheduleUpdate)
		hooksecurefunc(LDBI, 'Hide', ScheduleUpdate)
		hooksecurefunc(LDBI, 'Show', ScheduleUpdate)
		hooksecurefunc(M, 'UpdateSettings', ScheduleUpdate)
	end

	RegisterLandingPageHooks()
end

function Map:PLAYER_ENTERING_WORLD()
	RegisterHooks()
	ScheduleUpdate()
end

function Map:OnEnable()
	local db = Private.Addon.db.profile.map.minimap.buttons
	if not db.enable or not E.private.general.minimap.enable then return end

	self:RegisterEvent('PLAYER_ENTERING_WORLD')
	RegisterHooks()
	ScheduleUpdate()
end
