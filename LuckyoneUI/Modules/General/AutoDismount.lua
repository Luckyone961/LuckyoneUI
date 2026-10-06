local _, Private = ...

local CreateFrame = CreateFrame
local Dismount = Dismount
local IsFlying = IsFlying
local issecretvalue = issecretvalue

-- Spells list
local DisabledSpells = {
	[372608] = true, -- Surge Forward
	[361584] = true, -- Whirling Surge
	[403092] = true, -- Aerial Halt
	[425782] = true, -- Second Wind
}

function Private:AutoDismount()
	if not Private.Addon.db.profile.qualityOfLife.autoDismount then return end

	local EventFrame = CreateFrame('Frame')
	EventFrame:SetScript('OnEvent', function(_, _, _, _, _, spellID)
		-- Spells flagged as always secret can't be used as a table key
		if not issecretvalue(spellID) and DisabledSpells[spellID] and not IsFlying('player') then
			Dismount()
		end
	end)
	EventFrame:RegisterUnitEvent('UNIT_SPELLCAST_SENT', 'player')
end
