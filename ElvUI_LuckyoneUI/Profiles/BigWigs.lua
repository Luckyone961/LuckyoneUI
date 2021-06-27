local L1UI, E, L, V, P, G = unpack(select(2, ...))

local _G = _G
local LoadAddOn = LoadAddOn

-- BigWigs Profiles
function L1UI:GetBigWigsProfile()

	-- Profile Names
	local Rmain, Rheal = "Luckyone D/T", "Luckyone H"
	local Tmain, Theal = "Luckyone TBC D/T", "Luckyone TBC H"
	local Cmain, Cheal = "Luckyone Classic D/T", "Luckyone Classic H"

	-- TEMPORARY
	-- Get rid of the chat print on LoadAddOn for now
	if not IsAddOnLoaded("BigWigs_Options") then
		local this = _G.DEFAULT_CHAT_FRAME:GetName()

		LoadAddOn("BigWigs_Options")
		_G[this]:Clear()
	end

	if L1UI.Retail then

		------------------------------------------------------------------
		------------------------ Profile Creation ------------------------
		------------------------------------------------------------------
		BigWigs3DB["profiles"] = BigWigs3DB["profiles"] or {}

		BigWigs3DB["profiles"][Rmain] = BigWigs3DB["profiles"][Rmain] or {}
		BigWigs3DB["profiles"][Rmain]["showZoneMessages"] = false
		BigWigs3DB["profiles"][Rmain]["fakeDBMVersion"] = true
		BigWigs3DB["profiles"][Rmain]["flash"] = false

		BigWigs3DB["profiles"][Rheal] = BigWigs3DB["profiles"][Rheal] or {}
		BigWigs3DB["profiles"][Rheal]["showZoneMessages"] = false
		BigWigs3DB["profiles"][Rheal]["fakeDBMVersion"] = true
		BigWigs3DB["profiles"][Rheal]["flash"] = false

		BigWigsIconDB["hide"] = true
		------------------------------------------------------------------
		-------------------------- Profile Data --------------------------
		------------------------------------------------------------------
		BigWigs3DB["namespaces"]["BigWigs_Plugins_Victory"]["profiles"] = BigWigs3DB["namespaces"]["BigWigs_Plugins_Victory"]["profiles"] or {}
		BigWigs3DB["namespaces"]["BigWigs_Plugins_Victory"]["profiles"][Rmain] = {
			["bigwigsMsg"] = true,
			["blizzMsg"] = false,
		}
		BigWigs3DB["namespaces"]["BigWigs_Plugins_Victory"]["profiles"][Rheal] = {
			["bigwigsMsg"] = true,
			["blizzMsg"] = false,
		}
		BigWigs3DB["namespaces"]["BigWigs_Plugins_Sounds"]["profiles"] = BigWigs3DB["namespaces"]["BigWigs_Plugins_Sounds"]["profiles"] or {}
		BigWigs3DB["namespaces"]["BigWigs_Plugins_Sounds"]["profiles"][Rmain] = {
			["media"] = {
				["underyou"] = "None",
			},
		}
		BigWigs3DB["namespaces"]["BigWigs_Plugins_Sounds"]["profiles"][Rheal] = {
			["media"] = {
				["underyou"] = "None",
			},
		}
		BigWigs3DB["namespaces"]["BigWigs_Plugins_Countdown"]["profiles"] = BigWigs3DB["namespaces"]["BigWigs_Plugins_Countdown"]["profiles"] or {}
		BigWigs3DB["namespaces"]["BigWigs_Plugins_Countdown"]["profiles"][Rmain] = {
			["outline"] = "OUTLINE",
			["fontName"] = "Expressway",
			["position"] = {
				nil, -- [1]
				nil, -- [2]
				nil, -- [3]
				-220, -- [4]
			},
		}
		BigWigs3DB["namespaces"]["BigWigs_Plugins_Countdown"]["profiles"][Rheal] = {
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
		BigWigs3DB["namespaces"]["BigWigs_Plugins_AltPower"]["profiles"][Rmain] = {
			["disabled"] = true,
		}
		BigWigs3DB["namespaces"]["BigWigs_Plugins_AltPower"]["profiles"][Rheal] = {
			["disabled"] = true,
		}
		BigWigs3DB["namespaces"]["BigWigs_Plugins_AutoReply"]["profiles"] = BigWigs3DB["namespaces"]["BigWigs_Plugins_AutoReply"]["profiles"] or {}
		BigWigs3DB["namespaces"]["BigWigs_Plugins_AutoReply"]["profiles"][Rmain] = {
			["exitCombatOther"] = 3,
			["disabled"] = false,
			["modeOther"] = 2,
		}
		BigWigs3DB["namespaces"]["BigWigs_Plugins_AutoReply"]["profiles"][Rheal] = {
			["exitCombatOther"] = 3,
			["disabled"] = false,
			["modeOther"] = 2,
		}
		BigWigs3DB["namespaces"]["BigWigs_Plugins_Colors"]["profiles"] = BigWigs3DB["namespaces"]["BigWigs_Plugins_Colors"]["profiles"] or {}
		BigWigs3DB["namespaces"]["BigWigs_Plugins_Colors"]["profiles"][Rmain] = {
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
		BigWigs3DB["namespaces"]["BigWigs_Plugins_Colors"]["profiles"][Rheal] = {
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
		BigWigs3DB["namespaces"]["BigWigs_Plugins_Raid Icons"]["profiles"][Rmain] = {
			["disabled"] = true,
		}
		BigWigs3DB["namespaces"]["BigWigs_Plugins_Raid Icons"]["profiles"][Rheal] = {
			["disabled"] = true,
		}
		BigWigs3DB["namespaces"]["BigWigs_Plugins_InfoBox"]["profiles"] = BigWigs3DB["namespaces"]["BigWigs_Plugins_InfoBox"]["profiles"] or {}
		BigWigs3DB["namespaces"]["BigWigs_Plugins_InfoBox"]["profiles"][Rmain] = {
			["posx"] = 962.8442941480171,
			["posy"] = 71.71141124165615,
		}
		BigWigs3DB["namespaces"]["BigWigs_Plugins_InfoBox"]["profiles"][Rheal] = {
			["posx"] = 962.8442941480171,
			["posy"] = 71.71141124165615,
		}
		BigWigs3DB["namespaces"]["BigWigs_Plugins_Bars"]["profiles"] = BigWigs3DB["namespaces"]["BigWigs_Plugins_Bars"]["profiles"] or {}
		BigWigs3DB["namespaces"]["BigWigs_Plugins_Bars"]["profiles"][Rmain] = {
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
		BigWigs3DB["namespaces"]["BigWigs_Plugins_Bars"]["profiles"][Rheal] = {
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
		BigWigs3DB["namespaces"]["BigWigs_Plugins_Messages"]["profiles"][Rmain] = {
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
		BigWigs3DB["namespaces"]["BigWigs_Plugins_Messages"]["profiles"][Rheal] = {
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
		BigWigs3DB["namespaces"]["BigWigs_Plugins_Proximity"]["profiles"][Rmain] = {
			["disabled"] = true,
			["posx"] = 295.8228370242796,
			["fontName"] = "Expressway",
			["width"] = 150.0000610351563,
			["font"] = "Friz Quadrata TT",
			["height"] = 119.9999694824219,
			["posy"] = 86.04485885435679,
		}
		BigWigs3DB["namespaces"]["BigWigs_Plugins_Proximity"]["profiles"][Rheal] = {
			["disabled"] = true,
			["posx"] = 295.8228370242796,
			["fontName"] = "Expressway",
			["width"] = 150.0000610351563,
			["font"] = "Friz Quadrata TT",
			["height"] = 119.9999694824219,
			["posy"] = 86.04485885435679,
		}
		BigWigs3DB["namespaces"]["BigWigs_Plugins_Pull"]["profiles"] = BigWigs3DB["namespaces"]["BigWigs_Plugins_Pull"]["profiles"] or {}
		BigWigs3DB["namespaces"]["BigWigs_Plugins_Pull"]["profiles"][Rmain] = {
			["voice"] = "enUS: Default (Female)",
			["endPullSound"] = "None",
		}
		BigWigs3DB["namespaces"]["BigWigs_Plugins_Pull"]["profiles"][Rheal] = {
			["voice"] = "enUS: Default (Female)",
			["endPullSound"] = "None",
		}

		-- Set the profile
		BigWigs.db:SetProfile(Rmain)

	elseif L1UI.TBC then

		------------------------------------------------------------------
		------------------------ Profile Creation ------------------------
		------------------------------------------------------------------
		BigWigsClassicDB["profiles"] = BigWigsClassicDB["profiles"] or {}

		BigWigsClassicDB["profiles"][Tmain] = BigWigsClassicDB["profiles"][Tmain] or {}
		BigWigsClassicDB["profiles"][Tmain]["showZoneMessages"] = false
		BigWigsClassicDB["profiles"][Tmain]["fakeDBMVersion"] = true
		BigWigsClassicDB["profiles"][Tmain]["flash"] = false

		BigWigsClassicDB["profiles"][Theal] = BigWigsClassicDB["profiles"][Theal] or {}
		BigWigsClassicDB["profiles"][Theal]["showZoneMessages"] = false
		BigWigsClassicDB["profiles"][Theal]["fakeDBMVersion"] = true
		BigWigsClassicDB["profiles"][Theal]["flash"] = false

		BigWigsIconClassicDB["hide"] = true
		------------------------------------------------------------------
		-------------------------- Profile Data --------------------------
		------------------------------------------------------------------
		BigWigsClassicDB["namespaces"]["BigWigs_Plugins_Victory"]["profiles"] = BigWigsClassicDB["namespaces"]["BigWigs_Plugins_Victory"]["profiles"] or {}
		BigWigsClassicDB["namespaces"]["BigWigs_Plugins_Victory"]["profiles"][Tmain] = {
			["bigwigsMsg"] = true,
			["blizzMsg"] = false,
		}
		BigWigsClassicDB["namespaces"]["BigWigs_Plugins_Victory"]["profiles"][Theal] = {
			["bigwigsMsg"] = true,
			["blizzMsg"] = false,
		}
		BigWigsClassicDB["namespaces"]["BigWigs_Plugins_Sounds"]["profiles"] = BigWigsClassicDB["namespaces"]["BigWigs_Plugins_Sounds"]["profiles"] or {}
		BigWigsClassicDB["namespaces"]["BigWigs_Plugins_Sounds"]["profiles"][Tmain] = {
			["media"] = {
				["underyou"] = "None",
			},
		}
		BigWigsClassicDB["namespaces"]["BigWigs_Plugins_Sounds"]["profiles"][Theal] = {
			["media"] = {
				["underyou"] = "None",
			},
		}
		BigWigsClassicDB["namespaces"]["BigWigs_Plugins_Countdown"]["profiles"] = BigWigsClassicDB["namespaces"]["BigWigs_Plugins_Countdown"]["profiles"] or {}
		BigWigsClassicDB["namespaces"]["BigWigs_Plugins_Countdown"]["profiles"][Tmain] = {
			["outline"] = "OUTLINE",
			["fontName"] = "Expressway",
			["position"] = {
				nil, -- [1]
				nil, -- [2]
				nil, -- [3]
				-220, -- [4]
			},
		}
		BigWigsClassicDB["namespaces"]["BigWigs_Plugins_Countdown"]["profiles"][Theal] = {
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
		BigWigsClassicDB["namespaces"]["BigWigs_Plugins_AutoReply"]["profiles"][Tmain] = {
			["exitCombatOther"] = 3,
			["disabled"] = false,
			["modeOther"] = 2,
		}
		BigWigsClassicDB["namespaces"]["BigWigs_Plugins_AutoReply"]["profiles"][Theal] = {
			["exitCombatOther"] = 3,
			["disabled"] = false,
			["modeOther"] = 2,
		}
		BigWigsClassicDB["namespaces"]["BigWigs_Plugins_Colors"]["profiles"] = BigWigsClassicDB["namespaces"]["BigWigs_Plugins_Colors"]["profiles"] or {}
		BigWigsClassicDB["namespaces"]["BigWigs_Plugins_Colors"]["profiles"][Tmain] = {
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
		BigWigsClassicDB["namespaces"]["BigWigs_Plugins_Colors"]["profiles"][Theal] = {
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
		BigWigsClassicDB["namespaces"]["BigWigs_Plugins_Raid Icons"]["profiles"][Tmain] = {
			["disabled"] = true,
		}
		BigWigsClassicDB["namespaces"]["BigWigs_Plugins_Raid Icons"]["profiles"][Theal] = {
			["disabled"] = true,
		}
		BigWigsClassicDB["namespaces"]["BigWigs_Plugins_InfoBox"]["profiles"] = BigWigsClassicDB["namespaces"]["BigWigs_Plugins_InfoBox"]["profiles"] or {}
		BigWigsClassicDB["namespaces"]["BigWigs_Plugins_InfoBox"]["profiles"][Tmain] = {
			["posx"] = 962.845249009151,
			["posy"] = 71.8225277808051,
		}
		BigWigsClassicDB["namespaces"]["BigWigs_Plugins_InfoBox"]["profiles"][Theal] = {
			["posx"] = 962.845249009151,
			["posy"] = 71.8225277808051,
		}
		BigWigsClassicDB["namespaces"]["BigWigs_Plugins_Bars"]["profiles"] = BigWigsClassicDB["namespaces"]["BigWigs_Plugins_Bars"]["profiles"] or {}
		BigWigsClassicDB["namespaces"]["BigWigs_Plugins_Bars"]["profiles"][Tmain] = {
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
		BigWigsClassicDB["namespaces"]["BigWigs_Plugins_Bars"]["profiles"][Theal] = {
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
		BigWigsClassicDB["namespaces"]["BigWigs_Plugins_Messages"]["profiles"][Tmain] = {
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
		BigWigsClassicDB["namespaces"]["BigWigs_Plugins_Messages"]["profiles"][Theal] = {
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
		BigWigsClassicDB["namespaces"]["BigWigs_Plugins_Proximity"]["profiles"][Tmain] = {
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
		BigWigsClassicDB["namespaces"]["BigWigs_Plugins_Proximity"]["profiles"][Theal] = {
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
		BigWigsClassicDB["namespaces"]["BigWigs_Plugins_Pull"]["profiles"][Tmain] = {
			["voice"] = "enUS: Default (Female)",
			["endPullSound"] = "None",
		}
		BigWigsClassicDB["namespaces"]["BigWigs_Plugins_Pull"]["profiles"][Theal] = {
			["voice"] = "enUS: Default (Female)",
			["endPullSound"] = "None",
		}

		-- Set the profile
		BigWigs.db:SetProfile(Tmain)

	elseif L1UI.Classic then

		------------------------------------------------------------------
		------------------------ Profile Creation ------------------------
		------------------------------------------------------------------
		BigWigsClassicDB["profiles"] = BigWigsClassicDB["profiles"] or {}

		BigWigsClassicDB["profiles"][Cmain] = BigWigsClassicDB["profiles"][Cmain] or {}
		BigWigsClassicDB["profiles"][Cmain]["showZoneMessages"] = false
		BigWigsClassicDB["profiles"][Cmain]["fakeDBMVersion"] = true
		BigWigsClassicDB["profiles"][Cmain]["flash"] = false

		BigWigsClassicDB["profiles"][Cheal] = BigWigsClassicDB["profiles"][Cheal] or {}
		BigWigsClassicDB["profiles"][Cheal]["showZoneMessages"] = false
		BigWigsClassicDB["profiles"][Cheal]["fakeDBMVersion"] = true
		BigWigsClassicDB["profiles"][Cheal]["flash"] = false

		BigWigsIconClassicDB["hide"] = true
		------------------------------------------------------------------
		-------------------------- Profile Data --------------------------
		------------------------------------------------------------------
		BigWigsClassicDB["namespaces"]["BigWigs_Plugins_Victory"]["profiles"] = BigWigsClassicDB["namespaces"]["BigWigs_Plugins_Victory"]["profiles"] or {}
		BigWigsClassicDB["namespaces"]["BigWigs_Plugins_Victory"]["profiles"][Cmain] = {
			["bigwigsMsg"] = true,
			["blizzMsg"] = false,
		}
		BigWigsClassicDB["namespaces"]["BigWigs_Plugins_Victory"]["profiles"][Cheal] = {
			["bigwigsMsg"] = true,
			["blizzMsg"] = false,
		}
		BigWigsClassicDB["namespaces"]["BigWigs_Plugins_Sounds"]["profiles"] = BigWigsClassicDB["namespaces"]["BigWigs_Plugins_Sounds"]["profiles"] or {}
		BigWigsClassicDB["namespaces"]["BigWigs_Plugins_Sounds"]["profiles"][Cmain] = {
			["media"] = {
				["underyou"] = "None",
			},
		}
		BigWigsClassicDB["namespaces"]["BigWigs_Plugins_Sounds"]["profiles"][Cheal] = {
			["media"] = {
				["underyou"] = "None",
			},
		}
		BigWigsClassicDB["namespaces"]["BigWigs_Plugins_Countdown"]["profiles"] = BigWigsClassicDB["namespaces"]["BigWigs_Plugins_Countdown"]["profiles"] or {}
		BigWigsClassicDB["namespaces"]["BigWigs_Plugins_Countdown"]["profiles"][Cmain] = {
			["outline"] = "OUTLINE",
			["fontName"] = "Expressway",
			["position"] = {
				nil, -- [1]
				nil, -- [2]
				nil, -- [3]
				-220, -- [4]
			},
		}
		BigWigsClassicDB["namespaces"]["BigWigs_Plugins_Countdown"]["profiles"][Cheal] = {
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
		BigWigsClassicDB["namespaces"]["BigWigs_Plugins_AutoReply"]["profiles"][Cmain] = {
			["exitCombatOther"] = 3,
			["disabled"] = false,
			["modeOther"] = 2,
		}
		BigWigsClassicDB["namespaces"]["BigWigs_Plugins_AutoReply"]["profiles"][Cheal] = {
			["exitCombatOther"] = 3,
			["disabled"] = false,
			["modeOther"] = 2,
		}
		BigWigsClassicDB["namespaces"]["BigWigs_Plugins_Colors"]["profiles"] = BigWigsClassicDB["namespaces"]["BigWigs_Plugins_Colors"]["profiles"] or {}
		BigWigsClassicDB["namespaces"]["BigWigs_Plugins_Colors"]["profiles"][Cmain] = {
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
		BigWigsClassicDB["namespaces"]["BigWigs_Plugins_Colors"]["profiles"][Cheal] = {
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
		BigWigsClassicDB["namespaces"]["BigWigs_Plugins_Raid Icons"]["profiles"][Cmain] = {
			["disabled"] = true,
		}
		BigWigsClassicDB["namespaces"]["BigWigs_Plugins_Raid Icons"]["profiles"][Cheal] = {
			["disabled"] = true,
		}
		BigWigsClassicDB["namespaces"]["BigWigs_Plugins_InfoBox"]["profiles"] = BigWigsClassicDB["namespaces"]["BigWigs_Plugins_InfoBox"]["profiles"] or {}
		BigWigsClassicDB["namespaces"]["BigWigs_Plugins_InfoBox"]["profiles"][Cmain] = {
			["posx"] = 962.845249009151,
			["posy"] = 71.8225277808051,
		}
		BigWigsClassicDB["namespaces"]["BigWigs_Plugins_InfoBox"]["profiles"][Cheal] = {
			["posx"] = 962.845249009151,
			["posy"] = 71.8225277808051,
		}
		BigWigsClassicDB["namespaces"]["BigWigs_Plugins_Bars"]["profiles"] = BigWigsClassicDB["namespaces"]["BigWigs_Plugins_Bars"]["profiles"] or {}
		BigWigsClassicDB["namespaces"]["BigWigs_Plugins_Bars"]["profiles"][Cmain] = {
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
		BigWigsClassicDB["namespaces"]["BigWigs_Plugins_Bars"]["profiles"][Cheal] = {
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
		BigWigsClassicDB["namespaces"]["BigWigs_Plugins_Messages"]["profiles"][Cmain] = {
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
		BigWigsClassicDB["namespaces"]["BigWigs_Plugins_Messages"]["profiles"][Cheal] = {
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
		BigWigsClassicDB["namespaces"]["BigWigs_Plugins_Proximity"]["profiles"][Cmain] = {
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
		BigWigsClassicDB["namespaces"]["BigWigs_Plugins_Proximity"]["profiles"][Cheal] = {
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
		BigWigsClassicDB["namespaces"]["BigWigs_Plugins_Pull"]["profiles"][Cmain] = {
			["voice"] = "enUS: Default (Female)",
			["endPullSound"] = "None",
		}
		BigWigsClassicDB["namespaces"]["BigWigs_Plugins_Pull"]["profiles"][Cheal] = {
			["voice"] = "enUS: Default (Female)",
			["endPullSound"] = "None",
		}

		-- Set the profile
		BigWigs.db:SetProfile(Cmain)
	end
end
