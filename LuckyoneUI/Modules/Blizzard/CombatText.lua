local _, Private = ...
local LSM = Private.Libs.LSM
local Blizzard = Private.Modules.Blizzard

local gsub = string.gsub
local strfind = string.find

local CreateFrame = CreateFrame
local UIFrameFadeOut = UIFrameFadeOut
local UIFrameFadeRemoveFrame = UIFrameFadeRemoveFrame
local After = C_Timer.After

local _G = _G
local UIParent = UIParent

local frame

function Private:CombatText_Update()
	local db = Private.Addon.db.profile.misc.combatText

	if not frame then
		frame = CreateFrame('Frame', 'LuckyoneCombatText', UIParent)
		frame:SetSize(400, 40)
		frame:SetFrameStrata('HIGH')
		frame.text = frame:CreateFontString(nil, 'OVERLAY')
		frame.text:SetPoint('CENTER', frame, 'CENTER', 0, 0)
		frame:Hide()
	end

	local outline = db.fontOutline
	local shadow = strfind(outline, 'SHADOW')
	if shadow then
		outline = gsub(outline, 'SHADOW', '')
	end

	frame.text:SetFont(LSM:Fetch('font', db.font), db.fontSize, outline == 'NONE' and '' or outline)
	frame.text:SetShadowColor(0, 0, 0, shadow and 1 or 0)
	frame.text:SetShadowOffset(1, -1)

	frame:ClearAllPoints()
	frame:SetPoint('CENTER', _G[db.anchor] or UIParent, 'CENTER', db.xOffset, db.yOffset)
end

local function CombatText_Show(entering)
	local db = Private.Addon.db.profile.misc.combatText
	if not db.enable then return end

	Private:CombatText_Update()

	local color = entering and db.enterColor or db.leaveColor
	frame.text:SetText(entering and db.enterText or db.leaveText)
	frame.text:SetTextColor(color.r, color.g, color.b, 1)

	local token = (frame.token or 0) + 1
	frame.token = token

	UIFrameFadeRemoveFrame(frame)
	frame:SetAlpha(1)
	frame:Show()

	After(1, function()
		if frame.token == token then
			UIFrameFadeOut(frame, db.fadeTime, 1, 0)
		end
	end)
end

function Blizzard:PLAYER_REGEN_DISABLED()
	CombatText_Show(true)
end

function Blizzard:PLAYER_REGEN_ENABLED()
	CombatText_Show(false)
end
