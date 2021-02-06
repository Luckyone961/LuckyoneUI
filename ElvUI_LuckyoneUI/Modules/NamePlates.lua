local L1UI, E, L, V, P, G = unpack(select(2, ...))

local pairs = pairs
local SetCVar = SetCVar

-- NamePlate Setup
function L1UI:SetupNamePlates(addon)

	if addon == 'ElvUI' then

	elseif addon == 'Plater' then

	end
end

-- Style Filter Setup
function L1UI:SetupStyleFilters()

	for _, filterName in pairs({'Luckyone_HOA', 'Luckyone_MISTS', 'Luckyone_PF', 'Luckyone_NW', 'Luckyone_TOP', 'Luckyone_SD', 'Luckyone_SOA', 'Luckyone_DOS'}) do
		E.global["nameplate"]["filters"][filterName] = {}
		E.NamePlates:StyleFilterCopyDefaults(E.global["nameplate"]["filters"][filterName])
		E.db["nameplates"]["filters"][filterName] = { triggers = { enable = true } }
	end

	-- De Other Side [DOS]
	E.global["nameplate"]["filters"]["Luckyone_DOS"]["actions"]["color"]["health"] = true
	E.global["nameplate"]["filters"]["Luckyone_DOS"]["actions"]["color"]["healthColor"]["g"] = 0.75686274509804
	E.global["nameplate"]["filters"]["Luckyone_DOS"]["actions"]["color"]["healthColor"]["r"] = 0
	E.global["nameplate"]["filters"]["Luckyone_DOS"]["triggers"]["names"]["164857"] = true
	E.global["nameplate"]["filters"]["Luckyone_DOS"]["triggers"]["names"]["167965"] = true
	E.global["nameplate"]["filters"]["Luckyone_DOS"]["triggers"]["names"]["168934"] = true
	E.global["nameplate"]["filters"]["Luckyone_DOS"]["triggers"]["names"]["168942"] = true
	E.global["nameplate"]["filters"]["Luckyone_DOS"]["triggers"]["names"]["169905"] = true
	E.global["nameplate"]["filters"]["Luckyone_DOS"]["triggers"]["names"]["170572"] = true
	E.global["nameplate"]["filters"]["Luckyone_DOS"]["triggers"]["names"]["171343"] = true
	E.global["nameplate"]["filters"]["Luckyone_DOS"]["triggers"]["priority"] = 2

	-- Halls of Atonement [HOA]
	E.global["nameplate"]["filters"]["Luckyone_HOA"]["actions"]["color"]["health"] = true
	E.global["nameplate"]["filters"]["Luckyone_HOA"]["actions"]["color"]["healthColor"]["g"] = 0.75686274509804
	E.global["nameplate"]["filters"]["Luckyone_HOA"]["actions"]["color"]["healthColor"]["r"] = 0
	E.global["nameplate"]["filters"]["Luckyone_HOA"]["triggers"]["names"]["164562"] = true
	E.global["nameplate"]["filters"]["Luckyone_HOA"]["triggers"]["names"]["165529"] = true
	E.global["nameplate"]["filters"]["Luckyone_HOA"]["triggers"]["names"]["167612"] = true
	E.global["nameplate"]["filters"]["Luckyone_HOA"]["triggers"]["names"]["167892"] = true
	E.global["nameplate"]["filters"]["Luckyone_HOA"]["triggers"]["priority"] = 2

	-- Mists of Tirna Scithe [MISTS]
	E.global["nameplate"]["filters"]["Luckyone_MISTS"]["actions"]["color"]["health"] = true
	E.global["nameplate"]["filters"]["Luckyone_MISTS"]["actions"]["color"]["healthColor"]["g"] = 0.75686274509804
	E.global["nameplate"]["filters"]["Luckyone_MISTS"]["actions"]["color"]["healthColor"]["r"] = 0
	E.global["nameplate"]["filters"]["Luckyone_MISTS"]["triggers"]["names"]["164804"] = true
	E.global["nameplate"]["filters"]["Luckyone_MISTS"]["triggers"]["names"]["164921"] = true
	E.global["nameplate"]["filters"]["Luckyone_MISTS"]["triggers"]["names"]["166299"] = true
	E.global["nameplate"]["filters"]["Luckyone_MISTS"]["triggers"]["names"]["167111"] = true
	E.global["nameplate"]["filters"]["Luckyone_MISTS"]["triggers"]["priority"] = 2

	-- The Necrotic Wake [NW]
	E.global["nameplate"]["filters"]["Luckyone_NW"]["actions"]["color"]["health"] = true
	E.global["nameplate"]["filters"]["Luckyone_NW"]["actions"]["color"]["healthColor"]["g"] = 0.75686274509804
	E.global["nameplate"]["filters"]["Luckyone_NW"]["actions"]["color"]["healthColor"]["r"] = 0
	E.global["nameplate"]["filters"]["Luckyone_NW"]["triggers"]["names"]["163618"] = true
	E.global["nameplate"]["filters"]["Luckyone_NW"]["triggers"]["names"]["165824"] = true
	E.global["nameplate"]["filters"]["Luckyone_NW"]["triggers"]["names"]["165872"] = true
	E.global["nameplate"]["filters"]["Luckyone_NW"]["triggers"]["names"]["166302"] = true
	E.global["nameplate"]["filters"]["Luckyone_NW"]["triggers"]["names"]["173016"] = true
	E.global["nameplate"]["filters"]["Luckyone_NW"]["triggers"]["priority"] = 2

	-- Plaguefall [PF]
	E.global["nameplate"]["filters"]["Luckyone_PF"]["actions"]["color"]["health"] = true
	E.global["nameplate"]["filters"]["Luckyone_PF"]["actions"]["color"]["healthColor"]["g"] = 0.75686274509804
	E.global["nameplate"]["filters"]["Luckyone_PF"]["actions"]["color"]["healthColor"]["r"] = 0
	E.global["nameplate"]["filters"]["Luckyone_PF"]["triggers"]["names"]["163882"] = true
	E.global["nameplate"]["filters"]["Luckyone_PF"]["triggers"]["names"]["163894"] = true
	E.global["nameplate"]["filters"]["Luckyone_PF"]["triggers"]["names"]["164737"] = true
	E.global["nameplate"]["filters"]["Luckyone_PF"]["triggers"]["names"]["168572"] = true
	E.global["nameplate"]["filters"]["Luckyone_PF"]["triggers"]["names"]["168627"] = true
	E.global["nameplate"]["filters"]["Luckyone_PF"]["triggers"]["names"]["169861"] = true
	E.global["nameplate"]["filters"]["Luckyone_PF"]["triggers"]["priority"] = 2

	-- Sanguine Depths [SD]
	E.global["nameplate"]["filters"]["Luckyone_SD"]["actions"]["color"]["health"] = true
	E.global["nameplate"]["filters"]["Luckyone_SD"]["actions"]["color"]["healthColor"]["g"] = 0.75686274509804
	E.global["nameplate"]["filters"]["Luckyone_SD"]["actions"]["color"]["healthColor"]["r"] = 0
	E.global["nameplate"]["filters"]["Luckyone_SD"]["triggers"]["names"]["162038"] = true
	E.global["nameplate"]["filters"]["Luckyone_SD"]["triggers"]["names"]["162040"] = true
	E.global["nameplate"]["filters"]["Luckyone_SD"]["triggers"]["names"]["162057"] = true
	E.global["nameplate"]["filters"]["Luckyone_SD"]["triggers"]["names"]["171376"] = true
	E.global["nameplate"]["filters"]["Luckyone_SD"]["triggers"]["names"]["171799"] = true
	E.global["nameplate"]["filters"]["Luckyone_SD"]["triggers"]["priority"] = 2

	-- Spires of Ascension [SOA]
	E.global["nameplate"]["filters"]["Luckyone_SOA"]["actions"]["color"]["health"] = true
	E.global["nameplate"]["filters"]["Luckyone_SOA"]["actions"]["color"]["healthColor"]["g"] = 0.75686274509804
	E.global["nameplate"]["filters"]["Luckyone_SOA"]["actions"]["color"]["healthColor"]["r"] = 0
	E.global["nameplate"]["filters"]["Luckyone_SOA"]["triggers"]["names"]["163459"] = true
	E.global["nameplate"]["filters"]["Luckyone_SOA"]["triggers"]["names"]["163520"] = true
	E.global["nameplate"]["filters"]["Luckyone_SOA"]["triggers"]["names"]["168318"] = true
	E.global["nameplate"]["filters"]["Luckyone_SOA"]["triggers"]["names"]["168681"] = true
	E.global["nameplate"]["filters"]["Luckyone_SOA"]["triggers"]["priority"] = 2

	-- Theater of Pain [TOP]
	E.global["nameplate"]["filters"]["Luckyone_TOP"]["actions"]["color"]["health"] = true
	E.global["nameplate"]["filters"]["Luckyone_TOP"]["actions"]["color"]["healthColor"]["g"] = 0.75686274509804
	E.global["nameplate"]["filters"]["Luckyone_TOP"]["actions"]["color"]["healthColor"]["r"] = 0
	E.global["nameplate"]["filters"]["Luckyone_TOP"]["triggers"]["names"]["160495"] = true
	E.global["nameplate"]["filters"]["Luckyone_TOP"]["triggers"]["names"]["164506"] = true
	E.global["nameplate"]["filters"]["Luckyone_TOP"]["triggers"]["names"]["170850"] = true
	E.global["nameplate"]["filters"]["Luckyone_TOP"]["triggers"]["names"]["174210"] = true
	E.global["nameplate"]["filters"]["Luckyone_TOP"]["triggers"]["priority"] = 2

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
