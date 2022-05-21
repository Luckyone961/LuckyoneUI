local L1UI, E, L, V, P, G = unpack(select(2, ...))

local IsAddOnLoaded = IsAddOnLoaded

-- Plater Profile
function L1UI:Setup_Plater()
	if not IsAddOnLoaded('Plater') then return end

	-- Profile Names
	local Retail, TBC, Classic = "Luckyone", "Luckyone TBC", "Luckyone Classic"

	if E.Retail then

		-- Create profile if it doesn't exist yet
		PlaterDB["profiles"][Retail] = PlaterDB["profiles"][Retail] or {}

		-- Profile db
		PlaterDB["profiles"][Retail] = {
			["script_data"] = {
				{
					["ConstructorCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    --settings\n    envTable.NameplateSizeOffset = scriptTable.config.castBarHeight\n    envTable.ShowArrow = scriptTable.config.showArrow\n    envTable.ArrowAlpha = scriptTable.config.arrowAlpha\n    envTable.HealthBarColor = scriptTable.config.healthBarColor\n    \n    --creates the spark to show the cast progress inside the health bar\n    envTable.overlaySpark = envTable.overlaySpark or Plater:CreateImage (unitFrame.healthBar)\n    envTable.overlaySpark:SetBlendMode (\"ADD\")\n    envTable.overlaySpark.width = 16\n    envTable.overlaySpark.height = 36\n    envTable.overlaySpark.alpha = .9\n    envTable.overlaySpark.texture = [[Interface\\AddOns\\Plater\\images\\spark3]]\n    \n    envTable.topArrow = envTable.topArrow or Plater:CreateImage (unitFrame.healthBar)\n    envTable.topArrow:SetBlendMode (\"ADD\")\n    envTable.topArrow.width = scriptTable.config.arrowWidth\n    envTable.topArrow.height = scriptTable.config.arrowHeight\n    envTable.topArrow.alpha = envTable.ArrowAlpha\n    envTable.topArrow.texture = [[Interface\\BUTTONS\\Arrow-Down-Up]]\n    \n    --scale animation\n    envTable.smallScaleAnimation = envTable.smallScaleAnimation or Plater:CreateAnimationHub (unitFrame.healthBar)\n    Plater:CreateAnimation (envTable.smallScaleAnimation, \"SCALE\", 1, 0.075, 1, 1, 1.08, 1.08)\n    Plater:CreateAnimation (envTable.smallScaleAnimation, \"SCALE\", 2, 0.075, 1, 1, 0.95, 0.95)    \n    --envTable.smallScaleAnimation:Play() --envTable.smallScaleAnimation:Stop()\n    \nend\n\n\n\n\n\n\n\n",
					["OnHideCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    Plater.StopDotAnimation(unitFrame.healthBar, envTable.dotAnimation)\n    \n    envTable.overlaySpark:Hide()\n    envTable.topArrow:Hide()\n    \n    Plater.RefreshNameplateColor (unitFrame)\n    \n    envTable.smallScaleAnimation:Stop()\n    \n    --increase the nameplate size\n    local nameplateHeight = Plater.db.profile.plate_config.enemynpc.health_incombat [2]\n    unitFrame.healthBar:SetHeight (nameplateHeight)\nend\n\n\n",
					["OptionsValues"] = {
					},
					["Temp_OnShowCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    envTable.overlaySpark:Show()\n    \n    if (envTable.ShowArrow) then\n        envTable.topArrow:Show()\n    end\n    \n    Plater.FlashNameplateBorder (unitFrame, 0.05)   \n    Plater.FlashNameplateBody (unitFrame, \"\", 0.075)\n    \n    envTable.smallScaleAnimation:Play()\n    \n    --increase the nameplate size\n    local nameplateHeight = Plater.db.profile.plate_config.enemynpc.health_incombat [2]\n    unitFrame.healthBar:SetHeight (nameplateHeight + envTable.NameplateSizeOffset)\n    \n    envTable.overlaySpark.height = nameplateHeight + 5\n    \n    envTable.dotAnimation = Plater.PlayDotAnimation(unitFrame.healthBar, 2, scriptTable.config.dotColor, scriptTable.config.xOffset, scriptTable.config.yOffset)\n    \n    self:SetStatusBarColor (Plater:ParseColors (scriptTable.config.castBarColor))\nend\n\n\n\n\n\n\n",
					["ScriptType"] = 2,
					["UpdateCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    --update the percent\n    envTable.overlaySpark:SetPoint (\"left\", unitFrame.healthBar:GetWidth() * (envTable._CastPercent / 100)-9, 0)\n    \n    envTable.topArrow:SetPoint (\"bottomleft\", unitFrame.healthBar, \"topleft\", unitFrame.healthBar:GetWidth() * (envTable._CastPercent / 100) - 4, 2 )\n    \n    --forces the script to update on a 60Hz base\n    self.ThrottleUpdate = 0\n    \n\nend\n\n\n",
					["Time"] = 1647028678,
					["Temp_OnHideCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    Plater.StopDotAnimation(unitFrame.healthBar, envTable.dotAnimation)\n    \n    envTable.overlaySpark:Hide()\n    envTable.topArrow:Hide()\n    \n    Plater.RefreshNameplateColor (unitFrame)\n    \n    envTable.smallScaleAnimation:Stop()\n    \n    --increase the nameplate size\n    local nameplateHeight = Plater.db.profile.plate_config.enemynpc.health_incombat [2]\n    unitFrame.healthBar:SetHeight (nameplateHeight)\nend\n\n\n",
					["url"] = "",
					["Icon"] = 2175503,
					["Temp_ConstructorCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    --settings\n    envTable.NameplateSizeOffset = scriptTable.config.castBarHeight\n    envTable.ShowArrow = scriptTable.config.showArrow\n    envTable.ArrowAlpha = scriptTable.config.arrowAlpha\n    envTable.HealthBarColor = scriptTable.config.healthBarColor\n    \n    --creates the spark to show the cast progress inside the health bar\n    envTable.overlaySpark = envTable.overlaySpark or Plater:CreateImage (unitFrame.healthBar)\n    envTable.overlaySpark:SetBlendMode (\"ADD\")\n    envTable.overlaySpark.width = 16\n    envTable.overlaySpark.height = 36\n    envTable.overlaySpark.alpha = .9\n    envTable.overlaySpark.texture = [[Interface\\AddOns\\Plater\\images\\spark3]]\n    \n    envTable.topArrow = envTable.topArrow or Plater:CreateImage (unitFrame.healthBar)\n    envTable.topArrow:SetBlendMode (\"ADD\")\n    envTable.topArrow.width = scriptTable.config.arrowWidth\n    envTable.topArrow.height = scriptTable.config.arrowHeight\n    envTable.topArrow.alpha = envTable.ArrowAlpha\n    envTable.topArrow.texture = [[Interface\\BUTTONS\\Arrow-Down-Up]]\n    \n    --scale animation\n    envTable.smallScaleAnimation = envTable.smallScaleAnimation or Plater:CreateAnimationHub (unitFrame.healthBar)\n    Plater:CreateAnimation (envTable.smallScaleAnimation, \"SCALE\", 1, 0.075, 1, 1, 1.08, 1.08)\n    Plater:CreateAnimation (envTable.smallScaleAnimation, \"SCALE\", 2, 0.075, 1, 1, 0.95, 0.95)    \n    --envTable.smallScaleAnimation:Play() --envTable.smallScaleAnimation:Stop()\n    \nend\n\n\n\n\n\n\n\n",
					["Enabled"] = true,
					["Revision"] = 466,
					["semver"] = "",
					["Temp_Initialization"] = "function (scriptTable)\n    --insert code here\n    \nend\n\n\n",
					["Temp_UpdateCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    --update the percent\n    envTable.overlaySpark:SetPoint (\"left\", unitFrame.healthBar:GetWidth() * (envTable._CastPercent / 100)-9, 0)\n    \n    envTable.topArrow:SetPoint (\"bottomleft\", unitFrame.healthBar, \"topleft\", unitFrame.healthBar:GetWidth() * (envTable._CastPercent / 100) - 4, 2 )\n    \n    --forces the script to update on a 60Hz base\n    self.ThrottleUpdate = 0\n    \n\nend\n\n\n",
					["Author"] = "Bombad�o-Azralon",
					["Initialization"] = "function (scriptTable)\n    --insert code here\n    \nend\n\n\n",
					["OnShowCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    envTable.overlaySpark:Show()\n    \n    if (envTable.ShowArrow) then\n        envTable.topArrow:Show()\n    end\n    \n    Plater.FlashNameplateBorder (unitFrame, 0.05)   \n    Plater.FlashNameplateBody (unitFrame, \"\", 0.075)\n    \n    envTable.smallScaleAnimation:Play()\n    \n    --increase the nameplate size\n    local nameplateHeight = Plater.db.profile.plate_config.enemynpc.health_incombat [2]\n    unitFrame.healthBar:SetHeight (nameplateHeight + envTable.NameplateSizeOffset)\n    \n    envTable.overlaySpark.height = nameplateHeight + 5\n    \n    envTable.dotAnimation = Plater.PlayDotAnimation(unitFrame.healthBar, 2, scriptTable.config.dotColor, scriptTable.config.xOffset, scriptTable.config.yOffset)\n    \n    self:SetStatusBarColor (Plater:ParseColors (scriptTable.config.castBarColor))\nend\n\n\n\n\n\n\n",
					["SpellIds"] = {
						240446, -- [1]
					},
					["Prio"] = 99,
					["Name"] = "Explosion Affix M+ [Plater]",
					["PlaterCore"] = 1,
					["version"] = -1,
					["Desc"] = "Apply several animations when the explosion orb cast starts on a Mythic Dungeon with Explosion Affix",
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
							["Fraction"] = false,
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
							["Name"] = "Cast Bar Height Mod",
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
							["Fraction"] = true,
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
							["Name"] = "Arrow Alpha",
						}, -- [9]
						{
							["Type"] = 2,
							["Max"] = 12,
							["Desc"] = "Arrow Width.",
							["Min"] = 4,
							["Key"] = "arrowWidth",
							["Value"] = 8,
							["Fraction"] = false,
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
							["Name"] = "Arrow Width",
						}, -- [10]
						{
							["Type"] = 2,
							["Max"] = 12,
							["Desc"] = "Arrow Height.",
							["Min"] = 4,
							["Key"] = "arrowHeight",
							["Value"] = 8,
							["Fraction"] = false,
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
							["Name"] = "Arrow Height",
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
							["Fraction"] = false,
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
							["Name"] = "Dot X Offset",
						}, -- [15]
						{
							["Type"] = 2,
							["Max"] = 10,
							["Desc"] = "Dot Y Offset",
							["Min"] = -10,
							["Key"] = "yOffset",
							["Value"] = 3,
							["Fraction"] = false,
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
							["Name"] = "Dot Y Offset",
						}, -- [16]
					},
					["NpcNames"] = {
					},
				}, -- [1]
				{
					["ConstructorCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.FixateTarget = Plater:CreateLabel (unitFrame);\n    envTable.FixateTarget:SetPoint (\"bottom\", unitFrame.BuffFrame, \"top\", 0, 10);    \n    \n    envTable.FixateIcon = Plater:CreateImage (unitFrame, 236188, 16, 16, \"overlay\");\n    envTable.FixateIcon:SetPoint (\"bottom\", envTable.FixateTarget, \"top\", 0, 4);    \n    \n    envTable.FixateTarget:Hide()\n    envTable.FixateIcon:Hide()\nend\n\n--165560 = Gormling Larva - MTS\n\n\n\n\n\n\n",
					["OnHideCode"] = "function (self, unitId, unitFrame, envTable)\n    envTable.FixateTarget:Hide()\n    envTable.FixateIcon:Hide()\nend\n\n\n",
					["OptionsValues"] = {
					},
					["Temp_OnShowCode"] = "function (self, unitId, unitFrame, envTable)\n    \nend\n\n\n",
					["ScriptType"] = 3,
					["UpdateCode"] = "function (self, unitId, unitFrame, envTable)\n    local targetName = UnitName (unitId .. \"target\");\n    if (targetName) then\n        local _, class = UnitClass (unitId .. \"target\");\n        targetName = Plater.SetTextColorByClass (unitId .. \"target\", targetName);\n        envTable.FixateTarget.text = targetName;\n        \n        envTable.FixateTarget:Show();\n        envTable.FixateIcon:Show();\n    end    \nend\n\n\n",
					["Time"] = 1647029360,
					["Temp_OnHideCode"] = "function (self, unitId, unitFrame, envTable)\n    envTable.FixateTarget:Hide()\n    envTable.FixateIcon:Hide()\nend\n\n\n",
					["url"] = "",
					["Icon"] = 1029718,
					["Temp_ConstructorCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.FixateTarget = Plater:CreateLabel (unitFrame);\n    envTable.FixateTarget:SetPoint (\"bottom\", unitFrame.BuffFrame, \"top\", 0, 10);    \n    \n    envTable.FixateIcon = Plater:CreateImage (unitFrame, 236188, 16, 16, \"overlay\");\n    envTable.FixateIcon:SetPoint (\"bottom\", envTable.FixateTarget, \"top\", 0, 4);    \n    \n    envTable.FixateTarget:Hide()\n    envTable.FixateIcon:Hide()\nend\n\n--165560 = Gormling Larva - MTS\n\n\n\n\n\n\n",
					["Enabled"] = true,
					["Revision"] = 271,
					["semver"] = "",
					["Temp_Initialization"] = "function (scriptTable)\n    --insert code here\n    \nend\n\n\n\n\n\n\n",
					["Temp_UpdateCode"] = "function (self, unitId, unitFrame, envTable)\n    local targetName = UnitName (unitId .. \"target\");\n    if (targetName) then\n        local _, class = UnitClass (unitId .. \"target\");\n        targetName = Plater.SetTextColorByClass (unitId .. \"target\", targetName);\n        envTable.FixateTarget.text = targetName;\n        \n        envTable.FixateTarget:Show();\n        envTable.FixateIcon:Show();\n    end    \nend\n\n\n",
					["Author"] = "Celian-Sylvanas",
					["Initialization"] = "function (scriptTable)\n    --insert code here\n    \nend\n\n\n\n\n\n\n",
					["OnShowCode"] = "function (self, unitId, unitFrame, envTable)\n    \nend\n\n\n",
					["SpellIds"] = {
					},
					["Prio"] = 99,
					["Name"] = "Fixate [Plater]",
					["PlaterCore"] = 1,
					["version"] = -1,
					["Desc"] = "Show above the nameplate who is the player fixated",
					["Options"] = {
					},
					["NpcNames"] = {
						"165560", -- [1]
					},
				}, -- [2]
				{
					["ConstructorCode"] = "--todo: add npc ids for multilanguage support\n\nfunction (self, unitId, unitFrame, envTable)\n    \n    --settings\n    envTable.TextAboveNameplate = \"** On You **\"\n    envTable.NameplateColor = \"green\"\n    \n    --label to show the text above the nameplate\n    envTable.FixateTarget = Plater:CreateLabel (unitFrame);\n    envTable.FixateTarget:SetPoint (\"bottom\", unitFrame.healthBar, \"top\", 0, 30);\n    \n    --the spell casted by the npc in the trigger list needs to be in the list below as well\n    local spellList = {\n        [321891] = \"Freeze Tag Fixation\", --Illusionary Vulpin - MTS\n        \n    }\n    \n    --build the list with localized spell names\n    envTable.FixateDebuffs = {}\n    for spellID, enUSSpellName in pairs (spellList) do\n        local localizedSpellName = GetSpellInfo (spellID)\n        envTable.FixateDebuffs [localizedSpellName or enUSSpellName] = true\n    end\n    \n    --debug - smuggled crawg\n    envTable.FixateDebuffs [\"Jagged Maw\"] = true\n    \nend\n\n--[=[\nNpcIDs:\n136461: Spawn of G'huun (mythic uldir G'huun)\n\n--]=]\n\n\n\n\n",
					["OnHideCode"] = "function (self, unitId, unitFrame, envTable)\n    envTable.FixateTarget:SetText (\"\")\n    envTable.FixateTarget:Hide()\n    \n    envTable.IsFixated = false\n    \n    Plater.RefreshNameplateColor (unitFrame)\nend\n\n\n",
					["OptionsValues"] = {
					},
					["Temp_OnShowCode"] = "function (self, unitId, unitFrame, envTable)\n    \nend\n\n\n",
					["ScriptType"] = 3,
					["UpdateCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --swap this to true when it is fixated\n    local isFixated = false\n    \n    --check the debuffs the player has and see if any of these debuffs has been placed by this unit\n    for debuffId = 1, 40 do\n        local name, texture, count, debuffType, duration, expirationTime, caster = UnitDebuff (\"player\", debuffId)\n        \n        --cancel the loop if there's no more debuffs on the player\n        if (not name) then \n            break \n        end\n        \n        --check if the owner of the debuff is this unit\n        if (envTable.FixateDebuffs [name] and caster and UnitIsUnit (caster, unitId)) then\n            --the debuff the player has, has been placed by this unit, set the name above the unit name\n            envTable.FixateTarget:SetText (envTable.TextAboveNameplate)\n            envTable.FixateTarget:Show()\n            Plater.SetNameplateColor (unitFrame,  envTable.NameplateColor)\n            isFixated = true\n            \n            if (not envTable.IsFixated) then\n                envTable.IsFixated = true\n                Plater.FlashNameplateBody (unitFrame, \"fixate\", .2)\n            end\n        end\n        \n    end\n    \n    --check if the nameplate color is changed but isn't fixated any more\n    if (not isFixated and envTable.IsFixated) then\n        --refresh the nameplate color\n        Plater.RefreshNameplateColor (unitFrame)\n        --reset the text\n        envTable.FixateTarget:SetText (\"\")\n        \n        envTable.IsFixated = false\n    end\n    \nend\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n",
					["Time"] = 1647029351,
					["url"] = "",
					["Icon"] = 841383,
					["Temp_OnHideCode"] = "function (self, unitId, unitFrame, envTable)\n    envTable.FixateTarget:SetText (\"\")\n    envTable.FixateTarget:Hide()\n    \n    envTable.IsFixated = false\n    \n    Plater.RefreshNameplateColor (unitFrame)\nend\n\n\n",
					["Revision"] = 268,
					["semver"] = "",
					["Enabled"] = true,
					["Temp_ConstructorCode"] = "--todo: add npc ids for multilanguage support\n\nfunction (self, unitId, unitFrame, envTable)\n    \n    --settings\n    envTable.TextAboveNameplate = \"** On You **\"\n    envTable.NameplateColor = \"green\"\n    \n    --label to show the text above the nameplate\n    envTable.FixateTarget = Plater:CreateLabel (unitFrame);\n    envTable.FixateTarget:SetPoint (\"bottom\", unitFrame.healthBar, \"top\", 0, 30);\n    \n    --the spell casted by the npc in the trigger list needs to be in the list below as well\n    local spellList = {\n        [321891] = \"Freeze Tag Fixation\", --Illusionary Vulpin - MTS\n        \n    }\n    \n    --build the list with localized spell names\n    envTable.FixateDebuffs = {}\n    for spellID, enUSSpellName in pairs (spellList) do\n        local localizedSpellName = GetSpellInfo (spellID)\n        envTable.FixateDebuffs [localizedSpellName or enUSSpellName] = true\n    end\n    \n    --debug - smuggled crawg\n    envTable.FixateDebuffs [\"Jagged Maw\"] = true\n    \nend\n\n--[=[\nNpcIDs:\n136461: Spawn of G'huun (mythic uldir G'huun)\n\n--]=]\n\n\n\n\n",
					["Author"] = "Tecno-Azralon",
					["Temp_UpdateCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --swap this to true when it is fixated\n    local isFixated = false\n    \n    --check the debuffs the player has and see if any of these debuffs has been placed by this unit\n    for debuffId = 1, 40 do\n        local name, texture, count, debuffType, duration, expirationTime, caster = UnitDebuff (\"player\", debuffId)\n        \n        --cancel the loop if there's no more debuffs on the player\n        if (not name) then \n            break \n        end\n        \n        --check if the owner of the debuff is this unit\n        if (envTable.FixateDebuffs [name] and caster and UnitIsUnit (caster, unitId)) then\n            --the debuff the player has, has been placed by this unit, set the name above the unit name\n            envTable.FixateTarget:SetText (envTable.TextAboveNameplate)\n            envTable.FixateTarget:Show()\n            Plater.SetNameplateColor (unitFrame,  envTable.NameplateColor)\n            isFixated = true\n            \n            if (not envTable.IsFixated) then\n                envTable.IsFixated = true\n                Plater.FlashNameplateBody (unitFrame, \"fixate\", .2)\n            end\n        end\n        \n    end\n    \n    --check if the nameplate color is changed but isn't fixated any more\n    if (not isFixated and envTable.IsFixated) then\n        --refresh the nameplate color\n        Plater.RefreshNameplateColor (unitFrame)\n        --reset the text\n        envTable.FixateTarget:SetText (\"\")\n        \n        envTable.IsFixated = false\n    end\n    \nend\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n",
					["Desc"] = "When an enemy places a debuff and starts to chase you. This script changes the nameplate color and place your name above the nameplate as well.",
					["version"] = -1,
					["Prio"] = 99,
					["Name"] = "Fixate On You [Plater]",
					["PlaterCore"] = 1,
					["SpellIds"] = {
						"spawn of g'huun", -- [1]
						"smuggled crawg", -- [2]
						"sergeant bainbridge", -- [3]
						"blacktooth scrapper", -- [4]
						"irontide grenadier", -- [5]
						"feral bloodswarmer", -- [6]
						"earthrager", -- [7]
						"crawler mine", -- [8]
						"rezan", -- [9]
					},
					["Options"] = {
					},
					["OnShowCode"] = "function (self, unitId, unitFrame, envTable)\n    \nend\n\n\n",
					["NpcNames"] = {
					},
				}, -- [3]
			},
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
				{
					["OptionsValues"] = {
					},
					["HooksTemp"] = {
					},
					["UID"] = "0x622bc8122a7529d",
					["Hooks"] = {
						["Initialization"] = "function(modTable)\n    \n    local default = \"#00fbff\"\n    local affix = \"#C69B6D\"\n    \n    modTable.NpcColors = {\n        -- De Other Side [DOS]\n        [164857] = default, -- Spriggan Mendbender\n        [167965] = default, -- Lubricator\n        [168934] = default, -- Enraged Spirit\n        [168942] = default, -- Death Speaker\n        [169905] = default, -- Risen Warlord\n        [170572] = default, -- Atal'ai Hoodoo Hexxer\n        [171341] = default, -- Bladebeak Hatchling\n        [171343] = default, -- Bladebeak Matriarch\n        -- Halls of Atonement [HOA]\n        [164562] = default, -- Depraved Houndmaster\n        [165529] = default, -- Depraved Collector\n        [167612] = default, -- Stoneborn Reaver\n        [167892] = default, -- Tormented Soul\n        -- Mists of Tirna Scithe [MISTS]\n        [164804] = default, -- Droman Oulfarran\n        [164921] = default, -- Drust Harvester\n        [166299] = default, -- Mistveil Tender\n        [167111] = default, -- Spinemaw Staghorn\n        -- The Necrotic Wake [NW]\n        [163618] = default, -- Zolramus Necromancer\n        [165824] = default, -- Nar'zudah\n        [165872] = default, -- Flesh Crafter\n        [166302] = default, -- Corpse Harvester\n        [173016] = default, -- Corpse Collector\n        -- Plaguefall [PF]\n        [163882] = default, -- Decaying Flesh Giant\n        [163894] = default, -- Blighted Spinebreaker\n        [164737] = default, -- Brood Ambusher\n        [168572] = default, -- Fungi Stormer\n        [168627] = default, -- Plaguebinder\n        [169861] = default, -- Ickor Bileflesh\n        -- Sanguine Depths [SD]\n        [162038] = default, -- Regal Mistdancer\n        [162040] = default, -- Grand Overseer\n        [162057] = default, -- Chamber Sentinel\n        [171376] = default, -- Head Custodian Javlin\n        [171799] = default, -- Depths Warden\n        -- Spires of Ascension [SOA]\n        [163459] = default, -- Forsworn Mender\n        [163520] = default, -- Forsworn Squad-Leader\n        [168318] = default, -- Forsworn Goliath\n        [168681] = default, -- Forsworn Helion\n        -- Theater of Pain [TOP]\n        [164451] = default, -- Dessia the Decapitator\n        [160495] = default, -- Maniacal Soulbinder\n        [164506] = default, -- Ancient Captain\n        [170850] = default, -- Raging Bloodhorn\n        [174210] = default, -- Blighted Sludge-Spewer\n        -- Tazavesh [TZ]\n        [178141] = default, -- Murkbrine Scalebinder\n        [179733] = default, -- Invigorating Fish Stick\n        [180431] = default, -- Focused Ritualist\n        [180433] = default, -- Wandering Pulsar\n        -- Season 3 [Encrypted]\n        [184908] = affix, -- Vy Interceptor\n        [184910] = affix, -- Wo Drifter\n        [184911] = affix, -- Urh Dismantler\n        [185680] = affix, -- Vy Relic\n        [185683] = affix, -- Wo Relic\n        [185685] = affix, -- Urh Relic\n    }\n    \n    function modTable.UpdateColor(unitFrame, envTable)\n        if not unitFrame or unitFrame.IsNpcWithoutHealthbar or unitFrame.IsFriendlyPlayerWithoutHealthbar then return end\n        \n        -- Get color from modTable.NpcColors\n        local color = modTable.NpcColors [unitFrame.namePlateNpcId]\n        -- Set color from modTable.NpcColors\n        if (color) then\n            Plater.SetNameplateColor(unitFrame, color)\n        end\n    end\nend",
						["Nameplate Updated"] = "function (self, unitId, unitFrame, envTable, modTable)\n    modTable.UpdateColor (unitFrame, envTable)\nend",
					},
					["Time"] = 1647036965,
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
					["Icon"] = 4067928,
					["Enabled"] = true,
					["Revision"] = 25,
					["Options"] = {
					},
					["Author"] = "Luckyone-Laughing Skull",
					["Desc"] = "",
					["Prio"] = 1,
					["Name"] = "LuckyoneUI - Colors",
					["PlaterCore"] = 1,
					["LastHookEdited"] = "Nameplate Updated",
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

		-- Profile Key
		PlaterDB["profileKeys"][E.mynameRealm] = Retail

	elseif E.TBC then

		-- Create profile if it doesn't exist yet
		PlaterDB["profiles"][TBC] = PlaterDB["profiles"][TBC] or {}

		-- Profile db
		PlaterDB["profiles"][TBC] = {
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

		-- Profile Key
		PlaterDB["profileKeys"][E.mynameRealm] = TBC

	elseif E.Classic then

		-- Create profile if it doesn't exist yet
		PlaterDB["profiles"][Classic] = PlaterDB["profiles"][Classic] or {}

		PlaterDB["profiles"][Classic] = {
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

		-- Profile Key
		PlaterDB["profileKeys"][E.mynameRealm] = Classic

	end

	L1UI:Print(L["Plater profile has been set."])
end
