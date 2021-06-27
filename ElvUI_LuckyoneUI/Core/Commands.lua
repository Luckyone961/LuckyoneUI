local L1UI, E, L, V, P, G = unpack(select(2, ...))

local _G = _G
local LoadAddOn = LoadAddOn

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
function L1UI:Toggles(message)

	if message == 'install' then

		E.PluginInstaller:Queue(L1UI.InstallerData)

	elseif message == 'config' then

		E:ToggleOptionsUI()
		E.Libs.AceConfigDialog:SelectGroup('ElvUI', 'L1UI')

	end
end

-- RegisterChatCommand requires AceConsole-3.0
-- Left slash command Right function or funcref
function L1UI:LoadCommands()

	self:RegisterChatCommand('luckyoneui', 'Toggles')

	if L1UI.Retail then
		self:RegisterChatCommand('weekly', 'WeeklyRewards')
		self:RegisterChatCommand('vault', 'WeeklyRewards')
	end
end
