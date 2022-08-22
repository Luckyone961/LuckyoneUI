local L1UI, E, L, V, P, G = unpack(select(2, ...))

local IsAddOnLoaded = IsAddOnLoaded

-- Plater profile
function L1UI:Setup_Plater()
	if not IsAddOnLoaded('Plater') then return end

	-- Profile name
	local name = 'Luckyone'

	if E.Retail then

		-- Profile creation
		PlaterDB.profiles.name = PlaterDB.profiles.name or {}

		-- Profile db
		PlaterDB.profiles.name = {}

		-- Profile key
		PlaterDB.profileKeys.E.mynameRealm = name

	elseif E.TBC then

		-- Profile creation
		PlaterDB.profiles.name = PlaterDB.profiles.name or {}

		-- Profile db
		PlaterDB.profiles.name = {}

		-- Profile key
		PlaterDB.profileKeys.E.mynameRealm = name

	elseif E.Classic then

		-- Profile creation
		PlaterDB.profiles.name = PlaterDB.profiles.name or {}

		-- Profile db
		PlaterDB.profiles.name = {}

		-- Profile key
		PlaterDB.profileKeys.E.mynameRealm = name

	elseif E.Wrath then

		-- Profile creation
		PlaterDB.profiles.name = PlaterDB.profiles.name or {}

		-- Profile db
		PlaterDB.profiles.name = {}

		-- Profile key
		PlaterDB.profileKeys.E.mynameRealm = name

	end

	-- Wipe captured_casts, captured_spells and npc_cache
	L1UI:Cleanup_Cache('plater')

	L1UI:Print(L["Plater profile has been set."])
end
