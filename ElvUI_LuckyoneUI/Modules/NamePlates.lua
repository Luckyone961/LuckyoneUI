local L1UI, E, L, V, P, G = unpack(select(2, ...))

local pairs = pairs
local SetCVar = SetCVar

-- NamePlates setup
function L1UI:SetupNamePlates()

	for _, filterName in pairs({'Luckyone_AD', 'Luckyone_FH', 'Luckyone_KR', 'Luckyone_ML', 'Luckyone_SIEGE', 'Luckyone_SOTS', 'Luckyone_TD', 'Luckyone_TOS', 'Luckyone_UR', 'Luckyone_WM', 'Luckyone_WORK', 'Luckyone_YARD'}) do
		E.global["nameplate"]["filters"][filterName] = {}
		E.NamePlates:StyleFilterCopyDefaults(E.global["nameplate"]["filters"][filterName])
		E.db["nameplates"]["filters"][filterName] = { triggers = { enable = true } }
	end

	-- Atal'Dazar
	E.global["nameplate"]["filters"]["Luckyone_AD"]["actions"]["color"]["health"] = true
	E.global["nameplate"]["filters"]["Luckyone_AD"]["actions"]["color"]["healthColor"]["g"] = 0.59607843137255
	E.global["nameplate"]["filters"]["Luckyone_AD"]["actions"]["color"]["healthColor"]["r"] = 0
	E.global["nameplate"]["filters"]["Luckyone_AD"]["triggers"]["names"]["122969"] = true
	E.global["nameplate"]["filters"]["Luckyone_AD"]["triggers"]["names"]["122972"] = true
	E.global["nameplate"]["filters"]["Luckyone_AD"]["triggers"]["names"]["122973"] = true
	E.global["nameplate"]["filters"]["Luckyone_AD"]["triggers"]["names"]["127315"] = true
	E.global["nameplate"]["filters"]["Luckyone_AD"]["triggers"]["names"]["128434"] = true

	-- Freehold
	E.global["nameplate"]["filters"]["Luckyone_FH"]["actions"]["color"]["health"] = true
	E.global["nameplate"]["filters"]["Luckyone_FH"]["actions"]["color"]["healthColor"]["g"] = 0.59607843137255
	E.global["nameplate"]["filters"]["Luckyone_FH"]["actions"]["color"]["healthColor"]["r"] = 0
	E.global["nameplate"]["filters"]["Luckyone_FH"]["triggers"]["names"]["126918"] = true
	E.global["nameplate"]["filters"]["Luckyone_FH"]["triggers"]["names"]["127111"] = true
	E.global["nameplate"]["filters"]["Luckyone_FH"]["triggers"]["names"]["129529"] = true
	E.global["nameplate"]["filters"]["Luckyone_FH"]["triggers"]["names"]["129600"] = true
	E.global["nameplate"]["filters"]["Luckyone_FH"]["triggers"]["names"]["129602"] = true
	E.global["nameplate"]["filters"]["Luckyone_FH"]["triggers"]["names"]["130012"] = true
	E.global["nameplate"]["filters"]["Luckyone_FH"]["triggers"]["names"]["130404"] = true

	-- Kings Rest
	E.global["nameplate"]["filters"]["Luckyone_KR"]["actions"]["color"]["health"] = true
	E.global["nameplate"]["filters"]["Luckyone_KR"]["actions"]["color"]["healthColor"]["g"] = 0.59607843137255
	E.global["nameplate"]["filters"]["Luckyone_KR"]["actions"]["color"]["healthColor"]["r"] = 0
	E.global["nameplate"]["filters"]["Luckyone_KR"]["triggers"]["names"]["134158"] = true
	E.global["nameplate"]["filters"]["Luckyone_KR"]["triggers"]["names"]["134174"] = true
	E.global["nameplate"]["filters"]["Luckyone_KR"]["triggers"]["names"]["134331"] = true
	E.global["nameplate"]["filters"]["Luckyone_KR"]["triggers"]["names"]["135167"] = true
	E.global["nameplate"]["filters"]["Luckyone_KR"]["triggers"]["names"]["135235"] = true
	E.global["nameplate"]["filters"]["Luckyone_KR"]["triggers"]["names"]["137478"] = true
	E.global["nameplate"]["filters"]["Luckyone_KR"]["triggers"]["names"]["138489"] = true

	-- Motherlode
	E.global["nameplate"]["filters"]["Luckyone_ML"]["actions"]["color"]["health"] = true
	E.global["nameplate"]["filters"]["Luckyone_ML"]["actions"]["color"]["healthColor"]["g"] = 0.59607843137255
	E.global["nameplate"]["filters"]["Luckyone_ML"]["actions"]["color"]["healthColor"]["r"] = 0
	E.global["nameplate"]["filters"]["Luckyone_ML"]["triggers"]["names"]["129802"] = true
	E.global["nameplate"]["filters"]["Luckyone_ML"]["triggers"]["names"]["130661"] = true
	E.global["nameplate"]["filters"]["Luckyone_ML"]["triggers"]["names"]["133430"] = true
	E.global["nameplate"]["filters"]["Luckyone_ML"]["triggers"]["names"]["133593"] = true
	E.global["nameplate"]["filters"]["Luckyone_ML"]["triggers"]["names"]["134232"] = true
	E.global["nameplate"]["filters"]["Luckyone_ML"]["triggers"]["names"]["136470"] = true
	E.global["nameplate"]["filters"]["Luckyone_ML"]["triggers"]["names"]["136934"] = true

	-- Siege of Boralus
	E.global["nameplate"]["filters"]["Luckyone_SIEGE"]["actions"]["color"]["health"] = true
	E.global["nameplate"]["filters"]["Luckyone_SIEGE"]["actions"]["color"]["healthColor"]["g"] = 0.59607843137255
	E.global["nameplate"]["filters"]["Luckyone_SIEGE"]["actions"]["color"]["healthColor"]["r"] = 0
	E.global["nameplate"]["filters"]["Luckyone_SIEGE"]["triggers"]["names"]["129367"] = true
	E.global["nameplate"]["filters"]["Luckyone_SIEGE"]["triggers"]["names"]["129370"] = true
	E.global["nameplate"]["filters"]["Luckyone_SIEGE"]["triggers"]["names"]["137517"] = true
	E.global["nameplate"]["filters"]["Luckyone_SIEGE"]["triggers"]["names"]["137614"] = true
	E.global["nameplate"]["filters"]["Luckyone_SIEGE"]["triggers"]["names"]["138019"] = true
	E.global["nameplate"]["filters"]["Luckyone_SIEGE"]["triggers"]["names"]["138465"] = true
	E.global["nameplate"]["filters"]["Luckyone_SIEGE"]["triggers"]["names"]["141283"] = true
	E.global["nameplate"]["filters"]["Luckyone_SIEGE"]["triggers"]["names"]["141284"] = true

	-- Shrine of the Storm
	E.global["nameplate"]["filters"]["Luckyone_SOTS"]["actions"]["color"]["health"] = true
	E.global["nameplate"]["filters"]["Luckyone_SOTS"]["actions"]["color"]["healthColor"]["g"] = 0.59607843137255
	E.global["nameplate"]["filters"]["Luckyone_SOTS"]["actions"]["color"]["healthColor"]["r"] = 0
	E.global["nameplate"]["filters"]["Luckyone_SOTS"]["triggers"]["names"]["134139"] = true
	E.global["nameplate"]["filters"]["Luckyone_SOTS"]["triggers"]["names"]["134150"] = true
	E.global["nameplate"]["filters"]["Luckyone_SOTS"]["triggers"]["names"]["134417"] = true
	E.global["nameplate"]["filters"]["Luckyone_SOTS"]["triggers"]["names"]["134423"] = true
	E.global["nameplate"]["filters"]["Luckyone_SOTS"]["triggers"]["names"]["134514"] = true
	E.global["nameplate"]["filters"]["Luckyone_SOTS"]["triggers"]["names"]["136186"] = true
	E.global["nameplate"]["filters"]["Luckyone_SOTS"]["triggers"]["names"]["136214"] = true
	E.global["nameplate"]["filters"]["Luckyone_SOTS"]["triggers"]["names"]["136297"] = true

	-- Tol'Dagor
	E.global["nameplate"]["filters"]["Luckyone_TD"]["actions"]["color"]["health"] = true
	E.global["nameplate"]["filters"]["Luckyone_TD"]["actions"]["color"]["healthColor"]["g"] = 0.59607843137255
	E.global["nameplate"]["filters"]["Luckyone_TD"]["actions"]["color"]["healthColor"]["r"] = 0
	E.global["nameplate"]["filters"]["Luckyone_TD"]["triggers"]["names"]["127482"] = true
	E.global["nameplate"]["filters"]["Luckyone_TD"]["triggers"]["names"]["127488"] = true
	E.global["nameplate"]["filters"]["Luckyone_TD"]["triggers"]["names"]["130026"] = true
	E.global["nameplate"]["filters"]["Luckyone_TD"]["triggers"]["names"]["135699"] = true

	-- Temple of Sethraliss
	E.global["nameplate"]["filters"]["Luckyone_TOS"]["actions"]["color"]["health"] = true
	E.global["nameplate"]["filters"]["Luckyone_TOS"]["actions"]["color"]["healthColor"]["g"] = 0.59607843137255
	E.global["nameplate"]["filters"]["Luckyone_TOS"]["actions"]["color"]["healthColor"]["r"] = 0
	E.global["nameplate"]["filters"]["Luckyone_TOS"]["triggers"]["names"]["134364"] = true
	E.global["nameplate"]["filters"]["Luckyone_TOS"]["triggers"]["names"]["134599"] = true
	E.global["nameplate"]["filters"]["Luckyone_TOS"]["triggers"]["names"]["134629"] = true
	E.global["nameplate"]["filters"]["Luckyone_TOS"]["triggers"]["names"]["134990"] = true
	E.global["nameplate"]["filters"]["Luckyone_TOS"]["triggers"]["names"]["139110"] = true
	E.global["nameplate"]["filters"]["Luckyone_TOS"]["triggers"]["names"]["139949"] = true

	-- Underrot
	E.global["nameplate"]["filters"]["Luckyone_UR"]["actions"]["color"]["health"] = true
	E.global["nameplate"]["filters"]["Luckyone_UR"]["actions"]["color"]["healthColor"]["g"] = 0.59607843137255
	E.global["nameplate"]["filters"]["Luckyone_UR"]["actions"]["color"]["healthColor"]["r"] = 0
	E.global["nameplate"]["filters"]["Luckyone_UR"]["triggers"]["names"]["130909"] = true
	E.global["nameplate"]["filters"]["Luckyone_UR"]["triggers"]["names"]["131492"] = true
	E.global["nameplate"]["filters"]["Luckyone_UR"]["triggers"]["names"]["133835"] = true
	E.global["nameplate"]["filters"]["Luckyone_UR"]["triggers"]["names"]["134284"] = true
	E.global["nameplate"]["filters"]["Luckyone_UR"]["triggers"]["names"]["138187"] = true

	-- Waycrest Manor
	E.global["nameplate"]["filters"]["Luckyone_WM"]["actions"]["color"]["health"] = true
	E.global["nameplate"]["filters"]["Luckyone_WM"]["actions"]["color"]["healthColor"]["g"] = 0.59607843137255
	E.global["nameplate"]["filters"]["Luckyone_WM"]["actions"]["color"]["healthColor"]["r"] = 0
	E.global["nameplate"]["filters"]["Luckyone_WM"]["triggers"]["names"]["131586"] = true
	E.global["nameplate"]["filters"]["Luckyone_WM"]["triggers"]["names"]["131587"] = true
	E.global["nameplate"]["filters"]["Luckyone_WM"]["triggers"]["names"]["131812"] = true
	E.global["nameplate"]["filters"]["Luckyone_WM"]["triggers"]["names"]["131819"] = true
	E.global["nameplate"]["filters"]["Luckyone_WM"]["triggers"]["names"]["131849"] = true
	E.global["nameplate"]["filters"]["Luckyone_WM"]["triggers"]["names"]["131858"] = true
	E.global["nameplate"]["filters"]["Luckyone_WM"]["triggers"]["names"]["134041"] = true

	-- Mechagon Workshop
	E.global["nameplate"]["filters"]["Luckyone_WORK"]["actions"]["color"]["health"] = true
	E.global["nameplate"]["filters"]["Luckyone_WORK"]["actions"]["color"]["healthColor"]["g"] = 0.59607843137255
	E.global["nameplate"]["filters"]["Luckyone_WORK"]["actions"]["color"]["healthColor"]["r"] = 0
	E.global["nameplate"]["filters"]["Luckyone_WORK"]["triggers"]["names"]["144293"] = true
	E.global["nameplate"]["filters"]["Luckyone_WORK"]["triggers"]["names"]["144294"] = true
	E.global["nameplate"]["filters"]["Luckyone_WORK"]["triggers"]["names"]["151325"] = true
	E.global["nameplate"]["filters"]["Luckyone_WORK"]["triggers"]["names"]["151657"] = true

	-- Mechagon Junkyard
	E.global["nameplate"]["filters"]["Luckyone_YARD"]["actions"]["color"]["health"] = true
	E.global["nameplate"]["filters"]["Luckyone_YARD"]["actions"]["color"]["healthColor"]["g"] = 0.59607843137255
	E.global["nameplate"]["filters"]["Luckyone_YARD"]["actions"]["color"]["healthColor"]["r"] = 0
	E.global["nameplate"]["filters"]["Luckyone_YARD"]["triggers"]["names"]["150146"] = true
	E.global["nameplate"]["filters"]["Luckyone_YARD"]["triggers"]["names"]["150160"] = true
	E.global["nameplate"]["filters"]["Luckyone_YARD"]["triggers"]["names"]["150168"] = true
	E.global["nameplate"]["filters"]["Luckyone_YARD"]["triggers"]["names"]["150250"] = true
	E.global["nameplate"]["filters"]["Luckyone_YARD"]["triggers"]["names"]["150251"] = true
	E.global["nameplate"]["filters"]["Luckyone_YARD"]["triggers"]["names"]["150292"] = true
	E.global["nameplate"]["filters"]["Luckyone_YARD"]["triggers"]["names"]["150297"] = true

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

	L1UI:Print('NamePlate StyleFilters have been set.')
end
