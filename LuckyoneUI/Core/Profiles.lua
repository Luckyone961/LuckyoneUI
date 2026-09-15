local _, Private = ...
local L = Private.L

local next = next
local pairs = pairs
local pcall = pcall
local strmatch = string.match
local type = type

local CompressString = C_EncodingUtil.CompressString
local CopyTable = CopyTable
local DecodeBase64 = C_EncodingUtil.DecodeBase64
local DecompressString = C_EncodingUtil.DecompressString
local DeserializeCBOR = C_EncodingUtil.DeserializeCBOR
local EncodeBase64 = C_EncodingUtil.EncodeBase64
local MergeTable = MergeTable
local SerializeCBOR = C_EncodingUtil.SerializeCBOR
local strtrim = strtrim

local _G = _G
local StaticPopupDialogs = _G.StaticPopupDialogs
local StaticPopup_Show = _G.StaticPopup_Show

local ACCEPT = ACCEPT
local CANCEL = CANCEL

-- Profile export, we skip values which match defaults
local function StripDefaults(data, defaults)
	for key, value in pairs(data) do
		local default = defaults[key]
		if defaults['**'] then -- Damage meter windows
			default = CopyTable(defaults['**'])
			MergeTable(default, defaults[key] or {})
		end

		if type(value) == 'table' and type(default) == 'table' then
			StripDefaults(value, default)
			if not next(value) then
				data[key] = nil
			end
		elseif value == default then
			data[key] = nil
		end
	end
end

-- Custom placed damage meter windows are positioned by ElvUI movers
-- Temporary snapshot
local function ExportMovers()
	if not Private.ElvUI then return end

	local movers, db = {}, ElvUI[1].db.movers
	for index = 1, 4 do
		local name = 'LuckyoneUI_DamageMeterWindow' .. index .. 'Mover'
		movers[name] = db and db[name]
	end

	return movers
end

function Private:ExportProfile()
	local data = CopyTable(Private.Addon.db.profile)
	StripDefaults(data, Private.Defaults.profile)

	local compressed = CompressString(SerializeCBOR({ name = Private.Addon.db:GetCurrentProfile(), profile = data, movers = ExportMovers() }))
	return compressed and '!L1UI!' .. EncodeBase64(compressed) or ''
end

-- Profile import, string carries the export name
local function DecodeProfile(text)
	local encoded = strmatch(strtrim(text), '^!L1UI!(.+)$')
	local compressed = encoded and DecodeBase64(encoded)
	local serialized = compressed and DecompressString(compressed)
	local success, data = pcall(DeserializeCBOR, serialized)
	if success and type(data) == 'table' and type(data.name) == 'string' and type(data.profile) == 'table' then
		return data.name, data.profile, type(data.movers) == 'table' and data.movers or nil
	end
end

local function MergeProfile(profile, data)
	for key, value in pairs(data) do
		if type(value) == 'table' and type(profile[key]) == 'table' then
			MergeProfile(profile[key], value)
		else
			profile[key] = value
		end
	end
end

function Private:LoadProfile(name, data, movers)
	local db = Private.Addon.db
	if name == db:GetCurrentProfile() then
		-- SetProfile ignores the active profile
		db:ResetProfile()
		MergeProfile(db.profile, data)
	else
		db.profiles[name] = data
		db:SetProfile(name)
	end

	-- The reload applies them through E:SetMoversPositions
	if movers and Private.ElvUI then
		local E = ElvUI[1]
		E.db.movers = E.db.movers or {}
		MergeTable(E.db.movers, movers)
	end

	StaticPopup_Show('LUCKYONE_RL')
end

-- Luckyone preset
function Private:SetupLuckyoneProfile()
	local db = Private.Addon.db
	if not db.profiles.Luckyone then
		db.profiles.Luckyone = CopyTable(Private.LuckyoneProfile)
	end

	if Private.itsLuckyone then
		db:SetProfile('Luckyone')
	end
end

-- Restore defaults button, the preset returns to its default values
function Private:ResetProfile()
	local db = Private.Addon.db
	if db:GetCurrentProfile() == 'Luckyone' then
		Private:LoadProfile('Luckyone', CopyTable(Private.LuckyoneProfile))
	else
		db:ResetProfile()
		StaticPopup_Show('LUCKYONE_RL')
	end
end

function Private:ImportProfile(text)
	local name, data, movers = DecodeProfile(text)
	if not data then
		Private:Print(L["Import failed, the profile string is not valid."])
	elseif Private.Addon.db.profiles[name] then
		StaticPopup_Show('LUCKYONE_IMPORT', name, nil, { name = name, profile = data, movers = movers })
	else
		Private:LoadProfile(name, data, movers)
	end
end

-- Import popup, the profile name from the string already exists
-- StaticPopup_Show('LUCKYONE_IMPORT', name, nil, data)
StaticPopupDialogs['LUCKYONE_IMPORT'] = {
	text = L["Profile %s already exists.\n\nOverwrite it or enter a new name."],
	button1 = ACCEPT,
	button2 = CANCEL,
	hasEditBox = 1,
	maxLetters = 50, -- AceDB limit
	OnShow = function(self, data)
		self.EditBox:SetText(data.name)
		self.EditBox:HighlightText()
	end,
	OnAccept = function(self, data)
		Private:LoadProfile(strtrim(self.EditBox:GetText()), data.profile, data.movers)
	end,
	EditBoxOnEnterPressed = function(self, data)
		local dialog = self:GetParent()
		if dialog.Button1:IsEnabled() then
			Private:LoadProfile(strtrim(self:GetText()), data.profile, data.movers)
			dialog:Hide()
		end
	end,
	EditBoxOnEscapePressed = function(self)
		self:GetParent():Hide()
	end,
	EditBoxOnTextChanged = function(self)
		self:GetParent().Button1:SetEnabled(strtrim(self:GetText()) ~= '')
	end,
	whileDead = 1,
	preferredIndex = 3,
	hideOnEscape = 1,
}
