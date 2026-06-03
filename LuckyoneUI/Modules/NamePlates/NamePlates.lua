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

local function IsEnabled()
	if not E.private.nameplates.enable then return end

	local db = Private.Addon.db.profile.nameplates
	for _, entry in ipairs(units) do
		if db[entry.enable] then
			return true
		end
	end
end

local function IsUnitEnabled(entry)
	return Private.Addon.db.profile.nameplates[entry.enable]
end

local function GetDefaultTexture()
	local db = NP.db.statusbar
	return LSM:Fetch('statusbar', db)
end

local function GetSpecialTexture(entry)
	local db = Private.Addon.db.profile.nameplates
	return LSM:Fetch('statusbar', db[entry.texture])
end

-- Unit validation, seems to be the best way since GUID is secret?
local function GetUnitNameplate(unit)
	if not UnitExists(unit) then return end

	local blizzPlate = C_NamePlate_GetNamePlateForUnit(unit)
	if blizzPlate and blizzPlate.unitFrame then
		return blizzPlate.unitFrame
	end
end

local function GetSpecialPlates()
	local plates = {}

	for _, entry in ipairs(units) do
		if IsUnitEnabled(entry) then
			plates[entry.unit] = GetUnitNameplate(entry.unit)
		end
	end

	return plates
end

local function SetBarTexture(bar, texture)
	if bar and bar.SetStatusBarTexture and texture then
		bar:SetStatusBarTexture(texture)
	end
end

local function ApplyPlateTexture(nameplate, specialPlates)
	if not nameplate or not nameplate.Health then return end

	specialPlates = specialPlates or GetSpecialPlates()

	for _, entry in ipairs(units) do
		if IsUnitEnabled(entry) then
			local specialPlate = specialPlates[entry.unit]
			if specialPlate and nameplate == specialPlate then
				SetBarTexture(nameplate.Health, GetSpecialTexture(entry))
				return
			end
		end
	end

	SetBarTexture(nameplate.Health, GetDefaultTexture())
end

function Private:UpdateSpecialNameplateTextures()
	if not NP or not NP.Plates or not IsEnabled() then return end

	local specialPlates = GetSpecialPlates()

	for nameplate in pairs(NP.Plates) do
		ApplyPlateTexture(nameplate, specialPlates)
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
		hooksecurefunc(NP, 'Update_StatusBars', Private.UpdateSpecialNameplateTextures)
		hooked = true
	end

	if not plateHooked and NP.PostUpdateAllElements and NP.NAME_PLATE_UNIT_REMOVED then
		hooksecurefunc(NP, 'PostUpdateAllElements', function(nameplate, event)
			if not IsEnabled() or event ~= 'NAME_PLATE_UNIT_ADDED' then return end
			if nameplate == NP.TestFrame or nameplate.widgetsOnly then return end

			ApplyPlateTexture(nameplate)
		end)
		hooksecurefunc(NP, 'NAME_PLATE_UNIT_REMOVED', function(nameplate)
			if not IsEnabled() then return end

			local specialPlates = GetSpecialPlates()
			local needsRefresh

			SetBarTexture(nameplate.Health, GetDefaultTexture())

			for _, entry in ipairs(units) do
				local specialPlate = specialPlates[entry.unit]
				if specialPlate and specialPlate == nameplate then
					needsRefresh = true
					break
				end
			end

			if needsRefresh then
				Private:UpdateSpecialNameplateTextures()
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
