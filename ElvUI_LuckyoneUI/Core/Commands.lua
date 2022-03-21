local L1UI, E, L, V, P, G = unpack(select(2, ...))

local next, pairs, strlower, wipe = next, pairs, strlower, wipe

local _G = _G
local DisableAddOn, EnableAddOn = DisableAddOn, EnableAddOn
local GetAddOnInfo, GetNumAddOns = GetAddOnInfo, GetNumAddOns
local LoadAddOn = LoadAddOn
local ReloadUI = ReloadUI
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

		E.PluginInstaller:Queue(L1UI.InstallerData)

	elseif msg == 'config' then

		E:ToggleOptionsUI()
		E.Libs.AceConfigDialog:SelectGroup('ElvUI', 'L1UI')

	end
end

-- LuckyoneUI debug mode
-- Disables all AddOns except ElvUI, ElvUI OptionsUI and ElvUI LuckyoneUI
-- ref: ElvUI\Core\General\Commands
function L1UI:DebugMode(msg)

	local switch = strlower(msg)

	if switch == 'on' then

		for i = 1, GetNumAddOns() do
			local name = GetAddOnInfo(i)
			if name ~= 'ElvUI' and name ~= 'ElvUI_OptionsUI' and name ~= 'ElvUI_LuckyoneUI' and E:IsAddOnEnabled(name) then
				DisableAddOn(name, E.myname)
				ElvDB.LuckyoneDisabledAddOns[name] = i
			end
		end

		SetCVar('scriptErrors', 1)
		ReloadUI()

	elseif switch == 'off' then

		if next(ElvDB.LuckyoneDisabledAddOns) then
			for name in pairs(ElvDB.LuckyoneDisabledAddOns) do
				EnableAddOn(name, E.myname)
			end

			wipe(ElvDB.LuckyoneDisabledAddOns)
			ReloadUI()
		end

	else
		L1UI:Print('/luckydebug on - /luckydebug off')
	end
end

-- RegisterChatCommand requires AceConsole-3.0
-- Left slash command right function or funcref
function L1UI:LoadCommands()

	self:RegisterChatCommand('luckyoneui', 'Toggles')
	self:RegisterChatCommand('luckydebug', 'DebugMode')

	if E.Retail then
		self:RegisterChatCommand('weekly', 'WeeklyRewards')
		self:RegisterChatCommand('vault', 'WeeklyRewards')
	end
end
