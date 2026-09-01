local select = select
local tonumber = tonumber

local GetAddOnMetadata = C_AddOns.GetAddOnMetadata
local GetBuildInfo = GetBuildInfo
local GetRealmName = GetRealmName
local IsAddOnLoaded = C_AddOns.IsAddOnLoaded
local UnitClass = UnitClass
local UnitGUID = UnitGUID
local UnitName = UnitName

local LibStub = LibStub

local WOW_PROJECT_ID = WOW_PROJECT_ID
local WOW_PROJECT_CLASSIC = WOW_PROJECT_CLASSIC
local WOW_PROJECT_BURNING_CRUSADE_CLASSIC = WOW_PROJECT_BURNING_CRUSADE_CLASSIC
local WOW_PROJECT_MISTS_CLASSIC = WOW_PROJECT_MISTS_CLASSIC
local WOW_PROJECT_MAINLINE = WOW_PROJECT_MAINLINE

local Name, Private = ...

-- Create a new AceAddon instance
local LuckyoneUI = LibStub('AceAddon-3.0'):NewAddon(Name, 'AceConsole-3.0', 'AceEvent-3.0', 'AceTimer-3.0')

Private.Addon = LuckyoneUI

Private.Libs = {
	-- Ace
	ADB = LibStub('AceDB-3.0'),
	ABH = LibStub('AceDBOptions-3.0'),
	GUI = LibStub('AceGUI-3.0'),
	AC = LibStub('AceConfig-3.0'),
	ACD = LibStub('AceConfigDialog-3.0'),
	ACL = LibStub('AceLocale-3.0'):GetLocale(Name),
	-- Extras
	LSM = LibStub('LibSharedMedia-3.0'),
	LDB = LibStub('LibDataBroker-1.1'),
	LDBI = LibStub('LibDBIcon-1.0'),
	-- Custom
	ACH = LibStub('LibAceConfigHelper'),
}

-- Logo, Name
Private.Logo = 'Interface\\AddOns\\LuckyoneUI\\Media\\Textures\\Clover.tga'
Private.Name = '|cff4beb2cLuckyoneUI|r'

-- Media
Private.Font = 'Expressway'
Private.Outline = 'OUTLINE'
Private.Texture = 'Minimalist'

-- UI scale values
Private.UIScale1440 = 768 / 1440
Private.UIScale1080 = 768 / 1080

-- Build info
Private.GameVersion = GetBuildInfo()

-- Game flavors
Private.isClassic = WOW_PROJECT_ID == WOW_PROJECT_CLASSIC
Private.isTBC = WOW_PROJECT_ID == WOW_PROJECT_BURNING_CRUSADE_CLASSIC
Private.isMists = WOW_PROJECT_ID == WOW_PROJECT_MISTS_CLASSIC
Private.isRetail = WOW_PROJECT_ID == WOW_PROJECT_MAINLINE

-- API checks
Private.IsAddOnLoaded = IsAddOnLoaded
Private.Version = tonumber(GetAddOnMetadata(Name, 'Version'))

-- Player utils
Private.myClass = select(2, UnitClass('player'))
Private.myGUID = UnitGUID('player')
Private.myName = UnitName('player')
Private.myRealm = GetRealmName()
Private.myNameRealm = Private.myName .. ' - ' .. Private.myRealm

-- ElvUI compatibility
Private.ElvUI = Private.IsAddOnLoaded('ElvUI')
Private.RequiredElvUI = tonumber(GetAddOnMetadata(Name, 'X-Required-ElvUI'))

-- Modules
Private.Modules = {
	Core = Private.Addon:NewModule('Core', 'AceEvent-3.0'),
	Blizzard = Private.Addon:NewModule('Blizzard', 'AceEvent-3.0'),
	DamageMeter = (Private.ElvUI and Private.isRetail) and Private.Addon:NewModule('DamageMeter', 'AceEvent-3.0') or nil,
	Map = Private.ElvUI and Private.Addon:NewModule('Map', 'AceEvent-3.0') or nil,
	Misc = Private.ElvUI and Private.Addon:NewModule('Misc', 'AceEvent-3.0') or nil,
	NamePlates = Private.ElvUI and Private.Addon:NewModule('NamePlates', 'AceEvent-3.0') or nil,
}

-- Called directly after the addon is fully loaded
function Private.Addon:OnInitialize()
	-- SavedVariables
	Private.Addon.db = Private.Libs.ADB:New('LuckyoneDB', Private.Defaults, true)

	-- Register config
	if not Private.ElvUI then
		Private:BuildConfig()
		Private.Libs.AC:RegisterOptionsTable('LuckyoneUI', Private.Config)
		Private.SettingsCategoryID = select(2, Private.Libs.ACD:AddToBlizOptions('LuckyoneUI', 'LuckyoneUI'))
	end
end
