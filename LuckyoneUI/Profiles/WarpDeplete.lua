local _, Private = ...
local L = Private.Libs.ACL

-- Retail file
if not Private.isRetail then
	return
end

-- WarpDeplete profile
function Private:Setup_WarpDeplete(installer)
	if not (Private.IsAddOnLoaded('WarpDeplete') and Private.isRetail) then Private:Print('WarpDeplete ' .. L["is not installed or enabled."]) return end

	-- Global dbs
	local dev, scaled = Private.Addon.db.global.dev, Private.Addon.db.global.scaled

	-- Profile name
	local name = (dev and 'Luckyone') or 'Luckyone ' .. Private.Version

	-- Profile data
	WarpDepleteDB['profiles'][name] = WarpDepleteDB['profiles'][name] or {}
	WarpDepleteDB['profiles'][name] = {
		['backdropTexture'] = Private.Texture,
		['bar1Font'] = Private.Font,
		['bar1FontSize'] = 12,
		['bar1Texture'] = Private.Texture,
		['bar2Font'] = Private.Font,
		['bar2FontSize'] = 12,
		['bar2Texture'] = Private.Texture,
		['bar3Font'] = Private.Font,
		['bar3FontSize'] = 12,
		['bar3Texture'] = Private.Texture,
		['barHeight'] = 16,
		['barPadding'] = 4,
		['barWidth'] = (scaled and 240) or 300,
		['deathsFont'] = Private.Font,
		['deathsFontSize'] = 15,
		['forcesFont'] = Private.Font,
		['forcesFontSize'] = 12,
		['forcesOverlayTexture'] = Private.Texture,
		['forcesTexture'] = Private.Texture,
		['frameAnchor'] = 'TOPRIGHT',
		['frameX'] = 19,
		['frameY'] = -211,
		['keyDetailsFont'] = Private.Font,
		['keyDetailsFontSize'] = 12,
		['keyFont'] = Private.Font,
		['keyFontSize'] = 12,
		['objectivesFont'] = Private.Font,
		['objectivesFontSize'] = 12,
		['showDeathsTooltip'] = false,
		['timerFont'] = Private.Font,
		['timerFontSize'] = 24,
	}

	-- Profile key
	WarpDepleteDB['profileKeys'][Private.myNameRealm] = name

	Private:Print(L["WarpDeplete profile has been set."], installer)
end
