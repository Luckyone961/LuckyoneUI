local L1UI, E, L, V, P, G = unpack(select(2, ...))

local IsAddOnLoaded = IsAddOnLoaded
local LoadAddOn = LoadAddOn
local pairs = pairs

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

	-- Flavor specific db name
	local DB = E.Retail and BigWigs3DB or BigWigsClassicDB
	local iconDB = E.Retail and BigWigsIconDB or BigWigsIconClassicDB

	-- Profile creation
	DB["profiles"] = DB["profiles"] or {}

	for _, profile in pairs({name, name_healing}) do
		DB["profiles"][profile] = DB["profiles"][profile] or {}
		DB["profiles"][profile]["showZoneMessages"] = false
		DB["profiles"][profile]["fakeDBMVersion"] = true
		DB["profiles"][profile]["flash"] = false
	end

	-- Disable minimap icon
	iconDB["hide"] = true

	-- Profile data
	DB["namespaces"]["BigWigs_Plugins_AutoReply"]["profiles"] = DB["namespaces"]["BigWigs_Plugins_AutoReply"]["profiles"] or {}
	DB["namespaces"]["BigWigs_Plugins_AutoReply"]["profiles"][name] = {
		["exitCombatOther"] = 3,
		["disabled"] = false,
		["modeOther"] = 2,
	}
	DB["namespaces"]["BigWigs_Plugins_AutoReply"]["profiles"][name_healing] = {
		["exitCombatOther"] = 3,
		["disabled"] = false,
		["modeOther"] = 2,
	}

	DB["namespaces"]["BigWigs_Plugins_Bars"]["profiles"] = DB["namespaces"]["BigWigs_Plugins_Bars"]["profiles"] or {}
	DB["namespaces"]["BigWigs_Plugins_Bars"]["profiles"][name] = {
		["barStyle"] = "ElvUI",
		["BigWigsAnchor_height"] = 15.99998760223389,
		["BigWigsAnchor_width"] = 221.0000152587891,
		["BigWigsAnchor_x"] = 412.7110342991,
		["BigWigsAnchor_y"] = 212.222422673558,
		["BigWigsEmphasizeAnchor_height"] = 15.99998760223389,
		["BigWigsEmphasizeAnchor_width"] = 221.0000152587891,
		["BigWigsEmphasizeAnchor_x"] = 598,
		["BigWigsEmphasizeAnchor_y"] = 178.0001345184974,
		["emphasizeMove"] = false,
		["emphasizeMultiplier"] = 1,
		["emphasizeRestart"] = false,
		["emphasizeTime"] = 8,
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
		["visibleBarLimit"] = 8,
		["visibleBarLimitEmph"] = 5,
	}
	DB["namespaces"]["BigWigs_Plugins_Bars"]["profiles"][name_healing] = {
		["barStyle"] = "ElvUI",
		["BigWigsAnchor_height"] = 15.99998760223389,
		["BigWigsAnchor_width"] = 221.0000305175781,
		["BigWigsAnchor_x"] = 355.8220138243451,
		["BigWigsAnchor_y"] = 212.222422673558,
		["BigWigsEmphasizeAnchor_height"] = 15.99998760223389,
		["BigWigsEmphasizeAnchor_width"] = 221.0000305175781,
		["BigWigsEmphasizeAnchor_x"] = 866.088996666258,
		["BigWigsEmphasizeAnchor_y"] = 198.2889804958904,
		["emphasizeMove"] = false,
		["emphasizeMultiplier"] = 1,
		["emphasizeRestart"] = false,
		["emphasizeTime"] = 8,
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
		["visibleBarLimit"] = 8,
		["visibleBarLimitEmph"] = 5,
	}

	DB["namespaces"]["BigWigs_Plugins_BossBlock"]["profiles"] = DB["namespaces"]["BigWigs_Plugins_BossBlock"]["profiles"] or {}
	DB["namespaces"]["BigWigs_Plugins_BossBlock"]["profiles"][name] = {
		["blockTalkingHeads"] = {
			true, -- [1]
			nil, -- [2]
			nil, -- [3]
			true, -- [4]
		},
	}
	DB["namespaces"]["BigWigs_Plugins_BossBlock"]["profiles"][name_healing] = {
		["blockTalkingHeads"] = {
			true, -- [1]
			nil, -- [2]
			nil, -- [3]
			true, -- [4]
		},
	}

	DB["namespaces"]["BigWigs_Plugins_Colors"]["profiles"] = DB["namespaces"]["BigWigs_Plugins_Colors"]["profiles"] or {}
	DB["namespaces"]["BigWigs_Plugins_Colors"]["profiles"][name] = {
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
	DB["namespaces"]["BigWigs_Plugins_Colors"]["profiles"][name_healing] = {
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

	DB["namespaces"]["BigWigs_Plugins_Countdown"]["profiles"] = DB["namespaces"]["BigWigs_Plugins_Countdown"]["profiles"] or {}
	DB["namespaces"]["BigWigs_Plugins_Countdown"]["profiles"][name] = {
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
	DB["namespaces"]["BigWigs_Plugins_Countdown"]["profiles"][name_healing] = {
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

	DB["namespaces"]["BigWigs_Plugins_InfoBox"]["profiles"] = DB["namespaces"]["BigWigs_Plugins_InfoBox"]["profiles"] or {}
	DB["namespaces"]["BigWigs_Plugins_InfoBox"]["profiles"][name] = {
		["posx"] = 962.8443809535747,
		["posy"] = 72.42229450539753,
	}
	DB["namespaces"]["BigWigs_Plugins_InfoBox"]["profiles"][name_healing] = {
		["posx"] = 962.8443809535747,
		["posy"] = 72.42229450539753,
	}

	DB["namespaces"]["BigWigs_Plugins_Messages"]["profiles"] = DB["namespaces"]["BigWigs_Plugins_Messages"]["profiles"] or {}
	DB["namespaces"]["BigWigs_Plugins_Messages"]["profiles"][name] = {
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
	DB["namespaces"]["BigWigs_Plugins_Messages"]["profiles"][name_healing] = {
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

	DB["namespaces"]["BigWigs_Plugins_Proximity"]["profiles"] = DB["namespaces"]["BigWigs_Plugins_Proximity"]["profiles"] or {}
	DB["namespaces"]["BigWigs_Plugins_Proximity"]["profiles"][name] = {
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
	DB["namespaces"]["BigWigs_Plugins_Proximity"]["profiles"][name_healing] = {
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

	DB["namespaces"]["BigWigs_Plugins_Pull"]["profiles"] = DB["namespaces"]["BigWigs_Plugins_Pull"]["profiles"] or {}
	DB["namespaces"]["BigWigs_Plugins_Pull"]["profiles"][name] = {
		["voice"] = "enUS: Default (Female)",
		["endPullSound"] = "None",
	}
	DB["namespaces"]["BigWigs_Plugins_Pull"]["profiles"][name_healing] = {
		["voice"] = "enUS: Default (Female)",
		["endPullSound"] = "None",
	}

	DB["namespaces"]["BigWigs_Plugins_Raid Icons"]["profiles"] = DB["namespaces"]["BigWigs_Plugins_Raid Icons"]["profiles"] or {}
	DB["namespaces"]["BigWigs_Plugins_Raid Icons"]["profiles"][name] = {
		["disabled"] = true,
	}
	DB["namespaces"]["BigWigs_Plugins_Raid Icons"]["profiles"][name_healing] = {
		["disabled"] = true,
	}

	DB["namespaces"]["BigWigs_Plugins_Victory"]["profiles"] = DB["namespaces"]["BigWigs_Plugins_Victory"]["profiles"] or {}
	DB["namespaces"]["BigWigs_Plugins_Victory"]["profiles"][name] = {
		["bigwigsMsg"] = true,
		["blizzMsg"] = false,
	}
	DB["namespaces"]["BigWigs_Plugins_Victory"]["profiles"][name_healing] = {
		["bigwigsMsg"] = true,
		["blizzMsg"] = false,
	}

	if E.Retail then
		-- Disable LibDualSpec to set the profile
		DB["namespaces"]["LibDualSpec-1.0"] = DB["namespaces"]["LibDualSpec-1.0"] or {}
		DB["namespaces"]["LibDualSpec-1.0"]["char"][E.mynameRealm]["enabled"] = false

		-- AltPower db
		DB["namespaces"]["BigWigs_Plugins_AltPower"]["profiles"] = DB["namespaces"]["BigWigs_Plugins_AltPower"]["profiles"] or {}
		DB["namespaces"]["BigWigs_Plugins_AltPower"]["profiles"][name] = {
			["disabled"] = true,
		}
		DB["namespaces"]["BigWigs_Plugins_AltPower"]["profiles"][name_healing] = {
			["disabled"] = true,
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
