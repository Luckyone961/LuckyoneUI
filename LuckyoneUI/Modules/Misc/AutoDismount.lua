-- Addon namespace
local _, Private = ...

-- API cache
local CreateFrame = CreateFrame
local Dismount = Dismount
local IsFlying = IsFlying

-- Spells list
local DisabledSpells = {
	[372608] = true, -- Surge Forward,
    [361584] = true, -- Whirling Surge,
    [403092] = true, -- Aerial Halt,
    [425782] = true, -- Second Wind,
}

local EventFrame = CreateFrame('Frame')

EventFrame:SetScript('OnEvent', function(_, event, unit, _, _, spellID)
	if event == 'UNIT_SPELLCAST_SENT' and unit == 'player' then
		if (not (IsFlying('player')) and DisabledSpells[spellID]) then
			Dismount()
		end
	end
end)

function Private:AutoDismount()
	if not (Private.isRetail and Private.Addon.db.profile.qualityOfLife.autoDismount) then return end
	EventFrame:RegisterUnitEvent('UNIT_SPELLCAST_SENT', 'player')
end
