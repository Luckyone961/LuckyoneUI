-- Addon namespace
local _, Private = ...
local Misc = Private.Modules.Misc

-- ElvUI file
if not Private.ElvUI then
	return
end

function Misc:PLAYER_ENTERING_WORLD()
	Private:AutoDismount()
	Private:MythicVisibility()
	Private:DataTextsTweaks()
end

function Misc:PLAYER_SPECIALIZATION_CHANGED()
	Private:DataTextsTweaks()
end

function Misc:OnEnable()
	self:RegisterEvent('PLAYER_ENTERING_WORLD')
	self:RegisterEvent('PLAYER_SPECIALIZATION_CHANGED')
end
