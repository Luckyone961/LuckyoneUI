local Name, Private = ...
local E, L, V, P, G = unpack(ElvUI)

local C_UI_Reload = C_UI.Reload
local format = format

-- Set install version to current LuckyoneUI version
local function InstallComplete()
	E.global.L1UI.install_version = Private.Version
	C_UI_Reload()
end

-- Installer table
L1UI.InstallerData = {
	Title = format('|cff4beb2c%s %s|r', Private.Name, L["Installation"]),
	Name = Private.Name,
	tutorialImage = Private.Logo,
	Pages = {
		[1] = function()
			PluginInstallFrame.SubTitle:SetText(L["Welcome"])
			PluginInstallFrame.Desc1:SetText(L["The LuckyoneUI installer will guide you through some steps and apply the profiles of your choice."])
			PluginInstallFrame.Desc2:SetText(format('|cff4beb2c%s', L["Your existing profiles will not change. The installer will create a fresh profile."]))
			PluginInstallFrame.Desc3:SetText(L["Please read the steps carefully before clicking any buttons."])
			PluginInstallFrame.Option1:Show()
			PluginInstallFrame.Option1:SetScript('OnClick', InstallComplete)
			PluginInstallFrame.Option1:SetText(format('|cffC80000%s', L["Skip and close the installer"]))
		end,
		[2] = function()
			PluginInstallFrame.SubTitle:SetText(L["ElvUI Layouts"])
			PluginInstallFrame.Desc1:SetText(L["This step will configure the ElvUI layout of your choice."])
			PluginInstallFrame.Desc2:SetText(format('|cff4beb2c%s', L["Recommended step. Should not be skipped."]))
			PluginInstallFrame.Option1:Show()
			PluginInstallFrame.Option1:SetScript('OnClick', function() L1UI:Setup_Layout_Dragonflight('main') end)
			PluginInstallFrame.Option1:SetText(L["DPS & Tanks"])
			PluginInstallFrame.Option2:Show()
			PluginInstallFrame.Option2:SetScript('OnClick', function() L1UI:Setup_Layout_Dragonflight('healing') end)
			PluginInstallFrame.Option2:SetText(L["Healing"])
			PluginInstallFrame.Option3:Show()
			PluginInstallFrame.Option3:SetScript('OnClick', function() L1UI:Setup_Layout_Dragonflight('support') end)
			PluginInstallFrame.Option3:SetText(L["Support"])
		end,
		[3] = function()
			PluginInstallFrame.SubTitle:SetText(L["ElvUI Plugins"])
			PluginInstallFrame.Desc1:SetText(L["This step will configure profiles for other ElvUI plugins."])
			PluginInstallFrame.Desc2:SetText(format('|cff4beb2c%s', L["Recommended step. Should not be skipped."]))
			PluginInstallFrame.Option1:Show()
			PluginInstallFrame.Option1:SetScript('OnClick', function() L1UI:Setup_AddOnSkins() end)
			PluginInstallFrame.Option1:SetText('|cff16C3F2AddOn|r|cFFFFFFFFSkins|r')
			PluginInstallFrame.Option2:Show()
			PluginInstallFrame.Option2:SetScript('OnClick', function() L1UI:Setup_ProjectAzilroka() end)
			PluginInstallFrame.Option2:SetText('|cff16C3F2Project|r|cFFFFFFFFAzilroka|r')
			if E.Retail then
				PluginInstallFrame.Desc3:SetText(L["Option 1: "] .. '|cff5385edWindTools|r' .. ' ' .. '(' .. L["Disable the other 3 plugins"] .. ')')
				PluginInstallFrame.Desc4:SetText(L["Option 2: "] .. '|cff16C3F2AddOn|r|cFFFFFFFFSkins|r' .. ' + ' .. '|cff16C3F2Project|r|cFFFFFFFFAzilroka|r' .. ' + ' .. '|cff9482c9Shadow & Light|r')
				PluginInstallFrame.Option3:Show()
				PluginInstallFrame.Option3:SetScript('OnClick', function() L1UI:Setup_ShadowAndLight() end)
				PluginInstallFrame.Option3:SetText('|cff9482c9Shadow & Light|r')
				PluginInstallFrame.Option4:Show()
				PluginInstallFrame.Option4:SetScript('OnClick', function() L1UI:Setup_WindTools() end)
				PluginInstallFrame.Option4:SetText('|cff5385edWindTools|r')
			end
		end,
		[4] = function()
			PluginInstallFrame.SubTitle:SetText(L["Color Theme"])
			PluginInstallFrame.Desc1:SetText(L["Select your preferred UnitFrames color theme."])
			PluginInstallFrame.Desc2:SetText(format('|cff4beb2c%s', L["Optional step. Dark is applied by default."]))
			PluginInstallFrame.Option1:Show()
			PluginInstallFrame.Option1:SetScript('OnClick', function() L1UI:Setup_Theme('dark') end)
			PluginInstallFrame.Option1:SetText(L["Dark"])
			PluginInstallFrame.Option2:Show()
			PluginInstallFrame.Option2:SetScript('OnClick', function() L1UI:Setup_Theme('class') end)
			PluginInstallFrame.Option2:SetText(L["Class Color"])
		end,
		[5] = function()
			PluginInstallFrame.SubTitle:SetText(L["Chat"])
			PluginInstallFrame.Desc1:SetText(L["This step will configure your two chat panels."])
			PluginInstallFrame.Desc2:SetText(format('|cff4beb2c%s', L["Recommended step. Should not be skipped."]))
			PluginInstallFrame.Desc3:SetText(L["Left panel: General - Log - Whisper - Guild - Party."])
			PluginInstallFrame.Desc4:SetText(L["Right panel: Details! Damage Meter."])
			PluginInstallFrame.Option1:Show()
			PluginInstallFrame.Option1:SetScript('OnClick', function() L1UI:Setup_Chat() end)
			PluginInstallFrame.Option1:SetText(L["Setup Chat"])
		end,
		[6] = function()
			PluginInstallFrame.SubTitle:SetText(L["Console Variables"])
			PluginInstallFrame.Desc1:SetText(L["This step will configure some of Blizzards console variables."])
			PluginInstallFrame.Desc2:SetText(format('|cff4beb2c%s', L["Recommended step. Should not be skipped."]))
			PluginInstallFrame.Desc3:SetText(L["Examples: Max camera distance, screenshot quality and tutorials."])
			PluginInstallFrame.Desc4:SetText(L["The full list of configured CVars can be found in /luckyoneui config."])
			PluginInstallFrame.Option1:Show()
			PluginInstallFrame.Option1:SetScript('OnClick', function() L1UI:Setup_CVars() end)
			PluginInstallFrame.Option1:SetText(L["Setup CVars"])
		end,
		[7] = function()
			PluginInstallFrame.SubTitle:SetText(L["NamePlates"])
			PluginInstallFrame.Desc1:SetText(L["Choose between ElvUI NamePlates and Plater NamePlates."])
			PluginInstallFrame.Desc2:SetText(format('|cff4beb2c%s', L["Recommended step. Should not be skipped."]))
			PluginInstallFrame.Option1:Show()
			PluginInstallFrame.Option1:SetScript('OnClick', function() L1UI:Setup_NamePlates() end)
			PluginInstallFrame.Option1:SetText('ElvUI')
			PluginInstallFrame.Option2:Show()
			PluginInstallFrame.Option2:SetScript('OnClick', function() E:StaticPopup_Show('L1UI_EDITBOX', nil, nil, 'https://wago.io/LuckyoneUI-Plater') end)
			PluginInstallFrame.Option2:SetText('Plater')
		end,
		[8] = function()
			PluginInstallFrame.SubTitle:SetText(L["BossMods"])
			PluginInstallFrame.Desc1:SetText(L["Choose between DBM and BigWigs."])
			PluginInstallFrame.Desc2:SetText(format('|cff4beb2c%s', L["Recommended step. Should not be skipped."]))
			PluginInstallFrame.Option1:Show()
			PluginInstallFrame.Option1:SetScript('OnClick', function() L1UI:Setup_BigWigs('main') end)
			PluginInstallFrame.Option1:SetText('BigWigs')
			PluginInstallFrame.Option2:Show()
			PluginInstallFrame.Option2:SetScript('OnClick', function() L1UI:Setup_BigWigs('healing') end)
			PluginInstallFrame.Option2:SetText(L["BigWigs Healing"])
			PluginInstallFrame.Option3:Show()
			PluginInstallFrame.Option3:SetScript('OnClick', function() L1UI:Setup_DBM('main') end)
			PluginInstallFrame.Option3:SetText('DBM')
			PluginInstallFrame.Option4:Show()
			PluginInstallFrame.Option4:SetScript('OnClick', function() L1UI:Setup_DBM('healing') end)
			PluginInstallFrame.Option4:SetText(L["DBM Healing"])
		end,
		[9] = function()
			PluginInstallFrame.SubTitle:SetText(L["Details Profile"])
			PluginInstallFrame.Desc1:SetText(L["Please click the button below to apply Luckyones profile for Details! Damage Meter."])
			PluginInstallFrame.Desc2:SetText(format('|cff4beb2c%s', L["Recommended step. Should not be skipped."]))
			PluginInstallFrame.Option1:Show()
			PluginInstallFrame.Option1:SetScript('OnClick', function() L1UI:Setup_Details() end)
			PluginInstallFrame.Option1:SetText(L["Setup Details"])
		end,
		[E.Retail and 10] = function()
			PluginInstallFrame.SubTitle:SetText(L["OmniCD Profile"])
			PluginInstallFrame.Desc1:SetText(L["Please click the button below to apply Luckyones profile for OmniCD Party CDs."])
			PluginInstallFrame.Desc2:SetText(format('|cff4beb2c%s', L["Recommended step. Should not be skipped."]))
			PluginInstallFrame.Option1:Show()
			PluginInstallFrame.Option1:SetScript('OnClick', function() L1UI:Setup_OmniCD('main') end)
			PluginInstallFrame.Option1:SetText('OmniCD')
			PluginInstallFrame.Option2:Show()
			PluginInstallFrame.Option2:SetScript('OnClick', function() L1UI:Setup_OmniCD('healing') end)
			PluginInstallFrame.Option2:SetText(L["OmniCD Healing"])
		end,
		[E.Retail and 11] = function()
			PluginInstallFrame.SubTitle:SetText(L["WarpDeplete Profile"])
			PluginInstallFrame.Desc1:SetText(L["Please click the button below to apply Luckyones profile for WarpDeplete."])
			PluginInstallFrame.Desc2:SetText(format('|cff4beb2c%s', L["Recommended step. Should not be skipped."]))
			PluginInstallFrame.Option1:Show()
			PluginInstallFrame.Option1:SetScript('OnClick', function() L1UI:Setup_WarpDeplete() end)
			PluginInstallFrame.Option1:SetText(L["Setup WarpDeplete"])
		end,
		[E.Retail and 12 or 10] = function()
			PluginInstallFrame.SubTitle:SetText(L["Installation Complete"])
			PluginInstallFrame.Desc1:SetText(L["You have completed the installation process, please click 'Finished' to reload the UI."])
			PluginInstallFrame.Desc2:SetText(L["Feel free to join our community Discord for support and social chats."])
			PluginInstallFrame.Option1:Show()
			PluginInstallFrame.Option1:SetScript('OnClick', function() E:StaticPopup_Show('L1UI_EDITBOX', nil, nil, 'https://discord.gg/xRY4bwA') end)
			PluginInstallFrame.Option1:SetText('Discord')
			PluginInstallFrame.Option2:Show()
			PluginInstallFrame.Option2:SetScript('OnClick', InstallComplete)
			PluginInstallFrame.Option2:SetText(format('|cff4beb2c%s', L["Finished"]))
		end,
	},
	StepTitles = {
		[1] = L["Welcome"],
		[2] = L["ElvUI Layouts"],
		[3] = L["ElvUI Plugins"],
		[4] = L["Color Theme"],
		[5] = L["Chat"],
		[6] = L["Console Variables"],
		[7] = L["NamePlates"],
		[8] = L["BossMods"],
		[9] = 'Details',
		[E.Retail and 10] = 'OmniCD',
		[E.Retail and 11] = 'WarpDeplete',
		[E.Retail and 12 or 10] = L["Installation Complete"],
	},
	StepTitlesColor = { 1, 1, 1 },
	StepTitlesColorSelected = { 0, 179 / 255, 1 },
	StepTitleWidth = 200,
	StepTitleButtonWidth = 180,
	StepTitleTextJustification = 'CENTER',
}
