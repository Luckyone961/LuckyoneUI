local _, Private = ...

if not Private.ElvUI then
	return
end

local unpack = unpack

local C_Timer = C_Timer

local E = unpack(ElvUI)
local S = E:GetModule('Skins')

local function Skin_NovaSpellRankChecker()
	if not (Private.isClassic or Private.isTBC) or not Private.Addon.db.profile.skins.NovaSpellRankChecker then return end

	if SpellBookFrameButton and not SpellBookFrameButton.isSkinned then
		-- Skin and resize the spell rank checker button
		S:HandleButton(SpellBookFrameButton)
		SpellBookFrameButton:SetFrameStrata('HIGH')
		SpellBookFrameButton:Width(120)
		SpellBookFrameButton:Height(26)

		-- Move it to the bottom left of the spell book frame
		SpellBookFrameButton:ClearAllPoints()
		SpellBookFrameButton:Point('BOTTOMLEFT', SpellBookFrame, 'BOTTOMLEFT', 19, 100)

		SpellBookFrameButton.isSkinned = true
	end
end

S:AddCallbackForAddon('NovaSpellRankChecker', 'LuckyoneUI_NovaSpellRankChecker', function() C_Timer.After(2, Skin_NovaSpellRankChecker) end)
