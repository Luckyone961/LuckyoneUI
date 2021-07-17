local L1UI, E, L, V, P, G = unpack(select(2, ...))

-- Gnosis Profile
function L1UI:Get_Gnosis_Profile(layout)

	-- Profile Names
	local main, healing = "Luckyone DPS/TANK", "Luckyone Healing"

	-- Disable ElvUI castbars if Gnosis is used
	E.db["unitframe"]["units"]["arena"]["castbar"]["enable"] = false
	E.db["unitframe"]["units"]["boss"]["castbar"]["enable"] = false
	E.db["unitframe"]["units"]["focus"]["castbar"]["enable"] = false
	E.db["unitframe"]["units"]["player"]["castbar"]["enable"] = false
	E.db["unitframe"]["units"]["target"]["castbar"]["enable"] = false

	-- Add Profile/s from here without overriding the existing ones
	GnosisConfigs[main] = GnosisConfigs[main] or {}

	GnosisConfigs[main]["maintab"] = GnosisConfigs[main]["maintab"] or {}
	GnosisConfigs[main]["maintab"] = {
		["bHideAddonMsgs"] = false,
		["bAutoCreateOptions"] = false,
		["bHideMirror"] = true,
		["bResizeOptions"] = true,
		["bHideBlizz"] = true,
		["bHidePetVeh"] = true,
		["strLocale"] = "default",
		["iTimerScanEvery"] = 150,
		["bAddonEn"] = true,
	}

	GnosisConfigs[main]["ct"] = GnosisConfigs[main]["ct"] or {}
	GnosisConfigs[main]["ct"] = {
		["bsound"] = false,
		["addon"] = "Blizz",
		["bfile"] = false,
		["channel"] = 1,
		["ctt"] = 300,
		["wfcl"] = 1000,
		["sound"] = "MONEYFRAMEOPEN",
		["bmusic"] = false,
	}

	GnosisConfigs[main]["cbconf"] = GnosisConfigs[main]["cbconf"] or {}
	GnosisConfigs[main]["cbconf"] = {
		["Player"] = {
			["fSparkHeightMulti"] = 1,
			["rotatertext"] = 0,
			["bShowShield"] = false,
			["bMergeTrade"] = true,
			["fadeout"] = 0.5,
			["colBarBg"] = {
				0.05882352941176471, -- [1]
				0.05882352941176471, -- [2]
				0.05882352941176471, -- [3]
				0.75, -- [4]
			},
			["colSuccess"] = {
				0.15, -- [1]
				0.25, -- [2]
				0.1, -- [3]
				0.7, -- [4]
			},
			["incombatsel"] = 1,
			["alignname"] = "LEFT",
			["bordertexture"] = "None",
			["bnwtypesel"] = 1,
			["colBarNI"] = {
				1, -- [1]
				0, -- [2]
				0.00784313725490196, -- [3]
				1, -- [4]
			},
			["font"] = "Expressway",
			["colFailed"] = {
				0.7, -- [1]
				0.3, -- [2]
				0.2, -- [3]
				0.75, -- [4]
			},
			["colTextLag"] = {
				1, -- [1]
				0, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["anchortype"] = 1,
			["bShowTicks"] = true,
			["rotatectext"] = 0,
			["strNameFormat"] = "namecol<1,0,0>txm< (>misctxm<)>col<pre>txts< (>tscurtxts</>tstottxts<)>",
			["colShadow"] = {
				0, -- [1]
				0, -- [2]
				0, -- [3]
				0.7, -- [4]
			},
			["anchor_y"] = 0,
			["rotatelattext"] = 0,
			["unit"] = "player",
			["aligntime"] = "RIGHT",
			["fontsize"] = 0,
			["bordericon"] = 1,
			["instancetype"] = 1,
			["bnwlistnew"] = "",
			["anchorto"] = 5,
			["bartexture"] = "Minimalist",
			["fontsize_timer"] = 0,
			["colBorderNI"] = {
				0, -- [1]
				0, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["alpha"] = 1,
			["fSparkWidthMulti"] = 0.8,
			["bShowAsMinutes"] = true,
			["colBar"] = {
				0.02352941176470588, -- [1]
				1, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["rotateicon"] = 0,
			["bShowLat"] = false,
			["anchor"] = {
				["px"] = 0.5053710815127491,
				["py"] = 0.1080729262650213,
			},
			["bEnShadowCol"] = true,
			["bInvDir"] = false,
			["orient"] = 1,
			["spectab"] = {
				true, -- [1]
				true, -- [2]
				true, -- [3]
				true, -- [4]
			},
			["bEnShadowOffset"] = false,
			["colSpark"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["anchorfrom"] = 5,
			["coord"] = {
				["casttime"] = {
					["y"] = 0,
					["x"] = -3,
				},
				["shadow"] = {
					["y"] = -1,
					["x"] = 1,
				},
				["castname"] = {
					["y"] = 0,
					["x"] = 3,
				},
				["casticon"] = {
					["y"] = 0,
					["x"] = -3,
				},
				["latency"] = {
					["y"] = 1,
					["x"] = -1,
				},
			},
			["cboptver"] = 4.62,
			["colText"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["height"] = 20,
			["fontsize_lat"] = 0,
			["colBorder"] = {
				0, -- [1]
				0, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["scaleicon"] = 1,
			["colInterrupted"] = {
				0.3019607843137255, -- [1]
				0.3019607843137255, -- [2]
				0.3019607843137255, -- [3]
				1, -- [4]
			},
			["strata"] = "MEDIUM",
			["bEn"] = true,
			["anchorframe"] = "",
			["colTextTime"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["bColSuc"] = false,
			["border"] = 1,
			["bShowPlayerLatency"] = false,
			["bShowCBS"] = false,
			["strGap"] = 15,
			["bartype"] = "cb",
			["iconside"] = "LEFT",
			["forcefreealign"] = false,
			["bExtChannels"] = true,
			["strTimeFormat"] = "r<1>",
			["alignlat"] = "ADAPT",
			["bUnlocked"] = false,
			["bShowWNC"] = false,
			["fontoutline"] = "OUTLINE",
			["relationsel"] = 1,
			["ingroupsel"] = 1,
			["anchor_x"] = 0,
			["bResizeLongName"] = false,
			["width"] = 335,
			["latbarfixed"] = 0.03,
			["latbarsize"] = 0.15,
			["alignment"] = "NAMETIME",
			["bFillup"] = false,
			["bIconUnlocked"] = false,
			["colLagBar"] = {
				0.9, -- [1]
				0.85, -- [2]
				0.7, -- [3]
				0.65, -- [4]
			},
			["bnwlist"] = {
			},
			["scale"] = 1,
		},
		["Target"] = {
			["fSparkHeightMulti"] = 1,
			["strGap"] = 15,
			["bShowShield"] = false,
			["bMergeTrade"] = true,
			["fadeout"] = 0.5,
			["colBarBg"] = {
				0.05882352941176471, -- [1]
				0.05882352941176471, -- [2]
				0.05882352941176471, -- [3]
				0.75, -- [4]
			},
			["colSuccess"] = {
				0.15, -- [1]
				0.25, -- [2]
				0.1, -- [3]
				0.7, -- [4]
			},
			["incombatsel"] = 1,
			["alignname"] = "LEFT",
			["bordertexture"] = "None",
			["bnwtypesel"] = 1,
			["colBarNI"] = {
				1, -- [1]
				0, -- [2]
				0.00784313725490196, -- [3]
				1, -- [4]
			},
			["font"] = "Expressway",
			["colFailed"] = {
				0.7, -- [1]
				0.3, -- [2]
				0.2, -- [3]
				0.75, -- [4]
			},
			["colTextLag"] = {
				1, -- [1]
				0, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["anchortype"] = 1,
			["bShowTicks"] = true,
			["rotatectext"] = 0,
			["strNameFormat"] = "namecol<1,0,0>txm< (>misctxm<)>col<pre>txts< (>tscurtxts</>tstottxts<)>",
			["scale"] = 1,
			["anchor_y"] = 0,
			["rotatelattext"] = 0,
			["unit"] = "target",
			["scaleicon"] = 1,
			["fontsize"] = 0,
			["bordericon"] = 1,
			["instancetype"] = 1,
			["bnwlistnew"] = "",
			["anchorto"] = 5,
			["bartexture"] = "Minimalist",
			["fontsize_timer"] = 0,
			["colBorderNI"] = {
				0, -- [1]
				0, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["alpha"] = 1,
			["fSparkWidthMulti"] = 0.8,
			["bShowAsMinutes"] = true,
			["colBar"] = {
				0.02352941176470588, -- [1]
				1, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["latbarsize"] = 0.15,
			["bShowLat"] = false,
			["anchor"] = {
				["px"] = 0.6366215387980143,
				["py"] = 0.2858504159263798,
			},
			["bEnShadowCol"] = true,
			["colLagBar"] = {
				0.9, -- [1]
				0.85, -- [2]
				0.7, -- [3]
				0.65, -- [4]
			},
			["orient"] = 1,
			["spectab"] = {
				true, -- [1]
				true, -- [2]
				true, -- [3]
				true, -- [4]
			},
			["bEnShadowOffset"] = false,
			["colSpark"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["anchorfrom"] = 5,
			["coord"] = {
				["casticon"] = {
					["y"] = 0,
					["x"] = -3,
				},
				["shadow"] = {
					["y"] = -1,
					["x"] = 1,
				},
				["latency"] = {
					["y"] = 1,
					["x"] = -1,
				},
				["casttime"] = {
					["y"] = 0,
					["x"] = -3,
				},
				["castname"] = {
					["y"] = 0,
					["x"] = 3,
				},
			},
			["cboptver"] = 4.62,
			["bIconUnlocked"] = false,
			["height"] = 18,
			["fontsize_lat"] = 0,
			["colBorder"] = {
				0, -- [1]
				0, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["aligntime"] = "RIGHT",
			["colShadow"] = {
				0, -- [1]
				0, -- [2]
				0, -- [3]
				0.7, -- [4]
			},
			["strata"] = "MEDIUM",
			["bEn"] = true,
			["bColSuc"] = false,
			["colTextTime"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["bInvDir"] = false,
			["border"] = 1,
			["bShowPlayerLatency"] = false,
			["rotateicon"] = 0,
			["rotatertext"] = 0,
			["bartype"] = "cb",
			["iconside"] = "LEFT",
			["width"] = 169,
			["bExtChannels"] = true,
			["bResizeLongName"] = false,
			["alignlat"] = "ADAPT",
			["ingroupsel"] = 1,
			["bUnlocked"] = false,
			["relationsel"] = 1,
			["fontoutline"] = "OUTLINE",
			["bShowWNC"] = false,
			["anchor_x"] = 0,
			["strTimeFormat"] = "r<1>",
			["forcefreealign"] = false,
			["latbarfixed"] = 0.03,
			["bShowCBS"] = false,
			["alignment"] = "NAMETIME",
			["bFillup"] = false,
			["anchorframe"] = "",
			["colInterrupted"] = {
				0.3019607843137255, -- [1]
				0.3019607843137255, -- [2]
				0.3019607843137255, -- [3]
				1, -- [4]
			},
			["bnwlist"] = {
			},
			["colText"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
		},
		["Focus"] = {
			["fSparkHeightMulti"] = 1,
			["rotatertext"] = 0,
			["bShowShield"] = false,
			["bMergeTrade"] = true,
			["fadeout"] = 0.5,
			["colBarBg"] = {
				0.05882352941176471, -- [1]
				0.05882352941176471, -- [2]
				0.05882352941176471, -- [3]
				0.75, -- [4]
			},
			["colSuccess"] = {
				0.15, -- [1]
				0.25, -- [2]
				0.1, -- [3]
				0.7, -- [4]
			},
			["incombatsel"] = 1,
			["alignname"] = "LEFT",
			["bordertexture"] = "None",
			["bnwtypesel"] = 1,
			["colBarNI"] = {
				1, -- [1]
				0, -- [2]
				0.00784313725490196, -- [3]
				1, -- [4]
			},
			["font"] = "Expressway",
			["colFailed"] = {
				0.7, -- [1]
				0.3, -- [2]
				0.2, -- [3]
				0.75, -- [4]
			},
			["colTextLag"] = {
				1, -- [1]
				0, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["anchortype"] = 1,
			["bShowTicks"] = true,
			["rotatectext"] = 0,
			["strNameFormat"] = "namecol<1,0,0>txm< (>misctxm<)>col<pre>txts< (>tscurtxts</>tstottxts<)>",
			["scale"] = 1,
			["anchor_y"] = 0,
			["rotatelattext"] = 0,
			["unit"] = "focus",
			["aligntime"] = "RIGHT",
			["fontsize"] = 0,
			["bordericon"] = 1,
			["instancetype"] = 1,
			["bnwlistnew"] = "",
			["anchorto"] = 5,
			["bartexture"] = "Minimalist",
			["fontsize_timer"] = 0,
			["colBorderNI"] = {
				0, -- [1]
				0, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["colText"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["fSparkWidthMulti"] = 0.8,
			["bShowAsMinutes"] = true,
			["colBar"] = {
				0.02352941176470588, -- [1]
				1, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["latbarsize"] = 0.15,
			["bShowLat"] = false,
			["anchor"] = {
				["px"] = 0.6366217931111654,
				["py"] = 0.424739518312753,
			},
			["bEnShadowCol"] = true,
			["bInvDir"] = false,
			["anchorframe"] = "",
			["spectab"] = {
				true, -- [1]
				true, -- [2]
				true, -- [3]
				true, -- [4]
			},
			["bEnShadowOffset"] = false,
			["colSpark"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["anchorfrom"] = 5,
			["coord"] = {
				["casttime"] = {
					["y"] = 0,
					["x"] = -3,
				},
				["shadow"] = {
					["y"] = -1,
					["x"] = 1,
				},
				["castname"] = {
					["y"] = 0,
					["x"] = 3,
				},
				["casticon"] = {
					["y"] = 0,
					["x"] = -3,
				},
				["latency"] = {
					["y"] = 1,
					["x"] = -1,
				},
			},
			["cboptver"] = 4.62,
			["alpha"] = 1,
			["height"] = 18,
			["fontsize_lat"] = 0,
			["colBorder"] = {
				0, -- [1]
				0, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["colInterrupted"] = {
				0.3019607843137255, -- [1]
				0.3019607843137255, -- [2]
				0.3019607843137255, -- [3]
				1, -- [4]
			},
			["scaleicon"] = 1,
			["strata"] = "MEDIUM",
			["bEn"] = true,
			["orient"] = 1,
			["colTextTime"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["colLagBar"] = {
				0.9, -- [1]
				0.85, -- [2]
				0.7, -- [3]
				0.65, -- [4]
			},
			["border"] = 1,
			["bShowPlayerLatency"] = false,
			["bShowCBS"] = false,
			["strGap"] = 15,
			["bartype"] = "cb",
			["iconside"] = "LEFT",
			["forcefreealign"] = false,
			["bExtChannels"] = true,
			["strTimeFormat"] = "r<1>",
			["alignlat"] = "ADAPT",
			["bShowWNC"] = false,
			["bUnlocked"] = false,
			["fontoutline"] = "OUTLINE",
			["relationsel"] = 1,
			["ingroupsel"] = 1,
			["anchor_x"] = 0,
			["bResizeLongName"] = false,
			["width"] = 169,
			["latbarfixed"] = 0.03,
			["rotateicon"] = 0,
			["alignment"] = "NAMETIME",
			["bFillup"] = false,
			["bColSuc"] = false,
			["colShadow"] = {
				0, -- [1]
				0, -- [2]
				0, -- [3]
				0.7, -- [4]
			},
			["bnwlist"] = {
			},
			["bIconUnlocked"] = false,
		},
		["Arena 1"] = {
			["fSparkHeightMulti"] = 1,
			["rotatertext"] = 0,
			["bShowShield"] = false,
			["bMergeTrade"] = true,
			["fadeout"] = 0.5,
			["colBarBg"] = {
				0.05882352941176471, -- [1]
				0.05882352941176471, -- [2]
				0.05882352941176471, -- [3]
				0.75, -- [4]
			},
			["colSuccess"] = {
				0.15, -- [1]
				0.25, -- [2]
				0.1, -- [3]
				0.7, -- [4]
			},
			["incombatsel"] = 1,
			["alignname"] = "LEFT",
			["bordertexture"] = "None",
			["bnwtypesel"] = 1,
			["colBarNI"] = {
				1, -- [1]
				0, -- [2]
				0.00784313725490196, -- [3]
				1, -- [4]
			},
			["font"] = "Expressway",
			["colFailed"] = {
				0.7, -- [1]
				0.3, -- [2]
				0.2, -- [3]
				0.75, -- [4]
			},
			["colTextLag"] = {
				1, -- [1]
				0, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["anchortype"] = 1,
			["bShowTicks"] = true,
			["rotatectext"] = 0,
			["strNameFormat"] = "namecol<1,0,0>txm< (>misctxm<)>col<pre>txts< (>tscurtxts</>tstottxts<)>",
			["scale"] = 1,
			["anchor_y"] = 0,
			["rotatelattext"] = 0,
			["unit"] = "arena1",
			["aligntime"] = "RIGHT",
			["fontsize"] = 0,
			["bordericon"] = 1,
			["instancetype"] = 1,
			["bnwlistnew"] = "",
			["anchorto"] = 5,
			["bartexture"] = "Minimalist",
			["fontsize_timer"] = 0,
			["colBorderNI"] = {
				0, -- [1]
				0, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["colText"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["fSparkWidthMulti"] = 0.8,
			["bShowAsMinutes"] = true,
			["colBar"] = {
				0.02352941176470588, -- [1]
				1, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["latbarsize"] = 0.15,
			["bShowLat"] = false,
			["anchor"] = {
				["px"] = 0.8126628875732422,
				["py"] = 0.7312211474633278,
			},
			["bEnShadowCol"] = true,
			["bInvDir"] = false,
			["anchorframe"] = "",
			["spectab"] = {
				true, -- [1]
				true, -- [2]
				true, -- [3]
				true, -- [4]
			},
			["bEnShadowOffset"] = false,
			["colSpark"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["anchorfrom"] = 5,
			["coord"] = {
				["casttime"] = {
					["y"] = 0,
					["x"] = -3,
				},
				["shadow"] = {
					["y"] = -1,
					["x"] = 1,
				},
				["castname"] = {
					["y"] = 0,
					["x"] = 3,
				},
				["casticon"] = {
					["y"] = 0,
					["x"] = -3,
				},
				["latency"] = {
					["y"] = 1,
					["x"] = -1,
				},
			},
			["cboptver"] = 4.62,
			["alpha"] = 1,
			["height"] = 16,
			["fontsize_lat"] = 0,
			["colBorder"] = {
				0, -- [1]
				0, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["colInterrupted"] = {
				0.3019607843137255, -- [1]
				0.3019607843137255, -- [2]
				0.3019607843137255, -- [3]
				1, -- [4]
			},
			["scaleicon"] = 1,
			["strata"] = "MEDIUM",
			["bEn"] = true,
			["orient"] = 1,
			["colTextTime"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["colLagBar"] = {
				0.9, -- [1]
				0.85, -- [2]
				0.7, -- [3]
				0.65, -- [4]
			},
			["border"] = 1,
			["bShowPlayerLatency"] = false,
			["bShowCBS"] = false,
			["strGap"] = 15,
			["bartype"] = "cb",
			["iconside"] = "LEFT",
			["forcefreealign"] = false,
			["bExtChannels"] = true,
			["strTimeFormat"] = "r<1>",
			["alignlat"] = "ADAPT",
			["bShowWNC"] = false,
			["bUnlocked"] = false,
			["fontoutline"] = "OUTLINE",
			["relationsel"] = 1,
			["ingroupsel"] = 1,
			["anchor_x"] = 0,
			["bResizeLongName"] = false,
			["width"] = 175,
			["latbarfixed"] = 0.03,
			["rotateicon"] = 0,
			["alignment"] = "NAMETIME",
			["bFillup"] = false,
			["bColSuc"] = false,
			["colShadow"] = {
				0, -- [1]
				0, -- [2]
				0, -- [3]
				0.7, -- [4]
			},
			["bnwlist"] = {
			},
			["bIconUnlocked"] = false,
		},
		["Arena 2"] = {
			["fSparkHeightMulti"] = 1,
			["rotatertext"] = 0,
			["bShowShield"] = false,
			["bMergeTrade"] = true,
			["fadeout"] = 0.5,
			["colBarBg"] = {
				0.05882352941176471, -- [1]
				0.05882352941176471, -- [2]
				0.05882352941176471, -- [3]
				0.75, -- [4]
			},
			["colSuccess"] = {
				0.15, -- [1]
				0.25, -- [2]
				0.1, -- [3]
				0.7, -- [4]
			},
			["incombatsel"] = 1,
			["alignname"] = "LEFT",
			["bordertexture"] = "None",
			["bnwtypesel"] = 1,
			["colBarNI"] = {
				1, -- [1]
				0, -- [2]
				0.00784313725490196, -- [3]
				1, -- [4]
			},
			["font"] = "Expressway",
			["colFailed"] = {
				0.7, -- [1]
				0.3, -- [2]
				0.2, -- [3]
				0.75, -- [4]
			},
			["colTextLag"] = {
				1, -- [1]
				0, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["anchortype"] = 1,
			["bShowTicks"] = true,
			["rotatectext"] = 0,
			["strNameFormat"] = "namecol<1,0,0>txm< (>misctxm<)>col<pre>txts< (>tscurtxts</>tstottxts<)>",
			["scale"] = 1,
			["anchor_y"] = 0,
			["rotatelattext"] = 0,
			["unit"] = "arena2",
			["aligntime"] = "RIGHT",
			["fontsize"] = 0,
			["bordericon"] = 1,
			["instancetype"] = 1,
			["bnwlistnew"] = "",
			["anchorto"] = 5,
			["bartexture"] = "Minimalist",
			["fontsize_timer"] = 0,
			["colBorderNI"] = {
				0, -- [1]
				0, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["colText"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["fSparkWidthMulti"] = 0.8,
			["bShowAsMinutes"] = true,
			["colBar"] = {
				0.02352941176470588, -- [1]
				1, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["latbarsize"] = 0.15,
			["bShowLat"] = false,
			["anchor"] = {
				["px"] = 0.8126627604166666,
				["py"] = 0.6710360685036065,
			},
			["bEnShadowCol"] = true,
			["bInvDir"] = false,
			["anchorframe"] = "",
			["spectab"] = {
				true, -- [1]
				true, -- [2]
				true, -- [3]
				true, -- [4]
			},
			["bEnShadowOffset"] = false,
			["colSpark"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["anchorfrom"] = 5,
			["coord"] = {
				["casttime"] = {
					["y"] = 0,
					["x"] = -3,
				},
				["shadow"] = {
					["y"] = -1,
					["x"] = 1,
				},
				["castname"] = {
					["y"] = 0,
					["x"] = 3,
				},
				["casticon"] = {
					["y"] = 0,
					["x"] = -3,
				},
				["latency"] = {
					["y"] = 1,
					["x"] = -1,
				},
			},
			["cboptver"] = 4.62,
			["alpha"] = 1,
			["height"] = 16,
			["fontsize_lat"] = 0,
			["colBorder"] = {
				0, -- [1]
				0, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["colInterrupted"] = {
				0.3019607843137255, -- [1]
				0.3019607843137255, -- [2]
				0.3019607843137255, -- [3]
				1, -- [4]
			},
			["scaleicon"] = 1,
			["strata"] = "MEDIUM",
			["bEn"] = true,
			["orient"] = 1,
			["colTextTime"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["colLagBar"] = {
				0.9, -- [1]
				0.85, -- [2]
				0.7, -- [3]
				0.65, -- [4]
			},
			["border"] = 1,
			["bShowPlayerLatency"] = false,
			["bShowCBS"] = false,
			["strGap"] = 15,
			["bartype"] = "cb",
			["iconside"] = "LEFT",
			["forcefreealign"] = false,
			["bExtChannels"] = true,
			["strTimeFormat"] = "r<1>",
			["alignlat"] = "ADAPT",
			["bShowWNC"] = false,
			["bUnlocked"] = false,
			["fontoutline"] = "OUTLINE",
			["relationsel"] = 1,
			["ingroupsel"] = 1,
			["anchor_x"] = 0,
			["bResizeLongName"] = false,
			["width"] = 175,
			["latbarfixed"] = 0.03,
			["rotateicon"] = 0,
			["alignment"] = "NAMETIME",
			["bFillup"] = false,
			["bColSuc"] = false,
			["colShadow"] = {
				0, -- [1]
				0, -- [2]
				0, -- [3]
				0.7, -- [4]
			},
			["bnwlist"] = {
			},
			["bIconUnlocked"] = false,
		},
		["Arena 3"] = {
			["fSparkHeightMulti"] = 1,
			["rotatertext"] = 0,
			["bShowShield"] = false,
			["bMergeTrade"] = true,
			["fadeout"] = 0.5,
			["colBarBg"] = {
				0.05882352941176471, -- [1]
				0.05882352941176471, -- [2]
				0.05882352941176471, -- [3]
				0.75, -- [4]
			},
			["colSuccess"] = {
				0.15, -- [1]
				0.25, -- [2]
				0.1, -- [3]
				0.7, -- [4]
			},
			["incombatsel"] = 1,
			["alignname"] = "LEFT",
			["bordertexture"] = "None",
			["bnwtypesel"] = 1,
			["colBarNI"] = {
				1, -- [1]
				0, -- [2]
				0.00784313725490196, -- [3]
				1, -- [4]
			},
			["font"] = "Expressway",
			["colFailed"] = {
				0.7, -- [1]
				0.3, -- [2]
				0.2, -- [3]
				0.75, -- [4]
			},
			["colTextLag"] = {
				1, -- [1]
				0, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["anchortype"] = 1,
			["bShowTicks"] = true,
			["rotatectext"] = 0,
			["strNameFormat"] = "namecol<1,0,0>txm< (>misctxm<)>col<pre>txts< (>tscurtxts</>tstottxts<)>",
			["scale"] = 1,
			["anchor_y"] = 0,
			["rotatelattext"] = 0,
			["unit"] = "arena3",
			["aligntime"] = "RIGHT",
			["fontsize"] = 0,
			["bordericon"] = 1,
			["instancetype"] = 1,
			["bnwlistnew"] = "",
			["anchorto"] = 5,
			["bartexture"] = "Minimalist",
			["fontsize_timer"] = 0,
			["colBorderNI"] = {
				0, -- [1]
				0, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["colText"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["fSparkWidthMulti"] = 0.8,
			["bShowAsMinutes"] = true,
			["colBar"] = {
				0.02352941176470588, -- [1]
				1, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["latbarsize"] = 0.15,
			["bShowLat"] = false,
			["anchor"] = {
				["px"] = 0.81266295115153,
				["py"] = 0.6108509330298454,
			},
			["bEnShadowCol"] = true,
			["bInvDir"] = false,
			["anchorframe"] = "",
			["spectab"] = {
				true, -- [1]
				true, -- [2]
				true, -- [3]
				true, -- [4]
			},
			["bEnShadowOffset"] = false,
			["colSpark"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["anchorfrom"] = 5,
			["coord"] = {
				["casttime"] = {
					["y"] = 0,
					["x"] = -3,
				},
				["shadow"] = {
					["y"] = -1,
					["x"] = 1,
				},
				["castname"] = {
					["y"] = 0,
					["x"] = 3,
				},
				["casticon"] = {
					["y"] = 0,
					["x"] = -3,
				},
				["latency"] = {
					["y"] = 1,
					["x"] = -1,
				},
			},
			["cboptver"] = 4.62,
			["alpha"] = 1,
			["height"] = 16,
			["fontsize_lat"] = 0,
			["colBorder"] = {
				0, -- [1]
				0, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["colInterrupted"] = {
				0.3019607843137255, -- [1]
				0.3019607843137255, -- [2]
				0.3019607843137255, -- [3]
				1, -- [4]
			},
			["scaleicon"] = 1,
			["strata"] = "MEDIUM",
			["bEn"] = true,
			["orient"] = 1,
			["colTextTime"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["colLagBar"] = {
				0.9, -- [1]
				0.85, -- [2]
				0.7, -- [3]
				0.65, -- [4]
			},
			["border"] = 1,
			["bShowPlayerLatency"] = false,
			["bShowCBS"] = false,
			["strGap"] = 15,
			["bartype"] = "cb",
			["iconside"] = "LEFT",
			["forcefreealign"] = false,
			["bExtChannels"] = true,
			["strTimeFormat"] = "r<1>",
			["alignlat"] = "ADAPT",
			["bShowWNC"] = false,
			["bUnlocked"] = false,
			["fontoutline"] = "OUTLINE",
			["relationsel"] = 1,
			["ingroupsel"] = 1,
			["anchor_x"] = 0,
			["bResizeLongName"] = false,
			["width"] = 175,
			["latbarfixed"] = 0.03,
			["rotateicon"] = 0,
			["alignment"] = "NAMETIME",
			["bFillup"] = false,
			["bColSuc"] = false,
			["colShadow"] = {
				0, -- [1]
				0, -- [2]
				0, -- [3]
				0.7, -- [4]
			},
			["bnwlist"] = {
			},
			["bIconUnlocked"] = false,
		},
		["Arena 4"] = {
			["fSparkHeightMulti"] = 1,
			["rotatertext"] = 0,
			["bShowShield"] = false,
			["bMergeTrade"] = true,
			["fadeout"] = 0.5,
			["colBarBg"] = {
				0.05882352941176471, -- [1]
				0.05882352941176471, -- [2]
				0.05882352941176471, -- [3]
				0.75, -- [4]
			},
			["colSuccess"] = {
				0.15, -- [1]
				0.25, -- [2]
				0.1, -- [3]
				0.7, -- [4]
			},
			["incombatsel"] = 1,
			["alignname"] = "LEFT",
			["bordertexture"] = "None",
			["bnwtypesel"] = 1,
			["colBarNI"] = {
				1, -- [1]
				0, -- [2]
				0.00784313725490196, -- [3]
				1, -- [4]
			},
			["font"] = "Expressway",
			["colFailed"] = {
				0.7, -- [1]
				0.3, -- [2]
				0.2, -- [3]
				0.75, -- [4]
			},
			["colTextLag"] = {
				1, -- [1]
				0, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["anchortype"] = 1,
			["bShowTicks"] = true,
			["rotatectext"] = 0,
			["strNameFormat"] = "namecol<1,0,0>txm< (>misctxm<)>col<pre>txts< (>tscurtxts</>tstottxts<)>",
			["scale"] = 1,
			["anchor_y"] = 0,
			["rotatelattext"] = 0,
			["unit"] = "arena4",
			["aligntime"] = "RIGHT",
			["fontsize"] = 0,
			["bordericon"] = 1,
			["instancetype"] = 1,
			["bnwlistnew"] = "",
			["anchorto"] = 5,
			["bartexture"] = "Minimalist",
			["fontsize_timer"] = 0,
			["colBorderNI"] = {
				0, -- [1]
				0, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["colText"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["fSparkWidthMulti"] = 0.8,
			["bShowAsMinutes"] = true,
			["colBar"] = {
				0.02352941176470588, -- [1]
				1, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["latbarsize"] = 0.15,
			["bShowLat"] = false,
			["anchor"] = {
				["px"] = 0.8126626968383789,
				["py"] = 0.5506654019578046,
			},
			["bEnShadowCol"] = true,
			["bInvDir"] = false,
			["anchorframe"] = "",
			["spectab"] = {
				true, -- [1]
				true, -- [2]
				true, -- [3]
				true, -- [4]
			},
			["bEnShadowOffset"] = false,
			["colSpark"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["anchorfrom"] = 5,
			["coord"] = {
				["casttime"] = {
					["y"] = 0,
					["x"] = -3,
				},
				["shadow"] = {
					["y"] = -1,
					["x"] = 1,
				},
				["castname"] = {
					["y"] = 0,
					["x"] = 3,
				},
				["casticon"] = {
					["y"] = 0,
					["x"] = -3,
				},
				["latency"] = {
					["y"] = 1,
					["x"] = -1,
				},
			},
			["cboptver"] = 4.62,
			["alpha"] = 1,
			["height"] = 16,
			["fontsize_lat"] = 0,
			["colBorder"] = {
				0, -- [1]
				0, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["colInterrupted"] = {
				0.3019607843137255, -- [1]
				0.3019607843137255, -- [2]
				0.3019607843137255, -- [3]
				1, -- [4]
			},
			["scaleicon"] = 1,
			["strata"] = "MEDIUM",
			["bEn"] = true,
			["orient"] = 1,
			["colTextTime"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["colLagBar"] = {
				0.9, -- [1]
				0.85, -- [2]
				0.7, -- [3]
				0.65, -- [4]
			},
			["border"] = 1,
			["bShowPlayerLatency"] = false,
			["bShowCBS"] = false,
			["strGap"] = 15,
			["bartype"] = "cb",
			["iconside"] = "LEFT",
			["forcefreealign"] = false,
			["bExtChannels"] = true,
			["strTimeFormat"] = "r<1>",
			["alignlat"] = "ADAPT",
			["bShowWNC"] = false,
			["bUnlocked"] = false,
			["fontoutline"] = "OUTLINE",
			["relationsel"] = 1,
			["ingroupsel"] = 1,
			["anchor_x"] = 0,
			["bResizeLongName"] = false,
			["width"] = 175,
			["latbarfixed"] = 0.03,
			["rotateicon"] = 0,
			["alignment"] = "NAMETIME",
			["bFillup"] = false,
			["bColSuc"] = false,
			["colShadow"] = {
				0, -- [1]
				0, -- [2]
				0, -- [3]
				0.7, -- [4]
			},
			["bnwlist"] = {
			},
			["bIconUnlocked"] = false,
		},
		["Arena 5"] = {
			["fSparkHeightMulti"] = 1,
			["rotatertext"] = 0,
			["bShowShield"] = false,
			["bMergeTrade"] = true,
			["fadeout"] = 0.5,
			["colBarBg"] = {
				0.05882352941176471, -- [1]
				0.05882352941176471, -- [2]
				0.05882352941176471, -- [3]
				0.75, -- [4]
			},
			["colSuccess"] = {
				0.15, -- [1]
				0.25, -- [2]
				0.1, -- [3]
				0.7, -- [4]
			},
			["incombatsel"] = 1,
			["alignname"] = "LEFT",
			["bordertexture"] = "None",
			["bnwtypesel"] = 1,
			["colBarNI"] = {
				1, -- [1]
				0, -- [2]
				0.00784313725490196, -- [3]
				1, -- [4]
			},
			["font"] = "Expressway",
			["colFailed"] = {
				0.7, -- [1]
				0.3, -- [2]
				0.2, -- [3]
				0.75, -- [4]
			},
			["colTextLag"] = {
				1, -- [1]
				0, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["anchortype"] = 1,
			["bShowTicks"] = true,
			["rotatectext"] = 0,
			["strNameFormat"] = "namecol<1,0,0>txm< (>misctxm<)>col<pre>txts< (>tscurtxts</>tstottxts<)>",
			["scale"] = 1,
			["anchor_y"] = 0,
			["rotatelattext"] = 0,
			["unit"] = "arena5",
			["aligntime"] = "RIGHT",
			["fontsize"] = 0,
			["bordericon"] = 1,
			["instancetype"] = 1,
			["bnwlistnew"] = "",
			["anchorto"] = 5,
			["bartexture"] = "Minimalist",
			["fontsize_timer"] = 0,
			["colBorderNI"] = {
				0, -- [1]
				0, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["colText"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["fSparkWidthMulti"] = 0.8,
			["bShowAsMinutes"] = true,
			["colBar"] = {
				0.02352941176470588, -- [1]
				1, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["latbarsize"] = 0.15,
			["bShowLat"] = false,
			["anchor"] = {
				["px"] = 0.8126628239949544,
				["py"] = 0.4904803795121233,
			},
			["bEnShadowCol"] = true,
			["bInvDir"] = false,
			["anchorframe"] = "",
			["spectab"] = {
				true, -- [1]
				true, -- [2]
				true, -- [3]
				true, -- [4]
			},
			["bEnShadowOffset"] = false,
			["colSpark"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["anchorfrom"] = 5,
			["coord"] = {
				["casttime"] = {
					["y"] = 0,
					["x"] = -3,
				},
				["shadow"] = {
					["y"] = -1,
					["x"] = 1,
				},
				["castname"] = {
					["y"] = 0,
					["x"] = 3,
				},
				["casticon"] = {
					["y"] = 0,
					["x"] = -3,
				},
				["latency"] = {
					["y"] = 1,
					["x"] = -1,
				},
			},
			["cboptver"] = 4.62,
			["alpha"] = 1,
			["height"] = 16,
			["fontsize_lat"] = 0,
			["colBorder"] = {
				0, -- [1]
				0, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["colInterrupted"] = {
				0.3019607843137255, -- [1]
				0.3019607843137255, -- [2]
				0.3019607843137255, -- [3]
				1, -- [4]
			},
			["scaleicon"] = 1,
			["strata"] = "MEDIUM",
			["bEn"] = true,
			["orient"] = 1,
			["colTextTime"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["colLagBar"] = {
				0.9, -- [1]
				0.85, -- [2]
				0.7, -- [3]
				0.65, -- [4]
			},
			["border"] = 1,
			["bShowPlayerLatency"] = false,
			["bShowCBS"] = false,
			["strGap"] = 15,
			["bartype"] = "cb",
			["iconside"] = "LEFT",
			["forcefreealign"] = false,
			["bExtChannels"] = true,
			["strTimeFormat"] = "r<1>",
			["alignlat"] = "ADAPT",
			["bShowWNC"] = false,
			["bUnlocked"] = false,
			["fontoutline"] = "OUTLINE",
			["relationsel"] = 1,
			["ingroupsel"] = 1,
			["anchor_x"] = 0,
			["bResizeLongName"] = false,
			["width"] = 175,
			["latbarfixed"] = 0.03,
			["rotateicon"] = 0,
			["alignment"] = "NAMETIME",
			["bFillup"] = false,
			["bColSuc"] = false,
			["colShadow"] = {
				0, -- [1]
				0, -- [2]
				0, -- [3]
				0.7, -- [4]
			},
			["bnwlist"] = {
			},
			["bIconUnlocked"] = false,
		},
		["Boss 1"] = {
			["fSparkHeightMulti"] = 1,
			["strGap"] = 15,
			["bShowShield"] = false,
			["bMergeTrade"] = true,
			["fadeout"] = 0.5,
			["colBarBg"] = {
				0.05882352941176471, -- [1]
				0.05882352941176471, -- [2]
				0.05882352941176471, -- [3]
				0.75, -- [4]
			},
			["colSuccess"] = {
				0.15, -- [1]
				0.25, -- [2]
				0.1, -- [3]
				0.7, -- [4]
			},
			["incombatsel"] = 1,
			["alignname"] = "LEFT",
			["bordertexture"] = "None",
			["bnwtypesel"] = 1,
			["colBarNI"] = {
				1, -- [1]
				0, -- [2]
				0.00784313725490196, -- [3]
				1, -- [4]
			},
			["font"] = "Expressway",
			["colFailed"] = {
				0.7, -- [1]
				0.3, -- [2]
				0.2, -- [3]
				0.75, -- [4]
			},
			["colTextLag"] = {
				1, -- [1]
				0, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["anchortype"] = 1,
			["bShowTicks"] = true,
			["rotatectext"] = 0,
			["strNameFormat"] = "namecol<1,0,0>txm< (>misctxm<)>col<pre>txts< (>tscurtxts</>tstottxts<)>",
			["scale"] = 1,
			["anchor_y"] = 0,
			["rotatelattext"] = 0,
			["unit"] = "boss1",
			["scaleicon"] = 1,
			["fontsize"] = 0,
			["bordericon"] = 1,
			["instancetype"] = 1,
			["bnwlistnew"] = "",
			["anchorto"] = 5,
			["bartexture"] = "Minimalist",
			["fontsize_timer"] = 0,
			["colBorderNI"] = {
				0, -- [1]
				0, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["alpha"] = 1,
			["fSparkWidthMulti"] = 0.8,
			["bShowAsMinutes"] = true,
			["colBar"] = {
				0.02352941176470588, -- [1]
				1, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["latbarsize"] = 0.15,
			["bShowLat"] = false,
			["anchor"] = {
				["px"] = 0.8111002604166667,
				["py"] = 0.7312210909492878,
			},
			["bEnShadowCol"] = true,
			["colLagBar"] = {
				0.9, -- [1]
				0.85, -- [2]
				0.7, -- [3]
				0.65, -- [4]
			},
			["orient"] = 1,
			["spectab"] = {
				true, -- [1]
				true, -- [2]
				true, -- [3]
				true, -- [4]
			},
			["bEnShadowOffset"] = false,
			["colSpark"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["anchorfrom"] = 5,
			["coord"] = {
				["casticon"] = {
					["y"] = 0,
					["x"] = -3,
				},
				["shadow"] = {
					["y"] = -1,
					["x"] = 1,
				},
				["latency"] = {
					["y"] = 1,
					["x"] = -1,
				},
				["casttime"] = {
					["y"] = 0,
					["x"] = -3,
				},
				["castname"] = {
					["y"] = 0,
					["x"] = 3,
				},
			},
			["cboptver"] = 4.62,
			["bIconUnlocked"] = false,
			["height"] = 16,
			["fontsize_lat"] = 0,
			["colBorder"] = {
				0, -- [1]
				0, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["aligntime"] = "RIGHT",
			["colShadow"] = {
				0, -- [1]
				0, -- [2]
				0, -- [3]
				0.7, -- [4]
			},
			["strata"] = "MEDIUM",
			["bEn"] = true,
			["bColSuc"] = false,
			["colTextTime"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["bInvDir"] = false,
			["border"] = 1,
			["bShowPlayerLatency"] = false,
			["rotateicon"] = 0,
			["rotatertext"] = 0,
			["bartype"] = "cb",
			["iconside"] = "LEFT",
			["width"] = 181,
			["bExtChannels"] = true,
			["bResizeLongName"] = false,
			["alignlat"] = "ADAPT",
			["ingroupsel"] = 1,
			["bUnlocked"] = false,
			["relationsel"] = 1,
			["fontoutline"] = "OUTLINE",
			["bShowWNC"] = false,
			["anchor_x"] = 0,
			["strTimeFormat"] = "r<1>",
			["forcefreealign"] = false,
			["latbarfixed"] = 0.03,
			["bShowCBS"] = false,
			["alignment"] = "NAMETIME",
			["bFillup"] = false,
			["anchorframe"] = "",
			["colInterrupted"] = {
				0.3019607843137255, -- [1]
				0.3019607843137255, -- [2]
				0.3019607843137255, -- [3]
				1, -- [4]
			},
			["bnwlist"] = {
			},
			["colText"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
		},
		["Boss 2"] = {
			["fSparkHeightMulti"] = 1,
			["strGap"] = 15,
			["bShowShield"] = false,
			["bMergeTrade"] = true,
			["fadeout"] = 0.5,
			["colBarBg"] = {
				0.05882352941176471, -- [1]
				0.05882352941176471, -- [2]
				0.05882352941176471, -- [3]
				0.75, -- [4]
			},
			["colSuccess"] = {
				0.15, -- [1]
				0.25, -- [2]
				0.1, -- [3]
				0.7, -- [4]
			},
			["incombatsel"] = 1,
			["alignname"] = "LEFT",
			["bordertexture"] = "None",
			["bnwtypesel"] = 1,
			["colBarNI"] = {
				1, -- [1]
				0, -- [2]
				0.00784313725490196, -- [3]
				1, -- [4]
			},
			["font"] = "Expressway",
			["colFailed"] = {
				0.7, -- [1]
				0.3, -- [2]
				0.2, -- [3]
				0.75, -- [4]
			},
			["colTextLag"] = {
				1, -- [1]
				0, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["anchortype"] = 1,
			["bShowTicks"] = true,
			["rotatectext"] = 0,
			["strNameFormat"] = "namecol<1,0,0>txm< (>misctxm<)>col<pre>txts< (>tscurtxts</>tstottxts<)>",
			["scale"] = 1,
			["anchor_y"] = 0,
			["rotatelattext"] = 0,
			["unit"] = "boss2",
			["scaleicon"] = 1,
			["fontsize"] = 0,
			["bordericon"] = 1,
			["instancetype"] = 1,
			["bnwlistnew"] = "",
			["anchorto"] = 5,
			["bartexture"] = "Minimalist",
			["fontsize_timer"] = 0,
			["colBorderNI"] = {
				0, -- [1]
				0, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["alpha"] = 1,
			["fSparkWidthMulti"] = 0.8,
			["bShowAsMinutes"] = true,
			["colBar"] = {
				0.02352941176470588, -- [1]
				1, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["latbarsize"] = 0.15,
			["bShowLat"] = false,
			["anchor"] = {
				["px"] = 0.8111002604166667,
				["py"] = 0.6710360685036065,
			},
			["bEnShadowCol"] = true,
			["colLagBar"] = {
				0.9, -- [1]
				0.85, -- [2]
				0.7, -- [3]
				0.65, -- [4]
			},
			["orient"] = 1,
			["spectab"] = {
				true, -- [1]
				true, -- [2]
				true, -- [3]
				true, -- [4]
			},
			["bEnShadowOffset"] = false,
			["colSpark"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["anchorfrom"] = 5,
			["coord"] = {
				["casticon"] = {
					["y"] = 0,
					["x"] = -3,
				},
				["shadow"] = {
					["y"] = -1,
					["x"] = 1,
				},
				["latency"] = {
					["y"] = 1,
					["x"] = -1,
				},
				["casttime"] = {
					["y"] = 0,
					["x"] = -3,
				},
				["castname"] = {
					["y"] = 0,
					["x"] = 3,
				},
			},
			["cboptver"] = 4.62,
			["bIconUnlocked"] = false,
			["height"] = 16,
			["fontsize_lat"] = 0,
			["colBorder"] = {
				0, -- [1]
				0, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["aligntime"] = "RIGHT",
			["colShadow"] = {
				0, -- [1]
				0, -- [2]
				0, -- [3]
				0.7, -- [4]
			},
			["strata"] = "MEDIUM",
			["bEn"] = true,
			["bColSuc"] = false,
			["colTextTime"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["bInvDir"] = false,
			["border"] = 1,
			["bShowPlayerLatency"] = false,
			["rotateicon"] = 0,
			["rotatertext"] = 0,
			["bartype"] = "cb",
			["iconside"] = "LEFT",
			["width"] = 181,
			["bExtChannels"] = true,
			["bResizeLongName"] = false,
			["alignlat"] = "ADAPT",
			["ingroupsel"] = 1,
			["bUnlocked"] = false,
			["relationsel"] = 1,
			["fontoutline"] = "OUTLINE",
			["bShowWNC"] = false,
			["anchor_x"] = 0,
			["strTimeFormat"] = "r<1>",
			["forcefreealign"] = false,
			["latbarfixed"] = 0.03,
			["bShowCBS"] = false,
			["alignment"] = "NAMETIME",
			["bFillup"] = false,
			["anchorframe"] = "",
			["colInterrupted"] = {
				0.3019607843137255, -- [1]
				0.3019607843137255, -- [2]
				0.3019607843137255, -- [3]
				1, -- [4]
			},
			["bnwlist"] = {
			},
			["colText"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
		},
		["Boss 3"] = {
			["fSparkHeightMulti"] = 1,
			["strGap"] = 15,
			["bShowShield"] = false,
			["bMergeTrade"] = true,
			["fadeout"] = 0.5,
			["colBarBg"] = {
				0.05882352941176471, -- [1]
				0.05882352941176471, -- [2]
				0.05882352941176471, -- [3]
				0.75, -- [4]
			},
			["colSuccess"] = {
				0.15, -- [1]
				0.25, -- [2]
				0.1, -- [3]
				0.7, -- [4]
			},
			["incombatsel"] = 1,
			["alignname"] = "LEFT",
			["bordertexture"] = "None",
			["bnwtypesel"] = 1,
			["colBarNI"] = {
				1, -- [1]
				0, -- [2]
				0.00784313725490196, -- [3]
				1, -- [4]
			},
			["font"] = "Expressway",
			["colFailed"] = {
				0.7, -- [1]
				0.3, -- [2]
				0.2, -- [3]
				0.75, -- [4]
			},
			["colTextLag"] = {
				1, -- [1]
				0, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["anchortype"] = 1,
			["bShowTicks"] = true,
			["rotatectext"] = 0,
			["strNameFormat"] = "namecol<1,0,0>txm< (>misctxm<)>col<pre>txts< (>tscurtxts</>tstottxts<)>",
			["scale"] = 1,
			["anchor_y"] = 0,
			["rotatelattext"] = 0,
			["unit"] = "boss3",
			["scaleicon"] = 1,
			["fontsize"] = 0,
			["bordericon"] = 1,
			["instancetype"] = 1,
			["bnwlistnew"] = "",
			["anchorto"] = 5,
			["bartexture"] = "Minimalist",
			["fontsize_timer"] = 0,
			["colBorderNI"] = {
				0, -- [1]
				0, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["alpha"] = 1,
			["fSparkWidthMulti"] = 0.8,
			["bShowAsMinutes"] = true,
			["colBar"] = {
				0.02352941176470588, -- [1]
				1, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["latbarsize"] = 0.15,
			["bShowLat"] = false,
			["anchor"] = {
				["px"] = 0.8111003875732422,
				["py"] = 0.6108508200017655,
			},
			["bEnShadowCol"] = true,
			["colLagBar"] = {
				0.9, -- [1]
				0.85, -- [2]
				0.7, -- [3]
				0.65, -- [4]
			},
			["orient"] = 1,
			["spectab"] = {
				true, -- [1]
				true, -- [2]
				true, -- [3]
				true, -- [4]
			},
			["bEnShadowOffset"] = false,
			["colSpark"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["anchorfrom"] = 5,
			["coord"] = {
				["casticon"] = {
					["y"] = 0,
					["x"] = -3,
				},
				["shadow"] = {
					["y"] = -1,
					["x"] = 1,
				},
				["latency"] = {
					["y"] = 1,
					["x"] = -1,
				},
				["casttime"] = {
					["y"] = 0,
					["x"] = -3,
				},
				["castname"] = {
					["y"] = 0,
					["x"] = 3,
				},
			},
			["cboptver"] = 4.62,
			["bIconUnlocked"] = false,
			["height"] = 16,
			["fontsize_lat"] = 0,
			["colBorder"] = {
				0, -- [1]
				0, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["aligntime"] = "RIGHT",
			["colShadow"] = {
				0, -- [1]
				0, -- [2]
				0, -- [3]
				0.7, -- [4]
			},
			["strata"] = "MEDIUM",
			["bEn"] = true,
			["bColSuc"] = false,
			["colTextTime"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["bInvDir"] = false,
			["border"] = 1,
			["bShowPlayerLatency"] = false,
			["rotateicon"] = 0,
			["rotatertext"] = 0,
			["bartype"] = "cb",
			["iconside"] = "LEFT",
			["width"] = 181,
			["bExtChannels"] = true,
			["bResizeLongName"] = false,
			["alignlat"] = "ADAPT",
			["ingroupsel"] = 1,
			["bUnlocked"] = false,
			["relationsel"] = 1,
			["fontoutline"] = "OUTLINE",
			["bShowWNC"] = false,
			["anchor_x"] = 0,
			["strTimeFormat"] = "r<1>",
			["forcefreealign"] = false,
			["latbarfixed"] = 0.03,
			["bShowCBS"] = false,
			["alignment"] = "NAMETIME",
			["bFillup"] = false,
			["anchorframe"] = "",
			["colInterrupted"] = {
				0.3019607843137255, -- [1]
				0.3019607843137255, -- [2]
				0.3019607843137255, -- [3]
				1, -- [4]
			},
			["bnwlist"] = {
			},
			["colText"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
		},
		["Boss 4"] = {
			["fSparkHeightMulti"] = 1,
			["strGap"] = 15,
			["bShowShield"] = false,
			["bMergeTrade"] = true,
			["fadeout"] = 0.5,
			["colBarBg"] = {
				0.05882352941176471, -- [1]
				0.05882352941176471, -- [2]
				0.05882352941176471, -- [3]
				0.75, -- [4]
			},
			["colSuccess"] = {
				0.15, -- [1]
				0.25, -- [2]
				0.1, -- [3]
				0.7, -- [4]
			},
			["incombatsel"] = 1,
			["alignname"] = "LEFT",
			["bordertexture"] = "None",
			["bnwtypesel"] = 1,
			["colBarNI"] = {
				1, -- [1]
				0, -- [2]
				0.00784313725490196, -- [3]
				1, -- [4]
			},
			["font"] = "Expressway",
			["colFailed"] = {
				0.7, -- [1]
				0.3, -- [2]
				0.2, -- [3]
				0.75, -- [4]
			},
			["colTextLag"] = {
				1, -- [1]
				0, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["anchortype"] = 1,
			["bShowTicks"] = true,
			["rotatectext"] = 0,
			["strNameFormat"] = "namecol<1,0,0>txm< (>misctxm<)>col<pre>txts< (>tscurtxts</>tstottxts<)>",
			["scale"] = 1,
			["anchor_y"] = 0,
			["rotatelattext"] = 0,
			["unit"] = "boss4",
			["scaleicon"] = 1,
			["fontsize"] = 0,
			["bordericon"] = 1,
			["instancetype"] = 1,
			["bnwlistnew"] = "",
			["anchorto"] = 5,
			["bartexture"] = "Minimalist",
			["fontsize_timer"] = 0,
			["colBorderNI"] = {
				0, -- [1]
				0, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["alpha"] = 1,
			["fSparkWidthMulti"] = 0.8,
			["bShowAsMinutes"] = true,
			["colBar"] = {
				0.02352941176470588, -- [1]
				1, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["latbarsize"] = 0.15,
			["bShowLat"] = false,
			["anchor"] = {
				["px"] = 0.81110045115153,
				["py"] = 0.5506654584718446,
			},
			["bEnShadowCol"] = true,
			["colLagBar"] = {
				0.9, -- [1]
				0.85, -- [2]
				0.7, -- [3]
				0.65, -- [4]
			},
			["orient"] = 1,
			["spectab"] = {
				true, -- [1]
				true, -- [2]
				true, -- [3]
				true, -- [4]
			},
			["bEnShadowOffset"] = false,
			["colSpark"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["anchorfrom"] = 5,
			["coord"] = {
				["casticon"] = {
					["y"] = 0,
					["x"] = -3,
				},
				["shadow"] = {
					["y"] = -1,
					["x"] = 1,
				},
				["latency"] = {
					["y"] = 1,
					["x"] = -1,
				},
				["casttime"] = {
					["y"] = 0,
					["x"] = -3,
				},
				["castname"] = {
					["y"] = 0,
					["x"] = 3,
				},
			},
			["cboptver"] = 4.62,
			["bIconUnlocked"] = false,
			["height"] = 16,
			["fontsize_lat"] = 0,
			["colBorder"] = {
				0, -- [1]
				0, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["aligntime"] = "RIGHT",
			["colShadow"] = {
				0, -- [1]
				0, -- [2]
				0, -- [3]
				0.7, -- [4]
			},
			["strata"] = "MEDIUM",
			["bEn"] = true,
			["bColSuc"] = false,
			["colTextTime"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["bInvDir"] = false,
			["border"] = 1,
			["bShowPlayerLatency"] = false,
			["rotateicon"] = 0,
			["rotatertext"] = 0,
			["bartype"] = "cb",
			["iconside"] = "LEFT",
			["width"] = 181,
			["bExtChannels"] = true,
			["bResizeLongName"] = false,
			["alignlat"] = "ADAPT",
			["ingroupsel"] = 1,
			["bUnlocked"] = false,
			["relationsel"] = 1,
			["fontoutline"] = "OUTLINE",
			["bShowWNC"] = false,
			["anchor_x"] = 0,
			["strTimeFormat"] = "r<1>",
			["forcefreealign"] = false,
			["latbarfixed"] = 0.03,
			["bShowCBS"] = false,
			["alignment"] = "NAMETIME",
			["bFillup"] = false,
			["anchorframe"] = "",
			["colInterrupted"] = {
				0.3019607843137255, -- [1]
				0.3019607843137255, -- [2]
				0.3019607843137255, -- [3]
				1, -- [4]
			},
			["bnwlist"] = {
			},
			["colText"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
		},
		["Boss 5"] = {
			["fSparkHeightMulti"] = 1,
			["strGap"] = 15,
			["bShowShield"] = false,
			["bMergeTrade"] = true,
			["fadeout"] = 0.5,
			["colBarBg"] = {
				0.05882352941176471, -- [1]
				0.05882352941176471, -- [2]
				0.05882352941176471, -- [3]
				0.75, -- [4]
			},
			["colSuccess"] = {
				0.15, -- [1]
				0.25, -- [2]
				0.1, -- [3]
				0.7, -- [4]
			},
			["incombatsel"] = 1,
			["alignname"] = "LEFT",
			["bordertexture"] = "None",
			["bnwtypesel"] = 1,
			["colBarNI"] = {
				1, -- [1]
				0, -- [2]
				0.00784313725490196, -- [3]
				1, -- [4]
			},
			["font"] = "Expressway",
			["colFailed"] = {
				0.7, -- [1]
				0.3, -- [2]
				0.2, -- [3]
				0.75, -- [4]
			},
			["colTextLag"] = {
				1, -- [1]
				0, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["anchortype"] = 1,
			["bShowTicks"] = true,
			["rotatectext"] = 0,
			["strNameFormat"] = "namecol<1,0,0>txm< (>misctxm<)>col<pre>txts< (>tscurtxts</>tstottxts<)>",
			["scale"] = 1,
			["anchor_y"] = 0,
			["rotatelattext"] = 0,
			["unit"] = "boss5",
			["scaleicon"] = 1,
			["fontsize"] = 0,
			["bordericon"] = 1,
			["instancetype"] = 1,
			["bnwlistnew"] = "",
			["anchorto"] = 5,
			["bartexture"] = "Minimalist",
			["fontsize_timer"] = 0,
			["colBorderNI"] = {
				0, -- [1]
				0, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["alpha"] = 1,
			["fSparkWidthMulti"] = 0.8,
			["bShowAsMinutes"] = true,
			["colBar"] = {
				0.02352941176470588, -- [1]
				1, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["latbarsize"] = 0.15,
			["bShowLat"] = false,
			["anchor"] = {
				["px"] = 0.8111003875732422,
				["py"] = 0.4904800404278836,
			},
			["bEnShadowCol"] = true,
			["colLagBar"] = {
				0.9, -- [1]
				0.85, -- [2]
				0.7, -- [3]
				0.65, -- [4]
			},
			["orient"] = 1,
			["spectab"] = {
				true, -- [1]
				true, -- [2]
				true, -- [3]
				true, -- [4]
			},
			["bEnShadowOffset"] = false,
			["colSpark"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["anchorfrom"] = 5,
			["coord"] = {
				["casticon"] = {
					["y"] = 0,
					["x"] = -3,
				},
				["shadow"] = {
					["y"] = -1,
					["x"] = 1,
				},
				["latency"] = {
					["y"] = 1,
					["x"] = -1,
				},
				["casttime"] = {
					["y"] = 0,
					["x"] = -3,
				},
				["castname"] = {
					["y"] = 0,
					["x"] = 3,
				},
			},
			["cboptver"] = 4.62,
			["bIconUnlocked"] = false,
			["height"] = 16,
			["fontsize_lat"] = 0,
			["colBorder"] = {
				0, -- [1]
				0, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["aligntime"] = "RIGHT",
			["colShadow"] = {
				0, -- [1]
				0, -- [2]
				0, -- [3]
				0.7, -- [4]
			},
			["strata"] = "MEDIUM",
			["bEn"] = true,
			["bColSuc"] = false,
			["colTextTime"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["bInvDir"] = false,
			["border"] = 1,
			["bShowPlayerLatency"] = false,
			["rotateicon"] = 0,
			["rotatertext"] = 0,
			["bartype"] = "cb",
			["iconside"] = "LEFT",
			["width"] = 181,
			["bExtChannels"] = true,
			["bResizeLongName"] = false,
			["alignlat"] = "ADAPT",
			["ingroupsel"] = 1,
			["bUnlocked"] = false,
			["relationsel"] = 1,
			["fontoutline"] = "OUTLINE",
			["bShowWNC"] = false,
			["anchor_x"] = 0,
			["strTimeFormat"] = "r<1>",
			["forcefreealign"] = false,
			["latbarfixed"] = 0.03,
			["bShowCBS"] = false,
			["alignment"] = "NAMETIME",
			["bFillup"] = false,
			["anchorframe"] = "",
			["colInterrupted"] = {
				0.3019607843137255, -- [1]
				0.3019607843137255, -- [2]
				0.3019607843137255, -- [3]
				1, -- [4]
			},
			["bnwlist"] = {
			},
			["colText"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
		},
	}
end
