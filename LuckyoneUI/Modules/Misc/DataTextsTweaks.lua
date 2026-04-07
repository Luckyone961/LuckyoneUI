-- Addon namespace
local _, Private = ...

-- ElvUI file
if not Private.ElvUI then
	return
end

-- Lua functions
local unpack = unpack

-- API cache
local InCombatLockdown = InCombatLockdown

-- ElvUI reference
local E = unpack(ElvUI)
local DT = E:GetModule('DataTexts')

-- Update ActionBars DataText width based on active LuckyoneUI profile
local function UpdateDataTextWidth()
	if InCombatLockdown() then return end

	local datatexts = E.global.datatexts
	if not datatexts or not datatexts.customPanels then return end

	local ActionBarsDT = datatexts.customPanels.Luckyone_ActionBars_DT
	if not ActionBarsDT then return end

	local profile = Private:GetActiveProfile()
	if not profile then return end

	if profile == 1 then
		ActionBarsDT.width = 395 -- Main layout default value
	elseif profile == 2 then
		ActionBarsDT.width = 704 -- Healer layout default value
	elseif profile == 3 then
		ActionBarsDT.width = 484 -- Support layout default value
	end

	DT:LoadDataTexts()
end

function Private:DataTextsTweaks()
	if not (Private.isRetail and Private.Addon.db.profile.misc.dataTextsTweaks) then return end
	E:Delay(1, UpdateDataTextWidth)
end
