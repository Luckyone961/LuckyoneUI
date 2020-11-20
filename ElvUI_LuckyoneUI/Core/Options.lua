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
	'|cffe6cc80Midnatt|r',
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
		args = {
			header1 = {
				order = 1,
				type = 'header',
				name = L1UI.Name.." "..L1UI.Version,
			},
			installer = {
				order = 2,
				type = 'group',
				inline = true,
				name = 'Installer & Update',
				args = {
					install = {
						order = 1,
						type = 'execute',
						name = 'Install',
						desc = '(Re)-Run the installation process.',
						func = function() E:GetModule('PluginInstaller'):Queue(L1UI.InstallerData); E:ToggleOptionsUI(); end,
					},
					update1 = {
						order = 2,
						type = 'execute',
						name = 'Update DPS/TANK',
						desc = 'Update DPS/TANK layout to LuckyoneUI version: '..L1UI.Version,
						func = function() L1UI:UpdateLayout('dps'); end,
						confirm = true,
					},
					update2 = {
						order = 3,
						type = 'execute',
						name = 'Update Healing',
						desc = 'Update Healing layout to LuckyoneUI version: '..L1UI.Version,
						func = function() L1UI:UpdateLayout('healer'); end,
						confirm = true,
					},
				},
			},
			addons = {
				type = 'group',
				name = '|cff4beb2cAddons|r',
				order = 3,
				args = {
					addons = {
						order = 1,
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
								name = 'Details',
								desc = 'Reset to LuckyoneUI defaults.',
								func = function() L1UI:AddonSetupDT(); end,
								confirm = true,
							},
							omnicd = {
								order = 3,
								type = 'execute',
								name = 'OmniCD',
								desc = 'Reset to LuckyoneUI defaults.',
								func = function() L1UI:AddonSetupOCD(); end,
								confirm = true,
							},
						},
					},
				},
			},
			blizzard = {
				type = 'group',
				name = '|cff4beb2cBlizzard|r',
				order = 4,
				args = {
					disabledFrames = {
						order = 1,
						type = 'group',
						inline = true,
						name = 'Hide Blizzard Frames',
						get = function(info) return E.private.L1UI.disabledFrames[info[#info]] end,
						set = function(info, value) E.private.L1UI.disabledFrames[info[#info]] = value; E:StaticPopup_Show('PRIVATE_RL') end,
						args = {
							BossBanner = {
								order = 1,
								type = 'toggle',
								name = 'Boss Banner',
								desc = 'Hide the Boss Banner',
								get = function(info) return E.private.L1UI.disabledFrames.BossBanner end,
								set = function(info, value) E.private.L1UI.disabledFrames.BossBanner = value; E:StaticPopup_Show('PRIVATE_RL') end,
							},
							LevelUpDisplay = {
								order = 2,
								type = 'toggle',
								name = 'LevelUp Display',
								desc = 'Hide the LevelUp Display',
								get = function(info) return E.private.L1UI.disabledFrames.LevelUpDisplay end,
								set = function(info, value) E.private.L1UI.disabledFrames.LevelUpDisplay = value; E:StaticPopup_Show('PRIVATE_RL') end,
							},
							ZoneTextFrame = {
								order = 3,
								type = 'toggle',
								name = 'Zone Text',
								desc = 'Hide the Zone Text',
								get = function(info) return E.private.L1UI.disabledFrames.ZoneTextFrame end,
								set = function(info, value) E.private.L1UI.disabledFrames.ZoneTextFrame = value; E:StaticPopup_Show('PRIVATE_RL') end,
							},
							AlertFrame = {
								order = 4,
								type = 'toggle',
								name = 'Alert Frame',
								desc = 'Hide the Loot/Alert Frame',
								get = function(info) return E.private.L1UI.disabledFrames.AlertFrame end,
								set = function(info, value) E.private.L1UI.disabledFrames.AlertFrame = value; E:StaticPopup_Show('PRIVATE_RL') end,
							},
						},
					},
				},
			},
			chat = {
				type = 'group',
				name = '|cff4beb2cChat|r',
				order = 5,
				args = {
					chatSetup = {
						order = 1,
						type = 'group',
						inline = true,
						name = 'Setup Chat',
						args = {
							chat = {
								order = 1,
								type = 'execute',
								name = 'Setup Chat',
								func = function() L1UI:SetupChat(); end,
								confirm = true,
							},
						},
					},
					chatDesc = {
						order = 2,
						type = 'group',
						inline = true,
						name = 'Description',
						args = {
							desc = {
								order = 1,
								type = 'description',
								fontSize = 'medium',
								name = 'Setup Chat will reset your chat panels to default and create custom chat tabs.\n\nLeft Chat: [ General - Log - Whisper - Guild - Party ]\n\nRight Chat: [ No Tabs - Details! Damage Meter ]',
							},
						},
					},
					chatVars = {
						order = 3,
						type = 'group',
						inline = true,
						name = 'Chat CVars',
						args = {
							desc = {
								order = 1,
								type = 'description',
								fontSize = 'medium',
								name = '- chatStyle classic\n- whisperMode inline',
							},
						},
					},
				},
			},
			cvars = {
				order = 6,
				type = 'group',
				name = '|cff4beb2cCVars|r',
				args = {
					setup = {
						order = 1,
						type = 'group',
						inline = true,
						name = 'Setup CVars',
						args = {
							generalVars = {
								order = 1,
								type = 'execute',
								name = 'General CVars',
								func = function() L1UI:SetupCVars(); end,
								confirm = true,
							},
							nameplateVars = {
								order = 2,
								type = 'execute',
								name = 'NamePlate CVars',
								func = function() L1UI:NameplateReset(); end,
								confirm = true,
							},
						},
					},
					generalDesc = {
						order = 2,
						type = 'group',
						inline = true,
						name = 'General CVars',
						args = {
							cvars = {
								order = 1,
								type = 'description',
								fontSize = 'medium',
								name = '- cameraDistanceMaxZoomFactor 2.6\n- ffxDeath 0\n- advancedCombatLogging 1\n- rawMouseEnable 1\n- SpellQueueWindow 50',
							},
						},
					},
					nameplateDesc = {
						order = 3,
						type = 'group',
						inline = true,
						name = 'NamePlate CVars',
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
			media = {
				type = 'group',
				name = '|cff4beb2cMedia|r',
				order = 7,
				args = {
					defaults = {
						order = 1,
						type = 'group',
						inline = true,
						name = 'Defaults',
						args = {
							private = {
								order = 1,
								type = 'execute',
								name = 'Reset Media',
								desc = 'Reset Fonts, Textures, Skins to LuckyoneUI defaults.',
								func = function() L1UI:SetupPrivate(); E:StaggeredUpdateAll(nil, true) end,
								confirm = true,
							},
						},
					},
				},
			},
			plugins = {
				type = 'group',
				name = '|cff4beb2cPlugins|r',
				order = 8,
				args = {
					plugins = {
						order = 1,
						type = 'group',
						inline = true,
						name = 'Plugin Profiles',
						args = {
							addonskins = {
								order = 1,
								type = 'execute',
								name = '|cff16C3F2AddOn|r|cFFFFFFFFSkins|r',
								desc = 'Reset to LuckyoneUI defaults.',
								func = function() L1UI:AddonSetupAS(); end,
								confirm = true,
							},
							projectazilroka = {
								order = 2,
								type = 'execute',
								name = '|cFF16C3F2Project|r|cFFFFFFFFAzilroka|r',
								desc = 'Reset to LuckyoneUI defaults.',
								func = function() L1UI:AddonSetupPA(); end,
								confirm = true,
							},
							sle = {
								order = 3,
								type = 'execute',
								name = '|cff9482c9Shadow & Light|r',
								desc = 'Reset to LuckyoneUI defaults.',
								func = function() L1UI:AddonSetupSLE(); end,
								confirm = true,
							},
						},
					},
				},
			},
			weakauras = {
				type = 'group',
				name = '|cff4beb2cWeakAuras|r',
				order = 9,
				args = {
					header1 = {
						order = 1,
						type = 'header',
						name = 'Class WeakAuras',
					},
					class1 = {
						order = 2,
						type = 'input',
						width = 'normal',
						name = '|cffFF7C0ADruid:|r',
						get = function() return 'wago.io/luckyoneDruid' end,
					},
					class2 = {
						order = 3,
						type = 'input',
						width = 'normal',
						name = '|cffFFFFFFPriest:|r',
						get = function() return 'wago.io/luckyonePriest' end,
					},
					class3 = {
						order = 4,
						type = 'input',
						width = 'normal',
						name = '|cff00FF98Monk:|r',
						get = function() return 'wago.io/luckyoneMonk' end,
					},
					class4 = {
						order = 5,
						type = 'input',
						width = 'normal',
						name = '|cff8788EEWarlock:|r',
						get = function() return 'wago.io/luckyoneWarlock' end,
					},
					class5 = {
						order = 6,
						type = 'input',
						width = 'normal',
						name = '|cffAAD372Hunter:|r',
						get = function() return 'wago.io/luckyoneHunter' end,
					},
					class6 = {
						order = 7,
						type = 'input',
						width = 'normal',
						name = '|cffFFF468Rogue:|r',
						get = function() return 'wago.io/luckyoneRogue' end,
					},
					class7 = {
						order = 8,
						type = 'input',
						width = 'normal',
						name = '|cff3FC7EBMage:|r',
						get = function() return 'wago.io/luckyoneMage' end,
					},
					class8 = {
						order = 9,
						type = 'input',
						width = 'normal',
						name = '|cffA330C9Demon Hunter:|r',
						get = function() return 'wago.io/luckyoneDH' end,
					},
					class9 = {
						order = 10,
						type = 'input',
						width = 'normal',
						name = '|cffC41E3ADeath Knight:|r',
						get = function() return 'wago.io/luckyoneDK' end,
					},
					class10 = {
						order = 11,
						type = 'input',
						width = 'normal',
						name = '|cffF48CBAPaladin:|r',
						get = function() return 'wago.io/luckyonePaladin' end,
					},
					class11 = {
						order = 12,
						type = 'input',
						width = 'normal',
						name = '|cff0070DDShaman:|r',
						get = function() return 'wago.io/luckyoneShaman' end,
					},
					class12 = {
						order = 13,
						type = 'input',
						width = 'normal',
						name = '|cffC69B6DWarrior:|r',
						get = function() return 'wago.io/luckyoneWarrior' end,
					},
					header2 = {
						order = 14,
						type = 'header',
						name = 'General WeakAuras',
					},
					keys = {
						order = 15,
						type = 'input',
						width = 'normal',
						name = 'Link !keys',
						get = function() return 'wago.io/bfakeys' end,
					},
					interrupts1 = {
						order = 16,
						type = 'input',
						width = 'normal',
						name = 'Interrupts 1/2',
						get = function() return 'wago.io/N_wYs5wbK' end,
					},
					interrupts2 = {
						order = 17,
						type = 'input',
						width = 'normal',
						name = 'Interrupts 2/2',
						get = function() return 'wago.io/cHKY2f9Pl' end,
					},
				},
			},
			credits = {
				type = 'group',
				name = '|cffFF7D0ACredits|r',
				order = 10,
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
				name = '|cffFF7D0ALinks|r',
				order = 11,
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
