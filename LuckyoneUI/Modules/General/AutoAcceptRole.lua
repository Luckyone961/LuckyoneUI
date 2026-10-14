local _, Private = ...

local IsShiftKeyDown = IsShiftKeyDown

local _G = _G

-- Holding shift on show skips the auto accept
local function AutoAcceptRole_OnShow(self)
	if not IsShiftKeyDown() then
		self:Click()
	end
end

function Private:AutoAcceptRole()
	if not Private.Addon.db.profile.qualityOfLife.autoAcceptRole then return end

	local AcceptButton = _G.LFDRoleCheckPopupAcceptButton
	if AcceptButton then
		AcceptButton:HookScript('OnShow', AutoAcceptRole_OnShow)
	end

	local ApplicationDialog = _G.LFGListApplicationDialog
	if ApplicationDialog then
		ApplicationDialog.SignUpButton:HookScript('OnShow', AutoAcceptRole_OnShow)
	end
end
