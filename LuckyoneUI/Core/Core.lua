local Name, Private = ...
local L = Private.Libs.ACL
local LDB = Private.Libs.LDB
local LDBI = Private.Libs.LDBI
local Core = Private.Modules.Core

local format = string.format
local ipairs = ipairs
local next = next
local pairs = pairs
local print = print
local strfind = string.find
local strlower = string.lower
local tinsert = table.insert
local tonumber = tonumber
local type = type
local wipe = table.wipe

local C_UI_Reload = C_UI.Reload
local DisableAddOn = C_AddOns.DisableAddOn
local EnableAddOn = C_AddOns.EnableAddOn
local GetAddOnInfo = C_AddOns.GetAddOnInfo
local GetNumAddOns = C_AddOns.GetNumAddOns
local IsShiftKeyDown = IsShiftKeyDown
local LoadAddOn = C_AddOns.LoadAddOn
local SetCVar = C_CVar.SetCVar

local _G = _G
local LibStub = _G.LibStub

local Settings_OpenToCategory = _G.Settings.OpenToCategory
local StaticPopup_Show = _G.StaticPopup_Show

local ACCEPT = ACCEPT
local CANCEL = CANCEL
local OKAY = OKAY

-- Keep these enabled in debug mode
local AddOns = {
	ElvUI = true,
	ElvUI_Libraries = true,
	ElvUI_Options = true,
	LuckyoneUI = true
}

-- Chat print
function Private:Print(msg, installer)
	print(Private.Name .. ': ' .. msg)

	if installer then
		_G.LuckyoneInstallStepComplete:ShowMessage(msg)
	end
end

-- Gets the number from the profile string
-- If it matches the specified profile type (Main/Healing) or if no profile type is specified
local function GetNumber(str, profileType)
	return (not profileType or str:find(profileType, 1, true)) and tonumber(str:match('%d+%.?%d*')) or nil
end

local devProfiles = {
	Main = 'Luckyone Main',
	Healing = 'Luckyone Healing'
}

-- Find the profile with the highest number
-- Optionally filtering by the specified profile type
function Private:GetMostRecentProfile(profileType)
	if not Private.ElvUI then return end

	local profiles = ElvUI[1].data:GetProfiles()
	local mostRecentNumber, mostRecentProfile

	for _, profile in ipairs(profiles) do
		local number = GetNumber(profile, profileType)
		if number and (not mostRecentNumber or number > mostRecentNumber) then
			mostRecentNumber, mostRecentProfile = number, profile
		end
	end

	return mostRecentProfile or (profileType and devProfiles[profileType]) or nil
end

local activeProfiles = {
	{ 'Luckyone Main', 1 },
	{ 'Luckyone Healing', 2 },
	{ 'Luckyone Support', 3 },
}

function Private:GetActiveProfile()
	if not Private.ElvUI then return end

	local data = ElvUI[1].data:GetCurrentProfile()
	for i = 1, #activeProfiles do
		if strfind(data, activeProfiles[i][1], 1, true) then
			return activeProfiles[i][2]
		end
	end
end

-- Open settings helper
local function OpenSettings()
	if Private.ElvUI then
		ElvUI[1]:ToggleOptions('LuckyoneUI')
		ElvUI[1]:Config_UpdateSize(true)
	elseif Private.SettingsCategoryID then
		Settings_OpenToCategory(Private.SettingsCategoryID)
	end
end

-- Installer toggle helper
local function ToggleInstaller()
	if not Private.Installer then return end

	if Private.Installer:IsShown() then
		Private.Installer:Hide()
	else
		Private.Installer:Show(Private.InstallerData)
	end
end

-- Minimap icon
local LuckyoneLDB = LDB:NewDataObject(Name, {
	type = 'data source',
	text = Private.Name,
	icon = 'Interface\\AddOns\\LuckyoneUI\\Media\\Textures\\Compartment.png',
	OnClick = function(_, button)
		if button == 'LeftButton' then
			OpenSettings()
		elseif button == 'RightButton' then
			if IsShiftKeyDown() then
				LDBI:Hide(Name)
				Private.Addon.db.profile.minimap.hide = true
			else
				ToggleInstaller()
			end
		end
	end,
	OnTooltipShow = function(tooltip)
		tooltip:AddLine(Private.Name)
		tooltip:AddLine('\n')
		tooltip:AddLine(L["Minimap_Tooltip"])
	end,
})

-- Addon Compartment OnClick TOC func
function LuckyoneUI_OnAddonCompartmentClick()
	OpenSettings()
end

-- Reload popup
-- StaticPopup_Show('LUCKYONE_RL')
_G.StaticPopupDialogs['LUCKYONE_RL'] = {
	text = L["Reload required - continue?"],
	button1 = ACCEPT,
	button2 = CANCEL,
	OnAccept = C_UI_Reload,
	whileDead = 1,
	hideOnEscape = false,
}

-- ElvUI version check popup
-- StaticPopup_Show('LUCKYONE_VC')
_G.StaticPopupDialogs['LUCKYONE_VC'] = {
	text = format('|cffC80000%s|r', L["Your ElvUI is outdated - please update and reload."]),
	whileDead = 1,
	hideOnEscape = false,
}

-- Editbox popup
-- StaticPopup_Show('LUCKYONE_EDITBOX', text_arg1, text_arg2, data)
_G.StaticPopupDialogs['LUCKYONE_EDITBOX'] = {
	text = Private.Name,
	button1 = OKAY,
	hasEditBox = 1,
	OnShow = function(self, data)
		self.EditBox:SetAutoFocus(false)
		self.EditBox.width = self.EditBox:GetWidth()
		self.EditBox:SetWidth(280)
		self.EditBox:AddHistoryLine('text')
		self.EditBox.temptxt = data
		self.EditBox:SetText(data)
		self.EditBox:SetJustifyH('CENTER')
	end,
	OnHide = function(self)
		self.EditBox:SetWidth(self.EditBox.width or 50)
		self.EditBox.width = nil
		self.EditBox.temptxt = nil
	end,
	EditBoxOnEnterPressed = function(self)
		self:GetParent():Hide()
	end,
	EditBoxOnEscapePressed = function(self)
		self:GetParent():Hide()
	end,
	EditBoxOnTextChanged = function(self)
		if self:GetText() ~= self.temptxt then
			self:SetText(self.temptxt)
		end
		self:HighlightText()
	end,
	whileDead = 1,
	preferredIndex = 3,
	hideOnEscape = 1,
}

-- ElvUI version check
local function VersionCheck()
	if not Private.ElvUI then return end

	if ElvUI[1].version < Private.RequiredElvUI then
		StaticPopup_Show('LUCKYONE_VC')
		Private:Print(format('|cffbf0008%s|r', L["Your ElvUI is outdated - please update and reload."]))
	end
end

-- Scale helper
function Private:ApplyScale(native)
	SetCVar('useUiScale', 1)
	if native then
		SetCVar('uiScale', Private.UIScale1440)
		Private.Addon.db.global.scaled = false
		Private:Print(L["LuckyoneUI Scale"] .. ' 1440p')
	else
		SetCVar('uiScale', Private.UIScale1080)
		Private.Addon.db.global.scaled = true
		Private:Print(L["LuckyoneUI Scale"] .. ' 1080p')
	end
end

-- Weekly Rewards Frame chat commands
local function WeeklyRewards()
	LoadAddOn('Blizzard_WeeklyRewards')
	if _G.WeeklyRewardsFrame:IsShown() then
		_G.WeeklyRewardsFrame:Hide()
	else
		_G.WeeklyRewardsFrame:Show()
	end
end

-- LuckyoneUI chat commands
local function Toggles(msg)
	if msg == 'install' then
		ToggleInstaller()
	elseif msg == 'config' then
		OpenSettings()
	elseif msg == 'minimap' then
		local hide = not Private.Addon.db.profile.minimap.hide
		Private.Addon.db.profile.minimap.hide = hide
		if hide then
			LDBI:Hide(Name)
		else
			LDBI:Show(Name)
		end
	elseif msg == 'untrack' then
		Private:UntrackAllQuests()
	end
end

-- LuckyoneUI ElvUI debug mode
local function DebugMode(msg)
	local switch = strlower(msg)
	if switch == 'on' then
		for i = 1, GetNumAddOns() do
			local name = GetAddOnInfo(i)
			if not AddOns[name] and Private.IsAddOnLoaded(name) then
				DisableAddOn(name, Private.myName)
				Private.Addon.db.global.DebugDisabledAddOns[name] = true
			end
		end
		SetCVar('scriptErrors', 1)
		C_UI_Reload()
	elseif switch == 'off' then
		if next(Private.Addon.db.global.DebugDisabledAddOns) then
			for name in pairs(Private.Addon.db.global.DebugDisabledAddOns) do
				EnableAddOn(name, Private.myName)
			end
			wipe(Private.Addon.db.global.DebugDisabledAddOns)
			C_UI_Reload()
		end
	else
		Private:Print('/luckydebug on - /luckydebug off')
	end
end

-- Register all commands
local function LoadCommands()
	Private.Addon:RegisterChatCommand('lucky', Toggles)
	if Private.isRetail then -- Retail chat commands
		Private.Addon:RegisterChatCommand('vault', WeeklyRewards)
		Private.Addon:RegisterChatCommand('weekly', WeeklyRewards)
	end
	if Private.ElvUI then
		Private.Addon:RegisterChatCommand('luckydebug', DebugMode)
	end
end

-- ElvUI init
local function CheckElvUI()
	if not Private.ElvUI then return end

	local E = ElvUI[1]
	local EP = LibStub('LibElvUIPlugin-1.0')

	-- Skip the ElvUI installer
	if E.private.install_complete == nil then
		if E.InstallFrame and E.InstallFrame:IsShown() then
			E.InstallFrame:Hide()
		end
		E.private.install_complete = E.version
	end

	Private:BuildConfig()

	EP:RegisterPlugin(Name, Private.BuildConfig)
end

function Core:PLAYER_ENTERING_WORLD(_, initLogin, isReload)
	-- Only run the setup on login and reload, not on every loading screen
	if not (initLogin or isReload) then return end

	if initLogin or not Private.Addon.db.global.DebugDisabledAddOns then
		Private.Addon.db.global.DebugDisabledAddOns = {}
	end

	if Private.ElvUI then
		VersionCheck()
	end

	Private:HandleToons()

	if Private.itsLuckyone then
		Private.Addon.db.global.dev = true
	end

	if Private.Installer and (Private.Addon.db.global.install_version == nil) then
		Private.Installer:Show(Private.InstallerData)
	end
end

function Core:OnEnable()
	LDBI:Register(Name, LuckyoneLDB, Private.Addon.db.profile.minimap)
	LoadCommands()
	CheckElvUI()
	self:RegisterEvent('PLAYER_ENTERING_WORLD')
end
