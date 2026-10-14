local _, Private = ...
local LSM = Private.Libs.LSM

local gmatch = string.gmatch
local pairs = pairs
local type = type

local C_UI = C_UI
local GetCurrentBindingSet = GetCurrentBindingSet
local InCombatLockdown = InCombatLockdown
local SaveBindings = SaveBindings
local SetBinding = SetBinding

local _G = _G
local LibStub = LibStub

-- NONE clears a Blizzard default
local Bindings = [[
BUTTON3 MULTIACTIONBAR1BUTTON8
UP NONE
DOWN NONE
Q STRAFELEFT
LEFT NONE
E STRAFERIGHT
RIGHT NONE
A MULTIACTIONBAR1BUTTON11
D MULTIACTIONBAR1BUTTON12
NUMPAD0 NONE
BUTTON4 MULTIACTIONBAR2BUTTON4
INSERT NONE
DELETE NONE
SHIFT-PAGEDOWN NONE
CTRL-PAGEUP NONE
CTRL-PAGEDOWN NONE
CTRL-SHIFT-PAGEDOWN NONE
R ACTIONBUTTON6
SHIFT-R MULTIACTIONBAR3BUTTON10
6 TOGGLEPINGLISTENER
7 NONE
8 NONE
9 NONE
0 NONE
- NONE
= NONE
CTRL-F1 NONE
CTRL-F2 NONE
CTRL-F3 NONE
CTRL-F4 NONE
CTRL-F5 NONE
CTRL-F6 NONE
CTRL-F7 NONE
CTRL-F8 NONE
CTRL-F9 NONE
CTRL-F10 NONE
CTRL-1 MULTIACTIONBAR4BUTTON1
CTRL-2 MULTIACTIONBAR4BUTTON2
CTRL-3 MULTIACTIONBAR4BUTTON3
CTRL-4 MULTIACTIONBAR4BUTTON4
CTRL-5 MULTIACTIONBAR4BUTTON5
CTRL-6 NONE
CTRL-7 NONE
CTRL-8 NONE
CTRL-9 NONE
CTRL-0 NONE
SHIFT-1 MULTIACTIONBAR1BUTTON1
SHIFT-2 MULTIACTIONBAR1BUTTON2
SHIFT-3 MULTIACTIONBAR1BUTTON3
SHIFT-4 MULTIACTIONBAR1BUTTON4
SHIFT-5 MULTIACTIONBAR1BUTTON5
SHIFT-6 NONE
SHIFT-UP NONE
SHIFT-MOUSEWHEELUP BONUSACTIONBUTTON1
SHIFT-DOWN NONE
SHIFT-MOUSEWHEELDOWN BONUSACTIONBUTTON2
TAB MULTIACTIONBAR1BUTTON9
F1 NONE
SHIFT-F1 NONE
F2 NONE
F3 NONE
F4 NONE
F5 NONE
SHIFT-F2 NONE
SHIFT-F3 NONE
SHIFT-F4 NONE
SHIFT-F5 NONE
G MULTIACTIONBAR2BUTTON11
F MULTIACTIONBAR1BUTTON7
V MULTIACTIONBAR2BUTTON6
SHIFT-V ACTIONBUTTON10
T MULTIACTIONBAR1BUTTON6
SHIFT-T MULTIACTIONBAR3BUTTON8
C MULTIACTIONBAR2BUTTON7
B OPENALLBAGS
SHIFT-B NONE
F8 NONE
F9 NONE
F10 NONE
F11 NONE
F12 NONE
SHIFT-I NONE
SHIFT-SPACE MULTIACTIONBAR2BUTTON10
Y MULTIACTIONBAR4BUTTON6
H ACTIONBUTTON8
NUMPADPLUS NONE
NUMPADMINUS NONE
CTRL-= NONE
CTRL-- NONE
CTRL-Q ACTIONBUTTON11
CTRL-E ACTIONBUTTON12
SHIFT-C MULTIACTIONBAR1BUTTON10
NUMPAD5 NONE
< ACTIONBUTTON7
SHIFT-H ACTIONBUTTON9
ALT-1 MULTIACTIONBAR2BUTTON1
ALT-2 MULTIACTIONBAR2BUTTON2
SHIFT-W MULTIACTIONBAR2BUTTON3
BUTTON5 MULTIACTIONBAR2BUTTON5
^ MULTIACTIONBAR2BUTTON8
SHIFT-BUTTON5 MULTIACTIONBAR2BUTTON12
SHIFT-F MULTIACTIONBAR2BUTTON9
SHIFT-Q MULTIACTIONBAR3BUTTON12
SHIFT-X NONE
SHIFT-BUTTON3 MULTIACTIONBAR3BUTTON9
ALT-V NAMEPLATES
SHIFT-E NONE
# TOGGLEWORLDSTATESCORES
]]

local function Setup_Bindings()
	for key, command in gmatch(Bindings, '(%S+) (%S+)') do
		SetBinding(key, command ~= 'NONE' and command or nil)
	end

	SaveBindings(GetCurrentBindingSet())
end

local function Setup_LuckyoneDB()
	local profile = Private.Addon.db.profile
	profile.damageMeter.enable = true
	profile.damageMeter.resetOnLogout = true
	profile.disabledFrames.AlertFrame = true
	profile.disabledFrames.BossBanner = true
	profile.disabledFrames.TalkingHead = true
	profile.map.minimap.buttons.enable = true
	profile.map.worldMap.fog.enable = true
	profile.misc.combatLogging.enable = true
	profile.misc.combatText.enable = true
	profile.misc.copyChat.enable = true
	profile.misc.copyChat.sizing = 'BUTTON'
	profile.misc.dataTextsTweaks = true
	profile.misc.friendsList.enable = true
	profile.misc.mailbox.enable = true
	profile.misc.objectiveTracker.enable = true
	profile.misc.removeNameplateRealm = true
	profile.movableFrames.enable = true
	profile.nameplates.absorbTextureEnable = true
	profile.nameplates.focusTextureEnable = true
	profile.nameplates.healAbsorbTextureEnable = true
	profile.nameplates.targetTextureEnable = true
	profile.qualityOfLife.easyDelete = true
	profile.qualityOfLife.expandMerchant = true
	profile.qualityOfLife.fasterLoot = true
	profile.qualityOfLife.privacyOverlay = true
	profile.unitframes.absorbTextureEnable = true
	profile.unitframes.healAbsorbTextureEnable = true

	-- Every skin enabled
	for key, value in pairs(profile.skins) do
		if type(value) == 'table' then
			for name in pairs(value) do
				value[name] = true
			end
		else
			profile.skins[key] = true
		end
	end
end

-- Other addons
local function Setup_Addons()
	local AceAddon = LibStub('AceAddon-3.0')

	local attune = _G.Attune_DB
	if attune then
		attune.height = 825
		attune.showList = false
		attune.showOtherChat = false
		attune.showResponses = false
		attune.width = 1495
	end

	local auctionator = _G.AUCTIONATOR_CONFIG
	if auctionator then
		auctionator.auction_duration = 12
		auctionator.autoscan_2 = true
		auctionator.autoscan_interval = 120
		auctionator.default_tab = 2
		auctionator.gear_vendor_price_multiplier = 1.1
		auctionator.selling_icon_size_2 = 36
		auctionator.undercut_items_ahead = 1
		auctionator.undercut_percentage = 3
		auctionator.vendor_tooltips = false
	end

	local baganator = _G.BAGANATOR_CONFIG
	if baganator then
		-- Closing the welcome dialog resets the bag positions
		local welcome = _G.Baganator_WelcomeFrame
		if welcome then
			welcome:Hide()
		end

		local bags = baganator.Profiles.DEFAULT
		bags.bag_icon_size = 36
		bags.bag_view_position = { 'BOTTOMRIGHT', -1, 495 }
		bags.bag_view_type = 'single'
		bags.bank_view_position = { 'BOTTOMLEFT', 1484, 816 }
		bags.bank_view_type = 'single'
		bags.bank_view_width = 12
		bags.sort_ignore_slots_at_end = true
		bags.sort_start_at_bottom = true
	end

	local bugSack = _G.BugSackDB
	if bugSack then
		bugSack.altwipe = true
		bugSack.mute = true
	end

	local handyNotes = AceAddon:GetAddon('HandyNotes', true)
	if handyNotes then
		handyNotes.db.profile.icon_scale = 1.25
	end

	local handyNotesForever = AceAddon:GetAddon('HandyNotes_WoWForever', true)
	if handyNotesForever then
		local notes = handyNotesForever.db.profile
		notes.icon_item = true
		notes.show_npcs_filter = 'all'
		notes.show_on_minimap = true
		notes.show_treasure_filter = 'all'
		notes.tooltip_questid = true
	end

	local instanceTracker = AceAddon:GetAddon('NovaInstanceTracker', true)
	if instanceTracker then
		instanceTracker.db.global.timeStampFormat = 24
	end

	local syndicator = _G.SYNDICATOR_CONFIG
	if syndicator then
		syndicator.show_blank_line_before_inventory = true
		syndicator.show_character_race_icons = false
		syndicator.show_guild_banks_in_tooltips = false
		syndicator.tooltips_character_limit = 10
		syndicator.tooltips_faction_only = true
		syndicator.tooltips_sort_by_name = true
	end

	local waypoint = _G.WaypointDB_Global
	if waypoint then
		waypoint.AlwaysShow = true
		waypoint.BackgroundPreview = false
		waypoint.CustomMapPinsEnabled = true
		waypoint.fontPath = LSM:Fetch('font', Private.Font)
		waypoint.PinpointFontFlags = 2
		waypoint.PinpointInfo = false
		waypoint.WaypointDistanceSubtextAlpha = 1
		waypoint.WaypointDistanceTextAlpha = 1
		waypoint.WaypointDistanceTextFontFlags = 2
		waypoint.WaypointScale = 0.8
		waypoint.WaypointScaleMax = 1.5
	end
end

-- Undocumented on purpose, the Forever characters are not in Personal.lua yet
function Private:Oneshot()
	if InCombatLockdown() then return end

	Private.itsLuckyone = true
	Private.Addon.db.global.dev = true

	Private:SyncSettings()
	Private:Setup_CVars(true)
	Setup_Bindings()

	Private:Setup_Layout('healing', nil, 'horizontal')
	Private:Setup_Layout('main')
	Private:Setup_Filters()
	Private:Setup_Chat()

	Setup_LuckyoneDB()
	Setup_Addons()

	C_UI.Reload()
end
