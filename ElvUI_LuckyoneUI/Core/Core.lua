-- Lua functions
local format = format
local ipairs = ipairs
local next = next
local pairs = pairs
local print = print
local strfind = string.find
local strlower = string.lower
local strmatch = string.match
local tonumber = tonumber
local unpack = unpack
local wipe = table.wipe

-- API cache
local C_UI_Reload = C_UI.Reload
local DisableAddOn = C_AddOns.DisableAddOn
local EnableAddOn = C_AddOns.EnableAddOn
local GetAddOnInfo = C_AddOns.GetAddOnInfo
local GetNumAddOns = C_AddOns.GetNumAddOns
local LoadAddOn = C_AddOns.LoadAddOn
local SetCVar = C_CVar.SetCVar

-- Global environment
local _G = _G

-- Global strings
local ACCEPT = ACCEPT
local CANCEL = CANCEL

-- AddOn namespace
local _, Private = ...

-- ElvUI modules
local E, L = unpack(ElvUI)
local PI = E:GetModule('PluginInstaller')

-- Keep these enabled in debug mode
local AddOns = {
	ElvUI = true,
	ElvUI_Libraries = true,
	ElvUI_LuckyoneUI = true,
	ElvUI_Options = true
}

-- Chat print
function Private:Print(msg)
	print(Private.Name .. ': ' .. msg)
end

-- Gets the number from the profile string
-- If it matches the specified profile type (Main/Healing/Support) or if no profile type is specified
local function GetNumber(str, profileType)
	if profileType and not str:find(profileType, 1, true) then
		return nil
	end

	local number = str:match('%d+%.?%d*')
	return number and tonumber(number) or nil
end

-- Find the profile with the highest number
-- Optionally filtering by the specified profile type
function Private:GetMostRecentProfile(profileType)
	local profiles = E.data:GetProfiles()
	local mostRecentNumber, mostRecentProfile
	local devProfiles = {
		Main = 'Luckyone Main',
		Healing = 'Luckyone Healing',
		Support = 'Luckyone Support'
	}

	for _, profile in ipairs(profiles) do
		local number = GetNumber(profile, profileType)
		if number and (not mostRecentNumber or number > mostRecentNumber) then
			mostRecentNumber, mostRecentProfile = number, profile
		end
	end

	return mostRecentProfile or (profileType and devProfiles[profileType]) or nil
end

-- Reload popup
E.PopupDialogs.L1UI_RL = {
	text = L["Reload required - continue?"],
	button1 = ACCEPT,
	button2 = CANCEL,
	OnAccept = C_UI_Reload,
	whileDead = 1,
	hideOnEscape = false,
}

-- Version check popup
E.PopupDialogs.L1UI_VC = {
	text = format('|cffC80000%s|r', L["Your ElvUI is outdated - please update and reload."]),
	whileDead = 1,
	hideOnEscape = false,
}

-- Editbox popup from ElvUI\Core\General\StaticPopups.lua
-- Slightly modified for title text and additional chat print
E.PopupDialogs.L1UI_EDITBOX = {
	text = Private.Name,
	button1 = OKAY,
	hasEditBox = 1,
	OnShow = function(self, data)
		self.editBox:SetAutoFocus(true)
		self.editBox.width = self.editBox:GetWidth()
		self.editBox:Width(280)
		self.editBox:AddHistoryLine('text')
		self.editBox.temptxt = data
		self.editBox:SetText(data)
		self.editBox:HighlightText()
		self.editBox:SetJustifyH('CENTER')
		Private:Print(data)
	end,
	OnHide = function(self)
		self.editBox:Width(self.editBox.width or 50)
		self.editBox.width = nil
		self.temptxt = nil
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
		self:ClearFocus()
	end,
	OnAccept = E.noop,
	whileDead = 1,
	preferredIndex = 3,
	hideOnEscape = 1,
}

-- Version check
function Private:VersionCheck()
	if E.version < Private.RequiredElvUI then
		E:StaticPopup_Show('L1UI_VC')
		Private:Print(format('|cffbf0008%s|r', L["Your ElvUI is outdated - please update and reload."]))
	end
end

-- Addon Compartment OnClick TOC func
function L1UI_OnAddonCompartmentClick()
	E:ToggleOptions()
	E.Libs.AceConfigDialog:SelectGroup('ElvUI', 'L1UI')
end

-- Weekly Rewards Frame chat commands
function L1UI:WeeklyRewards()
	LoadAddOn('Blizzard_WeeklyRewards')
	if _G.WeeklyRewardsFrame:IsShown() then
		_G.WeeklyRewardsFrame:Hide()
	else
		_G.WeeklyRewardsFrame:Show()
	end
end

-- LuckyoneUI chat commands
function L1UI:Toggles(msg)
	if msg == 'install' then
		PI:Queue(L1UI.InstallerData)
	elseif msg == 'config' then
		E:ToggleOptions()
		E.Libs.AceConfigDialog:SelectGroup('ElvUI', 'L1UI')
	end
end

-- LuckyoneUI debug mode
function L1UI:DebugMode(msg)
	local switch = strlower(msg)
	if switch == 'on' then
		for i = 1, GetNumAddOns() do
			local name = GetAddOnInfo(i)
			if not AddOns[name] and E:IsAddOnEnabled(name) then
				DisableAddOn(name, E.myname)
				ElvDB.LuckyoneDisabledAddOns[name] = i
			end
		end
		SetCVar('scriptErrors', 1)
		C_UI_Reload()
	elseif switch == 'off' then
		if next(ElvDB.LuckyoneDisabledAddOns) then
			for name in pairs(ElvDB.LuckyoneDisabledAddOns) do
				EnableAddOn(name, E.myname)
			end
			wipe(ElvDB.LuckyoneDisabledAddOns)
			C_UI_Reload()
		end
	else
		Private:Print('/luckydebug on - /luckydebug off')
	end
end

-- Register all commands
function L1UI:LoadCommands()
	self:RegisterChatCommand('luckydebug', 'DebugMode')
	self:RegisterChatCommand('lucky', 'Toggles')
	if E.Retail then -- Retail chat commands
		self:RegisterChatCommand('vault', 'WeeklyRewards')
		self:RegisterChatCommand('weekly', 'WeeklyRewards')
	end
end

-- Events
function L1UI:PLAYER_ENTERING_WORLD(_, initLogin, isReload)
	if initLogin or not ElvDB.LuckyoneDisabledAddOns then
		ElvDB.LuckyoneDisabledAddOns = {}
	end

	if initLogin or isReload then
		Private:VersionCheck()
	end

	Private:DisabledFrames()
	Private:EasyDelete()
	L1UI:LoadCommands()
end

-- Register events
function L1UI:RegisterEvents()
	L1UI:RegisterEvent('PLAYER_ENTERING_WORLD')
end
