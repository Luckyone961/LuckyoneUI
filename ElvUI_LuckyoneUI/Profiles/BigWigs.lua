local Name, Private = ...
local E, L, V, P, G = unpack(ElvUI)

local IsAddOnLoaded = (C_AddOns and C_AddOns.IsAddOnLoaded) or IsAddOnLoaded
local LoadAddOn = (C_AddOns and C_AddOns.LoadAddOn) or LoadAddOn
local pairs = pairs

-- Dev
local dev = E.global.L1UI.dev
-- 1080p
local scaled = E.global.L1UI.scaled

-- BigWigs profiles
function Private:Setup_BigWigs(layout)
	if not E:IsAddOnEnabled('BigWigs') then Private:Print('BigWigs ' .. L["is not installed or enabled."]) return end

	-- Profile names
	local name = dev and 'Luckyone Main' or 'Luckyone Main ' .. Private.Version
	local name_healing = dev and 'Luckyone Healing' or 'Luckyone Healing ' .. Private.Version

	-- Required to add profiles to BigWigs3DB
	if not IsAddOnLoaded('BigWigs_Core') then LoadAddOn('BigWigs_Core') end

	-- Required to add profiles to Plugins DB
	if not IsAddOnLoaded('BigWigs_Plugins') then LoadAddOn('BigWigs_Plugins') end

	-- Profile creation
	BigWigs3DB['profiles'] = BigWigs3DB['profiles'] or {}
	BigWigs3DB['namespaces'] = BigWigs3DB['namespaces'] or {}

	for _, profile in pairs({ name, name_healing }) do
		BigWigs3DB['profiles'][profile] = BigWigs3DB['profiles'][profile] or {}
		BigWigs3DB['profiles'][profile]['showZoneMessages'] = false
		BigWigs3DB['profiles'][profile]['fakeDBMVersion'] = true
		BigWigs3DB['profiles'][profile]['flash'] = false
	end

	-- Disable minimap icon
	BigWigsIconDB['hide'] = true

	-- Profile data
	BigWigs3DB['namespaces']['BigWigs_Plugins_AutoReply']['profiles'] = BigWigs3DB['namespaces']['BigWigs_Plugins_AutoReply']['profiles'] or {}
	BigWigs3DB['namespaces']['BigWigs_Plugins_AutoReply']['profiles'][name] = {
		['exitCombatOther'] = 3,
		['disabled'] = false,
		['modeOther'] = 2,
	}
	BigWigs3DB['namespaces']['BigWigs_Plugins_AutoReply']['profiles'][name_healing] = {
		['exitCombatOther'] = 3,
		['disabled'] = false,
		['modeOther'] = 2,
	}

	BigWigs3DB['namespaces']['BigWigs_Plugins_Bars']['profiles'] = BigWigs3DB['namespaces']['BigWigs_Plugins_Bars']['profiles'] or {}
	BigWigs3DB['namespaces']['BigWigs_Plugins_Bars']['profiles'][name] = {
		['barStyle'] = 'ElvUI',
		['BigWigsAnchor_height'] = 18.00000190734863,
		['BigWigsAnchor_width'] = 239,
		['BigWigsAnchor_x'] = 470.3110271327969,
		['BigWigsAnchor_y'] = 251.689059350565,
		['BigWigsEmphasizeAnchor_height'] = 18.00000190734863,
		['BigWigsEmphasizeAnchor_width'] = 239,
		['BigWigsEmphasizeAnchor_x'] = 470.5334229777291,
		['BigWigsEmphasizeAnchor_y'] = 241.4668094684748,
		['emphasizeMove'] = false,
		['emphasizeMultiplier'] = 1,
		['emphasizeRestart'] = false,
		['emphasizeTime'] = 8,
		['fontName'] = 'Expressway',
		['fontSizeEmph'] = 11,
		['fontSizeNameplate'] = 10,
		['interceptKey'] = 'SHIFT',
		['nameplateAlpha'] = 1,
		['nameplateHeight'] = 14,
		['nameplateOffsetY'] = 0,
		['outline'] = 'OUTLINE',
		['spacing'] = 3,
		['texture'] = 'Minimalist',
		['visibleBarLimit'] = 6,
		['visibleBarLimitEmph'] = 5,
	}

	-- 1080p bars Main
	if scaled then
		BigWigs3DB['namespaces']['BigWigs_Plugins_Bars']['profiles'][name]['BigWigsAnchor_x'] = 399.9109471835982
		BigWigs3DB['namespaces']['BigWigs_Plugins_Bars']['profiles'][name]['BigWigsAnchor_y'] = 229.2889812465364
		BigWigs3DB['namespaces']['BigWigs_Plugins_Bars']['profiles'][name]['BigWigsEmphasizeAnchor_x'] = 399.600009676069
		BigWigs3DB['namespaces']['BigWigs_Plugins_Bars']['profiles'][name]['BigWigsEmphasizeAnchor_y'] = 215.3333819502768
	end

	BigWigs3DB['namespaces']['BigWigs_Plugins_Bars']['profiles'][name_healing] = {
		['barStyle'] = 'ElvUI',
		['BigWigsAnchor_height'] = 18.00000190734863,
		['BigWigsAnchor_width'] = 239,
		['BigWigsAnchor_x'] = 392.977819974556,
		['BigWigsAnchor_y'] = 241.5556115564395,
		['BigWigsEmphasizeAnchor_height'] = 18.00000190734863,
		['BigWigsEmphasizeAnchor_width'] = 239,
		['BigWigsEmphasizeAnchor_x'] = 393.2001181632331,
		['BigWigsEmphasizeAnchor_y'] = 231.3332802941368,
		['emphasizeMove'] = false,
		['emphasizeMultiplier'] = 1,
		['emphasizeRestart'] = false,
		['emphasizeTime'] = 8,
		['fontName'] = 'Expressway',
		['fontSizeEmph'] = 11,
		['fontSizeNameplate'] = 10,
		['interceptKey'] = 'SHIFT',
		['nameplateAlpha'] = 1,
		['nameplateHeight'] = 14,
		['nameplateOffsetY'] = 0,
		['outline'] = 'OUTLINE',
		['spacing'] = 3,
		['texture'] = 'Minimalist',
		['visibleBarLimit'] = 6,
		['visibleBarLimitEmph'] = 5,
	}

	-- 1080p bars Healing
	if scaled then
		BigWigs3DB['namespaces']['BigWigs_Plugins_Bars']['profiles'][name_healing]['BigWigsAnchor_x'] = 332.1778943282061
		BigWigs3DB['namespaces']['BigWigs_Plugins_Bars']['profiles'][name_healing]['BigWigsAnchor_y'] = 239.4224016307999
		BigWigs3DB['namespaces']['BigWigs_Plugins_Bars']['profiles'][name_healing]['BigWigsEmphasizeAnchor_height'] = 18.00000190734863
		BigWigs3DB['namespaces']['BigWigs_Plugins_Bars']['profiles'][name_healing]['BigWigsEmphasizeAnchor_width'] = 239
		BigWigs3DB['namespaces']['BigWigs_Plugins_Bars']['profiles'][name_healing]['BigWigsEmphasizeAnchor_x'] = 332.400203361367
		BigWigs3DB['namespaces']['BigWigs_Plugins_Bars']['profiles'][name_healing]['BigWigsEmphasizeAnchor_y'] = 224.9332519743984
	end

	BigWigs3DB['namespaces']['BigWigs_Plugins_BossBlock']['profiles'] = BigWigs3DB['namespaces']['BigWigs_Plugins_BossBlock']['profiles'] or {}
	BigWigs3DB['namespaces']['BigWigs_Plugins_BossBlock']['profiles'][name] = {
		['blockTalkingHeads'] = {
			true,
			nil,
			nil,
			true,
		},
	}
	BigWigs3DB['namespaces']['BigWigs_Plugins_BossBlock']['profiles'][name_healing] = {
		['blockTalkingHeads'] = {
			true,
			nil,
			nil,
			true,
		},
	}

	BigWigs3DB['namespaces']['BigWigs_Plugins_Colors']['profiles'] = BigWigs3DB['namespaces']['BigWigs_Plugins_Colors']['profiles'] or {}
	BigWigs3DB['namespaces']['BigWigs_Plugins_Colors']['profiles'][name] = {
		['barBackground'] = {
			['BigWigs_Plugins_Colors'] = {
				['default'] = {
					0.05,
					0.05,
					0.05,
					0.90,
				},
			},
		},
	}
	BigWigs3DB['namespaces']['BigWigs_Plugins_Colors']['profiles'][name_healing] = {
		['barBackground'] = {
			['BigWigs_Plugins_Colors'] = {
				['default'] = {
					0.05,
					0.05,
					0.05,
					0.90,
				},
			},
		},
	}

	BigWigs3DB['namespaces']['BigWigs_Plugins_Countdown']['profiles'] = BigWigs3DB['namespaces']['BigWigs_Plugins_Countdown']['profiles'] or {}
	BigWigs3DB['namespaces']['BigWigs_Plugins_Countdown']['profiles'][name] = {
		['outline'] = 'OUTLINE',
		['fontSize'] = 50,
		['fontName'] = 'Expressway',
		['position'] = {
			nil,
			nil,
			nil,
			-385,
		},
	}
	BigWigs3DB['namespaces']['BigWigs_Plugins_Countdown']['profiles'][name_healing] = {
		['outline'] = 'OUTLINE',
		['fontSize'] = 50,
		['fontName'] = 'Expressway',
		['position'] = {
			nil,
			nil,
			nil,
			-380,
		},
	}

	BigWigs3DB['namespaces']['BigWigs_Plugins_InfoBox']['profiles'] = BigWigs3DB['namespaces']['BigWigs_Plugins_InfoBox']['profiles'] or {}
	BigWigs3DB['namespaces']['BigWigs_Plugins_InfoBox']['profiles'][name] = {
		['position'] = {
			'BOTTOM',
			'BOTTOM',
			-507,
			1.000007390975952,
		},
	}
	BigWigs3DB['namespaces']['BigWigs_Plugins_InfoBox']['profiles'][name_healing] = {
		['position'] = {
			'BOTTOM',
			'BOTTOM',
			-507,
			1.000007390975952,
		},
	}

	-- 1080p info box
	if scaled then
		BigWigs3DB['namespaces']['BigWigs_Plugins_InfoBox']['profiles'][name]['position'] = {
			'BOTTOM',
			'BOTTOM',
			-360.749755859375,
			1.000032067298889
		}
		BigWigs3DB['namespaces']['BigWigs_Plugins_InfoBox']['profiles'][name_healing]['position'] = {
			'BOTTOM',
			'BOTTOM',
			-360.749755859375,
			1.000032067298889
		}
	end

	BigWigs3DB['namespaces']['BigWigs_Plugins_Messages']['profiles'] = BigWigs3DB['namespaces']['BigWigs_Plugins_Messages']['profiles'] or {}
	BigWigs3DB['namespaces']['BigWigs_Plugins_Messages']['profiles'][name] = {
		['outline'] = 'OUTLINE',
		['fontSize'] = 16,
		['emphFontName'] = 'Expressway',
		['emphFontSize'] = 20,
		['growUpwards'] = false,
		['emphOutline'] = 'OUTLINE',
		['emphPosition'] = {
			'TOP',
			'TOP',
			nil,
			-465,
		},
		['fontName'] = 'Expressway',
		['normalPosition'] = {
			'CENTER',
			'CENTER',
			nil,
			-15,
		},
	}
	BigWigs3DB['namespaces']['BigWigs_Plugins_Messages']['profiles'][name_healing] = {
		['outline'] = 'OUTLINE',
		['fontSize'] = 16,
		['emphFontName'] = 'Expressway',
		['emphFontSize'] = 20,
		['growUpwards'] = false,
		['emphOutline'] = 'OUTLINE',
		['emphPosition'] = {
			'TOP',
			'TOP',
			nil,
			-300,
		},
		['fontName'] = 'Expressway',
		['normalPosition'] = {
			'CENTER',
			'CENTER',
			nil,
			250,
		},
	}

	BigWigs3DB['namespaces']['BigWigs_Plugins_Pull']['profiles'] = BigWigs3DB['namespaces']['BigWigs_Plugins_Pull']['profiles'] or {}
	BigWigs3DB['namespaces']['BigWigs_Plugins_Pull']['profiles'][name] = {
		['voice'] = 'enUS: Default (Female)',
		['endPullSound'] = 'None',
	}
	BigWigs3DB['namespaces']['BigWigs_Plugins_Pull']['profiles'][name_healing] = {
		['voice'] = 'enUS: Default (Female)',
		['endPullSound'] = 'None',
	}

	BigWigs3DB['namespaces']['BigWigs_Plugins_Raid Icons']['profiles'] = BigWigs3DB['namespaces']['BigWigs_Plugins_Raid Icons']['profiles'] or {}
	BigWigs3DB['namespaces']['BigWigs_Plugins_Raid Icons']['profiles'][name] = {
		['disabled'] = true,
	}
	BigWigs3DB['namespaces']['BigWigs_Plugins_Raid Icons']['profiles'][name_healing] = {
		['disabled'] = true,
	}

	BigWigs3DB['namespaces']['BigWigs_Plugins_Victory']['profiles'] = BigWigs3DB['namespaces']['BigWigs_Plugins_Victory']['profiles'] or {}
	BigWigs3DB['namespaces']['BigWigs_Plugins_Victory']['profiles'][name] = {
		['bigwigsMsg'] = true,
		['blizzMsg'] = false,
	}
	BigWigs3DB['namespaces']['BigWigs_Plugins_Victory']['profiles'][name_healing] = {
		['bigwigsMsg'] = true,
		['blizzMsg'] = false,
	}

	if E.Retail then
		-- Disable LibDualSpec to set the profile
		BigWigs3DB['namespaces']['LibDualSpec-1.0'] = BigWigs3DB['namespaces']['LibDualSpec-1.0'] or {}
		BigWigs3DB['namespaces']['LibDualSpec-1.0']['char'] = BigWigs3DB['namespaces']['LibDualSpec-1.0']['char'] or {}
		BigWigs3DB['namespaces']['LibDualSpec-1.0']['char'][E.mynameRealm] = BigWigs3DB['namespaces']['LibDualSpec-1.0']['char'][E.mynameRealm] or {}
		BigWigs3DB['namespaces']['LibDualSpec-1.0']['char'][E.mynameRealm]['enabled'] = false

		-- AltPower db
		BigWigs3DB['namespaces']['BigWigs_Plugins_AltPower']['profiles'] = BigWigs3DB['namespaces']['BigWigs_Plugins_AltPower']['profiles'] or {}
		BigWigs3DB['namespaces']['BigWigs_Plugins_AltPower']['profiles'][name] = {
			['disabled'] = true,
		}
		BigWigs3DB['namespaces']['BigWigs_Plugins_AltPower']['profiles'][name_healing] = {
			['disabled'] = true,
		}
	end

	-- Set profile
	if layout == 'main' then
		BigWigs.db:SetProfile(name)
	elseif layout == 'healing' then
		BigWigs.db:SetProfile(name_healing)
	end

	Private:Print(L["BigWigs profile has been set."])
end
