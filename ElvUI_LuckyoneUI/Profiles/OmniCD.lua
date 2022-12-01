local L1UI, E, L, V, P, G = unpack(select(2, ...))
if not E.Retail then return end

local pairs = pairs

-- OmniCD profile
function L1UI:Setup_OmniCD(layout)
	if not E:IsAddOnEnabled('OmniCD') then return end

	-- Profile names
	local name = L1UI.Me and 'Luckyone Main' or 'Luckyone Main '..L1UI.Version
	local name_healing = L1UI.Me and 'Luckyone Healing' or 'Luckyone Healing '..L1UI.Version

	-- Disable LibDualSpec to set the profile
	OmniCDDB["namespaces"]["LibDualSpec-1.0"] = OmniCDDB["namespaces"]["LibDualSpec-1.0"] or {}
	OmniCDDB["namespaces"]["LibDualSpec-1.0"]["char"][E.mynameRealm]["enabled"] = false

	-- Global db
	OmniCDDB["cooldowns"] = {}
	OmniCDDB["global"]["disableElvMsg"] = true

	-- Shared db
	for _, profile in pairs({name, name_healing}) do
		-- Profile creation
		OmniCDDB["profiles"][profile] = OmniCDDB["profiles"][profile] or {}
		OmniCDDB["profiles"][profile]["General"] = OmniCDDB["profiles"][profile]["General"] or {}
		OmniCDDB["profiles"][profile]["Party"] = OmniCDDB["profiles"][profile]["Party"] or {}
		-- General db
		OmniCDDB["profiles"][profile]["General"]["fonts"] = {
			["statusBar"] = {
				["font"] = "Expressway",
				["flag"] = "OUTLINE",
				["size"] = 18,
			},
			["optionSmall"] = {
				["font"] = "Expressway",
				["flag"] = "OUTLINE",
			},
			["anchor"] = {
				["font"] = "Expressway",
				["flag"] = "OUTLINE",
			},
			["icon"] = {
				["font"] = "Expressway",
				["size"] = 12,
			},
			["option"] = {
				["font"] = "Expressway",
				["flag"] = "OUTLINE",
			},
		}
		OmniCDDB["profiles"][profile]["General"]["textures"] = {
			["statusBar"] = {
				["BG"] = "Minimalist",
				["bar"] = "Minimalist",
			},
		}
		-- Party db
		OmniCDDB["profiles"][profile]["Party"]["noneZoneSetting"] = "party"
		OmniCDDB["profiles"][profile]["Party"]["scenarioZoneSetting"] = "party"
		OmniCDDB["profiles"][profile]["Party"]["visibility"] = {
			["none"] = true,
			["scenario"] = true,
		}
	end

	-- Main profile
	OmniCDDB["profiles"][name]["Party"] = {
		["party"] = {
			["extraBars"] = {
				["interruptBar"] = {
					["scale"] = 0.6,
					["statusBarWidth"] = 280,
					["barColors"] = {
						["classColor"] = false,
						["inactiveColor"] = {
							["a"] = 0.9,
							["r"] = 0.05,
							["g"] = 0.05,
							["b"] = 0.05,
						},
						["rechargeColor"] = {
							["a"] = 0.9,
							["b"] = 0.05,
							["g"] = 0.05,
							["r"] = 0.05,
						},
						["activeColor"] = {
							["a"] = 0.9,
							["b"] = 0.05,
							["g"] = 0.05,
							["r"] = 0.05,
						},
						["useClassColor"] = {
							["inactive"] = false,
							["recharge"] = false,
							["active"] = false,
						},
					},
					["locked"] = true,
					["paddingY"] = 1,
					["columns"] = 10,
					["bgColors"] = {
						["classColor"] = true,
						["rechargeColor"] = {
							["b"] = 0.61,
							["g"] = 0.56,
							["r"] = 0.54,
						},
						["useClassColor"] = {
							["recharge"] = false,
						},
						["activeColor"] = {
							["a"] = 0.9,
							["b"] = 0.61,
							["g"] = 0.56,
							["r"] = 0.54,
						},
					},
					["textColors"] = {
						["classColor"] = true,
						["inactiveColor"] = {
							["a"] = 1,
						},
						["rechargeColor"] = {
							["a"] = 1,
						},
						["activeColor"] = {
							["a"] = 1,
						},
						["useClassColor"] = {
							["inactive"] = true,
							["recharge"] = true,
							["active"] = true,
						},
					},
					["hideSpark"] = true,
				},
			},
			["highlight"] = {
				["glowType"] = "actionBar",
			},
			["icons"] = {
				["counterScale"] = 0.9,
				["scale"] = 0.9,
				["showTooltip"] = true,
				["chargeScale"] = 0.9,
			},
			["position"] = {
				["paddingX"] = 1,
				["attach"] = "TOPLEFT",
				["preset"] = "TOPLEFT",
				["offsetX"] = 1,
				["anchor"] = "TOPRIGHT",
				["paddingY"] = 1,
			},
			["general"] = {
				["showPlayer"] = true,
			},
			["manualPos"] = {
				["raidCDBar"] = {
					["y"] = 384.3555214597109,
					["x"] = 682.3111276328564,
				},
				["interruptBar"] = {
					["y"] = 417.7780917134624,
					["x"] = 256.3552796449858,
				},
			},
		},
		["arena"] = {
			["extraBars"] = {
				["interruptBar"] = {
					["scale"] = 0.6,
					["statusBarWidth"] = 280,
					["barColors"] = {
						["classColor"] = false,
						["inactiveColor"] = {
							["a"] = 0.9,
							["r"] = 0.05,
							["g"] = 0.05,
							["b"] = 0.05,
						},
						["rechargeColor"] = {
							["a"] = 0.9,
							["b"] = 0.05,
							["g"] = 0.05,
							["r"] = 0.05,
						},
						["activeColor"] = {
							["a"] = 0.9,
							["b"] = 0.05,
							["g"] = 0.05,
							["r"] = 0.05,
						},
						["useClassColor"] = {
							["inactive"] = false,
							["recharge"] = false,
							["active"] = false,
						},
					},
					["locked"] = true,
					["paddingY"] = 1,
					["enabled"] = true,
					["columns"] = 10,
					["bgColors"] = {
						["classColor"] = true,
						["rechargeColor"] = {
							["b"] = 0.61,
							["g"] = 0.56,
							["r"] = 0.54,
						},
						["useClassColor"] = {
							["recharge"] = false,
						},
						["activeColor"] = {
							["a"] = 0.9,
							["b"] = 0.61,
							["g"] = 0.56,
							["r"] = 0.54,
						},
					},
					["textColors"] = {
						["classColor"] = true,
						["inactiveColor"] = {
							["a"] = 1,
						},
						["rechargeColor"] = {
							["a"] = 1,
						},
						["activeColor"] = {
							["a"] = 1,
						},
						["useClassColor"] = {
							["inactive"] = true,
							["recharge"] = true,
							["active"] = true,
						},
					},
					["hideSpark"] = true,
				},
			},
			["manualPos"] = {
				["interruptBar"] = {
					["y"] = 417.7780917134624,
					["x"] = 256.3552796449858,
				},
				["raidCDBar"] = {
					["y"] = 384.3555214597109,
					["x"] = 682.3111276328564,
				},
			},
			["icons"] = {
				["counterScale"] = 0.9,
				["chargeScale"] = 0.9,
				["scale"] = 0.9,
				["showTooltip"] = true,
			},
			["position"] = {
				["paddingX"] = 1,
				["attach"] = "TOPLEFT",
				["preset"] = "TOPLEFT",
				["offsetX"] = 1,
				["anchor"] = "TOPRIGHT",
				["paddingY"] = 1,
			},
			["highlight"] = {
				["glowType"] = "actionBar",
			},
			["general"] = {
				["showPlayer"] = true,
				["zoneSelected"] = "party",
			},
		},
	}

	-- Healing profile
	OmniCDDB["profiles"][name_healing]["Party"] = {
		["party"] = {
			["extraBars"] = {
				["interruptBar"] = {
					["columns"] = 10,
					["hideSpark"] = true,
					["statusBarWidth"] = 363,
					["barColors"] = {
						["classColor"] = false,
						["inactiveColor"] = {
							["a"] = 0.9,
							["r"] = 0.05,
							["g"] = 0.05,
							["b"] = 0.05,
						},
						["rechargeColor"] = {
							["a"] = 0.9,
							["b"] = 0.05,
							["g"] = 0.05,
							["r"] = 0.05,
						},
						["activeColor"] = {
							["a"] = 0.9,
							["b"] = 0.05,
							["g"] = 0.05,
							["r"] = 0.05,
						},
						["useClassColor"] = {
							["inactive"] = false,
							["recharge"] = false,
							["active"] = false,
						},
					},
					["growUpward"] = true,
					["scale"] = 0.6,
					["locked"] = true,
					["textColors"] = {
						["classColor"] = true,
						["inactiveColor"] = {
							["a"] = 1,
						},
						["rechargeColor"] = {
							["a"] = 1,
						},
						["activeColor"] = {
							["a"] = 1,
						},
						["useClassColor"] = {
							["inactive"] = true,
							["recharge"] = true,
							["active"] = true,
						},
					},
					["bgColors"] = {
						["classColor"] = true,
						["rechargeColor"] = {
							["b"] = 0.61,
							["g"] = 0.56,
							["r"] = 0.54,
						},
						["useClassColor"] = {
							["recharge"] = false,
						},
						["activeColor"] = {
							["a"] = 0.9,
							["b"] = 0.61,
							["g"] = 0.56,
							["r"] = 0.54,
						},
					},
					["paddingY"] = 2,
				},
			},
			["manualPos"] = {
				["interruptBar"] = {
					["y"] = 285.5115303509865,
					["x"] = 343.1108807040528,
				},
				["raidCDBar"] = {
					["y"] = 384.3555214597109,
					["x"] = 682.3111276328564,
				},
			},
			["position"] = {
				["attachMore"] = "LEFT",
				["columns"] = 3,
				["paddingX"] = 2,
				["attach"] = "LEFT",
				["preset"] = "manual",
				["offsetX"] = 0,
				["anchor"] = "LEFT",
				["offsetY"] = 44,
				["anchorMore"] = "LEFT",
				["paddingY"] = 2,
			},
			["general"] = {
				["showPlayer"] = true,
			},
			["icons"] = {
				["scale"] = 0.83,
				["counterScale"] = 0.8,
				["chargeScale"] = 0.8,
				["showTooltip"] = true,
			},
			["highlight"] = {
				["glowType"] = "actionBar",
			},
		},
		["arena"] = {
			["extraBars"] = {
				["interruptBar"] = {
					["enabled"] = true,
					["columns"] = 10,
					["hideSpark"] = true,
					["statusBarWidth"] = 363,
					["barColors"] = {
						["classColor"] = false,
						["inactiveColor"] = {
							["a"] = 0.9,
							["r"] = 0.05,
							["g"] = 0.05,
							["b"] = 0.05,
						},
						["rechargeColor"] = {
							["a"] = 0.9,
							["b"] = 0.05,
							["g"] = 0.05,
							["r"] = 0.05,
						},
						["activeColor"] = {
							["a"] = 0.9,
							["b"] = 0.05,
							["g"] = 0.05,
							["r"] = 0.05,
						},
						["useClassColor"] = {
							["inactive"] = false,
							["recharge"] = false,
							["active"] = false,
						},
					},
					["growUpward"] = true,
					["textColors"] = {
						["classColor"] = true,
						["inactiveColor"] = {
							["a"] = 1,
						},
						["rechargeColor"] = {
							["a"] = 1,
						},
						["activeColor"] = {
							["a"] = 1,
						},
						["useClassColor"] = {
							["inactive"] = true,
							["recharge"] = true,
							["active"] = true,
						},
					},
					["locked"] = true,
					["bgColors"] = {
						["classColor"] = true,
						["rechargeColor"] = {
							["b"] = 0.61,
							["g"] = 0.56,
							["r"] = 0.54,
						},
						["useClassColor"] = {
							["recharge"] = false,
						},
						["activeColor"] = {
							["a"] = 0.9,
							["b"] = 0.61,
							["g"] = 0.56,
							["r"] = 0.54,
						},
					},
					["scale"] = 0.6,
					["paddingY"] = 2,
				},
			},
			["highlight"] = {
				["glowType"] = "actionBar",
			},
			["position"] = {
				["attachMore"] = "LEFT",
				["columns"] = 3,
				["paddingX"] = 2,
				["attach"] = "LEFT",
				["preset"] = "manual",
				["offsetX"] = 0,
				["anchor"] = "LEFT",
				["offsetY"] = 44,
				["anchorMore"] = "LEFT",
				["paddingY"] = 2,
			},
			["manualPos"] = {
				["raidCDBar"] = {
					["y"] = 384.3555214597109,
					["x"] = 682.3111276328564,
				},
				["interruptBar"] = {
					["y"] = 285.5115303509865,
					["x"] = 343.1108807040528,
				},
			},
			["icons"] = {
				["scale"] = 0.83,
				["counterScale"] = 0.8,
				["chargeScale"] = 0.8,
				["showTooltip"] = true,
			},
			["general"] = {
				["zoneSelected"] = "party",
				["showPlayer"] = true,
			},
		},
	}

	-- Add spell IDs
	for _, profile in pairs({name, name_healing}) do
		for _, frame in pairs({"party", "arena"}) do
			OmniCDDB["profiles"][profile]["Party"][frame]["spells"] = OmniCDDB["profiles"][profile]["Party"][frame]["spells"] or {}
			OmniCDDB["profiles"][profile]["Party"][frame]["spells"] = {}
		end
	end

	-- Set profile
	if layout == 'main' then
		OmniCDDB["profileKeys"][E.mynameRealm] = name
	elseif layout == 'healing' then
		OmniCDDB["profileKeys"][E.mynameRealm] = name_healing
	end

	L1UI:Print(L["OmniCD profile has been set."])
end
