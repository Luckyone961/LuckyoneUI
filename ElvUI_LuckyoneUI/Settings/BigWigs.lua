local E, L, V, P, G = unpack(ElvUI)
local L1UI = E:GetModule('LuckyoneUI');

function L1UI:GetBigWigsProfile()
	local main = "Luckyone DPS/TANK"
	local heal = "Luckyone Healing"

	LoadAddOn("BigWigs_Options")
	LoadAddOn("BigWigs")

	if BigWigs3DB['profiles'] == nil then BigWigs3DB['profiles'] = {} end

	if BigWigs3DB['profiles'][main] == nil then
		BigWigs3DB = {
			["namespaces"] = {
				["BigWigs_Plugins_Super Emphasize"] = {
					["profiles"] = {
						[main] = {
							["outline"] = "NONE",
							["fontSize"] = 20,
							["fontName"] = "Expressway",
							["countdown"] = false,
							["font"] = "Expressway",
							["voice"] = "English: Heroes of the Storm",
						},
						[heal] = {
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
						[main] = {
							["disabled"] = true,
							["posx"] = 448.0005827739697,
							["fontName"] = "Expressway",
							["width"] = 150.0000610351563,
							["posy"] = 86.04480704615389,
							["height"] = 119.9999694824219,
							["font"] = "Friz Quadrata TT",
						},
						[heal] = {
							["posx"] = 444.444992671466,
							["font"] = "Friz Quadrata TT",
							["disabled"] = true,
							["height"] = 119.9999694824219,
							["posy"] = 86.0444332821271,
							["fontName"] = "Expressway",
							["width"] = 150.0000610351563,
						},
					},
				},
				["BigWigs_Plugins_Pull"] = {
					["profiles"] = {
						[main] = {
							["endPullSound"] = "None",
							["voice"] = "English: Heroes of the Storm",
							["combatLog"] = true,
						},
						[heal] = {
							["combatLog"] = true,
							["voice"] = "English: Heroes of the Storm",
							["endPullSound"] = "None",
						},
					},
				},
				["BigWigs_Plugins_Messages"] = {
					["profiles"] = {
						[main] = {
							["outline"] = "OUTLINE",
							["BWEmphasizeCountdownMessageAnchor_x"] = 664.888818183208,
							["usecolors"] = false,
							["fadetime"] = 2.5,
							["BWEmphasizeMessageAnchor_y"] = 576.711243456994,
							["BWMessageAnchor_y"] = 590.933460112719,
							["sink20OutputSink"] = "None",
							["BWMessageAnchor_x"] = 610.843955801356,
							["fontName"] = "Expressway",
							["displaytime"] = 3.5,
							["BWEmphasizeCountdownMessageAnchor_y"] = 383.288724558879,
							["font"] = "Expressway",
							["BWEmphasizeMessageAnchor_x"] = 610.844823843327,
						},
						[heal] = {
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
						[main] = {
							["BigWigsAnchor_width"] = 168.0000152587891,
							["nameplateOffsetY"] = 0,
							["fill"] = false,
							["interceptMouse"] = false,
							["BigWigsEmphasizeAnchor_height"] = 20.0000171661377,
							["growup"] = false,
							["fontName"] = "Expressway",
							["BigWigsAnchor_height"] = 17.99999618530273,
							["visibleBarLimitEmph"] = 5,
							["fontSize"] = 11,
							["visibleBarLimit"] = 8,
							["BigWigsAnchor_y"] = 225.4225880969298,
							["spacing"] = 2,
							["emphasizeTime"] = 6,
							["barStyle"] = "ElvUI",
							["interceptKey"] = "SHIFT",
							["BigWigsEmphasizeAnchor_width"] = 240,
							["BigWigsEmphasizeAnchor_x"] = 334.933432870781,
							["BigWigsEmphasizeAnchor_y"] = 602.31100047367,
							["emphasizeRestart"] = false,
							["BigWigsAnchor_x"] = 449.4218827798431,
							["onlyInterceptOnKeypress"] = true,
							["texture"] = "Solid",
						},
						[heal] = {
							["BigWigsEmphasizeAnchor_y"] = 554.6665091157338,
							["fontSize"] = 11,
							["visibleBarLimit"] = 8,
							["BigWigsAnchor_width"] = 169.00146484375,
							["BigWigsAnchor_y"] = 225.4225880969298,
							["emphasizeRestart"] = false,
							["BigWigsAnchor_x"] = 399.6437513496712,
							["spacing"] = 2,
							["fill"] = false,
							["interceptMouse"] = false,
							["BigWigsEmphasizeAnchor_height"] = 20.0000171661377,
							["growup"] = false,
							["BigWigsEmphasizeAnchor_width"] = 239.9999542236328,
							["fontName"] = "Expressway",
							["BigWigsAnchor_height"] = 17.99996376037598,
							["emphasizeTime"] = 6,
							["BigWigsEmphasizeAnchor_x"] = 400.3560480810738,
							["visibleBarLimitEmph"] = 5,
							["interceptKey"] = "SHIFT",
							["outline"] = "OUTLINE",
							["onlyInterceptOnKeypress"] = true,
							["barStyle"] = "ElvUI",
							["texture"] = "Solid",
						},
					},
				},
				["BigWigs_Plugins_InfoBox"] = {
					["profiles"] = {
						[main] = {
							["posx"] = 295.8220717481199,
							["posy"] = 71.71141705270293,
						},
						[heal] = {
							["posx"] = 295.8223750928373,
							["posy"] = 72.42286333552283,
						},
					},
				},
				["BigWigs_Plugins_Alt Power"] = {
					["profiles"] = {
						[main] = {
							["posx"] = 906.6650324131551,
							["fontName"] = "Expressway",
							["posy"] = 57.60318467573825,
							["font"] = "Friz Quadrata TT",
						},
						[heal] = {
							["posx"] = 905.2449457861512,
							["posy"] = 58.22275001040725,
							["fontName"] = "Expressway",
							["font"] = "Friz Quadrata TT",
						},
					},
				},
			},
			["profileKeys"] = {
				[E.mynameRealm] = main
			},
			["profiles"] = {
				[main] = {
					["showZoneMessages"] = false,
					["fakeDBMVersion"] = true,
					["flash"] = false,
				},
				[heal] = {
					["showZoneMessages"] = false,
					["flash"] = false,
					["fakeDBMVersion"] = true,
				},
			},
		}
	end

	BigWigs.db:SetProfile(main)
end
