-- Lua functions
local tonumber = tonumber
local unpack = unpack

-- API cache
local GetAddOnMetadata = C_AddOns.GetAddOnMetadata

-- AddOn namespace
local Name, Private = ...

-- ElvUI modules
local E = unpack(ElvUI)
local EP = LibStub('LibElvUIPlugin-1.0')
local PI = E:GetModule('PluginInstaller')

-- Ace modules
L1UI = E:NewModule(Name, 'AceConsole-3.0', 'AceHook-3.0', 'AceEvent-3.0', 'AceTimer-3.0')

-- Constants: Logo, Name
Private.Logo = 'Interface\\AddOns\\ElvUI_LuckyoneUI\\Media\\Textures\\Clover.tga'
Private.Name = '|cff4beb2cLuckyoneUI|r'

-- Constants: Media
Private.Font = 'Expressway'
Private.Outline = 'OUTLINE'
Private.Texture = 'Minimalist'

-- Constants: Tables
Private.Config = {}
Private.Credits = {}

-- Constants: Version checks
Private.RequiredElvUI = tonumber(GetAddOnMetadata(Name, 'X-Required-ElvUI'))
Private.Version = tonumber(GetAddOnMetadata(Name, 'Version'))

-- Initialize module in ElvUI
local function Initialize()
	if E.private.install_complete == nil then -- ElvUI installer skip
		E.private.install_complete = E.version
	end

	if E.global.L1UI.install_version == nil then -- LuckyoneUI installer queue
		PI:Queue(L1UI.InstallerData)
	end

	EP:RegisterPlugin(Name, L1UI.Config)
	L1UI:RegisterEvents()
end

local function CallbackInitialize()
	Initialize()
end

E:RegisterModule(Name, CallbackInitialize)
