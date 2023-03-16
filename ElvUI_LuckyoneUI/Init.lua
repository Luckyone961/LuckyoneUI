local E, _, V, P, G = unpack(ElvUI)
local L = E.Libs.ACL:GetLocale('ElvUI', E.global.general.locale)
local EP = LibStub('LibElvUIPlugin-1.0')
local PI = E:GetModule('PluginInstaller')

local _G = _G
local tonumber = tonumber
local GetAddOnMetadata = GetAddOnMetadata

local addon, Engine = ...
local L1UI = E:NewModule(addon, 'AceConsole-3.0', 'AceHook-3.0', 'AceEvent-3.0', 'AceTimer-3.0')

Engine[1] = L1UI
Engine[2] = E
Engine[3] = L
Engine[4] = V
Engine[5] = P
Engine[6] = G
_G[addon] = Engine

-- Constants
L1UI.Config = {}
L1UI.CreditsList = {}
L1UI.DefaultFont = 'Expressway'
L1UI.DefaultTexture = 'Minimalist'
L1UI.Logo = 'Interface\\AddOns\\ElvUI_LuckyoneUI\\Media\\Textures\\Clover.tga'
L1UI.Name = '|cff4beb2cLuckyoneUI|r'
L1UI.RequiredElvUI = tonumber(GetAddOnMetadata(addon, 'X-Required-ElvUI'))
L1UI.Version = tonumber(GetAddOnMetadata(addon, 'Version'))

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

	EP:RegisterPlugin(addon, L1UI.Config)
	L1UI:RegisterEvents()

	-- If auto update is enabled
	if E.db.L1UI.general.auto_update and (E.global.L1UI.install_version < L1UI.Version) then
		L1UI:UpdateLayout()
	end
end

local function CallbackInitialize()
	L1UI:Initialize()
end

E:RegisterModule(addon, CallbackInitialize)
