local E, _, V, P, G = unpack(ElvUI)
local L = E.Libs.ACL:GetLocale('ElvUI', E.global.general.locale)
local EP = LibStub('LibElvUIPlugin-1.0')
local addon, Engine = ...

local _G = _G
local format = format
local GetAddOnMetadata = GetAddOnMetadata
local SetCVar = SetCVar

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
	["Luckyone-LaughingSkull"] = true, -- Druid Horde
	["Luckydruid-LaughingSkull"] = true, -- Druid Alliance
	["Luckypriest-LaughingSkull"] = true, -- Priest
	["Luckymonkas-LaughingSkull"] = true, -- Monk
	["Luckyhunter-LaughingSkull"] = true, -- Hunter
	["Luckydh-LaughingSkull"] = true, -- DH
	["Luckymage-LaughingSkull"] = true, -- Mage
	["Luckypala-LaughingSkull"] = true, -- Paladin
	["Luckyrogue-LaughingSkull"] = true, -- Rogue
	["Luckywl-LaughingSkull"] = true, -- Warlock
	["Luckydk-LaughingSkull"] = true, -- DK
	["Luckyevoker-LaughingSkull"] = true, -- Evoker
	["Notlucky-LaughingSkull"] = true, -- Warrior
	["Unluckyone-LaughingSkull"] = true, -- Shaman
	-- Wrath Classic Alliance
	["Luckyone-Everlook"] = true, -- Druid
	["Luckypriest-Everlook"] = true, -- Priest
	["Luckyrogue-Everlook"] = true, -- Rogue
	["Luckyhunter-Everlook"] = true, -- Hunter
	["Luckydk-Everlook"] = true, -- DK
	["Luckykek-Everlook"] = true, -- Shaman
	["Luckyone-Giantstalker"] = true, -- Paladin
	-- Wrath Classic Horde
	["Luckyone-Gehennas"] = true, -- Hunter
	["Luckygrip-Gehennas"] = true, -- DK
	["Luckyd-Golemagg"] = true, -- Druid
	["Luckyp-Golemagg"] = true, -- Priest
	["Luckysh-Golemagg"] = true -- Shaman
}

-- Constants
L1UI.Config = {}
L1UI.CreditsList = {}
L1UI.DefaultFont = 'Expressway'
L1UI.DefaultTexture = 'Minimalist'
L1UI.Logo = 'Interface\\AddOns\\ElvUI_LuckyoneUI\\Media\\Textures\\Clover.tga'
L1UI.Me = toons[name]
L1UI.Name = '|cff4beb2cLuckyoneUI|r'
L1UI.RequiredVersion = 12.93
L1UI.Version = GetAddOnMetadata(addon, 'Version')

function L1UI:Initialize()
	if E.private.install_complete and E.db.L1UI.install_version == nil then
		E.PluginInstaller:Queue(L1UI.InstallerData)
	end

	if L1UI.Me and E.Retail then
		ElvDB.ShadowLightAlpha = false
		SetCVar('ActionButtonUseKeyDown', 1)
	end

	EP:RegisterPlugin(addon, L1UI.Config)
	L1UI:RegisterEvents()
end

local function CallbackInitialize()
	L1UI:Initialize()
end

E:RegisterModule(addon, CallbackInitialize)
