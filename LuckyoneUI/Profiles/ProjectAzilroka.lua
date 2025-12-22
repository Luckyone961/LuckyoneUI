-- Addon namespace
local _, Private = ...
local L = Private.Libs.ACL

-- Lua functions
local unpack = unpack

-- ProjectAzilroka profile
-- LC: 06/02/2025
function Private:Setup_ProjectAzilroka()
	if not Private.IsAddOnLoaded('ProjectAzilroka') then Private:Print('|cff16C3F2Project|r|cFFFFFFFFAzilroka|r ' .. L["is not installed or enabled."]) return end

	local PA = unpack(ProjectAzilroka)

	-- Profile name
	local name = 'Luckyone'

	-- Profile creation
	PA.data:SetProfile(name)

	-- General modules
	PA.db.AuraReminder.Enable = false
	PA.db.Cooldown.Enable = false
	PA.db.DragonOverlay.Enable = false
	PA.db.EnhancedShadows.Enable = false
	PA.db.MouseoverAuras.Enable = false
	PA.db.OzCooldowns.Enable = false
	PA.db.QuestSounds.Enable = false
	PA.db.stAddonManager.Enable = false

	-- Retail modules
	if Private.isRetail then
		PA.db.MasterExperience.Enable = false
		PA.db.MovableFrames.Enable = false
		PA.db.TorghastBuffs.Enable = false
	end

	-- Friendlist setup
	PA.db.EnhancedFriendsList.DiffLevel = false
	PA.db.EnhancedFriendsList.InfoFontSize = 10
	PA.db.EnhancedFriendsList.NameFontSize = 11
	PA.db.EnhancedFriendsList.Texture = Private.Texture

	-- SquareMinimapButtons setup
	PA.db.SquareMinimapButtons.Backdrop = false
	PA.db.SquareMinimapButtons.BarMouseOver = false
	PA.db.SquareMinimapButtons.ButtonSpacing = 1
	PA.db.SquareMinimapButtons.ButtonsPerRow = 7
	PA.db.SquareMinimapButtons.IconSize = 24
	PA.db.SquareMinimapButtons.MoveQueue = false
	PA.db.SquareMinimapButtons.MoveTracker = false
	PA.db.SquareMinimapButtons.Shadows = false

	-- stAddonManager setup
	PA.db.stAddonManager.CheckTexture = Private.Texture
	PA.db.stAddonManager.ClassColor = true
	PA.db.stAddonManager.EnableRequiredAddons = false
	PA.db.stAddonManager.Font = Private.Font
	PA.db.stAddonManager.FontSize = 12
	PA.db.stAddonManager.FrameWidth = 720
	PA.db.stAddonManager.NumAddOns = 18

	if Private.ElvUI then
		-- Protect movers error
		ElvUI[1].db.movers = ElvUI[1].db.movers or {}
		-- Movers
		ElvUI[1].db.movers.SquareMinimapButtonBarMover = 'TOPRIGHT,ElvUIParent,TOPRIGHT,0,-175'
	end

	Private:Print(L["ProjectAzilroka profile has been set."])
end
