local E, L, V, P, G = unpack(ElvUI)
local L1UI = E:GetModule("LuckyoneUI");

function L1UI:GetBigWigsProfile()
	local key = "Lucky"

	LoadAddOn("BigWigs_Options")
	LoadAddOn("BigWigs")

	if BigWigs3DB['profiles'] == nil then BigWigs3DB['profiles'] = {} end

	if BigWigs3DB['profiles'][key] == nil then
		BigWigs3DB = {
			["namespaces"] = {
				["BigWigs_Plugins_Super Emphasize"] = {
					["profiles"] = {
						[key] = {
							["outline"] = "NONE",
							["fontSize"] = 20,
							["font"] = "Expressway",
							["voice"] = "English: Heroes of the Storm",
							["fontName"] = "Expressway",
							["countdown"] = false,
						},
					},
				},
				["BigWigs_Plugins_Proximity"] = {
					["profiles"] = {
						[key] = {
							["posx"] = 814.934134316463,
							["font"] = "Friz Quadrata TT",
							["disabled"] = true,
							["height"] = 119.9999694824219,
							["posy"] = 85.3333191235856,
							["fontName"] = "Expressway",
							["width"] = 150.0000610351563,
						},
					},
				},
				["BigWigs_Plugins_Pull"] = {
					["profiles"] = {
						[key] = {
							["endPullSound"] = "None",
							["voice"] = "English: Heroes of the Storm",
							["combatLog"] = true,
						},
					},
				},
				["BigWigs_Plugins_Messages"] = {
					["profiles"] = {
						[key] = {
							["outline"] = "OUTLINE",
							["BWEmphasizeMessageAnchor_x"] = 610.844823843327,
							["BWEmphasizeCountdownMessageAnchor_x"] = 664.888818183208,
							["BWMessageAnchor_x"] = 610.843955801356,
							["usecolors"] = false,
							["fadetime"] = 2.5,
							["BWEmphasizeCountdownMessageAnchor_y"] = 383.288724558879,
							["font"] = "Expressway",
							["BWEmphasizeMessageAnchor_y"] = 576.711243456994,
							["BWMessageAnchor_y"] = 590.933460112719,
							["displaytime"] = 3.5,
							["fontName"] = "Expressway",
							["sink20OutputSink"] = "None",
						},
					},
				},
				["BigWigs_Plugins_Bars"] = {
					["profiles"] = {
						[key] = {
							["BigWigsEmphasizeAnchor_y"] = 546.8443322281128,
							["fontSize"] = 11,
							["visibleBarLimit"] = 8,
							["BigWigsAnchor_width"] = 168.0000152587891,
							["BigWigsAnchor_y"] = 251.7336688447231,
							["emphasizeRestart"] = false,
							["nameplateOffsetY"] = 0,
							["BigWigsAnchor_x"] = 449.4218827798431,
							["spacing"] = 2,
							["fill"] = false,
							["interceptMouse"] = false,
							["BigWigsEmphasizeAnchor_height"] = 20.0000171661377,
							["growup"] = false,
							["BigWigsEmphasizeAnchor_width"] = 240,
							["fontName"] = "Expressway",
							["BigWigsAnchor_height"] = 17.99999618530273,
							["emphasizeTime"] = 6,
							["visibleBarLimitEmph"] = 5,
							["interceptKey"] = "SHIFT",
							["BigWigsEmphasizeAnchor_x"] = 216.8890678470179,
							["onlyInterceptOnKeypress"] = true,
							["barStyle"] = "ElvUI",
							["texture"] = "ElvUI Blank",
						},
					},
				},
				["BigWigs_Plugins_InfoBox"] = {
					["profiles"] = {
						[key] = {
							["posx"] = 292.2667633228539,
							["posy"] = 71.71122746225456,
						},
					},
				},
				["BigWigs_Plugins_Alt Power"] = {
					["profiles"] = {
						[key] = {
							["posx"] = 390.398497722832,
							["posy"] = 57.60211213548746,
							["fontName"] = "Expressway",
							["font"] = "Friz Quadrata TT",
						},
					},
				},
			},
			["profileKeys"] = {
				[E.mynameRealm] = key
			},
			["profiles"] = {
				[key] = {
					["showZoneMessages"] = false,
					["fakeDBMVersion"] = true,
					["flash"] = false,
				},
			},
		}
	end

	BigWigs.db:SetProfile(key)
end
