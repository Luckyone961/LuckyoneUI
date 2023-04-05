local Name, Private = ...
local E, L, V, P, G = unpack(ElvUI)
local PI = E:GetModule('PluginInstaller')

local next, pairs, strlower, wipe = next, pairs, strlower, wipe

local _G = _G
local C_UI_Reload = C_UI.Reload
local DisableAddOn, EnableAddOn = DisableAddOn, EnableAddOn
local GetAddOnInfo, GetNumAddOns = GetAddOnInfo, GetNumAddOns
local LoadAddOn = LoadAddOn
local SetCVar = SetCVar

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

local AddOns = {
	ElvUI = true,
	ElvUI_Libraries = true,
	ElvUI_LuckyoneUI = true,
	ElvUI_Options = true,
}

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

-- LuckyoneUI developer switch
function L1UI:Dev(msg)
	if msg == 'on' then
		E.global.L1UI.dev = true
		Private:Print('Developer mode enabled.')
		E:StaticPopup_Show('L1UI_RL')
	elseif msg == 'off' then
		E.global.L1UI.dev = false
		Private:Print('Developer mode disabled.')
		E:StaticPopup_Show('L1UI_RL')
	end
end

-- Register all commands
function L1UI:LoadCommands()
	self:RegisterChatCommand('luckydebug', 'DebugMode')
	self:RegisterChatCommand('luckydev', 'Dev')
	self:RegisterChatCommand('luckyoneui', 'Toggles')
	if E.Retail then -- Retail chat commands
		self:RegisterChatCommand('vault', 'WeeklyRewards')
		self:RegisterChatCommand('weekly', 'WeeklyRewards')
	end
end
