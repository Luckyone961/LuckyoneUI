local _, Private = ...

if not Private.ElvUI then
	return
end

local next = next
local unpack = unpack

local C_Timer = C_Timer

local E = unpack(ElvUI)
local S = E:GetModule('Skins')

local function Skin_LeatrixPlus()
	if not Private.Addon.db.profile.skins.LeatrixPlus then return end

	-- Find the head/cloak toggle checkboxes on the character frame
	for _, child in next, { PaperDollFrame:GetChildren() } do
		if child:IsObjectType('CheckButton') and not child.isSkinned then
			S:HandleCheckBox(child)
			child.isSkinned = true
		end
	end
end

S:AddCallbackForAddon('Leatrix_Plus', 'LuckyoneUI_LeatrixPlus', function() C_Timer.After(1, Skin_LeatrixPlus) end)
