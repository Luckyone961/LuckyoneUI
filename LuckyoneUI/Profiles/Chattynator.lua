-- Addon namespace
local _, Private = ...
local L = Private.Libs.ACL

-- Global environment
local _G = _G

local function SetElvDB()
	if not Private.ElvUI then return end
	ElvUI[1].private.chat.enable = false
end

-- Chattynator profile
function Private:Setup_Chattynator()
	if not Private.IsAddOnLoaded('Chattynator') then Private:Print('Chattynator ' .. L["is not installed or enabled."]) return end

	-- 1080p
	local scaled = Private.Addon.db.global.scaled

	local DB = _G.CHATTYNATOR_CONFIG.Profiles.DEFAULT
	DB = DB or {}

	-- General settings
	DB.button_position = 'outside_tabs'
	DB.class_colors = true
	DB.copy_timestamps = true
	DB.edit_box_position = 'top'
	DB.enable_message_fade = false
	DB.enable_smooth_scrolling_combat = false
	DB.force_tab_overflow = false
	DB.keep_edit_box_visible = false
	DB.line_spacing_2 = 0
	DB.link_urls = true
	DB.locked = true
	DB.message_font = Private.Font -- Expressway
	DB.message_font_outline = 'thin'
	DB.message_font_size = 12
	DB.message_spacing = 1
	DB.new_whisper_new_tab = 0
	DB.reduce_redundant_text = true
	DB.shorten_format = 'letter'
	DB.show_buttons = 'never'
	DB.show_combat_log = true
	DB.show_font_shadow = false
	DB.show_tabs_1 = 'always'
	DB.show_timestamp_separator = false
	DB.store_messages = true
	DB.tab_flash_on = 'whispers'
	DB.timestamp_format = '%H:%M'
	DB.whisper_sounds = 'all'

	-- Tabs
	DB.windows = {
		{
			["position"] = {
				"TOPLEFT",
				"UIParent",
				"TOPLEFT",
				2, -- X Offset
				(scaled and -910) or -1232, -- Y Offset
			},
			["tabs"] = {
				{
					["tabColor"] = "06a1ff",
					["channels"] = {
					},
					["whispersTemp"] = {
					},
					["addons"] = {
					},
					["isTemporary"] = false,
					["invert"] = true,
					["name"] = "Main",
					["groups"] = {
						["OPENING"] = false,
						["PET_BATTLE_COMBAT_LOG"] = false,
						["COMBAT_XP_GAIN"] = false,
						["COMBAT_MISC_INFO"] = false,
						["VOICE_TEXT"] = false,
						["PET_INFO"] = false,
						["TRADESKILLS"] = false,
					},
					["backgroundColor"] = "0D0D0D",
					["filters"] = {
					},
				},
				{
					["tabColor"] = "c97c48",
					["channels"] = {
					},
					["whispersTemp"] = {
					},
					["custom"] = "combat_log",
					["name"] = "Log",
					["isTemporary"] = false,
					["groups"] = {
					},
					["addons"] = {
					},
					["backgroundColor"] = "0D0D0D",
					["filters"] = {
					},
				},
				{
					["tabColor"] = "b5926c",
					["channels"] = {
					},
					["whispersTemp"] = {
					},
					["name"] = "Whisper",
					["isTemporary"] = false,
					["groups"] = {
						["BN_WHISPER"] = true,
						["WHISPER"] = true,
						["IGNORED"] = true,
					},
					["addons"] = {
					},
					["backgroundColor"] = "0D0D0D",
					["filters"] = {
					},
				},
				{
					["tabColor"] = "b5926c",
					["channels"] = {
					},
					["whispersTemp"] = {
					},
					["name"] = "Guild",
					["isTemporary"] = false,
					["groups"] = {
						["GUILD_ACHIEVEMENT"] = true,
						["OFFICER"] = true,
						["GUILD"] = true,
					},
					["addons"] = {
					},
					["backgroundColor"] = "0D0D0D",
					["filters"] = {
					},
				},
				{
					["tabColor"] = "b5926c",
					["channels"] = {
					},
					["whispersTemp"] = {
					},
					["name"] = "Party",
					["isTemporary"] = false,
					["groups"] = {
						["PARTY"] = true,
						["PARTY_LEADER"] = true,
						["RAID"] = true,
						["INSTANCE_CHAT_LEADER"] = true,
						["RAID_WARNING"] = true,
						["INSTANCE_CHAT"] = true,
						["SYSTEM"] = true,
						["RAID_LEADER"] = true,
					},
					["addons"] = {
					},
					["backgroundColor"] = "0D0D0D",
					["filters"] = {
					},
				},
			},
			["size"] = {
				(scaled and 432) or 482, -- Width
				(scaled and 168) or 206, -- Height
			},
		},
	}

	Private:Print(L["Chattynator profile has been set."])

	SetElvDB()
end
