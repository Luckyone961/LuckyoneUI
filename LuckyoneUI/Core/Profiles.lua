local _, Private = ...
local L = Private.L

local pcall = pcall
local strmatch = string.match
local type = type

local CompressString = C_EncodingUtil.CompressString
local CopyTable = CopyTable
local DecodeBase64 = C_EncodingUtil.DecodeBase64
local DecompressString = C_EncodingUtil.DecompressString
local DeserializeCBOR = C_EncodingUtil.DeserializeCBOR
local EncodeBase64 = C_EncodingUtil.EncodeBase64
local SerializeCBOR = C_EncodingUtil.SerializeCBOR
local strtrim = strtrim

local _G = _G
local StaticPopupDialogs = _G.StaticPopupDialogs
local StaticPopup_OnClick = _G.StaticPopup_OnClick
local StaticPopup_Show = _G.StaticPopup_Show
local StaticPopup_StandardEditBoxOnEscapePressed = _G.StaticPopup_StandardEditBoxOnEscapePressed
local StaticPopup_StandardNonEmptyTextHandler = _G.StaticPopup_StandardNonEmptyTextHandler

local ACCEPT = ACCEPT
local CANCEL = CANCEL

-- Profile export, we skip values which match defaults
function Private:ExportProfile()
	local data = CopyTable(Private.Addon.db.profile)

	-- Never export character list of mailbox favorites
	data.misc.mailbox.favorites = nil
	Private:StripDefaults(data, Private.Defaults.profile)

	local compressed = CompressString(SerializeCBOR({ name = Private.Addon.db:GetCurrentProfile(), profile = data, movers = Private.Modules.DamageMeter and Private:DamageMeter_ExportMovers() }))
	return compressed and '!L1UI!' .. EncodeBase64(compressed) or ''
end

-- Profile import, string carries the export name
local function DecodeProfile(text)
	local encoded = type(text) == 'string' and strmatch(strtrim(text), '^!L1UI!(.+)$')
	local compressed = encoded and DecodeBase64(encoded)
	local serialized = compressed and DecompressString(compressed)
	local success, data = pcall(DeserializeCBOR, serialized)
	if success and type(data) == 'table' and type(data.name) == 'string' and type(data.profile) == 'table' then
		return data.name, data.profile, type(data.movers) == 'table' and data.movers or nil
	end
end

local function LoadProfile(name, data, movers)
	local db = Private.Addon.db

	local old = db.profiles[name]
	local favorites = old and old.misc and old.misc.mailbox and old.misc.mailbox.favorites
	if favorites then
		data.misc = data.misc or {}
		data.misc.mailbox = data.misc.mailbox or {}
		data.misc.mailbox.favorites = favorites
	end

	db.profiles[name] = data
	db:SetProfile(name)

	-- Damage meter windows placed with their own mover
	if movers and Private.Modules.DamageMeter then
		Private:DamageMeter_ImportMovers(movers)
	end
end

function Private:ImportProfile(text)
	local name, data, movers = DecodeProfile(text)
	if not data then
		Private:Print(L["Import failed, the profile string is not valid."])
	elseif Private.Addon.db.profiles[name] then
		StaticPopup_Show('LUCKYONE_IMPORT', name, nil, { name = name, profile = data, movers = movers })
	else
		LoadProfile(name, data, movers)
		StaticPopup_Show('LUCKYONE_RL')
	end
end

-- Public API for other addons, called with a dot
-- LuckyoneUI.ExportProfile() returns the current profile string
-- LuckyoneUI.ImportProfile(text[, name]) returns the profile name, or nil for an invalid string
-- Import overwrites an existing profile and switches to it, no popups, the caller reloads
_G.LuckyoneUI = {
	ExportProfile = Private.ExportProfile,
	ImportProfile = function(text, name)
		local imported, data, movers = DecodeProfile(text)
		if data then
			name = name or imported
			LoadProfile(name, data, movers)
			return name
		end
	end,
}

-- Import popup, the profile name from the string already exists
-- StaticPopup_Show('LUCKYONE_IMPORT', name, nil, data)
StaticPopupDialogs['LUCKYONE_IMPORT'] = {
	text = L["Profile %s already exists.\n\nOverwrite it or enter a new name."],
	button1 = ACCEPT,
	button2 = CANCEL,
	hasEditBox = 1,
	maxLetters = 50,
	OnShow = function(self, data)
		self.EditBox:SetText(data.name)
		self.EditBox:HighlightText()
	end,
	OnAccept = function(self, data)
		LoadProfile(strtrim(self.EditBox:GetText()), data.profile, data.movers)
		StaticPopup_Show('LUCKYONE_RL')
	end,
	EditBoxOnEnterPressed = function(self)
		local dialog = self:GetParent()
		if dialog:GetButton1():IsEnabled() then
			StaticPopup_OnClick(dialog, 1)
		end
	end,
	EditBoxOnEscapePressed = StaticPopup_StandardEditBoxOnEscapePressed,
	EditBoxOnTextChanged = StaticPopup_StandardNonEmptyTextHandler,
	whileDead = 1,
	preferredIndex = 3,
	hideOnEscape = 1,
}
