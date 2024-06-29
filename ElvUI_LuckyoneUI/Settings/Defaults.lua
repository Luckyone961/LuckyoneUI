local _, Private = ...
local E, L, V, P, G = unpack(ElvUI)

-- Defaults: E.global.L1UI
G.L1UI = {
	dev = false,
	install_version = nil,
	scaled = false,
}

-- Defaults: E.private.L1UI
V.L1UI = {
	disabledFrames = {
		AlertFrame = false,
		BossBanner = false,
		ZoneTextFrame = false,
	},
	qualityOfLife = {
		easyDelete = false,
	},
	skins = {
		BugSack = true,
	},
}

-- Defaults: E.db.L1UI
P.L1UI = {}
