local E, L, V, P, G = unpack(ElvUI)
local MyPluginName = "LuckyoneUI"
local L1UI = E:GetModule("LuckyoneUI");

--Cache
local format = string.format

--Insert options table into the ElvUI OptionsUI
function L1UI:Configtable()
	E.Options.args[MyPluginName] = {
		order = 100,
		type = "group",
		name = format("|cff4beb2c%s|r", MyPluginName),
		args = {
			header1 = {
				order = 1,
				type = "header",
				name = "|cff4beb2cLuckyoneUI|r",
			},
			install = {
				order = 2,
				type = "execute",
				name = "Run the Installer",
				desc = "Run the installation process.",
				func = function() E:GetModule("PluginInstaller"):Queue(L1UI.InstallerData); E:ToggleOptionsUI(); end,
			},
			changelog = {
				order = 3,
				type = 'input',
				width = 'full',
				name = "Changelog:",
				get = function() return 'https://git.tukui.org/Luckyone/ElvUI_LuckyoneUI/-/blob/master/CHANGELOG.md' end,
			},
			issues = {
				order = 4,
				type = 'input',
				width = 'full',
				name = "Report issues here:",
				get = function() return 'https://git.tukui.org/Luckyone/ElvUI_LuckyoneUI/-/issues' end,
			},
			header2 = {
				order = 5,
				type = "header",
				name = "Author",
			},
			author = {
				order = 6,
				type = "description",
				name = "|cffFF7D0ALuckyone|r (EU) - LaughingSkull",
				fontSize = "large",
			},
			header3 = {
				order = 7,
				type = "header",
				name = "Credits",
			},
			credits = {
				order = 8,
				type = "description",
				name = "|cff0070DEAzilroka|r |cffC41F3BKringel|r |cffF58CBARepooc|r |cFF8866ccSimpy|r",
				fontSize = "medium",
			}
		},
	}
	for _, func in pairs(L1UI.Config) do
		func()
	end
end
