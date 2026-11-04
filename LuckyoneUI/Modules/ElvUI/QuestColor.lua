local _, Private = ...

if not Private.ElvUI then
	return
end

local pairs = pairs
local unpack = unpack

local hooksecurefunc = hooksecurefunc

local E = unpack(ElvUI)
local NP = E:GetModule('NamePlates')

local function Health_PostUpdateColor(health, unit, color)
	local db = Private.Addon.db.profile.nameplates
	if not db.questColorEnable or not health.__owner.QuestIcons:IsShown() then return end
	if color == NP.Colors.tapped or (health.colorThreat and E:GetThreatSituation(unit, 'player')) then return end

	NP:SetStatusBarColor(health, db.questColor.r, db.questColor.g, db.questColor.b)
end

local function QuestIcons_PostUpdate(element)
	local nameplate = element.__owner
	if Private.Addon.db.profile.nameplates.questColorEnable and nameplate:IsElementEnabled('Health') then
		NP.Health_UpdateColor(nameplate, 'QuestIcons', nameplate.__unit)
	end
end

hooksecurefunc(NP, 'StylePlate', function(_, nameplate)
	nameplate.Health.PostUpdateColor = Health_PostUpdateColor
	nameplate.QuestIcons.PostUpdate = QuestIcons_PostUpdate
end)

function Private:QuestColor_Update()
	if not NP.Initialized then return end

	for nameplate in pairs(NP.Plates) do
		if nameplate:IsElementEnabled('Health') then
			NP.Health_UpdateColor(nameplate, 'ForceUpdate', nameplate.__unit)
		end
	end
end
