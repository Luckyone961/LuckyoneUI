local E, _, V, P, G = unpack(ElvUI)
local L = E.Libs.ACL:GetLocale('ElvUI', E.global.general.locale)
local EP = LibStub('LibElvUIPlugin-1.0')
local addon, Engine = ...

local _G = _G
local format = format
local GetAddOnMetadata = GetAddOnMetadata

local L1UI = E:NewModule(addon, 'AceConsole-3.0', 'AceHook-3.0', 'AceEvent-3.0', 'AceTimer-3.0')

Engine[1] = L1UI -- LuckyoneUI
Engine[2] = E -- ElvUI Engine
Engine[3] = L -- ElvUI Locales
Engine[4] = V -- ElvUI PrivateDB
Engine[5] = P -- ElvUI ProfileDB
Engine[6] = G -- ElvUI GlobalDB
_G[addon] = Engine

-- My characters
local name = format('%s-%s', E.myname, E:ShortenRealm(E.myrealm))
local toons = {
	-- Retail
	["Luckyone-LaughingSkull"]		= true, -- [Horde] Druid
	["Luckypriest-LaughingSkull"]	= true, -- [Horde] Priest
	["Luckymonkas-LaughingSkull"]	= true, -- [Horde] Monk
	["Luckyhunter-LaughingSkull"]	= true, -- [Horde] Hunter
	["Luckydh-LaughingSkull"]		= true, -- [Horde] DH
	["Luckymage-LaughingSkull"]		= true, -- [Horde] Mage
	["Luckypala-LaughingSkull"]		= true, -- [Horde] Paladin
	["Luckyrogue-LaughingSkull"]	= true, -- [Horde] Rogue
	["Luckywl-LaughingSkull"]		= true, -- [Horde] Warlock
	["Luckydk-LaughingSkull"]		= true, -- [Horde] DK
	["Luckyevoker-LaughingSkull"]	= true, -- [Horde] Evoker
	["Notlucky-LaughingSkull"]		= true, -- [Horde] Warrior
	["Unluckyone-LaughingSkull"]	= true, -- [Horde] Shaman
	["Luckydruid-LaughingSkull"]	= true, -- [Alliance] Druid
	-- Wrath Classic
	["Luckyone-Gehennas"]			= true, -- [Horde] Hunter
	["Luckygrip-Gehennas"]			= true, -- [Horde] DK
	["Luckyone-Everlook"]			= true, -- [Alliance] Druid
	["Luckypriest-Everlook"]		= true, -- [Alliance] Priest
	["Luckyrogue-Everlook"]			= true, -- [Alliance] Rogue
	["Luckyhunter-Everlook"]		= true, -- [Alliance] Hunter
	["Luckydk-Everlook"]			= true, -- [Alliance] DK
	["Luckykek-Everlook"]			= true, -- [Alliance] Shaman
	["Luckyone-Giantstalker"]		= true, -- [Alliance] Paladin
}

-- Constants
L1UI.Config = {}
L1UI.CreditsList = {}
L1UI.DefaultFont = 'Expressway'
L1UI.DefaultTexture = 'Minimalist'
L1UI.Logo = 'Interface\\AddOns\\ElvUI_LuckyoneUI\\Media\\Textures\\Clover.tga'
L1UI.Me = toons[name]
L1UI.Name = '|cff4beb2cLuckyoneUI|r'
L1UI.RequiredVersion = 13.20
L1UI.Version = GetAddOnMetadata(addon, 'Version')

function L1UI:Initialize()
	if E.private.install_complete and E.db.L1UI.install_version == nil then
		E.PluginInstaller:Queue(L1UI.InstallerData)
	end

	if L1UI.Me and E.Retail then
		ElvDB.ShadowLightAlpha = false
	end

	EP:RegisterPlugin(addon, L1UI.Config)
	L1UI:RegisterEvents()
end

local function CallbackInitialize()
	L1UI:Initialize()
end

E:RegisterModule(addon, CallbackInitialize)
