local L1UI, E, L, V, P, G = unpack(select(2, ...))

local pairs = pairs

-- Quartz profile
function L1UI:Setup_Quartz(layout)
	if not E:IsAddOnEnabled('Quartz') then L1UI:Print('Quartz ' .. L["not installed or enabled."]) return end

	-- Disable ElvUI castbars if Quartz is used
	E.db.unitframe.units.focus.castbar.enable = false
	E.db.unitframe.units.player.castbar.enable = false
	E.db.unitframe.units.target.castbar.enable = false

	-- Profile names
	local name = E.global.L1UI.dev and 'Luckyone Main' or 'Luckyone Main ' .. L1UI.Version
	local name_healing = E.global.L1UI.dev and 'Luckyone Healing' or 'Luckyone Healing ' .. L1UI.Version

	-- Disable LibDualSpec to set the profile
	if E.Retail then
		Quartz3DB['namespaces']['LibDualSpec-1.0'] = Quartz3DB['namespaces']['LibDualSpec-1.0'] or {}
		Quartz3DB['namespaces']['LibDualSpec-1.0']['char'] = Quartz3DB['namespaces']['LibDualSpec-1.0']['char'] or {}
		Quartz3DB['namespaces']['LibDualSpec-1.0']['char'][E.mynameRealm] = Quartz3DB['namespaces']['LibDualSpec-1.0']['char'][E.mynameRealm] or {}
		Quartz3DB['namespaces']['LibDualSpec-1.0']['char'][E.mynameRealm]['enabled'] = false
	end

	-- Profile db
	for _, profile in pairs({ name, name_healing }) do
		-- Profile creation
		Quartz3DB['profiles'][profile] = Quartz3DB['profiles'][profile] or {}
		Quartz3DB['profiles'][profile] = {
			['completecolor'] = {
				0.01960784383118153, -- [1]
				1, -- [2]
				0, -- [3]
				1, -- [4]
			},
			['backgroundalpha'] = 0.9,
			['bordercolor'] = {
				nil, -- [1]
				nil, -- [2]
				nil, -- [3]
				1, -- [4]
			},
			['backgroundcolor'] = {
				0.05098039656877518, -- [1]
				0.05098039656877518, -- [2]
				0.05098039656877518, -- [3]
				1, -- [4]
			},
			['failcolor'] = {
				nil, -- [1]
				0, -- [2]
				nil, -- [3]
				1, -- [4]
			},
			['modules'] = {
				['Swing'] = false,
				['Buff'] = false,
				['Pet'] = false,
				['GCD'] = false,
				['Timer'] = false,
				['Range'] = false,
				['Mirror'] = false,
				['Latency'] = false,
			},
			['borderalpha'] = 0,
			['castingcolor'] = {
				0.01960784383118153, -- [1]
				1, -- [2]
				nil, -- [3]
				1, -- [4]
			},
			['sparkcolor'] = {
				nil, -- [1]
				nil, -- [2]
				nil, -- [3]
				0, -- [4]
			},
			['hidesamwise'] = false,
			['spelltextcolor'] = {
				nil, -- [1]
				nil, -- [2]
				nil, -- [3]
				1, -- [4]
			},
			['timetextcolor'] = {
				nil, -- [1]
				nil, -- [2]
				nil, -- [3]
				1, -- [4]
			},
		}
	end

	-- Shared db used
	Quartz3DB['namespaces']['Flight']['profiles'] = Quartz3DB['namespaces']['Flight']['profiles'] or {}
	Quartz3DB['namespaces']['Flight']['profiles'][name] = {
		['deplete'] = true,
	}
	Quartz3DB['namespaces']['Flight']['profiles'][name_healing] = {
		['deplete'] = true,
	}

	Quartz3DB['namespaces']['Range']['profiles'] = Quartz3DB['namespaces']['Range']['profiles'] or {}
	Quartz3DB['namespaces']['Range']['profiles'][name] = {
		['rangecolor'] = {
			nil, -- [1]
			nil, -- [2]
			nil, -- [3]
			1, -- [4]
		},
	}
	Quartz3DB['namespaces']['Range']['profiles'][name_healing] = {
		['rangecolor'] = {
			nil, -- [1]
			nil, -- [2]
			nil, -- [3]
			1, -- [4]
		},
	}

	Quartz3DB['namespaces']['Player']['profiles'] = Quartz3DB['namespaces']['Player']['profiles'] or {}
	Quartz3DB['namespaces']['Player']['profiles'][name] = {
		['timetextx'] = 2,
		['h'] = 18,
		['timefontsize'] = 11,
		['w'] = 276,
		['y'] = 227,
		['font'] = 'Expressway',
		['iconalpha'] = 1,
		['strata'] = 'HIGH',
		['point'] = 'BOTTOM',
		['border'] = 'Square Full White',
		['fontsize'] = 11,
		['texture'] = 'Minimalist',
		['nametextx'] = 2,
		['x'] = 0,
	}
	Quartz3DB['namespaces']['Player']['profiles'][name_healing] = {
		['timetextx'] = 2,
		['h'] = 18,
		['timefontsize'] = 11,
		['w'] = 321,
		['y'] = 90.9999771118164,
		['font'] = 'Expressway',
		['iconalpha'] = 1,
		['strata'] = 'HIGH',
		['point'] = 'BOTTOM',
		['border'] = 'Square Full White',
		['fontsize'] = 11,
		['texture'] = 'Minimalist',
		['nametextx'] = 2,
		['x'] = 0.000244140625,
	}

	-- Focus doesn't exist in Classic Era
	if not E.Classic then
		Quartz3DB['namespaces']['Focus']['profiles'] = Quartz3DB['namespaces']['Focus']['profiles'] or {}
		Quartz3DB['namespaces']['Focus']['profiles'][name] = {
			['timetextx'] = 2,
			['nametextx'] = 2,
			['w'] = 238,
			['y'] = -140.9997406005859,
			['font'] = 'Expressway',
			['iconalpha'] = 1,
			['strata'] = 'HIGH',
			['point'] = 'CENTER',
			['border'] = 'Square Full White',
			['noInterruptColor'] = {
				nil, -- [1]
				0, -- [2]
				nil, -- [3]
				1, -- [4]
			},
			['fontsize'] = 11,
			['texture'] = 'Minimalist',
			['timefontsize'] = 11,
			['noInterruptChangeColor'] = true,
			['noInterruptShield'] = false,
			['x'] = 278.0001831054688,
		}
		Quartz3DB['namespaces']['Focus']['profiles'][name_healing] = {
			['timetextx'] = 2,
			['nametextx'] = 2,
			['w'] = 238,
			['y'] = -140.9997100830078,
			['font'] = 'Expressway',
			['iconalpha'] = 1,
			['strata'] = 'HIGH',
			['point'] = 'CENTER',
			['border'] = 'Square Full White',
			['noInterruptColor'] = {
				nil, -- [1]
				0, -- [2]
				nil, -- [3]
				1, -- [4]
			},
			['fontsize'] = 11,
			['texture'] = 'Minimalist',
			['timefontsize'] = 11,
			['noInterruptChangeColor'] = true,
			['noInterruptShield'] = false,
			['x'] = 358.0001220703125,
		}
	end

	Quartz3DB['namespaces']['Target']['profiles'] = Quartz3DB['namespaces']['Target']['profiles'] or {}
	Quartz3DB['namespaces']['Target']['profiles'][name] = {
		['timetextx'] = 2,
		['nametextx'] = 2,
		['w'] = 238,
		['y'] = -250.9998168945313,
		['font'] = 'Expressway',
		['iconalpha'] = 1,
		['iconposition'] = 'left',
		['strata'] = 'HIGH',
		['point'] = 'CENTER',
		['border'] = 'Square Full White',
		['noInterruptColor'] = {
			nil, -- [1]
			0, -- [2]
			nil, -- [3]
			1, -- [4]
		},
		['fontsize'] = 11,
		['texture'] = 'Minimalist',
		['x'] = 278.0004272460938,
		['noInterruptShield'] = false,
		['noInterruptChangeColor'] = true,
		['timefontsize'] = 11,
	}
	Quartz3DB['namespaces']['Target']['profiles'][name_healing] = {
		['timetextx'] = 2,
		['nametextx'] = 2,
		['w'] = 238,
		['y'] = -250.9997100830078,
		['font'] = 'Expressway',
		['iconalpha'] = 1,
		['iconposition'] = 'left',
		['strata'] = 'HIGH',
		['point'] = 'CENTER',
		['border'] = 'Square Full White',
		['noInterruptColor'] = {
			nil, -- [1]
			0, -- [2]
			nil, -- [3]
			1, -- [4]
		},
		['fontsize'] = 11,
		['texture'] = 'Minimalist',
		['x'] = 358.000244140625,
		['noInterruptShield'] = false,
		['noInterruptChangeColor'] = true,
		['timefontsize'] = 11,
	}

	-- Shared db unused
	Quartz3DB['namespaces']['Buff'] = {}
	Quartz3DB['namespaces']['EnemyCasts'] = {}
	Quartz3DB['namespaces']['GCD'] = {}
	Quartz3DB['namespaces']['Interrupt'] = {}
	Quartz3DB['namespaces']['Latency'] = {}
	Quartz3DB['namespaces']['Mirror'] = {}
	Quartz3DB['namespaces']['Swing'] = {}

	-- Set profile
	if layout == 'main' then
		Quartz3DB['profileKeys'][E.mynameRealm] = name
	elseif layout == 'healing' then
		Quartz3DB['profileKeys'][E.mynameRealm] = name_healing
	end

	L1UI:Print(L["Quartz profile has been set."])
end
