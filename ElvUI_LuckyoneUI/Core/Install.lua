local L1UI, E, L, V, P, G = unpack(select(2, ...))

local ReloadUI = ReloadUI
local format = string.format

-- Set version & reload on "Skip" and "Finished"
local function InstallComplete()
	E.private.L1UI.install_version = L1UI.Version
	ReloadUI()
end

-- Installer Steps
L1UI.InstallerData = {
	Title = format('|cff4beb2c%s %s|r', L1UI.Name, 'Installation'),
	Name = L1UI.Name,
	tutorialImage = 'Interface\\AddOns\\ElvUI_LuckyoneUI\\Media\\Textures\\Clover.tga',
	Pages = {
		[1] = function()
			PluginInstallFrame.SubTitle:SetFormattedText('Welcome')
			PluginInstallFrame.Desc1:SetText('This installation process will guide you through a few steps and apply settings to your current ElvUI profile.')
			PluginInstallFrame.Desc2:SetText('Note: |cff4beb2cMake sure you have a backup of your current profile|r')
			PluginInstallFrame.Option1:Show()
			PluginInstallFrame.Option1:SetScript('OnClick', InstallComplete)
			PluginInstallFrame.Option1:SetText('Skip Process')
		end,
		[2] = function()
			PluginInstallFrame.SubTitle:SetText('Layouts')
			PluginInstallFrame.Desc1:SetText('Please click a button below to apply the layout of your choosing.')
			PluginInstallFrame.Desc2:SetText('Importance: |cff4beb2cHigh|r')
			PluginInstallFrame.Option1:Show()
			PluginInstallFrame.Option1:SetScript('OnClick', function() L1UI:SetupLayout('dps') end)
			PluginInstallFrame.Option1:SetText('DPS/Tank')
			PluginInstallFrame.Option2:Show()
			PluginInstallFrame.Option2:SetScript('OnClick', function() L1UI:SetupLayout('healer') end)
			PluginInstallFrame.Option2:SetText('Healing')
		end,
		[3] = function()
			PluginInstallFrame.SubTitle:SetText('UnitFrames Color Theme')
			PluginInstallFrame.Desc1:SetText('Please click a button below to set the UnitFrames Color Theme.\n\nFeel free to skip this step if you like default color theme.')
			PluginInstallFrame.Desc2:SetText('Importance: |cff4beb2cOptional|r')
			PluginInstallFrame.Option1:Show()
			PluginInstallFrame.Option1:SetScript('OnClick', function() L1UI:SetupTheme('dark') end)
			PluginInstallFrame.Option1:SetText('Dark')
			PluginInstallFrame.Option2:Show()
			PluginInstallFrame.Option2:SetScript('OnClick', function() L1UI:SetupTheme('class') end)
			PluginInstallFrame.Option2:SetText('Class')
		end,
		[4] = function()
			PluginInstallFrame.SubTitle:SetFormattedText('NamePlates')
			PluginInstallFrame.Desc1:SetText('Please click the button below to apply Luckyones NamePlate Style Filters.')
			PluginInstallFrame.Desc2:SetText('Importance: |cff4beb2cOptional|r')
			PluginInstallFrame.Option1:Show()
			PluginInstallFrame.Option1:SetScript('OnClick', function() L1UI:SetupNamePlates() end)
			PluginInstallFrame.Option1:SetText('Setup NamePlates')
		end,
		[5] = function()
			PluginInstallFrame.SubTitle:SetFormattedText('Chat')
			PluginInstallFrame.Desc1:SetText('This will setup the chat windows to look like this:\n\nLeft Chat: General - Log - Whisper - Guild - Party\n\nRight Chat: Details! Damage Meter')
			PluginInstallFrame.Desc2:SetText('Importance: |cff4beb2cOptional|r')
			PluginInstallFrame.Option1:Show()
			PluginInstallFrame.Option1:SetScript('OnClick', function() L1UI:SetupChat() end)
			PluginInstallFrame.Option1:SetText('Setup Chat')
		end,
		[6] = function()
			PluginInstallFrame.SubTitle:SetFormattedText('CVars')
			PluginInstallFrame.Desc1:SetText('This will apply the following CVar values:\n\ncameraDistanceMaxZoomFactor 2.6\nadvancedCombatLogging 1\nSpellQueueWindow 50\nrawMouseEnable 1\nffxDeath 0')
			PluginInstallFrame.Desc2:SetText('Importance: |cff4beb2cOptional|r')
			PluginInstallFrame.Option1:Show()
			PluginInstallFrame.Option1:SetScript('OnClick', function() L1UI:SetupCVars() end)
			PluginInstallFrame.Option1:SetText('Setup CVars')
		end,
		[7] = function()
			PluginInstallFrame.SubTitle:SetFormattedText('BigWigs Profile')
			PluginInstallFrame.Desc1:SetText('Please click the button below to apply Luckyones profile for BigWigs.')
			PluginInstallFrame.Desc2:SetText('Importance: |cff4beb2cOptional|r')
			PluginInstallFrame.Option1:Show()
			PluginInstallFrame.Option1:SetScript('OnClick', function() L1UI:AddonSetupBW() end)
			PluginInstallFrame.Option1:SetText('Setup BigWigs')
		end,
		[8] = function()
			PluginInstallFrame.SubTitle:SetFormattedText('Details Profile')
			PluginInstallFrame.Desc1:SetText('Please click the button below to apply Luckyones profile for Details! Damage Meter.')
			PluginInstallFrame.Desc2:SetText('Importance: |cff4beb2cOptional|r')
			PluginInstallFrame.Option1:Show()
			PluginInstallFrame.Option1:SetScript('OnClick', function() L1UI:AddonSetupDT() end)
			PluginInstallFrame.Option1:SetText('Setup Details')
		end,
		[9] = function()
			PluginInstallFrame.SubTitle:SetFormattedText('OmniCD Profile')
			PluginInstallFrame.Desc1:SetText('Please click the button below to apply Luckyones profile for OmniCD Party CDs.')
			PluginInstallFrame.Desc2:SetText('Importance: |cff4beb2cOptional|r')
			PluginInstallFrame.Option1:Show()
			PluginInstallFrame.Option1:SetScript('OnClick', function() L1UI:AddonSetupOCD() end)
			PluginInstallFrame.Option1:SetText('Setup OmniCD')
		end,
		[10] = function()
			PluginInstallFrame.SubTitle:SetText('Installation Complete')
			PluginInstallFrame.Desc1:SetText('You have completed the installation process, please click "Finished" to reload the UI.')
			PluginInstallFrame.Desc2:SetText('Importance: |cff4beb2cHigh|r')
			PluginInstallFrame.Option1:Show()
			PluginInstallFrame.Option1:SetScript('OnClick', InstallComplete)
			PluginInstallFrame.Option1:SetText('Finished')
		end,
	},
	StepTitles = {
		[1] = 'Welcome',
		[2] = 'Layouts',
		[3] = 'Theme',
		[4] = 'NamePlates',
		[5] = 'Chat',
		[6] = 'CVars',
		[7] = 'BigWigs',
		[8] = 'Details',
		[9] = 'OmniCD',
		[10] = 'Installation Complete',
	},
	StepTitlesColor = {1, 1, 1},
	StepTitlesColorSelected = {0, 179/255, 1},
	StepTitleWidth = 200,
	StepTitleButtonWidth = 180,
	StepTitleTextJustification = 'CENTER',
}
