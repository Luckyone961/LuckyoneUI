local _, Private = ...

local next = next
local pairs = pairs
local setmetatable = setmetatable
local strmatch = string.match
local wipe = wipe

local CreateFrame = CreateFrame
local GetFriendAccountInfo = C_BattleNet and C_BattleNet.GetFriendAccountInfo
local GetFriendInfoByIndex = C_FriendList and C_FriendList.GetFriendInfoByIndex
local hooksecurefunc = hooksecurefunc

local _G = _G
local BNET_CLIENT_WOW = BNET_CLIENT_WOW
local FRIENDS_BUTTON_TYPE_BNET = FRIENDS_BUTTON_TYPE_BNET or 3
local FRIENDS_BUTTON_TYPE_WOW = FRIENDS_BUTTON_TYPE_WOW or 2
local FRIENDS_WOW_NAME_COLOR_CODE = FRIENDS_WOW_NAME_COLOR_CODE or '|cfffee15c'
local LOCALIZED_CLASS_NAMES_FEMALE = LOCALIZED_CLASS_NAMES_FEMALE
local LOCALIZED_CLASS_NAMES_MALE = LOCALIZED_CLASS_NAMES_MALE
local RAID_CLASS_COLORS = RAID_CLASS_COLORS
local TimerunningUtil = TimerunningUtil

local BracketChars = {
	PARENTHESES = { '(', ')' },
	SQUARE = { '[', ']' },
	NONE = { '', '' },
}

local Separators = {
	DASH = ' - ',
	PIPE = ' || ',
}

local StatusColors = {
	ONLINE = { 0.3, 0.85, 0.3 },
	AFK = { 1, 0.75, 0.1 },
	DND = { 0.9, 0.2, 0.2 },
	OFFLINE = { 0.5, 0.5, 0.5 },
}

local FactionIcons = {
	Alliance = [[Interface\FriendsFrame\PlusManz-Alliance]],
	Horde = [[Interface\FriendsFrame\PlusManz-Horde]],
}

local hooked
local ClassTokens -- Localized class name to class token
local character = {} -- Reused for every button

-- Every list button the hook has seen
-- Keeps the Blizzard font and color
local buttons = setmetatable({}, { __mode = 'k' })

local function BuildClassTokens()
	ClassTokens = {}

	-- Battle.net resolves class, race, realm and zone from IDs on our side
	-- Retail classes stays nil on Classic (We color nil in gray)
	for token, name in pairs(LOCALIZED_CLASS_NAMES_MALE) do
		ClassTokens[name] = token
	end

	if LOCALIZED_CLASS_NAMES_FEMALE then
		for token, name in pairs(LOCALIZED_CLASS_NAMES_FEMALE) do
			ClassTokens[name] = token
		end
	end
end

-- Unknown classes go gray, the gold Blizzard uses looks like a Rogue
local function ClassColorCode(className)
	if not ClassTokens then BuildClassTokens() end

	local token = className and ClassTokens[className]
	local color = token and RAID_CLASS_COLORS[token]
	if not color then return '|cff999999' end

	return '|c' .. color.colorStr
end

local function GetCharacter(button, db)
	wipe(character)

	-- Status for every friend row
	if button.buttonType == FRIENDS_BUTTON_TYPE_WOW then
		local info = GetFriendInfoByIndex(button.id)
		if not info then return end

		character.status = (not info.connected and 'OFFLINE') or (info.afk and 'AFK') or (info.dnd and 'DND') or 'ONLINE'
		if not (info.connected and info.name) then return character end

		-- Connected realm friends carry the realm in their name, it moves to the zone line while enabled
		local name, realm = strmatch(info.name, '^([^%-]+)%-(.+)$')
		character.name = (db.realm and name) or info.name
		character.realm = realm
		character.level = info.level
		character.className = info.className
		character.area = info.area

	-- The rest only for online WoW characters
	elseif button.buttonType == FRIENDS_BUTTON_TYPE_BNET then
		local accountInfo = GetFriendAccountInfo(button.id)
		local game = accountInfo and accountInfo.gameAccountInfo
		if not game then return end

		character.status = (not game.isOnline and 'OFFLINE') or ((accountInfo.isAFK or game.isGameAFK) and 'AFK') or ((accountInfo.isDND or game.isGameBusy) and 'DND') or 'ONLINE'
		if not (game.isOnline and game.clientProgram == BNET_CLIENT_WOW) or game.isWowMobile then return character end
		if not game.characterName or game.characterName == '' then return character end

		character.name = game.characterName
		character.account = accountInfo.accountName
		character.realm = (game.realmDisplayName ~= '' and game.realmDisplayName) or game.realmName
		character.level = game.characterLevel
		character.className = game.className
		character.area = game.areaName
		character.faction = game.factionName
		character.timerunning = game.timerunningSeasonID
	else
		return
	end

	return character
end

local function Wrap(code, text)
	return text ~= '' and (code .. text .. '|r') or ''
end

local function NameText(db, char)
	local name = char.name
	local code = db.classColor and ClassColorCode(char.className)
	local level = (db.level and char.level and char.level > 0) and (' ' .. char.level) or ''

	-- Same realm friends already get the WoW name color from Blizzard
	if not char.account then
		return (code and (code .. name .. '|r') or name) .. level
	end

	local brackets = BracketChars[db.bracketStyle] or BracketChars.PARENTHESES

	-- |r falls back to the Battle.net name color, so the parts around a class colored name get wrapped on their own
	-- Brackets in white, the level keeps the Blizzard gold
	if code then
		name = Wrap('|cffffffff', brackets[1]) .. code .. name .. '|r' .. Wrap(FRIENDS_WOW_NAME_COLOR_CODE, level) .. Wrap('|cffffffff', brackets[2])
	else
		name = Wrap('|cffffffff', brackets[1]) .. FRIENDS_WOW_NAME_COLOR_CODE .. name .. level .. '|r' .. Wrap('|cffffffff', brackets[2])
	end

	name = char.account .. ' ' .. name

	if char.timerunning and char.timerunning ~= 0 and TimerunningUtil and TimerunningUtil.AddSmallIcon then
		name = TimerunningUtil.AddSmallIcon(name)
	end

	return name
end

-- Blizzard already shows the realm behind the zone of Battle.net friends - disabled strips it
-- Friends on another game version bring no zone or realm fields - only the Zone
local function InfoText(db, char, current)
	local area, realm = char.area, char.realm

	if not area or area == '' then
		area, realm = strmatch(current or '', '^(.-) %- (.+)$')
		if not area then return end
	end

	if not db.realm then return area end
	if not realm or realm == '' then return end

	return area .. (Separators[db.realmSeparator] or Separators.DASH) .. realm
end

local function ApplyFonts(button, db)
	Private:SetFont(button.name, db.font, db.fontSize, db.fontOutline)
	Private:SetFont(button.info, db.infoFont, db.infoFontSize, db.infoFontOutline)
end

-- Blizzard values from before the first tweak
local function SaveText(text)
	local path, size, flags = text:GetFont()
	local r, g, b = text:GetTextColor()
	return { object = text:GetFontObject(), path = path, size = size, flags = flags, r = r, g = g, b = b }
end

local function RestoreText(text, saved)
	if saved.object then
		text:SetFontObject(saved.object)
	else
		text:SetFont(saved.path, saved.size, saved.flags)
	end

	text:SetTextColor(saved.r, saved.g, saved.b)
end

local function CreateSquare(button)
	local square = CreateFrame('Frame', nil, button)
	square:SetSize(10, 10)
	square:SetPoint('CENTER', button.status)

	-- Black border with the status color inside, same look as the ElvUI templates
	square.border = square:CreateTexture(nil, 'BACKGROUND')
	square.border:SetColorTexture(0, 0, 0)
	square.border:SetAllPoints()

	square.color = square:CreateTexture(nil, 'ARTWORK')
	square.color:SetPoint('TOPLEFT', 1, -1)
	square.color:SetPoint('BOTTOMRIGHT', -1, 1)

	button.LuckyoneStatus = square

	return square
end

local function UpdateStatus(button, db, status)
	if not button.status then return end

	local square = button.LuckyoneStatus
	if db.statusIcon ~= 'SQUARE' then
		if square then
			square:Hide()
			button.status:Show()
		end
		return
	end

	local color = StatusColors[status]
	square = square or CreateSquare(button)
	square.color:SetColorTexture(color[1], color[2], color[3])
	square:Show()
	button.status:Hide()
end

local function UpdateFriendButton(button)
	local db = Private.Addon.db.profile.misc.friendsList
	if not db.enable then return end

	local name, info = button.name, button.info
	if not (name and info) then return end

	if not buttons[button] then
		buttons[button] = { name = SaveText(name), info = SaveText(info) }
		ApplyFonts(button, db)
	end

	local saved = buttons[button].info
	local char = GetCharacter(button, db)
	if not char then return end

	UpdateStatus(button, db, char.status)

	-- Offline, mobile or another game keeps the Blizzard text
	if not char.name then
		info:SetTextColor(saved.r, saved.g, saved.b)
		return
	end

	name:SetText(NameText(db, char))

	local infoText = InfoText(db, char, info:GetText())
	if infoText then
		info:SetText(infoText)
	end

	if db.infoColorType == 'CUSTOM' then
		info:SetTextColor(db.infoColor.r, db.infoColor.g, db.infoColor.b)
	else
		info:SetTextColor(saved.r, saved.g, saved.b)
	end

	local texture = db.factionIcon and button.gameIcon and FactionIcons[char.faction]
	if texture then
		button.gameIcon:SetTexture(texture)
		button.gameIcon:SetTexCoord(0, 1, 0, 1)
	end
end

function Private:FriendsList_Update()
	local db = Private.Addon.db.profile.misc.friendsList

	for button, saved in next, buttons do
		if db.enable then
			ApplyFonts(button, db)
		else
			RestoreText(button.name, saved.name)
			RestoreText(button.info, saved.info)

			if button.LuckyoneStatus then
				button.LuckyoneStatus:Hide()
				button.status:Show()
			end
		end
	end

	-- Blizzard rebuilds the text, the hook does the rest
	local FriendsListFrame = _G.FriendsListFrame
	if FriendsListFrame and FriendsListFrame:IsVisible() and _G.FriendsList_Update then
		_G.FriendsList_Update(true)
	end
end

-- Restore profile defaults config button
function Private:FriendsList_ResetDefaults()
	Private:ResetDefaults(Private.Addon.db.profile.misc.friendsList, Private.Defaults.profile.misc.friendsList)
	Private:FriendsList_Update()
end

function Private:FriendsList()
	if hooked or not Private.Addon.db.profile.misc.friendsList.enable then return end
	if not _G.FriendsFrame_UpdateFriendButton then return end

	hooksecurefunc('FriendsFrame_UpdateFriendButton', UpdateFriendButton)
	hooked = true
end
