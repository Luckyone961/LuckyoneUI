local L1UI, E, L, V, P, G = unpack(select(2, ...))

local IsAddOnLoaded = IsAddOnLoaded
local SetCVar = SetCVar

-- LuckyoneUI print
function L1UI:Print(msg)
	print('|cff4beb2cLuckyoneUI|r: '..msg)
end

-- AddOnSkins Profile
function L1UI:AddonSetupAS(addon)

	if IsAddOnLoaded('AddOnSkins') then
		L1UI:GetASProfile()
		L1UI:Print('AddOnSkins profile has been set.')
	end
end

-- BigWigs Profile
function L1UI:AddonSetupBW(addon)

	if IsAddOnLoaded('BigWigs') then
		L1UI:GetBigWigsProfile()
		L1UI:Print('BigWigs profile has been set.')
	end
end

-- Details Profile
function L1UI:AddonSetupDT(addon)

	if IsAddOnLoaded('Details') then
		L1UI:GetDetailsProfile()
		L1UI:Print('Details profile has been set.')
	end
end

-- OmniCD Profile
function L1UI:AddonSetupOCD(addon)

	if IsAddOnLoaded('OmniCD') then
		L1UI:GetOmniCDProfile()
		L1UI:Print('OmniCD profile has been set.')
	end
end

-- ProjectAzilroka Profile
function L1UI:AddonSetupPA(addon)

	if IsAddOnLoaded('ProjectAzilroka') then
		L1UI:GetPAProfile()
		L1UI:Print('ProjectAzilroka profile has been set.')
	end
end

-- Shadow&Light Profile
function L1UI:AddonSetupSLE(addon)

	if IsAddOnLoaded('ElvUI_SLE') then
		L1UI:GetSLEProfile()
		L1UI:Print('Shadow&Light profile has been set.')
	end
end

-- CVars General
function L1UI:SetupCVars()

	SetCVar('advancedCombatLogging', 1)
	SetCVar('cameraDistanceMaxZoomFactor', 2.6)
	SetCVar('ffxDeath', 0)
	SetCVar('rawMouseEnable', 1)
	SetCVar('SpellQueueWindow', 50)

	L1UI:Print('CVars have been set.')
end

-- CVars NamePlates
function L1UI:NameplateReset()

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

	L1UI:Print('NamePlate CVars have been reset to default.')
end

-- Private DB
function L1UI:SetupPrivate()

	-- ElvUI Private DB
	E.private["general"]["chatBubbleFont"] = "Expressway"
	E.private["general"]["dmgfont"] = "Expressway"
	E.private["general"]["glossTex"] = "Solid"
	E.private["general"]["namefont"] = "Expressway"
	E.private["general"]["normTex"] = "Solid"
	E.private["general"]["totemBar"] = false
	E.private["install_complete"] = "11.49"
	E.private["skins"]["cleanBossButton"] = true
	E.private["skins"]["parchmentRemoverEnable"] = true

	E:StaggeredUpdateAll(nil, true)

	L1UI:Print('Note: Fonts do not change until you restart WoW.')
end
