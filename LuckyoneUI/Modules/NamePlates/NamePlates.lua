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

-- ElvUI reference
local E = unpack(ElvUI)
local NP = E:GetModule('NamePlates')

local hooked

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

local function IsFocusUnit(unit)
	if not unit then return false end
	return E:UnitIsUnit(unit, 'focus')
end

local function SetBarTexture(bar, texture)
	if bar and bar.SetStatusBarTexture and texture then
		bar:SetStatusBarTexture(texture)
	end
end

local function ApplyPlateTexture(nameplate)
	if not nameplate or not nameplate.Health then return end

	local texture = IsFocusUnit(nameplate.unit) and GetFocusTexture() or GetDefaultTexture()
	SetBarTexture(nameplate.Health, texture)
end

function Private:UpdateFocusNameplateTextures()
	if not NP or not NP.Plates or not IsEnabled() then return end

	for nameplate in pairs(NP.Plates) do
		ApplyPlateTexture(nameplate)
	end
end

-- Used in the config file and OnDisable
function Private:RestoreNameplateTextures()
	if NP and NP.Update_StatusBars then
		NP:Update_StatusBars()
	end
end

local function CheckHook()
	if hooked then return end
	if not NP or not NP.Update_StatusBars then return end

	hooksecurefunc(NP, 'Update_StatusBars', Private.UpdateFocusNameplateTextures)
	hooked = true
end

function NamePlates:PLAYER_FOCUS_CHANGED()
	Private:UpdateFocusNameplateTextures()
end

function NamePlates:NAME_PLATE_UNIT_ADDED(_, unit)
	if not IsEnabled() then return end
	if not IsFocusUnit(unit) then return end
	if not NP or not NP.Plates then return end

	for nameplate in pairs(NP.Plates) do
		if E:UnitIsUnit(nameplate.unit, unit) then
			ApplyPlateTexture(nameplate)
			break
		end
	end
end

function NamePlates:NAME_PLATE_UNIT_REMOVED(_, unit)
	if not IsEnabled() then return end
	if not IsFocusUnit(unit) then return end

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
	self:RegisterEvent('NAME_PLATE_UNIT_ADDED')
	self:RegisterEvent('NAME_PLATE_UNIT_REMOVED')

	Private:UpdateFocusNameplateTextures()
end

function NamePlates:OnDisable()
	Private:RestoreNameplateTextures()
end
