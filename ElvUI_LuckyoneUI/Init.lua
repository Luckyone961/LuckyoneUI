local addon, ns = ...
local E, L, V, P, G = unpack(ElvUI)
local MyPluginName = 'LuckyoneUI'
local EP = LibStub('LibElvUIPlugin-1.0')
local L1UI = E:NewModule(MyPluginName, 'AceHook-3.0', 'AceEvent-3.0', 'AceTimer-3.0');

L1UI.Version = GetAddOnMetadata(addon, 'Version')
L1UI.Config = {}
P[MyPluginName] = {}

function L1UI:Initialize()
	if E.private.install_complete and E.db[MyPluginName].install_version == nil then
		E:GetModule('PluginInstaller'):Queue(L1UI.InstallerData)
	end

	--Insert L1UI Config
	EP:RegisterPlugin(addon, L1UI.Configtable)
end

--Called by ElvUI automatically when it is ready to initialize modules
local function CallbackInitialize()
	L1UI:Initialize()
end

E:RegisterModule(MyPluginName, CallbackInitialize)
