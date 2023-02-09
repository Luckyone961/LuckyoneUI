local L1UI, E, L, V, P, G = unpack(select(2, ...))

local unpack = unpack

-- AddOnSkins Profile
function L1UI:Setup_AddOnSkins(noPrint)
	if not E:IsAddOnEnabled('AddOnSkins') then return end

	local AS = unpack(AddOnSkins)

	-- Profile creation
	AS.data:SetProfile(E.global.L1UI.dev and 'Luckyone' or 'Luckyone '..L1UI.Version)

	-- Profile data
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
