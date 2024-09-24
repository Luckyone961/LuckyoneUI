-- Lua functions
local pairs = pairs
local unpack = unpack

-- Global environment
local _G = _G

-- AddOn namespace
local _, Private = ...

-- ElvUI modules
local E, L = unpack(ElvUI)

-- OmniCD profile
function Private:Setup_OmniCD(layout, installer)
	if not E:IsAddOnEnabled('OmniCD') and E.Retail then Private:Print('OmniCD ' .. L["is not installed or enabled."]) return end

	-- 1080p
	local scaled = E.global.L1UI.scaled

	-- Profile names
	local name_main = (E.global.L1UI.dev and 'Luckyone Main') or 'Luckyone Main ' .. Private.Version
	local name_healing = (E.global.L1UI.dev and 'Luckyone Healing') or 'Luckyone Healing ' .. Private.Version

	-- Disable LibDualSpec to set the profile
	OmniCDDB['namespaces']['LibDualSpec-1.0'] = OmniCDDB['namespaces']['LibDualSpec-1.0'] or {}
	OmniCDDB['namespaces']['LibDualSpec-1.0']['char'] = OmniCDDB['namespaces']['LibDualSpec-1.0']['char'] or {}
	OmniCDDB['namespaces']['LibDualSpec-1.0']['char'][E.mynameRealm] = {}
	OmniCDDB['namespaces']['LibDualSpec-1.0']['char'][E.mynameRealm]['enabled'] = false

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
					['statusBarWidth'] = 314,
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
				['scale'] = 1.1,
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
					['statusBarWidth'] = 314,
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
				['scale'] = 1.1,
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
					['statusBarWidth'] = 396,
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
					['statusBarWidth'] = 396,
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
		end
	end

	-- Set profile
	if layout == 'main' then
		OmniCDDB['profileKeys'][E.mynameRealm] = name_main
	elseif layout == 'healing' then
		OmniCDDB['profileKeys'][E.mynameRealm] = name_healing
	end

	if installer then
		_G.LuckyoneInstallStepComplete.message = L["OmniCD profile has been set."]
		_G.LuckyoneInstallStepComplete:Show()
	end

	Private:Print(L["OmniCD profile has been set."])
end
