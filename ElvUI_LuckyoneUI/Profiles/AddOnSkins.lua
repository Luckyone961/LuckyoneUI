local L1UI, E, L, V, P, G = unpack(select(2, ...))

local unpack = unpack

function L1UI:GetASProfile()

	local AS = unpack(AddOnSkins)

	AS.data:SetProfile('Luckyone')

end
