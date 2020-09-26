local L1UI, E, L, V, P, G = unpack(select(2, ...))

local twipe = table.wipe

-- Details profile setup
function L1UI:GetDetailsProfile()
	local key = "Luckyone"

	if _detalhes_global then twipe(_detalhes_global) end

	_detalhes_global = {
		["npcid_pool"] = {
		},
		["death_recap"] = {
			["enabled"] = true,
			["show_segments"] = false,
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
		["dungeon_data"] = {
		},
		["auto_open_news_window"] = true,
		["got_first_run"] = true,
		["report_pos"] = {
			1, -- [1]
			1, -- [2]
		},
		["latest_report_table"] = {
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
					["maximize_method"] = 1,
					["fontshadow"] = false,
					["border_size"] = 14,
					["menus_bg_texture"] = "Interface\\SPELLBOOK\\Spellbook-Page-1",
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
				["instances"] = {
					{
						["__pos"] = {
							["normal"] = {
								["y"] = -461.4997482299805,
								["x"] = 853.001708984375,
								["w"] = 204.0004730224609,
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
							["enabled"] = true,
							["shadow"] = false,
							["side"] = 1,
							["text_size"] = 10,
							["custom_text"] = "{name}",
							["text_face"] = "Expressway",
							["anchor"] = {
								-18, -- [1]
								3, -- [2]
							},
							["text_color"] = {
								1, -- [1]
								1, -- [2]
								1, -- [3]
								1, -- [4]
							},
							["enable_custom_text"] = false,
							["show_timer"] = false,
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
						["__snapH"] = true,
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
							["textL_outline_small"] = false,
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
							["models"] = {
								["upper_model"] = "Spells\\AcidBreath_SuperGreen.M2",
								["lower_model"] = "World\\EXPANSION02\\DOODADS\\Coldarra\\COLDARRALOCUS.m2",
								["upper_alpha"] = 0.5,
								["lower_enabled"] = false,
								["lower_alpha"] = 0.1,
								["upper_enabled"] = false,
							},
							["textL_translit_text"] = false,
							["height"] = 17.16361999511719,
							["texture_file"] = "Interface\\Buttons\\WHITE8X8",
							["texture_custom_file"] = "Interface\\",
							["font_size"] = 11,
							["icon_file"] = "Interface\\AddOns\\Details\\images\\classes_small",
							["icon_grayscale"] = false,
							["textL_custom_text"] = "{data1}. {data3}{data2}",
							["textR_bracket"] = "(",
							["textR_enable_custom_text"] = false,
							["textR_show_data"] = {
								true, -- [1]
								true, -- [2]
								false, -- [3]
							},
							["fixed_texture_color"] = {
								0, -- [1]
								0, -- [2]
								0, -- [3]
							},
							["textL_show_number"] = false,
							["texture_custom"] = "",
							["texture_highlight"] = "Interface\\FriendsFrame\\UI-FriendsList-Highlight",
							["textR_custom_text"] = "{data1} ({data2}, {data3}%)",
							["texture"] = "Solid",
							["fixed_texture_background_color"] = {
								0, -- [1]
								0, -- [2]
								0, -- [3]
								0.150228589773178, -- [4]
							},
							["texture_background_file"] = "Interface\\AddOns\\Details\\images\\bar4_reverse",
							["texture_background"] = "Details D'ictum (reverse)",
							["textR_outline_small_color"] = {
								0, -- [1]
								0, -- [2]
								0, -- [3]
								1, -- [4]
							},
							["textR_class_colors"] = false,
							["textL_class_colors"] = false,
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
						["show_statusbar"] = false,
						["libwindow"] = {
							["y"] = 1.003355860710144,
							["x"] = -207.99853515625,
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
								["y"] = -461.4965362548828,
								["x"] = 650.001220703125,
								["w"] = 204.0004730224609,
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
						["menu_icons_size"] = 0.850000023841858,
					}, -- [1]
					{
						["__pos"] = {
							["normal"] = {
								["y"] = -461.4965362548828,
								["x"] = 854.0015869140625,
								["w"] = 204.0004730224609,
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
							["textL_outline_small"] = false,
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
							["models"] = {
								["upper_model"] = "Spells\\AcidBreath_SuperGreen.M2",
								["lower_model"] = "World\\EXPANSION02\\DOODADS\\Coldarra\\COLDARRALOCUS.m2",
								["upper_alpha"] = 0.5,
								["lower_enabled"] = false,
								["lower_alpha"] = 0.1,
								["upper_enabled"] = false,
							},
							["textL_translit_text"] = false,
							["height"] = 17.16361999511719,
							["texture_file"] = "Interface\\Buttons\\WHITE8X8",
							["texture_custom_file"] = "Interface\\",
							["font_size"] = 11,
							["icon_file"] = "Interface\\AddOns\\Details\\images\\classes_small",
							["icon_grayscale"] = false,
							["textL_custom_text"] = "{data1}. {data3}{data2}",
							["textR_bracket"] = "(",
							["textR_enable_custom_text"] = false,
							["textR_show_data"] = {
								true, -- [1]
								true, -- [2]
								false, -- [3]
							},
							["fixed_texture_color"] = {
								0, -- [1]
								0, -- [2]
								0, -- [3]
							},
							["textL_show_number"] = false,
							["texture_custom"] = "",
							["texture_highlight"] = "Interface\\FriendsFrame\\UI-FriendsList-Highlight",
							["textR_custom_text"] = "{data1} ({data2}, {data3}%)",
							["texture"] = "Solid",
							["fixed_texture_background_color"] = {
								0, -- [1]
								0, -- [2]
								0, -- [3]
								0.150228589773178, -- [4]
							},
							["texture_background_file"] = "Interface\\AddOns\\Details\\images\\bar4_reverse",
							["texture_background"] = "Details D'ictum (reverse)",
							["textR_outline_small_color"] = {
								0, -- [1]
								0, -- [2]
								0, -- [3]
								1, -- [4]
							},
							["textR_class_colors"] = false,
							["textL_class_colors"] = false,
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
						["__snapH"] = true,
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
							["y"] = 1.003355860710144,
							["x"] = -3.998046875,
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
							["text_size"] = 10,
							["custom_text"] = "{name}",
							["text_face"] = "Expressway",
							["anchor"] = {
								-18, -- [1]
								3, -- [2]
							},
							["text_color"] = {
								1, -- [1]
								1, -- [2]
								1, -- [3]
								1, -- [4]
							},
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
								["y"] = -461.4965362548828,
								["x"] = 854.0015869140625,
								["w"] = 204.0004730224609,
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
						["fontstrings_text3_anchor"] = 35,
						["use_multi_fontstrings"] = false,
						["menu_icons_size"] = 0.850000023841858,
					}, -- [2]
				},
				["hotcorner_topleft"] = {
					["hide"] = false,
				},
				["font_faces"] = {
					["menus"] = "Expressway",
				},
				["deadlog_limit"] = 16,
				["instances_segments_locked"] = true,
				["instances_no_libwindow"] = false,
				["segments_amount"] = 18,
				["report_lines"] = 5,
				["data_broker_text"] = "",
				["clear_ungrouped"] = true,
				["skin"] = "Dark Theme",
				["override_spellids"] = true,
				["font_sizes"] = {
					["menus"] = 10,
				},
				["total_abbreviation"] = 2,
				["report_schema"] = 1,
				["animation_speed_triggertravel"] = 5,
				["minimum_combat_time"] = 5,
				["use_battleground_server_parser"] = false,
				["cloud_capture"] = true,
				["damage_taken_everything"] = false,
				["scroll_speed"] = 2,
				["new_window_size"] = {
					["height"] = 158,
					["width"] = 310,
				},
				["chat_tab_embed"] = {
					["enabled"] = false,
					["y_offset"] = 0,
					["x_offset"] = 0,
					["tab_name"] = "",
					["single_window"] = false,
				},
				["deadlog_events"] = 32,
				["use_scroll"] = false,
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
					["SHAMAN"] = {
						0.25, -- [1]
						0.49609375, -- [2]
						0.25, -- [3]
						0.5, -- [4]
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
					["MONSTER"] = {
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
					["ROGUE"] = {
						0.49609375, -- [1]
						0.7421875, -- [2]
						0, -- [3]
						0.25, -- [4]
					},
					["Alliance"] = {
						0.49609375, -- [1]
						0.7421875, -- [2]
						0.75, -- [3]
						1, -- [4]
					},
					["ENEMY"] = {
						0, -- [1]
						0.25, -- [2]
						0.75, -- [3]
						1, -- [4]
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
					["UNGROUPPLAYER"] = {
						0.5, -- [1]
						0.75, -- [2]
						0.75, -- [3]
						1, -- [4]
					},
					["WARLOCK"] = {
						0.7421875, -- [1]
						0.98828125, -- [2]
						0.25, -- [3]
						0.5, -- [4]
					},
				},
				["overall_clear_logout"] = false,
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
					["ROGUE"] = {
						1, -- [1]
						0.96, -- [2]
						0.41, -- [3]
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
					["SHAMAN"] = {
						0, -- [1]
						0.44, -- [2]
						0.87, -- [3]
					},
					["PET"] = {
						0.3, -- [1]
						0.4, -- [2]
						0.5, -- [3]
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
					["PALADIN"] = {
						0.96, -- [1]
						0.55, -- [2]
						0.73, -- [3]
					},
					["ARENA_GREEN"] = {
						0.4, -- [1]
						1, -- [2]
						0.4, -- [3]
					},
				},
				["segments_auto_erase"] = 2,
				["options_group_edit"] = true,
				["broadcaster_enabled"] = false,
				["minimap"] = {
					["onclick_what_todo"] = 1,
					["radius"] = 160,
					["text_type"] = 1,
					["minimapPos"] = 220,
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
				["segments_amount_to_save"] = 18,
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
				["pvp_as_group"] = true,
				["force_activity_time_pvp"] = true,
				["class_icons_small"] = "Interface\\AddOns\\Details\\images\\classes_small",
				["memory_threshold"] = 3,
				["disable_reset_button"] = true,
				["animate_scroll"] = false,
				["death_tooltip_width"] = 350,
				["time_type"] = 2,
				["default_bg_alpha"] = 0.5,
				["time_type_original"] = 2,
			},
		},
		["immersion_special_units"] = true,
		["boss_mods_timers"] = {
			["encounter_timers_bw"] = {
			},
			["encounter_timers_dbm"] = {
			},
		},
		["spell_school_cache"] = {
		},
		["deathlog_healingdone_min"] = 1,
		["plater"] = {
			["realtime_dps_enabled"] = false,
			["damage_taken_anchor"] = {
				["y"] = 0,
				["x"] = 0,
				["side"] = 7,
			},
			["realtime_dps_player_shadow"] = true,
			["realtime_dps_player_enabled"] = false,
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
			["realtime_dps_player_color"] = {
				1, -- [1]
				1, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["damage_taken_color"] = {
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
			["damage_taken_enabled"] = false,
			["realtime_dps_shadow"] = true,
		},
		["tutorial"] = {
			["bookmark_tutorial"] = false,
			["main_help_button"] = 2,
			["WINDOW_GROUP_MAKING1"] = true,
			["alert_frames"] = {
				false, -- [1]
				false, -- [2]
				false, -- [3]
				false, -- [4]
				false, -- [5]
				false, -- [6]
			},
			["OVERALLDATA_WARNING1"] = 4,
			["logons"] = 2,
			["version_announce"] = 0,
			["ctrl_click_close_tutorial"] = false,
			["unlock_button"] = 3,
			["WINDOW_LOCK_UNLOCK1"] = true,
		},
		["report_where"] = "SAY",
		["mythic_plus"] = {
			["make_overall_boss_only"] = false,
			["mythicrun_chart_frame"] = {
			},
			["merge_boss_trash"] = false,
			["delay_to_show_graphic"] = 5,
			["always_in_combat"] = false,
			["make_overall_when_done"] = true,
			["delete_trash_after_merge"] = true,
			["show_damage_graphic"] = true,
			["mythicrun_chart_frame_ready"] = {
			},
			["boss_dedicated_segment"] = true,
			["mythicrun_chart_frame_minimized"] = {
			},
			["last_mythicrun_chart"] = {
			},
		},
		["last_changelog_size"] = 1861,
		["run_code"] = {
			["on_specchanged"] = "\n-- run when the player changes its spec",
			["on_zonechanged"] = "\n-- when the player changes zone, this code will run",
			["on_init"] = "\n-- code to run when Details! initializes, put here code which only will run once\n-- this also will run then the profile is changed\n\n--size of the death log tooltip in the Deaths display (default 350)\nDetails.death_tooltip_width = 350;\n\n--when in arena or battleground, details! silently switch to activity time (goes back to the old setting on leaving, default true)\nDetails.force_activity_time_pvp = true;\n\n--speed of the bar animations (default 33)\nDetails.animation_speed = 33;\n\n--threshold to trigger slow or fast speed (default 0.45)\nDetails.animation_speed_mintravel = 0.45;\n\n--call to update animations\nDetails:RefreshAnimationFunctions();\n\n--max window size, does require a /reload to work (default 480 x 450)\nDetails.max_window_size.width = 480;\nDetails.max_window_size.height = 450;\n\n--use the arena team color as the class color (default true)\nDetails.color_by_arena_team = true;\n\n--use the role icon in the player bar when inside an arena (default false)\nDetails.show_arena_role_icon = false;\n\n--how much time the update warning is shown (default 10)\nDetails.update_warning_timeout = 10;",
			["on_groupchange"] = "\n-- this code runs when the player enter or leave a group",
			["on_leavecombat"] = "\n-- this code runs when the player leave combat",
			["on_entercombat"] = "\n-- this code runs when the player enters in combat",
		},
		["spellid_ignored"] = {
		},
		["damage_scroll_position"] = {
		},
		["plugin_window_pos"] = {
			["y"] = -43.99967956542969,
			["x"] = 50.00045776367188,
			["point"] = "CENTER",
			["scale"] = 1,
		},
		["show_totalhitdamage_on_overkill"] = false,
		["createauraframe"] = {
		},
		["item_level_pool"] = {
		},
		["global_plugin_database"] = {
		},
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
		},
		["damage_scroll_auto_open"] = true,
		["update_warning_timeout"] = 10,
		["raid_data"] = {
		},
		["switchSaved"] = {
			["slots"] = 14,
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
		["always_use_profile_name"] = "",
		["savedStyles"] = {
		},
		["always_use_profile_exception"] = {
		},
		["details_auras"] = {
		},
		["realm_sync"] = true,
		["savedTimeCaptures"] = {
		},
		["latest_news_saw"] = "v9.0.1.7841",
		["custom"] = {
		},
		["performance_profiles"] = {
			["Dungeon"] = {
				["enabled"] = false,
				["update_speed"] = 1,
				["aura"] = true,
				["miscdata"] = true,
				["heal"] = true,
				["use_row_animations"] = false,
				["energy"] = false,
				["damage"] = true,
			},
			["RaidFinder"] = {
				["enabled"] = false,
				["update_speed"] = 1,
				["aura"] = true,
				["miscdata"] = true,
				["heal"] = true,
				["use_row_animations"] = false,
				["energy"] = false,
				["damage"] = true,
			},
			["Battleground15"] = {
				["enabled"] = false,
				["update_speed"] = 1,
				["aura"] = true,
				["miscdata"] = true,
				["heal"] = true,
				["use_row_animations"] = false,
				["energy"] = false,
				["damage"] = true,
			},
			["Raid15"] = {
				["enabled"] = false,
				["update_speed"] = 1,
				["aura"] = true,
				["miscdata"] = true,
				["heal"] = true,
				["use_row_animations"] = false,
				["energy"] = false,
				["damage"] = true,
			},
			["Mythic"] = {
				["enabled"] = false,
				["update_speed"] = 1,
				["aura"] = true,
				["miscdata"] = true,
				["heal"] = true,
				["use_row_animations"] = false,
				["energy"] = false,
				["damage"] = true,
			},
			["Arena"] = {
				["enabled"] = false,
				["update_speed"] = 1,
				["aura"] = true,
				["miscdata"] = true,
				["heal"] = true,
				["use_row_animations"] = false,
				["energy"] = false,
				["damage"] = true,
			},
			["Raid30"] = {
				["enabled"] = false,
				["update_speed"] = 1,
				["aura"] = true,
				["miscdata"] = true,
				["heal"] = true,
				["use_row_animations"] = false,
				["energy"] = false,
				["damage"] = true,
			},
			["Battleground40"] = {
				["enabled"] = false,
				["update_speed"] = 1,
				["aura"] = true,
				["miscdata"] = true,
				["heal"] = true,
				["use_row_animations"] = false,
				["energy"] = false,
				["damage"] = true,
			},
		},
		["exit_log"] = {
			"1 - Closing Janela Info.", -- [1]
			"2 - Clearing user place from instances.", -- [2]
			"4 - Reversing switches.", -- [3]
			"6 - Saving Config.", -- [4]
			"7 - Saving Profiles.", -- [5]
			"8 - Saving nicktag cache.", -- [6]
		},
		["immersion_unit_special_icons"] = true,
		["lastUpdateWarning"] = 0,
		["always_use_profile"] = false,
	}

	_detalhes:ApplyProfile(key)
end
