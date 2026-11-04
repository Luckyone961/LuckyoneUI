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
end

-- Target and focus changes
function ElvUI:TargetTextures_Update()
	Private:TargetTextures_Update()
end

-- Spec and difficulty changes
-- DataTextsTweaks follows spec switches through the ElvUI OnProfileChanged callback instead
function ElvUI:MythicVisibility_Update(_, unit)
	-- The spec event fires for other units as well, only react to the player
	if unit and unit ~= 'player' then return end

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

	Private:CopyChat()
	Private:TargetTextures()

	self:RegisterEvent('PLAYER_ENTERING_WORLD')

	-- ElvUI nameplates off (e.g. Platynator), enabling them again needs a reload
	if E.private.nameplates.enable then
		self:RegisterEvent('PLAYER_TARGET_CHANGED', 'TargetTextures_Update')

		-- Focus unit does not exist on Classic Era
		if not Private.isClassic then
			self:RegisterEvent('PLAYER_FOCUS_CHANGED', 'TargetTextures_Update')
		end
	end

	if Private.isRetail then
		self:RegisterEvent('PLAYER_SPECIALIZATION_CHANGED', 'MythicVisibility_Update')
		self:RegisterEvent('PLAYER_DIFFICULTY_CHANGED', 'MythicVisibility_Update')
	end
end
