local Name, Private = ...
local L = Private.Libs.ACL
local LDB = Private.Libs.LDB
local LDBI = Private.Libs.LDBI
local Core = Private.Modules.Core

local format = string.format
local next = next
local pairs = pairs
local print = print
local strfind = string.find
local strlower = string.lower
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
local StaticPopupDialogs = _G.StaticPopupDialogs
local StaticPopup_Show = _G.StaticPopup_Show

local ACCEPT = ACCEPT
local CANCEL = CANCEL
local NO = NO
local OKAY = OKAY
local YES = YES

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

-- Layout profiles, the index doubles as the profile ID
local activeProfiles = {
	'Luckyone Main',
	'Luckyone Healing',
}

function Private:GetActiveProfile()
	if not Private.ElvUI then return end

	local data = ElvUI[1].data:GetCurrentProfile()
	for i = 1, #activeProfiles do
		if strfind(data, activeProfiles[i], 1, true) then
			return i
		end
	end
end

-- Open settings helper
local function OpenSettings()
	if Private.ElvUI then
		local E = ElvUI[1]
		E:ToggleOptions('LuckyoneUI')
		E:Config_UpdateSize(true)
	elseif Private.SettingsCategoryID then
		Settings_OpenToCategory(Private.SettingsCategoryID)
	end
end

-- Installer toggle helper
local function ToggleInstaller()
	local installer = Private.Installer
	if not installer then return end

	if installer:IsShown() then
		installer:Hide()
	else
		installer:Show(Private.InstallerData)
	end
end

-- Minimap icon toggle helper
local function SetMinimapHidden(hide)
	Private.Addon.db.profile.minimap.hide = hide

	if hide then
		LDBI:Hide(Name)
	else
		LDBI:Show(Name)
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
				SetMinimapHidden(true)
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
StaticPopupDialogs['LUCKYONE_RL'] = {
	text = L["Reload required - continue?"],
	button1 = ACCEPT,
	button2 = CANCEL,
	OnAccept = C_UI_Reload,
	whileDead = 1,
	hideOnEscape = false,
}

-- Alt setup popup
-- StaticPopup_Show('LUCKYONE_ALTS')
StaticPopupDialogs['LUCKYONE_ALTS'] = {
	text = format('%s\n\n%s', L["Alt Setup"], L["Load your existing profiles and setup your chat tabs?"]),
	button1 = YES, -- OnAccept
	button2 = L["Yes, no chat"], -- OnCancel
	button3 = NO, -- OnAlt
	OnAccept = function() Private:HandleAlts(true) end,
	OnCancel = function(_, _, reason)
		if reason == 'clicked' then
			Private:HandleAlts()
		end
	end,
	whileDead = 1,
	hideOnEscape = false,
}

-- ElvUI version check popup
-- StaticPopup_Show('LUCKYONE_VC')
StaticPopupDialogs['LUCKYONE_VC'] = {
	text = format('|cffC80000%s|r', L["Your ElvUI is outdated - please update and reload."]),
	whileDead = 1,
	hideOnEscape = false,
}

-- Editbox popup
-- StaticPopup_Show('LUCKYONE_EDITBOX', text_arg1, text_arg2, data)
local function CloseEditBox(self)
	self:GetParent():Hide()
end

StaticPopupDialogs['LUCKYONE_EDITBOX'] = {
	text = Private.Name,
	button1 = OKAY,
	hasEditBox = 1,
	OnShow = function(self, data)
		local editBox = self.EditBox
		editBox:SetAutoFocus(false)
		editBox.width = editBox:GetWidth()
		editBox:SetWidth(280)
		editBox:AddHistoryLine('text')
		editBox.temptxt = data
		editBox:SetText(data)
		editBox:SetJustifyH('CENTER')
	end,
	OnHide = function(self)
		local editBox = self.EditBox
		editBox:SetWidth(editBox.width or 50)
		editBox.width = nil
		editBox.temptxt = nil
	end,
	EditBoxOnEnterPressed = CloseEditBox,
	EditBoxOnEscapePressed = CloseEditBox,
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
	SetCVar('uiScale', native and Private.UIScale1440 or Private.UIScale1080)
	Private.Addon.db.global.scaled = not native
	Private:Print(L["LuckyoneUI Scale"] .. (native and ' 1440p' or ' 1080p'))
end

-- Weekly Rewards Frame chat commands
local function WeeklyRewards()
	LoadAddOn('Blizzard_WeeklyRewards')

	local frame = _G.WeeklyRewardsFrame
	if not frame then return end

	if frame:IsShown() then
		frame:Hide()
	else
		frame:Show()
	end
end

-- LuckyoneUI chat commands
local commands = {
	install = ToggleInstaller,
	config = OpenSettings,
	minimap = function() SetMinimapHidden(not Private.Addon.db.profile.minimap.hide) end,
	untrack = function() Private:UntrackAllQuests() end,
}

local function Toggles(msg)
	local command = commands[strlower(msg)]
	if command then
		command()
	end
end

-- LuckyoneUI ElvUI debug mode
local function DebugMode(msg)
	local switch = strlower(msg)
	local disabled = Private.Addon.db.global.DebugDisabledAddOns

	if switch == 'on' then
		for i = 1, GetNumAddOns() do
			local name = GetAddOnInfo(i)
			if not AddOns[name] and Private.IsAddOnLoaded(name) then
				DisableAddOn(name, Private.myName)
				disabled[name] = true
			end
		end
		SetCVar('scriptErrors', 1)
		C_UI_Reload()
	elseif switch == 'off' then
		if next(disabled) then
			for name in pairs(disabled) do
				EnableAddOn(name, Private.myName)
			end
			wipe(disabled)
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

	-- Skip the ElvUI installer
	if E.private.install_complete == nil then
		if E.InstallFrame and E.InstallFrame:IsShown() then
			E.InstallFrame:Hide()
		end
		E.private.install_complete = E.version
	end

	Private:BuildConfig()

	LibStub('LibElvUIPlugin-1.0'):RegisterPlugin(Name, Private.BuildConfig)
end

function Core:PLAYER_ENTERING_WORLD(_, initLogin, isReload)
	-- Only run the setup on login and reload, not on every loading screen
	if not (initLogin or isReload) then return end

	-- Neither flag can be set again this session, so stop listening
	self:UnregisterEvent('PLAYER_ENTERING_WORLD')

	-- Debug mode only has to survive a reload
	if initLogin then
		wipe(Private.Addon.db.global.DebugDisabledAddOns)
	end

	VersionCheck()
	Private:HandleToons()

	if Private.itsLuckyone then
		Private.Addon.db.global.dev = true
	end
end

function Core:OnEnable()
	LDBI:Register(Name, LuckyoneLDB, Private.Addon.db.profile.minimap)
	LoadCommands()
	CheckElvUI()
	self:RegisterEvent('PLAYER_ENTERING_WORLD')
end
