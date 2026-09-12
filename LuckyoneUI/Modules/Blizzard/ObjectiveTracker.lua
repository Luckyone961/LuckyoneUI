local _, Private = ...
local LSM = Private.Libs.LSM

-- Credits: WindTools
-- The module is inspired by their Objective Tracker styling

local gsub = string.gsub
local ipairs = ipairs
local pairs = pairs
local setmetatable = setmetatable
local strfind = string.find
local type = type
local unpack = unpack
local wipe = wipe

local hooksecurefunc = hooksecurefunc

local _G = _G
local NORMAL_FONT_COLOR = NORMAL_FONT_COLOR
local RAID_CLASS_COLORS = RAID_CLASS_COLORS

local E = Private.ElvUI and ElvUI[1]
local S -- ElvUI skins, only while its objective tracker skin is active

local hooked

-- Blizzard color styles, the highlight ones stay untouched so mouseover keeps working
local Normal, Header, Complete, Failed

local underlines = setmetatable({}, { __mode = 'k' })
local modules = setmetatable({}, { __mode = 'k' })
local blocks = setmetatable({}, { __mode = 'k' })
local skinned = setmetatable({}, { __mode = 'k' })
local poiAnchors = setmetatable({}, { __mode = 'k' }) -- Blizzard y offset of every quest icon, refreshed by each layout

-- Delve, currency and timer headers inside the scenario widget containers
local headerWidgets = {
	[Enum.UIWidgetVisualizationType.ScenarioHeaderCurrenciesAndBackground] = true,
	[Enum.UIWidgetVisualizationType.ScenarioHeaderDelves] = true,
	[Enum.UIWidgetVisualizationType.ScenarioHeaderTimer] = true,
}

local function GetColor(colorType, custom)
	if colorType == 'CLASS' then
		return (E and E:ClassColor(Private.myClass, true)) or RAID_CLASS_COLORS[Private.myClass]
	end

	return custom
end

-- Font strings and font objects share these
local function SetFont(text, db)
	local outline = db.fontOutline
	local shadow = strfind(outline, 'SHADOW')
	if shadow then
		outline = gsub(outline, 'SHADOW', '')
	end

	text:SetFont(LSM:Fetch('font', db.font), db.fontSize, outline == 'NONE' and '' or outline)
	text:SetShadowColor(0, 0, 0, shadow and 1 or 0)
	text:SetShadowOffset(1, -1)
end

local function UpdateUnderline(header, db)
	local underline = underlines[header]
	if not underline then
		-- Below the text and above the Blizzard art, black border behind the bar like the ElvUI templates
		underline = { border = header:CreateTexture(nil, 'BACKGROUND'), bar = header:CreateTexture(nil, 'BACKGROUND', nil, 1) }
		underline.border:SetColorTexture(0, 0, 0)
		underlines[header] = underline
	end

	local border, bar = underline.border, underline.bar
	if not db.underline then
		border:Hide()
		bar:Hide()
		return
	end

	local color = GetColor(db.underlineColorType, db.underlineColor)
	bar:SetTexture(LSM:Fetch('statusbar', db.underlineTexture))
	bar:SetVertexColor(color.r, color.g, color.b)

	-- Grows up from the bottom edge of the header, the block or header below never gets covered
	-- The bar sits inside the border, zero width follows the header
	local inset = db.underlineBorder and 1 or 0
	local width, height, offset = db.underlineWidth, db.underlineHeight, db.underlineOffset
	local innerWidth, innerHeight = width - inset * 2, height - inset * 2
	local dynamic = width == 0

	border:ClearAllPoints()
	border:SetPoint('BOTTOMLEFT', header, 'BOTTOMLEFT', 0, offset)
	bar:ClearAllPoints()
	bar:SetPoint('BOTTOMLEFT', header, 'BOTTOMLEFT', inset, offset + inset)

	if dynamic then
		border:SetPoint('BOTTOMRIGHT', header, 'BOTTOMRIGHT', 0, offset)
		bar:SetPoint('BOTTOMRIGHT', header, 'BOTTOMRIGHT', -inset, offset + inset)
	else
		border:SetWidth(width)

		if innerWidth > 0 then
			bar:SetWidth(innerWidth)
		end
	end

	border:SetHeight(height)
	border:SetShown(db.underlineBorder)

	-- Zero is not a size to a texture, it falls back to the file dimensions
	-- Nothing fits inside the border at a height of 1 or 2, so only the border stays
	if innerHeight > 0 and (dynamic or innerWidth > 0) then
		bar:SetHeight(innerHeight)
		bar:Show()
	else
		bar:Hide()
	end
end

-- Main header of the tracker and the header of every module (Quests, Campaign, World Quests)
local function UpdateHeader(header, db)
	local text = header.Text
	SetFont(text, db)

	-- Blizzard only colors these through the font object, so a color sticks
	local color = db.colorType == 'DEFAULT' and NORMAL_FONT_COLOR or GetColor(db.colorType, db.color)
	text:SetTextColor(color.r, color.g, color.b)

	if header.Background then
		header.Background:SetShown(not db.hideBackground)
	end

	UpdateUnderline(header, db)
end

-- Blizzard remembers the applied style on the string, nil until the first text
-- Highlight and timer styles stay Blizzard, this also puts a color back after switching to default
local function ColorText(text, colorType, custom, db)
	local style = text.colorStyle
	if not style then return end

	local color = style
	if style == Normal or style == Header then
		color = colorType ~= 'DEFAULT' and GetColor(colorType, custom) or style
	elseif style == Complete then
		color = db.completeColor
	elseif style == Failed then
		color = db.failedColor
	end

	text:SetTextColor(color.r, color.g, color.b)
end

local function ColorBlock(block)
	local db = Private.Addon.db.profile.misc.objectiveTracker.content

	if block.HeaderText then
		ColorText(block.HeaderText, db.titleColorType, db.titleColor, db)
	end

	if not block.usedLines then return end

	for _, line in pairs(block.usedLines) do
		ColorText(line.Text, db.lineColorType, db.lineColor, db)

		-- Blizzard only colors the dash on mouseover
		if line.Dash then
			line.Dash:SetTextColor(line.Text:GetTextColor())
		end
	end
end

-- Not a protected frame, the click opens the group finder from Blizzard code
-- Only textures and a backdrop child get touched, never the questID attribute
local function SkinFindGroupButtons(module)
	local frames = module.usedRightEdgeFrames
	if not (S and frames and Private.Addon.db.profile.misc.objectiveTracker.findGroupSkin) then return end

	for _, button in pairs(frames) do
		if not skinned[button] and button.template == 'QuestObjectiveFindGroupButtonTemplate' then
			-- Backdrop as a child, SetTemplate on the button would overwrite the template key
			S:HandleButton(button, nil, nil, nil, true)

			-- The button keeps its 30 pixel click area, the backdrop wraps the 13 pixel eye instead
			-- The eye artwork sits low and left in its atlas, one pixel down and right looks centered
			local backdrop, icon = button.backdrop, button.Icon
			if backdrop and icon then
				backdrop:ClearAllPoints()
				backdrop:SetPoint('TOPLEFT', icon, -2, 2)
				backdrop:SetPoint('BOTTOMRIGHT', icon, 4, -4)
			end

			skinned[button] = true
		end
	end
end

-- ElvUI paints the bar backdrop with a darkened copy of the fill color
-- This faded backdrop color fits the rest of the UI better
local function ColorProgressBar(module, key)
	if not S then return end

	local progressBar = module.usedProgressBars[key]
	local backdrop = progressBar and progressBar.Bar.backdrop
	if backdrop then
		backdrop:SetBackdropColor(unpack(E.media.backdropfadecolor))
	end
end

-- Every setup puts the texture kit fill back on the bar
local function UpdateTimerBar(widget)
	local bar = widget.TimerBar
	bar:SetStatusBarTexture(E.media.normTex)
	bar:SetStatusBarColor(0.294, 0.922, 0.173)
end

-- Every setup puts the texture on the toast so alpha zero again
local function SkinHeaderWidget(container, widgetID)
	local widget = container.widgetFrames[widgetID]
	if not widget or skinned[widget] or not headerWidgets[widget.widgetType] then return end

	widget.Frame:SetAlpha(0)
	widget.ThemeOverlay:SetAlpha(0)
	widget.DecorationBottomLeft:SetAlpha(0)

	-- The widget takes the size of its toast, so the backdrop can follow the frame
	-- The level below the widget is only good until the next layout, see UpdateWidgetLevels
	widget:CreateBackdrop('Transparent')

	-- The created backdrop needs -2px width and -4px height
	local backdrop = widget.backdrop
	backdrop:ClearAllPoints()
	backdrop:SetPoint('TOPLEFT', widget, 0, -1)
	backdrop:SetPoint('BOTTOMRIGHT', widget, 0, 1)

	-- The bar only shows while the texture kit has a fill
	local bar = widget.TimerBar
	if bar then
		bar:CreateBackdrop()
		E:RegisterStatusBar(bar)

		hooksecurefunc(widget, 'Setup', UpdateTimerBar)
		UpdateTimerBar(widget)
	end

	skinned[widget] = true
end

-- Every layout re-parents and re-levels the widgets, a pooled one comes back with the backdrop on top of its content
local function UpdateWidgetLevels(container)
	if not container.widgetFrames then return end

	for _, widget in pairs(container.widgetFrames) do
		if skinned[widget] then
			widget.backdrop:SetFrameLevel(widget:GetFrameLevel() - 1)

			local bar = widget.TimerBar
			if bar then
				bar.backdrop:SetFrameLevel(bar:GetFrameLevel() - 1)
			end
		end
	end
end

local function SkinWidgetContainer(container)
	if skinned[container] then return end
	skinned[container] = true

	hooksecurefunc(container, 'CreateWidget', SkinHeaderWidget)
	hooksecurefunc(container, 'UpdateWidgetLayout', UpdateWidgetLevels)

	-- Whatever the container already holds, nil before its first widget set
	if container.widgetFrames then
		for widgetID in pairs(container.widgetFrames) do
			SkinHeaderWidget(container, widgetID)
		end
	end
end

-- Fixed block with the dungeon, delve or scenario stage name, Blizzard paints a toast behind it
-- Alpha zero instead of clearing the textures, every stage change puts the atlas back on them
local function UpdateStageBackdrop(block)
	block.backdrop:SetShown(block.NormalBG:IsShown())
end

local function SkinScenario(module)
	local block = module.StageBlock
	if not (S and block) or not Private.Addon.db.profile.misc.objectiveTracker.scenarioSkin then return end

	-- Delves and timed scenarios swap the stage toast for a widget
	SkinWidgetContainer(block.WidgetContainer)
	SkinWidgetContainer(module.TopWidgetContainerBlock.WidgetContainer)
	SkinWidgetContainer(module.BottomWidgetContainerBlock.WidgetContainer)

	if skinned[block] then return end

	block.NormalBG:SetAlpha(0)
	block.FinalBG:SetAlpha(0)
	block.ThemeOverlay:SetAlpha(0)
	block.GlowTexture:SetTexture(nil) -- The new stage flash animates the alpha, so the texture has to go

	block:CreateBackdrop('Transparent')

	-- The created backdrop needs -2px width and -4px height
	local backdrop = block.backdrop
	backdrop:ClearAllPoints()
	backdrop:SetPoint('TOPLEFT', block, 0, -1)
	backdrop:SetPoint('BOTTOMRIGHT', block, 0, 1)

	-- Widget driven stages hide the toast and show widgets instead, the backdrop follows
	hooksecurefunc(block, 'UpdateWidgetRegistration', UpdateStageBackdrop)
	UpdateStageBackdrop(block)

	skinned[block] = true
end

-- Pooled quest icon left of the title, its pixel math reads the effective scale
-- Blizzard anchors it fresh during every layout, the config path has no fresh anchor and works from the remembered one
local function UpdatePOIButton(block, fresh)
	local poiButton = block.poiButton
	if not poiButton then return end

	local db = Private.Addon.db.profile.misc.objectiveTracker.content
	poiButton:SetScale(db.poiScale)

	local point, relativeTo, relativePoint, x, y = poiButton:GetPoint(1)
	if fresh then
		poiAnchors[poiButton] = y
	end

	if point and poiAnchors[poiButton] then
		poiButton:SetPoint(point, relativeTo, relativePoint, x, poiAnchors[poiButton] + db.poiOffset)
	end
end

-- Runs as the hook after every layout
local function Module_LayoutBlock(_, block, stale)
	-- Mouseover resets the colors
	-- Blocks built from other templates have no highlight
	if not blocks[block] then
		blocks[block] = true

		if type(block.UpdateHighlight) == 'function' then
			hooksecurefunc(block, 'UpdateHighlight', ColorBlock)
		end
	end

	ColorBlock(block)
	UpdatePOIButton(block, not stale)
end

local function UpdateModule(module)
	if module.Header then
		UpdateHeader(module.Header, Private.Addon.db.profile.misc.objectiveTracker.categoryHeader)
	end

	if not modules[module] then
		modules[module] = true
		hooksecurefunc(module, 'LayoutBlock', Module_LayoutBlock)
		hooksecurefunc(module, 'EndLayout', SkinFindGroupButtons) -- The right edge frames are all there once the layout is done
		hooksecurefunc(module, 'GetProgressBar', ColorProgressBar)
	end

	-- Whatever is on screen right now, pooled quest blocks and the fixed scenario ones
	-- Blizzard only lays out again on its own events, enabling from the config would leave the old colors until then
	if module.usedBlocks then
		for _, list in pairs(module.usedBlocks) do
			for _, block in pairs(list) do
				Module_LayoutBlock(module, block, true)
			end
		end
	end

	if module.FixedBlocks then
		for _, block in ipairs(module.FixedBlocks) do
			Module_LayoutBlock(module, block, true)
		end
	end

	if module.usedProgressBars then
		for key in pairs(module.usedProgressBars) do
			ColorProgressBar(module, key)
		end
	end

	SkinFindGroupButtons(module)
	SkinScenario(module)
end

-- After PLAYER_ENTERING_WORLD
local function Manager_SetModuleContainer(_, module)
	UpdateModule(module)
end

-- Config, also runs after Edit Mode swaps the font objects for its text size and after ElvUI puts its font on them
local function Update()
	if not hooked then return end

	local db = Private.Addon.db.profile.misc.objectiveTracker

	-- One font object behind quest titles, objectives and dashes
	-- Blizzard keeps the old line heights until its next tracker update
	SetFont(_G.ObjectiveTrackerLineFont, db.content)
	UpdateHeader(_G.ObjectiveTrackerFrame.Header, db.mainHeader)

	for container in pairs(_G.ObjectiveTrackerManager.containers) do
		for _, module in ipairs(container.modules) do
			UpdateModule(module)
		end
	end
end
Private.ObjectiveTracker_Update = Update

local function CopyDefaults(db, defaults)
	for key, value in pairs(defaults) do
		-- Sharing a table would write back into the defaults
		db[key] = type(value) == 'table' and CopyDefaults({}, value) or value
	end

	return db
end

-- Restore profile defaults config button
function Private:ObjectiveTracker_ResetDefaults()
	local db = Private.Addon.db.profile.misc.objectiveTracker
	local enable = db.enable

	wipe(db)
	CopyDefaults(db, Private.Defaults.profile.misc.objectiveTracker)

	-- Restoring the look should not switch the option off
	db.enable = enable

	Update()
end

-- Runs on enable, the fonts have to be in place before the tracker builds its first layout at PLAYER_ENTERING_WORLD
function Private:ObjectiveTracker()
	local db = Private.Addon.db.profile.misc.objectiveTracker

	-- Kaliel's Tracker replaces the whole tracker, nothing here may touch it
	if not db.enable or Private.IsAddOnLoaded('!KalielsTracker') then return end

	local manager = _G.ObjectiveTrackerManager
	if not (manager and _G.ObjectiveTrackerFrame) then return end

	-- Follows the ElvUI objective tracker skin, same as the minimize buttons
	S = (E and E.private.skins.blizzard.enable and E.private.skins.blizzard.objectiveTracker) and E:GetModule('Skins') or nil

	if not hooked then
		local styles = _G.OBJECTIVE_TRACKER_COLOR
		Normal, Header, Complete, Failed = styles.Normal, styles.Header, styles.Complete, styles.Failed

		hooksecurefunc(manager, 'SetModuleContainer', Manager_SetModuleContainer)
		hooksecurefunc(manager, 'SetTextSize', Update)

		if E then
			hooksecurefunc(E, 'UpdateBlizzardFonts', Update)
		end

		hooked = true
	end

	Update()
end
