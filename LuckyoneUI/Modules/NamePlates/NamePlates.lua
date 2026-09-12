local _, Private = ...
local LSM = Private.Libs.LSM
local NamePlates = Private.Modules.NamePlates

if not Private.ElvUI then
	return
end

local ipairs = ipairs
local next = next
local pairs = pairs
local unpack = unpack
local wipe = table.wipe

local hooksecurefunc = hooksecurefunc
local UnitExists = UnitExists
local C_NamePlate_GetNamePlateForUnit = C_NamePlate.GetNamePlateForUnit

local E = unpack(ElvUI)
local NP = E:GetModule('NamePlates')

local hooked

local units = {
	{ unit = 'target', enable = 'targetTextureEnable', texture = 'targetTexture' },
	{ unit = 'focus', enable = 'focusTextureEnable', texture = 'focusTexture' },
}

local desiredPlates = {} -- unitFrame -> special texture for this update
local styledPlates = {} -- unitFrame -> special texture we applied, restored to default on removal

-- Unit validation, seems to be the best way since GUID is secret?
local function GetUnitNameplate(unit)
	if not UnitExists(unit) then return end

	local blizzPlate = C_NamePlate_GetNamePlateForUnit(unit)
	local plate = blizzPlate and blizzPlate.unitFrame

	if plate and plate.Health and not plate.widgetsOnly then
		return plate
	end
end

-- Only touches plates whose texture actually changed (old special -> default, new special -> texture)
-- instead of re-applying textures to every visible plate
function Private:UpdateSpecialNameplateTextures()
	if not NP.Plates or not E.private.nameplates.enable then return end

	local db = Private.Addon.db.profile.nameplates

	-- Both textures off and nothing left to restore, every plate that spawns lands here
	if not (db.targetTextureEnable or db.focusTextureEnable) and not next(styledPlates) then return end

	-- Resolve the desired special plates, units order gives target priority over focus
	wipe(desiredPlates)
	for _, entry in ipairs(units) do
		if db[entry.enable] then
			local plate = GetUnitNameplate(entry.unit)
			if plate and not desiredPlates[plate] then
				desiredPlates[plate] = LSM:Fetch('statusbar', db[entry.texture])
			end
		end
	end

	-- Restore plates that are no longer special
	local defaultTexture
	for plate in pairs(styledPlates) do
		if not desiredPlates[plate] then
			defaultTexture = defaultTexture or LSM:Fetch('statusbar', NP.db.statusbar) or E.media.normTex
			plate.Health:SetStatusBarTexture(defaultTexture)
			styledPlates[plate] = nil
		end
	end

	-- Apply new or changed special textures
	for plate, texture in pairs(desiredPlates) do
		if styledPlates[plate] ~= texture then
			plate.Health:SetStatusBarTexture(texture)
			styledPlates[plate] = texture
		end
	end
end

local function CheckHook()
	if hooked or not NP.Update_StatusBars or not NP.PostUpdateAllElements then return end
	hooked = true

	hooksecurefunc(NP, 'Update_StatusBars', function()
		wipe(styledPlates)
		Private:UpdateSpecialNameplateTextures()
	end)

	-- Plates are recycled and keep the last texture, so re-resolve whenever a unit is assigned
	hooksecurefunc(NP, 'PostUpdateAllElements', function(_, event)
		if event == 'NAME_PLATE_UNIT_ADDED' then
			Private:UpdateSpecialNameplateTextures()
		end
	end)
end

function NamePlates:UpdateTextures()
	Private:UpdateSpecialNameplateTextures()
end

function NamePlates:OnEnable()
	CheckHook()

	self:RegisterEvent('PLAYER_ENTERING_WORLD', 'UpdateTextures')
	self:RegisterEvent('PLAYER_TARGET_CHANGED', 'UpdateTextures')

	-- Focus unit does not exist on Classic Era
	if not Private.isClassic then
		self:RegisterEvent('PLAYER_FOCUS_CHANGED', 'UpdateTextures')
	end

	Private:UpdateSpecialNameplateTextures()
end
