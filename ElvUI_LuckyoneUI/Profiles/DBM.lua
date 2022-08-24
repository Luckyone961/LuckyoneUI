local L1UI, E, L, V, P, G = unpack(select(2, ...))

local IsAddOnLoaded = IsAddOnLoaded

-- DBM profile
function L1UI:Setup_DBM(layout)
	if not IsAddOnLoaded('DBM-Core') then return end

	-- Profile names
	local name = L1UI.Me and 'Luckyone Main' or 'Luckyone Main '..L1UI.Version
	local name_healing = L1UI.Me and 'Luckyone Healing' or 'Luckyone Healing '..L1UI.Version

	-- Create the profiles
	DBM:CreateProfile(name)
	DBM:CreateProfile(name_healing)

	if E.Retail then

	elseif E.TBC then

	elseif E.Classic then

	elseif E.Wrath then

	end

	-- Set profile
	if layout == 'main' then
		DBM:ApplyProfile(name)
	elseif layout == 'healing' then
		DBM:ApplyProfile(name_healing)
	end

	L1UI:Print(L["DBM profile has been set."])
end
