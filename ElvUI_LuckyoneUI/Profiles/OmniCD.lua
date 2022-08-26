local L1UI, E, L, V, P, G = unpack(select(2, ...))
if not E.Retail then return end

local IsAddOnLoaded = IsAddOnLoaded
local pairs = pairs

-- OmniCD profile
function L1UI:Setup_OmniCD(layout)
	if not IsAddOnLoaded('OmniCD') then return end

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
							["a"] = 1,
							["r"] = 0.05,
							["g"] = 0.05,
							["b"] = 0.05,
						},
						["activeColor"] = {
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
						["useClassColor"] = {
							["active"] = true,
						},
						["activeColor"] = {
							["a"] = 1,
							["b"] = 0.05,
							["g"] = 0.05,
							["r"] = 0.05,
						},
					},
					["textColors"] = {
						["classColor"] = true,
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
							["a"] = 1,
							["b"] = 0.05,
							["g"] = 0.05,
							["r"] = 0.05,
						},
						["activeColor"] = {
							["r"] = 0.05,
							["g"] = 0.05,
							["b"] = 0.05,
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
						["useClassColor"] = {
							["active"] = true,
						},
						["activeColor"] = {
							["a"] = 1,
							["r"] = 0.05,
							["g"] = 0.05,
							["b"] = 0.05,
						},
					},
					["textColors"] = {
						["classColor"] = true,
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
						["useClassColor"] = {
							["inactive"] = false,
							["recharge"] = false,
							["active"] = false,
						},
						["activeColor"] = {
							["b"] = 0.05,
							["g"] = 0.05,
							["r"] = 0.05,
						},
						["inactiveColor"] = {
							["a"] = 1,
							["r"] = 0.05,
							["g"] = 0.05,
							["b"] = 0.05,
						},
					},
					["growUpward"] = true,
					["scale"] = 0.6,
					["locked"] = true,
					["textColors"] = {
						["classColor"] = true,
						["useClassColor"] = {
							["inactive"] = true,
							["recharge"] = true,
							["active"] = true,
						},
					},
					["bgColors"] = {
						["classColor"] = true,
						["activeColor"] = {
							["a"] = 1,
							["b"] = 0.05,
							["g"] = 0.05,
							["r"] = 0.05,
						},
						["useClassColor"] = {
							["active"] = true,
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
						["useClassColor"] = {
							["inactive"] = false,
							["recharge"] = false,
							["active"] = false,
						},
						["activeColor"] = {
							["r"] = 0.05,
							["g"] = 0.05,
							["b"] = 0.05,
						},
						["inactiveColor"] = {
							["a"] = 1,
							["b"] = 0.05,
							["g"] = 0.05,
							["r"] = 0.05,
						},
					},
					["growUpward"] = true,
					["textColors"] = {
						["classColor"] = true,
						["useClassColor"] = {
							["inactive"] = true,
							["recharge"] = true,
							["active"] = true,
						},
					},
					["locked"] = true,
					["bgColors"] = {
						["classColor"] = true,
						["activeColor"] = {
							["a"] = 1,
							["r"] = 0.05,
							["g"] = 0.05,
							["b"] = 0.05,
						},
						["useClassColor"] = {
							["active"] = true,
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
			OmniCDDB["profiles"][profile]["Party"][frame]["spells"] = {
				["10060"] = true,
				["102342"] = false,
				["102543"] = true,
				["102558"] = true,
				["102560"] = true,
				["102793"] = true,
				["106951"] = true,
				["107574"] = true,
				["108238"] = false,
				["108271"] = false,
				["108280"] = true,
				["108968"] = false,
				["108978"] = false,
				["109248"] = true,
				["109964"] = false,
				["1122"] = true,
				["113858"] = true,
				["113860"] = true,
				["114018"] = true,
				["114050"] = true,
				["114051"] = true,
				["114556"] = false,
				["115310"] = false,
				["115750"] = false,
				["118038"] = false,
				["119898"] = false,
				["12042"] = true,
				["121471"] = true,
				["122278"] = false,
				["122783"] = false,
				["123904"] = true,
				["12472"] = true,
				["12975"] = true,
				["132578"] = true,
				["13750"] = true,
				["152279"] = true,
				["1719"] = true,
				["184364"] = false,
				["1856"] = false,
				["186289"] = false,
				["187650"] = false,
				["192249"] = true,
				["19236"] = false,
				["193530"] = true,
				["194223"] = true,
				["196029"] = false,
				["197268"] = false,
				["198111"] = false,
				["198589"] = false,
				["198838"] = false,
				["199452"] = false,
				["204018"] = true,
				["204336"] = false,
				["205180"] = true,
				["205604"] = false,
				["205636"] = true,
				["20711"] = false,
				["2094"] = false,
				["210256"] = false,
				["210918"] = false,
				["212295"] = false,
				["213602"] = false,
				["215652"] = false,
				["215982"] = false,
				["216331"] = false,
				["228049"] = false,
				["22812"] = false,
				["235219"] = false,
				["236320"] = false,
				["23920"] = false,
				["265187"] = true,
				["266779"] = true,
				["279302"] = true,
				["288613"] = true,
				["29166"] = false,
				["30884"] = false,
				["319217"] = false,
				["31935"] = false,
				["322109"] = true,
				["322118"] = true,
				["323436"] = false,
				["325197"] = true,
				["336135"] = false,
				["342245"] = false,
				["363117"] = false,
				["363121"] = false,
				["42650"] = true,
				["47482"] = false,
				["47536"] = false,
				["48020"] = false,
				["48707"] = false,
				["49206"] = false,
				["50334"] = true,
				["51052"] = false,
				["51533"] = true,
				["5246"] = false,
				["5277"] = false,
				["53480"] = false,
				["59752"] = false,
				["61336"] = false,
				["62618"] = false,
				["64044"] = false,
				["6789"] = false,
				["8122"] = false,
				["8143"] = false,
				["853"] = false,
				["86949"] = false,
			}
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
