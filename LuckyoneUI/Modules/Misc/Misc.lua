local _, Private = ...
local Misc = Private.Modules.Misc

local _G = _G

-- Removes the Realm names from friendly Nameplates in name-only mode while in a Dungeon/Raid/Battleground
-- This sets (NamePlateFriendlyFrameOptions.updateNameUsesGetUnitName = nil) without tainting
local function RemoveNameplateRealm()
	if not (Private.isModern and Private.Addon.db.profile.misc.removeNameplateRealm) then return end
	_G.TextureLoadingGroupMixin.RemoveTexture({textures = _G.NamePlateFriendlyFrameOptions}, 'updateNameUsesGetUnitName')
end

function Misc:PLAYER_ENTERING_WORLD(_, initLogin, isReload)
	-- Only run the setup on login and reload, not on every loading screen
	if not (initLogin or isReload) then return end

	-- Neither flag can be set again this session, so stop listening
	self:UnregisterEvent('PLAYER_ENTERING_WORLD')

	Private:CombatLogging()
	Private:FriendsList()
	Private:MailboxFavorites()
	RemoveNameplateRealm()
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

	self:RegisterEvent('PLAYER_ENTERING_WORLD')
	self:RegisterEvent('PLAYER_REGEN_DISABLED')
	self:RegisterEvent('PLAYER_REGEN_ENABLED')
end
