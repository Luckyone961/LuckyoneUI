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
	if not (Private.IsAddOnLoaded('WeakAuras') and Private.isRetail) then Private:Print('WeakAuras ' .. L["is not installed or enabled."]) return end

	local auraLinks = {
		evoker = 'LuckyoneUI-Evoker',
		druid = 'LuckyoneUI-Druid',
		customEditsRanged = 'LuckyoneUI-Class-Edits-Ranged',
		customEditsMelee = 'LuckyoneUI-Class-Edits-Melee',
		customEditsTanks = 'LuckyoneUI-Class-Edits-Tanks',
		customEditsHealers = 'LuckyoneUI-Class-Edits-Healers',
		keys = 'keystones',
		elvuiMythicVisibility = 'ElvUI-Mythic-Visibility',
		externals = 'LuckyoneUI-Externals',
		groupfinderAppTextHide = 'appTextHide',
		handleFriendlyNamePlates = 'handleFriendlyNamePlates',
		handleNamePlatesFont = 'handleNamePlatesFont',
		playerFrameUtilities = 'LuckyoneUI-PlayerFrameUtilities',
		trinket = 'Trinket',
		affixes = 'affixes',
		dungeonCore = 'LuckyoneUI-Dungeons',
		raidCore = 'LuckyoneUI-Raid',
	}

	local link = auraLinks[aura]
	if link then
		ShowImportBox('https://wago.io/'..link)
	end

	Private:Print(L["Copy the import string from the Wago link and paste it in /wa."])
	Private:Print(L["Make sure to keep your WeakAuras updated using the WA Companion or Wago App."])
end
