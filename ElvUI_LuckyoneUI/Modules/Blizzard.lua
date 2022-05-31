local L1UI, E, L, V, P, G = unpack(select(2, ...))

local _G = _G

-- Disabled Blizzard Frames
function L1UI:DisabledFrames()

	if E.private.L1UI.disabledFrames.AlertFrame then
		_G.AlertFrame:UnregisterAllEvents()
		E:DisableMover('AlertFrameMover')
	end

	if E.private.L1UI.disabledFrames.BossBanner and E.Retail then
		_G.BossBanner:UnregisterAllEvents()
		E:DisableMover('BossBannerMover')
	end

	if E.private.L1UI.disabledFrames.ZoneTextFrame then
		_G.ZoneTextFrame:UnregisterAllEvents()
	end
end
