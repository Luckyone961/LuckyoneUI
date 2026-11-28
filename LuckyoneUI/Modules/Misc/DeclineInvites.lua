local _, Private = ...
local L = Private.L

local format = string.format

local After = C_Timer.After
local CreateFrame = CreateFrame
local DeclineGroup = DeclineGroup
local PlaySound = PlaySound
local StaticPopup_Hide = StaticPopup_Hide
local StaticPopupSpecial_Hide = StaticPopupSpecial_Hide

local _G = _G
local SOUNDKIT = SOUNDKIT

local E = Private.ElvUI and ElvUI[1]

local events

-- Hide it once both handlers fired
local function HideInvite()
	StaticPopup_Hide('PARTY_INVITE')
	StaticPopupSpecial_Hide(_G.LFGInvitePopup)
end

local function DeclineInvites_Update()
	local enabled = Private.Addon.db.profile.misc.declineInvites
	if enabled then
		events:RegisterEvent('PARTY_INVITE_REQUEST')
	else
		events:UnregisterEvent('PARTY_INVITE_REQUEST')
	end

	-- Shutdown ElvUI's auto accept
	local M = E and E:GetModule('Misc')
	if M and M.Initialized then
		if enabled then
			M:UnregisterEvent('PARTY_INVITE_REQUEST')
		else
			M:RegisterEvent('PARTY_INVITE_REQUEST', 'AutoInvite')
		end
	end
end

local function CheckBox_OnClick(self)
	local checked = self:GetChecked()
	PlaySound(checked and SOUNDKIT.IG_MAINMENU_OPTION_CHECKBOX_ON or SOUNDKIT.IG_MAINMENU_OPTION_CHECKBOX_OFF)

	Private.Addon.db.profile.misc.declineInvites = checked
	DeclineInvites_Update()
end

-- Centered between the "Back" and "List Self" button
local function CreateCheckBox()
	local frame = _G.LFGListingFrame
	if not frame then return end

	local check = CreateFrame('CheckButton', nil, frame, 'UICheckButtonTemplate')
	check:SetSize(26, 26)
	check:SetFrameLevel(frame.PostButton:GetFrameLevel())
	check:SetChecked(Private.Addon.db.profile.misc.declineInvites)
	check:SetScript('OnClick', CheckBox_OnClick)
	check.Text:SetText(L["Decline Group Invites"])

	local width = check.Text:GetStringWidth()
	check:SetHitRectInsets(0, -width, 0, 0)
	check:SetPoint('LEFT', frame, 'BOTTOM', -(24 + width) * 0.5, 30)

	if E and E.private.skins.blizzard.enable and E.private.skins.blizzard.lfg then
		E:GetModule('Skins'):HandleCheckBox(check)
	end
end

local function DeclineInvites_OnEvent(self, event, name)
	if event == 'ADDON_LOADED' then
		if name ~= 'Blizzard_GroupFinder_VanillaStyle' then return end

		self:UnregisterEvent(event)
		CreateCheckBox()
	else
		DeclineGroup()
		After(0, HideInvite)
		Private:Print(format(L["Declined a group invite from %s."], name))
	end
end

function Private:DeclineInvites()
	events = CreateFrame('Frame')
	events:SetScript('OnEvent', DeclineInvites_OnEvent)
	DeclineInvites_Update()

	-- The group finder is load on demand
	if Private.IsAddOnLoaded('Blizzard_GroupFinder_VanillaStyle') then
		CreateCheckBox()
	else
		events:RegisterEvent('ADDON_LOADED')
	end
end
