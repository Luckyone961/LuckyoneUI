local Name, Private = ...
local L = Private.L

if not Private.ElvUI then
	return
end

local format = string.format
local unpack = unpack

local LibStub = LibStub
local StaticPopupDialogs = StaticPopupDialogs
local StaticPopup_Show = StaticPopup_Show

local E = unpack(ElvUI)
local ElvUI = Private.Modules.ElvUI -- Shadows the addon table from here on, E is all this file needs

-- ElvUI version check popup
-- StaticPopup_Show('LUCKYONE_VC')
StaticPopupDialogs['LUCKYONE_VC'] = {
	text = format('|cffC80000%s|r', L["Your ElvUI is outdated - please update and reload."]),
	whileDead = 1,
	hideOnEscape = false,
}

function ElvUI:PLAYER_ENTERING_WORLD()
	Private:DataTextsTweaks()
	if Private.isRetail then
		Private:MythicVisibility()
	end
	Private:NamePlates_Update()
end

-- Target and focus changes
function ElvUI:NamePlates_Update()
	Private:NamePlates_Update()
end

-- DataTextsTweaks follows spec switches through the ElvUI OnProfileChanged callback instead
function ElvUI:PLAYER_SPECIALIZATION_CHANGED(_, unit)
	-- Fires for other units as well, only react to the player
	if unit ~= 'player' then return end

	Private:MythicVisibility()
end

function ElvUI:PLAYER_DIFFICULTY_CHANGED()
	Private:MythicVisibility()
end

function ElvUI:OnEnable()
	-- Skip the ElvUI installer
	if E.private.install_complete == nil then
		if E.InstallFrame and E.InstallFrame:IsShown() then
			E.InstallFrame:Hide()
		end
		E.private.install_complete = E.version
	end

	LibStub('LibElvUIPlugin-1.0'):RegisterPlugin(Name, Private.RegisterElvUIConfig)

	if E.version < Private.RequiredElvUI then
		StaticPopup_Show('LUCKYONE_VC')
		Private:Print(format('|cffbf0008%s|r', L["Your ElvUI is outdated - please update and reload."]))
	end

	Private:NamePlates()

	self:RegisterEvent('PLAYER_ENTERING_WORLD')

	-- ElvUI nameplates off (e.g. Platynator), enabling them again needs a reload
	if E.private.nameplates.enable then
		self:RegisterEvent('PLAYER_TARGET_CHANGED', 'NamePlates_Update')

		-- Focus unit does not exist on Classic Era
		if not Private.isClassic then
			self:RegisterEvent('PLAYER_FOCUS_CHANGED', 'NamePlates_Update')
		end
	end

	if Private.isRetail then
		self:RegisterEvent('PLAYER_SPECIALIZATION_CHANGED')
		self:RegisterEvent('PLAYER_DIFFICULTY_CHANGED')
	end
end
