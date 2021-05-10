local L1UI, E, L, V, P, G = unpack(select(2, ...))

local LoadAddOn = LoadAddOn

-- BigWigs Profiles
function L1UI:GetBigWigsProfile()

	local Rmain, Rheal = "Luckyone D/T", "Luckyone H"
	local Tmain, Theal = "Luckyone TBC D/T", "Luckyone TBC H"
	local Cmain, Cheal = "Luckyone Classic D/T", "Luckyone Classic H"

	if L1UI.Retail then

		BigWigs3DB = {
			["profileKeys"] = {
				[E.mynameRealm] = Rmain,
			},
			["global"] = {
				["watchedMovies"] = {},
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
				["BigWigs_Plugins_Alt Power"] = {},
				["BigWigs_Plugins_BossBlock"] = {},
				["BigWigs_Plugins_Sounds"] = {
					["profiles"] = {
						[Rmain] = {
							["media"] = {
								["underyou"] = "None",
							},
						},
						[Rheal] = {
							["media"] = {
								["underyou"] = "None",
							},
						},
					},
				},
				["BigWigs_Plugins_Statistics"] = {},
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
				["BigWigs_Plugins_Colors"] = {
					["profiles"] = {
						[Rmain] = {
							["barBackground"] = {
								["BigWigs_Plugins_Colors"] = {
									["default"] = {
										0.05882352941176471, -- [1]
										0.05882352941176471, -- [2]
										0.05882352941176471, -- [3]
										0.2000000476837158, -- [4]
									},
								},
							},
						},
						[Rheal] = {
							["barBackground"] = {
								["BigWigs_Plugins_Colors"] = {
									["default"] = {
										0.05882352941176471, -- [1]
										0.05882352941176471, -- [2]
										0.05882352941176471, -- [3]
										0.25, -- [4]
									},
								},
							},
						},
					},
				},
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
							["BigWigsEmphasizeAnchor_y"] = 205.5110509832684,
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
							["interceptKey"] = "SHIFT",
							["texture"] = "Minimalist",
							["BigWigsEmphasizeAnchor_width"] = 273.0001220703125,
							["BigWigsEmphasizeAnchor_x"] = 593.0668980413066,
							["outline"] = "OUTLINE",
							["emphasizeRestart"] = false,
							["fontSizeEmph"] = 12,
						},
						[Rheal] = {
							["BigWigsEmphasizeAnchor_y"] = 212.6220103568448,
							["BigWigsAnchor_width"] = 169.0000152587891,
							["emphasizeRestart"] = false,
							["nameplateOffsetY"] = 0,
							["BigWigsEmphasizeAnchor_height"] = 18.99997901916504,
							["fontName"] = "Expressway",
							["BigWigsAnchor_height"] = 18.00000190734863,
							["visibleBarLimitEmph"] = 5,
							["visibleBarLimit"] = 5,
							["BigWigsAnchor_y"] = 226.1337728368017,
							["spacing"] = 3,
							["emphasizeTime"] = 6,
							["barStyle"] = "ElvUI",
							["interceptKey"] = "SHIFT",
							["texture"] = "Minimalist",
							["BigWigsEmphasizeAnchor_width"] = 249.0000152587891,
							["BigWigsEmphasizeAnchor_x"] = 859.7343090123832,
							["outline"] = "OUTLINE",
							["BigWigsAnchor_x"] = 399.6442805104744,
							["fontSizeEmph"] = 12,
						},
					},
				},
				["BigWigs_Plugins_Super Emphasize"] = {},
				["BigWigs_Plugins_Messages"] = {
					["profiles"] = {
						[Rmain] = {
							["outline"] = "OUTLINE",
							["fontSize"] = 24,
							["emphFontName"] = "Expressway",
							["emphFontSize"] = 34,
							["emphPosition"] = {
								"TOP", -- [1]
								"TOP", -- [2]
								nil, -- [3]
								-120, -- [4]
							},
							["fontName"] = "Expressway",
							["displaytime"] = 3.5,
							["emphOutline"] = "OUTLINE",
							["fadetime"] = 2.5,
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
				["BigWigs_Plugins_Proximity"] = {
					["profiles"] = {
						[Rmain] = {
							["disabled"] = true,
							["posx"] = 295.8228370242796,
							["fontName"] = "Expressway",
							["width"] = 150.0000610351563,
							["font"] = "Friz Quadrata TT",
							["height"] = 119.9999694824219,
							["posy"] = 86.04485885435679,
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
				["BigWigs_Plugins_Wipe"] = {},
				["BigWigs_Plugins_Pull"] = {
					["profiles"] = {
						[Rmain] = {
							["voice"] = "enUS: Default (Female)",
							["endPullSound"] = "None",
						},
						[Rheal] = {
							["voice"] = "enUS: Default (Female)",
							["endPullSound"] = "None",
						},
					},
				},
			},
			["profileKeys"] = {
				[E.mynameRealm] = Rmain,
			},
			["profiles"] = {
				[Rmain] = {
					["showZoneMessages"] = false,
					["fakeDBMVersion"] = true,
					["flash"] = false,
				},
				[Rheal] = {
					["showZoneMessages"] = false,
					["flash"] = false,
					["fakeDBMVersion"] = true,
				},
			},
		}
		BigWigsIconDB = {["hide"] = true}

		BigWigs.db:SetProfile(Rmain)

	elseif L1UI.TBC then

		BigWigsClassicDB = {
			["namespaces"] = {
				["profileKeys"] = {
					[E.mynameRealm] = Tmain,
				},
				["BigWigs_Plugins_Victory"] = {},
				["BigWigs_Plugins_Colors"] = {
					["profiles"] = {
						[Theal] = {
							["barBackground"] = {
								["BigWigs_Plugins_Colors"] = {
									["default"] = {
										0.0588235294117647, -- [1]
										0.0588235294117647, -- [2]
										0.0588235294117647, -- [3]
										0.25, -- [4]
									},
								},
							},
						},
						[Tmain] = {
							["barBackground"] = {
								["BigWigs_Plugins_Colors"] = {
									["default"] = {
										0.0588235294117647, -- [1]
										0.0588235294117647, -- [2]
										0.0588235294117647, -- [3]
										0.25, -- [4]
									},
								},
							},
						},
					},
				},
				["BigWigs_Plugins_Raid Icons"] = {
					["profiles"] = {
						[Theal] = {
							["disabled"] = true,
						},
						[Tmain] = {
							["disabled"] = true,
						},
					},
				},
				["BigWigs_Plugins_BossBlock"] = {},
				["BigWigs_Plugins_Bars"] = {
					["profiles"] = {
						[Theal] = {
							["outline"] = "OUTLINE",
							["BigWigsAnchor_width"] = 167,
							["BigWigsEmphasizeAnchor_height"] = 21.9999656677246,
							["fontName"] = "Expressway",
							["BigWigsAnchor_height"] = 19.9999866485596,
							["visibleBarLimitEmph"] = 8,
							["visibleBarLimit"] = 8,
							["BigWigsAnchor_y"] = 226.133186899287,
							["spacing"] = 3,
							["BigWigsEmphasizeAnchor_y"] = 212.622162266571,
							["texture"] = "Minimalist",
							["barStyle"] = "ElvUI",
							["BigWigsAnchor_x"] = 401.066155544904,
							["BigWigsEmphasizeAnchor_x"] = 861.867295175143,
							["BigWigsEmphasizeAnchor_width"] = 245.999984741211,
						},
						[Tmain] = {
							["outline"] = "OUTLINE",
							["BigWigsEmphasizeAnchor_height"] = 21.9999656677246,
							["BigWigsEmphasizeAnchor_x"] = 590.933564656316,
							["BigWigsAnchor_width"] = 167,
							["BigWigsAnchor_y"] = 226.133186899287,
							["fontName"] = "Expressway",
							["BigWigsAnchor_height"] = 19.9999866485596,
							["visibleBarLimit"] = 8,
							["barStyle"] = "ElvUI",
							["BigWigsAnchor_x"] = 450.844021333578,
							["spacing"] = 3,
							["BigWigsEmphasizeAnchor_y"] = 226.13344731596,
							["visibleBarLimitEmph"] = 8,
							["BigWigsEmphasizeAnchor_width"] = 281.000061035156,
							["texture"] = "Minimalist",
						},
					},
				},
				["BigWigs_Plugins_Wipe"] = {},
				["BigWigs_Plugins_Super Emphasize"] = {},
				["BigWigs_Plugins_Sounds"] = {},
				["BigWigs_Plugins_InfoBox"] = {
					["profiles"] = {
						[Theal] = {
							["posx"] = 962.845249009151,
							["posy"] = 71.8225277808051,
						},
						[Tmain] = {
							["posx"] = 962.845249009151,
							["posy"] = 71.8225277808051,
						},
					},
				},
				["BigWigs_Plugins_Proximity"] = {
					["profiles"] = {
						[Theal] = {
							["objects"] = {
								["ability"] = false,
								["sound"] = false,
							},
							["fontName"] = "Expressway",
							["width"] = 139.999984741211,
							["posy"] = 86.0440613282958,
							["posx"] = 295.821448135357,
						},
						[Tmain] = {
							["objects"] = {
								["ability"] = false,
								["sound"] = false,
							},
							["posy"] = 86.0440613282958,
							["height"] = 120.000007629395,
							["posx"] = 295.821448135357,
							["fontName"] = "Expressway",
							["width"] = 139.999984741211,
						},
					},
				},
				["BigWigs_Plugins_Statistics"] = {},
				["BigWigs_Plugins_Messages"] = {
					["profiles"] = {
						[Theal] = {
							["outline"] = "OUTLINE",
							["fontSize"] = 22,
							["emphFontName"] = "Expressway",
							["fontName"] = "Expressway",
							["emphOutline"] = "OUTLINE",
						},
						[Tmain] = {
							["outline"] = "OUTLINE",
							["fontSize"] = 22,
							["emphFontName"] = "Expressway",
							["fontName"] = "Expressway",
							["emphOutline"] = "OUTLINE",
						},
					},
				},
				["BigWigs_Plugins_AutoReply"] = {
					["profiles"] = {
						[Theal] = {
							["exitCombatOther"] = 3,
							["disabled"] = false,
							["modeOther"] = 2,
						},
						[Tmain] = {
							["exitCombatOther"] = 3,
							["disabled"] = false,
							["modeOther"] = 2,
						},
					},
				},
				["BigWigs_Plugins_Pull"] = {},
				["BigWigs_Plugins_Countdown"] = {
					["profiles"] = {
						[Theal] = {
							["outline"] = "OUTLINE",
							["fontName"] = "Expressway",
						},
						[Tmain] = {
							["outline"] = "OUTLINE",
							["fontName"] = "Expressway",
						},
					},
				},
			},
			["profiles"] = {
				[Theal] = {
					["fakeDBMVersion"] = true,
				},
				[Tmain] = {
					["fakeDBMVersion"] = true,
				},
			},
		}
		BigWigsIconClassicDB = {["hide"] = true}

		BigWigs.db:SetProfile(Tmain)

	elseif L1UI.Classic then

		BigWigsClassicDB = {
			["namespaces"] = {
				["profileKeys"] = {
					[E.mynameRealm] = Cmain,
				},
				["BigWigs_Plugins_Victory"] = {},
				["BigWigs_Plugins_Colors"] = {
					["profiles"] = {
						[Cheal] = {
							["barBackground"] = {
								["BigWigs_Plugins_Colors"] = {
									["default"] = {
										0.0588235294117647, -- [1]
										0.0588235294117647, -- [2]
										0.0588235294117647, -- [3]
										0.25, -- [4]
									},
								},
							},
						},
						[Cmain] = {
							["barBackground"] = {
								["BigWigs_Plugins_Colors"] = {
									["default"] = {
										0.0588235294117647, -- [1]
										0.0588235294117647, -- [2]
										0.0588235294117647, -- [3]
										0.25, -- [4]
									},
								},
							},
						},
					},
				},
				["BigWigs_Plugins_Raid Icons"] = {
					["profiles"] = {
						[Cheal] = {
							["disabled"] = true,
						},
						[Cmain] = {
							["disabled"] = true,
						},
					},
				},
				["BigWigs_Plugins_BossBlock"] = {},
				["BigWigs_Plugins_Bars"] = {
					["profiles"] = {
						[Cheal] = {
							["outline"] = "OUTLINE",
							["BigWigsAnchor_width"] = 167,
							["BigWigsEmphasizeAnchor_height"] = 21.9999656677246,
							["fontName"] = "Expressway",
							["BigWigsAnchor_height"] = 19.9999866485596,
							["visibleBarLimitEmph"] = 8,
							["visibleBarLimit"] = 8,
							["BigWigsAnchor_y"] = 226.133186899287,
							["spacing"] = 3,
							["BigWigsEmphasizeAnchor_y"] = 212.622162266571,
							["texture"] = "Minimalist",
							["barStyle"] = "ElvUI",
							["BigWigsAnchor_x"] = 401.066155544904,
							["BigWigsEmphasizeAnchor_x"] = 861.867295175143,
							["BigWigsEmphasizeAnchor_width"] = 245.999984741211,
						},
						[Cmain] = {
							["outline"] = "OUTLINE",
							["BigWigsEmphasizeAnchor_height"] = 21.9999656677246,
							["BigWigsEmphasizeAnchor_x"] = 590.933564656316,
							["BigWigsAnchor_width"] = 167,
							["BigWigsAnchor_y"] = 226.133186899287,
							["fontName"] = "Expressway",
							["BigWigsAnchor_height"] = 19.9999866485596,
							["visibleBarLimit"] = 8,
							["barStyle"] = "ElvUI",
							["BigWigsAnchor_x"] = 450.844021333578,
							["spacing"] = 3,
							["BigWigsEmphasizeAnchor_y"] = 226.13344731596,
							["visibleBarLimitEmph"] = 8,
							["BigWigsEmphasizeAnchor_width"] = 281.000061035156,
							["texture"] = "Minimalist",
						},
					},
				},
				["BigWigs_Plugins_Wipe"] = {},
				["BigWigs_Plugins_Super Emphasize"] = {},
				["BigWigs_Plugins_Sounds"] = {},
				["BigWigs_Plugins_InfoBox"] = {
					["profiles"] = {
						[Cheal] = {
							["posx"] = 962.845249009151,
							["posy"] = 71.8225277808051,
						},
						[Cmain] = {
							["posx"] = 962.845249009151,
							["posy"] = 71.8225277808051,
						},
					},
				},
				["BigWigs_Plugins_Proximity"] = {
					["profiles"] = {
						[Cheal] = {
							["objects"] = {
								["ability"] = false,
								["sound"] = false,
							},
							["fontName"] = "Expressway",
							["width"] = 139.999984741211,
							["posy"] = 86.0440613282958,
							["posx"] = 295.821448135357,
						},
						[Cmain] = {
							["objects"] = {
								["ability"] = false,
								["sound"] = false,
							},
							["posy"] = 86.0440613282958,
							["height"] = 120.000007629395,
							["posx"] = 295.821448135357,
							["fontName"] = "Expressway",
							["width"] = 139.999984741211,
						},
					},
				},
				["BigWigs_Plugins_Statistics"] = {},
				["BigWigs_Plugins_Messages"] = {
					["profiles"] = {
						[Cheal] = {
							["outline"] = "OUTLINE",
							["fontSize"] = 22,
							["emphFontName"] = "Expressway",
							["fontName"] = "Expressway",
							["emphOutline"] = "OUTLINE",
						},
						[Cmain] = {
							["outline"] = "OUTLINE",
							["fontSize"] = 22,
							["emphFontName"] = "Expressway",
							["fontName"] = "Expressway",
							["emphOutline"] = "OUTLINE",
						},
					},
				},
				["BigWigs_Plugins_AutoReply"] = {
					["profiles"] = {
						[Cheal] = {
							["exitCombatOther"] = 3,
							["disabled"] = false,
							["modeOther"] = 2,
						},
						[Cmain] = {
							["exitCombatOther"] = 3,
							["disabled"] = false,
							["modeOther"] = 2,
						},
					},
				},
				["BigWigs_Plugins_Pull"] = {},
				["BigWigs_Plugins_Countdown"] = {
					["profiles"] = {
						[Cheal] = {
							["outline"] = "OUTLINE",
							["fontName"] = "Expressway",
						},
						[Cmain] = {
							["outline"] = "OUTLINE",
							["fontName"] = "Expressway",
						},
					},
				},
			},
			["profiles"] = {
				[Cheal] = {
					["fakeDBMVersion"] = true,
				},
				[Cmain] = {
					["fakeDBMVersion"] = true,
				},
			},
		}
		BigWigsIconClassicDB = {["hide"] = true}

		BigWigs.db:SetProfile(Cmain)

	end
end
