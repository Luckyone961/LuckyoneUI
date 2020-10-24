local L1UI, E, L, V, P, G = unpack(select(2, ...))

local _G = _G

-- ProjectAzilroka profile setup
function L1UI:GetPAProfile()

	local PA = _G.ProjectAzilroka
	PA.data:SetProfile('Luckyone')

	-- Module toggles
	PA.db["AuraReminder"]["Enable"] = false
	PA.db["BigButtons"]["Enable"] = false
	PA.db["Cooldown"]["Enable"] = false
	PA.db["DragonOverlay"]["Enable"] = false
	PA.db["EnhancedShadows"]["Enable"] = false
	PA.db["MouseoverAuras"]["Enable"] = false
	PA.db["MovableFrames"]["Enable"] = false
	PA.db["OzCooldowns"]["Enable"] = false
	PA.db["QuestSounds"]["Enable"] = false
	PA.db["ReputationReward"]["Enable"] = false
	PA.db["stAddonManager"]["Enable"] = false
	PA.db["MasterExperience"]["Enable"] = false

	-- SquareMinimapButtons Setup
	PA.db["SquareMinimapButtons"]["Backdrop"] = false
	PA.db["SquareMinimapButtons"]["BarMouseOver"] = false
	PA.db["SquareMinimapButtons"]["ButtonSpacing"] = -1
	PA.db["SquareMinimapButtons"]["ButtonsPerRow"] = 6
	PA.db["SquareMinimapButtons"]["IconSize"] = 28
	PA.db["SquareMinimapButtons"]["MoveQueue"] = false
	PA.db["SquareMinimapButtons"]["MoveTracker"] = false
	PA.db["SquareMinimapButtons"]["Shadows"] = false

	-- Friendlist Setup
	PA.db["EnhancedFriendsList"]["DiffLevel"] = false
	PA.db["EnhancedFriendsList"]["InfoFontSize"] = 10
	PA.db["EnhancedFriendsList"]["NameFontSize"] = 11
	PA.db["EnhancedFriendsList"]["StatusIconPack"] = "Square"
	PA.db["EnhancedFriendsList"]["Texture"] = "Solid"

	-- Movers
	E.db["movers"]["SquareMinimapButtonBarMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-2,-187"
end
