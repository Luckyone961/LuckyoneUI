-- Addon namespace
local _, Private = ...

-- LuckyoneDB defaults
Private.Defaults = {}

Private.Defaults.global = {
	-- General
	dev = false,
	install_version = nil,
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
