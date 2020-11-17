local L1UI, E, L, V, P, G = unpack(select(2, ...))

local pairs = pairs
local SetCVar = SetCVar

-- NamePlates setup
function L1UI:SetupNamePlates()

	--[[for _, filterName in pairs({'Name1', 'Name2'}) do
		E.global["nameplate"]["filters"][filterName] = {}
		E.NamePlates:StyleFilterCopyDefaults(E.global["nameplate"]["filters"][filterName])
		E.db["nameplates"]["filters"][filterName] = { triggers = { enable = true } }
	end]]

	-- Halls of Atonement
	-- Mists of Tirna Scithe
	-- Plaguefall
	-- The Necrotic Wake
	-- Theater of Pain
	-- Sanguine Depths
	-- Spires of Ascension
	-- De Other Side

	-- Edited default filters
	E.global["nameplate"]["filters"]["ElvUI_Explosives"]["actions"]["color"]["healthColor"]["r"] = 0.49019607843137
	E.global["nameplate"]["filters"]["ElvUI_Explosives"]["actions"]["color"]["healthColor"]["g"] = 0
	E.global["nameplate"]["filters"]["ElvUI_Explosives"]["actions"]["color"]["healthColor"]["b"] = 1
	E.global["nameplate"]["filters"]["ElvUI_Explosives"]["actions"]["scale"] = 1
	E.global["nameplate"]["filters"]["ElvUI_Explosives"]["triggers"]["priority"] = 1
	E.global["nameplate"]["filters"]["ElvUI_NonTarget"]["actions"]["alpha"] = 70
	E.global["nameplate"]["filters"]["ElvUI_Target"]["actions"]["scale"] = 1

	E:StaggeredUpdateAll(nil, true)

	-- NamePlate CVars
	SetCVar('nameplateLargerScale', 1)
	SetCVar('nameplateMinAlpha', 1)
	SetCVar('nameplateMinScale', 1)
	SetCVar('nameplateMotion', 1)
	SetCVar('nameplateOccludedAlphaMult', 1)
	SetCVar('nameplateOverlapH', 1)
	SetCVar('nameplateOverlapV', 1.6)
	SetCVar('nameplateSelectedScale', 1)
	SetCVar('nameplateSelfAlpha', 1)

	-- Name CVars
	SetCVar('UnitNameEnemyGuardianName', 1)
	SetCVar('UnitNameEnemyMinionName', 1)
	SetCVar('UnitNameEnemyPetName', 1)
	SetCVar('UnitNameEnemyPlayerName', 1)
	SetCVar('UnitNameEnemyTotem', 1)

	L1UI:Print('NamePlate StyleFilters and CVars have been set.')
end
