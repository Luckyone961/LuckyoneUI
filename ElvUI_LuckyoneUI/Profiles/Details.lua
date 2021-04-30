local L1UI, E, L, V, P, G = unpack(select(2, ...))

-- DBM Profile
function L1UI:GetDetailsProfile()

	local key = "Luckyone"

	_detalhes_global = {
		["npcid_pool"] = {
		},
		["death_recap"] = {
			["show_segments"] = false,
			["enabled"] = true,
			["show_life_percent"] = false,
			["relevance_time"] = 7,
		},
		["spell_pool"] = {
		},
		["encounter_spell_pool"] = {
		},
		["immersion_pets_on_solo_play"] = false,
		["npcid_ignored"] = {
		},
		["report_where"] = "WHISPER",
		["auto_open_news_window"] = false,
		["got_first_run"] = true,
		["always_use_profile"] = true,
		["report_pos"] = {
			1, -- [1]
			1, -- [2]
		},
		["latest_report_table"] = {
			{
				1, -- [1]
				1, -- [2]
				1, -- [3]
				4, -- [4]
				"PARTY", -- [5]
			}, -- [1]
		},
		["exp90temp"] = {
			["delete_damage_TCOB"] = true,
		},
		["__profiles"] = {
			[key] = {
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
				["report_to_who"] = "Luckypriest",
				["class_specs_coords"] = {
					[62] = {
						0.251953125, -- [1]
						0.375, -- [2]
						0.125, -- [3]
						0.25, -- [4]
					},
					[63] = {
						0.375, -- [1]
						0.5, -- [2]
						0.125, -- [3]
						0.25, -- [4]
					},
					[250] = {
						0, -- [1]
						0.125, -- [2]
						0, -- [3]
						0.125, -- [4]
					},
					[251] = {
						0.125, -- [1]
						0.25, -- [2]
						0, -- [3]
						0.125, -- [4]
					},
					[252] = {
						0.25, -- [1]
						0.375, -- [2]
						0, -- [3]
						0.125, -- [4]
					},
					[253] = {
						0.875, -- [1]
						1, -- [2]
						0, -- [3]
						0.125, -- [4]
					},
					[254] = {
						0, -- [1]
						0.125, -- [2]
						0.125, -- [3]
						0.25, -- [4]
					},
					[255] = {
						0.125, -- [1]
						0.25, -- [2]
						0.125, -- [3]
						0.25, -- [4]
					},
					[66] = {
						0.125, -- [1]
						0.25, -- [2]
						0.25, -- [3]
						0.375, -- [4]
					},
					[257] = {
						0.5, -- [1]
						0.625, -- [2]
						0.25, -- [3]
						0.375, -- [4]
					},
					[258] = {
						0.6328125, -- [1]
						0.75, -- [2]
						0.25, -- [3]
						0.375, -- [4]
					},
					[259] = {
						0.75, -- [1]
						0.875, -- [2]
						0.25, -- [3]
						0.375, -- [4]
					},
					[260] = {
						0.875, -- [1]
						1, -- [2]
						0.25, -- [3]
						0.375, -- [4]
					},
					[577] = {
						0.25, -- [1]
						0.375, -- [2]
						0.5, -- [3]
						0.625, -- [4]
					},
					[262] = {
						0.125, -- [1]
						0.25, -- [2]
						0.375, -- [3]
						0.5, -- [4]
					},
					[581] = {
						0.375, -- [1]
						0.5, -- [2]
						0.5, -- [3]
						0.625, -- [4]
					},
					[264] = {
						0.375, -- [1]
						0.5, -- [2]
						0.375, -- [3]
						0.5, -- [4]
					},
					[265] = {
						0.5, -- [1]
						0.625, -- [2]
						0.375, -- [3]
						0.5, -- [4]
					},
					[266] = {
						0.625, -- [1]
						0.75, -- [2]
						0.375, -- [3]
						0.5, -- [4]
					},
					[267] = {
						0.75, -- [1]
						0.875, -- [2]
						0.375, -- [3]
						0.5, -- [4]
					},
					[268] = {
						0.625, -- [1]
						0.75, -- [2]
						0.125, -- [3]
						0.25, -- [4]
					},
					[269] = {
						0.875, -- [1]
						1, -- [2]
						0.125, -- [3]
						0.25, -- [4]
					},
					[270] = {
						0.75, -- [1]
						0.875, -- [2]
						0.125, -- [3]
						0.25, -- [4]
					},
					[70] = {
						0.251953125, -- [1]
						0.375, -- [2]
						0.25, -- [3]
						0.375, -- [4]
					},
					[102] = {
						0.375, -- [1]
						0.5, -- [2]
						0, -- [3]
						0.125, -- [4]
					},
					[71] = {
						0.875, -- [1]
						1, -- [2]
						0.375, -- [3]
						0.5, -- [4]
					},
					[103] = {
						0.5, -- [1]
						0.625, -- [2]
						0, -- [3]
						0.125, -- [4]
					},
					[72] = {
						0, -- [1]
						0.125, -- [2]
						0.5, -- [3]
						0.625, -- [4]
					},
					[104] = {
						0.625, -- [1]
						0.75, -- [2]
						0, -- [3]
						0.125, -- [4]
					},
					[73] = {
						0.125, -- [1]
						0.25, -- [2]
						0.5, -- [3]
						0.625, -- [4]
					},
					[64] = {
						0.5, -- [1]
						0.625, -- [2]
						0.125, -- [3]
						0.25, -- [4]
					},
					[105] = {
						0.75, -- [1]
						0.875, -- [2]
						0, -- [3]
						0.125, -- [4]
					},
					[65] = {
						0, -- [1]
						0.125, -- [2]
						0.25, -- [3]
						0.375, -- [4]
					},
					[256] = {
						0.375, -- [1]
						0.5, -- [2]
						0.25, -- [3]
						0.375, -- [4]
					},
					[261] = {
						0, -- [1]
						0.125, -- [2]
						0.375, -- [3]
						0.5, -- [4]
					},
					[263] = {
						0.25, -- [1]
						0.375, -- [2]
						0.375, -- [3]
						0.5, -- [4]
					},
				},
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
				["options_window"] = {
					["scale"] = 1,
				},
				["animation_speed_maxtravel"] = 3,
				["time_type_original"] = 2,
				["default_bg_alpha"] = 0.5,
				["font_faces"] = {
					["menus"] = "Expressway",
				},
				["time_type"] = 2,
				["segments_amount"] = 18,
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
						["toolbar_icon_file"] = "Interface\\AddOns\\Details\\images\\toolbar_icons",
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
						["switch_damager"] = false,
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
							["texture_file"] = "Interface\\Buttons\\WHITE8X8",
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
							["texture_background_file"] = "Interface\\Buttons\\WHITE8X8",
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
						["auto_hide_menu"] = {
							["left"] = false,
							["right"] = false,
						},
						["bg_alpha"] = 0,
						["switch_tank_in_combat"] = false,
						["switch_damager_in_combat"] = false,
						["bars_inverted"] = false,
						["bars_sort_direction"] = 1,
						["auto_current"] = true,
						["icon_desaturated"] = false,
						["menu_anchor_down"] = {
							16, -- [1]
							-3, -- [2]
						},
						["clickthrough_rows"] = false,
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
						["toolbar_icon_file"] = "Interface\\AddOns\\Details\\images\\toolbar_icons",
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
							["texture_file"] = "Interface\\Buttons\\WHITE8X8",
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
							["texture_background_file"] = "Interface\\Buttons\\WHITE8X8",
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
				["report_lines"] = 4,
				["clear_ungrouped"] = true,
				["class_icons_small"] = "Interface\\AddOns\\Details\\images\\classes_small",
				["skin"] = "Dark Theme",
				["override_spellids"] = true,
				["pvp_as_group"] = true,
				["force_activity_time_pvp"] = true,
				["numerical_system"] = 1,
				["player_details_window"] = {
					["scale"] = 1,
					["skin"] = "ElvUI",
					["bar_texture"] = "Skyline",
				},
				["overall_clear_logout"] = false,
				["chat_tab_embed"] = {
					["enabled"] = false,
					["y_offset"] = 0,
					["x_offset"] = 0,
					["tab_name"] = "",
					["single_window"] = false,
				},
				["cloud_capture"] = true,
				["damage_taken_everything"] = false,
				["scroll_speed"] = 2,
				["font_sizes"] = {
					["menus"] = 10,
				},
				["memory_threshold"] = 3,
				["deadlog_events"] = 32,
				["window_clamp"] = {
					-8, -- [1]
					0, -- [2]
					21, -- [3]
					-14, -- [4]
				},
				["close_shields"] = false,
				["class_coords"] = {
					["HUNTER"] = {
						0, -- [1]
						0.25, -- [2]
						0.25, -- [3]
						0.5, -- [4]
					},
					["WARRIOR"] = {
						0, -- [1]
						0.25, -- [2]
						0, -- [3]
						0.25, -- [4]
					},
					["ROGUE"] = {
						0.49609375, -- [1]
						0.7421875, -- [2]
						0, -- [3]
						0.25, -- [4]
					},
					["MAGE"] = {
						0.25, -- [1]
						0.49609375, -- [2]
						0, -- [3]
						0.25, -- [4]
					},
					["PET"] = {
						0.25, -- [1]
						0.49609375, -- [2]
						0.75, -- [3]
						1, -- [4]
					},
					["DRUID"] = {
						0.7421875, -- [1]
						0.98828125, -- [2]
						0, -- [3]
						0.25, -- [4]
					},
					["MONK"] = {
						0.5, -- [1]
						0.73828125, -- [2]
						0.5, -- [3]
						0.75, -- [4]
					},
					["DEATHKNIGHT"] = {
						0.25, -- [1]
						0.5, -- [2]
						0.5, -- [3]
						0.75, -- [4]
					},
					["ENEMY"] = {
						0, -- [1]
						0.25, -- [2]
						0.75, -- [3]
						1, -- [4]
					},
					["UNKNOW"] = {
						0.5, -- [1]
						0.75, -- [2]
						0.75, -- [3]
						1, -- [4]
					},
					["PRIEST"] = {
						0.49609375, -- [1]
						0.7421875, -- [2]
						0.25, -- [3]
						0.5, -- [4]
					},
					["UNGROUPPLAYER"] = {
						0.5, -- [1]
						0.75, -- [2]
						0.75, -- [3]
						1, -- [4]
					},
					["Alliance"] = {
						0.49609375, -- [1]
						0.7421875, -- [2]
						0.75, -- [3]
						1, -- [4]
					},
					["WARLOCK"] = {
						0.7421875, -- [1]
						0.98828125, -- [2]
						0.25, -- [3]
						0.5, -- [4]
					},
					["DEMONHUNTER"] = {
						0.73828126, -- [1]
						1, -- [2]
						0.5, -- [3]
						0.75, -- [4]
					},
					["Horde"] = {
						0.7421875, -- [1]
						0.98828125, -- [2]
						0.75, -- [3]
						1, -- [4]
					},
					["PALADIN"] = {
						0, -- [1]
						0.25, -- [2]
						0.5, -- [3]
						0.75, -- [4]
					},
					["SHAMAN"] = {
						0.25, -- [1]
						0.49609375, -- [2]
						0.25, -- [3]
						0.5, -- [4]
					},
					["MONSTER"] = {
						0, -- [1]
						0.25, -- [2]
						0.75, -- [3]
						1, -- [4]
					},
				},
				["overall_flag"] = 16,
				["disable_alldisplays_window"] = false,
				["numerical_system_symbols"] = "auto",
				["deny_score_messages"] = false,
				["total_abbreviation"] = 2,
				["segments_amount_to_save"] = 18,
				["clear_graphic"] = true,
				["class_colors"] = {
					["HUNTER"] = {
						0.67, -- [1]
						0.83, -- [2]
						0.45, -- [3]
					},
					["WARRIOR"] = {
						0.78, -- [1]
						0.61, -- [2]
						0.43, -- [3]
					},
					["PALADIN"] = {
						0.96, -- [1]
						0.55, -- [2]
						0.73, -- [3]
					},
					["MAGE"] = {
						0.41, -- [1]
						0.8, -- [2]
						0.94, -- [3]
					},
					["ARENA_YELLOW"] = {
						1, -- [1]
						1, -- [2]
						0.25, -- [3]
					},
					["UNGROUPPLAYER"] = {
						0.4, -- [1]
						0.4, -- [2]
						0.4, -- [3]
					},
					["DRUID"] = {
						1, -- [1]
						0.49, -- [2]
						0.04, -- [3]
					},
					["MONK"] = {
						0, -- [1]
						1, -- [2]
						0.59, -- [3]
					},
					["DEATHKNIGHT"] = {
						0.77, -- [1]
						0.12, -- [2]
						0.23, -- [3]
					},
					["WARLOCK"] = {
						0.58, -- [1]
						0.51, -- [2]
						0.79, -- [3]
					},
					["UNKNOW"] = {
						0.2, -- [1]
						0.2, -- [2]
						0.2, -- [3]
					},
					["PRIEST"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
					},
					["ROGUE"] = {
						1, -- [1]
						0.96, -- [2]
						0.41, -- [3]
					},
					["SHAMAN"] = {
						0, -- [1]
						0.44, -- [2]
						0.87, -- [3]
					},
					["ENEMY"] = {
						0.94117, -- [1]
						0, -- [2]
						0.0196, -- [3]
						1, -- [4]
					},
					["DEMONHUNTER"] = {
						0.64, -- [1]
						0.19, -- [2]
						0.79, -- [3]
					},
					["version"] = 1,
					["NEUTRAL"] = {
						1, -- [1]
						1, -- [2]
						0, -- [3]
					},
					["ARENA_GREEN"] = {
						0.4, -- [1]
						1, -- [2]
						0.4, -- [3]
					},
					["PET"] = {
						0.3, -- [1]
						0.4, -- [2]
						0.5, -- [3]
					},
				},
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
				["default_bg_color"] = 0.0941,
				["only_pvp_frags"] = false,
				["disable_stretch_button"] = true,
				["segments_auto_erase"] = 2,
				["trash_auto_remove"] = true,
				["hotcorner_topleft"] = {
					["hide"] = false,
				},
				["segments_panic_mode"] = false,
				["standard_skin"] = false,
				["windows_fade_out"] = {
					"out", -- [1]
					0.2, -- [2]
				},
				["row_fade_out"] = {
					"out", -- [1]
					0.2, -- [2]
				},
				["new_window_size"] = {
					["height"] = 158,
					["width"] = 310,
				},
				["minimum_combat_time"] = 5,
				["overall_clear_newboss"] = false,
				["report_schema"] = 1,
				["use_scroll"] = false,
				["use_battleground_server_parser"] = false,
				["disable_reset_button"] = true,
				["data_broker_text"] = "",
				["death_tooltip_width"] = 350,
				["instances_no_libwindow"] = false,
				["deadlog_limit"] = 16,
				["instances_segments_locked"] = true,
			},
		},
		["immersion_special_units"] = true,
		["deathlog_healingdone_min_arena"] = 400,
		["boss_mods_timers"] = {
			["encounter_timers_bw"] = {
			},
			["encounter_timers_dbm"] = {
			},
		},
		["plater"] = {
			["realtime_dps_enabled"] = false,
			["damage_taken_anchor"] = {
				["y"] = 0,
				["x"] = 0,
				["side"] = 7,
			},
			["realtime_dps_player_shadow"] = true,
			["damage_taken_enabled"] = false,
			["realtime_dps_player_size"] = 12,
			["damage_taken_size"] = 12,
			["realtime_dps_color"] = {
				1, -- [1]
				1, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["realtime_dps_anchor"] = {
				["y"] = 0,
				["x"] = 0,
				["side"] = 7,
			},
			["realtime_dps_size"] = 12,
			["damage_taken_shadow"] = true,
			["damage_taken_color"] = {
				1, -- [1]
				1, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["realtime_dps_player_color"] = {
				1, -- [1]
				1, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["realtime_dps_player_anchor"] = {
				["y"] = 0,
				["x"] = 0,
				["side"] = 7,
			},
			["realtime_dps_player_enabled"] = false,
			["realtime_dps_shadow"] = true,
		},
		["spell_school_cache"] = {
		},
		["deathlog_healingdone_min"] = 1,
		["tutorial"] = {
			["unlock_button"] = 0,
			["main_help_button"] = 1052,
			["FORGE_TUTORIAL"] = true,
			["DETAILS_INFO_TUTORIAL1"] = true,
			["alert_frames"] = {
				false, -- [1]
				false, -- [2]
				false, -- [3]
				false, -- [4]
				false, -- [5]
				false, -- [6]
			},
			["bookmark_tutorial"] = false,
			["MIN_COMBAT_TIME"] = true,
			["OVERALLDATA_WARNING1"] = 5,
			["logons"] = 1052,
			["version_announce"] = 0,
			["DETAILS_INFO_TUTORIAL2"] = 10,
			["ctrl_click_close_tutorial"] = false,
			["DISABLE_ONDEATH_PANEL"] = true,
			["STREAMER_PLUGIN_FIRSTRUN"] = true,
		},
		["exit_log"] = {
			"1 - Closing Janela Info.", -- [1]
			"2 - Clearing user place from instances.", -- [2]
			"4 - Reversing switches.", -- [3]
			"6 - Saving Config.", -- [4]
			"7 - Saving Profiles.", -- [5]
			"8 - Saving nicktag cache.", -- [6]
		},
		["mythic_plus"] = {
			["make_overall_boss_only"] = false,
			["mythicrun_chart_frame"] = {
			},
			["merge_boss_trash"] = false,
			["delay_to_show_graphic"] = 5,
			["always_in_combat"] = false,
			["make_overall_when_done"] = true,
			["delete_trash_after_merge"] = true,
			["show_damage_graphic"] = false,
			["mythicrun_chart_frame_ready"] = {
				["y"] = 7.62939453125e-05,
				["x"] = 3.0517578125e-05,
				["point"] = "CENTER",
				["scale"] = 1,
			},
			["boss_dedicated_segment"] = true,
			["mythicrun_chart_frame_minimized"] = {
			},
			["last_mythicrun_chart"] = {
			},
		},
		["damage_scroll_auto_open"] = true,
		["damage_scroll_position"] = {
		},
		["plugin_window_pos"] = {
			["y"] = -16.993896484375,
			["x"] = 189.5004119873047,
			["point"] = "TOPLEFT",
			["scale"] = 1,
		},
		["global_plugin_database"] = {
			["DETAILS_PLUGIN_ENCOUNTER_DETAILS"] = {
				["encounter_timers_bw"] = {
				},
				["encounter_timers_dbm"] = {
				},
			},
		},
		["run_code"] = {
			["on_groupchange"] = "\n-- this code runs when the player enter or leave a group",
			["on_zonechanged"] = "\n-- when the player changes zone, this code will run",
			["on_init"] = "\n-- code to run when Details! initializes, put here code which only will run once\n-- this also will run then the profile is changed\n\n--size of the death log tooltip in the Deaths display (default 350)\nDetails.death_tooltip_width = 350;\n\n--when in arena or battleground, details! silently switch to activity time (goes back to the old setting on leaving, default true)\nDetails.force_activity_time_pvp = true;\n\n--speed of the bar animations (default 33)\nDetails.animation_speed = 33;\n\n--threshold to trigger slow or fast speed (default 0.45)\nDetails.animation_speed_mintravel = 0.45;\n\n--call to update animations\nDetails:RefreshAnimationFunctions();\n\n--max window size, does require a /reload to work (default 480 x 450)\nDetails.max_window_size.width = 480;\nDetails.max_window_size.height = 450;\n\n--use the arena team color as the class color (default true)\nDetails.color_by_arena_team = true;\n\n--use the role icon in the player bar when inside an arena (default false)\nDetails.show_arena_role_icon = false;\n\n--how much time the update warning is shown (default 10)\nDetails.update_warning_timeout = 10;",
			["on_specchanged"] = "\n-- run when the player changes its spec",
			["on_leavecombat"] = "\n-- this code runs when the player leave combat",
			["on_entercombat"] = "\n-- this code runs when the player enters in combat",
		},
		["switchSaved"] = {
			["slots"] = 16,
			["table"] = {
				{
					["atributo"] = 1,
					["sub_atributo"] = 1,
				}, -- [1]
				{
					["atributo"] = 2,
					["sub_atributo"] = 1,
				}, -- [2]
				{
					["atributo"] = 1,
					["sub_atributo"] = 6,
				}, -- [3]
				{
					["atributo"] = 4,
					["sub_atributo"] = 5,
				}, -- [4]
				{
				}, -- [5]
				{
				}, -- [6]
				{
				}, -- [7]
				{
				}, -- [8]
				{
				}, -- [9]
				{
				}, -- [10]
				{
				}, -- [11]
				{
				}, -- [12]
				{
				}, -- [13]
				{
				}, -- [14]
				{
				}, -- [15]
				{
				}, -- [16]
			},
		},
		["current_exp_raid_encounters"] = {
			[2417] = true,
			[2418] = true,
			[2412] = true,
			[2405] = true,
			[2383] = true,
			[2406] = true,
			[2399] = true,
			[2407] = true,
			[2402] = true,
			[2398] = true,
		},
		["data_wipes_exp"] = {
			["9"] = true,
			["14"] = false,
			["13"] = false,
			["12"] = false,
			["11"] = false,
			["10"] = false,
		},
		["spellid_ignored"] = {
		},
		["createauraframe"] = {
			["y"] = 7.62939453125e-06,
			["x"] = -3.0517578125e-05,
			["point"] = "CENTER",
			["scale"] = 1,
		},
		["item_level_pool"] = {
		},
		["show_totalhitdamage_on_overkill"] = false,
		["savedCustomSpells"] = {
			{
				2, -- [1]
				"Auto Shot", -- [2]
				"Interface\\ICONS\\INV_Weapon_Bow_07", -- [3]
			}, -- [1]
			{
				3, -- [1]
				"Environment (Falling)", -- [2]
				"Interface\\ICONS\\Spell_Magic_FeatherFall", -- [3]
			}, -- [2]
			{
				55090, -- [1]
				"Scourge Strike (Physical)", -- [2]
				237530, -- [3]
			}, -- [3]
			{
				4, -- [1]
				"Environment (Drowning)", -- [2]
				"Interface\\ICONS\\Ability_Suffocate", -- [3]
			}, -- [4]
			{
				5, -- [1]
				"Environment (Fatigue)", -- [2]
				"Interface\\ICONS\\Spell_Arcane_MindMastery", -- [3]
			}, -- [5]
			{
				6, -- [1]
				"Environment (Fire)", -- [2]
				"Interface\\ICONS\\INV_SummerFest_FireSpirit", -- [3]
			}, -- [6]
			{
				7, -- [1]
				"Environment (Lava)", -- [2]
				"Interface\\ICONS\\Ability_Rhyolith_Volcano", -- [3]
			}, -- [7]
			{
				8, -- [1]
				"Environment (Slime)", -- [2]
				"Interface\\ICONS\\Ability_Creature_Poison_02", -- [3]
			}, -- [8]
			{
				59638, -- [1]
				"Frostbolt (Mirror Image)", -- [2]
				135846, -- [3]
			}, -- [9]
			{
				49184, -- [1]
				"Howling Blast (Main Target)", -- [2]
				135833, -- [3]
			}, -- [10]
			{
				44461, -- [1]
				"Living Bomb (explosion)", -- [2]
				236220, -- [3]
			}, -- [11]
			{
				278227, -- [1]
				"Barkspines (Trinket)", -- [2]
				134439, -- [3]
			}, -- [12]
			{
				268998, -- [1]
				"Kindled Soul (Trinket)", -- [2]
				651093, -- [3]
			}, -- [13]
			{
				196917, -- [1]
				"Light of the Martyr (Damage)", -- [2]
				135938, -- [3]
			}, -- [14]
			{
				120761, -- [1]
				"Glaive Toss (Glaive #2)", -- [2]
				132330, -- [3]
			}, -- [15]
			{
				278812, -- [1]
				"Lion's Grace (Trinket)", -- [2]
				464140, -- [3]
			}, -- [16]
			{
				270827, -- [1]
				"Webweaver's Soul Gem (Trinket)", -- [2]
				237431, -- [3]
			}, -- [17]
			{
				212739, -- [1]
				"Epidemic (Main Target)", -- [2]
				136066, -- [3]
			}, -- [18]
			{
				279664, -- [1]
				"Bloody Bile (Trinket)", -- [2]
				136007, -- [3]
			}, -- [19]
			{
				237680, -- [1]
				"Howling Blast (AoE)", -- [2]
				135833, -- [3]
			}, -- [20]
			{
				215969, -- [1]
				"Epidemic (AoE)", -- [2]
				136066, -- [3]
			}, -- [21]
			{
				278359, -- [1]
				"Blood Hatred (Trinket)", -- [2]
				132175, -- [3]
			}, -- [22]
			{
				278155, -- [1]
				"Lingering Power of Xalzaix (Trinket)", -- [2]
				254105, -- [3]
			}, -- [23]
			{
				271115, -- [1]
				"Ignition Mage's Fuse (Trinket)", -- [2]
				1119937, -- [3]
			}, -- [24]
			{
				277179, -- [1]
				"Gladiator's Medallion (Trinket)", -- [2]
				252267, -- [3]
			}, -- [25]
			{
				70890, -- [1]
				"Scourge Strike (Shadow)", -- [2]
				237530, -- [3]
			}, -- [26]
			{
				278057, -- [1]
				"Volatile Blood Explosion (Trinket)", -- [2]
				538040, -- [3]
			}, -- [27]
			{
				277185, -- [1]
				"Gladiator's Badge (Trinket)", -- [2]
				135884, -- [3]
			}, -- [28]
			{
				228649, -- [1]
				"Blackout Kick (Passive)", -- [2]
				574575, -- [3]
			}, -- [29]
			{
				121414, -- [1]
				"Glaive Toss (Glaive #1)", -- [2]
				132330, -- [3]
			}, -- [30]
			{
				94472, -- [1]
				"Atonement (critical)", -- [2]
				135887, -- [3]
			}, -- [31]
			{
				277187, -- [1]
				"Gladiator's Emblem (Trinket)", -- [2]
				132344, -- [3]
			}, -- [32]
			{
				277181, -- [1]
				"Gladiator's Insignia (Trinket)", -- [2]
				134501, -- [3]
			}, -- [33]
			{
				278862, -- [1]
				"Chill of the Runes (Trinket)", -- [2]
				252270, -- [3]
			}, -- [34]
			{
				271462, -- [1]
				"Rotcrusted Voodoo Doll (Trinket)", -- [2]
				1716867, -- [3]
			}, -- [35]
			{
				270925, -- [1]
				"Waterspout (Trinket)", -- [2]
				1698701, -- [3]
			}, -- [36]
			{
				271071, -- [1]
				"Conch of Dark Whispers (Trinket)", -- [2]
				1498840, -- [3]
			}, -- [37]
			{
				271465, -- [1]
				"Rotcrusted Voodoo Doll (Trinket)", -- [2]
				1716867, -- [3]
			}, -- [38]
			{
				33778, -- [1]
				"Lifebloom (Bloom)", -- [2]
				134206, -- [3]
			}, -- [39]
			{
				88082, -- [1]
				"Fireball (Mirror Image)", -- [2]
				135812, -- [3]
			}, -- [40]
			{
				1, -- [1]
				"Melee", -- [2]
				"Interface\\ICONS\\INV_Sword_04", -- [3]
			}, -- [41]
			{
				278383, -- [1]
				"Ruffling Tempest (Trinket)", -- [2]
				2103829, -- [3]
			}, -- [42]
			{
				271671, -- [1]
				"Cacaphonous Chord (Trinket)", -- [2]
				454048, -- [3]
			}, -- [43]
			{
				98021, -- [1]
				"Health Exchange", -- [2]
				237586, -- [3]
			}, -- [44]
			{
				339538, -- [1]
				"Templar's Verdict (Templar's Vindication)", -- [2]
				461860, -- [3]
			}, -- [45]
			{
				345020, -- [1]
				"Skulking Predator (Trinket)", -- [2]
				2103921, -- [3]
			}, -- [46]
			{
				108271, -- [1]
				"Astral Shift", -- [2]
				"Interface\\Addons\\Details\\images\\icon_astral_shift", -- [3]
			}, -- [47]
		},
		["profile_by_spec"] = {
		},
		["realm_sync"] = true,
		["raid_data"] = {
			["mythic_raid_data"] = {
			},
		},
		["update_warning_timeout"] = 10,
		["always_use_profile_name"] = key,
		["savedStyles"] = {
		},
		["always_use_profile_exception"] = {
		},
		["details_auras"] = {
		},
		["displays_by_spec"] = {
		},
		["savedTimeCaptures"] = {
		},
		["latest_news_saw"] = "v9.0.2.8246",
		["custom"] = {
			{
				["source"] = false,
				["author"] = "Details!",
				["desc"] = "Show who in your raid used a potion during the encounter.",
				["tooltip"] = "			--init:\n			local player, combat, instance = ...\n			\n			--get the debuff container for potion of focus\n			local debuff_uptime_container = player.debuff_uptime and player.debuff_uptime_spells and player.debuff_uptime_spells._ActorTable\n			if (debuff_uptime_container) then\n				local focus_potion = debuff_uptime_container [DETAILS_FOCUS_POTION_ID]\n				if (focus_potion) then\n				local name, _, icon = GetSpellInfo (DETAILS_FOCUS_POTION_ID)\n				GameCooltip:AddLine (name, 1) --> can use only 1 focus potion (can't be pre-potion)\n				_detalhes:AddTooltipBackgroundStatusbar()\n				GameCooltip:AddIcon (icon, 1, 1, _detalhes.tooltip.line_height, _detalhes.tooltip.line_height)\n				end\n			end\n			\n			--get the misc actor container\n			local buff_uptime_container = player.buff_uptime and player.buff_uptime_spells and player.buff_uptime_spells._ActorTable\n			if (buff_uptime_container) then\n				for spellId, _ in pairs (DetailsFramework.PotionIDs) do\n					local potionUsed = buff_uptime_container [spellId]\n			\n					if (potionUsed) then\n						local name, _, icon = GetSpellInfo (spellId)\n						GameCooltip:AddLine (name, potionUsed.activedamt)\n						_detalhes:AddTooltipBackgroundStatusbar()\n						GameCooltip:AddIcon (icon, 1, 1, _detalhes.tooltip.line_height, _detalhes.tooltip.line_height)\n					end\n				end\n			end\n			",
				["icon"] = "Interface\\ICONS\\INV_Potion_03",
				["name"] = "Potion Used",
				["spellid"] = false,
				["target"] = false,
				["script"] = "				--init:\n				local combat, instance_container, instance = ...\n				local total, top, amount = 0, 0, 0\n				\n				--get the misc actor container\n				local misc_container = combat:GetActorList ( DETAILS_ATTRIBUTE_MISC )\n				\n				--do the loop:\n				for _, player in ipairs ( misc_container ) do \n					\n					--only player in group\n					if (player:IsGroupPlayer()) then\n						\n						local found_potion = false\n						\n						--get the spell debuff uptime container\n						local debuff_uptime_container = player.debuff_uptime and player.debuff_uptime_spells and player.debuff_uptime_spells._ActorTable\n						if (debuff_uptime_container) then\n							--potion of focus (can't use as pre-potion, so, its amount is always 1\n							local focus_potion = debuff_uptime_container [DETAILS_FOCUS_POTION_ID]\n							\n							if (focus_potion) then\n								total = total + 1\n								found_potion = true\n								if (top < 1) then\n									top = 1\n								end\n								--add amount to the player \n								instance_container:AddValue (player, 1)\n							end\n						end\n						\n						--get the spell buff uptime container\n						local buff_uptime_container = player.buff_uptime and player.buff_uptime_spells and player.buff_uptime_spells._ActorTable\n						if (buff_uptime_container) then\n							for spellId, _ in pairs (DetailsFramework.PotionIDs) do\n								local potionUsed = buff_uptime_container [spellId]\n				\n								if (potionUsed) then\n									local used = potionUsed.activedamt\n									if (used and used > 0) then\n										total = total + used\n										found_potion = true\n										if (used > top) then\n											top = used\n										end\n				\n										--add amount to the player \n										instance_container:AddValue (player, used)\n									end\n								end\n							end\n						end\n						\n						if (found_potion) then\n							amount = amount + 1\n						end    \n					end\n				end\n				\n				--return:\n				return total, top, amount\n				",
				["attribute"] = false,
				["script_version"] = 6,
			}, -- [1]
			{
				["source"] = false,
				["total_script"] = false,
				["author"] = "Details! Team",
				["percent_script"] = false,
				["desc"] = "Show who in your raid group used the healthstone or a heal potion.",
				["icon"] = "Interface\\ICONS\\INV_Stone_04",
				["spellid"] = false,
				["name"] = "Health Potion & Stone",
				["script"] = "			--get the parameters passed\n			local combat, instance_container, instance = ...\n			--declade the values to return\n			local total, top, amount = 0, 0, 0\n			\n			--do the loop\n			local AllHealCharacters = combat:GetActorList (DETAILS_ATTRIBUTE_HEAL)\n			for index, character in ipairs (AllHealCharacters) do\n				local AllSpells = character:GetSpellList()\n				local found = false\n				for spellid, spell in pairs (AllSpells) do\n					if (DETAILS_HEALTH_POTION_LIST [spellid]) then\n						instance_container:AddValue (character, spell.total)\n						total = total + spell.total\n						if (top < spell.total) then\n							top = spell.total\n						end\n						found = true\n					end\n				end\n			\n				if (found) then\n					amount = amount + 1\n				end\n			end\n			--loop end\n			--return the values\n			return total, top, amount\n			",
				["target"] = false,
				["tooltip"] = "			--get the parameters passed\n			local actor, combat, instance = ...\n			\n			--get the cooltip object (we dont use the convencional GameTooltip here)\n			local GameCooltip = GameCooltip\n			local R, G, B, A = 0, 0, 0, 0.75\n			\n			local hs = actor:GetSpell (6262)\n			if (hs) then\n				GameCooltip:AddLine (select (1, GetSpellInfo(6262)),  _detalhes:ToK(hs.total))\n				GameCooltip:AddIcon (select (3, GetSpellInfo (6262)), 1, 1, _detalhes.tooltip.line_height, _detalhes.tooltip.line_height)\n				GameCooltip:AddStatusBar (100, 1, R, G, B, A)\n			end\n			\n			local pot = actor:GetSpell (DETAILS_HEALTH_POTION_ID)\n			if (pot) then\n				GameCooltip:AddLine (select (1, GetSpellInfo(DETAILS_HEALTH_POTION_ID)),  _detalhes:ToK(pot.total))\n				GameCooltip:AddIcon (select (3, GetSpellInfo (DETAILS_HEALTH_POTION_ID)), 1, 1, _detalhes.tooltip.line_height, _detalhes.tooltip.line_height)\n				GameCooltip:AddStatusBar (100, 1, R, G, B, A)\n			end\n			\n			local pot = actor:GetSpell (DETAILS_REJU_POTION_ID)\n			if (pot) then\n				GameCooltip:AddLine (select (1, GetSpellInfo(DETAILS_REJU_POTION_ID)),  _detalhes:ToK(pot.total))\n				GameCooltip:AddIcon (select (3, GetSpellInfo (DETAILS_REJU_POTION_ID)), 1, 1, _detalhes.tooltip.line_height, _detalhes.tooltip.line_height)\n				GameCooltip:AddStatusBar (100, 1, R, G, B, A)\n			end\n\n			--Cooltip code\n			",
				["attribute"] = false,
				["script_version"] = 15,
			}, -- [2]
			{
				["source"] = false,
				["author"] = "Details!",
				["tooltip"] = "				\n			",
				["percent_script"] = "				local value, top, total, combat, instance = ...\n				return string.format (\"%.1f\", value/top*100)\n			",
				["desc"] = "Tells how much time each character spent doing damage.",
				["icon"] = "Interface\\Buttons\\UI-MicroStream-Red",
				["spellid"] = false,
				["name"] = "Damage Activity Time",
				["script"] = "				--init:\n				local combat, instance_container, instance = ...\n				local total, amount = 0, 0\n\n				--get the misc actor container\n				local damage_container = combat:GetActorList ( DETAILS_ATTRIBUTE_DAMAGE )\n				\n				--do the loop:\n				for _, player in ipairs ( damage_container ) do \n					if (player.grupo) then\n						local activity = player:Tempo()\n						total = total + activity\n						amount = amount + 1\n						--add amount to the player \n						instance_container:AddValue (player, activity)\n					end\n				end\n				\n				--return:\n				return total, combat:GetCombatTime(), amount\n			",
				["target"] = false,
				["total_script"] = "				local value, top, total, combat, instance = ...\n				local minutos, segundos = math.floor (value/60), math.floor (value%60)\n				return minutos .. \"m \" .. segundos .. \"s\"\n			",
				["attribute"] = false,
				["script_version"] = 3,
			}, -- [3]
			{
				["source"] = false,
				["author"] = "Details!",
				["tooltip"] = "				\n			",
				["percent_script"] = "				local value, top, total, combat, instance = ...\n				return string.format (\"%.1f\", value/top*100)\n			",
				["desc"] = "Tells how much time each character spent doing healing.",
				["icon"] = "Interface\\Buttons\\UI-MicroStream-Green",
				["spellid"] = false,
				["name"] = "Healing Activity Time",
				["script"] = "				--init:\n				local combat, instance_container, instance = ...\n				local total, top, amount = 0, 0, 0\n\n				--get the misc actor container\n				local damage_container = combat:GetActorList ( DETAILS_ATTRIBUTE_HEAL )\n				\n				--do the loop:\n				for _, player in ipairs ( damage_container ) do \n					if (player.grupo) then\n						local activity = player:Tempo()\n						total = total + activity\n						amount = amount + 1\n						--add amount to the player \n						instance_container:AddValue (player, activity)\n					end\n				end\n				\n				--return:\n				return total, combat:GetCombatTime(), amount\n			",
				["target"] = false,
				["total_script"] = "				local value, top, total, combat, instance = ...\n				local minutos, segundos = math.floor (value/60), math.floor (value%60)\n				return minutos .. \"m \" .. segundos .. \"s\"\n			",
				["attribute"] = false,
				["script_version"] = 2,
			}, -- [4]
			{
				["source"] = false,
				["author"] = "Details!",
				["desc"] = "Show the crowd control amount for each player.",
				["total_script"] = "				local value, top, total, combat, instance = ...\n				return floor (value)\n			",
				["icon"] = "Interface\\ICONS\\Spell_Frost_FreezingBreath",
				["spellid"] = false,
				["name"] = "Crowd Control Done",
				["tooltip"] = "				local actor, combat, instance = ...\n				local spells = {}\n				for spellid, spell in pairs (actor.cc_done_spells._ActorTable) do\n				    tinsert (spells, {spellid, spell.counter})\n				end\n\n				table.sort (spells, _detalhes.Sort2)\n\n				for index, spell in ipairs (spells) do\n				    local name, _, icon = GetSpellInfo (spell [1])\n				    GameCooltip:AddLine (name, spell [2])\n				    _detalhes:AddTooltipBackgroundStatusbar()\n				    GameCooltip:AddIcon (icon, 1, 1, _detalhes.tooltip.line_height, _detalhes.tooltip.line_height)\n				end\n\n				local targets = {}\n				for playername, amount in pairs (actor.cc_done_targets) do\n				    tinsert (targets, {playername, amount})\n				end\n\n				table.sort (targets, _detalhes.Sort2)\n\n				_detalhes:AddTooltipSpellHeaderText (\"Targets\", \"yellow\", #targets)\n				local class, _, _, _, _, r, g, b = _detalhes:GetClass (actor.nome)\n				_detalhes:AddTooltipHeaderStatusbar (1, 1, 1, 0.6)\n\n				for index, target in ipairs (targets) do\n				    GameCooltip:AddLine (target[1], target [2])\n				    _detalhes:AddTooltipBackgroundStatusbar()\n				    \n				    local class, _, _, _, _, r, g, b = _detalhes:GetClass (target [1])\n				    if (class and class ~= \"UNKNOW\") then\n					local texture, l, r, t, b = _detalhes:GetClassIcon (class)\n					GameCooltip:AddIcon (\"Interface\\\\AddOns\\\\Details\\\\images\\\\classes_small_alpha\", 1, 1, _detalhes.tooltip.line_height, _detalhes.tooltip.line_height, l, r, t, b)\n				    else\n					GameCooltip:AddIcon (\"Interface\\\\GossipFrame\\\\IncompleteQuestIcon\", 1, 1, _detalhes.tooltip.line_height, _detalhes.tooltip.line_height)\n				    end\n				    --\n				end\n			",
				["target"] = false,
				["script"] = "				local combat, instance_container, instance = ...\n				local total, top, amount = 0, 0, 0\n\n				local misc_actors = combat:GetActorList (DETAILS_ATTRIBUTE_MISC)\n\n				for index, character in ipairs (misc_actors) do\n					if (character.cc_done and character:IsPlayer()) then\n						local cc_done = floor (character.cc_done)\n						instance_container:AddValue (character, cc_done)\n						total = total + cc_done\n						if (cc_done > top) then\n							top = cc_done\n						end\n						amount = amount + 1\n					end\n				end\n\n				return total, top, amount\n			",
				["attribute"] = false,
				["script_version"] = 11,
			}, -- [5]
			{
				["source"] = false,
				["author"] = "Details!",
				["desc"] = "Show the amount of crowd control received for each player.",
				["total_script"] = "				local value, top, total, combat, instance = ...\n				return floor (value)\n			",
				["icon"] = "Interface\\ICONS\\Spell_Frost_ChainsOfIce",
				["spellid"] = false,
				["name"] = "Crowd Control Received",
				["tooltip"] = "				local actor, combat, instance = ...\n				local name = actor:name()\n				local spells, from = {}, {}\n				local misc_actors = combat:GetActorList (DETAILS_ATTRIBUTE_MISC)\n\n				for index, character in ipairs (misc_actors) do\n				    if (character.cc_done and character:IsPlayer()) then\n					local on_actor = character.cc_done_targets [name]\n					if (on_actor) then\n					    tinsert (from, {character:name(), on_actor})\n					    \n					    for spellid, spell in pairs (character.cc_done_spells._ActorTable) do\n						\n						local spell_on_actor = spell.targets [name]\n						if (spell_on_actor) then\n						    local has_spell\n						    for index, spell_table in ipairs (spells) do\n							if (spell_table [1] == spellid) then\n							    spell_table [2] = spell_table [2] + spell_on_actor\n							    has_spell = true\n							end\n						    end\n						    if (not has_spell) then\n							tinsert (spells, {spellid, spell_on_actor}) \n						    end\n						end\n						\n					    end            \n					end\n				    end\n				end\n\n				table.sort (from, _detalhes.Sort2)\n				table.sort (spells, _detalhes.Sort2)\n\n				for index, spell in ipairs (spells) do\n				    local name, _, icon = GetSpellInfo (spell [1])\n				    GameCooltip:AddLine (name, spell [2])\n				    _detalhes:AddTooltipBackgroundStatusbar()\n				    GameCooltip:AddIcon (icon, 1, 1, _detalhes.tooltip.line_height, _detalhes.tooltip.line_height)    \n				end\n\n				_detalhes:AddTooltipSpellHeaderText (\"From\", \"yellow\", #from)\n				_detalhes:AddTooltipHeaderStatusbar (1, 1, 1, 0.6)\n\n				for index, t in ipairs (from) do\n				    GameCooltip:AddLine (t[1], t[2])\n				    _detalhes:AddTooltipBackgroundStatusbar()\n				    \n				    local class, _, _, _, _, r, g, b = _detalhes:GetClass (t [1])\n				    if (class and class ~= \"UNKNOW\") then\n					local texture, l, r, t, b = _detalhes:GetClassIcon (class)\n					GameCooltip:AddIcon (\"Interface\\\\AddOns\\\\Details\\\\images\\\\classes_small_alpha\", 1, 1, _detalhes.tooltip.line_height, _detalhes.tooltip.line_height, l, r, t, b)\n				    else\n					GameCooltip:AddIcon (\"Interface\\\\GossipFrame\\\\IncompleteQuestIcon\", 1, 1, _detalhes.tooltip.line_height, _detalhes.tooltip.line_height)\n				    end     \n				    \n				end\n			",
				["target"] = false,
				["script"] = "				local combat, instance_container, instance = ...\n				local total, top, amt = 0, 0, 0\n\n				local misc_actors = combat:GetActorList (DETAILS_ATTRIBUTE_MISC)\n				DETAILS_CUSTOM_CC_RECEIVED_CACHE = DETAILS_CUSTOM_CC_RECEIVED_CACHE or {}\n				wipe (DETAILS_CUSTOM_CC_RECEIVED_CACHE)\n\n				for index, character in ipairs (misc_actors) do\n				    if (character.cc_done and character:IsPlayer()) then\n					\n					for player_name, amount in pairs (character.cc_done_targets) do\n					    local target = combat (1, player_name) or combat (2, player_name)\n					    if (target and target:IsPlayer()) then\n						instance_container:AddValue (target, amount)\n						total = total + amount\n						if (amount > top) then\n						    top = amount\n						end\n						if (not DETAILS_CUSTOM_CC_RECEIVED_CACHE [player_name]) then\n						    DETAILS_CUSTOM_CC_RECEIVED_CACHE [player_name] = true\n						    amt = amt + 1\n						end\n					    end\n					end\n					\n				    end\n				end\n\n				return total, top, amt\n			",
				["attribute"] = false,
				["script_version"] = 3,
			}, -- [6]
			{
				["source"] = false,
				["author"] = "Details!",
				["percent_script"] = "				local value, top, total, combat, instance = ...\n				local dps = _detalhes:ToK (floor (value) / combat:GetCombatTime())\n				local percent = string.format (\"%.1f\", value/total*100)\n				return dps .. \", \" .. percent\n			",
				["desc"] = "Show your spells in the window.",
				["tooltip"] = "			--config:\n			--Background RBG and Alpha:\n			local R, G, B, A = 0, 0, 0, 0.75\n			local R, G, B, A = 0.1960, 0.1960, 0.1960, 0.8697\n\n			--get the parameters passed\n			local spell, combat, instance = ...\n\n			--get the cooltip object (we dont use the convencional GameTooltip here)\n			local GC = GameCooltip\n			GC:SetOption (\"YSpacingMod\", 0)\n\n			local role = DetailsFramework.UnitGroupRolesAssigned (\"player\")\n\n			if (spell.n_dmg) then\n			    \n			    local spellschool, schooltext = spell.spellschool, \"\"\n			    if (spellschool) then\n				local t = _detalhes.spells_school [spellschool]\n				if (t and t.name) then\n				    schooltext = t.formated\n				end\n			    end\n			    \n			    local total_hits = spell.counter\n			    local combat_time = instance.showing:GetCombatTime()\n			    \n			    local debuff_uptime_total, cast_string = \"\", \"\"\n			    local misc_actor = instance.showing (4, _detalhes.playername)\n			    if (misc_actor) then\n				local debuff_uptime = misc_actor.debuff_uptime_spells and misc_actor.debuff_uptime_spells._ActorTable [spell.id] and misc_actor.debuff_uptime_spells._ActorTable [spell.id].uptime\n				if (debuff_uptime) then\n				    debuff_uptime_total = floor (debuff_uptime / instance.showing:GetCombatTime() * 100)\n				end\n				\n				local spell_cast = misc_actor.spell_cast and misc_actor.spell_cast [spell.id]\n				\n				if (not spell_cast and misc_actor.spell_cast) then\n				    local spellname = GetSpellInfo (spell.id)\n				    for casted_spellid, amount in pairs (misc_actor.spell_cast) do\n					local casted_spellname = GetSpellInfo (casted_spellid)\n					if (casted_spellname == spellname) then\n					    spell_cast = amount .. \" (|cFFFFFF00?|r)\"\n					end\n				    end\n				end\n				if (not spell_cast) then\n				    spell_cast = \"(|cFFFFFF00?|r)\"\n				end\n				cast_string = cast_string .. spell_cast\n			    end\n			    \n			    --Cooltip code\n			    GC:AddLine (\"Casts:\", cast_string or \"?\")\n			    GC:AddStatusBar (100, 1, R, G, B, A)\n			    \n			    if (debuff_uptime_total ~= \"\") then\n				GC:AddLine (\"Uptime:\", (debuff_uptime_total or \"?\") .. \"%\")\n				GC:AddStatusBar (100, 1, R, G, B, A)\n			    end\n			    \n			    GC:AddLine (\"Hits:\", spell.counter)\n			    GC:AddStatusBar (100, 1, R, G, B, A)\n			    \n			    local average = spell.total / total_hits\n			    GC:AddLine (\"Average:\", _detalhes:ToK (average))\n			    GC:AddStatusBar (100, 1, R, G, B, A)\n			    \n			    GC:AddLine (\"E-Dps:\", _detalhes:ToK (spell.total / combat_time))\n			    GC:AddStatusBar (100, 1, R, G, B, A)\n			    \n			    GC:AddLine (\"School:\", schooltext)\n			    GC:AddStatusBar (100, 1, R, G, B, A)\n			    \n			    --GC:AddLine (\" \")\n			    \n			    GC:AddLine (\"Normal Hits: \", spell.n_amt .. \" (\" ..floor ( spell.n_amt/total_hits*100) .. \"%)\")\n			    GC:AddStatusBar (100, 1, R, G, B, A)\n			    \n			    local n_average = spell.n_dmg / spell.n_amt\n			    local T = (combat_time*spell.n_dmg)/spell.total\n			    local P = average/n_average*100\n			    T = P*T/100\n			    \n			    GC:AddLine (\"Average / E-Dps: \",  _detalhes:ToK (n_average) .. \" / \" .. format (\"%.1f\",spell.n_dmg / T ))\n			    GC:AddStatusBar (100, 1, R, G, B, A)\n			    \n			    --GC:AddLine (\" \")\n			    \n			    GC:AddLine (\"Critical Hits: \", spell.c_amt .. \" (\" ..floor ( spell.c_amt/total_hits*100) .. \"%)\")\n			    GC:AddStatusBar (100, 1, R, G, B, A)\n			    \n			    if (spell.c_amt > 0) then\n				local c_average = spell.c_dmg/spell.c_amt\n				local T = (combat_time*spell.c_dmg)/spell.total\n				local P = average/c_average*100\n				T = P*T/100\n				local crit_dps = spell.c_dmg / T\n				\n				GC:AddLine (\"Average / E-Dps: \",  _detalhes:ToK (c_average) .. \" / \" .. _detalhes:comma_value (crit_dps))\n			    else\n				GC:AddLine (\"Average / E-Dps: \",  \"0 / 0\")    \n			    end\n			    \n			    GC:AddStatusBar (100, 1, R, G, B, A)\n\n			    \n			elseif (spell.n_curado) then\n			    \n			    local spellschool, schooltext = spell.spellschool, \"\"\n			    if (spellschool) then\n				local t = _detalhes.spells_school [spellschool]\n				if (t and t.name) then\n				    schooltext = t.formated\n				end\n			    end\n			    \n			    local total_hits = spell.counter\n			    local combat_time = instance.showing:GetCombatTime()\n			    \n			    --Cooltip code\n			    GC:AddLine (\"Hits:\", spell.counter)\n			    GC:AddStatusBar (100, 1, R, G, B, A)\n			    \n			    local average = spell.total / total_hits\n			    GC:AddLine (\"Average:\", _detalhes:ToK (average))\n			    GC:AddStatusBar (100, 1, R, G, B, A)\n			    \n			    GC:AddLine (\"E-Hps:\", _detalhes:ToK (spell.total / combat_time))\n			    GC:AddStatusBar (100, 1, R, G, B, A)\n			    \n			    GC:AddLine (\"School:\", schooltext)\n			    GC:AddStatusBar (100, 1, R, G, B, A)\n			    \n			    --GC:AddLine (\" \")\n			    \n			    GC:AddLine (\"Normal Hits: \", spell.n_amt .. \" (\" ..floor ( spell.n_amt/total_hits*100) .. \"%)\")\n			    GC:AddStatusBar (100, 1, R, G, B, A)\n			    \n			    local n_average = spell.n_curado / spell.n_amt\n			    local T = (combat_time*spell.n_curado)/spell.total\n			    local P = average/n_average*100\n			    T = P*T/100\n			    \n			    GC:AddLine (\"Average / E-Dps: \",  _detalhes:ToK (n_average) .. \" / \" .. format (\"%.1f\",spell.n_curado / T ))\n			    GC:AddStatusBar (100, 1, R, G, B, A)\n			    \n			    --GC:AddLine (\" \")\n			    \n			    GC:AddLine (\"Critical Hits: \", spell.c_amt .. \" (\" ..floor ( spell.c_amt/total_hits*100) .. \"%)\")\n			    GC:AddStatusBar (100, 1, R, G, B, A)\n			    \n			    if (spell.c_amt > 0) then\n				local c_average = spell.c_curado/spell.c_amt\n				local T = (combat_time*spell.c_curado)/spell.total\n				local P = average/c_average*100\n				T = P*T/100\n				local crit_dps = spell.c_curado / T\n				\n				GC:AddLine (\"Average / E-Hps: \",  _detalhes:ToK (c_average) .. \" / \" .. _detalhes:comma_value (crit_dps))\n			    else\n				GC:AddLine (\"Average / E-Hps: \",  \"0 / 0\")    \n			    end\n			    \n			    GC:AddStatusBar (100, 1, R, G, B, A)\n			end\n			",
				["icon"] = "Interface\\CHATFRAME\\UI-ChatIcon-Battlenet",
				["name"] = "My Spells",
				["spellid"] = false,
				["target"] = false,
				["script"] = "				--get the parameters passed\n				local combat, instance_container, instance = ...\n				--declade the values to return\n				local total, top, amount = 0, 0, 0\n\n				local player\n				local pet_attribute\n				\n				local role = DetailsFramework.UnitGroupRolesAssigned (\"player\")\n				local spec = DetailsFramework.GetSpecialization()\n				role = spec and DetailsFramework.GetSpecializationRole (spec) or role\n\n				if (role == \"DAMAGER\") then\n					player = combat (DETAILS_ATTRIBUTE_DAMAGE, _detalhes.playername)\n					pet_attribute = DETAILS_ATTRIBUTE_DAMAGE\n				elseif (role == \"HEALER\") then    \n					player = combat (DETAILS_ATTRIBUTE_HEAL, _detalhes.playername)\n					pet_attribute = DETAILS_ATTRIBUTE_HEAL\n				else\n					player = combat (DETAILS_ATTRIBUTE_DAMAGE, _detalhes.playername)\n					pet_attribute = DETAILS_ATTRIBUTE_DAMAGE\n				end\n\n				--do the loop\n\n				if (player) then\n					local spells = player:GetSpellList()\n					for spellid, spell in pairs (spells) do\n						instance_container:AddValue (spell, spell.total)\n						total = total + spell.total\n						if (top < spell.total) then\n							top = spell.total\n						end\n						amount = amount + 1\n					end\n				    \n					for _, PetName in ipairs (player.pets) do\n						local pet = combat (pet_attribute, PetName)\n						if (pet) then\n							for spellid, spell in pairs (pet:GetSpellList()) do\n								instance_container:AddValue (spell, spell.total, nil, \" (\" .. PetName:gsub ((\" <.*\"), \"\") .. \")\")\n								total = total + spell.total\n								if (top < spell.total) then\n									top = spell.total\n								end\n								amount = amount + 1\n							end\n						end\n					end\n				end\n\n				--return the values\n				return total, top, amount\n			",
				["attribute"] = false,
				["script_version"] = 8,
			}, -- [7]
			{
				["source"] = false,
				["author"] = "Details!",
				["desc"] = "Show the amount of damage applied on targets marked with skull.",
				["tooltip"] = "				--get the parameters passed\n				local actor, combat, instance = ...\n\n				--get the cooltip object (we dont use the convencional GameTooltip here)\n				local GameCooltip = GameCooltip\n\n				--Cooltip code\n				local format_func = Details:GetCurrentToKFunction()\n\n				--Cooltip code\n				local RaidTargets = actor.raid_targets\n\n				local DamageOnStar = RaidTargets [128]\n				if (DamageOnStar) then\n				    --RAID_TARGET_8 is the built-in localized word for 'Skull'.\n				    GameCooltip:AddLine (RAID_TARGET_8 .. \":\", format_func (_, DamageOnStar))\n				    GameCooltip:AddIcon (\"Interface\\\\TARGETINGFRAME\\\\UI-RaidTargetingIcon_8\", 1, 1, _detalhes.tooltip.line_height, _detalhes.tooltip.line_height)\n				    Details:AddTooltipBackgroundStatusbar()\n				end\n			",
				["icon"] = "Interface\\TARGETINGFRAME\\UI-RaidTargetingIcon_8",
				["name"] = "Damage On Skull Marked Targets",
				["spellid"] = false,
				["target"] = false,
				["script"] = "				--get the parameters passed\n				local Combat, CustomContainer, Instance = ...\n				--declade the values to return\n				local total, top, amount = 0, 0, 0\n				\n				--raid target flags: \n				-- 128: skull \n				-- 64: cross\n				-- 32: square\n				-- 16: moon\n				-- 8: triangle\n				-- 4: diamond\n				-- 2: circle\n				-- 1: star\n				\n				--do the loop\n				for _, actor in ipairs (Combat:GetActorList (DETAILS_ATTRIBUTE_DAMAGE)) do\n				    if (actor:IsPlayer()) then\n					if (actor.raid_targets [128]) then\n					    CustomContainer:AddValue (actor, actor.raid_targets [128])\n					end        \n				    end\n				end\n\n				--if not managed inside the loop, get the values of total, top and amount\n				total, top = CustomContainer:GetTotalAndHighestValue()\n				amount = CustomContainer:GetNumActors()\n\n				--return the values\n				return total, top, amount\n			",
				["attribute"] = false,
				["script_version"] = 3,
			}, -- [8]
			{
				["source"] = false,
				["author"] = "Details!",
				["desc"] = "Show the amount of damage applied on targets marked with any other mark.",
				["tooltip"] = "				--get the parameters passed\n				local actor, combat, instance = ...\n\n				--get the cooltip object\n				local GameCooltip = GameCooltip\n\n				local format_func = Details:GetCurrentToKFunction()\n\n				--Cooltip code\n				local RaidTargets = actor.raid_targets\n\n				local DamageOnStar = RaidTargets [1]\n				if (DamageOnStar) then\n				    GameCooltip:AddLine (RAID_TARGET_1 .. \":\", format_func (_, DamageOnStar))\n				    GameCooltip:AddIcon (\"Interface\\\\TARGETINGFRAME\\\\UI-RaidTargetingIcon_1\", 1, 1, _detalhes.tooltip.line_height, _detalhes.tooltip.line_height)\n				    Details:AddTooltipBackgroundStatusbar()\n				end\n\n				local DamageOnCircle = RaidTargets [2]\n				if (DamageOnCircle) then\n				    GameCooltip:AddLine (RAID_TARGET_2 .. \":\", format_func (_, DamageOnCircle))\n				    GameCooltip:AddIcon (\"Interface\\\\TARGETINGFRAME\\\\UI-RaidTargetingIcon_2\", 1, 1, _detalhes.tooltip.line_height, _detalhes.tooltip.line_height)\n				    Details:AddTooltipBackgroundStatusbar()\n				end\n\n				local DamageOnDiamond = RaidTargets [4]\n				if (DamageOnDiamond) then\n				    GameCooltip:AddLine (RAID_TARGET_3 .. \":\", format_func (_, DamageOnDiamond))\n				    GameCooltip:AddIcon (\"Interface\\\\TARGETINGFRAME\\\\UI-RaidTargetingIcon_3\", 1, 1, _detalhes.tooltip.line_height, _detalhes.tooltip.line_height)\n				    Details:AddTooltipBackgroundStatusbar()\n				end\n\n				local DamageOnTriangle = RaidTargets [8]\n				if (DamageOnTriangle) then\n				    GameCooltip:AddLine (RAID_TARGET_4 .. \":\", format_func (_, DamageOnTriangle))\n				    GameCooltip:AddIcon (\"Interface\\\\TARGETINGFRAME\\\\UI-RaidTargetingIcon_4\", 1, 1, _detalhes.tooltip.line_height, _detalhes.tooltip.line_height)\n				    Details:AddTooltipBackgroundStatusbar()\n				end\n\n				local DamageOnMoon = RaidTargets [16]\n				if (DamageOnMoon) then\n				    GameCooltip:AddLine (RAID_TARGET_5 .. \":\", format_func (_, DamageOnMoon))\n				    GameCooltip:AddIcon (\"Interface\\\\TARGETINGFRAME\\\\UI-RaidTargetingIcon_5\", 1, 1, _detalhes.tooltip.line_height, _detalhes.tooltip.line_height)\n				    Details:AddTooltipBackgroundStatusbar()\n				end\n\n				local DamageOnSquare = RaidTargets [32]\n				if (DamageOnSquare) then\n				    GameCooltip:AddLine (RAID_TARGET_6 .. \":\", format_func (_, DamageOnSquare))\n				    GameCooltip:AddIcon (\"Interface\\\\TARGETINGFRAME\\\\UI-RaidTargetingIcon_6\", 1, 1, _detalhes.tooltip.line_height, _detalhes.tooltip.line_height)\n				    Details:AddTooltipBackgroundStatusbar()\n				end\n\n				local DamageOnCross = RaidTargets [64]\n				if (DamageOnCross) then\n				    GameCooltip:AddLine (RAID_TARGET_7 .. \":\", format_func (_, DamageOnCross))\n				    GameCooltip:AddIcon (\"Interface\\\\TARGETINGFRAME\\\\UI-RaidTargetingIcon_7\", 1, 1, _detalhes.tooltip.line_height, _detalhes.tooltip.line_height)\n				    Details:AddTooltipBackgroundStatusbar()\n				end\n			",
				["icon"] = "Interface\\TARGETINGFRAME\\UI-RaidTargetingIcon_5",
				["name"] = "Damage On Other Marked Targets",
				["spellid"] = false,
				["target"] = false,
				["script"] = "				--get the parameters passed\n				local Combat, CustomContainer, Instance = ...\n				--declade the values to return\n				local total, top, amount = 0, 0, 0\n\n				--do the loop\n				for _, actor in ipairs (Combat:GetActorList (DETAILS_ATTRIBUTE_DAMAGE)) do\n				    if (actor:IsPlayer()) then\n					local total = (actor.raid_targets [1] or 0) --star\n					total = total + (actor.raid_targets [2] or 0) --circle\n					total = total + (actor.raid_targets [4] or 0) --diamond\n					total = total + (actor.raid_targets [8] or 0) --tiangle\n					total = total + (actor.raid_targets [16] or 0) --moon\n					total = total + (actor.raid_targets [32] or 0) --square\n					total = total + (actor.raid_targets [64] or 0) --cross\n					\n					if (total > 0) then\n					    CustomContainer:AddValue (actor, total)\n					end\n				    end\n				end\n\n				--if not managed inside the loop, get the values of total, top and amount\n				total, top = CustomContainer:GetTotalAndHighestValue()\n				amount = CustomContainer:GetNumActors()\n\n				--return the values\n				return total, top, amount\n			",
				["attribute"] = false,
				["script_version"] = 3,
			}, -- [9]
			{
				["source"] = false,
				["author"] = "Details!",
				["desc"] = "Show overall damage done on the fly.",
				["total_script"] = "				local value, top, total, combat, instance = ...\n\n				--get the time of overall combat\n				local OverallCombatTime = Details:GetCombat (-1):GetCombatTime()\n\n				--get the time of current combat if the player is in combat\n				if (Details.in_combat) then\n				    local CurrentCombatTime = Details:GetCombat (0):GetCombatTime()\n				    OverallCombatTime = OverallCombatTime + CurrentCombatTime\n				end\n\n				--build the string\n				local ToK = Details:GetCurrentToKFunction()\n				local s = ToK (_, value / OverallCombatTime)\n				\n				if (instance.row_info.textR_show_data[3]) then\n				    s = ToK (_, value) .. \" (\" .. s .. \", \"\n				else\n				    s = ToK (_, value) .. \" (\" .. s\n				end\n\n				return s\n			",
				["icon"] = "Interface\\Buttons\\Spell-Reset",
				["spellid"] = false,
				["name"] = "Dynamic Overall Damage",
				["tooltip"] = "				--get the parameters passed\n				local actor, combat, instance = ...\n\n				--get the cooltip object (we dont use the convencional GameTooltip here)\n				local GameCooltip = GameCooltip2\n\n				--Cooltip code\n				--get the overall combat\n				local OverallCombat = Details:GetCombat (-1)\n				--get the current combat\n				local CurrentCombat = Details:GetCombat (0)\n\n				local AllSpells = {}\n\n				--overall\n				local player = OverallCombat [1]:GetActor (actor.nome)\n				local playerSpells = player:GetSpellList()\n				for spellID, spellTable in pairs (playerSpells) do\n				    AllSpells [spellID] = spellTable.total\n				end\n\n				--current\n				local player = CurrentCombat [1]:GetActor (actor.nome)\n				if (player) then\n					local playerSpells = player:GetSpellList()\n					for spellID, spellTable in pairs (playerSpells) do\n						AllSpells [spellID] = (AllSpells [spellID] or 0) + (spellTable.total or 0)\n					end\n				end\n\n				local sortedList = {}\n				for spellID, total in pairs (AllSpells) do\n				    tinsert (sortedList, {spellID, total})\n				end\n				table.sort (sortedList, Details.Sort2)\n\n				local format_func = Details:GetCurrentToKFunction()\n\n				--build the tooltip\n				for i, t in ipairs (sortedList) do\n				    local spellID, total = unpack (t)\n				    if (total > 1) then\n					local spellName, _, spellIcon = Details.GetSpellInfo (spellID)\n					\n					GameCooltip:AddLine (spellName, format_func (_, total))\n					Details:AddTooltipBackgroundStatusbar()\n					GameCooltip:AddIcon (spellIcon, 1, 1, _detalhes.tooltip.line_height, _detalhes.tooltip.line_height)\n				    end\n				end\n			",
				["target"] = false,
				["script"] = "				--init:\n				local combat, instance_container, instance = ...\n				local total, top, amount = 0, 0, 0\n\n				--get the overall combat\n				local OverallCombat = Details:GetCombat (-1)\n				--get the current combat\n				local CurrentCombat = Details:GetCombat (0)\n\n				if (not OverallCombat.GetActorList or not CurrentCombat.GetActorList) then\n				    return 0, 0, 0\n				end\n\n				--get the damage actor container for overall\n				local damage_container_overall = OverallCombat:GetActorList ( DETAILS_ATTRIBUTE_DAMAGE )\n				--get the damage actor container for current\n				local damage_container_current = CurrentCombat:GetActorList ( DETAILS_ATTRIBUTE_DAMAGE )\n\n				--do the loop:\n				for _, player in ipairs ( damage_container_overall ) do \n				    --only player in group\n				    if (player:IsGroupPlayer()) then\n					instance_container:AddValue (player, player.total)\n				    end\n				end\n\n				if (Details.in_combat) then\n				    for _, player in ipairs ( damage_container_current ) do \n					--only player in group\n					if (player:IsGroupPlayer()) then\n					    instance_container:AddValue (player, player.total)        \n					end\n				    end\n				end\n\n				total, top =  instance_container:GetTotalAndHighestValue()\n				amount =  instance_container:GetNumActors()\n\n				--return:\n				return total, top, amount\n			",
				["attribute"] = false,
				["script_version"] = 5,
			}, -- [10]
			{
				["source"] = false,
				["author"] = "Details!",
				["desc"] = "Damage done to shields",
				["tooltip"] = "				--get the parameters passed\n				local actor, Combat, instance = ...\n\n				--get the cooltip object (we dont use the convencional GameTooltip here)\n				local GameCooltip = GameCooltip\n\n				--Cooltip code\n				--get the actor total damage absorbed\n				local totalAbsorb = actor.totalabsorbed\n				local format_func = Details:GetCurrentToKFunction()\n\n				--get the damage absorbed by all the actor pets\n				for petIndex, petName in ipairs (actor.pets) do\n				    local pet = Combat :GetActor (1, petName)\n				    if (pet) then\n					totalAbsorb = totalAbsorb + pet.totalabsorbed\n				    end\n				end\n\n				GameCooltip:AddLine (actor:Name(), format_func (_, actor.totalabsorbed))\n				Details:AddTooltipBackgroundStatusbar()\n\n				for petIndex, petName in ipairs (actor.pets) do\n				    local pet = Combat :GetActor (1, petName)\n				    if (pet) then\n					totalAbsorb = totalAbsorb + pet.totalabsorbed\n					\n					GameCooltip:AddLine (petName, format_func (_, pet.totalabsorbed))\n					Details:AddTooltipBackgroundStatusbar()        \n					\n				    end\n				end\n			",
				["icon"] = "Interface\\ICONS\\Spell_Holy_PowerWordShield",
				["name"] = "Damage on Shields",
				["spellid"] = false,
				["target"] = false,
				["script"] = "				--get the parameters passed\n				local Combat, CustomContainer, Instance = ...\n				--declade the values to return\n				local total, top, amount = 0, 0, 0\n\n				--do the loop\n				for index, actor in ipairs (Combat:GetActorList(1)) do\n				    if (actor:IsPlayer()) then\n					\n					--get the actor total damage absorbed\n					local totalAbsorb = actor.totalabsorbed\n					\n					--get the damage absorbed by all the actor pets\n					for petIndex, petName in ipairs (actor.pets) do\n					    local pet = Combat :GetActor (1, petName)\n					    if (pet) then\n						totalAbsorb = totalAbsorb + pet.totalabsorbed\n					    end\n					end\n					\n					--add the value to the actor on the custom container\n					CustomContainer:AddValue (actor, totalAbsorb)        \n					\n				    end\n				end\n				--loop end\n\n				--if not managed inside the loop, get the values of total, top and amount\n				total, top = CustomContainer:GetTotalAndHighestValue()\n				amount = CustomContainer:GetNumActors()\n\n				--return the values\n				return total, top, amount\n			",
				["attribute"] = false,
				["script_version"] = 1,
			}, -- [11]
		},
		["performance_profiles"] = {
			["Dungeon"] = {
				["enabled"] = false,
				["update_speed"] = 1,
				["miscdata"] = true,
				["aura"] = true,
				["heal"] = true,
				["use_row_animations"] = false,
				["energy"] = false,
				["damage"] = true,
			},
			["RaidFinder"] = {
				["enabled"] = false,
				["update_speed"] = 1,
				["miscdata"] = true,
				["aura"] = true,
				["heal"] = true,
				["use_row_animations"] = false,
				["energy"] = false,
				["damage"] = true,
			},
			["Battleground15"] = {
				["enabled"] = false,
				["update_speed"] = 1,
				["miscdata"] = true,
				["aura"] = true,
				["heal"] = true,
				["use_row_animations"] = false,
				["energy"] = false,
				["damage"] = true,
			},
			["Battleground40"] = {
				["enabled"] = false,
				["update_speed"] = 1,
				["miscdata"] = true,
				["aura"] = true,
				["heal"] = true,
				["use_row_animations"] = false,
				["energy"] = false,
				["damage"] = true,
			},
			["Mythic"] = {
				["enabled"] = false,
				["update_speed"] = 1,
				["miscdata"] = true,
				["aura"] = true,
				["heal"] = true,
				["use_row_animations"] = false,
				["energy"] = false,
				["damage"] = true,
			},
			["Arena"] = {
				["enabled"] = false,
				["update_speed"] = 1,
				["miscdata"] = true,
				["aura"] = true,
				["heal"] = true,
				["use_row_animations"] = false,
				["energy"] = false,
				["damage"] = true,
			},
			["Raid30"] = {
				["enabled"] = false,
				["update_speed"] = 1,
				["miscdata"] = true,
				["aura"] = true,
				["heal"] = true,
				["use_row_animations"] = false,
				["energy"] = false,
				["damage"] = true,
			},
			["Raid15"] = {
				["enabled"] = false,
				["update_speed"] = 1,
				["miscdata"] = true,
				["aura"] = true,
				["heal"] = true,
				["use_row_animations"] = false,
				["energy"] = false,
				["damage"] = true,
			},
		},
		["last_changelog_size"] = 5455,
		["immersion_unit_special_icons"] = true,
		["lastUpdateWarning"] = 1608585777,
		["dungeon_data"] = {
		},
	}

	_detalhes:ApplyProfile(key)
end
