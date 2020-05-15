local E, L, V, P, G = unpack(ElvUI)
local L1UI = E:GetModule("LuckyoneUI");

function L1UI:GetGGFProfile()
	local key = "Default"
	
	LoadAddOn("GottaGoFastHistory")
	LoadAddOn("GottaGoFast")
	
	if GottaGoFastDB['profiles'] == nil then GottaGoFastDB['profiles'] = {} end

	if GottaGoFastDB['profiles'][key] == nil then
		GottaGoFastDB = {
			["profiles"] = {
				[key] = {
					["TimerType"] = "TrueTimerNoMS",
					["TimerColor"] = "ffff7b00",
					["ObjectiveCompleteColor"] = "ffff7b00",
					["FrameX"] = 0.003287724917754531,
					["TimerFont"] = "Expressway",
					["IncreaseColor"] = "ff31ff00",
					["DeathInObjectives"] = true,
					["ObjectiveAlign"] = "RIGHT",
					["TimerAlign"] = "RIGHT",
					["AffixesColor"] = "ff30ff00",
					["ObjectiveFont"] = "Expressway",
					["TimerFontSize"] = 26,
					["FrameY"] = 149.769775390625,
					["DeathColor"] = "ffff0b00",
					["Version"] = 31100,
					["MobPoints"] = true,
					["ObjectiveFontSize"] = 17,
				},
			},
		}
	end
end
