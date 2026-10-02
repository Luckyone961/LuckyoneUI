local _, Private = ...
local LSM = Private.Libs.LSM

if not Private.ElvUI then
	return
end

local pairs = pairs
local unpack = unpack

local hooksecurefunc = hooksecurefunc

local E = unpack(ElvUI)
local NP = E:GetModule('NamePlates')
local UF = E:GetModule('UnitFrames')

-- ElvUI gives every prediction bar the same texture, swap the absorb bars after it
local function SetAbsorbTextures(prediction, db)
	if db.absorbTextureEnable then
		prediction.damageAbsorb:SetStatusBarTexture(LSM:Fetch('statusbar', db.absorbTexture))
	end

	if db.healAbsorbTextureEnable then
		prediction.healAbsorb:SetStatusBarTexture(LSM:Fetch('statusbar', db.healAbsorbTexture))
	end
end

-- Runs on every unitframe configure
hooksecurefunc(UF, 'Configure_HealComm', function(_, frame)
	SetAbsorbTextures(frame.HealthPrediction, Private.Addon.db.profile.unitframes)
end)

-- New nameplates are built with the ElvUI nameplate texture
hooksecurefunc(NP, 'StylePlate', function(_, nameplate)
	SetAbsorbTextures(nameplate.HealthPrediction, Private.Addon.db.profile.nameplates)
end)

-- Nameplate texture updates reset the prediction bars as well
hooksecurefunc(NP, 'Update_StatusBars', function()
	local db = Private.Addon.db.profile.nameplates
	for nameplate in pairs(NP.Plates) do
		SetAbsorbTextures(nameplate.HealthPrediction, db)
	end
end)

-- Let ElvUI reapply its own textures first, so switching an option off restores the default
function Private:UpdateAbsorbTextures(key)
	if key == 'unitframes' then
		if UF.Initialized then
			UF:Update_AllFrames()
		end
	elseif NP.Initialized then
		NP:Update_StatusBars()
	end
end
