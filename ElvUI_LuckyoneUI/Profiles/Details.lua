local L1UI, E, L, V, P, G = unpack(select(2, ...))

-- Details Profile
function L1UI:GetDetailsProfile()

	-- Profile Names
	local Retail, TBC, Classic = "Luckyone", "Luckyone TBC", "Luckyone Classic"

	if L1UI.Retail then

		-- Create profile if it doesn't exist yet
		_detalhes_global["__profiles"][Retail] = _detalhes_global["__profiles"][Retail] or {}

		-- Profile db
		_detalhes_global["__profiles"][Retail] = {
			["show_arena_role_icon"] = false,
			["capture_real"] = {
				["heal"] = true,
				["spellcast"] = true,
				["miscdata"] = true,
				["aura"] = true,
				["energy"] = true,
				["damage"] = true,
			},
			["row_fade_in"] = {
				"in", -- [1]
				0.2, -- [2]
			},
			["streamer_config"] = {
				["faster_updates"] = false,
				["quick_detection"] = false,
				["reset_spec_cache"] = false,
				["no_alerts"] = false,
				["disable_mythic_dungeon"] = false,
				["use_animation_accel"] = true,
			},
			["all_players_are_group"] = false,
			["use_row_animations"] = true,
			["report_heal_links"] = false,
			["remove_realm_from_name"] = true,
			["minimum_overall_combat_time"] = 10,
			["event_tracker"] = {
				["enabled"] = false,
				["font_color"] = {
					1, -- [1]
					1, -- [2]
					1, -- [3]
					1, -- [4]
				},
				["line_height"] = 16,
				["line_color"] = {
					0.1, -- [1]
					0.1, -- [2]
					0.1, -- [3]
					0.3, -- [4]
				},
				["font_shadow"] = "NONE",
				["font_size"] = 10,
				["font_face"] = "Friz Quadrata TT",
				["frame"] = {
					["show_title"] = true,
					["strata"] = "LOW",
					["backdrop_color"] = {
						0.16, -- [1]
						0.16, -- [2]
						0.16, -- [3]
						0.47, -- [4]
					},
					["locked"] = false,
					["height"] = 300,
					["width"] = 250,
				},
				["line_texture"] = "Details Serenity",
				["options_frame"] = {
				},
			},
			["report_to_who"] = "",
			["class_specs_coords"] = {},
			["profile_save_pos"] = true,
			["tooltip"] = {
				["header_statusbar"] = {
					0.3, -- [1]
					0.3, -- [2]
					0.3, -- [3]
					0.8, -- [4]
					false, -- [5]
					false, -- [6]
					"WorldState Score", -- [7]
				},
				["fontcolor_right"] = {
					1, -- [1]
					0.7, -- [2]
					0, -- [3]
					1, -- [4]
				},
				["line_height"] = 17,
				["tooltip_max_targets"] = 2,
				["icon_size"] = {
					["W"] = 17,
					["H"] = 17,
				},
				["tooltip_max_pets"] = 2,
				["anchor_relative"] = "top",
				["abbreviation"] = 2,
				["anchored_to"] = 1,
				["show_amount"] = false,
				["header_text_color"] = {
					1, -- [1]
					0.9176, -- [2]
					0, -- [3]
					1, -- [4]
				},
				["fontsize"] = 10,
				["background"] = {
					0.196, -- [1]
					0.196, -- [2]
					0.196, -- [3]
					0.8, -- [4]
				},
				["submenu_wallpaper"] = true,
				["fontsize_title"] = 10,
				["fontcolor"] = {
					1, -- [1]
					1, -- [2]
					1, -- [3]
					1, -- [4]
				},
				["commands"] = {
				},
				["tooltip_max_abilities"] = 6,
				["fontface"] = "Friz Quadrata TT",
				["border_color"] = {
					0, -- [1]
					0, -- [2]
					0, -- [3]
					1, -- [4]
				},
				["border_texture"] = "Details BarBorder 3",
				["anchor_offset"] = {
					0, -- [1]
					0, -- [2]
				},
				["menus_bg_texture"] = "Interface\\SPELLBOOK\\Spellbook-Page-1",
				["maximize_method"] = 1,
				["border_size"] = 14,
				["fontshadow"] = false,
				["anchor_screen_pos"] = {
					507.7, -- [1]
					-350.5, -- [2]
				},
				["anchor_point"] = "bottom",
				["menus_bg_coords"] = {
					0.309777336120606, -- [1]
					0.924000015258789, -- [2]
					0.213000011444092, -- [3]
					0.279000015258789, -- [4]
				},
				["icon_border_texcoord"] = {
					["R"] = 0.921875,
					["L"] = 0.078125,
					["T"] = 0.078125,
					["B"] = 0.921875,
				},
				["menus_bg_color"] = {
					0.8, -- [1]
					0.8, -- [2]
					0.8, -- [3]
					0.2, -- [4]
				},
			},
			["ps_abbreviation"] = 3,
			["world_combat_is_trash"] = false,
			["update_speed"] = 0.05000000074505806,
			["bookmark_text_size"] = 11,
			["animation_speed_mintravel"] = 0.45,
			["track_item_level"] = true,
			["windows_fade_in"] = {
				"in", -- [1]
				0.2, -- [2]
			},
			["instances_menu_click_to_open"] = false,
			["overall_clear_newchallenge"] = false,
			["current_dps_meter"] = {
				["enabled"] = false,
				["font_color"] = {
					1, -- [1]
					1, -- [2]
					1, -- [3]
					1, -- [4]
				},
				["arena_enabled"] = true,
				["font_shadow"] = "NONE",
				["font_size"] = 18,
				["mythic_dungeon_enabled"] = true,
				["sample_size"] = 5,
				["font_face"] = "Friz Quadrata TT",
				["frame"] = {
					["show_title"] = false,
					["strata"] = "LOW",
					["backdrop_color"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						0.2, -- [4]
					},
					["locked"] = false,
					["height"] = 65,
					["width"] = 220,
				},
				["update_interval"] = 0.3,
				["options_frame"] = {
				},
			},
			["data_cleanup_logout"] = false,
			["instances_disable_bar_highlight"] = false,
			["trash_concatenate"] = false,
			["color_by_arena_team"] = true,
			["animation_speed"] = 33,
			["disable_stretch_from_toolbar"] = false,
			["disable_lock_ungroup_buttons"] = true,
			["memory_ram"] = 64,
			["disable_window_groups"] = false,
			["instances_suppress_trash"] = 0,
			["time_type_original"] = 2,
			["options_window"] = {
				["scale"] = 1,
			},
			["animation_speed_maxtravel"] = 3,
			["default_bg_alpha"] = 0.5,
			["time_type"] = 2,
			["font_faces"] = {
				["menus"] = "Expressway",
			},
			["death_tooltip_width"] = 350,
			["animate_scroll"] = false,
			["instances"] = {
				{
					["__pos"] = {
						["normal"] = {
							["y"] = -461.4999465942383,
							["x"] = 649.5015869140625,
							["w"] = 205.0004730224609,
							["h"] = 155.0001068115234,
						},
						["solo"] = {
							["y"] = 2,
							["x"] = 1,
							["w"] = 300,
							["h"] = 200,
						},
					},
					["hide_in_combat_type"] = 1,
					["clickthrough_window"] = false,
					["menu_anchor"] = {
						16, -- [1]
						0, -- [2]
						["side"] = 2,
					},
					["bg_r"] = 0.09411764705882353,
					["hide_out_of_combat"] = false,
					["color_buttons"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["toolbar_icon_file"] = "Interface\\AddOns\\Details\\images\\toolbar_icons_2",
					["skin_custom"] = "",
					["fontstrings_width"] = 35,
					["tooltip"] = {
						["n_abilities"] = 3,
						["n_enemies"] = 3,
					},
					["switch_all_roles_in_combat"] = false,
					["clickthrough_toolbaricons"] = false,
					["attribute_text"] = {
						["show_timer"] = false,
						["shadow"] = false,
						["side"] = 1,
						["text_color"] = {
							1, -- [1]
							1, -- [2]
							1, -- [3]
							1, -- [4]
						},
						["custom_text"] = "{name}",
						["text_face"] = "Expressway",
						["anchor"] = {
							-18, -- [1]
							3, -- [2]
						},
						["enabled"] = true,
						["enable_custom_text"] = false,
						["text_size"] = 10,
					},
					["ignore_mass_showhide"] = false,
					["switch_all_roles_after_wipe"] = false,
					["menu_icons"] = {
						false, -- [1]
						true, -- [2]
						false, -- [3]
						true, -- [4]
						true, -- [5]
						false, -- [6]
						["space"] = 0,
						["shadow"] = false,
					},
					["desaturated_menu"] = false,
					["micro_displays_side"] = 2,
					["window_scale"] = 1,
					["hide_icon"] = true,
					["toolbar_side"] = 1,
					["bg_g"] = 0.09411764705882353,
					["menu_icons_alpha"] = 0.5,
					["bg_b"] = 0.09411764705882353,
					["switch_healer_in_combat"] = false,
					["color"] = {
						0.07058823529411765, -- [1]
						0.07058823529411765, -- [2]
						0.07058823529411765, -- [3]
						0, -- [4]
					},
					["hide_on_context"] = {
						{
							["enabled"] = false,
							["inverse"] = false,
							["value"] = 100,
						}, -- [1]
						{
							["enabled"] = false,
							["inverse"] = false,
							["value"] = 100,
						}, -- [2]
						{
							["enabled"] = false,
							["inverse"] = false,
							["value"] = 100,
						}, -- [3]
						{
							["enabled"] = false,
							["inverse"] = false,
							["value"] = 100,
						}, -- [4]
						{
							["enabled"] = false,
							["inverse"] = false,
							["value"] = 100,
						}, -- [5]
						{
							["enabled"] = false,
							["inverse"] = false,
							["value"] = 100,
						}, -- [6]
						{
							["enabled"] = false,
							["inverse"] = false,
							["value"] = 100,
						}, -- [7]
						{
							["enabled"] = false,
							["inverse"] = false,
							["value"] = 100,
						}, -- [8]
						{
							["enabled"] = false,
							["inverse"] = false,
							["value"] = 100,
						}, -- [9]
						{
							["enabled"] = false,
							["inverse"] = false,
							["value"] = 100,
						}, -- [10]
						{
							["enabled"] = false,
							["inverse"] = false,
							["value"] = 100,
						}, -- [11]
						{
							["enabled"] = false,
							["inverse"] = false,
							["value"] = 100,
						}, -- [12]
						{
							["enabled"] = false,
							["inverse"] = false,
							["value"] = 100,
						}, -- [13]
						{
							["enabled"] = false,
							["inverse"] = false,
							["value"] = 100,
						}, -- [14]
						{
							["enabled"] = false,
							["inverse"] = false,
							["value"] = 100,
						}, -- [15]
					},
					["skin"] = "Minimalistic",
					["following"] = {
						["enabled"] = true,
						["bar_color"] = {
							1, -- [1]
							1, -- [2]
							1, -- [3]
						},
						["text_color"] = {
							1, -- [1]
							1, -- [2]
							1, -- [3]
						},
					},
					["switch_healer"] = false,
					["fontstrings_text2_anchor"] = 70,
					["__snapV"] = false,
					["__snapH"] = false,
					["StatusBarSaved"] = {
						["center"] = "DETAILS_STATUSBAR_PLUGIN_CLOCK",
						["right"] = "DETAILS_STATUSBAR_PLUGIN_PDPS",
						["options"] = {
							["DETAILS_STATUSBAR_PLUGIN_PDPS"] = {
								["textColor"] = {
									1, -- [1]
									1, -- [2]
									1, -- [3]
									1, -- [4]
								},
								["segmentType"] = 2,
								["textFace"] = "Accidental Presidency",
								["maxSectionIds"] = 17,
								["textAlign"] = 3,
								["timeType"] = 1,
								["textSize"] = 10,
								["textYMod"] = 1,
							},
							["DETAILS_STATUSBAR_PLUGIN_PSEGMENT"] = {
								["textColor"] = {
									1, -- [1]
									1, -- [2]
									1, -- [3]
									1, -- [4]
								},
								["segmentType"] = 2,
								["textFace"] = "Accidental Presidency",
								["maxSectionIds"] = 17,
								["textAlign"] = 1,
								["timeType"] = 1,
								["textSize"] = 10,
								["textYMod"] = 1,
							},
							["DETAILS_STATUSBAR_PLUGIN_CLOCK"] = {
								["textColor"] = {
									1, -- [1]
									1, -- [2]
									1, -- [3]
									1, -- [4]
								},
								["segmentType"] = 2,
								["textFace"] = "Accidental Presidency",
								["maxSectionIds"] = 17,
								["textAlign"] = 2,
								["timeType"] = 1,
								["textSize"] = 10,
								["textYMod"] = 1,
							},
						},
						["left"] = "DETAILS_STATUSBAR_PLUGIN_PSEGMENT",
					},
					["grab_on_top"] = false,
					["__was_opened"] = true,
					["instance_button_anchor"] = {
						-27, -- [1]
						1, -- [2]
					},
					["bg_alpha"] = 0,
					["fontstrings_text4_anchor"] = 0,
					["__locked"] = true,
					["menu_alpha"] = {
						["enabled"] = false,
						["onleave"] = 1,
						["ignorebars"] = false,
						["iconstoo"] = true,
						["onenter"] = 1,
					},
					["auto_hide_menu"] = {
						["left"] = false,
						["right"] = false,
					},
					["row_show_animation"] = {
						["anim"] = "Fade",
						["options"] = {
						},
					},
					["fontstrings_text3_anchor"] = 35,
					["strata"] = "LOW",
					["clickthrough_incombatonly"] = false,
					["__snap"] = {
						[3] = 2,
					},
					["stretch_button_side"] = 1,
					["hide_in_combat_alpha"] = 0,
					["row_info"] = {
						["textR_outline"] = true,
						["spec_file"] = "Interface\\AddOns\\Details\\images\\spec_icons_normal",
						["textL_outline"] = true,
						["textR_outline_small"] = false,
						["textR_show_data"] = {
							true, -- [1]
							true, -- [2]
							false, -- [3]
						},
						["percent_type"] = 1,
						["fixed_text_color"] = {
							1, -- [1]
							1, -- [2]
							1, -- [3]
						},
						["space"] = {
							["right"] = 0,
							["left"] = 0,
							["between"] = 0,
						},
						["texture_background_class_color"] = false,
						["textL_outline_small_color"] = {
							0, -- [1]
							0, -- [2]
							0, -- [3]
							1, -- [4]
						},
						["font_face_file"] = "Interface\\AddOns\\ElvUI\\Media\\Fonts\\Expressway.ttf",
						["backdrop"] = {
							["enabled"] = false,
							["texture"] = "Details BarBorder 2",
							["color"] = {
								1, -- [1]
								1, -- [2]
								1, -- [3]
								1, -- [4]
							},
							["size"] = 10,
						},
						["models"] = {
							["upper_model"] = "Spells\\AcidBreath_SuperGreen.M2",
							["lower_model"] = "World\\EXPANSION02\\DOODADS\\Coldarra\\COLDARRALOCUS.m2",
							["upper_alpha"] = 0.5,
							["lower_enabled"] = false,
							["lower_alpha"] = 0.1,
							["upper_enabled"] = false,
						},
						["textL_translit_text"] = false,
						["texture_custom_file"] = "Interface\\",
						["texture_file"] = "Interface\\AddOns\\ElvUI\\Media\\Textures\\Minimalist",
						["textR_bracket"] = "(",
						["font_size"] = 11,
						["icon_file"] = "Interface\\AddOns\\Details\\images\\classes_small",
						["icon_grayscale"] = false,
						["textL_custom_text"] = "{data1}. {data3}{data2}",
						["use_spec_icons"] = true,
						["textR_enable_custom_text"] = false,
						["textL_enable_custom_text"] = false,
						["fixed_texture_color"] = {
							0, -- [1]
							0, -- [2]
							0, -- [3]
						},
						["textL_show_number"] = false,
						["texture_custom"] = "",
						["texture_highlight"] = "Interface\\FriendsFrame\\UI-FriendsList-Highlight",
						["textR_custom_text"] = "{data1} ({data2}, {data3}%)",
						["texture"] = "Minimalist",
						["start_after_icon"] = false,
						["texture_background_file"] = "Interface\\AddOns\\ElvUI\\Media\\Textures\\Minimalist",
						["textL_class_colors"] = false,
						["alpha"] = 1,
						["texture_background"] = "Minimalist",
						["textR_class_colors"] = false,
						["textR_outline_small_color"] = {
							0, -- [1]
							0, -- [2]
							0, -- [3]
							1, -- [4]
						},
						["no_icon"] = false,
						["icon_offset"] = {
							0, -- [1]
							0, -- [2]
						},
						["fixed_texture_background_color"] = {
							0, -- [1]
							0, -- [2]
							0, -- [3]
							0.150228589773178, -- [4]
						},
						["font_face"] = "Expressway",
						["texture_class_colors"] = true,
						["textL_outline_small"] = false,
						["fast_ps_update"] = true,
						["textR_separator"] = "NONE",
						["height"] = 17,
					},
					["show_statusbar"] = false,
					["libwindow"] = {
						["y"] = 0.9999418258666992,
						["x"] = -207.998046875,
						["point"] = "BOTTOMRIGHT",
						["scale"] = 1,
					},
					["statusbar_info"] = {
						["alpha"] = 0,
						["overlay"] = {
							0.07058823529411765, -- [1]
							0.07058823529411765, -- [2]
							0.07058823529411765, -- [3]
						},
					},
					["backdrop_texture"] = "Details Ground",
					["bars_grow_direction"] = 1,
					["switch_damager"] = false,
					["switch_tank_in_combat"] = false,
					["bars_inverted"] = false,
					["switch_damager_in_combat"] = false,
					["icon_desaturated"] = false,
					["bars_sort_direction"] = 1,
					["auto_current"] = true,
					["menu_anchor_down"] = {
						16, -- [1]
						-3, -- [2]
					},
					["clickthrough_rows"] = false,
					["version"] = 3,
					["hide_in_combat"] = false,
					["posicao"] = {
						["normal"] = {
							["y"] = -461.4999465942383,
							["x"] = 649.5015869140625,
							["w"] = 205.0004730224609,
							["h"] = 155.0001068115234,
						},
						["solo"] = {
							["y"] = 2,
							["x"] = 1,
							["w"] = 300,
							["h"] = 200,
						},
					},
					["switch_tank"] = false,
					["plugins_grow_direction"] = 1,
					["wallpaper"] = {
						["enabled"] = false,
						["texture"] = "Interface\\AddOns\\Details\\images\\background",
						["texcoord"] = {
							0, -- [1]
							1, -- [2]
							0, -- [3]
							0.7, -- [4]
						},
						["overlay"] = {
							1, -- [1]
							1, -- [2]
							1, -- [3]
							1, -- [4]
						},
						["anchor"] = "all",
						["height"] = 114.042518615723,
						["alpha"] = 0.5,
						["width"] = 283.000183105469,
					},
					["total_bar"] = {
						["enabled"] = false,
						["only_in_group"] = false,
						["icon"] = "Interface\\ICONS\\INV_Sigil_Thorim",
						["color"] = {
							1, -- [1]
							1, -- [2]
							1, -- [3]
						},
					},
					["show_sidebars"] = false,
					["micro_displays_locked"] = true,
					["use_multi_fontstrings"] = false,
					["menu_icons_size"] = 0.8500000238418579,
				}, -- [1]
				{
					["__pos"] = {
						["normal"] = {
							["y"] = -461.4999465942383,
							["x"] = 854.5023193359375,
							["w"] = 205.0004730224609,
							["h"] = 155.0001068115234,
						},
						["solo"] = {
							["y"] = 2,
							["x"] = 1,
							["w"] = 300,
							["h"] = 200,
						},
					},
					["hide_in_combat_type"] = 1,
					["clickthrough_window"] = false,
					["menu_anchor"] = {
						16, -- [1]
						0, -- [2]
						["side"] = 2,
					},
					["bg_r"] = 0.09411764705882353,
					["hide_out_of_combat"] = false,
					["color_buttons"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["toolbar_icon_file"] = "Interface\\AddOns\\Details\\images\\toolbar_icons_2",
					["micro_displays_locked"] = true,
					["fontstrings_width"] = 35,
					["tooltip"] = {
						["n_abilities"] = 3,
						["n_enemies"] = 3,
					},
					["switch_all_roles_in_combat"] = false,
					["clickthrough_toolbaricons"] = false,
					["row_info"] = {
						["textR_outline"] = true,
						["spec_file"] = "Interface\\AddOns\\Details\\images\\spec_icons_normal",
						["textL_outline"] = true,
						["textR_outline_small"] = false,
						["textR_show_data"] = {
							true, -- [1]
							true, -- [2]
							false, -- [3]
						},
						["percent_type"] = 1,
						["fixed_text_color"] = {
							1, -- [1]
							1, -- [2]
							1, -- [3]
						},
						["space"] = {
							["right"] = 0,
							["left"] = 0,
							["between"] = 0,
						},
						["texture_background_class_color"] = false,
						["textL_outline_small_color"] = {
							0, -- [1]
							0, -- [2]
							0, -- [3]
							1, -- [4]
						},
						["font_face_file"] = "Interface\\AddOns\\ElvUI\\Media\\Fonts\\Expressway.ttf",
						["backdrop"] = {
							["enabled"] = false,
							["texture"] = "Details BarBorder 2",
							["color"] = {
								1, -- [1]
								1, -- [2]
								1, -- [3]
								1, -- [4]
							},
							["size"] = 12,
						},
						["models"] = {
							["upper_model"] = "Spells\\AcidBreath_SuperGreen.M2",
							["lower_model"] = "World\\EXPANSION02\\DOODADS\\Coldarra\\COLDARRALOCUS.m2",
							["upper_alpha"] = 0.5,
							["lower_enabled"] = false,
							["lower_alpha"] = 0.1,
							["upper_enabled"] = false,
						},
						["textL_translit_text"] = false,
						["texture_custom_file"] = "Interface\\",
						["texture_file"] = "Interface\\AddOns\\ElvUI\\Media\\Textures\\Minimalist",
						["textR_bracket"] = "(",
						["font_size"] = 11,
						["icon_file"] = "Interface\\AddOns\\Details\\images\\classes_small",
						["icon_grayscale"] = false,
						["textL_custom_text"] = "{data1}. {data3}{data2}",
						["use_spec_icons"] = true,
						["textR_enable_custom_text"] = false,
						["textL_enable_custom_text"] = false,
						["fixed_texture_color"] = {
							0, -- [1]
							0, -- [2]
							0, -- [3]
						},
						["textL_show_number"] = false,
						["texture_custom"] = "",
						["texture_highlight"] = "Interface\\FriendsFrame\\UI-FriendsList-Highlight",
						["textR_custom_text"] = "{data1} ({data2}, {data3}%)",
						["texture"] = "Minimalist",
						["start_after_icon"] = false,
						["texture_background_file"] = "Interface\\AddOns\\ElvUI\\Media\\Textures\\Minimalist",
						["textL_class_colors"] = false,
						["alpha"] = 1,
						["texture_background"] = "Minimalist",
						["textR_class_colors"] = false,
						["textR_outline_small_color"] = {
							0, -- [1]
							0, -- [2]
							0, -- [3]
							1, -- [4]
						},
						["no_icon"] = false,
						["icon_offset"] = {
							0, -- [1]
							0, -- [2]
						},
						["fixed_texture_background_color"] = {
							0, -- [1]
							0, -- [2]
							0, -- [3]
							0.150228589773178, -- [4]
						},
						["font_face"] = "Expressway",
						["texture_class_colors"] = true,
						["textL_outline_small"] = false,
						["fast_ps_update"] = false,
						["textR_separator"] = "NONE",
						["height"] = 17.16361999511719,
					},
					["switch_tank"] = false,
					["plugins_grow_direction"] = 1,
					["menu_icons"] = {
						false, -- [1]
						true, -- [2]
						false, -- [3]
						true, -- [4]
						true, -- [5]
						false, -- [6]
						["space"] = 0,
						["shadow"] = false,
					},
					["desaturated_menu"] = false,
					["micro_displays_side"] = 2,
					["window_scale"] = 1,
					["hide_icon"] = true,
					["toolbar_side"] = 1,
					["bg_g"] = 0.09411764705882353,
					["menu_icons_alpha"] = 0.5,
					["bg_b"] = 0.09411764705882353,
					["switch_healer_in_combat"] = false,
					["color"] = {
						0.07058823529411765, -- [1]
						0.07058823529411765, -- [2]
						0.07058823529411765, -- [3]
						0, -- [4]
					},
					["hide_on_context"] = {
						{
							["enabled"] = false,
							["inverse"] = false,
							["value"] = 100,
						}, -- [1]
						{
							["enabled"] = false,
							["inverse"] = false,
							["value"] = 100,
						}, -- [2]
						{
							["enabled"] = false,
							["inverse"] = false,
							["value"] = 100,
						}, -- [3]
						{
							["enabled"] = false,
							["inverse"] = false,
							["value"] = 100,
						}, -- [4]
						{
							["enabled"] = false,
							["inverse"] = false,
							["value"] = 100,
						}, -- [5]
						{
							["enabled"] = false,
							["inverse"] = false,
							["value"] = 100,
						}, -- [6]
						{
							["enabled"] = false,
							["inverse"] = false,
							["value"] = 100,
						}, -- [7]
						{
							["enabled"] = false,
							["inverse"] = false,
							["value"] = 100,
						}, -- [8]
						{
							["enabled"] = false,
							["inverse"] = false,
							["value"] = 100,
						}, -- [9]
						{
							["enabled"] = false,
							["inverse"] = false,
							["value"] = 100,
						}, -- [10]
						{
							["enabled"] = false,
							["inverse"] = false,
							["value"] = 100,
						}, -- [11]
						{
							["enabled"] = false,
							["inverse"] = false,
							["value"] = 100,
						}, -- [12]
						{
							["enabled"] = false,
							["inverse"] = false,
							["value"] = 100,
						}, -- [13]
						{
							["enabled"] = false,
							["inverse"] = false,
							["value"] = 100,
						}, -- [14]
						{
							["enabled"] = false,
							["inverse"] = false,
							["value"] = 100,
						}, -- [15]
					},
					["skin"] = "Minimalistic",
					["following"] = {
						["bar_color"] = {
							1, -- [1]
							1, -- [2]
							1, -- [3]
						},
						["enabled"] = true,
						["text_color"] = {
							1, -- [1]
							1, -- [2]
							1, -- [3]
						},
					},
					["switch_healer"] = false,
					["fontstrings_text2_anchor"] = 70,
					["__snapV"] = false,
					["__snapH"] = false,
					["StatusBarSaved"] = {
						["center"] = "DETAILS_STATUSBAR_PLUGIN_CLOCK",
						["right"] = "DETAILS_STATUSBAR_PLUGIN_PDPS",
						["options"] = {
							["DETAILS_STATUSBAR_PLUGIN_PDPS"] = {
								["isHidden"] = false,
								["timeType"] = 1,
								["textYMod"] = 1,
								["segmentType"] = 2,
								["textFace"] = "Accidental Presidency",
								["maxSectionIds"] = 19,
								["textAlign"] = 3,
								["textSize"] = 10,
								["textColor"] = {
									1, -- [1]
									1, -- [2]
									1, -- [3]
									1, -- [4]
								},
							},
							["DETAILS_STATUSBAR_PLUGIN_PSEGMENT"] = {
								["isHidden"] = false,
								["segmentType"] = 2,
								["textFace"] = "Accidental Presidency",
								["textColor"] = {
									1, -- [1]
									1, -- [2]
									1, -- [3]
									1, -- [4]
								},
								["textAlign"] = 1,
								["timeType"] = 1,
								["textSize"] = 10,
								["textYMod"] = 1,
							},
							["DETAILS_STATUSBAR_PLUGIN_CLOCK"] = {
								["isHidden"] = false,
								["timeType"] = 1,
								["textYMod"] = 1,
								["segmentType"] = 2,
								["textFace"] = "Accidental Presidency",
								["maxSectionIds"] = 19,
								["textAlign"] = 2,
								["textSize"] = 10,
								["textColor"] = {
									1, -- [1]
									1, -- [2]
									1, -- [3]
									1, -- [4]
								},
							},
						},
						["left"] = "DETAILS_STATUSBAR_PLUGIN_PSEGMENT",
					},
					["grab_on_top"] = false,
					["__was_opened"] = true,
					["instance_button_anchor"] = {
						-27, -- [1]
						1, -- [2]
					},
					["version"] = 3,
					["fontstrings_text4_anchor"] = 0,
					["__locked"] = true,
					["menu_alpha"] = {
						["enabled"] = false,
						["onenter"] = 1,
						["iconstoo"] = true,
						["ignorebars"] = false,
						["onleave"] = 1,
					},
					["switch_all_roles_after_wipe"] = false,
					["row_show_animation"] = {
						["anim"] = "Fade",
						["options"] = {
						},
					},
					["bars_inverted"] = false,
					["strata"] = "LOW",
					["clickthrough_incombatonly"] = false,
					["__snap"] = {
						1, -- [1]
					},
					["stretch_button_side"] = 1,
					["hide_in_combat_alpha"] = 0,
					["bars_sort_direction"] = 1,
					["show_statusbar"] = false,
					["libwindow"] = {
						["y"] = 0.9999418258666992,
						["x"] = -2.99755859375,
						["point"] = "BOTTOMRIGHT",
						["scale"] = 1,
					},
					["statusbar_info"] = {
						["alpha"] = 0,
						["overlay"] = {
							0.07058823529411765, -- [1]
							0.07058823529411765, -- [2]
							0.07058823529411765, -- [3]
						},
					},
					["backdrop_texture"] = "Details Ground",
					["menu_anchor_down"] = {
						16, -- [1]
						-3, -- [2]
					},
					["bg_alpha"] = 0,
					["switch_tank_in_combat"] = false,
					["bars_grow_direction"] = 1,
					["switch_damager_in_combat"] = false,
					["icon_desaturated"] = false,
					["clickthrough_rows"] = false,
					["auto_current"] = true,
					["attribute_text"] = {
						["show_timer"] = false,
						["shadow"] = false,
						["side"] = 1,
						["text_color"] = {
							1, -- [1]
							1, -- [2]
							1, -- [3]
							1, -- [4]
						},
						["custom_text"] = "{name}",
						["text_face"] = "Expressway",
						["anchor"] = {
							-18, -- [1]
							3, -- [2]
						},
						["enabled"] = true,
						["enable_custom_text"] = false,
						["text_size"] = 10,
					},
					["auto_hide_menu"] = {
						["left"] = false,
						["right"] = false,
					},
					["switch_damager"] = false,
					["hide_in_combat"] = false,
					["posicao"] = {
						["normal"] = {
							["y"] = -461.4999465942383,
							["x"] = 854.5023193359375,
							["w"] = 205.0004730224609,
							["h"] = 155.0001068115234,
						},
						["solo"] = {
							["y"] = 2,
							["x"] = 1,
							["w"] = 300,
							["h"] = 200,
						},
					},
					["skin_custom"] = "",
					["ignore_mass_showhide"] = false,
					["wallpaper"] = {
						["enabled"] = false,
						["texture"] = "Interface\\AddOns\\Details\\images\\background",
						["texcoord"] = {
							0, -- [1]
							1, -- [2]
							0, -- [3]
							0.7, -- [4]
						},
						["overlay"] = {
							1, -- [1]
							1, -- [2]
							1, -- [3]
							1, -- [4]
						},
						["anchor"] = "all",
						["height"] = 155.0001068115234,
						["alpha"] = 0.5,
						["width"] = 204.0004730224609,
					},
					["total_bar"] = {
						["enabled"] = false,
						["only_in_group"] = false,
						["icon"] = "Interface\\ICONS\\INV_Sigil_Thorim",
						["color"] = {
							1, -- [1]
							1, -- [2]
							1, -- [3]
						},
					},
					["show_sidebars"] = false,
					["fontstrings_text3_anchor"] = 35,
					["use_multi_fontstrings"] = false,
					["menu_icons_size"] = 0.850000023841858,
				}, -- [2]
			},
			["segments_amount"] = 40,
			["report_lines"] = 5,
			["class_icons_small"] = "Interface\\AddOns\\Details\\images\\classes_small",
			["pvp_as_group"] = true,
			["skin"] = "Dark Theme",
			["override_spellids"] = true,
			["force_activity_time_pvp"] = true,
			["numerical_system"] = 1,
			["player_details_window"] = {
				["scale"] = 1,
				["skin"] = "ElvUI",
				["bar_texture"] = "Skyline",
			},
			["new_window_size"] = {
				["height"] = 158,
				["width"] = 310,
			},
			["overall_clear_logout"] = false,
			["memory_threshold"] = 3,
			["cloud_capture"] = true,
			["damage_taken_everything"] = false,
			["scroll_speed"] = 2,
			["font_sizes"] = {
				["menus"] = 10,
			},
			["chat_tab_embed"] = {
				["enabled"] = false,
				["y_offset"] = 0,
				["x_offset"] = 0,
				["tab_name"] = "",
				["single_window"] = false,
			},
			["deadlog_events"] = 32,
			["overall_flag"] = 16,
			["close_shields"] = false,
			["class_coords"] = {},
			["numerical_system_symbols"] = "auto",
			["disable_alldisplays_window"] = false,
			["standard_skin"] = false,
			["default_bg_color"] = 0.0941,
			["total_abbreviation"] = 2,
			["segments_amount_to_save"] = 40,
			["clear_graphic"] = true,
			["class_colors"] = {},
			["animation_speed_triggertravel"] = 5,
			["options_group_edit"] = true,
			["broadcaster_enabled"] = false,
			["minimap"] = {
				["onclick_what_todo"] = 1,
				["radius"] = 160,
				["hide"] = true,
				["minimapPos"] = 220,
				["text_format"] = 3,
				["text_type"] = 1,
			},
			["instances_amount"] = 3,
			["max_window_size"] = {
				["height"] = 450,
				["width"] = 480,
			},
			["segments_auto_erase"] = 2,
			["only_pvp_frags"] = false,
			["disable_stretch_button"] = true,
			["trash_auto_remove"] = true,
			["hotcorner_topleft"] = {
				["hide"] = false,
			},
			["deny_score_messages"] = false,
			["segments_panic_mode"] = false,
			["windows_fade_out"] = {
				"out", -- [1]
				0.2, -- [2]
			},
			["window_clamp"] = {
				-8, -- [1]
				0, -- [2]
				21, -- [3]
				-14, -- [4]
			},
			["row_fade_out"] = {
				"out", -- [1]
				0.2, -- [2]
			},
			["minimum_combat_time"] = 5,
			["overall_clear_newboss"] = false,
			["use_scroll"] = false,
			["report_schema"] = 1,
			["use_battleground_server_parser"] = false,
			["clear_ungrouped"] = true,
			["disable_reset_button"] = true,
			["data_broker_text"] = "",
			["instances_no_libwindow"] = false,
			["instances_segments_locked"] = true,
			["deadlog_limit"] = 16,
			["overall_clear_newtorghast"] = true,
		}

		-- General db
		_detalhes_global["always_use_profile"] = true
		_detalhes_global["always_use_profile_name"] = Retail

		-- Load the profile
		_detalhes:ApplyProfile(Retail)

	elseif L1UI.TBC then

		-- Create profile if it doesn't exist yet
		_detalhes_global["__profiles"][TBC] = _detalhes_global["__profiles"][TBC] or {}

		-- Profile db
		_detalhes_global["__profiles"][TBC] = {
			["show_arena_role_icon"] = false,
			["capture_real"] = {
				["heal"] = true,
				["spellcast"] = true,
				["miscdata"] = true,
				["aura"] = true,
				["energy"] = true,
				["damage"] = true,
			},
			["row_fade_in"] = {
				"in", -- [1]
				0.2, -- [2]
			},
			["streamer_config"] = {
				["faster_updates"] = false,
				["quick_detection"] = false,
				["reset_spec_cache"] = false,
				["no_alerts"] = false,
				["use_animation_accel"] = true,
				["disable_mythic_dungeon"] = false,
			},
			["all_players_are_group"] = false,
			["use_row_animations"] = true,
			["report_heal_links"] = false,
			["remove_realm_from_name"] = true,
			["minimum_overall_combat_time"] = 10,
			["event_tracker"] = {
				["enabled"] = false,
				["font_color"] = {
					1, -- [1]
					1, -- [2]
					1, -- [3]
					1, -- [4]
				},
				["line_height"] = 16,
				["line_color"] = {
					0.1, -- [1]
					0.1, -- [2]
					0.1, -- [3]
					0.3, -- [4]
				},
				["font_shadow"] = "NONE",
				["font_size"] = 10,
				["font_face"] = "Friz Quadrata TT",
				["frame"] = {
					["show_title"] = true,
					["strata"] = "LOW",
					["backdrop_color"] = {
						0.16, -- [1]
						0.16, -- [2]
						0.16, -- [3]
						0.47, -- [4]
					},
					["locked"] = false,
					["height"] = 300,
					["width"] = 250,
				},
				["line_texture"] = "Details Serenity",
				["options_frame"] = {
				},
			},
			["report_to_who"] = "",
			["class_specs_coords"] = {},
			["profile_save_pos"] = true,
			["tooltip"] = {
				["header_statusbar"] = {
					0.3, -- [1]
					0.3, -- [2]
					0.3, -- [3]
					0.8, -- [4]
					false, -- [5]
					false, -- [6]
					"WorldState Score", -- [7]
				},
				["fontcolor_right"] = {
					1, -- [1]
					0.7, -- [2]
					0, -- [3]
					1, -- [4]
				},
				["line_height"] = 17,
				["tooltip_max_targets"] = 2,
				["icon_size"] = {
					["W"] = 17,
					["H"] = 17,
				},
				["tooltip_max_pets"] = 2,
				["anchor_relative"] = "top",
				["abbreviation"] = 2,
				["anchored_to"] = 1,
				["fontsize"] = 10,
				["header_text_color"] = {
					1, -- [1]
					0.9176, -- [2]
					0, -- [3]
					1, -- [4]
				},
				["show_amount"] = false,
				["background"] = {
					0.196, -- [1]
					0.196, -- [2]
					0.196, -- [3]
					0.8, -- [4]
				},
				["submenu_wallpaper"] = true,
				["fontsize_title"] = 10,
				["icon_border_texcoord"] = {
					["B"] = 0.921875,
					["L"] = 0.078125,
					["T"] = 0.078125,
					["R"] = 0.921875,
				},
				["commands"] = {
				},
				["tooltip_max_abilities"] = 6,
				["fontface"] = "Friz Quadrata TT",
				["border_color"] = {
					0, -- [1]
					0, -- [2]
					0, -- [3]
					1, -- [4]
				},
				["border_texture"] = "Details BarBorder 3",
				["anchor_offset"] = {
					0, -- [1]
					0, -- [2]
				},
				["menus_bg_texture"] = "Interface\\SPELLBOOK\\Spellbook-Page-1",
				["maximize_method"] = 1,
				["border_size"] = 14,
				["fontshadow"] = false,
				["anchor_screen_pos"] = {
					507.7, -- [1]
					-350.5, -- [2]
				},
				["anchor_point"] = "bottom",
				["menus_bg_coords"] = {
					0.309777336120606, -- [1]
					0.924000015258789, -- [2]
					0.213000011444092, -- [3]
					0.279000015258789, -- [4]
				},
				["fontcolor"] = {
					1, -- [1]
					1, -- [2]
					1, -- [3]
					1, -- [4]
				},
				["menus_bg_color"] = {
					0.8, -- [1]
					0.8, -- [2]
					0.8, -- [3]
					0.2, -- [4]
				},
			},
			["ps_abbreviation"] = 3,
			["world_combat_is_trash"] = false,
			["update_speed"] = 0.05000000074505806,
			["bookmark_text_size"] = 11,
			["animation_speed_mintravel"] = 0.45,
			["track_item_level"] = true,
			["fade_speed"] = 0.15,
			["windows_fade_in"] = {
				"in", -- [1]
				0.2, -- [2]
			},
			["instances_menu_click_to_open"] = false,
			["overall_clear_newchallenge"] = false,
			["current_dps_meter"] = {
				["enabled"] = false,
				["font_color"] = {
					1, -- [1]
					1, -- [2]
					1, -- [3]
					1, -- [4]
				},
				["arena_enabled"] = true,
				["font_shadow"] = "NONE",
				["font_size"] = 18,
				["mythic_dungeon_enabled"] = true,
				["font_face"] = "Friz Quadrata TT",
				["sample_size"] = 5,
				["frame"] = {
					["show_title"] = false,
					["strata"] = "LOW",
					["backdrop_color"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						0.2, -- [4]
					},
					["locked"] = false,
					["height"] = 65,
					["width"] = 220,
				},
				["update_interval"] = 0.3,
				["options_frame"] = {
				},
			},
			["data_cleanup_logout"] = false,
			["instances_disable_bar_highlight"] = false,
			["trash_concatenate"] = false,
			["color_by_arena_team"] = true,
			["animation_speed"] = 33,
			["disable_stretch_from_toolbar"] = false,
			["disable_lock_ungroup_buttons"] = true,
			["memory_ram"] = 64,
			["disable_window_groups"] = false,
			["instances_suppress_trash"] = 0,
			["instances_segments_locked"] = true,
			["options_window"] = {
				["scale"] = 1,
			},
			["animation_speed_maxtravel"] = 3,
			["deadlog_limit"] = 16,
			["instances_no_libwindow"] = false,
			["font_faces"] = {
				["menus"] = "Expressway",
			},
			["clear_ungrouped"] = true,
			["data_broker_text"] = "",
			["segments_amount"] = 40,
			["instances"] = {
				{
					["__pos"] = {
						["normal"] = {
							["y"] = -461.4999465942383,
							["x"] = 649.5015869140625,
							["w"] = 205.0004730224609,
							["h"] = 155.0001068115234,
						},
						["solo"] = {
							["y"] = 2,
							["x"] = 1,
							["w"] = 300,
							["h"] = 200,
						},
					},
					["hide_in_combat_type"] = 1,
					["clickthrough_window"] = false,
					["menu_anchor"] = {
						16, -- [1]
						0, -- [2]
						["side"] = 2,
					},
					["bg_r"] = 0.09411764705882353,
					["hide_out_of_combat"] = false,
					["color_buttons"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["toolbar_icon_file"] = "Interface\\AddOns\\Details\\images\\toolbar_icons_2",
					["micro_displays_locked"] = true,
					["fontstrings_width"] = 35,
					["tooltip"] = {
						["n_abilities"] = 3,
						["n_enemies"] = 3,
					},
					["switch_all_roles_in_combat"] = false,
					["clickthrough_toolbaricons"] = false,
					["row_info"] = {
						["textR_outline"] = true,
						["spec_file"] = "Interface\\AddOns\\Details\\images\\spec_icons_normal",
						["textL_outline"] = true,
						["texture_highlight"] = "Interface\\FriendsFrame\\UI-FriendsList-Highlight",
						["textR_show_data"] = {
							true, -- [1]
							true, -- [2]
							false, -- [3]
						},
						["textL_enable_custom_text"] = false,
						["fixed_text_color"] = {
							1, -- [1]
							1, -- [2]
							1, -- [3]
						},
						["space"] = {
							["right"] = 0,
							["left"] = 0,
							["between"] = 0,
						},
						["texture_background_class_color"] = false,
						["textL_outline_small_color"] = {
							0, -- [1]
							0, -- [2]
							0, -- [3]
							1, -- [4]
						},
						["font_face_file"] = "Interface\\AddOns\\ElvUI\\Media\\Fonts\\Expressway.ttf",
						["textL_custom_text"] = "{data1}. {data3}{data2}",
						["font_size"] = 11,
						["textL_translit_text"] = false,
						["texture_custom_file"] = "Interface\\",
						["texture_file"] = "Interface\\AddOns\\ElvUI\\Media\\Textures\\Minimalist",
						["height"] = 17,
						["models"] = {
							["upper_model"] = "Spells\\AcidBreath_SuperGreen.M2",
							["lower_model"] = "World\\EXPANSION02\\DOODADS\\Coldarra\\COLDARRALOCUS.m2",
							["upper_alpha"] = 0.5,
							["lower_enabled"] = false,
							["lower_alpha"] = 0.1,
							["upper_enabled"] = false,
						},
						["icon_file"] = "Interface\\AddOns\\Details\\images\\classes_small",
						["icon_grayscale"] = false,
						["backdrop"] = {
							["enabled"] = false,
							["size"] = 10,
							["color"] = {
								1, -- [1]
								1, -- [2]
								1, -- [3]
								1, -- [4]
							},
							["texture"] = "Details BarBorder 2",
						},
						["textR_bracket"] = "(",
						["texture_custom"] = "",
						["textL_outline_small"] = true,
						["fixed_texture_color"] = {
							0, -- [1]
							0, -- [2]
							0, -- [3]
						},
						["textL_show_number"] = false,
						["textR_enable_custom_text"] = false,
						["textR_outline_small"] = false,
						["textR_custom_text"] = "{data1} ({data2}, {data3}%)",
						["texture"] = "Minimalist",
						["fixed_texture_background_color"] = {
							0, -- [1]
							0, -- [2]
							0, -- [3]
							0.150228589773178, -- [4]
						},
						["texture_background_file"] = "Interface\\AddOns\\ElvUI\\Media\\Textures\\Minimalist",
						["textL_class_colors"] = false,
						["textR_outline_small_color"] = {
							0, -- [1]
							0, -- [2]
							0, -- [3]
							1, -- [4]
						},
						["texture_background"] = "Minimalist",
						["textR_class_colors"] = false,
						["alpha"] = 1,
						["no_icon"] = false,
						["icon_offset"] = {
							0, -- [1]
							0, -- [2]
						},
						["start_after_icon"] = false,
						["font_face"] = "Expressway",
						["texture_class_colors"] = true,
						["percent_type"] = 1,
						["fast_ps_update"] = true,
						["textR_separator"] = "NONE",
						["use_spec_icons"] = true,
					},
					["switch_tank"] = false,
					["plugins_grow_direction"] = 2,
					["menu_icons"] = {
						true, -- [1]
						true, -- [2]
						false, -- [3]
						true, -- [4]
						true, -- [5]
						false, -- [6]
						["space"] = 0,
						["shadow"] = false,
					},
					["desaturated_menu"] = false,
					["micro_displays_side"] = 2,
					["window_scale"] = 1,
					["hide_icon"] = true,
					["toolbar_side"] = 1,
					["bg_g"] = 0.09411764705882353,
					["menu_icons_alpha"] = 0.5,
					["bg_b"] = 0.09411764705882353,
					["switch_healer_in_combat"] = false,
					["color"] = {
						0.07058823529411765, -- [1]
						0.07058823529411765, -- [2]
						0.07058823529411765, -- [3]
						0, -- [4]
					},
					["hide_on_context"] = {
						{
							["enabled"] = false,
							["inverse"] = false,
							["value"] = 100,
						}, -- [1]
						{
							["enabled"] = false,
							["inverse"] = false,
							["value"] = 100,
						}, -- [2]
						{
							["enabled"] = false,
							["inverse"] = false,
							["value"] = 100,
						}, -- [3]
						{
							["enabled"] = false,
							["inverse"] = false,
							["value"] = 100,
						}, -- [4]
						{
							["enabled"] = false,
							["inverse"] = false,
							["value"] = 100,
						}, -- [5]
						{
							["enabled"] = false,
							["inverse"] = false,
							["value"] = 100,
						}, -- [6]
						{
							["enabled"] = false,
							["inverse"] = false,
							["value"] = 100,
						}, -- [7]
						{
							["enabled"] = false,
							["inverse"] = false,
							["value"] = 100,
						}, -- [8]
						{
							["enabled"] = false,
							["inverse"] = false,
							["value"] = 100,
						}, -- [9]
						{
							["enabled"] = false,
							["inverse"] = false,
							["value"] = 100,
						}, -- [10]
						{
							["enabled"] = false,
							["inverse"] = false,
							["value"] = 100,
						}, -- [11]
						{
							["enabled"] = false,
							["inverse"] = false,
							["value"] = 100,
						}, -- [12]
						{
							["enabled"] = false,
							["inverse"] = false,
							["value"] = 100,
						}, -- [13]
						{
							["enabled"] = false,
							["inverse"] = false,
							["value"] = 100,
						}, -- [14]
						{
							["enabled"] = false,
							["inverse"] = false,
							["value"] = 100,
						}, -- [15]
					},
					["skin"] = "Minimalistic",
					["following"] = {
						["bar_color"] = {
							1, -- [1]
							1, -- [2]
							1, -- [3]
						},
						["enabled"] = true,
						["text_color"] = {
							1, -- [1]
							1, -- [2]
							1, -- [3]
						},
					},
					["switch_healer"] = false,
					["fontstrings_text2_anchor"] = 70,
					["__snapV"] = false,
					["__snapH"] = false,
					["StatusBarSaved"] = {
						["center"] = "DETAILS_STATUSBAR_PLUGIN_CLOCK",
						["right"] = "DETAILS_STATUSBAR_PLUGIN_PDPS",
						["options"] = {
							["DETAILS_STATUSBAR_PLUGIN_PDPS"] = {
								["segmentType"] = 2,
								["textFace"] = "Accidental Presidency",
								["textColor"] = {
									1, -- [1]
									1, -- [2]
									1, -- [3]
									1, -- [4]
								},
								["textAlign"] = 3,
								["timeType"] = 1,
								["textSize"] = 10,
								["textYMod"] = 1,
							},
							["DETAILS_STATUSBAR_PLUGIN_PSEGMENT"] = {
								["segmentType"] = 2,
								["textFace"] = "Accidental Presidency",
								["textColor"] = {
									1, -- [1]
									1, -- [2]
									1, -- [3]
									1, -- [4]
								},
								["textAlign"] = 1,
								["timeType"] = 1,
								["textSize"] = 10,
								["textYMod"] = 1,
							},
							["DETAILS_STATUSBAR_PLUGIN_CLOCK"] = {
								["segmentType"] = 2,
								["textFace"] = "Accidental Presidency",
								["textColor"] = {
									1, -- [1]
									1, -- [2]
									1, -- [3]
									1, -- [4]
								},
								["textAlign"] = 2,
								["timeType"] = 1,
								["textSize"] = 10,
								["textYMod"] = 1,
							},
						},
						["left"] = "DETAILS_STATUSBAR_PLUGIN_PSEGMENT",
					},
					["grab_on_top"] = false,
					["__was_opened"] = true,
					["instance_button_anchor"] = {
						-27, -- [1]
						1, -- [2]
					},
					["bg_alpha"] = 0,
					["fontstrings_text4_anchor"] = 0,
					["__locked"] = true,
					["menu_alpha"] = {
						["enabled"] = false,
						["onenter"] = 1,
						["iconstoo"] = true,
						["ignorebars"] = false,
						["onleave"] = 1,
					},
					["switch_all_roles_after_wipe"] = false,
					["row_show_animation"] = {
						["anim"] = "Fade",
						["options"] = {
						},
					},
					["bars_inverted"] = false,
					["strata"] = "LOW",
					["clickthrough_incombatonly"] = false,
					["__snap"] = {
						[3] = 2,
					},
					["stretch_button_side"] = 1,
					["hide_in_combat_alpha"] = 0,
					["icon_desaturated"] = false,
					["show_statusbar"] = false,
					["libwindow"] = {
						["y"] = 0.9999418258666992,
						["x"] = -207.998046875,
						["point"] = "BOTTOMRIGHT",
						["scale"] = 1,
					},
					["statusbar_info"] = {
						["alpha"] = 0,
						["overlay"] = {
							0.07058823529411765, -- [1]
							0.07058823529411765, -- [2]
							0.07058823529411765, -- [3]
						},
					},
					["backdrop_texture"] = "Details Ground",
					["menu_anchor_down"] = {
						16, -- [1]
						-3, -- [2]
					},
					["switch_damager"] = false,
					["switch_tank_in_combat"] = false,
					["bars_grow_direction"] = 1,
					["switch_damager_in_combat"] = false,
					["bars_sort_direction"] = 1,
					["clickthrough_rows"] = false,
					["auto_current"] = true,
					["auto_hide_menu"] = {
						["left"] = false,
						["right"] = false,
					},
					["version"] = 3,
					["attribute_text"] = {
						["enabled"] = true,
						["shadow"] = false,
						["side"] = 1,
						["text_color"] = {
							1, -- [1]
							1, -- [2]
							1, -- [3]
							1, -- [4]
						},
						["custom_text"] = "{name}",
						["text_face"] = "Expressway",
						["anchor"] = {
							-18, -- [1]
							3, -- [2]
						},
						["text_size"] = 10,
						["enable_custom_text"] = false,
						["show_timer"] = false,
					},
					["hide_in_combat"] = false,
					["posicao"] = {
						["normal"] = {
							["y"] = -461.4999465942383,
							["x"] = 649.5015869140625,
							["w"] = 205.0004730224609,
							["h"] = 155.0001068115234,
						},
						["solo"] = {
							["y"] = 2,
							["x"] = 1,
							["w"] = 300,
							["h"] = 200,
						},
					},
					["skin_custom"] = "",
					["ignore_mass_showhide"] = false,
					["wallpaper"] = {
						["overlay"] = {
							1, -- [1]
							1, -- [2]
							1, -- [3]
							1, -- [4]
						},
						["width"] = 283.000183105469,
						["texcoord"] = {
							0, -- [1]
							1, -- [2]
							0, -- [3]
							0.7, -- [4]
						},
						["enabled"] = false,
						["anchor"] = "all",
						["height"] = 114.042518615723,
						["alpha"] = 0.5,
						["texture"] = "Interface\\AddOns\\Details\\images\\background",
					},
					["total_bar"] = {
						["enabled"] = false,
						["only_in_group"] = false,
						["icon"] = "Interface\\ICONS\\INV_Sigil_Thorim",
						["color"] = {
							1, -- [1]
							1, -- [2]
							1, -- [3]
						},
					},
					["show_sidebars"] = false,
					["fontstrings_text3_anchor"] = 35,
					["use_multi_fontstrings"] = false,
					["menu_icons_size"] = 0.8500000238418579,
				}, -- [1]
				{
					["__pos"] = {
						["normal"] = {
							["y"] = -461.4999465942383,
							["x"] = 854.5023193359375,
							["w"] = 205.0004730224609,
							["h"] = 155.0001068115234,
						},
						["solo"] = {
							["y"] = 2,
							["x"] = 1,
							["w"] = 300,
							["h"] = 200,
						},
					},
					["hide_in_combat_type"] = 1,
					["clickthrough_window"] = false,
					["menu_anchor"] = {
						16, -- [1]
						0, -- [2]
						["side"] = 2,
					},
					["bg_r"] = 0.09411764705882353,
					["hide_out_of_combat"] = false,
					["color_buttons"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["toolbar_icon_file"] = "Interface\\AddOns\\Details\\images\\toolbar_icons_2",
					["micro_displays_locked"] = true,
					["fontstrings_width"] = 35,
					["tooltip"] = {
						["n_abilities"] = 3,
						["n_enemies"] = 3,
					},
					["switch_all_roles_in_combat"] = false,
					["clickthrough_toolbaricons"] = false,
					["row_info"] = {
						["textR_outline"] = true,
						["spec_file"] = "Interface\\AddOns\\Details\\images\\spec_icons_normal",
						["textL_outline"] = true,
						["texture_highlight"] = "Interface\\FriendsFrame\\UI-FriendsList-Highlight",
						["textR_show_data"] = {
							true, -- [1]
							true, -- [2]
							false, -- [3]
						},
						["textL_enable_custom_text"] = false,
						["fixed_text_color"] = {
							1, -- [1]
							1, -- [2]
							1, -- [3]
						},
						["space"] = {
							["right"] = 0,
							["left"] = 0,
							["between"] = 0,
						},
						["texture_background_class_color"] = false,
						["textL_outline_small_color"] = {
							0, -- [1]
							0, -- [2]
							0, -- [3]
							1, -- [4]
						},
						["font_face_file"] = "Interface\\AddOns\\ElvUI\\Media\\Fonts\\Expressway.ttf",
						["textL_custom_text"] = "{data1}. {data3}{data2}",
						["font_size"] = 11,
						["textL_translit_text"] = false,
						["texture_custom_file"] = "Interface\\",
						["texture_file"] = "Interface\\AddOns\\ElvUI\\Media\\Textures\\Minimalist",
						["height"] = 17.16361999511719,
						["models"] = {
							["upper_model"] = "Spells\\AcidBreath_SuperGreen.M2",
							["lower_model"] = "World\\EXPANSION02\\DOODADS\\Coldarra\\COLDARRALOCUS.m2",
							["upper_alpha"] = 0.5,
							["lower_enabled"] = false,
							["lower_alpha"] = 0.1,
							["upper_enabled"] = false,
						},
						["icon_file"] = "Interface\\AddOns\\Details\\images\\classes_small",
						["icon_grayscale"] = false,
						["backdrop"] = {
							["enabled"] = false,
							["size"] = 12,
							["color"] = {
								1, -- [1]
								1, -- [2]
								1, -- [3]
								1, -- [4]
							},
							["texture"] = "Details BarBorder 2",
						},
						["textR_bracket"] = "(",
						["texture_custom"] = "",
						["textL_outline_small"] = true,
						["fixed_texture_color"] = {
							0, -- [1]
							0, -- [2]
							0, -- [3]
						},
						["textL_show_number"] = false,
						["textR_enable_custom_text"] = false,
						["textR_outline_small"] = false,
						["textR_custom_text"] = "{data1} ({data2}, {data3}%)",
						["texture"] = "Minimalist",
						["fixed_texture_background_color"] = {
							0, -- [1]
							0, -- [2]
							0, -- [3]
							0.150228589773178, -- [4]
						},
						["texture_background_file"] = "Interface\\AddOns\\ElvUI\\Media\\Textures\\Minimalist",
						["textL_class_colors"] = false,
						["textR_outline_small_color"] = {
							0, -- [1]
							0, -- [2]
							0, -- [3]
							1, -- [4]
						},
						["texture_background"] = "Minimalist",
						["textR_class_colors"] = false,
						["alpha"] = 1,
						["no_icon"] = false,
						["icon_offset"] = {
							0, -- [1]
							0, -- [2]
						},
						["start_after_icon"] = false,
						["font_face"] = "Expressway",
						["texture_class_colors"] = true,
						["percent_type"] = 1,
						["fast_ps_update"] = false,
						["textR_separator"] = "NONE",
						["use_spec_icons"] = true,
					},
					["switch_tank"] = false,
					["plugins_grow_direction"] = 2,
					["menu_icons"] = {
						true, -- [1]
						true, -- [2]
						false, -- [3]
						true, -- [4]
						true, -- [5]
						false, -- [6]
						["space"] = 0,
						["shadow"] = false,
					},
					["desaturated_menu"] = false,
					["micro_displays_side"] = 2,
					["window_scale"] = 1,
					["hide_icon"] = true,
					["toolbar_side"] = 1,
					["bg_g"] = 0.09411764705882353,
					["menu_icons_alpha"] = 0.5,
					["bg_b"] = 0.09411764705882353,
					["switch_healer_in_combat"] = false,
					["color"] = {
						0.07058823529411765, -- [1]
						0.07058823529411765, -- [2]
						0.07058823529411765, -- [3]
						0, -- [4]
					},
					["hide_on_context"] = {
						{
							["enabled"] = false,
							["inverse"] = false,
							["value"] = 100,
						}, -- [1]
						{
							["enabled"] = false,
							["inverse"] = false,
							["value"] = 100,
						}, -- [2]
						{
							["enabled"] = false,
							["inverse"] = false,
							["value"] = 100,
						}, -- [3]
						{
							["enabled"] = false,
							["inverse"] = false,
							["value"] = 100,
						}, -- [4]
						{
							["enabled"] = false,
							["inverse"] = false,
							["value"] = 100,
						}, -- [5]
						{
							["enabled"] = false,
							["inverse"] = false,
							["value"] = 100,
						}, -- [6]
						{
							["enabled"] = false,
							["inverse"] = false,
							["value"] = 100,
						}, -- [7]
						{
							["enabled"] = false,
							["inverse"] = false,
							["value"] = 100,
						}, -- [8]
						{
							["enabled"] = false,
							["inverse"] = false,
							["value"] = 100,
						}, -- [9]
						{
							["enabled"] = false,
							["inverse"] = false,
							["value"] = 100,
						}, -- [10]
						{
							["enabled"] = false,
							["inverse"] = false,
							["value"] = 100,
						}, -- [11]
						{
							["enabled"] = false,
							["inverse"] = false,
							["value"] = 100,
						}, -- [12]
						{
							["enabled"] = false,
							["inverse"] = false,
							["value"] = 100,
						}, -- [13]
						{
							["enabled"] = false,
							["inverse"] = false,
							["value"] = 100,
						}, -- [14]
						{
							["enabled"] = false,
							["inverse"] = false,
							["value"] = 100,
						}, -- [15]
					},
					["skin"] = "Minimalistic",
					["following"] = {
						["enabled"] = true,
						["bar_color"] = {
							1, -- [1]
							1, -- [2]
							1, -- [3]
						},
						["text_color"] = {
							1, -- [1]
							1, -- [2]
							1, -- [3]
						},
					},
					["switch_healer"] = false,
					["fontstrings_text2_anchor"] = 70,
					["__snapV"] = false,
					["__snapH"] = false,
					["StatusBarSaved"] = {
						["center"] = "DETAILS_STATUSBAR_PLUGIN_CLOCK",
						["right"] = "DETAILS_STATUSBAR_PLUGIN_PDPS",
						["options"] = {
							["DETAILS_STATUSBAR_PLUGIN_PDPS"] = {
								["isHidden"] = false,
								["timeType"] = 1,
								["textYMod"] = 1,
								["segmentType"] = 2,
								["textFace"] = "Accidental Presidency",
								["maxSectionIds"] = 19,
								["textAlign"] = 3,
								["textSize"] = 10,
								["textColor"] = {
									1, -- [1]
									1, -- [2]
									1, -- [3]
									1, -- [4]
								},
							},
							["DETAILS_STATUSBAR_PLUGIN_PSEGMENT"] = {
								["isHidden"] = false,
								["segmentType"] = 2,
								["textFace"] = "Accidental Presidency",
								["textColor"] = {
									1, -- [1]
									1, -- [2]
									1, -- [3]
									1, -- [4]
								},
								["textAlign"] = 1,
								["timeType"] = 1,
								["textSize"] = 10,
								["textYMod"] = 1,
							},
							["DETAILS_STATUSBAR_PLUGIN_CLOCK"] = {
								["isHidden"] = false,
								["timeType"] = 1,
								["textYMod"] = 1,
								["segmentType"] = 2,
								["textFace"] = "Accidental Presidency",
								["maxSectionIds"] = 19,
								["textAlign"] = 2,
								["textSize"] = 10,
								["textColor"] = {
									1, -- [1]
									1, -- [2]
									1, -- [3]
									1, -- [4]
								},
							},
						},
						["left"] = "DETAILS_STATUSBAR_PLUGIN_PSEGMENT",
					},
					["grab_on_top"] = false,
					["__was_opened"] = true,
					["instance_button_anchor"] = {
						-27, -- [1]
						1, -- [2]
					},
					["version"] = 3,
					["fontstrings_text4_anchor"] = 0,
					["__locked"] = true,
					["menu_alpha"] = {
						["enabled"] = false,
						["onleave"] = 1,
						["ignorebars"] = false,
						["iconstoo"] = true,
						["onenter"] = 1,
					},
					["switch_all_roles_after_wipe"] = false,
					["row_show_animation"] = {
						["anim"] = "Fade",
						["options"] = {
						},
					},
					["bars_inverted"] = false,
					["strata"] = "LOW",
					["clickthrough_incombatonly"] = false,
					["__snap"] = {
						1, -- [1]
					},
					["stretch_button_side"] = 1,
					["hide_in_combat_alpha"] = 0,
					["bars_sort_direction"] = 1,
					["show_statusbar"] = false,
					["libwindow"] = {
						["y"] = 0.9999418258666992,
						["x"] = -2.99755859375,
						["point"] = "BOTTOMRIGHT",
						["scale"] = 1,
					},
					["statusbar_info"] = {
						["alpha"] = 0,
						["overlay"] = {
							0.07058823529411765, -- [1]
							0.07058823529411765, -- [2]
							0.07058823529411765, -- [3]
						},
					},
					["backdrop_texture"] = "Details Ground",
					["menu_anchor_down"] = {
						16, -- [1]
						-3, -- [2]
					},
					["bg_alpha"] = 0,
					["switch_tank_in_combat"] = false,
					["bars_grow_direction"] = 1,
					["switch_damager_in_combat"] = false,
					["icon_desaturated"] = false,
					["clickthrough_rows"] = false,
					["auto_current"] = true,
					["attribute_text"] = {
						["enabled"] = true,
						["shadow"] = false,
						["side"] = 1,
						["text_color"] = {
							1, -- [1]
							1, -- [2]
							1, -- [3]
							1, -- [4]
						},
						["custom_text"] = "{name}",
						["text_face"] = "Expressway",
						["anchor"] = {
							-18, -- [1]
							3, -- [2]
						},
						["text_size"] = 10,
						["enable_custom_text"] = false,
						["show_timer"] = false,
					},
					["auto_hide_menu"] = {
						["left"] = false,
						["right"] = false,
					},
					["switch_damager"] = false,
					["hide_in_combat"] = false,
					["posicao"] = {
						["normal"] = {
							["y"] = -461.4999465942383,
							["x"] = 854.5023193359375,
							["w"] = 205.0004730224609,
							["h"] = 155.0001068115234,
						},
						["solo"] = {
							["y"] = 2,
							["x"] = 1,
							["w"] = 300,
							["h"] = 200,
						},
					},
					["skin_custom"] = "",
					["ignore_mass_showhide"] = false,
					["wallpaper"] = {
						["overlay"] = {
							1, -- [1]
							1, -- [2]
							1, -- [3]
							1, -- [4]
						},
						["width"] = 204.0004730224609,
						["texcoord"] = {
							0, -- [1]
							1, -- [2]
							0, -- [3]
							0.7, -- [4]
						},
						["enabled"] = false,
						["anchor"] = "all",
						["height"] = 155.0001068115234,
						["alpha"] = 0.5,
						["texture"] = "Interface\\AddOns\\Details\\images\\background",
					},
					["total_bar"] = {
						["enabled"] = false,
						["only_in_group"] = false,
						["icon"] = "Interface\\ICONS\\INV_Sigil_Thorim",
						["color"] = {
							1, -- [1]
							1, -- [2]
							1, -- [3]
						},
					},
					["show_sidebars"] = false,
					["fontstrings_text3_anchor"] = 35,
					["use_multi_fontstrings"] = false,
					["menu_icons_size"] = 0.850000023841858,
				}, -- [2]
			},
			["report_lines"] = 5,
			["use_battleground_server_parser"] = false,
			["use_scroll"] = false,
			["skin"] = "Dark Theme",
			["override_spellids"] = true,
			["report_schema"] = 1,
			["player_details_window"] = {
				["scale"] = 1,
				["bar_texture"] = "Skyline",
				["skin"] = "ElvUI",
			},
			["overall_clear_newtorghast"] = true,
			["new_window_size"] = {
				["height"] = 158,
				["width"] = 310,
			},
			["minimum_combat_time"] = 5,
			["memory_threshold"] = 3,
			["cloud_capture"] = true,
			["damage_taken_everything"] = false,
			["scroll_speed"] = 2,
			["font_sizes"] = {
				["menus"] = 10,
			},
			["chat_tab_embed"] = {
				["enabled"] = false,
				["tab_name"] = "",
				["x_offset"] = 0,
				["y_offset"] = 0,
				["single_window"] = false,
			},
			["deadlog_events"] = 32,
			["overall_flag"] = 16,
			["close_shields"] = false,
			["class_coords"] = {},
			["windows_fade_out"] = {
				"out", -- [1]
				0.2, -- [2]
			},
			["disable_alldisplays_window"] = false,
			["deny_score_messages"] = false,
			["hotcorner_topleft"] = {
				["hide"] = false,
			},
			["total_abbreviation"] = 2,
			["animation_speed_triggertravel"] = 5,
			["clear_graphic"] = true,
			["class_colors"] = {},
			["segments_auto_erase"] = 2,
			["options_group_edit"] = true,
			["broadcaster_enabled"] = false,
			["minimap"] = {
				["minimapPos"] = 220,
				["radius"] = 160,
				["text_type"] = 1,
				["onclick_what_todo"] = 1,
				["text_format"] = 3,
				["hide"] = true,
			},
			["instances_amount"] = 3,
			["max_window_size"] = {
				["height"] = 450,
				["width"] = 480,
			},
			["default_bg_color"] = 0.0941,
			["only_pvp_frags"] = false,
			["disable_stretch_button"] = true,
			["segments_amount_to_save"] = 40,
			["trash_auto_remove"] = true,
			["standard_skin"] = false,
			["segments_panic_mode"] = false,
			["numerical_system_symbols"] = "auto",
			["overall_clear_newboss"] = false,
			["row_fade_out"] = {
				"out", -- [1]
				0.2, -- [2]
			},
			["window_clamp"] = {
				-8, -- [1]
				0, -- [2]
				21, -- [3]
				-14, -- [4]
			},
			["overall_clear_logout"] = false,
			["numerical_system"] = 1,
			["force_activity_time_pvp"] = true,
			["class_icons_small"] = "Interface\\AddOns\\Details\\images\\classes_small",
			["pvp_as_group"] = true,
			["disable_reset_button"] = true,
			["animate_scroll"] = false,
			["death_tooltip_width"] = 350,
			["time_type"] = 2,
			["default_bg_alpha"] = 0.5,
			["time_type_original"] = 2,
		}

		-- General db
		_detalhes_global["always_use_profile"] = true
		_detalhes_global["always_use_profile_name"] = TBC

		-- Load the profile
		_detalhes:ApplyProfile(TBC)

	elseif L1UI.Classic then

		-- Create profile if it doesn't exist yet
		_detalhes_global["__profiles"][Classic] = _detalhes_global["__profiles"][Classic] or {}

		-- Profile db
		_detalhes_global["__profiles"][Classic] = {
			["show_arena_role_icon"] = false,
			["capture_real"] = {
				["heal"] = true,
				["spellcast"] = true,
				["miscdata"] = true,
				["aura"] = true,
				["energy"] = true,
				["damage"] = true,
			},
			["row_fade_in"] = {
				"in", -- [1]
				0.2, -- [2]
			},
			["streamer_config"] = {
				["faster_updates"] = false,
				["quick_detection"] = false,
				["reset_spec_cache"] = false,
				["no_alerts"] = false,
				["use_animation_accel"] = true,
				["disable_mythic_dungeon"] = false,
			},
			["all_players_are_group"] = false,
			["use_row_animations"] = true,
			["report_heal_links"] = false,
			["remove_realm_from_name"] = true,
			["minimum_overall_combat_time"] = 10,
			["event_tracker"] = {
				["enabled"] = false,
				["font_color"] = {
					1, -- [1]
					1, -- [2]
					1, -- [3]
					1, -- [4]
				},
				["line_height"] = 16,
				["line_color"] = {
					0.1, -- [1]
					0.1, -- [2]
					0.1, -- [3]
					0.3, -- [4]
				},
				["font_shadow"] = "NONE",
				["font_size"] = 10,
				["font_face"] = "Friz Quadrata TT",
				["frame"] = {
					["show_title"] = true,
					["strata"] = "LOW",
					["backdrop_color"] = {
						0.16, -- [1]
						0.16, -- [2]
						0.16, -- [3]
						0.47, -- [4]
					},
					["locked"] = false,
					["height"] = 300,
					["width"] = 250,
				},
				["line_texture"] = "Details Serenity",
				["options_frame"] = {
				},
			},
			["report_to_who"] = "",
			["class_specs_coords"] = {},
			["profile_save_pos"] = true,
			["tooltip"] = {
				["header_statusbar"] = {
					0.3, -- [1]
					0.3, -- [2]
					0.3, -- [3]
					0.8, -- [4]
					false, -- [5]
					false, -- [6]
					"WorldState Score", -- [7]
				},
				["fontcolor_right"] = {
					1, -- [1]
					0.7, -- [2]
					0, -- [3]
					1, -- [4]
				},
				["line_height"] = 17,
				["tooltip_max_targets"] = 2,
				["icon_size"] = {
					["W"] = 17,
					["H"] = 17,
				},
				["tooltip_max_pets"] = 2,
				["anchor_relative"] = "top",
				["abbreviation"] = 2,
				["anchored_to"] = 1,
				["fontsize"] = 10,
				["header_text_color"] = {
					1, -- [1]
					0.9176, -- [2]
					0, -- [3]
					1, -- [4]
				},
				["show_amount"] = false,
				["background"] = {
					0.196, -- [1]
					0.196, -- [2]
					0.196, -- [3]
					0.8, -- [4]
				},
				["submenu_wallpaper"] = true,
				["fontsize_title"] = 10,
				["icon_border_texcoord"] = {
					["B"] = 0.921875,
					["L"] = 0.078125,
					["T"] = 0.078125,
					["R"] = 0.921875,
				},
				["commands"] = {
				},
				["tooltip_max_abilities"] = 6,
				["fontface"] = "Friz Quadrata TT",
				["border_color"] = {
					0, -- [1]
					0, -- [2]
					0, -- [3]
					1, -- [4]
				},
				["border_texture"] = "Details BarBorder 3",
				["anchor_offset"] = {
					0, -- [1]
					0, -- [2]
				},
				["fontshadow"] = false,
				["menus_bg_texture"] = "Interface\\SPELLBOOK\\Spellbook-Page-1",
				["border_size"] = 14,
				["maximize_method"] = 1,
				["anchor_screen_pos"] = {
					507.7, -- [1]
					-350.5, -- [2]
				},
				["anchor_point"] = "bottom",
				["menus_bg_coords"] = {
					0.309777336120606, -- [1]
					0.924000015258789, -- [2]
					0.213000011444092, -- [3]
					0.279000015258789, -- [4]
				},
				["fontcolor"] = {
					1, -- [1]
					1, -- [2]
					1, -- [3]
					1, -- [4]
				},
				["menus_bg_color"] = {
					0.8, -- [1]
					0.8, -- [2]
					0.8, -- [3]
					0.2, -- [4]
				},
			},
			["ps_abbreviation"] = 3,
			["world_combat_is_trash"] = false,
			["update_speed"] = 0.0500000007450581,
			["bookmark_text_size"] = 11,
			["animation_speed_mintravel"] = 0.45,
			["track_item_level"] = true,
			["windows_fade_in"] = {
				"in", -- [1]
				0.2, -- [2]
			},
			["instances_menu_click_to_open"] = false,
			["overall_clear_newchallenge"] = false,
			["current_dps_meter"] = {
				["enabled"] = false,
				["font_color"] = {
					1, -- [1]
					1, -- [2]
					1, -- [3]
					1, -- [4]
				},
				["arena_enabled"] = true,
				["font_shadow"] = "NONE",
				["font_size"] = 18,
				["mythic_dungeon_enabled"] = true,
				["font_face"] = "Friz Quadrata TT",
				["sample_size"] = 5,
				["frame"] = {
					["show_title"] = false,
					["strata"] = "LOW",
					["backdrop_color"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						0.2, -- [4]
					},
					["locked"] = false,
					["height"] = 65,
					["width"] = 220,
				},
				["update_interval"] = 0.3,
				["options_frame"] = {
				},
			},
			["data_cleanup_logout"] = false,
			["instances_disable_bar_highlight"] = false,
			["trash_concatenate"] = false,
			["color_by_arena_team"] = true,
			["animation_speed"] = 33,
			["disable_stretch_from_toolbar"] = false,
			["disable_lock_ungroup_buttons"] = true,
			["memory_ram"] = 64,
			["disable_window_groups"] = false,
			["instances_suppress_trash"] = 0,
			["instances"] = {
				{
					["__pos"] = {
						["normal"] = {
							["y"] = -461.499946594238,
							["x"] = 649.501586914063,
							["w"] = 205.000473022461,
							["h"] = 155.000106811523,
						},
						["solo"] = {
							["y"] = 2,
							["x"] = 1,
							["w"] = 300,
							["h"] = 200,
						},
					},
					["show_statusbar"] = false,
					["clickthrough_window"] = false,
					["menu_anchor"] = {
						16, -- [1]
						0, -- [2]
						["side"] = 2,
					},
					["bg_r"] = 0.0941176470588235,
					["hide_out_of_combat"] = false,
					["color_buttons"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["toolbar_icon_file"] = "Interface\\AddOns\\Details\\images\\toolbar_icons",
					["skin_custom"] = "",
					["tooltip"] = {
						["n_abilities"] = 3,
						["n_enemies"] = 3,
					},
					["switch_all_roles_in_combat"] = false,
					["clickthrough_toolbaricons"] = false,
					["attribute_text"] = {
						["enabled"] = true,
						["shadow"] = false,
						["side"] = 1,
						["text_color"] = {
							1, -- [1]
							1, -- [2]
							1, -- [3]
							1, -- [4]
						},
						["custom_text"] = "{name}",
						["text_face"] = "Expressway",
						["anchor"] = {
							-18, -- [1]
							3, -- [2]
						},
						["text_size"] = 10,
						["enable_custom_text"] = false,
						["show_timer"] = {
							true, -- [1]
							true, -- [2]
							true, -- [3]
						},
					},
					["ignore_mass_showhide"] = false,
					["switch_all_roles_after_wipe"] = false,
					["menu_icons"] = {
						true, -- [1]
						true, -- [2]
						false, -- [3]
						true, -- [4]
						true, -- [5]
						false, -- [6]
						["space"] = 0,
						["shadow"] = false,
					},
					["switch_damager"] = false,
					["micro_displays_side"] = 2,
					["window_scale"] = 1,
					["hide_icon"] = true,
					["toolbar_side"] = 1,
					["bg_g"] = 0.0941176470588235,
					["bg_b"] = 0.0941176470588235,
					["switch_healer_in_combat"] = false,
					["color"] = {
						0.0705882352941177, -- [1]
						0.0705882352941177, -- [2]
						0.0705882352941177, -- [3]
						0, -- [4]
					},
					["hide_on_context"] = {
						{
							["enabled"] = false,
							["inverse"] = false,
							["value"] = 100,
						}, -- [1]
						{
							["enabled"] = false,
							["inverse"] = false,
							["value"] = 100,
						}, -- [2]
						{
							["enabled"] = false,
							["inverse"] = false,
							["value"] = 100,
						}, -- [3]
						{
							["enabled"] = false,
							["inverse"] = false,
							["value"] = 100,
						}, -- [4]
						{
							["enabled"] = false,
							["inverse"] = false,
							["value"] = 100,
						}, -- [5]
						{
							["enabled"] = false,
							["inverse"] = false,
							["value"] = 100,
						}, -- [6]
						{
							["enabled"] = false,
							["inverse"] = false,
							["value"] = 100,
						}, -- [7]
						{
							["enabled"] = false,
							["inverse"] = false,
							["value"] = 100,
						}, -- [8]
						{
							["enabled"] = false,
							["inverse"] = false,
							["value"] = 100,
						}, -- [9]
						{
							["enabled"] = false,
							["inverse"] = false,
							["value"] = 100,
						}, -- [10]
						{
							["enabled"] = false,
							["inverse"] = false,
							["value"] = 100,
						}, -- [11]
						{
							["enabled"] = false,
							["inverse"] = false,
							["value"] = 100,
						}, -- [12]
						{
							["enabled"] = false,
							["inverse"] = false,
							["value"] = 100,
						}, -- [13]
						{
							["enabled"] = false,
							["inverse"] = false,
							["value"] = 100,
						}, -- [14]
						{
							["enabled"] = false,
							["inverse"] = false,
							["value"] = 100,
						}, -- [15]
					},
					["skin"] = "Minimalistic",
					["following"] = {
						["bar_color"] = {
							1, -- [1]
							1, -- [2]
							1, -- [3]
						},
						["enabled"] = true,
						["text_color"] = {
							1, -- [1]
							1, -- [2]
							1, -- [3]
						},
					},
					["switch_healer"] = false,
					["StatusBarSaved"] = {
						["center"] = "DETAILS_STATUSBAR_PLUGIN_CLOCK",
						["right"] = "DETAILS_STATUSBAR_PLUGIN_PDPS",
						["options"] = {
							["DETAILS_STATUSBAR_PLUGIN_PDPS"] = {
								["textYMod"] = 1,
								["textXMod"] = 0,
								["textFace"] = "Accidental Presidency",
								["textAlign"] = 0,
								["textStyle"] = 2,
								["textSize"] = 10,
								["textColor"] = {
									1, -- [1]
									1, -- [2]
									1, -- [3]
									1, -- [4]
								},
							},
							["DETAILS_STATUSBAR_PLUGIN_PSEGMENT"] = {
								["textColor"] = {
									1, -- [1]
									1, -- [2]
									1, -- [3]
									1, -- [4]
								},
								["segmentType"] = 2,
								["textFace"] = "Accidental Presidency",
								["textXMod"] = 0,
								["textAlign"] = 0,
								["textStyle"] = 2,
								["textSize"] = 10,
								["textYMod"] = 1,
							},
							["DETAILS_STATUSBAR_PLUGIN_CLOCK"] = {
								["textColor"] = {
									1, -- [1]
									1, -- [2]
									1, -- [3]
									1, -- [4]
								},
								["textXMod"] = 6,
								["textFace"] = "Accidental Presidency",
								["textAlign"] = 0,
								["textStyle"] = 2,
								["timeType"] = 1,
								["textSize"] = 10,
								["textYMod"] = 1,
							},
						},
						["left"] = "DETAILS_STATUSBAR_PLUGIN_PSEGMENT",
					},
					["instance_button_anchor"] = {
						-27, -- [1]
						1, -- [2]
					},
					["version"] = 3,
					["__snapV"] = false,
					["__locked"] = true,
					["menu_alpha"] = {
						["enabled"] = false,
						["onenter"] = 1,
						["iconstoo"] = true,
						["ignorebars"] = false,
						["onleave"] = 1,
					},
					["__snapH"] = false,
					["hide_in_combat_type"] = 1,
					["__was_opened"] = true,
					["strata"] = "LOW",
					["clickthrough_incombatonly"] = false,
					["__snap"] = {
						[3] = 2,
					},
					["menu_icons_size"] = 0.850000023841858,
					["hide_in_combat_alpha"] = 0,
					["plugins_grow_direction"] = 2,
					["bars_grow_direction"] = 1,
					["libwindow"] = {
						["y"] = 0.999941825866699,
						["x"] = -207.998046875,
						["point"] = "BOTTOMRIGHT",
						["scale"] = 1,
					},
					["statusbar_info"] = {
						["alpha"] = 0,
						["overlay"] = {
							0.0705882352941177, -- [1]
							0.0705882352941177, -- [2]
							0.0705882352941177, -- [3]
						},
					},
					["switch_damager_in_combat"] = false,
					["menu_anchor_down"] = {
						16, -- [1]
						-3, -- [2]
					},
					["row_show_animation"] = {
						["anim"] = "Fade",
						["options"] = {
						},
					},
					["total_bar"] = {
						["enabled"] = false,
						["only_in_group"] = false,
						["icon"] = "Interface\\ICONS\\INV_Sigil_Thorim",
						["color"] = {
							1, -- [1]
							1, -- [2]
							1, -- [3]
						},
					},
					["bars_sort_direction"] = 1,
					["grab_on_top"] = false,
					["backdrop_texture"] = "Details Ground",
					["bg_alpha"] = 0,
					["auto_current"] = true,
					["switch_tank_in_combat"] = false,
					["clickthrough_rows"] = false,
					["row_info"] = {
						["textR_outline"] = true,
						["spec_file"] = "Interface\\AddOns\\Details\\images\\spec_icons_normal",
						["textL_outline"] = true,
						["texture_highlight"] = "Interface\\FriendsFrame\\UI-FriendsList-Highlight",
						["textR_show_data"] = {
							true, -- [1]
							true, -- [2]
							false, -- [3]
						},
						["textL_enable_custom_text"] = false,
						["fixed_text_color"] = {
							1, -- [1]
							1, -- [2]
							1, -- [3]
						},
						["space"] = {
							["right"] = 0,
							["left"] = 0,
							["between"] = 0,
						},
						["texture_background_class_color"] = false,
						["textL_outline_small_color"] = {
							0, -- [1]
							0, -- [2]
							0, -- [3]
							1, -- [4]
						},
						["font_face_file"] = "Interface\\AddOns\\ElvUI\\Media\\Fonts\\Expressway.ttf",
						["textL_custom_text"] = "{data1}. {data3}{data2}",
						["font_size"] = 11,
						["textL_translit_text"] = false,
						["texture_custom_file"] = "Interface\\",
						["texture_file"] = "Interface\\AddOns\\ElvUI\\Media\\Textures\\Minimalist",
						["height"] = 17,
						["models"] = {
							["upper_model"] = "Spells\\AcidBreath_SuperGreen.M2",
							["lower_model"] = "World\\EXPANSION02\\DOODADS\\Coldarra\\COLDARRALOCUS.m2",
							["upper_alpha"] = 0.5,
							["lower_enabled"] = false,
							["lower_alpha"] = 0.1,
							["upper_enabled"] = false,
						},
						["icon_file"] = "Interface\\AddOns\\Details\\images\\classes_small",
						["icon_grayscale"] = false,
						["backdrop"] = {
							["enabled"] = false,
							["size"] = 10,
							["color"] = {
								1, -- [1]
								1, -- [2]
								1, -- [3]
								1, -- [4]
							},
							["texture"] = "Details BarBorder 2",
						},
						["textR_bracket"] = "(",
						["texture_custom"] = "",
						["textL_outline_small"] = true,
						["fixed_texture_color"] = {
							0, -- [1]
							0, -- [2]
							0, -- [3]
						},
						["textL_show_number"] = false,
						["textR_enable_custom_text"] = false,
						["textR_outline_small"] = false,
						["textR_custom_text"] = "{data1} ({data2}, {data3}%)",
						["texture"] = "Minimalist",
						["fixed_texture_background_color"] = {
							0, -- [1]
							0, -- [2]
							0, -- [3]
							0.150228589773178, -- [4]
						},
						["texture_background_file"] = "Interface\\AddOns\\ElvUI\\Media\\Textures\\Minimalist",
						["textR_class_colors"] = false,
						["textR_outline_small_color"] = {
							0, -- [1]
							0, -- [2]
							0, -- [3]
							1, -- [4]
						},
						["textL_class_colors"] = false,
						["texture_background"] = "Minimalist",
						["alpha"] = 1,
						["no_icon"] = false,
						["icon_offset"] = {
							0, -- [1]
							0, -- [2]
						},
						["start_after_icon"] = false,
						["font_face"] = "Expressway",
						["texture_class_colors"] = true,
						["percent_type"] = 1,
						["fast_ps_update"] = true,
						["textR_separator"] = "NONE",
						["use_spec_icons"] = true,
					},
					["hide_in_combat"] = false,
					["posicao"] = {
						["normal"] = {
							["y"] = -461.499946594238,
							["x"] = 649.501586914063,
							["w"] = 205.000473022461,
							["h"] = 155.000106811523,
						},
						["solo"] = {
							["y"] = 2,
							["x"] = 1,
							["w"] = 300,
							["h"] = 200,
						},
					},
					["desaturated_menu"] = false,
					["switch_tank"] = false,
					["wallpaper"] = {
						["overlay"] = {
							1, -- [1]
							1, -- [2]
							1, -- [3]
							1, -- [4]
						},
						["width"] = 283.000183105469,
						["texcoord"] = {
							0, -- [1]
							1, -- [2]
							0, -- [3]
							0.7, -- [4]
						},
						["enabled"] = false,
						["anchor"] = "all",
						["height"] = 114.042518615723,
						["alpha"] = 0.5,
						["texture"] = "Interface\\AddOns\\Details\\images\\background",
					},
					["stretch_button_side"] = 1,
					["show_sidebars"] = false,
					["micro_displays_locked"] = true,
					["auto_hide_menu"] = {
						["left"] = false,
						["right"] = false,
					},
					["bars_inverted"] = false,
				}, -- [1]
				{
					["__pos"] = {
						["normal"] = {
							["y"] = -461.499946594238,
							["x"] = 854.502319335938,
							["w"] = 205.000473022461,
							["h"] = 155.000106811523,
						},
						["solo"] = {
							["y"] = 2,
							["x"] = 1,
							["w"] = 300,
							["h"] = 200,
						},
					},
					["hide_in_combat_type"] = 1,
					["clickthrough_window"] = false,
					["menu_anchor"] = {
						16, -- [1]
						0, -- [2]
						["side"] = 2,
					},
					["bg_r"] = 0.0941176470588235,
					["hide_out_of_combat"] = false,
					["color_buttons"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["toolbar_icon_file"] = "Interface\\AddOns\\Details\\images\\toolbar_icons",
					["skin_custom"] = "",
					["tooltip"] = {
						["n_abilities"] = 3,
						["n_enemies"] = 3,
					},
					["switch_all_roles_in_combat"] = false,
					["clickthrough_toolbaricons"] = false,
					["attribute_text"] = {
						["enabled"] = true,
						["shadow"] = false,
						["side"] = 1,
						["text_color"] = {
							1, -- [1]
							1, -- [2]
							1, -- [3]
							1, -- [4]
						},
						["custom_text"] = "{name}",
						["text_face"] = "Expressway",
						["anchor"] = {
							-18, -- [1]
							3, -- [2]
						},
						["text_size"] = 10,
						["enable_custom_text"] = false,
						["show_timer"] = {
							true, -- [1]
							true, -- [2]
							true, -- [3]
						},
					},
					["ignore_mass_showhide"] = false,
					["switch_all_roles_after_wipe"] = false,
					["menu_icons"] = {
						true, -- [1]
						true, -- [2]
						false, -- [3]
						true, -- [4]
						true, -- [5]
						false, -- [6]
						["space"] = 0,
						["shadow"] = false,
					},
					["switch_damager"] = false,
					["auto_hide_menu"] = {
						["left"] = false,
						["right"] = false,
					},
					["window_scale"] = 1,
					["hide_icon"] = true,
					["toolbar_side"] = 1,
					["bg_g"] = 0.0941176470588235,
					["bg_b"] = 0.0941176470588235,
					["backdrop_texture"] = "Details Ground",
					["color"] = {
						0.0705882352941177, -- [1]
						0.0705882352941177, -- [2]
						0.0705882352941177, -- [3]
						0, -- [4]
					},
					["hide_on_context"] = {
						{
							["enabled"] = false,
							["inverse"] = false,
							["value"] = 100,
						}, -- [1]
						{
							["enabled"] = false,
							["inverse"] = false,
							["value"] = 100,
						}, -- [2]
						{
							["enabled"] = false,
							["inverse"] = false,
							["value"] = 100,
						}, -- [3]
						{
							["enabled"] = false,
							["inverse"] = false,
							["value"] = 100,
						}, -- [4]
						{
							["enabled"] = false,
							["inverse"] = false,
							["value"] = 100,
						}, -- [5]
						{
							["enabled"] = false,
							["inverse"] = false,
							["value"] = 100,
						}, -- [6]
						{
							["enabled"] = false,
							["inverse"] = false,
							["value"] = 100,
						}, -- [7]
						{
							["enabled"] = false,
							["inverse"] = false,
							["value"] = 100,
						}, -- [8]
						{
							["enabled"] = false,
							["inverse"] = false,
							["value"] = 100,
						}, -- [9]
						{
							["enabled"] = false,
							["inverse"] = false,
							["value"] = 100,
						}, -- [10]
						{
							["enabled"] = false,
							["inverse"] = false,
							["value"] = 100,
						}, -- [11]
						{
							["enabled"] = false,
							["inverse"] = false,
							["value"] = 100,
						}, -- [12]
						{
							["enabled"] = false,
							["inverse"] = false,
							["value"] = 100,
						}, -- [13]
						{
							["enabled"] = false,
							["inverse"] = false,
							["value"] = 100,
						}, -- [14]
						{
							["enabled"] = false,
							["inverse"] = false,
							["value"] = 100,
						}, -- [15]
					},
					["skin"] = "Minimalistic",
					["following"] = {
						["enabled"] = true,
						["bar_color"] = {
							1, -- [1]
							1, -- [2]
							1, -- [3]
						},
						["text_color"] = {
							1, -- [1]
							1, -- [2]
							1, -- [3]
						},
					},
					["switch_healer"] = false,
					["StatusBarSaved"] = {
						["center"] = "DETAILS_STATUSBAR_PLUGIN_CLOCK",
						["right"] = "DETAILS_STATUSBAR_PLUGIN_PDPS",
						["options"] = {
							["DETAILS_STATUSBAR_PLUGIN_PDPS"] = {
								["isHidden"] = false,
								["timeType"] = 1,
								["textYMod"] = 1,
								["segmentType"] = 2,
								["textFace"] = "Accidental Presidency",
								["maxSectionIds"] = 19,
								["textAlign"] = 3,
								["textSize"] = 10,
								["textColor"] = {
									1, -- [1]
									1, -- [2]
									1, -- [3]
									1, -- [4]
								},
							},
							["DETAILS_STATUSBAR_PLUGIN_PSEGMENT"] = {
								["isHidden"] = false,
								["segmentType"] = 2,
								["textFace"] = "Accidental Presidency",
								["textColor"] = {
									1, -- [1]
									1, -- [2]
									1, -- [3]
									1, -- [4]
								},
								["textAlign"] = 1,
								["timeType"] = 1,
								["textSize"] = 10,
								["textYMod"] = 1,
							},
							["DETAILS_STATUSBAR_PLUGIN_CLOCK"] = {
								["isHidden"] = false,
								["timeType"] = 1,
								["textYMod"] = 1,
								["segmentType"] = 2,
								["textFace"] = "Accidental Presidency",
								["maxSectionIds"] = 19,
								["textAlign"] = 2,
								["textSize"] = 10,
								["textColor"] = {
									1, -- [1]
									1, -- [2]
									1, -- [3]
									1, -- [4]
								},
							},
						},
						["left"] = "DETAILS_STATUSBAR_PLUGIN_PSEGMENT",
					},
					["instance_button_anchor"] = {
						-27, -- [1]
						1, -- [2]
					},
					["version"] = 3,
					["__snapV"] = false,
					["__locked"] = true,
					["menu_alpha"] = {
						["enabled"] = false,
						["onleave"] = 1,
						["ignorebars"] = false,
						["iconstoo"] = true,
						["onenter"] = 1,
					},
					["__snapH"] = false,
					["switch_healer_in_combat"] = false,
					["__was_opened"] = true,
					["strata"] = "LOW",
					["clickthrough_incombatonly"] = false,
					["__snap"] = {
						1, -- [1]
					},
					["show_statusbar"] = false,
					["hide_in_combat_alpha"] = 0,
					["menu_icons_size"] = 0.850000023841858,
					["plugins_grow_direction"] = 2,
					["libwindow"] = {
						["y"] = 0.999941825866699,
						["x"] = -2.99755859375,
						["point"] = "BOTTOMRIGHT",
						["scale"] = 1,
					},
					["statusbar_info"] = {
						["alpha"] = 0,
						["overlay"] = {
							0.0705882352941177, -- [1]
							0.0705882352941177, -- [2]
							0.0705882352941177, -- [3]
						},
					},
					["bars_grow_direction"] = 1,
					["menu_anchor_down"] = {
						16, -- [1]
						-3, -- [2]
					},
					["switch_damager_in_combat"] = false,
					["row_show_animation"] = {
						["anim"] = "Fade",
						["options"] = {
						},
					},
					["total_bar"] = {
						["enabled"] = false,
						["only_in_group"] = false,
						["icon"] = "Interface\\ICONS\\INV_Sigil_Thorim",
						["color"] = {
							1, -- [1]
							1, -- [2]
							1, -- [3]
						},
					},
					["grab_on_top"] = false,
					["bars_sort_direction"] = 1,
					["bg_alpha"] = 0,
					["auto_current"] = true,
					["switch_tank_in_combat"] = false,
					["micro_displays_locked"] = true,
					["clickthrough_rows"] = false,
					["hide_in_combat"] = false,
					["posicao"] = {
						["normal"] = {
							["y"] = -461.499946594238,
							["x"] = 854.502319335938,
							["w"] = 205.000473022461,
							["h"] = 155.000106811523,
						},
						["solo"] = {
							["y"] = 2,
							["x"] = 1,
							["w"] = 300,
							["h"] = 200,
						},
					},
					["row_info"] = {
						["textR_outline"] = true,
						["spec_file"] = "Interface\\AddOns\\Details\\images\\spec_icons_normal",
						["textL_outline"] = true,
						["texture_highlight"] = "Interface\\FriendsFrame\\UI-FriendsList-Highlight",
						["textR_show_data"] = {
							true, -- [1]
							true, -- [2]
							false, -- [3]
						},
						["textL_enable_custom_text"] = false,
						["fixed_text_color"] = {
							1, -- [1]
							1, -- [2]
							1, -- [3]
						},
						["space"] = {
							["right"] = 0,
							["left"] = 0,
							["between"] = 0,
						},
						["texture_background_class_color"] = false,
						["textL_outline_small_color"] = {
							0, -- [1]
							0, -- [2]
							0, -- [3]
							1, -- [4]
						},
						["font_face_file"] = "Interface\\AddOns\\ElvUI\\Media\\Fonts\\Expressway.ttf",
						["textL_custom_text"] = "{data1}. {data3}{data2}",
						["font_size"] = 11,
						["textL_translit_text"] = false,
						["texture_custom_file"] = "Interface\\",
						["texture_file"] = "Interface\\AddOns\\ElvUI\\Media\\Textures\\Minimalist",
						["height"] = 17.1636199951172,
						["models"] = {
							["upper_model"] = "Spells\\AcidBreath_SuperGreen.M2",
							["lower_model"] = "World\\EXPANSION02\\DOODADS\\Coldarra\\COLDARRALOCUS.m2",
							["upper_alpha"] = 0.5,
							["lower_enabled"] = false,
							["lower_alpha"] = 0.1,
							["upper_enabled"] = false,
						},
						["icon_file"] = "Interface\\AddOns\\Details\\images\\classes_small",
						["icon_grayscale"] = false,
						["backdrop"] = {
							["enabled"] = false,
							["size"] = 12,
							["color"] = {
								1, -- [1]
								1, -- [2]
								1, -- [3]
								1, -- [4]
							},
							["texture"] = "Details BarBorder 2",
						},
						["textR_bracket"] = "(",
						["texture_custom"] = "",
						["textL_outline_small"] = true,
						["fixed_texture_color"] = {
							0, -- [1]
							0, -- [2]
							0, -- [3]
						},
						["textL_show_number"] = false,
						["textR_enable_custom_text"] = false,
						["textR_outline_small"] = false,
						["textR_custom_text"] = "{data1} ({data2}, {data3}%)",
						["texture"] = "Minimalist",
						["fixed_texture_background_color"] = {
							0, -- [1]
							0, -- [2]
							0, -- [3]
							0.150228589773178, -- [4]
						},
						["texture_background_file"] = "Interface\\AddOns\\ElvUI\\Media\\Textures\\Minimalist",
						["textR_class_colors"] = false,
						["textR_outline_small_color"] = {
							0, -- [1]
							0, -- [2]
							0, -- [3]
							1, -- [4]
						},
						["textL_class_colors"] = false,
						["texture_background"] = "Minimalist",
						["alpha"] = 1,
						["no_icon"] = false,
						["icon_offset"] = {
							0, -- [1]
							0, -- [2]
						},
						["start_after_icon"] = false,
						["font_face"] = "Expressway",
						["texture_class_colors"] = true,
						["percent_type"] = 1,
						["fast_ps_update"] = false,
						["textR_separator"] = "NONE",
						["use_spec_icons"] = true,
					},
					["desaturated_menu"] = false,
					["wallpaper"] = {
						["overlay"] = {
							1, -- [1]
							1, -- [2]
							1, -- [3]
							1, -- [4]
						},
						["width"] = 204.000473022461,
						["texcoord"] = {
							0, -- [1]
							1, -- [2]
							0, -- [3]
							0.7, -- [4]
						},
						["enabled"] = false,
						["anchor"] = "all",
						["height"] = 155.000106811523,
						["alpha"] = 0.5,
						["texture"] = "Interface\\AddOns\\Details\\images\\background",
					},
					["stretch_button_side"] = 1,
					["switch_tank"] = false,
					["show_sidebars"] = false,
					["micro_displays_side"] = 2,
					["bars_inverted"] = false,
				}, -- [2]
			},
			["options_window"] = {
				["scale"] = 1,
			},
			["animation_speed_maxtravel"] = 3,
			["hotcorner_topleft"] = {
				["hide"] = false,
			},
			["deadlog_limit"] = 16,
			["font_faces"] = {
				["menus"] = "Expressway",
			},
			["instances_segments_locked"] = true,
			["instances_no_libwindow"] = false,
			["data_broker_text"] = "",
			["segments_amount"] = 25,
			["report_lines"] = 5,
			["clear_ungrouped"] = true,
			["font_sizes"] = {
				["menus"] = 10,
			},
			["skin"] = "Dark Theme",
			["override_spellids"] = true,
			["total_abbreviation"] = 2,
			["report_schema"] = 1,
			["animation_speed_triggertravel"] = 5,
			["use_battleground_server_parser"] = false,
			["minimum_combat_time"] = 5,
			["use_scroll"] = false,
			["cloud_capture"] = true,
			["damage_taken_everything"] = false,
			["scroll_speed"] = 2,
			["new_window_size"] = {
				["height"] = 158,
				["width"] = 310,
			},
			["chat_tab_embed"] = {
				["enabled"] = false,
				["tab_name"] = "",
				["x_offset"] = 0,
				["y_offset"] = 0,
				["single_window"] = false,
			},
			["deadlog_events"] = 32,
			["overall_clear_logout"] = false,
			["close_shields"] = false,
			["class_coords"] = {},
			["force_class_icons"] = false,
			["disable_alldisplays_window"] = false,
			["trash_auto_remove"] = true,
			["window_clamp"] = {
				-8, -- [1]
				0, -- [2]
				21, -- [3]
				-14, -- [4]
			},
			["windows_fade_out"] = {
				"out", -- [1]
				0.2, -- [2]
			},
			["numerical_system_symbols"] = "auto",
			["clear_graphic"] = true,
			["class_colors"] = {},
			["segments_auto_erase"] = 2,
			["options_group_edit"] = true,
			["broadcaster_enabled"] = false,
			["minimap"] = {
				["minimapPos"] = 220,
				["radius"] = 160,
				["text_type"] = 1,
				["onclick_what_todo"] = 1,
				["text_format"] = 3,
				["hide"] = true,
			},
			["instances_amount"] = 3,
			["max_window_size"] = {
				["height"] = 450,
				["width"] = 480,
			},
			["deny_score_messages"] = false,
			["only_pvp_frags"] = false,
			["disable_stretch_button"] = true,
			["default_bg_color"] = 0.0941,
			["standard_skin"] = false,
			["segments_amount_to_save"] = 25,
			["segments_panic_mode"] = false,
			["overall_flag"] = 16,
			["overall_clear_newboss"] = false,
			["row_fade_out"] = {
				"out", -- [1]
				0.2, -- [2]
			},
			["player_details_window"] = {
				["scale"] = 1,
				["bar_texture"] = "Skyline",
				["skin"] = "ElvUI",
			},
			["numerical_system"] = 1,
			["class_icons_small"] = "Interface\\AddOns\\Details\\images\\classes_small",
			["force_activity_time_pvp"] = true,
			["memory_threshold"] = 3,
			["pvp_as_group"] = true,
			["disable_reset_button"] = true,
			["animate_scroll"] = false,
			["death_tooltip_width"] = 350,
			["time_type"] = 2,
			["default_bg_alpha"] = 0.5,
			["time_type_original"] = 2,
		}

		-- General db
		_detalhes_global["always_use_profile"] = true
		_detalhes_global["always_use_profile_name"] = Classic

		-- Load the profile
		_detalhes:ApplyProfile(Classic)

	end
end
