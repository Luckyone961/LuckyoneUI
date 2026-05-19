-- Addon namespace
local _, Private = ...
local LSM = Private.Libs.LSM
local NamePlates = Private.Modules.NamePlates

-- ElvUI file
if not Private.ElvUI then
	return
end

-- Lua functions
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

local function IsEnabled()
	local db = Private.Addon.db.profile.nameplates.focusTextureEnable
	return db and E.private.nameplates.enable
end

local function GetDefaultTexture()
	local db = NP.db.statusbar
	return LSM:Fetch('statusbar', db)
end

local function GetFocusTexture()
	local db = Private.Addon.db.profile.nameplates.focusTexture
	return LSM:Fetch('statusbar', db)
end

-- Focus validation, seems to be the best way since GUID is secret?
local function GetFocusNameplate()
	if not UnitExists('focus') then return end

	local blizzPlate = C_NamePlate_GetNamePlateForUnit('focus')
	if blizzPlate and blizzPlate.unitFrame then
		return blizzPlate.unitFrame
	end
end

local function SetBarTexture(bar, texture)
	if bar and bar.SetStatusBarTexture and texture then
		bar:SetStatusBarTexture(texture)
	end
end

local function ApplyPlateTexture(nameplate, focusPlate)
	if not nameplate or not nameplate.Health then return end

	focusPlate = (focusPlate == nil and GetFocusNameplate()) or focusPlate
	local texture = (focusPlate and nameplate == focusPlate) and GetFocusTexture() or GetDefaultTexture()
	SetBarTexture(nameplate.Health, texture)
end

function Private:UpdateFocusNameplateTextures()
	if not NP or not NP.Plates or not IsEnabled() then return end

	local focusPlate = GetFocusNameplate()

	for nameplate in pairs(NP.Plates) do
		ApplyPlateTexture(nameplate, focusPlate)
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
		hooksecurefunc(NP, 'Update_StatusBars', Private.UpdateFocusNameplateTextures)
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

			local focusPlate = GetFocusNameplate()

			-- Recycled frames keep the previous texture until explicitly reset
			SetBarTexture(nameplate.Health, GetDefaultTexture())

			if focusPlate and focusPlate == nameplate then
				Private:UpdateFocusNameplateTextures()
			end
		end)
		plateHooked = true
	end
end

function NamePlates:PLAYER_FOCUS_CHANGED()
	Private:UpdateFocusNameplateTextures()
end

function NamePlates:PLAYER_ENTERING_WORLD()
	CheckHook()
	Private:UpdateFocusNameplateTextures()
end

function NamePlates:OnEnable()
	CheckHook()

	self:RegisterEvent('PLAYER_ENTERING_WORLD')
	self:RegisterEvent('PLAYER_FOCUS_CHANGED')

	Private:UpdateFocusNameplateTextures()
end

function NamePlates:OnDisable()
	Private:RestoreNameplateTextures()
end
