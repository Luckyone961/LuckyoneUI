local E, _, V, P, G = unpack(ElvUI)
local L = E.Libs.ACL:GetLocale('ElvUI', E.global.general.locale)
local EP = LibStub('LibElvUIPlugin-1.0')
local PI = E:GetModule('PluginInstaller')

local Name, Private = ...

local _G = _G
local tonumber = tonumber
local GetAddOnMetadata = GetAddOnMetadata

L1UI = E:NewModule(Name, 'AceConsole-3.0', 'AceHook-3.0', 'AceEvent-3.0', 'AceTimer-3.0')

Private.Config = {}
Private.Credits = {}

Private.Font = 'Expressway'
Private.Texture = 'Minimalist'
Private.Logo = 'Interface\\AddOns\\ElvUI_LuckyoneUI\\Media\\Textures\\Clover.tga'
Private.Name = '|cff4beb2cLuckyoneUI|r'
Private.RequiredElvUI = tonumber(GetAddOnMetadata(Name, 'X-Required-ElvUI'))
Private.Version = tonumber(GetAddOnMetadata(Name, 'Version'))

function L1UI:Initialize()
	-- Convert DB
	if E.db.L1UI.install_version then
		E.global.L1UI.install_version = tonumber(E.db.L1UI.install_version)
		E.db.L1UI.install_version = nil
	end

	-- Skip default ElvUI installer
	if E.private.install_complete == nil then
		E.private.install_complete = E.version
	end

	-- Queue LuckyoneUI installer
	if E.global.L1UI.install_version == nil then
		PI:Queue(L1UI.InstallerData)
	end

	EP:RegisterPlugin(Name, L1UI.Config)
	L1UI:RegisterEvents()

	-- If auto update is enabled
	if E.db.L1UI.general.auto_update and (E.global.L1UI.install_version < Private.Version) then
		L1UI:UpdateLayout()
	end
end

local function CallbackInitialize()
	L1UI:Initialize()
end

E:RegisterModule(Name, CallbackInitialize)
