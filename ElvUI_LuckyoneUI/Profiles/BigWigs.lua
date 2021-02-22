local L1UI, E, L, V, P, G = unpack(select(2, ...))

local LoadAddOn = LoadAddOn

--[[
	Copy Paste stuff
	[E.mynameRealm] = main,
]]

-- BigWigs profile setup
function L1UI:GetBigWigsProfile()

	local main = "Luckyone DPS/TANK"
	local heal = "Luckyone Healing"

	LoadAddOn("BigWigs")
	LoadAddOn("BigWigs_Options")

	BigWigs3DB = {
		["profileKeys"] = {
			[E.mynameRealm] = main,
		},
		["namespaces"] = {
				["BigWigs_Plugins_Victory"] = {
					["profiles"] = {
						[main] = {
							["bigwigsMsg"] = true,
							["blizzMsg"] = false,
						},
						[heal] = {
							["bigwigsMsg"] = true,
							["blizzMsg"] = false,
						},
					},
				},
				["BigWigs_Bosses_Sun King's Salvation"] = {
					["profiles"] = {
						[main] = {
							[328889] = 3064567,
							[325877] = 3130103,
							[328479] = 3064567,
							[326583] = 3130103,
						},
					},
				},
				["BigWigs_Plugins_Alt Power"] = {
				},
				["LibDualSpec-1.0"] = {
					["char"] = {
					},
				},
				["BigWigs_Bosses_Artificer Xy'mox"] = {
					["profiles"] = {
						[main] = {
							[327902] = 3064567,
							[328437] = 3130103,
							[340758] = 3130103,
						},
					},
				},
				["BigWigs_Plugins_Sounds"] = {
				},
				["BigWigs_Bosses_N'Zoth, the Corruptor"] = {
					["profiles"] = {
						[main] = {
							["custom_on_repeating_paranoia_say"] = false,
							[317066] = 966903,
							[315927] = 3064023,
							[316711] = 966903,
						},
						[heal] = {
							["custom_on_repeating_paranoia_say"] = false,
							[317066] = 966903,
							[315927] = 3064023,
							[316711] = 966903,
						},
					},
				},
				["BigWigs_Bosses_Lady Inerva Darkvein"] = {
					["profiles"] = {
						[main] = {
							[325769] = 3064567,
							["custom_on_stop_timers"] = false,
							[332664] = 3130103,
							["anima_tracking"] = 0,
						},
					},
				},
				["BigWigs_Plugins_AutoReply"] = {
					["profiles"] = {
						[main] = {
							["exitCombatOther"] = 3,
							["disabled"] = false,
							["modeOther"] = 2,
						},
						[heal] = {
							["exitCombatOther"] = 3,
							["disabled"] = false,
							["modeOther"] = 2,
						},
					},
				},
				["BigWigs_Bosses_Hungering Destroyer"] = {
					["profiles"] = {
						[main] = {
							[334522] = 3130103,
							[329298] = 3064567,
							[334266] = 3064567,
						},
					},
				},
				["BigWigs_Bosses_Shriekwing"] = {
					["profiles"] = {
						[main] = {
							[342863] = 3064567,
							[330711] = 3130103,
							[342074] = 3064567,
						},
					},
				},
				["BigWigs_Plugins_BossBlock"] = {
				},
				["BigWigs_Plugins_Countdown"] = {
				},
				["BigWigs_Plugins_AltPower"] = {
					["profiles"] = {
						[main] = {
							["disabled"] = true,
						},
					},
				},
				["BigWigs_Plugins_Raid Icons"] = {
					["profiles"] = {
						[main] = {
							["disabled"] = true,
						},
					},
				},
				["BigWigs_Plugins_Colors"] = {
				},
				["BigWigs_Plugins_Wipe"] = {
				},
				["BigWigs_Plugins_InfoBox"] = {
					["profiles"] = {
						[main] = {
							["posx"] = 295.8220717481199,
							["posy"] = 71.71141705270293,
						},
						[heal] = {
							["posx"] = 295.8220717481199,
							["posy"] = 71.71141705270293,
						},
					},
				},
				["BigWigs_Plugins_Bars"] = {
					["profiles"] = {
						[main] = {
							["outline"] = "OUTLINE",
							["visibleBarLimit"] = 5,
							["BigWigsAnchor_width"] = 169.0000152587891,
							["BigWigsAnchor_y"] = 225.4226617084714,
							["emphasizeRestart"] = false,
							["nameplateOffsetY"] = 0,
							["BigWigsAnchor_x"] = 448.7110785735968,
							["spacing"] = 4,
							["texture"] = "Solid",
							["barStyle"] = "ElvUI",
							["BigWigsEmphasizeAnchor_height"] = 20.0000171661377,
							["fontSizeEmph"] = 12,
							["fontName"] = "Expressway",
							["BigWigsAnchor_height"] = 18.00000190734863,
							["visibleBarLimitEmph"] = 5,
							["interceptKey"] = "SHIFT",
							["BigWigsEmphasizeAnchor_width"] = 240,
							["BigWigsEmphasizeAnchor_y"] = 602.31100047367,
							["BigWigsEmphasizeAnchor_x"] = 334.933432870781,
							["emphasizeTime"] = 6,
						},
						[heal] = {
							["BigWigsEmphasizeAnchor_y"] = 602.31100047367,
							["visibleBarLimit"] = 8,
							["BigWigsAnchor_width"] = 166.9999389648438,
							["BigWigsAnchor_y"] = 225.4226183056926,
							["emphasizeRestart"] = false,
							["nameplateOffsetY"] = 0,
							["BigWigsAnchor_x"] = 401.0662857532407,
							["spacing"] = 4,
							["texture"] = "Solid",
							["barStyle"] = "ElvUI",
							["BigWigsEmphasizeAnchor_height"] = 22.00003242492676,
							["BigWigsEmphasizeAnchor_width"] = 240,
							["fontName"] = "Expressway",
							["BigWigsAnchor_height"] = 20.0000171661377,
							["visibleBarLimitEmph"] = 5,
							["emphasizeTime"] = 6,
							["BigWigsEmphasizeAnchor_x"] = 334.933432870781,
							["outline"] = "OUTLINE",
							["interceptKey"] = "SHIFT",
							["fontSizeEmph"] = 12,
						},
					},
				},
				["BigWigs_Bosses_The Council of Blood"] = {
					["profiles"] = {
						[main] = {
							[327497] = 3064039,
							[331634] = 3064567,
							[337110] = 3064039,
							[330959] = 3064039,
							[346800] = 3130103,
							[330978] = 3064567,
						},
					},
				},
				["BigWigs_Plugins_Super Emphasize"] = {
				},
				["BigWigs_Bosses_Sire Denathrius"] = {
					["profiles"] = {
						[main] = {
							[326707] = 3064567,
							[327796] = 3064567,
						},
					},
				},
				["BigWigs_Plugins_Proximity"] = {
					["profiles"] = {
						[main] = {
							["posx"] = 448.0005827739697,
							["font"] = "Friz Quadrata TT",
							["disabled"] = true,
							["height"] = 119.9999694824219,
							["posy"] = 86.04480704615389,
							["fontName"] = "Expressway",
							["width"] = 150.0000610351563,
						},
						[heal] = {
							["posx"] = 448.0005827739697,
							["font"] = "Friz Quadrata TT",
							["disabled"] = true,
							["height"] = 119.9999694824219,
							["posy"] = 86.04480704615389,
							["fontName"] = "Expressway",
							["width"] = 150.0000610351563,
						},
					},
				},
				["BigWigs_Bosses_Sludgefist"] = {
					["profiles"] = {
						[main] = {
							[331209] = 3130103,
							[335293] = 3064567,
						},
					},
				},
				["BigWigs_Plugins_Statistics"] = {
				},
				["BigWigs_Plugins_Messages"] = {
					["profiles"] = {
						[main] = {
							["outline"] = "OUTLINE",
							["fontSize"] = 24,
							["sink20OutputSink"] = "None",
							["emphFontName"] = "Expressway",
							["emphFontSize"] = 34,
							["fadetime"] = 2.5,
							["emphOutline"] = "OUTLINE",
							["font"] = "Expressway",
							["usecolors"] = false,
							["displaytime"] = 3.5,
							["fontName"] = "Expressway",
						},
						[heal] = {
							["outline"] = "OUTLINE",
							["font"] = "Expressway",
							["sink20OutputSink"] = "None",
							["fadetime"] = 2.5,
							["usecolors"] = false,
							["fontName"] = "Expressway",
							["displaytime"] = 3.5,
						},
					},
				},
				["BigWigs_Bosses_Stone Legion Generals"] = {
					["profiles"] = {
						[main] = {
							[334009] = 3064567,
							[339690] = 3130103,
							[333387] = 3064567,
							[342985] = 3064567,
						},
					},
				},
				["BigWigs_Plugins_Pull"] = {
					["profiles"] = {
						[main] = {
							["voice"] = "English: Heroes of the Storm",
							["endPullSound"] = "None",
						},
						[heal] = {
							["voice"] = "English: Heroes of the Storm",
							["endPullSound"] = "None",
						},
					},
				},
				["BigWigs_Bosses_Huntsman Altimor"] = {
					["profiles"] = {
						[main] = {
							[334945] = 3064567,
							[335114] = 3130103,
						},
					},
				},
		},
		["global"] = {
			["watchedMovies"] = {
			},
		},
		["profiles"] = {
			[main] = {
				["showZoneMessages"] = false,
				["fakeDBMVersion"] = true,
				["flash"] = false,
			},
			[heal] = {
				["showZoneMessages"] = false,
				["flash"] = false,
				["fakeDBMVersion"] = true,
			},
		},
	}
	BigWigsIconDB = {
		["hide"] = true,
	}
	BigWigsStatsDB = {
	}

	BigWigs.db:SetProfile(main)
end
