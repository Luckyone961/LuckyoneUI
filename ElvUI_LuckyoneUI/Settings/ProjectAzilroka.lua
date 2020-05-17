local E, L, V, P, G = unpack(ElvUI)
local L1UI = E:GetModule("LuckyoneUI");

local _G = _G

function L1UI:GetPAProfile()
	local PA = _G.ProjectAzilroka
	PA.data:SetProfile('Lucky')

	--Disabled Modules
	PA.db["EnhancedShadows"]["Enable"] = false
	PA.db["ReputationReward"]["Enable"] = false
	PA.db["BigButtons"]["Enable"] = false
	PA.db["DragonOverlay"]["Enable"] = false
	PA.db["MovableFrames"]["Enable"] = false
	PA.db["OzCooldowns"]["Enable"] = false
	PA.db["QuestSounds"]["Enable"] = false
	PA.db["MouseoverAuras"]["Enable"] = false
	PA.db["AuraReminder"]["Enable"] = false
	PA.db["cooldown"]["Enable"] = false

	--Friendlist Setup
	PA.db["EnhancedFriendsList"]["DiffLevel"] = false
	PA.db["EnhancedFriendsList"]["InfoFontSize"] = 10
	PA.db["EnhancedFriendsList"]["Texture"] = "ElvUI Blank"
	PA.db["EnhancedFriendsList"]["NameFontSize"] = 11
	PA.db["EnhancedFriendsList"]["StatusIconPack"] = "Square"

	--stAddonManager Setup
	PA.db["stAddonManager"]["FontSize"] = 12
	PA.db["stAddonManager"]["NumAddOns"] = 17
	PA.db["stAddonManager"]["ButtonHeight"] = 16
	PA.db["stAddonManager"]["ButtonWidth"] = 16
	PA.db["stAddonManager"]["ClassColor"] = true
	PA.db["stAddonManager"]["Font"] = "Expressway"
	PA.db["stAddonManager"]["FrameWidth"] = 600
	PA.db["stAddonManager"]["EnableRequiredAddons"] = false

	--BrokerLDB Setup
	PA.db["BrokerLDB"]["FontFlag"] = "OUTLINE"
	PA.db["BrokerLDB"]["Font"] = "Expressway"

	--SquareMinimapButtons Setup
	PA.db["SquareMinimapButtons"]["Shadows"] = false
	PA.db["SquareMinimapButtons"]["MoveQueue"] = false
	PA.db["SquareMinimapButtons"]["ButtonSpacing"] = 1
	PA.db["SquareMinimapButtons"]["IconSize"] = 25
	PA.db["SquareMinimapButtons"]["ButtonsPerRow"] = 7

	--Movers
	E.db["movers"]["SquareMinimapButtonBarMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-1,-206"
end
