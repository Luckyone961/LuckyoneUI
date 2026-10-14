local _, Private = ...
local Misc = Private.Modules.Misc

function Misc:OnLogin()
	Private:CombatLogging()
	Private:FriendsList()
	Private:MailboxFavorites()
end

function Misc:PLAYER_REGEN_DISABLED()
	Private:CombatText(true)
end

function Misc:PLAYER_REGEN_ENABLED()
	Private:CombatText(false)
end

function Misc:OnEnable()
	-- Fonts have to be in place before the tracker builds its first layout at PLAYER_ENTERING_WORLD
	if Private.isModern then
		Private:ObjectiveTracker()
	end

	self:RegisterEvent('PLAYER_REGEN_DISABLED')
	self:RegisterEvent('PLAYER_REGEN_ENABLED')
end
