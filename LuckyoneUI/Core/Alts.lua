local _, Private = ...
local L = Private.Libs.ACL

local concat = table.concat
local format = string.format
local gsub = string.gsub
local ipairs = ipairs
local pairs = pairs
local select = select
local tinsert = table.insert
local tonumber = tonumber
local type = type
local wipe = table.wipe

local _G = _G
local StaticPopup_Show = _G.StaticPopup_Show

local GetNormalizedRealmName = GetNormalizedRealmName
local GetSpecialization = C_SpecializationInfo and C_SpecializationInfo.GetSpecialization or _G.GetSpecialization
local GetSpecializationInfo = C_SpecializationInfo and C_SpecializationInfo.GetSpecializationInfo or _G.GetSpecializationInfo

-- Character keys used by the addon databases
local charKey = Private.myNameRealm
local compactKey = Private.myName .. '-' .. ((GetNormalizedRealmName and GetNormalizedRealmName()) or gsub(Private.myRealm, '%s', ''))

-- Profile names by layout
local layoutNames = {
	main = 'Luckyone Main',
	healing = 'Luckyone Healing',
}

-- Healers get the healing profiles, everyone else the main ones
local function GetLayout()
	if not (GetSpecialization and GetSpecializationInfo) then return 'main' end

	local spec = GetSpecialization()
	if not spec then return 'main' end

	-- Retail returns the role as the fifth value, the others add a background texture before it
	local role = select(Private.isRetail and 5 or 6, GetSpecializationInfo(spec))

	return (role == 'HEALER' and 'healing') or 'main'
end

-- Version of a profile name, zero for the plain profile without a suffix
-- 'Luckyone' -> 0 | 'Luckyone 4.22' -> 4.22 | 'Luckyone Main' -> nil (wrong base)
local function GetProfileVersion(profile, base)
	if profile == base then return 0 end

	local suffix = profile:sub(#base + 1)
	if profile:sub(1, #base) ~= base or suffix:sub(1, 1) ~= ' ' then return end

	return tonumber(suffix:sub(2))
end

-- Developer mode uses the plain profile without any version number
-- Everyone else should load the highest version number
local function FindProfile(profiles, base)
	if not profiles then return end

	local dev = Private.Addon.db.global.dev
	local bestName, bestVersion

	for name in pairs(profiles) do
		local version = GetProfileVersion(name, base)
		if version then
			if dev and version == 0 then
				return name
			elseif not bestVersion or version > bestVersion then
				bestName, bestVersion = name, version
			end
		end
	end

	return bestName
end

-- AceDB: Profiles and character keys share one SV
local function AceProfiles(global)
	return function()
		local db = _G[global]
		return db and db.profiles
	end
end

local function AceApply(global)
	return function(profile)
		local db = _G[global]
		db.profileKeys = db.profileKeys or {}
		db.profileKeys[charKey] = profile
	end
end

-- Mouse addons: Profile list is in the account SV, the active one is in the character SV
local function SharedProfiles(global)
	return function()
		local config = _G[global .. '_CONFIG']
		return config and config.Profiles
	end
end

local function SharedApply(global)
	return function(profile)
		_G[global .. '_CURRENT_PROFILE'] = profile
	end
end

-- Name: Addon name (TOC file)
-- Base: Profile name without the version suffix (string or function)
-- Hidden: Skips this handler completely (Wrong game version, no ElvUI, etc)
-- Profiles: Returns the profile table, keyed by profile name
-- Apply: Loads the profile on the current character
local handlers = {
	{
		name = 'ElvUI',
		hidden = not Private.ElvUI,
		base = function(layout) return layoutNames[layout] end,
		Profiles = AceProfiles('ElvDB'),
		Apply = function(profile, layout) Private:Setup_AltProfile(profile, layout) end,
	},
	{
		name = 'Baganator',
		base = 'Luckyone',
		Profiles = SharedProfiles('BAGANATOR'),
		Apply = SharedApply('BAGANATOR'),
	},
	{
		name = 'BigWigs',
		base = function(layout) return layoutNames[layout] end,
		Profiles = AceProfiles('BigWigs3DB'),
		Apply = AceApply('BigWigs3DB'),
	},
	{
		name = 'BuffReminders',
		hidden = not Private.isRetail,
		base = 'Luckyone',
		Profiles = AceProfiles('BuffRemindersDB'),
		Apply = AceApply('BuffRemindersDB'),
	},
	{
		name = 'Chattynator',
		base = 'Luckyone',
		Profiles = SharedProfiles('CHATTYNATOR'),
		Apply = SharedApply('CHATTYNATOR'),
	},
	{
		name = 'Details',
		base = 'Luckyone',
		Profiles = function()
			local db = _G._detalhes_global
			return db and db.__profiles
		end,
		Apply = function(profile)
			local Details = _G.Details

			if Details:GetCurrentProfileName() ~= profile then
				Details:ApplyProfile(profile)
			end

			-- Load the profile on all characters
			Details.always_use_profile = true
			Details.always_use_profile_name = profile
		end,
	},
	{
		name = 'MPlusTimer',
		hidden = not Private.isRetail,
		base = 'Luckyone',
		Profiles = function()
			local db = _G.MPTSV
			return db and db.Profiles
		end,
		Apply = function(profile)
			local db = _G.MPTSV
			db.ProfileKey = db.ProfileKey or {}
			db.ProfileKey[compactKey] = profile
		end,
	},
	{
		name = 'NorthernSkyRaidTools',
		hidden = not Private.isRetail,
		base = 'Luckyone',
		Profiles = function()
			local db = _G.NSRT
			return db and db.Profiles
		end,
		Apply = function(profile)
			local db = _G.NSRT
			db.ProfileKeys = db.ProfileKeys or {}
			db.ProfileKeys[compactKey] = profile
		end,
	},
	{
		name = 'Plater',
		base = 'Luckyone',
		Profiles = AceProfiles('PlaterDB'),
		Apply = AceApply('PlaterDB'),
	},
	{
		name = 'Platynator',
		base = 'Luckyone',
		Profiles = SharedProfiles('PLATYNATOR'),
		Apply = SharedApply('PLATYNATOR'),
	},
	{
		name = 'SkironCooldownManager',
		hidden = not Private.isRetail,
		base = 'Luckyone',
		Profiles = AceProfiles('SkironCooldownManagerDB'),
		Apply = AceApply('SkironCooldownManagerDB'),
	},
	{
		name = 'WarpDeplete',
		hidden = not Private.isRetail,
		base = 'Luckyone',
		Profiles = AceProfiles('WarpDepleteDB'),
		Apply = AceApply('WarpDepleteDB'),
	},
}

-- Quick setup for alts, loads every existing Luckyone profile
local applied, skipped = {}, {}
function Private:HandleAlts(includeChat)
	local layout = GetLayout()

	wipe(applied)
	wipe(skipped)

	for _, handler in ipairs(handlers) do
		if not handler.hidden and Private.IsAddOnLoaded(handler.name) then
			local base = (type(handler.base) == 'function' and handler.base(layout)) or handler.base
			local profile = FindProfile(handler.Profiles(), base)

			if profile then
				handler.Apply(profile, layout)
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
	Private:NameplateCVars(true)

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
