local L1UI, E, L, V, P, G = unpack(select(2, ...))

local IsAddOnLoaded = IsAddOnLoaded
local LoadAddOn = LoadAddOn

-- BigWigs profiles
function L1UI:Setup_BigWigs(layout)
	if not IsAddOnLoaded('BigWigs') then return end

	-- Profile names
	local name = L1UI.Me and 'Luckyone Main' or 'Luckyone Main '..L1UI.Version
	local name_healing = L1UI.Me and 'Luckyone Healing' or 'Luckyone Healing '..L1UI.Version

	-- Required to add profiles to BigWigs3DB
	if not IsAddOnLoaded('BigWigs_Core') then LoadAddOn('BigWigs_Core') end

	-- Required to add profiles to Plugins DB
	if not IsAddOnLoaded('BigWigs_Plugins') then LoadAddOn('BigWigs_Plugins') end

	if E.Retail then

		-- Disable LibDualSpec to set the profile
		BigWigs3DB["namespaces"]["LibDualSpec-1.0"] = BigWigs3DB["namespaces"]["LibDualSpec-1.0"] or {}
		BigWigs3DB["namespaces"]["LibDualSpec-1.0"]["char"][E.mynameRealm]["enabled"] = false

		-- Profile creation
		BigWigs3DB["profiles"] = BigWigs3DB["profiles"] or {}

		BigWigs3DB["profiles"][name] = BigWigs3DB["profiles"][name] or {}
		BigWigs3DB["profiles"][name]["showZoneMessages"] = false
		BigWigs3DB["profiles"][name]["fakeDBMVersion"] = true
		BigWigs3DB["profiles"][name]["flash"] = false

		BigWigs3DB["profiles"][name_healing] = BigWigs3DB["profiles"][name_healing] or {}
		BigWigs3DB["profiles"][name_healing]["showZoneMessages"] = false
		BigWigs3DB["profiles"][name_healing]["fakeDBMVersion"] = true
		BigWigs3DB["profiles"][name_healing]["flash"] = false

		BigWigsIconDB["hide"] = true

		-- Profile data
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

		BigWigs3DB["namespaces"]["BigWigs_Plugins_Bars"]["profiles"] = BigWigs3DB["namespaces"]["BigWigs_Plugins_Bars"]["profiles"] or {}
		BigWigs3DB["namespaces"]["BigWigs_Plugins_Bars"]["profiles"][name] = {
			["barStyle"] = "ElvUI",
			["BigWigsAnchor_height"] = 15.99998760223389,
			["BigWigsAnchor_width"] = 221.0000152587891,
			["BigWigsAnchor_x"] = 412.7110342991,
			["BigWigsAnchor_y"] = 198.711332936673,
			["BigWigsEmphasizeAnchor_height"] = 18.00000190734863,
			["BigWigsEmphasizeAnchor_width"] = 257,
			["BigWigsEmphasizeAnchor_x"] = 598,
			["BigWigsEmphasizeAnchor_y"] = 178.0001345184974,
			["emphasizeRestart"] = false,
			["emphasizeTime"] = 6,
			["fontName"] = "Expressway",
			["fontSizeEmph"] = 11,
			["fontSizeNameplate"] = 10,
			["interceptKey"] = "SHIFT",
			["nameplateAlpha"] = 1,
			["nameplateHeight"] = 14,
			["nameplateOffsetY"] = 0,
			["outline"] = "OUTLINE",
			["spacing"] = 3,
			["texture"] = "Minimalist",
			["visibleBarLimit"] = 6,
			["visibleBarLimitEmph"] = 4,
		}
		BigWigs3DB["namespaces"]["BigWigs_Plugins_Bars"]["profiles"][name_healing] = {
			["barStyle"] = "ElvUI",
			["BigWigsAnchor_height"] = 15.99998760223389,
			["BigWigsAnchor_width"] = 221.0000305175781,
			["BigWigsAnchor_x"] = 355.8220138243451,
			["BigWigsAnchor_y"] = 198.7113763394518,
			["BigWigsEmphasizeAnchor_height"] = 18.00000190734863,
			["BigWigsEmphasizeAnchor_width"] = 219.0000457763672,
			["BigWigsEmphasizeAnchor_x"] = 866.088996666258,
			["BigWigsEmphasizeAnchor_y"] = 198.2889804958904,
			["emphasizeRestart"] = false,
			["emphasizeTime"] = 6,
			["fontName"] = "Expressway",
			["fontSizeEmph"] = 11,
			["fontSizeNameplate"] = 10,
			["interceptKey"] = "SHIFT",
			["nameplateAlpha"] = 1,
			["nameplateHeight"] = 14,
			["nameplateOffsetY"] = 0,
			["outline"] = "OUTLINE",
			["spacing"] = 3,
			["texture"] = "Minimalist",
			["visibleBarLimit"] = 6,
			["visibleBarLimitEmph"] = 4,
		}

		BigWigs3DB["namespaces"]["BigWigs_Plugins_BossBlock"]["profiles"] = BigWigs3DB["namespaces"]["BigWigs_Plugins_BossBlock"]["profiles"] or {}
		BigWigs3DB["namespaces"]["BigWigs_Plugins_BossBlock"]["profiles"][name] = {
			["blockTalkingHeads"] = {
				true, -- [1]
				nil, -- [2]
				nil, -- [3]
				true, -- [4]
			},
		}
		BigWigs3DB["namespaces"]["BigWigs_Plugins_BossBlock"]["profiles"][name_healing] = {
			["blockTalkingHeads"] = {
				true, -- [1]
				nil, -- [2]
				nil, -- [3]
				true, -- [4]
			},
		}

		BigWigs3DB["namespaces"]["BigWigs_Plugins_Colors"]["profiles"] = BigWigs3DB["namespaces"]["BigWigs_Plugins_Colors"]["profiles"] or {}
		BigWigs3DB["namespaces"]["BigWigs_Plugins_Colors"]["profiles"][name] = {
			["barBackground"] = {
				["BigWigs_Plugins_Colors"] = {
					["default"] = {
						0.05882352941176471, -- [1]
						0.05882352941176471, -- [2]
						0.05882352941176471, -- [3]
						1, -- [4]
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
						1, -- [4]
					},
				},
			},
		}

		BigWigs3DB["namespaces"]["BigWigs_Plugins_Countdown"]["profiles"] = BigWigs3DB["namespaces"]["BigWigs_Plugins_Countdown"]["profiles"] or {}
		BigWigs3DB["namespaces"]["BigWigs_Plugins_Countdown"]["profiles"][name] = {
			["outline"] = "OUTLINE",
			["fontSize"] = 50,
			["fontName"] = "Expressway",
			["position"] = {
				nil, -- [1]
				nil, -- [2]
				nil, -- [3]
				-380, -- [4]
			},
		}
		BigWigs3DB["namespaces"]["BigWigs_Plugins_Countdown"]["profiles"][name_healing] = {
			["outline"] = "OUTLINE",
			["fontSize"] = 50,
			["fontName"] = "Expressway",
			["position"] = {
				nil, -- [1]
				nil, -- [2]
				nil, -- [3]
				-380, -- [4]
			},
		}

		BigWigs3DB["namespaces"]["BigWigs_Plugins_InfoBox"]["profiles"] = BigWigs3DB["namespaces"]["BigWigs_Plugins_InfoBox"]["profiles"] or {}
		BigWigs3DB["namespaces"]["BigWigs_Plugins_InfoBox"]["profiles"][name] = {
			["posx"] = 962.8443809535747,
			["posy"] = 72.42229450539753,
		}
		BigWigs3DB["namespaces"]["BigWigs_Plugins_InfoBox"]["profiles"][name_healing] = {
			["posx"] = 962.8443809535747,
			["posy"] = 72.42229450539753,
		}

		BigWigs3DB["namespaces"]["BigWigs_Plugins_Messages"]["profiles"] = BigWigs3DB["namespaces"]["BigWigs_Plugins_Messages"]["profiles"] or {}
		BigWigs3DB["namespaces"]["BigWigs_Plugins_Messages"]["profiles"][name] = {
			["outline"] = "OUTLINE",
			["fontSize"] = 16,
			["emphFontName"] = "Expressway",
			["emphFontSize"] = 20,
			["growUpwards"] = false,
			["emphOutline"] = "OUTLINE",
			["emphPosition"] = {
				"TOP", -- [1]
				"TOP", -- [2]
				nil, -- [3]
				-300, -- [4]
			},
			["fontName"] = "Expressway",
			["normalPosition"] = {
				"CENTER", -- [1]
				"CENTER", -- [2]
				nil, -- [3]
				250, -- [4]
			},
		}
		BigWigs3DB["namespaces"]["BigWigs_Plugins_Messages"]["profiles"][name_healing] = {
			["outline"] = "OUTLINE",
			["fontSize"] = 16,
			["emphFontName"] = "Expressway",
			["emphFontSize"] = 20,
			["growUpwards"] = false,
			["emphOutline"] = "OUTLINE",
			["emphPosition"] = {
				"TOP", -- [1]
				"TOP", -- [2]
				nil, -- [3]
				-300, -- [4]
			},
			["fontName"] = "Expressway",
			["normalPosition"] = {
				"CENTER", -- [1]
				"CENTER", -- [2]
				nil, -- [3]
				250, -- [4]
			},
		}

		BigWigs3DB["namespaces"]["BigWigs_Plugins_Proximity"]["profiles"] = BigWigs3DB["namespaces"]["BigWigs_Plugins_Proximity"]["profiles"] or {}
		BigWigs3DB["namespaces"]["BigWigs_Plugins_Proximity"]["profiles"][name] = {
			["posx"] = 296,
			["fontSize"] = 18,
			["fontName"] = "Expressway",
			["width"] = 150.0000915527344,
			["objects"] = {
				["title"] = false,
				["close"] = false,
				["ability"] = false,
				["tooltip"] = false,
				["sound"] = false,
			},
			["posy"] = 87,
			["lock"] = true,
			["height"] = 119.9999694824219,
			["font"] = "Friz Quadrata TT",
		}
		BigWigs3DB["namespaces"]["BigWigs_Plugins_Proximity"]["profiles"][name_healing] = {
			["posx"] = 296,
			["fontSize"] = 18,
			["fontName"] = "Expressway",
			["width"] = 150.0000915527344,
			["objects"] = {
				["title"] = false,
				["close"] = false,
				["ability"] = false,
				["tooltip"] = false,
				["sound"] = false,
			},
			["posy"] = 87,
			["lock"] = true,
			["height"] = 119.9999694824219,
			["font"] = "Friz Quadrata TT",
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

		BigWigs3DB["namespaces"]["BigWigs_Plugins_Raid Icons"]["profiles"] = BigWigs3DB["namespaces"]["BigWigs_Plugins_Raid Icons"]["profiles"] or {}
		BigWigs3DB["namespaces"]["BigWigs_Plugins_Raid Icons"]["profiles"][name] = {
			["disabled"] = true,
		}
		BigWigs3DB["namespaces"]["BigWigs_Plugins_Raid Icons"]["profiles"][name_healing] = {
			["disabled"] = true,
		}

		BigWigs3DB["namespaces"]["BigWigs_Plugins_Victory"]["profiles"] = BigWigs3DB["namespaces"]["BigWigs_Plugins_Victory"]["profiles"] or {}
		BigWigs3DB["namespaces"]["BigWigs_Plugins_Victory"]["profiles"][name] = {
			["bigwigsMsg"] = true,
			["blizzMsg"] = false,
		}
		BigWigs3DB["namespaces"]["BigWigs_Plugins_Victory"]["profiles"][name_healing] = {
			["bigwigsMsg"] = true,
			["blizzMsg"] = false,
		}

	elseif E.TBC then

		-- Profile creation
		BigWigsClassicDB["profiles"] = BigWigsClassicDB["profiles"] or {}

		BigWigsClassicDB["profiles"][name] = BigWigsClassicDB["profiles"][name] or {}
		BigWigsClassicDB["profiles"][name]["showZoneMessages"] = false
		BigWigsClassicDB["profiles"][name]["fakeDBMVersion"] = true
		BigWigsClassicDB["profiles"][name]["flash"] = false

		BigWigsClassicDB["profiles"][name_healing] = BigWigsClassicDB["profiles"][name_healing] or {}
		BigWigsClassicDB["profiles"][name_healing]["showZoneMessages"] = false
		BigWigsClassicDB["profiles"][name_healing]["fakeDBMVersion"] = true
		BigWigsClassicDB["profiles"][name_healing]["flash"] = false

		BigWigsIconClassicDB["hide"] = true

		-- Profile data
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

		BigWigsClassicDB["namespaces"]["BigWigs_Plugins_Bars"]["profiles"] = BigWigsClassicDB["namespaces"]["BigWigs_Plugins_Bars"]["profiles"] or {}
		BigWigsClassicDB["namespaces"]["BigWigs_Plugins_Bars"]["profiles"][name] = {
			["barStyle"] = "ElvUI",
			["BigWigsAnchor_height"] = 15.99998760223389,
			["BigWigsAnchor_width"] = 221.0000152587891,
			["BigWigsAnchor_x"] = 412.7110342991,
			["BigWigsAnchor_y"] = 198.711332936673,
			["BigWigsEmphasizeAnchor_height"] = 18.00000190734863,
			["BigWigsEmphasizeAnchor_width"] = 257,
			["BigWigsEmphasizeAnchor_x"] = 598,
			["BigWigsEmphasizeAnchor_y"] = 178.0001345184974,
			["emphasizeRestart"] = false,
			["emphasizeTime"] = 6,
			["fontName"] = "Expressway",
			["fontSizeEmph"] = 11,
			["fontSizeNameplate"] = 10,
			["interceptKey"] = "SHIFT",
			["nameplateAlpha"] = 1,
			["nameplateHeight"] = 14,
			["nameplateOffsetY"] = 0,
			["outline"] = "OUTLINE",
			["spacing"] = 3,
			["texture"] = "Minimalist",
			["visibleBarLimit"] = 6,
			["visibleBarLimitEmph"] = 4,
		}
		BigWigsClassicDB["namespaces"]["BigWigs_Plugins_Bars"]["profiles"][name_healing] = {
			["barStyle"] = "ElvUI",
			["BigWigsAnchor_height"] = 15.99998760223389,
			["BigWigsAnchor_width"] = 221.0000305175781,
			["BigWigsAnchor_x"] = 355.8220138243451,
			["BigWigsAnchor_y"] = 198.7113763394518,
			["BigWigsEmphasizeAnchor_height"] = 18.00000190734863,
			["BigWigsEmphasizeAnchor_width"] = 219.0000457763672,
			["BigWigsEmphasizeAnchor_x"] = 866.088996666258,
			["BigWigsEmphasizeAnchor_y"] = 198.2889804958904,
			["emphasizeRestart"] = false,
			["emphasizeTime"] = 6,
			["fontName"] = "Expressway",
			["fontSizeEmph"] = 11,
			["fontSizeNameplate"] = 10,
			["interceptKey"] = "SHIFT",
			["nameplateAlpha"] = 1,
			["nameplateHeight"] = 14,
			["nameplateOffsetY"] = 0,
			["outline"] = "OUTLINE",
			["spacing"] = 3,
			["texture"] = "Minimalist",
			["visibleBarLimit"] = 6,
			["visibleBarLimitEmph"] = 4,
		}

		BigWigsClassicDB["namespaces"]["BigWigs_Plugins_BossBlock"]["profiles"] = BigWigsClassicDB["namespaces"]["BigWigs_Plugins_BossBlock"]["profiles"] or {}
		BigWigsClassicDB["namespaces"]["BigWigs_Plugins_BossBlock"]["profiles"][name] = {
			["blockTalkingHeads"] = {
				true, -- [1]
				nil, -- [2]
				nil, -- [3]
				true, -- [4]
			},
		}
		BigWigsClassicDB["namespaces"]["BigWigs_Plugins_BossBlock"]["profiles"][name_healing] = {
			["blockTalkingHeads"] = {
				true, -- [1]
				nil, -- [2]
				nil, -- [3]
				true, -- [4]
			},
		}

		BigWigsClassicDB["namespaces"]["BigWigs_Plugins_Colors"]["profiles"] = BigWigsClassicDB["namespaces"]["BigWigs_Plugins_Colors"]["profiles"] or {}
		BigWigsClassicDB["namespaces"]["BigWigs_Plugins_Colors"]["profiles"][name] = {
			["barBackground"] = {
				["BigWigs_Plugins_Colors"] = {
					["default"] = {
						0.05882352941176471, -- [1]
						0.05882352941176471, -- [2]
						0.05882352941176471, -- [3]
						1, -- [4]
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
						1, -- [4]
					},
				},
			},
		}

		BigWigsClassicDB["namespaces"]["BigWigs_Plugins_Countdown"]["profiles"] = BigWigsClassicDB["namespaces"]["BigWigs_Plugins_Countdown"]["profiles"] or {}
		BigWigsClassicDB["namespaces"]["BigWigs_Plugins_Countdown"]["profiles"][name] = {
			["outline"] = "OUTLINE",
			["fontSize"] = 50,
			["fontName"] = "Expressway",
			["position"] = {
				nil, -- [1]
				nil, -- [2]
				nil, -- [3]
				-380, -- [4]
			},
		}
		BigWigsClassicDB["namespaces"]["BigWigs_Plugins_Countdown"]["profiles"][name_healing] = {
			["outline"] = "OUTLINE",
			["fontSize"] = 50,
			["fontName"] = "Expressway",
			["position"] = {
				nil, -- [1]
				nil, -- [2]
				nil, -- [3]
				-380, -- [4]
			},
		}

		BigWigsClassicDB["namespaces"]["BigWigs_Plugins_InfoBox"]["profiles"] = BigWigsClassicDB["namespaces"]["BigWigs_Plugins_InfoBox"]["profiles"] or {}
		BigWigsClassicDB["namespaces"]["BigWigs_Plugins_InfoBox"]["profiles"][name] = {
			["posx"] = 962.8443809535747,
			["posy"] = 72.42229450539753,
		}
		BigWigsClassicDB["namespaces"]["BigWigs_Plugins_InfoBox"]["profiles"][name_healing] = {
			["posx"] = 962.8443809535747,
			["posy"] = 72.42229450539753,
		}

		BigWigsClassicDB["namespaces"]["BigWigs_Plugins_Messages"]["profiles"] = BigWigsClassicDB["namespaces"]["BigWigs_Plugins_Messages"]["profiles"] or {}
		BigWigsClassicDB["namespaces"]["BigWigs_Plugins_Messages"]["profiles"][name] = {
			["outline"] = "OUTLINE",
			["fontSize"] = 16,
			["emphFontName"] = "Expressway",
			["emphFontSize"] = 20,
			["growUpwards"] = false,
			["emphOutline"] = "OUTLINE",
			["emphPosition"] = {
				"TOP", -- [1]
				"TOP", -- [2]
				nil, -- [3]
				-300, -- [4]
			},
			["fontName"] = "Expressway",
			["normalPosition"] = {
				"CENTER", -- [1]
				"CENTER", -- [2]
				nil, -- [3]
				250, -- [4]
			},
		}
		BigWigsClassicDB["namespaces"]["BigWigs_Plugins_Messages"]["profiles"][name_healing] = {
			["outline"] = "OUTLINE",
			["fontSize"] = 16,
			["emphFontName"] = "Expressway",
			["emphFontSize"] = 20,
			["growUpwards"] = false,
			["emphOutline"] = "OUTLINE",
			["emphPosition"] = {
				"TOP", -- [1]
				"TOP", -- [2]
				nil, -- [3]
				-300, -- [4]
			},
			["fontName"] = "Expressway",
			["normalPosition"] = {
				"CENTER", -- [1]
				"CENTER", -- [2]
				nil, -- [3]
				250, -- [4]
			},
		}

		BigWigsClassicDB["namespaces"]["BigWigs_Plugins_Proximity"]["profiles"] = BigWigsClassicDB["namespaces"]["BigWigs_Plugins_Proximity"]["profiles"] or {}
		BigWigsClassicDB["namespaces"]["BigWigs_Plugins_Proximity"]["profiles"][name] = {
			["posx"] = 296,
			["fontSize"] = 18,
			["fontName"] = "Expressway",
			["width"] = 150.0000915527344,
			["objects"] = {
				["title"] = false,
				["close"] = false,
				["ability"] = false,
				["tooltip"] = false,
				["sound"] = false,
			},
			["posy"] = 87,
			["lock"] = true,
			["height"] = 119.9999694824219,
			["font"] = "Friz Quadrata TT",
		}
		BigWigsClassicDB["namespaces"]["BigWigs_Plugins_Proximity"]["profiles"][name_healing] = {
			["posx"] = 296,
			["fontSize"] = 18,
			["fontName"] = "Expressway",
			["width"] = 150.0000915527344,
			["objects"] = {
				["title"] = false,
				["close"] = false,
				["ability"] = false,
				["tooltip"] = false,
				["sound"] = false,
			},
			["posy"] = 87,
			["lock"] = true,
			["height"] = 119.9999694824219,
			["font"] = "Friz Quadrata TT",
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

		BigWigsClassicDB["namespaces"]["BigWigs_Plugins_Raid Icons"]["profiles"] = BigWigsClassicDB["namespaces"]["BigWigs_Plugins_Raid Icons"]["profiles"] or {}
		BigWigsClassicDB["namespaces"]["BigWigs_Plugins_Raid Icons"]["profiles"][name] = {
			["disabled"] = true,
		}
		BigWigsClassicDB["namespaces"]["BigWigs_Plugins_Raid Icons"]["profiles"][name_healing] = {
			["disabled"] = true,
		}

		BigWigsClassicDB["namespaces"]["BigWigs_Plugins_Victory"]["profiles"] = BigWigsClassicDB["namespaces"]["BigWigs_Plugins_Victory"]["profiles"] or {}
		BigWigsClassicDB["namespaces"]["BigWigs_Plugins_Victory"]["profiles"][name] = {
			["bigwigsMsg"] = true,
			["blizzMsg"] = false,
		}
		BigWigsClassicDB["namespaces"]["BigWigs_Plugins_Victory"]["profiles"][name_healing] = {
			["bigwigsMsg"] = true,
			["blizzMsg"] = false,
		}

	elseif E.Classic then

		-- Profile creation
		BigWigsClassicDB["profiles"] = BigWigsClassicDB["profiles"] or {}

		BigWigsClassicDB["profiles"][name] = BigWigsClassicDB["profiles"][name] or {}
		BigWigsClassicDB["profiles"][name]["showZoneMessages"] = false
		BigWigsClassicDB["profiles"][name]["fakeDBMVersion"] = true
		BigWigsClassicDB["profiles"][name]["flash"] = false

		BigWigsClassicDB["profiles"][name_healing] = BigWigsClassicDB["profiles"][name_healing] or {}
		BigWigsClassicDB["profiles"][name_healing]["showZoneMessages"] = false
		BigWigsClassicDB["profiles"][name_healing]["fakeDBMVersion"] = true
		BigWigsClassicDB["profiles"][name_healing]["flash"] = false

		BigWigsIconClassicDB["hide"] = true

		-- Profile data
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

		BigWigsClassicDB["namespaces"]["BigWigs_Plugins_Bars"]["profiles"] = BigWigsClassicDB["namespaces"]["BigWigs_Plugins_Bars"]["profiles"] or {}
		BigWigsClassicDB["namespaces"]["BigWigs_Plugins_Bars"]["profiles"][name] = {
			["barStyle"] = "ElvUI",
			["BigWigsAnchor_height"] = 15.99998760223389,
			["BigWigsAnchor_width"] = 221.0000152587891,
			["BigWigsAnchor_x"] = 412.7110342991,
			["BigWigsAnchor_y"] = 198.711332936673,
			["BigWigsEmphasizeAnchor_height"] = 18.00000190734863,
			["BigWigsEmphasizeAnchor_width"] = 257,
			["BigWigsEmphasizeAnchor_x"] = 598,
			["BigWigsEmphasizeAnchor_y"] = 178.0001345184974,
			["emphasizeRestart"] = false,
			["emphasizeTime"] = 6,
			["fontName"] = "Expressway",
			["fontSizeEmph"] = 11,
			["fontSizeNameplate"] = 10,
			["interceptKey"] = "SHIFT",
			["nameplateAlpha"] = 1,
			["nameplateHeight"] = 14,
			["nameplateOffsetY"] = 0,
			["outline"] = "OUTLINE",
			["spacing"] = 3,
			["texture"] = "Minimalist",
			["visibleBarLimit"] = 6,
			["visibleBarLimitEmph"] = 4,
		}
		BigWigsClassicDB["namespaces"]["BigWigs_Plugins_Bars"]["profiles"][name_healing] = {
			["barStyle"] = "ElvUI",
			["BigWigsAnchor_height"] = 15.99998760223389,
			["BigWigsAnchor_width"] = 221.0000305175781,
			["BigWigsAnchor_x"] = 355.8220138243451,
			["BigWigsAnchor_y"] = 198.7113763394518,
			["BigWigsEmphasizeAnchor_height"] = 18.00000190734863,
			["BigWigsEmphasizeAnchor_width"] = 219.0000457763672,
			["BigWigsEmphasizeAnchor_x"] = 866.088996666258,
			["BigWigsEmphasizeAnchor_y"] = 198.2889804958904,
			["emphasizeRestart"] = false,
			["emphasizeTime"] = 6,
			["fontName"] = "Expressway",
			["fontSizeEmph"] = 11,
			["fontSizeNameplate"] = 10,
			["interceptKey"] = "SHIFT",
			["nameplateAlpha"] = 1,
			["nameplateHeight"] = 14,
			["nameplateOffsetY"] = 0,
			["outline"] = "OUTLINE",
			["spacing"] = 3,
			["texture"] = "Minimalist",
			["visibleBarLimit"] = 6,
			["visibleBarLimitEmph"] = 4,
		}

		BigWigsClassicDB["namespaces"]["BigWigs_Plugins_BossBlock"]["profiles"] = BigWigsClassicDB["namespaces"]["BigWigs_Plugins_BossBlock"]["profiles"] or {}
		BigWigsClassicDB["namespaces"]["BigWigs_Plugins_BossBlock"]["profiles"][name] = {
			["blockTalkingHeads"] = {
				true, -- [1]
				nil, -- [2]
				nil, -- [3]
				true, -- [4]
			},
		}
		BigWigsClassicDB["namespaces"]["BigWigs_Plugins_BossBlock"]["profiles"][name_healing] = {
			["blockTalkingHeads"] = {
				true, -- [1]
				nil, -- [2]
				nil, -- [3]
				true, -- [4]
			},
		}

		BigWigsClassicDB["namespaces"]["BigWigs_Plugins_Colors"]["profiles"] = BigWigsClassicDB["namespaces"]["BigWigs_Plugins_Colors"]["profiles"] or {}
		BigWigsClassicDB["namespaces"]["BigWigs_Plugins_Colors"]["profiles"][name] = {
			["barBackground"] = {
				["BigWigs_Plugins_Colors"] = {
					["default"] = {
						0.05882352941176471, -- [1]
						0.05882352941176471, -- [2]
						0.05882352941176471, -- [3]
						1, -- [4]
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
						1, -- [4]
					},
				},
			},
		}

		BigWigsClassicDB["namespaces"]["BigWigs_Plugins_Countdown"]["profiles"] = BigWigsClassicDB["namespaces"]["BigWigs_Plugins_Countdown"]["profiles"] or {}
		BigWigsClassicDB["namespaces"]["BigWigs_Plugins_Countdown"]["profiles"][name] = {
			["outline"] = "OUTLINE",
			["fontSize"] = 50,
			["fontName"] = "Expressway",
			["position"] = {
				nil, -- [1]
				nil, -- [2]
				nil, -- [3]
				-380, -- [4]
			},
		}
		BigWigsClassicDB["namespaces"]["BigWigs_Plugins_Countdown"]["profiles"][name_healing] = {
			["outline"] = "OUTLINE",
			["fontSize"] = 50,
			["fontName"] = "Expressway",
			["position"] = {
				nil, -- [1]
				nil, -- [2]
				nil, -- [3]
				-380, -- [4]
			},
		}

		BigWigsClassicDB["namespaces"]["BigWigs_Plugins_InfoBox"]["profiles"] = BigWigsClassicDB["namespaces"]["BigWigs_Plugins_InfoBox"]["profiles"] or {}
		BigWigsClassicDB["namespaces"]["BigWigs_Plugins_InfoBox"]["profiles"][name] = {
			["posx"] = 962.8443809535747,
			["posy"] = 72.42229450539753,
		}
		BigWigsClassicDB["namespaces"]["BigWigs_Plugins_InfoBox"]["profiles"][name_healing] = {
			["posx"] = 962.8443809535747,
			["posy"] = 72.42229450539753,
		}

		BigWigsClassicDB["namespaces"]["BigWigs_Plugins_Messages"]["profiles"] = BigWigsClassicDB["namespaces"]["BigWigs_Plugins_Messages"]["profiles"] or {}
		BigWigsClassicDB["namespaces"]["BigWigs_Plugins_Messages"]["profiles"][name] = {
			["outline"] = "OUTLINE",
			["fontSize"] = 16,
			["emphFontName"] = "Expressway",
			["emphFontSize"] = 20,
			["growUpwards"] = false,
			["emphOutline"] = "OUTLINE",
			["emphPosition"] = {
				"TOP", -- [1]
				"TOP", -- [2]
				nil, -- [3]
				-300, -- [4]
			},
			["fontName"] = "Expressway",
			["normalPosition"] = {
				"CENTER", -- [1]
				"CENTER", -- [2]
				nil, -- [3]
				250, -- [4]
			},
		}
		BigWigsClassicDB["namespaces"]["BigWigs_Plugins_Messages"]["profiles"][name_healing] = {
			["outline"] = "OUTLINE",
			["fontSize"] = 16,
			["emphFontName"] = "Expressway",
			["emphFontSize"] = 20,
			["growUpwards"] = false,
			["emphOutline"] = "OUTLINE",
			["emphPosition"] = {
				"TOP", -- [1]
				"TOP", -- [2]
				nil, -- [3]
				-300, -- [4]
			},
			["fontName"] = "Expressway",
			["normalPosition"] = {
				"CENTER", -- [1]
				"CENTER", -- [2]
				nil, -- [3]
				250, -- [4]
			},
		}

		BigWigsClassicDB["namespaces"]["BigWigs_Plugins_Proximity"]["profiles"] = BigWigsClassicDB["namespaces"]["BigWigs_Plugins_Proximity"]["profiles"] or {}
		BigWigsClassicDB["namespaces"]["BigWigs_Plugins_Proximity"]["profiles"][name] = {
			["posx"] = 296,
			["fontSize"] = 18,
			["fontName"] = "Expressway",
			["width"] = 150.0000915527344,
			["objects"] = {
				["title"] = false,
				["close"] = false,
				["ability"] = false,
				["tooltip"] = false,
				["sound"] = false,
			},
			["posy"] = 87,
			["lock"] = true,
			["height"] = 119.9999694824219,
			["font"] = "Friz Quadrata TT",
		}
		BigWigsClassicDB["namespaces"]["BigWigs_Plugins_Proximity"]["profiles"][name_healing] = {
			["posx"] = 296,
			["fontSize"] = 18,
			["fontName"] = "Expressway",
			["width"] = 150.0000915527344,
			["objects"] = {
				["title"] = false,
				["close"] = false,
				["ability"] = false,
				["tooltip"] = false,
				["sound"] = false,
			},
			["posy"] = 87,
			["lock"] = true,
			["height"] = 119.9999694824219,
			["font"] = "Friz Quadrata TT",
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

		BigWigsClassicDB["namespaces"]["BigWigs_Plugins_Raid Icons"]["profiles"] = BigWigsClassicDB["namespaces"]["BigWigs_Plugins_Raid Icons"]["profiles"] or {}
		BigWigsClassicDB["namespaces"]["BigWigs_Plugins_Raid Icons"]["profiles"][name] = {
			["disabled"] = true,
		}
		BigWigsClassicDB["namespaces"]["BigWigs_Plugins_Raid Icons"]["profiles"][name_healing] = {
			["disabled"] = true,
		}

		BigWigsClassicDB["namespaces"]["BigWigs_Plugins_Victory"]["profiles"] = BigWigsClassicDB["namespaces"]["BigWigs_Plugins_Victory"]["profiles"] or {}
		BigWigsClassicDB["namespaces"]["BigWigs_Plugins_Victory"]["profiles"][name] = {
			["bigwigsMsg"] = true,
			["blizzMsg"] = false,
		}
		BigWigsClassicDB["namespaces"]["BigWigs_Plugins_Victory"]["profiles"][name_healing] = {
			["bigwigsMsg"] = true,
			["blizzMsg"] = false,
		}

	elseif E.Wrath then

		-- Profile creation
		BigWigsClassicDB["profiles"] = BigWigsClassicDB["profiles"] or {}

		BigWigsClassicDB["profiles"][name] = BigWigsClassicDB["profiles"][name] or {}
		BigWigsClassicDB["profiles"][name]["showZoneMessages"] = false
		BigWigsClassicDB["profiles"][name]["fakeDBMVersion"] = true
		BigWigsClassicDB["profiles"][name]["flash"] = false

		BigWigsClassicDB["profiles"][name_healing] = BigWigsClassicDB["profiles"][name_healing] or {}
		BigWigsClassicDB["profiles"][name_healing]["showZoneMessages"] = false
		BigWigsClassicDB["profiles"][name_healing]["fakeDBMVersion"] = true
		BigWigsClassicDB["profiles"][name_healing]["flash"] = false

		BigWigsIconClassicDB["hide"] = true

		-- Profile data
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

		BigWigsClassicDB["namespaces"]["BigWigs_Plugins_Bars"]["profiles"] = BigWigsClassicDB["namespaces"]["BigWigs_Plugins_Bars"]["profiles"] or {}
		BigWigsClassicDB["namespaces"]["BigWigs_Plugins_Bars"]["profiles"][name] = {
			["barStyle"] = "ElvUI",
			["BigWigsAnchor_height"] = 15.99998760223389,
			["BigWigsAnchor_width"] = 221.0000152587891,
			["BigWigsAnchor_x"] = 412.7110342991,
			["BigWigsAnchor_y"] = 198.711332936673,
			["BigWigsEmphasizeAnchor_height"] = 18.00000190734863,
			["BigWigsEmphasizeAnchor_width"] = 257,
			["BigWigsEmphasizeAnchor_x"] = 598,
			["BigWigsEmphasizeAnchor_y"] = 178.0001345184974,
			["emphasizeRestart"] = false,
			["emphasizeTime"] = 6,
			["fontName"] = "Expressway",
			["fontSizeEmph"] = 11,
			["fontSizeNameplate"] = 10,
			["interceptKey"] = "SHIFT",
			["nameplateAlpha"] = 1,
			["nameplateHeight"] = 14,
			["nameplateOffsetY"] = 0,
			["outline"] = "OUTLINE",
			["spacing"] = 3,
			["texture"] = "Minimalist",
			["visibleBarLimit"] = 6,
			["visibleBarLimitEmph"] = 4,
		}
		BigWigsClassicDB["namespaces"]["BigWigs_Plugins_Bars"]["profiles"][name_healing] = {
			["barStyle"] = "ElvUI",
			["BigWigsAnchor_height"] = 15.99998760223389,
			["BigWigsAnchor_width"] = 221.0000305175781,
			["BigWigsAnchor_x"] = 355.8220138243451,
			["BigWigsAnchor_y"] = 198.7113763394518,
			["BigWigsEmphasizeAnchor_height"] = 18.00000190734863,
			["BigWigsEmphasizeAnchor_width"] = 219.0000457763672,
			["BigWigsEmphasizeAnchor_x"] = 866.088996666258,
			["BigWigsEmphasizeAnchor_y"] = 198.2889804958904,
			["emphasizeRestart"] = false,
			["emphasizeTime"] = 6,
			["fontName"] = "Expressway",
			["fontSizeEmph"] = 11,
			["fontSizeNameplate"] = 10,
			["interceptKey"] = "SHIFT",
			["nameplateAlpha"] = 1,
			["nameplateHeight"] = 14,
			["nameplateOffsetY"] = 0,
			["outline"] = "OUTLINE",
			["spacing"] = 3,
			["texture"] = "Minimalist",
			["visibleBarLimit"] = 6,
			["visibleBarLimitEmph"] = 4,
		}

		BigWigsClassicDB["namespaces"]["BigWigs_Plugins_BossBlock"]["profiles"] = BigWigsClassicDB["namespaces"]["BigWigs_Plugins_BossBlock"]["profiles"] or {}
		BigWigsClassicDB["namespaces"]["BigWigs_Plugins_BossBlock"]["profiles"][name] = {
			["blockTalkingHeads"] = {
				true, -- [1]
				nil, -- [2]
				nil, -- [3]
				true, -- [4]
			},
		}
		BigWigsClassicDB["namespaces"]["BigWigs_Plugins_BossBlock"]["profiles"][name_healing] = {
			["blockTalkingHeads"] = {
				true, -- [1]
				nil, -- [2]
				nil, -- [3]
				true, -- [4]
			},
		}

		BigWigsClassicDB["namespaces"]["BigWigs_Plugins_Colors"]["profiles"] = BigWigsClassicDB["namespaces"]["BigWigs_Plugins_Colors"]["profiles"] or {}
		BigWigsClassicDB["namespaces"]["BigWigs_Plugins_Colors"]["profiles"][name] = {
			["barBackground"] = {
				["BigWigs_Plugins_Colors"] = {
					["default"] = {
						0.05882352941176471, -- [1]
						0.05882352941176471, -- [2]
						0.05882352941176471, -- [3]
						1, -- [4]
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
						1, -- [4]
					},
				},
			},
		}

		BigWigsClassicDB["namespaces"]["BigWigs_Plugins_Countdown"]["profiles"] = BigWigsClassicDB["namespaces"]["BigWigs_Plugins_Countdown"]["profiles"] or {}
		BigWigsClassicDB["namespaces"]["BigWigs_Plugins_Countdown"]["profiles"][name] = {
			["outline"] = "OUTLINE",
			["fontSize"] = 50,
			["fontName"] = "Expressway",
			["position"] = {
				nil, -- [1]
				nil, -- [2]
				nil, -- [3]
				-380, -- [4]
			},
		}
		BigWigsClassicDB["namespaces"]["BigWigs_Plugins_Countdown"]["profiles"][name_healing] = {
			["outline"] = "OUTLINE",
			["fontSize"] = 50,
			["fontName"] = "Expressway",
			["position"] = {
				nil, -- [1]
				nil, -- [2]
				nil, -- [3]
				-380, -- [4]
			},
		}

		BigWigsClassicDB["namespaces"]["BigWigs_Plugins_InfoBox"]["profiles"] = BigWigsClassicDB["namespaces"]["BigWigs_Plugins_InfoBox"]["profiles"] or {}
		BigWigsClassicDB["namespaces"]["BigWigs_Plugins_InfoBox"]["profiles"][name] = {
			["posx"] = 962.8443809535747,
			["posy"] = 72.42229450539753,
		}
		BigWigsClassicDB["namespaces"]["BigWigs_Plugins_InfoBox"]["profiles"][name_healing] = {
			["posx"] = 962.8443809535747,
			["posy"] = 72.42229450539753,
		}

		BigWigsClassicDB["namespaces"]["BigWigs_Plugins_Messages"]["profiles"] = BigWigsClassicDB["namespaces"]["BigWigs_Plugins_Messages"]["profiles"] or {}
		BigWigsClassicDB["namespaces"]["BigWigs_Plugins_Messages"]["profiles"][name] = {
			["outline"] = "OUTLINE",
			["fontSize"] = 16,
			["emphFontName"] = "Expressway",
			["emphFontSize"] = 20,
			["growUpwards"] = false,
			["emphOutline"] = "OUTLINE",
			["emphPosition"] = {
				"TOP", -- [1]
				"TOP", -- [2]
				nil, -- [3]
				-300, -- [4]
			},
			["fontName"] = "Expressway",
			["normalPosition"] = {
				"CENTER", -- [1]
				"CENTER", -- [2]
				nil, -- [3]
				250, -- [4]
			},
		}
		BigWigsClassicDB["namespaces"]["BigWigs_Plugins_Messages"]["profiles"][name_healing] = {
			["outline"] = "OUTLINE",
			["fontSize"] = 16,
			["emphFontName"] = "Expressway",
			["emphFontSize"] = 20,
			["growUpwards"] = false,
			["emphOutline"] = "OUTLINE",
			["emphPosition"] = {
				"TOP", -- [1]
				"TOP", -- [2]
				nil, -- [3]
				-300, -- [4]
			},
			["fontName"] = "Expressway",
			["normalPosition"] = {
				"CENTER", -- [1]
				"CENTER", -- [2]
				nil, -- [3]
				250, -- [4]
			},
		}

		BigWigsClassicDB["namespaces"]["BigWigs_Plugins_Proximity"]["profiles"] = BigWigsClassicDB["namespaces"]["BigWigs_Plugins_Proximity"]["profiles"] or {}
		BigWigsClassicDB["namespaces"]["BigWigs_Plugins_Proximity"]["profiles"][name] = {
			["posx"] = 296,
			["fontSize"] = 18,
			["fontName"] = "Expressway",
			["width"] = 150.0000915527344,
			["objects"] = {
				["title"] = false,
				["close"] = false,
				["ability"] = false,
				["tooltip"] = false,
				["sound"] = false,
			},
			["posy"] = 87,
			["lock"] = true,
			["height"] = 119.9999694824219,
			["font"] = "Friz Quadrata TT",
		}
		BigWigsClassicDB["namespaces"]["BigWigs_Plugins_Proximity"]["profiles"][name_healing] = {
			["posx"] = 296,
			["fontSize"] = 18,
			["fontName"] = "Expressway",
			["width"] = 150.0000915527344,
			["objects"] = {
				["title"] = false,
				["close"] = false,
				["ability"] = false,
				["tooltip"] = false,
				["sound"] = false,
			},
			["posy"] = 87,
			["lock"] = true,
			["height"] = 119.9999694824219,
			["font"] = "Friz Quadrata TT",
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

		BigWigsClassicDB["namespaces"]["BigWigs_Plugins_Raid Icons"]["profiles"] = BigWigsClassicDB["namespaces"]["BigWigs_Plugins_Raid Icons"]["profiles"] or {}
		BigWigsClassicDB["namespaces"]["BigWigs_Plugins_Raid Icons"]["profiles"][name] = {
			["disabled"] = true,
		}
		BigWigsClassicDB["namespaces"]["BigWigs_Plugins_Raid Icons"]["profiles"][name_healing] = {
			["disabled"] = true,
		}

		BigWigsClassicDB["namespaces"]["BigWigs_Plugins_Victory"]["profiles"] = BigWigsClassicDB["namespaces"]["BigWigs_Plugins_Victory"]["profiles"] or {}
		BigWigsClassicDB["namespaces"]["BigWigs_Plugins_Victory"]["profiles"][name] = {
			["bigwigsMsg"] = true,
			["blizzMsg"] = false,
		}
		BigWigsClassicDB["namespaces"]["BigWigs_Plugins_Victory"]["profiles"][name_healing] = {
			["bigwigsMsg"] = true,
			["blizzMsg"] = false,
		}

	end

	-- Set profile
	if layout == 'main' then
		BigWigs.db:SetProfile(name)
	elseif layout == 'healing' then
		BigWigs.db:SetProfile(name_healing)
	end

	L1UI:Print(L["BigWigs profile has been set."])
end
