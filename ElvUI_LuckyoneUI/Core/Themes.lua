local L1UI, E, L, V, P, G = unpack(select(2, ...))

-- Option to choose between Dark (Default) and Class color
function L1UI:SetupTheme(theme)

	if theme == 'dark' then
		-- DB stuff
	elseif theme == 'class' then
		-- DB stuff
	end

	E:StaggeredUpdateAll(nil, true)

	L1UI:Print('AddOnSkins profile has been set.')
end
