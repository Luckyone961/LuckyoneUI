-- Addon namespace
local _, Private = ...

-- ElvUI file
if not Private.ElvUI then
	return
end

-- Lua functions
local unpack = unpack

-- ElvUI modules
local E = unpack(ElvUI)
local S = E:GetModule('Skins')

function Private:Skin_NovaSpellRankChecker()
	if not Private.Addon.db.profile.skins.NovaSpellRankChecker then return end

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

S:AddCallbackForAddon('NovaSpellRankChecker', 'LuckyoneUI_NovaSpellRankChecker', Private.Skin_NovaSpellRankChecker)
