-- Lua functions
local unpack = unpack

-- Global environment
local _G = _G

-- AddOn namespace
local _, Private = ...

-- ElvUI modules
local E, L = unpack(ElvUI)

-- WarpDeplete profile
function Private:Setup_WarpDeplete(installer)
	if not E:IsAddOnEnabled('WarpDeplete') and E.Retail then Private:Print('WarpDeplete ' .. L["is not installed or enabled."]) return end

	-- Profile name
	local name = (E.global.L1UI.dev and 'Luckyone') or 'Luckyone ' .. Private.Version

	-- Profile data
	WarpDepleteDB['profiles'][name] = WarpDepleteDB['profiles'][name] or {}
	WarpDepleteDB['profiles'][name] = {
		['bar1Font'] = Private.Font,
		['bar1FontSize'] = 11,
		['bar1Texture'] = Private.Texture,
		['bar2Font'] = Private.Font,
		['bar2FontSize'] = 11,
		['bar2Texture'] = Private.Texture,
		['bar3Font'] = Private.Font,
		['bar3FontSize'] = 11,
		['bar3Texture'] = Private.Texture,
		['barHeight'] = 16,
		['barPadding'] = 4,
		['barWidth'] = 300,
		['deathsFont'] = Private.Font,
		['deathsFontSize'] = 15,
		['forcesFont'] = Private.Font,
		['forcesFontSize'] = 11,
		['forcesOverlayTexture'] = Private.Texture,
		['forcesTexture'] = Private.Texture,
		['frameAnchor'] = 'TOPRIGHT',
		['frameX'] = 18.99979209899902,
		['frameY'] = -185.0000457763672,
		['keyDetailsFont'] = Private.Font,
		['keyDetailsFontSize'] = 10,
		['keyFont'] = Private.Font,
		['keyFontSize'] = 11,
		['objectivesFont'] = Private.Font,
		['objectivesFontSize'] = 12,
		['showDeathsTooltip'] = false,
		['timerFont'] = Private.Font,
		['timerFontSize'] = 24,
	}

	-- Profile key
	WarpDepleteDB['profileKeys'][E.mynameRealm] = name

	if installer then
		_G.LuckyoneInstallStepComplete.message = L["WarpDeplete profile has been set."]
		_G.LuckyoneInstallStepComplete:Show()
	end

	Private:Print(L["WarpDeplete profile has been set."])
end
