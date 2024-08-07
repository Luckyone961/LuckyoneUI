-- Lua functions
local unpack = unpack

-- AddOn namespace
local _, Private = ...

-- ElvUI modules
local E, L = unpack(ElvUI)

-- WeakAuras import data
function Private:WeakAurasImport(aura)
	if not E:IsAddOnEnabled('WeakAuras') and E.Retail then Private:Print('WeakAuras ' .. L["is not installed or enabled."]) return end

	--[[
		WeakAuras.Import(inData, [target], [callbackFunction])

		inData: Payload to be imported. Must be a table, either raw or compressed and encoded using LibDeflate.

		target: may either be a table which exists in the database already, or a uid which exists in the database already.
				If target points to an aura which already exists, then the payload will be processed as an update for the existing aura.
				Otherwise, the database will be searched for a possible match.

		callbackFunction: function to be called on completion of import process. Returns the ID of the Aura if import was succesful.
	]]

	print('Test WeakAurasImport')
end
