local E, L, V, P, G = unpack(ElvUI)
local MyPluginName = "LuckyoneUI"
local L1UI = E:GetModule("LuckyoneUI");

local ReloadUI = ReloadUI
local StopMusic = StopMusic
local format = string.format
local GetCVarBool = GetCVarBool

--Run this on "Skip Process" and "Finished"
local function InstallComplete()
	if GetCVarBool("Sound_EnableMusic") then
		StopMusic()
	end

	E.db[MyPluginName].install_version = L1UI.Version

	ReloadUI()
end

--Installer Steps
L1UI.InstallerData = {
	Title = format("|cff4beb2c%s %s|r", MyPluginName, "Installation"),
	Name = MyPluginName,
	tutorialImage = "Interface\\AddOns\\ElvUI_LuckyoneUI\\Media\\Textures\\Clover.tga",
	Pages = {
		[1] = function()
			PluginInstallFrame.SubTitle:SetFormattedText("Welcome")
			PluginInstallFrame.Desc1:SetText("This installation process will guide you through a few steps and apply settings to your current ElvUI profile.")
			PluginInstallFrame.Desc2:SetText("Note: |cff4beb2cMake sure you have a backup of your current profile|r")
			PluginInstallFrame.Desc3:SetText("|cffff0007Check your ElvUI version before you run the installer\nRequired version: 11.42 or later")
			PluginInstallFrame.Option1:Show()
			PluginInstallFrame.Option1:SetScript("OnClick", InstallComplete)
			PluginInstallFrame.Option1:SetText("Skip Process")
		end,
		[2] = function()
			PluginInstallFrame.SubTitle:SetText("Layouts")
			PluginInstallFrame.Desc1:SetText("Please click a button below to apply the layout of your choosing.")
			PluginInstallFrame.Desc2:SetText("Importance: |cff4beb2cHigh|r")
			PluginInstallFrame.Option1:Show()
			PluginInstallFrame.Option1:SetScript("OnClick", function() L1UI:SetupLayout("tank") end)
			PluginInstallFrame.Option1:SetText("Tank")
			PluginInstallFrame.Option2:Show()
			PluginInstallFrame.Option2:SetScript("OnClick", function() L1UI:SetupLayout("healer") end)
			PluginInstallFrame.Option2:SetText("Healer")
			PluginInstallFrame.Option3:Show()
			PluginInstallFrame.Option3:SetScript("OnClick", function() L1UI:SetupLayout("dps") end)
			PluginInstallFrame.Option3:SetText("DPS")
		end,
		[3] = function()
			PluginInstallFrame.SubTitle:SetFormattedText("BigWigs Profile")
			PluginInstallFrame.Desc1:SetText("Please click the button below to apply Luckyone's profile for BigWigs.")
			PluginInstallFrame.Desc2:SetText("Importance: |cff4beb2cOptional|r")
			PluginInstallFrame.Option1:Show()
			PluginInstallFrame.Option1:SetScript("OnClick", function() L1UI:AddonSetupBW('addon') end)
			PluginInstallFrame.Option1:SetText("Setup BigWigs")
		end,
		[4] = function()
			PluginInstallFrame.SubTitle:SetFormattedText("Details Profile")
			PluginInstallFrame.Desc1:SetText("Please click the button below to apply Luckyone's profile for Details! Damage Meter.")
			PluginInstallFrame.Desc2:SetText("Importance: |cff4beb2cOptional|r")
			PluginInstallFrame.Option1:Show()
			PluginInstallFrame.Option1:SetScript("OnClick", function() L1UI:AddonSetupDT('addon') end)
			PluginInstallFrame.Option1:SetText("Setup Details")
		end,
		[5] = function()
			PluginInstallFrame.SubTitle:SetFormattedText("ProjectAzilroka Profile")
			PluginInstallFrame.Desc1:SetText("Please click the button below to apply Luckyone's profile for ProjectAzilroka.")
			PluginInstallFrame.Desc2:SetText("Importance: |cff4beb2cOptional|r")
			PluginInstallFrame.Option1:Show()
			PluginInstallFrame.Option1:SetScript("OnClick", function() L1UI:AddonSetupPA('addon') end)
			PluginInstallFrame.Option1:SetText("Setup ProjectAzilroka")
		end,
		[6] = function()
			PluginInstallFrame.SubTitle:SetFormattedText("CVars")
			PluginInstallFrame.Desc1:SetText("Please click the button below to apply Luckyone's CVar setup for minor tweaks like\n MaxCameraZoom, ChatStyle and HardwareCursor.")
			PluginInstallFrame.Desc2:SetText("Importance: |cff4beb2cOptional|r")
			PluginInstallFrame.Option1:Show()
			PluginInstallFrame.Option1:SetScript("OnClick", function() L1UI:SetupCVars() end)
			PluginInstallFrame.Option1:SetText("Setup CVars")
		end,
		[7] = function()
			PluginInstallFrame.SubTitle:SetText("Installation Complete")
			PluginInstallFrame.Desc1:SetText("You have completed the installation process, please click 'Finished' to reload the UI.")
			PluginInstallFrame.Desc2:SetText("Importance: |cff4beb2cHigh|r")
			PluginInstallFrame.Option1:Show()
			PluginInstallFrame.Option1:SetScript("OnClick", InstallComplete)
			PluginInstallFrame.Option1:SetText("Finished")
		end,
	},
	StepTitles = {
		[1] = "Welcome",
		[2] = "ElvUI Layouts",
		[3] = "BigWigs Profile",
		[4] = "Details Profile",
		[5] = "ProjectAzilroka Profile",
		[6] = "CVars",
		[7] = "Installation Complete",
	},
	StepTitlesColor = {1, 1, 1},
	StepTitlesColorSelected = {0, 179/255, 1},
	StepTitleWidth = 200,
	StepTitleButtonWidth = 180,
	StepTitleTextJustification = "CENTER",
}
