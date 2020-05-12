local addon, ns = ...
local E, L, V, P, G = unpack(ElvUI)
local MyPluginName = "LuckyoneUI"
local EP = LibStub("LibElvUIPlugin-1.0")
local LUI = E:NewModule(MyPluginName, "AceHook-3.0", "AceEvent-3.0", "AceTimer-3.0");

LUI.Version = GetAddOnMetadata(addon, "Version")
LUI.Config = {}
P[MyPluginName] = {}

function LUI:Initialize()
	E.private.install_complete = E.version

	if E.private.install_complete and E.db[MyPluginName].install_version == nil then
		E:GetModule("PluginInstaller"):Queue(LUI.InstallerData)
	end
	--Insert LUI Config
	EP:RegisterPlugin(addon, LUI.Configtable)
end

--Called by ElvUI automatically when it is ready to initialize modules
local function CallbackInitialize()
	LUI:Initialize()
end

E:RegisterModule(MyPluginName, CallbackInitialize)
