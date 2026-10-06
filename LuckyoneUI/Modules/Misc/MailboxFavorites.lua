local _, Private = ...
local L = Private.L

local ipairs = ipairs
local floor = math.floor
local max = math.max
local min = math.min
local gsub = string.gsub
local strlower = string.lower
local strmatch = string.match
local tinsert = table.insert
local tremove = table.remove
local wipe = wipe

local CreateFrame = CreateFrame
local strtrim = strtrim
local UnitFactionGroup = UnitFactionGroup

local _G = _G
local GameTooltip = GameTooltip
local GameTooltip_Hide = GameTooltip_Hide
local RAID_CLASS_COLORS = RAID_CLASS_COLORS
local WHITE_FONT_COLOR = WHITE_FONT_COLOR

local Factions = {
	Alliance = { label = 'A', name = FACTION_ALLIANCE, r = 0, g = 0.44, b = 0.87 },
	Horde = { label = 'H', name = FACTION_HORDE, r = 0.77, g = 0.12, b = 0.23 },
}

local panel, hooked, skinned
local inset = 6 -- Row padding inside the list
local display = {} -- Filtered copy of the favorites
local myRealm = strlower(Private.myNormalizedRealm)
local Layout -- The drag scripts on the buttons redraw through it

local function CreateText(parent, justify)
	local db = Private.Addon.db.profile.misc.mailbox

	local text = parent:CreateFontString(nil, 'OVERLAY')
	text:SetJustifyH(justify or 'CENTER')
	text:SetWordWrap(false)
	Private:SetFont(text, db.font, db.fontSize, db.fontOutline)

	return text
end

local function SplitName(name)
	local character, realm = strmatch(name, '^([^%-]+)%-(.+)$')
	return character or name, realm
end

local function IsCurrentRealm(name)
	local _, realm = SplitName(name)
	return not realm or strlower(gsub(realm, '[%s%-%.]', '')) == myRealm
end

-- The config picks its selected entry through this as well
function Private:MailboxFavorites_Find(name)
	if not name then return end

	for index, favorite in ipairs(Private.Addon.db.profile.misc.mailbox.favorites) do
		if strlower(favorite.name) == strlower(name) then
			return favorite, index
		end
	end
end

local function MoveFavorite(favorite, target)
	local list = Private.Addon.db.profile.misc.mailbox.favorites
	local _, from = Private:MailboxFavorites_Find(favorite.name)
	local _, to = Private:MailboxFavorites_Find(target.name)
	if not from or not to then return end

	-- Everything between the old and the new spot shifts over
	tinsert(list, to, tremove(list, from))
	Private:MailboxFavorites_Update()
end

local function Button_OnEnter(button)
	local favorite = button.favorite
	if not favorite or panel.dragIndex then return end

	local color = RAID_CLASS_COLORS[favorite.class] or WHITE_FONT_COLOR
	local info = Factions[favorite.faction] or Factions.Alliance
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
local function Button_OnDragStart(button)
	if not button.favorite then return end

	GameTooltip:Hide()
	Private:DragList_Start(panel, button)
end

local function Button_OnDragStop()
	local from, to = Private:DragList_Stop(panel)
	if not from then return end

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

	panel.rows[index] = button

	return button
end

local function UpdateButton(button, favorite)
	local color = RAID_CLASS_COLORS[favorite.class] or WHITE_FONT_COLOR
	local info = Factions[favorite.faction] or Factions.Alliance

	-- The realm only shows up in the tooltip, the click sends the full name
	button.text:SetText((SplitName(favorite.name)))
	button.text:SetTextColor(color.r, color.g, color.b)
	button.faction:SetText(info.label)
	button.faction:SetTextColor(info.r, info.g, info.b)
end

local function UpdateFonts()
	local db = Private.Addon.db.profile.misc.mailbox

	Private:SetFont(panel.title, db.font, db.fontSize, db.fontOutline)

	for _, button in ipairs(panel.rows) do
		Private:SetFont(button.text, db.font, db.fontSize, db.fontOutline)
		Private:SetFont(button.faction, db.font, db.fontSize, db.fontOutline)
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

	for index = 1, max(visible, #panel.rows) do
		local button = panel.rows[index] or CreateButton(index)
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

local function Panel_OnHide(self)
	Private:DragList_Stop(self)
end

local function CreatePanel()
	local MailFrame = _G.MailFrame
	if not MailFrame then return end

	-- Follow the ElvUI Mail skin so the panel always matches the frame beside it
	skinned = Private.ElvUI and ElvUI[1].private.skins.blizzard.enable and ElvUI[1].private.skins.blizzard.mail

	-- Non retail got an empty close button the DefaultPanel corner
	local header = not skinned and Private.isModern
	inset = (skinned and 6) or (header and 4) or 12

	panel = CreateFrame('Frame', 'LuckyoneMailboxFavorites', MailFrame, (skinned and 'BackdropTemplate') or (header and 'DefaultPanelTemplate') or 'TranslucentFrameTemplate')
	panel:SetWidth(180)
	panel:SetPoint('TOPLEFT', MailFrame, 'TOPRIGHT', skinned and 1 or 0, 0)
	panel:SetPoint('BOTTOMLEFT', MailFrame, 'BOTTOMRIGHT', skinned and 1 or 0, 0)
	panel:EnableMouse(true)
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

	Private:DragList_Init(panel, Layout)

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
	-- The send editbox wants the normalized realm, no spaces, hyphens or periods
	local entry = strtrim(name or '') .. '-' .. gsub(strtrim(realm or ''), '[%s%-%.]', '')

	if not strmatch(entry, '^[^%-]+%-[^%-]+$') then
		Private:Print(L["Enter a character and a realm name."])
		return
	end

	if Private:MailboxFavorites_Find(entry) then
		Private:Print(L["This character is already in your favorites."])
		return
	end

	-- Pandaren
	tinsert(Private.Addon.db.profile.misc.mailbox.favorites, { name = entry, class = Private.myClass, faction = UnitFactionGroup('player') == 'Horde' and 'Horde' or 'Alliance' })
	Private:MailboxFavorites_Update()

	return entry
end

function Private:MailboxFavorites_Remove(name)
	local _, index = Private:MailboxFavorites_Find(name)
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

function Private:MailboxFavorites()
	if hooked or not Private.Addon.db.profile.misc.mailbox.enable then return end

	local SendMailFrame = _G.SendMailFrame
	if not SendMailFrame then return end

	-- The list only exists on Send Mail tab
	SendMailFrame:HookScript('OnShow', Private.MailboxFavorites_Update)
	SendMailFrame:HookScript('OnHide', Private.MailboxFavorites_Update)

	hooked = true
end
