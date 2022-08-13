local L1UI, E, L, V, P, G = unpack(select(2, ...))

local _G = _G
local IsAddOnLoaded = IsAddOnLoaded

-- ProjectAzilroka profile
function L1UI:Setup_ProjectAzilroka(noPrint)
	if not IsAddOnLoaded('ProjectAzilroka') then return end

	local PA = _G.ProjectAzilroka

	-- Create and set a new profile called Luckyone
	PA.data:SetProfile('Luckyone')

	-- Module toggles
	PA.db.AuraReminder.Enable = false
	PA.db.Cooldown.Enable = false
	PA.db.DragonOverlay.Enable = false
	PA.db.EnhancedShadows.Enable = false
	PA.db.MouseoverAuras.Enable = false
	PA.db.MovableFrames.Enable = false
	PA.db.OzCooldowns.Enable = false
	PA.db.QuestSounds.Enable = false

	-- Retail only toggles
	if E.Retail then
		PA.db.MasterExperience.Enable = false
		PA.db.ReputationReward.Enable = false
		PA.db.SunsongRanchFarmer.Enable = false
		PA.db.TorghastBuffs.Enable = false
	end

	-- Friendlist setup
	PA.db.EnhancedFriendsList.DiffLevel = false
	PA.db.EnhancedFriendsList.InfoFontSize = 10
	PA.db.EnhancedFriendsList.NameFontSize = 11
	PA.db.EnhancedFriendsList.Texture = 'Minimalist'

	-- SquareMinimapButtons setup
	PA.db.SquareMinimapButtons.Backdrop = false
	PA.db.SquareMinimapButtons.BarMouseOver = false
	PA.db.SquareMinimapButtons.ButtonSpacing = -1
	PA.db.SquareMinimapButtons.ButtonsPerRow = 6
	PA.db.SquareMinimapButtons.IconSize = 28
	PA.db.SquareMinimapButtons.MoveQueue = false
	PA.db.SquareMinimapButtons.MoveTracker = false
	PA.db.SquareMinimapButtons.Shadows = false

	-- stAddonManager setup
	PA.db.stAddonManager.CheckTexture = 'Minimalist'
	PA.db.stAddonManager.ClassColor = true
	PA.db.stAddonManager.EnableRequiredAddons = false
	PA.db.stAddonManager.Font = 'Expressway'
	PA.db.stAddonManager.FontSize = 12
	PA.db.stAddonManager.FrameWidth = 720
	PA.db.stAddonManager.NumAddOns = 18

	-- Movers
	if not E.db.movers then E.db.movers = {} end
	E.db.movers.SquareMinimapButtonBarMover = 'TOPRIGHT,ElvUIParent,TOPRIGHT,-2,-187'
	-- E.db.movers.SquareMinimapButtonBarMover = 'TOPRIGHT,ElvUIParent,TOPRIGHT,0,-156'

	if not noPrint then
		L1UI:Print(L["ProjectAzilroka profile has been set."])
	end
end
