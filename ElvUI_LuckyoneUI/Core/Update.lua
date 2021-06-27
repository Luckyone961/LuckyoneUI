local L1UI, E, L, V, P, G = unpack(select(2, ...))

-- Update Layout Buttons (Ingame Config)
if L1UI.Retail then

	function L1UI:UpdateLayout(layout)

		-- Protect some rare nil errors
		if not E.db.movers then E.db.movers = {} end

		-- Updated Shadow & Light for 4.22 screensaver rework and other stuff
		if IsAddOnLoaded('ElvUI_SLE') then L1UI:GetSLEProfile() end

		if layout == 'dps' then
			-- DPS/TANK db changes
		elseif layout == 'healer' then
			-- Healing db changes
		end

		E:StaggeredUpdateAll(nil, true)
	end

elseif L1UI.TBC then

	function L1UI:UpdateLayout(layout)

		-- Protect some rare nil errors
		if not E.db.movers then E.db.movers = {} end

		if layout == 'dps' then
			-- DPS/TANK db changes
		elseif layout == 'healer' then
			-- Healing db changes
		end

		E:StaggeredUpdateAll(nil, true)
	end

elseif L1UI.Classic then

	function L1UI:UpdateLayout(layout)

		-- Protect some rare nil errors
		if not E.db.movers then E.db.movers = {} end

		if layout == 'dps' then
			-- DPS/TANK db changes
		elseif layout == 'healer' then
			-- Healing db changes
		end

		E:StaggeredUpdateAll(nil, true)
	end

end
