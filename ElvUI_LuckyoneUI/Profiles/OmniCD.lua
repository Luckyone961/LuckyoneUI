local Name, Private = ...
local E, L, V, P, G = unpack(ElvUI)

local pairs = pairs

-- OmniCD profile
function L1UI:Setup_OmniCD(layout)
	if not E:IsAddOnEnabled('OmniCD') and E.Retail then Private:Print('OmniCD ' .. L["is not installed or enabled."]) return end

	-- Profile names
	local name = E.global.L1UI.dev and 'Luckyone Main' or 'Luckyone Main ' .. Private.Version
	local name_healing = E.global.L1UI.dev and 'Luckyone Healing' or 'Luckyone Healing ' .. Private.Version

	-- Disable LibDualSpec to set the profile
	OmniCDDB['namespaces']['LibDualSpec-1.0'] = OmniCDDB['namespaces']['LibDualSpec-1.0'] or {}
	OmniCDDB['namespaces']['LibDualSpec-1.0']['char'] = OmniCDDB['namespaces']['LibDualSpec-1.0']['char'] or {}
	OmniCDDB['namespaces']['LibDualSpec-1.0']['char'][E.mynameRealm] = OmniCDDB['namespaces']['LibDualSpec-1.0']['char'][E.mynameRealm] or {}
	OmniCDDB['namespaces']['LibDualSpec-1.0']['char'][E.mynameRealm]['enabled'] = false

	-- Global db
	OmniCDDB['cooldowns'] = {}
	OmniCDDB['global']['disableElvMsg'] = true
	OmniCDDB['version'] = 3

	-- Profile creation
	for _, profile in pairs({ name, name_healing }) do
		OmniCDDB['profiles'][profile] = OmniCDDB['profiles'][profile] or {}
		OmniCDDB['profiles'][profile]['General'] = OmniCDDB['profiles'][profile]['General'] or {}
		OmniCDDB['profiles'][profile]['Party'] = OmniCDDB['profiles'][profile]['Party'] or {}
	end

	-- Main profile
	OmniCDDB['profiles'][name]['Party'] = {
		['party'] = {
			['extraBars'] = {
				['raidBar0'] = {
					['hideSpark'] = true,
					['statusBarWidth'] = 280,
					['barColors'] = {
						['classColor'] = false,
						['inactiveColor'] = {
							['a'] = 0.90,
							['b'] = 0.05,
							['g'] = 0.05,
							['r'] = 0.05,
						},
						['rechargeColor'] = {
							['a'] = 0.90,
							['r'] = 0.05,
							['g'] = 0.05,
							['b'] = 0.05,
						},
						['activeColor'] = {
							['r'] = 0.05,
							['g'] = 0.05,
							['b'] = 0.05,
						},
						['useClassColor'] = {
							['inactive'] = false,
							['recharge'] = false,
							['active'] = false,
						},
					},
					['locked'] = true,
					['paddingY'] = 1,
					['manualPos'] = {
						['raidBar0'] = {
							['y'] = 417.7780917134624,
							['x'] = 256.3552796449858,
						},
					},
					['columns'] = 10,
					['bgColors'] = {
						['classColor'] = true,
						['rechargeColor'] = {
							['r'] = 0.54,
							['g'] = 0.56,
							['b'] = 0.61,
						},
						['activeColor'] = {
							['a'] = 1,
							['r'] = 0.54,
							['g'] = 0.56,
							['b'] = 0.61,
						},
						['useClassColor'] = {
							['recharge'] = false,
						},
					},
					['textColors'] = {
						['classColor'] = true,
						['inactiveColor'] = {
							['a'] = 1,
						},
						['rechargeColor'] = {
							['a'] = 1,
						},
						['activeColor'] = {
							['a'] = 1,
						},
						['useClassColor'] = {
							['inactive'] = true,
							['recharge'] = true,
							['active'] = true,
						},
					},
					['showInterruptedSpell'] = false,
					['scale'] = 0.6000000000000001,
				},
			},
			['highlight'] = {
				['glowType'] = 'actionBar',
			},
			['icons'] = {
				['counterScale'] = 0.9,
				['scale'] = 0.9,
				['showTooltip'] = true,
				['chargeScale'] = 0.9,
			},
			['position'] = {
				['paddingX'] = 1,
				['attach'] = 'TOPLEFT',
				['preset'] = 'TOPLEFT',
				['offsetX'] = 1,
				['anchor'] = 'TOPRIGHT',
				['paddingY'] = 1,
			},
			['general'] = {
				['showPlayer'] = true,
			},
		},
		['arena'] = {
			['extraBars'] = {
				['raidBar0'] = {
					['hideSpark'] = true,
					['statusBarWidth'] = 280,
					['barColors'] = {
						['classColor'] = false,
						['inactiveColor'] = {
							['a'] = 0.90,
							['b'] = 0.05,
							['g'] = 0.05,
							['r'] = 0.05,
						},
						['rechargeColor'] = {
							['a'] = 0.90,
							['r'] = 0.05,
							['g'] = 0.05,
							['b'] = 0.05,
						},
						['activeColor'] = {
							['r'] = 0.05,
							['g'] = 0.05,
							['b'] = 0.05,
						},
						['useClassColor'] = {
							['inactive'] = false,
							['recharge'] = false,
							['active'] = false,
						},
					},
					['locked'] = true,
					['paddingY'] = 1,
					['manualPos'] = {
						['raidBar0'] = {
							['y'] = 417.7780917134624,
							['x'] = 256.3552796449858,
						},
					},
					['columns'] = 10,
					['bgColors'] = {
						['classColor'] = true,
						['rechargeColor'] = {
							['r'] = 0.54,
							['g'] = 0.56,
							['b'] = 0.61,
						},
						['activeColor'] = {
							['a'] = 1,
							['r'] = 0.54,
							['g'] = 0.56,
							['b'] = 0.61,
						},
						['useClassColor'] = {
							['recharge'] = false,
						},
					},
					['textColors'] = {
						['classColor'] = true,
						['inactiveColor'] = {
							['a'] = 1,
						},
						['rechargeColor'] = {
							['a'] = 1,
						},
						['activeColor'] = {
							['a'] = 1,
						},
						['useClassColor'] = {
							['inactive'] = true,
							['recharge'] = true,
							['active'] = true,
						},
					},
					['showInterruptedSpell'] = false,
					['scale'] = 0.6000000000000001,
				},
			},
			['highlight'] = {
				['glowType'] = 'actionBar',
			},
			['icons'] = {
				['counterScale'] = 0.9,
				['scale'] = 0.9,
				['showTooltip'] = true,
				['chargeScale'] = 0.9,
			},
			['position'] = {
				['paddingX'] = 1,
				['attach'] = 'TOPLEFT',
				['preset'] = 'TOPLEFT',
				['offsetX'] = 1,
				['anchor'] = 'TOPRIGHT',
				['paddingY'] = 1,
			},
			['general'] = {
				['showPlayer'] = true,
			},
		},
	}

	-- Healing profile
	OmniCDDB['profiles'][name_healing]['Party'] = {
		['party'] = {
			['extraBars'] = {
				['raidBar0'] = {
					['columns'] = 10,
					['growUpward'] = false,
					['hideSpark'] = true,
					['locked'] = true,
					['paddingY'] = 2,
					['scale'] = 0.6000000000000001,
					['statusBarWidth'] = 364,
					['manualPos'] = {
						['raidBar0'] = {
							["y"] = 373.6890715486516,
							["x"] = 343.1108373012739,
						},
					},
					['barColors'] = {
						['classColor'] = false,
						['inactiveColor'] = {
							['a'] = 0.90,
							['r'] = 0.05,
							['g'] = 0.05,
							['b'] = 0.05,
						},
						['rechargeColor'] = {
							['a'] = 0.90,
							['b'] = 0.05,
							['g'] = 0.05,
							['r'] = 0.05,
						},
						['useClassColor'] = {
							['inactive'] = false,
							['recharge'] = false,
							['active'] = false,
						},
						['activeColor'] = {
							['b'] = 0.05,
							['g'] = 0.05,
							['r'] = 0.05,
						},
					},
					['bgColors'] = {
						['classColor'] = true,
						['rechargeColor'] = {
							['b'] = 0.61,
							['g'] = 0.56,
							['r'] = 0.54,
						},
						['activeColor'] = {
							['a'] = 1,
							['b'] = 0.61,
							['g'] = 0.56,
							['r'] = 0.54,
						},
						['useClassColor'] = {
							['recharge'] = false,
						},
					},
					['textColors'] = {
						['classColor'] = true,
						['useClassColor'] = {
							['inactive'] = true,
							['recharge'] = true,
							['active'] = true,
						},
					},
				},
			},
			['highlight'] = {
				['glowType'] = 'actionBar',
			},
			['icons'] = {
				["scale"] = 1.1,
				["counterScale"] = 0.9,
				["chargeScale"] = 0.9,
				["showTooltip"] = true,
			},
			['position'] = {
				["anchor"] = "RIGHT",
				["paddingY"] = 1,
				["attachMore"] = "LEFT",
				["columns"] = 4,
				["paddingX"] = 1,
				["attach"] = "LEFT",
				["preset"] = "manual",
				["offsetX"] = 1,
				["anchorMore"] = "RIGHT",
			},
			['general'] = {
				['showPlayer'] = true,
			},
		},
		['arena'] = {
			['extraBars'] = {
				['raidBar0'] = {
					['columns'] = 10,
					['growUpward'] = false,
					['hideSpark'] = true,
					['locked'] = true,
					['paddingY'] = 2,
					['scale'] = 0.6000000000000001,
					['statusBarWidth'] = 364,
					['manualPos'] = {
						['raidBar0'] = {
							["y"] = 373.6890715486516,
							["x"] = 343.1108373012739,
						},
					},
					['barColors'] = {
						['classColor'] = false,
						['inactiveColor'] = {
							['a'] = 0.90,
							['r'] = 0.05,
							['g'] = 0.05,
							['b'] = 0.05,
						},
						['rechargeColor'] = {
							['a'] = 0.90,
							['b'] = 0.05,
							['g'] = 0.05,
							['r'] = 0.05,
						},
						['useClassColor'] = {
							['inactive'] = false,
							['recharge'] = false,
							['active'] = false,
						},
						['activeColor'] = {
							['b'] = 0.05,
							['g'] = 0.05,
							['r'] = 0.05,
						},
					},
					['bgColors'] = {
						['classColor'] = true,
						['rechargeColor'] = {
							['b'] = 0.61,
							['g'] = 0.56,
							['r'] = 0.54,
						},
						['activeColor'] = {
							['a'] = 1,
							['b'] = 0.61,
							['g'] = 0.56,
							['r'] = 0.54,
						},
						['useClassColor'] = {
							['recharge'] = false,
						},
					},
					['textColors'] = {
						['classColor'] = true,
						['useClassColor'] = {
							['inactive'] = true,
							['recharge'] = true,
							['active'] = true,
						},
					},
				},
			},
			['highlight'] = {
				['glowType'] = 'actionBar',
			},
			['icons'] = {
				["scale"] = 1.1,
				["counterScale"] = 0.9,
				["chargeScale"] = 0.9,
				["showTooltip"] = true,
			},
			['position'] = {
				["anchor"] = "RIGHT",
				["paddingY"] = 1,
				["attachMore"] = "LEFT",
				["columns"] = 4,
				["paddingX"] = 1,
				["attach"] = "LEFT",
				["preset"] = "manual",
				["offsetX"] = 1,
				["anchorMore"] = "RIGHT",
			},
			['general'] = {
				['showPlayer'] = true,
			},
		},
	}

	-- Additional data
	for _, profile in pairs({ name, name_healing }) do
		-- General db
		OmniCDDB['profiles'][profile]['General']['fonts'] = {
			['statusBar'] = {
				['font'] = 'Expressway',
				['ofsX'] = 0,
				['flag'] = 'OUTLINE',
				['size'] = 18,
			},
			['optionSmall'] = {
				['flag'] = 'OUTLINE',
				['font'] = 'Expressway',
			},
			['anchor'] = {
				['font'] = 'Expressway',
				['ofsX'] = 0,
				['flag'] = 'OUTLINE',
			},
			['icon'] = {
				['font'] = 'Expressway',
				['size'] = 12,
			},
			['option'] = {
				['flag'] = 'OUTLINE',
				['font'] = 'Expressway',
			},
		}
		OmniCDDB['profiles'][profile]['General']['textures'] = {
			['statusBar'] = {
				['BG'] = 'Minimalist',
				['bar'] = 'Minimalist',
			},
		}

		-- Party db
		OmniCDDB['profiles'][profile]['Party']['visibility'] = {
			['none'] = true,
			['scenario'] = true,
		}
		OmniCDDB['profiles'][profile]['Party']['groupSize'] = {
			['party'] = 5,
			['scenario'] = 5,
			['raid'] = 20,
			['none'] = 5,
		}
		OmniCDDB['profiles'][profile]['Party']['noneZoneSetting'] = 'party'
		OmniCDDB['profiles'][profile]['Party']['scenarioZoneSetting'] = 'party'

		-- Spell IDs
		for _, frame in pairs({ 'party', 'arena' }) do
			OmniCDDB['profiles'][profile]['Party'][frame]['spells'] = OmniCDDB['profiles'][profile]['Party'][frame]['spells'] or {}
			OmniCDDB['profiles'][profile]['Party'][frame]['spells'] = {
				["374227"] = false,
				["363916"] = false,
				["216331"] = false,
				["118038"] = false,
				["321507"] = true,
				["1022"] = false,
				["116849"] = false,
				["8143"] = false,
				["33891"] = false,
				["197721"] = true,
				["115750"] = false,
				["22812"] = false,
				["187827"] = true,
				["212295"] = false,
				["212619"] = false,
				["187650"] = false,
				["8122"] = false,
				["235219"] = false,
				["205180"] = true,
				["48020"] = false,
				["1122"] = true,
				["5246"] = false,
				["215652"] = false,
				["59752"] = false,
				["357170"] = false,
				["102543"] = true,
				["115203"] = false,
				["15286"] = false,
				["210918"] = false,
				["345231"] = false,
				["336135"] = false,
				["209258"] = false,
				["121471"] = true,
				["102560"] = true,
				["107574"] = true,
				["108968"] = false,
				["196718"] = false,
				["1719"] = true,
				["122783"] = false,
				["10060"] = true,
				["132578"] = true,
				["53480"] = false,
				["13750"] = true,
				["47788"] = false,
				["231895"] = false,
				["401150"] = true,
				["51533"] = true,
				["210256"] = false,
				["102558"] = true,
				["47482"] = false,
				["265202"] = false,
				["198111"] = false,
				["236320"] = false,
				["45438"] = false,
				["342246"] = false,
				["31230"] = false,
				["194223"] = true,
				["204336"] = false,
				["377509"] = false,
				["31935"] = false,
				["228049"] = false,
				["228920"] = true,
				["403631"] = true,
				["186265"] = false,
				["48792"] = false,
				["51052"] = false,
				["115310"] = false,
				["205604"] = false,
				["122470"] = false,
				["408234"] = false,
				["360952"] = true,
				["198838"] = false,
				["215982"] = false,
				["64044"] = false,
				["199452"] = false,
				["108280"] = false,
				["97462"] = false,
				["342245"] = false,
				["197268"] = false,
				["61336"] = false,
				["50334"] = true,
				["853"] = false,
				["108271"] = false,
				["30884"] = false,
				["42650"] = true,
				["102342"] = false,
				["109304"] = false,
				["378441"] = false,
				["871"] = false,
				["47536"] = false,
				["114556"] = false,
				["19236"] = false,
				["31224"] = false,
				["48707"] = false,
				["98008"] = false,
				["31821"] = false,
				["62618"] = false,
				["2094"] = false,
				["378464"] = false,
				["374348"] = false,
				["152279"] = true,
				["6789"] = false,
				["64843"] = false,
				["7744"] = false,
				["12472"] = true,
				["198589"] = false,
				["375087"] = true,
				["23920"] = false,
				["108238"] = false,
				["372048"] = false,
				["47585"] = false,
				["5277"] = false,
				["1856"] = false,
				["122278"] = false,
				["288613"] = true,
				["123904"] = true,
				["740"] = false,
				["86949"] = false,
				["19574"] = true,
				["196555"] = false,
				["104773"] = false,
				["33206"] = false,
				["414658"] = false,
				["191634"] = true,
				["642"] = false,
				["404381"] = false,
				["265187"] = true,
				["271466"] = false,
				["336126"] = false,
				["322118"] = true,
				["184364"] = false,
			}
		end
	end

	-- Set profile
	if layout == 'main' then
		OmniCDDB['profileKeys'][E.mynameRealm] = name
	elseif layout == 'healing' then
		OmniCDDB['profileKeys'][E.mynameRealm] = name_healing
	end

	Private:Print(L["OmniCD profile has been set."])
end
