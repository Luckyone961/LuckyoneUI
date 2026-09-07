local _, Private = ...

if not Private.ElvUI then
	return
end

local unpack = unpack

local InCombatLockdown = InCombatLockdown

local E = unpack(ElvUI)
local DT = E:GetModule('DataTexts')

local callbackRegistered

-- Correct ActionBars DataText width for the active LuckyoneUI profile, or nil if unchanged/unavailable
local function GetCorrectDataTextWidth()
	local datatexts = E.global.datatexts
	if not datatexts or not datatexts.customPanels then return end

	local ActionBarsDT = datatexts.customPanels.Luckyone_ActionBars_DT
	if not ActionBarsDT then return end

	local profile = Private:GetActiveProfile()
	if not profile then return end

	local width
	if profile == 1 then
		width = 395 -- Main layout default value
	elseif profile == 2 then
		width = 704 -- Healer layout default value
	end

	-- Skip the full datatext reload if the width already matches
	if not width or ActionBarsDT.width == width then return end

	return width, ActionBarsDT
end

-- Update ActionBars DataText width based on active LuckyoneUI profile
local function UpdateDataTextWidth()
	if InCombatLockdown() then return end

	local width, ActionBarsDT = GetCorrectDataTextWidth()
	if not width then return end

	ActionBarsDT.width = width
	DT:LoadDataTexts()
end

function Private:DataTextsTweaks()
	if not (Private.isRetail and Private.Addon.db.profile.misc.dataTextsTweaks) then return end

	-- Manual ElvUI profile changes
	if not callbackRegistered and E.data then
		E.data.RegisterCallback(Private, 'OnProfileChanged', UpdateDataTextWidth)
		callbackRegistered = true
	end

	-- Technically duplicate OnProfileChanged but harmless due to early return
	E:Delay(1, UpdateDataTextWidth)
end
