local _, Private = ...
local Misc = Private.Modules.Misc

if not Private.ElvUI then
	return
end

function Misc:PLAYER_ENTERING_WORLD()
	Private:AutoDismount()
	Private:MythicVisibility()
	Private:DataTextsTweaks()
end

function Misc:PLAYER_SPECIALIZATION_CHANGED(_, unit)
	-- Fires for other units as well, only react to the player
	if unit ~= 'player' then return end

	Private:DataTextsTweaks()
	Private:MythicVisibility()
end

function Misc:OnEnable()
	self:RegisterEvent('PLAYER_ENTERING_WORLD')
	self:RegisterEvent('PLAYER_SPECIALIZATION_CHANGED')
end
