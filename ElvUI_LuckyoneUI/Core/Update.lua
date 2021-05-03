local L1UI, E, L, V, P, G = unpack(select(2, ...))

local ReloadUI = ReloadUI
local IsAddOnLoaded = IsAddOnLoaded

-- Update Layout Buttons (Ingame Config)
function L1UI:UpdateLayout(layout)

	if not E.db.movers then E.db.movers = {} end

	-- Shadow&Light db changes
	if IsAddOnLoaded('ElvUI_SLE') then L1UI:GetSLEProfile() end

	if layout == 'dps' then
		-- DPS/TANK db changes
	elseif layout == 'healer' then
		-- Healing db changes
	end

	E:StaggeredUpdateAll(nil, true)
end
