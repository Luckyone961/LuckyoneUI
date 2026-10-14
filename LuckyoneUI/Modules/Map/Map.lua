local _, Private = ...
local Map = Private.Modules.Map

function Map:PLAYER_ENTERING_WORLD()
	if Private.ElvUI then
		Private:MinimapButtons()
	end
	Private:WorldMap()
end

function Map:OnEnable()
	self:RegisterEvent('PLAYER_ENTERING_WORLD')
end
