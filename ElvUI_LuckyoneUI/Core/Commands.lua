local L1UI, E, L, V, P, G = unpack(select(2, ...))

local _G = _G
local LoadAddOn = LoadAddOn

-- Weekly Rewards Frame chat commands
function L1UI:WeeklyRewards()

	LoadAddOn('Blizzard_WeeklyRewards')
	_G.WeeklyRewardsFrame:Show()
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

function L1UI:LoadCommands()

	if L1UI.Retail then
		self:RegisterChatCommand('weekly', 'WeeklyRewards')
		self:RegisterChatCommand('vault', 'WeeklyRewards')
	end

	self:RegisterChatCommand('luckyoneui', 'Toggles')
end
