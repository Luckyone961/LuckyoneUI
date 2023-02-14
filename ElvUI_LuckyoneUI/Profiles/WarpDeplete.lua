local L1UI, E, L, V, P, G = unpack(select(2, ...))

-- WarpDeplete Profile
function L1UI:Setup_WarpDeplete()
	if not E:IsAddOnEnabled('WarpDeplete') and E.Retail then return end

	-- Profile name
	local name = E.global.L1UI.dev and 'Luckyone' or 'Luckyone ' .. L1UI.Version

	-- Profile data
	WarpDepleteDB['profiles'][name] = WarpDepleteDB['profiles'][name] or {}
	WarpDepleteDB['profiles'][name] = {
		['bar1Font'] = L1UI.DefaultFont,
		['bar1FontSize'] = 11,
		['bar1Texture'] = L1UI.DefaultTexture,
		['bar2Font'] = L1UI.DefaultFont,
		['bar2FontSize'] = 11,
		['bar2Texture'] = L1UI.DefaultTexture,
		['bar3Font'] = L1UI.DefaultFont,
		['bar3FontSize'] = 11,
		['bar3Texture'] = L1UI.DefaultTexture,
		['barWidth'] = 244,
		['deathsFont'] = L1UI.DefaultFont,
		['deathsFontSize'] = 11,
		['forcesFont'] = L1UI.DefaultFont,
		['forcesFontSize'] = 11,
		['forcesOverlayTexture'] = L1UI.DefaultTexture,
		['forcesTexture'] = L1UI.DefaultTexture,
		['frameAnchor'] = 'TOPRIGHT',
		['frameX'] = 19.00000953674316,
		['frameY'] = -164.0001068115234,
		['keyDetailsFont'] = L1UI.DefaultFont,
		['keyDetailsFontSize'] = 11,
		['keyFont'] = L1UI.DefaultFont,
		['keyFontSize'] = 11,
		['objectivesFont'] = L1UI.DefaultFont,
		['objectivesFontSize'] = 11,
		['showDeathsTooltip'] = false,
		['timerFont'] = L1UI.DefaultFont,
		['timerFontSize'] = 22,
	}

	-- Profile key
	WarpDepleteDB['profileKeys'][E.mynameRealm] = name

	L1UI:Print(L["WarpDeplete profile has been set."])
end
