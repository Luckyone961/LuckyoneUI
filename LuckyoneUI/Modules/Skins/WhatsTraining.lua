-- Addon namespace
local _, Private = ...

-- ElvUI file
if not Private.ElvUI then
	return
end

-- Lua functions
local unpack = unpack

-- API cache
local C_Timer = C_Timer

-- ElvUI modules
local E = unpack(ElvUI)
local S = E:GetModule('Skins')

function Private:Skin_WhatsTraining()
	if not Private.Addon.db.profile.skins.WhatsTraining then return end

	C_Timer.After(1, function() -- ToDo: Check back for a better method
		if WhatsTrainingFrame and not WhatsTrainingFrame.isSkinned then
			-- Main Frame
			S:HandleFrame(WhatsTrainingFrame, true, true, 11, -50, -32, 76)

			-- Scroll Bar
			S:HandleScrollBar(WhatsTrainingFrameScrollBarScrollBar)

			-- Edit Box
			S:HandleEditBox(WhatsTrainingFrameSearchBox, 160)
			WhatsTrainingFrameSearchBox:Height(24)
			WhatsTrainingFrameSearchBox:Point('TOPLEFT', WhatsTrainingFrame, 'TOPLEFT', 15, -50)

			-- Frame Positioning
			WhatsTrainingFrame:Point('TOPLEFT', SpellBookFrame, 'TOPLEFT', 0, 38)
			WhatsTrainingFrame:Point('BOTTOMRIGHT', SpellBookFrame, 'BOTTOMRIGHT', 0, 0)

			-- Close Button
			SpellBookCloseButton:SetFrameStrata('HIGH')

			WhatsTrainingFrame.isSkinned = true
		end
	end)
end

S:AddCallbackForAddon('WhatsTraining', 'LuckyoneUI_WhatsTraining', Private.Skin_WhatsTraining)
