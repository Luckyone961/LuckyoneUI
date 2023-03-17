local _, Private = ...
local E, L, V, P, G = unpack(ElvUI)

local pairs = pairs

-- OmniCD profile
function L1UI:Setup_OmniCD(layout)
	if not E:IsAddOnEnabled('OmniCD') and E.Retail then L1UI:Print('OmniCD ' .. L["not installed or enabled."]) return end

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

	-- Shared db
	for _, profile in pairs({ name, name_healing }) do
		-- Profile creation
		OmniCDDB['profiles'][profile] = OmniCDDB['profiles'][profile] or {}
		OmniCDDB['profiles'][profile]['General'] = OmniCDDB['profiles'][profile]['General'] or {}
		OmniCDDB['profiles'][profile]['Party'] = OmniCDDB['profiles'][profile]['Party'] or {}
		-- General db
		OmniCDDB['profiles'][profile]['General']['fonts'] = {
			['statusBar'] = {
				['font'] = 'Expressway',
				['flag'] = 'OUTLINE',
				['size'] = 18,
			},
			['optionSmall'] = {
				['font'] = 'Expressway',
				['flag'] = 'OUTLINE',
			},
			['anchor'] = {
				['font'] = 'Expressway',
				['flag'] = 'OUTLINE',
			},
			['icon'] = {
				['font'] = 'Expressway',
				['size'] = 12,
			},
			['option'] = {
				['font'] = 'Expressway',
				['flag'] = 'OUTLINE',
			},
		}
		OmniCDDB['profiles'][profile]['General']['textures'] = {
			['statusBar'] = {
				['BG'] = 'Minimalist',
				['bar'] = 'Minimalist',
			},
		}
		-- Party db
		OmniCDDB['profiles'][profile]['Party']['noneZoneSetting'] = 'party'
		OmniCDDB['profiles'][profile]['Party']['scenarioZoneSetting'] = 'party'
		OmniCDDB['profiles'][profile]['Party']['visibility'] = {
			['none'] = true,
			['scenario'] = true,
		}
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
					['growUpward'] = true,
					['hideSpark'] = true,
					['locked'] = true,
					['paddingY'] = 2,
					['scale'] = 0.6000000000000001,
					['statusBarWidth'] = 363,
					['manualPos'] = {
						['raidBar0'] = {
							['y'] = 285.5115303509865,
							['x'] = 343.1108807040528,
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
				['scale'] = 0.83,
				['counterScale'] = 0.8,
				['chargeScale'] = 0.8,
				['showTooltip'] = true,
			},
			['position'] = {
				['offsetX'] = 0,
				['anchor'] = 'LEFT',
				['paddingY'] = 2,
				['attachMore'] = 'LEFT',
				['columns'] = 3,
				['paddingX'] = 2,
				['attach'] = 'LEFT',
				['preset'] = 'manual',
				['offsetY'] = 37,
				['anchorMore'] = 'LEFT',
			},
			['general'] = {
				['showPlayer'] = true,
			},
		},
		['arena'] = {
			['extraBars'] = {
				['raidBar0'] = {
					['columns'] = 10,
					['growUpward'] = true,
					['hideSpark'] = true,
					['locked'] = true,
					['paddingY'] = 2,
					['scale'] = 0.6000000000000001,
					['statusBarWidth'] = 363,
					['manualPos'] = {
						['raidBar0'] = {
							['y'] = 285.5115303509865,
							['x'] = 343.1108807040528,
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
				['scale'] = 0.83,
				['counterScale'] = 0.8,
				['chargeScale'] = 0.8,
				['showTooltip'] = true,
			},
			['position'] = {
				['offsetX'] = 0,
				['anchor'] = 'LEFT',
				['paddingY'] = 2,
				['attachMore'] = 'LEFT',
				['columns'] = 3,
				['paddingX'] = 2,
				['attach'] = 'LEFT',
				['preset'] = 'manual',
				['offsetY'] = 37,
				['anchorMore'] = 'LEFT',
			},
			['general'] = {
				['showPlayer'] = true,
			},
		},
	}

	-- Add spell IDs
	for _, profile in pairs({ name, name_healing }) do
		for _, frame in pairs({ 'party', 'arena' }) do
			OmniCDDB['profiles'][profile]['Party'][frame]['spells'] = OmniCDDB['profiles'][profile]['Party'][frame]['spells'] or {}
			OmniCDDB['profiles'][profile]['Party'][frame]['spells'] = {
				['374227'] = false,
				['363916'] = false,
				['57934'] = true,
				['118038'] = false,
				['198589'] = false,
				['1022'] = false,
				['322109'] = true,
				['8143'] = false,
				['279302'] = true,
				['202138'] = true,
				['115750'] = false,
				['22812'] = false,
				['212295'] = false,
				['187650'] = false,
				['8122'] = false,
				['235219'] = false,
				['6940'] = true,
				['48020'] = false,
				['1122'] = true,
				['5246'] = false,
				['215652'] = false,
				['59752'] = false,
				['357170'] = false,
				['102543'] = true,
				['115203'] = false,
				['15286'] = false,
				['210918'] = false,
				['345231'] = false,
				['336135'] = false,
				['121471'] = true,
				['102560'] = true,
				['*'] = false,
				['107574'] = true,
				['108968'] = false,
				['1719'] = true,
				['198067'] = true,
				['122783'] = false,
				['10060'] = true,
				['53480'] = false,
				['13750'] = true,
				['48707'] = false,
				['267217'] = true,
				['210256'] = false,
				['102558'] = true,
				['389539'] = true,
				['265202'] = false,
				['198111'] = false,
				['236320'] = false,
				['45438'] = false,
				['31230'] = false,
				['194223'] = true,
				['204336'] = false,
				['34477'] = true,
				['152279'] = true,
				['31935'] = false,
				['375087'] = true,
				['228920'] = true,
				['186265'] = false,
				['48792'] = false,
				['205604'] = false,
				['122470'] = false,
				['201430'] = true,
				['376079'] = true,
				['360952'] = true,
				['198838'] = false,
				['388615'] = true,
				['370965'] = true,
				['29166'] = true,
				['64044'] = false,
				['106951'] = true,
				['372835'] = true,
				['199452'] = false,
				['49206'] = true,
				['108238'] = false,
				['365350'] = true,
				['102342'] = false,
				['97462'] = false,
				['342245'] = false,
				['197268'] = false,
				['50334'] = true,
				['853'] = false,
				['108271'] = false,
				['30884'] = false,
				['6789'] = false,
				['109304'] = false,
				['193530'] = true,
				['378441'] = false,
				['47536'] = false,
				['64843'] = false,
				['377509'] = false,
				['228049'] = false,
				['227847'] = true,
				['86949'] = false,
				['383762'] = true,
				['23920'] = false,
				['2094'] = false,
				['378464'] = false,
				['374348'] = false,
				['114018'] = true,
				['19236'] = false,
				['370553'] = true,
				['12472'] = true,
				['123904'] = true,
				['51533'] = true,
				['192249'] = true,
				['388686'] = true,
				['31224'] = false,
				['5277'] = false,
				['1856'] = false,
				['205180'] = true,
				['114051'] = true,
				['205636'] = true,
				['288613'] = true,
				['114050'] = true,
				['122278'] = false,
				['196555'] = false,
				['7744'] = false,
				['47585'] = false,
				['19574'] = true,
				['642'] = false,
				['359844'] = true,
				['265187'] = true,
				['207289'] = true,
				['47482'] = false,
				['384318'] = true,
				['184364'] = false,
			}
		end
	end

	-- Set profile
	if layout == 'main' then
		OmniCDDB['profileKeys'][E.mynameRealm] = name
	elseif layout == 'healing' then
		OmniCDDB['profileKeys'][E.mynameRealm] = name_healing
	end

	L1UI:Print(L["OmniCD profile has been set."])
end
