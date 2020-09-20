local L1UI, E, L, V, P, G = unpack(select(2, ...))

local unpack = unpack

function L1UI:GetASProfile()

	local AS = unpack(AddOnSkins)

	AS.data:SetProfile('Luckyone')

	--General
	AS.db["DBMFont"] = 'Expressway'
	AS.db["Shadows"] = false

	--Embed
	AS.db["EmbedBackdrop"] = false
	AS.db["EmbedBackdropTransparent"] = false
	AS.db["EmbedRightChat"] = false
	AS.db["EmbedSystemMessage"] = false

end
