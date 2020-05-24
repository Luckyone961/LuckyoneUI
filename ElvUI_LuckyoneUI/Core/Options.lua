local E, L, V, P, G = unpack(ElvUI)
local MyPluginName = "LuckyoneUI"
local L1UI = E:GetModule("LuckyoneUI");

local format = string.format

--Options table for the ElvUI OptionsUI
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
				name = "Install",
				desc = "Run the installation process.",
				func = function() E:GetModule("PluginInstaller"):Queue(L1UI.InstallerData); E:ToggleOptionsUI(); end,
			},
			private = {
				order = 3,
				type = "execute",
				name = "Apply Character Settings",
				desc = "Click this button once per character to apply fonts and textures.",
				func = function() L1UI:SetupPrivate(); end,
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
			website = {
				order = 5,
				type = 'input',
				width = 'full',
				name = "Addon link:",
				get = function() return 'https://www.tukui.org/addons.php?id=154' end,
			},
			discord = {
				order = 6,
				type = 'input',
				width = 'full',
				name = "Discord:",
				get = function() return 'https://discord.gg/xRY4bwA' end,
			},
			header2 = {
				order = 7,
				type = "header",
				name = "Author",
			},
			author = {
				order = 8,
				type = "description",
				name = "|cffFF7D0ALuckyone|r (EU) - LaughingSkull",
				fontSize = "large",
			},
			header3 = {
				order = 9,
				type = "header",
				name = "Credits",
			},
			credits = {
				order = 10,
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
