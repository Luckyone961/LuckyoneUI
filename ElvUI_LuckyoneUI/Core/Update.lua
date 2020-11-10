local L1UI, E, L, V, P, G = unpack(select(2, ...))

function L1UI:UpdateLayout(layout)

	E.db["general"]["talkingHeadFrameScale"] = 0.72

	if layout == 'dps' then
		-- DPS/TANK db
		E.db["movers"]["TalkingHeadFrameMover"] = "BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-2,174"
		E.db["unitframe"]["units"]["pet"]["debuffs"]["priority"] = "Blacklist,Personal,nonPersonal"
		E.db["unitframe"]["units"]["player"]["castbar"]["customTextFont"]["font"] = "Expressway"
		E.db["unitframe"]["units"]["player"]["castbar"]["customTimeFont"]["font"] = "Expressway"
	elseif layout == 'healer' then
		-- Healing db
	end

	E:StaggeredUpdateAll(nil, true)

	L1UI:Print('Layout has been updated.')
end
