local L1UI, E, L, V, P, G = unpack(select(2, ...))

local IsAddOnLoaded = IsAddOnLoaded

-- Plater profile
function L1UI:Setup_Plater()
	if not IsAddOnLoaded('Plater') then return end

	-- Profile name
	local name = "Luckyone"

	if E.Retail then

		-- Create profile if it doesn't exist yet
		PlaterDB["profiles"][name] = PlaterDB["profiles"][name] or {}

		-- Profile db
		PlaterDB["profiles"][name] = {
			["script_data"] = {
				{
					["ConstructorCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    --settings\n    envTable.NameplateSizeOffset = scriptTable.config.castBarHeight\n    envTable.ShowArrow = scriptTable.config.showArrow\n    envTable.ArrowAlpha = scriptTable.config.arrowAlpha\n    envTable.HealthBarColor = scriptTable.config.healthBarColor\n    \n    --creates the spark to show the cast progress inside the health bar\n    envTable.overlaySpark = envTable.overlaySpark or Plater:CreateImage (unitFrame.healthBar)\n    envTable.overlaySpark:SetBlendMode (\"ADD\")\n    envTable.overlaySpark.width = 16\n    envTable.overlaySpark.height = 36\n    envTable.overlaySpark.alpha = .9\n    envTable.overlaySpark.texture = [[Interface\\AddOns\\Plater\\images\\spark3]]\n    \n    envTable.topArrow = envTable.topArrow or Plater:CreateImage (unitFrame.healthBar)\n    envTable.topArrow:SetBlendMode (\"ADD\")\n    envTable.topArrow.width = scriptTable.config.arrowWidth\n    envTable.topArrow.height = scriptTable.config.arrowHeight\n    envTable.topArrow.alpha = envTable.ArrowAlpha\n    envTable.topArrow.texture = [[Interface\\BUTTONS\\Arrow-Down-Up]]\n    \n    --scale animation\n    envTable.smallScaleAnimation = envTable.smallScaleAnimation or Plater:CreateAnimationHub (unitFrame.healthBar)\n    Plater:CreateAnimation (envTable.smallScaleAnimation, \"SCALE\", 1, 0.075, 1, 1, 1.08, 1.08)\n    Plater:CreateAnimation (envTable.smallScaleAnimation, \"SCALE\", 2, 0.075, 1, 1, 0.95, 0.95)    \n    --envTable.smallScaleAnimation:Play() --envTable.smallScaleAnimation:Stop()\n    \nend\n\n\n\n\n\n\n\n",
					["OnHideCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    Plater.StopDotAnimation(unitFrame.healthBar, envTable.dotAnimation)\n    \n    envTable.overlaySpark:Hide()\n    envTable.topArrow:Hide()\n    \n    Plater.RefreshNameplateColor (unitFrame)\n    \n    envTable.smallScaleAnimation:Stop()\n    \n    --increase the nameplate size\n    local nameplateHeight = Plater.db.profile.plate_config.enemynpc.health_incombat [2]\n    unitFrame.healthBar:SetHeight (nameplateHeight)\nend\n\n\n",
					["OptionsValues"] = {
					},
					["Temp_OnShowCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    envTable.overlaySpark:Show()\n    \n    if (envTable.ShowArrow) then\n        envTable.topArrow:Show()\n    end\n    \n    Plater.FlashNameplateBorder (unitFrame, 0.05)   \n    Plater.FlashNameplateBody (unitFrame, \"\", 0.075)\n    \n    envTable.smallScaleAnimation:Play()\n    \n    --increase the nameplate size\n    local nameplateHeight = Plater.db.profile.plate_config.enemynpc.health_incombat [2]\n    unitFrame.healthBar:SetHeight (nameplateHeight + envTable.NameplateSizeOffset)\n    \n    envTable.overlaySpark.height = nameplateHeight + 5\n    \n    envTable.dotAnimation = Plater.PlayDotAnimation(unitFrame.healthBar, 2, scriptTable.config.dotColor, scriptTable.config.xOffset, scriptTable.config.yOffset)\n    \n    self:SetStatusBarColor (Plater:ParseColors (scriptTable.config.castBarColor))\nend\n\n\n\n\n\n\n",
					["ScriptType"] = 2,
					["UpdateCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    --update the percent\n    envTable.overlaySpark:SetPoint (\"left\", unitFrame.healthBar:GetWidth() * (envTable._CastPercent / 100)-9, 0)\n    \n    envTable.topArrow:SetPoint (\"bottomleft\", unitFrame.healthBar, \"topleft\", unitFrame.healthBar:GetWidth() * (envTable._CastPercent / 100) - 4, 2 )\n    \n    --forces the script to update on a 60Hz base\n    self.ThrottleUpdate = 0\n    \n\nend\n\n\n",
					["Time"] = 1659383249,
					["Icon"] = 2175503,
					["Temp_ConstructorCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    --settings\n    envTable.NameplateSizeOffset = scriptTable.config.castBarHeight\n    envTable.ShowArrow = scriptTable.config.showArrow\n    envTable.ArrowAlpha = scriptTable.config.arrowAlpha\n    envTable.HealthBarColor = scriptTable.config.healthBarColor\n    \n    --creates the spark to show the cast progress inside the health bar\n    envTable.overlaySpark = envTable.overlaySpark or Plater:CreateImage (unitFrame.healthBar)\n    envTable.overlaySpark:SetBlendMode (\"ADD\")\n    envTable.overlaySpark.width = 16\n    envTable.overlaySpark.height = 36\n    envTable.overlaySpark.alpha = .9\n    envTable.overlaySpark.texture = [[Interface\\AddOns\\Plater\\images\\spark3]]\n    \n    envTable.topArrow = envTable.topArrow or Plater:CreateImage (unitFrame.healthBar)\n    envTable.topArrow:SetBlendMode (\"ADD\")\n    envTable.topArrow.width = scriptTable.config.arrowWidth\n    envTable.topArrow.height = scriptTable.config.arrowHeight\n    envTable.topArrow.alpha = envTable.ArrowAlpha\n    envTable.topArrow.texture = [[Interface\\BUTTONS\\Arrow-Down-Up]]\n    \n    --scale animation\n    envTable.smallScaleAnimation = envTable.smallScaleAnimation or Plater:CreateAnimationHub (unitFrame.healthBar)\n    Plater:CreateAnimation (envTable.smallScaleAnimation, \"SCALE\", 1, 0.075, 1, 1, 1.08, 1.08)\n    Plater:CreateAnimation (envTable.smallScaleAnimation, \"SCALE\", 2, 0.075, 1, 1, 0.95, 0.95)    \n    --envTable.smallScaleAnimation:Play() --envTable.smallScaleAnimation:Stop()\n    \nend\n\n\n\n\n\n\n\n",
					["NpcNames"] = {
					},
					["semver"] = "",
					["Enabled"] = true,
					["Revision"] = 468,
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
					["OnShowCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    envTable.overlaySpark:Show()\n    \n    if (envTable.ShowArrow) then\n        envTable.topArrow:Show()\n    end\n    \n    Plater.FlashNameplateBorder (unitFrame, 0.05)   \n    Plater.FlashNameplateBody (unitFrame, \"\", 0.075)\n    \n    envTable.smallScaleAnimation:Play()\n    \n    --increase the nameplate size\n    local nameplateHeight = Plater.db.profile.plate_config.enemynpc.health_incombat [2]\n    unitFrame.healthBar:SetHeight (nameplateHeight + envTable.NameplateSizeOffset)\n    \n    envTable.overlaySpark.height = nameplateHeight + 5\n    \n    envTable.dotAnimation = Plater.PlayDotAnimation(unitFrame.healthBar, 2, scriptTable.config.dotColor, scriptTable.config.xOffset, scriptTable.config.yOffset)\n    \n    self:SetStatusBarColor (Plater:ParseColors (scriptTable.config.castBarColor))\nend\n\n\n\n\n\n\n",
					["Name"] = "Explosion Affix M+ [Plater]",
					["Author"] = "Bombad�o-Azralon",
					["Initialization"] = "function (scriptTable)\n    --insert code here\n    \nend\n\n\n",
					["Desc"] = "Explosive Affix Script",
					["version"] = -1,
					["Prio"] = 99,
					["SpellIds"] = {
						240446, -- [1]
					},
					["PlaterCore"] = 1,
					["Temp_UpdateCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    --update the percent\n    envTable.overlaySpark:SetPoint (\"left\", unitFrame.healthBar:GetWidth() * (envTable._CastPercent / 100)-9, 0)\n    \n    envTable.topArrow:SetPoint (\"bottomleft\", unitFrame.healthBar, \"topleft\", unitFrame.healthBar:GetWidth() * (envTable._CastPercent / 100) - 4, 2 )\n    \n    --forces the script to update on a 60Hz base\n    self.ThrottleUpdate = 0\n    \n\nend\n\n\n",
					["Temp_Initialization"] = "function (scriptTable)\n    --insert code here\n    \nend\n\n\n",
					["Temp_OnHideCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    Plater.StopDotAnimation(unitFrame.healthBar, envTable.dotAnimation)\n    \n    envTable.overlaySpark:Hide()\n    envTable.topArrow:Hide()\n    \n    Plater.RefreshNameplateColor (unitFrame)\n    \n    envTable.smallScaleAnimation:Stop()\n    \n    --increase the nameplate size\n    local nameplateHeight = Plater.db.profile.plate_config.enemynpc.health_incombat [2]\n    unitFrame.healthBar:SetHeight (nameplateHeight)\nend\n\n\n",
					["url"] = "",
				}, -- [1]
			},
			["saved_cvars_last_change"] = {
				["nameplateMinAlpha"] = "Interface\\AddOns\\Plater\\Plater.lua:4287",
				["nameplateShowFriends"] = "[string \"=[C]\"]: in function `SetCVar'\n[string \"ALLNAMEPLATES\"]:13: in function <[string \"ALLNAMEPLATES\"]:1>\n",
				["nameplateSelectedAlpha"] = "Interface\\AddOns\\Plater\\Plater.lua:4289",
				["NamePlateHorizontalScale"] = "Interface\\FrameXML\\InterfaceOptionsPanels.lua:1440",
				["NamePlateClassificationScale"] = "Interface\\FrameXML\\InterfaceOptionsPanels.lua:1442",
				["nameplateShowEnemies"] = "[string \"=[C]\"]: in function `SetCVar'\n[string \"NAMEPLATES\"]:6: in function <[string \"NAMEPLATES\"]:1>\n",
				["nameplateMinAlphaDistance"] = "Interface\\AddOns\\Plater\\Plater.lua:4288",
				["NamePlateVerticalScale"] = "Interface\\FrameXML\\InterfaceOptionsPanels.lua:1441",
			},
			["health_cutoff_upper"] = false,
			["aura2_y_offset"] = 5,
			["cast_statusbar_color_nointerrupt"] = {
				1, -- [1]
				0, -- [2]
				0.007843137254902, -- [3]
				0.96000000089407, -- [4]
			},
			["minor_height_scale"] = 0.9999999403953552,
			["indicator_worldboss"] = false,
			["aura_width2"] = 16,
			["aura_show_crowdcontrol"] = true,
			["health_cutoff"] = false,
			["extra_icon_anchor"] = {
				["x"] = 1,
			},
			["extra_icon_wide_icon"] = false,
			["range_check_alpha"] = 1,
			["semver"] = "3.3.0",
			["use_name_translit"] = true,
			["extra_icon_show_purge"] = true,
			["spell_animations"] = false,
			["aura_consolidate"] = true,
			["extra_icon_width"] = 26,
			["health_statusbar_texture"] = "Minimalist",
			["hook_auto_imported"] = {
				["Reorder Nameplate"] = 4,
				["Dont Have Aura"] = 1,
				["Players Targetting Amount"] = 4,
				["Color Automation"] = 1,
				["Execute Range"] = 1,
				["Cast Bar Icon Config"] = 2,
				["Aura Reorder"] = 3,
				["Combo Points"] = 6,
				["Hide Neutral Units"] = 1,
				["Target Color"] = 3,
				["Attacking Specific Unit"] = 2,
				["Extra Border"] = 2,
			},
			["minor_width_scale"] = 0.9999999403953552,
			["indicator_pet"] = false,
			["aura_frame1_anchor"] = {
				["y"] = 2,
			},
			["indicator_rare"] = false,
			["extra_icon_stack_font"] = "Expressway",
			["cast_statusbar_bgtexture"] = "Minimalist",
			["aura2_x_offset"] = 0,
			["target_indicator"] = "NONE",
			["aura_show_buff_by_the_unit"] = false,
			["castbar_target_notank"] = true,
			["saved_cvars"] = {
				["nameplateSelectedAlpha"] = "1",
				["ShowClassColorInNameplate"] = "1",
				["nameplateOverlapV"] = "1.8999999761581",
				["nameplateLargeTopInset"] = "-1",
				["nameplateShowEnemyMinus"] = "1",
				["nameplateMinScale"] = "1",
				["nameplateMotionSpeed"] = "0.05",
				["NamePlateClassificationScale"] = "1",
				["nameplateShowFriendlyTotems"] = "0",
				["nameplateShowEnemyMinions"] = "1",
				["nameplateShowFriendlyPets"] = "0",
				["nameplateShowFriendlyNPCs"] = "0",
				["nameplateSelectedScale"] = "1",
				["nameplateOverlapH"] = "1.2000000476837",
				["nameplateTargetRadialPosition"] = "1",
				["nameplateOtherTopInset"] = "-1",
				["nameplateMinAlpha"] = "0.90135484",
				["nameplateResourceOnTarget"] = "0",
				["nameplateMotion"] = "1",
				["clampTargetNameplateToScreen"] = "1",
				["nameplateShowAll"] = "1",
				["nameplateMaxDistance"] = "100",
				["nameplateShowFriendlyMinions"] = "0",
				["nameplateShowFriends"] = "0",
				["NamePlateHorizontalScale"] = "1",
				["ShowNamePlateLoseAggroFlash"] = "0",
				["nameplateShowFriendlyGuardians"] = "0",
				["nameplateTargetBehindMaxDistance"] = "30",
				["nameplatePersonalHideDelaySeconds"] = "0.2",
				["nameplateShowEnemies"] = "1",
				["nameplateMinAlphaDistance"] = "-158489.31924611",
				["NamePlateVerticalScale"] = "1",
			},
			["login_counter"] = 5365,
			["extra_icon_caster_name"] = false,
			["click_space_friendly"] = {
				nil, -- [1]
				18, -- [2]
			},
			["bossmod_aura_height"] = 30,
			["aura_stack_font"] = "Expressway",
			["hide_friendly_castbars"] = true,
			["OptionsPanelDB"] = {
				["PlaterOptionsPanelFrame"] = {
					["scale"] = 1,
				},
			},
			["auras_per_row_amount"] = 6,
			["target_highlight_texture"] = "Interface\\AddOns\\Plater\\images\\selection_indicator2",
			["plate_config"] = {
				["player"] = {
					["spellpercent_text_font"] = "Expressway",
					["power_percent_text_font"] = "Expressway",
					["spellname_text_font"] = "Expressway",
					["percent_text_font"] = "Expressway",
				},
				["friendlyplayer"] = {
					["spellpercent_text_font"] = "Expressway",
					["actorname_use_class_color"] = true,
					["cast"] = {
						140, -- [1]
						12, -- [2]
					},
					["spellname_text_outline"] = "OUTLINE",
					["level_text_font"] = "Expressway",
					["actorname_text_font"] = "Expressway",
					["actorname_use_guild_color"] = false,
					["cast_incombat"] = {
						140, -- [1]
					},
					["spellname_text_font"] = "Expressway",
					["level_text_outline"] = "OUTLINE",
					["percent_text_font"] = "Expressway",
					["health_incombat"] = {
						140, -- [1]
						16, -- [2]
					},
					["health"] = {
						140, -- [1]
						16, -- [2]
					},
				},
				["friendlynpc"] = {
					["spellpercent_text_font"] = "Expressway",
					["cast"] = {
						140, -- [1]
						12, -- [2]
					},
					["big_actortitle_text_size"] = 9,
					["spellname_text_outline"] = "OUTLINE",
					["level_text_font"] = "Expressway",
					["actorname_text_font"] = "Expressway",
					["all_names"] = false,
					["actorname_text_outline"] = "OUTLINE",
					["big_actortitle_text_font"] = "Expressway",
					["cast_incombat"] = {
						140, -- [1]
					},
					["relevance_state"] = 3,
					["spellname_text_font"] = "Expressway",
					["big_actorname_text_font"] = "Expressway",
					["level_text_outline"] = "OUTLINE",
					["percent_text_font"] = "Expressway",
					["health_incombat"] = {
						140, -- [1]
					},
					["health"] = {
						140, -- [1]
						16, -- [2]
					},
				},
				["global_health_height"] = 16,
				["global_health_width"] = 140,
				["enemyplayer"] = {
					["big_actorname_text_size"] = 10,
					["spellpercent_text_font"] = "Expressway",
					["level_text_size"] = 8,
					["cast"] = {
						140, -- [1]
						12, -- [2]
					},
					["spellpercent_text_anchor"] = {
						["y"] = 0.29999542236328,
						["x"] = -1,
					},
					["spellname_text_outline"] = "OUTLINE",
					["level_text_font"] = "Expressway",
					["actorname_text_font"] = "Expressway",
					["all_names"] = true,
					["actorname_text_outline"] = "OUTLINE",
					["actorname_text_spacing"] = 8,
					["quest_color_enemy"] = {
						1, -- [1]
						0.369, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["big_actortitle_text_font"] = "Expressway",
					["spellpercent_text_size"] = 9,
					["cast_incombat"] = {
						140, -- [1]
					},
					["spellname_text_anchor"] = {
						["y"] = 0.29999542236328,
						["x"] = 1.5,
						["side"] = 10,
					},
					["percent_text_anchor"] = {
						["y"] = 0.5,
						["side"] = 11,
					},
					["spellname_text_font"] = "Expressway",
					["quest_color_neutral"] = {
						1, -- [1]
						0.65, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["actorname_text_size"] = 9,
					["big_actorname_text_font"] = "Expressway",
					["level_text_outline"] = "OUTLINE",
					["big_actortitle_text_size"] = 10,
					["percent_show_health"] = false,
					["percent_text_font"] = "Expressway",
					["quest_enabled"] = true,
					["quest_color_enabled"] = true,
					["spellname_text_size"] = 9,
					["health"] = {
						140, -- [1]
						16, -- [2]
					},
					["actorname_text_anchor"] = {
						["y"] = 0.29999542236328,
						["x"] = 1,
						["side"] = 10,
					},
					["health_incombat"] = {
						140, -- [1]
					},
					["level_text_enabled"] = false,
				},
				["enemynpc"] = {
					["spellpercent_text_font"] = "Expressway",
					["cast"] = {
						140, -- [1]
						12, -- [2]
					},
					["spellpercent_text_anchor"] = {
						["y"] = 0.29999542236328,
						["x"] = -1,
					},
					["level_text_font"] = "Expressway",
					["actorname_text_font"] = "Expressway",
					["actorname_text_outline"] = "OUTLINE",
					["actorname_text_spacing"] = 8,
					["big_actortitle_text_font"] = "Expressway",
					["spellpercent_text_size"] = 9,
					["cast_incombat"] = {
						140, -- [1]
						12, -- [2]
					},
					["spellname_text_anchor"] = {
						["y"] = 0.29999542236328,
						["x"] = 1,
						["side"] = 10,
					},
					["percent_text_anchor"] = {
						["y"] = 0.5,
						["side"] = 11,
					},
					["spellname_text_font"] = "Expressway",
					["big_actorname_text_font"] = "Expressway",
					["level_text_outline"] = "OUTLINE",
					["actorname_text_anchor"] = {
						["y"] = 0.29999542236328,
						["x"] = 1,
						["side"] = 10,
					},
					["percent_text_font"] = "Expressway",
					["health_incombat"] = {
						140, -- [1]
					},
					["health"] = {
						140, -- [1]
						16, -- [2]
					},
					["actorname_text_size"] = 9,
					["percent_show_health"] = false,
					["spellname_text_size"] = 9,
					["level_text_enabled"] = false,
				},
			},
			["aura_y_offset"] = 2,
			["cast_statusbar_bgcolor"] = {
				0.058823529411765, -- [1]
				0.058823529411765, -- [2]
				0.058823529411765, -- [3]
				0.80000001192093, -- [4]
			},
			["bossmod_aura_width"] = 30,
			["indicator_scale"] = 0.9999999403953552,
			["castbar_icon_size"] = "same as castbar plus healthbar",
			["hook_data"] = {
				{
					["Enabled"] = true,
					["Revision"] = 97,
					["OptionsValues"] = {
					},
					["HooksTemp"] = {
						["Nameplate Updated"] = "function(self, unitId, unitFrame, envTable)\n    \n    local unitName = UnitName(unitId)\n    \n    -- Show First Name [Whitelist table]\n    local firstName = {\n        [3527] = true, -- Healing Stream Totem\n        [2630] = true, -- Earthbind Totem\n        [61245] = true, -- Capacitor Totem\n        [5925] = true, -- Grounding Totem\n        [105451] = true, -- Counterstrike Totem\n        [105427] = true, -- Skyfury Totem\n        [97369] = true, -- Liquid Magma Totem\n    }\n    \n    -- Show Full Name [Whitelist table]\n    local fullName = {}\n    \n    if (unitName) then\n        local a , b, c, d, e, f = strsplit(' ', unitName, 5)\n        \n        if firstName [unitFrame.namePlateNpcId] then\n            unitFrame.healthBar.unitName:SetText(a)\n        elseif fullName[unitFrame.namePlateNpcId] then\n            unitFrame.healthBar.unitName:SetText(unitName)\n        else\n            unitFrame.healthBar.unitName:SetText(f or e or d or c or b or a)\n        end\n    end\nend",
					},
					["Author"] = "Luckyone-Laughing Skull",
					["Options"] = {
					},
					["Desc"] = "",
					["Hooks"] = {
						["Nameplate Updated"] = "function(self, unitId, unitFrame, envTable)\n    \n    local unitName = UnitName(unitId)\n    \n    -- Show First Name [Whitelist table]\n    local firstName = {\n        [3527] = true, -- Healing Stream Totem\n        [2630] = true, -- Earthbind Totem\n        [61245] = true, -- Capacitor Totem\n        [5925] = true, -- Grounding Totem\n        [105451] = true, -- Counterstrike Totem\n        [105427] = true, -- Skyfury Totem\n        [97369] = true, -- Liquid Magma Totem\n    }\n    \n    -- Show Full Name [Whitelist table]\n    local fullName = {}\n    \n    if (unitName) then\n        local a , b, c, d, e, f = strsplit(' ', unitName, 5)\n        \n        if firstName [unitFrame.namePlateNpcId] then\n            unitFrame.healthBar.unitName:SetText(a)\n        elseif fullName[unitFrame.namePlateNpcId] then\n            unitFrame.healthBar.unitName:SetText(unitName)\n        else\n            unitFrame.healthBar.unitName:SetText(f or e or d or c or b or a)\n        end\n    end\nend",
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
					["LastHookEdited"] = "Nameplate Updated",
					["Time"] = 1659383332,
					["Icon"] = 4067922,
					["PlaterCore"] = 1,
				}, -- [1]
				{
					["Enabled"] = true,
					["Revision"] = 50,
					["OptionsValues"] = {
					},
					["HooksTemp"] = {
						["Nameplate Removed"] = "function(self, unitId, unitFrame, envTable)\n    envTable.UpdateBorder(unitFrame, false)\nend",
						["Cast Update"] = "function(self, unitId, unitFrame, envTable)\n    envTable.UpdateIconPosition(unitFrame)\nend",
						["Cast Start"] = "function(self, unitId, unitFrame, envTable)\n    envTable.UpdateIconPosition(unitFrame)\n    envTable.UpdateBorder(unitFrame, true)\nend",
						["Constructor"] = "function(self, unitId, unitFrame, envTable)\n    \n    envTable.ShowIcon = Plater.db.profile.castbar_icon_show\n    envTable.IconAnchor = \"left\"\n    envTable.IconSizeOffset = 0\n    \n    envTable.ShowShield = false\n    envTable.ShieldTexture = [[Interface\\GROUPFRAME\\UI-GROUP-MAINTANKICON]]\n    envTable.ShieldDesaturated = true\n    envTable.ShieldColor = {1, 1, 1 ,1}\n    envTable.ShieldSize = {10, 12}\n    \n    function envTable.UpdateIconPosition (unitFrame)\n        local castBar = unitFrame.castBar\n        local icon = castBar.Icon\n        local shield = castBar.BorderShield\n        \n        if (envTable.ShowIcon) then\n            icon:ClearAllPoints()\n            \n            if (envTable.IconAnchor == \"left\") then\n                icon:SetPoint (\"topright\", unitFrame.healthBar, \"topleft\", 0, envTable.IconSizeOffset)\n                icon:SetPoint (\"bottomright\", unitFrame.castBar, \"bottomleft\", 0, 0)    \n                \n            elseif (envTable.IconAnchor == \"right\") then\n                icon:SetPoint (\"topleft\", unitFrame.healthBar, \"topright\", 0, envTable.IconSizeOffset)\n                icon:SetPoint (\"bottomleft\", unitFrame.castBar, \"bottomright\", 0, 0)\n                \n            end\n            \n            icon:SetWidth (icon:GetHeight())\n            icon:Show()\n            \n        else\n            icon:Hide()\n            \n        end\n        \n        if (envTable.ShowShield and not castBar.canInterrupt) then\n            shield:Show()\n            shield:SetAlpha (1)\n            shield:SetTexCoord (0, 1, 0, 1)\n            shield:SetVertexColor (1, 1, 1, 1)\n            \n            shield:SetTexture (envTable.ShieldTexture)\n            shield:SetDesaturated (envTable.ShieldDesaturated)\n            \n            if (not envTable.ShieldDesaturated) then\n                shield:SetVertexColor (DetailsFramework:ParseColors (envTable.ShieldColor))\n            end\n            \n            shield:SetSize (unpack (envTable.ShieldSize))\n            \n            shield:ClearAllPoints()\n            shield:SetPoint (\"center\", castBar, \"left\", 0, 0)\n        else\n            shield:Hide()\n        end\n    end\n    \n    function envTable.UpdateBorder (unitFrame, casting)\n        local healthBar = unitFrame.healthBar\n        local castBar = unitFrame.castBar\n        if casting then\n            if envTable.ShowIcon and castBar.Icon:IsShown() then\n                if envTable.IconAnchor == \"left\" then\n                    healthBar.border:SetPoint(\"TOPLEFT\", castBar.Icon, \"TOPLEFT\", 0, 0)\n                    healthBar.border:SetPoint(\"BOTTOMRIGHT\", castBar, \"BOTTOMRIGHT\", 0, 0)\n                elseif envTable.IconAnchor == \"right\" then\n                    healthBar.border:SetPoint(\"TOPRIGHT\", castBar.Icon, \"TOPRIGHT\", 0, 0)\n                    healthBar.border:SetPoint(\"BOTTOMLEFT\", castBar, \"BOTTOMLEFT\", 0, 0) \n                end\n            else\n                if envTable.IconAnchor == \"left\" then\n                    healthBar.border:SetPoint(\"TOPLEFT\", healthBar, \"TOPLEFT\", 0, 0)\n                    healthBar.border:SetPoint(\"BOTTOMRIGHT\", castBar, \"BOTTOMRIGHT\", 0, 0)\n                elseif envTable.IconAnchor == \"right\" then\n                    healthBar.border:SetPoint(\"TOPRIGHT\", healthBar, \"TOPRIGHT\", 0, 0)\n                    healthBar.border:SetPoint(\"BOTTOMLEFT\", castBar, \"BOTTOMLEFT\", 0, 0) \n                end\n            end\n        else\n            if envTable.IconAnchor == \"left\" then\n                healthBar.border:SetPoint(\"TOPLEFT\", healthBar, \"TOPLEFT\", 0, 0)\n                healthBar.border:SetPoint(\"BOTTOMRIGHT\", healthBar, \"BOTTOMRIGHT\", 0, 0)\n            elseif envTable.IconAnchor == \"right\" then\n                healthBar.border:SetPoint(\"TOPRIGHT\", healthBar, \"TOPRIGHT\", 0, 0)\n                healthBar.border:SetPoint(\"BOTTOMLEFT\", healthBar, \"BOTTOMLEFT\", 0, 0) \n            end\n        end\n    end\n    if not unitFrame.castBar.borderChangeHooked then\n        hooksecurefunc(unitFrame.castBar, \"Hide\", function() envTable.UpdateBorder(unitFrame, false) end)\n        unitFrame.castBar.borderChangeHooked = true\n    end\nend",
					},
					["Author"] = "Luckyone-Laughing Skull",
					["Options"] = {
					},
					["Desc"] = "",
					["Hooks"] = {
						["Nameplate Removed"] = "function(self, unitId, unitFrame, envTable)\n    envTable.UpdateBorder(unitFrame, false)\nend",
						["Cast Start"] = "function(self, unitId, unitFrame, envTable)\n    envTable.UpdateIconPosition(unitFrame)\n    envTable.UpdateBorder(unitFrame, true)\nend",
						["Cast Update"] = "function(self, unitId, unitFrame, envTable)\n    envTable.UpdateIconPosition(unitFrame)\nend",
						["Constructor"] = "function(self, unitId, unitFrame, envTable)\n    \n    envTable.ShowIcon = Plater.db.profile.castbar_icon_show\n    envTable.IconAnchor = \"left\"\n    envTable.IconSizeOffset = 0\n    \n    envTable.ShowShield = false\n    envTable.ShieldTexture = [[Interface\\GROUPFRAME\\UI-GROUP-MAINTANKICON]]\n    envTable.ShieldDesaturated = true\n    envTable.ShieldColor = {1, 1, 1 ,1}\n    envTable.ShieldSize = {10, 12}\n    \n    function envTable.UpdateIconPosition (unitFrame)\n        local castBar = unitFrame.castBar\n        local icon = castBar.Icon\n        local shield = castBar.BorderShield\n        \n        if (envTable.ShowIcon) then\n            icon:ClearAllPoints()\n            \n            if (envTable.IconAnchor == \"left\") then\n                icon:SetPoint (\"topright\", unitFrame.healthBar, \"topleft\", 0, envTable.IconSizeOffset)\n                icon:SetPoint (\"bottomright\", unitFrame.castBar, \"bottomleft\", 0, 0)    \n                \n            elseif (envTable.IconAnchor == \"right\") then\n                icon:SetPoint (\"topleft\", unitFrame.healthBar, \"topright\", 0, envTable.IconSizeOffset)\n                icon:SetPoint (\"bottomleft\", unitFrame.castBar, \"bottomright\", 0, 0)\n                \n            end\n            \n            icon:SetWidth (icon:GetHeight())\n            icon:Show()\n            \n        else\n            icon:Hide()\n            \n        end\n        \n        if (envTable.ShowShield and not castBar.canInterrupt) then\n            shield:Show()\n            shield:SetAlpha (1)\n            shield:SetTexCoord (0, 1, 0, 1)\n            shield:SetVertexColor (1, 1, 1, 1)\n            \n            shield:SetTexture (envTable.ShieldTexture)\n            shield:SetDesaturated (envTable.ShieldDesaturated)\n            \n            if (not envTable.ShieldDesaturated) then\n                shield:SetVertexColor (DetailsFramework:ParseColors (envTable.ShieldColor))\n            end\n            \n            shield:SetSize (unpack (envTable.ShieldSize))\n            \n            shield:ClearAllPoints()\n            shield:SetPoint (\"center\", castBar, \"left\", 0, 0)\n        else\n            shield:Hide()\n        end\n    end\n    \n    function envTable.UpdateBorder (unitFrame, casting)\n        local healthBar = unitFrame.healthBar\n        local castBar = unitFrame.castBar\n        if casting then\n            if envTable.ShowIcon and castBar.Icon:IsShown() then\n                if envTable.IconAnchor == \"left\" then\n                    healthBar.border:SetPoint(\"TOPLEFT\", castBar.Icon, \"TOPLEFT\", 0, 0)\n                    healthBar.border:SetPoint(\"BOTTOMRIGHT\", castBar, \"BOTTOMRIGHT\", 0, 0)\n                elseif envTable.IconAnchor == \"right\" then\n                    healthBar.border:SetPoint(\"TOPRIGHT\", castBar.Icon, \"TOPRIGHT\", 0, 0)\n                    healthBar.border:SetPoint(\"BOTTOMLEFT\", castBar, \"BOTTOMLEFT\", 0, 0) \n                end\n            else\n                if envTable.IconAnchor == \"left\" then\n                    healthBar.border:SetPoint(\"TOPLEFT\", healthBar, \"TOPLEFT\", 0, 0)\n                    healthBar.border:SetPoint(\"BOTTOMRIGHT\", castBar, \"BOTTOMRIGHT\", 0, 0)\n                elseif envTable.IconAnchor == \"right\" then\n                    healthBar.border:SetPoint(\"TOPRIGHT\", healthBar, \"TOPRIGHT\", 0, 0)\n                    healthBar.border:SetPoint(\"BOTTOMLEFT\", castBar, \"BOTTOMLEFT\", 0, 0) \n                end\n            end\n        else\n            if envTable.IconAnchor == \"left\" then\n                healthBar.border:SetPoint(\"TOPLEFT\", healthBar, \"TOPLEFT\", 0, 0)\n                healthBar.border:SetPoint(\"BOTTOMRIGHT\", healthBar, \"BOTTOMRIGHT\", 0, 0)\n            elseif envTable.IconAnchor == \"right\" then\n                healthBar.border:SetPoint(\"TOPRIGHT\", healthBar, \"TOPRIGHT\", 0, 0)\n                healthBar.border:SetPoint(\"BOTTOMLEFT\", healthBar, \"BOTTOMLEFT\", 0, 0) \n            end\n        end\n    end\n    if not unitFrame.castBar.borderChangeHooked then\n        hooksecurefunc(unitFrame.castBar, \"Hide\", function() envTable.UpdateBorder(unitFrame, false) end)\n        unitFrame.castBar.borderChangeHooked = true\n    end\nend",
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
					["Time"] = 1659383335,
					["Icon"] = 4067925,
					["PlaterCore"] = 1,
				}, -- [2]
				{
					["OptionsValues"] = {
					},
					["HooksTemp"] = {
						["Initialization"] = "function(modTable)\n    local default = \"#00fbff\"\n    local affix = \"#C69B6D\"\n    \n    modTable.NpcColors = {\n        -- Grimrail Depot [DEPOT]\n        [81236] = default, -- Grimrail Technician\n        [81407] = default, -- Grimrail Bombardier\n        [80937] = default, -- Grom'kar Gunner\n        [88163] = default, -- Grom'kar Cinderseer\n        [82597] = default, -- Grom'kar Captain\n        -- Iron Docks [DOCKS]\n        [81603] = default, -- Champion Druna\n        [83025] = default, -- Grom'kar Battlemaster\n        [86526] = default, -- Grom'kar Chainmaster\n        [83026] = default, -- Siegemaster Olugar\n        [84028] = default, -- Siegemaster Rokra\n        -- Karazhan Lower [LOWER]\n        [114584] = default, -- Phantom Crew\n        [114628] = default, -- Skele] = default, \n        [114802] = default, -- Spectral Journeyman\n        -- Karazhan Upper [UPPER]\n        [114338] = default, -- Mana Confluence\n        [114249] = default, -- Volatile Energy\n        [115757] = default, -- Wrathguard Flamebringer\n        [115418] = default, -- Spider\n        [115488] = default, -- Infused Pyromancer\n        -- Mechagon Workshop [WORK]\n        [144293] = default, -- Waste Processing Unit\n        [144294] = default, -- Mechagon Tinkerer\n        [151325] = default, -- Alarm o Bot\n        [151657] = default, -- Bomb Tonk\n        -- Mechagon Junkyard [YARD]\n        [150146] = default, -- Scrapbone Shaman\n        [150160] = default, -- Scrapbone Bully\n        [150168] = default, -- Toxic Monstrosity\n        [150250] = default, -- Pistonhead Blaster\n        [150251] = default, -- Pistonhead Mechanic\n        [150292] = default, -- Mechagon Cavalry\n        [150297] = default, -- Mechagon Renormalizer\n        -- Tazavesh [TZ]\n        [178141] = default, -- Murkbrine Scalebinder\n        [179733] = default, -- Invigorating Fish Stick\n        [180431] = default, -- Focused Ritualist\n        [180433] = default, -- Wandering Pulsar\n    }\n    function modTable.UpdateColor(unitFrame, envTable)\n        if not unitFrame or unitFrame.IsNpcWithoutHealthbar or unitFrame.IsFriendlyPlayerWithoutHealthbar then return end\n        -- Get color from modTable.NpcColors\n        local color = modTable.NpcColors [unitFrame.namePlateNpcId]\n        -- Set color from modTable.NpcColors\n        if (color) then\n            Plater.SetNameplateColor(unitFrame, color)\n        end\n    end\nend",
						["Nameplate Updated"] = "function (self, unitId, unitFrame, envTable, modTable)\n    modTable.UpdateColor (unitFrame, envTable)\nend",
					},
					["UID"] = "0x622bc8122a7529d",
					["Hooks"] = {
						["Initialization"] = "function(modTable)\n    local default = \"#00fbff\"\n    local affix = \"#C69B6D\"\n    \n    modTable.NpcColors = {\n        -- Grimrail Depot [DEPOT]\n        [81236] = default, -- Grimrail Technician\n        [81407] = default, -- Grimrail Bombardier\n        [80937] = default, -- Grom'kar Gunner\n        [88163] = default, -- Grom'kar Cinderseer\n        [82597] = default, -- Grom'kar Captain\n        -- Iron Docks [DOCKS]\n        [81603] = default, -- Champion Druna\n        [83025] = default, -- Grom'kar Battlemaster\n        [86526] = default, -- Grom'kar Chainmaster\n        [83026] = default, -- Siegemaster Olugar\n        [84028] = default, -- Siegemaster Rokra\n        -- Karazhan Lower [LOWER]\n        [114584] = default, -- Phantom Crew\n        [114628] = default, -- Skele] = default, \n        [114802] = default, -- Spectral Journeyman\n        -- Karazhan Upper [UPPER]\n        [114338] = default, -- Mana Confluence\n        [114249] = default, -- Volatile Energy\n        [115757] = default, -- Wrathguard Flamebringer\n        [115418] = default, -- Spider\n        [115488] = default, -- Infused Pyromancer\n        -- Mechagon Workshop [WORK]\n        [144293] = default, -- Waste Processing Unit\n        [144294] = default, -- Mechagon Tinkerer\n        [151325] = default, -- Alarm o Bot\n        [151657] = default, -- Bomb Tonk\n        -- Mechagon Junkyard [YARD]\n        [150146] = default, -- Scrapbone Shaman\n        [150160] = default, -- Scrapbone Bully\n        [150168] = default, -- Toxic Monstrosity\n        [150250] = default, -- Pistonhead Blaster\n        [150251] = default, -- Pistonhead Mechanic\n        [150292] = default, -- Mechagon Cavalry\n        [150297] = default, -- Mechagon Renormalizer\n        -- Tazavesh [TZ]\n        [178141] = default, -- Murkbrine Scalebinder\n        [179733] = default, -- Invigorating Fish Stick\n        [180431] = default, -- Focused Ritualist\n        [180433] = default, -- Wandering Pulsar\n    }\n    function modTable.UpdateColor(unitFrame, envTable)\n        if not unitFrame or unitFrame.IsNpcWithoutHealthbar or unitFrame.IsFriendlyPlayerWithoutHealthbar then return end\n        -- Get color from modTable.NpcColors\n        local color = modTable.NpcColors [unitFrame.namePlateNpcId]\n        -- Set color from modTable.NpcColors\n        if (color) then\n            Plater.SetNameplateColor(unitFrame, color)\n        end\n    end\nend",
						["Nameplate Updated"] = "function (self, unitId, unitFrame, envTable, modTable)\n    modTable.UpdateColor (unitFrame, envTable)\nend",
					},
					["Time"] = 1659383332,
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
					["Icon"] = 4067928,
					["Enabled"] = true,
					["Revision"] = 35,
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
			["extra_icon_caster_outline"] = "OUTLINE",
			["auras_per_row_amount2"] = 6,
			["aura_width"] = 16,
			["health_statusbar_bgcolor"] = {
				0.058823529411765, -- [1]
				0.058823529411765, -- [2]
				0.058823529411765, -- [3]
				0.80000001192093, -- [4]
			},
			["quick_hide"] = true,
			["target_highlight_color"] = {
				nil, -- [1]
				1, -- [2]
			},
			["extra_icon_stack_outline"] = "OUTLINE",
			["click_space"] = {
				nil, -- [1]
				18, -- [2]
			},
			["castbar_target_font"] = "Expressway",
			["cast_statusbar_spark_texture"] = "Interface\\AddOns\\Plater\\images\\spark8",
			["pet_height_scale"] = 0.9999999403953552,
			["aura_x_offset"] = 0,
			["script_data_trash"] = {},
			["ui_parent_scale_tune"] = 1.399999856948853,
			["health_statusbar_bgtexture"] = "Minimalist",
			["tank"] = {
				["colors"] = {
					["nocombat"] = {
						0.9176470588235294, -- [1]
						0.1254901960784314, -- [2]
						0.07058823529411765, -- [3]
					},
				},
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
				["buff"] = {
					343502, -- [1]
					209859, -- [2]
					178658, -- [3]
					226510, -- [4]
					322773, -- [5]
					333227, -- [6]
					344739, -- [7]
					327808, -- [8]
					317936, -- [9]
					327416, -- [10]
					321402, -- [11]
					322433, -- [12]
					330545, -- [13]
					326892, -- [14]
					333241, -- [15]
					331510, -- [16]
					343470, -- [17]
					343558, -- [18]
					321754, -- [19]
					333737, -- [20]
					336451, -- [21]
					336499, -- [22]
					326450, -- [23]
					347992, -- [24]
					355782, -- [25]
					347840, -- [26]
					351086, -- [27]
					355783, -- [28]
					355640, -- [29]
					355057, -- [30]
					346296, -- [31]
					351088, -- [32]
					351960, -- [33]
					355147, -- [34]
				},
				["debuff"] = {
					335467, -- [1]
					164812, -- [2]
					155722, -- [3]
					1079, -- [4]
					589, -- [5]
					202347, -- [6]
					164815, -- [7]
					106830, -- [8]
					34914, -- [9]
					205644, -- [10]
					81261, -- [11]
					325733, -- [12]
				},
				["buff_banned"] = {
					["206150"] = true,
					["333553"] = true,
					["61574"] = true,
					["61573"] = true,
				},
			},
			["extra_icon_caster_font"] = "Expressway",
			["cast_statusbar_color"] = {
				0.023529411764706, -- [1]
				1, -- [2]
				nil, -- [3]
				0.96000000089407, -- [4]
			},
			["update_throttle"] = 0.099999994039536,
			["bossmod_cooldown_text_size"] = 15,
			["ghost_auras"] = {
				["auras"] = {
					["PRIEST"] = {
						[3] = {
							[589] = true,
							[34914] = true,
						},
					},
					["WARLOCK"] = {
						{
							[172] = true,
							[980] = true,
						}, -- [1]
					},
				},
			},
			["resources_settings"] = {
				["chr"] = {
					["Player-1598-0E1A06DE"] = "ComboPoints",
					["Player-1598-0E67511D"] = "HolyPower",
					["Player-1598-0BFABB95"] = "ArcaneCharges",
					["Player-1598-0BF18248"] = "Runes",
					["Player-1598-0C0DD01B"] = "SoulShards",
					["Player-1598-0BEFA545"] = "Chi",
					["Player-1598-0BD22701"] = "ComboPoints",
				},
			},
			["indicator_extra_raidmark"] = false,
			["extra_icon_timer_font"] = "Expressway",
			["aura_sort"] = true,
			["target_highlight_alpha"] = 1,
			["patch_version"] = 19,
			["indicator_elite"] = false,
			["target_highlight_height"] = 12,
			["target_shady_enabled"] = false,
			["version"] = 13,
			["health_selection_overlay"] = "Minimalist",
			["use_ui_parent"] = true,
			["cast_statusbar_use_fade_effects"] = false,
			["indicator_spec"] = false,
			["color_override_colors"] = {
				[3] = {
					0.9176470588235294, -- [1]
					0.1294117647058823, -- [2]
					0.07058823529411765, -- [3]
				},
			},
			["cast_statusbar_color_interrupted"] = {
				0.30196078431373, -- [1]
				0.30196078431373, -- [2]
				0.30196078431373, -- [3]
			},
			["range_check_in_range_or_target_alpha"] = 1,
			["aura_timer_text_size"] = 10,
			["number_region_first_run"] = true,
			["pet_width_scale"] = 0.9999999403953552,
			["castbar_target_anchor"] = {
				["x"] = 2,
				["side"] = 6,
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
			["cast_statusbar_texture"] = "Minimalist",
			["indicator_faction"] = false,
			["extra_icon_timer_outline"] = "OUTLINE",
			["extra_icon_height"] = 17,
			["first_run3"] = true,
			["aura_show_enrage"] = true,
			["aura_timer_text_font"] = "Expressway",
			["indicator_raidmark_scale"] = 0.8499999642372131,
		}

		-- Profile key
		PlaterDB["profileKeys"][E.mynameRealm] = name

	elseif E.TBC then

		-- Create profile if it doesn't exist yet
		PlaterDB["profiles"][name] = PlaterDB["profiles"][name] or {}

		-- Profile db
		PlaterDB["profiles"][name] = {
			["script_data"] = {},
			["target_shady_enabled"] = false,
			["aura2_y_offset"] = 5,
			["cast_statusbar_color_nointerrupt"] = {
				1, -- [1]
				0, -- [2]
				0.007843137254902, -- [3]
				0.96000000089407, -- [4]
			},
			["indicator_worldboss"] = false,
			["aura_width2"] = 16,
			["aura_show_crowdcontrol"] = true,
			["extra_icon_timer_outline"] = "OUTLINE",
			["extra_icon_anchor"] = {
				["x"] = -3,
			},
			["extra_icon_wide_icon"] = false,
			["range_check_alpha"] = 1,
			["semver"] = "3.2.0",
			["use_name_translit"] = true,
			["extra_icon_show_purge"] = true,
			["spell_animations"] = false,
			["aura_consolidate"] = true,
			["extra_icon_width"] = 26,
			["health_statusbar_texture"] = "Minimalist",
			["hook_auto_imported"] = {
				["Reorder Nameplate"] = 4,
				["Dont Have Aura"] = 1,
				["Players Targetting Amount"] = 4,
				["Color Automation"] = 1,
				["Extra Border"] = 2,
				["Cast Bar Icon Config"] = 2,
				["Attacking Specific Unit"] = 2,
				["Combo Points"] = 6,
				["Hide Neutral Units"] = 1,
				["Target Color"] = 3,
				["Execute Range"] = 1,
				["Aura Reorder"] = 3,
			},
			["aura_frame1_anchor"] = {
				["y"] = 2,
			},
			["indicator_rare"] = false,
			["extra_icon_stack_font"] = "Expressway",
			["cast_statusbar_bgtexture"] = "Minimalist",
			["aura2_x_offset"] = 0,
			["target_indicator"] = "NONE",
			["aura_show_buff_by_the_unit"] = false,
			["saved_cvars"] = {
				["ShowClassColorInNameplate"] = "1",
				["nameplateOverlapV"] = "1.7",
				["nameplateLargeTopInset"] = "-1",
				["nameplateShowEnemyMinus"] = "1",
				["nameplateMotionSpeed"] = "0.05",
				["NamePlateClassificationScale"] = "1",
				["nameplateShowFriendlyTotems"] = "0",
				["nameplateShowEnemyMinions"] = "1",
				["nameplateShowFriendlyPets"] = "0",
				["nameplateShowFriendlyNPCs"] = "1",
				["nameplateSelectedScale"] = "1",
				["nameplateTargetRadialPosition"] = "0",
				["nameplateResourceOnTarget"] = "0",
				["nameplateSelectedAlpha"] = "1",
				["nameplateMinScale"] = "1",
				["nameplateShowAll"] = "1",
				["nameplateMaxDistance"] = "100",
				["nameplateShowFriendlyMinions"] = "0",
				["nameplatePersonalHideDelaySeconds"] = "0.2",
				["ShowNamePlateLoseAggroFlash"] = "1",
				["nameplateTargetBehindMaxDistance"] = "30",
				["nameplateShowFriendlyGuardians"] = "0",
				["NamePlateHorizontalScale"] = "1",
				["nameplateShowFriends"] = "0",
				["nameplateShowEnemies"] = "1",
				["nameplateOtherTopInset"] = "-1",
				["NamePlateVerticalScale"] = "1",
			},
			["login_counter"] = 2028,
			["extra_icon_caster_name"] = false,
			["click_space_friendly"] = {
				148, -- [1]
			},
			["bossmod_aura_height"] = 30,
			["aura_stack_font"] = "Expressway",
			["hide_friendly_castbars"] = true,
			["OptionsPanelDB"] = {
				["PlaterOptionsPanelFrame"] = {
					["scale"] = 1,
				},
			},
			["auras_per_row_amount"] = 6,
			["target_highlight_texture"] = "Interface\\AddOns\\Plater\\images\\selection_indicator2",
			["plate_config"] = {
				["player"] = {
					["spellpercent_text_font"] = "Expressway",
					["power_percent_text_font"] = "Expressway",
					["spellname_text_font"] = "Expressway",
					["percent_text_font"] = "Expressway",
				},
				["friendlyplayer"] = {
					["spellpercent_text_font"] = "Expressway",
					["actorname_use_class_color"] = true,
					["cast"] = {
						140, -- [1]
						12, -- [2]
					},
					["spellname_text_outline"] = "OUTLINE",
					["level_text_font"] = "Expressway",
					["actorname_text_font"] = "Expressway",
					["actorname_use_guild_color"] = false,
					["cast_incombat"] = {
						140, -- [1]
					},
					["spellname_text_font"] = "Expressway",
					["level_text_outline"] = "OUTLINE",
					["percent_text_font"] = "Expressway",
					["health_incombat"] = {
						140, -- [1]
						16, -- [2]
					},
					["health"] = {
						140, -- [1]
						16, -- [2]
					},
				},
				["friendlynpc"] = {
					["spellpercent_text_font"] = "Expressway",
					["cast"] = {
						140, -- [1]
						12, -- [2]
					},
					["big_actortitle_text_size"] = 9,
					["spellname_text_outline"] = "OUTLINE",
					["level_text_font"] = "Expressway",
					["actorname_text_font"] = "Expressway",
					["all_names"] = false,
					["actorname_text_outline"] = "OUTLINE",
					["big_actortitle_text_font"] = "Expressway",
					["cast_incombat"] = {
						140, -- [1]
					},
					["health_incombat"] = {
						140, -- [1]
					},
					["spellname_text_font"] = "Expressway",
					["big_actorname_text_font"] = "Expressway",
					["level_text_outline"] = "OUTLINE",
					["percent_text_font"] = "Expressway",
					["relevance_state"] = 3,
					["health"] = {
						140, -- [1]
						16, -- [2]
					},
				},
				["enemynpc"] = {
					["spellpercent_text_font"] = "Expressway",
					["cast"] = {
						140, -- [1]
						12, -- [2]
					},
					["spellpercent_text_anchor"] = {
						["y"] = 0.29999542236328,
						["x"] = -1,
					},
					["level_text_font"] = "Expressway",
					["actorname_text_font"] = "Expressway",
					["actorname_text_outline"] = "OUTLINE",
					["actorname_text_spacing"] = 8,
					["big_actortitle_text_font"] = "Expressway",
					["spellpercent_text_size"] = 9,
					["cast_incombat"] = {
						140, -- [1]
						12, -- [2]
					},
					["spellname_text_anchor"] = {
						["y"] = 0.29999542236328,
						["x"] = 1,
						["side"] = 10,
					},
					["percent_text_anchor"] = {
						["y"] = 0.5,
						["side"] = 11,
					},
					["spellname_text_font"] = "Expressway",
					["big_actorname_text_font"] = "Expressway",
					["level_text_outline"] = "OUTLINE",
					["actorname_text_anchor"] = {
						["y"] = 0.29999542236328,
						["x"] = 1,
						["side"] = 10,
					},
					["percent_text_font"] = "Expressway",
					["spellname_text_size"] = 9,
					["health"] = {
						140, -- [1]
						16, -- [2]
					},
					["actorname_text_size"] = 9,
					["percent_show_health"] = false,
					["health_incombat"] = {
						140, -- [1]
					},
					["level_text_enabled"] = false,
				},
				["global_health_width"] = 140,
				["enemyplayer"] = {
					["big_actorname_text_size"] = 10,
					["spellpercent_text_font"] = "Expressway",
					["level_text_size"] = 8,
					["cast"] = {
						140, -- [1]
						12, -- [2]
					},
					["spellpercent_text_anchor"] = {
						["y"] = 0.29999542236328,
						["x"] = -1,
					},
					["spellname_text_outline"] = "OUTLINE",
					["level_text_font"] = "Expressway",
					["actorname_text_font"] = "Expressway",
					["all_names"] = true,
					["actorname_text_outline"] = "OUTLINE",
					["actorname_text_spacing"] = 8,
					["quest_color_enemy"] = {
						1, -- [1]
						0.369, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["big_actortitle_text_font"] = "Expressway",
					["spellpercent_text_size"] = 9,
					["cast_incombat"] = {
						140, -- [1]
					},
					["spellname_text_anchor"] = {
						["y"] = 0.29999542236328,
						["x"] = 1.5,
						["side"] = 10,
					},
					["percent_text_anchor"] = {
						["y"] = 0.5,
						["side"] = 11,
					},
					["spellname_text_font"] = "Expressway",
					["quest_color_neutral"] = {
						1, -- [1]
						0.65, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["actorname_text_size"] = 9,
					["big_actorname_text_font"] = "Expressway",
					["level_text_outline"] = "OUTLINE",
					["big_actortitle_text_size"] = 10,
					["actorname_text_anchor"] = {
						["y"] = 0.29999542236328,
						["x"] = 1,
						["side"] = 10,
					},
					["percent_text_font"] = "Expressway",
					["quest_enabled"] = true,
					["quest_color_enabled"] = true,
					["health_incombat"] = {
						140, -- [1]
					},
					["health"] = {
						140, -- [1]
						16, -- [2]
					},
					["percent_show_health"] = false,
					["spellname_text_size"] = 9,
					["level_text_enabled"] = false,
				},
				["global_health_height"] = 16,
			},
			["aura_y_offset"] = 2,
			["cast_statusbar_bgcolor"] = {
				0.058823529411765, -- [1]
				0.058823529411765, -- [2]
				0.058823529411765, -- [3]
				0.80000001192093, -- [4]
			},
			["bossmod_aura_width"] = 30,
			["resources_settings"] = {
				["chr"] = {
					["Player-1598-0BD22701"] = "ComboPoints",
					["Player-4465-02F8C200"] = "ComboPoints",
				},
			},
			["indicator_scale"] = 1.1000000238419,
			["castbar_icon_size"] = "same as castbar plus healthbar",
			["hook_data"] = {
				{
					["Enabled"] = true,
					["Revision"] = 93,
					["Options"] = {
					},
					["LastHookEdited"] = "Nameplate Updated",
					["Author"] = "Luckyone-Laughing Skull",
					["OptionsValues"] = {
					},
					["Desc"] = "",
					["Hooks"] = {
						["Nameplate Updated"] = "function(self, unitId, unitFrame, envTable)\n    \n    local unitName = UnitName(unitId)\n    \n    -- Show First Name [Whitelist table]\n    local firstName = {\n        [3527] = true, -- Healing Stream Totem\n        [2630] = true, -- Earthbind Totem\n        [61245] = true, -- Capacitor Totem\n        [5925] = true, -- Grounding Totem\n        [105451] = true, -- Counterstrike Totem\n        [105427] = true, -- Skyfury Totem\n        [97369] = true, -- Liquid Magma Totem\n    }\n    \n    -- Show Full Name [Whitelist table]\n    local fullName = {\n        [185685] = true, -- Urh Relic\n        [185680] = true, -- Vy Relic\n        [185683] = true, -- Wo Relic\n    }\n    \n    if (unitName) then\n        local a , b, c, d, e, f = strsplit(' ', unitName, 5)\n        \n        if firstName [unitFrame.namePlateNpcId] then\n            unitFrame.healthBar.unitName:SetText(a)\n        elseif fullName[unitFrame.namePlateNpcId] then\n            unitFrame.healthBar.unitName:SetText(unitName)\n        else\n            unitFrame.healthBar.unitName:SetText(f or e or d or c or b or a)\n        end\n    end\nend",
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
						["spec"] = {
						},
						["race"] = {
						},
						["encounter_ids"] = {
						},
						["affix"] = {
						},
					},
					["HooksTemp"] = {
						["Nameplate Updated"] = "function(self, unitId, unitFrame, envTable)\n    \n    local unitName = UnitName(unitId)\n    \n    -- Show First Name [Whitelist table]\n    local firstName = {\n        [3527] = true, -- Healing Stream Totem\n        [2630] = true, -- Earthbind Totem\n        [61245] = true, -- Capacitor Totem\n        [5925] = true, -- Grounding Totem\n        [105451] = true, -- Counterstrike Totem\n        [105427] = true, -- Skyfury Totem\n        [97369] = true, -- Liquid Magma Totem\n    }\n    \n    -- Show Full Name [Whitelist table]\n    local fullName = {\n        [185685] = true, -- Urh Relic\n        [185680] = true, -- Vy Relic\n        [185683] = true, -- Wo Relic\n    }\n    \n    if (unitName) then\n        local a , b, c, d, e, f = strsplit(' ', unitName, 5)\n        \n        if firstName [unitFrame.namePlateNpcId] then\n            unitFrame.healthBar.unitName:SetText(a)\n        elseif fullName[unitFrame.namePlateNpcId] then\n            unitFrame.healthBar.unitName:SetText(unitName)\n        else\n            unitFrame.healthBar.unitName:SetText(f or e or d or c or b or a)\n        end\n    end\nend",
					},
					["Time"] = 1659126832,
					["Icon"] = 136047,
					["PlaterCore"] = 1,
				}, -- [1]
				{
					["Enabled"] = true,
					["Revision"] = 45,
					["Options"] = {
					},
					["LastHookEdited"] = "Constructor",
					["Author"] = "Luckyone-Laughing Skull",
					["OptionsValues"] = {
					},
					["Desc"] = "",
					["Hooks"] = {
						["Nameplate Removed"] = "function(self, unitId, unitFrame, envTable)\n    envTable.UpdateBorder(unitFrame, false)\nend",
						["Cast Update"] = "function(self, unitId, unitFrame, envTable)\n    envTable.UpdateIconPosition(unitFrame)\nend",
						["Cast Start"] = "function(self, unitId, unitFrame, envTable)\n    envTable.UpdateIconPosition(unitFrame)\n    envTable.UpdateBorder(unitFrame, true)\nend",
						["Constructor"] = "function(self, unitId, unitFrame, envTable)\n    \n    envTable.ShowIcon = Plater.db.profile.castbar_icon_show\n    envTable.IconAnchor = \"left\"\n    envTable.IconSizeOffset = 0\n    \n    envTable.ShowShield = false\n    envTable.ShieldTexture = [[Interface\\GROUPFRAME\\UI-GROUP-MAINTANKICON]]\n    envTable.ShieldDesaturated = true\n    envTable.ShieldColor = {1, 1, 1 ,1}\n    envTable.ShieldSize = {10, 12}\n    \n    function envTable.UpdateIconPosition (unitFrame)\n        local castBar = unitFrame.castBar\n        local icon = castBar.Icon\n        local shield = castBar.BorderShield\n        \n        if (envTable.ShowIcon) then\n            icon:ClearAllPoints()\n            \n            if (envTable.IconAnchor == \"left\") then\n                icon:SetPoint (\"topright\", unitFrame.healthBar, \"topleft\", 0, envTable.IconSizeOffset)\n                icon:SetPoint (\"bottomright\", unitFrame.castBar, \"bottomleft\", 0, 0)    \n                \n            elseif (envTable.IconAnchor == \"right\") then\n                icon:SetPoint (\"topleft\", unitFrame.healthBar, \"topright\", 0, envTable.IconSizeOffset)\n                icon:SetPoint (\"bottomleft\", unitFrame.castBar, \"bottomright\", 0, 0)\n                \n            end\n            \n            icon:SetWidth (icon:GetHeight())\n            icon:Show()\n            \n        else\n            icon:Hide()\n            \n        end\n        \n        if (envTable.ShowShield and not castBar.canInterrupt) then\n            shield:Show()\n            shield:SetAlpha (1)\n            shield:SetTexCoord (0, 1, 0, 1)\n            shield:SetVertexColor (1, 1, 1, 1)\n            \n            shield:SetTexture (envTable.ShieldTexture)\n            shield:SetDesaturated (envTable.ShieldDesaturated)\n            \n            if (not envTable.ShieldDesaturated) then\n                shield:SetVertexColor (DetailsFramework:ParseColors (envTable.ShieldColor))\n            end\n            \n            shield:SetSize (unpack (envTable.ShieldSize))\n            \n            shield:ClearAllPoints()\n            shield:SetPoint (\"center\", castBar, \"left\", 0, 0)\n        else\n            shield:Hide()\n        end\n    end\n    \n    function envTable.UpdateBorder (unitFrame, casting)\n        local healthBar = unitFrame.healthBar\n        local castBar = unitFrame.castBar\n        if casting then\n            if envTable.ShowIcon and castBar.Icon:IsShown() then\n                if envTable.IconAnchor == \"left\" then\n                    healthBar.border:SetPoint(\"TOPLEFT\", castBar.Icon, \"TOPLEFT\", 0, 0)\n                    healthBar.border:SetPoint(\"BOTTOMRIGHT\", castBar, \"BOTTOMRIGHT\", 0, 0)\n                elseif envTable.IconAnchor == \"right\" then\n                    healthBar.border:SetPoint(\"TOPRIGHT\", castBar.Icon, \"TOPRIGHT\", 0, 0)\n                    healthBar.border:SetPoint(\"BOTTOMLEFT\", castBar, \"BOTTOMLEFT\", 0, 0) \n                end\n            else\n                if envTable.IconAnchor == \"left\" then\n                    healthBar.border:SetPoint(\"TOPLEFT\", healthBar, \"TOPLEFT\", 0, 0)\n                    healthBar.border:SetPoint(\"BOTTOMRIGHT\", castBar, \"BOTTOMRIGHT\", 0, 0)\n                elseif envTable.IconAnchor == \"right\" then\n                    healthBar.border:SetPoint(\"TOPRIGHT\", healthBar, \"TOPRIGHT\", 0, 0)\n                    healthBar.border:SetPoint(\"BOTTOMLEFT\", castBar, \"BOTTOMLEFT\", 0, 0) \n                end\n            end\n        else\n            if envTable.IconAnchor == \"left\" then\n                healthBar.border:SetPoint(\"TOPLEFT\", healthBar, \"TOPLEFT\", 0, 0)\n                healthBar.border:SetPoint(\"BOTTOMRIGHT\", healthBar, \"BOTTOMRIGHT\", 0, 0)\n            elseif envTable.IconAnchor == \"right\" then\n                healthBar.border:SetPoint(\"TOPRIGHT\", healthBar, \"TOPRIGHT\", 0, 0)\n                healthBar.border:SetPoint(\"BOTTOMLEFT\", healthBar, \"BOTTOMLEFT\", 0, 0) \n            end\n        end\n    end\n    if not unitFrame.castBar.borderChangeHooked then\n        hooksecurefunc(unitFrame.castBar, \"Hide\", function() envTable.UpdateBorder(unitFrame, false) end)\n        unitFrame.castBar.borderChangeHooked = true\n    end\nend",
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
						["spec"] = {
						},
						["race"] = {
						},
						["encounter_ids"] = {
						},
						["affix"] = {
						},
					},
					["HooksTemp"] = {
						["Nameplate Removed"] = "function(self, unitId, unitFrame, envTable)\n    envTable.UpdateBorder(unitFrame, false)\nend",
						["Cast Start"] = "function(self, unitId, unitFrame, envTable)\n    envTable.UpdateIconPosition(unitFrame)\n    envTable.UpdateBorder(unitFrame, true)\nend",
						["Cast Update"] = "function(self, unitId, unitFrame, envTable)\n    envTable.UpdateIconPosition(unitFrame)\nend",
						["Constructor"] = "function(self, unitId, unitFrame, envTable)\n    \n    envTable.ShowIcon = Plater.db.profile.castbar_icon_show\n    envTable.IconAnchor = \"left\"\n    envTable.IconSizeOffset = 0\n    \n    envTable.ShowShield = false\n    envTable.ShieldTexture = [[Interface\\GROUPFRAME\\UI-GROUP-MAINTANKICON]]\n    envTable.ShieldDesaturated = true\n    envTable.ShieldColor = {1, 1, 1 ,1}\n    envTable.ShieldSize = {10, 12}\n    \n    function envTable.UpdateIconPosition (unitFrame)\n        local castBar = unitFrame.castBar\n        local icon = castBar.Icon\n        local shield = castBar.BorderShield\n        \n        if (envTable.ShowIcon) then\n            icon:ClearAllPoints()\n            \n            if (envTable.IconAnchor == \"left\") then\n                icon:SetPoint (\"topright\", unitFrame.healthBar, \"topleft\", 0, envTable.IconSizeOffset)\n                icon:SetPoint (\"bottomright\", unitFrame.castBar, \"bottomleft\", 0, 0)    \n                \n            elseif (envTable.IconAnchor == \"right\") then\n                icon:SetPoint (\"topleft\", unitFrame.healthBar, \"topright\", 0, envTable.IconSizeOffset)\n                icon:SetPoint (\"bottomleft\", unitFrame.castBar, \"bottomright\", 0, 0)\n                \n            end\n            \n            icon:SetWidth (icon:GetHeight())\n            icon:Show()\n            \n        else\n            icon:Hide()\n            \n        end\n        \n        if (envTable.ShowShield and not castBar.canInterrupt) then\n            shield:Show()\n            shield:SetAlpha (1)\n            shield:SetTexCoord (0, 1, 0, 1)\n            shield:SetVertexColor (1, 1, 1, 1)\n            \n            shield:SetTexture (envTable.ShieldTexture)\n            shield:SetDesaturated (envTable.ShieldDesaturated)\n            \n            if (not envTable.ShieldDesaturated) then\n                shield:SetVertexColor (DetailsFramework:ParseColors (envTable.ShieldColor))\n            end\n            \n            shield:SetSize (unpack (envTable.ShieldSize))\n            \n            shield:ClearAllPoints()\n            shield:SetPoint (\"center\", castBar, \"left\", 0, 0)\n        else\n            shield:Hide()\n        end\n    end\n    \n    function envTable.UpdateBorder (unitFrame, casting)\n        local healthBar = unitFrame.healthBar\n        local castBar = unitFrame.castBar\n        if casting then\n            if envTable.ShowIcon and castBar.Icon:IsShown() then\n                if envTable.IconAnchor == \"left\" then\n                    healthBar.border:SetPoint(\"TOPLEFT\", castBar.Icon, \"TOPLEFT\", 0, 0)\n                    healthBar.border:SetPoint(\"BOTTOMRIGHT\", castBar, \"BOTTOMRIGHT\", 0, 0)\n                elseif envTable.IconAnchor == \"right\" then\n                    healthBar.border:SetPoint(\"TOPRIGHT\", castBar.Icon, \"TOPRIGHT\", 0, 0)\n                    healthBar.border:SetPoint(\"BOTTOMLEFT\", castBar, \"BOTTOMLEFT\", 0, 0) \n                end\n            else\n                if envTable.IconAnchor == \"left\" then\n                    healthBar.border:SetPoint(\"TOPLEFT\", healthBar, \"TOPLEFT\", 0, 0)\n                    healthBar.border:SetPoint(\"BOTTOMRIGHT\", castBar, \"BOTTOMRIGHT\", 0, 0)\n                elseif envTable.IconAnchor == \"right\" then\n                    healthBar.border:SetPoint(\"TOPRIGHT\", healthBar, \"TOPRIGHT\", 0, 0)\n                    healthBar.border:SetPoint(\"BOTTOMLEFT\", castBar, \"BOTTOMLEFT\", 0, 0) \n                end\n            end\n        else\n            if envTable.IconAnchor == \"left\" then\n                healthBar.border:SetPoint(\"TOPLEFT\", healthBar, \"TOPLEFT\", 0, 0)\n                healthBar.border:SetPoint(\"BOTTOMRIGHT\", healthBar, \"BOTTOMRIGHT\", 0, 0)\n            elseif envTable.IconAnchor == \"right\" then\n                healthBar.border:SetPoint(\"TOPRIGHT\", healthBar, \"TOPRIGHT\", 0, 0)\n                healthBar.border:SetPoint(\"BOTTOMLEFT\", healthBar, \"BOTTOMLEFT\", 0, 0) \n            end\n        end\n    end\n    if not unitFrame.castBar.borderChangeHooked then\n        hooksecurefunc(unitFrame.castBar, \"Hide\", function() envTable.UpdateBorder(unitFrame, false) end)\n        unitFrame.castBar.borderChangeHooked = true\n    end\nend",
					},
					["Time"] = 1659126814,
					["Icon"] = 136048,
					["PlaterCore"] = 1,
				}, -- [2]
			},
			["extra_icon_caster_outline"] = "OUTLINE",
			["auras_per_row_amount2"] = 6,
			["aura_width"] = 16,
			["health_statusbar_bgcolor"] = {
				0.058823529411765, -- [1]
				0.058823529411765, -- [2]
				0.058823529411765, -- [3]
				0.80000001192093, -- [4]
			},
			["quick_hide"] = true,
			["target_highlight_color"] = {
				nil, -- [1]
				1, -- [2]
			},
			["extra_icon_stack_outline"] = "OUTLINE",
			["click_space"] = {
				148, -- [1]
			},
			["castbar_target_font"] = "Expressway",
			["cast_statusbar_spark_texture"] = "Interface\\AddOns\\Plater\\images\\spark8",
			["aura_x_offset"] = 0,
			["ui_parent_scale_tune"] = 1.406249965948519,
			["health_statusbar_bgtexture"] = "Minimalist",
			["indicator_raidmark_anchor"] = {
				["x"] = 3,
			},
			["aura_show_enrage"] = true,
			["aura_tracker"] = {
				["buff_tracked"] = {
					["321402"] = true,
					["322773"] = true,
					["333241"] = true,
					["327416"] = true,
					["322433"] = true,
					["333737"] = true,
					["321754"] = true,
					["343470"] = true,
					["331510"] = true,
					["343558"] = true,
					["327808"] = true,
					["178658"] = true,
					["317936"] = true,
					["326892"] = true,
					["336451"] = true,
					["344739"] = true,
					["333227"] = true,
					["343502"] = true,
					["326450"] = true,
					["209859"] = true,
					["336499"] = true,
					["340880"] = true,
					["330545"] = true,
					["340873"] = true,
					["226510"] = true,
				},
				["debuff_banned"] = {
					["342938"] = true,
				},
				["buff_banned"] = {
					["206150"] = true,
					["333553"] = true,
					["61574"] = true,
					["61573"] = true,
				},
			},
			["extra_icon_caster_font"] = "Expressway",
			["cast_statusbar_color"] = {
				0.023529411764706, -- [1]
				1, -- [2]
				nil, -- [3]
				0.96000000089407, -- [4]
			},
			["update_throttle"] = 0.099999994039536,
			["bossmod_cooldown_text_size"] = 15,
			["patch_version"] = 19,
			["indicator_extra_raidmark"] = false,
			["indicator_raidmark_scale"] = 0.84999996423721,
			["extra_icon_timer_font"] = "Expressway",
			["target_highlight_alpha"] = 1,
			["target_shady_alpha"] = 1,
			["ghost_auras"] = {
				["auras"] = {
					["PRIEST"] = {
						[3] = {
							[589] = true,
							[34914] = true,
						},
					},
					["WARLOCK"] = {
						{
							[172] = true,
							[980] = true,
						}, -- [1]
					},
				},
			},
			["target_highlight_height"] = 12,
			["version"] = 13,
			["health_selection_overlay"] = "Minimalist",
			["use_ui_parent"] = true,
			["indicator_elite"] = false,
			["cast_statusbar_use_fade_effects"] = false,
			["indicator_spec"] = false,
			["cast_statusbar_color_interrupted"] = {
				0.30196078431373, -- [1]
				0.30196078431373, -- [2]
				0.30196078431373, -- [3]
			},
			["range_check_in_range_or_target_alpha"] = 1,
			["aura_timer_text_size"] = 10,
			["number_region_first_run"] = true,
			["script_data_trash"] = {},
			["health_cutoff"] = false,
			["castbar_target_anchor"] = {
				["side"] = 4,
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
				["Unit - Show Energy"] = 11,
				["Spiteful Affix"] = 3,
				["Relics 9.2 M Dungeons"] = 2,
				["Unit - Main Target"] = 11,
				["Aura - Blink Time Left"] = 13,
				["Unit - Important"] = 11,
				["Countdown"] = 11,
				["Unit - Health Markers"] = 12,
				["Cast - Frontal Cone"] = 11,
				["Fixate"] = 11,
				["Cast - Tank Interrupt"] = 12,
				["Auto Set Skull"] = 11,
				["Cast - Alert + Timer [P]"] = 2,
				["Fixate On You"] = 11,
			},
			["cast_statusbar_texture"] = "Minimalist",
			["indicator_faction"] = false,
			["first_run3"] = true,
			["indicator_pet"] = false,
			["aura_timer_text_font"] = "Expressway",
			["health_cutoff_upper"] = false,
		}

		-- Profile key
		PlaterDB["profileKeys"][E.mynameRealm] = name

	elseif E.Classic then

		-- Create profile if it doesn't exist yet
		PlaterDB["profiles"][name] = PlaterDB["profiles"][name] or {}

		PlaterDB["profiles"][name] = {
			["script_data"] = {},
			["target_shady_enabled"] = false,
			["aura2_y_offset"] = 5,
			["cast_statusbar_color_nointerrupt"] = {
				1, -- [1]
				0, -- [2]
				0.007843137254902, -- [3]
				0.96000000089407, -- [4]
			},
			["indicator_worldboss"] = false,
			["aura_width2"] = 16,
			["aura_show_crowdcontrol"] = true,
			["extra_icon_timer_outline"] = "OUTLINE",
			["extra_icon_anchor"] = {
				["x"] = -3,
			},
			["extra_icon_wide_icon"] = false,
			["range_check_alpha"] = 1,
			["semver"] = "3.2.0",
			["use_name_translit"] = true,
			["extra_icon_show_purge"] = true,
			["spell_animations"] = false,
			["aura_consolidate"] = true,
			["extra_icon_width"] = 26,
			["health_statusbar_texture"] = "Minimalist",
			["hook_auto_imported"] = {
				["Reorder Nameplate"] = 4,
				["Dont Have Aura"] = 1,
				["Players Targetting Amount"] = 4,
				["Color Automation"] = 1,
				["Extra Border"] = 2,
				["Cast Bar Icon Config"] = 2,
				["Attacking Specific Unit"] = 2,
				["Combo Points"] = 6,
				["Hide Neutral Units"] = 1,
				["Target Color"] = 3,
				["Execute Range"] = 1,
				["Aura Reorder"] = 3,
			},
			["aura_frame1_anchor"] = {
				["y"] = 2,
			},
			["indicator_rare"] = false,
			["extra_icon_stack_font"] = "Expressway",
			["cast_statusbar_bgtexture"] = "Minimalist",
			["aura2_x_offset"] = 0,
			["target_indicator"] = "NONE",
			["aura_show_buff_by_the_unit"] = false,
			["saved_cvars"] = {
				["ShowClassColorInNameplate"] = "1",
				["nameplateOverlapV"] = "1.7",
				["nameplateLargeTopInset"] = "-1",
				["nameplateShowEnemyMinus"] = "1",
				["nameplateMotionSpeed"] = "0.05",
				["NamePlateClassificationScale"] = "1",
				["nameplateShowFriendlyTotems"] = "0",
				["nameplateShowEnemyMinions"] = "1",
				["nameplateShowFriendlyPets"] = "0",
				["nameplateShowFriendlyNPCs"] = "1",
				["nameplateSelectedScale"] = "1",
				["nameplateTargetRadialPosition"] = "0",
				["nameplateResourceOnTarget"] = "0",
				["nameplateSelectedAlpha"] = "1",
				["nameplateMinScale"] = "1",
				["nameplateShowAll"] = "1",
				["nameplateMaxDistance"] = "100",
				["nameplateShowFriendlyMinions"] = "0",
				["nameplatePersonalHideDelaySeconds"] = "0.2",
				["ShowNamePlateLoseAggroFlash"] = "1",
				["nameplateTargetBehindMaxDistance"] = "30",
				["nameplateShowFriendlyGuardians"] = "0",
				["NamePlateHorizontalScale"] = "1",
				["nameplateShowFriends"] = "0",
				["nameplateShowEnemies"] = "1",
				["nameplateOtherTopInset"] = "-1",
				["NamePlateVerticalScale"] = "1",
			},
			["login_counter"] = 2028,
			["extra_icon_caster_name"] = false,
			["click_space_friendly"] = {
				148, -- [1]
			},
			["bossmod_aura_height"] = 30,
			["aura_stack_font"] = "Expressway",
			["hide_friendly_castbars"] = true,
			["OptionsPanelDB"] = {
				["PlaterOptionsPanelFrame"] = {
					["scale"] = 1,
				},
			},
			["auras_per_row_amount"] = 6,
			["target_highlight_texture"] = "Interface\\AddOns\\Plater\\images\\selection_indicator2",
			["plate_config"] = {
				["player"] = {
					["spellpercent_text_font"] = "Expressway",
					["power_percent_text_font"] = "Expressway",
					["spellname_text_font"] = "Expressway",
					["percent_text_font"] = "Expressway",
				},
				["friendlyplayer"] = {
					["spellpercent_text_font"] = "Expressway",
					["actorname_use_class_color"] = true,
					["cast"] = {
						140, -- [1]
						12, -- [2]
					},
					["spellname_text_outline"] = "OUTLINE",
					["level_text_font"] = "Expressway",
					["actorname_text_font"] = "Expressway",
					["actorname_use_guild_color"] = false,
					["cast_incombat"] = {
						140, -- [1]
					},
					["spellname_text_font"] = "Expressway",
					["level_text_outline"] = "OUTLINE",
					["percent_text_font"] = "Expressway",
					["health_incombat"] = {
						140, -- [1]
						16, -- [2]
					},
					["health"] = {
						140, -- [1]
						16, -- [2]
					},
				},
				["friendlynpc"] = {
					["spellpercent_text_font"] = "Expressway",
					["cast"] = {
						140, -- [1]
						12, -- [2]
					},
					["big_actortitle_text_size"] = 9,
					["spellname_text_outline"] = "OUTLINE",
					["level_text_font"] = "Expressway",
					["actorname_text_font"] = "Expressway",
					["all_names"] = false,
					["actorname_text_outline"] = "OUTLINE",
					["big_actortitle_text_font"] = "Expressway",
					["cast_incombat"] = {
						140, -- [1]
					},
					["health_incombat"] = {
						140, -- [1]
					},
					["spellname_text_font"] = "Expressway",
					["big_actorname_text_font"] = "Expressway",
					["level_text_outline"] = "OUTLINE",
					["percent_text_font"] = "Expressway",
					["relevance_state"] = 3,
					["health"] = {
						140, -- [1]
						16, -- [2]
					},
				},
				["enemynpc"] = {
					["spellpercent_text_font"] = "Expressway",
					["cast"] = {
						140, -- [1]
						12, -- [2]
					},
					["spellpercent_text_anchor"] = {
						["y"] = 0.29999542236328,
						["x"] = -1,
					},
					["level_text_font"] = "Expressway",
					["actorname_text_font"] = "Expressway",
					["actorname_text_outline"] = "OUTLINE",
					["actorname_text_spacing"] = 8,
					["big_actortitle_text_font"] = "Expressway",
					["spellpercent_text_size"] = 9,
					["cast_incombat"] = {
						140, -- [1]
						12, -- [2]
					},
					["spellname_text_anchor"] = {
						["y"] = 0.29999542236328,
						["x"] = 1,
						["side"] = 10,
					},
					["percent_text_anchor"] = {
						["y"] = 0.5,
						["side"] = 11,
					},
					["spellname_text_font"] = "Expressway",
					["big_actorname_text_font"] = "Expressway",
					["level_text_outline"] = "OUTLINE",
					["actorname_text_anchor"] = {
						["y"] = 0.29999542236328,
						["x"] = 1,
						["side"] = 10,
					},
					["percent_text_font"] = "Expressway",
					["spellname_text_size"] = 9,
					["health"] = {
						140, -- [1]
						16, -- [2]
					},
					["actorname_text_size"] = 9,
					["percent_show_health"] = false,
					["health_incombat"] = {
						140, -- [1]
					},
					["level_text_enabled"] = false,
				},
				["global_health_width"] = 140,
				["enemyplayer"] = {
					["big_actorname_text_size"] = 10,
					["spellpercent_text_font"] = "Expressway",
					["level_text_size"] = 8,
					["cast"] = {
						140, -- [1]
						12, -- [2]
					},
					["spellpercent_text_anchor"] = {
						["y"] = 0.29999542236328,
						["x"] = -1,
					},
					["spellname_text_outline"] = "OUTLINE",
					["level_text_font"] = "Expressway",
					["actorname_text_font"] = "Expressway",
					["all_names"] = true,
					["actorname_text_outline"] = "OUTLINE",
					["actorname_text_spacing"] = 8,
					["quest_color_enemy"] = {
						1, -- [1]
						0.369, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["big_actortitle_text_font"] = "Expressway",
					["spellpercent_text_size"] = 9,
					["cast_incombat"] = {
						140, -- [1]
					},
					["spellname_text_anchor"] = {
						["y"] = 0.29999542236328,
						["x"] = 1.5,
						["side"] = 10,
					},
					["percent_text_anchor"] = {
						["y"] = 0.5,
						["side"] = 11,
					},
					["spellname_text_font"] = "Expressway",
					["quest_color_neutral"] = {
						1, -- [1]
						0.65, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["actorname_text_size"] = 9,
					["big_actorname_text_font"] = "Expressway",
					["level_text_outline"] = "OUTLINE",
					["big_actortitle_text_size"] = 10,
					["actorname_text_anchor"] = {
						["y"] = 0.29999542236328,
						["x"] = 1,
						["side"] = 10,
					},
					["percent_text_font"] = "Expressway",
					["quest_enabled"] = true,
					["quest_color_enabled"] = true,
					["health_incombat"] = {
						140, -- [1]
					},
					["health"] = {
						140, -- [1]
						16, -- [2]
					},
					["percent_show_health"] = false,
					["spellname_text_size"] = 9,
					["level_text_enabled"] = false,
				},
				["global_health_height"] = 16,
			},
			["aura_y_offset"] = 2,
			["cast_statusbar_bgcolor"] = {
				0.058823529411765, -- [1]
				0.058823529411765, -- [2]
				0.058823529411765, -- [3]
				0.80000001192093, -- [4]
			},
			["cast_statusbar_use_fade_effects"] = false,
			["resources_settings"] = {
				["chr"] = {
					["Player-1598-0BD22701"] = "ComboPoints",
				},
			},
			["indicator_scale"] = 1.1000000238419,
			["castbar_icon_size"] = "same as castbar plus healthbar",
			["hook_data"] = {
				{
					["Enabled"] = true,
					["Revision"] = 91,
					["Options"] = {
					},
					["LastHookEdited"] = "Nameplate Updated",
					["Author"] = "Luckyone-Laughing Skull",
					["OptionsValues"] = {
					},
					["Desc"] = "",
					["Hooks"] = {
						["Nameplate Updated"] = "function(self, unitId, unitFrame, envTable)\n    \n    local unitName = UnitName(unitId)\n    \n    -- Show First Name [Whitelist table]\n    local firstName = {\n        [3527] = true, -- Healing Stream Totem\n        [2630] = true, -- Earthbind Totem\n        [61245] = true, -- Capacitor Totem\n        [5925] = true, -- Grounding Totem\n        [105451] = true, -- Counterstrike Totem\n        [105427] = true, -- Skyfury Totem\n        [97369] = true, -- Liquid Magma Totem\n    }\n    \n    -- Show Full Name [Whitelist table]\n    local fullName = {\n        [185685] = true, -- Urh Relic\n        [185680] = true, -- Vy Relic\n        [185683] = true, -- Wo Relic\n    }\n    \n    if (unitName) then\n        local a , b, c, d, e, f = strsplit(' ', unitName, 5)\n        \n        if firstName [unitFrame.namePlateNpcId] then\n            unitFrame.healthBar.unitName:SetText(a)\n        elseif fullName[unitFrame.namePlateNpcId] then\n            unitFrame.healthBar.unitName:SetText(unitName)\n        else\n            unitFrame.healthBar.unitName:SetText(f or e or d or c or b or a)\n        end\n    end\nend",
					},
					["Prio"] = 1,
					["Time"] = 1647036963,
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
						["spec"] = {
						},
						["race"] = {
						},
						["encounter_ids"] = {
						},
						["affix"] = {
						},
					},
					["HooksTemp"] = {
					},
					["Name"] = "LuckyoneUI - Name",
					["Icon"] = 4067922,
					["PlaterCore"] = 1,
				}, -- [1]
				{
					["Enabled"] = true,
					["Revision"] = 44,
					["Options"] = {
					},
					["LastHookEdited"] = "Cast Update",
					["Author"] = "Luckyone-Laughing Skull",
					["OptionsValues"] = {
					},
					["Desc"] = "",
					["Hooks"] = {
						["Nameplate Removed"] = "function(self, unitId, unitFrame, envTable)\n    envTable.UpdateBorder(unitFrame, false)\nend",
						["Cast Update"] = "function(self, unitId, unitFrame, envTable)\n    envTable.UpdateIconPosition(unitFrame)\nend",
						["Cast Start"] = "function(self, unitId, unitFrame, envTable)\n    envTable.UpdateIconPosition(unitFrame)\n    envTable.UpdateBorder(unitFrame, true)\nend",
						["Constructor"] = "function(self, unitId, unitFrame, envTable)\n    \n    envTable.ShowIcon = Plater.db.profile.castbar_icon_show\n    envTable.IconAnchor = \"left\"\n    envTable.IconSizeOffset = 0\n    \n    envTable.ShowShield = false\n    envTable.ShieldTexture = [[Interface\\GROUPFRAME\\UI-GROUP-MAINTANKICON]]\n    envTable.ShieldDesaturated = true\n    envTable.ShieldColor = {1, 1, 1 ,1}\n    envTable.ShieldSize = {10, 12}\n    \n    function envTable.UpdateIconPosition (unitFrame)\n        local castBar = unitFrame.castBar\n        local icon = castBar.Icon\n        local shield = castBar.BorderShield\n        \n        if (envTable.ShowIcon) then\n            icon:ClearAllPoints()\n            \n            if (envTable.IconAnchor == \"left\") then\n                icon:SetPoint (\"topright\", unitFrame.healthBar, \"topleft\", 0, envTable.IconSizeOffset)\n                icon:SetPoint (\"bottomright\", unitFrame.castBar, \"bottomleft\", 0, 0)    \n                \n            elseif (envTable.IconAnchor == \"right\") then\n                icon:SetPoint (\"topleft\", unitFrame.healthBar, \"topright\", 0, envTable.IconSizeOffset)\n                icon:SetPoint (\"bottomleft\", unitFrame.castBar, \"bottomright\", 0, 0)\n                \n            end\n            \n            icon:SetWidth (icon:GetHeight())\n            icon:Show()\n            \n        else\n            icon:Hide()\n            \n        end\n        \n        if (envTable.ShowShield and not castBar.canInterrupt) then\n            shield:Show()\n            shield:SetAlpha (1)\n            shield:SetTexCoord (0, 1, 0, 1)\n            shield:SetVertexColor (1, 1, 1, 1)\n            \n            shield:SetTexture (envTable.ShieldTexture)\n            shield:SetDesaturated (envTable.ShieldDesaturated)\n            \n            if (not envTable.ShieldDesaturated) then\n                shield:SetVertexColor (DetailsFramework:ParseColors (envTable.ShieldColor))\n            end\n            \n            shield:SetSize (unpack (envTable.ShieldSize))\n            \n            shield:ClearAllPoints()\n            shield:SetPoint (\"center\", castBar, \"left\", 0, 0)\n        else\n            shield:Hide()\n        end\n    end\n    \n    function envTable.UpdateBorder (unitFrame, casting)\n        local healthBar = unitFrame.healthBar\n        local castBar = unitFrame.castBar\n        if casting then\n            if envTable.ShowIcon and castBar.Icon:IsShown() then\n                if envTable.IconAnchor == \"left\" then\n                    healthBar.border:SetPoint(\"TOPLEFT\", castBar.Icon, \"TOPLEFT\", 0, 0)\n                    healthBar.border:SetPoint(\"BOTTOMRIGHT\", castBar, \"BOTTOMRIGHT\", 0, 0)\n                elseif envTable.IconAnchor == \"right\" then\n                    healthBar.border:SetPoint(\"TOPRIGHT\", castBar.Icon, \"TOPRIGHT\", 0, 0)\n                    healthBar.border:SetPoint(\"BOTTOMLEFT\", castBar, \"BOTTOMLEFT\", 0, 0) \n                end\n            else\n                if envTable.IconAnchor == \"left\" then\n                    healthBar.border:SetPoint(\"TOPLEFT\", healthBar, \"TOPLEFT\", 0, 0)\n                    healthBar.border:SetPoint(\"BOTTOMRIGHT\", castBar, \"BOTTOMRIGHT\", 0, 0)\n                elseif envTable.IconAnchor == \"right\" then\n                    healthBar.border:SetPoint(\"TOPRIGHT\", healthBar, \"TOPRIGHT\", 0, 0)\n                    healthBar.border:SetPoint(\"BOTTOMLEFT\", castBar, \"BOTTOMLEFT\", 0, 0) \n                end\n            end\n        else\n            if envTable.IconAnchor == \"left\" then\n                healthBar.border:SetPoint(\"TOPLEFT\", healthBar, \"TOPLEFT\", 0, 0)\n                healthBar.border:SetPoint(\"BOTTOMRIGHT\", healthBar, \"BOTTOMRIGHT\", 0, 0)\n            elseif envTable.IconAnchor == \"right\" then\n                healthBar.border:SetPoint(\"TOPRIGHT\", healthBar, \"TOPRIGHT\", 0, 0)\n                healthBar.border:SetPoint(\"BOTTOMLEFT\", healthBar, \"BOTTOMLEFT\", 0, 0) \n            end\n        end\n    end\n    if not unitFrame.castBar.borderChangeHooked then\n        hooksecurefunc(unitFrame.castBar, \"Hide\", function() envTable.UpdateBorder(unitFrame, false) end)\n        unitFrame.castBar.borderChangeHooked = true\n    end\nend",
					},
					["Prio"] = 1,
					["Time"] = 1647037225,
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
						["spec"] = {
						},
						["race"] = {
						},
						["encounter_ids"] = {
						},
						["affix"] = {
						},
					},
					["HooksTemp"] = {
					},
					["Name"] = "LuckyoneUI - Castbar",
					["Icon"] = 4067925,
					["PlaterCore"] = 1,
				}, -- [2]
			},
			["extra_icon_caster_outline"] = "OUTLINE",
			["auras_per_row_amount2"] = 6,
			["aura_width"] = 16,
			["health_statusbar_bgcolor"] = {
				0.058823529411765, -- [1]
				0.058823529411765, -- [2]
				0.058823529411765, -- [3]
				0.80000001192093, -- [4]
			},
			["quick_hide"] = true,
			["target_highlight_color"] = {
				nil, -- [1]
				1, -- [2]
			},
			["extra_icon_stack_outline"] = "OUTLINE",
			["click_space"] = {
				148, -- [1]
			},
			["castbar_target_font"] = "Expressway",
			["cast_statusbar_spark_texture"] = "Interface\\AddOns\\Plater\\images\\spark8",
			["aura_x_offset"] = 0,
			["first_run3"] = true,
			["ui_parent_scale_tune"] = 1.406249965948519,
			["health_statusbar_bgtexture"] = "Minimalist",
			["indicator_raidmark_anchor"] = {
				["x"] = 3,
			},
			["aura_show_enrage"] = true,
			["aura_tracker"] = {
				["buff_tracked"] = {
					["321402"] = true,
					["322773"] = true,
					["333241"] = true,
					["327416"] = true,
					["322433"] = true,
					["333737"] = true,
					["321754"] = true,
					["343470"] = true,
					["331510"] = true,
					["343558"] = true,
					["327808"] = true,
					["178658"] = true,
					["317936"] = true,
					["326892"] = true,
					["336451"] = true,
					["344739"] = true,
					["333227"] = true,
					["343502"] = true,
					["326450"] = true,
					["209859"] = true,
					["336499"] = true,
					["340880"] = true,
					["330545"] = true,
					["340873"] = true,
					["226510"] = true,
				},
				["debuff_banned"] = {
					["342938"] = true,
				},
				["buff_banned"] = {
					["206150"] = true,
					["333553"] = true,
					["61574"] = true,
					["61573"] = true,
				},
			},
			["extra_icon_caster_font"] = "Expressway",
			["cast_statusbar_color"] = {
				0.023529411764706, -- [1]
				1, -- [2]
				nil, -- [3]
				0.96000000089407, -- [4]
			},
			["update_throttle"] = 0.099999994039536,
			["bossmod_cooldown_text_size"] = 15,
			["indicator_extra_raidmark"] = false,
			["extra_icon_timer_font"] = "Expressway",
			["health_selection_overlay"] = "Minimalist",
			["health_cutoff"] = false,
			["target_highlight_alpha"] = 1,
			["cast_statusbar_color_interrupted"] = {
				0.30196078431373, -- [1]
				0.30196078431373, -- [2]
				0.30196078431373, -- [3]
			},
			["indicator_raidmark_scale"] = 0.84999996423721,
			["target_highlight_height"] = 12,
			["health_cutoff_upper"] = false,
			["version"] = 13,
			["use_ui_parent"] = true,
			["indicator_elite"] = false,
			["indicator_spec"] = false,
			["patch_version"] = 18,
			["range_check_in_range_or_target_alpha"] = 1,
			["aura_timer_text_size"] = 10,
			["number_region_first_run"] = true,
			["castbar_target_anchor"] = {
				["side"] = 4,
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
				["Spiteful Affix"] = 3,
				["Unit - Show Energy"] = 11,
				["Unit - Main Target"] = 11,
				["Aura - Blink Time Left"] = 13,
				["Unit - Important"] = 11,
				["Countdown"] = 11,
				["Unit - Health Markers"] = 12,
				["Cast - Frontal Cone"] = 11,
				["Fixate"] = 11,
				["Cast - Tank Interrupt"] = 12,
				["Auto Set Skull"] = 11,
				["Cast - Alert + Timer [P]"] = 2,
				["Fixate On You"] = 11,
			},
			["cast_statusbar_texture"] = "Minimalist",
			["indicator_faction"] = false,
			["indicator_pet"] = false,
			["aura_timer_text_font"] = "Expressway",
			["bossmod_aura_width"] = 30,
		}

		-- Profile key
		PlaterDB["profileKeys"][E.mynameRealm] = name

	elseif E.Wrath then

		-- Create profile if it doesn't exist yet
		PlaterDB["profiles"][name] = PlaterDB["profiles"][name] or {}

		-- Profile db
		PlaterDB["profiles"][name] = {
			["script_data"] = {},
			["target_shady_enabled"] = false,
			["aura2_y_offset"] = 5,
			["cast_statusbar_color_nointerrupt"] = {
				1, -- [1]
				0, -- [2]
				0.007843137254902, -- [3]
				0.96000000089407, -- [4]
			},
			["indicator_worldboss"] = false,
			["aura_width2"] = 16,
			["aura_show_crowdcontrol"] = true,
			["extra_icon_timer_outline"] = "OUTLINE",
			["extra_icon_anchor"] = {
				["x"] = -3,
			},
			["extra_icon_wide_icon"] = false,
			["range_check_alpha"] = 1,
			["semver"] = "3.2.0",
			["use_name_translit"] = true,
			["extra_icon_show_purge"] = true,
			["spell_animations"] = false,
			["aura_consolidate"] = true,
			["extra_icon_width"] = 26,
			["health_statusbar_texture"] = "Minimalist",
			["hook_auto_imported"] = {
				["Reorder Nameplate"] = 4,
				["Dont Have Aura"] = 1,
				["Players Targetting Amount"] = 4,
				["Color Automation"] = 1,
				["Extra Border"] = 2,
				["Cast Bar Icon Config"] = 2,
				["Attacking Specific Unit"] = 2,
				["Combo Points"] = 6,
				["Hide Neutral Units"] = 1,
				["Target Color"] = 3,
				["Execute Range"] = 1,
				["Aura Reorder"] = 3,
			},
			["aura_frame1_anchor"] = {
				["y"] = 2,
			},
			["indicator_rare"] = false,
			["extra_icon_stack_font"] = "Expressway",
			["cast_statusbar_bgtexture"] = "Minimalist",
			["aura2_x_offset"] = 0,
			["target_indicator"] = "NONE",
			["aura_show_buff_by_the_unit"] = false,
			["saved_cvars"] = {
				["ShowClassColorInNameplate"] = "1",
				["nameplateOverlapV"] = "1.7",
				["nameplateLargeTopInset"] = "-1",
				["nameplateShowEnemyMinus"] = "1",
				["nameplateMotionSpeed"] = "0.05",
				["NamePlateClassificationScale"] = "1",
				["nameplateShowFriendlyTotems"] = "0",
				["nameplateShowEnemyMinions"] = "1",
				["nameplateShowFriendlyPets"] = "0",
				["nameplateShowFriendlyNPCs"] = "1",
				["nameplateSelectedScale"] = "1",
				["nameplateTargetRadialPosition"] = "0",
				["nameplateResourceOnTarget"] = "0",
				["nameplateSelectedAlpha"] = "1",
				["nameplateMinScale"] = "1",
				["nameplateShowAll"] = "1",
				["nameplateMaxDistance"] = "100",
				["nameplateShowFriendlyMinions"] = "0",
				["nameplatePersonalHideDelaySeconds"] = "0.2",
				["ShowNamePlateLoseAggroFlash"] = "1",
				["nameplateTargetBehindMaxDistance"] = "30",
				["nameplateShowFriendlyGuardians"] = "0",
				["NamePlateHorizontalScale"] = "1",
				["nameplateShowFriends"] = "0",
				["nameplateShowEnemies"] = "1",
				["nameplateOtherTopInset"] = "-1",
				["NamePlateVerticalScale"] = "1",
			},
			["login_counter"] = 2028,
			["extra_icon_caster_name"] = false,
			["click_space_friendly"] = {
				148, -- [1]
			},
			["bossmod_aura_height"] = 30,
			["aura_stack_font"] = "Expressway",
			["hide_friendly_castbars"] = true,
			["OptionsPanelDB"] = {
				["PlaterOptionsPanelFrame"] = {
					["scale"] = 1,
				},
			},
			["auras_per_row_amount"] = 6,
			["target_highlight_texture"] = "Interface\\AddOns\\Plater\\images\\selection_indicator2",
			["plate_config"] = {
				["player"] = {
					["spellpercent_text_font"] = "Expressway",
					["power_percent_text_font"] = "Expressway",
					["spellname_text_font"] = "Expressway",
					["percent_text_font"] = "Expressway",
				},
				["friendlyplayer"] = {
					["spellpercent_text_font"] = "Expressway",
					["actorname_use_class_color"] = true,
					["cast"] = {
						140, -- [1]
						12, -- [2]
					},
					["spellname_text_outline"] = "OUTLINE",
					["level_text_font"] = "Expressway",
					["actorname_text_font"] = "Expressway",
					["actorname_use_guild_color"] = false,
					["cast_incombat"] = {
						140, -- [1]
					},
					["spellname_text_font"] = "Expressway",
					["level_text_outline"] = "OUTLINE",
					["percent_text_font"] = "Expressway",
					["health_incombat"] = {
						140, -- [1]
						16, -- [2]
					},
					["health"] = {
						140, -- [1]
						16, -- [2]
					},
				},
				["friendlynpc"] = {
					["spellpercent_text_font"] = "Expressway",
					["cast"] = {
						140, -- [1]
						12, -- [2]
					},
					["big_actortitle_text_size"] = 9,
					["spellname_text_outline"] = "OUTLINE",
					["level_text_font"] = "Expressway",
					["actorname_text_font"] = "Expressway",
					["all_names"] = false,
					["actorname_text_outline"] = "OUTLINE",
					["big_actortitle_text_font"] = "Expressway",
					["cast_incombat"] = {
						140, -- [1]
					},
					["health_incombat"] = {
						140, -- [1]
					},
					["spellname_text_font"] = "Expressway",
					["big_actorname_text_font"] = "Expressway",
					["level_text_outline"] = "OUTLINE",
					["percent_text_font"] = "Expressway",
					["relevance_state"] = 3,
					["health"] = {
						140, -- [1]
						16, -- [2]
					},
				},
				["enemynpc"] = {
					["spellpercent_text_font"] = "Expressway",
					["cast"] = {
						140, -- [1]
						12, -- [2]
					},
					["spellpercent_text_anchor"] = {
						["y"] = 0.29999542236328,
						["x"] = -1,
					},
					["level_text_font"] = "Expressway",
					["actorname_text_font"] = "Expressway",
					["actorname_text_outline"] = "OUTLINE",
					["actorname_text_spacing"] = 8,
					["big_actortitle_text_font"] = "Expressway",
					["spellpercent_text_size"] = 9,
					["cast_incombat"] = {
						140, -- [1]
						12, -- [2]
					},
					["spellname_text_anchor"] = {
						["y"] = 0.29999542236328,
						["x"] = 1,
						["side"] = 10,
					},
					["percent_text_anchor"] = {
						["y"] = 0.5,
						["side"] = 11,
					},
					["spellname_text_font"] = "Expressway",
					["big_actorname_text_font"] = "Expressway",
					["level_text_outline"] = "OUTLINE",
					["actorname_text_anchor"] = {
						["y"] = 0.29999542236328,
						["x"] = 1,
						["side"] = 10,
					},
					["percent_text_font"] = "Expressway",
					["spellname_text_size"] = 9,
					["health"] = {
						140, -- [1]
						16, -- [2]
					},
					["actorname_text_size"] = 9,
					["percent_show_health"] = false,
					["health_incombat"] = {
						140, -- [1]
					},
					["level_text_enabled"] = false,
				},
				["global_health_width"] = 140,
				["enemyplayer"] = {
					["big_actorname_text_size"] = 10,
					["spellpercent_text_font"] = "Expressway",
					["level_text_size"] = 8,
					["cast"] = {
						140, -- [1]
						12, -- [2]
					},
					["spellpercent_text_anchor"] = {
						["y"] = 0.29999542236328,
						["x"] = -1,
					},
					["spellname_text_outline"] = "OUTLINE",
					["level_text_font"] = "Expressway",
					["actorname_text_font"] = "Expressway",
					["all_names"] = true,
					["actorname_text_outline"] = "OUTLINE",
					["actorname_text_spacing"] = 8,
					["quest_color_enemy"] = {
						1, -- [1]
						0.369, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["big_actortitle_text_font"] = "Expressway",
					["spellpercent_text_size"] = 9,
					["cast_incombat"] = {
						140, -- [1]
					},
					["spellname_text_anchor"] = {
						["y"] = 0.29999542236328,
						["x"] = 1.5,
						["side"] = 10,
					},
					["percent_text_anchor"] = {
						["y"] = 0.5,
						["side"] = 11,
					},
					["spellname_text_font"] = "Expressway",
					["quest_color_neutral"] = {
						1, -- [1]
						0.65, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["actorname_text_size"] = 9,
					["big_actorname_text_font"] = "Expressway",
					["level_text_outline"] = "OUTLINE",
					["big_actortitle_text_size"] = 10,
					["actorname_text_anchor"] = {
						["y"] = 0.29999542236328,
						["x"] = 1,
						["side"] = 10,
					},
					["percent_text_font"] = "Expressway",
					["quest_enabled"] = true,
					["quest_color_enabled"] = true,
					["health_incombat"] = {
						140, -- [1]
					},
					["health"] = {
						140, -- [1]
						16, -- [2]
					},
					["percent_show_health"] = false,
					["spellname_text_size"] = 9,
					["level_text_enabled"] = false,
				},
				["global_health_height"] = 16,
			},
			["aura_y_offset"] = 2,
			["cast_statusbar_bgcolor"] = {
				0.058823529411765, -- [1]
				0.058823529411765, -- [2]
				0.058823529411765, -- [3]
				0.80000001192093, -- [4]
			},
			["bossmod_aura_width"] = 30,
			["resources_settings"] = {
				["chr"] = {
					["Player-1598-0BD22701"] = "ComboPoints",
					["Player-4465-02F8C200"] = "ComboPoints",
				},
			},
			["indicator_scale"] = 1.1000000238419,
			["castbar_icon_size"] = "same as castbar plus healthbar",
			["hook_data"] = {
				{
					["Enabled"] = true,
					["Revision"] = 93,
					["Options"] = {
					},
					["LastHookEdited"] = "Nameplate Updated",
					["Author"] = "Luckyone-Laughing Skull",
					["OptionsValues"] = {
					},
					["Desc"] = "",
					["Hooks"] = {
						["Nameplate Updated"] = "function(self, unitId, unitFrame, envTable)\n    \n    local unitName = UnitName(unitId)\n    \n    -- Show First Name [Whitelist table]\n    local firstName = {\n        [3527] = true, -- Healing Stream Totem\n        [2630] = true, -- Earthbind Totem\n        [61245] = true, -- Capacitor Totem\n        [5925] = true, -- Grounding Totem\n        [105451] = true, -- Counterstrike Totem\n        [105427] = true, -- Skyfury Totem\n        [97369] = true, -- Liquid Magma Totem\n    }\n    \n    -- Show Full Name [Whitelist table]\n    local fullName = {\n        [185685] = true, -- Urh Relic\n        [185680] = true, -- Vy Relic\n        [185683] = true, -- Wo Relic\n    }\n    \n    if (unitName) then\n        local a , b, c, d, e, f = strsplit(' ', unitName, 5)\n        \n        if firstName [unitFrame.namePlateNpcId] then\n            unitFrame.healthBar.unitName:SetText(a)\n        elseif fullName[unitFrame.namePlateNpcId] then\n            unitFrame.healthBar.unitName:SetText(unitName)\n        else\n            unitFrame.healthBar.unitName:SetText(f or e or d or c or b or a)\n        end\n    end\nend",
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
						["spec"] = {
						},
						["race"] = {
						},
						["encounter_ids"] = {
						},
						["affix"] = {
						},
					},
					["HooksTemp"] = {
						["Nameplate Updated"] = "function(self, unitId, unitFrame, envTable)\n    \n    local unitName = UnitName(unitId)\n    \n    -- Show First Name [Whitelist table]\n    local firstName = {\n        [3527] = true, -- Healing Stream Totem\n        [2630] = true, -- Earthbind Totem\n        [61245] = true, -- Capacitor Totem\n        [5925] = true, -- Grounding Totem\n        [105451] = true, -- Counterstrike Totem\n        [105427] = true, -- Skyfury Totem\n        [97369] = true, -- Liquid Magma Totem\n    }\n    \n    -- Show Full Name [Whitelist table]\n    local fullName = {\n        [185685] = true, -- Urh Relic\n        [185680] = true, -- Vy Relic\n        [185683] = true, -- Wo Relic\n    }\n    \n    if (unitName) then\n        local a , b, c, d, e, f = strsplit(' ', unitName, 5)\n        \n        if firstName [unitFrame.namePlateNpcId] then\n            unitFrame.healthBar.unitName:SetText(a)\n        elseif fullName[unitFrame.namePlateNpcId] then\n            unitFrame.healthBar.unitName:SetText(unitName)\n        else\n            unitFrame.healthBar.unitName:SetText(f or e or d or c or b or a)\n        end\n    end\nend",
					},
					["Time"] = 1659126832,
					["Icon"] = 136047,
					["PlaterCore"] = 1,
				}, -- [1]
				{
					["Enabled"] = true,
					["Revision"] = 45,
					["Options"] = {
					},
					["LastHookEdited"] = "Constructor",
					["Author"] = "Luckyone-Laughing Skull",
					["OptionsValues"] = {
					},
					["Desc"] = "",
					["Hooks"] = {
						["Nameplate Removed"] = "function(self, unitId, unitFrame, envTable)\n    envTable.UpdateBorder(unitFrame, false)\nend",
						["Cast Update"] = "function(self, unitId, unitFrame, envTable)\n    envTable.UpdateIconPosition(unitFrame)\nend",
						["Cast Start"] = "function(self, unitId, unitFrame, envTable)\n    envTable.UpdateIconPosition(unitFrame)\n    envTable.UpdateBorder(unitFrame, true)\nend",
						["Constructor"] = "function(self, unitId, unitFrame, envTable)\n    \n    envTable.ShowIcon = Plater.db.profile.castbar_icon_show\n    envTable.IconAnchor = \"left\"\n    envTable.IconSizeOffset = 0\n    \n    envTable.ShowShield = false\n    envTable.ShieldTexture = [[Interface\\GROUPFRAME\\UI-GROUP-MAINTANKICON]]\n    envTable.ShieldDesaturated = true\n    envTable.ShieldColor = {1, 1, 1 ,1}\n    envTable.ShieldSize = {10, 12}\n    \n    function envTable.UpdateIconPosition (unitFrame)\n        local castBar = unitFrame.castBar\n        local icon = castBar.Icon\n        local shield = castBar.BorderShield\n        \n        if (envTable.ShowIcon) then\n            icon:ClearAllPoints()\n            \n            if (envTable.IconAnchor == \"left\") then\n                icon:SetPoint (\"topright\", unitFrame.healthBar, \"topleft\", 0, envTable.IconSizeOffset)\n                icon:SetPoint (\"bottomright\", unitFrame.castBar, \"bottomleft\", 0, 0)    \n                \n            elseif (envTable.IconAnchor == \"right\") then\n                icon:SetPoint (\"topleft\", unitFrame.healthBar, \"topright\", 0, envTable.IconSizeOffset)\n                icon:SetPoint (\"bottomleft\", unitFrame.castBar, \"bottomright\", 0, 0)\n                \n            end\n            \n            icon:SetWidth (icon:GetHeight())\n            icon:Show()\n            \n        else\n            icon:Hide()\n            \n        end\n        \n        if (envTable.ShowShield and not castBar.canInterrupt) then\n            shield:Show()\n            shield:SetAlpha (1)\n            shield:SetTexCoord (0, 1, 0, 1)\n            shield:SetVertexColor (1, 1, 1, 1)\n            \n            shield:SetTexture (envTable.ShieldTexture)\n            shield:SetDesaturated (envTable.ShieldDesaturated)\n            \n            if (not envTable.ShieldDesaturated) then\n                shield:SetVertexColor (DetailsFramework:ParseColors (envTable.ShieldColor))\n            end\n            \n            shield:SetSize (unpack (envTable.ShieldSize))\n            \n            shield:ClearAllPoints()\n            shield:SetPoint (\"center\", castBar, \"left\", 0, 0)\n        else\n            shield:Hide()\n        end\n    end\n    \n    function envTable.UpdateBorder (unitFrame, casting)\n        local healthBar = unitFrame.healthBar\n        local castBar = unitFrame.castBar\n        if casting then\n            if envTable.ShowIcon and castBar.Icon:IsShown() then\n                if envTable.IconAnchor == \"left\" then\n                    healthBar.border:SetPoint(\"TOPLEFT\", castBar.Icon, \"TOPLEFT\", 0, 0)\n                    healthBar.border:SetPoint(\"BOTTOMRIGHT\", castBar, \"BOTTOMRIGHT\", 0, 0)\n                elseif envTable.IconAnchor == \"right\" then\n                    healthBar.border:SetPoint(\"TOPRIGHT\", castBar.Icon, \"TOPRIGHT\", 0, 0)\n                    healthBar.border:SetPoint(\"BOTTOMLEFT\", castBar, \"BOTTOMLEFT\", 0, 0) \n                end\n            else\n                if envTable.IconAnchor == \"left\" then\n                    healthBar.border:SetPoint(\"TOPLEFT\", healthBar, \"TOPLEFT\", 0, 0)\n                    healthBar.border:SetPoint(\"BOTTOMRIGHT\", castBar, \"BOTTOMRIGHT\", 0, 0)\n                elseif envTable.IconAnchor == \"right\" then\n                    healthBar.border:SetPoint(\"TOPRIGHT\", healthBar, \"TOPRIGHT\", 0, 0)\n                    healthBar.border:SetPoint(\"BOTTOMLEFT\", castBar, \"BOTTOMLEFT\", 0, 0) \n                end\n            end\n        else\n            if envTable.IconAnchor == \"left\" then\n                healthBar.border:SetPoint(\"TOPLEFT\", healthBar, \"TOPLEFT\", 0, 0)\n                healthBar.border:SetPoint(\"BOTTOMRIGHT\", healthBar, \"BOTTOMRIGHT\", 0, 0)\n            elseif envTable.IconAnchor == \"right\" then\n                healthBar.border:SetPoint(\"TOPRIGHT\", healthBar, \"TOPRIGHT\", 0, 0)\n                healthBar.border:SetPoint(\"BOTTOMLEFT\", healthBar, \"BOTTOMLEFT\", 0, 0) \n            end\n        end\n    end\n    if not unitFrame.castBar.borderChangeHooked then\n        hooksecurefunc(unitFrame.castBar, \"Hide\", function() envTable.UpdateBorder(unitFrame, false) end)\n        unitFrame.castBar.borderChangeHooked = true\n    end\nend",
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
						["spec"] = {
						},
						["race"] = {
						},
						["encounter_ids"] = {
						},
						["affix"] = {
						},
					},
					["HooksTemp"] = {
						["Nameplate Removed"] = "function(self, unitId, unitFrame, envTable)\n    envTable.UpdateBorder(unitFrame, false)\nend",
						["Cast Start"] = "function(self, unitId, unitFrame, envTable)\n    envTable.UpdateIconPosition(unitFrame)\n    envTable.UpdateBorder(unitFrame, true)\nend",
						["Cast Update"] = "function(self, unitId, unitFrame, envTable)\n    envTable.UpdateIconPosition(unitFrame)\nend",
						["Constructor"] = "function(self, unitId, unitFrame, envTable)\n    \n    envTable.ShowIcon = Plater.db.profile.castbar_icon_show\n    envTable.IconAnchor = \"left\"\n    envTable.IconSizeOffset = 0\n    \n    envTable.ShowShield = false\n    envTable.ShieldTexture = [[Interface\\GROUPFRAME\\UI-GROUP-MAINTANKICON]]\n    envTable.ShieldDesaturated = true\n    envTable.ShieldColor = {1, 1, 1 ,1}\n    envTable.ShieldSize = {10, 12}\n    \n    function envTable.UpdateIconPosition (unitFrame)\n        local castBar = unitFrame.castBar\n        local icon = castBar.Icon\n        local shield = castBar.BorderShield\n        \n        if (envTable.ShowIcon) then\n            icon:ClearAllPoints()\n            \n            if (envTable.IconAnchor == \"left\") then\n                icon:SetPoint (\"topright\", unitFrame.healthBar, \"topleft\", 0, envTable.IconSizeOffset)\n                icon:SetPoint (\"bottomright\", unitFrame.castBar, \"bottomleft\", 0, 0)    \n                \n            elseif (envTable.IconAnchor == \"right\") then\n                icon:SetPoint (\"topleft\", unitFrame.healthBar, \"topright\", 0, envTable.IconSizeOffset)\n                icon:SetPoint (\"bottomleft\", unitFrame.castBar, \"bottomright\", 0, 0)\n                \n            end\n            \n            icon:SetWidth (icon:GetHeight())\n            icon:Show()\n            \n        else\n            icon:Hide()\n            \n        end\n        \n        if (envTable.ShowShield and not castBar.canInterrupt) then\n            shield:Show()\n            shield:SetAlpha (1)\n            shield:SetTexCoord (0, 1, 0, 1)\n            shield:SetVertexColor (1, 1, 1, 1)\n            \n            shield:SetTexture (envTable.ShieldTexture)\n            shield:SetDesaturated (envTable.ShieldDesaturated)\n            \n            if (not envTable.ShieldDesaturated) then\n                shield:SetVertexColor (DetailsFramework:ParseColors (envTable.ShieldColor))\n            end\n            \n            shield:SetSize (unpack (envTable.ShieldSize))\n            \n            shield:ClearAllPoints()\n            shield:SetPoint (\"center\", castBar, \"left\", 0, 0)\n        else\n            shield:Hide()\n        end\n    end\n    \n    function envTable.UpdateBorder (unitFrame, casting)\n        local healthBar = unitFrame.healthBar\n        local castBar = unitFrame.castBar\n        if casting then\n            if envTable.ShowIcon and castBar.Icon:IsShown() then\n                if envTable.IconAnchor == \"left\" then\n                    healthBar.border:SetPoint(\"TOPLEFT\", castBar.Icon, \"TOPLEFT\", 0, 0)\n                    healthBar.border:SetPoint(\"BOTTOMRIGHT\", castBar, \"BOTTOMRIGHT\", 0, 0)\n                elseif envTable.IconAnchor == \"right\" then\n                    healthBar.border:SetPoint(\"TOPRIGHT\", castBar.Icon, \"TOPRIGHT\", 0, 0)\n                    healthBar.border:SetPoint(\"BOTTOMLEFT\", castBar, \"BOTTOMLEFT\", 0, 0) \n                end\n            else\n                if envTable.IconAnchor == \"left\" then\n                    healthBar.border:SetPoint(\"TOPLEFT\", healthBar, \"TOPLEFT\", 0, 0)\n                    healthBar.border:SetPoint(\"BOTTOMRIGHT\", castBar, \"BOTTOMRIGHT\", 0, 0)\n                elseif envTable.IconAnchor == \"right\" then\n                    healthBar.border:SetPoint(\"TOPRIGHT\", healthBar, \"TOPRIGHT\", 0, 0)\n                    healthBar.border:SetPoint(\"BOTTOMLEFT\", castBar, \"BOTTOMLEFT\", 0, 0) \n                end\n            end\n        else\n            if envTable.IconAnchor == \"left\" then\n                healthBar.border:SetPoint(\"TOPLEFT\", healthBar, \"TOPLEFT\", 0, 0)\n                healthBar.border:SetPoint(\"BOTTOMRIGHT\", healthBar, \"BOTTOMRIGHT\", 0, 0)\n            elseif envTable.IconAnchor == \"right\" then\n                healthBar.border:SetPoint(\"TOPRIGHT\", healthBar, \"TOPRIGHT\", 0, 0)\n                healthBar.border:SetPoint(\"BOTTOMLEFT\", healthBar, \"BOTTOMLEFT\", 0, 0) \n            end\n        end\n    end\n    if not unitFrame.castBar.borderChangeHooked then\n        hooksecurefunc(unitFrame.castBar, \"Hide\", function() envTable.UpdateBorder(unitFrame, false) end)\n        unitFrame.castBar.borderChangeHooked = true\n    end\nend",
					},
					["Time"] = 1659126814,
					["Icon"] = 136048,
					["PlaterCore"] = 1,
				}, -- [2]
			},
			["extra_icon_caster_outline"] = "OUTLINE",
			["auras_per_row_amount2"] = 6,
			["aura_width"] = 16,
			["health_statusbar_bgcolor"] = {
				0.058823529411765, -- [1]
				0.058823529411765, -- [2]
				0.058823529411765, -- [3]
				0.80000001192093, -- [4]
			},
			["quick_hide"] = true,
			["target_highlight_color"] = {
				nil, -- [1]
				1, -- [2]
			},
			["extra_icon_stack_outline"] = "OUTLINE",
			["click_space"] = {
				148, -- [1]
			},
			["castbar_target_font"] = "Expressway",
			["cast_statusbar_spark_texture"] = "Interface\\AddOns\\Plater\\images\\spark8",
			["aura_x_offset"] = 0,
			["ui_parent_scale_tune"] = 1.406249965948519,
			["health_statusbar_bgtexture"] = "Minimalist",
			["indicator_raidmark_anchor"] = {
				["x"] = 3,
			},
			["aura_show_enrage"] = true,
			["aura_tracker"] = {
				["buff_tracked"] = {
					["321402"] = true,
					["322773"] = true,
					["333241"] = true,
					["327416"] = true,
					["322433"] = true,
					["333737"] = true,
					["321754"] = true,
					["343470"] = true,
					["331510"] = true,
					["343558"] = true,
					["327808"] = true,
					["178658"] = true,
					["317936"] = true,
					["326892"] = true,
					["336451"] = true,
					["344739"] = true,
					["333227"] = true,
					["343502"] = true,
					["326450"] = true,
					["209859"] = true,
					["336499"] = true,
					["340880"] = true,
					["330545"] = true,
					["340873"] = true,
					["226510"] = true,
				},
				["debuff_banned"] = {
					["342938"] = true,
				},
				["buff_banned"] = {
					["206150"] = true,
					["333553"] = true,
					["61574"] = true,
					["61573"] = true,
				},
			},
			["extra_icon_caster_font"] = "Expressway",
			["cast_statusbar_color"] = {
				0.023529411764706, -- [1]
				1, -- [2]
				nil, -- [3]
				0.96000000089407, -- [4]
			},
			["update_throttle"] = 0.099999994039536,
			["bossmod_cooldown_text_size"] = 15,
			["patch_version"] = 19,
			["indicator_extra_raidmark"] = false,
			["indicator_raidmark_scale"] = 0.84999996423721,
			["extra_icon_timer_font"] = "Expressway",
			["target_highlight_alpha"] = 1,
			["target_shady_alpha"] = 1,
			["ghost_auras"] = {
				["auras"] = {
					["PRIEST"] = {
						[3] = {
							[589] = true,
							[34914] = true,
						},
					},
					["WARLOCK"] = {
						{
							[172] = true,
							[980] = true,
						}, -- [1]
					},
				},
			},
			["target_highlight_height"] = 12,
			["version"] = 13,
			["health_selection_overlay"] = "Minimalist",
			["use_ui_parent"] = true,
			["indicator_elite"] = false,
			["cast_statusbar_use_fade_effects"] = false,
			["indicator_spec"] = false,
			["cast_statusbar_color_interrupted"] = {
				0.30196078431373, -- [1]
				0.30196078431373, -- [2]
				0.30196078431373, -- [3]
			},
			["range_check_in_range_or_target_alpha"] = 1,
			["aura_timer_text_size"] = 10,
			["number_region_first_run"] = true,
			["script_data_trash"] = {},
			["health_cutoff"] = false,
			["castbar_target_anchor"] = {
				["side"] = 4,
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
				["Unit - Show Energy"] = 11,
				["Spiteful Affix"] = 3,
				["Relics 9.2 M Dungeons"] = 2,
				["Unit - Main Target"] = 11,
				["Aura - Blink Time Left"] = 13,
				["Unit - Important"] = 11,
				["Countdown"] = 11,
				["Unit - Health Markers"] = 12,
				["Cast - Frontal Cone"] = 11,
				["Fixate"] = 11,
				["Cast - Tank Interrupt"] = 12,
				["Auto Set Skull"] = 11,
				["Cast - Alert + Timer [P]"] = 2,
				["Fixate On You"] = 11,
			},
			["cast_statusbar_texture"] = "Minimalist",
			["indicator_faction"] = false,
			["first_run3"] = true,
			["indicator_pet"] = false,
			["aura_timer_text_font"] = "Expressway",
			["health_cutoff_upper"] = false,
		}

		-- Profile key
		PlaterDB["profileKeys"][E.mynameRealm] = name

	end

	-- Wipe captured_casts, captured_spells and npc_cache
	L1UI:Cleanup_Cache('plater')

	L1UI:Print(L["Plater profile has been set."])
end
