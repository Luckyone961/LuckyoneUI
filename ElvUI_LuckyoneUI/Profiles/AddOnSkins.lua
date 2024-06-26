local _, Private = ...
local E, L, V, P, G = unpack(ElvUI)

local unpack = unpack

-- AddOnSkins profile
function Private:Setup_AddOnSkins()
	if not E:IsAddOnEnabled('AddOnSkins') then Private:Print('AddOnSkins ' .. L["is not installed or enabled."]) return end

	local AS = unpack(AddOnSkins)

	-- Profile creation
	AS.data:SetProfile((E.global.L1UI.dev and 'Luckyone') or 'Luckyone ' .. Private.Version)

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

	Private:Print(L["AddOnSkins profile has been set."])
end
