-- Addon namespace
local _, Private = ...

-- ElvUI file
if not Private.ElvUI then
	return
end

-- Lua functions
local unpack = unpack

-- API cache
local IsInInstance = IsInInstance

-- ElvUI reference
local E = unpack(ElvUI)

-- Enable nameplate coloring for casters/melees/bosses only in instances
function Private:UpdateNameplateClassification()
	if not E.private.nameplates.enable then return end
	if not Private.Addon.db.profile.misc.nameplateClassification then return end

	E.db.nameplates.units.ENEMY_NPC.health.useClassificationColor = IsInInstance()
end

function Private:NameplateClassification()
	if not E.private.nameplates.enable then return end
	if not Private.Addon.db.profile.misc.nameplateClassification then return end

	-- Only register zone change events here - PLAYER_ENTERING_WORLD is handled in Core
	Private.Addon:RegisterEvent('ZONE_CHANGED', function() Private:UpdateNameplateClassification() end)
	Private.Addon:RegisterEvent('ZONE_CHANGED_INDOORS', function() Private:UpdateNameplateClassification() end)
	Private.Addon:RegisterEvent('ZONE_CHANGED_NEW_AREA', function() Private:UpdateNameplateClassification() end)
end

function Private:MiscTweaks()
	Private:NameplateClassification()
end
