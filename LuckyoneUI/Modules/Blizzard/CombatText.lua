local _, Private = ...
local Blizzard = Private.Modules.Blizzard

local CreateFrame = CreateFrame

local _G = _G
local UIParent = UIParent

local frame

local function CombatText_OnUpdate(self, elapsed)
	self.elapsed = self.elapsed + elapsed
	if self.elapsed < 1 then return end -- One second at full alpha before the fade starts

	local alpha = 1 - (self.elapsed - 1) / self.fadeTime

	if alpha > 0 then
		self:SetAlpha(alpha)
	else
		self:SetScript('OnUpdate', nil)
		self:Hide()
	end
end

function Private:CombatText_Update()
	local db = Private.Addon.db.profile.misc.combatText

	if not frame then
		frame = CreateFrame('Frame', 'LuckyoneCombatText', UIParent)
		frame:SetSize(400, 40)
		frame:SetFrameStrata('HIGH')
		frame.text = frame:CreateFontString(nil, 'OVERLAY')
		frame.text:SetPoint('CENTER')
		frame:Hide()
	end

	Private:SetFont(frame.text, db.font, db.fontSize, db.fontOutline)

	frame:ClearAllPoints()
	frame:SetPoint('CENTER', _G[db.anchor] or UIParent, 'CENTER', db.xOffset, db.yOffset)
end

-- Restore profile defaults config button
function Private:CombatText_ResetDefaults()
	Private:ResetDefaults(Private.Addon.db.profile.misc.combatText, Private.Defaults.profile.misc.combatText)
	Private:CombatText_Update()
end

local function CombatText_Show(entering)
	local db = Private.Addon.db.profile.misc.combatText
	if not db.enable then return end

	-- Styling only has to run once, the config updates it on the fly
	if not frame then Private:CombatText_Update() end

	local color = entering and db.enterColor or db.leaveColor
	frame.text:SetText(entering and db.enterText or db.leaveText)
	frame.text:SetTextColor(color.r, color.g, color.b)

	frame.elapsed = 0
	frame.fadeTime = db.fadeTime
	frame:SetAlpha(1)
	frame:Show()
	frame:SetScript('OnUpdate', CombatText_OnUpdate)
end

function Blizzard:PLAYER_REGEN_DISABLED()
	CombatText_Show(true)
end

function Blizzard:PLAYER_REGEN_ENABLED()
	CombatText_Show(false)
end
