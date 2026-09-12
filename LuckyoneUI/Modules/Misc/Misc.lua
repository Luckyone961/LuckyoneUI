local _, Private = ...
local Misc = Private.Modules.Misc

if not Private.ElvUI then
	return
end

function Misc:PLAYER_ENTERING_WORLD()
	Private:DataTextsTweaks()
	if Private.isRetail then
		Private:MythicVisibility()
	end
end

-- DataTextsTweaks follows spec switches through the ElvUI OnProfileChanged callback instead
function Misc:PLAYER_SPECIALIZATION_CHANGED(_, unit)
	-- Fires for other units as well, only react to the player
	if unit ~= 'player' then return end

	Private:MythicVisibility()
end

function Misc:OnEnable()
	self:RegisterEvent('PLAYER_ENTERING_WORLD')
	if Private.isRetail then
		self:RegisterEvent('PLAYER_SPECIALIZATION_CHANGED')
	end
end
