-- Lua functions
local unpack = unpack

-- API cache
local CreateFrame = CreateFrame
local hooksecurefunc = hooksecurefunc

-- Global environment
local _G = _G
local UIParent = UIParent

-- Global constants
local COMMUNITIES_FRAME_DISPLAY_MODES = COMMUNITIES_FRAME_DISPLAY_MODES

-- AddOn namespace
local _, Private = ...

-- ElvUI modules
local E = unpack(ElvUI)
local S = E:GetModule('Skins')

-- Privacy overlay for the guild chat, useful for streamers and recordings, based on a outdated WeakAura on Wago
function L1UI:PrivacyOverlay()
	if not E.private.L1UI.qualityOfLife.privacyOverlay then return end

	-- Create the overlay frame
	local PrivacyOverlay = CreateFrame('Button', nil, UIParent)
	PrivacyOverlay:SetFrameStrata('HIGH')
	PrivacyOverlay.tex = PrivacyOverlay:CreateTexture(nil, 'BACKGROUND')
	PrivacyOverlay.tex:SetAllPoints()
	PrivacyOverlay.tex:SetColorTexture(0.1, 0.1, 0.1, 1) -- R, G, B, A

	-- Text on the overlay
	PrivacyOverlay.text = PrivacyOverlay:CreateFontString()
	PrivacyOverlay.text:SetFontObject('ElvUIFontNormal') -- Use ElvUI font
	PrivacyOverlay.text:SetText('Chat Hidden. Click to show.')
	PrivacyOverlay.text:SetTextColor(1, 1, 1, 1) -- R, G, B, A
	PrivacyOverlay.text:SetJustifyH('CENTER')
	PrivacyOverlay.text:SetJustifyV('MIDDLE')
	PrivacyOverlay.text:SetHeight(20)
	PrivacyOverlay.text:SetPoint('CENTER', PrivacyOverlay, 'CENTER', 0, 0)

	-- Make sure we can click the overlay to show the chat
	PrivacyOverlay:EnableMouse(true)
	PrivacyOverlay:RegisterForClicks('AnyUp')
	PrivacyOverlay:SetScript('OnClick', function(...)
			PrivacyOverlay:Hide()
	end)

	-- Show the overlay
	local function ShowOverlay()
		if _G.CommunitiesFrame:GetDisplayMode() == COMMUNITIES_FRAME_DISPLAY_MODES.CHAT then
			PrivacyOverlay:SetAllPoints(_G.CommunitiesFrame.Chat.InsetFrame)
			PrivacyOverlay:Show()
		else
			PrivacyOverlay:Hide()
		end
	end

	-- Hide the overlay
	local function HideOverlay()
		PrivacyOverlay:Hide()
	end

	-- Call once to create the initial overlay
	ShowOverlay()

	-- Hook the following Blizzard events
	hooksecurefunc(_G.CommunitiesFrame, 'SetDisplayMode', ShowOverlay)
	hooksecurefunc(_G.CommunitiesFrame, 'Show', ShowOverlay)
	hooksecurefunc(_G.CommunitiesFrame, 'Hide', HideOverlay)
	hooksecurefunc(_G.CommunitiesFrame, 'OnClubSelected', ShowOverlay)
end

S:AddCallbackForAddon('Blizzard_Communities', 'LuckyoneUI_PrivacyOverlay', L1UI.PrivacyOverlay)
