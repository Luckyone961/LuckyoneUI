local _, Private = ...
local E, L = unpack(ElvUI)

local format = format

local _G = _G
local C_UI_Reload = C_UI.Reload
local CreateFrame = CreateFrame
local PlaySound = PlaySound

-- Set install version to current LuckyoneUI version
local function InstallComplete()
	E.global.L1UI.install_version = Private.Version
	C_UI_Reload()
end

-- Create step complete frame
local function InstallStepComplete()

	local Container = CreateFrame('Frame', 'LuckyoneInstallStepComplete', E.UIParent)
	Container:Size(400, 60)
	Container:Point('TOP', 0, -200)
	Container:Hide()

	Container:SetScript('OnShow', function(frame)
		if frame.message then
			PlaySound(888) -- 'Level Up'-Sound
			frame.text:SetText(format('%s: %s', Private.Name, frame.message))
			E:Delay(3, frame.Hide, frame)
			frame.message = nil
		else
			frame:Hide()
		end
	end)

	Container.firstShow = false

	Container.bg = Container:CreateTexture(nil, 'BACKGROUND')
	Container.bg:Point('CENTER')
	Container.bg:Size(400, 60)

	Container.text = Container:CreateFontString(nil, 'ARTWORK', 'ElvUIFontNormal')
	Container.text:Point('CENTER', 0, 2)
	Container.text:SetTextColor(1, 1, 1)
	Container.text:SetJustifyH('CENTER')
end

-- Initialize step complete frame
InstallStepComplete()
_G.LuckyoneInstallStepComplete:SetTemplate('Transparent')

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
			PluginInstallFrame.SubTitle:SetText(L["Quick setup for alts"])
			PluginInstallFrame.Desc1:SetText(L["This step will load your most recent LuckyoneUI profile."])
			PluginInstallFrame.Desc2:SetText(L["Useful for a quick setup on your alts."])
			PluginInstallFrame.Desc3:SetText(format('|cff4beb2c%s', L["Optional step. Skip if you plan on a fresh install."]))
			PluginInstallFrame.Option1:Show()
			PluginInstallFrame.Option1:SetScript('OnClick', function() Private:HandleAlts('Main') end)
			PluginInstallFrame.Option1:SetText(L["Alt: "] .. L["DPS & Tanks"])
			PluginInstallFrame.Option2:Show()
			PluginInstallFrame.Option2:SetScript('OnClick', function() Private:HandleAlts('Healing') end)
			PluginInstallFrame.Option2:SetText(L["Alt: "] .. L["Healing"])
			PluginInstallFrame.Option3:Show()
			PluginInstallFrame.Option3:SetScript('OnClick', function() Private:HandleAlts('Support') end)
			PluginInstallFrame.Option3:SetText(L["Alt: "] .. format('|cff33937F%s', L["Augmentation"]))
		end,
		[3] = function()
			PluginInstallFrame.SubTitle:SetText(L["Layout Scale"])
			PluginInstallFrame.Desc1:SetText(L["1440p = Default | 1080p = Downscaled"] .. '.')
			PluginInstallFrame.Desc2:SetText(format('|cff4beb2c%s', L["Recommended step. Should not be skipped."]))
			PluginInstallFrame.Option1:Show()
			PluginInstallFrame.Option1:SetScript('OnClick', function() E.global.L1UI.scaled = false Private:Print(L["Layout Scale"] .. ' 1440p') end)
			PluginInstallFrame.Option1:SetText('1440p')
			PluginInstallFrame.Option2:Show()
			PluginInstallFrame.Option2:SetScript('OnClick', function() E.global.L1UI.scaled = true Private:Print(L["Layout Scale"] .. ' 1080p') end)
			PluginInstallFrame.Option2:SetText('1080p')
		end,
		[4] = function()
			PluginInstallFrame.SubTitle:SetText(L["ElvUI Layouts"])
			PluginInstallFrame.Desc1:SetText(L["This step will configure the ElvUI layout of your choice."])
			PluginInstallFrame.Desc2:SetText(format('|cff4beb2c%s', L["Recommended step. Should not be skipped."]))
			PluginInstallFrame.Desc3:SetText(format('|cff33937F%s|r', L["Augmentation"]) .. ': ' .. L["No ActionBars and centered Raid Frames"] .. '.')
			PluginInstallFrame.Option1:Show()
			PluginInstallFrame.Option1:SetScript('OnClick', function() Private:Setup_Layout_TheWarWithin('main', true) end)
			PluginInstallFrame.Option1:SetText(L["DPS & Tanks"])
			PluginInstallFrame.Option2:Show()
			PluginInstallFrame.Option2:SetScript('OnClick', function() Private:Setup_Layout_TheWarWithin('healing', true) end)
			PluginInstallFrame.Option2:SetText(L["Healing"])
			PluginInstallFrame.Option3:Show()
			PluginInstallFrame.Option3:SetScript('OnClick', function() Private:Setup_Layout_TheWarWithin('support', true) end)
			PluginInstallFrame.Option3:SetText(format('|cff33937F%s', L["Augmentation"]))
		end,
		[E.Retail and 5] = function()
			PluginInstallFrame.SubTitle:SetText(L["ElvUI Plugins"])
			PluginInstallFrame.Desc1:SetText(L["This step will configure profiles for other ElvUI plugins."])
			PluginInstallFrame.Desc2:SetText(format('|cff4beb2c%s', L["Recommended step. Should not be skipped."]))
			PluginInstallFrame.Option1:Show()
			PluginInstallFrame.Option1:SetScript('OnClick', function() Private:Setup_WindTools(true) end)
			PluginInstallFrame.Option1:SetText('|cff5385edWindTools|r')
			PluginInstallFrame.Option2:Show()
			PluginInstallFrame.Option2:SetScript('OnClick', function() Private:Setup_ShadowAndLight(true) end)
			PluginInstallFrame.Option2:SetText('|cff9482c9Shadow & Light|r')
		end,
		[E.Retail and 6 or 5] = function()
			PluginInstallFrame.SubTitle:SetText(L["Color Theme"])
			PluginInstallFrame.Desc1:SetText(L["Select your preferred UnitFrames color theme."])
			PluginInstallFrame.Desc2:SetText(format('|cff4beb2c%s', L["Optional step. Dark is applied by default."]))
			PluginInstallFrame.Option1:Show()
			PluginInstallFrame.Option1:SetScript('OnClick', function() Private:Setup_Theme('dark', true) end)
			PluginInstallFrame.Option1:SetText(L["Dark"])
			PluginInstallFrame.Option2:Show()
			PluginInstallFrame.Option2:SetScript('OnClick', function() Private:Setup_Theme('class', true) end)
			PluginInstallFrame.Option2:SetText(L["Class Color"])
		end,
		[E.Retail and 7 or 6] = function()
			PluginInstallFrame.SubTitle:SetText(L["Chat"])
			PluginInstallFrame.Desc1:SetText(L["This step will configure your two chat panels."])
			PluginInstallFrame.Desc2:SetText(format('|cff4beb2c%s', L["Recommended step. Should not be skipped."]))
			PluginInstallFrame.Desc3:SetText(L["Left panel: General - Log - Whisper - Guild - Party."])
			PluginInstallFrame.Desc4:SetText(L["Right panel: Details! Damage Meter."])
			PluginInstallFrame.Option1:Show()
			PluginInstallFrame.Option1:SetScript('OnClick', function() Private:Setup_Chat(true) end)
			PluginInstallFrame.Option1:SetText(L["Setup Chat"])
		end,
		[E.Retail and 8 or 7] = function()
			PluginInstallFrame.SubTitle:SetText(L["Console Variables"])
			PluginInstallFrame.Desc1:SetText(L["This step will configure some of Blizzards console variables."])
			PluginInstallFrame.Desc2:SetText(format('|cff4beb2c%s', L["Recommended step. Should not be skipped."]))
			PluginInstallFrame.Desc3:SetText(L["Examples: Max camera distance, screenshot quality and tutorials."])
			PluginInstallFrame.Desc4:SetText(L["The full list of configured CVars can be found in /luckyoneui config."])
			PluginInstallFrame.Option1:Show()
			PluginInstallFrame.Option1:SetScript('OnClick', function() Private:Setup_CVars(nil, true) end)
			PluginInstallFrame.Option1:SetText(L["Setup CVars"])
		end,
		[E.Retail and 9 or 8] = function()
			PluginInstallFrame.SubTitle:SetText(L["NamePlates"])
			PluginInstallFrame.Desc1:SetText(L["Choose between ElvUI NamePlates and Plater NamePlates."])
			PluginInstallFrame.Desc2:SetText(format('|cff4beb2c%s', L["Recommended step. Should not be skipped."]))
			PluginInstallFrame.Option1:Show()
			PluginInstallFrame.Option1:SetScript('OnClick', function() Private:Setup_NamePlates(true) end)
			PluginInstallFrame.Option1:SetText('ElvUI')
			PluginInstallFrame.Option2:Show()
			PluginInstallFrame.Option2:SetScript('OnClick', function() Private:Setup_Plater(true) end)
			PluginInstallFrame.Option2:SetText('Plater')
		end,
		[E.Retail and 10 or 9] = function()
			PluginInstallFrame.SubTitle:SetText(L["BigWigs profile"])
			PluginInstallFrame.Desc1:SetText(L["Please click the button below to apply Luckyones profile for BigWigs and LittleWigs."])
			PluginInstallFrame.Desc2:SetText(format('|cff4beb2c%s', L["Recommended step. Should not be skipped."]))
			PluginInstallFrame.Option1:Show()
			PluginInstallFrame.Option1:SetScript('OnClick', function() Private:Setup_BigWigs('main') end)
			PluginInstallFrame.Option1:SetText('BigWigs')
			PluginInstallFrame.Option2:Show()
			PluginInstallFrame.Option2:SetScript('OnClick', function() Private:Setup_BigWigs('healing') end)
			PluginInstallFrame.Option2:SetText(L["BigWigs Healing"])
		end,
		[E.Retail and 11 or 10] = function()
			PluginInstallFrame.SubTitle:SetText(L["Details profile"])
			PluginInstallFrame.Desc1:SetText(L["Please click the button below to apply Luckyones profile for Details! Damage Meter."])
			PluginInstallFrame.Desc2:SetText(format('|cff4beb2c%s', L["Recommended step. Should not be skipped."]))
			PluginInstallFrame.Option1:Show()
			PluginInstallFrame.Option1:SetScript('OnClick', function() Private:Setup_Details(true) end)
			PluginInstallFrame.Option1:SetText(L["Setup Details"])
		end,
		[E.Retail and 12] = function()
			PluginInstallFrame.SubTitle:SetText(L["OmniCD profile"])
			PluginInstallFrame.Desc1:SetText(L["Please click the button below to apply Luckyones profile for OmniCD Party CDs."])
			PluginInstallFrame.Desc2:SetText(format('|cff4beb2c%s', L["Recommended step. Should not be skipped."]))
			PluginInstallFrame.Option1:Show()
			PluginInstallFrame.Option1:SetScript('OnClick', function() Private:Setup_OmniCD('main', true) end)
			PluginInstallFrame.Option1:SetText('OmniCD')
			PluginInstallFrame.Option2:Show()
			PluginInstallFrame.Option2:SetScript('OnClick', function() Private:Setup_OmniCD('healing', true) end)
			PluginInstallFrame.Option2:SetText(L["OmniCD Healing"])
		end,
		[E.Retail and 13] = function()
			PluginInstallFrame.SubTitle:SetText(L["WarpDeplete profile"])
			PluginInstallFrame.Desc1:SetText(L["Please click the button below to apply Luckyones profile for WarpDeplete."])
			PluginInstallFrame.Desc2:SetText(format('|cff4beb2c%s', L["Recommended step. Should not be skipped."]))
			PluginInstallFrame.Option1:Show()
			PluginInstallFrame.Option1:SetScript('OnClick', function() Private:Setup_WarpDeplete(true) end)
			PluginInstallFrame.Option1:SetText(L["Setup WarpDeplete"])
		end,
		[E.Retail and 14 or 11] = function()
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
		[2] = L["Quick setup for alts"],
		[3] = L["Layout Scale"],
		[4] = L["ElvUI Layouts"],
		[E.Retail and 5] = L["ElvUI Plugins"],
		[E.Retail and 6 or 5] = L["Color Theme"],
		[E.Retail and 7 or 6] = L["Chat"],
		[E.Retail and 8 or 7] = L["Console Variables"],
		[E.Retail and 9 or 8] = L["NamePlates"],
		[E.Retail and 10 or 9] = 'BigWigs',
		[E.Retail and 11 or 10] = 'Details',
		[E.Retail and 12] = 'OmniCD',
		[E.Retail and 13] = 'WarpDeplete',
		[E.Retail and 14 or 11] = L["Installation Complete"],
	},
	StepTitlesColor = { 1, 1, 1 },
	StepTitlesColorSelected = { 0, 179 / 255, 1 },
	StepTitleWidth = 220,
	StepTitleButtonWidth = 180,
	StepTitleTextJustification = 'CENTER',
}
