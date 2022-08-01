local L1UI, E, L, V, P, G = unpack(select(2, ...))

local IsAddOnLoaded = IsAddOnLoaded
local unpack = unpack

-- AddOnSkins Profile
function L1UI:Setup_AddOnSkins(noPrint)
	if not IsAddOnLoaded('AddOnSkins') then return end

	local AS = unpack(AddOnSkins)

	-- Create and set a new profile called Luckyone
	AS.data:SetProfile('Luckyone')

	AS.db.DBMFont = 'Expressway'
	AS.db.Shadows = false
	AS.db.SkinDebug = true

	AS.db.EmbedBackdrop = false
	AS.db.EmbedBackdropTransparent = false
	AS.db.EmbedOoC = false
	AS.db.EmbedRightChat = false
	AS.db.EmbedSystem = false
	AS.db.EmbedSystemDual = false
	AS.db.EmbedSystemMessage = false

	if not noPrint then
		L1UI:Print(L["AddOnSkins profile has been set."])
	end
end
