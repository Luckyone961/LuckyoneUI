local L1UI, E, L, V, P, G = unpack(select(2, ...))

-- BigWigs profile setup
function L1UI:GetBigWigsProfile()
	local main = "Luckyone DPS/TANK"
	local heal = "Luckyone Healing"

	LoadAddOn("BigWigs_Options")
	LoadAddOn("BigWigs")

	if BigWigs3DB['profiles'] == nil then BigWigs3DB['profiles'] = {} end

	if BigWigs3DB['profiles'][main] == nil then
		BigWigs3DB = {
			["global"] = {
				["watchedMovies"] = {
				},
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
							[325877] = 3130103,
							[328889] = 3064567,
							[326583] = 3130103,
							[328479] = 3064567,
						},
					},
				},
				["BigWigs_Plugins_Alt Power"] = {
					["profiles"] = {
						[main] = {
							["posx"] = 906.6650324131551,
							["font"] = "Friz Quadrata TT",
							["disabled"] = true,
							["fontName"] = "Expressway",
							["posy"] = 57.60318467573825,
						},
						[heal] = {
							["posx"] = 906.6650324131551,
							["posy"] = 57.60318467573825,
							["disabled"] = true,
							["fontName"] = "Expressway",
							["font"] = "Friz Quadrata TT",
						},
					},
				},
				["BigWigs_Plugins_BossBlock"] = {
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
				["BigWigs_Bosses_Lady Inerva Darkvein"] = {
					["profiles"] = {
						[main] = {
							["custom_on_stop_timers"] = false,
							[325769] = 3064567,
							[332664] = 3064567,
							["anima_tracking"] = 0,
						},
					},
				},
				["BigWigs_Plugins_Statistics"] = {
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
				["BigWigs_Bosses_Huntsman Altimor"] = {
					["profiles"] = {
						[main] = {
							[334945] = 3064567,
							[335114] = 3130103,
						},
					},
				},
				["BigWigs_Plugins_Raid Icons"] = {
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
							["BigWigsEmphasizeAnchor_y"] = 602.31100047367,
							["visibleBarLimit"] = 8,
							["BigWigsAnchor_width"] = 166.9999389648438,
							["BigWigsAnchor_y"] = 225.4226617084714,
							["emphasizeRestart"] = false,
							["nameplateOffsetY"] = 0,
							["BigWigsAnchor_x"] = 450.1333008302572,
							["spacing"] = 4,
							["fill"] = false,
							["interceptKey"] = "SHIFT",
							["texture"] = "Solid",
							["BigWigsEmphasizeAnchor_height"] = 22.00003242492676,
							["fontSizeEmph"] = 12,
							["growup"] = false,
							["monochrome"] = false,
							["fontName"] = "Expressway",
							["BigWigsAnchor_height"] = 20.0000171661377,
							["interceptMouse"] = false,
							["BigWigsEmphasizeAnchor_width"] = 240,
							["visibleBarLimitEmph"] = 5,
							["BigWigsEmphasizeAnchor_x"] = 334.933432870781,
							["outline"] = "OUTLINE",
							["onlyInterceptOnKeypress"] = true,
							["barStyle"] = "ElvUI",
							["emphasizeTime"] = 6,
						},
						[heal] = {
							["outline"] = "OUTLINE",
							["visibleBarLimit"] = 8,
							["BigWigsAnchor_width"] = 166.9999389648438,
							["BigWigsAnchor_y"] = 225.4226183056926,
							["emphasizeRestart"] = false,
							["nameplateOffsetY"] = 0,
							["BigWigsAnchor_x"] = 401.0662857532407,
							["spacing"] = 4,
							["fill"] = false,
							["interceptKey"] = "SHIFT",
							["emphasizeTime"] = 6,
							["BigWigsEmphasizeAnchor_height"] = 22.00003242492676,
							["barStyle"] = "ElvUI",
							["growup"] = false,
							["fontSizeEmph"] = 12,
							["fontName"] = "Expressway",
							["BigWigsAnchor_height"] = 20.0000171661377,
							["interceptMouse"] = false,
							["BigWigsEmphasizeAnchor_width"] = 240,
							["visibleBarLimitEmph"] = 5,
							["BigWigsEmphasizeAnchor_x"] = 334.933432870781,
							["BigWigsEmphasizeAnchor_y"] = 602.31100047367,
							["onlyInterceptOnKeypress"] = true,
							["monochrome"] = false,
							["texture"] = "Solid",
						},
					},
				},
				["BigWigs_Bosses_Stone Legion Generals"] = {
					["profiles"] = {
						[main] = {
							[334009] = 3064567,
							[342985] = 3064567,
							[339690] = 3130103,
							[333387] = 3064567,
						},
					},
				},
				["BigWigs_Plugins_Super Emphasize"] = {
					["profiles"] = {
						[main] = {
							["outline"] = "NONE",
							["fontSize"] = 20,
							["countdown"] = false,
							["fontName"] = "Expressway",
							["font"] = "Expressway",
						},
						[heal] = {
							["outline"] = "NONE",
							["fontSize"] = 20,
							["countdown"] = false,
							["fontName"] = "Expressway",
							["font"] = "Expressway",
						},
					},
				},
				["BigWigs_Bosses_Sludgefist"] = {
					["profiles"] = {
						[main] = {
							[335470] = 3064567,
							[331209] = 3130103,
							[335293] = 3064567,
						},
					},
				},
				["BigWigs_Plugins_Messages"] = {
					["profiles"] = {
						[main] = {
							["outline"] = "OUTLINE",
							["BWEmphasizeMessageAnchor_x"] = 610.844823843327,
							["BWEmphasizeCountdownMessageAnchor_x"] = 664.888818183208,
							["BWMessageAnchor_x"] = 610.843955801356,
							["usecolors"] = false,
							["fadetime"] = 2.5,
							["BWEmphasizeCountdownMessageAnchor_y"] = 383.288724558879,
							["font"] = "Expressway",
							["BWEmphasizeMessageAnchor_y"] = 576.711243456994,
							["BWMessageAnchor_y"] = 590.933460112719,
							["sink20OutputSink"] = "None",
							["fontName"] = "Expressway",
							["displaytime"] = 3.5,
						},
						[heal] = {
							["outline"] = "OUTLINE",
							["BWEmphasizeMessageAnchor_x"] = 610.844823843327,
							["BWEmphasizeCountdownMessageAnchor_x"] = 664.888818183208,
							["BWMessageAnchor_x"] = 610.843955801356,
							["usecolors"] = false,
							["fadetime"] = 2.5,
							["BWEmphasizeCountdownMessageAnchor_y"] = 383.288724558879,
							["font"] = "Expressway",
							["BWEmphasizeMessageAnchor_y"] = 576.711243456994,
							["BWMessageAnchor_y"] = 590.933460112719,
							["sink20OutputSink"] = "None",
							["fontName"] = "Expressway",
							["displaytime"] = 3.5,
						},
					},
				},
				["BigWigs_Bosses_Sire Denathrius"] = {
					["profiles"] = {
						[main] = {
							[326707] = 3064567,
							[327796] = 3064567,
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
							["posy"] = 86.04480704615389,
							["disabled"] = true,
							["height"] = 119.9999694824219,
							["font"] = "Friz Quadrata TT",
							["fontName"] = "Expressway",
							["width"] = 150.0000610351563,
						},
					},
				},
				["BigWigs_Bosses_The Council of Blood"] = {
					["profiles"] = {
						[main] = {
							[331634] = 3130103,
							[346800] = 3130103,
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
				["LibDualSpec-1.0"] = {
				},
			},
			["wipe80"] = true,
			["discord"] = 15,
			["profileKeys"] = {
				[E.mynameRealm] = main,
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
	end

	BigWigs.db:SetProfile(main)
end
