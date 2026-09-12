local _, Private = ...

if not Private.ElvUI then
	return
end

local unpack = unpack

local InCombatLockdown = InCombatLockdown

local E = unpack(ElvUI)
local DT = E:GetModule('DataTexts')

local callbackRegistered

-- Update ActionBars DataText width based on active LuckyoneUI profile
local function UpdateDataTextWidth()
	if InCombatLockdown() or not Private.Addon.db.profile.misc.dataTextsTweaks then return end

	local profile = Private:GetActiveProfile()
	local width
	if profile == 1 then
		width = 395 -- Main layout default value
	elseif profile == 2 then
		width = 704 -- Healer layout default value
	end
	if not width then return end

	-- Nothing to resize if the width already matches
	local ActionBarsDT = E.global.datatexts.customPanels.Luckyone_ActionBars_DT
	if not ActionBarsDT or ActionBarsDT.width == width then return end

	ActionBarsDT.width = width
	DT:UpdatePanelAttributes('Luckyone_ActionBars_DT', ActionBarsDT)
end

function Private:DataTextsTweaks()
	if not Private.Addon.db.profile.misc.dataTextsTweaks then return end

	-- Manual ElvUI profile changes
	if not callbackRegistered and E.data then
		E.data.RegisterCallback(Private, 'OnProfileChanged', UpdateDataTextWidth)
		callbackRegistered = true
	end

	-- Technically duplicate OnProfileChanged but harmless due to early return
	E:Delay(1, UpdateDataTextWidth)
end
