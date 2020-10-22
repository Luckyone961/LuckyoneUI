local L1UI, E, L, V, P, G = unpack(select(2, ...))

local sort = sort
local pairs = pairs
local tinsert = tinsert

-- Author list
local AUTHORS = {
	'|cffFF7D0ALuckyone|r (EU) - LaughingSkull',
}

-- Coding list
local CODING = {
	'|cff0070DEAzilroka|r',
	'|cffFF7D0AMerathilis|r',
	'|cffF58CBARepooc|r',
	'|cFF8866ccSimpy|r',
}

-- Testers list
local TESTERS = {
	'|cffC41F3BKringel|r',
	'|cff00FF96AltBridge|r',
	'|cffF58CBAIllusion|r',
	'|cff69CCF0Sniefer|r',
	'|cffABD473Xyf|r',
}

-- Dono list
local SUPPORT = {
	'|cffe6cc80DaPaKnat|r',
	'|cffe6cc80Fooseq|r',
	'|cffe6cc80MonkeyHack|r',
	'|cffe6cc80GUSTENFTW|r',
	'|cffe6cc80Liam|r',
}

-- Sort
local function SortList(a, b)
	return E:StripString(a) < E:StripString(b)
end

sort(AUTHORS, SortList)
sort(CODING, SortList)
sort(TESTERS, SortList)
sort(SUPPORT, SortList)

-- Author table
for _, name in pairs(AUTHORS) do
	tinsert(L1UI.CreditsList, name)
end
local AUTHORS_STRING = table.concat(AUTHORS, '|n')

-- Coding table
for _, name in pairs(CODING) do
	tinsert(L1UI.CreditsList, name)
end
local CODING_STRING = table.concat(CODING, '|n')

-- Testers table
for _, name in pairs(TESTERS) do
	tinsert(L1UI.CreditsList, name)
end
local TESTER_STRING = table.concat(TESTERS, '|n')

-- Dono table
for _, name in pairs(SUPPORT) do
	tinsert(L1UI.CreditsList, name)
end
local SUPPORT_STRING = table.concat(SUPPORT, '|n')

-- LuckyoneUI ingame options
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
								order = 1,
								type = 'execute',
								name = 'Install',
								desc = 'Run the installation process.',
								func = function() E:GetModule('PluginInstaller'):Queue(L1UI.InstallerData); E:ToggleOptionsUI(); end,
							},
							chat = {
								order = 2,
								type = 'execute',
								name = 'Setup Chat',
								desc = 'Setup custom chat tabs Whisper, Guild, Party.',
								func = function() L1UI:SetupChat(); end,
								confirm = true,
							},
						},
					},
					defaults = {
						order = 2,
						type = 'group',
						inline = true,
						name = 'Defaults',
						args = {
							private = {
								order = 1,
								type = 'execute',
								name = 'Reset Media',
								desc = 'Reset Fonts, Textures, Skins to LuckyoneUI defaults.',
								func = function() L1UI:SetupPrivate(); end,
								confirm = true,
							},
							cvars = {
								order = 2,
								type = 'execute',
								name = 'Reset CVars',
								desc = 'Reset CVars to LuckyoneUI defaults.',
								func = function() L1UI:SetupCVars(); end,
								confirm = true,
							},
							npreset = {
								order = 3,
								type = 'execute',
								name = 'Reset Nameplate CVars',
								desc = 'Reset Nameplate CVars to LuckyoneUI defaults.',
								func = function() L1UI:NameplateReset(); end,
								confirm = true,
							},
						},
					},
					plugins = {
						order = 3,
						type = 'group',
						inline = true,
						name = 'Plugin Profiles',
						args = {
							addonskins = {
								order = 1,
								type = 'execute',
								name = 'AddOnSkins',
								desc = 'Reset to LuckyoneUI defaults.',
								func = function() L1UI:AddonSetupAS(); end,
								confirm = true,
							},
							projectazilroka = {
								order = 2,
								type = 'execute',
								name = 'ProjectAzilroka',
								desc = 'Reset to LuckyoneUI defaults.',
								func = function() L1UI:AddonSetupPA(); end,
								confirm = true,
							},
							sle = {
								order = 3,
								type = 'execute',
								name = 'Shadow&Light',
								desc = 'Reset to LuckyoneUI defaults.',
								func = function() L1UI:AddonSetupSLE(); end,
								confirm = true,
							},
						},
					},
					addons = {
						order = 4,
						type = 'group',
						inline = true,
						name = 'Addon Profiles',
						args = {
							bigwigs = {
								order = 1,
								type = 'execute',
								name = 'BigWigs',
								desc = 'Reset to LuckyoneUI defaults.',
								func = function() L1UI:AddonSetupBW(); end,
								confirm = true,
							},
							details = {
								order = 2,
								type = 'execute',
								name = 'Details! Damage Meter',
								desc = 'Reset to LuckyoneUI defaults.',
								func = function() L1UI:AddonSetupDT(); end,
								confirm = true,
							},
							omnicd = {
								order = 3,
								type = 'execute',
								name = 'OmniCD Party CDs',
								desc = 'Reset to LuckyoneUI defaults.',
								func = function() L1UI:AddonSetupOCD(); end,
								confirm = true,
							},
						},
					},
					disabledFrames = {
						order = 5,
						type = 'group',
						inline = true,
						name = 'Disabled Blizzard Frames',
						get = function(info) return E.private.L1UI.disabledFrames[info[#info]] end,
						set = function(info, value) E.private.L1UI.disabledFrames[info[#info]] = value; E:StaticPopup_Show('PRIVATE_RL') end,
						args = {
							BossBanner = {
								order = 1,
								type = 'toggle',
								name = 'Boss Banner',
								desc = 'Hide Blizzards Boss Banner\n(Defeated Boss XY)',
								get = function(info) return E.private.L1UI.disabledFrames.BossBanner end,
								set = function(info, value) E.private.L1UI.disabledFrames.BossBanner = value; E:StaticPopup_Show('PRIVATE_RL') end,
							},
							LevelUpDisplay = {
								order = 2,
								type = 'toggle',
								name = 'LevelUp Display',
								desc = 'Hide Blizzards LevelUp Display\n(Reached level XY)',
								get = function(info) return E.private.L1UI.disabledFrames.LevelUpDisplay end,
								set = function(info, value) E.private.L1UI.disabledFrames.LevelUpDisplay = value; E:StaticPopup_Show('PRIVATE_RL') end,
							},
							ZoneTextFrame = {
								order = 3,
								type = 'toggle',
								name = 'Zone Text',
								desc = 'Hide the Zone Text\n(Entering Zone)',
								get = function(info) return E.private.L1UI.disabledFrames.ZoneTextFrame end,
								set = function(info, value) E.private.L1UI.disabledFrames.ZoneTextFrame = value; E:StaticPopup_Show('PRIVATE_RL') end,
							},
							AlertFrame = {
								order = 4,
								type = 'toggle',
								name = 'Alert Frame',
								desc = 'Hide the Loot / Alert Frame\n(Looted Items & Achievements)',
								get = function(info) return E.private.L1UI.disabledFrames.AlertFrame end,
								set = function(info, value) E.private.L1UI.disabledFrames.AlertFrame = value; E:StaticPopup_Show('PRIVATE_RL') end,
							},
						},
					},
				},
			},
			cvars = {
				type = 'group',
				name = 'CVars',
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
								name = '- cameraDistanceMaxZoomFactor 2.6\n- ffxDeath 0\n- advancedCombatLogging 1\n- rawMouseEnable 1\n- SpellQueueWindow 50',
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
			credits = {
				type = 'group',
				name = 'Credits',
				order = 3,
				args = {
					author = {
						order = 1,
						type = 'group',
						inline = true,
						name = 'Author',
						args = {
							desc = {
								order = 1,
								type = 'description',
								fontSize = 'medium',
								name = AUTHORS_STRING,
							},
						},
					},
					coding = {
						order = 2,
						type = 'group',
						inline = true,
						name = 'Coding',
						args = {
							desc = {
								order = 1,
								type = 'description',
								fontSize = 'medium',
								name = CODING_STRING,
							},
						},
					},
					testers = {
						order = 3,
						type = 'group',
						inline = true,
						name = 'Testers',
						args = {
							desc = {
								order = 1,
								type = 'description',
								fontSize = 'medium',
								name = TESTER_STRING,
							},
						},
					},
					supporter = {
						order = 4,
						type = 'group',
						inline = true,
						name = 'Supporters',
						args = {
							desc = {
								order = 1,
								type = 'description',
								fontSize = 'medium',
								name = SUPPORT_STRING,
							},
						},
					},
				},
			},
			links = {
				type = 'group',
				name = 'Links',
				order = 4,
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
		},
	}

	for _, func in pairs(L1UI.Config) do
		func()
	end
end
