-- Lua functions
local print = print
local tonumber = tonumber

-- API cache
local C_Timer = C_Timer
local GetAddOnMetadata = C_AddOns.GetAddOnMetadata
local GetRealmName = GetRealmName
local IsAddOnLoaded = C_AddOns.IsAddOnLoaded
local UnitGUID = UnitGUID
local UnitName = UnitName

-- LibStub
local LibStub = LibStub

-- Globals
local WOW_PROJECT_ID = WOW_PROJECT_ID
local WOW_PROJECT_CLASSIC = WOW_PROJECT_CLASSIC
local WOW_PROJECT_MISTS_CLASSIC = WOW_PROJECT_MISTS_CLASSIC
local WOW_PROJECT_MAINLINE = WOW_PROJECT_MAINLINE

-- Addon namespace
local Name, Private = ...

-- Create a new AceAddon instance
local L1UI = LibStub('AceAddon-3.0'):NewAddon(Name, 'AceConsole-3.0', 'AceEvent-3.0', 'AceTimer-3.0')

-- Core reference
Private.Addon = L1UI
Private.Config = {}

-- Libraries
Private.Libs = {
	-- Ace
	ADB = LibStub('AceDB-3.0'),
	ABH = LibStub('AceDBOptions-3.0'),
	GUI = LibStub('AceGUI-3.0'),
	AC = LibStub('AceConfig-3.0'),
	ACD = LibStub('AceConfigDialog-3.0'),
	ACL = LibStub('AceLocale-3.0'):GetLocale(Name),
	-- Custom
	ACH = LibStub('LibAceConfigHelper'),
	LDB = LibStub('LibDataBroker-1.1'),
	LDBI = LibStub('LibDBIcon-1.0'),
	-- Extras
	LSM = LibStub('LibSharedMedia-3.0'),
}

-- Logo, Name
Private.Logo = 'Interface\\AddOns\\ElvUI_LuckyoneUI\\Media\\Textures\\Clover.tga'
Private.Name = '|cff4beb2cLuckyoneUI|r'

-- Media
Private.Font = 'Expressway'
Private.Outline = 'OUTLINE'
Private.Texture = 'Minimalist'

-- Game flavors
Private.isClassic = WOW_PROJECT_ID == WOW_PROJECT_CLASSIC
Private.isMists = WOW_PROJECT_ID == WOW_PROJECT_MISTS_CLASSIC
Private.isRetail = WOW_PROJECT_ID == WOW_PROJECT_MAINLINE

-- API checks
Private.IsAddOnLoaded = IsAddOnLoaded
Private.Version = tonumber(GetAddOnMetadata(Name, 'Version'))

-- Player utils
Private.myGUID = UnitGUID('player')
Private.myName = UnitName('player')
Private.myRealm = GetRealmName()
Private.myNameRealm = Private.myName .. ' - ' .. Private.myRealm

-- ElvUI compatibility
Private.ElvUI = Private.IsAddOnLoaded('ElvUI')
Private.RequiredElvUI = tonumber(GetAddOnMetadata(Name, 'X-Required-ElvUI'))

-- ElvUI init
local function ElvUI_Initialization()
	if not Private.ElvUI then return end

	-- ElvUI modules
	local E = unpack(ElvUI)
	local EP = LibStub('LibElvUIPlugin-1.0')
	local PI = E:GetModule('PluginInstaller')

	-- ElvUI installer skip
	if E.private.install_complete == nil then
		E.private.install_complete = E.version
	end

	-- Shadow & Light installer skip
	if (Private.isRetail and E.private.sle) and E.private.sle.install_complete == nil then
		E.private.sle.install_complete = tonumber(GetAddOnMetadata('ElvUI_SLE', 'Version'))
	end

	-- Convert old db to avoid forced installer re-run
	if E.global.L1UI and E.global.L1UI.install_version ~= nil then
		Private.Addon.db.global.install_version = E.global.L1UI.install_version
		E.global.L1UI.install_version = nil
	end

	-- LuckyoneUI installer queue
	if Private.Addon.db.global.install_version == nil then
		PI:Queue(Private.InstallerData)
	end

	EP:RegisterPlugin(Name, Private.Addon.BuildConfig)
	E:RegisterModule(Name)
end

-- Called directly after the addon is fully loaded
function Private.Addon:OnInitialize()

	-- SavedVariables
	Private.Addon.db = Private.Libs.ADB:New('LuckyoneDB', Private.Defaults, true)

	if Private.ElvUI then
		ElvUI_Initialization()
	else
		-- Register config
		Private.Addon:BuildConfig()
		Private.Libs.AC:RegisterOptionsTable('LuckyoneUI', Private.Config)
		Private.Libs.ACD:AddToBlizOptions('LuckyoneUI', 'LuckyoneUI')
	end

	-- Events
	Private.Addon:RegisterEvents()
end
