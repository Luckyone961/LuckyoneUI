local E, L, V, P, G = unpack(ElvUI)
local L1UI = E:GetModule('LuckyoneUI');

local _G = _G

function L1UI:GetPAProfile()

	local PA = _G.ProjectAzilroka
	PA.data:SetProfile('Luckyone')

	--Module toggles
	PA.db["AuraReminder"]["Enable"] = false
	PA.db["BigButtons"]["Enable"] = false
	PA.db["cooldown"]["Enable"] = false
	PA.db["DragonOverlay"]["Enable"] = false
	PA.db["EnhancedShadows"]["Enable"] = false
	PA.db["MouseoverAuras"]["Enable"] = false
	PA.db["MovableFrames"]["Enable"] = false
	PA.db["OzCooldowns"]["Enable"] = false
	PA.db["QuestSounds"]["Enable"] = false
	PA.db["ReputationReward"]["Enable"] = false
	PA.db["stAddonManager"]["Enable"] = false

	--SquareMinimapButtons Setup
	PA.db["SquareMinimapButtons"]["Backdrop"] = false
	PA.db["SquareMinimapButtons"]["BarMouseOver"] = true
	PA.db["SquareMinimapButtons"]["ButtonSpacing"] = 1
	PA.db["SquareMinimapButtons"]["ButtonsPerRow"] = 6
	PA.db["SquareMinimapButtons"]["IconSize"] = 26
	PA.db["SquareMinimapButtons"]["MoveQueue"] = false
	PA.db["SquareMinimapButtons"]["MoveTracker"] = false
	PA.db["SquareMinimapButtons"]["Shadows"] = false

	--Friendlist Setup
	PA.db["EnhancedFriendsList"]["DiffLevel"] = false
	PA.db["EnhancedFriendsList"]["InfoFontSize"] = 10
	PA.db["EnhancedFriendsList"]["NameFontSize"] = 11
	PA.db["EnhancedFriendsList"]["StatusIconPack"] = "Square"
	PA.db["EnhancedFriendsList"]["Texture"] = "Solid"

	--stAddonManager Setup
	PA.db["stAddonManager"]["ButtonHeight"] = 16
	PA.db["stAddonManager"]["ButtonWidth"] = 16
	PA.db["stAddonManager"]["ClassColor"] = true
	PA.db["stAddonManager"]["EnableRequiredAddons"] = false
	PA.db["stAddonManager"]["Font"] = "Expressway"
	PA.db["stAddonManager"]["FontSize"] = 12
	PA.db["stAddonManager"]["FrameWidth"] = 600
	PA.db["stAddonManager"]["NumAddOns"] = 17

	--BrokerLDB Setup
	PA.db["BrokerLDB"]["FontFlag"] = "OUTLINE"
	PA.db["BrokerLDB"]["Font"] = "Expressway"

	--Movers
	E.db["movers"]["SquareMinimapBar"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-59,-182"
	E.db["movers"]["SquareMinimapButtonBarMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-1,-185"
end
