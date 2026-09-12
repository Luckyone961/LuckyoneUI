local _, Private = ...

if not Private.ElvUI then
	return
end

local unpack = unpack

local hooksecurefunc = hooksecurefunc

local C_Timer = C_Timer

local E = unpack(ElvUI)
local S = E:GetModule('Skins')

-- The addon reanchors the button on several events, which would stretch it across the frame
local function NovaSpellRankChecker_PositionButton(button, point)
	if point == 'BOTTOMLEFT' then return end

	button:ClearAllPoints()
	button:Point('BOTTOMLEFT', SpellBookFrame, 'BOTTOMLEFT', 19, 100)
end

local function Skin_NovaSpellRankChecker()
	if not Private.Addon.db.profile.skins.NovaSpellRankChecker then return end

	local button = SpellBookFrameButton
	if not button or button.isSkinned then return end

	-- Skin and resize the spell rank checker button
	S:HandleButton(button)
	button:SetFrameStrata('HIGH')
	button:Size(120, 26)

	-- Move it to the bottom left of the spell book frame
	NovaSpellRankChecker_PositionButton(button)
	hooksecurefunc(button, 'SetPoint', NovaSpellRankChecker_PositionButton)

	button.isSkinned = true
end

S:AddCallbackForAddon('NovaSpellRankChecker', 'LuckyoneUI_NovaSpellRankChecker', function() C_Timer.After(2, Skin_NovaSpellRankChecker) end)
