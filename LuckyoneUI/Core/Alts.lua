local _, Private = ...
local L = Private.L

local concat = table.concat
local format = string.format
local huge = math.huge
local ipairs = ipairs
local pairs = pairs
local select = select
local tinsert = table.insert
local tonumber = tonumber
local wipe = table.wipe

local _G = _G
local LibStub = LibStub
local StaticPopupDialogs = _G.StaticPopupDialogs
local StaticPopup_Show = _G.StaticPopup_Show

local GetSpecialization = C_SpecializationInfo.GetSpecialization
local GetSpecializationInfo = C_SpecializationInfo.GetSpecializationInfo

local NO = NO
local YES = YES

-- Character keys used by the addon databases
local charKey = Private.myNameRealm
local compactKey = Private.myName .. '-' .. Private.myNormalizedRealm

-- Healers get the healing profiles, everyone else the main ones
local function GetSpecLayout()
	local spec = GetSpecialization()
	if not spec then return 'main' end

	local role = select(5, GetSpecializationInfo(spec))
	return (role == 'HEALER' and 'healing') or 'main'
end

-- Version of a profile name (zero for the plain profile) and the ' 2' copies MPlusTimer and NSRT add on a re-import
-- 'Luckyone' -> 0, 0 | 'Luckyone 4.22' -> 4.22, 0 | 'Luckyone 4.22 2' -> 4.22, 1 | 'Luckyone Main' -> nil (wrong base)
local function GetProfileVersion(profile, base)
	if profile:sub(1, #base) ~= base then return end

	local copies = 0
	while #profile > #base and profile:sub(-2) == ' 2' do
		profile, copies = profile:sub(1, -3), copies + 1
	end

	if profile == base then return 0, copies end

	local suffix = profile:sub(#base + 1)
	if suffix:sub(1, 1) ~= ' ' then return end

	local version = tonumber(suffix:sub(2))
	return version, version and copies
end

-- Developer mode uses the plain profile without any version number
-- Everyone else should load the highest version number, the newest re-import of it when copies exist
local function FindProfile(profiles, base)
	if not profiles then return end

	local dev = Private.Addon.db.global.dev
	local bestName, bestRank, bestCopies

	for name in pairs(profiles) do
		local version, copies = GetProfileVersion(name, base)
		if version then
			local rank = (dev and version == 0) and huge or version
			if not bestRank or rank > bestRank or (rank == bestRank and copies > bestCopies) then
				bestName, bestRank, bestCopies = name, rank, copies
			end
		end
	end

	return bestName
end

-- Profile table inside an addon's SavedVariables
local function SVProfiles(global, key)
	return function()
		local db = _G[global]
		return db and db[key]
	end
end

-- Live AceDB object of an addon SV
function Private:FindAceDB(global)
	local sv, AceDB = _G[global], LibStub('AceDB-3.0', true)
	if not (sv and AceDB) then return end

	for object in pairs(AceDB.db_registry) do
		if object.sv == sv then
			return object
		end
	end
end

-- AceDB: Profiles and character keys share one SV
local function AceApply(global)
	return function(profile)
		local db = _G[global]
		db.profileKeys = db.profileKeys or {}

		local object = Private:FindAceDB(global)
		db.profileKeys[(object and object.keys.char) or charKey] = profile
	end
end

-- Mouse addons: Profile list is in the account SV, the active one is in the character SV
local function SharedApply(global)
	return function(profile)
		_G[global .. '_CURRENT_PROFILE'] = profile
	end
end

-- Name: Addon name (TOC file)
-- Base: Returns the profile name without the version suffix (Luckyone when not set)
-- Hidden: Skips this handler completely (Wrong game version, no ElvUI, etc)
-- Profiles: Returns the profile table, keyed by profile name
-- Apply: Loads the profile on the current character
-- ElvUI: Turns off the ElvUI parts the profile replaces (only with ElvUI loaded)
local handlers = {
	{
		name = 'ElvUI',
		base = function(layout) return Private.LayoutNames[layout] end,
		Profiles = SVProfiles('ElvDB', 'profiles'),
		Apply = function(profile, layout) Private:Setup_AltProfile(profile, layout) end,
	},
	{
		name = 'Baganator',
		Profiles = SVProfiles('BAGANATOR_CONFIG', 'Profiles'),
		Apply = SharedApply('BAGANATOR'),
		ElvUI = function(E) E.private.bags.enable = false end,
	},
	{
		name = 'BigWigs',
		Profiles = SVProfiles('BigWigs3DB', 'profiles'),
		Apply = AceApply('BigWigs3DB'),
	},
	{
		name = 'BuffReminders',
		hidden = not Private.isRetail,
		Profiles = SVProfiles('BuffRemindersDB', 'profiles'),
		Apply = AceApply('BuffRemindersDB'),
	},
	{
		name = 'Chattynator',
		Profiles = SVProfiles('CHATTYNATOR_CONFIG', 'Profiles'),
		Apply = SharedApply('CHATTYNATOR'),
		ElvUI = function(E) E.private.chat.enable = false end,
	},
	{
		name = 'DBM-Core',
		Profiles = function() return _G.DBM_AllSavedOptions end,
		Apply = function(profile) _G.DBM_UsedProfile = profile end,
	},
	{
		name = 'Details',
		Profiles = SVProfiles('_detalhes_global', '__profiles'),
		Apply = function(profile) Private:Details_ApplyProfile(profile) end,
	},
	{
		name = 'MPlusTimer',
		hidden = not Private.isRetail,
		Profiles = SVProfiles('MPTSV', 'Profiles'),
		Apply = function(profile)
			local db = _G.MPTSV
			db.ProfileKey = db.ProfileKey or {}
			db.ProfileKey[compactKey] = profile
		end,
	},
	{
		name = 'NorthernSkyRaidTools',
		hidden = not Private.isRetail,
		Profiles = SVProfiles('NSRT', 'Profiles'),
		Apply = function(profile)
			local db = _G.NSRT
			db.ProfileKeys = db.ProfileKeys or {}
			db.ProfileKeys[compactKey] = profile
		end,
	},
	{
		name = 'Platynator',
		Profiles = SVProfiles('PLATYNATOR_CONFIG', 'Profiles'),
		Apply = SharedApply('PLATYNATOR'),
		ElvUI = function(E) E.private.nameplates.enable = false end,
	},
	{
		name = 'SkironCooldownManager',
		hidden = not Private.isModern,
		Profiles = SVProfiles('SkironCooldownManagerDB', 'profiles'),
		Apply = AceApply('SkironCooldownManagerDB'),
		ElvUI = function(E)
			E.db.unitframe.units.player.castbar.enable = false
			E.db.unitframe.units.player.power.enable = false
			E.private.unitframe.disabledBlizzardFrames.castbar = false
		end,
	},
}

-- Quick setup for alts, loads every existing Luckyone profile
local applied, skipped = {}, {}
function Private:Setup_Alts(includeChat)
	local layout = GetSpecLayout()

	wipe(applied)
	wipe(skipped)

	for _, handler in ipairs(handlers) do
		if not handler.hidden and Private.IsAddOnLoaded(handler.name) then
			local base = (handler.base and handler.base(layout)) or 'Luckyone'
			local profile = FindProfile(handler.Profiles(), base)

			if profile then
				handler.Apply(profile, layout)

				if handler.ElvUI and Private.ElvUI then
					handler.ElvUI(ElvUI[1])
				end

				tinsert(applied, format('%s |cff9b9b9b(%s)|r', handler.name, profile))
			else
				tinsert(skipped, handler.name)
			end
		end
	end

	-- Chat tabs and console variables are not part of any addon profile
	if includeChat then
		Private:Setup_Chat()
	end

	Private:Setup_CVars(true)
	Private:Setup_NameplateCVars(true)

	if #applied > 0 then
		Private:Print(L["Applied profiles:"] .. ' ' .. concat(applied, ', '))
	else
		Private:Print(L["No existing LuckyoneUI profile found."])
	end

	if #skipped > 0 then
		Private:Print(format('|cff9b9b9b%s %s|r', L["No profile found for:"], concat(skipped, ', ')))
	end

	-- Prompt for reload to fix everything
	StaticPopup_Show('LUCKYONE_RL')
end

-- Alt setup popup
-- StaticPopup_Show('LUCKYONE_ALTS')
StaticPopupDialogs['LUCKYONE_ALTS'] = {
	text = format('%s\n\n%s', L["Alt Setup"], L["Load your existing profiles and setup your chat tabs?"]),
	button1 = YES, -- OnAccept
	button2 = L["Yes, no chat"], -- OnCancel
	button3 = NO, -- OnAlt
	OnAccept = function() Private:Setup_Alts(true) end,
	OnCancel = function(_, _, reason)
		if reason == 'clicked' then
			Private:Setup_Alts()
		end
	end,
	whileDead = 1,
	hideOnEscape = false,
}
