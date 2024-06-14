local Name, Private = ...
local E, L, V, P, G = unpack(ElvUI)

local C_UI_Reload = C_UI.Reload
local format, print = format, print
local hooksecurefunc = hooksecurefunc
local SetCVar = SetCVar

-- Chat print
function Private:Print(msg)
	print(Private.Name .. ': ' .. msg)
end

-- Reload popup
E.PopupDialogs.L1UI_RL = {
	text = L["Reload required - continue?"],
	button1 = ACCEPT,
	button2 = CANCEL,
	OnAccept = C_UI_Reload,
	whileDead = 1,
	hideOnEscape = false,
}

-- Version check popup
E.PopupDialogs.L1UI_VC = {
	text = format('|cffC80000%s|r', L["Your ElvUI is outdated - please update and reload."]),
	whileDead = 1,
	hideOnEscape = false,
}

-- Editbox popup from ElvUI\Core\General\StaticPopups.lua:78
-- Slightly modified for title text and additional chat print
E.PopupDialogs.L1UI_EDITBOX = {
	text = Private.Name,
	button1 = OKAY,
	hasEditBox = 1,
	OnShow = function(self, data)
		self.editBox:SetAutoFocus(false)
		self.editBox.width = self.editBox:GetWidth()
		self.editBox:Width(280)
		self.editBox:AddHistoryLine('text')
		self.editBox.temptxt = data
		self.editBox:SetText(data)
		self.editBox:HighlightText()
		self.editBox:SetJustifyH('CENTER')
		Private:Print(data)
	end,
	OnHide = function(self)
		self.editBox:Width(self.editBox.width or 50)
		self.editBox.width = nil
		self.temptxt = nil
	end,
	EditBoxOnEnterPressed = function(self)
		self:GetParent():Hide()
	end,
	EditBoxOnEscapePressed = function(self)
		self:GetParent():Hide()
	end,
	EditBoxOnTextChanged = function(self)
		if self:GetText() ~= self.temptxt then
			self:SetText(self.temptxt)
		end
		self:HighlightText()
		self:ClearFocus()
	end,
	OnAccept = E.noop,
	whileDead = 1,
	preferredIndex = 3,
	hideOnEscape = 1,
}

-- Version check
function Private:VersionCheck()
	if E.version < Private.RequiredElvUI then
		E:StaticPopup_Show('L1UI_VC')
		Private:Print(format('|cffbf0008%s|r', L["Your ElvUI is outdated - please update and reload."]))
	end
end

-- General CVars
function Private:Setup_CVars(noPrint)
	-- Core CVars
	SetCVar('advancedCombatLogging', 1)
	SetCVar('alwaysShowActionBars', 1)
	SetCVar('autoLootDefault', 1)
	SetCVar('AutoPushSpellToActionBar', 0)
	SetCVar('cameraDistanceMaxZoomFactor', 2.6)
	SetCVar('ffxDeath', 0)
	SetCVar('ffxGlow', 0)
	SetCVar('ffxNether', 0)
	SetCVar('fstack_preferParentKeys', 0)
	SetCVar('lockActionBars', 1)
	SetCVar('nameplateShowOnlyNames', 1)
	SetCVar('profanityFilter', 0)
	SetCVar('rawMouseEnable', 1)
	SetCVar('screenshotQuality', 10)
	SetCVar('showNPETutorials', 0)
	SetCVar('showTutorials', 0)
	SetCVar('threatWarning', 3)
	SetCVar('UberTooltips', 1)

	-- Developer CVars
	if E.global.L1UI.dev then
		SetCVar('blockChannelInvites', 1)
		SetCVar('CameraReduceUnexpectedMovement', 1)
		SetCVar('DisableAdvancedFlyingVelocityVFX', 1)
		SetCVar('disableServerNagle', 1)
		SetCVar('displaySpellActivationOverlays', 0)
		SetCVar('doNotFlashLowHealthWarning', 1)
		SetCVar('empowerTapControls', 1)
		SetCVar('floatingCombatTextCombatDamage', 0)
		SetCVar('floatingCombatTextCombatHealing', 0)
		SetCVar('GxAllowCachelessShaderMode', 0)
		SetCVar('LowLatencyMode', 2)
		SetCVar('maxFPSLoading', 30)
		SetCVar('RAIDweatherDensity', 0)
		SetCVar('ResampleAlwaysSharpen', 1)
		SetCVar('showToastOffline', 0)
		SetCVar('showToastOnline', 0)
		SetCVar('showToastWindow', 0)
		SetCVar('SpellQueueWindow', 180)
		SetCVar('useIPv6', 1)
		SetCVar('weatherDensity', 0)
	end

	if not noPrint then
		Private:Print(L["CVars have been set."])
	end
end

-- NamePlate CVars
function Private:NameplateCVars(noPrint)
	SetCVar('NamePlateHorizontalScale', 1)
	SetCVar('nameplateLargerScale', 1)
	SetCVar('nameplateLargeTopInset', -1)
	SetCVar('nameplateMinAlpha', 1)
	SetCVar('nameplateMinScale', 1)
	SetCVar('nameplateMotion', 1)
	SetCVar('nameplateOccludedAlphaMult', 1)
	SetCVar('nameplateOtherBottomInset', -1)
	SetCVar('nameplateOtherTopInset', -1)
	SetCVar('nameplateOverlapH', 1)
	SetCVar('nameplateOverlapV', 1.4)
	SetCVar('nameplateSelectedScale', 1)
	SetCVar('nameplateSelfAlpha', 1)
	SetCVar('nameplateSelfTopInset', -1)
	SetCVar('NamePlateVerticalScale', 1)

	SetCVar('UnitNameEnemyGuardianName', 1)
	SetCVar('UnitNameEnemyMinionName', 1)
	SetCVar('UnitNameEnemyPetName', 1)
	SetCVar('UnitNameEnemyPlayerName', 1)

	if not E.Classic then
		SetCVar('UnitNameEnemyTotem', 1)
	end

	if not E.Retail then
		SetCVar('nameplateNotSelectedAlpha', 1)
	end

	if not noPrint then
		Private:Print(L["NamePlate CVars have been set."])
	end
end

-- Easy delete
function Private:EasyDelete()
	if not E.private.L1UI.qualityOfLife.easyDelete then return end

	-- Higher quality than green
	hooksecurefunc(StaticPopupDialogs.DELETE_GOOD_ITEM, 'OnShow', function(frame)
		frame.editBox:SetText(DELETE_ITEM_CONFIRM_STRING)
	end)

	-- Quests and Quest starters
	hooksecurefunc(StaticPopupDialogs.DELETE_GOOD_QUEST_ITEM, 'OnShow', function(frame)
		frame.editBox:SetText(DELETE_ITEM_CONFIRM_STRING)
	end)
end

----------------------------------------------------------------------
------------------------------- Events -------------------------------
----------------------------------------------------------------------

function L1UI:PLAYER_ENTERING_WORLD(_, initLogin, isReload)
	if initLogin or not ElvDB.LuckyoneDisabledAddOns then
		ElvDB.LuckyoneDisabledAddOns = {}
	end

	if initLogin or isReload then
		Private:VersionCheck()
	end

	Private:DisabledFrames()
	Private:EasyDelete()
	L1UI:LoadCommands()
end

function L1UI:RegisterEvents()
	L1UI:RegisterEvent('PLAYER_ENTERING_WORLD')
end
