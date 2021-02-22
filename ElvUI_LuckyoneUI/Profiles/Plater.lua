local L1UI, E, L, V, P, G = unpack(select(2, ...))

--[[
	Copy Paste stuff
	[E.mynameRealm] = "Luckyone",
]]

-- Plater profile setup
function L1UI:GetPlaterProfile()

	PlaterDB = {
		["profileKeys"] = {
			[E.mynameRealm] = "Luckyone",
		},
		["profiles"] = {
			["Luckyone"] = {
				["script_data"] = {
					{
						["ConstructorCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    --settings (you may need /reload if some configs isn't applied immediately)    \n    --change the nameplate color to this if allowed\n    envTable.CanChangeNameplateColor = scriptTable.config.changeNameplateColor --\n    envTable.NameplateColor = scriptTable.config.nameplateColor\n    envTable.NameplateSizeOffset = scriptTable.config.nameplateSizeOffset --\n    \n    unitFrame.UnitImportantSkullTexture = unitFrame.UnitImportantSkullTexture or unitFrame:CreateTexture(nil, \"background\")\n    \n    unitFrame.UnitImportantSkullTexture:SetTexture([[Interface/AddOns/Plater/media/skullbones_128]])\n    unitFrame.UnitImportantSkullTexture:SetPoint(\"center\", unitFrame.healthBar, \"center\", 0, -5)\n    \n    unitFrame.UnitImportantSkullTexture:SetVertexColor(Plater:ParseColors(scriptTable.config.skullColor))\n    unitFrame.UnitImportantSkullTexture:SetAlpha(scriptTable.config.skullAlpha)\n    unitFrame.UnitImportantSkullTexture:SetScale(scriptTable.config.skullScale)\n    \n    unitFrame.UnitImportantSkullTexture:Hide()\nend\n\n--[=[\n\n154564 - debug\n\nUsing spellIDs for multi-language support\n\n164362 - smily morsel - plaguefall\n168882 - fleeting manifestation - sanguine depths\n170234 - oppressive banner - theater of pain\n168988 - overgrowth - Mists of Tirna Scithe\n170452 - essesnce orb - torghast\n\n\n--]=]",
						["OnHideCode"] = "function (self, unitId, unitFrame, envTable)\n    Plater.StopDotAnimation(unitFrame.healthBar, envTable.dotAnimation)   \n    \n    --restore the nameplate size\n    local nameplateHeight = Plater.db.profile.plate_config.enemynpc.health_incombat [2]\n    unitFrame.healthBar:SetHeight (nameplateHeight)    \n    \n    unitFrame.UnitImportantSkullTexture:Hide()\nend\n\n\n",
						["OptionsValues"] = {
						},
						["Temp_OnShowCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    if (envTable.dotAnimation) then\n        Plater.StopDotAnimation(unitFrame.healthBar, envTable.dotAnimation)\n    end\n    \n    envTable.dotAnimation = Plater.PlayDotAnimation(unitFrame.healthBar, 2, scriptTable.config.dotsColor, 3, 4) \n    \n    --increase the nameplate size\n    local nameplateHeight = Plater.db.profile.plate_config.enemynpc.health_incombat [2]\n    unitFrame.healthBar:SetHeight (nameplateHeight + envTable.NameplateSizeOffset)\n    \n    unitFrame.UnitImportantSkullTexture:Show()\nend\n\n\n\n\n",
						["ScriptType"] = 3,
						["UpdateCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --check if can change the nameplate color\n    if (envTable.CanChangeNameplateColor) then\n        Plater.SetNameplateColor (unitFrame, envTable.NameplateColor)\n    end\n    \nend\n\n\n\n\n",
						["Time"] = 1612568197,
						["NpcNames"] = {
							"164362", -- [1]
							"168882", -- [2]
							"168988", -- [3]
							"170234", -- [4]
							"165905", -- [5]
							"170452", -- [6]
						},
						["url"] = "",
						["Icon"] = "Interface\\AddOns\\Plater\\media\\skullbones_64",
						["Options"] = {
							{
								["Type"] = 6,
								["Name"] = "Blank Space",
								["Value"] = 0,
								["Key"] = "option4",
								["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
								["Desc"] = "",
							}, -- [1]
							{
								["Type"] = 5,
								["Name"] = "Option 6",
								["Value"] = "Enter the npc name or npcId in the \"Add Trigger\" box and hit \"Add\".",
								["Key"] = "option6",
								["Icon"] = "Interface\\AddOns\\Plater\\images\\option_label",
								["Desc"] = "",
							}, -- [2]
							{
								["Type"] = 6,
								["Key"] = "option4",
								["Value"] = 0,
								["Name"] = "Blank Space",
								["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
								["Desc"] = "",
							}, -- [3]
							{
								["Type"] = 4,
								["Name"] = "Change Nameplate Color",
								["Value"] = true,
								["Key"] = "changeNameplateColor",
								["Icon"] = "Interface\\AddOns\\Plater\\images\\option_bool",
								["Desc"] = "change to true to change the color",
							}, -- [4]
							{
								["Type"] = 1,
								["Name"] = "Nameplate Color",
								["Value"] = {
									1, -- [1]
									0, -- [2]
									0.5254901960784314, -- [3]
									1, -- [4]
								},
								["Key"] = "nameplateColor",
								["Icon"] = "Interface\\AddOns\\Plater\\images\\option_color",
								["Desc"] = "",
							}, -- [5]
							{
								["Type"] = 2,
								["Max"] = 6,
								["Desc"] = "increase the nameplate height by this value",
								["Min"] = 0,
								["Key"] = "nameplateSizeOffset",
								["Value"] = 3,
								["Fraction"] = false,
								["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
								["Name"] = "Nameplate Size Offset",
							}, -- [6]
							{
								["Type"] = 6,
								["Key"] = "option4",
								["Value"] = 0,
								["Name"] = "Blank Space",
								["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
								["Desc"] = "",
							}, -- [7]
							{
								["Type"] = 1,
								["Name"] = "Dot Color",
								["Value"] = {
									1, -- [1]
									0.7137254901960784, -- [2]
									0, -- [3]
									1, -- [4]
								},
								["Key"] = "dotsColor",
								["Icon"] = "Interface\\AddOns\\Plater\\images\\option_color",
								["Desc"] = "",
							}, -- [8]
							{
								["Type"] = 6,
								["Name"] = "Blank Space",
								["Value"] = 0,
								["Key"] = "option4",
								["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
								["Desc"] = "",
							}, -- [9]
							{
								["Type"] = 5,
								["Name"] = "Skull Texture",
								["Value"] = "Skull Texture",
								["Key"] = "option10",
								["Icon"] = "Interface\\AddOns\\Plater\\images\\option_label",
								["Desc"] = "",
							}, -- [10]
							{
								["Type"] = 1,
								["Name"] = "Skull Color",
								["Value"] = {
									1, -- [1]
									0.4627450980392157, -- [2]
									0, -- [3]
									1, -- [4]
								},
								["Key"] = "skullColor",
								["Icon"] = "Interface\\AddOns\\Plater\\images\\option_color",
								["Desc"] = "",
							}, -- [11]
							{
								["Type"] = 2,
								["Max"] = 1,
								["Desc"] = "",
								["Min"] = 0,
								["Key"] = "skullAlpha",
								["Value"] = 0.2,
								["Name"] = "Alpha",
								["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
								["Fraction"] = true,
							}, -- [12]
							{
								["Type"] = 2,
								["Max"] = 2,
								["Desc"] = "",
								["Min"] = 0.4,
								["Fraction"] = true,
								["Value"] = 0.6,
								["Key"] = "skullScale",
								["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
								["Name"] = "Scale",
							}, -- [13]
						},
						["Enabled"] = true,
						["Revision"] = 358,
						["semver"] = "",
						["version"] = -1,
						["Temp_UpdateCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --check if can change the nameplate color\n    if (envTable.CanChangeNameplateColor) then\n        Plater.SetNameplateColor (unitFrame, envTable.NameplateColor)\n    end\n    \nend\n\n\n\n\n",
						["Author"] = "Izimode-Azralon",
						["Initialization"] = "function (scriptTable)\n    --insert code here\n    \nend\n\n\n",
						["Desc"] = "Highlight a nameplate of an important Add. Add the unit name or NpcID into the trigger box to add more.",
						["SpellIds"] = {
						},
						["Prio"] = 99,
						["Name"] = "Unit - Important [Plater]",
						["PlaterCore"] = 1,
						["OnShowCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    if (envTable.dotAnimation) then\n        Plater.StopDotAnimation(unitFrame.healthBar, envTable.dotAnimation)\n    end\n    \n    envTable.dotAnimation = Plater.PlayDotAnimation(unitFrame.healthBar, 2, scriptTable.config.dotsColor, 3, 4) \n    \n    --increase the nameplate size\n    local nameplateHeight = Plater.db.profile.plate_config.enemynpc.health_incombat [2]\n    unitFrame.healthBar:SetHeight (nameplateHeight + envTable.NameplateSizeOffset)\n    \n    unitFrame.UnitImportantSkullTexture:Show()\nend\n\n\n\n\n",
						["Temp_ConstructorCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    --settings (you may need /reload if some configs isn't applied immediately)    \n    --change the nameplate color to this if allowed\n    envTable.CanChangeNameplateColor = scriptTable.config.changeNameplateColor --\n    envTable.NameplateColor = scriptTable.config.nameplateColor\n    envTable.NameplateSizeOffset = scriptTable.config.nameplateSizeOffset --\n    \n    unitFrame.UnitImportantSkullTexture = unitFrame.UnitImportantSkullTexture or unitFrame:CreateTexture(nil, \"background\")\n    \n    unitFrame.UnitImportantSkullTexture:SetTexture([[Interface/AddOns/Plater/media/skullbones_128]])\n    unitFrame.UnitImportantSkullTexture:SetPoint(\"center\", unitFrame.healthBar, \"center\", 0, -5)\n    \n    unitFrame.UnitImportantSkullTexture:SetVertexColor(Plater:ParseColors(scriptTable.config.skullColor))\n    unitFrame.UnitImportantSkullTexture:SetAlpha(scriptTable.config.skullAlpha)\n    unitFrame.UnitImportantSkullTexture:SetScale(scriptTable.config.skullScale)\n    \n    unitFrame.UnitImportantSkullTexture:Hide()\nend\n\n--[=[\n\n154564 - debug\n\nUsing spellIDs for multi-language support\n\n164362 - smily morsel - plaguefall\n168882 - fleeting manifestation - sanguine depths\n170234 - oppressive banner - theater of pain\n168988 - overgrowth - Mists of Tirna Scithe\n170452 - essesnce orb - torghast\n\n\n--]=]",
						["Temp_OnHideCode"] = "function (self, unitId, unitFrame, envTable)\n    Plater.StopDotAnimation(unitFrame.healthBar, envTable.dotAnimation)   \n    \n    --restore the nameplate size\n    local nameplateHeight = Plater.db.profile.plate_config.enemynpc.health_incombat [2]\n    unitFrame.healthBar:SetHeight (nameplateHeight)    \n    \n    unitFrame.UnitImportantSkullTexture:Hide()\nend\n\n\n",
						["Temp_Initialization"] = "function (scriptTable)\n    --insert code here\n    \nend\n\n\n",
					}, -- [1]
					{
						["ConstructorCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    --creates a glow around the icon\n    envTable.buffIconGlow = envTable.buffIconGlow or Plater.CreateIconGlow (self, scriptTable.config.glowColor)\n    \nend",
						["OnHideCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    if (scriptTable.config.glowEnabled) then\n        envTable.buffIconGlow:Hide()\n    end\n    \n    if (scriptTable.config.dotsEnabled) then\n        Plater.StopDotAnimation(self, envTable.dotAnimation)\n    end\n    \n    \nend",
						["OptionsValues"] = {
						},
						["Temp_OnShowCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    if (scriptTable.config.glowEnabled) then\n        envTable.buffIconGlow:Show()\n    end\n    \n    if (scriptTable.config.dotsEnabled) then\n        envTable.dotAnimation = Plater.PlayDotAnimation(self, 6, scriptTable.config.dotsColor, 6, 3) \n    end\n    \nend\n\n\n\n\n",
						["ScriptType"] = 1,
						["Temp_Initialization"] = "function (scriptTable)\n    --insert code here\n    \nend\n\n\n",
						["Time"] = 1612553609,
						["Options"] = {
							{
								["Type"] = 6,
								["Key"] = "option1",
								["Value"] = 0,
								["Name"] = "Blank Space",
								["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
								["Desc"] = "",
							}, -- [1]
							{
								["Type"] = 5,
								["Key"] = "option2",
								["Value"] = "Enter the spell name or spellID of the Buff in the Add Trigger box and hit \"Add\".",
								["Name"] = "Option 2",
								["Icon"] = "Interface\\AddOns\\Plater\\images\\option_label",
								["Desc"] = "",
							}, -- [2]
							{
								["Type"] = 6,
								["Key"] = "option3",
								["Value"] = 0,
								["Name"] = "Blank Space",
								["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
								["Desc"] = "",
							}, -- [3]
							{
								["Type"] = 4,
								["Key"] = "glowEnabled",
								["Value"] = false,
								["Name"] = "Glow Enabled",
								["Icon"] = "Interface\\AddOns\\Plater\\images\\option_bool",
								["Desc"] = "",
							}, -- [4]
							{
								["Type"] = 1,
								["Key"] = "glowColor",
								["Value"] = {
									0.403921568627451, -- [1]
									0.00392156862745098, -- [2]
									0, -- [3]
									1, -- [4]
								},
								["Name"] = "Glow Color",
								["Icon"] = "Interface\\AddOns\\Plater\\images\\option_color",
								["Desc"] = "",
							}, -- [5]
							{
								["Type"] = 6,
								["Name"] = "Blank Space",
								["Value"] = 0,
								["Key"] = "option3",
								["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
								["Desc"] = "",
							}, -- [6]
							{
								["Type"] = 4,
								["Key"] = "dotsEnabled",
								["Value"] = true,
								["Name"] = "Dots Enabled",
								["Icon"] = "Interface\\AddOns\\Plater\\images\\option_bool",
								["Desc"] = "",
							}, -- [7]
							{
								["Type"] = 1,
								["Name"] = "Dots Color",
								["Value"] = {
									1, -- [1]
									0.3215686274509804, -- [2]
									0, -- [3]
									1, -- [4]
								},
								["Key"] = "dotsColor",
								["Icon"] = "Interface\\AddOns\\Plater\\images\\option_color",
								["Desc"] = "",
							}, -- [8]
						},
						["Temp_ConstructorCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    --creates a glow around the icon\n    envTable.buffIconGlow = envTable.buffIconGlow or Plater.CreateIconGlow (self, scriptTable.config.glowColor)\n    \nend",
						["NpcNames"] = {
						},
						["OnShowCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    if (scriptTable.config.glowEnabled) then\n        envTable.buffIconGlow:Show()\n    end\n    \n    if (scriptTable.config.dotsEnabled) then\n        envTable.dotAnimation = Plater.PlayDotAnimation(self, 6, scriptTable.config.dotsColor, 6, 3) \n    end\n    \nend\n\n\n\n\n",
						["Enabled"] = true,
						["Revision"] = 608,
						["semver"] = "",
						["version"] = -1,
						["Temp_UpdateCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    \n    \n    \nend",
						["Author"] = "Tercioo-Sylvanas",
						["Initialization"] = "function (scriptTable)\n    --insert code here\n    \nend\n\n\n",
						["Desc"] = "Add the buff name in the trigger box.",
						["SpellIds"] = {
							323149, -- [1]
							324392, -- [2]
							340544, -- [3]
							342189, -- [4]
							333227, -- [5]
						},
						["Prio"] = 99,
						["Name"] = "Aura - Buff Alert [Plater]",
						["PlaterCore"] = 1,
						["Temp_OnHideCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    if (scriptTable.config.glowEnabled) then\n        envTable.buffIconGlow:Hide()\n    end\n    \n    if (scriptTable.config.dotsEnabled) then\n        Plater.StopDotAnimation(self, envTable.dotAnimation)\n    end\n    \n    \nend",
						["Icon"] = "Interface\\AddOns\\Plater\\images\\icon_aura",
						["url"] = "",
						["UpdateCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    \n    \n    \nend",
					}, -- [2]
					{
						["ConstructorCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    --insert code here\n    \n    if (not unitFrame.spitefulTexture) then\n        unitFrame.spitefulTexture = unitFrame.healthBar:CreateTexture(nil, \"overlay\", nil, 6)\n        unitFrame.spitefulTexture:SetPoint('right', 0, 0)\n        unitFrame.spitefulTexture:SetSize(27, 14)\n        unitFrame.spitefulTexture:SetColorTexture(.3, .3, 1, .7)\n        \n        unitFrame.spitefulText = unitFrame.healthBar:CreateFontString(nil, \"overlay\", \"GameFontNormal\", 6)\n        DetailsFramework:SetFontFace (unitFrame.spitefulText, \"2002\")\n        unitFrame.spitefulText:SetPoint(\"right\", unitFrame.spitefulTexture, \"right\", -2, 0)\n        unitFrame.spitefulText:SetJustifyH(\"right\")\n        \n        unitFrame.roleIcon = unitFrame:CreateTexture(nil, \"overlay\")\n        unitFrame.roleIcon:SetPoint(\"left\", unitFrame.healthBar, \"left\", 2, 0)\n        unitFrame.targetName = unitFrame:CreateFontString(nil, \"overlay\", \"GameFontNormal\")\n        unitFrame.targetName:SetPoint(\"left\", unitFrame.roleIcon, \"right\", 2, 0)\n        \n        unitFrame.spitefulTexture:Hide()\n        unitFrame.spitefulText:Hide()\n    end\n    \n    function envTable.UpdateSpitefulWidget(unitFrame)\n        \n        local r, g, b, a = Plater:ParseColors(scriptTable.config.bgColor)\n        unitFrame.spitefulTexture:SetColorTexture(r, g, b, a)\n        unitFrame.spitefulTexture:SetSize(scriptTable.config.bgWidth, unitFrame.healthBar:GetHeight())   \n        Plater:SetFontSize(unitFrame.spitefulText, scriptTable.config.textSize)\n        Plater:SetFontColor(unitFrame.spitefulText, scriptTable.config.textColor)\n        \n        local currentHealth = unitFrame.healthBar.CurrentHealth\n        local maxHealth = unitFrame.healthBar.CurrentHealthMax\n        \n        local healthPercent = currentHealth / maxHealth * 100\n        local timeToDie = format(\"%.1fs\", healthPercent / 8)\n        unitFrame.spitefulText:SetText(timeToDie)\n        \n        unitFrame.spitefulText:Show()\n        unitFrame.spitefulTexture:Show()\n        \n        if scriptTable.config.switchTargetName then\n            local plateFrame = unitFrame.PlateFrame\n            \n            local target = UnitName(unitFrame.namePlateUnitToken .. \"target\") or UnitName(unitFrame.namePlateUnitToken)\n            \n            if (target and target ~= \"\") then\n                local _, class = UnitClass(unitFrame.namePlateUnitToken .. \"target\")\n                if (class) then\n                    target = DetailsFramework:AddClassColorToText(target, class)\n                end\n                \n                local role = UnitGroupRolesAssigned(unitFrame.namePlateUnitToken .. \"target\")\n                if (role and role ~= \"NONE\") then\n                    target = DetailsFramework:AddRoleIconToText(target, role)\n                end\n                \n                plateFrame.namePlateUnitName = target\n                Plater.UpdateUnitName(plateFrame)\n            end\n        end\n        \n        if scriptTable.config.useTargetingColor then\n            local targeted = UnitIsUnit(unitFrame.namePlateUnitToken .. \"target\", \"player\")\n            if targeted then\n                Plater.SetNameplateColor (unitFrame, scriptTable.config.targetingColor)\n            else\n                Plater.RefreshNameplateColor(unitFrame)\n            end\n        end\n    end\nend",
						["OnHideCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    --insert code here\n    if (unitFrame.spitefulTexture) then\n        unitFrame.spitefulText:Hide()\n        unitFrame.spitefulTexture:Hide()    \n        unitFrame.roleIcon:Hide()\n        unitFrame.targetName:Hide()\n    end\nend\n\n\n\n\n\n",
						["ScriptType"] = 3,
						["UpdateCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    --insert code here\n    envTable.UpdateSpitefulWidget(unitFrame)\nend\n\n\n",
						["Time"] = 1611844883,
						["url"] = "",
						["Icon"] = 135945,
						["Enabled"] = true,
						["Revision"] = 186,
						["semver"] = "",
						["Author"] = "Symantec-Azralon",
						["Initialization"] = "function (scriptTable)\n    --insert code here\n    \nend\n\n\n",
						["Desc"] = "Time to die Spiteful affix",
						["NpcNames"] = {
							"174773", -- [1]
						},
						["SpellIds"] = {
						},
						["PlaterCore"] = 1,
						["Name"] = "M+ Spiteful",
						["version"] = -1,
						["Options"] = {
							{
								["Type"] = 5,
								["Name"] = "Time to Die",
								["Value"] = "Time to Die",
								["Key"] = "option12",
								["Icon"] = "Interface\\AddOns\\Plater\\images\\option_label",
								["Desc"] = "",
							}, -- [1]
							{
								["Type"] = 2,
								["Max"] = 50,
								["Desc"] = "",
								["Min"] = 10,
								["Fraction"] = false,
								["Value"] = 27,
								["Key"] = "bgWidth",
								["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
								["Name"] = "Width",
							}, -- [2]
							{
								["Type"] = 1,
								["Name"] = "Background Color",
								["Value"] = {
									0.5058823529411764, -- [1]
									0.07058823529411765, -- [2]
									1, -- [3]
									1, -- [4]
								},
								["Key"] = "bgColor",
								["Icon"] = "Interface\\AddOns\\Plater\\images\\option_color",
								["Desc"] = "",
							}, -- [3]
							{
								["Type"] = 2,
								["Max"] = 24,
								["Desc"] = "",
								["Min"] = 7,
								["Fraction"] = false,
								["Value"] = 8,
								["Key"] = "textSize",
								["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
								["Name"] = "Text Size",
							}, -- [4]
							{
								["Type"] = 1,
								["Name"] = "Text Color",
								["Value"] = {
									1, -- [1]
									0.5843137254901961, -- [2]
									0, -- [3]
									1, -- [4]
								},
								["Key"] = "textColor",
								["Icon"] = "Interface\\AddOns\\Plater\\images\\option_color",
								["Desc"] = "",
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
								["Name"] = "Targeting",
								["Value"] = "Targeting",
								["Key"] = "option11",
								["Icon"] = "Interface\\AddOns\\Plater\\images\\option_label",
								["Desc"] = "",
							}, -- [7]
							{
								["Type"] = 4,
								["Key"] = "switchTargetName",
								["Value"] = true,
								["Name"] = "Show Target instead of Name",
								["Icon"] = "Interface\\AddOns\\Plater\\images\\option_bool",
								["Desc"] = "",
							}, -- [8]
							{
								["Type"] = 4,
								["Key"] = "useTargetingColor",
								["Value"] = true,
								["Name"] = "Change Color if targeting You",
								["Icon"] = "Interface\\AddOns\\Plater\\images\\option_bool",
								["Desc"] = "",
							}, -- [9]
							{
								["Type"] = 1,
								["Key"] = "targetingColor",
								["Value"] = {
									0.07058823529411765, -- [1]
									0.6196078431372549, -- [2]
									0, -- [3]
									1, -- [4]
								},
								["Name"] = "Color if targeting You",
								["Icon"] = "Interface\\AddOns\\Plater\\images\\option_color",
								["Desc"] = "",
							}, -- [10]
							{
								["Type"] = 6,
								["Name"] = "Option 11",
								["Value"] = 0,
								["Key"] = "option11",
								["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
								["Desc"] = "",
							}, -- [11]
						},
						["OnShowCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    --insert code here\n    envTable.UpdateSpitefulWidget(unitFrame)\nend\n\n\n",
					}, -- [3]
					{
						["ConstructorCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    --create a texture to use for a flash behind the cast bar\n    local backGroundFlashTexture = Plater:CreateImage (self, [[Interface\\ACHIEVEMENTFRAME\\UI-Achievement-Alert-Glow]], self:GetWidth()+40, self:GetHeight()+20, \"background\", {0, 400/512, 0, 170/256})\n    backGroundFlashTexture:SetBlendMode (\"ADD\")\n    backGroundFlashTexture:SetPoint (\"center\", self, \"center\")\n    backGroundFlashTexture:SetVertexColor(Plater:ParseColors(scriptTable.config.flashColor))\n    backGroundFlashTexture:Hide()\n    \n    --create the animation hub to hold the flash animation sequence\n    envTable.BackgroundFlash = envTable.BackgroundFlash or Plater:CreateAnimationHub (backGroundFlashTexture, \n        function()\n            backGroundFlashTexture:Show()\n        end,\n        function()\n            backGroundFlashTexture:Hide()\n        end\n    )\n    \n    --create the flash animation sequence\n    local fadeIn = Plater:CreateAnimation (envTable.BackgroundFlash, \"ALPHA\", 1, scriptTable.config.flashDuration/2, 0, 1)\n    local fadeOut = Plater:CreateAnimation (envTable.BackgroundFlash, \"ALPHA\", 2, scriptTable.config.flashDuration/2, 1, 0)\n    \n    --create a camera shake for the nameplate\n    envTable.FrameShake = Plater:CreateFrameShake (unitFrame, scriptTable.config.shakeDuration, scriptTable.config.shakeAmplitude, scriptTable.config.shakeFrequency, false, false, 0, 1, 0.05, 0.1, Plater.GetPoints (unitFrame))\n    \n    --update the config for the flash here so it wont need a /reload\n    fadeIn:SetDuration (scriptTable.config.flashDuration/2)\n    fadeOut:SetDuration (scriptTable.config.flashDuration/2)\n    \n    --update the config for the skake here so it wont need a /reload\n    envTable.FrameShake.OriginalAmplitude = scriptTable.config.shakeAmplitude\n    envTable.FrameShake.OriginalDuration = scriptTable.config.shakeDuration\n    envTable.FrameShake.OriginalFrequency = scriptTable.config.shakeFrequency\nend",
						["OnHideCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    Plater.StopDotAnimation(unitFrame.castBar, envTable.dotAnimation)    \n    \n    envTable.BackgroundFlash:Stop()\n    \n    unitFrame:StopFrameShake (envTable.FrameShake)    \n    \nend\n\n\n",
						["ScriptType"] = 2,
						["UpdateCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \nend\n\n\n",
						["Time"] = 1604674264,
						["url"] = "",
						["Icon"] = "Interface\\AddOns\\Plater\\images\\cast_bar_darkorange",
						["Enabled"] = true,
						["Revision"] = 695,
						["semver"] = "",
						["Author"] = "Bombad�o-Azralon",
						["Initialization"] = "function (scriptTable)\n    --insert code here\n    \nend\n\n\n",
						["Desc"] = "Highlight a very important cast applying several effects into the Cast Bar. Add spell in the Add Trigger field.",
						["NpcNames"] = {
						},
						["SpellIds"] = {
							321247, -- [1]
							334522, -- [2]
							320232, -- [3]
							319962, -- [4]
							325879, -- [5]
							324427, -- [6]
							322999, -- [7]
							325360, -- [8]
							322903, -- [9]
							324103, -- [10]
							333294, -- [11]
							333540, -- [12]
							319521, -- [13]
							326021, -- [14]
							326450, -- [15]
							322711, -- [16]
							329104, -- [17]
							295000, -- [18]
							242391, -- [19]
							320197, -- [20]
							329608, -- [21]
						},
						["PlaterCore"] = 1,
						["Name"] = "Cast - Very Important [Plater]",
						["version"] = -1,
						["Options"] = {
							{
								["Type"] = 6,
								["Name"] = "Option 1",
								["Value"] = 0,
								["Key"] = "option1",
								["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
								["Desc"] = "",
							}, -- [1]
							{
								["Type"] = 5,
								["Name"] = "Option 2",
								["Value"] = "Plays a big animation when the cast start.",
								["Key"] = "option2",
								["Icon"] = "Interface\\AddOns\\Plater\\images\\option_label",
								["Desc"] = "",
							}, -- [2]
							{
								["Type"] = 5,
								["Key"] = "option2",
								["Value"] = "Enter the spell name or spellID of the Spell in the Add Trigger box and hit \"Add\".",
								["Name"] = "Option 2",
								["Icon"] = "Interface\\AddOns\\Plater\\images\\option_label",
								["Desc"] = "",
							}, -- [3]
							{
								["Type"] = 6,
								["Name"] = "Option 4",
								["Value"] = 0,
								["Key"] = "option4",
								["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
								["Desc"] = "",
							}, -- [4]
							{
								["Type"] = 5,
								["Name"] = "Flash",
								["Value"] = "Flash:",
								["Key"] = "option2",
								["Icon"] = "Interface\\AddOns\\Plater\\images\\option_label",
								["Desc"] = "",
							}, -- [5]
							{
								["Type"] = 2,
								["Max"] = 1.2,
								["Desc"] = "How long is the flash played when the cast starts.",
								["Min"] = 0.1,
								["Key"] = "flashDuration",
								["Value"] = 0.8,
								["Name"] = "Flash Duration",
								["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
								["Fraction"] = true,
							}, -- [6]
							{
								["Type"] = 1,
								["Name"] = "Flash Color",
								["Value"] = {
									1, -- [1]
									1, -- [2]
									1, -- [3]
									1, -- [4]
								},
								["Key"] = "flashColor",
								["Icon"] = "Interface\\AddOns\\Plater\\images\\option_color",
								["Desc"] = "Color of the Flash",
							}, -- [7]
							{
								["Type"] = 6,
								["Name"] = "Option 7",
								["Value"] = 0,
								["Key"] = "option7",
								["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
								["Desc"] = "",
							}, -- [8]
							{
								["Type"] = 5,
								["Key"] = "option2",
								["Value"] = "Shake:",
								["Name"] = "Shake",
								["Icon"] = "Interface\\AddOns\\Plater\\images\\option_label",
								["Desc"] = "",
							}, -- [9]
							{
								["Type"] = 2,
								["Max"] = 0.5,
								["Desc"] = "When the cast starts, there's a small shake in the nameplate, this settings controls how long it takes.",
								["Min"] = 0.1,
								["Key"] = "shakeDuration",
								["Value"] = 0.2,
								["Name"] = "Shake Duration",
								["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
								["Fraction"] = true,
							}, -- [10]
							{
								["Type"] = 2,
								["Max"] = 10,
								["Desc"] = "How strong is the shake.",
								["Min"] = 1,
								["Key"] = "shakeAmplitude",
								["Value"] = 5,
								["Name"] = "Shake Amplitude",
								["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
								["Fraction"] = false,
							}, -- [11]
							{
								["Type"] = 2,
								["Max"] = 80,
								["Desc"] = "How fast the shake moves.",
								["Min"] = 1,
								["Key"] = "shakeFrequency",
								["Value"] = 40,
								["Name"] = "Shake Frequency",
								["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
								["Fraction"] = false,
							}, -- [12]
							{
								["Type"] = 6,
								["Name"] = "Option 13",
								["Value"] = 0,
								["Key"] = "option13",
								["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
								["Desc"] = "",
							}, -- [13]
							{
								["Type"] = 5,
								["Name"] = "Dot Animation",
								["Value"] = "Dot Animation:",
								["Key"] = "option14",
								["Icon"] = "Interface\\AddOns\\Plater\\images\\option_label",
								["Desc"] = "",
							}, -- [14]
							{
								["Type"] = 1,
								["Name"] = "Dot Color",
								["Value"] = {
									0.5647058823529412, -- [1]
									0.5647058823529412, -- [2]
									0.5647058823529412, -- [3]
									1, -- [4]
								},
								["Key"] = "dotColor",
								["Icon"] = "Interface\\AddOns\\Plater\\images\\option_color",
								["Desc"] = "Adjust the color of the dots around the nameplate",
							}, -- [15]
							{
								["Type"] = 2,
								["Max"] = 20,
								["Desc"] = "Adjust the width of the dots to better fit in your nameplate.",
								["Min"] = -10,
								["Key"] = "xOffset",
								["Value"] = 8,
								["Fraction"] = false,
								["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
								["Name"] = "Dot X Offset",
							}, -- [16]
							{
								["Type"] = 2,
								["Max"] = 10,
								["Desc"] = "Adjust the height of the dots to better fit in your nameplate.",
								["Min"] = -10,
								["Fraction"] = false,
								["Value"] = 3,
								["Name"] = "Dot Y Offset",
								["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
								["Key"] = "yOffset",
							}, -- [17]
							{
								["Type"] = 6,
								["Name"] = "blank",
								["Value"] = 0,
								["Key"] = "option18",
								["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
								["Desc"] = "",
							}, -- [18]
							{
								["Type"] = 6,
								["Key"] = "option18",
								["Value"] = 0,
								["Name"] = "blank",
								["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
								["Desc"] = "",
							}, -- [19]
							{
								["Type"] = 6,
								["Key"] = "option18",
								["Value"] = 0,
								["Name"] = "blank",
								["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
								["Desc"] = "",
							}, -- [20]
							{
								["Type"] = 6,
								["Name"] = "blank",
								["Value"] = 0,
								["Key"] = "option18",
								["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
								["Desc"] = "",
							}, -- [21]
							{
								["Type"] = 6,
								["Name"] = "blank",
								["Value"] = 0,
								["Key"] = "option18",
								["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
								["Desc"] = "",
							}, -- [22]
							{
								["Type"] = 6,
								["Key"] = "option18",
								["Value"] = 0,
								["Name"] = "blank",
								["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
								["Desc"] = "",
							}, -- [23]
							{
								["Type"] = 5,
								["Name"] = "Option 19",
								["Value"] = "Cast Bar",
								["Key"] = "option19",
								["Icon"] = "Interface\\AddOns\\Plater\\images\\option_label",
								["Desc"] = "",
							}, -- [24]
							{
								["Type"] = 4,
								["Name"] = "Use Cast Bar Color",
								["Value"] = true,
								["Key"] = "useCastbarColor",
								["Icon"] = "Interface\\AddOns\\Plater\\images\\option_bool",
								["Desc"] = "Use cast bar color.",
							}, -- [25]
							{
								["Type"] = 1,
								["Name"] = "Cast Bar Color",
								["Value"] = {
									0.4117647058823529, -- [1]
									1, -- [2]
									0, -- [3]
									1, -- [4]
								},
								["Key"] = "castBarColor",
								["Icon"] = "Interface\\AddOns\\Plater\\images\\option_color",
								["Desc"] = "Cast bar color.",
							}, -- [26]
						},
						["OnShowCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    envTable.dotAnimation = Plater.PlayDotAnimation(unitFrame.castBar, 5, scriptTable.config.dotColor, scriptTable.config.xOffset, scriptTable.config.yOffset)\n    \n    \n    envTable.BackgroundFlash:Play()\n    \n    Plater.FlashNameplateBorder (unitFrame, 0.05)   \n    Plater.FlashNameplateBody (unitFrame, \"\", 0.075)\n    \n    unitFrame:PlayFrameShake (envTable.FrameShake)\n    \n    if (envTable._CanInterrupt) then\n        if (scriptTable.config.useCastbarColor) then\n            self:SetStatusBarColor (Plater:ParseColors (scriptTable.config.castBarColor))\n        end\n    end\n    \nend\n\n\n",
					}, -- [4]
					{
						["ConstructorCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    --settings\n    envTable.NameplateSizeOffset = scriptTable.config.castBarHeight\n    envTable.ShowArrow = scriptTable.config.showArrow\n    envTable.ArrowAlpha = scriptTable.config.arrowAlpha\n    envTable.HealthBarColor = scriptTable.config.healthBarColor\n    \n    --creates the spark to show the cast progress inside the health bar\n    envTable.overlaySpark = envTable.overlaySpark or Plater:CreateImage (unitFrame.healthBar)\n    envTable.overlaySpark:SetBlendMode (\"ADD\")\n    envTable.overlaySpark.width = 16\n    envTable.overlaySpark.height = 36\n    envTable.overlaySpark.alpha = .9\n    envTable.overlaySpark.texture = [[Interface\\AddOns\\Plater\\images\\spark3]]\n    \n    envTable.topArrow = envTable.topArrow or Plater:CreateImage (unitFrame.healthBar)\n    envTable.topArrow:SetBlendMode (\"ADD\")\n    envTable.topArrow.width = scriptTable.config.arrowWidth\n    envTable.topArrow.height = scriptTable.config.arrowHeight\n    envTable.topArrow.alpha = envTable.ArrowAlpha\n    envTable.topArrow.texture = [[Interface\\BUTTONS\\Arrow-Down-Up]]\n    \n    --scale animation\n    envTable.smallScaleAnimation = envTable.smallScaleAnimation or Plater:CreateAnimationHub (unitFrame.healthBar)\n    Plater:CreateAnimation (envTable.smallScaleAnimation, \"SCALE\", 1, 0.075, 1, 1, 1.08, 1.08)\n    Plater:CreateAnimation (envTable.smallScaleAnimation, \"SCALE\", 2, 0.075, 1, 1, 0.95, 0.95)    \n    --envTable.smallScaleAnimation:Play() --envTable.smallScaleAnimation:Stop()\n    \nend\n\n\n\n\n\n\n\n",
						["OnHideCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    Plater.StopDotAnimation(unitFrame.healthBar, envTable.dotAnimation)\n    \n    envTable.overlaySpark:Hide()\n    envTable.topArrow:Hide()\n    \n    Plater.RefreshNameplateColor (unitFrame)\n    \n    envTable.smallScaleAnimation:Stop()\n    \n    --increase the nameplate size\n    local nameplateHeight = Plater.db.profile.plate_config.enemynpc.health_incombat [2]\n    unitFrame.healthBar:SetHeight (nameplateHeight)\nend\n\n\n",
						["OptionsValues"] = {
						},
						["Temp_OnShowCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    envTable.overlaySpark:Show()\n    \n    if (envTable.ShowArrow) then\n        envTable.topArrow:Show()\n    end\n    \n    Plater.FlashNameplateBorder (unitFrame, 0.05)   \n    Plater.FlashNameplateBody (unitFrame, \"\", 0.075)\n    \n    envTable.smallScaleAnimation:Play()\n    \n    --increase the nameplate size\n    local nameplateHeight = Plater.db.profile.plate_config.enemynpc.health_incombat [2]\n    unitFrame.healthBar:SetHeight (nameplateHeight + envTable.NameplateSizeOffset)\n    \n    envTable.overlaySpark.height = nameplateHeight + 5\n    \n    envTable.dotAnimation = Plater.PlayDotAnimation(unitFrame.healthBar, 2, scriptTable.config.dotColor, scriptTable.config.xOffset, scriptTable.config.yOffset)\n    \n    self:SetStatusBarColor (Plater:ParseColors (scriptTable.config.castBarColor))\nend\n\n\n\n\n\n\n",
						["ScriptType"] = 2,
						["UpdateCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    --update the percent\n    envTable.overlaySpark:SetPoint (\"left\", unitFrame.healthBar:GetWidth() * (envTable._CastPercent / 100)-9, 0)\n    \n    envTable.topArrow:SetPoint (\"bottomleft\", unitFrame.healthBar, \"topleft\", unitFrame.healthBar:GetWidth() * (envTable._CastPercent / 100) - 4, 2 )\n    \n    --forces the script to update on a 60Hz base\n    self.ThrottleUpdate = 0\n    \n\nend\n\n\n",
						["Time"] = 1612566712,
						["NpcNames"] = {
						},
						["url"] = "",
						["Icon"] = 2175503,
						["Options"] = {
							{
								["Type"] = 6,
								["Name"] = "Option 1",
								["Value"] = 0,
								["Key"] = "option1",
								["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
								["Desc"] = "",
							}, -- [1]
							{
								["Type"] = 5,
								["Name"] = "Option 2",
								["Value"] = "Plays a special animation showing the explosion time.",
								["Key"] = "option2",
								["Icon"] = "Interface\\AddOns\\Plater\\images\\option_label",
								["Desc"] = "",
							}, -- [2]
							{
								["Type"] = 6,
								["Name"] = "Option 3",
								["Value"] = 0,
								["Key"] = "option3",
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
								["Name"] = "Cast Bar Color",
								["Value"] = {
									1, -- [1]
									0.5843137254901961, -- [2]
									0, -- [3]
									1, -- [4]
								},
								["Key"] = "castBarColor",
								["Icon"] = "Interface\\AddOns\\Plater\\images\\option_color",
								["Desc"] = "Changes the cast bar color to this one.",
							}, -- [5]
							{
								["Type"] = 6,
								["Name"] = "Option 7",
								["Value"] = 0,
								["Key"] = "option7",
								["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
								["Desc"] = "",
							}, -- [6]
							{
								["Type"] = 5,
								["Name"] = "Arrow:",
								["Value"] = "Arrow:",
								["Key"] = "option6",
								["Icon"] = "Interface\\AddOns\\Plater\\images\\option_label",
								["Desc"] = "",
							}, -- [7]
							{
								["Type"] = 4,
								["Name"] = "Show Arrow",
								["Value"] = true,
								["Key"] = "showArrow",
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
								["Fraction"] = false,
								["Value"] = 8,
								["Name"] = "Arrow Width",
								["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
								["Key"] = "arrowWidth",
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
								["Name"] = "Option 13",
								["Value"] = 0,
								["Key"] = "option13",
								["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
								["Desc"] = "",
							}, -- [12]
							{
								["Type"] = 5,
								["Name"] = "Dot Animation:",
								["Value"] = "Dot Animation:",
								["Key"] = "option12",
								["Icon"] = "Interface\\AddOns\\Plater\\images\\option_label",
								["Desc"] = "",
							}, -- [13]
							{
								["Type"] = 1,
								["Name"] = "Dot Color",
								["Value"] = {
									1, -- [1]
									0.615686274509804, -- [2]
									0, -- [3]
									1, -- [4]
								},
								["Key"] = "dotColor",
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
								["Fraction"] = false,
								["Value"] = 3,
								["Key"] = "yOffset",
								["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
								["Name"] = "Dot Y Offset",
							}, -- [16]
						},
						["Enabled"] = true,
						["Revision"] = 463,
						["semver"] = "",
						["version"] = -1,
						["Temp_UpdateCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    --update the percent\n    envTable.overlaySpark:SetPoint (\"left\", unitFrame.healthBar:GetWidth() * (envTable._CastPercent / 100)-9, 0)\n    \n    envTable.topArrow:SetPoint (\"bottomleft\", unitFrame.healthBar, \"topleft\", unitFrame.healthBar:GetWidth() * (envTable._CastPercent / 100) - 4, 2 )\n    \n    --forces the script to update on a 60Hz base\n    self.ThrottleUpdate = 0\n    \n\nend\n\n\n",
						["Author"] = "Bombad�o-Azralon",
						["Initialization"] = "function (scriptTable)\n    --insert code here\n    \nend\n\n\n",
						["Desc"] = "Apply several animations when the explosion orb cast starts on a Mythic Dungeon with Explosion Affix",
						["SpellIds"] = {
							240446, -- [1]
						},
						["Prio"] = 99,
						["Name"] = "Explosion Affix M+ [Plater]",
						["PlaterCore"] = 1,
						["OnShowCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    envTable.overlaySpark:Show()\n    \n    if (envTable.ShowArrow) then\n        envTable.topArrow:Show()\n    end\n    \n    Plater.FlashNameplateBorder (unitFrame, 0.05)   \n    Plater.FlashNameplateBody (unitFrame, \"\", 0.075)\n    \n    envTable.smallScaleAnimation:Play()\n    \n    --increase the nameplate size\n    local nameplateHeight = Plater.db.profile.plate_config.enemynpc.health_incombat [2]\n    unitFrame.healthBar:SetHeight (nameplateHeight + envTable.NameplateSizeOffset)\n    \n    envTable.overlaySpark.height = nameplateHeight + 5\n    \n    envTable.dotAnimation = Plater.PlayDotAnimation(unitFrame.healthBar, 2, scriptTable.config.dotColor, scriptTable.config.xOffset, scriptTable.config.yOffset)\n    \n    self:SetStatusBarColor (Plater:ParseColors (scriptTable.config.castBarColor))\nend\n\n\n\n\n\n\n",
						["Temp_ConstructorCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    --settings\n    envTable.NameplateSizeOffset = scriptTable.config.castBarHeight\n    envTable.ShowArrow = scriptTable.config.showArrow\n    envTable.ArrowAlpha = scriptTable.config.arrowAlpha\n    envTable.HealthBarColor = scriptTable.config.healthBarColor\n    \n    --creates the spark to show the cast progress inside the health bar\n    envTable.overlaySpark = envTable.overlaySpark or Plater:CreateImage (unitFrame.healthBar)\n    envTable.overlaySpark:SetBlendMode (\"ADD\")\n    envTable.overlaySpark.width = 16\n    envTable.overlaySpark.height = 36\n    envTable.overlaySpark.alpha = .9\n    envTable.overlaySpark.texture = [[Interface\\AddOns\\Plater\\images\\spark3]]\n    \n    envTable.topArrow = envTable.topArrow or Plater:CreateImage (unitFrame.healthBar)\n    envTable.topArrow:SetBlendMode (\"ADD\")\n    envTable.topArrow.width = scriptTable.config.arrowWidth\n    envTable.topArrow.height = scriptTable.config.arrowHeight\n    envTable.topArrow.alpha = envTable.ArrowAlpha\n    envTable.topArrow.texture = [[Interface\\BUTTONS\\Arrow-Down-Up]]\n    \n    --scale animation\n    envTable.smallScaleAnimation = envTable.smallScaleAnimation or Plater:CreateAnimationHub (unitFrame.healthBar)\n    Plater:CreateAnimation (envTable.smallScaleAnimation, \"SCALE\", 1, 0.075, 1, 1, 1.08, 1.08)\n    Plater:CreateAnimation (envTable.smallScaleAnimation, \"SCALE\", 2, 0.075, 1, 1, 0.95, 0.95)    \n    --envTable.smallScaleAnimation:Play() --envTable.smallScaleAnimation:Stop()\n    \nend\n\n\n\n\n\n\n\n",
						["Temp_OnHideCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    Plater.StopDotAnimation(unitFrame.healthBar, envTable.dotAnimation)\n    \n    envTable.overlaySpark:Hide()\n    envTable.topArrow:Hide()\n    \n    Plater.RefreshNameplateColor (unitFrame)\n    \n    envTable.smallScaleAnimation:Stop()\n    \n    --increase the nameplate size\n    local nameplateHeight = Plater.db.profile.plate_config.enemynpc.health_incombat [2]\n    unitFrame.healthBar:SetHeight (nameplateHeight)\nend\n\n\n",
						["Temp_Initialization"] = "function (scriptTable)\n    --insert code here\n    \nend\n\n\n",
					}, -- [5]
					{
						["ConstructorCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    --creates a glow around the icon\n    envTable.buffIconGlow = envTable.buffIconGlow or Plater.CreateIconGlow (self, scriptTable.config.glowColor)\n    \nend\n\n\n",
						["OnHideCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    if (scriptTable.config.glowEnabled) then\n        envTable.buffIconGlow:Hide()\n    end\n    \n    if (scriptTable.config.dotsEnabled) then\n        Plater.StopDotAnimation(self, envTable.dotAnimation)\n    end\n    \n    \nend\n\n\n",
						["ScriptType"] = 1,
						["UpdateCode"] = "function (self, unitId, unitFrame, envTable)\n    \nend\n\n\n",
						["Time"] = 1604454032,
						["url"] = "",
						["Icon"] = "Interface\\AddOns\\Plater\\images\\icon_aura",
						["Enabled"] = true,
						["Revision"] = 351,
						["semver"] = "",
						["Author"] = "Tercioo-Sylvanas",
						["Desc"] = "Add the debuff name in the trigger box.",
						["NpcNames"] = {
						},
						["SpellIds"] = {
							337220, -- [1]
							337253, -- [2]
							337251, -- [3]
						},
						["PlaterCore"] = 1,
						["Name"] = "Aura - Debuff Alert [Plater]",
						["version"] = -1,
						["Options"] = {
							{
								["Type"] = 6,
								["Name"] = "Blank Space",
								["Value"] = 0,
								["Key"] = "option1",
								["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
								["Desc"] = "",
							}, -- [1]
							{
								["Type"] = 5,
								["Name"] = "Option 2",
								["Value"] = "Enter the spell name or spellID of the Buff in the Add Trigger box and hit \"Add\".",
								["Key"] = "option2",
								["Icon"] = "Interface\\AddOns\\Plater\\images\\option_label",
								["Desc"] = "",
							}, -- [2]
							{
								["Type"] = 6,
								["Name"] = "Blank Space",
								["Value"] = 0,
								["Key"] = "option3",
								["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
								["Desc"] = "",
							}, -- [3]
							{
								["Type"] = 4,
								["Name"] = "Glow Enabled",
								["Value"] = false,
								["Key"] = "glowEnabled",
								["Icon"] = "Interface\\AddOns\\Plater\\images\\option_bool",
								["Desc"] = "",
							}, -- [4]
							{
								["Type"] = 1,
								["Name"] = "Glow Color",
								["Value"] = {
									0.403921568627451, -- [1]
									0.00392156862745098, -- [2]
									0, -- [3]
									1, -- [4]
								},
								["Key"] = "glowColor",
								["Icon"] = "Interface\\AddOns\\Plater\\images\\option_color",
								["Desc"] = "",
							}, -- [5]
							{
								["Type"] = 6,
								["Key"] = "option3",
								["Value"] = 0,
								["Name"] = "Blank Space",
								["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
								["Desc"] = "",
							}, -- [6]
							{
								["Type"] = 4,
								["Name"] = "Dots Enabled",
								["Value"] = true,
								["Key"] = "dotsEnabled",
								["Icon"] = "Interface\\AddOns\\Plater\\images\\option_bool",
								["Desc"] = "",
							}, -- [7]
							{
								["Type"] = 1,
								["Key"] = "dotsColor",
								["Value"] = {
									1, -- [1]
									0.3215686274509804, -- [2]
									0, -- [3]
									1, -- [4]
								},
								["Name"] = "Dots Color",
								["Icon"] = "Interface\\AddOns\\Plater\\images\\option_color",
								["Desc"] = "",
							}, -- [8]
						},
						["OnShowCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    if (scriptTable.config.glowEnabled) then\n        envTable.buffIconGlow:Show()\n    end\n    \n    if (scriptTable.config.dotsEnabled) then\n        envTable.dotAnimation = Plater.PlayDotAnimation(self, 6, scriptTable.config.dotsColor, 6, 3) \n    end\nend\n\n\n",
					}, -- [6]
					{
						["ConstructorCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    --settings\n    envTable.NameplateSizeOffset = scriptTable.config.castBarHeight\n    envTable.ShowArrow = scriptTable.config.showArrow\n    envTable.ArrowAlpha = scriptTable.config.arrowAlpha\n    envTable.HealthBarColor = scriptTable.config.healthBarColor\n    \n    --creates the spark to show the cast progress inside the health bar\n    envTable.overlaySpark = envTable.overlaySpark or Plater:CreateImage (unitFrame.healthBar)\n    envTable.overlaySpark:SetBlendMode (\"ADD\")\n    envTable.overlaySpark.width = 16\n    envTable.overlaySpark.height = 36\n    envTable.overlaySpark.alpha = .9\n    envTable.overlaySpark.texture = [[Interface\\AddOns\\Plater\\images\\spark3]]\n    \n    envTable.topArrow = envTable.topArrow or Plater:CreateImage (unitFrame.healthBar)\n    envTable.topArrow:SetBlendMode (\"ADD\")\n    envTable.topArrow.width = scriptTable.config.arrowWidth\n    envTable.topArrow.height = scriptTable.config.arrowHeight\n    envTable.topArrow.alpha = envTable.ArrowAlpha\n    envTable.topArrow.texture = [[Interface\\BUTTONS\\Arrow-Down-Up]]\n    \n    --scale animation\n    envTable.smallScaleAnimation = envTable.smallScaleAnimation or Plater:CreateAnimationHub (unitFrame.healthBar)\n    Plater:CreateAnimation (envTable.smallScaleAnimation, \"SCALE\", 1, 0.075, 1, 1, 1.08, 1.08)\n    Plater:CreateAnimation (envTable.smallScaleAnimation, \"SCALE\", 2, 0.075, 1, 1, 0.95, 0.95)    \n    --envTable.smallScaleAnimation:Play() --envTable.smallScaleAnimation:Stop()\n    \n    --create a camera shake for the nameplate\n    envTable.FrameShake = Plater:CreateFrameShake (unitFrame, scriptTable.config.shakeDuration, scriptTable.config.shakeAmplitude, scriptTable.config.shakeFrequency, false, false, 0, 1, 0.05, 0.1, Plater.GetPoints (unitFrame))    \n    \n    --update the config for the skake here so it wont need a /reload\n    envTable.FrameShake.OriginalAmplitude = scriptTable.config.shakeAmplitude\n    envTable.FrameShake.OriginalDuration = scriptTable.config.shakeDuration\n    envTable.FrameShake.OriginalFrequency = scriptTable.config.shakeFrequency\nend\n\n\n\n\n\n\n\n",
						["OnHideCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    Plater.StopDotAnimation(unitFrame.healthBar, envTable.dotAnimation)\n    \n    envTable.overlaySpark:Hide()\n    envTable.topArrow:Hide()\n    \n    Plater.RefreshNameplateColor (unitFrame)\n    \n    envTable.smallScaleAnimation:Stop()\n    \n    --increase the nameplate size\n    local nameplateHeight = Plater.db.profile.plate_config.enemynpc.health_incombat [2]\n    unitFrame.healthBar:SetHeight (nameplateHeight)\nend\n\n\n",
						["ScriptType"] = 2,
						["UpdateCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    --update the percent\n    envTable.overlaySpark:SetPoint (\"left\", unitFrame.healthBar:GetWidth() * (envTable._CastPercent / 100)-9, 0)\n    \n    envTable.topArrow:SetPoint (\"bottomleft\", unitFrame.healthBar, \"topleft\", unitFrame.healthBar:GetWidth() * (envTable._CastPercent / 100) - 4, 2 )\n    \n    --forces the script to update on a 60Hz base\n    self.ThrottleUpdate = 0.016\n    \n    --update the health bar color coloring from yellow to red\n    --Plater.SetNameplateColor (unitFrame, max (envTable._CastPercent/100, .66), abs (envTable._CastPercent/100 - 1), 0, 1)\n    \n    Plater.SetNameplateColor (unitFrame, envTable.HealthBarColor)\nend\n\n\n",
						["Time"] = 1604617977,
						["url"] = "",
						["Icon"] = "Interface\\AddOns\\Plater\\images\\cast_bar_red",
						["Enabled"] = true,
						["Revision"] = 513,
						["semver"] = "",
						["Author"] = "Bombad�o-Azralon",
						["Initialization"] = "function (scriptTable)\n    --insert code here\n    \nend\n\n\n",
						["Desc"] = "Used on casts that make the mob explode or transform if the cast passes.",
						["NpcNames"] = {
						},
						["SpellIds"] = {
							332329, -- [1]
							320103, -- [2]
							321406, -- [3]
							335817, -- [4]
							321061, -- [5]
							320141, -- [6]
							326171, -- [7]
						},
						["PlaterCore"] = 1,
						["Name"] = "Cast - Ultra Important [P]",
						["version"] = -1,
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
								["Desc"] = "Increases the health bar height by this value",
								["Min"] = 0,
								["Name"] = "Health Bar Height Mod",
								["Value"] = 3,
								["Fraction"] = false,
								["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
								["Key"] = "castBarHeight",
							}, -- [4]
							{
								["Type"] = 1,
								["Key"] = "healthBarColor",
								["Value"] = {
									1, -- [1]
									0.5843137254901961, -- [2]
									0, -- [3]
									1, -- [4]
								},
								["Name"] = "Health Bar Color",
								["Icon"] = "Interface\\AddOns\\Plater\\images\\option_color",
								["Desc"] = "Changes the health bar color to this one.",
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
								["Name"] = "Arrow Alpha",
								["Value"] = 0.5,
								["Fraction"] = true,
								["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
								["Key"] = "arrowAlpha",
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
								["Name"] = "Arrow Height",
								["Value"] = 8,
								["Fraction"] = false,
								["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
								["Key"] = "arrowHeight",
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
									0.615686274509804, -- [2]
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
								["Fraction"] = false,
								["Value"] = 4,
								["Name"] = "Dot X Offset",
								["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
								["Key"] = "xOffset",
							}, -- [15]
							{
								["Type"] = 2,
								["Max"] = 10,
								["Desc"] = "Dot Y Offset",
								["Min"] = -10,
								["Name"] = "Dot Y Offset",
								["Value"] = 3,
								["Key"] = "yOffset",
								["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
								["Fraction"] = false,
							}, -- [16]
						},
						["OnShowCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    envTable.overlaySpark:Show()\n    \n    if (envTable.ShowArrow) then\n        envTable.topArrow:Show()\n    end\n    \n    Plater.FlashNameplateBorder (unitFrame, 0.05)   \n    Plater.FlashNameplateBody (unitFrame, \"\", 0.075)\n    \n    envTable.smallScaleAnimation:Play()\n    \n    --increase the nameplate size\n    local nameplateHeight = Plater.db.profile.plate_config.enemynpc.health_incombat [2]\n    unitFrame.healthBar:SetHeight (nameplateHeight + envTable.NameplateSizeOffset)\n    \n    envTable.overlaySpark.height = nameplateHeight + 5\n    \n    envTable.dotAnimation = Plater.PlayDotAnimation(unitFrame.healthBar, 2, scriptTable.config.dotColor, scriptTable.config.xOffset, scriptTable.config.yOffset)\n    \n    \nend",
					}, -- [7]
					{
						["ConstructorCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    --castbar color (when can be interrupted)\n    envTable.CastbarColor = scriptTable.config.castbarColor\n    \n    --flash duration\n    local CONFIG_BACKGROUND_FLASH_DURATION = scriptTable.config.flashDuration\n    \n    --add this value to the cast bar height\n    envTable.CastBarHeightAdd = scriptTable.config.castBarHeight\n    \n    --create a fast flash above the cast bar\n    envTable.FullBarFlash = envTable.FullBarFlash or Plater.CreateFlash (self, 0.05, 1, \"white\")\n    \n    --create a camera shake for the nameplate\n    envTable.FrameShake = Plater:CreateFrameShake (unitFrame, scriptTable.config.shakeDuration, scriptTable.config.shakeAmplitude, scriptTable.config.shakeFrequency, false, false, 0, 1, 0.05, 0.1, Plater.GetPoints (unitFrame))\n    \n    --create a texture to use for a flash behind the cast bar\n    local backGroundFlashTexture = Plater:CreateImage (self, [[Interface\\ACHIEVEMENTFRAME\\UI-Achievement-Alert-Glow]], self:GetWidth()+60, self:GetHeight()+50, \"background\", {0, 400/512, 0, 170/256})\n    backGroundFlashTexture:SetBlendMode (\"ADD\")\n    backGroundFlashTexture:SetPoint (\"center\", self, \"center\")\n    backGroundFlashTexture:Hide()\n    \n    --create the animation hub to hold the flash animation sequence\n    envTable.BackgroundFlash = envTable.BackgroundFlash or Plater:CreateAnimationHub (backGroundFlashTexture, \n        function()\n            backGroundFlashTexture:Show()\n        end,\n        function()\n            backGroundFlashTexture:Hide()\n        end\n    )\n    \n    --create the flash animation sequence\n    envTable.BackgroundFlash.fadeIn = envTable.BackgroundFlash.fadeIn or Plater:CreateAnimation (envTable.BackgroundFlash, \"ALPHA\", 1, CONFIG_BACKGROUND_FLASH_DURATION/2, 0, .75)\n    envTable.BackgroundFlash.fadeIn:SetDuration(CONFIG_BACKGROUND_FLASH_DURATION/2)\n    \n    envTable.BackgroundFlash.fadeOut = envTable.BackgroundFlash.fadeOut or Plater:CreateAnimation (envTable.BackgroundFlash, \"ALPHA\", 2, CONFIG_BACKGROUND_FLASH_DURATION/2, 1, 0)    \n    envTable.BackgroundFlash.fadeOut:SetDuration(CONFIG_BACKGROUND_FLASH_DURATION/2)\n    \n    --envTable.BackgroundFlash:Play() --envTable.BackgroundFlash:Stop()    \n    \n    \n    \n    \n    \nend\n\n\n",
						["OnHideCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    --don't execute on battlegrounds and arenas\n    if (Plater.ZoneInstanceType == \"arena\" or Plater.ZoneInstanceType == \"pvp\" or Plater.ZoneInstanceType == \"none\") then\n        return\n    end    \n    \n    unitFrame.castBar:SetHeight (envTable._DefaultHeight)\n    \n    --stop the camera shake\n    unitFrame:StopFrameShake (envTable.FrameShake)\n    \n    envTable.FullBarFlash:Stop()\n    envTable.BackgroundFlash:Stop()\n    \n    unitFrame.castBar.Spark:SetHeight(unitFrame.castBar:GetHeight())\n    \nend\n\n\n\n\n\n",
						["ScriptType"] = 2,
						["UpdateCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \nend\n\n\n",
						["Time"] = 1604696442,
						["url"] = "",
						["Icon"] = "Interface\\AddOns\\Plater\\images\\cast_bar_orange",
						["Enabled"] = true,
						["Revision"] = 970,
						["semver"] = "",
						["Author"] = "Tercioo-Sylvanas",
						["Initialization"] = "function (scriptTable)\n    --insert code here\n    \nend",
						["Desc"] = "Flash, Bounce and Red Color the CastBar border when when an important cast is happening. Add spell in the Add Trigger field.",
						["NpcNames"] = {
						},
						["SpellIds"] = {
							338353, -- [1]
							334748, -- [2]
							334749, -- [3]
							320784, -- [4]
							341352, -- [5]
							341520, -- [6]
							341522, -- [7]
							336005, -- [8]
							339777, -- [9]
							331933, -- [10]
							326617, -- [11]
							324914, -- [12]
							324776, -- [13]
							326046, -- [14]
							340634, -- [15]
							319070, -- [16]
							328295, -- [17]
							317936, -- [18]
							327413, -- [19]
							319654, -- [20]
							323821, -- [21]
							320772, -- [22]
							324293, -- [23]
							330562, -- [24]
							330868, -- [25]
							341902, -- [26]
							342139, -- [27]
							342675, -- [28]
							323190, -- [29]
							332836, -- [30]
							327648, -- [31]
							328217, -- [32]
							322938, -- [33]
							340544, -- [34]
							325876, -- [35]
							325700, -- [36]
							323552, -- [37]
							332666, -- [38]
							332612, -- [39]
							332706, -- [40]
							340026, -- [41]
							294171, -- [42]
							292910, -- [43]
							294165, -- [44]
							338871, -- [45]
							330813, -- [46]
							335694, -- [47]
							327461, -- [48]
							329787, -- [49]
							304946, -- [50]
							15245, -- [51]
							276754, -- [52]
							304831, -- [53]
							277036, -- [54]
							320657, -- [55]
							294362, -- [56]
							270248, -- [57]
							292926, -- [58]
						},
						["PlaterCore"] = 1,
						["Name"] = "Cast - Big Alert [Plater]",
						["version"] = -1,
						["Options"] = {
							{
								["Type"] = 6,
								["Key"] = "option1",
								["Value"] = 0,
								["Name"] = "Blank Line",
								["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
								["Desc"] = "",
							}, -- [1]
							{
								["Type"] = 5,
								["Key"] = "option2",
								["Value"] = "Produces a notable effect in the cast bar when a spell from the 'Triggers' starts to cast.",
								["Name"] = "Option 2",
								["Icon"] = "Interface\\AddOns\\Plater\\images\\option_label",
								["Desc"] = "",
							}, -- [2]
							{
								["Type"] = 5,
								["Key"] = "option3",
								["Value"] = "Enter the spell name or spellID of the Spell in the Add Trigger box and hit \"Add\".",
								["Name"] = "Option 3",
								["Icon"] = "Interface\\AddOns\\Plater\\images\\option_label",
								["Desc"] = "",
							}, -- [3]
							{
								["Type"] = 6,
								["Key"] = "option4",
								["Value"] = 0,
								["Name"] = "Blank Space",
								["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
								["Desc"] = "",
							}, -- [4]
							{
								["Type"] = 4,
								["Key"] = "useCastbarColor",
								["Value"] = true,
								["Name"] = "Cast Bar Color Enabled",
								["Icon"] = "Interface\\AddOns\\Plater\\images\\option_bool",
								["Desc"] = "When enabled, changes the cast bar color,",
							}, -- [5]
							{
								["Type"] = 1,
								["Key"] = "castbarColor",
								["Value"] = {
									1, -- [1]
									0.4313725490196079, -- [2]
									0, -- [3]
									1, -- [4]
								},
								["Name"] = "Cast Bar Color",
								["Icon"] = "Interface\\AddOns\\Plater\\images\\option_color",
								["Desc"] = "Color of the cast bar.",
							}, -- [6]
							{
								["Type"] = 6,
								["Key"] = "option7",
								["Value"] = 0,
								["Name"] = "Blank Line",
								["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
								["Desc"] = "",
							}, -- [7]
							{
								["Type"] = 2,
								["Max"] = 1,
								["Desc"] = "When the cast starts it flash rapidly, adjust how fast it flashes. Value is milliseconds.",
								["Min"] = 0.05,
								["Name"] = "Flash Duration",
								["Value"] = 0.4,
								["Fraction"] = true,
								["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
								["Key"] = "flashDuration",
							}, -- [8]
							{
								["Type"] = 2,
								["Max"] = 10,
								["Desc"] = "Increases the cast bar height by this value",
								["Min"] = 0,
								["Name"] = "Cast Bar Height Mod",
								["Value"] = 5,
								["Fraction"] = false,
								["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
								["Key"] = "castBarHeight",
							}, -- [9]
							{
								["Type"] = 2,
								["Max"] = 1,
								["Desc"] = "When the cast starts, there's a small shake in the nameplate, this settings controls how long it takes.",
								["Min"] = 0.1,
								["Name"] = "Shake Duration",
								["Value"] = 0.2,
								["Fraction"] = true,
								["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
								["Key"] = "shakeDuration",
							}, -- [10]
							{
								["Type"] = 2,
								["Max"] = 100,
								["Desc"] = "How strong is the shake.",
								["Min"] = 2,
								["Fraction"] = false,
								["Value"] = 8,
								["Name"] = "Shake Amplitude",
								["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
								["Key"] = "shakeAmplitude",
							}, -- [11]
							{
								["Type"] = 2,
								["Max"] = 80,
								["Desc"] = "How fast the shake moves.",
								["Min"] = 1,
								["Fraction"] = false,
								["Value"] = 40,
								["Name"] = "Shake Frequency",
								["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
								["Key"] = "shakeFrequency",
							}, -- [12]
						},
						["OnShowCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    --don't execute on battlegrounds and arenas\n    if (Plater.ZoneInstanceType == \"arena\" or Plater.ZoneInstanceType == \"pvp\" or Plater.ZoneInstanceType == \"none\") then\n        return\n    end\n    \n    --play flash animations\n    envTable.FullBarFlash:Play()\n    \n    --envTable.currentHeight = unitFrame.castBar:GetHeight()\n    \n    --restoring the default size (not required since it already restore in the hide script)\n    if (envTable.OriginalHeight) then\n        self:SetHeight (envTable.OriginalHeight)\n    end\n    \n    --increase the cast bar size\n    local height = self:GetHeight()\n    envTable.OriginalHeight = height\n    \n    self:SetHeight (height + envTable.CastBarHeightAdd)\n    \n    Plater.SetCastBarBorderColor (self, 1, .2, .2, 0.4)\n    \n    unitFrame:PlayFrameShake (envTable.FrameShake)\n    \n    --set the color of the cast bar to dark orange (only if can be interrupted)\n    --Plater auto set this color to default when a new cast starts, no need to reset this value at OnHide.    \n    if (envTable._CanInterrupt) then\n        if (scriptTable.config.useCastbarColor) then\n            self:SetStatusBarColor (Plater:ParseColors (envTable.CastbarColor))\n        end\n    end\n    \n    envTable.BackgroundFlash:Play()\n    \n    unitFrame.castBar.Spark:SetHeight(unitFrame.castBar:GetHeight())\n    \nend\n\n\n\n\n\n\n\n\n",
					}, -- [8]
					{
						["ConstructorCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    --flash duration\n    local CONFIG_FLASH_DURATION = scriptTable.config.flashDuration\n    \n    --manually create a new texture for the flash animation\n    if (not envTable.SmallFlashTexture) then\n        envTable.SmallFlashTexture = envTable.SmallFlashTexture or Plater:CreateImage (unitFrame.castBar)\n        envTable.SmallFlashTexture:SetColorTexture (1, 1, 1)\n        envTable.SmallFlashTexture:SetAllPoints()\n    end\n    \n    --manually create a flash animation using the framework\n    if (not envTable.SmallFlashAnimationHub) then \n        \n        local onPlay = function()\n            envTable.SmallFlashTexture:Show()\n        end\n        \n        local onFinished = function()\n            envTable.SmallFlashTexture:Hide()\n        end\n        \n        local animationHub = Plater:CreateAnimationHub (envTable.SmallFlashTexture, onPlay, onFinished)\n        envTable.flashIn = Plater:CreateAnimation (animationHub, \"Alpha\", 1, CONFIG_FLASH_DURATION/2, 0, .6)\n        envTable.flashOut = Plater:CreateAnimation (animationHub, \"Alpha\", 2, CONFIG_FLASH_DURATION/2, 1, 0)\n        \n        envTable.SmallFlashAnimationHub = animationHub\n    end\n    \n    envTable.flashIn:SetDuration(scriptTable.config.flashDuration / 2)\n    envTable.flashOut:SetDuration(scriptTable.config.flashDuration / 2)\n    envTable.SmallFlashTexture:SetColorTexture (Plater:ParseColors(scriptTable.config.flashColor))\n    \nend\n\n\n\n\n\n\n\n",
						["OnHideCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    envTable.SmallFlashAnimationHub:Stop()\n    \nend\n\n\n",
						["ScriptType"] = 2,
						["UpdateCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    \n    \nend\n\n\n",
						["Time"] = 1604617585,
						["url"] = "",
						["Icon"] = "Interface\\AddOns\\Plater\\images\\cast_bar",
						["Enabled"] = true,
						["Revision"] = 595,
						["semver"] = "",
						["Author"] = "Tercioo-Sylvanas",
						["Initialization"] = "function (scriptTable)\n    --insert code here\n    \nend\n\n\n",
						["Desc"] = "Flashes the Cast Bar when a spell in the trigger list is Cast. Add spell in the Add Trigger field.",
						["NpcNames"] = {
						},
						["SpellIds"] = {
							320170, -- [1]
							320171, -- [2]
							320462, -- [3]
							330712, -- [4]
							332170, -- [5]
							333875, -- [6]
							326836, -- [7]
							342135, -- [8]
							333861, -- [9]
							341969, -- [10]
							317963, -- [11]
							327481, -- [12]
							328331, -- [13]
							322614, -- [14]
							325701, -- [15]
							326438, -- [16]
							323538, -- [17]
							321764, -- [18]
							296523, -- [19]
							330755, -- [20]
							295929, -- [21]
							296019, -- [22]
							335685, -- [23]
							170751, -- [24]
							342207, -- [25]
						},
						["PlaterCore"] = 1,
						["Name"] = "Cast - Small Alert [Plater]",
						["version"] = -1,
						["Options"] = {
							{
								["Type"] = 6,
								["Name"] = "Option 1",
								["Value"] = 0,
								["Key"] = "option1",
								["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
								["Desc"] = "",
							}, -- [1]
							{
								["Type"] = 5,
								["Name"] = "Option 2",
								["Value"] = "Plays a small animation when the cast start.",
								["Key"] = "option2",
								["Icon"] = "Interface\\AddOns\\Plater\\images\\option_label",
								["Desc"] = "",
							}, -- [2]
							{
								["Type"] = 5,
								["Key"] = "option2",
								["Value"] = "Enter the spell name or spellID of the Spell in the Add Trigger box and hit \"Add\".",
								["Name"] = "Option 2",
								["Icon"] = "Interface\\AddOns\\Plater\\images\\option_label",
								["Desc"] = "",
							}, -- [3]
							{
								["Type"] = 6,
								["Name"] = "Option 3",
								["Value"] = 0,
								["Key"] = "option3",
								["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
								["Desc"] = "",
							}, -- [4]
							{
								["Type"] = 2,
								["Max"] = 1.2,
								["Desc"] = "How long is the flash played when the cast starts.",
								["Min"] = 0.1,
								["Key"] = "flashDuration",
								["Value"] = 0.6,
								["Fraction"] = true,
								["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
								["Name"] = "Flash Duration",
							}, -- [5]
							{
								["Type"] = 1,
								["Name"] = "Flash Color",
								["Value"] = {
									1, -- [1]
									1, -- [2]
									1, -- [3]
									1, -- [4]
								},
								["Key"] = "flashColor",
								["Icon"] = "Interface\\AddOns\\Plater\\images\\option_color",
								["Desc"] = "Color of the Flash",
							}, -- [6]
						},
						["OnShowCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    envTable.SmallFlashAnimationHub:Play()\n    \nend\n\n\n",
					}, -- [9]
					{
						["ConstructorCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    --insert code here\n    \n    --check for marks\n    function  envTable.CheckMark (unitId, unitFrame)\n        if (not GetRaidTargetIndex(unitId)) then\n            if (scriptTable.config.onlyInCombat) then\n                if (not UnitAffectingCombat(unitId)) then\n                    return\n                end                \n            end\n            \n            SetRaidTarget(unitId, 8)\n        end       \n    end\nend\n\n\n--163520 - forsworn squad-leader\n--163618 - zolramus necromancer - The Necrotic Wake\n--164506 - anciet captain - theater of pain\n\n\n",
						["OnHideCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    --insert code here\n    \nend\n\n\n",
						["ScriptType"] = 3,
						["UpdateCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    --insert code here\n    envTable.CheckMark (unitId, unitFrame)\nend\n\n\n",
						["Time"] = 1604696441,
						["url"] = "",
						["Icon"] = "Interface\\Worldmap\\GlowSkull_64Grey",
						["Enabled"] = false,
						["Revision"] = 63,
						["semver"] = "",
						["Author"] = "Aelerolor-Torghast",
						["Initialization"] = "function (scriptTable)\n    --insert code here\n    \nend\n\n\n",
						["Desc"] = "Auto set skull marker",
						["NpcNames"] = {
							"163520", -- [1]
							"163618", -- [2]
							"164506", -- [3]
						},
						["SpellIds"] = {
						},
						["PlaterCore"] = 1,
						["Name"] = "Auto Set Skull",
						["version"] = -1,
						["Options"] = {
							{
								["Type"] = 5,
								["Name"] = "Option 1",
								["Value"] = "Auto set a raid target Skull on the unit.",
								["Key"] = "option1",
								["Icon"] = "Interface\\AddOns\\Plater\\images\\option_label",
								["Desc"] = "",
							}, -- [1]
							{
								["Type"] = 6,
								["Name"] = "Option 2",
								["Value"] = 0,
								["Key"] = "option2",
								["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
								["Desc"] = "",
							}, -- [2]
							{
								["Type"] = 4,
								["Name"] = "Only in Combat",
								["Value"] = false,
								["Key"] = "onlyInCombat",
								["Icon"] = "Interface\\AddOns\\Plater\\images\\option_bool",
								["Desc"] = "Set the mark only if the unit is in combat.",
							}, -- [3]
						},
						["OnShowCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    --insert code here\n    envTable.CheckMark (unitId, unitFrame)\nend\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n",
					}, -- [10]
					{
						["ConstructorCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \nend\n\n--[=[\n\n154564 - debug\n\n168098 - empowered coldheart agent\n156212 - coldheart agent\n\n\n\n--]=]",
						["OnHideCode"] = "function (self, unitId, unitFrame, envTable)\n    Plater.StopDotAnimation(unitFrame.healthBar, unitFrame.healthBar.MainTargetDotAnimation)\n    \n    --restore the nameplate size\n    local nameplateHeight = Plater.db.profile.plate_config.enemynpc.health_incombat [2]\n    unitFrame.healthBar:SetHeight (nameplateHeight)    \n    \nend\n\n\n\n\n",
						["ScriptType"] = 3,
						["UpdateCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    --check if can change the nameplate color\n    if (scriptTable.config.changeNameplateColor) then\n        Plater.SetNameplateColor (unitFrame, scriptTable.config.nameplateColor)\n    end\n    \nend\n\n\n\n\n",
						["Time"] = 1604607993,
						["url"] = "",
						["Icon"] = "Interface\\AddOns\\Plater\\media\\skullbones_64",
						["Enabled"] = true,
						["Revision"] = 406,
						["semver"] = "",
						["Author"] = "Izimode-Azralon",
						["Initialization"] = "function (scriptTable)\n    --insert code here\n    \nend\n\n\n",
						["Desc"] = "Highlight a nameplate of an important Add. Add the unit name or NpcID into the trigger box to add more.",
						["NpcNames"] = {
							"156212", -- [1]
							"168098", -- [2]
						},
						["SpellIds"] = {
						},
						["PlaterCore"] = 1,
						["Name"] = "Unit - Main Target [P]",
						["version"] = -1,
						["Options"] = {
							{
								["Type"] = 6,
								["Key"] = "option4",
								["Value"] = 0,
								["Name"] = "Blank Space",
								["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
								["Desc"] = "",
							}, -- [1]
							{
								["Type"] = 5,
								["Key"] = "option6",
								["Value"] = "Enter the npc name or npcId in the \"Add Trigger\" box and hit \"Add\".",
								["Name"] = "Option 6",
								["Icon"] = "Interface\\AddOns\\Plater\\images\\option_label",
								["Desc"] = "",
							}, -- [2]
							{
								["Type"] = 6,
								["Name"] = "Blank Space",
								["Value"] = 0,
								["Key"] = "option4",
								["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
								["Desc"] = "",
							}, -- [3]
							{
								["Type"] = 4,
								["Key"] = "changeNameplateColor",
								["Value"] = true,
								["Name"] = "Change Nameplate Color",
								["Icon"] = "Interface\\AddOns\\Plater\\images\\option_bool",
								["Desc"] = "change to true to change the color",
							}, -- [4]
							{
								["Type"] = 1,
								["Key"] = "nameplateColor",
								["Value"] = {
									1, -- [1]
									0, -- [2]
									0.5254901960784314, -- [3]
									1, -- [4]
								},
								["Name"] = "Nameplate Color",
								["Icon"] = "Interface\\AddOns\\Plater\\images\\option_color",
								["Desc"] = "",
							}, -- [5]
							{
								["Type"] = 2,
								["Max"] = 6,
								["Desc"] = "increase the nameplate height by this value",
								["Min"] = 0,
								["Name"] = "Nameplate Size Offset",
								["Value"] = 0,
								["Key"] = "nameplateSizeOffset",
								["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
								["Fraction"] = false,
							}, -- [6]
							{
								["Type"] = 6,
								["Name"] = "Blank Space",
								["Value"] = 0,
								["Key"] = "option4",
								["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
								["Desc"] = "",
							}, -- [7]
							{
								["Type"] = 1,
								["Key"] = "dotsColor",
								["Value"] = {
									1, -- [1]
									0.7137254901960784, -- [2]
									0, -- [3]
									1, -- [4]
								},
								["Name"] = "Dot Color",
								["Icon"] = "Interface\\AddOns\\Plater\\images\\option_color",
								["Desc"] = "",
							}, -- [8]
							{
								["Type"] = 6,
								["Key"] = "option4",
								["Value"] = 0,
								["Name"] = "Blank Space",
								["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
								["Desc"] = "",
							}, -- [9]
						},
						["OnShowCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    Plater.StopDotAnimation(unitFrame.healthBar, unitFrame.healthBar.MainTargetDotAnimation)\n    \n    unitFrame.healthBar.MainTargetDotAnimation = Plater.PlayDotAnimation(unitFrame.healthBar, 2, scriptTable.config.dotsColor, 3, 4) \n    \n    --increase the nameplate size\n    local nameplateHeight = Plater.db.profile.plate_config.enemynpc.health_incombat [2]\n    unitFrame.healthBar:SetHeight (nameplateHeight + scriptTable.config.nameplateSizeOffset)\n    \nend\n\n\n\n\n\n\n\n",
					}, -- [11]
					{
						["ConstructorCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    --settings (require a /reload after editing any setting)\n    do\n        --blink and glow\n        envTable.BlinkEnabled = scriptTable.config.blinkEnabled\n        envTable.GlowEnabled = scriptTable.config.glowEnabled \n        envTable.ChangeNameplateColor = scriptTable.config.changeNameplateColor;\n        envTable.TimeLeftToBlink = scriptTable.config.timeleftToBlink;\n        envTable.BlinkSpeed = scriptTable.config.blinkSpeed; \n        envTable.BlinkColor = scriptTable.config.blinkColor; \n        envTable.BlinkMaxAlpha = scriptTable.config.blinkMaxAlpha; \n        envTable.NameplateColor = scriptTable.config.nameplateColor; \n        \n        --text color\n        envTable.TimerColorEnabled = scriptTable.config.timerColorEnabled \n        envTable.TimeLeftWarning = scriptTable.config.timeLeftWarning;\n        envTable.TimeLeftCritical = scriptTable.config.timeLeftCritical;\n        envTable.TextColor_Warning = scriptTable.config.warningColor; \n        envTable.TextColor_Critical = scriptTable.config.criticalColor; \n        \n        --list of spellIDs to ignore\n        envTable.IgnoredSpellID = {\n            [12] = true, --use a simple comma here\n            [13] = true,\n        }\n    end\n    \n    \n    --private\n    do\n        --if not envTable.blinkTexture then\n        envTable.blinkTexture = Plater:CreateImage (self, \"\", 1, 1, \"overlay\")\n        envTable.blinkTexture:SetPoint ('center', 0, 0)\n        envTable.blinkTexture:Hide()\n        \n        local onPlay = function()\n            envTable.blinkTexture:Show() \n            envTable.blinkTexture.color = envTable.BlinkColor\n        end\n        local onStop = function()\n            envTable.blinkTexture:Hide()  \n        end\n        envTable.blinkAnimation = Plater:CreateAnimationHub (envTable.blinkTexture, onPlay, onStop)\n        Plater:CreateAnimation (envTable.blinkAnimation, \"ALPHA\", 1, envTable.BlinkSpeed / 2, 0, envTable.BlinkMaxAlpha)\n        Plater:CreateAnimation (envTable.blinkAnimation, \"ALPHA\", 2, envTable.BlinkSpeed / 2, envTable.BlinkMaxAlpha, 0)\n        --end\n        \n        envTable.glowEffect = envTable.glowEffect or self.overlay or Plater.CreateIconGlow (self)\n        --envTable.glowEffect = envTable.glowEffect or Plater.CreateIconGlow (self)\n        --envTable.glowEffect:Show() --envTable.glowEffect:Hide()\n        \n    end\n    \nend\n\n\n\n\n",
						["OnHideCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    envTable.blinkAnimation:Stop()\n    envTable.blinkTexture:Hide()\n    envTable.blinkAnimation:Stop()\n    envTable.glowEffect:Stop()\n    Plater:SetFontColor (self.Cooldown.Timer, Plater.db.profile.aura_timer_text_color)\nend\n\n\n",
						["OptionsValues"] = {
						},
						["Temp_OnShowCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    envTable.blinkTexture:SetSize (self:GetSize())\n    \nend\n\n\n",
						["ScriptType"] = 1,
						["Temp_Initialization"] = "function (scriptTable)\n    --insert code here\n    \nend\n\n\n",
						["Time"] = 1612566693,
						["Options"] = {
							{
								["Type"] = 6,
								["Key"] = "option10",
								["Value"] = 0,
								["Name"] = "Blank Space",
								["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
								["Desc"] = "",
							}, -- [1]
							{
								["Type"] = 5,
								["Key"] = "option17",
								["Value"] = "Enter the spell name or spellID in the Add Trigger box and hit \"Add\".",
								["Name"] = "Option 17",
								["Icon"] = "Interface\\AddOns\\Plater\\images\\option_label",
								["Desc"] = "",
							}, -- [2]
							{
								["Type"] = 6,
								["Name"] = "Blank Space",
								["Value"] = 0,
								["Key"] = "option10",
								["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
								["Desc"] = "",
							}, -- [3]
							{
								["Type"] = 4,
								["Key"] = "blinkEnabled",
								["Value"] = true,
								["Name"] = "Blink Enabled",
								["Icon"] = "Interface\\AddOns\\Plater\\images\\option_bool",
								["Desc"] = "set to 'false' to disable blink",
							}, -- [4]
							{
								["Type"] = 4,
								["Key"] = "glowEnabled",
								["Value"] = true,
								["Name"] = "Glow Enabled",
								["Icon"] = "Interface\\AddOns\\Plater\\images\\option_bool",
								["Desc"] = "set to 'false' to disable glows",
							}, -- [5]
							{
								["Type"] = 4,
								["Key"] = "changeNameplateColor",
								["Value"] = true,
								["Name"] = "Change NamePlate Color",
								["Icon"] = "Interface\\AddOns\\Plater\\images\\option_bool",
								["Desc"] = "set to 'true' to enable nameplate color change",
							}, -- [6]
							{
								["Type"] = 2,
								["Max"] = 20,
								["Desc"] = "in seconds, affects the blink effect only",
								["Min"] = 1,
								["Fraction"] = true,
								["Value"] = 3,
								["Name"] = "Timeleft to Blink",
								["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
								["Key"] = "timeleftToBlink",
							}, -- [7]
							{
								["Type"] = 2,
								["Max"] = 3,
								["Desc"] = "time to complete a blink loop",
								["Min"] = 0.5,
								["Fraction"] = true,
								["Value"] = 1,
								["Name"] = "Blink Speed",
								["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
								["Key"] = "blinkSpeed",
							}, -- [8]
							{
								["Type"] = 2,
								["Max"] = 1,
								["Desc"] = "max transparency in the animation loop (1.0 is full opaque)",
								["Min"] = 0.1,
								["Fraction"] = true,
								["Value"] = 0.6,
								["Name"] = "Blink Max Alpha",
								["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
								["Key"] = "blinkMaxAlpha",
							}, -- [9]
							{
								["Type"] = 1,
								["Key"] = "blinkColor",
								["Value"] = {
									1, -- [1]
									1, -- [2]
									1, -- [3]
									1, -- [4]
								},
								["Name"] = "Blink Color",
								["Icon"] = "Interface\\AddOns\\Plater\\images\\option_color",
								["Desc"] = "color of the blink",
							}, -- [10]
							{
								["Type"] = 1,
								["Key"] = "",
								["Value"] = {
									0.2862745098039216, -- [1]
									0.00392156862745098, -- [2]
									0, -- [3]
									1, -- [4]
								},
								["Name"] = "Nameplate Color",
								["Icon"] = "Interface\\AddOns\\Plater\\images\\option_color",
								["Desc"] = "nameplate color if ChangeNameplateColor is true",
							}, -- [11]
							{
								["Type"] = 6,
								["Name"] = "Blank Space",
								["Value"] = 0,
								["Key"] = "option10",
								["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
								["Desc"] = "",
							}, -- [12]
							{
								["Type"] = 4,
								["Key"] = "timerColorEnabled",
								["Value"] = true,
								["Name"] = "Timer Color Enabled",
								["Icon"] = "Interface\\AddOns\\Plater\\images\\option_bool",
								["Desc"] = "set to 'false' to disable changes in the color of the time left text",
							}, -- [13]
							{
								["Type"] = 2,
								["Max"] = 20,
								["Desc"] = "in seconds, affects the color of the text",
								["Min"] = 1,
								["Name"] = "Time Left Warning",
								["Value"] = 8,
								["Fraction"] = true,
								["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
								["Key"] = "timeLeftWarning",
							}, -- [14]
							{
								["Type"] = 2,
								["Max"] = 10,
								["Desc"] = "in seconds, affects the color of the text",
								["Min"] = 1,
								["Name"] = "Time Left Critical",
								["Value"] = 3,
								["Fraction"] = true,
								["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
								["Key"] = "timeLeftCritical",
							}, -- [15]
							{
								["Type"] = 1,
								["Key"] = "warningColor",
								["Value"] = {
									1, -- [1]
									0.8705882352941177, -- [2]
									0, -- [3]
									1, -- [4]
								},
								["Name"] = "Warning Color",
								["Icon"] = "Interface\\AddOns\\Plater\\images\\option_color",
								["Desc"] = "color when the time left entered in a warning zone",
							}, -- [16]
							{
								["Type"] = 1,
								["Key"] = "criticalColor",
								["Value"] = {
									1, -- [1]
									0.07450980392156863, -- [2]
									0, -- [3]
									1, -- [4]
								},
								["Name"] = "Critical Color",
								["Icon"] = "Interface\\AddOns\\Plater\\images\\option_color",
								["Desc"] = "color when the time left is critical",
							}, -- [17]
						},
						["Temp_ConstructorCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    --settings (require a /reload after editing any setting)\n    do\n        --blink and glow\n        envTable.BlinkEnabled = scriptTable.config.blinkEnabled\n        envTable.GlowEnabled = scriptTable.config.glowEnabled \n        envTable.ChangeNameplateColor = scriptTable.config.changeNameplateColor;\n        envTable.TimeLeftToBlink = scriptTable.config.timeleftToBlink;\n        envTable.BlinkSpeed = scriptTable.config.blinkSpeed; \n        envTable.BlinkColor = scriptTable.config.blinkColor; \n        envTable.BlinkMaxAlpha = scriptTable.config.blinkMaxAlpha; \n        envTable.NameplateColor = scriptTable.config.nameplateColor; \n        \n        --text color\n        envTable.TimerColorEnabled = scriptTable.config.timerColorEnabled \n        envTable.TimeLeftWarning = scriptTable.config.timeLeftWarning;\n        envTable.TimeLeftCritical = scriptTable.config.timeLeftCritical;\n        envTable.TextColor_Warning = scriptTable.config.warningColor; \n        envTable.TextColor_Critical = scriptTable.config.criticalColor; \n        \n        --list of spellIDs to ignore\n        envTable.IgnoredSpellID = {\n            [12] = true, --use a simple comma here\n            [13] = true,\n        }\n    end\n    \n    \n    --private\n    do\n        --if not envTable.blinkTexture then\n        envTable.blinkTexture = Plater:CreateImage (self, \"\", 1, 1, \"overlay\")\n        envTable.blinkTexture:SetPoint ('center', 0, 0)\n        envTable.blinkTexture:Hide()\n        \n        local onPlay = function()\n            envTable.blinkTexture:Show() \n            envTable.blinkTexture.color = envTable.BlinkColor\n        end\n        local onStop = function()\n            envTable.blinkTexture:Hide()  \n        end\n        envTable.blinkAnimation = Plater:CreateAnimationHub (envTable.blinkTexture, onPlay, onStop)\n        Plater:CreateAnimation (envTable.blinkAnimation, \"ALPHA\", 1, envTable.BlinkSpeed / 2, 0, envTable.BlinkMaxAlpha)\n        Plater:CreateAnimation (envTable.blinkAnimation, \"ALPHA\", 2, envTable.BlinkSpeed / 2, envTable.BlinkMaxAlpha, 0)\n        --end\n        \n        envTable.glowEffect = envTable.glowEffect or self.overlay or Plater.CreateIconGlow (self)\n        --envTable.glowEffect = envTable.glowEffect or Plater.CreateIconGlow (self)\n        --envTable.glowEffect:Show() --envTable.glowEffect:Hide()\n        \n    end\n    \nend\n\n\n\n\n",
						["NpcNames"] = {
						},
						["OnShowCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    envTable.blinkTexture:SetSize (self:GetSize())\n    \nend\n\n\n",
						["Enabled"] = true,
						["Revision"] = 372,
						["semver"] = "",
						["version"] = -1,
						["Temp_UpdateCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    local timeLeft = envTable._RemainingTime\n    \n    --check if the spellID isn't being ignored\n    if (envTable.IgnoredSpellID [envTable._SpellID]) then\n        return\n    end\n    \n    --check the time left and start or stop the blink animation and also check if the time left is > zero\n    if ((envTable.BlinkEnabled or envTable.GlowEnabled) and timeLeft > 0) then\n        if (timeLeft < envTable.TimeLeftToBlink) then\n            --blink effect\n            if (envTable.BlinkEnabled) then\n                if (not envTable.blinkAnimation:IsPlaying()) then\n                    envTable.blinkAnimation:Play()\n                end\n            end\n            --glow effect\n            if (envTable.GlowEnabled) then\n                envTable.glowEffect:Show()\n            end\n            --nameplate color\n            if (envTable.ChangeNameplateColor) then\n                Plater.SetNameplateColor (unitFrame, envTable.NameplateColor)\n            end\n        else\n            --blink effect\n            if (envTable.blinkAnimation:IsPlaying()) then\n                envTable.blinkAnimation:Stop()\n            end\n            --glow effect\n            if (envTable.GlowEnabled and envTable.glowEffect:IsShown()) then\n                envTable.glowEffect:Hide()\n            end\n        end\n    end\n    \n    --timer color\n    if (envTable.TimerColorEnabled and timeLeft > 0) then\n        if (timeLeft < envTable.TimeLeftCritical) then\n            Plater:SetFontColor (self.Cooldown.Timer, envTable.TextColor_Critical)\n        elseif (timeLeft < envTable.TimeLeftWarning) then\n            Plater:SetFontColor (self.Cooldown.Timer, envTable.TextColor_Warning)        \n        else\n            Plater:SetFontColor (self.Cooldown.Timer, Plater.db.profile.aura_timer_text_color)\n        end\n    end\n    \nend",
						["Author"] = "Izimode-Azralon",
						["Initialization"] = "function (scriptTable)\n    --insert code here\n    \nend\n\n\n",
						["Desc"] = "Blink, change the number and nameplate color. Add the debuffs int he trigger box. Set settings on constructor script.",
						["SpellIds"] = {
						},
						["Prio"] = 99,
						["Name"] = "Aura - Blink by Time Left [Plater]",
						["PlaterCore"] = 1,
						["Icon"] = "Interface\\AddOns\\Plater\\images\\icon_aura_blink",
						["url"] = "",
						["Temp_OnHideCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    envTable.blinkAnimation:Stop()\n    envTable.blinkTexture:Hide()\n    envTable.blinkAnimation:Stop()\n    envTable.glowEffect:Stop()\n    Plater:SetFontColor (self.Cooldown.Timer, Plater.db.profile.aura_timer_text_color)\nend\n\n\n",
						["UpdateCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    local timeLeft = envTable._RemainingTime\n    \n    --check if the spellID isn't being ignored\n    if (envTable.IgnoredSpellID [envTable._SpellID]) then\n        return\n    end\n    \n    --check the time left and start or stop the blink animation and also check if the time left is > zero\n    if ((envTable.BlinkEnabled or envTable.GlowEnabled) and timeLeft > 0) then\n        if (timeLeft < envTable.TimeLeftToBlink) then\n            --blink effect\n            if (envTable.BlinkEnabled) then\n                if (not envTable.blinkAnimation:IsPlaying()) then\n                    envTable.blinkAnimation:Play()\n                end\n            end\n            --glow effect\n            if (envTable.GlowEnabled) then\n                envTable.glowEffect:Show()\n            end\n            --nameplate color\n            if (envTable.ChangeNameplateColor) then\n                Plater.SetNameplateColor (unitFrame, envTable.NameplateColor)\n            end\n        else\n            --blink effect\n            if (envTable.blinkAnimation:IsPlaying()) then\n                envTable.blinkAnimation:Stop()\n            end\n            --glow effect\n            if (envTable.GlowEnabled and envTable.glowEffect:IsShown()) then\n                envTable.glowEffect:Hide()\n            end\n        end\n    end\n    \n    --timer color\n    if (envTable.TimerColorEnabled and timeLeft > 0) then\n        if (timeLeft < envTable.TimeLeftCritical) then\n            Plater:SetFontColor (self.Cooldown.Timer, envTable.TextColor_Critical)\n        elseif (timeLeft < envTable.TimeLeftWarning) then\n            Plater:SetFontColor (self.Cooldown.Timer, envTable.TextColor_Warning)        \n        else\n            Plater:SetFontColor (self.Cooldown.Timer, Plater.db.profile.aura_timer_text_color)\n        end\n    end\n    \nend",
					}, -- [12]
					{
						["ConstructorCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    --insert code here\n    \n    envTable.npcInfo = {\n        [164427] = {secondCastBar = true, timer = 20, timerId = 321247, altCastId = \"1\", name = \"Boom!\"}, --reanimated warrior - plaguefall\n        \n        [164414] = {secondCastBar = true, timer = 20, timerId = 321247, altCastId = \"2\", name = \"Boom!\"}, --reanimated mage - plaguefall\n        \n        [164185] = {secondCastBar = true, timer = 20, timerId = 319941, altCastId = \"3\", remaining = 5, name = GetSpellInfo(319941)}, --Echelon - Halls of Atonement\n        \n        [164567] = {secondCastBar = true, altCastId = \"dromanswrath\", debuffTimer = 323059, name = GetSpellInfo(323059), spellIcon = 323059}, --Ingra Maloch -- tirna scythe\n        \n        [165408] = {secondCastBar = true, timer = 20, timerId = 322711, altCastId = \"4\", remaining = 5, name = GetSpellInfo(322711)}, --Halkias - Refracted Sinlight - Halls of Atonement\n        \n        \n        --[154564] = {secondCastBar = true, timerId = \"Test Bar\", altCastId = \"debugcast\", remaining = 5, name = GetSpellInfo(319941), spellIcon = 319941}, --debug \"Test (1)\" BW \"Test Bar\" DBM --DEBUG\n        --[154580] = {secondCastBar = true, altCastId = \"debugcast\", debuffTimer = 204242, name = GetSpellInfo(81297), spellIcon = 81297}, --debug \"Test (1)\" BW \"Test Bar\" DBM --DEBUG\n    }\n    \n    --set the castbar config\n    local config = {\n        iconTexture = \"\",\n        iconTexcoord = {0.1, 0.9, 0.1, 0.9},\n        iconAlpha = 1,\n        iconSize = 14,\n        \n        text = \"Boom!\",\n        textSize = 9,\n        \n        texture = [[Interface\\AddOns\\Plater\\images\\bar_background]],\n        color = \"silver\",\n        \n        isChanneling = false,\n        canInterrupt = false,\n        \n        height = 2,\n        width = Plater.db.profile.plate_config.enemynpc.health_incombat[1],\n        \n        spellNameAnchor = {side = 3, x = 0, y = -2},\n        timerAnchor = {side = 5, x = 0, y = -2},\n    }    \n    \n    function envTable.ShowAltCastBar(npcInfo, unitFrame, unitId, customTime, customStart)\n        --show the cast bar\n        if (npcInfo.timerId) then\n            local barObject = Plater.GetBossTimer(npcInfo.timerId)\n            if (barObject) then\n                if (npcInfo.remaining) then\n                    local timeLeft = barObject.timer + barObject.start - GetTime()\n                    if (timeLeft > npcInfo.remaining) then\n                        return\n                    end\n                end\n                \n                config.text = npcInfo.name\n                \n                if (npcInfo.spellIcon) then\n                    local _, _, iconTexture = GetSpellInfo(npcInfo.spellIcon)\n                    config.iconTexture = iconTexture\n                else\n                    config.iconTexture = \"\"\n                end\n                \n                Plater.SetAltCastBar(unitFrame.PlateFrame, config, barObject.timer, customStart or barObject.start, npcInfo.altCastId)\n            end\n        else\n            Plater.SetAltCastBar(unitFrame.PlateFrame, config, customTime or npcInfo.timer, customStart, npcInfo.altCastId)            \n        end\n        \n        DetailsFramework:TruncateText(unitFrame.castBar2.Text, unitFrame.castBar2:GetWidth() - 16)\n    end\nend",
						["OnHideCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    --insert code here\n    Plater.ClearAltCastBar(unitFrame.PlateFrame)\nend",
						["OptionsValues"] = {
						},
						["Temp_OnShowCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    local npcInfo = envTable.npcInfo[envTable._NpcID]\n    \n    if (npcInfo and npcInfo.secondCastBar) then\n        if (npcInfo.debuffTimer) then\n            if (Plater.NameplateHasAura (unitFrame, npcInfo.debuffTimer)) then\n                \n                local name = npcInfo.name\n                local _, _, _, _, duration, expirationTime = AuraUtil.FindAuraByName(name, unitId, \"DEBUFF\")\n                \n                envTable.ShowAltCastBar(npcInfo, unitFrame, unitId, duration, expirationTime-duration)\n            else\n                if (unitFrame.castBar2:IsShown()) then\n                    local altCastId = Plater.GetAltCastBarAltId(unitFrame.PlateFrame)\n                    if (altCastId == npcInfo.altCastId) then\n                        Plater.ClearAltCastBar(unitFrame.PlateFrame)\n                    end                   \n                end                              \n            end\n        else\n            envTable.ShowAltCastBar(npcInfo, unitFrame, unitId)\n        end\n    end\nend\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n",
						["ScriptType"] = 3,
						["UpdateCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    local npcInfo = envTable.npcInfo[envTable._NpcID]\n    \n    if (npcInfo and npcInfo.secondCastBar) then\n        if (npcInfo.timerId) then\n            local barObject = Plater.GetBossTimer(npcInfo.timerId)\n            if (barObject) then\n                local altCastId = Plater.GetAltCastBarAltId(unitFrame.PlateFrame)\n                if (altCastId ~= npcInfo.altCastId or not unitFrame.castBar2:IsShown()) then\n                    envTable.ShowAltCastBar(npcInfo, unitFrame, unitId)\n                end\n            end \n            \n        elseif (npcInfo.debuffTimer) then\n            if (Plater.NameplateHasAura (unitFrame, npcInfo.debuffTimer)) then\n                \n                --get the debuff timeleft\n                local name = npcInfo.name\n                local _, _, _, _, duration, expirationTime = AuraUtil.FindAuraByName(name, unitId, \"DEBUFF\")\n                local startTime = expirationTime - duration\n                \n                if (not unitFrame.castBar2:IsShown() or unitFrame.castBar2.spellStartTime < startTime) then\n                    envTable.ShowAltCastBar(npcInfo, unitFrame, unitId, duration, startTime)\n                end\n                \n            else \n                if (unitFrame.castBar2:IsShown()) then\n                    local altCastId = Plater.GetAltCastBarAltId(unitFrame.PlateFrame)\n                    if (altCastId == npcInfo.altCastId) then\n                        Plater.ClearAltCastBar(unitFrame.PlateFrame)\n                    end                   \n                end                              \n            end\n        end\n    end\nend\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n",
						["Time"] = 1612566703,
						["NpcNames"] = {
							"164427", -- [1]
							"164414", -- [2]
							"164185", -- [3]
							"164567", -- [4]
							"165408", -- [5]
						},
						["url"] = "",
						["Icon"] = "Interface\\AddOns\\Plater\\Images\\countdown_bar_icon",
						["Options"] = {
						},
						["Enabled"] = true,
						["Revision"] = 207,
						["semver"] = "",
						["version"] = -1,
						["Temp_UpdateCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    local npcInfo = envTable.npcInfo[envTable._NpcID]\n    \n    if (npcInfo and npcInfo.secondCastBar) then\n        if (npcInfo.timerId) then\n            local barObject = Plater.GetBossTimer(npcInfo.timerId)\n            if (barObject) then\n                local altCastId = Plater.GetAltCastBarAltId(unitFrame.PlateFrame)\n                if (altCastId ~= npcInfo.altCastId or not unitFrame.castBar2:IsShown()) then\n                    envTable.ShowAltCastBar(npcInfo, unitFrame, unitId)\n                end\n            end \n            \n        elseif (npcInfo.debuffTimer) then\n            if (Plater.NameplateHasAura (unitFrame, npcInfo.debuffTimer)) then\n                \n                --get the debuff timeleft\n                local name = npcInfo.name\n                local _, _, _, _, duration, expirationTime = AuraUtil.FindAuraByName(name, unitId, \"DEBUFF\")\n                local startTime = expirationTime - duration\n                \n                if (not unitFrame.castBar2:IsShown() or unitFrame.castBar2.spellStartTime < startTime) then\n                    envTable.ShowAltCastBar(npcInfo, unitFrame, unitId, duration, startTime)\n                end\n                \n            else \n                if (unitFrame.castBar2:IsShown()) then\n                    local altCastId = Plater.GetAltCastBarAltId(unitFrame.PlateFrame)\n                    if (altCastId == npcInfo.altCastId) then\n                        Plater.ClearAltCastBar(unitFrame.PlateFrame)\n                    end                   \n                end                              \n            end\n        end\n    end\nend\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n",
						["Author"] = "Aelerolor-Torghast",
						["Initialization"] = "function (scriptTable)\n    --insert code here\n    \nend\n\n\n",
						["Desc"] = "Some units has special events without a clear way to show. This script adds a second cast bar to inform the user about it.",
						["SpellIds"] = {
						},
						["Prio"] = 99,
						["Name"] = "Countdown",
						["PlaterCore"] = 1,
						["OnShowCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    local npcInfo = envTable.npcInfo[envTable._NpcID]\n    \n    if (npcInfo and npcInfo.secondCastBar) then\n        if (npcInfo.debuffTimer) then\n            if (Plater.NameplateHasAura (unitFrame, npcInfo.debuffTimer)) then\n                \n                local name = npcInfo.name\n                local _, _, _, _, duration, expirationTime = AuraUtil.FindAuraByName(name, unitId, \"DEBUFF\")\n                \n                envTable.ShowAltCastBar(npcInfo, unitFrame, unitId, duration, expirationTime-duration)\n            else\n                if (unitFrame.castBar2:IsShown()) then\n                    local altCastId = Plater.GetAltCastBarAltId(unitFrame.PlateFrame)\n                    if (altCastId == npcInfo.altCastId) then\n                        Plater.ClearAltCastBar(unitFrame.PlateFrame)\n                    end                   \n                end                              \n            end\n        else\n            envTable.ShowAltCastBar(npcInfo, unitFrame, unitId)\n        end\n    end\nend\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n",
						["Temp_ConstructorCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    --insert code here\n    \n    envTable.npcInfo = {\n        [164427] = {secondCastBar = true, timer = 20, timerId = 321247, altCastId = \"1\", name = \"Boom!\"}, --reanimated warrior - plaguefall\n        \n        [164414] = {secondCastBar = true, timer = 20, timerId = 321247, altCastId = \"2\", name = \"Boom!\"}, --reanimated mage - plaguefall\n        \n        [164185] = {secondCastBar = true, timer = 20, timerId = 319941, altCastId = \"3\", remaining = 5, name = GetSpellInfo(319941)}, --Echelon - Halls of Atonement\n        \n        [164567] = {secondCastBar = true, altCastId = \"dromanswrath\", debuffTimer = 323059, name = GetSpellInfo(323059), spellIcon = 323059}, --Ingra Maloch -- tirna scythe\n        \n        [165408] = {secondCastBar = true, timer = 20, timerId = 322711, altCastId = \"4\", remaining = 5, name = GetSpellInfo(322711)}, --Halkias - Refracted Sinlight - Halls of Atonement\n        \n        \n        --[154564] = {secondCastBar = true, timerId = \"Test Bar\", altCastId = \"debugcast\", remaining = 5, name = GetSpellInfo(319941), spellIcon = 319941}, --debug \"Test (1)\" BW \"Test Bar\" DBM --DEBUG\n        --[154580] = {secondCastBar = true, altCastId = \"debugcast\", debuffTimer = 204242, name = GetSpellInfo(81297), spellIcon = 81297}, --debug \"Test (1)\" BW \"Test Bar\" DBM --DEBUG\n    }\n    \n    --set the castbar config\n    local config = {\n        iconTexture = \"\",\n        iconTexcoord = {0.1, 0.9, 0.1, 0.9},\n        iconAlpha = 1,\n        iconSize = 14,\n        \n        text = \"Boom!\",\n        textSize = 9,\n        \n        texture = [[Interface\\AddOns\\Plater\\images\\bar_background]],\n        color = \"silver\",\n        \n        isChanneling = false,\n        canInterrupt = false,\n        \n        height = 2,\n        width = Plater.db.profile.plate_config.enemynpc.health_incombat[1],\n        \n        spellNameAnchor = {side = 3, x = 0, y = -2},\n        timerAnchor = {side = 5, x = 0, y = -2},\n    }    \n    \n    function envTable.ShowAltCastBar(npcInfo, unitFrame, unitId, customTime, customStart)\n        --show the cast bar\n        if (npcInfo.timerId) then\n            local barObject = Plater.GetBossTimer(npcInfo.timerId)\n            if (barObject) then\n                if (npcInfo.remaining) then\n                    local timeLeft = barObject.timer + barObject.start - GetTime()\n                    if (timeLeft > npcInfo.remaining) then\n                        return\n                    end\n                end\n                \n                config.text = npcInfo.name\n                \n                if (npcInfo.spellIcon) then\n                    local _, _, iconTexture = GetSpellInfo(npcInfo.spellIcon)\n                    config.iconTexture = iconTexture\n                else\n                    config.iconTexture = \"\"\n                end\n                \n                Plater.SetAltCastBar(unitFrame.PlateFrame, config, barObject.timer, customStart or barObject.start, npcInfo.altCastId)\n            end\n        else\n            Plater.SetAltCastBar(unitFrame.PlateFrame, config, customTime or npcInfo.timer, customStart, npcInfo.altCastId)            \n        end\n        \n        DetailsFramework:TruncateText(unitFrame.castBar2.Text, unitFrame.castBar2:GetWidth() - 16)\n    end\nend",
						["Temp_OnHideCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    --insert code here\n    Plater.ClearAltCastBar(unitFrame.PlateFrame)\nend",
						["Temp_Initialization"] = "function (scriptTable)\n    --insert code here\n    \nend\n\n\n",
					}, -- [13]
					{
						["ConstructorCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    --insert code here\n    \n    envTable.lifePercent = {\n        --npcId         percent divisions\n        [154564] = {80, 30},   --debug\n        [164451] = {40}, --dessia the decapirator - theater of pain\n        [164463] = {40}, --Paceran the Virulent - theater of pain\n        [164461] = {40}, -- Sathel the Accursed - theater of pain\n        [165946]= {50}, -- ~mordretha - thather of pain\n        [164501] = {70, 40, 10}, --mistcaller - tina scythe\n        [164218] = {70, 40}, --Lord Chamberlain - Halls of Atonement\n    }\n    \n    function envTable.CreateMarker(unitFrame)\n        unitFrame.healthMarker = unitFrame.healthBar:CreateTexture(nil, \"overlay\")\n        unitFrame.healthMarker:SetColorTexture(1, 1, 1)\n        unitFrame.healthMarker:SetSize(1, unitFrame.healthBar:GetHeight())\n        \n        unitFrame.healthOverlay = unitFrame.healthBar:CreateTexture(nil, \"overlay\")\n        unitFrame.healthOverlay:SetColorTexture(1, 1, 1)\n        unitFrame.healthOverlay:SetSize(1, unitFrame.healthBar:GetHeight())\n    end\n    \n    function envTable.UpdateMarkers(unitFrame)\n        local markersTable = envTable.lifePercent[envTable._NpcID]\n        if (markersTable) then\n            local unitLifePercent = envTable._HealthPercent / 100\n            for i, percent in ipairs(markersTable) do\n                percent = percent / 100\n                if (unitLifePercent > percent) then\n                    if (not unitFrame.healthMarker) then\n                        envTable.CreateMarker(unitFrame)\n                    end\n                    \n                    unitFrame.healthMarker:Show()\n                    local width = unitFrame.healthBar:GetWidth()\n                    unitFrame.healthMarker:SetPoint(\"left\", unitFrame.healthBar, \"left\", width*percent, 0)\n                    \n                    local overlaySize = width * (unitLifePercent - percent)\n                    unitFrame.healthOverlay:SetWidth(overlaySize)\n                    unitFrame.healthOverlay:SetPoint(\"left\", unitFrame.healthMarker, \"right\", 0, 0)\n                    \n                    unitFrame.healthMarker:SetVertexColor(Plater:ParseColors(scriptTable.config.indicatorColor))\n                    unitFrame.healthMarker:SetAlpha(scriptTable.config.indicatorAlpha)\n                    \n                    unitFrame.healthOverlay:SetVertexColor(Plater:ParseColors(scriptTable.config.fillColor))\n                    unitFrame.healthOverlay:SetAlpha(scriptTable.config.fillAlpha)\n                    \n                    return\n                end\n            end --end for\n            \n            if (unitFrame.healthMarker and unitFrame.healthMarker:IsShown()) then\n                unitFrame.healthMarker:Hide()\n                unitFrame.healthOverlay:Hide()\n            end\n        end\n    end\nend      \n\n\n\n\n\n",
						["OnHideCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    if (unitFrame.healthMarker) then\n        unitFrame.healthMarker:Hide()\n        unitFrame.healthOverlay:Hide()\n    end\nend\n\n\n\n\n",
						["ScriptType"] = 3,
						["UpdateCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    --insert code here\n    envTable.UpdateMarkers(unitFrame)\nend\n\n\n",
						["Time"] = 1606506781,
						["url"] = "",
						["Icon"] = "Interface\\AddOns\\Plater\\images\\health_indicator",
						["Enabled"] = true,
						["Revision"] = 109,
						["semver"] = "",
						["Author"] = "Aelerolor-Torghast",
						["Initialization"] = "function (scriptTable)\n    --insert code here\n    \nend\n\n\n",
						["Desc"] = "Place a marker into the health bar to indicate when the unit will change phase or cast an important spell.",
						["NpcNames"] = {
							"164451", -- [1]
							"164463", -- [2]
							"164461", -- [3]
							"165946", -- [4]
							"164501", -- [5]
							"164218", -- [6]
						},
						["SpellIds"] = {
						},
						["PlaterCore"] = 1,
						["Name"] = "Unit - Health Markers [P]",
						["version"] = -1,
						["Options"] = {
							{
								["Type"] = 5,
								["Key"] = "option1",
								["Value"] = "Add markers into the health bar to remind you about boss abilities at life percent.",
								["Name"] = "Option 1",
								["Icon"] = "Interface\\AddOns\\Plater\\images\\option_label",
								["Desc"] = "",
							}, -- [1]
							{
								["Type"] = 6,
								["Key"] = "",
								["Value"] = 0,
								["Name"] = "blank line",
								["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
								["Desc"] = "",
							}, -- [2]
							{
								["Type"] = 1,
								["Key"] = "indicatorColor",
								["Value"] = {
									1, -- [1]
									1, -- [2]
									1, -- [3]
									1, -- [4]
								},
								["Name"] = "Vertical Line Color",
								["Icon"] = "Interface\\AddOns\\Plater\\images\\option_color",
								["Desc"] = "Indicator color.",
							}, -- [3]
							{
								["Type"] = 2,
								["Max"] = 1,
								["Desc"] = "Indicator alpha.",
								["Min"] = 0.1,
								["Name"] = "Vertical Line Alpha",
								["Value"] = 0.79,
								["Fraction"] = true,
								["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
								["Key"] = "indicatorAlpha",
							}, -- [4]
							{
								["Type"] = 6,
								["Name"] = "blank line",
								["Value"] = 0,
								["Key"] = "",
								["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
								["Desc"] = "",
							}, -- [5]
							{
								["Type"] = 1,
								["Name"] = "Fill Color",
								["Value"] = {
									1, -- [1]
									1, -- [2]
									1, -- [3]
									1, -- [4]
								},
								["Key"] = "fillColor",
								["Icon"] = "Interface\\AddOns\\Plater\\images\\option_color",
								["Desc"] = "Fill color.",
							}, -- [6]
							{
								["Type"] = 2,
								["Max"] = 1,
								["Desc"] = "Fill alpha.",
								["Min"] = 0,
								["Fraction"] = true,
								["Value"] = 0.2,
								["Key"] = "fillAlpha",
								["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
								["Name"] = "Fill Alpha",
							}, -- [7]
						},
						["OnShowCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    --insert code here\n    envTable.UpdateMarkers(unitFrame)\nend\n\n\n",
					}, -- [14]
					{
						["ConstructorCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    envTable.movingArrow = envTable.movingArrow or Plater:CreateImage (self, [[Interface\\PETBATTLES\\PetBattle-StatIcons]], 16, self:GetHeight(), \"background\", {0, 15/32, 18/32, 30/32})\n    \n    --envTable.movingArrow.color = scriptTable.config.arrowColor\n    envTable.movingArrow:SetAlpha (scriptTable.config.arrowAlpha)\n    envTable.movingArrow:SetDesaturated (scriptTable.config.desaturateArrow)\n    \n    envTable.movingAnimation = envTable.movingAnimation or Plater:CreateAnimationHub (envTable.movingArrow, \n        function() \n            envTable.movingArrow:Show() \n            envTable.movingArrow:SetPoint(\"left\", 0, 0)\n        end, \n        function() envTable.movingArrow:Hide() end)\n    \n    envTable.movingAnimation:SetLooping (\"REPEAT\")\n    \n    envTable.arrowAnimation = envTable.arrowAnimation or Plater:CreateAnimation (envTable.movingAnimation, \"translation\", 1, 0.20, self:GetWidth()-16, 0)\n    \n    envTable.arrowAnimation:SetDuration(scriptTable.config.animSpeed)\nend\n\n\n\n\n",
						["OnHideCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    envTable.movingAnimation:Stop()\nend\n\n\n",
						["ScriptType"] = 2,
						["UpdateCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \nend",
						["Time"] = 1604599443,
						["url"] = "",
						["Icon"] = "Interface\\AddOns\\Plater\\images\\cast_bar_frontal",
						["Enabled"] = true,
						["Revision"] = 460,
						["semver"] = "",
						["Author"] = "Izimode-Azralon",
						["Initialization"] = "function (scriptTable)\n    --insert code here\n    \nend\n\n\n",
						["Desc"] = "Does an animation for casts that affect the frontal area of the enemy. Add spell in the Add Trigger field.",
						["NpcNames"] = {
						},
						["SpellIds"] = {
							323489, -- [1]
							323496, -- [2]
							319941, -- [3]
							319592, -- [4]
							334266, -- [5]
							325258, -- [6]
							334913, -- [7]
							326221, -- [8]
							322936, -- [9]
							323236, -- [10]
							321834, -- [11]
							336752, -- [12]
							325418, -- [13]
							324667, -- [14]
							327233, -- [15]
							324368, -- [16]
							324205, -- [17]
							323943, -- [18]
							319713, -- [19]
							320596, -- [20]
							320729, -- [21]
							323608, -- [22]
							330614, -- [23]
							320063, -- [24]
							332708, -- [25]
							334023, -- [26]
							317231, -- [27]
							317943, -- [28]
							320966, -- [29]
							334053, -- [30]
							328458, -- [31]
							321968, -- [32]
							331718, -- [33]
							325793, -- [34]
							330453, -- [35]
							326997, -- [36]
							334051, -- [37]
							292903, -- [38]
							330843, -- [39]
							294173, -- [40]
							189200, -- [41]
						},
						["PlaterCore"] = 1,
						["Name"] = "Cast - Frontal Cone [Plater]",
						["version"] = -1,
						["Options"] = {
							{
								["Type"] = 6,
								["Name"] = "Option 1",
								["Value"] = 0,
								["Key"] = "option1",
								["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
								["Desc"] = "",
							}, -- [1]
							{
								["Type"] = 5,
								["Name"] = "Option 2",
								["Value"] = "Produces an effect to indicate the spell will hit players in front of the enemy.",
								["Key"] = "option2",
								["Icon"] = "Interface\\AddOns\\Plater\\images\\option_label",
								["Desc"] = "",
							}, -- [2]
							{
								["Type"] = 5,
								["Name"] = "Option 4",
								["Value"] = "Enter the spell name or spellID of the Spell in the Add Trigger box and hit \"Add\".",
								["Key"] = "option4",
								["Icon"] = "Interface\\AddOns\\Plater\\images\\option_label",
								["Desc"] = "",
							}, -- [3]
							{
								["Type"] = 6,
								["Name"] = "Option 3",
								["Value"] = 0,
								["Key"] = "option3",
								["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
								["Desc"] = "",
							}, -- [4]
							{
								["Type"] = 2,
								["Max"] = 1,
								["Desc"] = "Set the alpha of the moving arrow",
								["Min"] = 0,
								["Key"] = "arrowAlpha",
								["Value"] = 0.275,
								["Name"] = "Arrow Alpha",
								["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
								["Fraction"] = true,
							}, -- [5]
							{
								["Type"] = 2,
								["Max"] = 1,
								["Desc"] = "Time that takes for an arrow to travel from the to right.",
								["Min"] = 0,
								["Key"] = "animSpeed",
								["Value"] = 0.2,
								["Name"] = "Animation Speed",
								["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
								["Fraction"] = true,
							}, -- [6]
							{
								["Type"] = 4,
								["Name"] = "Use White Arrow",
								["Value"] = false,
								["Key"] = "desaturateArrow",
								["Icon"] = "Interface\\AddOns\\Plater\\images\\option_bool",
								["Desc"] = "If enabled, the arrow color will be desaturated.",
							}, -- [7]
						},
						["OnShowCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    envTable.movingAnimation:Play()\nend\n\n\n",
					}, -- [15]
					{
						["ConstructorCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.FixateTarget = Plater:CreateLabel (unitFrame);\n    envTable.FixateTarget:SetPoint (\"bottom\", unitFrame.BuffFrame, \"top\", 0, 10);    \n    \n    envTable.FixateIcon = Plater:CreateImage (unitFrame, 236188, 16, 16, \"overlay\");\n    envTable.FixateIcon:SetPoint (\"bottom\", envTable.FixateTarget, \"top\", 0, 4);    \n    \n    envTable.FixateTarget:Hide()\n    envTable.FixateIcon:Hide()\nend\n\n--165560 = Gormling Larva - MTS\n\n\n\n\n\n\n",
						["OnHideCode"] = "function (self, unitId, unitFrame, envTable)\n    envTable.FixateTarget:Hide()\n    envTable.FixateIcon:Hide()\nend\n\n\n",
						["ScriptType"] = 3,
						["UpdateCode"] = "function (self, unitId, unitFrame, envTable)\n    local targetName = UnitName (unitId .. \"target\");\n    if (targetName) then\n        local _, class = UnitClass (unitId .. \"target\");\n        targetName = Plater.SetTextColorByClass (unitId .. \"target\", targetName);\n        envTable.FixateTarget.text = targetName;\n        \n        envTable.FixateTarget:Show();\n        envTable.FixateIcon:Show();\n    end    \nend\n\n\n",
						["Time"] = 1604239880,
						["url"] = "",
						["Icon"] = 1029718,
						["Enabled"] = true,
						["Revision"] = 269,
						["semver"] = "",
						["Author"] = "Celian-Sylvanas",
						["Initialization"] = "function (scriptTable)\n    --insert code here\n    \nend\n\n\n\n\n\n\n",
						["Desc"] = "Show above the nameplate who is the player fixated",
						["NpcNames"] = {
							"165560", -- [1]
						},
						["SpellIds"] = {
						},
						["PlaterCore"] = 1,
						["Name"] = "Fixate [Plater]",
						["version"] = -1,
						["Options"] = {
						},
						["OnShowCode"] = "function (self, unitId, unitFrame, envTable)\n    \nend\n\n\n",
					}, -- [16]
					{
						["ConstructorCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    --castbar color (when can be interrupted)\n    envTable.CastbarColor = scriptTable.config.castbarColor\n    \n    --flash duration\n    local CONFIG_BACKGROUND_FLASH_DURATION = scriptTable.config.flashDuration\n    \n    --add this value to the cast bar height\n    envTable.CastBarHeightAdd = scriptTable.config.castBarHeight\n    \n    --create a fast flash above the cast bar\n    envTable.FullBarFlash = envTable.FullBarFlash or Plater.CreateFlash (self, 0.05, 1, \"white\")\n    \n    --create a camera shake for the nameplate\n    envTable.FrameShake = Plater:CreateFrameShake (unitFrame, scriptTable.config.shakeDuration, scriptTable.config.shakeAmplitude, scriptTable.config.shakeFrequency, false, false, 0, 1, 0.05, 0.1, Plater.GetPoints (unitFrame))\n    \n    --create a texture to use for a flash behind the cast bar\n    local backGroundFlashTexture = Plater:CreateImage (self, [[Interface\\ACHIEVEMENTFRAME\\UI-Achievement-Alert-Glow]], self:GetWidth()+60, self:GetHeight()+50, \"background\", {0, 400/512, 0, 170/256})\n    backGroundFlashTexture:SetBlendMode (\"ADD\")\n    backGroundFlashTexture:SetPoint (\"center\", self, \"center\")\n    backGroundFlashTexture:Hide()\n    \n    --create the animation hub to hold the flash animation sequence\n    envTable.BackgroundFlash = envTable.BackgroundFlash or Plater:CreateAnimationHub (backGroundFlashTexture, \n        function()\n            backGroundFlashTexture:Show()\n        end,\n        function()\n            backGroundFlashTexture:Hide()\n        end\n    )\n    \n    --create the flash animation sequence\n    envTable.BackgroundFlash.fadeIn = envTable.BackgroundFlash.fadeIn or Plater:CreateAnimation (envTable.BackgroundFlash, \"ALPHA\", 1, CONFIG_BACKGROUND_FLASH_DURATION/2, 0, .75)\n    envTable.BackgroundFlash.fadeIn:SetDuration(CONFIG_BACKGROUND_FLASH_DURATION/2)\n    \n    envTable.BackgroundFlash.fadeOut = envTable.BackgroundFlash.fadeOut or Plater:CreateAnimation (envTable.BackgroundFlash, \"ALPHA\", 2, CONFIG_BACKGROUND_FLASH_DURATION/2, 1, 0)    \n    envTable.BackgroundFlash.fadeOut:SetDuration(CONFIG_BACKGROUND_FLASH_DURATION/2)\n    \n    --envTable.BackgroundFlash:Play() --envTable.BackgroundFlash:Stop()    \n    \n    \n    \n    \n    \nend\n\n\n",
						["OnHideCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    if (not Plater.IsPlayerTank()) then\n        return\n    end\n    \n    --don't execute on battlegrounds and arenas\n    if (Plater.ZoneInstanceType == \"arena\" or Plater.ZoneInstanceType == \"pvp\") then\n        return\n    end    \n    \n    unitFrame.castBar:SetHeight (envTable._DefaultHeight)\n    \n    --stop the camera shake\n    unitFrame:StopFrameShake (envTable.FrameShake)\n    \n    envTable.FullBarFlash:Stop()\n    envTable.BackgroundFlash:Stop()\n    \n    unitFrame.castBar.Spark:SetHeight(unitFrame.castBar:GetHeight())\n    \nend\n\n\n\n\n\n",
						["ScriptType"] = 2,
						["UpdateCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \nend\n\n\n",
						["Time"] = 1604593143,
						["url"] = "",
						["Icon"] = "Interface\\AddOns\\Plater\\images\\cast_bar_tank",
						["Enabled"] = true,
						["Revision"] = 833,
						["semver"] = "",
						["Author"] = "Tercioo-Sylvanas",
						["Initialization"] = "function (scriptTable)\n    --insert code here\n    \nend",
						["Desc"] = "Cast alert for abilities which only the tank can interrupt.",
						["NpcNames"] = {
						},
						["SpellIds"] = {
							321828, -- [1]
						},
						["PlaterCore"] = 1,
						["Name"] = "Cast - Tank Interrupt [P]",
						["version"] = -1,
						["Options"] = {
							{
								["Type"] = 6,
								["Name"] = "Blank Line",
								["Value"] = 0,
								["Key"] = "option1",
								["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
								["Desc"] = "",
							}, -- [1]
							{
								["Type"] = 5,
								["Name"] = "Option 2",
								["Value"] = "Produces a notable effect in the cast bar when a spell from the 'Triggers' starts to cast.",
								["Key"] = "option2",
								["Icon"] = "Interface\\AddOns\\Plater\\images\\option_label",
								["Desc"] = "",
							}, -- [2]
							{
								["Type"] = 5,
								["Name"] = "Option 3",
								["Value"] = "Enter the spell name or spellID of the Spell in the Add Trigger box and hit \"Add\".",
								["Key"] = "option3",
								["Icon"] = "Interface\\AddOns\\Plater\\images\\option_label",
								["Desc"] = "",
							}, -- [3]
							{
								["Type"] = 6,
								["Name"] = "Blank Space",
								["Value"] = 0,
								["Key"] = "option4",
								["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
								["Desc"] = "",
							}, -- [4]
							{
								["Type"] = 4,
								["Name"] = "Cast Bar Color Enabled",
								["Value"] = true,
								["Key"] = "useCastbarColor",
								["Icon"] = "Interface\\AddOns\\Plater\\images\\option_bool",
								["Desc"] = "When enabled, changes the cast bar color,",
							}, -- [5]
							{
								["Type"] = 1,
								["Name"] = "Cast Bar Color",
								["Value"] = {
									1, -- [1]
									0.4313725490196079, -- [2]
									0, -- [3]
									1, -- [4]
								},
								["Key"] = "castbarColor",
								["Icon"] = "Interface\\AddOns\\Plater\\images\\option_color",
								["Desc"] = "Color of the cast bar.",
							}, -- [6]
							{
								["Type"] = 6,
								["Name"] = "Blank Line",
								["Value"] = 0,
								["Key"] = "option7",
								["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
								["Desc"] = "",
							}, -- [7]
							{
								["Type"] = 2,
								["Max"] = 1,
								["Desc"] = "When the cast starts it flash rapidly, adjust how fast it flashes. Value is milliseconds.",
								["Min"] = 0.05,
								["Key"] = "flashDuration",
								["Value"] = 0.2,
								["Name"] = "Flash Duration",
								["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
								["Fraction"] = true,
							}, -- [8]
							{
								["Type"] = 2,
								["Max"] = 10,
								["Desc"] = "Increases the cast bar height by this value",
								["Min"] = 0,
								["Key"] = "castBarHeight",
								["Value"] = 0,
								["Name"] = "Cast Bar Height Mod",
								["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
								["Fraction"] = false,
							}, -- [9]
							{
								["Type"] = 2,
								["Max"] = 1,
								["Desc"] = "When the cast starts, there's a small shake in the nameplate, this settings controls how long it takes.",
								["Min"] = 0.1,
								["Key"] = "shakeDuration",
								["Value"] = 0.1,
								["Name"] = "Shake Duration",
								["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
								["Fraction"] = true,
							}, -- [10]
							{
								["Type"] = 2,
								["Max"] = 200,
								["Desc"] = "How strong is the shake.",
								["Min"] = 10,
								["Key"] = "shakeAmplitude",
								["Value"] = 25,
								["Fraction"] = false,
								["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
								["Name"] = "Shake Amplitude",
							}, -- [11]
							{
								["Type"] = 2,
								["Max"] = 80,
								["Desc"] = "How fast the shake moves.",
								["Min"] = 1,
								["Key"] = "shakeFrequency",
								["Value"] = 30,
								["Fraction"] = false,
								["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
								["Name"] = "Shake Frequency",
							}, -- [12]
						},
						["OnShowCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    if (not Plater.IsPlayerTank()) then\n        return\n    end\n    \n    --don't execute on battlegrounds and arenas\n    if (Plater.ZoneInstanceType == \"arena\" or Plater.ZoneInstanceType == \"pvp\") then\n        return\n    end\n    \n    --play flash animations\n    envTable.FullBarFlash:Play()\n    \n    --envTable.currentHeight = unitFrame.castBar:GetHeight()\n    \n    --restoring the default size (not required since it already restore in the hide script)\n    if (envTable.OriginalHeight) then\n        self:SetHeight (envTable.OriginalHeight)\n    end\n    \n    --increase the cast bar size\n    local height = self:GetHeight()\n    envTable.OriginalHeight = height\n    \n    self:SetHeight (height + envTable.CastBarHeightAdd)\n    \n    Plater.SetCastBarBorderColor (self, 1, .2, .2, 0.4)\n    \n    unitFrame:PlayFrameShake (envTable.FrameShake)\n    \n    --set the color of the cast bar to dark orange (only if can be interrupted)\n    --Plater auto set this color to default when a new cast starts, no need to reset this value at OnHide.    \n    if (envTable._CanInterrupt) then\n        if (scriptTable.config.useCastbarColor) then\n            self:SetStatusBarColor (Plater:ParseColors (envTable.CastbarColor))\n        end\n    end\n    \n    envTable.BackgroundFlash:Play()\n    \n    unitFrame.castBar.Spark:SetHeight(unitFrame.castBar:GetHeight())\n    \nend\n\n\n\n\n\n\n\n\n",
					}, -- [17]
					{
						["ConstructorCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    envTable.EnergyAmount = Plater:CreateLabel (unitFrame, \"\", 16, \"silver\");\n    envTable.EnergyAmount:SetPoint (\"bottom\", unitFrame, \"top\", 0, 18);    \n    \n    envTable.EnergyAmount.fontsize = scriptTable.config.fontSize\n    envTable.EnergyAmount.fontcolor = scriptTable.config.fontColor\n    envTable.EnergyAmount.outline = scriptTable.config.outline\n    \n    \nend\n\n--[=[\n\n164406 = Shriekwing\n164407 = Sludgefist\n162100 = kryxis the voracious\n162099 = general kaal - sanguine depths\n162329 = Xav the Unfallen - threater of pain\n--]=]",
						["OnHideCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    envTable.EnergyAmount:Hide()\nend\n\n\n",
						["ScriptType"] = 3,
						["UpdateCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    local currentPower = UnitPower(unitId)\n    \n    if (currentPower and currentPower > 0) then\n        local maxPower = UnitPowerMax (unitId)\n        local percent = floor (currentPower / maxPower * 100)\n        \n        envTable.EnergyAmount.text = \"\" .. percent;\n        \n        if (scriptTable.config.showLater) then\n            local alpha = (percent -80) * 5\n            alpha = alpha / 100\n            alpha = max(0, alpha)\n            envTable.EnergyAmount:SetAlpha(alpha)\n            \n        else\n            envTable.EnergyAmount:SetAlpha(1.0)\n        end\n        \n        \n    else\n        envTable.EnergyAmount.text = \"\"\n    end\nend\n\n\n\n\n\n\n\n\n",
						["Time"] = 1604357453,
						["url"] = "",
						["Icon"] = 136048,
						["Enabled"] = true,
						["Revision"] = 233,
						["semver"] = "",
						["Author"] = "Celian-Sylvanas",
						["Initialization"] = "function (scriptTable)\n    --insert code here\n    \nend\n\n\n",
						["Desc"] = "Show the energy amount above the nameplate.",
						["NpcNames"] = {
							"164406", -- [1]
							"164407", -- [2]
							"162100", -- [3]
							"162099", -- [4]
							"162329", -- [5]
							"164558", -- [6]
						},
						["SpellIds"] = {
						},
						["PlaterCore"] = 1,
						["Name"] = "Unit - Show Energy [Plater]",
						["version"] = -1,
						["Options"] = {
							{
								["Type"] = 6,
								["Name"] = "Option 1",
								["Value"] = 0,
								["Key"] = "option1",
								["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
								["Desc"] = "",
							}, -- [1]
							{
								["Type"] = 5,
								["Name"] = "script desc",
								["Value"] = "Show the power of the unit above the nameplate.",
								["Key"] = "option3",
								["Icon"] = "Interface\\AddOns\\Plater\\images\\option_label",
								["Desc"] = "",
							}, -- [2]
							{
								["Type"] = 5,
								["Key"] = "option3",
								["Value"] = "Add the unit name or unitId in the \"Add Trigger\" field and press \"Add\".",
								["Name"] = "add trigger",
								["Icon"] = "Interface\\AddOns\\Plater\\images\\option_label",
								["Desc"] = "",
							}, -- [3]
							{
								["Type"] = 6,
								["Name"] = "Option 2",
								["Value"] = 0,
								["Key"] = "option2",
								["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
								["Desc"] = "",
							}, -- [4]
							{
								["Type"] = 4,
								["Name"] = "Show at 80% of Energy",
								["Value"] = true,
								["Key"] = "showLater",
								["Icon"] = "Interface\\AddOns\\Plater\\images\\option_bool",
								["Desc"] = "If enabled, the energy won't start showing until the unit has 80% energy.",
							}, -- [5]
							{
								["Type"] = 6,
								["Key"] = "option2",
								["Value"] = 0,
								["Name"] = "Option 2",
								["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
								["Desc"] = "",
							}, -- [6]
							{
								["Type"] = 2,
								["Max"] = 32,
								["Desc"] = "Text size.",
								["Min"] = 8,
								["Key"] = "fontSize",
								["Value"] = 16,
								["Name"] = "Text Size",
								["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
								["Fraction"] = false,
							}, -- [7]
							{
								["Type"] = 1,
								["Name"] = "Font Color",
								["Value"] = {
									0.803921568627451, -- [1]
									0.803921568627451, -- [2]
									0.803921568627451, -- [3]
									1, -- [4]
								},
								["Key"] = "fontColor",
								["Icon"] = "Interface\\AddOns\\Plater\\images\\option_color",
								["Desc"] = "Color of the text.",
							}, -- [8]
							{
								["Type"] = 4,
								["Name"] = "Enable Text Outline",
								["Value"] = true,
								["Key"] = "outline",
								["Icon"] = "Interface\\AddOns\\Plater\\images\\option_bool",
								["Desc"] = "If enabled, the text uses outline.",
							}, -- [9]
						},
						["OnShowCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    envTable.EnergyAmount:Show()\nend\n\n\n",
					}, -- [18]
					{
						["ConstructorCode"] = "--todo: add npc ids for multilanguage support\n\nfunction (self, unitId, unitFrame, envTable)\n    \n    --settings\n    envTable.TextAboveNameplate = \"** On You **\"\n    envTable.NameplateColor = \"green\"\n    \n    --label to show the text above the nameplate\n    envTable.FixateTarget = Plater:CreateLabel (unitFrame);\n    envTable.FixateTarget:SetPoint (\"bottom\", unitFrame.healthBar, \"top\", 0, 30);\n    \n    --the spell casted by the npc in the trigger list needs to be in the list below as well\n    local spellList = {\n        [321891] = \"Freeze Tag Fixation\", --Illusionary Vulpin - MTS\n        \n    }\n    \n    --build the list with localized spell names\n    envTable.FixateDebuffs = {}\n    for spellID, enUSSpellName in pairs (spellList) do\n        local localizedSpellName = GetSpellInfo (spellID)\n        envTable.FixateDebuffs [localizedSpellName or enUSSpellName] = true\n    end\n    \n    --debug - smuggled crawg\n    envTable.FixateDebuffs [\"Jagged Maw\"] = true\n    \nend\n\n--[=[\nNpcIDs:\n136461: Spawn of G'huun (mythic uldir G'huun)\n\n--]=]\n\n\n\n\n",
						["OnHideCode"] = "function (self, unitId, unitFrame, envTable)\n    envTable.FixateTarget:SetText (\"\")\n    envTable.FixateTarget:Hide()\n    \n    envTable.IsFixated = false\n    \n    Plater.RefreshNameplateColor (unitFrame)\nend\n\n\n",
						["ScriptType"] = 3,
						["UpdateCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --swap this to true when it is fixated\n    local isFixated = false\n    \n    --check the debuffs the player has and see if any of these debuffs has been placed by this unit\n    for debuffId = 1, 40 do\n        local name, texture, count, debuffType, duration, expirationTime, caster = UnitDebuff (\"player\", debuffId)\n        \n        --cancel the loop if there's no more debuffs on the player\n        if (not name) then \n            break \n        end\n        \n        --check if the owner of the debuff is this unit\n        if (envTable.FixateDebuffs [name] and caster and UnitIsUnit (caster, unitId)) then\n            --the debuff the player has, has been placed by this unit, set the name above the unit name\n            envTable.FixateTarget:SetText (envTable.TextAboveNameplate)\n            envTable.FixateTarget:Show()\n            Plater.SetNameplateColor (unitFrame,  envTable.NameplateColor)\n            isFixated = true\n            \n            if (not envTable.IsFixated) then\n                envTable.IsFixated = true\n                Plater.FlashNameplateBody (unitFrame, \"fixate\", .2)\n            end\n        end\n        \n    end\n    \n    --check if the nameplate color is changed but isn't fixated any more\n    if (not isFixated and envTable.IsFixated) then\n        --refresh the nameplate color\n        Plater.RefreshNameplateColor (unitFrame)\n        --reset the text\n        envTable.FixateTarget:SetText (\"\")\n        \n        envTable.IsFixated = false\n    end\n    \nend\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n",
						["Time"] = 1604087921,
						["url"] = "",
						["Icon"] = 841383,
						["Enabled"] = true,
						["Revision"] = 266,
						["semver"] = "",
						["Author"] = "Tecno-Azralon",
						["Desc"] = "When an enemy places a debuff and starts to chase you. This script changes the nameplate color and place your name above the nameplate as well.",
						["NpcNames"] = {
						},
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
						["PlaterCore"] = 1,
						["Name"] = "Fixate On You [Plater]",
						["version"] = -1,
						["Options"] = {
						},
						["OnShowCode"] = "function (self, unitId, unitFrame, envTable)\n    \nend\n\n\n",
					}, -- [19]
				},
				["aura_cache_by_name"] = {
				},
				["health_cutoff_upper"] = false,
				["aura2_y_offset"] = 5,
				["cast_statusbar_color_nointerrupt"] = {
					1, -- [1]
					0, -- [2]
					0.00784313725490196, -- [3]
					0.9600000008940697, -- [4]
				},
				["npc_cache"] = {
				},
				["indicator_worldboss"] = false,
				["aura_width2"] = 16,
				["aura_show_crowdcontrol"] = true,
				["health_cutoff"] = false,
				["hook_data_trash"] = {
					{
						["Enabled"] = true,
						["Revision"] = 3,
						["OptionsValues"] = {
						},
						["LastHookEdited"] = "Name Updated",
						["Author"] = "Luckyone-Laughing Skull",
						["PlaterCore"] = 1,
						["Desc"] = "",
						["Hooks"] = {
							["Name Updated"] = "function (self, unitId, unitFrame, envTable, modTable)\n    local name = UnitName(unit)\n    if name and strfind(name, '%s') then\n        name = Abbrev(name)\n    end\n    \n    return name\nend\n\n\n",
						},
						["__TrashAt"] = 1612553535,
						["Time"] = 1612553513,
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
							["race"] = {
							},
							["affix"] = {
							},
							["encounter_ids"] = {
							},
							["spec"] = {
							},
						},
						["Name"] = "Name - Last",
						["HooksTemp"] = {
							["Name Updated"] = "function (self, unitId, unitFrame, envTable, modTable)\n    local name = UnitName(unit)\n    if name and strfind(name, '%s') then\n        name = Abbrev(name)\n    end\n    \n    return name\nend\n\n\n",
						},
						["Options"] = {
						},
						["Prio"] = 99,
					}, -- [1]
					{
						["OptionsValues"] = {
						},
						["HooksTemp"] = {
							["Constructor"] = "function (self, unitId, unitFrame, envTable)\n    \n    --list of npcs and their colors, can be inserted:\n    --name of the unit\n    --name of the unit in lower case\n    --npcID of the unit\n    \n    --color can be added as:\n    --color names: \"red\", \"yellow\"\n    --color hex: \"#FF0000\", \"#FFFF00\"\n    --color table: {1, 0, 0}, {1, 1, 0}    \n    \n    envTable.ListOfNpcs = {\n        [61146] = \"olive\", --monk statue npcID\n        [103822] = \"olive\", --druid treant npcID\n        \n    }\n    \n    \nend\n\n\n\n\n",
							["Nameplate Updated"] = "function (self, unitId, unitFrame, envTable)\n    \n    --get the GUID of the target of the unit\n    local targetGUID = UnitGUID (unitId .. \"target\")\n    \n    if (targetGUID) then\n        \n        --get the npcID of the target\n        local npcID = Plater.GetNpcIDFromGUID (targetGUID)\n        --check if the npcID of this unit is in the npc list \n        if (envTable.ListOfNpcs [npcID]) then\n            Plater.SetNameplateColor (unitFrame, envTable.ListOfNpcs [npcID])\n            \n        else\n            --check if the name of ths unit is in the list\n            local unitName = UnitName (unitId .. \"target\")\n            if (envTable.ListOfNpcs [unitName]) then\n                Plater.SetNameplateColor (unitFrame, envTable.ListOfNpcs [unitName])\n                \n            else\n                --check if the name of the unit in lower case is in the npc list\n                unitName = string.lower (unitName)\n                if (envTable.ListOfNpcs [unitName]) then\n                    Plater.SetNameplateColor (unitFrame, envTable.ListOfNpcs [unitName])                \n                    \n                end\n            end\n        end\n        \n    end\nend\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n",
						},
						["Hooks"] = {
							["Nameplate Updated"] = "function (self, unitId, unitFrame, envTable)\n    \n    --get the GUID of the target of the unit\n    local targetGUID = UnitGUID (unitId .. \"target\")\n    \n    if (targetGUID) then\n        \n        --get the npcID of the target\n        local npcID = Plater.GetNpcIDFromGUID (targetGUID)\n        --check if the npcID of this unit is in the npc list \n        if (envTable.ListOfNpcs [npcID]) then\n            Plater.SetNameplateColor (unitFrame, envTable.ListOfNpcs [npcID])\n            \n        else\n            --check if the name of ths unit is in the list\n            local unitName = UnitName (unitId .. \"target\")\n            if (envTable.ListOfNpcs [unitName]) then\n                Plater.SetNameplateColor (unitFrame, envTable.ListOfNpcs [unitName])\n                \n            else\n                --check if the name of the unit in lower case is in the npc list\n                unitName = string.lower (unitName)\n                if (envTable.ListOfNpcs [unitName]) then\n                    Plater.SetNameplateColor (unitFrame, envTable.ListOfNpcs [unitName])                \n                    \n                end\n            end\n        end\n        \n    end\nend\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n",
							["Constructor"] = "function (self, unitId, unitFrame, envTable)\n    \n    --list of npcs and their colors, can be inserted:\n    --name of the unit\n    --name of the unit in lower case\n    --npcID of the unit\n    \n    --color can be added as:\n    --color names: \"red\", \"yellow\"\n    --color hex: \"#FF0000\", \"#FFFF00\"\n    --color table: {1, 0, 0}, {1, 1, 0}    \n    \n    envTable.ListOfNpcs = {\n        [61146] = \"olive\", --monk statue npcID\n        [103822] = \"olive\", --druid treant npcID\n        \n    }\n    \n    \nend\n\n\n\n\n",
						},
						["__TrashAt"] = 1612563990,
						["Time"] = 1547993111,
						["LoadConditions"] = {
							["talent"] = {
							},
							["group"] = {
							},
							["class"] = {
							},
							["map_ids"] = {
							},
							["race"] = {
							},
							["pvptalent"] = {
							},
							["spec"] = {
							},
							["affix"] = {
							},
							["encounter_ids"] = {
							},
							["role"] = {
							},
						},
						["url"] = "",
						["Icon"] = "Interface\\AddOns\\Plater\\images\\icon_attacking_unit",
						["Enabled"] = false,
						["Revision"] = 222,
						["Options"] = {
						},
						["Author"] = "Kastfall-Azralon",
						["Desc"] = "Change the nameplate color if the unit is attacking a specific unit like Monk's Ox Statue or Druid's Treants. You may edit which units it track in the constructor script.",
						["version"] = -1,
						["PlaterCore"] = 1,
						["Name"] = "Attacking Specific Unit [Plater]",
						["LastHookEdited"] = "",
						["semver"] = "",
					}, -- [2]
					{
						["OptionsValues"] = {
						},
						["HooksTemp"] = {
							["Initialization"] = "function (modTable)\n    \n    --ATTENTION: after enabling this mod, you may have to adjust the anchor point at the Buff Settings tab\n    \n    local sortByTime = false\n    local invertSort = false\n    \n    --which auras goes first, assign a value (any number), bigger value goes first\n    local priority = {\n        [\"Vampiric Touch\"] = 50,\n        [\"Shadow Word: Pain\"] = 22,\n        [\"Mind Flay\"] = 5,\n        [\"Pistol Shot\"] = 50,\n        [\"Marked for Death\"] = 99,\n    }\n    \n    -- Sort function - do not touch\n    Plater.db.profile.aura_sort = true\n    \n    \n    function Plater.AuraIconsSortFunction (aura1, aura2)\n        local p1 = priority[aura1.SpellId] or priority[aura1.SpellName] or 1\n        local p2 = priority[aura2.SpellId] or priority[aura2.SpellName] or 1\n        \n        if sortByTime and p1 == p2 then\n            if invertSort then\n                return (aura1.Duration == 0 and 99999999 or aura1.RemainingTime or 0) > (aura2.Duration == 0 and 99999999 or aura2.RemainingTime or 0)\n            else\n                return (aura1.Duration == 0 and 99999999 or aura1.RemainingTime or 0) < (aura2.Duration == 0 and 99999999 or aura2.RemainingTime or 0)\n            end\n        else\n            if invertSort then\n                 return p1 < p2\n            else\n                return p1 > p2\n            end\n        end\n    end\n    \nend\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n",
						},
						["Hooks"] = {
							["Initialization"] = "function (modTable)\n    \n    --ATTENTION: after enabling this mod, you may have to adjust the anchor point at the Buff Settings tab\n    \n    local sortByTime = false\n    local invertSort = false\n    \n    --which auras goes first, assign a value (any number), bigger value goes first\n    local priority = {\n        [\"Vampiric Touch\"] = 50,\n        [\"Shadow Word: Pain\"] = 22,\n        [\"Mind Flay\"] = 5,\n        [\"Pistol Shot\"] = 50,\n        [\"Marked for Death\"] = 99,\n    }\n    \n    -- Sort function - do not touch\n    Plater.db.profile.aura_sort = true\n    \n    \n    function Plater.AuraIconsSortFunction (aura1, aura2)\n        local p1 = priority[aura1.SpellId] or priority[aura1.SpellName] or 1\n        local p2 = priority[aura2.SpellId] or priority[aura2.SpellName] or 1\n        \n        if sortByTime and p1 == p2 then\n            if invertSort then\n                return (aura1.Duration == 0 and 99999999 or aura1.RemainingTime or 0) > (aura2.Duration == 0 and 99999999 or aura2.RemainingTime or 0)\n            else\n                return (aura1.Duration == 0 and 99999999 or aura1.RemainingTime or 0) < (aura2.Duration == 0 and 99999999 or aura2.RemainingTime or 0)\n            end\n        else\n            if invertSort then\n                 return p1 < p2\n            else\n                return p1 > p2\n            end\n        end\n    end\n    \nend\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n",
						},
						["__TrashAt"] = 1612563996,
						["Time"] = 1608663128,
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
						["url"] = "",
						["Icon"] = "Interface\\AddOns\\Plater\\images\\icon_aura_reorder",
						["Enabled"] = false,
						["Revision"] = 356,
						["Options"] = {
						},
						["Author"] = "Ditador-Azralon",
						["Desc"] = "Reorder buffs and debuffs following the settings set in the constructor.",
						["version"] = -1,
						["PlaterCore"] = 1,
						["Name"] = "Aura Reorder [Plater]",
						["LastHookEdited"] = "",
						["semver"] = "",
					}, -- [3]
					{
						["OptionsValues"] = {
						},
						["HooksTemp"] = {
							["Nameplate Created"] = "function (self, unitId, unitFrame, envTable)\n    \n    --run constructor!\n    --constructor is executed only once when any script of the hook runs.\n    \nend\n\n\n",
							["Nameplate Added"] = "function (self, unitId, unitFrame, envTable)\n    \n    --check if need update the amount of combo points shown\n    if (envTable.LastPlayerTalentUpdate > envTable.LastUpdate) then\n        envTable.UpdateComboPointAmount()\n    end    \n    \n    if (unitFrame.namePlateIsTarget and not unitFrame.IsSelf) then\n        envTable.ComboPointFrame:Show()\n        envTable.UpdateComboPoints()\n        \n    else\n        envTable.ComboPointFrame:Hide()\n    end    \n    \nend\n\n\n",
							["Target Changed"] = "function (self, unitId, unitFrame, envTable)\n    \n    --check if this nameplate is the current target\n    if (unitFrame.namePlateIsTarget and not unitFrame.IsSelf) then\n        envTable.ComboPointFrame:Show()\n        envTable.UpdateComboPoints()\n    else\n        envTable.ComboPointFrame:Hide()\n    end\n    \nend\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n",
							["Player Power Update"] = "function (self, unitId, unitFrame, envTable)\n    \n    if (unitFrame.namePlateIsTarget and not unitFrame.IsSelf) then\n        envTable.UpdateComboPoints()\n    end\n    \n    \nend\n\n\n\n\n\n\n",
							["Nameplate Removed"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.ComboPointFrame:Hide()\n    \nend\n\n\n",
							["Destructor"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.ComboPointFrame:Hide()\n    \nend\n\n\n\n\n",
							["Player Talent Update"] = "function (self, unitId, unitFrame, envTable)\n    \n    --update the amount of comboo points shown when the player changes talents or specialization\n    envTable.UpdateComboPointAmount()\n    \n    --save the time of the last talent change\n    envTable.LastPlayerTalentUpdate = GetTime()\n    \n    \nend\n\n\n",
							["Constructor"] = "function (self, unitId, unitFrame, envTable)\n    --settings\n    local anchors = {\n        {\"bottom\", unitFrame.healthBar, \"top\", 0, 24},\n    }\n    \n    local sizes = {\n        width = 12,\n        height = 12,\n        scale = 1,\n    }\n    \n    local textures = {\n        backgroundTexture = [[Interface\\PLAYERFRAME\\ClassOverlayComboPoints]],\n        backgroundTexCoords = {0/128, 21/128, 101/128, 122/128},\n        \n        comboPointTexture = [[Interface\\PLAYERFRAME\\ClassOverlayComboPoints]],\n        comboPointTexCoords = {3/128, 18/128, 81/128, 96/128},\n    }\n    \n    local frameLevel = 1000\n    local frameStrata = \"high\"    \n    \n    --private\n    do\n        --store combo points frames on this table\n        envTable.ComboPoints = {}\n        --save when the player changed talents or spec\n        envTable.LastPlayerTalentUpdate = GetTime()\n        --save when this nameplate got a combo point amount and alignment update        \n        \n        --build combo points frame anchor (combo point are anchored to this)\n        if (not unitFrame.PlaterComboPointFrame) then\n            local hostFrame = CreateFrame (\"frame\", nil, unitFrame)\n            hostFrame.ComboPointFramesPool = {}\n            unitFrame.PlaterComboPointFrame = hostFrame\n            envTable.ComboPointFrame = hostFrame\n            envTable.ComboPointFrame:SetScale (sizes.scale)\n            \n            --DetailsFramework:ApplyStandardBackdrop (envTable.ComboPointFrame) --debug anchor size\n            \n            --animations\n            local onPlayShowAnimation = function (animation)\n                --stop the hide animation if it's playing\n                if (animation:GetParent():GetParent().HideAnimation:IsPlaying()) then\n                    animation:GetParent():GetParent().HideAnimation:Stop()\n                end\n                \n                animation:GetParent():Show()\n            end\n            \n            local onPlayHideAnimation = function (animation)\n                --stop the show animation if it's playing\n                if (animation:GetParent():GetParent().ShowAnimation:IsPlaying()) then\n                    animation:GetParent():GetParent().ShowAnimation:Stop()\n                end\n            end        \n            local onStopHideAnimation = function (animation)\n                animation:GetParent():Hide()       \n            end\n            \n            local createAnimations = function (comboPoint)\n                --on show\n                comboPoint.ShowAnimation = Plater:CreateAnimationHub (comboPoint.comboPointTexture, onPlayShowAnimation, nil)\n                Plater:CreateAnimation (comboPoint.ShowAnimation, \"scale\", 1, 0.1, 0, 0, 1, 1)\n                Plater:CreateAnimation (comboPoint.ShowAnimation, \"alpha\", 1, 0.1, .5, 1)\n                Plater:CreateAnimation (comboPoint.ShowAnimation, \"scale\", 2, 0.1, 1.2, 1.2, 1, 1)\n                \n                --on hide\n                comboPoint.HideAnimation = Plater:CreateAnimationHub (comboPoint.comboPointTexture, onPlayHideAnimation, onStopHideAnimation)\n                Plater:CreateAnimation (comboPoint.HideAnimation, \"scale\", 1, 0.1, 1, 1, 0, 0)\n                Plater:CreateAnimation (comboPoint.HideAnimation, \"alpha\", 1, 0.1, 1, 0)\n            end\n            \n            --build combo point frame        \n            for i =1, 10 do \n                local f = CreateFrame (\"frame\", nil, envTable.ComboPointFrame)\n                f:SetSize (sizes.width, sizes.height)\n                tinsert (envTable.ComboPoints, f)\n                tinsert (unitFrame.PlaterComboPointFrame.ComboPointFramesPool, f)\n                \n                local backgroundTexture = f:CreateTexture (nil, \"background\")\n                backgroundTexture:SetTexture (textures.backgroundTexture)\n                backgroundTexture:SetTexCoord (unpack (textures.backgroundTexCoords))\n                backgroundTexture:SetSize (sizes.width, sizes.height)\n                backgroundTexture:SetPoint (\"center\")\n                \n                local comboPointTexture = f:CreateTexture (nil, \"artwork\")\n                comboPointTexture:SetTexture (textures.comboPointTexture)\n                comboPointTexture:SetTexCoord (unpack (textures.comboPointTexCoords))\n                \n                comboPointTexture:SetSize (sizes.width, sizes.height)\n                comboPointTexture:SetPoint (\"center\")\n                comboPointTexture:Hide()            \n                \n                f.IsActive = false\n                \n                f.backgroundTexture = backgroundTexture\n                f.comboPointTexture = comboPointTexture\n                \n                createAnimations (f)\n            end\n            \n        else\n            envTable.ComboPointFrame = unitFrame.PlaterComboPointFrame\n            envTable.ComboPointFrame:SetScale (sizes.scale)\n            envTable.ComboPoints = unitFrame.PlaterComboPointFrame.ComboPointFramesPool\n            \n        end            \n        \n        envTable.ComboPointFrame:SetFrameLevel (frameLevel)\n        envTable.ComboPointFrame:SetFrameStrata (frameStrata)\n        \n        function envTable.UpdateComboPoints()\n            local comboPoints = UnitPower (\"player\", Enum.PowerType.ComboPoints)\n            \n            for i = 1, envTable.TotalComboPoints do\n                local thisComboPoint = envTable.ComboPoints [i]\n                \n                if (i <= comboPoints ) then\n                    --combo point enabled\n                    if (not thisComboPoint.IsActive) then\n                        thisComboPoint.ShowAnimation:Play()\n                        thisComboPoint.IsActive = true\n                        \n                    end\n                    \n                else\n                    --combo point disabled\n                    if (thisComboPoint.IsActive) then\n                        thisComboPoint.HideAnimation:Play()\n                        thisComboPoint.IsActive = false\n                        \n                    end\n                end\n            end\n            \n            \n        end\n        \n        function envTable.UpdateComboPointAmount()\n            local namePlateWidth = Plater.db.profile.plate_config.enemynpc.health_incombat[1]\n            local comboPoints = UnitPowerMax (\"player\", Enum.PowerType.ComboPoints)\n            local reservedSpace = (namePlateWidth - sizes.width * comboPoints)  / comboPoints \n            \n            --store the total amount of combo points\n            envTable.TotalComboPoints = comboPoints\n            \n            --update anchor frame\n            envTable.ComboPointFrame:SetWidth (namePlateWidth)\n            envTable.ComboPointFrame:SetHeight (20)\n            envTable.ComboPointFrame:ClearAllPoints()\n            for i = 1, #anchors do\n                local anchor = anchors[i]\n                envTable.ComboPointFrame:SetPoint (unpack (anchor))\n            end        \n            \n            --\n            for i = 1, #envTable.ComboPoints do\n                envTable.ComboPoints[i]:Hide()\n                envTable.ComboPoints[i]:ClearAllPoints()\n            end\n            \n            for i = 1, comboPoints do\n                local comboPoint = envTable.ComboPoints[i]\n                if i == 1 then\n                    comboPoint:SetPoint (\"left\", envTable.ComboPointFrame, \"left\", reservedSpace/2, 0)\n                else\n                    comboPoint:SetPoint (\"left\", envTable.ComboPoints[i-1], \"right\", reservedSpace, 0)\n                end\n                \n                comboPoint:Show()\n            end\n            \n            envTable.LastUpdate = GetTime()\n            \n            envTable.UpdateComboPoints()\n        end\n        \n        --initialize\n        envTable.UpdateComboPointAmount()\n        envTable.ComboPointFrame:Hide()\n    end\n    \n    \nend",
						},
						["Hooks"] = {
							["Nameplate Created"] = "function (self, unitId, unitFrame, envTable)\n    \n    --run constructor!\n    --constructor is executed only once when any script of the hook runs.\n    \nend\n\n\n",
							["Nameplate Added"] = "function (self, unitId, unitFrame, envTable)\n    \n    --check if need update the amount of combo points shown\n    if (envTable.LastPlayerTalentUpdate > envTable.LastUpdate) then\n        envTable.UpdateComboPointAmount()\n    end    \n    \n    if (unitFrame.namePlateIsTarget and not unitFrame.IsSelf) then\n        envTable.ComboPointFrame:Show()\n        envTable.UpdateComboPoints()\n        \n    else\n        envTable.ComboPointFrame:Hide()\n    end    \n    \nend\n\n\n",
							["Target Changed"] = "function (self, unitId, unitFrame, envTable)\n    \n    --check if this nameplate is the current target\n    if (unitFrame.namePlateIsTarget and not unitFrame.IsSelf) then\n        envTable.ComboPointFrame:Show()\n        envTable.UpdateComboPoints()\n    else\n        envTable.ComboPointFrame:Hide()\n    end\n    \nend\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n",
							["Player Power Update"] = "function (self, unitId, unitFrame, envTable)\n    \n    if (unitFrame.namePlateIsTarget and not unitFrame.IsSelf) then\n        envTable.UpdateComboPoints()\n    end\n    \n    \nend\n\n\n\n\n\n\n",
							["Nameplate Removed"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.ComboPointFrame:Hide()\n    \nend\n\n\n",
							["Destructor"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.ComboPointFrame:Hide()\n    \nend\n\n\n\n\n",
							["Player Talent Update"] = "function (self, unitId, unitFrame, envTable)\n    \n    --update the amount of comboo points shown when the player changes talents or specialization\n    envTable.UpdateComboPointAmount()\n    \n    --save the time of the last talent change\n    envTable.LastPlayerTalentUpdate = GetTime()\n    \n    \nend\n\n\n",
							["Constructor"] = "function (self, unitId, unitFrame, envTable)\n    --settings\n    local anchors = {\n        {\"bottom\", unitFrame.healthBar, \"top\", 0, 24},\n    }\n    \n    local sizes = {\n        width = 12,\n        height = 12,\n        scale = 1,\n    }\n    \n    local textures = {\n        backgroundTexture = [[Interface\\PLAYERFRAME\\ClassOverlayComboPoints]],\n        backgroundTexCoords = {0/128, 21/128, 101/128, 122/128},\n        \n        comboPointTexture = [[Interface\\PLAYERFRAME\\ClassOverlayComboPoints]],\n        comboPointTexCoords = {3/128, 18/128, 81/128, 96/128},\n    }\n    \n    local frameLevel = 1000\n    local frameStrata = \"high\"    \n    \n    --private\n    do\n        --store combo points frames on this table\n        envTable.ComboPoints = {}\n        --save when the player changed talents or spec\n        envTable.LastPlayerTalentUpdate = GetTime()\n        --save when this nameplate got a combo point amount and alignment update        \n        \n        --build combo points frame anchor (combo point are anchored to this)\n        if (not unitFrame.PlaterComboPointFrame) then\n            local hostFrame = CreateFrame (\"frame\", nil, unitFrame)\n            hostFrame.ComboPointFramesPool = {}\n            unitFrame.PlaterComboPointFrame = hostFrame\n            envTable.ComboPointFrame = hostFrame\n            envTable.ComboPointFrame:SetScale (sizes.scale)\n            \n            --DetailsFramework:ApplyStandardBackdrop (envTable.ComboPointFrame) --debug anchor size\n            \n            --animations\n            local onPlayShowAnimation = function (animation)\n                --stop the hide animation if it's playing\n                if (animation:GetParent():GetParent().HideAnimation:IsPlaying()) then\n                    animation:GetParent():GetParent().HideAnimation:Stop()\n                end\n                \n                animation:GetParent():Show()\n            end\n            \n            local onPlayHideAnimation = function (animation)\n                --stop the show animation if it's playing\n                if (animation:GetParent():GetParent().ShowAnimation:IsPlaying()) then\n                    animation:GetParent():GetParent().ShowAnimation:Stop()\n                end\n            end        \n            local onStopHideAnimation = function (animation)\n                animation:GetParent():Hide()       \n            end\n            \n            local createAnimations = function (comboPoint)\n                --on show\n                comboPoint.ShowAnimation = Plater:CreateAnimationHub (comboPoint.comboPointTexture, onPlayShowAnimation, nil)\n                Plater:CreateAnimation (comboPoint.ShowAnimation, \"scale\", 1, 0.1, 0, 0, 1, 1)\n                Plater:CreateAnimation (comboPoint.ShowAnimation, \"alpha\", 1, 0.1, .5, 1)\n                Plater:CreateAnimation (comboPoint.ShowAnimation, \"scale\", 2, 0.1, 1.2, 1.2, 1, 1)\n                \n                --on hide\n                comboPoint.HideAnimation = Plater:CreateAnimationHub (comboPoint.comboPointTexture, onPlayHideAnimation, onStopHideAnimation)\n                Plater:CreateAnimation (comboPoint.HideAnimation, \"scale\", 1, 0.1, 1, 1, 0, 0)\n                Plater:CreateAnimation (comboPoint.HideAnimation, \"alpha\", 1, 0.1, 1, 0)\n            end\n            \n            --build combo point frame        \n            for i =1, 10 do \n                local f = CreateFrame (\"frame\", nil, envTable.ComboPointFrame)\n                f:SetSize (sizes.width, sizes.height)\n                tinsert (envTable.ComboPoints, f)\n                tinsert (unitFrame.PlaterComboPointFrame.ComboPointFramesPool, f)\n                \n                local backgroundTexture = f:CreateTexture (nil, \"background\")\n                backgroundTexture:SetTexture (textures.backgroundTexture)\n                backgroundTexture:SetTexCoord (unpack (textures.backgroundTexCoords))\n                backgroundTexture:SetSize (sizes.width, sizes.height)\n                backgroundTexture:SetPoint (\"center\")\n                \n                local comboPointTexture = f:CreateTexture (nil, \"artwork\")\n                comboPointTexture:SetTexture (textures.comboPointTexture)\n                comboPointTexture:SetTexCoord (unpack (textures.comboPointTexCoords))\n                \n                comboPointTexture:SetSize (sizes.width, sizes.height)\n                comboPointTexture:SetPoint (\"center\")\n                comboPointTexture:Hide()            \n                \n                f.IsActive = false\n                \n                f.backgroundTexture = backgroundTexture\n                f.comboPointTexture = comboPointTexture\n                \n                createAnimations (f)\n            end\n            \n        else\n            envTable.ComboPointFrame = unitFrame.PlaterComboPointFrame\n            envTable.ComboPointFrame:SetScale (sizes.scale)\n            envTable.ComboPoints = unitFrame.PlaterComboPointFrame.ComboPointFramesPool\n            \n        end            \n        \n        envTable.ComboPointFrame:SetFrameLevel (frameLevel)\n        envTable.ComboPointFrame:SetFrameStrata (frameStrata)\n        \n        function envTable.UpdateComboPoints()\n            local comboPoints = UnitPower (\"player\", Enum.PowerType.ComboPoints)\n            \n            for i = 1, envTable.TotalComboPoints do\n                local thisComboPoint = envTable.ComboPoints [i]\n                \n                if (i <= comboPoints ) then\n                    --combo point enabled\n                    if (not thisComboPoint.IsActive) then\n                        thisComboPoint.ShowAnimation:Play()\n                        thisComboPoint.IsActive = true\n                        \n                    end\n                    \n                else\n                    --combo point disabled\n                    if (thisComboPoint.IsActive) then\n                        thisComboPoint.HideAnimation:Play()\n                        thisComboPoint.IsActive = false\n                        \n                    end\n                end\n            end\n            \n            \n        end\n        \n        function envTable.UpdateComboPointAmount()\n            local namePlateWidth = Plater.db.profile.plate_config.enemynpc.health_incombat[1]\n            local comboPoints = UnitPowerMax (\"player\", Enum.PowerType.ComboPoints)\n            local reservedSpace = (namePlateWidth - sizes.width * comboPoints)  / comboPoints \n            \n            --store the total amount of combo points\n            envTable.TotalComboPoints = comboPoints\n            \n            --update anchor frame\n            envTable.ComboPointFrame:SetWidth (namePlateWidth)\n            envTable.ComboPointFrame:SetHeight (20)\n            envTable.ComboPointFrame:ClearAllPoints()\n            for i = 1, #anchors do\n                local anchor = anchors[i]\n                envTable.ComboPointFrame:SetPoint (unpack (anchor))\n            end        \n            \n            --\n            for i = 1, #envTable.ComboPoints do\n                envTable.ComboPoints[i]:Hide()\n                envTable.ComboPoints[i]:ClearAllPoints()\n            end\n            \n            for i = 1, comboPoints do\n                local comboPoint = envTable.ComboPoints[i]\n                if i == 1 then\n                    comboPoint:SetPoint (\"left\", envTable.ComboPointFrame, \"left\", reservedSpace/2, 0)\n                else\n                    comboPoint:SetPoint (\"left\", envTable.ComboPoints[i-1], \"right\", reservedSpace, 0)\n                end\n                \n                comboPoint:Show()\n            end\n            \n            envTable.LastUpdate = GetTime()\n            \n            envTable.UpdateComboPoints()\n        end\n        \n        --initialize\n        envTable.UpdateComboPointAmount()\n        envTable.ComboPointFrame:Hide()\n    end\n    \n    \nend",
						},
						["__TrashAt"] = 1612565442,
						["Time"] = 1603567332,
						["LoadConditions"] = {
							["talent"] = {
							},
							["group"] = {
							},
							["class"] = {
								["Enabled"] = true,
								["DRUID"] = true,
								["ROGUE"] = true,
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
								["103"] = true,
								["Enabled"] = true,
							},
						},
						["url"] = "",
						["Icon"] = 135426,
						["Enabled"] = false,
						["Revision"] = 254,
						["Options"] = {
						},
						["Author"] = "Izimode-Azralon",
						["Desc"] = "Show combo points above the nameplate for Druid Feral and Rogues.",
						["version"] = -1,
						["PlaterCore"] = 1,
						["Name"] = "Combo Points [Plater]",
						["LastHookEdited"] = "",
						["semver"] = "",
					}, -- [4]
					{
						["OptionsValues"] = {
						},
						["HooksTemp"] = {
							["Nameplate Added"] = "function (self, unitId, unitFrame, envTable)\n    envTable.UpdateColor (unitFrame)\nend",
							["Nameplate Updated"] = "function (self, unitId, unitFrame, envTable)\n    envTable.UpdateColor (unitFrame)\nend",
							["Target Changed"] = "function (self, unitId, unitFrame, envTable)\n    envTable.UpdateColor (unitFrame)\nend\n\n\n\n\n\n\n\n\n\n\n",
							["Constructor"] = "function (self, unitId, unitFrame, envTable)\n    \n    --usage: color name e.g \"red\" \"yellow\"; color table e.g {1, 0, 0} {1, 1, 0}; hex string e.g. \"#FF0000\" \"FFFF00\"\n    \n    envTable.TargetColor = \"purple\"\n    --envTable.TargetColor = \"#FF00FF\"\n    --envTable.TargetColor = {252/255, 0/255, 254/255}\n    \n    function envTable.UpdateColor (unitFrame)\n        --do not change the color of the personal bar\n        if (not unitFrame.IsSelf) then\n            \n            --if this nameplate the current target of the player?\n            if (unitFrame.namePlateIsTarget) then\n                Plater.SetNameplateColor (unitFrame, envTable.TargetColor)  --rgb\n            else\n                --refresh the nameplate color\n                Plater.RefreshNameplateColor (unitFrame)\n            end\n        end\n    end\n    \nend\n\n\n\n\n",
						},
						["Hooks"] = {
							["Nameplate Updated"] = "function (self, unitId, unitFrame, envTable)\n    envTable.UpdateColor (unitFrame)\nend",
							["Nameplate Added"] = "function (self, unitId, unitFrame, envTable)\n    envTable.UpdateColor (unitFrame)\nend",
							["Target Changed"] = "function (self, unitId, unitFrame, envTable)\n    envTable.UpdateColor (unitFrame)\nend\n\n\n\n\n\n\n\n\n\n\n",
							["Constructor"] = "function (self, unitId, unitFrame, envTable)\n    \n    --usage: color name e.g \"red\" \"yellow\"; color table e.g {1, 0, 0} {1, 1, 0}; hex string e.g. \"#FF0000\" \"FFFF00\"\n    \n    envTable.TargetColor = \"purple\"\n    --envTable.TargetColor = \"#FF00FF\"\n    --envTable.TargetColor = {252/255, 0/255, 254/255}\n    \n    function envTable.UpdateColor (unitFrame)\n        --do not change the color of the personal bar\n        if (not unitFrame.IsSelf) then\n            \n            --if this nameplate the current target of the player?\n            if (unitFrame.namePlateIsTarget) then\n                Plater.SetNameplateColor (unitFrame, envTable.TargetColor)  --rgb\n            else\n                --refresh the nameplate color\n                Plater.RefreshNameplateColor (unitFrame)\n            end\n        end\n    end\n    \nend\n\n\n\n\n",
						},
						["__TrashAt"] = 1612565458,
						["Time"] = 1552354619,
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
							["race"] = {
							},
							["affix"] = {
							},
							["encounter_ids"] = {
							},
							["spec"] = {
							},
						},
						["url"] = "",
						["Icon"] = 878211,
						["Enabled"] = false,
						["Revision"] = 93,
						["Options"] = {
						},
						["Author"] = "Izimode-Azralon",
						["Desc"] = "Changes the target color to the color set in the constructor script.",
						["version"] = -1,
						["PlaterCore"] = 1,
						["Name"] = "Current Target Color [Plater]",
						["LastHookEdited"] = "",
						["semver"] = "",
					}, -- [5]
					{
						["OptionsValues"] = {
						},
						["HooksTemp"] = {
							["Nameplate Updated"] = "function (self, unitId, unitFrame, envTable)\n    \n    --do nothing if the player isn't in combat\n    if (not Plater.IsInCombat()) then\n        return \n    end\n    \n    --do nothing if the unit isn't in combat\n    if (not unitFrame.InCombat) then\n        return\n    end\n    \n    --do nothing if the unit is the player it self\n    if (unitFrame.IsSelf) then\n        return\n    end\n    \n    --check the auras\n    local hasAura = false\n    \n    for auraName, _ in pairs (envTable.TrackingAuras) do\n        if (Plater.NameplateHasAura (unitFrame, auraName)) then\n            hasAura = true\n            break\n        end\n    end\n    \n    if (not hasAura) then\n        Plater.SetNameplateColor (unitFrame, envTable.NameplateColor)\n    else\n        if (envTable.ForceRefreshNameplateColor) then\n            Plater.RefreshNameplateColor (unitFrame) \n        end\n    end    \n    \nend",
							["Constructor"] = "function (self, unitId, unitFrame, envTable)\n    --Important: lines starting with double dashes are comments and are not part of the script\n    \n    --set this to true if you are not using threat colors in the health bar\n    envTable.ForceRefreshNameplateColor = true\n    \n    --if the unit does not have any of the following auras, it will be painted with the color listed below\n    --list of spells to track, can be the spell name (case-sensitive) or the spellID\n    envTable.TrackingAuras = {\n        --[\"Nightblade\"] = true, --this is an example using the spell name\n        --[195452] = true, --this is an example using the spellID\n        \n    }\n    \n    --which color the nameplate wil be changed\n    --color can be added as:\n    --color names: \"red\", \"yellow\"\n    --color hex: \"#FF0000\", \"#FFFF00\"\n    --color table: {1, 0, 0}, {1, 1, 0}    \n    --you may also use /plater colors\n    envTable.NameplateColor = \"pink\"\n    \nend",
						},
						["Hooks"] = {
							["Constructor"] = "function (self, unitId, unitFrame, envTable)\n    --Important: lines starting with double dashes are comments and are not part of the script\n    \n    --set this to true if you are not using threat colors in the health bar\n    envTable.ForceRefreshNameplateColor = true\n    \n    --if the unit does not have any of the following auras, it will be painted with the color listed below\n    --list of spells to track, can be the spell name (case-sensitive) or the spellID\n    envTable.TrackingAuras = {\n        --[\"Nightblade\"] = true, --this is an example using the spell name\n        --[195452] = true, --this is an example using the spellID\n        \n    }\n    \n    --which color the nameplate wil be changed\n    --color can be added as:\n    --color names: \"red\", \"yellow\"\n    --color hex: \"#FF0000\", \"#FFFF00\"\n    --color table: {1, 0, 0}, {1, 1, 0}    \n    --you may also use /plater colors\n    envTable.NameplateColor = \"pink\"\n    \nend",
							["Nameplate Updated"] = "function (self, unitId, unitFrame, envTable)\n    \n    --do nothing if the player isn't in combat\n    if (not Plater.IsInCombat()) then\n        return \n    end\n    \n    --do nothing if the unit isn't in combat\n    if (not unitFrame.InCombat) then\n        return\n    end\n    \n    --do nothing if the unit is the player it self\n    if (unitFrame.IsSelf) then\n        return\n    end\n    \n    --check the auras\n    local hasAura = false\n    \n    for auraName, _ in pairs (envTable.TrackingAuras) do\n        if (Plater.NameplateHasAura (unitFrame, auraName)) then\n            hasAura = true\n            break\n        end\n    end\n    \n    if (not hasAura) then\n        Plater.SetNameplateColor (unitFrame, envTable.NameplateColor)\n    else\n        if (envTable.ForceRefreshNameplateColor) then\n            Plater.RefreshNameplateColor (unitFrame) \n        end\n    end    \n    \nend",
						},
						["__TrashAt"] = 1612565461,
						["Time"] = 1554138845,
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
							["race"] = {
							},
							["affix"] = {
							},
							["encounter_ids"] = {
							},
							["spec"] = {
							},
						},
						["url"] = "",
						["Icon"] = 136207,
						["Enabled"] = false,
						["Revision"] = 59,
						["Options"] = {
						},
						["Author"] = "Izimode-Azralon",
						["Desc"] = "Change the nameplate color when a nameplate does not have the auras set in the constructor script.",
						["version"] = -1,
						["PlaterCore"] = 1,
						["Name"] = "Don't Have Aura [Plater]",
						["LastHookEdited"] = "",
						["semver"] = "",
					}, -- [6]
					{
						["OptionsValues"] = {
						},
						["HooksTemp"] = {
							["Nameplate Updated"] = "function (self, unitId, unitFrame, envTable)\n    \n    if (envTable.UseCustomExecutePercent) then\n        \n        --manual detection\n        local healthBar = unitFrame.healthBar\n        if (healthBar.CurrentHealth / healthBar.CurrentHealthMax <= envTable.ExecutePercent) then\n            envTable.UnitInExecuteRange (unitFrame)\n        end        \n        \n    else\n        \n        --auto detection\n        if (unitFrame.InExecuteRange) then\n            envTable.UnitInExecuteRange (unitFrame)\n        end\n        \n    end\n    \nend\n\n\n\n\n\n\n\n\n\n\n\n\n",
							["Constructor"] = "function (self, unitId, unitFrame, envTable)\n    \n    --execute detection, if true the script will handle the execute percent\n    --while false Plater will automatically trigger the execute range\n    --you only want to set this to true in case of Plater not detecting the execute range correctly\n    envTable.UseCustomExecutePercent = false\n    --execute percent, if not detecting automatic, this is the percent to active the execute range\n    --use from zero to one, 0.20 is equal to 20% of the unit life\n    envTable.ExecutePercent = 0.20\n    \n    --allow this script to change the nameplate color when the unit is in execute range\n    envTable.CanChangeColor = true\n    --change the health bar color to this color when the unit is in execute range\n    --color can be set as:\n    --color names: \"red\", \"yellow\"\n    --color hex: \"#FF0000\", \"#FFFF00\"\n    --color table: {1, 0, 0}, {1, 1, 0}\n    envTable.ExecuteColor = \"green\"\n    \n    --border color\n    envTable.CanChangeBorderColor = false\n    envTable.BorderColor = \"red\"\n    \n    --hide the default health divisor and the health execute indicator\n    envTable.HideHealthDivisor = false\n    --if not hidden, adjust the health divisor settings and the health execute indicator\n    envTable.HealthDivisorAlpha = 0.5\n    envTable.HealthDivisorColor = \"white\"\n    envTable.HealthExecuteIndicatorAlpha = 0.15\n    envTable.HealthExecuteIndicatorColor = \"darkred\"\n    \n    \n    --private (internal functions)\n    do\n        function envTable.UnitInExecuteRange (unitFrame)\n            --check if can change the execute color\n            if (envTable.CanChangeColor) then\n                Plater.SetNameplateColor (unitFrame, envTable.ExecuteColor)\n            end\n            \n            if (envTable.CanChangeBorderColor) then\n                Plater.SetBorderColor (unitFrame, envTable.BorderColor)\n            end\n            \n            if (envTable.HideHealthDivisor) then\n                unitFrame.healthBar.healthCutOff:Hide() \n                unitFrame.healthBar.executeRange:Hide()\n                \n            else\n                envTable.UpdateHealthDivisor (unitFrame)\n                \n            end\n        end\n        \n        function envTable.UpdateHealthDivisor (unitFrame)\n            local healthBar = unitFrame.healthBar\n            \n            healthBar.healthCutOff:Show()\n            healthBar.healthCutOff:SetVertexColor (DetailsFramework:ParseColors (envTable.HealthDivisorColor))\n            healthBar.healthCutOff:SetAlpha (envTable.HealthDivisorAlpha)\n            \n            healthBar.executeRange:Show()\n            healthBar.executeRange:SetVertexColor (DetailsFramework:ParseColors (envTable.HealthExecuteIndicatorColor))\n            healthBar.executeRange:SetAlpha (envTable.HealthExecuteIndicatorAlpha)\n            \n            if (envTable.UseCustomExecutePercent) then\n                healthBar.healthCutOff:ClearAllPoints()\n                healthBar.executeRange:ClearAllPoints()\n                \n                healthBar.healthCutOff:SetSize (healthBar:GetHeight(), healthBar:GetHeight())\n                healthBar.healthCutOff:SetPoint (\"center\", healthBar, \"left\", healthBar:GetWidth() * envTable.ExecutePercent, 0)\n                \n                healthBar.executeRange:SetTexCoord (0, envTable.ExecutePercent, 0, 1)\n                healthBar.executeRange:SetHeight (healthBar:GetHeight())\n                healthBar.executeRange:SetPoint (\"left\", healthBar, \"left\", 0, 0)\n                healthBar.executeRange:SetPoint (\"right\", healthBar.healthCutOff, \"center\")\n            end\n            \n        end\n    end\n    \nend",
						},
						["Hooks"] = {
							["Constructor"] = "function (self, unitId, unitFrame, envTable)\n    \n    --execute detection, if true the script will handle the execute percent\n    --while false Plater will automatically trigger the execute range\n    --you only want to set this to true in case of Plater not detecting the execute range correctly\n    envTable.UseCustomExecutePercent = false\n    --execute percent, if not detecting automatic, this is the percent to active the execute range\n    --use from zero to one, 0.20 is equal to 20% of the unit life\n    envTable.ExecutePercent = 0.20\n    \n    --allow this script to change the nameplate color when the unit is in execute range\n    envTable.CanChangeColor = true\n    --change the health bar color to this color when the unit is in execute range\n    --color can be set as:\n    --color names: \"red\", \"yellow\"\n    --color hex: \"#FF0000\", \"#FFFF00\"\n    --color table: {1, 0, 0}, {1, 1, 0}\n    envTable.ExecuteColor = \"green\"\n    \n    --border color\n    envTable.CanChangeBorderColor = false\n    envTable.BorderColor = \"red\"\n    \n    --hide the default health divisor and the health execute indicator\n    envTable.HideHealthDivisor = false\n    --if not hidden, adjust the health divisor settings and the health execute indicator\n    envTable.HealthDivisorAlpha = 0.5\n    envTable.HealthDivisorColor = \"white\"\n    envTable.HealthExecuteIndicatorAlpha = 0.15\n    envTable.HealthExecuteIndicatorColor = \"darkred\"\n    \n    \n    --private (internal functions)\n    do\n        function envTable.UnitInExecuteRange (unitFrame)\n            --check if can change the execute color\n            if (envTable.CanChangeColor) then\n                Plater.SetNameplateColor (unitFrame, envTable.ExecuteColor)\n            end\n            \n            if (envTable.CanChangeBorderColor) then\n                Plater.SetBorderColor (unitFrame, envTable.BorderColor)\n            end\n            \n            if (envTable.HideHealthDivisor) then\n                unitFrame.healthBar.healthCutOff:Hide() \n                unitFrame.healthBar.executeRange:Hide()\n                \n            else\n                envTable.UpdateHealthDivisor (unitFrame)\n                \n            end\n        end\n        \n        function envTable.UpdateHealthDivisor (unitFrame)\n            local healthBar = unitFrame.healthBar\n            \n            healthBar.healthCutOff:Show()\n            healthBar.healthCutOff:SetVertexColor (DetailsFramework:ParseColors (envTable.HealthDivisorColor))\n            healthBar.healthCutOff:SetAlpha (envTable.HealthDivisorAlpha)\n            \n            healthBar.executeRange:Show()\n            healthBar.executeRange:SetVertexColor (DetailsFramework:ParseColors (envTable.HealthExecuteIndicatorColor))\n            healthBar.executeRange:SetAlpha (envTable.HealthExecuteIndicatorAlpha)\n            \n            if (envTable.UseCustomExecutePercent) then\n                healthBar.healthCutOff:ClearAllPoints()\n                healthBar.executeRange:ClearAllPoints()\n                \n                healthBar.healthCutOff:SetSize (healthBar:GetHeight(), healthBar:GetHeight())\n                healthBar.healthCutOff:SetPoint (\"center\", healthBar, \"left\", healthBar:GetWidth() * envTable.ExecutePercent, 0)\n                \n                healthBar.executeRange:SetTexCoord (0, envTable.ExecutePercent, 0, 1)\n                healthBar.executeRange:SetHeight (healthBar:GetHeight())\n                healthBar.executeRange:SetPoint (\"left\", healthBar, \"left\", 0, 0)\n                healthBar.executeRange:SetPoint (\"right\", healthBar.healthCutOff, \"center\")\n            end\n            \n        end\n    end\n    \nend",
							["Nameplate Updated"] = "function (self, unitId, unitFrame, envTable)\n    \n    if (envTable.UseCustomExecutePercent) then\n        \n        --manual detection\n        local healthBar = unitFrame.healthBar\n        if (healthBar.CurrentHealth / healthBar.CurrentHealthMax <= envTable.ExecutePercent) then\n            envTable.UnitInExecuteRange (unitFrame)\n        end        \n        \n    else\n        \n        --auto detection\n        if (unitFrame.InExecuteRange) then\n            envTable.UnitInExecuteRange (unitFrame)\n        end\n        \n    end\n    \nend\n\n\n\n\n\n\n\n\n\n\n\n\n",
						},
						["__TrashAt"] = 1612565463,
						["Time"] = 1547406548,
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
							["race"] = {
							},
							["affix"] = {
							},
							["encounter_ids"] = {
							},
							["spec"] = {
							},
						},
						["url"] = "",
						["Icon"] = 135358,
						["Enabled"] = false,
						["Revision"] = 84,
						["Options"] = {
						},
						["Author"] = "Ahwa-Azralon",
						["Desc"] = "Add extra effects to execute range. See the constructor script for options.",
						["version"] = -1,
						["PlaterCore"] = 1,
						["Name"] = "Execute Range [Plater]",
						["LastHookEdited"] = "",
						["semver"] = "",
					}, -- [7]
					{
						["OptionsValues"] = {
						},
						["HooksTemp"] = {
							["Leave Combat"] = "function (self, unitId, unitFrame, envTable)\n    if (unitFrame.namePlateUnitReaction == envTable.REACTION_NEUTRAL) then\n        \n        --plater already handle this\n        if (unitFrame.PlayerCannotAttack) then\n            return\n        end    \n        \n        --check if is only open world\n        if (envTable.OnlyInOpenWorld and Plater.ZoneInstanceType ~= \"none\") then\n            return \n        end\n        \n        --check for only in combat\n        if (envTable.ShowInCombat) then\n            envTable.HideNameplate (unitFrame)\n        end\n    end\nend\n\n\n",
							["Nameplate Added"] = "function (self, unitId, unitFrame, envTable)\n    \n    if (unitFrame.namePlateUnitReaction == envTable.REACTION_NEUTRAL) then\n        \n        --plater already handle this\n        if (unitFrame.PlayerCannotAttack) then\n            return\n        end\n        \n        --check if is only open world\n        if (envTable.OnlyInOpenWorld and Plater.ZoneInstanceType ~= \"none\") then\n            return \n        end\n        \n        --check for only in combat\n        if (envTable.ShowInCombat and InCombatLockdown()) then\n            return\n        end\n        \n        envTable.HideNameplate (unitFrame)\n    end\n    \nend\n\n\n\n\n\n\n",
							["Target Changed"] = "function (self, unitId, unitFrame, envTable)\n    \n    if (unitFrame.namePlateUnitReaction == envTable.REACTION_NEUTRAL) then\n        \n        --plater already handle this\n        if (unitFrame.PlayerCannotAttack) then\n            return\n        end    \n        \n        --check if is only open world\n        if (envTable.OnlyInOpenWorld and Plater.ZoneInstanceType ~= \"none\") then\n            return \n        end\n        \n        --check for only in combat\n        if (envTable.ShowInCombat and InCombatLockdown()) then\n            return\n        end\n        \n        --check the unit reaction\n        if (unitFrame.namePlateIsTarget) then\n            envTable.ShowNameplate (unitFrame)\n            \n        else\n            envTable.HideNameplate (unitFrame)\n            \n        end    \n    end\n    \nend\n\n\n\n\n\n\n",
							["Nameplate Removed"] = "function (self, unitId, unitFrame, envTable)\n    \n    if (unitFrame.namePlateUnitReaction == envTable.REACTION_NEUTRAL) then\n        envTable.ShowNameplate (unitFrame)\n    end\n    \nend\n\n\n\n\n",
							["Nameplate Updated"] = "function (self, unitId, unitFrame, envTable)\n    \n    --when plater finishes an update on the nameplate\n    --check within the envTable if the healthBar of this nameplate should be hidden\n    if (envTable.IsHidden) then\n        if (unitFrame.healthBar:IsShown()) then\n            envTable.HideNameplate (unitFrame)\n        end\n    end\n    \nend\n\n\n\n\n",
							["Enter Combat"] = "function (self, unitId, unitFrame, envTable)\n    \n    if (unitFrame.namePlateUnitReaction == envTable.REACTION_NEUTRAL) then\n        \n        --plater already handle this\n        if (unitFrame.PlayerCannotAttack) then\n            return\n        end    \n        \n        --check if is only open world\n        if (envTable.OnlyInOpenWorld and Plater.ZoneInstanceType ~= \"none\") then\n            return \n        end\n        \n        --check for only in combat\n        if (envTable.ShowInCombat) then\n            envTable.ShowNameplate (unitFrame)\n        end\n    end\nend\n\n\n",
							["Constructor"] = "function (self, unitId, unitFrame, envTable)\n    \n    --settings\n    envTable.OnlyInOpenWorld = true;\n    envTable.ShowInCombat = true;\n    \n    --consts\n    envTable.REACTION_NEUTRAL = 4;\n    \n    --functions to hide and show the healthBar\n    function envTable.HideNameplate (unitFrame)\n        Plater.HideHealthBar (unitFrame)\n        Plater.DisableHighlight (unitFrame)\n        envTable.IsHidden = true\n    end\n    \n    function envTable.ShowNameplate (unitFrame)\n        Plater.ShowHealthBar (unitFrame)\n        Plater.EnableHighlight (unitFrame)\n        envTable.IsHidden = false\n    end\n    \nend\n\n\n\n\n",
						},
						["Hooks"] = {
							["Leave Combat"] = "function (self, unitId, unitFrame, envTable)\n    if (unitFrame.namePlateUnitReaction == envTable.REACTION_NEUTRAL) then\n        \n        --plater already handle this\n        if (unitFrame.PlayerCannotAttack) then\n            return\n        end    \n        \n        --check if is only open world\n        if (envTable.OnlyInOpenWorld and Plater.ZoneInstanceType ~= \"none\") then\n            return \n        end\n        \n        --check for only in combat\n        if (envTable.ShowInCombat) then\n            envTable.HideNameplate (unitFrame)\n        end\n    end\nend\n\n\n",
							["Nameplate Added"] = "function (self, unitId, unitFrame, envTable)\n    \n    if (unitFrame.namePlateUnitReaction == envTable.REACTION_NEUTRAL) then\n        \n        --plater already handle this\n        if (unitFrame.PlayerCannotAttack) then\n            return\n        end\n        \n        --check if is only open world\n        if (envTable.OnlyInOpenWorld and Plater.ZoneInstanceType ~= \"none\") then\n            return \n        end\n        \n        --check for only in combat\n        if (envTable.ShowInCombat and InCombatLockdown()) then\n            return\n        end\n        \n        envTable.HideNameplate (unitFrame)\n    end\n    \nend\n\n\n\n\n\n\n",
							["Target Changed"] = "function (self, unitId, unitFrame, envTable)\n    \n    if (unitFrame.namePlateUnitReaction == envTable.REACTION_NEUTRAL) then\n        \n        --plater already handle this\n        if (unitFrame.PlayerCannotAttack) then\n            return\n        end    \n        \n        --check if is only open world\n        if (envTable.OnlyInOpenWorld and Plater.ZoneInstanceType ~= \"none\") then\n            return \n        end\n        \n        --check for only in combat\n        if (envTable.ShowInCombat and InCombatLockdown()) then\n            return\n        end\n        \n        --check the unit reaction\n        if (unitFrame.namePlateIsTarget) then\n            envTable.ShowNameplate (unitFrame)\n            \n        else\n            envTable.HideNameplate (unitFrame)\n            \n        end    \n    end\n    \nend\n\n\n\n\n\n\n",
							["Nameplate Removed"] = "function (self, unitId, unitFrame, envTable)\n    \n    if (unitFrame.namePlateUnitReaction == envTable.REACTION_NEUTRAL) then\n        envTable.ShowNameplate (unitFrame)\n    end\n    \nend\n\n\n\n\n",
							["Nameplate Updated"] = "function (self, unitId, unitFrame, envTable)\n    \n    --when plater finishes an update on the nameplate\n    --check within the envTable if the healthBar of this nameplate should be hidden\n    if (envTable.IsHidden) then\n        if (unitFrame.healthBar:IsShown()) then\n            envTable.HideNameplate (unitFrame)\n        end\n    end\n    \nend\n\n\n\n\n",
							["Enter Combat"] = "function (self, unitId, unitFrame, envTable)\n    \n    if (unitFrame.namePlateUnitReaction == envTable.REACTION_NEUTRAL) then\n        \n        --plater already handle this\n        if (unitFrame.PlayerCannotAttack) then\n            return\n        end    \n        \n        --check if is only open world\n        if (envTable.OnlyInOpenWorld and Plater.ZoneInstanceType ~= \"none\") then\n            return \n        end\n        \n        --check for only in combat\n        if (envTable.ShowInCombat) then\n            envTable.ShowNameplate (unitFrame)\n        end\n    end\nend\n\n\n",
							["Constructor"] = "function (self, unitId, unitFrame, envTable)\n    \n    --settings\n    envTable.OnlyInOpenWorld = true;\n    envTable.ShowInCombat = true;\n    \n    --consts\n    envTable.REACTION_NEUTRAL = 4;\n    \n    --functions to hide and show the healthBar\n    function envTable.HideNameplate (unitFrame)\n        Plater.HideHealthBar (unitFrame)\n        Plater.DisableHighlight (unitFrame)\n        envTable.IsHidden = true\n    end\n    \n    function envTable.ShowNameplate (unitFrame)\n        Plater.ShowHealthBar (unitFrame)\n        Plater.EnableHighlight (unitFrame)\n        envTable.IsHidden = false\n    end\n    \nend\n\n\n\n\n",
						},
						["__TrashAt"] = 1612565484,
						["Time"] = 1541606242,
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
							["affix"] = {
							},
							["encounter_ids"] = {
							},
							["race"] = {
							},
						},
						["url"] = "",
						["Icon"] = 1990989,
						["Enabled"] = false,
						["Revision"] = 73,
						["Options"] = {
						},
						["Author"] = "Izimode-Azralon",
						["Desc"] = "Hide neutral units, show when selected, see the constructor script for options.",
						["version"] = -1,
						["PlaterCore"] = 1,
						["Name"] = "Hide Neutral Units [Plater]",
						["LastHookEdited"] = "",
						["semver"] = "",
					}, -- [8]
					{
						["OptionsValues"] = {
						},
						["HooksTemp"] = {
							["Leave Combat"] = "function (self, unitId, unitFrame, envTable)\n    envTable.CanShow = false;\n    envTable.TargetAmount:SetText (\"\")\nend\n\n\n",
							["Nameplate Added"] = "function (self, unitId, unitFrame, envTable)\n    \n    --when a nameplate is added to the screen check if the player is in combat\n    if (InCombatLockdown()) then\n        --player is in combat, check if can check amount of targets\n        envTable.CanShow = envTable.CanShowTargetAmount();\n        \n    else\n        envTable.CanShow = false; \n    end\n    \n    envTable.TargetAmount:SetText (\"\");\n    \nend",
							["Nameplate Removed"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.TargetAmount:SetText (\"\");\n    envTable.CanShow = false;\n    \nend\n\n\n",
							["Nameplate Updated"] = "function (self, unitId, unitFrame, envTable)\n    \n    --if the script is allowed to show the amount of targets\n    --also check if the unit is in combat\n    if (envTable.CanShow and UnitAffectingCombat (unitId)) then\n        \n        --check if can update the amount of targets following the cooldown set in the constructor script\n        --by default Plater updates the nameplate every 250ms, by default the cooldown is 2, so it'll update the amuont of target every 1/2 of a second\n        envTable.UpdateCooldown = envTable.UpdateCooldown + 1\n        if (envTable.UpdateCooldown < envTable.UpdateInterval) then\n            return\n        else\n            \n            --reset the cooldown interval to check the amount of target again\n            envTable.UpdateCooldown = 0\n            \n            --get the amount of targets\n            local amount;\n            if (envTable.InRaid) then\n                amount = envTable.NumTargetsInRaid (unitFrame)      \n                \n            elseif (envTable.InParty) then\n                amount = envTable.NumTargetsInParty (unitFrame)   \n                \n            else\n                envTable.TargetAmount:SetText (\"\")\n                return\n            end\n            \n            --update the amount text\n            if (amount == 0) then\n                envTable.TargetAmount:SetText (\"\")\n            else\n                envTable.TargetAmount:SetText (amount)\n            end\n            \n        end\n    end\nend\n\n\n",
							["Enter Combat"] = "function (self, unitId, unitFrame, envTable)\n    \n    --check if can show the amount of targets\n    envTable.CanShow = envTable.CanShowTargetAmount();\n    \n    if (not envTable.CanShow) then\n        envTable.TargetAmount:SetText (\"\") \n    end\nend\n\n\n\n\n",
							["Constructor"] = "--all gray text like this are comments and do not run as code\n--build the settings and basic functions for the hook\n\nfunction (self, unitId, unitFrame, envTable)\n    \n    --declare setting variables:\n    local textColor = \"orange\";\n    local textSize = 12;\n    \n    local showInRaid = true;\n    local showInDungeon = true;\n    local showInArena = false;\n    local showInBattleground = false;\n    local showInOpenWorld = true;\n    \n    envTable.UpdateInterval = 2; --each 2 updates in the nameplate it'll update the amount of targets\n    \n    local anchor = {\n        side = 6, --1 = topleft 2 = left 3 = bottomleft 4 = bottom 5 = bottom right 6 = right 7 = topright 8 = top\n        x = 4, --x offset\n        y = 0, --y offset\n    };\n    \n    \n    ---------------------------------------------------------------------------------------------------------------------------------------------\n    \n    \n    --frames:\n    \n    --create the text that will show the amount of people targeting the unit\n    if (not  unitFrame.healthBar.TargetAmount) then\n        envTable.TargetAmount = Plater:CreateLabel (unitFrame.healthBar, \"\", textSize, textColor);\n        Plater.SetAnchor (envTable.TargetAmount, anchor);\n        unitFrame.healthBar.TargetAmount = envTable.TargetAmount\n    end\n    \n    --in case Plater wipes the envTable\n    envTable.TargetAmount = unitFrame.healthBar.TargetAmount\n    \n    ---------------------------------------------------------------------------------------------------------------------------------------------           \n    --private variables (they will be used in the other scripts within this hook)\n    envTable.CanShow = false;\n    envTable.UpdateCooldown = 0;\n    envTable.InRaid = false;\n    envTable.InParty = false;\n    \n    ---------------------------------------------------------------------------------------------------------------------------------------------           \n    --functions\n    \n    --update the InRaid or InParty proprieties\n    function envTable.UpdateGroupType()\n        if (IsInRaid()) then\n            envTable.InRaid = true;\n            envTable.InParty = false;     \n            \n        elseif (IsInGroup()) then\n            envTable.InRaid = false;\n            envTable.InParty = true;   \n            \n        else\n            envTable.InRaid = false;            \n            envTable.InParty = false;\n        end\n    end\n    \n    --this function controls if the amount of targets can show following the settings in the top of this script\n    function envTable.CanShowTargetAmount()\n        \n        local _, instanceType, difficultyID, _, _, _, _, instanceMapID, instanceGroupSize = GetInstanceInfo()\n        \n        if (showInRaid and instanceType == \"raid\") then\n            envTable.UpdateGroupType()\n            return true\n        end\n        \n        if (showInDungeon and instanceType == \"party\") then\n            envTable.UpdateGroupType()\n            return true\n        end\n        \n        if (showInArena and instanceType == \"arena\") then\n            envTable.UpdateGroupType()\n            return true\n        end\n        \n        if (showInBattleground and instanceType == \"pvp\") then\n            envTable.UpdateGroupType()\n            return true\n        end\n        \n        if (showInOpenWorld and instanceType == \"none\") then\n            envTable.UpdateGroupType()\n            if (envTable.InRaid or envTable.InParty) then\n                return true\n            end\n        end\n        \n        return false\n    end\n    \n    --get the amount of player targetting the unit in raid or party\n    function envTable.NumTargetsInRaid (unitFrame)\n        local amount = 0\n        for i = 1, GetNumGroupMembers() do\n            local unit = \"raid\" .. i .. \"target\"\n            if (UnitGUID (unit) == unitFrame.namePlateUnitGUID) then\n                amount = amount + 1\n            end\n        end\n        \n        return amount\n    end\n    \n    function envTable.NumTargetsInParty()\n        local amount = 0\n        for i = 1, GetNumGroupMembers() - 1 do\n            local unit = \"party\" .. i .. \"target\"\n            if (UnitGUID (unit) == unitFrame.namePlateUnitGUID) then\n                amount = amount + 1\n            end\n        end\n        \n        local unit = \"playertarget\"\n        if (UnitGUID (unit) == unitFrame.namePlateUnitGUID) then\n            amount = amount + 1\n        end        \n        \n        return amount\n    end\n    \nend",
						},
						["Hooks"] = {
							["Leave Combat"] = "function (self, unitId, unitFrame, envTable)\n    envTable.CanShow = false;\n    envTable.TargetAmount:SetText (\"\")\nend\n\n\n",
							["Nameplate Added"] = "function (self, unitId, unitFrame, envTable)\n    \n    --when a nameplate is added to the screen check if the player is in combat\n    if (InCombatLockdown()) then\n        --player is in combat, check if can check amount of targets\n        envTable.CanShow = envTable.CanShowTargetAmount();\n        \n    else\n        envTable.CanShow = false; \n    end\n    \n    envTable.TargetAmount:SetText (\"\");\n    \nend",
							["Nameplate Removed"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.TargetAmount:SetText (\"\");\n    envTable.CanShow = false;\n    \nend\n\n\n",
							["Nameplate Updated"] = "function (self, unitId, unitFrame, envTable)\n    \n    --if the script is allowed to show the amount of targets\n    --also check if the unit is in combat\n    if (envTable.CanShow and UnitAffectingCombat (unitId)) then\n        \n        --check if can update the amount of targets following the cooldown set in the constructor script\n        --by default Plater updates the nameplate every 250ms, by default the cooldown is 2, so it'll update the amuont of target every 1/2 of a second\n        envTable.UpdateCooldown = envTable.UpdateCooldown + 1\n        if (envTable.UpdateCooldown < envTable.UpdateInterval) then\n            return\n        else\n            \n            --reset the cooldown interval to check the amount of target again\n            envTable.UpdateCooldown = 0\n            \n            --get the amount of targets\n            local amount;\n            if (envTable.InRaid) then\n                amount = envTable.NumTargetsInRaid (unitFrame)      \n                \n            elseif (envTable.InParty) then\n                amount = envTable.NumTargetsInParty (unitFrame)   \n                \n            else\n                envTable.TargetAmount:SetText (\"\")\n                return\n            end\n            \n            --update the amount text\n            if (amount == 0) then\n                envTable.TargetAmount:SetText (\"\")\n            else\n                envTable.TargetAmount:SetText (amount)\n            end\n            \n        end\n    end\nend\n\n\n",
							["Enter Combat"] = "function (self, unitId, unitFrame, envTable)\n    \n    --check if can show the amount of targets\n    envTable.CanShow = envTable.CanShowTargetAmount();\n    \n    if (not envTable.CanShow) then\n        envTable.TargetAmount:SetText (\"\") \n    end\nend\n\n\n\n\n",
							["Constructor"] = "--all gray text like this are comments and do not run as code\n--build the settings and basic functions for the hook\n\nfunction (self, unitId, unitFrame, envTable)\n    \n    --declare setting variables:\n    local textColor = \"orange\";\n    local textSize = 12;\n    \n    local showInRaid = true;\n    local showInDungeon = true;\n    local showInArena = false;\n    local showInBattleground = false;\n    local showInOpenWorld = true;\n    \n    envTable.UpdateInterval = 2; --each 2 updates in the nameplate it'll update the amount of targets\n    \n    local anchor = {\n        side = 6, --1 = topleft 2 = left 3 = bottomleft 4 = bottom 5 = bottom right 6 = right 7 = topright 8 = top\n        x = 4, --x offset\n        y = 0, --y offset\n    };\n    \n    \n    ---------------------------------------------------------------------------------------------------------------------------------------------\n    \n    \n    --frames:\n    \n    --create the text that will show the amount of people targeting the unit\n    if (not  unitFrame.healthBar.TargetAmount) then\n        envTable.TargetAmount = Plater:CreateLabel (unitFrame.healthBar, \"\", textSize, textColor);\n        Plater.SetAnchor (envTable.TargetAmount, anchor);\n        unitFrame.healthBar.TargetAmount = envTable.TargetAmount\n    end\n    \n    --in case Plater wipes the envTable\n    envTable.TargetAmount = unitFrame.healthBar.TargetAmount\n    \n    ---------------------------------------------------------------------------------------------------------------------------------------------           \n    --private variables (they will be used in the other scripts within this hook)\n    envTable.CanShow = false;\n    envTable.UpdateCooldown = 0;\n    envTable.InRaid = false;\n    envTable.InParty = false;\n    \n    ---------------------------------------------------------------------------------------------------------------------------------------------           \n    --functions\n    \n    --update the InRaid or InParty proprieties\n    function envTable.UpdateGroupType()\n        if (IsInRaid()) then\n            envTable.InRaid = true;\n            envTable.InParty = false;     \n            \n        elseif (IsInGroup()) then\n            envTable.InRaid = false;\n            envTable.InParty = true;   \n            \n        else\n            envTable.InRaid = false;            \n            envTable.InParty = false;\n        end\n    end\n    \n    --this function controls if the amount of targets can show following the settings in the top of this script\n    function envTable.CanShowTargetAmount()\n        \n        local _, instanceType, difficultyID, _, _, _, _, instanceMapID, instanceGroupSize = GetInstanceInfo()\n        \n        if (showInRaid and instanceType == \"raid\") then\n            envTable.UpdateGroupType()\n            return true\n        end\n        \n        if (showInDungeon and instanceType == \"party\") then\n            envTable.UpdateGroupType()\n            return true\n        end\n        \n        if (showInArena and instanceType == \"arena\") then\n            envTable.UpdateGroupType()\n            return true\n        end\n        \n        if (showInBattleground and instanceType == \"pvp\") then\n            envTable.UpdateGroupType()\n            return true\n        end\n        \n        if (showInOpenWorld and instanceType == \"none\") then\n            envTable.UpdateGroupType()\n            if (envTable.InRaid or envTable.InParty) then\n                return true\n            end\n        end\n        \n        return false\n    end\n    \n    --get the amount of player targetting the unit in raid or party\n    function envTable.NumTargetsInRaid (unitFrame)\n        local amount = 0\n        for i = 1, GetNumGroupMembers() do\n            local unit = \"raid\" .. i .. \"target\"\n            if (UnitGUID (unit) == unitFrame.namePlateUnitGUID) then\n                amount = amount + 1\n            end\n        end\n        \n        return amount\n    end\n    \n    function envTable.NumTargetsInParty()\n        local amount = 0\n        for i = 1, GetNumGroupMembers() - 1 do\n            local unit = \"party\" .. i .. \"target\"\n            if (UnitGUID (unit) == unitFrame.namePlateUnitGUID) then\n                amount = amount + 1\n            end\n        end\n        \n        local unit = \"playertarget\"\n        if (UnitGUID (unit) == unitFrame.namePlateUnitGUID) then\n            amount = amount + 1\n        end        \n        \n        return amount\n    end\n    \nend",
						},
						["__TrashAt"] = 1612565486,
						["Time"] = 1548278227,
						["LoadConditions"] = {
							["talent"] = {
							},
							["group"] = {
							},
							["class"] = {
							},
							["map_ids"] = {
							},
							["race"] = {
							},
							["pvptalent"] = {
							},
							["spec"] = {
							},
							["affix"] = {
							},
							["encounter_ids"] = {
							},
							["role"] = {
							},
						},
						["url"] = "",
						["Icon"] = 1966587,
						["Enabled"] = false,
						["Revision"] = 182,
						["Options"] = {
						},
						["Author"] = "Izimode-Azralon",
						["Desc"] = "Show how many raid members are targeting the unit",
						["version"] = -1,
						["PlaterCore"] = 1,
						["Name"] = "Players Targeting a Target [Plater]",
						["LastHookEdited"] = "",
						["semver"] = "",
					}, -- [9]
					{
						["OptionsValues"] = {
						},
						["HooksTemp"] = {
							["Nameplate Added"] = "\n\n-- exported function Plater.UpdatePlateSize() from Plater.lua\n--this is for advanced users which wants to reorder the nameplate frame at their desire\n\n\n\nfunction (self, unitId, unitFrame, envTable)\n    \n    --check if there's a type of unit on this nameplate\n    local plateFrame = unitFrame:GetParent()\n    if (not plateFrame.actorType) then\n        return\n    end\n    \n    --get all the frames and cache some variables\n    local ACTORTYPE_ENEMY_PLAYER = \"enemyplayer\"\n    local profile = Plater.db.profile\n    local DB_PLATE_CONFIG = profile.plate_config\n    local isInCombat = Plater.IsInCombat()\n    local actorType = plateFrame.actorType\n    \n    local unitFrame = plateFrame.unitFrame\n    local healthBar = unitFrame.healthBar\n    local castBar = unitFrame.castBar\n    local powerBar = unitFrame.powerBar\n    local buffFrame1 = unitFrame.BuffFrame\n    local buffFrame2 = unitFrame.BuffFrame2\n    \n    --use in combat bars when in pvp\n    if (plateFrame.actorType == ACTORTYPE_ENEMY_PLAYER) then\n        if ((Plater.ZoneInstanceType == \"pvp\" or Plater.ZoneInstanceType == \"arena\") and DB_PLATE_CONFIG.player.pvp_always_incombat) then\n            isInCombat = true\n        end\n    end\n    \n    --get the config for this actor type\n    local plateConfigs = DB_PLATE_CONFIG [actorType]\n    --get the config key based if the player is in combat\n    local castBarConfigKey, healthBarConfigKey, manaConfigKey = Plater.GetHashKey (isInCombat)\n    \n    --get the width and height from what the user set in the options panel\n    local healthBarWidth, healthBarHeight = unitFrame.customHealthBarWidth or plateConfigs [healthBarConfigKey][1], unitFrame.customHealthBarHeight or plateConfigs [healthBarConfigKey][2]\n    local castBarWidth, castBarHeight = unitFrame.customCastBarWidth or plateConfigs [castBarConfigKey][1], unitFrame.customCastBarHeight or plateConfigs [castBarConfigKey][2]\n    local powerBarWidth, powerBarHeight = unitFrame.customPowerBarHeight or plateConfigs [manaConfigKey][1], unitFrame.customPowerBarHeight or plateConfigs [manaConfigKey][2]\n    \n    --calculate the offset for the cast bar, this is done due to the cast bar be anchored to topleft and topright\n    local castBarOffSetX = (healthBarWidth - castBarWidth) / 2\n    local castBarOffSetY = plateConfigs.castbar_offset\n    \n    --calculate offsets for the power bar\n    local powerBarOffSetX = (healthBarWidth - powerBarWidth) / 2\n    local powerBarOffSetY = 0\n    \n    --calculate the size deviation for pets\n    local unitType = Plater.GetUnitType (plateFrame)\n    if (unitType == \"pet\") then\n        healthBarHeight = healthBarHeight * Plater.db.profile.pet_height_scale\n        healthBarWidth = healthBarWidth * Plater.db.profile.pet_width_scale\n        \n    elseif (unitType == \"minus\") then\n        healthBarHeight = healthBarHeight * Plater.db.profile.minor_height_scale\n        healthBarWidth = healthBarWidth * Plater.db.profile.minor_width_scale\n    end\n    \n    --unit frame - is set to be the same size as the plateFrame\n    unitFrame:ClearAllPoints()\n    unitFrame:SetAllPoints()\n    \n    --calculates the health bar anchor points\n    --it will always be placed in the center of the nameplate area (where it accepts mouse clicks) \n    local xOffSet = (plateFrame:GetWidth() - healthBarWidth) / 2\n    local yOffSet = (plateFrame:GetHeight() - healthBarHeight) / 2\n    \n    --set the health bar point\n    healthBar:ClearAllPoints()\n    PixelUtil.SetPoint (healthBar, \"topleft\", unitFrame, \"topleft\", xOffSet + profile.global_offset_x, -yOffSet + profile.global_offset_y)\n    PixelUtil.SetPoint (healthBar, \"bottomright\", unitFrame, \"bottomright\", -xOffSet + profile.global_offset_x, yOffSet + profile.global_offset_y)\n    \n    --set the cast bar point and size\n    castBar:ClearAllPoints()\n    PixelUtil.SetPoint (castBar, \"topleft\", healthBar, \"bottomleft\", castBarOffSetX, castBarOffSetY)\n    PixelUtil.SetPoint (castBar, \"topright\", healthBar, \"bottomright\", -castBarOffSetX, castBarOffSetY)\n    PixelUtil.SetHeight (castBar, castBarHeight)\n    PixelUtil.SetSize (castBar.Icon, castBarHeight, castBarHeight)\n    PixelUtil.SetSize (castBar.BorderShield, castBarHeight * 1.4, castBarHeight * 1.4)\n    \n    --set the power bar point and size\n    powerBar:ClearAllPoints()\n    PixelUtil.SetPoint (powerBar, \"topleft\", healthBar, \"bottomleft\", powerBarOffSetX, powerBarOffSetY)\n    PixelUtil.SetPoint (powerBar, \"topright\", healthBar, \"bottomright\", -powerBarOffSetX, powerBarOffSetY)\n    PixelUtil.SetHeight (powerBar, powerBarHeight)\n    \n    --power bar are hidden by default, show it if there's a custom size for it\n    if (unitFrame.customPowerBarWidth and unitFrame.customPowerBarHeight) then\n        powerBar:SetUnit (unitFrame.unit)\n    end\n    \n    --aura frames\n    local bf1Anchor = Plater.db.profile.aura_frame1_anchor\n    Plater.SetAnchor (buffFrame1, {side = bf1Anchor.side, x = bf1Anchor.x, y = bf1Anchor.y + plateConfigs.buff_frame_y_offset}, unitFrame.healthBar, (Plater.db.profile.aura_grow_direction or 2) == 2)\n    \n    local bf2Anchor = Plater.db.profile.aura_frame2_anchor\n    Plater.SetAnchor (buffFrame2, {side = bf2Anchor.side, x = bf2Anchor.x, y = bf2Anchor.y + plateConfigs.buff_frame_y_offset}, unitFrame.healthBar, (Plater.db.profile.aura2_grow_direction or 2) == 2)\n    \nend\n\n\n",
						},
						["Hooks"] = {
							["Nameplate Added"] = "\n\n-- exported function Plater.UpdatePlateSize() from Plater.lua\n--this is for advanced users which wants to reorder the nameplate frame at their desire\n\n\n\nfunction (self, unitId, unitFrame, envTable)\n    \n    --check if there's a type of unit on this nameplate\n    local plateFrame = unitFrame:GetParent()\n    if (not plateFrame.actorType) then\n        return\n    end\n    \n    --get all the frames and cache some variables\n    local ACTORTYPE_ENEMY_PLAYER = \"enemyplayer\"\n    local profile = Plater.db.profile\n    local DB_PLATE_CONFIG = profile.plate_config\n    local isInCombat = Plater.IsInCombat()\n    local actorType = plateFrame.actorType\n    \n    local unitFrame = plateFrame.unitFrame\n    local healthBar = unitFrame.healthBar\n    local castBar = unitFrame.castBar\n    local powerBar = unitFrame.powerBar\n    local buffFrame1 = unitFrame.BuffFrame\n    local buffFrame2 = unitFrame.BuffFrame2\n    \n    --use in combat bars when in pvp\n    if (plateFrame.actorType == ACTORTYPE_ENEMY_PLAYER) then\n        if ((Plater.ZoneInstanceType == \"pvp\" or Plater.ZoneInstanceType == \"arena\") and DB_PLATE_CONFIG.player.pvp_always_incombat) then\n            isInCombat = true\n        end\n    end\n    \n    --get the config for this actor type\n    local plateConfigs = DB_PLATE_CONFIG [actorType]\n    --get the config key based if the player is in combat\n    local castBarConfigKey, healthBarConfigKey, manaConfigKey = Plater.GetHashKey (isInCombat)\n    \n    --get the width and height from what the user set in the options panel\n    local healthBarWidth, healthBarHeight = unitFrame.customHealthBarWidth or plateConfigs [healthBarConfigKey][1], unitFrame.customHealthBarHeight or plateConfigs [healthBarConfigKey][2]\n    local castBarWidth, castBarHeight = unitFrame.customCastBarWidth or plateConfigs [castBarConfigKey][1], unitFrame.customCastBarHeight or plateConfigs [castBarConfigKey][2]\n    local powerBarWidth, powerBarHeight = unitFrame.customPowerBarHeight or plateConfigs [manaConfigKey][1], unitFrame.customPowerBarHeight or plateConfigs [manaConfigKey][2]\n    \n    --calculate the offset for the cast bar, this is done due to the cast bar be anchored to topleft and topright\n    local castBarOffSetX = (healthBarWidth - castBarWidth) / 2\n    local castBarOffSetY = plateConfigs.castbar_offset\n    \n    --calculate offsets for the power bar\n    local powerBarOffSetX = (healthBarWidth - powerBarWidth) / 2\n    local powerBarOffSetY = 0\n    \n    --calculate the size deviation for pets\n    local unitType = Plater.GetUnitType (plateFrame)\n    if (unitType == \"pet\") then\n        healthBarHeight = healthBarHeight * Plater.db.profile.pet_height_scale\n        healthBarWidth = healthBarWidth * Plater.db.profile.pet_width_scale\n        \n    elseif (unitType == \"minus\") then\n        healthBarHeight = healthBarHeight * Plater.db.profile.minor_height_scale\n        healthBarWidth = healthBarWidth * Plater.db.profile.minor_width_scale\n    end\n    \n    --unit frame - is set to be the same size as the plateFrame\n    unitFrame:ClearAllPoints()\n    unitFrame:SetAllPoints()\n    \n    --calculates the health bar anchor points\n    --it will always be placed in the center of the nameplate area (where it accepts mouse clicks) \n    local xOffSet = (plateFrame:GetWidth() - healthBarWidth) / 2\n    local yOffSet = (plateFrame:GetHeight() - healthBarHeight) / 2\n    \n    --set the health bar point\n    healthBar:ClearAllPoints()\n    PixelUtil.SetPoint (healthBar, \"topleft\", unitFrame, \"topleft\", xOffSet + profile.global_offset_x, -yOffSet + profile.global_offset_y)\n    PixelUtil.SetPoint (healthBar, \"bottomright\", unitFrame, \"bottomright\", -xOffSet + profile.global_offset_x, yOffSet + profile.global_offset_y)\n    \n    --set the cast bar point and size\n    castBar:ClearAllPoints()\n    PixelUtil.SetPoint (castBar, \"topleft\", healthBar, \"bottomleft\", castBarOffSetX, castBarOffSetY)\n    PixelUtil.SetPoint (castBar, \"topright\", healthBar, \"bottomright\", -castBarOffSetX, castBarOffSetY)\n    PixelUtil.SetHeight (castBar, castBarHeight)\n    PixelUtil.SetSize (castBar.Icon, castBarHeight, castBarHeight)\n    PixelUtil.SetSize (castBar.BorderShield, castBarHeight * 1.4, castBarHeight * 1.4)\n    \n    --set the power bar point and size\n    powerBar:ClearAllPoints()\n    PixelUtil.SetPoint (powerBar, \"topleft\", healthBar, \"bottomleft\", powerBarOffSetX, powerBarOffSetY)\n    PixelUtil.SetPoint (powerBar, \"topright\", healthBar, \"bottomright\", -powerBarOffSetX, powerBarOffSetY)\n    PixelUtil.SetHeight (powerBar, powerBarHeight)\n    \n    --power bar are hidden by default, show it if there's a custom size for it\n    if (unitFrame.customPowerBarWidth and unitFrame.customPowerBarHeight) then\n        powerBar:SetUnit (unitFrame.unit)\n    end\n    \n    --aura frames\n    local bf1Anchor = Plater.db.profile.aura_frame1_anchor\n    Plater.SetAnchor (buffFrame1, {side = bf1Anchor.side, x = bf1Anchor.x, y = bf1Anchor.y + plateConfigs.buff_frame_y_offset}, unitFrame.healthBar, (Plater.db.profile.aura_grow_direction or 2) == 2)\n    \n    local bf2Anchor = Plater.db.profile.aura_frame2_anchor\n    Plater.SetAnchor (buffFrame2, {side = bf2Anchor.side, x = bf2Anchor.x, y = bf2Anchor.y + plateConfigs.buff_frame_y_offset}, unitFrame.healthBar, (Plater.db.profile.aura2_grow_direction or 2) == 2)\n    \nend\n\n\n",
						},
						["__TrashAt"] = 1612565489,
						["Time"] = 1596791840,
						["LoadConditions"] = {
							["talent"] = {
							},
							["group"] = {
							},
							["class"] = {
							},
							["map_ids"] = {
							},
							["race"] = {
							},
							["pvptalent"] = {
							},
							["role"] = {
							},
							["affix"] = {
							},
							["encounter_ids"] = {
							},
							["spec"] = {
							},
						},
						["url"] = "",
						["Icon"] = 574574,
						["Enabled"] = false,
						["Revision"] = 93,
						["Options"] = {
						},
						["Author"] = "Kastfall-Azralon",
						["Desc"] = "Function Plater.UpdatePlateSize from Plater.lua exported to scritps.",
						["version"] = -1,
						["PlaterCore"] = 1,
						["Name"] = "Reorder Nameplate [Plater]",
						["LastHookEdited"] = "",
						["semver"] = "",
					}, -- [10]
					{
						["OptionsValues"] = {
						},
						["LastHookEdited"] = "Nameplate Updated",
						["Hooks"] = {
							["Nameplate Updated"] = "function (self, unitId, unitFrame, envTable)\n    local unitName = UnitName(unitId)\n    \n    local firstName = {\n    }\n    \n    local fullName = {\n    }\n    \n    if (unitName) then\n        local  a ,b, c ,d ,e ,f=  strsplit(' ', unitName, 5)\n        \n        if firstName [unitFrame.namePlateNpcId] then\n            unitFrame.healthBar.unitName:SetText(a)\n        elseif fullName[unitFrame.namePlateNpcId] then\n            unitFrame.healthBar.unitName:SetText(unitName)\n        else\n            unitFrame.healthBar.unitName:SetText(f or e or d or c or b or a)\n        end\n    end\nend",
						},
						["__TrashAt"] = 1612565861,
						["Time"] = 1612565747,
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
						["url"] = "https://wago.io/NqehXkAAZ/3",
						["Icon"] = 644389,
						["Enabled"] = true,
						["Revision"] = 17,
						["semver"] = "1.0.2",
						["Author"] = "Phonszmonk-Sylvanas",
						["Desc"] = "",
						["Prio"] = 99,
						["Name"] = "Name - Last",
						["PlaterCore"] = 1,
						["version"] = 3,
						["HooksTemp"] = {
							["Nameplate Updated"] = "function (self, unitId, unitFrame, envTable)\n    local unitName = UnitName(unitId)\n    \n    local firstName = {\n    }\n    \n    local fullName = {\n    }\n    \n    if (unitName) then\n        local  a ,b, c ,d ,e ,f=  strsplit(' ', unitName, 5)\n        \n        if firstName [unitFrame.namePlateNpcId] then\n            unitFrame.healthBar.unitName:SetText(a)\n        elseif fullName[unitFrame.namePlateNpcId] then\n            unitFrame.healthBar.unitName:SetText(unitName)\n        else\n            unitFrame.healthBar.unitName:SetText(f or e or d or c or b or a)\n        end\n    end\nend",
						},
						["Options"] = {
						},
					}, -- [11]
					{
						["OptionsValues"] = {
						},
						["HooksTemp"] = {
							["Nameplate Updated"] = "function (self, unitId, unitFrame, envTable)\n    \n    --attempt to get the color from the unit color list\n    local color = envTable.NpcColors [unitFrame.namePlateUnitNameLower] or envTable.NpcColors [unitFrame.namePlateUnitName] or envTable.NpcColors [unitFrame.namePlateNpcId]\n    \n    --if the color exists, set the health bar color\n    if (color) then\n        Plater.SetNameplateColor (unitFrame, color)\n    end\n    \nend\n\n\n\n\n\n\n\n\n\n\n\n",
							["Constructor"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.NpcColors = {\n        -- De Other Side [DOS]\n        [164857] = \"#00fbff\",\n        [167965] = \"#00fbff\",\n        [168934] = \"#00fbff\",\n        [168942] = \"#00fbff\",\n        [169905] = \"#00fbff\",\n        [170572] = \"#00fbff\",\n        [171343] = \"#00fbff\",\n        -- Halls of Atonement [HOA]\n        [164562] = \"#00fbff\",\n        [165529] = \"#00fbff\",\n        [167612] = \"#00fbff\",\n        [167892] = \"#00fbff\",\n        -- Mists of Tirna Scithe [MISTS]\n        [164804] = \"#00fbff\",\n        [164921] = \"#00fbff\",\n        [166299] = \"#00fbff\",\n        [167111] = \"#00fbff\",\n        -- The Necrotic Wake [NW]\n        [163618] = \"#00fbff\",\n        [165824] = \"#00fbff\",\n        [165872] = \"#00fbff\",\n        [166302] = \"#00fbff\",\n        [173016] = \"#00fbff\",\n        -- Plaguefall [PF]\n        [163882] = \"#00fbff\",\n        [163894] = \"#00fbff\",\n        [164737] = \"#00fbff\",\n        [168572] = \"#00fbff\",\n        [168627] = \"#00fbff\",\n        [169861] = \"#00fbff\",\n        -- Sanguine Depths [SD]\n        [162038] = \"#00fbff\",\n        [162040] = \"#00fbff\",\n        [162057] = \"#00fbff\",\n        [171376] = \"#00fbff\",\n        [171799] = \"#00fbff\",\n        -- Spires of Ascension [SOA]\n        [163459] = \"#00fbff\",\n        [163520] = \"#00fbff\",\n        [168318] = \"#00fbff\",\n        [168681] = \"#00fbff\",\n        -- Theater of Pain [TOP]\n        [160495] = \"#00fbff\",\n        [164506] = \"#00fbff\",\n        [170850] = \"#00fbff\",\n        [174210] = \"#00fbff\",\n        -- Others\n    }\n    \nend",
						},
						["Hooks"] = {
							["Constructor"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.NpcColors = {\n        -- De Other Side [DOS]\n        [164857] = \"#00fbff\",\n        [167965] = \"#00fbff\",\n        [168934] = \"#00fbff\",\n        [168942] = \"#00fbff\",\n        [169905] = \"#00fbff\",\n        [170572] = \"#00fbff\",\n        [171343] = \"#00fbff\",\n        -- Halls of Atonement [HOA]\n        [164562] = \"#00fbff\",\n        [165529] = \"#00fbff\",\n        [167612] = \"#00fbff\",\n        [167892] = \"#00fbff\",\n        -- Mists of Tirna Scithe [MISTS]\n        [164804] = \"#00fbff\",\n        [164921] = \"#00fbff\",\n        [166299] = \"#00fbff\",\n        [167111] = \"#00fbff\",\n        -- The Necrotic Wake [NW]\n        [163618] = \"#00fbff\",\n        [165824] = \"#00fbff\",\n        [165872] = \"#00fbff\",\n        [166302] = \"#00fbff\",\n        [173016] = \"#00fbff\",\n        -- Plaguefall [PF]\n        [163882] = \"#00fbff\",\n        [163894] = \"#00fbff\",\n        [164737] = \"#00fbff\",\n        [168572] = \"#00fbff\",\n        [168627] = \"#00fbff\",\n        [169861] = \"#00fbff\",\n        -- Sanguine Depths [SD]\n        [162038] = \"#00fbff\",\n        [162040] = \"#00fbff\",\n        [162057] = \"#00fbff\",\n        [171376] = \"#00fbff\",\n        [171799] = \"#00fbff\",\n        -- Spires of Ascension [SOA]\n        [163459] = \"#00fbff\",\n        [163520] = \"#00fbff\",\n        [168318] = \"#00fbff\",\n        [168681] = \"#00fbff\",\n        -- Theater of Pain [TOP]\n        [160495] = \"#00fbff\",\n        [164506] = \"#00fbff\",\n        [170850] = \"#00fbff\",\n        [174210] = \"#00fbff\",\n        -- Others\n    }\n    \nend",
							["Nameplate Updated"] = "function (self, unitId, unitFrame, envTable)\n    \n    --attempt to get the color from the unit color list\n    local color = envTable.NpcColors [unitFrame.namePlateUnitNameLower] or envTable.NpcColors [unitFrame.namePlateUnitName] or envTable.NpcColors [unitFrame.namePlateNpcId]\n    \n    --if the color exists, set the health bar color\n    if (color) then\n        Plater.SetNameplateColor (unitFrame, color)\n    end\n    \nend\n\n\n\n\n\n\n\n\n\n\n\n",
						},
						["__TrashAt"] = 1612566178,
						["Time"] = 1612565827,
						["LoadConditions"] = {
							["talent"] = {
							},
							["group"] = {
							},
							["class"] = {
							},
							["map_ids"] = {
							},
							["race"] = {
							},
							["pvptalent"] = {
							},
							["spec"] = {
							},
							["affix"] = {
							},
							["encounter_ids"] = {
							},
							["role"] = {
							},
						},
						["url"] = "",
						["Icon"] = "Interface\\AddOns\\Plater\\images\\color_bar",
						["Enabled"] = true,
						["Revision"] = 62,
						["Options"] = {
						},
						["Author"] = "Kastfall-Azralon",
						["Desc"] = "",
						["Prio"] = 99,
						["version"] = -1,
						["PlaterCore"] = 1,
						["Name"] = "Custom Color Units",
						["LastHookEdited"] = "Nameplate Updated",
						["semver"] = "",
					}, -- [12]
					{
						["Enabled"] = true,
						["Revision"] = 8,
						["Options"] = {
						},
						["HooksTemp"] = {
							["Nameplate Updated"] = "function (self, unitId, unitFrame, envTable, modTable)\n    \n    unitFrame.Classification = unitFrame.Classification or Plater:CreateLabel (parent, text, size, color, font, member, name, layer)\n    unitFrame.Classification:SetPoint ('center', 0, 0)\n    \n    local unitFrame.Classification = UnitClassification(\"unit\")\n    \n    if (unitFrame.Classification =='rare') then\n        return 'Rare'\n    elseif (unitFrame.Classification == 'rareelite') then\n        return 'Rare Elite'\n    elseif (unitFrame.Classification == 'elite') then\n        return 'Elite'\n    elseif (unitFrame.Classification == 'worldboss') then\n        return 'Boss'\n    end\n    \n    \nend",
						},
						["Prio"] = 99,
						["Author"] = "Luckyone-Laughing Skull",
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
							["race"] = {
							},
							["affix"] = {
							},
							["encounter_ids"] = {
							},
							["spec"] = {
							},
						},
						["Desc"] = "",
						["Hooks"] = {
							["Nameplate Updated"] = "function (self, unitId, unitFrame, envTable, modTable)\n    \n    unitFrame.Classification = unitFrame.Classification or Plater:CreateLabel (parent, text, size, color, font, member, name, layer)\n    unitFrame.Classification:SetPoint ('center', 0, 0)\n    \n    local unitFrame.Classification = UnitClassification(\"unit\")\n    \n    if (unitFrame.Classification =='rare') then\n        return 'Rare'\n    elseif (unitFrame.Classification == 'rareelite') then\n        return 'Rare Elite'\n    elseif (unitFrame.Classification == 'elite') then\n        return 'Elite'\n    elseif (unitFrame.Classification == 'worldboss') then\n        return 'Boss'\n    end\n    \n    \nend",
						},
						["__TrashAt"] = 1612568722,
						["Name"] = "Custom Classification",
						["PlaterCore"] = 1,
						["Time"] = 1612568629,
						["LastHookEdited"] = "Nameplate Updated",
						["Icon"] = "INTERFACE\\ICONS\\Ability_Argus_SoulBombDebuffLarge",
						["OptionsValues"] = {
						},
					}, -- [13]
					{
						["Enabled"] = true,
						["Revision"] = 5,
						["OptionsValues"] = {
						},
						["LastHookEdited"] = "Nameplate Updated",
						["Prio"] = 99,
						["Author"] = "Luckyone-Laughing Skull",
						["PlaterCore"] = 1,
						["Desc"] = "",
						["Hooks"] = {
							["Nameplate Updated"] = "function (self, unitId, unitFrame, envTable)\n    \n    local c = UnitClassification(self)\n    \n    if (c == 'rare') then\n        return 'Rare'\n    elseif (c == 'rareelite') then\n        return 'Rare Elite'\n    elseif (c == 'elite') then\n        return 'Elite'\n    elseif (c == 'worldboss') then\n        return 'Boss'\n    end\n    \nend",
						},
						["__TrashAt"] = 1612568879,
						["Time"] = 1612568872,
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
							["race"] = {
							},
							["affix"] = {
							},
							["encounter_ids"] = {
							},
							["spec"] = {
							},
						},
						["Name"] = "Custom Classification",
						["HooksTemp"] = {
							["Nameplate Updated"] = "function (self, unitId, unitFrame, envTable)\n    \n    local c = UnitClassification(self)\n    \n    if (c == 'rare') then\n        return 'Rare'\n    elseif (c == 'rareelite') then\n        return 'Rare Elite'\n    elseif (c == 'elite') then\n        return 'Elite'\n    elseif (c == 'worldboss') then\n        return 'Boss'\n    end\n    \nend",
						},
						["Icon"] = "INTERFACE\\ICONS\\Ability_Argus_SoulBombDebuffLarge",
						["Options"] = {
						},
					}, -- [14]
					{
						["OptionsValues"] = {
						},
						["LastHookEdited"] = "Constructor",
						["Hooks"] = {
							["Nameplate Added"] = "function (self, unitId, unitFrame, envTable, modTable)\n    envTable.UpdateIndicator (unitFrame)\nend\n\n\n",
							["Constructor"] = "function (self, unitId, unitFrame, envTable, modTable)\n    -- text settings:\n    local textSize = 13\n    local alpha = 0.75\n    --local textColor = \"white\"\n    local textColor = GetRelativeDifficultyColor (UnitLevel (\"player\") or 120 , UnitLevel (unitId) or 120) or   Plater.DefaultLevelColor\n    local textOutline = \"OUTLINE\"\n    \n    local anchor = {\n        side = 6, --1 = topleft 2 = left 3 = bottomleft 4 = bottom 5 = bottom right 6 = right 7 = topright 8 = top\n        x = -2.5, --x offset\n        y = 0, --y offset\n    };\n    \n    \n    \n    ---- functions\n    local DF = _G [\"DetailsFramework\"]\n    \n    if not unitFrame.RareEliteTextIndicator then\n        unitFrame.RareEliteTextIndicator = Plater:CreateLabel (unitFrame.healthBar, \"\", textSize);\n    end\n    \n    if textFont then\n        DF:SetFontFace (unitFrame.RareEliteTextIndicator, Plater.GetConfig (unitFrame).percent_text_font)\n        --DF:SetFontFace (unitFrame.RareEliteTextIndicator, textFont)\n    end\n    if textSize then\n        DF:SetFontSize (unitFrame.RareEliteTextIndicator, textSize)\n    end\n    if textOutline then\n        DF:SetFontOutline (unitFrame.RareEliteTextIndicator, textOutline)\n    end\n    if textColor then\n        local r, g, b, a = DF:ParseColors (textColor)\n        unitFrame.RareEliteTextIndicator:SetTextColor (r, g, b, a)\n    end\n    if textShadowColor then\n        local r, g, b, a = DF:ParseColors (textShadowColor)\n        DF:SetFontShadow (unitFrame.RareEliteTextIndicator, r, g, b, a, 1, -1)\n    end\n    \n    Plater.SetAnchor (unitFrame.RareEliteTextIndicator, anchor, unitFrame.healthBar.actorLevel);\n    unitFrame.RareEliteTextIndicator:SetAlpha(alpha or 1)\n    \n    function envTable.UpdateIndicator (unitFrame)\n        local unitClassification = unitFrame.namePlateClassification\n        \n        if (unitClassification == \"rareelite\") then\n            unitFrame.RareEliteTextIndicator:SetText (\"R+\")\n            \n        elseif (unitClassification == \"rare\") then\n            unitFrame.RareEliteTextIndicator:SetText (\"R\")\n            \n        elseif (unitClassification == \"elite\") then\n            unitFrame.RareEliteTextIndicator:SetText (\"+\")\n            \n        elseif (unitClassification == \"worldboss\") then\n            unitFrame.RareEliteTextIndicator:SetText (\"B\")\n            \n        else\n            unitFrame.RareEliteTextIndicator:SetText (\"\")\n            \n        end\n    end\n    \nend\n\n\n\n\n",
						},
						["__TrashAt"] = 1612569420,
						["Time"] = 1612569401,
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
						["url"] = "https://wago.io/B3x4nT-qT/1",
						["Icon"] = 644389,
						["Enabled"] = true,
						["Revision"] = 147,
						["semver"] = "1.0.0",
						["Author"] = "Driani-Antonidas",
						["Desc"] = "Adds a simple text indicator for rares, elites and bosses.",
						["Prio"] = 99,
						["Name"] = "RareElite Text Inidicator",
						["PlaterCore"] = 1,
						["version"] = 1,
						["HooksTemp"] = {
							["Constructor"] = "function (self, unitId, unitFrame, envTable, modTable)\n    -- text settings:\n    local textSize = 13\n    local alpha = 0.75\n    --local textColor = \"white\"\n    local textColor = GetRelativeDifficultyColor (UnitLevel (\"player\") or 120 , UnitLevel (unitId) or 120) or   Plater.DefaultLevelColor\n    local textOutline = \"OUTLINE\"\n    \n    local anchor = {\n        side = 6, --1 = topleft 2 = left 3 = bottomleft 4 = bottom 5 = bottom right 6 = right 7 = topright 8 = top\n        x = -2.5, --x offset\n        y = 0, --y offset\n    };\n    \n    \n    \n    ---- functions\n    local DF = _G [\"DetailsFramework\"]\n    \n    if not unitFrame.RareEliteTextIndicator then\n        unitFrame.RareEliteTextIndicator = Plater:CreateLabel (unitFrame.healthBar, \"\", textSize);\n    end\n    \n    if textFont then\n        DF:SetFontFace (unitFrame.RareEliteTextIndicator, Plater.GetConfig (unitFrame).percent_text_font)\n        --DF:SetFontFace (unitFrame.RareEliteTextIndicator, textFont)\n    end\n    if textSize then\n        DF:SetFontSize (unitFrame.RareEliteTextIndicator, textSize)\n    end\n    if textOutline then\n        DF:SetFontOutline (unitFrame.RareEliteTextIndicator, textOutline)\n    end\n    if textColor then\n        local r, g, b, a = DF:ParseColors (textColor)\n        unitFrame.RareEliteTextIndicator:SetTextColor (r, g, b, a)\n    end\n    if textShadowColor then\n        local r, g, b, a = DF:ParseColors (textShadowColor)\n        DF:SetFontShadow (unitFrame.RareEliteTextIndicator, r, g, b, a, 1, -1)\n    end\n    \n    Plater.SetAnchor (unitFrame.RareEliteTextIndicator, anchor, unitFrame.healthBar.actorLevel);\n    unitFrame.RareEliteTextIndicator:SetAlpha(alpha or 1)\n    \n    function envTable.UpdateIndicator (unitFrame)\n        local unitClassification = unitFrame.namePlateClassification\n        \n        if (unitClassification == \"rareelite\") then\n            unitFrame.RareEliteTextIndicator:SetText (\"R+\")\n            \n        elseif (unitClassification == \"rare\") then\n            unitFrame.RareEliteTextIndicator:SetText (\"R\")\n            \n        elseif (unitClassification == \"elite\") then\n            unitFrame.RareEliteTextIndicator:SetText (\"+\")\n            \n        elseif (unitClassification == \"worldboss\") then\n            unitFrame.RareEliteTextIndicator:SetText (\"B\")\n            \n        else\n            unitFrame.RareEliteTextIndicator:SetText (\"\")\n            \n        end\n    end\n    \nend\n\n\n\n\n",
							["Nameplate Added"] = "function (self, unitId, unitFrame, envTable, modTable)\n    envTable.UpdateIndicator (unitFrame)\nend\n\n\n",
						},
						["Options"] = {
						},
					}, -- [15]
					{
						["Enabled"] = true,
						["Revision"] = 33,
						["OptionsValues"] = {
						},
						["LastHookEdited"] = "Constructor",
						["Options"] = {
						},
						["Author"] = "Luckyone-Laughing Skull",
						["PlaterCore"] = 1,
						["Desc"] = "",
						["Hooks"] = {
							["Constructor"] = "function (self, unitId, unitFrame, envTable, modTable)\n    function envTable.UpdateIndicator (unitFrame)\n        \n        local unitClassification = unitFrame.namePlateClassification\n        \n        if (unitClassification == \"rareelite\") then\n            unitFrame.RareEliteTextIndicator:SetText (\"R+\")\n        elseif (unitClassification == \"rare\") then\n            unitFrame.RareEliteTextIndicator:SetText (\"R\")\n        elseif (unitClassification == \"elite\") then\n            unitFrame.RareEliteTextIndicator:SetText (\"+\")\n        elseif (unitClassification == \"worldboss\") then\n            unitFrame.RareEliteTextIndicator:SetText (\"B\")\n        else\n            unitFrame.RareEliteTextIndicator:SetText (\"\")\n        end\n    end\nend",
							["Nameplate Added"] = "function (self, unitId, unitFrame, envTable, modTable)\n    envTable.UpdateIndicator (unitFrame)\nend",
						},
						["__TrashAt"] = 1612569749,
						["Time"] = 1612569744,
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
							["race"] = {
							},
							["affix"] = {
							},
							["encounter_ids"] = {
							},
							["spec"] = {
							},
						},
						["HooksTemp"] = {
							["Nameplate Updated"] = "function (self, unitId, unitFrame, envTable, modTable)\n    envTable.UpdateIndicator (unitFrame)\nend",
							["Nameplate Added"] = "function (self, unitId, unitFrame, envTable, modTable)\n    envTable.UpdateIndicator (unitFrame)\nend",
							["Constructor"] = "function (self, unitId, unitFrame, envTable, modTable)\n    function envTable.UpdateIndicator (unitFrame)\n        \n        local unitClassification = unitFrame.namePlateClassification\n        \n        if (unitClassification == \"rareelite\") then\n            unitFrame.RareEliteTextIndicator:SetText (\"R+\")\n        elseif (unitClassification == \"rare\") then\n            unitFrame.RareEliteTextIndicator:SetText (\"R\")\n        elseif (unitClassification == \"elite\") then\n            unitFrame.RareEliteTextIndicator:SetText (\"+\")\n        elseif (unitClassification == \"worldboss\") then\n            unitFrame.RareEliteTextIndicator:SetText (\"B\")\n        else\n            unitFrame.RareEliteTextIndicator:SetText (\"\")\n        end\n    end\nend",
						},
						["Name"] = "Custom Classification",
						["Icon"] = "INTERFACE\\ICONS\\Ability_Argus_SoulBombDebuffLarge",
						["Prio"] = 5,
					}, -- [16]
					{
						["OptionsValues"] = {
							["textureWidth"] = 1,
							["useFullSize"] = true,
							["showTexture"] = false,
						},
						["HooksTemp"] = {
							["Cast Update"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.UpdateIconPosition (unitFrame)\n    self.ThrottleUpdate = -1\n    \nend\n\n\n",
							["Cast Start"] = "function (self, unitId, unitFrame, envTable)\n    \n    unitFrame.castBar.BorderShield:SetDrawLayer(\"artwork\")\n    envTable.UpdateIconPosition (unitFrame)\n    \nend\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n",
							["Constructor"] = "function (self, unitId, unitFrame, envTable, modTable)\n    \n    --private:\n    function envTable.UpdateIconPosition (unitFrame)\n        local castBar = unitFrame.castBar\n        local icon = castBar.Icon\n        local noInterruptTexture = castBar.BorderShield\n        \n        if (modTable.config.showIcon) then\n            icon:ClearAllPoints()\n            \n            if (modTable.config.iconOnLeftSide) then\n                if (modTable.config.useFullSize) then\n                    icon:SetPoint (\"topright\", unitFrame.healthBar, \"topleft\", modTable.config.iconPadding, modTable.config.iconSizeOffset)\n                    icon:SetPoint (\"bottomright\", unitFrame.castBar, \"bottomleft\", modTable.config.iconPadding, -modTable.config.iconSizeOffset)\n                    \n                else\n                    \n                    icon:SetPoint (\"topright\", unitFrame.castBar, \"topleft\", modTable.config.iconPadding, modTable.config.iconSizeOffset)\n                    icon:SetPoint (\"bottomright\", unitFrame.castBar, \"bottomleft\", modTable.config.iconPadding, -modTable.config.iconSizeOffset)\n                end\n                \n            else\n                if (modTable.config.useFullSize) then\n                    icon:SetPoint (\"topleft\", unitFrame.healthBar, \"topright\", modTable.config.iconPadding, modTable.config.iconSizeOffset)\n                    icon:SetPoint (\"bottomleft\", unitFrame.castBar, \"bottomright\", modTable.config.iconPadding, -modTable.config.iconSizeOffset)\n                    \n                else\n                    \n                    icon:SetPoint (\"topleft\", unitFrame.castBar, \"topright\", modTable.config.iconPadding, modTable.config.iconSizeOffset)\n                    icon:SetPoint (\"bottomleft\", unitFrame.castBar, \"bottomright\", modTable.config.iconPadding, -modTable.config.iconSizeOffset)\n                end\n            end\n            \n            icon:SetWidth (icon:GetHeight())\n            icon:Show()\n        else\n            icon:Hide()\n        end\n        \n        if (modTable.config.showTexture and not castBar.canInterrupt) then\n            noInterruptTexture:Show()\n            \n            local texturePath = modTable.config.iconTexturePath\n            texturePath = texturePath:gsub(\"//\", \"/\")\n            texturePath = texturePath:gsub(\"\\\\\", \"/\")\n            \n            noInterruptTexture:SetTexture (texturePath)\n            noInterruptTexture:SetTexCoord (0, 1, 0, 1)\n            \n            if (modTable.config.desaturatedTexture) then\n                noInterruptTexture:SetDesaturated (modTable.config.desaturatedTexture)\n            else\n                noInterruptTexture:SetVertexColor (DetailsFramework:ParseColors (modTable.config.textureColor))\n            end\n            \n            noInterruptTexture:SetSize (modTable.config.textureWidth, castBar:GetHeight() + modTable.config.textureHeightMod)\n            noInterruptTexture:ClearAllPoints()\n            noInterruptTexture:SetPoint (\"center\", castBar, \"left\", modTable.config.texturePosition, 0)\n            noInterruptTexture:SetAlpha (modTable.config.textureAlpha)\n        else\n            noInterruptTexture:Hide()\n        end\n    end\nend",
						},
						["Hooks"] = {
							["Cast Update"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.UpdateIconPosition (unitFrame)\n    self.ThrottleUpdate = -1\n    \nend\n\n\n",
							["Cast Start"] = "function (self, unitId, unitFrame, envTable)\n    \n    unitFrame.castBar.BorderShield:SetDrawLayer(\"artwork\")\n    envTable.UpdateIconPosition (unitFrame)\n    \nend\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n",
							["Constructor"] = "function (self, unitId, unitFrame, envTable, modTable)\n    \n    --private:\n    function envTable.UpdateIconPosition (unitFrame)\n        local castBar = unitFrame.castBar\n        local icon = castBar.Icon\n        local noInterruptTexture = castBar.BorderShield\n        \n        if (modTable.config.showIcon) then\n            icon:ClearAllPoints()\n            \n            if (modTable.config.iconOnLeftSide) then\n                if (modTable.config.useFullSize) then\n                    icon:SetPoint (\"topright\", unitFrame.healthBar, \"topleft\", modTable.config.iconPadding, modTable.config.iconSizeOffset)\n                    icon:SetPoint (\"bottomright\", unitFrame.castBar, \"bottomleft\", modTable.config.iconPadding, -modTable.config.iconSizeOffset)\n                    \n                else\n                    \n                    icon:SetPoint (\"topright\", unitFrame.castBar, \"topleft\", modTable.config.iconPadding, modTable.config.iconSizeOffset)\n                    icon:SetPoint (\"bottomright\", unitFrame.castBar, \"bottomleft\", modTable.config.iconPadding, -modTable.config.iconSizeOffset)\n                end\n                \n            else\n                if (modTable.config.useFullSize) then\n                    icon:SetPoint (\"topleft\", unitFrame.healthBar, \"topright\", modTable.config.iconPadding, modTable.config.iconSizeOffset)\n                    icon:SetPoint (\"bottomleft\", unitFrame.castBar, \"bottomright\", modTable.config.iconPadding, -modTable.config.iconSizeOffset)\n                    \n                else\n                    \n                    icon:SetPoint (\"topleft\", unitFrame.castBar, \"topright\", modTable.config.iconPadding, modTable.config.iconSizeOffset)\n                    icon:SetPoint (\"bottomleft\", unitFrame.castBar, \"bottomright\", modTable.config.iconPadding, -modTable.config.iconSizeOffset)\n                end\n            end\n            \n            icon:SetWidth (icon:GetHeight())\n            icon:Show()\n        else\n            icon:Hide()\n        end\n        \n        if (modTable.config.showTexture and not castBar.canInterrupt) then\n            noInterruptTexture:Show()\n            \n            local texturePath = modTable.config.iconTexturePath\n            texturePath = texturePath:gsub(\"//\", \"/\")\n            texturePath = texturePath:gsub(\"\\\\\", \"/\")\n            \n            noInterruptTexture:SetTexture (texturePath)\n            noInterruptTexture:SetTexCoord (0, 1, 0, 1)\n            \n            if (modTable.config.desaturatedTexture) then\n                noInterruptTexture:SetDesaturated (modTable.config.desaturatedTexture)\n            else\n                noInterruptTexture:SetVertexColor (DetailsFramework:ParseColors (modTable.config.textureColor))\n            end\n            \n            noInterruptTexture:SetSize (modTable.config.textureWidth, castBar:GetHeight() + modTable.config.textureHeightMod)\n            noInterruptTexture:ClearAllPoints()\n            noInterruptTexture:SetPoint (\"center\", castBar, \"left\", modTable.config.texturePosition, 0)\n            noInterruptTexture:SetAlpha (modTable.config.textureAlpha)\n        else\n            noInterruptTexture:Hide()\n        end\n    end\nend",
						},
						["scriptId"] = "table: 000002C04147E610",
						["Time"] = 1612569836,
						["LoadConditions"] = {
							["talent"] = {
							},
							["group"] = {
							},
							["class"] = {
							},
							["map_ids"] = {
							},
							["race"] = {
							},
							["pvptalent"] = {
							},
							["role"] = {
							},
							["affix"] = {
							},
							["encounter_ids"] = {
							},
							["spec"] = {
							},
						},
						["url"] = "",
						["Icon"] = "Interface\\AddOns\\Plater\\images\\castbar_icon",
						["Enabled"] = true,
						["Revision"] = 364,
						["Options"] = {
							{
								["Type"] = 5,
								["Key"] = "option4",
								["Value"] = "Icon Settings:",
								["Name"] = "Icon Settings",
								["Icon"] = "Interface\\AddOns\\Plater\\images\\option_label",
								["Desc"] = "",
							}, -- [1]
							{
								["Type"] = 4,
								["Key"] = "showIcon",
								["Value"] = true,
								["Name"] = "Show Icon",
								["Icon"] = "Interface\\AddOns\\Plater\\images\\option_bool",
								["Desc"] = "Show the castbar icon when enabled",
							}, -- [2]
							{
								["Type"] = 4,
								["Key"] = "iconOnLeftSide",
								["Value"] = true,
								["Name"] = "Icon on Left Side",
								["Icon"] = "Interface\\AddOns\\Plater\\images\\option_bool",
								["Desc"] = "If enabled it anchor the icon on the left side, right otherwise",
							}, -- [3]
							{
								["Type"] = 4,
								["Name"] = "Use Big Icon",
								["Value"] = false,
								["Key"] = "useFullSize",
								["Icon"] = "Interface\\AddOns\\Plater\\images\\option_bool",
								["Desc"] = "If enabled the icon has the size of the cast bar plus the healthbar",
							}, -- [4]
							{
								["Type"] = 2,
								["Max"] = 5,
								["Desc"] = "Fine tune the icon size",
								["Min"] = 0,
								["Name"] = "Icon Size Offset",
								["Value"] = 0,
								["Fraction"] = true,
								["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
								["Key"] = "iconSizeOffset",
							}, -- [5]
							{
								["Type"] = 2,
								["Max"] = 5,
								["Desc"] = "Space between the icon and the cast bar",
								["Min"] = -5,
								["Key"] = "iconPadding",
								["Value"] = 0,
								["Name"] = "Icon Padding",
								["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
								["Fraction"] = false,
							}, -- [6]
							{
								["Type"] = 6,
								["Key"] = "option6",
								["Value"] = 0,
								["Name"] = "Blank Space",
								["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
								["Desc"] = "",
							}, -- [7]
							{
								["Type"] = 5,
								["Key"] = "option5",
								["Value"] = "Can't Interrupt Texture:",
								["Name"] = "Interrupt Texture",
								["Icon"] = "Interface\\AddOns\\Plater\\images\\option_label",
								["Desc"] = "",
							}, -- [8]
							{
								["Type"] = 4,
								["Key"] = "showTexture",
								["Value"] = true,
								["Name"] = "Show Texture",
								["Icon"] = "Interface\\AddOns\\Plater\\images\\option_bool",
								["Desc"] = "If enabled show a texture to tell the cast can't be interrupted",
							}, -- [9]
							{
								["Type"] = 3,
								["Key"] = "iconTexturePath",
								["Value"] = "Interface\\GROUPFRAME\\UI-GROUP-MAINTANKICON",
								["Name"] = "Texture Path",
								["Icon"] = "Interface\\AddOns\\Plater\\images\\option_text",
								["Desc"] = "Insert the path for the texture",
							}, -- [10]
							{
								["Type"] = 4,
								["Key"] = "desaturatedTexture",
								["Value"] = true,
								["Name"] = "Texture Desaturated",
								["Icon"] = "Interface\\AddOns\\Plater\\images\\option_bool",
								["Desc"] = "If enbaled, texture is shown in black & white",
							}, -- [11]
							{
								["Type"] = 1,
								["Key"] = "textureColor",
								["Value"] = {
									1, -- [1]
									1, -- [2]
									1, -- [3]
									0.3056715726852417, -- [4]
								},
								["Name"] = "Texture Color",
								["Icon"] = "Interface\\AddOns\\Plater\\images\\option_color",
								["Desc"] = "Select the color of the texture",
							}, -- [12]
							{
								["Type"] = 2,
								["Max"] = 32,
								["Desc"] = "Adjust the texture width",
								["Min"] = 1,
								["Name"] = "Texture Width",
								["Value"] = 10,
								["Fraction"] = false,
								["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
								["Key"] = "textureWidth",
							}, -- [13]
							{
								["Type"] = 2,
								["Max"] = 16,
								["Desc"] = "The texture is set to be the same size as the cast bar, fine tune the height as wanted",
								["Min"] = -16,
								["Key"] = "textureHeightMod",
								["Value"] = 0,
								["Name"] = "Texture Height Mod",
								["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
								["Fraction"] = true,
							}, -- [14]
							{
								["Type"] = 2,
								["Max"] = 32,
								["Desc"] = "Adjust the texture position",
								["Min"] = -32,
								["Name"] = "Texture Position",
								["Value"] = 0,
								["Fraction"] = false,
								["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
								["Key"] = "texturePosition",
							}, -- [15]
							{
								["Type"] = 2,
								["Max"] = 1,
								["Desc"] = "Adjust the texture transparency",
								["Min"] = 0,
								["Fraction"] = true,
								["Value"] = 1,
								["Key"] = "textureAlpha",
								["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
								["Name"] = "Texture Alpha",
							}, -- [16]
						},
						["Author"] = "Ditador-Azralon",
						["Desc"] = "",
						["Prio"] = 5,
						["version"] = -1,
						["PlaterCore"] = 1,
						["__TrashAt"] = 1612569840,
						["Name"] = "Castbar Settings",
						["LastHookEdited"] = "",
						["semver"] = "",
					}, -- [17]
					{
						["OptionsValues"] = {
						},
						["HooksTemp"] = {
							["Nameplate Created"] = "function (self, unitId, unitFrame, envTable)\n    \n    --run constructor!\n    \nend\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n",
							["Nameplate Added"] = "function (self, unitId, unitFrame, envTable)\n    if (envTable.IsEnabled) then\n        if (unitFrame.IsSelf) then\n            if (envTable.ShowOnPersonalBar) then\n                envTable.BorderFrame:Show()\n            else\n                envTable.BorderFrame:Hide() \n            end\n        else\n            envTable.BorderFrame:Show()\n        end   \n    end\n    \nend   \n\n\n\n",
							["Nameplate Removed"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.BorderFrame:Hide()\n    \nend\n\n\n",
							["Destructor"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.BorderFrame:Hide()\n    \nend\n\n\n",
							["Constructor"] = "function (self, unitId, unitFrame, envTable)\n    \n    --border color\n    local borderColor = \"yellow\"\n    \n    --size of the border\n    local borderSize = 1\n    \n    --transparency\n    local borderAlpha = 1\n    \n    --enabled (set to false it you only want to use the extra border in other scripts)\n    local isEnabled = true\n    \n    --export border (allow the border to be used by other scripts)\n    --other scripts can use:\n    --unitFrame.healthBar.extraBorder:Show()\n    --unitFrame.healthBar.extraBorder:SetVertexColor (r, g, b)\n    --unitFrame.healthBar.extraBorder:SetBorderSizes (borderSize)\n    local canExportBorder = true\n    \n    --do not add the border to personal bar\n    local noPersonalBar = true\n    \n    --private\n    do\n        \n        local newBorder = CreateFrame (\"frame\", nil, unitFrame.healthBar, \"NamePlateFullBorderTemplate\")\n        envTable.BorderFrame = newBorder\n        \n        newBorder:SetBorderSizes (borderSize, borderSize, borderSize, borderSize)\n        newBorder:UpdateSizes()\n        \n        local r, g, b = DetailsFramework:ParseColors (borderColor)\n        newBorder:SetVertexColor (r, g, b, borderAlpha)\n        \n        envTable.ShowOnPersonalBar = not noPersonalBar\n        \n        if (canExportBorder) then\n            unitFrame.healthBar.extraBorder = newBorder\n        end\n        \n        if (not isEnabled) then\n            envTable.IsEnabled = false\n        else\n            envTable.IsEnabled = true\n        end\n    end\n    \nend\n\n\n",
						},
						["Hooks"] = {
							["Nameplate Created"] = "function (self, unitId, unitFrame, envTable)\n    \n    --run constructor!\n    \nend\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n",
							["Nameplate Added"] = "function (self, unitId, unitFrame, envTable)\n    if (envTable.IsEnabled) then\n        if (unitFrame.IsSelf) then\n            if (envTable.ShowOnPersonalBar) then\n                envTable.BorderFrame:Show()\n            else\n                envTable.BorderFrame:Hide() \n            end\n        else\n            envTable.BorderFrame:Show()\n        end   \n    end\n    \nend   \n\n\n\n",
							["Nameplate Removed"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.BorderFrame:Hide()\n    \nend\n\n\n",
							["Destructor"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.BorderFrame:Hide()\n    \nend\n\n\n",
							["Constructor"] = "function (self, unitId, unitFrame, envTable)\n    \n    --border color\n    local borderColor = \"yellow\"\n    \n    --size of the border\n    local borderSize = 1\n    \n    --transparency\n    local borderAlpha = 1\n    \n    --enabled (set to false it you only want to use the extra border in other scripts)\n    local isEnabled = true\n    \n    --export border (allow the border to be used by other scripts)\n    --other scripts can use:\n    --unitFrame.healthBar.extraBorder:Show()\n    --unitFrame.healthBar.extraBorder:SetVertexColor (r, g, b)\n    --unitFrame.healthBar.extraBorder:SetBorderSizes (borderSize)\n    local canExportBorder = true\n    \n    --do not add the border to personal bar\n    local noPersonalBar = true\n    \n    --private\n    do\n        \n        local newBorder = CreateFrame (\"frame\", nil, unitFrame.healthBar, \"NamePlateFullBorderTemplate\")\n        envTable.BorderFrame = newBorder\n        \n        newBorder:SetBorderSizes (borderSize, borderSize, borderSize, borderSize)\n        newBorder:UpdateSizes()\n        \n        local r, g, b = DetailsFramework:ParseColors (borderColor)\n        newBorder:SetVertexColor (r, g, b, borderAlpha)\n        \n        envTable.ShowOnPersonalBar = not noPersonalBar\n        \n        if (canExportBorder) then\n            unitFrame.healthBar.extraBorder = newBorder\n        end\n        \n        if (not isEnabled) then\n            envTable.IsEnabled = false\n        else\n            envTable.IsEnabled = true\n        end\n    end\n    \nend\n\n\n",
						},
						["__TrashAt"] = 1612570074,
						["Time"] = 1612569766,
						["LoadConditions"] = {
							["talent"] = {
							},
							["group"] = {
							},
							["class"] = {
							},
							["map_ids"] = {
							},
							["race"] = {
							},
							["pvptalent"] = {
							},
							["role"] = {
							},
							["affix"] = {
							},
							["encounter_ids"] = {
							},
							["spec"] = {
							},
						},
						["url"] = "",
						["Icon"] = 133689,
						["Enabled"] = false,
						["Revision"] = 185,
						["Options"] = {
						},
						["Author"] = "Tecno-Azralon",
						["Desc"] = "",
						["Prio"] = 99,
						["version"] = -1,
						["PlaterCore"] = 1,
						["Name"] = "Custom Border",
						["LastHookEdited"] = "Nameplate Removed",
						["semver"] = "",
					}, -- [18]
					{
						["OptionsValues"] = {
						},
						["LastHookEdited"] = "Cast Update",
						["Hooks"] = {
							["Nameplate Removed"] = "function (self, unitId, unitFrame, envTable, modTable)\n    envTable.UpdateBorder (unitFrame, false)\nend\n\n\n\n\n",
							["Cast Start"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.UpdateIconPosition (unitFrame)\n    envTable.UpdateBorder (unitFrame, true)\n    \nend\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n",
							["Cast Update"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.UpdateIconPosition (unitFrame)\n    \nend",
							["Constructor"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.ShowIcon = Plater.db.profile.castbar_icon_show\n    envTable.IconAnchor = \"left\"\n    envTable.IconSizeOffset = 0\n    \n    envTable.ShowShield = false\n    envTable.ShieldTexture = [[Interface\\GROUPFRAME\\UI-GROUP-MAINTANKICON]]\n    envTable.ShieldDesaturated = true\n    envTable.ShieldColor = {1, 1, 1 ,1}\n    envTable.ShieldSize = {10, 12}\n    \n    function envTable.UpdateIconPosition (unitFrame)\n        local castBar = unitFrame.castBar\n        local icon = castBar.Icon\n        local shield = castBar.BorderShield\n        \n        if (envTable.ShowIcon) then\n            icon:ClearAllPoints()\n            \n            if (envTable.IconAnchor == \"left\") then\n                icon:SetPoint (\"topright\", unitFrame.healthBar, \"topleft\", 0, envTable.IconSizeOffset)\n                icon:SetPoint (\"bottomright\", unitFrame.castBar, \"bottomleft\", 0, 0)    \n                \n            elseif (envTable.IconAnchor == \"right\") then\n                icon:SetPoint (\"topleft\", unitFrame.healthBar, \"topright\", 0, envTable.IconSizeOffset)\n                icon:SetPoint (\"bottomleft\", unitFrame.castBar, \"bottomright\", 0, 0)\n                \n            end\n            \n            icon:SetWidth (icon:GetHeight())\n            icon:Show()\n            \n        else\n            icon:Hide()\n            \n        end\n        \n        if (envTable.ShowShield and not castBar.canInterrupt) then\n            shield:Show()\n            shield:SetAlpha (1)\n            shield:SetTexCoord (0, 1, 0, 1)\n            shield:SetVertexColor (1, 1, 1, 1)\n            \n            shield:SetTexture (envTable.ShieldTexture)\n            shield:SetDesaturated (envTable.ShieldDesaturated)\n            \n            if (not envTable.ShieldDesaturated) then\n                shield:SetVertexColor (DetailsFramework:ParseColors (envTable.ShieldColor))\n            end\n            \n            shield:SetSize (unpack (envTable.ShieldSize))\n            \n            shield:ClearAllPoints()\n            shield:SetPoint (\"center\", castBar, \"left\", 0, 0)\n            \n        else\n            shield:Hide()\n            \n        end\n        \n    end\n    \n    function envTable.UpdateBorder (unitFrame, casting)\n        local healthBar = unitFrame.healthBar\n        local castBar = unitFrame.castBar\n        \n        if casting then\n            if envTable.ShowIcon and castBar.Icon:IsShown() then\n                if envTable.IconAnchor == \"left\" then\n                    healthBar.border:SetPoint(\"TOPLEFT\", castBar.Icon, \"TOPLEFT\", 0, 0)\n                    healthBar.border:SetPoint(\"BOTTOMRIGHT\", castBar, \"BOTTOMRIGHT\", 0, 0)\n                elseif envTable.IconAnchor == \"right\" then\n                    healthBar.border:SetPoint(\"TOPRIGHT\", castBar.Icon, \"TOPRIGHT\", 0, 0)\n                    healthBar.border:SetPoint(\"BOTTOMLEFT\", castBar, \"BOTTOMLEFT\", 0, 0) \n                end\n            else\n                if envTable.IconAnchor == \"left\" then\n                    healthBar.border:SetPoint(\"TOPLEFT\", healthBar, \"TOPLEFT\", 0, 0)\n                    healthBar.border:SetPoint(\"BOTTOMRIGHT\", castBar, \"BOTTOMRIGHT\", 0, 0)\n                elseif envTable.IconAnchor == \"right\" then\n                    healthBar.border:SetPoint(\"TOPRIGHT\", healthBar, \"TOPRIGHT\", 0, 0)\n                    healthBar.border:SetPoint(\"BOTTOMLEFT\", castBar, \"BOTTOMLEFT\", 0, 0) \n                end\n            end\n        else\n            if envTable.IconAnchor == \"left\" then\n                healthBar.border:SetPoint(\"TOPLEFT\", healthBar, \"TOPLEFT\", 0, 0)\n                healthBar.border:SetPoint(\"BOTTOMRIGHT\", healthBar, \"BOTTOMRIGHT\", 0, 0)\n            elseif envTable.IconAnchor == \"right\" then\n                healthBar.border:SetPoint(\"TOPRIGHT\", healthBar, \"TOPRIGHT\", 0, 0)\n                healthBar.border:SetPoint(\"BOTTOMLEFT\", healthBar, \"BOTTOMLEFT\", 0, 0) \n            end\n        end\n    end\n    \n    if not unitFrame.castBar.borderChangeHooked then\n        hooksecurefunc(unitFrame.castBar, \"Hide\", function() envTable.UpdateBorder(unitFrame, false) end)\n        unitFrame.castBar.borderChangeHooked = true\n    end\n    \nend",
						},
						["__TrashAt"] = 1612570875,
						["Time"] = 1612570800,
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
						["url"] = "https://wago.io/mEN8Q6zUa/10",
						["Icon"] = "INTERFACE\\ICONS\\Ability_Argus_SoulBombDebuffLarge",
						["Enabled"] = true,
						["Revision"] = 408,
						["semver"] = "1.0.9",
						["Author"] = "Viash-Thrall",
						["Desc"] = "",
						["Prio"] = 99,
						["Name"] = "Custom Castbar",
						["PlaterCore"] = 1,
						["Options"] = {
						},
						["HooksTemp"] = {
							["Nameplate Removed"] = "function (self, unitId, unitFrame, envTable, modTable)\n    envTable.UpdateBorder (unitFrame, false)\nend\n\n\n\n\n",
							["Cast Update"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.UpdateIconPosition (unitFrame)\n    \nend",
							["Cast Start"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.UpdateIconPosition (unitFrame)\n    envTable.UpdateBorder (unitFrame, true)\n    \nend\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n",
							["Constructor"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.ShowIcon = Plater.db.profile.castbar_icon_show\n    envTable.IconAnchor = \"left\"\n    envTable.IconSizeOffset = 0\n    \n    envTable.ShowShield = false\n    envTable.ShieldTexture = [[Interface\\GROUPFRAME\\UI-GROUP-MAINTANKICON]]\n    envTable.ShieldDesaturated = true\n    envTable.ShieldColor = {1, 1, 1 ,1}\n    envTable.ShieldSize = {10, 12}\n    \n    function envTable.UpdateIconPosition (unitFrame)\n        local castBar = unitFrame.castBar\n        local icon = castBar.Icon\n        local shield = castBar.BorderShield\n        \n        if (envTable.ShowIcon) then\n            icon:ClearAllPoints()\n            \n            if (envTable.IconAnchor == \"left\") then\n                icon:SetPoint (\"topright\", unitFrame.healthBar, \"topleft\", 0, envTable.IconSizeOffset)\n                icon:SetPoint (\"bottomright\", unitFrame.castBar, \"bottomleft\", 0, 0)    \n                \n            elseif (envTable.IconAnchor == \"right\") then\n                icon:SetPoint (\"topleft\", unitFrame.healthBar, \"topright\", 0, envTable.IconSizeOffset)\n                icon:SetPoint (\"bottomleft\", unitFrame.castBar, \"bottomright\", 0, 0)\n                \n            end\n            \n            icon:SetWidth (icon:GetHeight())\n            icon:Show()\n            \n        else\n            icon:Hide()\n            \n        end\n        \n        if (envTable.ShowShield and not castBar.canInterrupt) then\n            shield:Show()\n            shield:SetAlpha (1)\n            shield:SetTexCoord (0, 1, 0, 1)\n            shield:SetVertexColor (1, 1, 1, 1)\n            \n            shield:SetTexture (envTable.ShieldTexture)\n            shield:SetDesaturated (envTable.ShieldDesaturated)\n            \n            if (not envTable.ShieldDesaturated) then\n                shield:SetVertexColor (DetailsFramework:ParseColors (envTable.ShieldColor))\n            end\n            \n            shield:SetSize (unpack (envTable.ShieldSize))\n            \n            shield:ClearAllPoints()\n            shield:SetPoint (\"center\", castBar, \"left\", 0, 0)\n            \n        else\n            shield:Hide()\n            \n        end\n        \n    end\n    \n    function envTable.UpdateBorder (unitFrame, casting)\n        local healthBar = unitFrame.healthBar\n        local castBar = unitFrame.castBar\n        \n        if casting then\n            if envTable.ShowIcon and castBar.Icon:IsShown() then\n                if envTable.IconAnchor == \"left\" then\n                    healthBar.border:SetPoint(\"TOPLEFT\", castBar.Icon, \"TOPLEFT\", 0, 0)\n                    healthBar.border:SetPoint(\"BOTTOMRIGHT\", castBar, \"BOTTOMRIGHT\", 0, 0)\n                elseif envTable.IconAnchor == \"right\" then\n                    healthBar.border:SetPoint(\"TOPRIGHT\", castBar.Icon, \"TOPRIGHT\", 0, 0)\n                    healthBar.border:SetPoint(\"BOTTOMLEFT\", castBar, \"BOTTOMLEFT\", 0, 0) \n                end\n            else\n                if envTable.IconAnchor == \"left\" then\n                    healthBar.border:SetPoint(\"TOPLEFT\", healthBar, \"TOPLEFT\", 0, 0)\n                    healthBar.border:SetPoint(\"BOTTOMRIGHT\", castBar, \"BOTTOMRIGHT\", 0, 0)\n                elseif envTable.IconAnchor == \"right\" then\n                    healthBar.border:SetPoint(\"TOPRIGHT\", healthBar, \"TOPRIGHT\", 0, 0)\n                    healthBar.border:SetPoint(\"BOTTOMLEFT\", castBar, \"BOTTOMLEFT\", 0, 0) \n                end\n            end\n        else\n            if envTable.IconAnchor == \"left\" then\n                healthBar.border:SetPoint(\"TOPLEFT\", healthBar, \"TOPLEFT\", 0, 0)\n                healthBar.border:SetPoint(\"BOTTOMRIGHT\", healthBar, \"BOTTOMRIGHT\", 0, 0)\n            elseif envTable.IconAnchor == \"right\" then\n                healthBar.border:SetPoint(\"TOPRIGHT\", healthBar, \"TOPRIGHT\", 0, 0)\n                healthBar.border:SetPoint(\"BOTTOMLEFT\", healthBar, \"BOTTOMLEFT\", 0, 0) \n            end\n        end\n    end\n    \n    if not unitFrame.castBar.borderChangeHooked then\n        hooksecurefunc(unitFrame.castBar, \"Hide\", function() envTable.UpdateBorder(unitFrame, false) end)\n        unitFrame.castBar.borderChangeHooked = true\n    end\n    \nend",
						},
						["version"] = 10,
					}, -- [19]
				},
				["extra_icon_anchor"] = {
					["x"] = 15,
					["side"] = 11,
				},
				["extra_icon_wide_icon"] = false,
				["range_check_alpha"] = 1,
				["use_name_translit"] = true,
				["extra_icon_height"] = 16,
				["extra_icon_show_purge"] = true,
				["spell_animations"] = false,
				["aura_consolidate"] = true,
				["extra_icon_width"] = 26,
				["health_statusbar_texture"] = "Solid",
				["hook_auto_imported"] = {
					["Reorder Nameplate"] = 4,
					["Dont Have Aura"] = 1,
					["Players Targetting Amount"] = 4,
					["Color Automation"] = 1,
					["Attacking Specific Unit"] = 1,
					["Cast Bar Icon Config"] = 2,
					["Execute Range"] = 1,
					["Hide Neutral Units"] = 1,
					["Extra Border"] = 2,
					["Target Color"] = 3,
					["Aura Reorder"] = 3,
					["Combo Points"] = 4,
				},
				["captured_spells"] = {
				},
				["aura_frame1_anchor"] = {
					["y"] = 2,
				},
				["aura_timer_text_font"] = "Expressway",
				["extra_icon_stack_font"] = "Expressway",
				["cast_statusbar_bgtexture"] = "Atrocity",
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
					["nameplateShowFriends"] = "0",
					["nameplateMinScale"] = "1",
					["nameplateMaxDistance"] = "100",
					["nameplateOtherTopInset"] = "-1",
					["nameplatePersonalHideDelaySeconds"] = "0.2",
					["nameplateShowAll"] = "1",
					["NamePlateHorizontalScale"] = "1",
					["nameplateShowFriendlyGuardians"] = "0",
					["nameplateTargetBehindMaxDistance"] = "30",
					["ShowNamePlateLoseAggroFlash"] = "1",
					["nameplateShowEnemies"] = "1",
					["nameplateShowFriendlyMinions"] = "0",
					["NamePlateVerticalScale"] = "1",
				},
				["login_counter"] = 889,
				["bossmod_aura_height"] = 30,
				["aura_stack_font"] = "Expressway",
				["hide_friendly_castbars"] = true,
				["OptionsPanelDB"] = {
					["PlaterOptionsPanelFrame"] = {
						["scale"] = 1,
					},
				},
				["auras_per_row_amount"] = 6,
				["target_highlight_texture"] = "Interface\\AddOns\\Plater\\images\\selection_indicator7",
				["plate_config"] = {
					["global_health_height"] = 12,
					["friendlyplayer"] = {
						["spellpercent_text_font"] = "Expressway",
						["level_text_outline"] = "OUTLINE",
						["cast"] = {
							120, -- [1]
							12, -- [2]
						},
						["cast_incombat"] = {
							120, -- [1]
						},
						["spellname_text_outline"] = "OUTLINE",
						["level_text_font"] = "Expressway",
						["spellname_text_font"] = "Expressway",
						["percent_text_font"] = "Expressway",
						["health_incombat"] = {
							120, -- [1]
							12, -- [2]
						},
						["health"] = {
							120, -- [1]
							12, -- [2]
						},
						["actorname_text_font"] = "Expressway",
						["actorname_use_class_color"] = true,
					},
					["friendlynpc"] = {
						["spellpercent_text_font"] = "Expressway",
						["cast"] = {
							120, -- [1]
							12, -- [2]
						},
						["big_actortitle_text_size"] = 9,
						["spellname_text_outline"] = "OUTLINE",
						["level_text_font"] = "Expressway",
						["actorname_text_font"] = "Expressway",
						["all_names"] = false,
						["actorname_text_outline"] = "OUTLINE",
						["big_actortitle_text_font"] = "Expressway",
						["relevance_state"] = 3,
						["spellname_text_font"] = "Expressway",
						["level_text_outline"] = "OUTLINE",
						["percent_text_font"] = "Expressway",
						["health_incombat"] = {
							nil, -- [1]
							12, -- [2]
						},
						["health"] = {
							120, -- [1]
						},
						["big_actorname_text_font"] = "Expressway",
					},
					["player"] = {
						["spellpercent_text_font"] = "Expressway",
						["power_percent_text_font"] = "Expressway",
						["spellname_text_font"] = "Expressway",
					},
					["enemynpc"] = {
						["spellpercent_text_font"] = "Expressway",
						["cast"] = {
							120, -- [1]
							12, -- [2]
						},
						["spellpercent_text_anchor"] = {
							["y"] = 0.2999954223632813,
							["x"] = -1,
						},
						["level_text_font"] = "Expressway",
						["actorname_text_font"] = "Expressway",
						["actorname_text_outline"] = "OUTLINE",
						["actorname_text_spacing"] = 8,
						["big_actortitle_text_font"] = "Expressway",
						["cast_incombat"] = {
							nil, -- [1]
							12, -- [2]
						},
						["spellname_text_anchor"] = {
							["y"] = 0.2999954223632813,
							["x"] = 1,
							["side"] = 10,
						},
						["percent_text_anchor"] = {
							["y"] = 0.5,
							["side"] = 11,
						},
						["spellname_text_font"] = "Expressway",
						["spellpercent_text_size"] = 9,
						["level_text_outline"] = "OUTLINE",
						["actorname_text_anchor"] = {
							["y"] = 0.2999954223632813,
							["x"] = 1,
							["side"] = 10,
						},
						["percent_text_font"] = "Expressway",
						["spellname_text_size"] = 9,
						["health"] = {
							120, -- [1]
							14, -- [2]
						},
						["actorname_text_size"] = 9,
						["big_actorname_text_font"] = "Expressway",
						["percent_show_health"] = false,
						["health_incombat"] = {
							nil, -- [1]
							14, -- [2]
						},
						["level_text_enabled"] = false,
					},
					["enemyplayer"] = {
						["spellpercent_text_font"] = "Expressway",
						["level_text_size"] = 8,
						["cast"] = {
							120, -- [1]
							12, -- [2]
						},
						["spellpercent_text_anchor"] = {
							["y"] = 0.2999954223632813,
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
						["spellname_text_anchor"] = {
							["y"] = 0.2999954223632813,
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
						["big_actorname_text_font"] = "Expressway",
						["big_actortitle_text_size"] = 10,
						["big_actorname_text_size"] = 10,
						["percent_show_health"] = false,
						["level_text_outline"] = "OUTLINE",
						["percent_text_font"] = "Expressway",
						["quest_enabled"] = true,
						["quest_color_enabled"] = true,
						["spellname_text_size"] = 9,
						["health"] = {
							120, -- [1]
							14, -- [2]
						},
						["actorname_text_size"] = 9,
						["actorname_text_anchor"] = {
							["y"] = 0.2999954223632813,
							["x"] = 1,
							["side"] = 10,
						},
						["health_incombat"] = {
							nil, -- [1]
							14, -- [2]
						},
						["level_text_enabled"] = false,
					},
					["global_health_width"] = 120,
				},
				["aura_y_offset"] = 2,
				["cast_statusbar_bgcolor"] = {
					0.05882352941176471, -- [1]
					0.05882352941176471, -- [2]
					0.05882352941176471, -- [3]
					0.800000011920929, -- [4]
				},
				["cast_statusbar_use_fade_effects"] = false,
				["indicator_scale"] = 1.100000023841858,
				["castbar_icon_size"] = "same as castbar plus healthbar",
				["bossmod_cooldown_text_size"] = 15,
				["hook_data"] = {
					{
						["Enabled"] = true,
						["Revision"] = 43,
						["OptionsValues"] = {
						},
						["LastHookEdited"] = "Nameplate Updated",
						["Author"] = "Luckyone-Laughing Skull",
						["Options"] = {
						},
						["Desc"] = "",
						["Hooks"] = {
							["Nameplate Updated"] = "function (self, unitId, unitFrame, envTable)\n    local unitName = UnitName(unitId)\n    \n    -- Show First Name [Whitelist table]\n    local firstName = {}\n    \n    -- Show Full Name [Whitelist table]\n    local fullName = {\n        [3527] = true, -- Healing Stream Totem\n        [2630] = true, -- Earthbind Totem\n        [61245] = true, -- Capacitor Totem\n        [5925] = true, -- Grounding Totem\n        [105451] = true, -- Counterstrike Totem\n        [105427] = true, -- Skyfury Totem\n        [97369] = true, -- Liquid Magma Totem\n    }\n    \n    if (unitName) then\n        local  a ,b, c ,d ,e ,f = strsplit(' ', unitName, 5)\n        \n        if firstName [unitFrame.namePlateNpcId] then\n            unitFrame.healthBar.unitName:SetText(a)\n        elseif fullName[unitFrame.namePlateNpcId] then\n            unitFrame.healthBar.unitName:SetText(unitName)\n        else\n            unitFrame.healthBar.unitName:SetText(f or e or d or c or b or a)\n        end\n    end\nend",
						},
						["Prio"] = 1,
						["Time"] = 1612740503,
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
							["race"] = {
							},
							["affix"] = {
							},
							["encounter_ids"] = {
							},
							["spec"] = {
							},
						},
						["HooksTemp"] = {
						},
						["Name"] = "Custom Name",
						["Icon"] = "INTERFACE\\ICONS\\Ability_Argus_DeathFog",
						["PlaterCore"] = 1,
					}, -- [1]
					{
						["Enabled"] = true,
						["Revision"] = 37,
						["OptionsValues"] = {
						},
						["LastHookEdited"] = "",
						["Author"] = "Luckyone-Laughing Skull",
						["Options"] = {
						},
						["Desc"] = "",
						["Hooks"] = {
							["Constructor"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.NpcColors = {\n        -- De Other Side [DOS]\n        [164857] = \"#00fbff\",\n        [167965] = \"#00fbff\",\n        [168934] = \"#00fbff\",\n        [168942] = \"#00fbff\",\n        [169905] = \"#00fbff\",\n        [170572] = \"#00fbff\",\n        [171343] = \"#00fbff\",\n        -- Halls of Atonement [HOA]\n        [164562] = \"#00fbff\",\n        [165529] = \"#00fbff\",\n        [167612] = \"#00fbff\",\n        [167892] = \"#00fbff\",\n        -- Mists of Tirna Scithe [MISTS]\n        [164804] = \"#00fbff\",\n        [164921] = \"#00fbff\",\n        [166299] = \"#00fbff\",\n        [167111] = \"#00fbff\",\n        -- The Necrotic Wake [NW]\n        [163618] = \"#00fbff\",\n        [165824] = \"#00fbff\",\n        [165872] = \"#00fbff\",\n        [166302] = \"#00fbff\",\n        [173016] = \"#00fbff\",\n        -- Plaguefall [PF]\n        [163882] = \"#00fbff\",\n        [163894] = \"#00fbff\",\n        [164737] = \"#00fbff\",\n        [168572] = \"#00fbff\",\n        [168627] = \"#00fbff\",\n        [169861] = \"#00fbff\",\n        -- Sanguine Depths [SD]\n        [162038] = \"#00fbff\",\n        [162040] = \"#00fbff\",\n        [162057] = \"#00fbff\",\n        [171376] = \"#00fbff\",\n        [171799] = \"#00fbff\",\n        -- Spires of Ascension [SOA]\n        [163459] = \"#00fbff\",\n        [163520] = \"#00fbff\",\n        [168318] = \"#00fbff\",\n        [168681] = \"#00fbff\",\n        -- Theater of Pain [TOP]\n        [160495] = \"#00fbff\",\n        [164506] = \"#00fbff\",\n        [170850] = \"#00fbff\",\n        [174210] = \"#00fbff\",\n        -- Others\n    }\n    \nend",
							["Nameplate Updated"] = "function (self, unitId, unitFrame, envTable)\n    \n    local color = envTable.NpcColors [unitFrame.namePlateUnitNameLower] or envTable.NpcColors [unitFrame.namePlateUnitName] or envTable.NpcColors [unitFrame.namePlateNpcId]\n    \n    if (color) then\n        Plater.SetNameplateColor (unitFrame, color)\n    end\n    \nend",
						},
						["Prio"] = 1,
						["Time"] = 1612572888,
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
							["race"] = {
							},
							["affix"] = {
							},
							["encounter_ids"] = {
							},
							["spec"] = {
							},
						},
						["HooksTemp"] = {
						},
						["Name"] = "Custom Bar Color",
						["Icon"] = "INTERFACE\\ICONS\\Ability_Argus_EdgeOfObliteration",
						["PlaterCore"] = 1,
					}, -- [2]
					{
						["Enabled"] = true,
						["Revision"] = 14,
						["OptionsValues"] = {
						},
						["LastHookEdited"] = "Constructor",
						["Author"] = "Luckyone-Laughing Skull",
						["Options"] = {
						},
						["Desc"] = "",
						["Hooks"] = {
							["Nameplate Removed"] = "function (self, unitId, unitFrame, envTable, modTable)\n    envTable.UpdateBorder (unitFrame, false)\nend",
							["Cast Update"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.UpdateIconPosition (unitFrame)\n    \nend",
							["Cast Start"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.UpdateIconPosition (unitFrame)\n    envTable.UpdateBorder (unitFrame, true)\n    \nend",
							["Constructor"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.ShowIcon = Plater.db.profile.castbar_icon_show\n    envTable.IconAnchor = \"left\"\n    envTable.IconSizeOffset = 0\n    \n    envTable.ShowShield = false\n    envTable.ShieldTexture = [[Interface\\GROUPFRAME\\UI-GROUP-MAINTANKICON]]\n    envTable.ShieldDesaturated = true\n    envTable.ShieldColor = {1, 1, 1 ,1}\n    envTable.ShieldSize = {10, 12}\n    \n    function envTable.UpdateIconPosition (unitFrame)\n        local castBar = unitFrame.castBar\n        local icon = castBar.Icon\n        local shield = castBar.BorderShield\n        \n        if (envTable.ShowIcon) then\n            icon:ClearAllPoints()\n            \n            if (envTable.IconAnchor == \"left\") then\n                icon:SetPoint (\"topright\", unitFrame.healthBar, \"topleft\", 0, envTable.IconSizeOffset)\n                icon:SetPoint (\"bottomright\", unitFrame.castBar, \"bottomleft\", 0, 0)    \n                \n            elseif (envTable.IconAnchor == \"right\") then\n                icon:SetPoint (\"topleft\", unitFrame.healthBar, \"topright\", 0, envTable.IconSizeOffset)\n                icon:SetPoint (\"bottomleft\", unitFrame.castBar, \"bottomright\", 0, 0)\n                \n            end\n            \n            icon:SetWidth (icon:GetHeight())\n            icon:Show()\n            \n        else\n            icon:Hide()\n            \n        end\n        \n        if (envTable.ShowShield and not castBar.canInterrupt) then\n            shield:Show()\n            shield:SetAlpha (1)\n            shield:SetTexCoord (0, 1, 0, 1)\n            shield:SetVertexColor (1, 1, 1, 1)\n            \n            shield:SetTexture (envTable.ShieldTexture)\n            shield:SetDesaturated (envTable.ShieldDesaturated)\n            \n            if (not envTable.ShieldDesaturated) then\n                shield:SetVertexColor (DetailsFramework:ParseColors (envTable.ShieldColor))\n            end\n            \n            shield:SetSize (unpack (envTable.ShieldSize))\n            \n            shield:ClearAllPoints()\n            shield:SetPoint (\"center\", castBar, \"left\", 0, 0)\n            \n        else\n            shield:Hide()\n            \n        end\n        \n    end\n    \n    function envTable.UpdateBorder (unitFrame, casting)\n        local healthBar = unitFrame.healthBar\n        local castBar = unitFrame.castBar\n        \n        if casting then\n            if envTable.ShowIcon and castBar.Icon:IsShown() then\n                if envTable.IconAnchor == \"left\" then\n                    healthBar.border:SetPoint(\"TOPLEFT\", castBar.Icon, \"TOPLEFT\", 0, 0)\n                    healthBar.border:SetPoint(\"BOTTOMRIGHT\", castBar, \"BOTTOMRIGHT\", 0, 0)\n                elseif envTable.IconAnchor == \"right\" then\n                    healthBar.border:SetPoint(\"TOPRIGHT\", castBar.Icon, \"TOPRIGHT\", 0, 0)\n                    healthBar.border:SetPoint(\"BOTTOMLEFT\", castBar, \"BOTTOMLEFT\", 0, 0) \n                end\n            else\n                if envTable.IconAnchor == \"left\" then\n                    healthBar.border:SetPoint(\"TOPLEFT\", healthBar, \"TOPLEFT\", 0, 0)\n                    healthBar.border:SetPoint(\"BOTTOMRIGHT\", castBar, \"BOTTOMRIGHT\", 0, 0)\n                elseif envTable.IconAnchor == \"right\" then\n                    healthBar.border:SetPoint(\"TOPRIGHT\", healthBar, \"TOPRIGHT\", 0, 0)\n                    healthBar.border:SetPoint(\"BOTTOMLEFT\", castBar, \"BOTTOMLEFT\", 0, 0) \n                end\n            end\n        else\n            if envTable.IconAnchor == \"left\" then\n                healthBar.border:SetPoint(\"TOPLEFT\", healthBar, \"TOPLEFT\", 0, 0)\n                healthBar.border:SetPoint(\"BOTTOMRIGHT\", healthBar, \"BOTTOMRIGHT\", 0, 0)\n            elseif envTable.IconAnchor == \"right\" then\n                healthBar.border:SetPoint(\"TOPRIGHT\", healthBar, \"TOPRIGHT\", 0, 0)\n                healthBar.border:SetPoint(\"BOTTOMLEFT\", healthBar, \"BOTTOMLEFT\", 0, 0) \n            end\n        end\n    end\n    \n    if not unitFrame.castBar.borderChangeHooked then\n        hooksecurefunc(unitFrame.castBar, \"Hide\", function() envTable.UpdateBorder(unitFrame, false) end)\n        unitFrame.castBar.borderChangeHooked = true\n    end\n    \nend",
						},
						["Prio"] = 1,
						["Time"] = 1613418799,
						["PlaterCore"] = 1,
						["HooksTemp"] = {
							["Nameplate Removed"] = "function (self, unitId, unitFrame, envTable, modTable)\n    envTable.UpdateBorder (unitFrame, false)\nend",
							["Cast Start"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.UpdateIconPosition (unitFrame)\n    envTable.UpdateBorder (unitFrame, true)\n    \nend",
							["Cast Update"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.UpdateIconPosition (unitFrame)\n    \nend",
							["Constructor"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.ShowIcon = Plater.db.profile.castbar_icon_show\n    envTable.IconAnchor = \"left\"\n    envTable.IconSizeOffset = 0\n    \n    envTable.ShowShield = false\n    envTable.ShieldTexture = [[Interface\\GROUPFRAME\\UI-GROUP-MAINTANKICON]]\n    envTable.ShieldDesaturated = true\n    envTable.ShieldColor = {1, 1, 1 ,1}\n    envTable.ShieldSize = {10, 12}\n    \n    function envTable.UpdateIconPosition (unitFrame)\n        local castBar = unitFrame.castBar\n        local icon = castBar.Icon\n        local shield = castBar.BorderShield\n        \n        if (envTable.ShowIcon) then\n            icon:ClearAllPoints()\n            \n            if (envTable.IconAnchor == \"left\") then\n                icon:SetPoint (\"topright\", unitFrame.healthBar, \"topleft\", 0, envTable.IconSizeOffset)\n                icon:SetPoint (\"bottomright\", unitFrame.castBar, \"bottomleft\", 0, 0)    \n                \n            elseif (envTable.IconAnchor == \"right\") then\n                icon:SetPoint (\"topleft\", unitFrame.healthBar, \"topright\", 0, envTable.IconSizeOffset)\n                icon:SetPoint (\"bottomleft\", unitFrame.castBar, \"bottomright\", 0, 0)\n                \n            end\n            \n            icon:SetWidth (icon:GetHeight())\n            icon:Show()\n            \n        else\n            icon:Hide()\n            \n        end\n        \n        if (envTable.ShowShield and not castBar.canInterrupt) then\n            shield:Show()\n            shield:SetAlpha (1)\n            shield:SetTexCoord (0, 1, 0, 1)\n            shield:SetVertexColor (1, 1, 1, 1)\n            \n            shield:SetTexture (envTable.ShieldTexture)\n            shield:SetDesaturated (envTable.ShieldDesaturated)\n            \n            if (not envTable.ShieldDesaturated) then\n                shield:SetVertexColor (DetailsFramework:ParseColors (envTable.ShieldColor))\n            end\n            \n            shield:SetSize (unpack (envTable.ShieldSize))\n            \n            shield:ClearAllPoints()\n            shield:SetPoint (\"center\", castBar, \"left\", 0, 0)\n            \n        else\n            shield:Hide()\n            \n        end\n        \n    end\n    \n    function envTable.UpdateBorder (unitFrame, casting)\n        local healthBar = unitFrame.healthBar\n        local castBar = unitFrame.castBar\n        \n        if casting then\n            if envTable.ShowIcon and castBar.Icon:IsShown() then\n                if envTable.IconAnchor == \"left\" then\n                    healthBar.border:SetPoint(\"TOPLEFT\", castBar.Icon, \"TOPLEFT\", 0, 0)\n                    healthBar.border:SetPoint(\"BOTTOMRIGHT\", castBar, \"BOTTOMRIGHT\", 0, 0)\n                elseif envTable.IconAnchor == \"right\" then\n                    healthBar.border:SetPoint(\"TOPRIGHT\", castBar.Icon, \"TOPRIGHT\", 0, 0)\n                    healthBar.border:SetPoint(\"BOTTOMLEFT\", castBar, \"BOTTOMLEFT\", 0, 0) \n                end\n            else\n                if envTable.IconAnchor == \"left\" then\n                    healthBar.border:SetPoint(\"TOPLEFT\", healthBar, \"TOPLEFT\", 0, 0)\n                    healthBar.border:SetPoint(\"BOTTOMRIGHT\", castBar, \"BOTTOMRIGHT\", 0, 0)\n                elseif envTable.IconAnchor == \"right\" then\n                    healthBar.border:SetPoint(\"TOPRIGHT\", healthBar, \"TOPRIGHT\", 0, 0)\n                    healthBar.border:SetPoint(\"BOTTOMLEFT\", castBar, \"BOTTOMLEFT\", 0, 0) \n                end\n            end\n        else\n            if envTable.IconAnchor == \"left\" then\n                healthBar.border:SetPoint(\"TOPLEFT\", healthBar, \"TOPLEFT\", 0, 0)\n                healthBar.border:SetPoint(\"BOTTOMRIGHT\", healthBar, \"BOTTOMRIGHT\", 0, 0)\n            elseif envTable.IconAnchor == \"right\" then\n                healthBar.border:SetPoint(\"TOPRIGHT\", healthBar, \"TOPRIGHT\", 0, 0)\n                healthBar.border:SetPoint(\"BOTTOMLEFT\", healthBar, \"BOTTOMLEFT\", 0, 0) \n            end\n        end\n    end\n    \n    if not unitFrame.castBar.borderChangeHooked then\n        hooksecurefunc(unitFrame.castBar, \"Hide\", function() envTable.UpdateBorder(unitFrame, false) end)\n        unitFrame.castBar.borderChangeHooked = true\n    end\n    \nend",
						},
						["Name"] = "Custom Castbar",
						["Icon"] = "INTERFACE\\ICONS\\Ability_Argus_SoulBombDebuffLarge",
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
							["affix"] = {
							},
							["encounter_ids"] = {
							},
							["race"] = {
							},
						},
					}, -- [3]
				},
				["extra_icon_caster_outline"] = "OUTLINE",
				["auras_per_row_amount2"] = 6,
				["aura_width"] = 16,
				["health_statusbar_bgcolor"] = {
					0.05882352941176471, -- [1]
					0.05882352941176471, -- [2]
					0.05882352941176471, -- [3]
					0.800000011920929, -- [4]
				},
				["quick_hide"] = true,
				["target_highlight_color"] = {
					nil, -- [1]
					1, -- [2]
					0.05882352941176471, -- [3]
				},
				["extra_icon_stack_outline"] = "OUTLINE",
				["castbar_target_font"] = "Expressway",
				["aura_x_offset"] = 0,
				["first_run3"] = true,
				["ui_parent_scale_tune"] = 1.299999952316284,
				["health_statusbar_bgtexture"] = "Solid",
				["indicator_raidmark_anchor"] = {
					["x"] = 17,
				},
				["aura_show_enrage"] = true,
				["aura_tracker"] = {
					["debuff_banned"] = {
						[342938] = true,
					},
					["buff_tracked"] = {
						[344739] = true,
						[331510] = true,
						[340880] = true,
						[326450] = true,
						[340873] = true,
						[321754] = true,
						[343470] = true,
						[327808] = true,
						[343502] = true,
						[330545] = true,
						[317936] = true,
						[336451] = true,
						[343558] = true,
						[209859] = true,
						[322773] = true,
						[226510] = true,
						[333227] = true,
						[336499] = true,
						[178658] = true,
						[327416] = true,
						[321402] = true,
						[322433] = true,
						[326892] = true,
						[333241] = true,
						[333737] = true,
					},
				},
				["extra_icon_caster_font"] = "Expressway",
				["cast_statusbar_color"] = {
					0.02352941176470588, -- [1]
					1, -- [2]
					nil, -- [3]
					0.9600000008940697, -- [4]
				},
				["update_throttle"] = 0.05000000074505806,
				["indicator_extra_raidmark"] = false,
				["indicator_spec"] = false,
				["extra_icon_timer_font"] = "Expressway",
				["indicator_elite"] = false,
				["target_highlight_alpha"] = 1,
				["indicator_raidmark_scale"] = 0.699999988079071,
				["health_selection_overlay"] = "Solid",
				["target_highlight_height"] = 10,
				["use_ui_parent"] = true,
				["extra_icon_timer_outline"] = "OUTLINE",
				["patch_version"] = 13,
				["range_check_in_range_or_target_alpha"] = 1,
				["aura_timer_text_size"] = 10,
				["number_region_first_run"] = true,
				["castbar_target_anchor"] = {
					["side"] = 4,
				},
				["script_auto_imported"] = {
					["Unit - Important"] = 11,
					["Aura - Buff Alert"] = 13,
					["Cast - Very Important"] = 11,
					["Explosion Affix M+"] = 11,
					["Aura - Debuff Alert"] = 11,
					["Cast - Ultra Important"] = 11,
					["Cast - Big Alert"] = 11,
					["Cast - Small Alert"] = 11,
					["Auto Set Skull"] = 11,
					["Unit - Main Target"] = 11,
					["Aura - Blink Time Left"] = 12,
					["Countdown"] = 11,
					["Unit - Health Markers"] = 12,
					["Cast - Frontal Cone"] = 11,
					["Fixate"] = 11,
					["Cast - Tank Interrupt"] = 11,
					["Unit - Show Energy"] = 11,
					["Spiteful Affix"] = 3,
					["Fixate On You"] = 11,
				},
				["cast_statusbar_texture"] = "Solid",
				["indicator_faction"] = false,
				["indicator_pet"] = false,
				["indicator_rare"] = false,
				["aura2_x_offset"] = 0,
				["bossmod_aura_width"] = 30,
				["cast_statusbar_color_interrupted"] = {
					0.3019607843137255, -- [1]
					0.3019607843137255, -- [2]
					0.3019607843137255, -- [3]
				},
			},
		},
	}

end
