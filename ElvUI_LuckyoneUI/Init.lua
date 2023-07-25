local E, _, V, P, G = unpack(ElvUI)
local L = E.Libs.ACL:GetLocale('ElvUI', E.global.general.locale)
local EP = LibStub('LibElvUIPlugin-1.0')
local PI = E:GetModule('PluginInstaller')

local Name, Private = ...

local tonumber = tonumber
local GetAddOnMetadata = (C_AddOns and C_AddOns.GetAddOnMetadata) or GetAddOnMetadata

L1UI = E:NewModule(Name, 'AceConsole-3.0', 'AceHook-3.0', 'AceEvent-3.0', 'AceTimer-3.0')

Private.Config = {}
Private.Credits = {}
Private.Font = 'Expressway'
Private.Logo = 'Interface\\AddOns\\ElvUI_LuckyoneUI\\Media\\Textures\\Clover.tga'
Private.Name = '|cff4beb2cLuckyoneUI|r'
Private.Texture = 'Minimalist'

Private.RequiredElvUI = tonumber(GetAddOnMetadata(Name, 'X-Required-ElvUI'))
Private.Version = tonumber(GetAddOnMetadata(Name, 'Version'))

local function Initialize()
	if E.private.install_complete == nil then -- Installer skip
		E.private.install_complete = E.version
	end

	if E.global.L1UI.install_version == nil then -- Installer queue
		PI:Queue(L1UI.InstallerData)
	end

	if E.db.L1UI.general.auto_update and (E.global.L1UI.install_version < Private.Version) then
		L1UI:UpdateLayout()
	end

	EP:RegisterPlugin(Name, L1UI.Config)
	L1UI:RegisterEvents()
end

local function CallbackInitialize()
	Initialize()
end

E:RegisterModule(Name, CallbackInitialize)
