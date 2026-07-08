-- Addon namespace
local _, Private = ...
local LSM = Private.Libs.LSM
local NamePlates = Private.Modules.NamePlates

-- ElvUI file
if not Private.ElvUI then
	return
end

-- Lua functions
local ipairs = ipairs
local pairs = pairs
local unpack = unpack
local wipe = table.wipe

-- API cache
local hooksecurefunc = hooksecurefunc
local UnitExists = UnitExists
local C_NamePlate_GetNamePlateForUnit = C_NamePlate.GetNamePlateForUnit

-- ElvUI reference
local E = unpack(ElvUI)
local NP = E:GetModule('NamePlates')

local hooked
local plateHooked

local units = {
	{ unit = 'target', enable = 'targetTextureEnable', texture = 'targetTexture' },
	{ unit = 'focus', enable = 'focusTextureEnable', texture = 'focusTexture' },
}

local desiredPlates = {} -- unitFrame -> special texture for this update
local styledPlates = {} -- unitFrame -> special texture we applied, restored to default on removal

local function GetDB()
	return Private.Addon.db.profile.nameplates
end

local function GetDefaultTexture()
	return LSM:Fetch('statusbar', NP.db.statusbar)
end

-- Unit validation, seems to be the best way since GUID is secret?
local function GetUnitNameplate(unit)
	if not UnitExists(unit) then return end

	local blizzPlate = C_NamePlate_GetNamePlateForUnit(unit)
	if blizzPlate and blizzPlate.unitFrame then
		return blizzPlate.unitFrame
	end
end

local function SetBarTexture(bar, texture)
	if bar and bar.SetStatusBarTexture and texture then
		bar:SetStatusBarTexture(texture)
	end
end

-- Only touches plates whose texture actually changed (old special -> default, new special -> texture)
-- instead of re-applying textures to every visible plate
function Private:UpdateSpecialNameplateTextures()
	if not NP or not NP.Plates or not E.private.nameplates.enable then return end

	local db = GetDB()

	-- Resolve the desired special plates, units order gives target priority over focus
	wipe(desiredPlates)
	for _, entry in ipairs(units) do
		if db[entry.enable] then
			local plate = GetUnitNameplate(entry.unit)
			if plate and plate.Health and not desiredPlates[plate] then
				desiredPlates[plate] = LSM:Fetch('statusbar', db[entry.texture])
			end
		end
	end

	-- Restore plates that are no longer special
	local defaultTexture
	for plate in pairs(styledPlates) do
		if not desiredPlates[plate] then
			defaultTexture = defaultTexture or GetDefaultTexture()
			SetBarTexture(plate.Health, defaultTexture)
			styledPlates[plate] = nil
		end
	end

	-- Apply new or changed special textures
	for plate, texture in pairs(desiredPlates) do
		if styledPlates[plate] ~= texture then
			SetBarTexture(plate.Health, texture)
			styledPlates[plate] = texture
		end
	end
end

-- Used in the config file and OnDisable
function Private:RestoreNameplateTextures()
	if NP and NP.Update_StatusBars then
		NP:Update_StatusBars()
	end
end

local function CheckHook()
	if not NP then return end

	if not hooked and NP.Update_StatusBars then
		hooksecurefunc(NP, 'Update_StatusBars', function()
			wipe(styledPlates)
			Private:UpdateSpecialNameplateTextures()
		end)
		hooked = true
	end

	if not plateHooked and NP.PostUpdateAllElements and NP.NAME_PLATE_UNIT_REMOVED then
		hooksecurefunc(NP, 'PostUpdateAllElements', function(nameplate, event)
			if event ~= 'NAME_PLATE_UNIT_ADDED' then return end
			if nameplate == NP.TestFrame or nameplate.widgetsOnly or not nameplate.Health then return end
			if not E.private.nameplates.enable then return end

			local db = GetDB()
			for _, entry in ipairs(units) do
				if db[entry.enable] and GetUnitNameplate(entry.unit) == nameplate then
					local texture = LSM:Fetch('statusbar', db[entry.texture])
					if styledPlates[nameplate] ~= texture then
						SetBarTexture(nameplate.Health, texture)
						styledPlates[nameplate] = texture
					end
					return
				end
			end

			-- REMOVED normally cleared this already
			if styledPlates[nameplate] then
				SetBarTexture(nameplate.Health, GetDefaultTexture())
				styledPlates[nameplate] = nil
			end
		end)
		hooksecurefunc(NP, 'NAME_PLATE_UNIT_REMOVED', function(nameplate)
			if styledPlates[nameplate] then
				SetBarTexture(nameplate.Health, GetDefaultTexture())
				styledPlates[nameplate] = nil
			end
		end)
		plateHooked = true
	end
end

function NamePlates:PLAYER_FOCUS_CHANGED()
	Private:UpdateSpecialNameplateTextures()
end

function NamePlates:PLAYER_TARGET_CHANGED()
	Private:UpdateSpecialNameplateTextures()
end

function NamePlates:PLAYER_ENTERING_WORLD()
	CheckHook()
	Private:UpdateSpecialNameplateTextures()
end

function NamePlates:OnEnable()
	CheckHook()

	self:RegisterEvent('PLAYER_ENTERING_WORLD')
	self:RegisterEvent('PLAYER_FOCUS_CHANGED')
	self:RegisterEvent('PLAYER_TARGET_CHANGED')

	Private:UpdateSpecialNameplateTextures()
end

function NamePlates:OnDisable()
	Private:RestoreNameplateTextures()
end
