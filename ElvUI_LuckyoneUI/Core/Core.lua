-- Addon namespace
local Name, Private = ...
local L = Private.Libs.ACL
local LDB = Private.Libs.LDB
local LDBI = Private.Libs.LDBI

-- Lua functions
local format = format
local next = next
local pairs = pairs
local print = print
local strlower = string.lower
local tonumber = tonumber
local unpack = unpack
local wipe = table.wipe

-- API cache
local C_UI_Reload = C_UI.Reload
local DisableAddOn = C_AddOns.DisableAddOn
local EnableAddOn = C_AddOns.EnableAddOn
local GetAddOnInfo = C_AddOns.GetAddOnInfo
local GetAddOnMetadata = C_AddOns.GetAddOnMetadata
local GetNumAddOns = C_AddOns.GetNumAddOns
local IsShiftKeyDown = IsShiftKeyDown
local LoadAddOn = C_AddOns.LoadAddOn
local SetCVar = C_CVar.SetCVar

-- Global environment
local _G = _G

-- Blizzard functions
local Settings_OpenToCategory = _G.Settings.OpenToCategory
local StaticPopup_Show = _G.StaticPopup_Show

-- Global strings
local ACCEPT = ACCEPT
local CANCEL = CANCEL
local OKAY = OKAY

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

-- Minimap icon
local LuckyoneLDB = LDB:NewDataObject(Name, {
	type = 'data source',
	text = Private.Name,
	icon = 'Interface\\AddOns\\ElvUI_LuckyoneUI\\Media\\Textures\\Compartment.png',
	OnClick = function(_, button)
		if button == 'LeftButton' then
			if Private.ElvUI then
				ElvUI[1]:ToggleOptions()
				ElvUI[1].Libs.AceConfigDialog:SelectGroup('ElvUI', 'LuckyoneUI')
			else
				Settings_OpenToCategory('LuckyoneUI')
			end
		elseif button == 'RightButton' then
			if IsShiftKeyDown() then
				LDBI:Hide(Name)
				Private.Addon.db.profile.minimap.hide = true
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
	if Private.ElvUI then
		ElvUI[1]:ToggleOptions()
		ElvUI[1].Libs.AceConfigDialog:SelectGroup('ElvUI', 'LuckyoneUI')
	else
		Settings_OpenToCategory('LuckyoneUI')
	end
end

-- Reload popup
-- _G.StaticPopup_Show('LUCKYONE_RL')
_G.StaticPopupDialogs['LUCKYONE_RL'] = {
	text = L["Reload required - continue?"],
	button1 = ACCEPT,
	button2 = CANCEL,
	OnAccept = C_UI_Reload,
	whileDead = 1,
	hideOnEscape = false,
}

-- ElvUI version check popup
-- _G.StaticPopup_Show('LUCKYONE_VC')
_G.StaticPopupDialogs['LUCKYONE_VC'] = {
	text = format('|cffC80000%s|r', L["Your ElvUI is outdated - please update and reload."]),
	whileDead = 1,
	hideOnEscape = false,
}

-- Editbox popup
-- _G.StaticPopup_Show('LUCKYONE_EDITBOX', text_arg1, text_arg2, data)
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
		Private:Print(data)
	end,
	OnHide = function(self)
		self.EditBox:SetWidth(self.EditBox.width or 50)
		self.EditBox.width = nil
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
	end,
	whileDead = 1,
	preferredIndex = 3,
	hideOnEscape = 1,
}

-- ElvUI version check
function Private:VersionCheck()
	if not Private.ElvUI then return end
	if ElvUI[1].version < Private.RequiredElvUI then
		_G.StaticPopup_Show('LUCKYONE_VC')
		Private:Print(format('|cffbf0008%s|r', L["Your ElvUI is outdated - please update and reload."]))
	end
end

-- Weekly Rewards Frame chat commands
function Private.Addon:WeeklyRewards()
	LoadAddOn('Blizzard_WeeklyRewards')
	if _G.WeeklyRewardsFrame:IsShown() then
		_G.WeeklyRewardsFrame:Hide()
	else
		_G.WeeklyRewardsFrame:Show()
	end
end

-- LuckyoneUI chat commands
function Private.Addon:Toggles(msg)
	if msg == 'install' and Private.ElvUI then
		ElvUI[1]:GetModule('PluginInstaller'):Queue(Private.InstallerData)
	elseif msg == 'config' then
		if Private.ElvUI then
			ElvUI[1]:ToggleOptions()
			ElvUI[1].Libs.AceConfigDialog:SelectGroup('ElvUI', 'LuckyoneUI')
		else
			Settings_OpenToCategory('LuckyoneUI')
		end
	elseif msg == 'minimap' then
		if Private.Addon.db.profile.minimap.hide then
			LDBI:Show(Name)
			Private.Addon.db.profile.minimap.hide = false
		else
			LDBI:Hide(Name)
			Private.Addon.db.profile.minimap.hide = true
		end
	end
end

-- LuckyoneUI ElvUI debug mode
function Private.Addon:DebugMode(msg)
	local switch = strlower(msg)
	if switch == 'on' then
		for i = 1, GetNumAddOns() do
			local name = GetAddOnInfo(i)
			if not AddOns[name] and Private.IsAddOnLoaded(name) then
				DisableAddOn(name, Private.myName)
				Private.Addon.db.global.DebugDisabledAddOns[name] = i
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
function Private.Addon:LoadCommands()
	self:RegisterChatCommand('lucky', 'Toggles')
	if Private.isRetail then -- Retail chat commands
		self:RegisterChatCommand('vault', 'WeeklyRewards')
		self:RegisterChatCommand('weekly', 'WeeklyRewards')
	end
	if Private.ElvUI then
		self:RegisterChatCommand('luckydebug', 'DebugMode')
	end
end

-- ElvUI init
function Private:CheckElvUI()
	if not Private.ElvUI then return end

	local E = unpack(ElvUI)
	local EP = LibStub('LibElvUIPlugin-1.0')
	local PI = E:GetModule('PluginInstaller')

	-- Skip the ElvUI installer
	if E.private.install_complete == nil then
		E.private.install_complete = E.version
	end

	-- Skip the Shadow & Light installer
	if (Private.isRetail and E.private.sle) and E.private.sle.install_complete == nil then
		E.private.sle.install_complete = tonumber(GetAddOnMetadata('ElvUI_SLE', 'Version'))
	end

	-- Convert old db to avoid forced installer re-run
	if E.global.LuckyoneUI and E.global.LuckyoneUI.install_version ~= nil then
		Private.Addon.db.global.install_version = E.global.LuckyoneUI.install_version
		E.global.LuckyoneUI.install_version = nil
	end

	-- Queue the LuckyoneUI installer if needed
	if Private.Addon.db.global.install_version == nil then
		PI:Queue(Private.InstallerData)
	end

	EP:RegisterPlugin(Name, Private.BuildConfig)
end

-- Luckyone characters by GUID
function Private:HandleToons()
	local guid = Private.myGUID
	local toons = Private.isRetail and {
		-- (1598: LaughingSkull)
		['Player-1598-0F5E4639'] = true, -- [A] Druid
		['Player-1598-0F3E51B0'] = true, -- [A] Druid 2
		['Player-1598-0FBCD9A2'] = true, -- [A] DH
		['Player-1598-0F46FF5A'] = true, -- [H] Evoker
		['Player-1598-0F92E2B9'] = true, -- [H] Evoker 2
		['Player-1598-0BFF3341'] = true, -- [H] DH
		['Player-1598-0BD22704'] = true, -- [H] Priest
		['Player-1598-0BEFA545'] = true, -- [H] Monk
		['Player-1598-0E1A06DE'] = true, -- [H] Rogue
		['Player-1598-0BF2E377'] = true, -- [H] Hunter
		['Player-1598-0BF18248'] = true, -- [H] DK
		['Player-1598-0BFABB95'] = true, -- [H] Mage
		['Player-1598-0E67511D'] = true, -- [H] Paladin
		['Player-1598-0C0DD01B'] = true, -- [H] Warlock
		['Player-1598-0BF8013A'] = true, -- [H] Warrior
		['Player-1598-0BF56103'] = true, -- [H] Shaman
		['Player-1598-0F87B5AA'] = true, -- [A] Priest
	} or Private.isMists and {
		-- (4454: Garalon + Shek'zeer)
		['Player-4454-060E2FD9'] = true, -- [H] Mage
		['Player-4454-060E336E'] = true, -- [H] Hunter
		['Player-4454-060E339A'] = true, -- [H] Monk
		['Player-4454-060E4058'] = true, -- [A] Druid
		['Player-4454-060E4064'] = true, -- [A] Priest
		['Player-4454-060E406B'] = true, -- [A] Warlock
		['Player-4454-060E4071'] = true, -- [A] Shaman
		['Player-4454-060E4076'] = true, -- [A] Warrior
		['Player-4454-060E4089'] = true, -- [A] Rogue
		['Player-4454-060E4091'] = true, -- [A] Paladin
		['Player-4454-060E4086'] = true, -- [A] DK
		['Player-4454-060E45B6'] = true, -- [A] Mage
		['Player-4454-060E45EA'] = true, -- [A] Hunter
		-- (4440: Everlook)
		['Player-4440-037C7E29'] = true, -- [A] DK
		['Player-4454-060E3657'] = true, -- [H] Druid
		['Player-4454-060E364E'] = true, -- [H] Priest
		['Player-4454-060E361A'] = true, -- [H] Shaman
	} or Private.isClassic and {
		-- (6112: Spineshatter)
		['Player-6112-028A3A6D'] = true, -- [H] Hunter
		['Player-6112-02A2F754'] = true, -- [H] Priest
		['Player-6112-02A39E0E'] = true, -- [H] Warlock
		-- (5827: Living Flame)
		['Player-5827-0273D732'] = true, -- [A] Hunter
		['Player-5827-0273D63E'] = true, -- [A] Paladin
		['Player-5827-0273D63D'] = true, -- [A] Warlock
		['Player-5827-0273D649'] = true, -- [A] Mage
		['Player-5827-0273D661'] = true, -- [A] Priest
		['Player-5827-0273D65D'] = true, -- [A] Druid
		['Player-5827-0273D63F'] = true, -- [A] Rogue
		['Player-5827-0273D638'] = true, -- [A] Warrior
		['Player-5827-02331C4B'] = true, -- [H] Shaman
		-- (5261: Nek'Rosh)
		['Player-5261-01ADAC25'] = true, -- [H] Rogue
		['Player-5261-019F4B67'] = true, -- [H] Hunter
		['Player-5261-01B3C53A'] = true, -- [H] Mage
		['Player-5261-01B50AC4'] = true, -- [H] Druid
		-- (5233: Firemaw)
		['Player-5233-01D22A72'] = true, -- [H] Hunter
		['Player-5233-01D27011'] = true, -- [H] Druid
	}

	Private.itsLuckyone = toons[guid]
end

-- Events
function Private.Addon:PLAYER_ENTERING_WORLD(_, initLogin, isReload)
	if initLogin or not Private.Addon.db.global.DebugDisabledAddOns then
		Private.Addon.db.global.DebugDisabledAddOns = {}
	end

	if Private.ElvUI and (initLogin or isReload) then
		Private:VersionCheck()
	end

	Private:DisabledFrames()
	Private:EasyDelete()
	Private:HandleToons()
	Private:PrivacyOverlay()
	self:LoadCommands()

	if Private.itsLuckyone then
		Private.Addon.db.global.dev = true
	end
end

function Private.Addon:PLAYER_LOGIN()
	LDBI:Register(Name, LuckyoneLDB, Private.Addon.db.profile.minimap)
	Private:CheckElvUI()
end

-- Register events during addon initialization
function Private.Addon:RegisterEvents()
	self:RegisterEvent('PLAYER_ENTERING_WORLD')
	self:RegisterEvent('PLAYER_LOGIN')
end
