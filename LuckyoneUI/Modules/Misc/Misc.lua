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
local function UpdateNameplateClassification()
	E.db.nameplates.units.ENEMY_NPC.health.useClassificationColor = IsInInstance()
end

function Private:NameplateClassification()
	if not E.private.nameplates.enable then return end
	if not Private.Addon.db.profile.misc.nameplateClassification then return end

	Private.Addon:RegisterEvent('PLAYER_ENTERING_WORLD', UpdateNameplateClassification)
	Private.Addon:RegisterEvent('ZONE_CHANGED', UpdateNameplateClassification)
	Private.Addon:RegisterEvent('ZONE_CHANGED_INDOORS', UpdateNameplateClassification)
	Private.Addon:RegisterEvent('ZONE_CHANGED_NEW_AREA', UpdateNameplateClassification)
end

function Private:MiscTweaks()
	Private:NameplateClassification()
end
