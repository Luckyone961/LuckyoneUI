local L1UI, E, L, V, P, G = unpack(select(2, ...))

-- Update Layout Buttons (Ingame Config)
if L1UI.Retail then

	function L1UI:UpdateLayout(layout)

		if layout == 'dps' then
			-- DPS/TANK db changes
		elseif layout == 'healer' then
			-- Healing db changes
		end

		E:StaggeredUpdateAll()
	end

elseif L1UI.TBC then

	function L1UI:UpdateLayout(layout)

		if layout == 'dps' then
			-- DPS/TANK db changes
		elseif layout == 'healer' then
			-- Healing db changes
		end

		E:StaggeredUpdateAll(nil, true)
	end

elseif L1UI.Classic then

	function L1UI:UpdateLayout(layout)

		if layout == 'dps' then
			-- DPS/TANK db changes
		elseif layout == 'healer' then
			-- Healing db changes
		end

		E:StaggeredUpdateAll(nil, true)
	end

end
