local L1UI, E, L, V, P, G = unpack(select(2, ...))
local ACH = E.Libs.ACH

function L1UI:Configtable()

	E.Options.args.L1UI = {
		order = 100,
		type = 'group',
		name = L1UI.Name,
		childGroups = 'tab',
		args = {
			header1 = {
				order = 1,
				type = 'header',
				name = L1UI.Name.." "..L1UI.Version,
			},
			general = {
				type = 'group',
				name = 'General',
				order = 1,
				args = {
					installer = {
						order = 1,
						type = 'group',
						inline = true,
						name = 'Installer',
						args = {
							install = {
								order = 2,
								type = 'execute',
								name = 'Install',
								desc = 'Run the installation process.',
								func = function() E:GetModule('PluginInstaller'):Queue(L1UI.InstallerData); E:ToggleOptionsUI(); end,
							},
						},
					},
					defaults = {
						order = 3,
						type = 'group',
						inline = true,
						name = 'Defaults',
						args = {
							private = {
								order = 4,
								type = 'execute',
								name = 'Reset Media',
								desc = 'Reset Fonts, Textures, Skins to LuckyoneUI defaults.',
								func = function() L1UI:SetupPrivate(); end,
								confirm = true,
							},
							cvars = {
								order = 5,
								type = 'execute',
								name = 'Reset CVars',
								desc = 'Reset CVars to LuckyoneUI defaults.',
								func = function() L1UI:SetupCVars(); end,
								confirm = true,
							},
							npreset = {
								order = 6,
								type = 'execute',
								name = 'Reset Nameplate CVars',
								desc = 'Reset Nameplate CVars to LuckyoneUI defaults.',
								func = function() L1UI:NameplateReset(); end,
								confirm = true,
							},
						},
					},
					addons = {
						order = 7,
						type = 'group',
						inline = true,
						name = 'Addon Profiles',
						args = {
							bigwigs = {
								order = 8,
								type = 'execute',
								name = 'BigWigs',
								desc = 'Reset to LuckyoneUI defaults.',
								func = function() L1UI:AddonSetupBW(addon); end,
								confirm = true,
							},
							details = {
								order = 9,
								type = 'execute',
								name = 'Details! Damage Meter',
								desc = 'Reset to LuckyoneUI defaults.',
								func = function() L1UI:AddonSetupDT(addon); end,
								confirm = true,
							},
							omnicd = {
								order = 10,
								type = 'execute',
								name = 'OmniCD Party CDs',
								desc = 'Reset to LuckyoneUI defaults.',
								func = function() L1UI:AddonSetupOCD(addon); end,
								confirm = true,
							},
							projectazilroka = {
								order = 11,
								type = 'execute',
								name = 'ProjectAzilroka',
								desc = 'Reset to LuckyoneUI defaults.',
								func = function() L1UI:AddonSetupPA(addon); end,
								confirm = true,
							},
						},
					},
				},
			},
			info = {
				type = 'group',
				name = 'Informations',
				order = 2,
				args = {
					cvardesc = {
						order = 1,
						type = 'group',
						inline = true,
						name = 'Description',
						args = {
							desc = {
								order = 1,
								type = 'description',
								fontSize = 'medium',
								name = 'A list of all CVars changed by LuckyoneUI',
							},
						},
					},
					defaults = {
						order = 2,
						type = 'group',
						inline = true,
						name = 'CVars (Defaults)',
						args = {
							desc = {
								order = 1,
								type = 'description',
								fontSize = 'medium',
								name = 'If you are looking for the Blizzard default values of those CVars:\nI suggest using the AddOn "Advanced Interface Options"\nIt has a CVar browser and shows all the default values on mouseover.',
							},
						},
					},
					cvar = {
						order = 3,
						type = 'group',
						inline = true,
						name = 'CVars (General)',
						args = {
							cvars = {
								order = 1,
								type = 'description',
								fontSize = 'medium',
								name = '- cameraDistanceMaxZoomFactor 2.6\n- ffxDeath 0\n- advancedCombatLogging 1\n- chatStyle classic\n- rawMouseEnable 1\n- SpellQueueWindow 50',
							},
						},
					},
					nameplateCvar = {
						order = 4,
						type = 'group',
						inline = true,
						name = 'CVars (NamePlates)',
						args = {
							cvars = {
								order = 1,
								type = 'description',
								fontSize = 'medium',
								name = '- nameplateLargerScale 1\n- nameplateMinAlpha 1\n- nameplateMinScale 1\n- nameplateMotion 1\n- nameplateOccludedAlphaMult 1\n- nameplateOverlapH 1\n- nameplateOverlapV 1.6\n- nameplateSelectedScale 1\n- nameplateSelfAlpha 1',
							},
						},
					},
				},
			},
			links = {
				type = 'group',
				name = 'Links',
				order = 3,
				args = {
					changelog = {
						order = 1,
						type = 'input',
						width = 'full',
						name = 'Changelog:',
						get = function() return 'https://git.tukui.org/Luckyone/luckyoneui/-/blob/master/CHANGELOG.md' end,
					},
					issues = {
						order = 2,
						type = 'input',
						width = 'full',
						name = 'Report issues here:',
						get = function() return 'https://git.tukui.org/Luckyone/luckyoneui/-/issues' end,
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
				order = 4,
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
					},
				},
			},
		},
	}

	for _, func in pairs(L1UI.Config) do
		func()
	end
end
