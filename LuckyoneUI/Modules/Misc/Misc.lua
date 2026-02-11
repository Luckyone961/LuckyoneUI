-- Addon namespace
local _, Private = ...
local Misc = Private.Modules.Misc

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

function Misc:OnEnable()
	self:RegisterEvent('PLAYER_ENTERING_WORLD')
	self:RegisterEvent('PLAYER_SPECIALIZATION_CHANGED')

	-- Nameplate classification zone tracking
	if E.private.nameplates.enable and Private.Addon.db.profile.misc.nameplateClassification then
		self:RegisterEvent('ZONE_CHANGED', 'OnZoneChanged')
		self:RegisterEvent('ZONE_CHANGED_INDOORS', 'OnZoneChanged')
		self:RegisterEvent('ZONE_CHANGED_NEW_AREA', 'OnZoneChanged')
	end
end

function Misc:PLAYER_ENTERING_WORLD()
	Private:MythicVisibility()
	Private:DataTextsTweaks()
	Private:UpdateNameplateClassification()
end

function Misc:PLAYER_SPECIALIZATION_CHANGED()
	Private:DataTextsTweaks()
end

function Misc:OnZoneChanged()
	Private:UpdateNameplateClassification()
end
