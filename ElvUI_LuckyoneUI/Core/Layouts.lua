local L1UI, E, L, V, P, G = unpack(select(2, ...))

local IsAddOnLoaded = IsAddOnLoaded

-- ElvUI Layouts for all WoW versions
function L1UI:SetupLayout(layout)

	-- Create the profiles and set the name
	if layout == 'main' then
		E.data:SetProfile('Luckyone DPS/TANK v'..L1UI.Version)
	elseif layout == 'healing' then
		E.data:SetProfile('Luckyone Healing v'..L1UI.Version)
	end

	-- Global DB and custom DataText setup
	L1UI:SetupGlobal()

	-- Fonts and textures
	L1UI:SetupPrivate()

	-- AddOnSkins profile
	if IsAddOnLoaded('AddOnSkins') then L1UI:Setup_AddOnSkins('noPrint') end

	-- ProjectAzilroka profile
	if IsAddOnLoaded('ProjectAzilroka') then L1UI:Setup_ProjectAzilroka('noPrint') end

	-- Shadow & Light profile
	if IsAddOnLoaded('ElvUI_SLE') and E.Retail then L1UI:Setup_ShadowAndLight('noPrint') end

	-- Profile DB
	if layout == 'main' then
		L1UI:Layout_v1('main')
	elseif layout == 'healing' then
		L1UI:Layout_v1('healing')
	end

	E:StaggeredUpdateAll()

	L1UI:Print(L["Layout has been set."])
end
