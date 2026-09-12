local _, Private = ...
local L = Private.Libs.ACL

local CreateFrame = CreateFrame
local hooksecurefunc = hooksecurefunc

local _G = _G

-- Privacy overlay for the guild chat, useful for streamers and recordings, based on a outdated WeakAura on Wago
function Private:PrivacyOverlay()
	if not Private.Addon.db.profile.qualityOfLife.privacyOverlay then return end

	local CommunitiesFrame = _G.CommunitiesFrame
	if not CommunitiesFrame then return end

	local ChatDisplayMode = _G.COMMUNITIES_FRAME_DISPLAY_MODES.CHAT

	-- Parented to the chat inset, so it takes the anchors and hides along with the frame
	local PrivacyOverlay = CreateFrame('Button', nil, CommunitiesFrame.Chat.InsetFrame)
	PrivacyOverlay:SetFrameStrata('HIGH')
	PrivacyOverlay:SetAllPoints()
	PrivacyOverlay:RegisterForClicks('AnyUp')
	PrivacyOverlay:SetScript('OnClick', function(self) self:Hide() end)

	local texture = PrivacyOverlay:CreateTexture(nil, 'BACKGROUND')
	texture:SetAllPoints()
	texture:SetColorTexture(0.1, 0.1, 0.1, 1)

	-- Text on the overlay
	local text = PrivacyOverlay:CreateFontString()
	text:SetFontObject(Private.ElvUI and 'ElvUIFontNormal' or 'GameFontNormal')
	text:SetPoint('CENTER')
	text:SetTextColor(1, 1, 1, 1)
	text:SetText(L["Chat Hidden. Click to show."])

	-- The parent handles hiding it
	local function UpdateOverlay()
		PrivacyOverlay:SetShown(CommunitiesFrame:GetDisplayMode() == ChatDisplayMode)
	end

	hooksecurefunc(CommunitiesFrame, 'SetDisplayMode', UpdateOverlay)
	hooksecurefunc(CommunitiesFrame, 'OnClubSelected', UpdateOverlay)
	CommunitiesFrame:HookScript('OnShow', UpdateOverlay)

	UpdateOverlay()
end
