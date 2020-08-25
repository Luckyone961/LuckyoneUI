local E, L, V, P, G = unpack(ElvUI)
local MyPluginName = 'LuckyoneUI'
local L1UI = E:GetModule('LuckyoneUI');

local format = string.format

function L1UI:Configtable()

	E.Options.args[MyPluginName] = {
		order = 100,
		type = 'group',
		name = format('|cff4beb2c%s|r', MyPluginName),
		childGroups = 'tab',
		args = {
			header1 = {
				order = 1,
				type = 'header',
				name = '|cff4beb2cLuckyoneUI|r',
			},
			general = {
				type = 'group',
				name = 'General',
				order = 1,
				args = {
					header1 = {
						order = 1,
						type = 'header',
						name = 'Installer',
					},
					install = {
						order = 2,
						type = 'execute',
						name = 'Install',
						desc = 'Run the installation process.',
						func = function() E:GetModule('PluginInstaller'):Queue(L1UI.InstallerData); E:ToggleOptionsUI(); end,
					},
					header2 = {
						order = 3,
						type = 'header',
						name = 'Defaults',
					},
					private = {
						order = 4,
						type = 'execute',
						name = 'Media Defaults',
						desc = 'This will setup Fonts, Textures and Skins.',
						func = function() L1UI:SetupPrivate(); end,
					},
					npreset = {
						order = 5,
						type = 'execute',
						name = 'Nameplate CVars',
						desc = 'This will reset Nameplate CVars to default.',
						func = function() L1UI:NameplateReset(); end,
					},
					header3 = {
						order = 6,
						type = 'header',
						name = 'Addon Profiles',
					},
					details = {
						order = 7,
						type = 'execute',
						name = 'Details! Damage Meter',
						desc = 'Reset to LuckyoneUI defaults.',
						func = function() L1UI:AddonSetupDT(addon); end,
						confirm = true,
					},
					bigwigs = {
						order = 8,
						type = 'execute',
						name = 'BigWigs',
						desc = 'Reset to LuckyoneUI defaults.',
						func = function() L1UI:AddonSetupBW(addon); end,
						confirm = true,
					},
					projectazilroka = {
						order = 9,
						type = 'execute',
						name = 'ProjectAzilroka',
						desc = 'Reset to LuckyoneUI defaults.',
						func = function() L1UI:AddonSetupPA(addon); end,
						confirm = true,
					},
				},
			},
			links = {
				type = 'group',
				name = 'Links',
				order = 2,
				args = {
					changelog = {
						order = 1,
						type = 'input',
						width = 'full',
						name = 'Changelog:',
						get = function() return 'https://git.tukui.org/Luckyone/ElvUI_LuckyoneUI/-/blob/master/CHANGELOG.md' end,
					},
					issues = {
						order = 2,
						type = 'input',
						width = 'full',
						name = 'Report issues here:',
						get = function() return 'https://git.tukui.org/Luckyone/ElvUI_LuckyoneUI/-/issues' end,
					},
					website = {
						order = 3,
						type = 'input',
						width = 'full',
						name = 'Addon link:',
						get = function() return 'https://www.tukui.org/addons.php?id=154' end,
					},
					discord = {
						order = 4,
						type = 'input',
						width = 'full',
						name = 'Discord:',
						get = function() return 'https://discord.gg/xRY4bwA' end,
					},
					guide = {
						order = 5,
						type = 'input',
						width = 'full',
						name = 'Wowhead Guide:',
						get = function() return 'https://www.wowhead.com/guide=10680/elvui-luckyoneui-addon-plugin-guide' end,
					},
				},
			},
			credits = {
				type = 'group',
				name = 'Credits',
				order = 3,
				args = {
					header1 = {
						order = 1,
						type = 'header',
						name = 'Author',
					},
					author = {
						order = 2,
						type = 'description',
						name = '|cffFF7D0ALuckyone|r (EU) - LaughingSkull',
						fontSize = 'large',
					},
					header2 = {
						order = 3,
						type = 'header',
						name = 'Credits',
					},
					credits = {
						order = 4,
						type = 'description',
						name = '|cff0070DEAzilroka|r |cffC41F3BKringel|r |cffFF7D0AMerathilis|r |cffF58CBARepooc|r |cFF8866ccSimpy|r',
						fontSize = 'medium',
					},
					header3 = {
						order = 5,
						type = 'header',
						name = 'Testers',
					},
					thanks = {
						order = 6,
						type = 'description',
						name = '|cffe6cc80Gandi Illusion Sniefer Xyf|r',
						fontSize = 'medium',
					}
				}
			}
		},
	}

	for _, func in pairs(L1UI.Config) do
		func()
	end
end
