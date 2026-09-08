local _, Private = ...

if not Private.ElvUI or not (Private.isClassic or Private.isTBC) then
	return
end

local unpack = unpack

local C_Timer = C_Timer

local E = unpack(ElvUI)
local S = E:GetModule('Skins')

local function Skin_WhatsTraining()
	if not Private.Addon.db.profile.skins.WhatsTraining then return end

	local frame = WhatsTrainingFrame
	if not frame or frame.isSkinned then return end

	-- Main Frame
	S:HandleFrame(frame, true, true, 11, -50, -32, 76)

	-- Scroll Bar
	S:HandleScrollBar(WhatsTrainingFrameScrollBarScrollBar)

	-- Edit Box
	local searchBox = WhatsTrainingFrameSearchBox
	S:HandleEditBox(searchBox)
	searchBox:Height(24)
	searchBox:Point('TOPLEFT', frame, 'TOPLEFT', 15, -50)

	-- Frame Positioning
	frame:Point('TOPLEFT', SpellBookFrame, 'TOPLEFT', 0, 38)
	frame:Point('BOTTOMRIGHT', SpellBookFrame, 'BOTTOMRIGHT', 0, 0)

	-- Close Button
	SpellBookCloseButton:SetFrameStrata('HIGH')

	frame.isSkinned = true
end

S:AddCallbackForAddon('WhatsTraining', 'LuckyoneUI_WhatsTraining', function() C_Timer.After(1, Skin_WhatsTraining) end)
