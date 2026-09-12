local _, Private = ...

if not Private.ElvUI then
	return
end

local next = next
local unpack = unpack

local hooksecurefunc = hooksecurefunc

local LibStub = LibStub

local _G = _G

local E = unpack(ElvUI)
local S = E:GetModule('Skins')

-- The frame is created on first open, so this runs after every GetMainFrame call
local function SkinSimcFrame()
	local frame = _G.SimcFrame
	if not frame or frame.isSkinned then return end

	-- Main Frame
	S:HandleFrame(frame)

	-- Scroll Bar
	S:HandleScrollBar(_G.SimcScrollFrameScrollBar)

	-- Okay Button
	S:HandleButton(_G.SimcFrameButton)

	-- Checkboxes
	for _, checkbox in next, { _G.AutomaticClose, _G.SimcOffspecLoadouts } do
		S:HandleCheckBox(checkbox)
	end

	frame.isSkinned = true
end

local function Skin_Simulationcraft()
	if not Private.Addon.db.profile.skins.Simulationcraft then return end

	-- The addon object is not a global, only AceAddon knows it
	local Simulationcraft = LibStub('AceAddon-3.0'):GetAddon('Simulationcraft', true)
	if Simulationcraft then
		hooksecurefunc(Simulationcraft, 'GetMainFrame', SkinSimcFrame)
	end
end

S:AddCallbackForAddon('Simulationcraft', 'LuckyoneUI_Simulationcraft', Skin_Simulationcraft)
