local E, L, V, P, G = unpack(ElvUI)
local EP = LibStub('LibElvUIPlugin-1.0')
local addon, Engine = ...

local L1UI = E:NewModule(addon, 'AceHook-3.0', 'AceEvent-3.0', 'AceTimer-3.0');

Engine[1] = L1UI
Engine[2] = E
Engine[3] = L
Engine[4] = V
Engine[5] = P
Engine[6] = G
_G[addon] = Engine

L1UI.Version = GetAddOnMetadata(addon, 'Version')
L1UI.Config = {}
L1UI.Name = "LuckyoneUI"

function L1UI:Initialize()
	if E.private.install_complete and E.db.L1UI.install_version == nil then
		E:GetModule('PluginInstaller'):Queue(L1UI.InstallerData)
	end

	--Insert L1UI Config
	EP:RegisterPlugin(addon, L1UI.Configtable)
end

--Called by ElvUI automatically when it is ready to initialize modules
local function CallbackInitialize()
	L1UI:Initialize()
end

E:RegisterModule(addon, CallbackInitialize)
