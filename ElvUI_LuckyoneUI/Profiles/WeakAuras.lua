-- Lua functions
local unpack = unpack

-- AddOn namespace
local _, Private = ...

-- ElvUI modules
local E, L = unpack(ElvUI)

local function ShowImportBox(link)
	E:StaticPopup_Show('L1UI_EDITBOX', nil, nil, link)
end

-- WeakAuras
-- LC: 28/08/2025
function Private:WeakAurasImport(aura)
	if not (Private.IsAddOnLoaded('WeakAuras') and E.Retail) then Private:Print('WeakAuras ' .. L["is not installed or enabled."]) return end

	local auraLinks = {
		evoker = 'https://wago.io/LuckyoneUI-Evoker',
		druid = 'https://wago.io/LuckyoneUI-Druid',
		customEditsRanged = 'https://wago.io/LuckyoneUI-Class-Edits-Ranged',
		customEditsMelee = 'https://wago.io/LuckyoneUI-Class-Edits-Melee',
		customEditsTanks = 'https://wago.io/LuckyoneUI-Class-Edits-Tanks',
		customEditsHealers = 'https://wago.io/LuckyoneUI-Class-Edits-Healers',
		keys = 'https://wago.io/keystones',
		elvuiMythicVisibility = 'https://wago.io/ElvUI-Mythic-Visibility',
		externals = 'https://wago.io/LuckyoneUI-Externals',
		groupfinderAppTextHide = 'https://wago.io/appTextHide',
		handleFriendlyNamePlates = 'https://wago.io/handleFriendlyNamePlates',
		handleNamePlatesFont = 'https://wago.io/handleNamePlatesFont',
		playerFrameUtilities = 'https://wago.io/LuckyoneUI-PlayerFrameUtilities',
		trinket = 'https://wago.io/Trinket',
		affixes = 'https://wago.io/affixes',
		dungeonCore = 'https://wago.io/LuckyoneUI-Dungeons',
		raidCore = 'https://wago.io/LuckyoneUI-Raid',
	}

	local link = auraLinks[aura]
	if link then
		ShowImportBox(link)
	end

	Private:Print(L["Copy the import string from the Wago link and paste it in /wa."])
	Private:Print(L["Make sure to keep your WeakAuras updated using the WA Companion or Wago App."])
end
