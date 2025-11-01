-- Addon namespace
local _, Private = ...

-- LuckyoneDB defaults
Private.Defaults = {
	global = {
		dev = false,
		install_version = nil,
	},
	profile = {
		-- General
		scaled = false,
		-- Modules
		disabledFrames = {
			AlertFrame = false,
			BossBanner = false,
			ZoneTextFrame = false,
		},
		minimap = {
			hide = false,
		},
		qualityOfLife = {
			easyDelete = false,
			privacyOverlay = false,
		},
		skins = {
			BugSack = false,
			Tabardy = false,
		},
	}
}
