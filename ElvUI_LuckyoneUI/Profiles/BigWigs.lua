local L1UI, E, L, V, P, G = unpack(select(2, ...))

local IsAddOnLoaded = IsAddOnLoaded
local LoadAddOn = LoadAddOn

-- BigWigs profiles
function L1UI:Setup_BigWigs(layout)
	if not IsAddOnLoaded('BigWigs') then return end

	-- Profile names
	local name, name_healing = "Luckyone DPS/TANK", "Luckyone Healing"

	-- Required to add profiles to BigWigs3DB
	if not IsAddOnLoaded('BigWigs_Core') then LoadAddOn('BigWigs_Core') end

	-- Required to add profiles to Plugins DB
	if not IsAddOnLoaded('BigWigs_Plugins') then LoadAddOn('BigWigs_Plugins') end

	if E.Retail then

		-- Profile creation
		BigWigs3DB.profiles = BigWigs3DB.profiles or {}

		BigWigs3DB.profiles.name = BigWigs3DB.profiles.name or {}
		BigWigs3DB.profiles.name.showZoneMessages = false
		BigWigs3DB.profiles.name.fakeDBMVersion = true
		BigWigs3DB.profiles.name.flash = false

		BigWigs3DB.profiles.name_healing = BigWigs3DB.profiles.name_healing or {}
		BigWigs3DB.profiles.name_healing.showZoneMessages = false
		BigWigs3DB.profiles.name_healing.fakeDBMVersion = true
		BigWigs3DB.profiles.name_healing.flash = false

		BigWigsIconDB.hide = true

		-- Profile data
		BigWigs3DB["namespaces"]["BigWigs_Plugins_Victory"]["profiles"] = BigWigs3DB["namespaces"]["BigWigs_Plugins_Victory"]["profiles"] or {}
		BigWigs3DB["namespaces"]["BigWigs_Plugins_Victory"]["profiles"][name] = {
			["bigwigsMsg"] = true,
			["blizzMsg"] = false,
		}
		BigWigs3DB["namespaces"]["BigWigs_Plugins_Victory"]["profiles"][name_healing] = {
			["bigwigsMsg"] = true,
			["blizzMsg"] = false,
		}
		BigWigs3DB["namespaces"]["BigWigs_Plugins_Sounds"]["profiles"] = BigWigs3DB["namespaces"]["BigWigs_Plugins_Sounds"]["profiles"] or {}
		BigWigs3DB["namespaces"]["BigWigs_Plugins_Sounds"]["profiles"][name] = {
			["media"] = {
				["underyou"] = "None",
			},
		}
		BigWigs3DB["namespaces"]["BigWigs_Plugins_Sounds"]["profiles"][name_healing] = {
			["media"] = {
				["underyou"] = "None",
			},
		}
		BigWigs3DB["namespaces"]["BigWigs_Plugins_Countdown"]["profiles"] = BigWigs3DB["namespaces"]["BigWigs_Plugins_Countdown"]["profiles"] or {}
		BigWigs3DB["namespaces"]["BigWigs_Plugins_Countdown"]["profiles"][name] = {
			["outline"] = "OUTLINE",
			["fontName"] = "Expressway",
			["position"] = {
				nil, -- [1]
				nil, -- [2]
				nil, -- [3]
				-220, -- [4]
			},
		}
		BigWigs3DB["namespaces"]["BigWigs_Plugins_Countdown"]["profiles"][name_healing] = {
			["outline"] = "OUTLINE",
			["fontName"] = "Expressway",
			["position"] = {
				nil, -- [1]
				nil, -- [2]
				nil, -- [3]
				-220, -- [4]
			},
		}
		BigWigs3DB["namespaces"]["BigWigs_Plugins_AltPower"]["profiles"] = BigWigs3DB["namespaces"]["BigWigs_Plugins_AltPower"]["profiles"] or {}
		BigWigs3DB["namespaces"]["BigWigs_Plugins_AltPower"]["profiles"][name] = {
			["disabled"] = true,
		}
		BigWigs3DB["namespaces"]["BigWigs_Plugins_AltPower"]["profiles"][name_healing] = {
			["disabled"] = true,
		}
		BigWigs3DB["namespaces"]["BigWigs_Plugins_AutoReply"]["profiles"] = BigWigs3DB["namespaces"]["BigWigs_Plugins_AutoReply"]["profiles"] or {}
		BigWigs3DB["namespaces"]["BigWigs_Plugins_AutoReply"]["profiles"][name] = {
			["exitCombatOther"] = 3,
			["disabled"] = false,
			["modeOther"] = 2,
		}
		BigWigs3DB["namespaces"]["BigWigs_Plugins_AutoReply"]["profiles"][name_healing] = {
			["exitCombatOther"] = 3,
			["disabled"] = false,
			["modeOther"] = 2,
		}
		BigWigs3DB["namespaces"]["BigWigs_Plugins_Colors"]["profiles"] = BigWigs3DB["namespaces"]["BigWigs_Plugins_Colors"]["profiles"] or {}
		BigWigs3DB["namespaces"]["BigWigs_Plugins_Colors"]["profiles"][name] = {
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
		}
		BigWigs3DB["namespaces"]["BigWigs_Plugins_Colors"]["profiles"][name_healing] = {
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
		}
		BigWigs3DB["namespaces"]["BigWigs_Plugins_Raid Icons"]["profiles"] = BigWigs3DB["namespaces"]["BigWigs_Plugins_Raid Icons"]["profiles"] or {}
		BigWigs3DB["namespaces"]["BigWigs_Plugins_Raid Icons"]["profiles"][name] = {
			["disabled"] = true,
		}
		BigWigs3DB["namespaces"]["BigWigs_Plugins_Raid Icons"]["profiles"][name_healing] = {
			["disabled"] = true,
		}
		BigWigs3DB["namespaces"]["BigWigs_Plugins_InfoBox"]["profiles"] = BigWigs3DB["namespaces"]["BigWigs_Plugins_InfoBox"]["profiles"] or {}
		BigWigs3DB["namespaces"]["BigWigs_Plugins_InfoBox"]["profiles"][name] = {
			["posx"] = 962.8442941480171,
			["posy"] = 71.71141124165615,
		}
		BigWigs3DB["namespaces"]["BigWigs_Plugins_InfoBox"]["profiles"][name_healing] = {
			["posx"] = 962.8442941480171,
			["posy"] = 71.71141124165615,
		}
		BigWigs3DB["namespaces"]["BigWigs_Plugins_Bars"]["profiles"] = BigWigs3DB["namespaces"]["BigWigs_Plugins_Bars"]["profiles"] or {}
		BigWigs3DB["namespaces"]["BigWigs_Plugins_Bars"]["profiles"][name] = {
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
		}
		BigWigs3DB["namespaces"]["BigWigs_Plugins_Bars"]["profiles"][name_healing] = {
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
		}
		BigWigs3DB["namespaces"]["BigWigs_Plugins_Messages"]["profiles"] = BigWigs3DB["namespaces"]["BigWigs_Plugins_Messages"]["profiles"] or {}
		BigWigs3DB["namespaces"]["BigWigs_Plugins_Messages"]["profiles"][name] = {
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
		}
		BigWigs3DB["namespaces"]["BigWigs_Plugins_Messages"]["profiles"][name_healing] = {
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
		}
		BigWigs3DB["namespaces"]["BigWigs_Plugins_Proximity"]["profiles"] = BigWigs3DB["namespaces"]["BigWigs_Plugins_Proximity"]["profiles"] or {}
		BigWigs3DB["namespaces"]["BigWigs_Plugins_Proximity"]["profiles"][name] = {
			["disabled"] = true,
			["posx"] = 295.8228370242796,
			["fontName"] = "Expressway",
			["width"] = 150.0000610351563,
			["font"] = "Friz Quadrata TT",
			["height"] = 119.9999694824219,
			["posy"] = 86.04485885435679,
		}
		BigWigs3DB["namespaces"]["BigWigs_Plugins_Proximity"]["profiles"][name_healing] = {
			["disabled"] = true,
			["posx"] = 295.8228370242796,
			["fontName"] = "Expressway",
			["width"] = 150.0000610351563,
			["font"] = "Friz Quadrata TT",
			["height"] = 119.9999694824219,
			["posy"] = 86.04485885435679,
		}
		BigWigs3DB["namespaces"]["BigWigs_Plugins_Pull"]["profiles"] = BigWigs3DB["namespaces"]["BigWigs_Plugins_Pull"]["profiles"] or {}
		BigWigs3DB["namespaces"]["BigWigs_Plugins_Pull"]["profiles"][name] = {
			["voice"] = "enUS: Default (Female)",
			["endPullSound"] = "None",
		}
		BigWigs3DB["namespaces"]["BigWigs_Plugins_Pull"]["profiles"][name_healing] = {
			["voice"] = "enUS: Default (Female)",
			["endPullSound"] = "None",
		}

	elseif E.TBC then

		-- Profile creation
		BigWigsClassicDB.profiles = BigWigsClassicDB.profiles or {}

		BigWigsClassicDB.profiles.name = BigWigsClassicDB.profiles.name or {}
		BigWigsClassicDB.profiles.name.showZoneMessages = false
		BigWigsClassicDB.profiles.name.fakeDBMVersion = true
		BigWigsClassicDB.profiles.name.flash = false
	
		BigWigsClassicDB.profiles.name_healing = BigWigsClassicDB.profiles.name_healing or {}
		BigWigsClassicDB.profiles.name_healing.showZoneMessages = false
		BigWigsClassicDB.profiles.name_healing.fakeDBMVersion = true
		BigWigsClassicDB.profiles.name_healing.flash = false
	
		BigWigsIconClassicDB.hide = true

		-- Profile data
		BigWigsClassicDB["namespaces"]["BigWigs_Plugins_Victory"]["profiles"] = BigWigsClassicDB["namespaces"]["BigWigs_Plugins_Victory"]["profiles"] or {}
		BigWigsClassicDB["namespaces"]["BigWigs_Plugins_Victory"]["profiles"][name] = {
			["bigwigsMsg"] = true,
			["blizzMsg"] = false,
		}
		BigWigsClassicDB["namespaces"]["BigWigs_Plugins_Victory"]["profiles"][name_healing] = {
			["bigwigsMsg"] = true,
			["blizzMsg"] = false,
		}
		BigWigsClassicDB["namespaces"]["BigWigs_Plugins_Sounds"]["profiles"] = BigWigsClassicDB["namespaces"]["BigWigs_Plugins_Sounds"]["profiles"] or {}
		BigWigsClassicDB["namespaces"]["BigWigs_Plugins_Sounds"]["profiles"][name] = {
			["media"] = {
				["underyou"] = "None",
			},
		}
		BigWigsClassicDB["namespaces"]["BigWigs_Plugins_Sounds"]["profiles"][name_healing] = {
			["media"] = {
				["underyou"] = "None",
			},
		}
		BigWigsClassicDB["namespaces"]["BigWigs_Plugins_Countdown"]["profiles"] = BigWigsClassicDB["namespaces"]["BigWigs_Plugins_Countdown"]["profiles"] or {}
		BigWigsClassicDB["namespaces"]["BigWigs_Plugins_Countdown"]["profiles"][name] = {
			["outline"] = "OUTLINE",
			["fontName"] = "Expressway",
			["position"] = {
				nil, -- [1]
				nil, -- [2]
				nil, -- [3]
				-220, -- [4]
			},
		}
		BigWigsClassicDB["namespaces"]["BigWigs_Plugins_Countdown"]["profiles"][name_healing] = {
			["outline"] = "OUTLINE",
			["fontName"] = "Expressway",
			["position"] = {
				nil, -- [1]
				nil, -- [2]
				nil, -- [3]
				-220, -- [4]
			},
		}
		BigWigsClassicDB["namespaces"]["BigWigs_Plugins_AutoReply"]["profiles"] = BigWigsClassicDB["namespaces"]["BigWigs_Plugins_AutoReply"]["profiles"] or {}
		BigWigsClassicDB["namespaces"]["BigWigs_Plugins_AutoReply"]["profiles"][name] = {
			["exitCombatOther"] = 3,
			["disabled"] = false,
			["modeOther"] = 2,
		}
		BigWigsClassicDB["namespaces"]["BigWigs_Plugins_AutoReply"]["profiles"][name_healing] = {
			["exitCombatOther"] = 3,
			["disabled"] = false,
			["modeOther"] = 2,
		}
		BigWigsClassicDB["namespaces"]["BigWigs_Plugins_Colors"]["profiles"] = BigWigsClassicDB["namespaces"]["BigWigs_Plugins_Colors"]["profiles"] or {}
		BigWigsClassicDB["namespaces"]["BigWigs_Plugins_Colors"]["profiles"][name] = {
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
		}
		BigWigsClassicDB["namespaces"]["BigWigs_Plugins_Colors"]["profiles"][name_healing] = {
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
		}
		BigWigsClassicDB["namespaces"]["BigWigs_Plugins_Raid Icons"]["profiles"] = BigWigsClassicDB["namespaces"]["BigWigs_Plugins_Raid Icons"]["profiles"] or {}
		BigWigsClassicDB["namespaces"]["BigWigs_Plugins_Raid Icons"]["profiles"][name] = {
			["disabled"] = true,
		}
		BigWigsClassicDB["namespaces"]["BigWigs_Plugins_Raid Icons"]["profiles"][name_healing] = {
			["disabled"] = true,
		}
		BigWigsClassicDB["namespaces"]["BigWigs_Plugins_InfoBox"]["profiles"] = BigWigsClassicDB["namespaces"]["BigWigs_Plugins_InfoBox"]["profiles"] or {}
		BigWigsClassicDB["namespaces"]["BigWigs_Plugins_InfoBox"]["profiles"][name] = {
			["posx"] = 962.845249009151,
			["posy"] = 71.8225277808051,
		}
		BigWigsClassicDB["namespaces"]["BigWigs_Plugins_InfoBox"]["profiles"][name_healing] = {
			["posx"] = 962.845249009151,
			["posy"] = 71.8225277808051,
		}
		BigWigsClassicDB["namespaces"]["BigWigs_Plugins_Bars"]["profiles"] = BigWigsClassicDB["namespaces"]["BigWigs_Plugins_Bars"]["profiles"] or {}
		BigWigsClassicDB["namespaces"]["BigWigs_Plugins_Bars"]["profiles"][name] = {
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
		}
		BigWigsClassicDB["namespaces"]["BigWigs_Plugins_Bars"]["profiles"][name_healing] = {
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
		}
		BigWigsClassicDB["namespaces"]["BigWigs_Plugins_Messages"]["profiles"] = BigWigsClassicDB["namespaces"]["BigWigs_Plugins_Messages"]["profiles"] or {}
		BigWigsClassicDB["namespaces"]["BigWigs_Plugins_Messages"]["profiles"][name] = {
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
		}
		BigWigsClassicDB["namespaces"]["BigWigs_Plugins_Messages"]["profiles"][name_healing] = {
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
		}
		BigWigsClassicDB["namespaces"]["BigWigs_Plugins_Proximity"]["profiles"] = BigWigsClassicDB["namespaces"]["BigWigs_Plugins_Proximity"]["profiles"] or {}
		BigWigsClassicDB["namespaces"]["BigWigs_Plugins_Proximity"]["profiles"][name] = {
			["objects"] = {
				["ability"] = false,
				["sound"] = false,
			},
			["posy"] = 86.0440613282958,
			["height"] = 120.000007629395,
			["posx"] = 295.821448135357,
			["fontName"] = "Expressway",
			["width"] = 139.999984741211,
		}
		BigWigsClassicDB["namespaces"]["BigWigs_Plugins_Proximity"]["profiles"][name_healing] = {
			["objects"] = {
				["ability"] = false,
				["sound"] = false,
			},
			["fontName"] = "Expressway",
			["width"] = 139.999984741211,
			["posy"] = 86.0440613282958,
			["posx"] = 295.821448135357,
		}
		BigWigsClassicDB["namespaces"]["BigWigs_Plugins_Pull"]["profiles"] = BigWigsClassicDB["namespaces"]["BigWigs_Plugins_Pull"]["profiles"] or {}
		BigWigsClassicDB["namespaces"]["BigWigs_Plugins_Pull"]["profiles"][name] = {
			["voice"] = "enUS: Default (Female)",
			["endPullSound"] = "None",
		}
		BigWigsClassicDB["namespaces"]["BigWigs_Plugins_Pull"]["profiles"][name_healing] = {
			["voice"] = "enUS: Default (Female)",
			["endPullSound"] = "None",
		}

	elseif E.Classic then

		-- Profile creation
		BigWigsClassicDB.profiles = BigWigsClassicDB.profiles or {}

		BigWigsClassicDB.profiles.name = BigWigsClassicDB.profiles.name or {}
		BigWigsClassicDB.profiles.name.showZoneMessages = false
		BigWigsClassicDB.profiles.name.fakeDBMVersion = true
		BigWigsClassicDB.profiles.name.flash = false
	
		BigWigsClassicDB.profiles.name_healing = BigWigsClassicDB.profiles.name_healing or {}
		BigWigsClassicDB.profiles.name_healing.showZoneMessages = false
		BigWigsClassicDB.profiles.name_healing.fakeDBMVersion = true
		BigWigsClassicDB.profiles.name_healing.flash = false
	
		BigWigsIconClassicDB.hide = true

		-- Profile data
		BigWigsClassicDB["namespaces"]["BigWigs_Plugins_Victory"]["profiles"] = BigWigsClassicDB["namespaces"]["BigWigs_Plugins_Victory"]["profiles"] or {}
		BigWigsClassicDB["namespaces"]["BigWigs_Plugins_Victory"]["profiles"][name] = {
			["bigwigsMsg"] = true,
			["blizzMsg"] = false,
		}
		BigWigsClassicDB["namespaces"]["BigWigs_Plugins_Victory"]["profiles"][name_healing] = {
			["bigwigsMsg"] = true,
			["blizzMsg"] = false,
		}
		BigWigsClassicDB["namespaces"]["BigWigs_Plugins_Sounds"]["profiles"] = BigWigsClassicDB["namespaces"]["BigWigs_Plugins_Sounds"]["profiles"] or {}
		BigWigsClassicDB["namespaces"]["BigWigs_Plugins_Sounds"]["profiles"][name] = {
			["media"] = {
				["underyou"] = "None",
			},
		}
		BigWigsClassicDB["namespaces"]["BigWigs_Plugins_Sounds"]["profiles"][name_healing] = {
			["media"] = {
				["underyou"] = "None",
			},
		}
		BigWigsClassicDB["namespaces"]["BigWigs_Plugins_Countdown"]["profiles"] = BigWigsClassicDB["namespaces"]["BigWigs_Plugins_Countdown"]["profiles"] or {}
		BigWigsClassicDB["namespaces"]["BigWigs_Plugins_Countdown"]["profiles"][name] = {
			["outline"] = "OUTLINE",
			["fontName"] = "Expressway",
			["position"] = {
				nil, -- [1]
				nil, -- [2]
				nil, -- [3]
				-220, -- [4]
			},
		}
		BigWigsClassicDB["namespaces"]["BigWigs_Plugins_Countdown"]["profiles"][name_healing] = {
			["outline"] = "OUTLINE",
			["fontName"] = "Expressway",
			["position"] = {
				nil, -- [1]
				nil, -- [2]
				nil, -- [3]
				-220, -- [4]
			},
		}
		BigWigsClassicDB["namespaces"]["BigWigs_Plugins_AutoReply"]["profiles"] = BigWigsClassicDB["namespaces"]["BigWigs_Plugins_AutoReply"]["profiles"] or {}
		BigWigsClassicDB["namespaces"]["BigWigs_Plugins_AutoReply"]["profiles"][name] = {
			["exitCombatOther"] = 3,
			["disabled"] = false,
			["modeOther"] = 2,
		}
		BigWigsClassicDB["namespaces"]["BigWigs_Plugins_AutoReply"]["profiles"][name_healing] = {
			["exitCombatOther"] = 3,
			["disabled"] = false,
			["modeOther"] = 2,
		}
		BigWigsClassicDB["namespaces"]["BigWigs_Plugins_Colors"]["profiles"] = BigWigsClassicDB["namespaces"]["BigWigs_Plugins_Colors"]["profiles"] or {}
		BigWigsClassicDB["namespaces"]["BigWigs_Plugins_Colors"]["profiles"][name] = {
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
		}
		BigWigsClassicDB["namespaces"]["BigWigs_Plugins_Colors"]["profiles"][name_healing] = {
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
		}
		BigWigsClassicDB["namespaces"]["BigWigs_Plugins_Raid Icons"]["profiles"] = BigWigsClassicDB["namespaces"]["BigWigs_Plugins_Raid Icons"]["profiles"] or {}
		BigWigsClassicDB["namespaces"]["BigWigs_Plugins_Raid Icons"]["profiles"][name] = {
			["disabled"] = true,
		}
		BigWigsClassicDB["namespaces"]["BigWigs_Plugins_Raid Icons"]["profiles"][name_healing] = {
			["disabled"] = true,
		}
		BigWigsClassicDB["namespaces"]["BigWigs_Plugins_InfoBox"]["profiles"] = BigWigsClassicDB["namespaces"]["BigWigs_Plugins_InfoBox"]["profiles"] or {}
		BigWigsClassicDB["namespaces"]["BigWigs_Plugins_InfoBox"]["profiles"][name] = {
			["posx"] = 962.845249009151,
			["posy"] = 71.8225277808051,
		}
		BigWigsClassicDB["namespaces"]["BigWigs_Plugins_InfoBox"]["profiles"][name_healing] = {
			["posx"] = 962.845249009151,
			["posy"] = 71.8225277808051,
		}
		BigWigsClassicDB["namespaces"]["BigWigs_Plugins_Bars"]["profiles"] = BigWigsClassicDB["namespaces"]["BigWigs_Plugins_Bars"]["profiles"] or {}
		BigWigsClassicDB["namespaces"]["BigWigs_Plugins_Bars"]["profiles"][name] = {
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
		}
		BigWigsClassicDB["namespaces"]["BigWigs_Plugins_Bars"]["profiles"][name_healing] = {
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
		}
		BigWigsClassicDB["namespaces"]["BigWigs_Plugins_Messages"]["profiles"] = BigWigsClassicDB["namespaces"]["BigWigs_Plugins_Messages"]["profiles"] or {}
		BigWigsClassicDB["namespaces"]["BigWigs_Plugins_Messages"]["profiles"][name] = {
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
		}
		BigWigsClassicDB["namespaces"]["BigWigs_Plugins_Messages"]["profiles"][name_healing] = {
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
		}
		BigWigsClassicDB["namespaces"]["BigWigs_Plugins_Proximity"]["profiles"] = BigWigsClassicDB["namespaces"]["BigWigs_Plugins_Proximity"]["profiles"] or {}
		BigWigsClassicDB["namespaces"]["BigWigs_Plugins_Proximity"]["profiles"][name] = {
			["objects"] = {
				["ability"] = false,
				["sound"] = false,
			},
			["posy"] = 86.0440613282958,
			["height"] = 120.000007629395,
			["posx"] = 295.821448135357,
			["fontName"] = "Expressway",
			["width"] = 139.999984741211,
		}
		BigWigsClassicDB["namespaces"]["BigWigs_Plugins_Proximity"]["profiles"][name_healing] = {
			["objects"] = {
				["ability"] = false,
				["sound"] = false,
			},
			["fontName"] = "Expressway",
			["width"] = 139.999984741211,
			["posy"] = 86.0440613282958,
			["posx"] = 295.821448135357,
		}
		BigWigsClassicDB["namespaces"]["BigWigs_Plugins_Pull"]["profiles"] = BigWigsClassicDB["namespaces"]["BigWigs_Plugins_Pull"]["profiles"] or {}
		BigWigsClassicDB["namespaces"]["BigWigs_Plugins_Pull"]["profiles"][name] = {
			["voice"] = "enUS: Default (Female)",
			["endPullSound"] = "None",
		}
		BigWigsClassicDB["namespaces"]["BigWigs_Plugins_Pull"]["profiles"][name_healing] = {
			["voice"] = "enUS: Default (Female)",
			["endPullSound"] = "None",
		}

	elseif E.Wrath then

		-- Profile creation
		BigWigsClassicDB.profiles = BigWigsClassicDB.profiles or {}

		BigWigsClassicDB.profiles.name = BigWigsClassicDB.profiles.name or {}
		BigWigsClassicDB.profiles.name.showZoneMessages = false
		BigWigsClassicDB.profiles.name.fakeDBMVersion = true
		BigWigsClassicDB.profiles.name.flash = false
	
		BigWigsClassicDB.profiles.name_healing = BigWigsClassicDB.profiles.name_healing or {}
		BigWigsClassicDB.profiles.name_healing.showZoneMessages = false
		BigWigsClassicDB.profiles.name_healing.fakeDBMVersion = true
		BigWigsClassicDB.profiles.name_healing.flash = false
	
		BigWigsIconClassicDB.hide = true

		-- Profile data
		BigWigsClassicDB["namespaces"]["BigWigs_Plugins_Victory"]["profiles"] = BigWigsClassicDB["namespaces"]["BigWigs_Plugins_Victory"]["profiles"] or {}
		BigWigsClassicDB["namespaces"]["BigWigs_Plugins_Victory"]["profiles"][name] = {
			["bigwigsMsg"] = true,
			["blizzMsg"] = false,
		}
		BigWigsClassicDB["namespaces"]["BigWigs_Plugins_Victory"]["profiles"][name_healing] = {
			["bigwigsMsg"] = true,
			["blizzMsg"] = false,
		}
		BigWigsClassicDB["namespaces"]["BigWigs_Plugins_Sounds"]["profiles"] = BigWigsClassicDB["namespaces"]["BigWigs_Plugins_Sounds"]["profiles"] or {}
		BigWigsClassicDB["namespaces"]["BigWigs_Plugins_Sounds"]["profiles"][name] = {
			["media"] = {
				["underyou"] = "None",
			},
		}
		BigWigsClassicDB["namespaces"]["BigWigs_Plugins_Sounds"]["profiles"][name_healing] = {
			["media"] = {
				["underyou"] = "None",
			},
		}
		BigWigsClassicDB["namespaces"]["BigWigs_Plugins_Countdown"]["profiles"] = BigWigsClassicDB["namespaces"]["BigWigs_Plugins_Countdown"]["profiles"] or {}
		BigWigsClassicDB["namespaces"]["BigWigs_Plugins_Countdown"]["profiles"][name] = {
			["outline"] = "OUTLINE",
			["fontName"] = "Expressway",
			["position"] = {
				nil, -- [1]
				nil, -- [2]
				nil, -- [3]
				-220, -- [4]
			},
		}
		BigWigsClassicDB["namespaces"]["BigWigs_Plugins_Countdown"]["profiles"][name_healing] = {
			["outline"] = "OUTLINE",
			["fontName"] = "Expressway",
			["position"] = {
				nil, -- [1]
				nil, -- [2]
				nil, -- [3]
				-220, -- [4]
			},
		}
		BigWigsClassicDB["namespaces"]["BigWigs_Plugins_AutoReply"]["profiles"] = BigWigsClassicDB["namespaces"]["BigWigs_Plugins_AutoReply"]["profiles"] or {}
		BigWigsClassicDB["namespaces"]["BigWigs_Plugins_AutoReply"]["profiles"][name] = {
			["exitCombatOther"] = 3,
			["disabled"] = false,
			["modeOther"] = 2,
		}
		BigWigsClassicDB["namespaces"]["BigWigs_Plugins_AutoReply"]["profiles"][name_healing] = {
			["exitCombatOther"] = 3,
			["disabled"] = false,
			["modeOther"] = 2,
		}
		BigWigsClassicDB["namespaces"]["BigWigs_Plugins_Colors"]["profiles"] = BigWigsClassicDB["namespaces"]["BigWigs_Plugins_Colors"]["profiles"] or {}
		BigWigsClassicDB["namespaces"]["BigWigs_Plugins_Colors"]["profiles"][name] = {
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
		}
		BigWigsClassicDB["namespaces"]["BigWigs_Plugins_Colors"]["profiles"][name_healing] = {
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
		}
		BigWigsClassicDB["namespaces"]["BigWigs_Plugins_Raid Icons"]["profiles"] = BigWigsClassicDB["namespaces"]["BigWigs_Plugins_Raid Icons"]["profiles"] or {}
		BigWigsClassicDB["namespaces"]["BigWigs_Plugins_Raid Icons"]["profiles"][name] = {
			["disabled"] = true,
		}
		BigWigsClassicDB["namespaces"]["BigWigs_Plugins_Raid Icons"]["profiles"][name_healing] = {
			["disabled"] = true,
		}
		BigWigsClassicDB["namespaces"]["BigWigs_Plugins_InfoBox"]["profiles"] = BigWigsClassicDB["namespaces"]["BigWigs_Plugins_InfoBox"]["profiles"] or {}
		BigWigsClassicDB["namespaces"]["BigWigs_Plugins_InfoBox"]["profiles"][name] = {
			["posx"] = 962.845249009151,
			["posy"] = 71.8225277808051,
		}
		BigWigsClassicDB["namespaces"]["BigWigs_Plugins_InfoBox"]["profiles"][name_healing] = {
			["posx"] = 962.845249009151,
			["posy"] = 71.8225277808051,
		}
		BigWigsClassicDB["namespaces"]["BigWigs_Plugins_Bars"]["profiles"] = BigWigsClassicDB["namespaces"]["BigWigs_Plugins_Bars"]["profiles"] or {}
		BigWigsClassicDB["namespaces"]["BigWigs_Plugins_Bars"]["profiles"][name] = {
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
		}
		BigWigsClassicDB["namespaces"]["BigWigs_Plugins_Bars"]["profiles"][name_healing] = {
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
		}
		BigWigsClassicDB["namespaces"]["BigWigs_Plugins_Messages"]["profiles"] = BigWigsClassicDB["namespaces"]["BigWigs_Plugins_Messages"]["profiles"] or {}
		BigWigsClassicDB["namespaces"]["BigWigs_Plugins_Messages"]["profiles"][name] = {
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
		}
		BigWigsClassicDB["namespaces"]["BigWigs_Plugins_Messages"]["profiles"][name_healing] = {
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
		}
		BigWigsClassicDB["namespaces"]["BigWigs_Plugins_Proximity"]["profiles"] = BigWigsClassicDB["namespaces"]["BigWigs_Plugins_Proximity"]["profiles"] or {}
		BigWigsClassicDB["namespaces"]["BigWigs_Plugins_Proximity"]["profiles"][name] = {
			["objects"] = {
				["ability"] = false,
				["sound"] = false,
			},
			["posy"] = 86.0440613282958,
			["height"] = 120.000007629395,
			["posx"] = 295.821448135357,
			["fontName"] = "Expressway",
			["width"] = 139.999984741211,
		}
		BigWigsClassicDB["namespaces"]["BigWigs_Plugins_Proximity"]["profiles"][name_healing] = {
			["objects"] = {
				["ability"] = false,
				["sound"] = false,
			},
			["fontName"] = "Expressway",
			["width"] = 139.999984741211,
			["posy"] = 86.0440613282958,
			["posx"] = 295.821448135357,
		}
		BigWigsClassicDB["namespaces"]["BigWigs_Plugins_Pull"]["profiles"] = BigWigsClassicDB["namespaces"]["BigWigs_Plugins_Pull"]["profiles"] or {}
		BigWigsClassicDB["namespaces"]["BigWigs_Plugins_Pull"]["profiles"][name] = {
			["voice"] = "enUS: Default (Female)",
			["endPullSound"] = "None",
		}
		BigWigsClassicDB["namespaces"]["BigWigs_Plugins_Pull"]["profiles"][name_healing] = {
			["voice"] = "enUS: Default (Female)",
			["endPullSound"] = "None",
		}

	end

	-- Role check and set profile
	if layout == 'main' then
		BigWigs.db:SetProfile(name)
	elseif layout == 'healing' then
		BigWigs.db:SetProfile(name_healing)
	end

	L1UI:Print(L["BigWigs profile has been set."])
end
