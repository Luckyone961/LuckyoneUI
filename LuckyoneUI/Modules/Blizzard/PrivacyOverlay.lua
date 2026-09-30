local _, Private = ...
local L = Private.L

local CreateFrame = CreateFrame
local hooksecurefunc = hooksecurefunc

local _G = _G

-- Privacy overlay for the guild chat, useful for streamers and recordings, based on a outdated WeakAura on Wago
function Private:PrivacyOverlay()
	if not Private.Addon.db.profile.qualityOfLife.privacyOverlay then return end

	local CommunitiesFrame = _G.CommunitiesFrame
	if not CommunitiesFrame then return end

	local MinimizedDisplayMode = _G.COMMUNITIES_FRAME_DISPLAY_MODES.MINIMIZED

	-- Parented to the chat, which only shows in the full and minimized chat modes
	local PrivacyOverlay = CreateFrame('Button', nil, CommunitiesFrame.Chat)
	PrivacyOverlay:SetFrameStrata('HIGH')
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

	-- Covers the chat again on every mode change (minimize and maximize included), club change and reopen, the parent handles hiding it
	local function UpdateOverlay()
		PrivacyOverlay:ClearAllPoints()

		-- Minimized hides the inset, so only cover the messages, lined up with the scroll bar and clear of the edit box
		if CommunitiesFrame:GetDisplayMode() == MinimizedDisplayMode then
			PrivacyOverlay:SetPoint('TOPLEFT', CommunitiesFrame.Chat, 'TOPLEFT', -4, 0)
			PrivacyOverlay:SetPoint('BOTTOMRIGHT', CommunitiesFrame.Chat, 'BOTTOMRIGHT', 4, -4)
		else
			PrivacyOverlay:SetAllPoints(CommunitiesFrame.Chat.InsetFrame)
		end

		PrivacyOverlay:Show()
	end

	hooksecurefunc(CommunitiesFrame, 'SetDisplayMode', UpdateOverlay)
	hooksecurefunc(CommunitiesFrame, 'OnClubSelected', UpdateOverlay)
	CommunitiesFrame:HookScript('OnShow', UpdateOverlay)

	UpdateOverlay()
end
