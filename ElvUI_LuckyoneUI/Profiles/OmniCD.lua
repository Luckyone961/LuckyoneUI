-- Addon namespace
local _, Private = ...
local L = Private.Libs.ACL

-- Lua functions
local pairs = pairs

-- Global environment
local _G = _G

-- OmniCD profile
-- LC: 29/12/2024
function Private:Setup_OmniCD(layout, installer)
	if not Private.IsAddOnLoaded('OmniCD') then Private:Print('OmniCD ' .. L["is not installed or enabled."]) return end

	-- Global db
	local dev, scaled = Private.Addon.db.global.dev, Private.Addon.db.global.scaled

	-- Profile names
	local name_main = (dev and 'Luckyone Main') or 'Luckyone Main ' .. Private.Version
	local name_healing = (dev and 'Luckyone Healing') or 'Luckyone Healing ' .. Private.Version

	-- Disable LibDualSpec to set the profile
	if Private.isRetail then
		OmniCDDB['namespaces']['LibDualSpec-1.0'] = OmniCDDB['namespaces']['LibDualSpec-1.0'] or {}
		OmniCDDB['namespaces']['LibDualSpec-1.0']['char'] = OmniCDDB['namespaces']['LibDualSpec-1.0']['char'] or {}
		OmniCDDB['namespaces']['LibDualSpec-1.0']['char'][Private.myNameRealm] = {}
		OmniCDDB['namespaces']['LibDualSpec-1.0']['char'][Private.myNameRealm]['enabled'] = false
	end

	-- Global db
	OmniCDDB['cooldowns'] = {}
	OmniCDDB['global']['disableElvMsg'] = true
	OmniCDDB['version'] = 4

	-- Profile creation
	for _, profile in pairs({ name_main, name_healing }) do
		OmniCDDB['profiles'][profile] = {}
		OmniCDDB['profiles'][profile]['General'] = {}
		OmniCDDB['profiles'][profile]['Party'] = {}
	end

	-- Main profile
	OmniCDDB['profiles'][name_main]['Party'] = {
		['party'] = {
			['extraBars'] = {
				['raidBar1'] = {
					['statusBarWidth'] = 324,
					['barColors'] = {
						['activeColor'] = {
							['a'] = 0.90,
							['r'] = 0.05,
							['g'] = 0.05,
							['b'] = 0.05,
						},
						['rechargeColor'] = {
							['a'] = 0.90,
							['r'] = 0.05,
							['g'] = 0.05,
							['b'] = 0.05,
						},
						['useClassColor'] = {
							['inactive'] = false,
							['recharge'] = false,
							['active'] = false,
						},
						['inactiveColor'] = {
							['a'] = 0.90,
							['r'] = 0.05,
							['g'] = 0.05,
							['b'] = 0.05,
						},
					},
					['locked'] = true,
					["paddingY"] = 1,
					['hideSpark'] = true,
					['manualPos'] = {
						['raidBar1'] = scaled and {
							['y'] = 438.12,
							['x'] = 213.05,
						} or {
							['y'] = 424.79,
							['x'] = 320.25,
						},
					},
					['bgColors'] = {
						['activeColor'] = {
							['a'] = 0.90,
							['r'] = 0.54,
							['g'] = 0.56,
							['b'] = 0.61,
						},
						['rechargeColor'] = {
							['a'] = 0.90,
							['r'] = 0.54,
							['g'] = 0.56,
							['b'] = 0.61,
						},
						['useClassColor'] = {
							['recharge'] = false,
						},
					},
					['textColors'] = {
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
				['counterScale'] = 1,
				['scale'] = 1.12,
				['showTooltip'] = true,
				['chargeScale'] = 1,
			},
			['position'] = {
				['paddingX'] = 1,
				['attach'] = 'TOPLEFT',
				['preset'] = 'TOPLEFT',
				['offsetX'] = 1,
				['anchor'] = 'TOPRIGHT',
				['paddingY'] = 1,
				["columns"] = 8,
				["maxNumIcons"] = 8,
			},
			['general'] = {
				['showPlayer'] = false,
			},
		},
		['arena'] = {
			['extraBars'] = {
				['raidBar1'] = {
					['statusBarWidth'] = 324,
					['barColors'] = {
						['activeColor'] = {
							['a'] = 0.90,
							['r'] = 0.05,
							['g'] = 0.05,
							['b'] = 0.05,
						},
						['rechargeColor'] = {
							['a'] = 0.90,
							['r'] = 0.05,
							['g'] = 0.05,
							['b'] = 0.05,
						},
						['useClassColor'] = {
							['inactive'] = false,
							['recharge'] = false,
							['active'] = false,
						},
						['inactiveColor'] = {
							['a'] = 0.90,
							['r'] = 0.05,
							['g'] = 0.05,
							['b'] = 0.05,
						},
					},
					['locked'] = true,
					["paddingY"] = 1,
					['hideSpark'] = true,
					['manualPos'] = {
						['raidBar1'] = scaled and {
							['y'] = 438.12,
							['x'] = 213.05,
						} or {
							['y'] = 424.79,
							['x'] = 320.25,
						},
					},
					['bgColors'] = {
						['activeColor'] = {
							['a'] = 0.90,
							['r'] = 0.54,
							['g'] = 0.56,
							['b'] = 0.61,
						},
						['rechargeColor'] = {
							['a'] = 0.90,
							['r'] = 0.54,
							['g'] = 0.56,
							['b'] = 0.61,
						},
						['useClassColor'] = {
							['recharge'] = false,
						},
					},
					['textColors'] = {
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
				['counterScale'] = 1,
				['scale'] = 1.12,
				['showTooltip'] = true,
				['chargeScale'] = 1,
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
				['showPlayer'] = false,
			},
		},
	}

	-- Healing profile
	OmniCDDB['profiles'][name_healing]['Party'] = {
		['party'] = {
			['extraBars'] = {
				['raidBar1'] = {
					['barColors'] = {
						['activeColor'] = {
							['a'] = 0.90,
							['r'] = 0.05,
							['g'] = 0.05,
							['b'] = 0.05,
						},
						['rechargeColor'] = {
							['a'] = 0.90,
							['r'] = 0.05,
							['g'] = 0.05,
							['b'] = 0.05,
						},
						['useClassColor'] = {
							['inactive'] = false,
							['recharge'] = false,
							['active'] = false,
						},
						['inactiveColor'] = {
							['a'] = 0.90,
							['r'] = 0.05,
							['g'] = 0.05,
							['b'] = 0.05,
						},
					},
					['growUpward'] = true,
					['bgColors'] = {
						['rechargeColor'] = {
							['a'] = 0.89,
							['r'] = 0.54,
							['g'] = 0.56,
							['b'] = 0.61,
						},
						['useClassColor'] = {
							['recharge'] = false,
						},
						['activeColor'] = {
							['a'] = 0.89,
							['r'] = 0.54,
							['g'] = 0.56,
							['b'] = 0.61,
						},
					},
					['locked'] = true,
					["paddingY"] = 1,
					['hideSpark'] = true,
					['textColors'] = {
						['useClassColor'] = {
							['inactive'] = true,
							['recharge'] = true,
							['active'] = true,
						},
					},
					['manualPos'] = {
						['raidBar1'] = scaled and {
							['y'] = 375.73,
							['x'] = 318.12,
						} or {
							['y'] = 351.20,
							['x'] = 382.66,
						},
					},
					['statusBarWidth'] = 406,
				},
			},
			['highlight'] = {
				['glowType'] = 'actionBar',
			},
			['icons'] = {
				['counterScale'] = 0.8,
				['scale'] = 0.66,
				['showTooltip'] = true,
				['chargeScale'] = 0.8,
			},
			['position'] = {
				['anchor'] = 'BOTTOMLEFT',
				['paddingY'] = 1,
				['attachMore'] = 'BOTTOMLEFT',
				['columns'] = 4,
				['paddingX'] = 1,
				['attach'] = 'BOTTOMLEFT',
				['preset'] = 'manual',
				['offsetY'] = 25,
				['offsetX'] = 0,
				['anchorMore'] = 'BOTTOMLEFT',
			},
			['general'] = {
				['showPlayer'] = false,
			},
		},
		['arena'] = {
			['extraBars'] = {
				['raidBar1'] = {
					['barColors'] = {
						['activeColor'] = {
							['a'] = 0.90,
							['r'] = 0.05,
							['g'] = 0.05,
							['b'] = 0.05,
						},
						['rechargeColor'] = {
							['a'] = 0.90,
							['r'] = 0.05,
							['g'] = 0.05,
							['b'] = 0.05,
						},
						['useClassColor'] = {
							['inactive'] = false,
							['recharge'] = false,
							['active'] = false,
						},
						['inactiveColor'] = {
							['a'] = 0.90,
							['r'] = 0.05,
							['g'] = 0.05,
							['b'] = 0.05,
						},
					},
					['growUpward'] = true,
					['bgColors'] = {
						['rechargeColor'] = {
							['a'] = 0.89,
							['r'] = 0.54,
							['g'] = 0.56,
							['b'] = 0.61,
						},
						['useClassColor'] = {
							['recharge'] = false,
						},
						['activeColor'] = {
							['a'] = 0.89,
							['r'] = 0.54,
							['g'] = 0.56,
							['b'] = 0.61,
						},
					},
					['locked'] = true,
					["paddingY"] = 1,
					['hideSpark'] = true,
					['textColors'] = {
						['useClassColor'] = {
							['inactive'] = true,
							['recharge'] = true,
							['active'] = true,
						},
					},
					['manualPos'] = {
						['raidBar1'] = scaled and {
							['y'] = 375.73,
							['x'] = 318.12,
						} or {
							['y'] = 351.20,
							['x'] = 382.66,
						},
					},
					['statusBarWidth'] = 406,
				},
			},
			['highlight'] = {
				['glowType'] = 'actionBar',
			},
			['icons'] = {
				['counterScale'] = 0.8,
				['scale'] = 0.66,
				['showTooltip'] = true,
				['chargeScale'] = 0.8,
			},
			['position'] = {
				['anchor'] = 'BOTTOMLEFT',
				['paddingY'] = 1,
				['attachMore'] = 'BOTTOMLEFT',
				['columns'] = 4,
				['paddingX'] = 1,
				['attach'] = 'BOTTOMLEFT',
				['preset'] = 'manual',
				['offsetY'] = 25,
				['offsetX'] = 0,
				['anchorMore'] = 'BOTTOMLEFT',
			},
			['general'] = {
				['showPlayer'] = false,
			},
		},
	}

	-- Additional data
	for _, profile in pairs({ name_main, name_healing }) do
		-- General db
		OmniCDDB['profiles'][profile]['General']['fonts'] = {
			['statusBar'] = {
				['font'] = Private.Font,
				['ofsX'] = 0,
				['flag'] = Private.Outline,
				['size'] = 18,
			},
			['optionSmall'] = {
				['flag'] = Private.Outline,
				['font'] = Private.Font,
			},
			['anchor'] = {
				['font'] = Private.Font,
				['ofsX'] = 0,
				['flag'] = Private.Outline,
			},
			['icon'] = {
				['font'] = Private.Font,
				['size'] = 12,
			},
			['option'] = {
				['flag'] = Private.Outline,
				['font'] = Private.Font,
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
			['arena'] = false,
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
			OmniCDDB['profiles'][profile]['Party'][frame]['spells'] = {}
			if Private.isRetail then
				OmniCDDB['profiles'][profile]['Party'][frame]['spells'] = {
					["186387"] = false,
					["374227"] = false,
					["363916"] = false,
					["216331"] = false,
					["31661"] = false,
					["118038"] = false,
					["1022"] = false,
					["51490"] = false,
					["384352"] = true,
					["115750"] = false,
					["22812"] = false,
					["368970"] = false,
					["368412"] = false,
					["8122"] = false,
					["235219"] = false,
					["386071"] = false,
					["5246"] = false,
					["371032"] = false,
					["157980"] = false,
					["357170"] = false,
					["15286"] = false,
					["396286"] = false,
					["207167"] = false,
					["378279"] = false,
					["137639"] = false,
					["122783"] = false,
					["271466"] = false,
					["386997"] = false,
					["48707"] = false,
					["462031"] = false,
					["61336"] = false,
					["389539"] = true,
					["23920"] = false,
					["342246"] = false,
					["378779"] = false,
					["199448"] = true,
					["31935"] = false,
					["228049"] = true,
					["228920"] = true,
					["111898"] = false,
					["48792"] = false,
					["51052"] = false,
					["49206"] = true,
					["375576"] = true,
					["227847"] = true,
					["122278"] = false,
					["122470"] = false,
					["207289"] = false,
					["167105"] = false,
					["132578"] = false,
					["258860"] = false,
					["198144"] = false,
					["262161"] = false,
					["46968"] = false,
					["31821"] = false,
					["157981"] = false,
					["19574"] = true,
					["342245"] = false,
					["374251"] = true,
					["204021"] = false,
					["385627"] = false,
					["357214"] = false,
					["108271"] = false,
					["102342"] = false,
					["202138"] = false,
					["386394"] = false,
					["47536"] = false,
					["64843"] = false,
					["200733"] = false,
					["370965"] = true,
					["198589"] = false,
					["275699"] = false,
					["5277"] = false,
					["391109"] = false,
					["383121"] = false,
					["192249"] = true,
					["5484"] = false,
					["116844"] = false,
					["196555"] = false,
					["108968"] = false,
					["47585"] = false,
					["642"] = false,
					["343721"] = false,
					["265202"] = false,
					["184364"] = false,
				}
			elseif Private.isMists then
				OmniCDDB['profiles'][profile]['Party'][frame]["spells"] = {
					["110696"] = false,
					["28730"] = true,
					["123040"] = true,
					["16188"] = false,
					["31661"] = false,
					["118038"] = false,
					["113075"] = false,
					["740"] = false,
					["77130"] = false,
					["74001"] = false,
					["114039"] = false,
					["8143"] = false,
					["6346"] = false,
					["42292"] = false,
					["44572"] = false,
					["12975"] = false,
					["86346"] = false,
					["20549"] = false,
					["110959"] = false,
					["132158"] = false,
					["114028"] = false,
					["115750"] = false,
					["22812"] = false,
					["124974"] = false,
					["5484"] = false,
					["19577"] = false,
					["122783"] = false,
					["51722"] = false,
					["19503"] = false,
					["108281"] = false,
					["47585"] = false,
					["8122"] = false,
					["18499"] = false,
					["20594"] = false,
					["107570"] = false,
					["115610"] = false,
					["110791"] = false,
					["19386"] = false,
					["64901"] = false,
					["5246"] = false,
					["109248"] = false,
					["113072"] = false,
					["115176"] = false,
					["106922"] = false,
					["104773"] = false,
					["4987"] = false,
					["7744"] = false,
					["127361"] = false,
					["115203"] = false,
					["115078"] = false,
					["51753"] = false,
					["15286"] = false,
					["108285"] = false,
					["120668"] = false,
					["8177"] = false,
					["108978"] = false,
					["114030"] = false,
					["51271"] = false,
					["117368"] = false,
					["108968"] = false,
					["5277"] = false,
					["116841"] = false,
					["5211"] = false,
					["102060"] = false,
					["498"] = false,
					["53480"] = false,
					["110570"] = false,
					["20589"] = false,
					["113306"] = false,
					["49039"] = false,
					["53271"] = false,
					["126135"] = false,
					["86669"] = false,
					["57755"] = false,
					["48707"] = false,
					["108270"] = false,
					["110715"] = false,
					["105593"] = false,
					["61336"] = false,
					["31850"] = false,
					["114029"] = false,
					["14185"] = false,
					["2062"] = false,
					["110913"] = false,
					["23920"] = false,
					["108359"] = false,
					["108200"] = false,
					["114157"] = false,
					["45438"] = false,
					["108501"] = false,
					["51690"] = false,
					["108269"] = false,
					["142723"] = false,
					["126449"] = false,
					["118000"] = false,
					["48792"] = false,
					["122291"] = false,
					["126458"] = false,
					["129176"] = false,
					["115310"] = false,
					["31224"] = false,
					["113286"] = false,
					["110700"] = false,
					["30823"] = false,
					["76577"] = false,
					["64044"] = false,
					["64843"] = false,
					["119996"] = false,
					["51490"] = false,
					["112970"] = false,
					["51052"] = false,
					["3411"] = false,
					["132469"] = false,
					["676"] = false,
					["108482"] = false,
					["46968"] = false,
					["122470"] = false,
					["32379"] = false,
					["12043"] = false,
					["108201"] = false,
					["1044"] = false,
					["32375"] = false,
					["16190"] = false,
					["108238"] = false,
					["110698"] = false,
					["122286"] = false,
					["109304"] = false,
					["108416"] = false,
					["19505"] = false,
					["6789"] = false,
					["62618"] = false,
					["108280"] = false,
					["408"] = false,
					["2782"] = false,
					["48020"] = false,
					["42650"] = false,
					["126456"] = false,
					["97462"] = false,
					["19236"] = false,
					["64382"] = false,
					["88625"] = false,
					["108271"] = false,
					["47476"] = false,
					["853"] = false,
					["108921"] = false,
					["527"] = false,
					["30884"] = false,
					["55694"] = false,
					["48743"] = false,
					["119381"] = false,
					["99"] = false,
					["110575"] = false,
					["86659"] = false,
					["31821"] = false,
					["115450"] = false,
					["113004"] = false,
					["871"] = false,
					["51514"] = false,
					["89485"] = false,
					["115213"] = false,
					["633"] = false,
					["49576"] = false,
					["122278"] = false,
					["475"] = false,
					["2094"] = false,
					["122288"] = false,
					["110617"] = false,
					["20066"] = false,
					["58875"] = false,
					["110707"] = false,
					["113277"] = false,
					["19263"] = false,
					["115080"] = true,
					["51713"] = false,
					["88423"] = false,
					["113724"] = false,
					["1856"] = false,
					["49028"] = false,
					["51886"] = false,
					["110718"] = false,
					["11958"] = false,
					["116844"] = false,
					["137562"] = false,
					["59752"] = false,
					["131894"] = false,
					["114203"] = false,
					["642"] = false,
					["73325"] = false,
					["1499"] = false,
					["30283"] = false,
					["108194"] = false,
					["110788"] = false,
				}
			end
		end
	end

	-- Turn on bars for Classic (off by Default)
	if not Private.isRetail then
		OmniCDDB['profiles'][name_main]['Party']['party']['extraBars']['raidBar1']["enabled"] = true
		OmniCDDB['profiles'][name_main]['Party']['arena']['extraBars']['raidBar1']["enabled"] = true
		OmniCDDB['profiles'][name_healing]['Party']['party']['extraBars']['raidBar1']["enabled"] = true
		OmniCDDB['profiles'][name_healing]['Party']['arena']['extraBars']['raidBar1']["enabled"] = true
	end

	-- Set profile
	if layout == 'main' then
		OmniCDDB['profileKeys'][Private.myNameRealm] = name_main
	elseif layout == 'healing' then
		OmniCDDB['profileKeys'][Private.myNameRealm] = name_healing
	end

	if installer then
		_G.LuckyoneInstallStepComplete:ShowMessage(L["OmniCD profile has been set."])
	end

	Private:Print(L["OmniCD profile has been set."])
end
