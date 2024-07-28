-- Lua functions
local unpack = unpack

-- AddOn namespace
local _, Private = ...

-- ElvUI modules
local _, _, V, P, G = unpack(ElvUI)

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
		privacyOverlay = false,
	},
	skins = {
		BugSack = true,
		Tabardy = true,
	},
}

-- Defaults: E.db.L1UI
P.L1UI = {}
