-- Addon namespace
local _, Private = ...

-- ElvUI file
if not Private.ElvUI then
	return
end

-- Lua functions
local pairs = pairs
local unpack = unpack

-- ElvUI modules
local E = unpack(ElvUI)
local S = E:GetModule('Skins')

function Private:Skin_LeatrixPlus()
	if not (Private.isClassic or Private.isTBC) and not Private.Addon.db.profile.skins.LeatrixPlus then return end

	C_Timer.After(1, function() -- ToDo: Check back for a better method
		for _, checkbox in pairs({ PaperDollFrame:GetChildren() }) do
			-- Find the head/cloak toggle checkboxes on the character frame
			if checkbox:IsObjectType('CheckButton') and not checkbox.isSkinned then
				S:HandleCheckBox(checkbox)
				checkbox.isSkinned = true
			end
		end
	end)
end

S:AddCallbackForAddon('Leatrix_Plus', 'LuckyoneUI_LeatrixPlus', Private.Skin_LeatrixPlus)
