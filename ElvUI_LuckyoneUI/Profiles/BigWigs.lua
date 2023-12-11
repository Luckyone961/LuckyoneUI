local Name, Private = ...
local E, L, V, P, G = unpack(ElvUI)

local IsAddOnLoaded = IsAddOnLoaded
local LoadAddOn = LoadAddOn
local pairs = pairs

-- BigWigs profiles
function L1UI:Setup_BigWigs(layout)
	if not E:IsAddOnEnabled('BigWigs') then Private:Print('BigWigs ' .. L["is not installed or enabled."]) return end

	-- Profile names
	local name = E.global.L1UI.dev and 'Luckyone Main' or 'Luckyone Main ' .. Private.Version
	local name_healing = E.global.L1UI.dev and 'Luckyone Healing' or 'Luckyone Healing ' .. Private.Version

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
		['BigWigsAnchor_height'] = 15.99998760223389,
		['BigWigsAnchor_width'] = 221.0000152587891,
		['BigWigsAnchor_x'] = 412.7110342991,
		['BigWigsAnchor_y'] = 212.222422673558,
		['BigWigsEmphasizeAnchor_height'] = 15.99998760223389,
		['BigWigsEmphasizeAnchor_width'] = 221.0000152587891,
		['BigWigsEmphasizeAnchor_x'] = 598,
		['BigWigsEmphasizeAnchor_y'] = 178.0001345184974,
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
		['visibleBarLimit'] = 4,
		['visibleBarLimitEmph'] = 4,
	}
	BigWigs3DB['namespaces']['BigWigs_Plugins_Bars']['profiles'][name_healing] = {
		['barStyle'] = 'ElvUI',
		['BigWigsAnchor_height'] = 15.99998760223389,
		['BigWigsAnchor_width'] = 221.0000305175781,
		['BigWigsAnchor_x'] = 355.8220138243451,
		['BigWigsAnchor_y'] = 212.222422673558,
		['BigWigsEmphasizeAnchor_height'] = 15.99998760223389,
		['BigWigsEmphasizeAnchor_width'] = 221.0000305175781,
		['BigWigsEmphasizeAnchor_x'] = 866.088996666258,
		['BigWigsEmphasizeAnchor_y'] = 198.2889804958904,
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
		['visibleBarLimit'] = 4,
		['visibleBarLimitEmph'] = 4,
	}

	BigWigs3DB['namespaces']['BigWigs_Plugins_BossBlock']['profiles'] = BigWigs3DB['namespaces']['BigWigs_Plugins_BossBlock']['profiles'] or {}
	BigWigs3DB['namespaces']['BigWigs_Plugins_BossBlock']['profiles'][name] = {
		['blockTalkingHeads'] = {
			true, -- [1]
			nil, -- [2]
			nil, -- [3]
			true, -- [4]
		},
	}
	BigWigs3DB['namespaces']['BigWigs_Plugins_BossBlock']['profiles'][name_healing] = {
		['blockTalkingHeads'] = {
			true, -- [1]
			nil, -- [2]
			nil, -- [3]
			true, -- [4]
		},
	}

	BigWigs3DB['namespaces']['BigWigs_Plugins_Colors']['profiles'] = BigWigs3DB['namespaces']['BigWigs_Plugins_Colors']['profiles'] or {}
	BigWigs3DB['namespaces']['BigWigs_Plugins_Colors']['profiles'][name] = {
		['barBackground'] = {
			['BigWigs_Plugins_Colors'] = {
				['default'] = {
					0.05882352941176471, -- [1]
					0.05882352941176471, -- [2]
					0.05882352941176471, -- [3]
					1, -- [4]
				},
			},
		},
	}
	BigWigs3DB['namespaces']['BigWigs_Plugins_Colors']['profiles'][name_healing] = {
		['barBackground'] = {
			['BigWigs_Plugins_Colors'] = {
				['default'] = {
					0.05882352941176471, -- [1]
					0.05882352941176471, -- [2]
					0.05882352941176471, -- [3]
					1, -- [4]
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
			nil, -- [1]
			nil, -- [2]
			nil, -- [3]
			-385, -- [4]
		},
	}
	BigWigs3DB['namespaces']['BigWigs_Plugins_Countdown']['profiles'][name_healing] = {
		['outline'] = 'OUTLINE',
		['fontSize'] = 50,
		['fontName'] = 'Expressway',
		['position'] = {
			nil, -- [1]
			nil, -- [2]
			nil, -- [3]
			-380, -- [4]
		},
	}

	BigWigs3DB['namespaces']['BigWigs_Plugins_InfoBox']['profiles'] = BigWigs3DB['namespaces']['BigWigs_Plugins_InfoBox']['profiles'] or {}
	BigWigs3DB['namespaces']['BigWigs_Plugins_InfoBox']['profiles'][name] = {
		['posx'] = 962.8443809535747,
		['posy'] = 72.42229450539753,
	}
	BigWigs3DB['namespaces']['BigWigs_Plugins_InfoBox']['profiles'][name_healing] = {
		['posx'] = 962.8443809535747,
		['posy'] = 72.42229450539753,
	}

	BigWigs3DB['namespaces']['BigWigs_Plugins_Messages']['profiles'] = BigWigs3DB['namespaces']['BigWigs_Plugins_Messages']['profiles'] or {}
	BigWigs3DB['namespaces']['BigWigs_Plugins_Messages']['profiles'][name] = {
		['outline'] = 'OUTLINE',
		['fontSize'] = 16,
		['emphFontName'] = 'Expressway',
		['emphFontSize'] = 20,
		['growUpwards'] = false,
		['emphOutline'] = 'OUTLINE',
		['emphPosition'] = {
			'TOP', -- [1]
			'TOP', -- [2]
			nil, -- [3]
			-465, -- [4]
		},
		['fontName'] = 'Expressway',
		['normalPosition'] = {
			'CENTER', -- [1]
			'CENTER', -- [2]
			nil, -- [3]
			-15, -- [4]
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
			'TOP', -- [1]
			'TOP', -- [2]
			nil, -- [3]
			-300, -- [4]
		},
		['fontName'] = 'Expressway',
		['normalPosition'] = {
			'CENTER', -- [1]
			'CENTER', -- [2]
			nil, -- [3]
			250, -- [4]
		},
	}

	BigWigs3DB['namespaces']['BigWigs_Plugins_Proximity']['profiles'] = BigWigs3DB['namespaces']['BigWigs_Plugins_Proximity']['profiles'] or {}
	BigWigs3DB['namespaces']['BigWigs_Plugins_Proximity']['profiles'][name] = {
		['posx'] = 296,
		['fontSize'] = 18,
		['fontName'] = 'Expressway',
		['width'] = 150.0000915527344,
		['objects'] = {
			['title'] = false,
			['close'] = false,
			['ability'] = false,
			['tooltip'] = false,
			['sound'] = false,
		},
		['posy'] = 87,
		['lock'] = true,
		['height'] = 119.9999694824219,
		['font'] = 'Friz Quadrata TT',
	}
	BigWigs3DB['namespaces']['BigWigs_Plugins_Proximity']['profiles'][name_healing] = {
		['posx'] = 296,
		['fontSize'] = 18,
		['fontName'] = 'Expressway',
		['width'] = 150.0000915527344,
		['objects'] = {
			['title'] = false,
			['close'] = false,
			['ability'] = false,
			['tooltip'] = false,
			['sound'] = false,
		},
		['posy'] = 87,
		['lock'] = true,
		['height'] = 119.9999694824219,
		['font'] = 'Friz Quadrata TT',
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
