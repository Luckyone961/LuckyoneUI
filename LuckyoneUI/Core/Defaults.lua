-- Addon namespace
local _, Private = ...

-- LuckyoneDB defaults
Private.Defaults = {
	global = {
		dev = false,
		install_version = nil,
		scaled = false,
	},
	profile = {
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
