-- Addon namespace
local _, Private = ...

-- ElvUI file
if not Private.ElvUI then
	return
end

--[[
function(event)
	if not _G.ElvUI then -- Don't run any code if ElvUI is not enabled
		return
	end

	local E = unpack(ElvUI)

	if not E.Retail then -- Don't run any code if user is not logged in to Retail
		return
	end

	local _, instanceType, difficultyID = GetInstanceInfo()

	local mythicVisibility =
	(E.db.unitframe.units.raid1.visibility == '[nogroup] hide;show') and
	(E.db.unitframe.units.raid2.visibility == 'hide')

	local defaultVisibility =
	(E.db.unitframe.units.raid1.visibility == '[@raid6,noexists][@raid21,exists] hide;show') and
	(E.db.unitframe.units.raid2.visibility == '[@raid21,noexists][@raid31,exists] hide;show')

	if event == "WA_DELAYED_PLAYER_ENTERING_WORLD" then -- replace with PLAYER_ENTERING_WORLD and a C_Timer.After delay of ~1sec
		if instanceType == 'raid' then
			if difficultyID == 16 then
				if not mythicVisibility then
					E.db.unitframe.units.raid1.visibility = '[nogroup] hide;show'
					E.db.unitframe.units.raid2.visibility = 'hide'
					aura_env.UF:CreateAndUpdateHeaderGroup('raid1')
					aura_env.UF:CreateAndUpdateHeaderGroup('raid2')
				end
			else
				if not defaultVisibility then
					E.db.unitframe.units.raid1.visibility = '[@raid6,noexists][@raid21,exists] hide;show'
					E.db.unitframe.units.raid2.visibility = '[@raid21,noexists][@raid31,exists] hide;show'
					aura_env.UF:CreateAndUpdateHeaderGroup('raid1')
					aura_env.UF:CreateAndUpdateHeaderGroup('raid2')
				end
			end
		else
			if not defaultVisibility then
				E.db.unitframe.units.raid1.visibility = '[@raid6,noexists][@raid21,exists] hide;show'
				E.db.unitframe.units.raid2.visibility = '[@raid21,noexists][@raid31,exists] hide;show'
				aura_env.UF:CreateAndUpdateHeaderGroup('raid1')
				aura_env.UF:CreateAndUpdateHeaderGroup('raid2')
			end
		end
	end
end
]]
