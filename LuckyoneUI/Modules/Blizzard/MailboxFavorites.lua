local _, Private = ...
local L = Private.Libs.ACL
local LSM = Private.Libs.LSM

local ipairs = ipairs
local floor = math.floor
local max = math.max
local min = math.min
local gsub = string.gsub
local strfind = string.find
local strlower = string.lower
local strmatch = string.match
local tinsert = table.insert
local tremove = table.remove
local wipe = wipe

local CreateFrame = CreateFrame
local GetCursorPosition = GetCursorPosition
local strtrim = strtrim

local _G = _G
local GameTooltip = GameTooltip
local GameTooltip_Hide = GameTooltip_Hide
local RAID_CLASS_COLORS = RAID_CLASS_COLORS

local FACTIONS = {
	Alliance = { label = 'A', name = FACTION_ALLIANCE, r = 0, g = 0.44, b = 0.87 },
	Horde = { label = 'H', name = FACTION_HORDE, r = 0.77, g = 0.12, b = 0.23 },
}

local WHITE = { r = 1, g = 1, b = 1 }

local panel, hooked, skinned
local inset = 6 -- Row padding inside the list
local display = {} -- Filtered copy of the favorites
local myRealm = strlower(Private.myNormalizedRealm)
local Layout -- The drag scripts on the buttons scroll

local function SetFont(text)
	local db = Private.Addon.db.profile.misc.mailbox

	local outline = db.fontOutline
	local shadow = strfind(outline, 'SHADOW')
	if shadow then
		outline = gsub(outline, 'SHADOW', '')
	end

	text:SetFont(LSM:Fetch('font', db.font), db.fontSize, outline == 'NONE' and '' or outline)
	text:SetShadowColor(0, 0, 0, shadow and 1 or 0)
	text:SetShadowOffset(1, -1)
end

local function CreateText(parent, justify)
	local text = parent:CreateFontString(nil, 'OVERLAY')
	text:SetJustifyH(justify or 'CENTER')
	text:SetWordWrap(false)
	SetFont(text)

	return text
end

local function SplitName(name)
	local character, realm = strmatch(name, '^([^%-]+)%-(.+)$')
	return character or name, realm
end

local function IsCurrentRealm(name)
	local _, realm = SplitName(name)
	return not realm or strlower(gsub(realm, '%s', '')) == myRealm
end

local function FindFavorite(name)
	if not name then return end

	for index, favorite in ipairs(Private.Addon.db.profile.misc.mailbox.favorites) do
		if strlower(favorite.name) == strlower(name) then
			return index, favorite
		end
	end
end

local function MoveFavorite(favorite, target)
	local list = Private.Addon.db.profile.misc.mailbox.favorites
	local from, to = FindFavorite(favorite.name), FindFavorite(target.name)
	if not from or not to then return end

	-- Everything between the old and the new spot shifts over
	tinsert(list, to, tremove(list, from))
	Private:MailboxFavorites_Update()
end

local function Button_OnEnter(button)
	local favorite = button.favorite
	if not favorite or panel.dragIndex then return end

	local color = RAID_CLASS_COLORS[favorite.class] or WHITE
	local info = FACTIONS[favorite.faction] or FACTIONS.Alliance
	local name, realm = SplitName(favorite.name)

	GameTooltip:SetOwner(button, 'ANCHOR_RIGHT')
	GameTooltip:AddLine(name, color.r, color.g, color.b)
	if realm then
		GameTooltip:AddLine(realm, 1, 1, 1)
	end
	GameTooltip:AddLine(info.name, info.r, info.g, info.b)
	GameTooltip:Show()
end

local function Button_OnClick(button)
	local favorite = button.favorite
	if not favorite then return end

	local editBox = _G.SendMailNameEditBox
	if editBox then
		editBox:SetText(favorite.name)
	end
end

-- Drag and drop reorder
local function ScrollTo(offset)
	offset = min(max(offset, 0), max(panel.total - panel.visible, 0))
	if offset == panel.offset then return end

	panel.offset = offset
	Layout()
end

-- The row under the cursor
local function DropIndex(y)
	for index = 1, panel.dropCount do
		if y >= panel.buttons[index]:GetBottom() then
			return panel.offset + index
		end
	end

	return panel.offset + panel.dropCount
end

-- One row per step while the drag sits on an edge
local function DragScroll(y, elapsed)
	if panel.total <= panel.visible then return end

	local direction = 0

	if y > panel.buttons[1]:GetTop() then
		direction = -1
	elseif y < panel.buttons[panel.visible]:GetBottom() then
		direction = 1
	end

	if direction == 0 then
		panel.scrollWait = nil
		return
	end

	panel.scrollWait = (panel.scrollWait or 0.15) - elapsed
	if panel.scrollWait > 0 then return end

	panel.scrollWait = 0.15
	ScrollTo(panel.offset + direction)
end

-- The marker sits above the target while moving up and below it while moving down
local function Panel_OnUpdate(self, elapsed)
	local _, y = GetCursorPosition()
	y = y / self:GetEffectiveScale()

	DragScroll(y, elapsed or 0)

	local index = DropIndex(y)
	if index == self.dropIndex then return end

	local row = self.buttons[index - self.offset]
	if not row then return end

	self.dropIndex = index

	self.marker:ClearAllPoints()

	if index <= self.dragIndex then
		self.marker:SetPoint('BOTTOMLEFT', row, 'TOPLEFT', 0, 0)
		self.marker:SetPoint('BOTTOMRIGHT', row, 'TOPRIGHT', 0, 0)
	else
		self.marker:SetPoint('TOPLEFT', row, 'BOTTOMLEFT', 0, 0)
		self.marker:SetPoint('TOPRIGHT', row, 'BOTTOMRIGHT', 0, 0)
	end
end

local function Button_OnDragStart(button)
	if not button.favorite then return end

	panel.dragIndex = button.index
	panel.dropIndex = nil
	panel.scrollWait = nil

	GameTooltip:Hide()
	button:SetAlpha(0.4)
	panel.marker:Show()
	panel:SetScript('OnUpdate', Panel_OnUpdate)

	Panel_OnUpdate(panel)
end

local function Button_OnDragStop()
	local from, to = panel.dragIndex, panel.dropIndex
	if not from then return end

	panel.dragIndex, panel.dropIndex, panel.scrollWait = nil, nil, nil
	panel.marker:Hide()
	panel:SetScript('OnUpdate', nil)

	if to and to ~= from then
		MoveFavorite(panel.entries[from], panel.entries[to])
	else
		Layout() -- Takes the dimming off again
	end
end

local function CreateButton(index)
	-- The Blizzard button brings its own art and highlight, the ElvUI template needs ours
	local button = CreateFrame('Button', nil, panel.list, skinned and 'BackdropTemplate' or 'UIPanelButtonTemplate')
	button:RegisterForDrag('LeftButton')
	button:SetScript('OnClick', Button_OnClick)
	button:SetScript('OnDragStart', Button_OnDragStart)
	button:SetScript('OnDragStop', Button_OnDragStop)
	button:SetScript('OnEnter', Button_OnEnter)
	button:SetScript('OnLeave', GameTooltip_Hide)

	if skinned then
		button:SetTemplate()

		button.highlight = button:CreateTexture(nil, 'HIGHLIGHT')
		button.highlight:SetColorTexture(1, 1, 1, 0.15)
		button.highlight:SetPoint('TOPLEFT', 1, -1)
		button.highlight:SetPoint('BOTTOMRIGHT', -1, 1)
	end

	-- The faction letter keeps its own corner, the name gets trimmed before it
	button.faction = CreateText(button, 'RIGHT')
	button.faction:SetPoint('RIGHT', -4, 0)

	button.text = CreateText(button)
	button.text:SetPoint('LEFT', 4, 0)
	button.text:SetPoint('RIGHT', button.faction, 'LEFT', -2, 0)

	panel.buttons[index] = button

	return button
end

local function UpdateButton(button, favorite)
	local color = RAID_CLASS_COLORS[favorite.class] or WHITE
	local info = FACTIONS[favorite.faction] or FACTIONS.Alliance

	-- The realm only shows up in the tooltip, the click sends the full name
	button.text:SetText((SplitName(favorite.name)))
	button.text:SetTextColor(color.r, color.g, color.b)
	button.faction:SetText(info.label)
	button.faction:SetTextColor(info.r, info.g, info.b)
end

local function UpdateFonts()
	SetFont(panel.title)

	for _, button in ipairs(panel.buttons) do
		SetFont(button.text)
		SetFont(button.faction)
	end
end

function Layout()
	local db = Private.Addon.db.profile.misc.mailbox
	local list = db.favorites

	if db.currentRealm then
		wipe(display)
		for _, favorite in ipairs(list) do
			if IsCurrentRealm(favorite.name) then
				tinsert(display, favorite)
			end
		end

		list = display
	end

	-- Rows grow with the font
	local rowHeight = db.fontSize + 10
	local top = inset + (panel.list == panel and rowHeight or 0)
	local total = #list
	local visible = max(1, floor((panel.list:GetHeight() - top - inset) / (rowHeight + 2)))

	panel.entries = list
	panel.total = total
	panel.visible = visible
	panel.offset = min(panel.offset, max(0, total - visible))
	panel.dropCount = min(visible, total - panel.offset)

	for index = 1, max(visible, #panel.buttons) do
		local button = panel.buttons[index] or CreateButton(index)
		button.favorite = index <= visible and list[index + panel.offset] or nil
		button.index = index + panel.offset

		if button.favorite then
			local y = -(top + ((index - 1) * (rowHeight + 2)))
			button:SetHeight(rowHeight)
			button:SetPoint('TOPLEFT', inset, y)
			button:SetPoint('TOPRIGHT', -inset, y)
			button:SetAlpha((button.index == panel.dragIndex) and 0.4 or 1) -- The dragged one stays dimmed while it scrolls
			UpdateButton(button, button.favorite)
		end

		button:SetShown(button.favorite ~= nil)
	end
end

local function Panel_OnMouseWheel(self, delta)
	ScrollTo(self.offset - delta)
end

local function Panel_OnHide(self)
	self:SetScript('OnUpdate', nil)
	self.dragIndex, self.dropIndex, self.scrollWait = nil, nil, nil
	self.marker:Hide()
end

local function CreatePanel()
	local MailFrame = _G.MailFrame
	if not MailFrame then return end

	-- Follow the ElvUI Mail skin so the panel always matches the frame beside it
	skinned = Private.ElvUI and ElvUI[1].private.skins.blizzard.enable and ElvUI[1].private.skins.blizzard.mail

	-- Non retail got an empty close button the DefaultPanel corner
	local header = not skinned and Private.isRetail
	inset = (skinned and 6) or (header and 4) or 12

	panel = CreateFrame('Frame', 'LuckyoneMailboxFavorites', MailFrame, (skinned and 'BackdropTemplate') or (header and 'DefaultPanelTemplate') or 'TranslucentFrameTemplate')
	panel:SetWidth(180)
	panel:SetPoint('TOPLEFT', MailFrame, 'TOPRIGHT', skinned and 1 or 0, 0)
	panel:SetPoint('BOTTOMLEFT', MailFrame, 'BOTTOMRIGHT', skinned and 1 or 0, 0)
	panel:EnableMouse(true)
	panel:EnableMouseWheel(true)
	panel:SetScript('OnMouseWheel', Panel_OnMouseWheel)
	panel:Hide()

	if skinned then
		panel:SetTemplate('Transparent')
	end

	if header then
		-- Same header and inset every Blizzard frame is built from
		panel.list = CreateFrame('Frame', nil, panel, 'InsetFrameTemplate')
		panel.list:SetPoint('TOPLEFT', 4, -24)
		panel.list:SetPoint('BOTTOMRIGHT', -6, 4)
		panel.title = panel.TitleContainer.TitleText
	else
		-- These only bring a border
		panel.list = panel
		panel.title = CreateText(panel)
		panel.title:SetPoint('TOP', 0, -inset)
	end

	panel.title:SetText(L["Favorites"])

	panel.buttons = {}
	panel.offset = 0
	panel.total = 0
	panel.visible = 0

	-- Shows where a dragged favorite lands, above the rows so it stays visible
	panel.marker = CreateFrame('Frame', nil, panel.list)
	panel.marker:SetFrameLevel(panel.list:GetFrameLevel() + 3)
	panel.marker:SetHeight(2)
	panel.marker:Hide()

	panel.marker.texture = panel.marker:CreateTexture(nil, 'OVERLAY')
	panel.marker.texture:SetColorTexture(1, 1, 1, 0.8)
	panel.marker.texture:SetAllPoints()

	-- A drag does not survive the frame going away
	panel:SetScript('OnHide', Panel_OnHide)
end

function Private:MailboxFavorites_Add(name, realm)
	-- No spaces in the realm part inside the send editbox
	local entry = strtrim(name or '') .. '-' .. gsub(strtrim(realm or ''), '%s', '')

	if not strmatch(entry, '^[^%-]+%-[^%-]+$') then
		Private:Print(L["Enter a character and a realm name."])
		return
	end

	if FindFavorite(entry) then
		Private:Print(L["This character is already in your favorites."])
		return
	end

	tinsert(Private.Addon.db.profile.misc.mailbox.favorites, { name = entry, class = Private.myClass, faction = 'Alliance' })
	Private:MailboxFavorites_Update()

	return entry
end

function Private:MailboxFavorites_Remove(name)
	local index = FindFavorite(name)
	if not index then return end

	tremove(Private.Addon.db.profile.misc.mailbox.favorites, index)
	Private:MailboxFavorites_Update()
end

function Private:MailboxFavorites_Update()
	local SendMailFrame = _G.SendMailFrame
	local show = Private.Addon.db.profile.misc.mailbox.enable and SendMailFrame and SendMailFrame:IsShown()

	if show and not panel then
		CreatePanel()
	end

	if not panel then return end

	if show then
		UpdateFonts()
		Layout()
		panel:Show()
	else
		panel:Hide()
	end
end

local function SendMailFrame_OnToggle()
	Private:MailboxFavorites_Update()
end

function Private:MailboxFavorites()
	if hooked or not Private.Addon.db.profile.misc.mailbox.enable then return end

	local SendMailFrame = _G.SendMailFrame
	if not SendMailFrame then return end

	-- The list only exists on Send Mail tab
	SendMailFrame:HookScript('OnShow', SendMailFrame_OnToggle)
	SendMailFrame:HookScript('OnHide', SendMailFrame_OnToggle)

	hooked = true
end
