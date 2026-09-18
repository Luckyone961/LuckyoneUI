local _, Private = ...

local next = next
local pairs = pairs
local strmatch = string.match
local wipe = wipe

local CreateFrame = CreateFrame
local GetFriendAccountInfo = C_BattleNet.GetFriendAccountInfo
local GetFriendInfoByIndex = C_FriendList.GetFriendInfoByIndex
local hooksecurefunc = hooksecurefunc

local _G = _G
local AddSmallIcon = TimerunningUtil and TimerunningUtil.AddSmallIcon -- Retail only
local BNET_CLIENT_WOW = BNET_CLIENT_WOW
local FRIENDS_BUTTON_TYPE_BNET = FRIENDS_BUTTON_TYPE_BNET
local FRIENDS_BUTTON_TYPE_WOW = FRIENDS_BUTTON_TYPE_WOW
local FRIENDS_GRAY_COLOR = FRIENDS_GRAY_COLOR
local FRIENDS_WOW_NAME_COLOR_CODE = FRIENDS_WOW_NAME_COLOR_CODE
local FriendsFont_Normal = FriendsFont_Normal
local FriendsFont_Small = FriendsFont_Small
local RAID_CLASS_COLORS = RAID_CLASS_COLORS

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
local character = {} -- Reused for every button
local buttons = {} -- Every list button the hook has seen

-- Localized class name to class token, Battle.net only hands us the name
-- Classes of another game version stay nil on Classic
local ClassTokens = {}
for token, name in pairs(LOCALIZED_CLASS_NAMES_MALE) do
	ClassTokens[name] = token
end

for token, name in pairs(LOCALIZED_CLASS_NAMES_FEMALE) do
	ClassTokens[name] = token
end

-- Unknown classes go gray, the gold Blizzard uses looks like a Rogue
local function ClassColorCode(className)
	local token = ClassTokens[className]
	local color = token and RAID_CLASS_COLORS[token]
	return color and ('|c' .. color.colorStr) or '|cff999999'
end

local function GetCharacter(button, db)
	wipe(character)

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
	elseif button.buttonType == FRIENDS_BUTTON_TYPE_BNET then
		local accountInfo = GetFriendAccountInfo(button.id)
		local game = accountInfo and accountInfo.gameAccountInfo
		if not game then return end

		-- Status for every row, the rest only for online WoW characters
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
	local code = db.classColor and ClassColorCode(char.className)
	local level = (db.level and char.level and char.level > 0) and (' ' .. char.level) or ''

	-- Same realm friends already get the WoW name color from Blizzard
	if not char.account then
		return (code and (code .. char.name .. '|r') or char.name) .. level
	end

	-- |r falls back to the Battle.net name color, so the parts around a class colored name get wrapped on their own
	-- Brackets in white, the level keeps the Blizzard gold
	local brackets = BracketChars[db.bracketStyle]
	local name = code and (code .. char.name .. '|r' .. Wrap(FRIENDS_WOW_NAME_COLOR_CODE, level)) or Wrap(FRIENDS_WOW_NAME_COLOR_CODE, char.name .. level)
	name = char.account .. ' ' .. Wrap('|cffffffff', brackets[1]) .. name .. Wrap('|cffffffff', brackets[2])

	return (AddSmallIcon and char.timerunning) and AddSmallIcon(name) or name
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

	return area .. Separators[db.realmSeparator] .. realm
end

local function ApplyFonts(button, db)
	Private:SetFont(button.name, db.font, db.fontSize, db.fontOutline)
	Private:SetFont(button.info, db.infoFont, db.infoFontSize, db.infoFontOutline)
end

local function UpdateStatus(button, db, status)
	local square = button.LuckyoneStatus
	if db.statusIcon ~= 'SQUARE' then
		if square then
			square:Hide()
			button.status:Show()
		end
		return
	end

	if not square then
		square = CreateFrame('Frame', nil, button)
		square:SetSize(10, 10)
		square:SetPoint('CENTER', button.status)

		-- Black border with the status color inside, same look as the ElvUI templates
		local border = square:CreateTexture(nil, 'BACKGROUND')
		border:SetColorTexture(0, 0, 0)
		border:SetAllPoints()

		square.color = square:CreateTexture(nil, 'ARTWORK')
		square.color:SetPoint('TOPLEFT', 1, -1)
		square.color:SetPoint('BOTTOMRIGHT', -1, 1)

		button.LuckyoneStatus = square
	end

	local color = StatusColors[status]
	square.color:SetColorTexture(color[1], color[2], color[3])
	square:Show()
	button.status:Hide()
end

-- Blizzard anchors the star behind the width of its own name text, ours is a different length
-- Blizzard re-anchors it to the name on every update, so the text boxes may never anchor to the star
local function UpdateFavorite(button, db)
	local favorite = button.Favorite -- Retail only
	if not favorite then return end

	local name, info, gameIcon = button.name, button.info, button.gameIcon
	local shown = db.enable and favorite:IsShown()
	local right = shown and db.favoritePosition == 'RIGHT'

	-- Template anchors, on the right side both text boxes end in front of the star instead of running under it
	name:ClearAllPoints()
	name:SetPoint('TOPLEFT', 20, -4)
	info:ClearAllPoints()
	info:SetPoint('TOPLEFT', name, 'BOTTOMLEFT', 0, -3)
	if right then
		name:SetPoint('RIGHT', gameIcon, 'LEFT', -23, 0)
		info:SetPoint('RIGHT', gameIcon, 'LEFT', -23, 0)
	end

	if not shown then return end

	favorite:ClearAllPoints()
	if right then
		favorite:SetPoint('RIGHT', gameIcon, 'LEFT', -4, 0)
	else
		favorite:SetPoint('TOPLEFT', name, 'TOPLEFT', name:GetStringWidth(), 0)
	end
end

local function UpdateFriendButton(button)
	local db = Private.Addon.db.profile.misc.friendsList
	if not db.enable then return end

	if not buttons[button] then
		buttons[button] = true
		ApplyFonts(button, db)
	end

	local char = GetCharacter(button, db)
	if not char then return end

	UpdateStatus(button, db, char.status)

	-- Offline, mobile or another game keeps the Blizzard text
	if char.name then
		button.name:SetText(NameText(db, char))

		local infoText = InfoText(db, char, button.info:GetText())
		if infoText then
			button.info:SetText(infoText)
		end

		local texture = db.factionIcon and FactionIcons[char.faction]
		if texture then
			button.gameIcon:SetTexture(texture)
			button.gameIcon:SetTexCoord(0, 1, 0, 1)
		end
	end

	-- Blizzard never resets the zone color, recycled rows would keep ours
	local color = (char.name and db.infoColorType == 'CUSTOM' and db.infoColor) or FRIENDS_GRAY_COLOR
	button.info:SetTextColor(color.r, color.g, color.b)

	UpdateFavorite(button, db)
end

function Private:FriendsList_Update()
	local db = Private.Addon.db.profile.misc.friendsList

	for button in next, buttons do
		if db.enable then
			ApplyFonts(button, db)
		else
			button.name:SetFontObject(FriendsFont_Normal)
			button.info:SetFontObject(FriendsFont_Small)
			button.info:SetTextColor(FRIENDS_GRAY_COLOR.r, FRIENDS_GRAY_COLOR.g, FRIENDS_GRAY_COLOR.b)
			UpdateFavorite(button, db)

			if button.LuckyoneStatus then
				button.LuckyoneStatus:Hide()
				button.status:Show()
			end
		end
	end

	-- Blizzard rebuilds the text, the hook does the rest
	if _G.FriendsListFrame:IsVisible() then
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

	hooksecurefunc('FriendsFrame_UpdateFriendButton', UpdateFriendButton)
	hooked = true
end
