local geterrorhandler = geterrorhandler
local gsub = string.gsub
local next = next
local pairs = pairs
local select = select
local setmetatable = setmetatable
local strmatch = string.match
local tonumber = tonumber
local type = type
local wipe = table.wipe
local xpcall = xpcall

local CopyTable = CopyTable
local CreateFrame = CreateFrame
local GetAddOnMetadata = C_AddOns.GetAddOnMetadata
local GetBuildInfo = GetBuildInfo
local GetRealmName = GetRealmName
local IsAddOnLoaded = C_AddOns.IsAddOnLoaded
local MergeTable = MergeTable
local UnitClass = UnitClass
local UnitGUID = UnitGUID
local UnitName = UnitName

local _G = _G
local LibStub = LibStub

local WOW_PROJECT_ID = WOW_PROJECT_ID
local WOW_PROJECT_CLASSIC = WOW_PROJECT_CLASSIC
local WOW_PROJECT_BURNING_CRUSADE_CLASSIC = WOW_PROJECT_BURNING_CRUSADE_CLASSIC
local WOW_PROJECT_MISTS_CLASSIC = WOW_PROJECT_MISTS_CLASSIC
local WOW_PROJECT_MAINLINE = WOW_PROJECT_MAINLINE

local Name, Private = ...
Private.Addon = {}

Private.Libs = {
	-- Extras
	LSM = LibStub('LibSharedMedia-3.0'),
	LDB = LibStub('LibDataBroker-1.1'),
	LDBI = LibStub('LibDBIcon-1.0'),
	-- Custom
	ACH = LibStub('LibAceConfigHelper'),
}

-- Locales
local translations = {}
Private.L = setmetatable({}, {
	__index = function(_, key) return translations[key] or key end,
	__newindex = function(_, key, value) if value ~= true then translations[key] = value end end,
})

-- Logo, Name
Private.Logo = 'Interface\\AddOns\\LuckyoneUI\\Media\\Textures\\Clover.tga'
Private.Name = '|cff4beb2cLuckyoneUI|r'

-- Media
Private.IconPath = 'Interface\\AddOns\\LuckyoneUI\\Media\\Icons\\'
Private.Font = 'Expressway'
Private.Outline = 'OUTLINE'
Private.Texture = 'Minimalist'

-- UI scale values
Private.UIScale1440 = 768 / 1440
Private.UIScale1080 = 768 / 1080

-- Build info
Private.GameVersion = GetBuildInfo()
Private.GameTOC = select(4, GetBuildInfo())

-- Game flavors
Private.isClassic = WOW_PROJECT_ID == WOW_PROJECT_CLASSIC
Private.isTBC = WOW_PROJECT_ID == WOW_PROJECT_BURNING_CRUSADE_CLASSIC
Private.isMists = WOW_PROJECT_ID == WOW_PROJECT_MISTS_CLASSIC
Private.isForever = Private.GameTOC == 16001
Private.isRetail = WOW_PROJECT_ID == WOW_PROJECT_MAINLINE and not Private.isForever
Private.isModern = Private.isRetail or Private.isForever

-- API checks
Private.IsAddOnLoaded = IsAddOnLoaded

-- Packager fills the TOC version from the git tag
-- Alpha tags look like 4.23-alpha1 and source keeps raw @project-version@
Private.VersionString = GetAddOnMetadata(Name, 'Version')
Private.Version = tonumber(strmatch(Private.VersionString, '^[%d%.]+'))

-- Bump with every release, same as ElvUI does for source checkouts
if not Private.Version then
	Private.Version, Private.VersionString = 4.23, '4.23-git'
end

-- Player utils
Private.myClass = select(2, UnitClass('player'))
Private.myGUID = UnitGUID('player')
Private.myName = UnitName('player')
Private.myRealm = GetRealmName()
Private.myNameRealm = Private.myName .. ' - ' .. Private.myRealm

-- Same as GetNormalizedRealmName, which is still nil this early
Private.myNormalizedRealm = gsub(Private.myRealm, '[%s%-%.]', '')

-- ElvUI compatibility
Private.ElvUI = Private.IsAddOnLoaded('ElvUI')
Private.RequiredElvUI = tonumber(GetAddOnMetadata(Name, 'X-Required-ElvUI'))

-- SavedVariables: LuckyoneDB keeps the AceDB layout (profileKeys, profiles, global)
-- Missing keys are filled from the defaults at load and stripped again at logout
local sv
local db = {}
local function FillDefaults(data, defaults)
	for key, value in pairs(defaults) do
		if type(value) == 'table' then
			if type(data[key]) ~= 'table' then
				data[key] = {}
			end

			FillDefaults(data[key], value)
		elseif data[key] == nil then
			data[key] = value
		end
	end
end

-- Profile export uses this too
function Private:StripDefaults(data, defaults)
	for key, value in pairs(data) do
		local default = defaults[key]
		if type(value) == 'table' and type(default) == 'table' then
			Private:StripDefaults(value, default)
			if not next(value) then
				data[key] = nil
			end
		elseif value == default then
			data[key] = nil
		end
	end
end

function db:GetCurrentProfile()
	return sv.profileKeys[Private.myNameRealm]
end

function db:GetProfiles()
	local names = {}
	for name in pairs(sv.profiles) do
		names[#names + 1] = name
	end

	return names
end

-- Unknown names start as a new profile with defaults
function db:SetProfile(name)
	sv.profileKeys[Private.myNameRealm] = name
	sv.profiles[name] = sv.profiles[name] or {}
	self.profile = sv.profiles[name]
	FillDefaults(self.profile, Private.Defaults.profile)
end

function db:ResetProfile()
	wipe(self.profile)
	FillDefaults(self.profile, Private.Defaults.profile)
end

function db:CopyProfile(name)
	wipe(self.profile)
	MergeTable(self.profile, CopyTable(sv.profiles[name]))
	FillDefaults(self.profile, Private.Defaults.profile)
end

-- Characters on the deleted profile fall back to Default
function db:DeleteProfile(name)
	sv.profiles[name] = nil

	for char, profile in pairs(sv.profileKeys) do
		if profile == name then
			sv.profileKeys[char] = nil
		end
	end
end

-- Modules: Plain tables with their own event frame
-- Events dispatch to module[method](module, event, ...) (AceEvent style)
local modules = {}
local function NewModule()
	local module, events = {}, {}
	local frame = CreateFrame('Frame')
	frame:SetScript('OnEvent', function(_, event, ...) module[events[event]](module, event, ...) end)

	function module:RegisterEvent(event, method) events[event] = method or event frame:RegisterEvent(event) end
	function module:UnregisterEvent(event) events[event] = nil frame:UnregisterEvent(event) end
	function module:UnregisterAllEvents() wipe(events) frame:UnregisterAllEvents() end

	modules[#modules + 1] = module
	return module
end

Private.Modules = {
	Core = NewModule(),
	Blizzard = NewModule(),
	DamageMeter = (Private.ElvUI and Private.isModern) and NewModule() or nil,
	Map = Private.ElvUI and NewModule() or nil,
	Misc = Private.ElvUI and NewModule() or nil,
	NamePlates = Private.ElvUI and NewModule() or nil,
}

-- SavedVariables are ready at ADDON_LOADED
-- Modules enable at PLAYER_LOGIN in creation order
local loader = CreateFrame('Frame')
loader:RegisterEvent('ADDON_LOADED')
loader:RegisterEvent('PLAYER_LOGIN')
loader:RegisterEvent('PLAYER_LOGOUT')
loader:SetScript('OnEvent', function(self, event, addon)
	if event == 'ADDON_LOADED' then
		if addon ~= Name then return end
		self:UnregisterEvent(event)

		sv = _G.LuckyoneDB or {}
		_G.LuckyoneDB = sv
		sv.profileKeys = sv.profileKeys or {}
		sv.profiles = sv.profiles or {}
		sv.global = sv.global or {}
		FillDefaults(sv.global, Private.Defaults.global)

		db.global = sv.global
		db.profiles = sv.profiles
		db:SetProfile(sv.profileKeys[Private.myNameRealm] or 'Default')

		Private.Addon.db = db
		Private:SetupLuckyoneProfile()

	elseif event == 'PLAYER_LOGIN' then
		self:UnregisterEvent(event)

		-- One failing module doesn't stop the others
		for i = 1, #modules do
			local module = modules[i]
			if module.OnEnable then
				xpcall(module.OnEnable, geterrorhandler(), module)
			end
		end

		-- Standalone config inside the Blizzard settings panel
		if not Private.ElvUI then
			Private:BuildConfig()
			Private:RegisterSettings()
		end
	else
		Private:StripDefaults(sv.global, Private.Defaults.global)

		for _, profile in pairs(sv.profiles) do
			Private:StripDefaults(profile, Private.Defaults.profile)
		end
	end
end)
