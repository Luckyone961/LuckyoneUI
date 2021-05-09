local L1UI, E, L, V, P, G = unpack(select(2, ...))

local LoadAddOn = LoadAddOn

-- BigWigs Profiles
function L1UI:GetBigWigsProfile()

	local Rmain, Rheal = "Luckyone D/T", "Luckyone H"
	local Tmain, Theal = "Luckyone TBC D/T", "Luckyone TBC H"
	local Cmain, Cheal = "Luckyone Classic D/T", "Luckyone Classic H"

	LoadAddOn('BigWigs')
	LoadAddOn('BigWigs_Options')

	if L1UI.Retail then

		BigWigs3DB = {
			["profileKeys"] = {
				[E.mynameRealm] = Rmain,
			},
			["namespaces"] = {
				["BigWigs_Plugins_Victory"] = {
					["profiles"] = {
						[Rmain] = {
							["bigwigsMsg"] = true,
							["blizzMsg"] = false,
						},
						[Rheal] = {
							["bigwigsMsg"] = true,
							["blizzMsg"] = false,
						},
					},
				},
				["BigWigs_Bosses_Sun King's Salvation"] = {
					["profiles"] = {
						[Rmain] = {
							[326583] = 3130103,
							[328889] = 3064567,
							[328479] = 3064567,
							[325877] = 3130103,
						},
					},
				},
				["BigWigs_Plugins_Alt Power"] = {},
				["BigWigs_Bosses_Artificer Xy'mox"] = {
					["profiles"] = {
						[Rmain] = {
							[327902] = 3064567,
							[328437] = 3130103,
							[340758] = 3130103,
						},
					},
				},
				["BigWigs_Plugins_Sounds"] = {},
				["BigWigs_Bosses_Lady Inerva Darkvein"] = {
					["profiles"] = {
						[Rmain] = {
							["custom_on_stop_timers"] = false,
							[325769] = 3064567,
							[332664] = 3130103,
							["anima_tracking"] = 0,
						},
					},
				},
				["BigWigs_Plugins_AutoReply"] = {
					["profiles"] = {
						[Rmain] = {
							["exitCombatOther"] = 3,
							["disabled"] = false,
							["modeOther"] = 2,
						},
						[Rheal] = {
							["exitCombatOther"] = 3,
							["disabled"] = false,
							["modeOther"] = 2,
						},
					},
				},
				["BigWigs_Bosses_Hungering Destroyer"] = {
					["profiles"] = {
						[Rmain] = {
							[334522] = 3130103,
							[329298] = 3064567,
							[334266] = 3064567,
						},
					},
				},
				["BigWigs_Bosses_Shriekwing"] = {
					["profiles"] = {
						[Rmain] = {
							[342863] = 3064567,
							[330711] = 3130103,
							[342074] = 3064567,
						},
					},
				},
				["BigWigs_Plugins_BossBlock"] = {},
				["BigWigs_Plugins_Countdown"] = {
					["profiles"] = {
						[Rmain] = {
							["outline"] = "OUTLINE",
							["fontName"] = "Expressway",
							["position"] = {
								nil, -- [1]
								nil, -- [2]
								nil, -- [3]
								-220, -- [4]
							},
						},
						[Rheal] = {
							["outline"] = "OUTLINE",
							["fontName"] = "Expressway",
							["position"] = {
								nil, -- [1]
								nil, -- [2]
								nil, -- [3]
								-220, -- [4]
							},
						},
					},
				},
				["BigWigs_Plugins_AltPower"] = {
					["profiles"] = {
						[Rmain] = {
							["disabled"] = true,
						},
						[Rheal] = {
							["disabled"] = true,
						},
					},
				},
				["BigWigs_Bosses_The Council of Blood"] = {
					["profiles"] = {
						[Rmain] = {
							[330959] = 3064039,
							[327497] = 3064039,
							[330978] = 3064567,
							[346800] = 3130103,
							[337110] = 3064039,
							[331634] = 3064567,
						},
					},
				},
				["BigWigs_Plugins_Colors"] = {},
				["BigWigs_Plugins_Raid Icons"] = {
					["profiles"] = {
						[Rmain] = {
							["disabled"] = true,
						},
						[Rheal] = {
							["disabled"] = true,
						},
					},
				},
				["BigWigs_Plugins_InfoBox"] = {
					["profiles"] = {
						[Rmain] = {
							["posx"] = 962.8442941480171,
							["posy"] = 71.71141124165615,
						},
						[Rheal] = {
							["posx"] = 962.8442941480171,
							["posy"] = 71.71141124165615,
						},
					},
				},
				["BigWigs_Plugins_Bars"] = {
					["profiles"] = {
						[Rmain] = {
							["outline"] = "OUTLINE",
							["BigWigsAnchor_width"] = 169.0000152587891,
							["nameplateOffsetY"] = 0,
							["BigWigsAnchor_x"] = 449.422189701927,
							["BigWigsEmphasizeAnchor_height"] = 20.00000190734863,
							["fontName"] = "Expressway",
							["BigWigsAnchor_height"] = 18.00000190734863,
							["visibleBarLimitEmph"] = 5,
							["visibleBarLimit"] = 5,
							["BigWigsAnchor_y"] = 226.1337294340228,
							["spacing"] = 3,
							["emphasizeTime"] = 6,
							["barStyle"] = "ElvUI",
							["texture"] = "Minimalist",
							["emphasizeRestart"] = false,
							["fontSizeEmph"] = 12,
							["BigWigsEmphasizeAnchor_x"] = 593.0668980413066,
							["BigWigsEmphasizeAnchor_y"] = 205.5110509832684,
							["interceptKey"] = "SHIFT",
							["BigWigsEmphasizeAnchor_width"] = 273.0001220703125,
						},
						[Rheal] = {
							["BigWigsEmphasizeAnchor_y"] = 275.9110743893507,
							["BigWigsAnchor_width"] = 169.0000152587891,
							["emphasizeRestart"] = false,
							["nameplateOffsetY"] = 0,
							["BigWigsEmphasizeAnchor_height"] = 18.99997901916504,
							["fontName"] = "Expressway",
							["BigWigsAnchor_height"] = 18.00000190734863,
							["visibleBarLimitEmph"] = 5,
							["visibleBarLimit"] = 5,
							["BigWigsAnchor_y"] = 226.1337728368017,
							["emphasizeGrowup"] = true,
							["spacing"] = 3,
							["emphasizeTime"] = 6,
							["barStyle"] = "ElvUI",
							["interceptKey"] = "SHIFT",
							["texture"] = "Minimalist",
							["BigWigsEmphasizeAnchor_width"] = 431.9999694824219,
							["BigWigsEmphasizeAnchor_x"] = 536.1782681915611,
							["outline"] = "OUTLINE",
							["BigWigsAnchor_x"] = 399.6442805104744,
							["fontSizeEmph"] = 12,
						},
					},
				},
				["BigWigs_Bosses_Stone Legion Generals"] = {
					["profiles"] = {
						[Rmain] = {
							[334009] = 3064567,
							[339690] = 3130103,
							[333387] = 3064567,
							[342985] = 3064567,
						},
					},
				},
				["BigWigs_Plugins_Super Emphasize"] = {},
				["BigWigs_Plugins_Wipe"] = {},
				["BigWigs_Plugins_Proximity"] = {
					["profiles"] = {
						[Rmain] = {
							["posx"] = 295.8228370242796,
							["fontName"] = "Expressway",
							["width"] = 150.0000610351563,
							["posy"] = 86.04485885435679,
							["height"] = 119.9999694824219,
							["disabled"] = true,
							["font"] = "Friz Quadrata TT",
						},
						[Rheal] = {
							["disabled"] = true,
							["posx"] = 295.8228370242796,
							["fontName"] = "Expressway",
							["width"] = 150.0000610351563,
							["font"] = "Friz Quadrata TT",
							["height"] = 119.9999694824219,
							["posy"] = 86.04485885435679,
						},
					},
				},
				["BigWigs_Bosses_Sludgefist"] = {
					["profiles"] = {
						[Rmain] = {
							[331209] = 3130103,
							[335293] = 3064567,
						},
					},
				},
				["BigWigs_Bosses_Sire Denathrius"] = {
					["profiles"] = {
						[Rmain] = {
							[326707] = 3064567,
							[327796] = 3064567,
						},
					},
				},
				["BigWigs_Plugins_Messages"] = {
					["profiles"] = {
						[Rmain] = {
							["outline"] = "OUTLINE",
							["fontSize"] = 24,
							["emphFontName"] = "Expressway",
							["emphFontSize"] = 34,
							["fadetime"] = 2.5,
							["emphPosition"] = {
								"TOP", -- [1]
								"TOP", -- [2]
								nil, -- [3]
								-120, -- [4]
							},
							["fontName"] = "Expressway",
							["displaytime"] = 3.5,
							["emphOutline"] = "OUTLINE",
							["normalPosition"] = {
								"CENTER", -- [1]
								"CENTER", -- [2]
								nil, -- [3]
								225, -- [4]
							},
						},
						[Rheal] = {
							["outline"] = "OUTLINE",
							["fontSize"] = 24,
							["emphFontName"] = "Expressway",
							["emphFontSize"] = 34,
							["fadetime"] = 2.5,
							["emphPosition"] = {
								"TOP", -- [1]
								"TOP", -- [2]
								nil, -- [3]
								-120, -- [4]
							},
							["fontName"] = "Expressway",
							["displaytime"] = 3.5,
							["emphOutline"] = "OUTLINE",
							["normalPosition"] = {
								"CENTER", -- [1]
								"CENTER", -- [2]
								nil, -- [3]
								225, -- [4]
							},
						},
					},
				},
				["BigWigs_Plugins_Statistics"] = {},
				["BigWigs_Plugins_Pull"] = {
					["profiles"] = {
						[Rmain] = {
							["endPullSound"] = "None",
							["voice"] = "enUS: Default (Female)",
						},
						[Rheal] = {
							["voice"] = "enUS: Default (Female)",
							["endPullSound"] = "None",
						},
					},
				},
				["BigWigs_Bosses_Huntsman Altimor"] = {
					["profiles"] = {
						[Rmain] = {
							[334945] = 3064567,
							[335114] = 3130103,
						},
					},
				},
			},
			["global"] = {
				["watchedMovies"] = {},
			},
			["profiles"] = {
				[Rheal] = {
					["showZoneMessages"] = false,
					["fakeDBMVersion"] = true,
					["flash"] = false,
				},
				[Rmain] = {
					["showZoneMessages"] = false,
					["flash"] = false,
					["fakeDBMVersion"] = true,
				},
				["Default"] = {},
			},
		}

		BigWigs.db:SetProfile(Rmain)

	elseif L1UI.TBC then

		BigWigs3DB = {
			["profileKeys"] = {
				[E.mynameRealm] = Tmain,
			},
			["namespaces"] = {
				["BigWigs_Plugins_Victory"] = {
					["profiles"] = {
						[Tmain] = {
							["bigwigsMsg"] = true,
							["blizzMsg"] = false,
						},
						[Theal] = {
							["bigwigsMsg"] = true,
							["blizzMsg"] = false,
						},
					},
				},
				["BigWigs_Plugins_Alt Power"] = {},
				["BigWigs_Plugins_Sounds"] = {},
				["BigWigs_Plugins_AutoReply"] = {
					["profiles"] = {
						[Tmain] = {
							["exitCombatOther"] = 3,
							["disabled"] = false,
							["modeOther"] = 2,
						},
						[Theal] = {
							["exitCombatOther"] = 3,
							["disabled"] = false,
							["modeOther"] = 2,
						},
					},
				},
				["BigWigs_Plugins_BossBlock"] = {},
				["BigWigs_Plugins_Countdown"] = {
					["profiles"] = {
						[Tmain] = {
							["outline"] = "OUTLINE",
							["fontName"] = "Expressway",
							["position"] = {
								nil, -- [1]
								nil, -- [2]
								nil, -- [3]
								-220, -- [4]
							},
						},
						[Theal] = {
							["outline"] = "OUTLINE",
							["fontName"] = "Expressway",
							["position"] = {
								nil, -- [1]
								nil, -- [2]
								nil, -- [3]
								-220, -- [4]
							},
						},
					},
				},
				["BigWigs_Plugins_AltPower"] = {
					["profiles"] = {
						[Tmain] = {
							["disabled"] = true,
						},
						[Theal] = {
							["disabled"] = true,
						},
					},
				},
				["BigWigs_Plugins_Colors"] = {},
				["BigWigs_Plugins_Raid Icons"] = {
					["profiles"] = {
						[Tmain] = {
							["disabled"] = true,
						},
						[Theal] = {
							["disabled"] = true,
						},
					},
				},
				["BigWigs_Plugins_InfoBox"] = {
					["profiles"] = {
						[Tmain] = {
							["posx"] = 962.8442941480171,
							["posy"] = 71.71141124165615,
						},
						[Theal] = {
							["posx"] = 962.8442941480171,
							["posy"] = 71.71141124165615,
						},
					},
				},
				["BigWigs_Plugins_Bars"] = {
					["profiles"] = {
						[Tmain] = {
							["outline"] = "OUTLINE",
							["BigWigsAnchor_width"] = 169.0000152587891,
							["nameplateOffsetY"] = 0,
							["BigWigsAnchor_x"] = 449.422189701927,
							["BigWigsEmphasizeAnchor_height"] = 20.00000190734863,
							["fontName"] = "Expressway",
							["BigWigsAnchor_height"] = 18.00000190734863,
							["visibleBarLimitEmph"] = 5,
							["visibleBarLimit"] = 5,
							["BigWigsAnchor_y"] = 226.1337294340228,
							["spacing"] = 3,
							["emphasizeTime"] = 6,
							["barStyle"] = "ElvUI",
							["texture"] = "Minimalist",
							["emphasizeRestart"] = false,
							["fontSizeEmph"] = 12,
							["BigWigsEmphasizeAnchor_x"] = 593.0668980413066,
							["BigWigsEmphasizeAnchor_y"] = 205.5110509832684,
							["interceptKey"] = "SHIFT",
							["BigWigsEmphasizeAnchor_width"] = 273.0001220703125,
						},
						[Theal] = {
							["BigWigsEmphasizeAnchor_y"] = 275.9110743893507,
							["BigWigsAnchor_width"] = 169.0000152587891,
							["emphasizeRestart"] = false,
							["nameplateOffsetY"] = 0,
							["BigWigsEmphasizeAnchor_height"] = 18.99997901916504,
							["fontName"] = "Expressway",
							["BigWigsAnchor_height"] = 18.00000190734863,
							["visibleBarLimitEmph"] = 5,
							["visibleBarLimit"] = 5,
							["BigWigsAnchor_y"] = 226.1337728368017,
							["emphasizeGrowup"] = true,
							["spacing"] = 3,
							["emphasizeTime"] = 6,
							["barStyle"] = "ElvUI",
							["interceptKey"] = "SHIFT",
							["texture"] = "Minimalist",
							["BigWigsEmphasizeAnchor_width"] = 431.9999694824219,
							["BigWigsEmphasizeAnchor_x"] = 536.1782681915611,
							["outline"] = "OUTLINE",
							["BigWigsAnchor_x"] = 399.6442805104744,
							["fontSizeEmph"] = 12,
						},
					},
				},
				["BigWigs_Plugins_Super Emphasize"] = {},
				["BigWigs_Plugins_Wipe"] = {},
				["BigWigs_Plugins_Proximity"] = {
					["profiles"] = {
						[Tmain] = {
							["posx"] = 295.8228370242796,
							["fontName"] = "Expressway",
							["width"] = 150.0000610351563,
							["posy"] = 86.04485885435679,
							["height"] = 119.9999694824219,
							["disabled"] = true,
							["font"] = "Friz Quadrata TT",
						},
						[Theal] = {
							["disabled"] = true,
							["posx"] = 295.8228370242796,
							["fontName"] = "Expressway",
							["width"] = 150.0000610351563,
							["font"] = "Friz Quadrata TT",
							["height"] = 119.9999694824219,
							["posy"] = 86.04485885435679,
						},
					},
				},
				["BigWigs_Plugins_Messages"] = {
					["profiles"] = {
						[Tmain] = {
							["outline"] = "OUTLINE",
							["fontSize"] = 24,
							["emphFontName"] = "Expressway",
							["emphFontSize"] = 34,
							["fadetime"] = 2.5,
							["emphPosition"] = {
								"TOP", -- [1]
								"TOP", -- [2]
								nil, -- [3]
								-120, -- [4]
							},
							["fontName"] = "Expressway",
							["displaytime"] = 3.5,
							["emphOutline"] = "OUTLINE",
							["normalPosition"] = {
								"CENTER", -- [1]
								"CENTER", -- [2]
								nil, -- [3]
								225, -- [4]
							},
						},
						[Theal] = {
							["outline"] = "OUTLINE",
							["fontSize"] = 24,
							["emphFontName"] = "Expressway",
							["emphFontSize"] = 34,
							["fadetime"] = 2.5,
							["emphPosition"] = {
								"TOP", -- [1]
								"TOP", -- [2]
								nil, -- [3]
								-120, -- [4]
							},
							["fontName"] = "Expressway",
							["displaytime"] = 3.5,
							["emphOutline"] = "OUTLINE",
							["normalPosition"] = {
								"CENTER", -- [1]
								"CENTER", -- [2]
								nil, -- [3]
								225, -- [4]
							},
						},
					},
				},
				["BigWigs_Plugins_Statistics"] = {},
				["BigWigs_Plugins_Pull"] = {
					["profiles"] = {
						[Tmain] = {
							["endPullSound"] = "None",
							["voice"] = "enUS: Default (Female)",
						},
						[Theal] = {
							["voice"] = "enUS: Default (Female)",
							["endPullSound"] = "None",
						},
					},
				},
			},
			["global"] = {
				["watchedMovies"] = {},
			},
			["profiles"] = {
				[Theal] = {
					["showZoneMessages"] = false,
					["fakeDBMVersion"] = true,
					["flash"] = false,
				},
				[Tmain] = {
					["showZoneMessages"] = false,
					["flash"] = false,
					["fakeDBMVersion"] = true,
				},
				["Default"] = {},
			},
		}

		BigWigs.db:SetProfile(Tmain)

	elseif L1UI.Classic then

		BigWigs3DB = {
			["profileKeys"] = {
				[E.mynameRealm] = Cmain,
			},
			["namespaces"] = {
				["BigWigs_Plugins_Victory"] = {
					["profiles"] = {
						[Cmain] = {
							["bigwigsMsg"] = true,
							["blizzMsg"] = false,
						},
						[Cheal] = {
							["bigwigsMsg"] = true,
							["blizzMsg"] = false,
						},
					},
				},
				["BigWigs_Plugins_Alt Power"] = {},
				["BigWigs_Plugins_Sounds"] = {},
				["BigWigs_Plugins_AutoReply"] = {
					["profiles"] = {
						[Cmain] = {
							["exitCombatOther"] = 3,
							["disabled"] = false,
							["modeOther"] = 2,
						},
						[Cheal] = {
							["exitCombatOther"] = 3,
							["disabled"] = false,
							["modeOther"] = 2,
						},
					},
				},
				["BigWigs_Plugins_BossBlock"] = {},
				["BigWigs_Plugins_Countdown"] = {
					["profiles"] = {
						[Cmain] = {
							["outline"] = "OUTLINE",
							["fontName"] = "Expressway",
							["position"] = {
								nil, -- [1]
								nil, -- [2]
								nil, -- [3]
								-220, -- [4]
							},
						},
						[Cheal] = {
							["outline"] = "OUTLINE",
							["fontName"] = "Expressway",
							["position"] = {
								nil, -- [1]
								nil, -- [2]
								nil, -- [3]
								-220, -- [4]
							},
						},
					},
				},
				["BigWigs_Plugins_AltPower"] = {
					["profiles"] = {
						[Cmain] = {
							["disabled"] = true,
						},
						[Cheal] = {
							["disabled"] = true,
						},
					},
				},
				["BigWigs_Plugins_Colors"] = {},
				["BigWigs_Plugins_Raid Icons"] = {
					["profiles"] = {
						[Cmain] = {
							["disabled"] = true,
						},
						[Cheal] = {
							["disabled"] = true,
						},
					},
				},
				["BigWigs_Plugins_InfoBox"] = {
					["profiles"] = {
						[Cmain] = {
							["posx"] = 962.8442941480171,
							["posy"] = 71.71141124165615,
						},
						[Cheal] = {
							["posx"] = 962.8442941480171,
							["posy"] = 71.71141124165615,
						},
					},
				},
				["BigWigs_Plugins_Bars"] = {
					["profiles"] = {
						[Cmain] = {
							["outline"] = "OUTLINE",
							["BigWigsAnchor_width"] = 169.0000152587891,
							["nameplateOffsetY"] = 0,
							["BigWigsAnchor_x"] = 449.422189701927,
							["BigWigsEmphasizeAnchor_height"] = 20.00000190734863,
							["fontName"] = "Expressway",
							["BigWigsAnchor_height"] = 18.00000190734863,
							["visibleBarLimitEmph"] = 5,
							["visibleBarLimit"] = 5,
							["BigWigsAnchor_y"] = 226.1337294340228,
							["spacing"] = 3,
							["emphasizeTime"] = 6,
							["barStyle"] = "ElvUI",
							["texture"] = "Minimalist",
							["emphasizeRestart"] = false,
							["fontSizeEmph"] = 12,
							["BigWigsEmphasizeAnchor_x"] = 593.0668980413066,
							["BigWigsEmphasizeAnchor_y"] = 205.5110509832684,
							["interceptKey"] = "SHIFT",
							["BigWigsEmphasizeAnchor_width"] = 273.0001220703125,
						},
						[Cheal] = {
							["BigWigsEmphasizeAnchor_y"] = 275.9110743893507,
							["BigWigsAnchor_width"] = 169.0000152587891,
							["emphasizeRestart"] = false,
							["nameplateOffsetY"] = 0,
							["BigWigsEmphasizeAnchor_height"] = 18.99997901916504,
							["fontName"] = "Expressway",
							["BigWigsAnchor_height"] = 18.00000190734863,
							["visibleBarLimitEmph"] = 5,
							["visibleBarLimit"] = 5,
							["BigWigsAnchor_y"] = 226.1337728368017,
							["emphasizeGrowup"] = true,
							["spacing"] = 3,
							["emphasizeTime"] = 6,
							["barStyle"] = "ElvUI",
							["interceptKey"] = "SHIFT",
							["texture"] = "Minimalist",
							["BigWigsEmphasizeAnchor_width"] = 431.9999694824219,
							["BigWigsEmphasizeAnchor_x"] = 536.1782681915611,
							["outline"] = "OUTLINE",
							["BigWigsAnchor_x"] = 399.6442805104744,
							["fontSizeEmph"] = 12,
						},
					},
				},
				["BigWigs_Plugins_Super Emphasize"] = {},
				["BigWigs_Plugins_Wipe"] = {},
				["BigWigs_Plugins_Proximity"] = {
					["profiles"] = {
						[Cmain] = {
							["posx"] = 295.8228370242796,
							["fontName"] = "Expressway",
							["width"] = 150.0000610351563,
							["posy"] = 86.04485885435679,
							["height"] = 119.9999694824219,
							["disabled"] = true,
							["font"] = "Friz Quadrata TT",
						},
						[Cheal] = {
							["disabled"] = true,
							["posx"] = 295.8228370242796,
							["fontName"] = "Expressway",
							["width"] = 150.0000610351563,
							["font"] = "Friz Quadrata TT",
							["height"] = 119.9999694824219,
							["posy"] = 86.04485885435679,
						},
					},
				},
				["BigWigs_Plugins_Messages"] = {
					["profiles"] = {
						[Cmain] = {
							["outline"] = "OUTLINE",
							["fontSize"] = 24,
							["emphFontName"] = "Expressway",
							["emphFontSize"] = 34,
							["fadetime"] = 2.5,
							["emphPosition"] = {
								"TOP", -- [1]
								"TOP", -- [2]
								nil, -- [3]
								-120, -- [4]
							},
							["fontName"] = "Expressway",
							["displaytime"] = 3.5,
							["emphOutline"] = "OUTLINE",
							["normalPosition"] = {
								"CENTER", -- [1]
								"CENTER", -- [2]
								nil, -- [3]
								225, -- [4]
							},
						},
						[Cheal] = {
							["outline"] = "OUTLINE",
							["fontSize"] = 24,
							["emphFontName"] = "Expressway",
							["emphFontSize"] = 34,
							["fadetime"] = 2.5,
							["emphPosition"] = {
								"TOP", -- [1]
								"TOP", -- [2]
								nil, -- [3]
								-120, -- [4]
							},
							["fontName"] = "Expressway",
							["displaytime"] = 3.5,
							["emphOutline"] = "OUTLINE",
							["normalPosition"] = {
								"CENTER", -- [1]
								"CENTER", -- [2]
								nil, -- [3]
								225, -- [4]
							},
						},
					},
				},
				["BigWigs_Plugins_Statistics"] = {},
				["BigWigs_Plugins_Pull"] = {
					["profiles"] = {
						[Cmain] = {
							["endPullSound"] = "None",
							["voice"] = "enUS: Default (Female)",
						},
						[Cheal] = {
							["voice"] = "enUS: Default (Female)",
							["endPullSound"] = "None",
						},
					},
				},
			},
			["global"] = {
				["watchedMovies"] = {},
			},
			["profiles"] = {
				[Cheal] = {
					["showZoneMessages"] = false,
					["fakeDBMVersion"] = true,
					["flash"] = false,
				},
				[Cmain] = {
					["showZoneMessages"] = false,
					["flash"] = false,
					["fakeDBMVersion"] = true,
				},
				["Default"] = {},
			},
		}

		BigWigs.db:SetProfile(Cmain)

	end

	BigWigsIconDB = {["hide"] = true}
	BigWigsStatsDB = {}
end
