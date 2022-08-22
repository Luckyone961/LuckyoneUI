local L1UI, E, L, V, P, G = unpack(select(2, ...))

local _G = _G
local _detalhes = _G._detalhes
local IsAddOnLoaded = IsAddOnLoaded

-- Details profile
function L1UI:Setup_Details()
	if not IsAddOnLoaded('Details') then return end

	-- Profile name
	local name = 'Luckyone'

	-- Profile strings
	local retail = ''
	local tbc = ''
	local classic = ''
	local wrath = ''

	if E.Retail then
		_detalhes:ImportProfile(retail, name)
	elseif E.TBC then
		_detalhes:ImportProfile(tbc, name)
	elseif E.Classic then
		_detalhes:ImportProfile(classic, name)
	elseif E.Wrath then
		_detalhes:ImportProfile(wrath, name)
	end

	-- Apply the profile
	if _detalhes:GetCurrentProfileName() ~= name then
		_detalhes:ApplyProfile(name)
	end

	-- Load the profile on all characters
	_detalhes.always_use_profile = true
	_detalhes.always_use_profile_name = name

	-- Wipe boss_mods_timers, encounter_spell_pool, npcid_pool, spell_pool, spell_school_cache
	L1UI:Cleanup_Cache('details')

	L1UI:Print(L["Details profile has been set."])
end
