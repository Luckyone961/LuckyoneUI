local L1UI, E, L, V, P, G = unpack(select(2, ...))

local IsAddOnLoaded = IsAddOnLoaded

-- Plater profile
function L1UI:Setup_Plater()
	if not IsAddOnLoaded('Plater') then return end

	-- Profile name
	local name = 'Luckyone'

	if E.Retail then

		-- Profile creation
		PlaterDB["profiles"][name] = PlaterDB["profiles"][name] or {}

		-- Profile db
		PlaterDB["profiles"][name] = {
			["aura_alpha"] = 1,
			["aura_consolidate"] = true,
			["aura_height"] = 20,
			["aura_height2"] = 20,
			["aura_show_buff_by_the_unit"] = false,
			["aura_show_crowdcontrol"] = true,
			["aura_show_enrage"] = true,
			["aura_sort"] = true,
			["aura_stack_font"] = "Expressway",
			["aura_timer_text_font"] = "Expressway",
			["aura_timer_text_size"] = 10,
			["aura_width"] = 20,
			["aura_width2"] = 20,
			["aura_x_offset"] = 0,
			["aura_y_offset"] = 2,
			["aura2_x_offset"] = 0,
			["aura2_y_offset"] = 5,
			["auras_per_row_amount"] = 6,
			["auras_per_row_amount2"] = 6,
			["aura_frame1_anchor"] = {
				["y"] = 2,
			},
			["aura_timer_text_shadow_color"] = {
				nil, -- [1]
				nil, -- [2]
				nil, -- [3]
				0, -- [4]
			},
			["aura_stack_shadow_color"] = {
				nil, -- [1]
				nil, -- [2]
				nil, -- [3]
				0, -- [4]
			},
			["aura_tracker"] = {
				["buff_tracked"] = {
					["321402"] = true,
					["322773"] = true,
					["333241"] = true,
					["327416"] = true,
					["322433"] = true,
					["333737"] = true,
					["321754"] = true,
					["331510"] = true,
					["343558"] = true,
					["327808"] = true,
					["344739"] = true,
					["317936"] = true,
					["326892"] = true,
					["340873"] = true,
					["343470"] = true,
					["333227"] = true,
					["343502"] = true,
					["336451"] = true,
					["209859"] = true,
					["336499"] = true,
					["326450"] = true,
					["330545"] = true,
					["178658"] = true,
					["226510"] = true,
				},
				["buff_banned"] = {
					["206150"] = true,
					["333553"] = true,
					["61574"] = true,
					["61573"] = true,
				},
			},
			["bossmod_aura_height"] = 30,
			["bossmod_aura_width"] = 30,
			["bossmod_cooldown_text_size"] = 15,
			["cast_statusbar_bgtexture"] = "Minimalist",
			["cast_statusbar_spark_texture"] = "Interface\\AddOns\\Plater\\images\\spark8",
			["cast_statusbar_texture"] = "Minimalist",
			["cast_statusbar_use_fade_effects"] = false,
			["castbar_icon_size"] = "same as castbar plus healthbar",
			["castbar_target_font"] = "Expressway",
			["castbar_target_notank"] = true,
			["extra_icon_caster_font"] = "Expressway",
			["extra_icon_caster_name"] = false,
			["extra_icon_caster_outline"] = "OUTLINE",
			["extra_icon_cooldown_reverse"] = true,
			["extra_icon_height"] = 20,
			["extra_icon_show_purge"] = true,
			["extra_icon_stack_font"] = "Expressway",
			["extra_icon_stack_outline"] = "OUTLINE",
			["extra_icon_timer_font"] = "Expressway",
			["extra_icon_timer_outline"] = "OUTLINE",
			["extra_icon_timer_size"] = 11,
			["extra_icon_width"] = 26,
			["first_run3"] = true,
			["health_cutoff_upper"] = false,
			["health_cutoff"] = false,
			["health_selection_overlay"] = "Minimalist",
			["health_statusbar_bgtexture"] = "Minimalist",
			["health_statusbar_texture"] = "Minimalist",
			["hide_friendly_castbars"] = true,
			["indicator_elite"] = false,
			["indicator_extra_raidmark"] = false,
			["indicator_faction"] = false,
			["indicator_pet"] = false,
			["indicator_raidmark_scale"] = 0.9,
			["indicator_rare"] = false,
			["indicator_scale"] = 1,
			["indicator_spec"] = false,
			["indicator_worldboss"] = false,
			["minor_height_scale"] = 1,
			["minor_width_scale"] = 1,
			["number_region_first_run"] = true,
			["patch_version"] = 19,
			["pet_height_scale"] = 1,
			["pet_width_scale"] = 1,
			["quick_hide"] = true,
			["range_check_alpha"] = 1,
			["range_check_in_range_or_target_alpha"] = 1,
			["semver"] = "3.3.0",
			["spell_animations"] = false,
			["target_highlight_alpha"] = 1,
			["target_highlight_height"] = 12,
			["target_highlight_texture"] = "Interface\\AddOns\\Plater\\images\\selection_indicator2",
			["target_indicator"] = "NONE",
			["target_shady_enabled"] = false,
			["ui_parent_base_strata"] = "LOW",
			["ui_parent_buff_special_strata"] = "LOW",
			["ui_parent_buff_strata"] = "LOW",
			["ui_parent_buff2_strata"] = "LOW",
			["ui_parent_cast_strata"] = "LOW",
			["ui_parent_scale_tune"] = 1,
			["update_throttle"] = 0.25,
			["use_name_translit"] = true,
			["use_ui_parent"] = true,
			["version"] = 13,
			["plate_config"] = {
				["global_health_height"] = 18,
				["global_health_width"] = 190,
				["player"] = {
					["spellpercent_text_font"] = "Expressway",
					["percent_text_shadow_color"] = {
						nil, -- [1]
						nil, -- [2]
						nil, -- [3]
						0, -- [4]
					},
					["power_percent_text_shadow_color"] = {
						nil, -- [1]
						nil, -- [2]
						nil, -- [3]
						0, -- [4]
					},
					["power_percent_text_font"] = "Expressway",
					["spellname_text_font"] = "Expressway",
					["spellpercent_text_shadow_color"] = {
						nil, -- [1]
						nil, -- [2]
						nil, -- [3]
						0, -- [4]
					},
					["percent_text_font"] = "Expressway",
					["spellname_text_shadow_color"] = {
						nil, -- [1]
						nil, -- [2]
						nil, -- [3]
						0, -- [4]
					},
				},
				["friendlyplayer"] = {
					["spellpercent_text_font"] = "Expressway",
					["actorname_use_class_color"] = true,
					["cast"] = {
						190, -- [1]
						12, -- [2]
					},
					["percent_text_shadow_color"] = {
						nil, -- [1]
						nil, -- [2]
						nil, -- [3]
						0, -- [4]
					},
					["spellname_text_outline"] = "OUTLINE",
					["level_text_font"] = "Expressway",
					["actorname_text_font"] = "Expressway",
					["actorname_use_guild_color"] = false,
					["level_text_shadow_color"] = {
						nil, -- [1]
						nil, -- [2]
						nil, -- [3]
						0, -- [4]
					},
					["cast_incombat"] = {
						190, -- [1]
					},
					["actorname_text_shadow_color"] = {
						nil, -- [1]
						nil, -- [2]
						nil, -- [3]
						0, -- [4]
					},
					["spellname_text_font"] = "Expressway",
					["spellpercent_text_shadow_color"] = {
						nil, -- [1]
						nil, -- [2]
						nil, -- [3]
						0, -- [4]
					},
					["actorname_text_size"] = 11,
					["level_text_outline"] = "OUTLINE",
					["percent_text_font"] = "Expressway",
					["spellname_text_shadow_color"] = {
						nil, -- [1]
						nil, -- [2]
						nil, -- [3]
						0, -- [4]
					},
					["health_incombat"] = {
						190, -- [1]
						18, -- [2]
					},
					["health"] = {
						190, -- [1]
						18, -- [2]
					},
				},
				["friendlynpc"] = {
					["spellpercent_text_font"] = "Expressway",
					["cast"] = {
						190, -- [1]
						12, -- [2]
					},
					["big_actortitle_text_size"] = 9,
					["spellname_text_outline"] = "OUTLINE",
					["big_actorname_text_shadow_color"] = {
						nil, -- [1]
						nil, -- [2]
						nil, -- [3]
						0, -- [4]
					},
					["level_text_font"] = "Expressway",
					["actorname_text_font"] = "Expressway",
					["all_names"] = false,
					["actorname_text_outline"] = "OUTLINE",
					["big_actortitle_text_font"] = "Expressway",
					["level_text_shadow_color"] = {
						nil, -- [1]
						nil, -- [2]
						nil, -- [3]
						0, -- [4]
					},
					["cast_incombat"] = {
						190, -- [1]
					},
					["relevance_state"] = 3,
					["actorname_text_shadow_color"] = {
						nil, -- [1]
						nil, -- [2]
						nil, -- [3]
						0, -- [4]
					},
					["big_actortitle_text_shadow_color"] = {
						nil, -- [1]
						nil, -- [2]
						nil, -- [3]
						0, -- [4]
					},
					["spellname_text_shadow_color"] = {
						nil, -- [1]
						nil, -- [2]
						nil, -- [3]
						0, -- [4]
					},
					["spellname_text_font"] = "Expressway",
					["spellpercent_text_shadow_color"] = {
						nil, -- [1]
						nil, -- [2]
						nil, -- [3]
						0, -- [4]
					},
					["actorname_text_size"] = 11,
					["big_actorname_text_font"] = "Expressway",
					["level_text_outline"] = "OUTLINE",
					["percent_text_shadow_color"] = {
						nil, -- [1]
						nil, -- [2]
						nil, -- [3]
						0, -- [4]
					},
					["percent_text_font"] = "Expressway",
					["health_incombat"] = {
						190, -- [1]
						18, -- [2]
					},
					["health"] = {
						190, -- [1]
						18, -- [2]
					},
				},
				["enemyplayer"] = {
					["big_actorname_text_size"] = 10,
					["spellpercent_text_font"] = "Expressway",
					["level_text_size"] = 8,
					["cast"] = {
						190, -- [1]
						12, -- [2]
					},
					["percent_text_shadow_color"] = {
						nil, -- [1]
						nil, -- [2]
						nil, -- [3]
						0, -- [4]
					},
					["spellpercent_text_anchor"] = {
						["x"] = -1,
					},
					["spellname_text_outline"] = "OUTLINE",
					["big_actorname_text_shadow_color"] = {
						nil, -- [1]
						nil, -- [2]
						nil, -- [3]
						0, -- [4]
					},
					["level_text_font"] = "Expressway",
					["actorname_text_font"] = "Expressway",
					["all_names"] = true,
					["actorname_text_outline"] = "OUTLINE",
					["actorname_text_spacing"] = 10,
					["quest_color_enemy"] = {
						1, -- [1]
						0.369, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["big_actortitle_text_font"] = "Expressway",
					["spellpercent_text_size"] = 9,
					["level_text_shadow_color"] = {
						nil, -- [1]
						nil, -- [2]
						nil, -- [3]
						0, -- [4]
					},
					["cast_incombat"] = {
						190, -- [1]
					},
					["actorname_text_shadow_color"] = {
						nil, -- [1]
						nil, -- [2]
						nil, -- [3]
						0, -- [4]
					},
					["spellname_text_anchor"] = {
						["x"] = 1,
						["side"] = 10,
					},
					["big_actortitle_text_shadow_color"] = {
						nil, -- [1]
						nil, -- [2]
						nil, -- [3]
						0, -- [4]
					},
					["percent_text_anchor"] = {
						["side"] = 11,
					},
					["spellname_text_shadow_color"] = {
						nil, -- [1]
						nil, -- [2]
						nil, -- [3]
						0, -- [4]
					},
					["spellpercent_text_shadow_color"] = {
						nil, -- [1]
						nil, -- [2]
						nil, -- [3]
						0, -- [4]
					},
					["spellname_text_font"] = "Expressway",
					["quest_color_neutral"] = {
						1, -- [1]
						0.65, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["actorname_text_size"] = 11,
					["big_actorname_text_font"] = "Expressway",
					["big_actortitle_text_size"] = 10,
					["level_text_outline"] = "OUTLINE",
					["percent_show_health"] = false,
					["percent_text_size"] = 11,
					["percent_text_font"] = "Expressway",
					["quest_enabled"] = true,
					["quest_color_enabled"] = true,
					["spellname_text_size"] = 9,
					["health"] = {
						190, -- [1]
						18, -- [2]
					},
					["actorname_text_anchor"] = {
						["x"] = 1,
						["side"] = 10,
					},
					["health_incombat"] = {
						190, -- [1]
						18, -- [2]
					},
					["level_text_enabled"] = false,
				},
				["enemynpc"] = {
					["spellpercent_text_font"] = "Expressway",
					["cast"] = {
						190, -- [1]
						12, -- [2]
					},
					["spellpercent_text_anchor"] = {
						["x"] = -1,
					},
					["big_actorname_text_shadow_color"] = {
						nil, -- [1]
						nil, -- [2]
						nil, -- [3]
						0, -- [4]
					},
					["level_text_font"] = "Expressway",
					["actorname_text_font"] = "Expressway",
					["actorname_text_outline"] = "OUTLINE",
					["big_actortitle_text_font"] = "Expressway",
					["spellpercent_text_size"] = 9,
					["level_text_shadow_color"] = {
						nil, -- [1]
						nil, -- [2]
						nil, -- [3]
						0, -- [4]
					},
					["cast_incombat"] = {
						190, -- [1]
						12, -- [2]
					},
					["actorname_text_shadow_color"] = {
						nil, -- [1]
						nil, -- [2]
						nil, -- [3]
						0, -- [4]
					},
					["spellname_text_anchor"] = {
						["x"] = 1,
						["side"] = 10,
					},
					["big_actortitle_text_shadow_color"] = {
						nil, -- [1]
						nil, -- [2]
						nil, -- [3]
						0, -- [4]
					},
					["percent_text_anchor"] = {
						["side"] = 11,
					},
					["spellname_text_font"] = "Expressway",
					["spellname_text_shadow_color"] = {
						nil, -- [1]
						nil, -- [2]
						nil, -- [3]
						0, -- [4]
					},
					["spellpercent_text_shadow_color"] = {
						nil, -- [1]
						nil, -- [2]
						nil, -- [3]
						0, -- [4]
					},
					["big_actorname_text_font"] = "Expressway",
					["level_text_outline"] = "OUTLINE",
					["percent_text_shadow_color"] = {
						nil, -- [1]
						nil, -- [2]
						nil, -- [3]
						0, -- [4]
					},
					["actorname_text_anchor"] = {
						["x"] = 1,
						["side"] = 10,
					},
					["percent_text_size"] = 11,
					["percent_text_font"] = "Expressway",
					["health_incombat"] = {
						190, -- [1]
						18, -- [2]
					},
					["health"] = {
						190, -- [1]
						18, -- [2]
					},
					["percent_show_health"] = false,
					["spellname_text_size"] = 9,
					["level_text_enabled"] = false,
				},
			},
			["hook_auto_imported"] = {
				["Reorder Nameplate"] = 4,
				["Dont Have Aura"] = 1,
				["Players Targetting Amount"] = 4,
				["Color Automation"] = 1,
				["Aura Reorder"] = 3,
				["Cast Bar Icon Config"] = 2,
				["Execute Range"] = 1,
				["Extra Border"] = 2,
				["Hide Neutral Units"] = 1,
				["Target Color"] = 3,
				["Attacking Specific Unit"] = 2,
				["Combo Points"] = 6,
			},
			["hook_data"] = {
				{
					["Enabled"] = true,
					["Revision"] = 106,
					["OptionsValues"] = {
					},
					["HooksTemp"] = {
					},
					["Author"] = "Luckyone-Laughing Skull",
					["Options"] = {
					},
					["Desc"] = "",
					["Hooks"] = {
						["Nameplate Updated"] = "function(self, unitId, unitFrame, envTable)\n    \n    local unitName = UnitName(unitId)\n    \n    -- Show First Name [Whitelist table]\n    local firstName = {\n        [3527] = true, -- Healing Stream Totem\n        [2630] = true, -- Earthbind Totem\n        [61245] = true, -- Capacitor Totem\n        [5925] = true, -- Grounding Totem\n        [105451] = true, -- Counterstrike Totem\n        [105427] = true, -- Skyfury Totem\n        [97369] = true, -- Liquid Magma Totem\n    }\n    \n    -- Show Full Name [Whitelist table]\n    local fullName = {\n        [167406] = true, -- Sire Fated\n    }\n    \n    if (unitName) then\n        local a , b, c, d, e, f = strsplit(' ', unitName, 5)\n        \n        if firstName [unitFrame.namePlateNpcId] then\n            unitFrame.healthBar.unitName:SetText(a)\n        elseif fullName[unitFrame.namePlateNpcId] then\n            unitFrame.healthBar.unitName:SetText(unitName)\n        else\n            unitFrame.healthBar.unitName:SetText(f or e or d or c or b or a)\n        end\n    end\nend",
					},
					["Prio"] = 1,
					["Name"] = "LuckyoneUI - Name",
					["LoadConditions"] = {
						["talent"] = {
						},
						["group"] = {
						},
						["class"] = {
						},
						["map_ids"] = {
						},
						["role"] = {
						},
						["pvptalent"] = {
						},
						["affix"] = {
						},
						["race"] = {
						},
						["encounter_ids"] = {
						},
						["spec"] = {
						},
					},
					["LastHookEdited"] = "",
					["Time"] = 1661180206,
					["Icon"] = 132115,
					["PlaterCore"] = 1,
				}, -- [1]
				{
					["Enabled"] = true,
					["Revision"] = 70,
					["OptionsValues"] = {
					},
					["HooksTemp"] = {
					},
					["Author"] = "Luckyone-Laughing Skull",
					["Options"] = {
					},
					["Desc"] = "",
					["Hooks"] = {
						["Nameplate Removed"] = "function(self, unitId, unitFrame, envTable)\n    envTable.UpdateBorder(unitFrame, false)\nend",
						["Cast Start"] = "function(self, unitId, unitFrame, envTable)\n    envTable.UpdateIconPosition(unitFrame)\n    envTable.UpdateBorder(unitFrame, true)\nend",
						["Cast Update"] = "function(self, unitId, unitFrame, envTable)\n    envTable.UpdateIconPosition(unitFrame)\nend",
						["Constructor"] = "function(self, unitId, unitFrame, envTable)\n    local hooksecurefunc = hooksecurefunc\n    \n    envTable.ShowIcon = Plater.db.profile.castbar_icon_show\n    envTable.IconAnchor = 'left'\n    envTable.IconSizeOffset = 0\n    \n    function envTable.UpdateIconPosition (unitFrame)\n        local castBar = unitFrame.castBar\n        local icon = castBar.Icon\n        local shield = castBar.BorderShield\n        \n        shield:Hide()\n        \n        if (envTable.ShowIcon) then\n            icon:ClearAllPoints()\n            \n            if (envTable.IconAnchor == 'left') then\n                icon:SetPoint ('topright', unitFrame.healthBar, 'topleft', 0, envTable.IconSizeOffset)\n                icon:SetPoint ('bottomright', unitFrame.castBar, 'bottomleft', 0, 0)\n                \n            elseif (envTable.IconAnchor == 'right') then\n                icon:SetPoint ('topleft', unitFrame.healthBar, 'topright', 0, envTable.IconSizeOffset)\n                icon:SetPoint ('bottomleft', unitFrame.castBar, 'bottomright', 0, 0)\n                \n            end\n            \n            icon:SetWidth (icon:GetHeight())\n            icon:Show()\n        else\n            icon:Hide()\n        end\n    end\n    \n    function envTable.UpdateBorder(unitFrame, casting)\n        local healthBar = unitFrame.healthBar\n        local castBar = unitFrame.castBar\n        \n        if casting then\n            if envTable.ShowIcon and castBar.Icon:IsShown() then\n                if envTable.IconAnchor == 'left' then\n                    healthBar.border:SetPoint('TOPLEFT', castBar.Icon, 'TOPLEFT', 0, 0)\n                    healthBar.border:SetPoint('BOTTOMRIGHT', castBar, 'BOTTOMRIGHT', 0, 0)\n                elseif envTable.IconAnchor == 'right' then\n                    healthBar.border:SetPoint('TOPRIGHT', castBar.Icon, 'TOPRIGHT', 0, 0)\n                    healthBar.border:SetPoint('BOTTOMLEFT', castBar, 'BOTTOMLEFT', 0, 0) \n                end\n            else\n                if envTable.IconAnchor == 'left' then\n                    healthBar.border:SetPoint('TOPLEFT', healthBar, 'TOPLEFT', 0, 0)\n                    healthBar.border:SetPoint('BOTTOMRIGHT', castBar, 'BOTTOMRIGHT', 0, 0)\n                elseif envTable.IconAnchor == 'right' then\n                    healthBar.border:SetPoint('TOPRIGHT', healthBar, 'TOPRIGHT', 0, 0)\n                    healthBar.border:SetPoint('BOTTOMLEFT', castBar, 'BOTTOMLEFT', 0, 0) \n                end\n            end\n        else\n            if envTable.IconAnchor == 'left' then\n                healthBar.border:SetPoint('TOPLEFT', healthBar, 'TOPLEFT', 0, 0)\n                healthBar.border:SetPoint('BOTTOMRIGHT', healthBar, 'BOTTOMRIGHT', 0, 0)\n            elseif envTable.IconAnchor == 'right' then\n                healthBar.border:SetPoint('TOPRIGHT', healthBar, 'TOPRIGHT', 0, 0)\n                healthBar.border:SetPoint('BOTTOMLEFT', healthBar, 'BOTTOMLEFT', 0, 0) \n            end\n        end\n    end\n    \n    if not unitFrame.castBar.borderChangeHooked then\n        hooksecurefunc(unitFrame.castBar, 'Hide', function() envTable.UpdateBorder(unitFrame, false) end)\n        unitFrame.castBar.borderChangeHooked = true\n    end\nend",
					},
					["Prio"] = 1,
					["Name"] = "LuckyoneUI - Castbar",
					["LoadConditions"] = {
						["talent"] = {
						},
						["group"] = {
						},
						["class"] = {
						},
						["map_ids"] = {
						},
						["role"] = {
						},
						["pvptalent"] = {
						},
						["affix"] = {
						},
						["race"] = {
						},
						["encounter_ids"] = {
						},
						["spec"] = {
						},
					},
					["LastHookEdited"] = "",
					["Time"] = 1661180261,
					["Icon"] = 132144,
					["PlaterCore"] = 1,
				}, -- [2]
				{
					["OptionsValues"] = {
					},
					["HooksTemp"] = {
					},
					["UID"] = "0x622bc8122a7529d",
					["Hooks"] = {
						["Initialization"] = "function(modTable)\n    local default = \"#00fbff\"\n    local affix = \"#C69B6D\"\n    \n    modTable.NpcColors = {\n        -- Grimrail Depot [DEPOT]\n        [81236] = default, -- Grimrail Technician\n        [81407] = default, -- Grimrail Bombardier\n        [80937] = default, -- Grom'kar Gunner\n        [88163] = default, -- Grom'kar Cinderseer\n        [82597] = default, -- Grom'kar Captain\n        -- Iron Docks [DOCKS]\n        [81603] = default, -- Champion Druna\n        [83025] = default, -- Grom'kar Battlemaster\n        [86526] = default, -- Grom'kar Chainmaster\n        [83026] = default, -- Siegemaster Olugar\n        [84028] = default, -- Siegemaster Rokra\n        -- Karazhan Lower [LOWER]\n        [114584] = default, -- Phantom Crew\n        [114628] = default, -- Skele] = default, \n        [114802] = default, -- Spectral Journeyman\n        -- Karazhan Upper [UPPER]\n        [114338] = default, -- Mana Confluence\n        [114249] = default, -- Volatile Energy\n        [115757] = default, -- Wrathguard Flamebringer\n        [115418] = default, -- Spider\n        [115488] = default, -- Infused Pyromancer\n        -- Mechagon Workshop [WORK]\n        [144293] = default, -- Waste Processing Unit\n        [144294] = default, -- Mechagon Tinkerer\n        [151325] = default, -- Alarm o Bot\n        [151657] = default, -- Bomb Tonk\n        -- Mechagon Junkyard [YARD]\n        [150146] = default, -- Scrapbone Shaman\n        [150160] = default, -- Scrapbone Bully\n        [150168] = default, -- Toxic Monstrosity\n        [150250] = default, -- Pistonhead Blaster\n        [150251] = default, -- Pistonhead Mechanic\n        [150292] = default, -- Mechagon Cavalry\n        [150297] = default, -- Mechagon Renormalizer\n        -- Tazavesh [TZ]\n        [178141] = default, -- Murkbrine Scalebinder\n        [179733] = default, -- Invigorating Fish Stick\n        [180431] = default, -- Focused Ritualist\n        [180433] = default, -- Wandering Pulsar\n        -- Affix Season 4\n        [189878] = affix, -- Nathrezim Infiltrator\n        [190174] = affix, -- Hypnosis Bat\n        [190128] = affix, -- Zul'gamux\n    }\n    function modTable.UpdateColor(unitFrame, envTable)\n        if not unitFrame or unitFrame.IsNpcWithoutHealthbar or unitFrame.IsFriendlyPlayerWithoutHealthbar then return end\n        -- Get color from modTable.NpcColors\n        local color = modTable.NpcColors [unitFrame.namePlateNpcId]\n        -- Set color from modTable.NpcColors\n        if (color) then\n            Plater.SetNameplateColor(unitFrame, color)\n        end\n    end\nend",
						["Nameplate Updated"] = "function (self, unitId, unitFrame, envTable, modTable)\n    modTable.UpdateColor (unitFrame, envTable)\nend",
					},
					["Time"] = 1661180206,
					["LoadConditions"] = {
						["talent"] = {
						},
						["group"] = {
						},
						["class"] = {
						},
						["map_ids"] = {
						},
						["role"] = {
						},
						["pvptalent"] = {
						},
						["affix"] = {
						},
						["race"] = {
						},
						["encounter_ids"] = {
						},
						["spec"] = {
						},
					},
					["Icon"] = 132276,
					["Enabled"] = true,
					["Revision"] = 54,
					["Options"] = {
					},
					["Author"] = "Luckyone-Laughing Skull",
					["Desc"] = "",
					["Prio"] = 1,
					["Name"] = "LuckyoneUI - Colors",
					["PlaterCore"] = 1,
					["LastHookEdited"] = "",
				}, -- [3]
			},
			["script_auto_imported"] = {
				["Cast - Important Target [P]"] = 1,
				["Aura - Buff Alert"] = 13,
				["Cast - Very Important"] = 12,
				["Explosion Affix M+"] = 11,
				["Aura - Debuff Alert"] = 11,
				["Cast - Castbar is Timer [P]"] = 2,
				["Cast - Ultra Important"] = 11,
				["Cast - Big Alert"] = 12,
				["Cast - Small Alert"] = 11,
				["Fixate On You"] = 11,
				["Spiteful Affix"] = 3,
				["Relics 9.2 M Dungeons"] = 2,
				["Unit - Main Target"] = 11,
				["Aura - Blink Time Left"] = 13,
				["Cast - Alert + Timer [P]"] = 2,
				["Countdown"] = 11,
				["Unit - Health Markers"] = 12,
				["Cast - Frontal Cone"] = 11,
				["Fixate"] = 11,
				["Cast - Tank Interrupt"] = 12,
				["Auto Set Skull"] = 11,
				["Unit - Important"] = 11,
				["Unit - Show Energy"] = 11,
			},
			["script_data"] = {
				{
					["ConstructorCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    --settings\n    envTable.NameplateSizeOffset = scriptTable.config.castBarHeight\n    envTable.ShowArrow = scriptTable.config.showArrow\n    envTable.ArrowAlpha = scriptTable.config.arrowAlpha\n    envTable.HealthBarColor = scriptTable.config.healthBarColor\n    \n    --creates the spark to show the cast progress inside the health bar\n    envTable.overlaySpark = envTable.overlaySpark or Plater:CreateImage (unitFrame.healthBar)\n    envTable.overlaySpark:SetBlendMode (\"ADD\")\n    envTable.overlaySpark.width = 16\n    envTable.overlaySpark.height = 36\n    envTable.overlaySpark.alpha = .9\n    envTable.overlaySpark.texture = [[Interface\\AddOns\\Plater\\images\\spark3]]\n    \n    envTable.topArrow = envTable.topArrow or Plater:CreateImage (unitFrame.healthBar)\n    envTable.topArrow:SetBlendMode (\"ADD\")\n    envTable.topArrow.width = scriptTable.config.arrowWidth\n    envTable.topArrow.height = scriptTable.config.arrowHeight\n    envTable.topArrow.alpha = envTable.ArrowAlpha\n    envTable.topArrow.texture = [[Interface\\BUTTONS\\Arrow-Down-Up]]\n    \n    --scale animation\n    envTable.smallScaleAnimation = envTable.smallScaleAnimation or Plater:CreateAnimationHub (unitFrame.healthBar)\n    Plater:CreateAnimation (envTable.smallScaleAnimation, \"SCALE\", 1, 0.075, 1, 1, 1.08, 1.08)\n    Plater:CreateAnimation (envTable.smallScaleAnimation, \"SCALE\", 2, 0.075, 1, 1, 0.95, 0.95)    \n    --envTable.smallScaleAnimation:Play() --envTable.smallScaleAnimation:Stop()\n    \nend\n\n\n\n\n\n\n\n",
					["OnHideCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    Plater.StopDotAnimation(unitFrame.healthBar, envTable.dotAnimation)\n    \n    envTable.overlaySpark:Hide()\n    envTable.topArrow:Hide()\n    \n    Plater.RefreshNameplateColor (unitFrame)\n    \n    envTable.smallScaleAnimation:Stop()\n    \n    --increase the nameplate size\n    local nameplateHeight = Plater.db.profile.plate_config.enemynpc.health_incombat [2]\n    unitFrame.healthBar:SetHeight (nameplateHeight)\nend\n\n\n",
					["OptionsValues"] = {
					},
					["Temp_OnShowCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    envTable.overlaySpark:Show()\n    \n    if (envTable.ShowArrow) then\n        envTable.topArrow:Show()\n    end\n    \n    Plater.FlashNameplateBorder (unitFrame, 0.05)   \n    Plater.FlashNameplateBody (unitFrame, \"\", 0.075)\n    \n    envTable.smallScaleAnimation:Play()\n    \n    --increase the nameplate size\n    local nameplateHeight = Plater.db.profile.plate_config.enemynpc.health_incombat [2]\n    unitFrame.healthBar:SetHeight (nameplateHeight + envTable.NameplateSizeOffset)\n    \n    envTable.overlaySpark.height = nameplateHeight + 5\n    \n    envTable.dotAnimation = Plater.PlayDotAnimation(unitFrame.healthBar, 2, scriptTable.config.dotColor, scriptTable.config.xOffset, scriptTable.config.yOffset)\n    \n    self:SetStatusBarColor (Plater:ParseColors (scriptTable.config.castBarColor))\nend\n\n\n\n\n\n\n",
					["ScriptType"] = 2,
					["UpdateCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    --update the percent\n    envTable.overlaySpark:SetPoint (\"left\", unitFrame.healthBar:GetWidth() * (envTable._CastPercent / 100)-9, 0)\n    \n    envTable.topArrow:SetPoint (\"bottomleft\", unitFrame.healthBar, \"topleft\", unitFrame.healthBar:GetWidth() * (envTable._CastPercent / 100) - 4, 2 )\n    \n    --forces the script to update on a 60Hz base\n    self.ThrottleUpdate = 0\n    \n\nend\n\n\n",
					["Time"] = 1661180262,
					["NpcNames"] = {
					},
					["url"] = "",
					["Icon"] = 2175503,
					["Options"] = {
						{
							["Type"] = 6,
							["Key"] = "option1",
							["Value"] = 0,
							["Name"] = "Option 1",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
							["Desc"] = "",
						}, -- [1]
						{
							["Type"] = 5,
							["Key"] = "option2",
							["Value"] = "Plays a special animation showing the explosion time.",
							["Name"] = "Option 2",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_label",
							["Desc"] = "",
						}, -- [2]
						{
							["Type"] = 6,
							["Key"] = "option3",
							["Value"] = 0,
							["Name"] = "Option 3",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
							["Desc"] = "",
						}, -- [3]
						{
							["Type"] = 2,
							["Max"] = 6,
							["Desc"] = "Increases the cast bar height by this value",
							["Min"] = 0,
							["Key"] = "castBarHeight",
							["Value"] = 3,
							["Name"] = "Cast Bar Height Mod",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
							["Fraction"] = false,
						}, -- [4]
						{
							["Type"] = 1,
							["Key"] = "castBarColor",
							["Value"] = {
								1, -- [1]
								0.5843137254902, -- [2]
								0, -- [3]
								1, -- [4]
							},
							["Name"] = "Cast Bar Color",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_color",
							["Desc"] = "Changes the cast bar color to this one.",
						}, -- [5]
						{
							["Type"] = 6,
							["Key"] = "option7",
							["Value"] = 0,
							["Name"] = "Option 7",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
							["Desc"] = "",
						}, -- [6]
						{
							["Type"] = 5,
							["Key"] = "option6",
							["Value"] = "Arrow:",
							["Name"] = "Arrow:",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_label",
							["Desc"] = "",
						}, -- [7]
						{
							["Type"] = 4,
							["Key"] = "showArrow",
							["Value"] = true,
							["Name"] = "Show Arrow",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_bool",
							["Desc"] = "Show an arrow above the nameplate showing the cast bar progress.",
						}, -- [8]
						{
							["Type"] = 2,
							["Max"] = 1,
							["Desc"] = "Arrow alpha.",
							["Min"] = 0,
							["Key"] = "arrowAlpha",
							["Value"] = 0.5,
							["Name"] = "Arrow Alpha",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
							["Fraction"] = true,
						}, -- [9]
						{
							["Type"] = 2,
							["Max"] = 12,
							["Desc"] = "Arrow Width.",
							["Min"] = 4,
							["Key"] = "arrowWidth",
							["Value"] = 8,
							["Name"] = "Arrow Width",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
							["Fraction"] = false,
						}, -- [10]
						{
							["Type"] = 2,
							["Max"] = 12,
							["Desc"] = "Arrow Height.",
							["Min"] = 4,
							["Key"] = "arrowHeight",
							["Value"] = 8,
							["Name"] = "Arrow Height",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
							["Fraction"] = false,
						}, -- [11]
						{
							["Type"] = 6,
							["Key"] = "option13",
							["Value"] = 0,
							["Name"] = "Option 13",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
							["Desc"] = "",
						}, -- [12]
						{
							["Type"] = 5,
							["Key"] = "option12",
							["Value"] = "Dot Animation:",
							["Name"] = "Dot Animation:",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_label",
							["Desc"] = "",
						}, -- [13]
						{
							["Type"] = 1,
							["Key"] = "dotColor",
							["Value"] = {
								1, -- [1]
								0.6156862745098, -- [2]
								0, -- [3]
								1, -- [4]
							},
							["Name"] = "Dot Color",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_color",
							["Desc"] = "Adjust the color of the dot animation.",
						}, -- [14]
						{
							["Type"] = 2,
							["Max"] = 10,
							["Desc"] = "Dot X Offset",
							["Min"] = -10,
							["Key"] = "xOffset",
							["Value"] = 4,
							["Name"] = "Dot X Offset",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
							["Fraction"] = false,
						}, -- [15]
						{
							["Type"] = 2,
							["Max"] = 10,
							["Desc"] = "Dot Y Offset",
							["Min"] = -10,
							["Key"] = "yOffset",
							["Value"] = 3,
							["Name"] = "Dot Y Offset",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
							["Fraction"] = false,
						}, -- [16]
					},
					["Temp_OnHideCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    Plater.StopDotAnimation(unitFrame.healthBar, envTable.dotAnimation)\n    \n    envTable.overlaySpark:Hide()\n    envTable.topArrow:Hide()\n    \n    Plater.RefreshNameplateColor (unitFrame)\n    \n    envTable.smallScaleAnimation:Stop()\n    \n    --increase the nameplate size\n    local nameplateHeight = Plater.db.profile.plate_config.enemynpc.health_incombat [2]\n    unitFrame.healthBar:SetHeight (nameplateHeight)\nend\n\n\n",
					["Revision"] = 470,
					["semver"] = "",
					["Desc"] = "Explosive Affix Script",
					["version"] = -1,
					["Author"] = "Bombad�o-Azralon",
					["Initialization"] = "function (scriptTable)\n    --insert code here\n    \nend\n\n\n",
					["OnShowCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    envTable.overlaySpark:Show()\n    \n    if (envTable.ShowArrow) then\n        envTable.topArrow:Show()\n    end\n    \n    Plater.FlashNameplateBorder (unitFrame, 0.05)   \n    Plater.FlashNameplateBody (unitFrame, \"\", 0.075)\n    \n    envTable.smallScaleAnimation:Play()\n    \n    --increase the nameplate size\n    local nameplateHeight = Plater.db.profile.plate_config.enemynpc.health_incombat [2]\n    unitFrame.healthBar:SetHeight (nameplateHeight + envTable.NameplateSizeOffset)\n    \n    envTable.overlaySpark.height = nameplateHeight + 5\n    \n    envTable.dotAnimation = Plater.PlayDotAnimation(unitFrame.healthBar, 2, scriptTable.config.dotColor, scriptTable.config.xOffset, scriptTable.config.yOffset)\n    \n    self:SetStatusBarColor (Plater:ParseColors (scriptTable.config.castBarColor))\nend\n\n\n\n\n\n\n",
					["Name"] = "Explosion Affix M+ [Plater]",
					["Temp_UpdateCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    --update the percent\n    envTable.overlaySpark:SetPoint (\"left\", unitFrame.healthBar:GetWidth() * (envTable._CastPercent / 100)-9, 0)\n    \n    envTable.topArrow:SetPoint (\"bottomleft\", unitFrame.healthBar, \"topleft\", unitFrame.healthBar:GetWidth() * (envTable._CastPercent / 100) - 4, 2 )\n    \n    --forces the script to update on a 60Hz base\n    self.ThrottleUpdate = 0\n    \n\nend\n\n\n",
					["SpellIds"] = {
						240446, -- [1]
					},
					["PlaterCore"] = 1,
					["Prio"] = 99,
					["Temp_Initialization"] = "function (scriptTable)\n    --insert code here\n    \nend\n\n\n",
					["Enabled"] = true,
					["Temp_ConstructorCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    --settings\n    envTable.NameplateSizeOffset = scriptTable.config.castBarHeight\n    envTable.ShowArrow = scriptTable.config.showArrow\n    envTable.ArrowAlpha = scriptTable.config.arrowAlpha\n    envTable.HealthBarColor = scriptTable.config.healthBarColor\n    \n    --creates the spark to show the cast progress inside the health bar\n    envTable.overlaySpark = envTable.overlaySpark or Plater:CreateImage (unitFrame.healthBar)\n    envTable.overlaySpark:SetBlendMode (\"ADD\")\n    envTable.overlaySpark.width = 16\n    envTable.overlaySpark.height = 36\n    envTable.overlaySpark.alpha = .9\n    envTable.overlaySpark.texture = [[Interface\\AddOns\\Plater\\images\\spark3]]\n    \n    envTable.topArrow = envTable.topArrow or Plater:CreateImage (unitFrame.healthBar)\n    envTable.topArrow:SetBlendMode (\"ADD\")\n    envTable.topArrow.width = scriptTable.config.arrowWidth\n    envTable.topArrow.height = scriptTable.config.arrowHeight\n    envTable.topArrow.alpha = envTable.ArrowAlpha\n    envTable.topArrow.texture = [[Interface\\BUTTONS\\Arrow-Down-Up]]\n    \n    --scale animation\n    envTable.smallScaleAnimation = envTable.smallScaleAnimation or Plater:CreateAnimationHub (unitFrame.healthBar)\n    Plater:CreateAnimation (envTable.smallScaleAnimation, \"SCALE\", 1, 0.075, 1, 1, 1.08, 1.08)\n    Plater:CreateAnimation (envTable.smallScaleAnimation, \"SCALE\", 2, 0.075, 1, 1, 0.95, 0.95)    \n    --envTable.smallScaleAnimation:Play() --envTable.smallScaleAnimation:Stop()\n    \nend\n\n\n\n\n\n\n\n",
				}, -- [1]
			},
			["saved_cvars"] = {
				["nameplateSelectedAlpha"] = "1",
				["ShowClassColorInNameplate"] = "1",
				["nameplateOverlapV"] = "1.6",
				["nameplateLargeTopInset"] = "-1",
				["nameplateShowEnemyMinus"] = "1",
				["nameplateShowAll"] = "1",
				["nameplateMotionSpeed"] = "0.05",
				["NamePlateClassificationScale"] = "1",
				["nameplateShowFriendlyTotems"] = "0",
				["nameplateShowEnemyMinions"] = "1",
				["nameplateShowFriendlyPets"] = "0",
				["nameplateShowFriendlyNPCs"] = "1",
				["nameplateSelectedScale"] = "1",
				["nameplateOverlapH"] = "1",
				["nameplateTargetRadialPosition"] = "1",
				["nameplateOtherTopInset"] = "-1",
				["nameplateMinAlpha"] = "0.90",
				["nameplateMinAlphaDistance"] = "-158489.31924611",
				["nameplateMotion"] = "1",
				["clampTargetNameplateToScreen"] = "1",
				["nameplateMinScale"] = "1",
				["nameplateMaxDistance"] = "100",
				["nameplateShowFriendlyMinions"] = "0",
				["nameplateShowFriends"] = "0",
				["NamePlateHorizontalScale"] = "1",
				["ShowNamePlateLoseAggroFlash"] = "0",
				["nameplateShowFriendlyGuardians"] = "0",
				["nameplateTargetBehindMaxDistance"] = "30",
				["nameplatePersonalHideDelaySeconds"] = "0.2",
				["nameplateShowEnemies"] = "1",
				["nameplateResourceOnTarget"] = "0",
				["NamePlateVerticalScale"] = "1",
			},
			["cast_statusbar_color_nointerrupt"] = {
				1, -- [1]
				0, -- [2]
				0.00, -- [3]
				0.96, -- [4]
			},
			["extra_icon_anchor"] = {
				["x"] = -2,
			},
			["click_space_friendly"] = {
				nil, -- [1]
				18, -- [2]
			},
			["OptionsPanelDB"] = {
				["PlaterOptionsPanelFrame"] = {
					["scale"] = 1,
				},
			},
			["ghost_auras"] = {
				["auras"] = {},
			},
			["castbar_target_shadow_color"] = {
				nil, -- [1]
				nil, -- [2]
				nil, -- [3]
				0, -- [4]
			},
			["target_highlight_color"] = {
				nil, -- [1]
				1, -- [2]
			},
			["resources"] = {
				["scale"] = 1,
			},
			["click_space"] = {
				nil, -- [1]
				18, -- [2]
			},
			["indicator_raidmark_anchor"] = {
				["y"] = 0.5,
				["x"] = 1,
			},
			["cast_statusbar_color"] = {
				0.02, -- [1]
				1, -- [2]
				nil, -- [3]
				0.96, -- [4]
			},
			["color_override_colors"] = {
				[3] = {
					0.91, -- [1]
					0.12, -- [2]
					0.07, -- [3]
				},
			},
			["cast_statusbar_bgcolor"] = {
				0.05, -- [1]
				0.05, -- [2]
				0.05, -- [3]
				0.80, -- [4]
			},
			["health_statusbar_bgcolor"] = {
				0.05, -- [1]
				0.05, -- [2]
				0.05, -- [3]
				0.80, -- [4]
			},
			["castbar_target_anchor"] = {
				["x"] = 2,
				["side"] = 6,
			},
			["tank"] = {
				["colors"] = {
					["nocombat"] = {
						0.91, -- [1]
						0.12, -- [2]
						0.07, -- [3]
					},
				},
			},
			["cast_statusbar_color_interrupted"] = {
				0.30, -- [1]
				0.30, -- [2]
				0.30, -- [3]
			},
		}

		-- Profile key
		PlaterDB["profileKeys"][E.mynameRealm] = name

	elseif E.TBC then

		-- Profile creation
		PlaterDB["profiles"][name] = PlaterDB["profiles"][name] or {}

		-- Profile db
		PlaterDB["profiles"][name] = {
			["aura_alpha"] = 1,
			["aura_consolidate"] = true,
			["aura_height"] = 20,
			["aura_height2"] = 20,
			["aura_show_buff_by_the_unit"] = false,
			["aura_show_crowdcontrol"] = true,
			["aura_show_enrage"] = true,
			["aura_sort"] = true,
			["aura_stack_font"] = "Expressway",
			["aura_timer_text_font"] = "Expressway",
			["aura_timer_text_size"] = 10,
			["aura_width"] = 20,
			["aura_width2"] = 20,
			["aura_x_offset"] = 0,
			["aura_y_offset"] = 2,
			["aura2_x_offset"] = 0,
			["aura2_y_offset"] = 5,
			["auras_per_row_amount"] = 6,
			["auras_per_row_amount2"] = 6,
			["aura_frame1_anchor"] = {
				["y"] = 2,
			},
			["aura_timer_text_shadow_color"] = {
				nil, -- [1]
				nil, -- [2]
				nil, -- [3]
				0, -- [4]
			},
			["aura_stack_shadow_color"] = {
				nil, -- [1]
				nil, -- [2]
				nil, -- [3]
				0, -- [4]
			},
			["aura_tracker"] = {
				["buff_tracked"] = {
					["321402"] = true,
					["322773"] = true,
					["333241"] = true,
					["327416"] = true,
					["322433"] = true,
					["333737"] = true,
					["321754"] = true,
					["331510"] = true,
					["343558"] = true,
					["327808"] = true,
					["344739"] = true,
					["317936"] = true,
					["326892"] = true,
					["340873"] = true,
					["343470"] = true,
					["333227"] = true,
					["343502"] = true,
					["336451"] = true,
					["209859"] = true,
					["336499"] = true,
					["326450"] = true,
					["330545"] = true,
					["178658"] = true,
					["226510"] = true,
				},
				["buff_banned"] = {
					["206150"] = true,
					["333553"] = true,
					["61574"] = true,
					["61573"] = true,
				},
			},
			["bossmod_aura_height"] = 30,
			["bossmod_aura_width"] = 30,
			["bossmod_cooldown_text_size"] = 15,
			["cast_statusbar_bgtexture"] = "Minimalist",
			["cast_statusbar_spark_texture"] = "Interface\\AddOns\\Plater\\images\\spark8",
			["cast_statusbar_texture"] = "Minimalist",
			["cast_statusbar_use_fade_effects"] = false,
			["castbar_icon_size"] = "same as castbar plus healthbar",
			["castbar_target_font"] = "Expressway",
			["castbar_target_notank"] = true,
			["extra_icon_caster_font"] = "Expressway",
			["extra_icon_caster_name"] = false,
			["extra_icon_caster_outline"] = "OUTLINE",
			["extra_icon_cooldown_reverse"] = true,
			["extra_icon_height"] = 20,
			["extra_icon_show_purge"] = true,
			["extra_icon_stack_font"] = "Expressway",
			["extra_icon_stack_outline"] = "OUTLINE",
			["extra_icon_timer_font"] = "Expressway",
			["extra_icon_timer_outline"] = "OUTLINE",
			["extra_icon_timer_size"] = 11,
			["extra_icon_width"] = 26,
			["first_run3"] = true,
			["health_cutoff_upper"] = false,
			["health_cutoff"] = false,
			["health_selection_overlay"] = "Minimalist",
			["health_statusbar_bgtexture"] = "Minimalist",
			["health_statusbar_texture"] = "Minimalist",
			["hide_friendly_castbars"] = true,
			["indicator_elite"] = false,
			["indicator_extra_raidmark"] = false,
			["indicator_faction"] = false,
			["indicator_pet"] = false,
			["indicator_raidmark_scale"] = 0.9,
			["indicator_rare"] = false,
			["indicator_scale"] = 1,
			["indicator_spec"] = false,
			["indicator_worldboss"] = false,
			["minor_height_scale"] = 1,
			["minor_width_scale"] = 1,
			["number_region_first_run"] = true,
			["patch_version"] = 19,
			["pet_height_scale"] = 1,
			["pet_width_scale"] = 1,
			["quick_hide"] = true,
			["range_check_alpha"] = 1,
			["range_check_in_range_or_target_alpha"] = 1,
			["semver"] = "3.3.0",
			["spell_animations"] = false,
			["target_highlight_alpha"] = 1,
			["target_highlight_height"] = 12,
			["target_highlight_texture"] = "Interface\\AddOns\\Plater\\images\\selection_indicator2",
			["target_indicator"] = "NONE",
			["target_shady_enabled"] = false,
			["ui_parent_base_strata"] = "LOW",
			["ui_parent_buff_special_strata"] = "LOW",
			["ui_parent_buff_strata"] = "LOW",
			["ui_parent_buff2_strata"] = "LOW",
			["ui_parent_cast_strata"] = "LOW",
			["ui_parent_scale_tune"] = 1,
			["update_throttle"] = 0.25,
			["use_name_translit"] = true,
			["use_ui_parent"] = true,
			["version"] = 13,
			["plate_config"] = {
				["global_health_height"] = 18,
				["global_health_width"] = 190,
				["player"] = {
					["spellpercent_text_font"] = "Expressway",
					["percent_text_shadow_color"] = {
						nil, -- [1]
						nil, -- [2]
						nil, -- [3]
						0, -- [4]
					},
					["power_percent_text_shadow_color"] = {
						nil, -- [1]
						nil, -- [2]
						nil, -- [3]
						0, -- [4]
					},
					["power_percent_text_font"] = "Expressway",
					["spellname_text_font"] = "Expressway",
					["spellpercent_text_shadow_color"] = {
						nil, -- [1]
						nil, -- [2]
						nil, -- [3]
						0, -- [4]
					},
					["percent_text_font"] = "Expressway",
					["spellname_text_shadow_color"] = {
						nil, -- [1]
						nil, -- [2]
						nil, -- [3]
						0, -- [4]
					},
				},
				["friendlyplayer"] = {
					["spellpercent_text_font"] = "Expressway",
					["actorname_use_class_color"] = true,
					["cast"] = {
						190, -- [1]
						12, -- [2]
					},
					["percent_text_shadow_color"] = {
						nil, -- [1]
						nil, -- [2]
						nil, -- [3]
						0, -- [4]
					},
					["spellname_text_outline"] = "OUTLINE",
					["level_text_font"] = "Expressway",
					["actorname_text_font"] = "Expressway",
					["actorname_use_guild_color"] = false,
					["level_text_shadow_color"] = {
						nil, -- [1]
						nil, -- [2]
						nil, -- [3]
						0, -- [4]
					},
					["cast_incombat"] = {
						190, -- [1]
					},
					["actorname_text_shadow_color"] = {
						nil, -- [1]
						nil, -- [2]
						nil, -- [3]
						0, -- [4]
					},
					["spellname_text_font"] = "Expressway",
					["spellpercent_text_shadow_color"] = {
						nil, -- [1]
						nil, -- [2]
						nil, -- [3]
						0, -- [4]
					},
					["actorname_text_size"] = 11,
					["level_text_outline"] = "OUTLINE",
					["percent_text_font"] = "Expressway",
					["spellname_text_shadow_color"] = {
						nil, -- [1]
						nil, -- [2]
						nil, -- [3]
						0, -- [4]
					},
					["health_incombat"] = {
						190, -- [1]
						18, -- [2]
					},
					["health"] = {
						190, -- [1]
						18, -- [2]
					},
				},
				["friendlynpc"] = {
					["spellpercent_text_font"] = "Expressway",
					["cast"] = {
						190, -- [1]
						12, -- [2]
					},
					["big_actortitle_text_size"] = 9,
					["spellname_text_outline"] = "OUTLINE",
					["big_actorname_text_shadow_color"] = {
						nil, -- [1]
						nil, -- [2]
						nil, -- [3]
						0, -- [4]
					},
					["level_text_font"] = "Expressway",
					["actorname_text_font"] = "Expressway",
					["all_names"] = false,
					["actorname_text_outline"] = "OUTLINE",
					["big_actortitle_text_font"] = "Expressway",
					["level_text_shadow_color"] = {
						nil, -- [1]
						nil, -- [2]
						nil, -- [3]
						0, -- [4]
					},
					["cast_incombat"] = {
						190, -- [1]
					},
					["relevance_state"] = 3,
					["actorname_text_shadow_color"] = {
						nil, -- [1]
						nil, -- [2]
						nil, -- [3]
						0, -- [4]
					},
					["big_actortitle_text_shadow_color"] = {
						nil, -- [1]
						nil, -- [2]
						nil, -- [3]
						0, -- [4]
					},
					["spellname_text_shadow_color"] = {
						nil, -- [1]
						nil, -- [2]
						nil, -- [3]
						0, -- [4]
					},
					["spellname_text_font"] = "Expressway",
					["spellpercent_text_shadow_color"] = {
						nil, -- [1]
						nil, -- [2]
						nil, -- [3]
						0, -- [4]
					},
					["actorname_text_size"] = 11,
					["big_actorname_text_font"] = "Expressway",
					["level_text_outline"] = "OUTLINE",
					["percent_text_shadow_color"] = {
						nil, -- [1]
						nil, -- [2]
						nil, -- [3]
						0, -- [4]
					},
					["percent_text_font"] = "Expressway",
					["health_incombat"] = {
						190, -- [1]
						18, -- [2]
					},
					["health"] = {
						190, -- [1]
						18, -- [2]
					},
				},
				["enemyplayer"] = {
					["big_actorname_text_size"] = 10,
					["spellpercent_text_font"] = "Expressway",
					["level_text_size"] = 8,
					["cast"] = {
						190, -- [1]
						12, -- [2]
					},
					["percent_text_shadow_color"] = {
						nil, -- [1]
						nil, -- [2]
						nil, -- [3]
						0, -- [4]
					},
					["spellpercent_text_anchor"] = {
						["x"] = -1,
					},
					["spellname_text_outline"] = "OUTLINE",
					["big_actorname_text_shadow_color"] = {
						nil, -- [1]
						nil, -- [2]
						nil, -- [3]
						0, -- [4]
					},
					["level_text_font"] = "Expressway",
					["actorname_text_font"] = "Expressway",
					["all_names"] = true,
					["actorname_text_outline"] = "OUTLINE",
					["actorname_text_spacing"] = 10,
					["quest_color_enemy"] = {
						1, -- [1]
						0.369, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["big_actortitle_text_font"] = "Expressway",
					["spellpercent_text_size"] = 9,
					["level_text_shadow_color"] = {
						nil, -- [1]
						nil, -- [2]
						nil, -- [3]
						0, -- [4]
					},
					["cast_incombat"] = {
						190, -- [1]
					},
					["actorname_text_shadow_color"] = {
						nil, -- [1]
						nil, -- [2]
						nil, -- [3]
						0, -- [4]
					},
					["spellname_text_anchor"] = {
						["x"] = 1,
						["side"] = 10,
					},
					["big_actortitle_text_shadow_color"] = {
						nil, -- [1]
						nil, -- [2]
						nil, -- [3]
						0, -- [4]
					},
					["percent_text_anchor"] = {
						["side"] = 11,
					},
					["spellname_text_shadow_color"] = {
						nil, -- [1]
						nil, -- [2]
						nil, -- [3]
						0, -- [4]
					},
					["spellpercent_text_shadow_color"] = {
						nil, -- [1]
						nil, -- [2]
						nil, -- [3]
						0, -- [4]
					},
					["spellname_text_font"] = "Expressway",
					["quest_color_neutral"] = {
						1, -- [1]
						0.65, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["actorname_text_size"] = 11,
					["big_actorname_text_font"] = "Expressway",
					["big_actortitle_text_size"] = 10,
					["level_text_outline"] = "OUTLINE",
					["percent_show_health"] = false,
					["percent_text_size"] = 11,
					["percent_text_font"] = "Expressway",
					["quest_enabled"] = true,
					["quest_color_enabled"] = true,
					["spellname_text_size"] = 9,
					["health"] = {
						190, -- [1]
						18, -- [2]
					},
					["actorname_text_anchor"] = {
						["x"] = 1,
						["side"] = 10,
					},
					["health_incombat"] = {
						190, -- [1]
						18, -- [2]
					},
					["level_text_enabled"] = false,
				},
				["enemynpc"] = {
					["spellpercent_text_font"] = "Expressway",
					["cast"] = {
						190, -- [1]
						12, -- [2]
					},
					["spellpercent_text_anchor"] = {
						["x"] = -1,
					},
					["big_actorname_text_shadow_color"] = {
						nil, -- [1]
						nil, -- [2]
						nil, -- [3]
						0, -- [4]
					},
					["level_text_font"] = "Expressway",
					["actorname_text_font"] = "Expressway",
					["actorname_text_outline"] = "OUTLINE",
					["big_actortitle_text_font"] = "Expressway",
					["spellpercent_text_size"] = 9,
					["level_text_shadow_color"] = {
						nil, -- [1]
						nil, -- [2]
						nil, -- [3]
						0, -- [4]
					},
					["cast_incombat"] = {
						190, -- [1]
						12, -- [2]
					},
					["actorname_text_shadow_color"] = {
						nil, -- [1]
						nil, -- [2]
						nil, -- [3]
						0, -- [4]
					},
					["spellname_text_anchor"] = {
						["x"] = 1,
						["side"] = 10,
					},
					["big_actortitle_text_shadow_color"] = {
						nil, -- [1]
						nil, -- [2]
						nil, -- [3]
						0, -- [4]
					},
					["percent_text_anchor"] = {
						["side"] = 11,
					},
					["spellname_text_font"] = "Expressway",
					["spellname_text_shadow_color"] = {
						nil, -- [1]
						nil, -- [2]
						nil, -- [3]
						0, -- [4]
					},
					["spellpercent_text_shadow_color"] = {
						nil, -- [1]
						nil, -- [2]
						nil, -- [3]
						0, -- [4]
					},
					["big_actorname_text_font"] = "Expressway",
					["level_text_outline"] = "OUTLINE",
					["percent_text_shadow_color"] = {
						nil, -- [1]
						nil, -- [2]
						nil, -- [3]
						0, -- [4]
					},
					["actorname_text_anchor"] = {
						["x"] = 1,
						["side"] = 10,
					},
					["percent_text_size"] = 11,
					["percent_text_font"] = "Expressway",
					["health_incombat"] = {
						190, -- [1]
						18, -- [2]
					},
					["health"] = {
						190, -- [1]
						18, -- [2]
					},
					["percent_show_health"] = false,
					["spellname_text_size"] = 9,
					["level_text_enabled"] = false,
				},
			},
			["hook_auto_imported"] = {
				["Reorder Nameplate"] = 4,
				["Dont Have Aura"] = 1,
				["Players Targetting Amount"] = 4,
				["Color Automation"] = 1,
				["Aura Reorder"] = 3,
				["Cast Bar Icon Config"] = 2,
				["Execute Range"] = 1,
				["Extra Border"] = 2,
				["Hide Neutral Units"] = 1,
				["Target Color"] = 3,
				["Attacking Specific Unit"] = 2,
				["Combo Points"] = 6,
			},
			["hook_data"] = {
				{
					["Enabled"] = true,
					["Revision"] = 106,
					["OptionsValues"] = {
					},
					["HooksTemp"] = {
					},
					["Author"] = "Luckyone-Laughing Skull",
					["Options"] = {
					},
					["Desc"] = "",
					["Hooks"] = {
						["Nameplate Updated"] = "function(self, unitId, unitFrame, envTable)\n    \n    local unitName = UnitName(unitId)\n    \n    -- Show First Name [Whitelist table]\n    local firstName = {\n        [3527] = true, -- Healing Stream Totem\n        [2630] = true, -- Earthbind Totem\n        [61245] = true, -- Capacitor Totem\n        [5925] = true, -- Grounding Totem\n        [105451] = true, -- Counterstrike Totem\n        [105427] = true, -- Skyfury Totem\n        [97369] = true, -- Liquid Magma Totem\n    }\n    \n    -- Show Full Name [Whitelist table]\n    local fullName = {\n        [167406] = true, -- Sire Fated\n    }\n    \n    if (unitName) then\n        local a , b, c, d, e, f = strsplit(' ', unitName, 5)\n        \n        if firstName [unitFrame.namePlateNpcId] then\n            unitFrame.healthBar.unitName:SetText(a)\n        elseif fullName[unitFrame.namePlateNpcId] then\n            unitFrame.healthBar.unitName:SetText(unitName)\n        else\n            unitFrame.healthBar.unitName:SetText(f or e or d or c or b or a)\n        end\n    end\nend",
					},
					["Prio"] = 1,
					["Name"] = "LuckyoneUI - Name",
					["LoadConditions"] = {
						["talent"] = {
						},
						["group"] = {
						},
						["class"] = {
						},
						["map_ids"] = {
						},
						["role"] = {
						},
						["pvptalent"] = {
						},
						["affix"] = {
						},
						["race"] = {
						},
						["encounter_ids"] = {
						},
						["spec"] = {
						},
					},
					["LastHookEdited"] = "",
					["Time"] = 1661180206,
					["Icon"] = 132115,
					["PlaterCore"] = 1,
				}, -- [1]
				{
					["Enabled"] = true,
					["Revision"] = 70,
					["OptionsValues"] = {
					},
					["HooksTemp"] = {
					},
					["Author"] = "Luckyone-Laughing Skull",
					["Options"] = {
					},
					["Desc"] = "",
					["Hooks"] = {
						["Nameplate Removed"] = "function(self, unitId, unitFrame, envTable)\n    envTable.UpdateBorder(unitFrame, false)\nend",
						["Cast Start"] = "function(self, unitId, unitFrame, envTable)\n    envTable.UpdateIconPosition(unitFrame)\n    envTable.UpdateBorder(unitFrame, true)\nend",
						["Cast Update"] = "function(self, unitId, unitFrame, envTable)\n    envTable.UpdateIconPosition(unitFrame)\nend",
						["Constructor"] = "function(self, unitId, unitFrame, envTable)\n    local hooksecurefunc = hooksecurefunc\n    \n    envTable.ShowIcon = Plater.db.profile.castbar_icon_show\n    envTable.IconAnchor = 'left'\n    envTable.IconSizeOffset = 0\n    \n    function envTable.UpdateIconPosition (unitFrame)\n        local castBar = unitFrame.castBar\n        local icon = castBar.Icon\n        local shield = castBar.BorderShield\n        \n        shield:Hide()\n        \n        if (envTable.ShowIcon) then\n            icon:ClearAllPoints()\n            \n            if (envTable.IconAnchor == 'left') then\n                icon:SetPoint ('topright', unitFrame.healthBar, 'topleft', 0, envTable.IconSizeOffset)\n                icon:SetPoint ('bottomright', unitFrame.castBar, 'bottomleft', 0, 0)\n                \n            elseif (envTable.IconAnchor == 'right') then\n                icon:SetPoint ('topleft', unitFrame.healthBar, 'topright', 0, envTable.IconSizeOffset)\n                icon:SetPoint ('bottomleft', unitFrame.castBar, 'bottomright', 0, 0)\n                \n            end\n            \n            icon:SetWidth (icon:GetHeight())\n            icon:Show()\n        else\n            icon:Hide()\n        end\n    end\n    \n    function envTable.UpdateBorder(unitFrame, casting)\n        local healthBar = unitFrame.healthBar\n        local castBar = unitFrame.castBar\n        \n        if casting then\n            if envTable.ShowIcon and castBar.Icon:IsShown() then\n                if envTable.IconAnchor == 'left' then\n                    healthBar.border:SetPoint('TOPLEFT', castBar.Icon, 'TOPLEFT', 0, 0)\n                    healthBar.border:SetPoint('BOTTOMRIGHT', castBar, 'BOTTOMRIGHT', 0, 0)\n                elseif envTable.IconAnchor == 'right' then\n                    healthBar.border:SetPoint('TOPRIGHT', castBar.Icon, 'TOPRIGHT', 0, 0)\n                    healthBar.border:SetPoint('BOTTOMLEFT', castBar, 'BOTTOMLEFT', 0, 0) \n                end\n            else\n                if envTable.IconAnchor == 'left' then\n                    healthBar.border:SetPoint('TOPLEFT', healthBar, 'TOPLEFT', 0, 0)\n                    healthBar.border:SetPoint('BOTTOMRIGHT', castBar, 'BOTTOMRIGHT', 0, 0)\n                elseif envTable.IconAnchor == 'right' then\n                    healthBar.border:SetPoint('TOPRIGHT', healthBar, 'TOPRIGHT', 0, 0)\n                    healthBar.border:SetPoint('BOTTOMLEFT', castBar, 'BOTTOMLEFT', 0, 0) \n                end\n            end\n        else\n            if envTable.IconAnchor == 'left' then\n                healthBar.border:SetPoint('TOPLEFT', healthBar, 'TOPLEFT', 0, 0)\n                healthBar.border:SetPoint('BOTTOMRIGHT', healthBar, 'BOTTOMRIGHT', 0, 0)\n            elseif envTable.IconAnchor == 'right' then\n                healthBar.border:SetPoint('TOPRIGHT', healthBar, 'TOPRIGHT', 0, 0)\n                healthBar.border:SetPoint('BOTTOMLEFT', healthBar, 'BOTTOMLEFT', 0, 0) \n            end\n        end\n    end\n    \n    if not unitFrame.castBar.borderChangeHooked then\n        hooksecurefunc(unitFrame.castBar, 'Hide', function() envTable.UpdateBorder(unitFrame, false) end)\n        unitFrame.castBar.borderChangeHooked = true\n    end\nend",
					},
					["Prio"] = 1,
					["Name"] = "LuckyoneUI - Castbar",
					["LoadConditions"] = {
						["talent"] = {
						},
						["group"] = {
						},
						["class"] = {
						},
						["map_ids"] = {
						},
						["role"] = {
						},
						["pvptalent"] = {
						},
						["affix"] = {
						},
						["race"] = {
						},
						["encounter_ids"] = {
						},
						["spec"] = {
						},
					},
					["LastHookEdited"] = "",
					["Time"] = 1661180261,
					["Icon"] = 132144,
					["PlaterCore"] = 1,
				}, -- [2]
				{
					["OptionsValues"] = {
					},
					["HooksTemp"] = {
					},
					["UID"] = "0x622bc8122a7529d",
					["Hooks"] = {
						["Initialization"] = "function(modTable)\n    local default = \"#00fbff\"\n    local affix = \"#C69B6D\"\n    \n    modTable.NpcColors = {\n        -- Grimrail Depot [DEPOT]\n        [81236] = default, -- Grimrail Technician\n        [81407] = default, -- Grimrail Bombardier\n        [80937] = default, -- Grom'kar Gunner\n        [88163] = default, -- Grom'kar Cinderseer\n        [82597] = default, -- Grom'kar Captain\n        -- Iron Docks [DOCKS]\n        [81603] = default, -- Champion Druna\n        [83025] = default, -- Grom'kar Battlemaster\n        [86526] = default, -- Grom'kar Chainmaster\n        [83026] = default, -- Siegemaster Olugar\n        [84028] = default, -- Siegemaster Rokra\n        -- Karazhan Lower [LOWER]\n        [114584] = default, -- Phantom Crew\n        [114628] = default, -- Skele] = default, \n        [114802] = default, -- Spectral Journeyman\n        -- Karazhan Upper [UPPER]\n        [114338] = default, -- Mana Confluence\n        [114249] = default, -- Volatile Energy\n        [115757] = default, -- Wrathguard Flamebringer\n        [115418] = default, -- Spider\n        [115488] = default, -- Infused Pyromancer\n        -- Mechagon Workshop [WORK]\n        [144293] = default, -- Waste Processing Unit\n        [144294] = default, -- Mechagon Tinkerer\n        [151325] = default, -- Alarm o Bot\n        [151657] = default, -- Bomb Tonk\n        -- Mechagon Junkyard [YARD]\n        [150146] = default, -- Scrapbone Shaman\n        [150160] = default, -- Scrapbone Bully\n        [150168] = default, -- Toxic Monstrosity\n        [150250] = default, -- Pistonhead Blaster\n        [150251] = default, -- Pistonhead Mechanic\n        [150292] = default, -- Mechagon Cavalry\n        [150297] = default, -- Mechagon Renormalizer\n        -- Tazavesh [TZ]\n        [178141] = default, -- Murkbrine Scalebinder\n        [179733] = default, -- Invigorating Fish Stick\n        [180431] = default, -- Focused Ritualist\n        [180433] = default, -- Wandering Pulsar\n        -- Affix Season 4\n        [189878] = affix, -- Nathrezim Infiltrator\n        [190174] = affix, -- Hypnosis Bat\n        [190128] = affix, -- Zul'gamux\n    }\n    function modTable.UpdateColor(unitFrame, envTable)\n        if not unitFrame or unitFrame.IsNpcWithoutHealthbar or unitFrame.IsFriendlyPlayerWithoutHealthbar then return end\n        -- Get color from modTable.NpcColors\n        local color = modTable.NpcColors [unitFrame.namePlateNpcId]\n        -- Set color from modTable.NpcColors\n        if (color) then\n            Plater.SetNameplateColor(unitFrame, color)\n        end\n    end\nend",
						["Nameplate Updated"] = "function (self, unitId, unitFrame, envTable, modTable)\n    modTable.UpdateColor (unitFrame, envTable)\nend",
					},
					["Time"] = 1661180206,
					["LoadConditions"] = {
						["talent"] = {
						},
						["group"] = {
						},
						["class"] = {
						},
						["map_ids"] = {
						},
						["role"] = {
						},
						["pvptalent"] = {
						},
						["affix"] = {
						},
						["race"] = {
						},
						["encounter_ids"] = {
						},
						["spec"] = {
						},
					},
					["Icon"] = 132276,
					["Enabled"] = true,
					["Revision"] = 54,
					["Options"] = {
					},
					["Author"] = "Luckyone-Laughing Skull",
					["Desc"] = "",
					["Prio"] = 1,
					["Name"] = "LuckyoneUI - Colors",
					["PlaterCore"] = 1,
					["LastHookEdited"] = "",
				}, -- [3]
			},
			["script_auto_imported"] = {
				["Cast - Important Target [P]"] = 1,
				["Aura - Buff Alert"] = 13,
				["Cast - Very Important"] = 12,
				["Explosion Affix M+"] = 11,
				["Aura - Debuff Alert"] = 11,
				["Cast - Castbar is Timer [P]"] = 2,
				["Cast - Ultra Important"] = 11,
				["Cast - Big Alert"] = 12,
				["Cast - Small Alert"] = 11,
				["Fixate On You"] = 11,
				["Spiteful Affix"] = 3,
				["Relics 9.2 M Dungeons"] = 2,
				["Unit - Main Target"] = 11,
				["Aura - Blink Time Left"] = 13,
				["Cast - Alert + Timer [P]"] = 2,
				["Countdown"] = 11,
				["Unit - Health Markers"] = 12,
				["Cast - Frontal Cone"] = 11,
				["Fixate"] = 11,
				["Cast - Tank Interrupt"] = 12,
				["Auto Set Skull"] = 11,
				["Unit - Important"] = 11,
				["Unit - Show Energy"] = 11,
			},
			["script_data"] = {
				{
					["ConstructorCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    --settings\n    envTable.NameplateSizeOffset = scriptTable.config.castBarHeight\n    envTable.ShowArrow = scriptTable.config.showArrow\n    envTable.ArrowAlpha = scriptTable.config.arrowAlpha\n    envTable.HealthBarColor = scriptTable.config.healthBarColor\n    \n    --creates the spark to show the cast progress inside the health bar\n    envTable.overlaySpark = envTable.overlaySpark or Plater:CreateImage (unitFrame.healthBar)\n    envTable.overlaySpark:SetBlendMode (\"ADD\")\n    envTable.overlaySpark.width = 16\n    envTable.overlaySpark.height = 36\n    envTable.overlaySpark.alpha = .9\n    envTable.overlaySpark.texture = [[Interface\\AddOns\\Plater\\images\\spark3]]\n    \n    envTable.topArrow = envTable.topArrow or Plater:CreateImage (unitFrame.healthBar)\n    envTable.topArrow:SetBlendMode (\"ADD\")\n    envTable.topArrow.width = scriptTable.config.arrowWidth\n    envTable.topArrow.height = scriptTable.config.arrowHeight\n    envTable.topArrow.alpha = envTable.ArrowAlpha\n    envTable.topArrow.texture = [[Interface\\BUTTONS\\Arrow-Down-Up]]\n    \n    --scale animation\n    envTable.smallScaleAnimation = envTable.smallScaleAnimation or Plater:CreateAnimationHub (unitFrame.healthBar)\n    Plater:CreateAnimation (envTable.smallScaleAnimation, \"SCALE\", 1, 0.075, 1, 1, 1.08, 1.08)\n    Plater:CreateAnimation (envTable.smallScaleAnimation, \"SCALE\", 2, 0.075, 1, 1, 0.95, 0.95)    \n    --envTable.smallScaleAnimation:Play() --envTable.smallScaleAnimation:Stop()\n    \nend\n\n\n\n\n\n\n\n",
					["OnHideCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    Plater.StopDotAnimation(unitFrame.healthBar, envTable.dotAnimation)\n    \n    envTable.overlaySpark:Hide()\n    envTable.topArrow:Hide()\n    \n    Plater.RefreshNameplateColor (unitFrame)\n    \n    envTable.smallScaleAnimation:Stop()\n    \n    --increase the nameplate size\n    local nameplateHeight = Plater.db.profile.plate_config.enemynpc.health_incombat [2]\n    unitFrame.healthBar:SetHeight (nameplateHeight)\nend\n\n\n",
					["OptionsValues"] = {
					},
					["Temp_OnShowCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    envTable.overlaySpark:Show()\n    \n    if (envTable.ShowArrow) then\n        envTable.topArrow:Show()\n    end\n    \n    Plater.FlashNameplateBorder (unitFrame, 0.05)   \n    Plater.FlashNameplateBody (unitFrame, \"\", 0.075)\n    \n    envTable.smallScaleAnimation:Play()\n    \n    --increase the nameplate size\n    local nameplateHeight = Plater.db.profile.plate_config.enemynpc.health_incombat [2]\n    unitFrame.healthBar:SetHeight (nameplateHeight + envTable.NameplateSizeOffset)\n    \n    envTable.overlaySpark.height = nameplateHeight + 5\n    \n    envTable.dotAnimation = Plater.PlayDotAnimation(unitFrame.healthBar, 2, scriptTable.config.dotColor, scriptTable.config.xOffset, scriptTable.config.yOffset)\n    \n    self:SetStatusBarColor (Plater:ParseColors (scriptTable.config.castBarColor))\nend\n\n\n\n\n\n\n",
					["ScriptType"] = 2,
					["UpdateCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    --update the percent\n    envTable.overlaySpark:SetPoint (\"left\", unitFrame.healthBar:GetWidth() * (envTable._CastPercent / 100)-9, 0)\n    \n    envTable.topArrow:SetPoint (\"bottomleft\", unitFrame.healthBar, \"topleft\", unitFrame.healthBar:GetWidth() * (envTable._CastPercent / 100) - 4, 2 )\n    \n    --forces the script to update on a 60Hz base\n    self.ThrottleUpdate = 0\n    \n\nend\n\n\n",
					["Time"] = 1661180262,
					["NpcNames"] = {
					},
					["url"] = "",
					["Icon"] = 2175503,
					["Options"] = {
						{
							["Type"] = 6,
							["Key"] = "option1",
							["Value"] = 0,
							["Name"] = "Option 1",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
							["Desc"] = "",
						}, -- [1]
						{
							["Type"] = 5,
							["Key"] = "option2",
							["Value"] = "Plays a special animation showing the explosion time.",
							["Name"] = "Option 2",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_label",
							["Desc"] = "",
						}, -- [2]
						{
							["Type"] = 6,
							["Key"] = "option3",
							["Value"] = 0,
							["Name"] = "Option 3",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
							["Desc"] = "",
						}, -- [3]
						{
							["Type"] = 2,
							["Max"] = 6,
							["Desc"] = "Increases the cast bar height by this value",
							["Min"] = 0,
							["Key"] = "castBarHeight",
							["Value"] = 3,
							["Name"] = "Cast Bar Height Mod",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
							["Fraction"] = false,
						}, -- [4]
						{
							["Type"] = 1,
							["Key"] = "castBarColor",
							["Value"] = {
								1, -- [1]
								0.5843137254902, -- [2]
								0, -- [3]
								1, -- [4]
							},
							["Name"] = "Cast Bar Color",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_color",
							["Desc"] = "Changes the cast bar color to this one.",
						}, -- [5]
						{
							["Type"] = 6,
							["Key"] = "option7",
							["Value"] = 0,
							["Name"] = "Option 7",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
							["Desc"] = "",
						}, -- [6]
						{
							["Type"] = 5,
							["Key"] = "option6",
							["Value"] = "Arrow:",
							["Name"] = "Arrow:",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_label",
							["Desc"] = "",
						}, -- [7]
						{
							["Type"] = 4,
							["Key"] = "showArrow",
							["Value"] = true,
							["Name"] = "Show Arrow",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_bool",
							["Desc"] = "Show an arrow above the nameplate showing the cast bar progress.",
						}, -- [8]
						{
							["Type"] = 2,
							["Max"] = 1,
							["Desc"] = "Arrow alpha.",
							["Min"] = 0,
							["Key"] = "arrowAlpha",
							["Value"] = 0.5,
							["Name"] = "Arrow Alpha",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
							["Fraction"] = true,
						}, -- [9]
						{
							["Type"] = 2,
							["Max"] = 12,
							["Desc"] = "Arrow Width.",
							["Min"] = 4,
							["Key"] = "arrowWidth",
							["Value"] = 8,
							["Name"] = "Arrow Width",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
							["Fraction"] = false,
						}, -- [10]
						{
							["Type"] = 2,
							["Max"] = 12,
							["Desc"] = "Arrow Height.",
							["Min"] = 4,
							["Key"] = "arrowHeight",
							["Value"] = 8,
							["Name"] = "Arrow Height",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
							["Fraction"] = false,
						}, -- [11]
						{
							["Type"] = 6,
							["Key"] = "option13",
							["Value"] = 0,
							["Name"] = "Option 13",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
							["Desc"] = "",
						}, -- [12]
						{
							["Type"] = 5,
							["Key"] = "option12",
							["Value"] = "Dot Animation:",
							["Name"] = "Dot Animation:",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_label",
							["Desc"] = "",
						}, -- [13]
						{
							["Type"] = 1,
							["Key"] = "dotColor",
							["Value"] = {
								1, -- [1]
								0.6156862745098, -- [2]
								0, -- [3]
								1, -- [4]
							},
							["Name"] = "Dot Color",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_color",
							["Desc"] = "Adjust the color of the dot animation.",
						}, -- [14]
						{
							["Type"] = 2,
							["Max"] = 10,
							["Desc"] = "Dot X Offset",
							["Min"] = -10,
							["Key"] = "xOffset",
							["Value"] = 4,
							["Name"] = "Dot X Offset",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
							["Fraction"] = false,
						}, -- [15]
						{
							["Type"] = 2,
							["Max"] = 10,
							["Desc"] = "Dot Y Offset",
							["Min"] = -10,
							["Key"] = "yOffset",
							["Value"] = 3,
							["Name"] = "Dot Y Offset",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
							["Fraction"] = false,
						}, -- [16]
					},
					["Temp_OnHideCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    Plater.StopDotAnimation(unitFrame.healthBar, envTable.dotAnimation)\n    \n    envTable.overlaySpark:Hide()\n    envTable.topArrow:Hide()\n    \n    Plater.RefreshNameplateColor (unitFrame)\n    \n    envTable.smallScaleAnimation:Stop()\n    \n    --increase the nameplate size\n    local nameplateHeight = Plater.db.profile.plate_config.enemynpc.health_incombat [2]\n    unitFrame.healthBar:SetHeight (nameplateHeight)\nend\n\n\n",
					["Revision"] = 470,
					["semver"] = "",
					["Desc"] = "Explosive Affix Script",
					["version"] = -1,
					["Author"] = "Bombad�o-Azralon",
					["Initialization"] = "function (scriptTable)\n    --insert code here\n    \nend\n\n\n",
					["OnShowCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    envTable.overlaySpark:Show()\n    \n    if (envTable.ShowArrow) then\n        envTable.topArrow:Show()\n    end\n    \n    Plater.FlashNameplateBorder (unitFrame, 0.05)   \n    Plater.FlashNameplateBody (unitFrame, \"\", 0.075)\n    \n    envTable.smallScaleAnimation:Play()\n    \n    --increase the nameplate size\n    local nameplateHeight = Plater.db.profile.plate_config.enemynpc.health_incombat [2]\n    unitFrame.healthBar:SetHeight (nameplateHeight + envTable.NameplateSizeOffset)\n    \n    envTable.overlaySpark.height = nameplateHeight + 5\n    \n    envTable.dotAnimation = Plater.PlayDotAnimation(unitFrame.healthBar, 2, scriptTable.config.dotColor, scriptTable.config.xOffset, scriptTable.config.yOffset)\n    \n    self:SetStatusBarColor (Plater:ParseColors (scriptTable.config.castBarColor))\nend\n\n\n\n\n\n\n",
					["Name"] = "Explosion Affix M+ [Plater]",
					["Temp_UpdateCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    --update the percent\n    envTable.overlaySpark:SetPoint (\"left\", unitFrame.healthBar:GetWidth() * (envTable._CastPercent / 100)-9, 0)\n    \n    envTable.topArrow:SetPoint (\"bottomleft\", unitFrame.healthBar, \"topleft\", unitFrame.healthBar:GetWidth() * (envTable._CastPercent / 100) - 4, 2 )\n    \n    --forces the script to update on a 60Hz base\n    self.ThrottleUpdate = 0\n    \n\nend\n\n\n",
					["SpellIds"] = {
						240446, -- [1]
					},
					["PlaterCore"] = 1,
					["Prio"] = 99,
					["Temp_Initialization"] = "function (scriptTable)\n    --insert code here\n    \nend\n\n\n",
					["Enabled"] = true,
					["Temp_ConstructorCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    --settings\n    envTable.NameplateSizeOffset = scriptTable.config.castBarHeight\n    envTable.ShowArrow = scriptTable.config.showArrow\n    envTable.ArrowAlpha = scriptTable.config.arrowAlpha\n    envTable.HealthBarColor = scriptTable.config.healthBarColor\n    \n    --creates the spark to show the cast progress inside the health bar\n    envTable.overlaySpark = envTable.overlaySpark or Plater:CreateImage (unitFrame.healthBar)\n    envTable.overlaySpark:SetBlendMode (\"ADD\")\n    envTable.overlaySpark.width = 16\n    envTable.overlaySpark.height = 36\n    envTable.overlaySpark.alpha = .9\n    envTable.overlaySpark.texture = [[Interface\\AddOns\\Plater\\images\\spark3]]\n    \n    envTable.topArrow = envTable.topArrow or Plater:CreateImage (unitFrame.healthBar)\n    envTable.topArrow:SetBlendMode (\"ADD\")\n    envTable.topArrow.width = scriptTable.config.arrowWidth\n    envTable.topArrow.height = scriptTable.config.arrowHeight\n    envTable.topArrow.alpha = envTable.ArrowAlpha\n    envTable.topArrow.texture = [[Interface\\BUTTONS\\Arrow-Down-Up]]\n    \n    --scale animation\n    envTable.smallScaleAnimation = envTable.smallScaleAnimation or Plater:CreateAnimationHub (unitFrame.healthBar)\n    Plater:CreateAnimation (envTable.smallScaleAnimation, \"SCALE\", 1, 0.075, 1, 1, 1.08, 1.08)\n    Plater:CreateAnimation (envTable.smallScaleAnimation, \"SCALE\", 2, 0.075, 1, 1, 0.95, 0.95)    \n    --envTable.smallScaleAnimation:Play() --envTable.smallScaleAnimation:Stop()\n    \nend\n\n\n\n\n\n\n\n",
				}, -- [1]
			},
			["saved_cvars"] = {
				["nameplateSelectedAlpha"] = "1",
				["ShowClassColorInNameplate"] = "1",
				["nameplateOverlapV"] = "1.6",
				["nameplateLargeTopInset"] = "-1",
				["nameplateShowEnemyMinus"] = "1",
				["nameplateShowAll"] = "1",
				["nameplateMotionSpeed"] = "0.05",
				["NamePlateClassificationScale"] = "1",
				["nameplateShowFriendlyTotems"] = "0",
				["nameplateShowEnemyMinions"] = "1",
				["nameplateShowFriendlyPets"] = "0",
				["nameplateShowFriendlyNPCs"] = "1",
				["nameplateSelectedScale"] = "1",
				["nameplateOverlapH"] = "1",
				["nameplateTargetRadialPosition"] = "1",
				["nameplateOtherTopInset"] = "-1",
				["nameplateMinAlpha"] = "0.90",
				["nameplateMinAlphaDistance"] = "-158489.31924611",
				["nameplateMotion"] = "1",
				["clampTargetNameplateToScreen"] = "1",
				["nameplateMinScale"] = "1",
				["nameplateMaxDistance"] = "100",
				["nameplateShowFriendlyMinions"] = "0",
				["nameplateShowFriends"] = "0",
				["NamePlateHorizontalScale"] = "1",
				["ShowNamePlateLoseAggroFlash"] = "0",
				["nameplateShowFriendlyGuardians"] = "0",
				["nameplateTargetBehindMaxDistance"] = "30",
				["nameplatePersonalHideDelaySeconds"] = "0.2",
				["nameplateShowEnemies"] = "1",
				["nameplateResourceOnTarget"] = "0",
				["NamePlateVerticalScale"] = "1",
			},
			["cast_statusbar_color_nointerrupt"] = {
				1, -- [1]
				0, -- [2]
				0.00, -- [3]
				0.96, -- [4]
			},
			["extra_icon_anchor"] = {
				["x"] = -2,
			},
			["click_space_friendly"] = {
				nil, -- [1]
				18, -- [2]
			},
			["OptionsPanelDB"] = {
				["PlaterOptionsPanelFrame"] = {
					["scale"] = 1,
				},
			},
			["ghost_auras"] = {
				["auras"] = {},
			},
			["castbar_target_shadow_color"] = {
				nil, -- [1]
				nil, -- [2]
				nil, -- [3]
				0, -- [4]
			},
			["target_highlight_color"] = {
				nil, -- [1]
				1, -- [2]
			},
			["resources"] = {
				["scale"] = 1,
			},
			["click_space"] = {
				nil, -- [1]
				18, -- [2]
			},
			["indicator_raidmark_anchor"] = {
				["y"] = 0.5,
				["x"] = 1,
			},
			["cast_statusbar_color"] = {
				0.02, -- [1]
				1, -- [2]
				nil, -- [3]
				0.96, -- [4]
			},
			["color_override_colors"] = {
				[3] = {
					0.91, -- [1]
					0.12, -- [2]
					0.07, -- [3]
				},
			},
			["cast_statusbar_bgcolor"] = {
				0.05, -- [1]
				0.05, -- [2]
				0.05, -- [3]
				0.80, -- [4]
			},
			["health_statusbar_bgcolor"] = {
				0.05, -- [1]
				0.05, -- [2]
				0.05, -- [3]
				0.80, -- [4]
			},
			["castbar_target_anchor"] = {
				["x"] = 2,
				["side"] = 6,
			},
			["tank"] = {
				["colors"] = {
					["nocombat"] = {
						0.91, -- [1]
						0.12, -- [2]
						0.07, -- [3]
					},
				},
			},
			["cast_statusbar_color_interrupted"] = {
				0.30, -- [1]
				0.30, -- [2]
				0.30, -- [3]
			},
		}

		-- Profile key
		PlaterDB["profileKeys"][E.mynameRealm] = name

	elseif E.Classic then

		-- Profile creation
		PlaterDB["profiles"][name] = PlaterDB["profiles"][name] or {}

		-- Profile db
		PlaterDB["profiles"][name] = {
			["aura_alpha"] = 1,
			["aura_consolidate"] = true,
			["aura_height"] = 20,
			["aura_height2"] = 20,
			["aura_show_buff_by_the_unit"] = false,
			["aura_show_crowdcontrol"] = true,
			["aura_show_enrage"] = true,
			["aura_sort"] = true,
			["aura_stack_font"] = "Expressway",
			["aura_timer_text_font"] = "Expressway",
			["aura_timer_text_size"] = 10,
			["aura_width"] = 20,
			["aura_width2"] = 20,
			["aura_x_offset"] = 0,
			["aura_y_offset"] = 2,
			["aura2_x_offset"] = 0,
			["aura2_y_offset"] = 5,
			["auras_per_row_amount"] = 6,
			["auras_per_row_amount2"] = 6,
			["aura_frame1_anchor"] = {
				["y"] = 2,
			},
			["aura_timer_text_shadow_color"] = {
				nil, -- [1]
				nil, -- [2]
				nil, -- [3]
				0, -- [4]
			},
			["aura_stack_shadow_color"] = {
				nil, -- [1]
				nil, -- [2]
				nil, -- [3]
				0, -- [4]
			},
			["aura_tracker"] = {
				["buff_tracked"] = {
					["321402"] = true,
					["322773"] = true,
					["333241"] = true,
					["327416"] = true,
					["322433"] = true,
					["333737"] = true,
					["321754"] = true,
					["331510"] = true,
					["343558"] = true,
					["327808"] = true,
					["344739"] = true,
					["317936"] = true,
					["326892"] = true,
					["340873"] = true,
					["343470"] = true,
					["333227"] = true,
					["343502"] = true,
					["336451"] = true,
					["209859"] = true,
					["336499"] = true,
					["326450"] = true,
					["330545"] = true,
					["178658"] = true,
					["226510"] = true,
				},
				["buff_banned"] = {
					["206150"] = true,
					["333553"] = true,
					["61574"] = true,
					["61573"] = true,
				},
			},
			["bossmod_aura_height"] = 30,
			["bossmod_aura_width"] = 30,
			["bossmod_cooldown_text_size"] = 15,
			["cast_statusbar_bgtexture"] = "Minimalist",
			["cast_statusbar_spark_texture"] = "Interface\\AddOns\\Plater\\images\\spark8",
			["cast_statusbar_texture"] = "Minimalist",
			["cast_statusbar_use_fade_effects"] = false,
			["castbar_icon_size"] = "same as castbar plus healthbar",
			["castbar_target_font"] = "Expressway",
			["castbar_target_notank"] = true,
			["extra_icon_caster_font"] = "Expressway",
			["extra_icon_caster_name"] = false,
			["extra_icon_caster_outline"] = "OUTLINE",
			["extra_icon_cooldown_reverse"] = true,
			["extra_icon_height"] = 20,
			["extra_icon_show_purge"] = true,
			["extra_icon_stack_font"] = "Expressway",
			["extra_icon_stack_outline"] = "OUTLINE",
			["extra_icon_timer_font"] = "Expressway",
			["extra_icon_timer_outline"] = "OUTLINE",
			["extra_icon_timer_size"] = 11,
			["extra_icon_width"] = 26,
			["first_run3"] = true,
			["health_cutoff_upper"] = false,
			["health_cutoff"] = false,
			["health_selection_overlay"] = "Minimalist",
			["health_statusbar_bgtexture"] = "Minimalist",
			["health_statusbar_texture"] = "Minimalist",
			["hide_friendly_castbars"] = true,
			["indicator_elite"] = false,
			["indicator_extra_raidmark"] = false,
			["indicator_faction"] = false,
			["indicator_pet"] = false,
			["indicator_raidmark_scale"] = 0.9,
			["indicator_rare"] = false,
			["indicator_scale"] = 1,
			["indicator_spec"] = false,
			["indicator_worldboss"] = false,
			["minor_height_scale"] = 1,
			["minor_width_scale"] = 1,
			["number_region_first_run"] = true,
			["patch_version"] = 19,
			["pet_height_scale"] = 1,
			["pet_width_scale"] = 1,
			["quick_hide"] = true,
			["range_check_alpha"] = 1,
			["range_check_in_range_or_target_alpha"] = 1,
			["semver"] = "3.3.0",
			["spell_animations"] = false,
			["target_highlight_alpha"] = 1,
			["target_highlight_height"] = 12,
			["target_highlight_texture"] = "Interface\\AddOns\\Plater\\images\\selection_indicator2",
			["target_indicator"] = "NONE",
			["target_shady_enabled"] = false,
			["ui_parent_base_strata"] = "LOW",
			["ui_parent_buff_special_strata"] = "LOW",
			["ui_parent_buff_strata"] = "LOW",
			["ui_parent_buff2_strata"] = "LOW",
			["ui_parent_cast_strata"] = "LOW",
			["ui_parent_scale_tune"] = 1,
			["update_throttle"] = 0.25,
			["use_name_translit"] = true,
			["use_ui_parent"] = true,
			["version"] = 13,
			["plate_config"] = {
				["global_health_height"] = 18,
				["global_health_width"] = 190,
				["player"] = {
					["spellpercent_text_font"] = "Expressway",
					["percent_text_shadow_color"] = {
						nil, -- [1]
						nil, -- [2]
						nil, -- [3]
						0, -- [4]
					},
					["power_percent_text_shadow_color"] = {
						nil, -- [1]
						nil, -- [2]
						nil, -- [3]
						0, -- [4]
					},
					["power_percent_text_font"] = "Expressway",
					["spellname_text_font"] = "Expressway",
					["spellpercent_text_shadow_color"] = {
						nil, -- [1]
						nil, -- [2]
						nil, -- [3]
						0, -- [4]
					},
					["percent_text_font"] = "Expressway",
					["spellname_text_shadow_color"] = {
						nil, -- [1]
						nil, -- [2]
						nil, -- [3]
						0, -- [4]
					},
				},
				["friendlyplayer"] = {
					["spellpercent_text_font"] = "Expressway",
					["actorname_use_class_color"] = true,
					["cast"] = {
						190, -- [1]
						12, -- [2]
					},
					["percent_text_shadow_color"] = {
						nil, -- [1]
						nil, -- [2]
						nil, -- [3]
						0, -- [4]
					},
					["spellname_text_outline"] = "OUTLINE",
					["level_text_font"] = "Expressway",
					["actorname_text_font"] = "Expressway",
					["actorname_use_guild_color"] = false,
					["level_text_shadow_color"] = {
						nil, -- [1]
						nil, -- [2]
						nil, -- [3]
						0, -- [4]
					},
					["cast_incombat"] = {
						190, -- [1]
					},
					["actorname_text_shadow_color"] = {
						nil, -- [1]
						nil, -- [2]
						nil, -- [3]
						0, -- [4]
					},
					["spellname_text_font"] = "Expressway",
					["spellpercent_text_shadow_color"] = {
						nil, -- [1]
						nil, -- [2]
						nil, -- [3]
						0, -- [4]
					},
					["actorname_text_size"] = 11,
					["level_text_outline"] = "OUTLINE",
					["percent_text_font"] = "Expressway",
					["spellname_text_shadow_color"] = {
						nil, -- [1]
						nil, -- [2]
						nil, -- [3]
						0, -- [4]
					},
					["health_incombat"] = {
						190, -- [1]
						18, -- [2]
					},
					["health"] = {
						190, -- [1]
						18, -- [2]
					},
				},
				["friendlynpc"] = {
					["spellpercent_text_font"] = "Expressway",
					["cast"] = {
						190, -- [1]
						12, -- [2]
					},
					["big_actortitle_text_size"] = 9,
					["spellname_text_outline"] = "OUTLINE",
					["big_actorname_text_shadow_color"] = {
						nil, -- [1]
						nil, -- [2]
						nil, -- [3]
						0, -- [4]
					},
					["level_text_font"] = "Expressway",
					["actorname_text_font"] = "Expressway",
					["all_names"] = false,
					["actorname_text_outline"] = "OUTLINE",
					["big_actortitle_text_font"] = "Expressway",
					["level_text_shadow_color"] = {
						nil, -- [1]
						nil, -- [2]
						nil, -- [3]
						0, -- [4]
					},
					["cast_incombat"] = {
						190, -- [1]
					},
					["relevance_state"] = 3,
					["actorname_text_shadow_color"] = {
						nil, -- [1]
						nil, -- [2]
						nil, -- [3]
						0, -- [4]
					},
					["big_actortitle_text_shadow_color"] = {
						nil, -- [1]
						nil, -- [2]
						nil, -- [3]
						0, -- [4]
					},
					["spellname_text_shadow_color"] = {
						nil, -- [1]
						nil, -- [2]
						nil, -- [3]
						0, -- [4]
					},
					["spellname_text_font"] = "Expressway",
					["spellpercent_text_shadow_color"] = {
						nil, -- [1]
						nil, -- [2]
						nil, -- [3]
						0, -- [4]
					},
					["actorname_text_size"] = 11,
					["big_actorname_text_font"] = "Expressway",
					["level_text_outline"] = "OUTLINE",
					["percent_text_shadow_color"] = {
						nil, -- [1]
						nil, -- [2]
						nil, -- [3]
						0, -- [4]
					},
					["percent_text_font"] = "Expressway",
					["health_incombat"] = {
						190, -- [1]
						18, -- [2]
					},
					["health"] = {
						190, -- [1]
						18, -- [2]
					},
				},
				["enemyplayer"] = {
					["big_actorname_text_size"] = 10,
					["spellpercent_text_font"] = "Expressway",
					["level_text_size"] = 8,
					["cast"] = {
						190, -- [1]
						12, -- [2]
					},
					["percent_text_shadow_color"] = {
						nil, -- [1]
						nil, -- [2]
						nil, -- [3]
						0, -- [4]
					},
					["spellpercent_text_anchor"] = {
						["x"] = -1,
					},
					["spellname_text_outline"] = "OUTLINE",
					["big_actorname_text_shadow_color"] = {
						nil, -- [1]
						nil, -- [2]
						nil, -- [3]
						0, -- [4]
					},
					["level_text_font"] = "Expressway",
					["actorname_text_font"] = "Expressway",
					["all_names"] = true,
					["actorname_text_outline"] = "OUTLINE",
					["actorname_text_spacing"] = 10,
					["quest_color_enemy"] = {
						1, -- [1]
						0.369, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["big_actortitle_text_font"] = "Expressway",
					["spellpercent_text_size"] = 9,
					["level_text_shadow_color"] = {
						nil, -- [1]
						nil, -- [2]
						nil, -- [3]
						0, -- [4]
					},
					["cast_incombat"] = {
						190, -- [1]
					},
					["actorname_text_shadow_color"] = {
						nil, -- [1]
						nil, -- [2]
						nil, -- [3]
						0, -- [4]
					},
					["spellname_text_anchor"] = {
						["x"] = 1,
						["side"] = 10,
					},
					["big_actortitle_text_shadow_color"] = {
						nil, -- [1]
						nil, -- [2]
						nil, -- [3]
						0, -- [4]
					},
					["percent_text_anchor"] = {
						["side"] = 11,
					},
					["spellname_text_shadow_color"] = {
						nil, -- [1]
						nil, -- [2]
						nil, -- [3]
						0, -- [4]
					},
					["spellpercent_text_shadow_color"] = {
						nil, -- [1]
						nil, -- [2]
						nil, -- [3]
						0, -- [4]
					},
					["spellname_text_font"] = "Expressway",
					["quest_color_neutral"] = {
						1, -- [1]
						0.65, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["actorname_text_size"] = 11,
					["big_actorname_text_font"] = "Expressway",
					["big_actortitle_text_size"] = 10,
					["level_text_outline"] = "OUTLINE",
					["percent_show_health"] = false,
					["percent_text_size"] = 11,
					["percent_text_font"] = "Expressway",
					["quest_enabled"] = true,
					["quest_color_enabled"] = true,
					["spellname_text_size"] = 9,
					["health"] = {
						190, -- [1]
						18, -- [2]
					},
					["actorname_text_anchor"] = {
						["x"] = 1,
						["side"] = 10,
					},
					["health_incombat"] = {
						190, -- [1]
						18, -- [2]
					},
					["level_text_enabled"] = false,
				},
				["enemynpc"] = {
					["spellpercent_text_font"] = "Expressway",
					["cast"] = {
						190, -- [1]
						12, -- [2]
					},
					["spellpercent_text_anchor"] = {
						["x"] = -1,
					},
					["big_actorname_text_shadow_color"] = {
						nil, -- [1]
						nil, -- [2]
						nil, -- [3]
						0, -- [4]
					},
					["level_text_font"] = "Expressway",
					["actorname_text_font"] = "Expressway",
					["actorname_text_outline"] = "OUTLINE",
					["big_actortitle_text_font"] = "Expressway",
					["spellpercent_text_size"] = 9,
					["level_text_shadow_color"] = {
						nil, -- [1]
						nil, -- [2]
						nil, -- [3]
						0, -- [4]
					},
					["cast_incombat"] = {
						190, -- [1]
						12, -- [2]
					},
					["actorname_text_shadow_color"] = {
						nil, -- [1]
						nil, -- [2]
						nil, -- [3]
						0, -- [4]
					},
					["spellname_text_anchor"] = {
						["x"] = 1,
						["side"] = 10,
					},
					["big_actortitle_text_shadow_color"] = {
						nil, -- [1]
						nil, -- [2]
						nil, -- [3]
						0, -- [4]
					},
					["percent_text_anchor"] = {
						["side"] = 11,
					},
					["spellname_text_font"] = "Expressway",
					["spellname_text_shadow_color"] = {
						nil, -- [1]
						nil, -- [2]
						nil, -- [3]
						0, -- [4]
					},
					["spellpercent_text_shadow_color"] = {
						nil, -- [1]
						nil, -- [2]
						nil, -- [3]
						0, -- [4]
					},
					["big_actorname_text_font"] = "Expressway",
					["level_text_outline"] = "OUTLINE",
					["percent_text_shadow_color"] = {
						nil, -- [1]
						nil, -- [2]
						nil, -- [3]
						0, -- [4]
					},
					["actorname_text_anchor"] = {
						["x"] = 1,
						["side"] = 10,
					},
					["percent_text_size"] = 11,
					["percent_text_font"] = "Expressway",
					["health_incombat"] = {
						190, -- [1]
						18, -- [2]
					},
					["health"] = {
						190, -- [1]
						18, -- [2]
					},
					["percent_show_health"] = false,
					["spellname_text_size"] = 9,
					["level_text_enabled"] = false,
				},
			},
			["hook_auto_imported"] = {
				["Reorder Nameplate"] = 4,
				["Dont Have Aura"] = 1,
				["Players Targetting Amount"] = 4,
				["Color Automation"] = 1,
				["Aura Reorder"] = 3,
				["Cast Bar Icon Config"] = 2,
				["Execute Range"] = 1,
				["Extra Border"] = 2,
				["Hide Neutral Units"] = 1,
				["Target Color"] = 3,
				["Attacking Specific Unit"] = 2,
				["Combo Points"] = 6,
			},
			["hook_data"] = {
				{
					["Enabled"] = true,
					["Revision"] = 106,
					["OptionsValues"] = {
					},
					["HooksTemp"] = {
					},
					["Author"] = "Luckyone-Laughing Skull",
					["Options"] = {
					},
					["Desc"] = "",
					["Hooks"] = {
						["Nameplate Updated"] = "function(self, unitId, unitFrame, envTable)\n    \n    local unitName = UnitName(unitId)\n    \n    -- Show First Name [Whitelist table]\n    local firstName = {\n        [3527] = true, -- Healing Stream Totem\n        [2630] = true, -- Earthbind Totem\n        [61245] = true, -- Capacitor Totem\n        [5925] = true, -- Grounding Totem\n        [105451] = true, -- Counterstrike Totem\n        [105427] = true, -- Skyfury Totem\n        [97369] = true, -- Liquid Magma Totem\n    }\n    \n    -- Show Full Name [Whitelist table]\n    local fullName = {\n        [167406] = true, -- Sire Fated\n    }\n    \n    if (unitName) then\n        local a , b, c, d, e, f = strsplit(' ', unitName, 5)\n        \n        if firstName [unitFrame.namePlateNpcId] then\n            unitFrame.healthBar.unitName:SetText(a)\n        elseif fullName[unitFrame.namePlateNpcId] then\n            unitFrame.healthBar.unitName:SetText(unitName)\n        else\n            unitFrame.healthBar.unitName:SetText(f or e or d or c or b or a)\n        end\n    end\nend",
					},
					["Prio"] = 1,
					["Name"] = "LuckyoneUI - Name",
					["LoadConditions"] = {
						["talent"] = {
						},
						["group"] = {
						},
						["class"] = {
						},
						["map_ids"] = {
						},
						["role"] = {
						},
						["pvptalent"] = {
						},
						["affix"] = {
						},
						["race"] = {
						},
						["encounter_ids"] = {
						},
						["spec"] = {
						},
					},
					["LastHookEdited"] = "",
					["Time"] = 1661180206,
					["Icon"] = 132115,
					["PlaterCore"] = 1,
				}, -- [1]
				{
					["Enabled"] = true,
					["Revision"] = 70,
					["OptionsValues"] = {
					},
					["HooksTemp"] = {
					},
					["Author"] = "Luckyone-Laughing Skull",
					["Options"] = {
					},
					["Desc"] = "",
					["Hooks"] = {
						["Nameplate Removed"] = "function(self, unitId, unitFrame, envTable)\n    envTable.UpdateBorder(unitFrame, false)\nend",
						["Cast Start"] = "function(self, unitId, unitFrame, envTable)\n    envTable.UpdateIconPosition(unitFrame)\n    envTable.UpdateBorder(unitFrame, true)\nend",
						["Cast Update"] = "function(self, unitId, unitFrame, envTable)\n    envTable.UpdateIconPosition(unitFrame)\nend",
						["Constructor"] = "function(self, unitId, unitFrame, envTable)\n    local hooksecurefunc = hooksecurefunc\n    \n    envTable.ShowIcon = Plater.db.profile.castbar_icon_show\n    envTable.IconAnchor = 'left'\n    envTable.IconSizeOffset = 0\n    \n    function envTable.UpdateIconPosition (unitFrame)\n        local castBar = unitFrame.castBar\n        local icon = castBar.Icon\n        local shield = castBar.BorderShield\n        \n        shield:Hide()\n        \n        if (envTable.ShowIcon) then\n            icon:ClearAllPoints()\n            \n            if (envTable.IconAnchor == 'left') then\n                icon:SetPoint ('topright', unitFrame.healthBar, 'topleft', 0, envTable.IconSizeOffset)\n                icon:SetPoint ('bottomright', unitFrame.castBar, 'bottomleft', 0, 0)\n                \n            elseif (envTable.IconAnchor == 'right') then\n                icon:SetPoint ('topleft', unitFrame.healthBar, 'topright', 0, envTable.IconSizeOffset)\n                icon:SetPoint ('bottomleft', unitFrame.castBar, 'bottomright', 0, 0)\n                \n            end\n            \n            icon:SetWidth (icon:GetHeight())\n            icon:Show()\n        else\n            icon:Hide()\n        end\n    end\n    \n    function envTable.UpdateBorder(unitFrame, casting)\n        local healthBar = unitFrame.healthBar\n        local castBar = unitFrame.castBar\n        \n        if casting then\n            if envTable.ShowIcon and castBar.Icon:IsShown() then\n                if envTable.IconAnchor == 'left' then\n                    healthBar.border:SetPoint('TOPLEFT', castBar.Icon, 'TOPLEFT', 0, 0)\n                    healthBar.border:SetPoint('BOTTOMRIGHT', castBar, 'BOTTOMRIGHT', 0, 0)\n                elseif envTable.IconAnchor == 'right' then\n                    healthBar.border:SetPoint('TOPRIGHT', castBar.Icon, 'TOPRIGHT', 0, 0)\n                    healthBar.border:SetPoint('BOTTOMLEFT', castBar, 'BOTTOMLEFT', 0, 0) \n                end\n            else\n                if envTable.IconAnchor == 'left' then\n                    healthBar.border:SetPoint('TOPLEFT', healthBar, 'TOPLEFT', 0, 0)\n                    healthBar.border:SetPoint('BOTTOMRIGHT', castBar, 'BOTTOMRIGHT', 0, 0)\n                elseif envTable.IconAnchor == 'right' then\n                    healthBar.border:SetPoint('TOPRIGHT', healthBar, 'TOPRIGHT', 0, 0)\n                    healthBar.border:SetPoint('BOTTOMLEFT', castBar, 'BOTTOMLEFT', 0, 0) \n                end\n            end\n        else\n            if envTable.IconAnchor == 'left' then\n                healthBar.border:SetPoint('TOPLEFT', healthBar, 'TOPLEFT', 0, 0)\n                healthBar.border:SetPoint('BOTTOMRIGHT', healthBar, 'BOTTOMRIGHT', 0, 0)\n            elseif envTable.IconAnchor == 'right' then\n                healthBar.border:SetPoint('TOPRIGHT', healthBar, 'TOPRIGHT', 0, 0)\n                healthBar.border:SetPoint('BOTTOMLEFT', healthBar, 'BOTTOMLEFT', 0, 0) \n            end\n        end\n    end\n    \n    if not unitFrame.castBar.borderChangeHooked then\n        hooksecurefunc(unitFrame.castBar, 'Hide', function() envTable.UpdateBorder(unitFrame, false) end)\n        unitFrame.castBar.borderChangeHooked = true\n    end\nend",
					},
					["Prio"] = 1,
					["Name"] = "LuckyoneUI - Castbar",
					["LoadConditions"] = {
						["talent"] = {
						},
						["group"] = {
						},
						["class"] = {
						},
						["map_ids"] = {
						},
						["role"] = {
						},
						["pvptalent"] = {
						},
						["affix"] = {
						},
						["race"] = {
						},
						["encounter_ids"] = {
						},
						["spec"] = {
						},
					},
					["LastHookEdited"] = "",
					["Time"] = 1661180261,
					["Icon"] = 132144,
					["PlaterCore"] = 1,
				}, -- [2]
				{
					["OptionsValues"] = {
					},
					["HooksTemp"] = {
					},
					["UID"] = "0x622bc8122a7529d",
					["Hooks"] = {
						["Initialization"] = "function(modTable)\n    local default = \"#00fbff\"\n    local affix = \"#C69B6D\"\n    \n    modTable.NpcColors = {\n        -- Grimrail Depot [DEPOT]\n        [81236] = default, -- Grimrail Technician\n        [81407] = default, -- Grimrail Bombardier\n        [80937] = default, -- Grom'kar Gunner\n        [88163] = default, -- Grom'kar Cinderseer\n        [82597] = default, -- Grom'kar Captain\n        -- Iron Docks [DOCKS]\n        [81603] = default, -- Champion Druna\n        [83025] = default, -- Grom'kar Battlemaster\n        [86526] = default, -- Grom'kar Chainmaster\n        [83026] = default, -- Siegemaster Olugar\n        [84028] = default, -- Siegemaster Rokra\n        -- Karazhan Lower [LOWER]\n        [114584] = default, -- Phantom Crew\n        [114628] = default, -- Skele] = default, \n        [114802] = default, -- Spectral Journeyman\n        -- Karazhan Upper [UPPER]\n        [114338] = default, -- Mana Confluence\n        [114249] = default, -- Volatile Energy\n        [115757] = default, -- Wrathguard Flamebringer\n        [115418] = default, -- Spider\n        [115488] = default, -- Infused Pyromancer\n        -- Mechagon Workshop [WORK]\n        [144293] = default, -- Waste Processing Unit\n        [144294] = default, -- Mechagon Tinkerer\n        [151325] = default, -- Alarm o Bot\n        [151657] = default, -- Bomb Tonk\n        -- Mechagon Junkyard [YARD]\n        [150146] = default, -- Scrapbone Shaman\n        [150160] = default, -- Scrapbone Bully\n        [150168] = default, -- Toxic Monstrosity\n        [150250] = default, -- Pistonhead Blaster\n        [150251] = default, -- Pistonhead Mechanic\n        [150292] = default, -- Mechagon Cavalry\n        [150297] = default, -- Mechagon Renormalizer\n        -- Tazavesh [TZ]\n        [178141] = default, -- Murkbrine Scalebinder\n        [179733] = default, -- Invigorating Fish Stick\n        [180431] = default, -- Focused Ritualist\n        [180433] = default, -- Wandering Pulsar\n        -- Affix Season 4\n        [189878] = affix, -- Nathrezim Infiltrator\n        [190174] = affix, -- Hypnosis Bat\n        [190128] = affix, -- Zul'gamux\n    }\n    function modTable.UpdateColor(unitFrame, envTable)\n        if not unitFrame or unitFrame.IsNpcWithoutHealthbar or unitFrame.IsFriendlyPlayerWithoutHealthbar then return end\n        -- Get color from modTable.NpcColors\n        local color = modTable.NpcColors [unitFrame.namePlateNpcId]\n        -- Set color from modTable.NpcColors\n        if (color) then\n            Plater.SetNameplateColor(unitFrame, color)\n        end\n    end\nend",
						["Nameplate Updated"] = "function (self, unitId, unitFrame, envTable, modTable)\n    modTable.UpdateColor (unitFrame, envTable)\nend",
					},
					["Time"] = 1661180206,
					["LoadConditions"] = {
						["talent"] = {
						},
						["group"] = {
						},
						["class"] = {
						},
						["map_ids"] = {
						},
						["role"] = {
						},
						["pvptalent"] = {
						},
						["affix"] = {
						},
						["race"] = {
						},
						["encounter_ids"] = {
						},
						["spec"] = {
						},
					},
					["Icon"] = 132276,
					["Enabled"] = true,
					["Revision"] = 54,
					["Options"] = {
					},
					["Author"] = "Luckyone-Laughing Skull",
					["Desc"] = "",
					["Prio"] = 1,
					["Name"] = "LuckyoneUI - Colors",
					["PlaterCore"] = 1,
					["LastHookEdited"] = "",
				}, -- [3]
			},
			["script_auto_imported"] = {
				["Cast - Important Target [P]"] = 1,
				["Aura - Buff Alert"] = 13,
				["Cast - Very Important"] = 12,
				["Explosion Affix M+"] = 11,
				["Aura - Debuff Alert"] = 11,
				["Cast - Castbar is Timer [P]"] = 2,
				["Cast - Ultra Important"] = 11,
				["Cast - Big Alert"] = 12,
				["Cast - Small Alert"] = 11,
				["Fixate On You"] = 11,
				["Spiteful Affix"] = 3,
				["Relics 9.2 M Dungeons"] = 2,
				["Unit - Main Target"] = 11,
				["Aura - Blink Time Left"] = 13,
				["Cast - Alert + Timer [P]"] = 2,
				["Countdown"] = 11,
				["Unit - Health Markers"] = 12,
				["Cast - Frontal Cone"] = 11,
				["Fixate"] = 11,
				["Cast - Tank Interrupt"] = 12,
				["Auto Set Skull"] = 11,
				["Unit - Important"] = 11,
				["Unit - Show Energy"] = 11,
			},
			["script_data"] = {
				{
					["ConstructorCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    --settings\n    envTable.NameplateSizeOffset = scriptTable.config.castBarHeight\n    envTable.ShowArrow = scriptTable.config.showArrow\n    envTable.ArrowAlpha = scriptTable.config.arrowAlpha\n    envTable.HealthBarColor = scriptTable.config.healthBarColor\n    \n    --creates the spark to show the cast progress inside the health bar\n    envTable.overlaySpark = envTable.overlaySpark or Plater:CreateImage (unitFrame.healthBar)\n    envTable.overlaySpark:SetBlendMode (\"ADD\")\n    envTable.overlaySpark.width = 16\n    envTable.overlaySpark.height = 36\n    envTable.overlaySpark.alpha = .9\n    envTable.overlaySpark.texture = [[Interface\\AddOns\\Plater\\images\\spark3]]\n    \n    envTable.topArrow = envTable.topArrow or Plater:CreateImage (unitFrame.healthBar)\n    envTable.topArrow:SetBlendMode (\"ADD\")\n    envTable.topArrow.width = scriptTable.config.arrowWidth\n    envTable.topArrow.height = scriptTable.config.arrowHeight\n    envTable.topArrow.alpha = envTable.ArrowAlpha\n    envTable.topArrow.texture = [[Interface\\BUTTONS\\Arrow-Down-Up]]\n    \n    --scale animation\n    envTable.smallScaleAnimation = envTable.smallScaleAnimation or Plater:CreateAnimationHub (unitFrame.healthBar)\n    Plater:CreateAnimation (envTable.smallScaleAnimation, \"SCALE\", 1, 0.075, 1, 1, 1.08, 1.08)\n    Plater:CreateAnimation (envTable.smallScaleAnimation, \"SCALE\", 2, 0.075, 1, 1, 0.95, 0.95)    \n    --envTable.smallScaleAnimation:Play() --envTable.smallScaleAnimation:Stop()\n    \nend\n\n\n\n\n\n\n\n",
					["OnHideCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    Plater.StopDotAnimation(unitFrame.healthBar, envTable.dotAnimation)\n    \n    envTable.overlaySpark:Hide()\n    envTable.topArrow:Hide()\n    \n    Plater.RefreshNameplateColor (unitFrame)\n    \n    envTable.smallScaleAnimation:Stop()\n    \n    --increase the nameplate size\n    local nameplateHeight = Plater.db.profile.plate_config.enemynpc.health_incombat [2]\n    unitFrame.healthBar:SetHeight (nameplateHeight)\nend\n\n\n",
					["OptionsValues"] = {
					},
					["Temp_OnShowCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    envTable.overlaySpark:Show()\n    \n    if (envTable.ShowArrow) then\n        envTable.topArrow:Show()\n    end\n    \n    Plater.FlashNameplateBorder (unitFrame, 0.05)   \n    Plater.FlashNameplateBody (unitFrame, \"\", 0.075)\n    \n    envTable.smallScaleAnimation:Play()\n    \n    --increase the nameplate size\n    local nameplateHeight = Plater.db.profile.plate_config.enemynpc.health_incombat [2]\n    unitFrame.healthBar:SetHeight (nameplateHeight + envTable.NameplateSizeOffset)\n    \n    envTable.overlaySpark.height = nameplateHeight + 5\n    \n    envTable.dotAnimation = Plater.PlayDotAnimation(unitFrame.healthBar, 2, scriptTable.config.dotColor, scriptTable.config.xOffset, scriptTable.config.yOffset)\n    \n    self:SetStatusBarColor (Plater:ParseColors (scriptTable.config.castBarColor))\nend\n\n\n\n\n\n\n",
					["ScriptType"] = 2,
					["UpdateCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    --update the percent\n    envTable.overlaySpark:SetPoint (\"left\", unitFrame.healthBar:GetWidth() * (envTable._CastPercent / 100)-9, 0)\n    \n    envTable.topArrow:SetPoint (\"bottomleft\", unitFrame.healthBar, \"topleft\", unitFrame.healthBar:GetWidth() * (envTable._CastPercent / 100) - 4, 2 )\n    \n    --forces the script to update on a 60Hz base\n    self.ThrottleUpdate = 0\n    \n\nend\n\n\n",
					["Time"] = 1661180262,
					["NpcNames"] = {
					},
					["url"] = "",
					["Icon"] = 2175503,
					["Options"] = {
						{
							["Type"] = 6,
							["Key"] = "option1",
							["Value"] = 0,
							["Name"] = "Option 1",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
							["Desc"] = "",
						}, -- [1]
						{
							["Type"] = 5,
							["Key"] = "option2",
							["Value"] = "Plays a special animation showing the explosion time.",
							["Name"] = "Option 2",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_label",
							["Desc"] = "",
						}, -- [2]
						{
							["Type"] = 6,
							["Key"] = "option3",
							["Value"] = 0,
							["Name"] = "Option 3",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
							["Desc"] = "",
						}, -- [3]
						{
							["Type"] = 2,
							["Max"] = 6,
							["Desc"] = "Increases the cast bar height by this value",
							["Min"] = 0,
							["Key"] = "castBarHeight",
							["Value"] = 3,
							["Name"] = "Cast Bar Height Mod",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
							["Fraction"] = false,
						}, -- [4]
						{
							["Type"] = 1,
							["Key"] = "castBarColor",
							["Value"] = {
								1, -- [1]
								0.5843137254902, -- [2]
								0, -- [3]
								1, -- [4]
							},
							["Name"] = "Cast Bar Color",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_color",
							["Desc"] = "Changes the cast bar color to this one.",
						}, -- [5]
						{
							["Type"] = 6,
							["Key"] = "option7",
							["Value"] = 0,
							["Name"] = "Option 7",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
							["Desc"] = "",
						}, -- [6]
						{
							["Type"] = 5,
							["Key"] = "option6",
							["Value"] = "Arrow:",
							["Name"] = "Arrow:",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_label",
							["Desc"] = "",
						}, -- [7]
						{
							["Type"] = 4,
							["Key"] = "showArrow",
							["Value"] = true,
							["Name"] = "Show Arrow",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_bool",
							["Desc"] = "Show an arrow above the nameplate showing the cast bar progress.",
						}, -- [8]
						{
							["Type"] = 2,
							["Max"] = 1,
							["Desc"] = "Arrow alpha.",
							["Min"] = 0,
							["Key"] = "arrowAlpha",
							["Value"] = 0.5,
							["Name"] = "Arrow Alpha",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
							["Fraction"] = true,
						}, -- [9]
						{
							["Type"] = 2,
							["Max"] = 12,
							["Desc"] = "Arrow Width.",
							["Min"] = 4,
							["Key"] = "arrowWidth",
							["Value"] = 8,
							["Name"] = "Arrow Width",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
							["Fraction"] = false,
						}, -- [10]
						{
							["Type"] = 2,
							["Max"] = 12,
							["Desc"] = "Arrow Height.",
							["Min"] = 4,
							["Key"] = "arrowHeight",
							["Value"] = 8,
							["Name"] = "Arrow Height",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
							["Fraction"] = false,
						}, -- [11]
						{
							["Type"] = 6,
							["Key"] = "option13",
							["Value"] = 0,
							["Name"] = "Option 13",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
							["Desc"] = "",
						}, -- [12]
						{
							["Type"] = 5,
							["Key"] = "option12",
							["Value"] = "Dot Animation:",
							["Name"] = "Dot Animation:",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_label",
							["Desc"] = "",
						}, -- [13]
						{
							["Type"] = 1,
							["Key"] = "dotColor",
							["Value"] = {
								1, -- [1]
								0.6156862745098, -- [2]
								0, -- [3]
								1, -- [4]
							},
							["Name"] = "Dot Color",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_color",
							["Desc"] = "Adjust the color of the dot animation.",
						}, -- [14]
						{
							["Type"] = 2,
							["Max"] = 10,
							["Desc"] = "Dot X Offset",
							["Min"] = -10,
							["Key"] = "xOffset",
							["Value"] = 4,
							["Name"] = "Dot X Offset",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
							["Fraction"] = false,
						}, -- [15]
						{
							["Type"] = 2,
							["Max"] = 10,
							["Desc"] = "Dot Y Offset",
							["Min"] = -10,
							["Key"] = "yOffset",
							["Value"] = 3,
							["Name"] = "Dot Y Offset",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
							["Fraction"] = false,
						}, -- [16]
					},
					["Temp_OnHideCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    Plater.StopDotAnimation(unitFrame.healthBar, envTable.dotAnimation)\n    \n    envTable.overlaySpark:Hide()\n    envTable.topArrow:Hide()\n    \n    Plater.RefreshNameplateColor (unitFrame)\n    \n    envTable.smallScaleAnimation:Stop()\n    \n    --increase the nameplate size\n    local nameplateHeight = Plater.db.profile.plate_config.enemynpc.health_incombat [2]\n    unitFrame.healthBar:SetHeight (nameplateHeight)\nend\n\n\n",
					["Revision"] = 470,
					["semver"] = "",
					["Desc"] = "Explosive Affix Script",
					["version"] = -1,
					["Author"] = "Bombad�o-Azralon",
					["Initialization"] = "function (scriptTable)\n    --insert code here\n    \nend\n\n\n",
					["OnShowCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    envTable.overlaySpark:Show()\n    \n    if (envTable.ShowArrow) then\n        envTable.topArrow:Show()\n    end\n    \n    Plater.FlashNameplateBorder (unitFrame, 0.05)   \n    Plater.FlashNameplateBody (unitFrame, \"\", 0.075)\n    \n    envTable.smallScaleAnimation:Play()\n    \n    --increase the nameplate size\n    local nameplateHeight = Plater.db.profile.plate_config.enemynpc.health_incombat [2]\n    unitFrame.healthBar:SetHeight (nameplateHeight + envTable.NameplateSizeOffset)\n    \n    envTable.overlaySpark.height = nameplateHeight + 5\n    \n    envTable.dotAnimation = Plater.PlayDotAnimation(unitFrame.healthBar, 2, scriptTable.config.dotColor, scriptTable.config.xOffset, scriptTable.config.yOffset)\n    \n    self:SetStatusBarColor (Plater:ParseColors (scriptTable.config.castBarColor))\nend\n\n\n\n\n\n\n",
					["Name"] = "Explosion Affix M+ [Plater]",
					["Temp_UpdateCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    --update the percent\n    envTable.overlaySpark:SetPoint (\"left\", unitFrame.healthBar:GetWidth() * (envTable._CastPercent / 100)-9, 0)\n    \n    envTable.topArrow:SetPoint (\"bottomleft\", unitFrame.healthBar, \"topleft\", unitFrame.healthBar:GetWidth() * (envTable._CastPercent / 100) - 4, 2 )\n    \n    --forces the script to update on a 60Hz base\n    self.ThrottleUpdate = 0\n    \n\nend\n\n\n",
					["SpellIds"] = {
						240446, -- [1]
					},
					["PlaterCore"] = 1,
					["Prio"] = 99,
					["Temp_Initialization"] = "function (scriptTable)\n    --insert code here\n    \nend\n\n\n",
					["Enabled"] = true,
					["Temp_ConstructorCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    --settings\n    envTable.NameplateSizeOffset = scriptTable.config.castBarHeight\n    envTable.ShowArrow = scriptTable.config.showArrow\n    envTable.ArrowAlpha = scriptTable.config.arrowAlpha\n    envTable.HealthBarColor = scriptTable.config.healthBarColor\n    \n    --creates the spark to show the cast progress inside the health bar\n    envTable.overlaySpark = envTable.overlaySpark or Plater:CreateImage (unitFrame.healthBar)\n    envTable.overlaySpark:SetBlendMode (\"ADD\")\n    envTable.overlaySpark.width = 16\n    envTable.overlaySpark.height = 36\n    envTable.overlaySpark.alpha = .9\n    envTable.overlaySpark.texture = [[Interface\\AddOns\\Plater\\images\\spark3]]\n    \n    envTable.topArrow = envTable.topArrow or Plater:CreateImage (unitFrame.healthBar)\n    envTable.topArrow:SetBlendMode (\"ADD\")\n    envTable.topArrow.width = scriptTable.config.arrowWidth\n    envTable.topArrow.height = scriptTable.config.arrowHeight\n    envTable.topArrow.alpha = envTable.ArrowAlpha\n    envTable.topArrow.texture = [[Interface\\BUTTONS\\Arrow-Down-Up]]\n    \n    --scale animation\n    envTable.smallScaleAnimation = envTable.smallScaleAnimation or Plater:CreateAnimationHub (unitFrame.healthBar)\n    Plater:CreateAnimation (envTable.smallScaleAnimation, \"SCALE\", 1, 0.075, 1, 1, 1.08, 1.08)\n    Plater:CreateAnimation (envTable.smallScaleAnimation, \"SCALE\", 2, 0.075, 1, 1, 0.95, 0.95)    \n    --envTable.smallScaleAnimation:Play() --envTable.smallScaleAnimation:Stop()\n    \nend\n\n\n\n\n\n\n\n",
				}, -- [1]
			},
			["saved_cvars"] = {
				["nameplateSelectedAlpha"] = "1",
				["ShowClassColorInNameplate"] = "1",
				["nameplateOverlapV"] = "1.6",
				["nameplateLargeTopInset"] = "-1",
				["nameplateShowEnemyMinus"] = "1",
				["nameplateShowAll"] = "1",
				["nameplateMotionSpeed"] = "0.05",
				["NamePlateClassificationScale"] = "1",
				["nameplateShowFriendlyTotems"] = "0",
				["nameplateShowEnemyMinions"] = "1",
				["nameplateShowFriendlyPets"] = "0",
				["nameplateShowFriendlyNPCs"] = "1",
				["nameplateSelectedScale"] = "1",
				["nameplateOverlapH"] = "1",
				["nameplateTargetRadialPosition"] = "1",
				["nameplateOtherTopInset"] = "-1",
				["nameplateMinAlpha"] = "0.90",
				["nameplateMinAlphaDistance"] = "-158489.31924611",
				["nameplateMotion"] = "1",
				["clampTargetNameplateToScreen"] = "1",
				["nameplateMinScale"] = "1",
				["nameplateMaxDistance"] = "100",
				["nameplateShowFriendlyMinions"] = "0",
				["nameplateShowFriends"] = "0",
				["NamePlateHorizontalScale"] = "1",
				["ShowNamePlateLoseAggroFlash"] = "0",
				["nameplateShowFriendlyGuardians"] = "0",
				["nameplateTargetBehindMaxDistance"] = "30",
				["nameplatePersonalHideDelaySeconds"] = "0.2",
				["nameplateShowEnemies"] = "1",
				["nameplateResourceOnTarget"] = "0",
				["NamePlateVerticalScale"] = "1",
			},
			["cast_statusbar_color_nointerrupt"] = {
				1, -- [1]
				0, -- [2]
				0.00, -- [3]
				0.96, -- [4]
			},
			["extra_icon_anchor"] = {
				["x"] = -2,
			},
			["click_space_friendly"] = {
				nil, -- [1]
				18, -- [2]
			},
			["OptionsPanelDB"] = {
				["PlaterOptionsPanelFrame"] = {
					["scale"] = 1,
				},
			},
			["ghost_auras"] = {
				["auras"] = {},
			},
			["castbar_target_shadow_color"] = {
				nil, -- [1]
				nil, -- [2]
				nil, -- [3]
				0, -- [4]
			},
			["target_highlight_color"] = {
				nil, -- [1]
				1, -- [2]
			},
			["resources"] = {
				["scale"] = 1,
			},
			["click_space"] = {
				nil, -- [1]
				18, -- [2]
			},
			["indicator_raidmark_anchor"] = {
				["y"] = 0.5,
				["x"] = 1,
			},
			["cast_statusbar_color"] = {
				0.02, -- [1]
				1, -- [2]
				nil, -- [3]
				0.96, -- [4]
			},
			["color_override_colors"] = {
				[3] = {
					0.91, -- [1]
					0.12, -- [2]
					0.07, -- [3]
				},
			},
			["cast_statusbar_bgcolor"] = {
				0.05, -- [1]
				0.05, -- [2]
				0.05, -- [3]
				0.80, -- [4]
			},
			["health_statusbar_bgcolor"] = {
				0.05, -- [1]
				0.05, -- [2]
				0.05, -- [3]
				0.80, -- [4]
			},
			["castbar_target_anchor"] = {
				["x"] = 2,
				["side"] = 6,
			},
			["tank"] = {
				["colors"] = {
					["nocombat"] = {
						0.91, -- [1]
						0.12, -- [2]
						0.07, -- [3]
					},
				},
			},
			["cast_statusbar_color_interrupted"] = {
				0.30, -- [1]
				0.30, -- [2]
				0.30, -- [3]
			},
		}

		-- Profile key
		PlaterDB["profileKeys"][E.mynameRealm] = name

	elseif E.Wrath then

		-- Profile creation
		PlaterDB["profiles"][name] = PlaterDB["profiles"][name] or {}

		-- Profile db
		PlaterDB["profiles"][name] = {
			["aura_alpha"] = 1,
			["aura_consolidate"] = true,
			["aura_height"] = 20,
			["aura_height2"] = 20,
			["aura_show_buff_by_the_unit"] = false,
			["aura_show_crowdcontrol"] = true,
			["aura_show_enrage"] = true,
			["aura_sort"] = true,
			["aura_stack_font"] = "Expressway",
			["aura_timer_text_font"] = "Expressway",
			["aura_timer_text_size"] = 10,
			["aura_width"] = 20,
			["aura_width2"] = 20,
			["aura_x_offset"] = 0,
			["aura_y_offset"] = 2,
			["aura2_x_offset"] = 0,
			["aura2_y_offset"] = 5,
			["auras_per_row_amount"] = 6,
			["auras_per_row_amount2"] = 6,
			["aura_frame1_anchor"] = {
				["y"] = 2,
			},
			["aura_timer_text_shadow_color"] = {
				nil, -- [1]
				nil, -- [2]
				nil, -- [3]
				0, -- [4]
			},
			["aura_stack_shadow_color"] = {
				nil, -- [1]
				nil, -- [2]
				nil, -- [3]
				0, -- [4]
			},
			["aura_tracker"] = {
				["buff_tracked"] = {
					["321402"] = true,
					["322773"] = true,
					["333241"] = true,
					["327416"] = true,
					["322433"] = true,
					["333737"] = true,
					["321754"] = true,
					["331510"] = true,
					["343558"] = true,
					["327808"] = true,
					["344739"] = true,
					["317936"] = true,
					["326892"] = true,
					["340873"] = true,
					["343470"] = true,
					["333227"] = true,
					["343502"] = true,
					["336451"] = true,
					["209859"] = true,
					["336499"] = true,
					["326450"] = true,
					["330545"] = true,
					["178658"] = true,
					["226510"] = true,
				},
				["buff_banned"] = {
					["206150"] = true,
					["333553"] = true,
					["61574"] = true,
					["61573"] = true,
				},
			},
			["bossmod_aura_height"] = 30,
			["bossmod_aura_width"] = 30,
			["bossmod_cooldown_text_size"] = 15,
			["cast_statusbar_bgtexture"] = "Minimalist",
			["cast_statusbar_spark_texture"] = "Interface\\AddOns\\Plater\\images\\spark8",
			["cast_statusbar_texture"] = "Minimalist",
			["cast_statusbar_use_fade_effects"] = false,
			["castbar_icon_size"] = "same as castbar plus healthbar",
			["castbar_target_font"] = "Expressway",
			["castbar_target_notank"] = true,
			["extra_icon_caster_font"] = "Expressway",
			["extra_icon_caster_name"] = false,
			["extra_icon_caster_outline"] = "OUTLINE",
			["extra_icon_cooldown_reverse"] = true,
			["extra_icon_height"] = 20,
			["extra_icon_show_purge"] = true,
			["extra_icon_stack_font"] = "Expressway",
			["extra_icon_stack_outline"] = "OUTLINE",
			["extra_icon_timer_font"] = "Expressway",
			["extra_icon_timer_outline"] = "OUTLINE",
			["extra_icon_timer_size"] = 11,
			["extra_icon_width"] = 26,
			["first_run3"] = true,
			["health_cutoff_upper"] = false,
			["health_cutoff"] = false,
			["health_selection_overlay"] = "Minimalist",
			["health_statusbar_bgtexture"] = "Minimalist",
			["health_statusbar_texture"] = "Minimalist",
			["hide_friendly_castbars"] = true,
			["indicator_elite"] = false,
			["indicator_extra_raidmark"] = false,
			["indicator_faction"] = false,
			["indicator_pet"] = false,
			["indicator_raidmark_scale"] = 0.9,
			["indicator_rare"] = false,
			["indicator_scale"] = 1,
			["indicator_spec"] = false,
			["indicator_worldboss"] = false,
			["minor_height_scale"] = 1,
			["minor_width_scale"] = 1,
			["number_region_first_run"] = true,
			["patch_version"] = 19,
			["pet_height_scale"] = 1,
			["pet_width_scale"] = 1,
			["quick_hide"] = true,
			["range_check_alpha"] = 1,
			["range_check_in_range_or_target_alpha"] = 1,
			["semver"] = "3.3.0",
			["spell_animations"] = false,
			["target_highlight_alpha"] = 1,
			["target_highlight_height"] = 12,
			["target_highlight_texture"] = "Interface\\AddOns\\Plater\\images\\selection_indicator2",
			["target_indicator"] = "NONE",
			["target_shady_enabled"] = false,
			["ui_parent_base_strata"] = "LOW",
			["ui_parent_buff_special_strata"] = "LOW",
			["ui_parent_buff_strata"] = "LOW",
			["ui_parent_buff2_strata"] = "LOW",
			["ui_parent_cast_strata"] = "LOW",
			["ui_parent_scale_tune"] = 1,
			["update_throttle"] = 0.25,
			["use_name_translit"] = true,
			["use_ui_parent"] = true,
			["version"] = 13,
			["plate_config"] = {
				["global_health_height"] = 18,
				["global_health_width"] = 190,
				["player"] = {
					["spellpercent_text_font"] = "Expressway",
					["percent_text_shadow_color"] = {
						nil, -- [1]
						nil, -- [2]
						nil, -- [3]
						0, -- [4]
					},
					["power_percent_text_shadow_color"] = {
						nil, -- [1]
						nil, -- [2]
						nil, -- [3]
						0, -- [4]
					},
					["power_percent_text_font"] = "Expressway",
					["spellname_text_font"] = "Expressway",
					["spellpercent_text_shadow_color"] = {
						nil, -- [1]
						nil, -- [2]
						nil, -- [3]
						0, -- [4]
					},
					["percent_text_font"] = "Expressway",
					["spellname_text_shadow_color"] = {
						nil, -- [1]
						nil, -- [2]
						nil, -- [3]
						0, -- [4]
					},
				},
				["friendlyplayer"] = {
					["spellpercent_text_font"] = "Expressway",
					["actorname_use_class_color"] = true,
					["cast"] = {
						190, -- [1]
						12, -- [2]
					},
					["percent_text_shadow_color"] = {
						nil, -- [1]
						nil, -- [2]
						nil, -- [3]
						0, -- [4]
					},
					["spellname_text_outline"] = "OUTLINE",
					["level_text_font"] = "Expressway",
					["actorname_text_font"] = "Expressway",
					["actorname_use_guild_color"] = false,
					["level_text_shadow_color"] = {
						nil, -- [1]
						nil, -- [2]
						nil, -- [3]
						0, -- [4]
					},
					["cast_incombat"] = {
						190, -- [1]
					},
					["actorname_text_shadow_color"] = {
						nil, -- [1]
						nil, -- [2]
						nil, -- [3]
						0, -- [4]
					},
					["spellname_text_font"] = "Expressway",
					["spellpercent_text_shadow_color"] = {
						nil, -- [1]
						nil, -- [2]
						nil, -- [3]
						0, -- [4]
					},
					["actorname_text_size"] = 11,
					["level_text_outline"] = "OUTLINE",
					["percent_text_font"] = "Expressway",
					["spellname_text_shadow_color"] = {
						nil, -- [1]
						nil, -- [2]
						nil, -- [3]
						0, -- [4]
					},
					["health_incombat"] = {
						190, -- [1]
						18, -- [2]
					},
					["health"] = {
						190, -- [1]
						18, -- [2]
					},
				},
				["friendlynpc"] = {
					["spellpercent_text_font"] = "Expressway",
					["cast"] = {
						190, -- [1]
						12, -- [2]
					},
					["big_actortitle_text_size"] = 9,
					["spellname_text_outline"] = "OUTLINE",
					["big_actorname_text_shadow_color"] = {
						nil, -- [1]
						nil, -- [2]
						nil, -- [3]
						0, -- [4]
					},
					["level_text_font"] = "Expressway",
					["actorname_text_font"] = "Expressway",
					["all_names"] = false,
					["actorname_text_outline"] = "OUTLINE",
					["big_actortitle_text_font"] = "Expressway",
					["level_text_shadow_color"] = {
						nil, -- [1]
						nil, -- [2]
						nil, -- [3]
						0, -- [4]
					},
					["cast_incombat"] = {
						190, -- [1]
					},
					["relevance_state"] = 3,
					["actorname_text_shadow_color"] = {
						nil, -- [1]
						nil, -- [2]
						nil, -- [3]
						0, -- [4]
					},
					["big_actortitle_text_shadow_color"] = {
						nil, -- [1]
						nil, -- [2]
						nil, -- [3]
						0, -- [4]
					},
					["spellname_text_shadow_color"] = {
						nil, -- [1]
						nil, -- [2]
						nil, -- [3]
						0, -- [4]
					},
					["spellname_text_font"] = "Expressway",
					["spellpercent_text_shadow_color"] = {
						nil, -- [1]
						nil, -- [2]
						nil, -- [3]
						0, -- [4]
					},
					["actorname_text_size"] = 11,
					["big_actorname_text_font"] = "Expressway",
					["level_text_outline"] = "OUTLINE",
					["percent_text_shadow_color"] = {
						nil, -- [1]
						nil, -- [2]
						nil, -- [3]
						0, -- [4]
					},
					["percent_text_font"] = "Expressway",
					["health_incombat"] = {
						190, -- [1]
						18, -- [2]
					},
					["health"] = {
						190, -- [1]
						18, -- [2]
					},
				},
				["enemyplayer"] = {
					["big_actorname_text_size"] = 10,
					["spellpercent_text_font"] = "Expressway",
					["level_text_size"] = 8,
					["cast"] = {
						190, -- [1]
						12, -- [2]
					},
					["percent_text_shadow_color"] = {
						nil, -- [1]
						nil, -- [2]
						nil, -- [3]
						0, -- [4]
					},
					["spellpercent_text_anchor"] = {
						["x"] = -1,
					},
					["spellname_text_outline"] = "OUTLINE",
					["big_actorname_text_shadow_color"] = {
						nil, -- [1]
						nil, -- [2]
						nil, -- [3]
						0, -- [4]
					},
					["level_text_font"] = "Expressway",
					["actorname_text_font"] = "Expressway",
					["all_names"] = true,
					["actorname_text_outline"] = "OUTLINE",
					["actorname_text_spacing"] = 10,
					["quest_color_enemy"] = {
						1, -- [1]
						0.369, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["big_actortitle_text_font"] = "Expressway",
					["spellpercent_text_size"] = 9,
					["level_text_shadow_color"] = {
						nil, -- [1]
						nil, -- [2]
						nil, -- [3]
						0, -- [4]
					},
					["cast_incombat"] = {
						190, -- [1]
					},
					["actorname_text_shadow_color"] = {
						nil, -- [1]
						nil, -- [2]
						nil, -- [3]
						0, -- [4]
					},
					["spellname_text_anchor"] = {
						["x"] = 1,
						["side"] = 10,
					},
					["big_actortitle_text_shadow_color"] = {
						nil, -- [1]
						nil, -- [2]
						nil, -- [3]
						0, -- [4]
					},
					["percent_text_anchor"] = {
						["side"] = 11,
					},
					["spellname_text_shadow_color"] = {
						nil, -- [1]
						nil, -- [2]
						nil, -- [3]
						0, -- [4]
					},
					["spellpercent_text_shadow_color"] = {
						nil, -- [1]
						nil, -- [2]
						nil, -- [3]
						0, -- [4]
					},
					["spellname_text_font"] = "Expressway",
					["quest_color_neutral"] = {
						1, -- [1]
						0.65, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["actorname_text_size"] = 11,
					["big_actorname_text_font"] = "Expressway",
					["big_actortitle_text_size"] = 10,
					["level_text_outline"] = "OUTLINE",
					["percent_show_health"] = false,
					["percent_text_size"] = 11,
					["percent_text_font"] = "Expressway",
					["quest_enabled"] = true,
					["quest_color_enabled"] = true,
					["spellname_text_size"] = 9,
					["health"] = {
						190, -- [1]
						18, -- [2]
					},
					["actorname_text_anchor"] = {
						["x"] = 1,
						["side"] = 10,
					},
					["health_incombat"] = {
						190, -- [1]
						18, -- [2]
					},
					["level_text_enabled"] = false,
				},
				["enemynpc"] = {
					["spellpercent_text_font"] = "Expressway",
					["cast"] = {
						190, -- [1]
						12, -- [2]
					},
					["spellpercent_text_anchor"] = {
						["x"] = -1,
					},
					["big_actorname_text_shadow_color"] = {
						nil, -- [1]
						nil, -- [2]
						nil, -- [3]
						0, -- [4]
					},
					["level_text_font"] = "Expressway",
					["actorname_text_font"] = "Expressway",
					["actorname_text_outline"] = "OUTLINE",
					["big_actortitle_text_font"] = "Expressway",
					["spellpercent_text_size"] = 9,
					["level_text_shadow_color"] = {
						nil, -- [1]
						nil, -- [2]
						nil, -- [3]
						0, -- [4]
					},
					["cast_incombat"] = {
						190, -- [1]
						12, -- [2]
					},
					["actorname_text_shadow_color"] = {
						nil, -- [1]
						nil, -- [2]
						nil, -- [3]
						0, -- [4]
					},
					["spellname_text_anchor"] = {
						["x"] = 1,
						["side"] = 10,
					},
					["big_actortitle_text_shadow_color"] = {
						nil, -- [1]
						nil, -- [2]
						nil, -- [3]
						0, -- [4]
					},
					["percent_text_anchor"] = {
						["side"] = 11,
					},
					["spellname_text_font"] = "Expressway",
					["spellname_text_shadow_color"] = {
						nil, -- [1]
						nil, -- [2]
						nil, -- [3]
						0, -- [4]
					},
					["spellpercent_text_shadow_color"] = {
						nil, -- [1]
						nil, -- [2]
						nil, -- [3]
						0, -- [4]
					},
					["big_actorname_text_font"] = "Expressway",
					["level_text_outline"] = "OUTLINE",
					["percent_text_shadow_color"] = {
						nil, -- [1]
						nil, -- [2]
						nil, -- [3]
						0, -- [4]
					},
					["actorname_text_anchor"] = {
						["x"] = 1,
						["side"] = 10,
					},
					["percent_text_size"] = 11,
					["percent_text_font"] = "Expressway",
					["health_incombat"] = {
						190, -- [1]
						18, -- [2]
					},
					["health"] = {
						190, -- [1]
						18, -- [2]
					},
					["percent_show_health"] = false,
					["spellname_text_size"] = 9,
					["level_text_enabled"] = false,
				},
			},
			["hook_auto_imported"] = {
				["Reorder Nameplate"] = 4,
				["Dont Have Aura"] = 1,
				["Players Targetting Amount"] = 4,
				["Color Automation"] = 1,
				["Aura Reorder"] = 3,
				["Cast Bar Icon Config"] = 2,
				["Execute Range"] = 1,
				["Extra Border"] = 2,
				["Hide Neutral Units"] = 1,
				["Target Color"] = 3,
				["Attacking Specific Unit"] = 2,
				["Combo Points"] = 6,
			},
			["hook_data"] = {
				{
					["Enabled"] = true,
					["Revision"] = 106,
					["OptionsValues"] = {
					},
					["HooksTemp"] = {
					},
					["Author"] = "Luckyone-Laughing Skull",
					["Options"] = {
					},
					["Desc"] = "",
					["Hooks"] = {
						["Nameplate Updated"] = "function(self, unitId, unitFrame, envTable)\n    \n    local unitName = UnitName(unitId)\n    \n    -- Show First Name [Whitelist table]\n    local firstName = {\n        [3527] = true, -- Healing Stream Totem\n        [2630] = true, -- Earthbind Totem\n        [61245] = true, -- Capacitor Totem\n        [5925] = true, -- Grounding Totem\n        [105451] = true, -- Counterstrike Totem\n        [105427] = true, -- Skyfury Totem\n        [97369] = true, -- Liquid Magma Totem\n    }\n    \n    -- Show Full Name [Whitelist table]\n    local fullName = {\n        [167406] = true, -- Sire Fated\n    }\n    \n    if (unitName) then\n        local a , b, c, d, e, f = strsplit(' ', unitName, 5)\n        \n        if firstName [unitFrame.namePlateNpcId] then\n            unitFrame.healthBar.unitName:SetText(a)\n        elseif fullName[unitFrame.namePlateNpcId] then\n            unitFrame.healthBar.unitName:SetText(unitName)\n        else\n            unitFrame.healthBar.unitName:SetText(f or e or d or c or b or a)\n        end\n    end\nend",
					},
					["Prio"] = 1,
					["Name"] = "LuckyoneUI - Name",
					["LoadConditions"] = {
						["talent"] = {
						},
						["group"] = {
						},
						["class"] = {
						},
						["map_ids"] = {
						},
						["role"] = {
						},
						["pvptalent"] = {
						},
						["affix"] = {
						},
						["race"] = {
						},
						["encounter_ids"] = {
						},
						["spec"] = {
						},
					},
					["LastHookEdited"] = "",
					["Time"] = 1661180206,
					["Icon"] = 132115,
					["PlaterCore"] = 1,
				}, -- [1]
				{
					["Enabled"] = true,
					["Revision"] = 70,
					["OptionsValues"] = {
					},
					["HooksTemp"] = {
					},
					["Author"] = "Luckyone-Laughing Skull",
					["Options"] = {
					},
					["Desc"] = "",
					["Hooks"] = {
						["Nameplate Removed"] = "function(self, unitId, unitFrame, envTable)\n    envTable.UpdateBorder(unitFrame, false)\nend",
						["Cast Start"] = "function(self, unitId, unitFrame, envTable)\n    envTable.UpdateIconPosition(unitFrame)\n    envTable.UpdateBorder(unitFrame, true)\nend",
						["Cast Update"] = "function(self, unitId, unitFrame, envTable)\n    envTable.UpdateIconPosition(unitFrame)\nend",
						["Constructor"] = "function(self, unitId, unitFrame, envTable)\n    local hooksecurefunc = hooksecurefunc\n    \n    envTable.ShowIcon = Plater.db.profile.castbar_icon_show\n    envTable.IconAnchor = 'left'\n    envTable.IconSizeOffset = 0\n    \n    function envTable.UpdateIconPosition (unitFrame)\n        local castBar = unitFrame.castBar\n        local icon = castBar.Icon\n        local shield = castBar.BorderShield\n        \n        shield:Hide()\n        \n        if (envTable.ShowIcon) then\n            icon:ClearAllPoints()\n            \n            if (envTable.IconAnchor == 'left') then\n                icon:SetPoint ('topright', unitFrame.healthBar, 'topleft', 0, envTable.IconSizeOffset)\n                icon:SetPoint ('bottomright', unitFrame.castBar, 'bottomleft', 0, 0)\n                \n            elseif (envTable.IconAnchor == 'right') then\n                icon:SetPoint ('topleft', unitFrame.healthBar, 'topright', 0, envTable.IconSizeOffset)\n                icon:SetPoint ('bottomleft', unitFrame.castBar, 'bottomright', 0, 0)\n                \n            end\n            \n            icon:SetWidth (icon:GetHeight())\n            icon:Show()\n        else\n            icon:Hide()\n        end\n    end\n    \n    function envTable.UpdateBorder(unitFrame, casting)\n        local healthBar = unitFrame.healthBar\n        local castBar = unitFrame.castBar\n        \n        if casting then\n            if envTable.ShowIcon and castBar.Icon:IsShown() then\n                if envTable.IconAnchor == 'left' then\n                    healthBar.border:SetPoint('TOPLEFT', castBar.Icon, 'TOPLEFT', 0, 0)\n                    healthBar.border:SetPoint('BOTTOMRIGHT', castBar, 'BOTTOMRIGHT', 0, 0)\n                elseif envTable.IconAnchor == 'right' then\n                    healthBar.border:SetPoint('TOPRIGHT', castBar.Icon, 'TOPRIGHT', 0, 0)\n                    healthBar.border:SetPoint('BOTTOMLEFT', castBar, 'BOTTOMLEFT', 0, 0) \n                end\n            else\n                if envTable.IconAnchor == 'left' then\n                    healthBar.border:SetPoint('TOPLEFT', healthBar, 'TOPLEFT', 0, 0)\n                    healthBar.border:SetPoint('BOTTOMRIGHT', castBar, 'BOTTOMRIGHT', 0, 0)\n                elseif envTable.IconAnchor == 'right' then\n                    healthBar.border:SetPoint('TOPRIGHT', healthBar, 'TOPRIGHT', 0, 0)\n                    healthBar.border:SetPoint('BOTTOMLEFT', castBar, 'BOTTOMLEFT', 0, 0) \n                end\n            end\n        else\n            if envTable.IconAnchor == 'left' then\n                healthBar.border:SetPoint('TOPLEFT', healthBar, 'TOPLEFT', 0, 0)\n                healthBar.border:SetPoint('BOTTOMRIGHT', healthBar, 'BOTTOMRIGHT', 0, 0)\n            elseif envTable.IconAnchor == 'right' then\n                healthBar.border:SetPoint('TOPRIGHT', healthBar, 'TOPRIGHT', 0, 0)\n                healthBar.border:SetPoint('BOTTOMLEFT', healthBar, 'BOTTOMLEFT', 0, 0) \n            end\n        end\n    end\n    \n    if not unitFrame.castBar.borderChangeHooked then\n        hooksecurefunc(unitFrame.castBar, 'Hide', function() envTable.UpdateBorder(unitFrame, false) end)\n        unitFrame.castBar.borderChangeHooked = true\n    end\nend",
					},
					["Prio"] = 1,
					["Name"] = "LuckyoneUI - Castbar",
					["LoadConditions"] = {
						["talent"] = {
						},
						["group"] = {
						},
						["class"] = {
						},
						["map_ids"] = {
						},
						["role"] = {
						},
						["pvptalent"] = {
						},
						["affix"] = {
						},
						["race"] = {
						},
						["encounter_ids"] = {
						},
						["spec"] = {
						},
					},
					["LastHookEdited"] = "",
					["Time"] = 1661180261,
					["Icon"] = 132144,
					["PlaterCore"] = 1,
				}, -- [2]
				{
					["OptionsValues"] = {
					},
					["HooksTemp"] = {
					},
					["UID"] = "0x622bc8122a7529d",
					["Hooks"] = {
						["Initialization"] = "function(modTable)\n    local default = \"#00fbff\"\n    local affix = \"#C69B6D\"\n    \n    modTable.NpcColors = {\n        -- Grimrail Depot [DEPOT]\n        [81236] = default, -- Grimrail Technician\n        [81407] = default, -- Grimrail Bombardier\n        [80937] = default, -- Grom'kar Gunner\n        [88163] = default, -- Grom'kar Cinderseer\n        [82597] = default, -- Grom'kar Captain\n        -- Iron Docks [DOCKS]\n        [81603] = default, -- Champion Druna\n        [83025] = default, -- Grom'kar Battlemaster\n        [86526] = default, -- Grom'kar Chainmaster\n        [83026] = default, -- Siegemaster Olugar\n        [84028] = default, -- Siegemaster Rokra\n        -- Karazhan Lower [LOWER]\n        [114584] = default, -- Phantom Crew\n        [114628] = default, -- Skele] = default, \n        [114802] = default, -- Spectral Journeyman\n        -- Karazhan Upper [UPPER]\n        [114338] = default, -- Mana Confluence\n        [114249] = default, -- Volatile Energy\n        [115757] = default, -- Wrathguard Flamebringer\n        [115418] = default, -- Spider\n        [115488] = default, -- Infused Pyromancer\n        -- Mechagon Workshop [WORK]\n        [144293] = default, -- Waste Processing Unit\n        [144294] = default, -- Mechagon Tinkerer\n        [151325] = default, -- Alarm o Bot\n        [151657] = default, -- Bomb Tonk\n        -- Mechagon Junkyard [YARD]\n        [150146] = default, -- Scrapbone Shaman\n        [150160] = default, -- Scrapbone Bully\n        [150168] = default, -- Toxic Monstrosity\n        [150250] = default, -- Pistonhead Blaster\n        [150251] = default, -- Pistonhead Mechanic\n        [150292] = default, -- Mechagon Cavalry\n        [150297] = default, -- Mechagon Renormalizer\n        -- Tazavesh [TZ]\n        [178141] = default, -- Murkbrine Scalebinder\n        [179733] = default, -- Invigorating Fish Stick\n        [180431] = default, -- Focused Ritualist\n        [180433] = default, -- Wandering Pulsar\n        -- Affix Season 4\n        [189878] = affix, -- Nathrezim Infiltrator\n        [190174] = affix, -- Hypnosis Bat\n        [190128] = affix, -- Zul'gamux\n    }\n    function modTable.UpdateColor(unitFrame, envTable)\n        if not unitFrame or unitFrame.IsNpcWithoutHealthbar or unitFrame.IsFriendlyPlayerWithoutHealthbar then return end\n        -- Get color from modTable.NpcColors\n        local color = modTable.NpcColors [unitFrame.namePlateNpcId]\n        -- Set color from modTable.NpcColors\n        if (color) then\n            Plater.SetNameplateColor(unitFrame, color)\n        end\n    end\nend",
						["Nameplate Updated"] = "function (self, unitId, unitFrame, envTable, modTable)\n    modTable.UpdateColor (unitFrame, envTable)\nend",
					},
					["Time"] = 1661180206,
					["LoadConditions"] = {
						["talent"] = {
						},
						["group"] = {
						},
						["class"] = {
						},
						["map_ids"] = {
						},
						["role"] = {
						},
						["pvptalent"] = {
						},
						["affix"] = {
						},
						["race"] = {
						},
						["encounter_ids"] = {
						},
						["spec"] = {
						},
					},
					["Icon"] = 132276,
					["Enabled"] = true,
					["Revision"] = 54,
					["Options"] = {
					},
					["Author"] = "Luckyone-Laughing Skull",
					["Desc"] = "",
					["Prio"] = 1,
					["Name"] = "LuckyoneUI - Colors",
					["PlaterCore"] = 1,
					["LastHookEdited"] = "",
				}, -- [3]
			},
			["script_auto_imported"] = {
				["Cast - Important Target [P]"] = 1,
				["Aura - Buff Alert"] = 13,
				["Cast - Very Important"] = 12,
				["Explosion Affix M+"] = 11,
				["Aura - Debuff Alert"] = 11,
				["Cast - Castbar is Timer [P]"] = 2,
				["Cast - Ultra Important"] = 11,
				["Cast - Big Alert"] = 12,
				["Cast - Small Alert"] = 11,
				["Fixate On You"] = 11,
				["Spiteful Affix"] = 3,
				["Relics 9.2 M Dungeons"] = 2,
				["Unit - Main Target"] = 11,
				["Aura - Blink Time Left"] = 13,
				["Cast - Alert + Timer [P]"] = 2,
				["Countdown"] = 11,
				["Unit - Health Markers"] = 12,
				["Cast - Frontal Cone"] = 11,
				["Fixate"] = 11,
				["Cast - Tank Interrupt"] = 12,
				["Auto Set Skull"] = 11,
				["Unit - Important"] = 11,
				["Unit - Show Energy"] = 11,
			},
			["script_data"] = {
				{
					["ConstructorCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    --settings\n    envTable.NameplateSizeOffset = scriptTable.config.castBarHeight\n    envTable.ShowArrow = scriptTable.config.showArrow\n    envTable.ArrowAlpha = scriptTable.config.arrowAlpha\n    envTable.HealthBarColor = scriptTable.config.healthBarColor\n    \n    --creates the spark to show the cast progress inside the health bar\n    envTable.overlaySpark = envTable.overlaySpark or Plater:CreateImage (unitFrame.healthBar)\n    envTable.overlaySpark:SetBlendMode (\"ADD\")\n    envTable.overlaySpark.width = 16\n    envTable.overlaySpark.height = 36\n    envTable.overlaySpark.alpha = .9\n    envTable.overlaySpark.texture = [[Interface\\AddOns\\Plater\\images\\spark3]]\n    \n    envTable.topArrow = envTable.topArrow or Plater:CreateImage (unitFrame.healthBar)\n    envTable.topArrow:SetBlendMode (\"ADD\")\n    envTable.topArrow.width = scriptTable.config.arrowWidth\n    envTable.topArrow.height = scriptTable.config.arrowHeight\n    envTable.topArrow.alpha = envTable.ArrowAlpha\n    envTable.topArrow.texture = [[Interface\\BUTTONS\\Arrow-Down-Up]]\n    \n    --scale animation\n    envTable.smallScaleAnimation = envTable.smallScaleAnimation or Plater:CreateAnimationHub (unitFrame.healthBar)\n    Plater:CreateAnimation (envTable.smallScaleAnimation, \"SCALE\", 1, 0.075, 1, 1, 1.08, 1.08)\n    Plater:CreateAnimation (envTable.smallScaleAnimation, \"SCALE\", 2, 0.075, 1, 1, 0.95, 0.95)    \n    --envTable.smallScaleAnimation:Play() --envTable.smallScaleAnimation:Stop()\n    \nend\n\n\n\n\n\n\n\n",
					["OnHideCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    Plater.StopDotAnimation(unitFrame.healthBar, envTable.dotAnimation)\n    \n    envTable.overlaySpark:Hide()\n    envTable.topArrow:Hide()\n    \n    Plater.RefreshNameplateColor (unitFrame)\n    \n    envTable.smallScaleAnimation:Stop()\n    \n    --increase the nameplate size\n    local nameplateHeight = Plater.db.profile.plate_config.enemynpc.health_incombat [2]\n    unitFrame.healthBar:SetHeight (nameplateHeight)\nend\n\n\n",
					["OptionsValues"] = {
					},
					["Temp_OnShowCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    envTable.overlaySpark:Show()\n    \n    if (envTable.ShowArrow) then\n        envTable.topArrow:Show()\n    end\n    \n    Plater.FlashNameplateBorder (unitFrame, 0.05)   \n    Plater.FlashNameplateBody (unitFrame, \"\", 0.075)\n    \n    envTable.smallScaleAnimation:Play()\n    \n    --increase the nameplate size\n    local nameplateHeight = Plater.db.profile.plate_config.enemynpc.health_incombat [2]\n    unitFrame.healthBar:SetHeight (nameplateHeight + envTable.NameplateSizeOffset)\n    \n    envTable.overlaySpark.height = nameplateHeight + 5\n    \n    envTable.dotAnimation = Plater.PlayDotAnimation(unitFrame.healthBar, 2, scriptTable.config.dotColor, scriptTable.config.xOffset, scriptTable.config.yOffset)\n    \n    self:SetStatusBarColor (Plater:ParseColors (scriptTable.config.castBarColor))\nend\n\n\n\n\n\n\n",
					["ScriptType"] = 2,
					["UpdateCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    --update the percent\n    envTable.overlaySpark:SetPoint (\"left\", unitFrame.healthBar:GetWidth() * (envTable._CastPercent / 100)-9, 0)\n    \n    envTable.topArrow:SetPoint (\"bottomleft\", unitFrame.healthBar, \"topleft\", unitFrame.healthBar:GetWidth() * (envTable._CastPercent / 100) - 4, 2 )\n    \n    --forces the script to update on a 60Hz base\n    self.ThrottleUpdate = 0\n    \n\nend\n\n\n",
					["Time"] = 1661180262,
					["NpcNames"] = {
					},
					["url"] = "",
					["Icon"] = 2175503,
					["Options"] = {
						{
							["Type"] = 6,
							["Key"] = "option1",
							["Value"] = 0,
							["Name"] = "Option 1",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
							["Desc"] = "",
						}, -- [1]
						{
							["Type"] = 5,
							["Key"] = "option2",
							["Value"] = "Plays a special animation showing the explosion time.",
							["Name"] = "Option 2",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_label",
							["Desc"] = "",
						}, -- [2]
						{
							["Type"] = 6,
							["Key"] = "option3",
							["Value"] = 0,
							["Name"] = "Option 3",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
							["Desc"] = "",
						}, -- [3]
						{
							["Type"] = 2,
							["Max"] = 6,
							["Desc"] = "Increases the cast bar height by this value",
							["Min"] = 0,
							["Key"] = "castBarHeight",
							["Value"] = 3,
							["Name"] = "Cast Bar Height Mod",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
							["Fraction"] = false,
						}, -- [4]
						{
							["Type"] = 1,
							["Key"] = "castBarColor",
							["Value"] = {
								1, -- [1]
								0.5843137254902, -- [2]
								0, -- [3]
								1, -- [4]
							},
							["Name"] = "Cast Bar Color",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_color",
							["Desc"] = "Changes the cast bar color to this one.",
						}, -- [5]
						{
							["Type"] = 6,
							["Key"] = "option7",
							["Value"] = 0,
							["Name"] = "Option 7",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
							["Desc"] = "",
						}, -- [6]
						{
							["Type"] = 5,
							["Key"] = "option6",
							["Value"] = "Arrow:",
							["Name"] = "Arrow:",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_label",
							["Desc"] = "",
						}, -- [7]
						{
							["Type"] = 4,
							["Key"] = "showArrow",
							["Value"] = true,
							["Name"] = "Show Arrow",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_bool",
							["Desc"] = "Show an arrow above the nameplate showing the cast bar progress.",
						}, -- [8]
						{
							["Type"] = 2,
							["Max"] = 1,
							["Desc"] = "Arrow alpha.",
							["Min"] = 0,
							["Key"] = "arrowAlpha",
							["Value"] = 0.5,
							["Name"] = "Arrow Alpha",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
							["Fraction"] = true,
						}, -- [9]
						{
							["Type"] = 2,
							["Max"] = 12,
							["Desc"] = "Arrow Width.",
							["Min"] = 4,
							["Key"] = "arrowWidth",
							["Value"] = 8,
							["Name"] = "Arrow Width",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
							["Fraction"] = false,
						}, -- [10]
						{
							["Type"] = 2,
							["Max"] = 12,
							["Desc"] = "Arrow Height.",
							["Min"] = 4,
							["Key"] = "arrowHeight",
							["Value"] = 8,
							["Name"] = "Arrow Height",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
							["Fraction"] = false,
						}, -- [11]
						{
							["Type"] = 6,
							["Key"] = "option13",
							["Value"] = 0,
							["Name"] = "Option 13",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
							["Desc"] = "",
						}, -- [12]
						{
							["Type"] = 5,
							["Key"] = "option12",
							["Value"] = "Dot Animation:",
							["Name"] = "Dot Animation:",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_label",
							["Desc"] = "",
						}, -- [13]
						{
							["Type"] = 1,
							["Key"] = "dotColor",
							["Value"] = {
								1, -- [1]
								0.6156862745098, -- [2]
								0, -- [3]
								1, -- [4]
							},
							["Name"] = "Dot Color",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_color",
							["Desc"] = "Adjust the color of the dot animation.",
						}, -- [14]
						{
							["Type"] = 2,
							["Max"] = 10,
							["Desc"] = "Dot X Offset",
							["Min"] = -10,
							["Key"] = "xOffset",
							["Value"] = 4,
							["Name"] = "Dot X Offset",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
							["Fraction"] = false,
						}, -- [15]
						{
							["Type"] = 2,
							["Max"] = 10,
							["Desc"] = "Dot Y Offset",
							["Min"] = -10,
							["Key"] = "yOffset",
							["Value"] = 3,
							["Name"] = "Dot Y Offset",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
							["Fraction"] = false,
						}, -- [16]
					},
					["Temp_OnHideCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    Plater.StopDotAnimation(unitFrame.healthBar, envTable.dotAnimation)\n    \n    envTable.overlaySpark:Hide()\n    envTable.topArrow:Hide()\n    \n    Plater.RefreshNameplateColor (unitFrame)\n    \n    envTable.smallScaleAnimation:Stop()\n    \n    --increase the nameplate size\n    local nameplateHeight = Plater.db.profile.plate_config.enemynpc.health_incombat [2]\n    unitFrame.healthBar:SetHeight (nameplateHeight)\nend\n\n\n",
					["Revision"] = 470,
					["semver"] = "",
					["Desc"] = "Explosive Affix Script",
					["version"] = -1,
					["Author"] = "Bombad�o-Azralon",
					["Initialization"] = "function (scriptTable)\n    --insert code here\n    \nend\n\n\n",
					["OnShowCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    envTable.overlaySpark:Show()\n    \n    if (envTable.ShowArrow) then\n        envTable.topArrow:Show()\n    end\n    \n    Plater.FlashNameplateBorder (unitFrame, 0.05)   \n    Plater.FlashNameplateBody (unitFrame, \"\", 0.075)\n    \n    envTable.smallScaleAnimation:Play()\n    \n    --increase the nameplate size\n    local nameplateHeight = Plater.db.profile.plate_config.enemynpc.health_incombat [2]\n    unitFrame.healthBar:SetHeight (nameplateHeight + envTable.NameplateSizeOffset)\n    \n    envTable.overlaySpark.height = nameplateHeight + 5\n    \n    envTable.dotAnimation = Plater.PlayDotAnimation(unitFrame.healthBar, 2, scriptTable.config.dotColor, scriptTable.config.xOffset, scriptTable.config.yOffset)\n    \n    self:SetStatusBarColor (Plater:ParseColors (scriptTable.config.castBarColor))\nend\n\n\n\n\n\n\n",
					["Name"] = "Explosion Affix M+ [Plater]",
					["Temp_UpdateCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    --update the percent\n    envTable.overlaySpark:SetPoint (\"left\", unitFrame.healthBar:GetWidth() * (envTable._CastPercent / 100)-9, 0)\n    \n    envTable.topArrow:SetPoint (\"bottomleft\", unitFrame.healthBar, \"topleft\", unitFrame.healthBar:GetWidth() * (envTable._CastPercent / 100) - 4, 2 )\n    \n    --forces the script to update on a 60Hz base\n    self.ThrottleUpdate = 0\n    \n\nend\n\n\n",
					["SpellIds"] = {
						240446, -- [1]
					},
					["PlaterCore"] = 1,
					["Prio"] = 99,
					["Temp_Initialization"] = "function (scriptTable)\n    --insert code here\n    \nend\n\n\n",
					["Enabled"] = true,
					["Temp_ConstructorCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    --settings\n    envTable.NameplateSizeOffset = scriptTable.config.castBarHeight\n    envTable.ShowArrow = scriptTable.config.showArrow\n    envTable.ArrowAlpha = scriptTable.config.arrowAlpha\n    envTable.HealthBarColor = scriptTable.config.healthBarColor\n    \n    --creates the spark to show the cast progress inside the health bar\n    envTable.overlaySpark = envTable.overlaySpark or Plater:CreateImage (unitFrame.healthBar)\n    envTable.overlaySpark:SetBlendMode (\"ADD\")\n    envTable.overlaySpark.width = 16\n    envTable.overlaySpark.height = 36\n    envTable.overlaySpark.alpha = .9\n    envTable.overlaySpark.texture = [[Interface\\AddOns\\Plater\\images\\spark3]]\n    \n    envTable.topArrow = envTable.topArrow or Plater:CreateImage (unitFrame.healthBar)\n    envTable.topArrow:SetBlendMode (\"ADD\")\n    envTable.topArrow.width = scriptTable.config.arrowWidth\n    envTable.topArrow.height = scriptTable.config.arrowHeight\n    envTable.topArrow.alpha = envTable.ArrowAlpha\n    envTable.topArrow.texture = [[Interface\\BUTTONS\\Arrow-Down-Up]]\n    \n    --scale animation\n    envTable.smallScaleAnimation = envTable.smallScaleAnimation or Plater:CreateAnimationHub (unitFrame.healthBar)\n    Plater:CreateAnimation (envTable.smallScaleAnimation, \"SCALE\", 1, 0.075, 1, 1, 1.08, 1.08)\n    Plater:CreateAnimation (envTable.smallScaleAnimation, \"SCALE\", 2, 0.075, 1, 1, 0.95, 0.95)    \n    --envTable.smallScaleAnimation:Play() --envTable.smallScaleAnimation:Stop()\n    \nend\n\n\n\n\n\n\n\n",
				}, -- [1]
			},
			["saved_cvars"] = {
				["nameplateSelectedAlpha"] = "1",
				["ShowClassColorInNameplate"] = "1",
				["nameplateOverlapV"] = "1.6",
				["nameplateLargeTopInset"] = "-1",
				["nameplateShowEnemyMinus"] = "1",
				["nameplateShowAll"] = "1",
				["nameplateMotionSpeed"] = "0.05",
				["NamePlateClassificationScale"] = "1",
				["nameplateShowFriendlyTotems"] = "0",
				["nameplateShowEnemyMinions"] = "1",
				["nameplateShowFriendlyPets"] = "0",
				["nameplateShowFriendlyNPCs"] = "1",
				["nameplateSelectedScale"] = "1",
				["nameplateOverlapH"] = "1",
				["nameplateTargetRadialPosition"] = "1",
				["nameplateOtherTopInset"] = "-1",
				["nameplateMinAlpha"] = "0.90",
				["nameplateMinAlphaDistance"] = "-158489.31924611",
				["nameplateMotion"] = "1",
				["clampTargetNameplateToScreen"] = "1",
				["nameplateMinScale"] = "1",
				["nameplateMaxDistance"] = "100",
				["nameplateShowFriendlyMinions"] = "0",
				["nameplateShowFriends"] = "0",
				["NamePlateHorizontalScale"] = "1",
				["ShowNamePlateLoseAggroFlash"] = "0",
				["nameplateShowFriendlyGuardians"] = "0",
				["nameplateTargetBehindMaxDistance"] = "30",
				["nameplatePersonalHideDelaySeconds"] = "0.2",
				["nameplateShowEnemies"] = "1",
				["nameplateResourceOnTarget"] = "0",
				["NamePlateVerticalScale"] = "1",
			},
			["cast_statusbar_color_nointerrupt"] = {
				1, -- [1]
				0, -- [2]
				0.00, -- [3]
				0.96, -- [4]
			},
			["extra_icon_anchor"] = {
				["x"] = -2,
			},
			["click_space_friendly"] = {
				nil, -- [1]
				18, -- [2]
			},
			["OptionsPanelDB"] = {
				["PlaterOptionsPanelFrame"] = {
					["scale"] = 1,
				},
			},
			["ghost_auras"] = {
				["auras"] = {},
			},
			["castbar_target_shadow_color"] = {
				nil, -- [1]
				nil, -- [2]
				nil, -- [3]
				0, -- [4]
			},
			["target_highlight_color"] = {
				nil, -- [1]
				1, -- [2]
			},
			["resources"] = {
				["scale"] = 1,
			},
			["click_space"] = {
				nil, -- [1]
				18, -- [2]
			},
			["indicator_raidmark_anchor"] = {
				["y"] = 0.5,
				["x"] = 1,
			},
			["cast_statusbar_color"] = {
				0.02, -- [1]
				1, -- [2]
				nil, -- [3]
				0.96, -- [4]
			},
			["color_override_colors"] = {
				[3] = {
					0.91, -- [1]
					0.12, -- [2]
					0.07, -- [3]
				},
			},
			["cast_statusbar_bgcolor"] = {
				0.05, -- [1]
				0.05, -- [2]
				0.05, -- [3]
				0.80, -- [4]
			},
			["health_statusbar_bgcolor"] = {
				0.05, -- [1]
				0.05, -- [2]
				0.05, -- [3]
				0.80, -- [4]
			},
			["castbar_target_anchor"] = {
				["x"] = 2,
				["side"] = 6,
			},
			["tank"] = {
				["colors"] = {
					["nocombat"] = {
						0.91, -- [1]
						0.12, -- [2]
						0.07, -- [3]
					},
				},
			},
			["cast_statusbar_color_interrupted"] = {
				0.30, -- [1]
				0.30, -- [2]
				0.30, -- [3]
			},
		}

		-- Profile key
		PlaterDB["profileKeys"][E.mynameRealm] = name

	end

	-- Wipe captured_casts, captured_spells and npc_cache
	L1UI:Cleanup_Cache('plater')

	L1UI:Print(L["Plater profile has been set."])
end
