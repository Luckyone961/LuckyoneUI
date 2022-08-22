local L1UI, E, L, V, P, G = unpack(select(2, ...))
if not E.Retail then return end

local IsAddOnLoaded = IsAddOnLoaded

-- OmniCD profile
function L1UI:Setup_OmniCD(layout)
	if not IsAddOnLoaded('OmniCD') then return end

	-- Profile names
	local name = L1UI.Me and 'Luckyone Main' or 'Luckyone Main '..L1UI.Version
	local name_healing = L1UI.Me and 'Luckyone Healing' or 'Luckyone Healing '..L1UI.Version

	-- Disable LibDualSpec to set the profile
	OmniCDDB["namespaces"]["LibDualSpec-1.0"]["char"][E.mynameRealm]["enabled"] = false

	-- Global db
	OmniCDDB["cooldowns"] = {}
	OmniCDDB["global"]["disableElvMsg"] = true

	-- Profile creation
	OmniCDDB["profiles"][name] = OmniCDDB["profiles"][name] or {}
	OmniCDDB["profiles"][name_healing] = OmniCDDB["profiles"][name_healing] or {}

	-- Main profile
	OmniCDDB["profiles"][name]["General"] = {
		["fonts"] = {
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
		},
		["textures"] = {
			["statusBar"] = {
				["BG"] = "Minimalist",
				["bar"] = "Minimalist",
			},
		},
	}
	OmniCDDB["profiles"][name]["Party"] = {
		["noneZoneSetting"] = "party",
		["scenarioZoneSetting"] = "party",
		["visibility"] = {
			["none"] = true,
			["scenario"] = true,
		},
		["party"] = {
			["extraBars"] = {
				["interruptBar"] = {
					["scale"] = 0.6000000000000001,
					["statusBarWidth"] = 280,
					["barColors"] = {
						["classColor"] = false,
						["inactiveColor"] = {
							["a"] = 1,
							["r"] = 0.05098039215686274,
							["g"] = 0.05098039215686274,
							["b"] = 0.05098039215686274,
						},
						["activeColor"] = {
							["b"] = 0.05882352941176471,
							["g"] = 0.05882352941176471,
							["r"] = 0.05882352941176471,
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
							["b"] = 0.05098039215686274,
							["g"] = 0.05098039215686274,
							["r"] = 0.05098039215686274,
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
			["spells"] = {
				["326059"] = true,
				["114018"] = true,
				["322109"] = false,
				["116849"] = false,
				["8143"] = false,
				["12975"] = true,
				["279302"] = true,
				["202138"] = true,
				["115750"] = false,
				["108199"] = true,
				["212295"] = false,
				["187650"] = false,
				["8122"] = false,
				["235219"] = false,
				["329554"] = true,
				["205180"] = true,
				["192077"] = true,
				["104773"] = false,
				["1122"] = true,
				["102793"] = true,
				["113860"] = true,
				["5246"] = false,
				["215652"] = false,
				["102543"] = true,
				["306830"] = true,
				["319952"] = true,
				["210918"] = false,
				["118000"] = false,
				["55233"] = false,
				["336135"] = false,
				["213602"] = false,
				["121471"] = true,
				["102560"] = true,
				["107574"] = true,
				["108968"] = false,
				["325289"] = true,
				["323654"] = true,
				["1719"] = true,
				["198067"] = true,
				["328278"] = true,
				["137639"] = true,
				["122783"] = false,
				["10060"] = true,
				["184364"] = false,
				["132578"] = true,
				["53480"] = false,
				["63560"] = true,
				["13750"] = true,
				["46924"] = false,
				["325197"] = true,
				["312321"] = true,
				["47568"] = true,
				["48707"] = false,
				["324143"] = true,
				["308491"] = true,
				["338142"] = true,
				["325028"] = true,
				["102558"] = true,
				["323639"] = true,
				["47482"] = false,
				["23920"] = false,
				["198111"] = false,
				["236320"] = false,
				["327104"] = true,
				["62618"] = false,
				["31230"] = false,
				["194223"] = true,
				["204336"] = false,
				["307443"] = true,
				["152279"] = true,
				["108238"] = false,
				["31935"] = false,
				["228049"] = false,
				["328547"] = true,
				["205179"] = false,
				["325727"] = true,
				["327661"] = true,
				["322118"] = true,
				["198838"] = false,
				["109248"] = true,
				["123904"] = true,
				["122470"] = false,
				["196029"] = false,
				["324386"] = true,
				["326860"] = true,
				["19236"] = false,
				["312202"] = true,
				["265187"] = true,
				["265202"] = false,
				["325886"] = true,
				["22812"] = false,
				["202137"] = true,
				["55342"] = false,
				["215982"] = false,
				["64044"] = false,
				["314791"] = true,
				["108978"] = false,
				["311648"] = true,
				["321792"] = true,
				["324128"] = true,
				["108280"] = true,
				["205636"] = true,
				["86659"] = true,
				["325013"] = true,
				["288613"] = true,
				["320674"] = true,
				["1856"] = false,
				["325640"] = true,
				["319217"] = false,
				["328305"] = true,
				["19574"] = true,
				["198103"] = true,
				["197268"] = false,
				["328231"] = true,
				["342245"] = false,
				["199452"] = false,
				["50334"] = true,
				["324724"] = true,
				["853"] = false,
				["323673"] = true,
				["198589"] = false,
				["108271"] = false,
				["30884"] = false,
				["323547"] = true,
				["42650"] = true,
				["314793"] = true,
				["102342"] = false,
				["113858"] = true,
				["109304"] = false,
				["6789"] = false,
				["193530"] = true,
				["192058"] = false,
				["114052"] = false,
				["12042"] = true,
				["47536"] = false,
				["114556"] = false,
				["48020"] = false,
				["2094"] = false,
				["210256"] = false,
				["227847"] = false,
				["86949"] = false,
				["324149"] = true,
				["328923"] = true,
				["304971"] = true,
				["228260"] = false,
				["323546"] = true,
				["152173"] = true,
				["325216"] = true,
				["310454"] = true,
				["328204"] = true,
				["12472"] = true,
				["20711"] = false,
				["307865"] = true,
				["51052"] = false,
				["114051"] = false,
				["49206"] = true,
				["275699"] = true,
				["5277"] = false,
				["243435"] = false,
				["319454"] = false,
				["106951"] = true,
				["204018"] = true,
				["323764"] = true,
				["77761"] = true,
				["323436"] = false,
				["205604"] = false,
				["192249"] = true,
				["317320"] = false,
				["315443"] = true,
				["324220"] = true,
				["317009"] = true,
				["109964"] = false,
				["114050"] = false,
				["316958"] = true,
			},
			["icons"] = {
				["counterScale"] = 0.9,
				["scale"] = 0.9000000000000001,
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
					["y"] = 394.3113376730071,
					["x"] = 256.3552579435964,
				},
			},
		},
		["arena"] = {
			["extraBars"] = {
				["interruptBar"] = {
					["scale"] = 0.6000000000000001,
					["statusBarWidth"] = 280,
					["barColors"] = {
						["classColor"] = false,
						["inactiveColor"] = {
							["a"] = 1,
							["b"] = 0.05098039215686274,
							["g"] = 0.05098039215686274,
							["r"] = 0.05098039215686274,
						},
						["activeColor"] = {
							["r"] = 0.05882352941176471,
							["g"] = 0.05882352941176471,
							["b"] = 0.05882352941176471,
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
							["r"] = 0.05098039215686274,
							["g"] = 0.05098039215686274,
							["b"] = 0.05098039215686274,
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
					["y"] = 394.3113376730071,
					["x"] = 256.3552579435964,
				},
				["raidCDBar"] = {
					["y"] = 384.3555214597109,
					["x"] = 682.3111276328564,
				},
			},
			["spells"] = {
				["326059"] = true,
				["114018"] = true,
				["322109"] = false,
				["312202"] = true,
				["8143"] = false,
				["12975"] = true,
				["279302"] = true,
				["202138"] = true,
				["115750"] = false,
				["108199"] = true,
				["212295"] = false,
				["187650"] = false,
				["8122"] = false,
				["235219"] = false,
				["329554"] = true,
				["205180"] = true,
				["192077"] = true,
				["104773"] = false,
				["1122"] = true,
				["102793"] = true,
				["113860"] = true,
				["5246"] = false,
				["215652"] = false,
				["114050"] = false,
				["306830"] = true,
				["319952"] = true,
				["210918"] = false,
				["118000"] = false,
				["55233"] = false,
				["336135"] = false,
				["213602"] = false,
				["121471"] = true,
				["102560"] = true,
				["107574"] = true,
				["108968"] = false,
				["325289"] = true,
				["323654"] = true,
				["1719"] = true,
				["109964"] = false,
				["328278"] = true,
				["137639"] = true,
				["122783"] = false,
				["10060"] = true,
				["132578"] = true,
				["53480"] = false,
				["63560"] = true,
				["13750"] = true,
				["325028"] = true,
				["325197"] = true,
				["312321"] = true,
				["328231"] = true,
				["48707"] = false,
				["198589"] = false,
				["324143"] = true,
				["210256"] = false,
				["106951"] = true,
				["338142"] = true,
				["102558"] = true,
				["323639"] = true,
				["47482"] = false,
				["23920"] = false,
				["198111"] = false,
				["236320"] = false,
				["327104"] = true,
				["31230"] = false,
				["194223"] = true,
				["204336"] = false,
				["307443"] = true,
				["152279"] = true,
				["31935"] = false,
				["228049"] = false,
				["108978"] = false,
				["328547"] = true,
				["205179"] = false,
				["324724"] = true,
				["325727"] = true,
				["327661"] = true,
				["322118"] = true,
				["62618"] = false,
				["316958"] = true,
				["205604"] = false,
				["122470"] = false,
				["196029"] = false,
				["324386"] = true,
				["308491"] = true,
				["198067"] = true,
				["324220"] = true,
				["22812"] = false,
				["77761"] = true,
				["198838"] = false,
				["323436"] = false,
				["202137"] = true,
				["55342"] = false,
				["215982"] = false,
				["204018"] = true,
				["314791"] = true,
				["243435"] = false,
				["325886"] = true,
				["321792"] = true,
				["199452"] = false,
				["325013"] = true,
				["64044"] = false,
				["86659"] = true,
				["116849"] = false,
				["46924"] = false,
				["317320"] = false,
				["184364"] = false,
				["325640"] = true,
				["320674"] = true,
				["108238"] = false,
				["342245"] = false,
				["198103"] = true,
				["197268"] = false,
				["114051"] = false,
				["51052"] = false,
				["152173"] = true,
				["50334"] = true,
				["304971"] = true,
				["853"] = false,
				["323673"] = true,
				["265202"] = false,
				["12042"] = true,
				["30884"] = false,
				["323547"] = true,
				["42650"] = true,
				["328204"] = true,
				["6789"] = false,
				["113858"] = true,
				["109304"] = false,
				["108271"] = false,
				["193530"] = true,
				["328305"] = true,
				["49206"] = true,
				["20711"] = false,
				["47536"] = false,
				["114556"] = false,
				["314793"] = true,
				["102342"] = false,
				["192058"] = false,
				["227847"] = false,
				["86949"] = false,
				["324149"] = true,
				["114052"] = false,
				["2094"] = false,
				["228260"] = false,
				["323546"] = true,
				["19574"] = true,
				["325216"] = true,
				["310454"] = true,
				["48020"] = false,
				["12472"] = true,
				["328923"] = true,
				["307865"] = true,
				["108280"] = true,
				["324128"] = true,
				["319217"] = false,
				["275699"] = true,
				["5277"] = false,
				["1856"] = false,
				["319454"] = false,
				["288613"] = true,
				["205636"] = true,
				["323764"] = true,
				["311648"] = true,
				["123904"] = true,
				["47568"] = true,
				["192249"] = true,
				["102543"] = true,
				["315443"] = true,
				["265187"] = true,
				["317009"] = true,
				["19236"] = false,
				["326860"] = true,
				["109248"] = true,
			},
			["icons"] = {
				["counterScale"] = 0.9,
				["chargeScale"] = 0.9,
				["scale"] = 0.9000000000000001,
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
	OmniCDDB["profiles"][name_healing]["General"] = {
		["fonts"] = {
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
		},
		["textures"] = {
			["statusBar"] = {
				["BG"] = "Minimalist",
				["bar"] = "Minimalist",
			},
		},
	}
	OmniCDDB["profiles"][name_healing]["Party"] = {
		["noneZoneSetting"] = "party",
		["scenarioZoneSetting"] = "party",
		["visibility"] = {
			["none"] = true,
			["scenario"] = true,
		},
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
							["b"] = 0.05882352941176471,
							["g"] = 0.05882352941176471,
							["r"] = 0.05882352941176471,
						},
						["inactiveColor"] = {
							["a"] = 1,
							["r"] = 0.05098039215686274,
							["g"] = 0.05098039215686274,
							["b"] = 0.05098039215686274,
						},
					},
					["growUpward"] = true,
					["scale"] = 0.6000000000000001,
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
							["b"] = 0.05098039215686274,
							["g"] = 0.05098039215686274,
							["r"] = 0.05098039215686274,
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
			["spells"] = {
				["326059"] = true,
				["114018"] = true,
				["322109"] = false,
				["116849"] = false,
				["326860"] = true,
				["12975"] = true,
				["279302"] = true,
				["202138"] = true,
				["115750"] = false,
				["108199"] = true,
				["212295"] = false,
				["187650"] = false,
				["8122"] = false,
				["235219"] = false,
				["329554"] = true,
				["205180"] = true,
				["192077"] = true,
				["104773"] = false,
				["1122"] = true,
				["102793"] = true,
				["113860"] = true,
				["5246"] = false,
				["215652"] = false,
				["102543"] = true,
				["306830"] = true,
				["319952"] = true,
				["210918"] = false,
				["118000"] = false,
				["55233"] = false,
				["336135"] = false,
				["213602"] = false,
				["205636"] = true,
				["102560"] = true,
				["107574"] = true,
				["108968"] = false,
				["325289"] = true,
				["328204"] = true,
				["1719"] = true,
				["198067"] = true,
				["328278"] = true,
				["137639"] = true,
				["325028"] = true,
				["10060"] = true,
				["132578"] = true,
				["53480"] = false,
				["63560"] = true,
				["13750"] = true,
				["325197"] = true,
				["312321"] = true,
				["48707"] = false,
				["324143"] = true,
				["308491"] = true,
				["338142"] = true,
				["102558"] = true,
				["323639"] = true,
				["47482"] = false,
				["265202"] = false,
				["198111"] = false,
				["236320"] = false,
				["327104"] = true,
				["31230"] = false,
				["194223"] = true,
				["204336"] = false,
				["307443"] = true,
				["152279"] = true,
				["31935"] = false,
				["228049"] = false,
				["328547"] = true,
				["205179"] = false,
				["325727"] = true,
				["327661"] = true,
				["51052"] = false,
				["19236"] = false,
				["123904"] = true,
				["122470"] = false,
				["196029"] = false,
				["324386"] = true,
				["328231"] = true,
				["198589"] = false,
				["22812"] = false,
				["265187"] = true,
				["205604"] = false,
				["325886"] = true,
				["109964"] = false,
				["316958"] = true,
				["202137"] = true,
				["108238"] = false,
				["55342"] = false,
				["215982"] = false,
				["320674"] = true,
				["314791"] = true,
				["64044"] = false,
				["311648"] = true,
				["321792"] = true,
				["199452"] = false,
				["49206"] = true,
				["324128"] = true,
				["86659"] = true,
				["62618"] = false,
				["106951"] = true,
				["325013"] = true,
				["1856"] = false,
				["325640"] = true,
				["114050"] = false,
				["152173"] = true,
				["342245"] = false,
				["198103"] = true,
				["197268"] = false,
				["20711"] = false,
				["204018"] = true,
				["184364"] = false,
				["50334"] = true,
				["323436"] = false,
				["853"] = false,
				["323673"] = true,
				["324724"] = true,
				["12042"] = true,
				["30884"] = false,
				["323547"] = true,
				["42650"] = true,
				["47568"] = true,
				["6789"] = false,
				["113858"] = true,
				["109304"] = false,
				["323654"] = true,
				["193530"] = true,
				["192058"] = false,
				["114052"] = false,
				["102342"] = false,
				["121471"] = true,
				["47536"] = false,
				["114556"] = false,
				["108280"] = true,
				["304971"] = true,
				["314793"] = true,
				["227847"] = false,
				["86949"] = false,
				["324149"] = true,
				["210256"] = false,
				["2094"] = false,
				["228260"] = false,
				["323546"] = true,
				["108978"] = false,
				["325216"] = true,
				["310454"] = true,
				["108271"] = false,
				["12472"] = true,
				["319217"] = false,
				["307865"] = true,
				["23920"] = false,
				["19574"] = true,
				["114051"] = false,
				["275699"] = true,
				["5277"] = false,
				["243435"] = false,
				["319454"] = false,
				["288613"] = true,
				["328305"] = true,
				["323764"] = true,
				["77761"] = true,
				["8143"] = false,
				["328923"] = true,
				["198838"] = false,
				["192249"] = true,
				["317320"] = false,
				["322118"] = true,
				["122783"] = false,
				["48020"] = false,
				["315443"] = true,
				["324220"] = true,
				["317009"] = true,
				["46924"] = false,
				["312202"] = true,
				["109248"] = true,
			},
			["icons"] = {
				["scale"] = 0.8300000000000001,
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
							["r"] = 0.05882352941176471,
							["g"] = 0.05882352941176471,
							["b"] = 0.05882352941176471,
						},
						["inactiveColor"] = {
							["a"] = 1,
							["b"] = 0.05098039215686274,
							["g"] = 0.05098039215686274,
							["r"] = 0.05098039215686274,
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
							["r"] = 0.05098039215686274,
							["g"] = 0.05098039215686274,
							["b"] = 0.05098039215686274,
						},
						["useClassColor"] = {
							["active"] = true,
						},
					},
					["scale"] = 0.6000000000000001,
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
			["spells"] = {
				["326059"] = true,
				["114018"] = true,
				["322109"] = false,
				["312202"] = true,
				["326860"] = true,
				["12975"] = true,
				["279302"] = true,
				["202138"] = true,
				["115750"] = false,
				["22812"] = false,
				["212295"] = false,
				["187650"] = false,
				["8122"] = false,
				["235219"] = false,
				["329554"] = true,
				["205180"] = true,
				["192077"] = true,
				["104773"] = false,
				["1122"] = true,
				["102793"] = true,
				["113860"] = true,
				["5246"] = false,
				["215652"] = false,
				["102543"] = true,
				["306830"] = true,
				["319952"] = true,
				["210918"] = false,
				["118000"] = false,
				["55233"] = false,
				["46924"] = false,
				["213602"] = false,
				["205636"] = true,
				["102560"] = true,
				["107574"] = true,
				["108968"] = false,
				["325289"] = true,
				["328204"] = true,
				["1719"] = true,
				["198067"] = true,
				["328278"] = true,
				["137639"] = true,
				["325028"] = true,
				["10060"] = true,
				["132578"] = true,
				["53480"] = false,
				["63560"] = true,
				["13750"] = true,
				["325197"] = true,
				["312321"] = true,
				["48707"] = false,
				["324143"] = true,
				["210256"] = false,
				["338142"] = true,
				["102558"] = true,
				["323639"] = true,
				["47482"] = false,
				["265202"] = false,
				["198111"] = false,
				["236320"] = false,
				["327104"] = true,
				["31230"] = false,
				["194223"] = true,
				["204336"] = false,
				["307443"] = true,
				["152279"] = true,
				["31935"] = false,
				["228049"] = false,
				["328547"] = true,
				["205179"] = false,
				["325727"] = true,
				["327661"] = true,
				["51052"] = false,
				["109248"] = true,
				["205604"] = false,
				["122470"] = false,
				["196029"] = false,
				["324386"] = true,
				["308491"] = true,
				["109964"] = false,
				["324220"] = true,
				["116849"] = false,
				["336135"] = false,
				["108238"] = false,
				["77761"] = true,
				["23920"] = false,
				["202137"] = true,
				["317320"] = false,
				["324724"] = true,
				["215982"] = false,
				["64044"] = false,
				["314791"] = true,
				["288613"] = true,
				["328305"] = true,
				["321792"] = true,
				["62618"] = false,
				["49206"] = true,
				["243435"] = false,
				["86659"] = true,
				["325886"] = true,
				["55342"] = false,
				["48020"] = false,
				["122783"] = false,
				["325640"] = true,
				["322118"] = true,
				["114050"] = false,
				["19574"] = true,
				["198103"] = true,
				["197268"] = false,
				["316958"] = true,
				["108280"] = true,
				["328923"] = true,
				["50334"] = true,
				["323546"] = true,
				["853"] = false,
				["323673"] = true,
				["108978"] = false,
				["108271"] = false,
				["30884"] = false,
				["323547"] = true,
				["42650"] = true,
				["324128"] = true,
				["102342"] = false,
				["113858"] = true,
				["109304"] = false,
				["192058"] = false,
				["193530"] = true,
				["2094"] = false,
				["325013"] = true,
				["47568"] = true,
				["319217"] = false,
				["47536"] = false,
				["114556"] = false,
				["108199"] = true,
				["114051"] = false,
				["323436"] = false,
				["227847"] = false,
				["86949"] = false,
				["324149"] = true,
				["6789"] = false,
				["304971"] = true,
				["228260"] = false,
				["12042"] = true,
				["114052"] = false,
				["325216"] = true,
				["310454"] = true,
				["342245"] = false,
				["12472"] = true,
				["314793"] = true,
				["307865"] = true,
				["199452"] = false,
				["152173"] = true,
				["320674"] = true,
				["275699"] = true,
				["5277"] = false,
				["1856"] = false,
				["319454"] = false,
				["106951"] = true,
				["121471"] = true,
				["323764"] = true,
				["311648"] = true,
				["8143"] = false,
				["123904"] = true,
				["323654"] = true,
				["192249"] = true,
				["198838"] = false,
				["184364"] = false,
				["204018"] = true,
				["20711"] = false,
				["315443"] = true,
				["265187"] = true,
				["317009"] = true,
				["198589"] = false,
				["328231"] = true,
				["19236"] = false,
			},
			["icons"] = {
				["scale"] = 0.8300000000000001,
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

	-- Set profile
	if layout == 'main' then
		OmniCDDB["profileKeys"][E.mynameRealm] = name
	elseif layout == 'healing' then
		OmniCDDB["profileKeys"][E.mynameRealm] = name_healing
	end

	L1UI:Print(L["OmniCD profile has been set."])
end
