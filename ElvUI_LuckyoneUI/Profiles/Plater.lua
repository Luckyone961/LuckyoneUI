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
						["Time"] = 1616002305,
						["Temp_Initialization"] = "function (scriptTable)\n    --insert code here\n    \nend\n\n\n",
						["url"] = "",
						["NpcNames"] = {
							"164362", -- [1]
							"168882", -- [2]
							"168988", -- [3]
							"170234", -- [4]
							"165905", -- [5]
							"170452", -- [6]
						},
						["Temp_ConstructorCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    --settings (you may need /reload if some configs isn't applied immediately)    \n    --change the nameplate color to this if allowed\n    envTable.CanChangeNameplateColor = scriptTable.config.changeNameplateColor --\n    envTable.NameplateColor = scriptTable.config.nameplateColor\n    envTable.NameplateSizeOffset = scriptTable.config.nameplateSizeOffset --\n    \n    unitFrame.UnitImportantSkullTexture = unitFrame.UnitImportantSkullTexture or unitFrame:CreateTexture(nil, \"background\")\n    \n    unitFrame.UnitImportantSkullTexture:SetTexture([[Interface/AddOns/Plater/media/skullbones_128]])\n    unitFrame.UnitImportantSkullTexture:SetPoint(\"center\", unitFrame.healthBar, \"center\", 0, -5)\n    \n    unitFrame.UnitImportantSkullTexture:SetVertexColor(Plater:ParseColors(scriptTable.config.skullColor))\n    unitFrame.UnitImportantSkullTexture:SetAlpha(scriptTable.config.skullAlpha)\n    unitFrame.UnitImportantSkullTexture:SetScale(scriptTable.config.skullScale)\n    \n    unitFrame.UnitImportantSkullTexture:Hide()\nend\n\n--[=[\n\n154564 - debug\n\nUsing spellIDs for multi-language support\n\n164362 - smily morsel - plaguefall\n168882 - fleeting manifestation - sanguine depths\n170234 - oppressive banner - theater of pain\n168988 - overgrowth - Mists of Tirna Scithe\n170452 - essesnce orb - torghast\n\n\n--]=]",
						["Temp_OnHideCode"] = "function (self, unitId, unitFrame, envTable)\n    Plater.StopDotAnimation(unitFrame.healthBar, envTable.dotAnimation)   \n    \n    --restore the nameplate size\n    local nameplateHeight = Plater.db.profile.plate_config.enemynpc.health_incombat [2]\n    unitFrame.healthBar:SetHeight (nameplateHeight)    \n    \n    unitFrame.UnitImportantSkullTexture:Hide()\nend\n\n\n",
						["Revision"] = 359,
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
								["Name"] = "Nameplate Size Offset",
								["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
								["Fraction"] = false,
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
								["Fraction"] = true,
								["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
								["Name"] = "Alpha",
							}, -- [12]
							{
								["Type"] = 2,
								["Max"] = 2,
								["Desc"] = "",
								["Min"] = 0.4,
								["Fraction"] = true,
								["Value"] = 0.6,
								["Name"] = "Scale",
								["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
								["Key"] = "skullScale",
							}, -- [13]
						},
						["Icon"] = "Interface\\AddOns\\Plater\\media\\skullbones_64",
						["Enabled"] = true,
						["Author"] = "Izimode-Azralon",
						["Initialization"] = "function (scriptTable)\n    --insert code here\n    \nend\n\n\n",
						["Desc"] = "Highlight a nameplate of an important Add. Add the unit name or NpcID into the trigger box to add more.",
						["version"] = -1,
						["Prio"] = 99,
						["Name"] = "Unit - Important [Plater]",
						["PlaterCore"] = 1,
						["Temp_UpdateCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --check if can change the nameplate color\n    if (envTable.CanChangeNameplateColor) then\n        Plater.SetNameplateColor (unitFrame, envTable.NameplateColor)\n    end\n    \nend\n\n\n\n\n",
						["semver"] = "",
						["OnShowCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    if (envTable.dotAnimation) then\n        Plater.StopDotAnimation(unitFrame.healthBar, envTable.dotAnimation)\n    end\n    \n    envTable.dotAnimation = Plater.PlayDotAnimation(unitFrame.healthBar, 2, scriptTable.config.dotsColor, 3, 4) \n    \n    --increase the nameplate size\n    local nameplateHeight = Plater.db.profile.plate_config.enemynpc.health_incombat [2]\n    unitFrame.healthBar:SetHeight (nameplateHeight + envTable.NameplateSizeOffset)\n    \n    unitFrame.UnitImportantSkullTexture:Show()\nend\n\n\n\n\n",
						["SpellIds"] = {
						},
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
						["UpdateCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    \n    \n    \nend",
						["Temp_ConstructorCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    --creates a glow around the icon\n    envTable.buffIconGlow = envTable.buffIconGlow or Plater.CreateIconGlow (self, scriptTable.config.glowColor)\n    \nend",
						["NpcNames"] = {
						},
						["url"] = "",
						["Enabled"] = true,
						["Revision"] = 608,
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
						["Icon"] = "Interface\\AddOns\\Plater\\images\\icon_aura",
						["Temp_OnHideCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    if (scriptTable.config.glowEnabled) then\n        envTable.buffIconGlow:Hide()\n    end\n    \n    if (scriptTable.config.dotsEnabled) then\n        Plater.StopDotAnimation(self, envTable.dotAnimation)\n    end\n    \n    \nend",
						["Author"] = "Tercioo-Sylvanas",
						["Initialization"] = "function (scriptTable)\n    --insert code here\n    \nend\n\n\n",
						["Desc"] = "Add the buff name in the trigger box.",
						["version"] = -1,
						["Prio"] = 99,
						["Name"] = "Aura - Buff Alert [Plater]",
						["PlaterCore"] = 1,
						["Temp_UpdateCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    \n    \n    \nend",
						["semver"] = "",
						["OnShowCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    if (scriptTable.config.glowEnabled) then\n        envTable.buffIconGlow:Show()\n    end\n    \n    if (scriptTable.config.dotsEnabled) then\n        envTable.dotAnimation = Plater.PlayDotAnimation(self, 6, scriptTable.config.dotsColor, 6, 3) \n    end\n    \nend\n\n\n\n\n",
						["SpellIds"] = {
							323149, -- [1]
							324392, -- [2]
							340544, -- [3]
							342189, -- [4]
							333227, -- [5]
						},
					}, -- [2]
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
						["OnShowCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    envTable.dotAnimation = Plater.PlayDotAnimation(unitFrame.castBar, 5, scriptTable.config.dotColor, scriptTable.config.xOffset, scriptTable.config.yOffset)\n    \n    \n    envTable.BackgroundFlash:Play()\n    \n    Plater.FlashNameplateBorder (unitFrame, 0.05)   \n    Plater.FlashNameplateBody (unitFrame, \"\", 0.075)\n    \n    unitFrame:PlayFrameShake (envTable.FrameShake)\n    \n    if (envTable._CanInterrupt) then\n        if (scriptTable.config.useCastbarColor) then\n            self:SetStatusBarColor (Plater:ParseColors (scriptTable.config.castBarColor))\n        end\n    end\n    \nend\n\n\n",
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
								["Fraction"] = true,
								["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
								["Name"] = "Flash Duration",
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
								["Fraction"] = true,
								["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
								["Name"] = "Shake Duration",
							}, -- [10]
							{
								["Type"] = 2,
								["Max"] = 10,
								["Desc"] = "How strong is the shake.",
								["Min"] = 1,
								["Key"] = "shakeAmplitude",
								["Value"] = 5,
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
								["Value"] = 40,
								["Fraction"] = false,
								["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
								["Name"] = "Shake Frequency",
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
								["Name"] = "Dot X Offset",
								["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
								["Fraction"] = false,
							}, -- [16]
							{
								["Type"] = 2,
								["Max"] = 10,
								["Desc"] = "Adjust the height of the dots to better fit in your nameplate.",
								["Min"] = -10,
								["Fraction"] = false,
								["Value"] = 3,
								["Key"] = "yOffset",
								["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
								["Name"] = "Dot Y Offset",
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
						["version"] = -1,
						["Name"] = "Cast - Very Important [Plater]",
						["NpcNames"] = {
						},
					}, -- [3]
					{
						["ConstructorCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    --settings\n    envTable.NameplateSizeOffset = scriptTable.config.castBarHeight\n    envTable.ShowArrow = scriptTable.config.showArrow\n    envTable.ArrowAlpha = scriptTable.config.arrowAlpha\n    envTable.HealthBarColor = scriptTable.config.healthBarColor\n    \n    --creates the spark to show the cast progress inside the health bar\n    envTable.overlaySpark = envTable.overlaySpark or Plater:CreateImage (unitFrame.healthBar)\n    envTable.overlaySpark:SetBlendMode (\"ADD\")\n    envTable.overlaySpark.width = 16\n    envTable.overlaySpark.height = 36\n    envTable.overlaySpark.alpha = .9\n    envTable.overlaySpark.texture = [[Interface\\AddOns\\Plater\\images\\spark3]]\n    \n    envTable.topArrow = envTable.topArrow or Plater:CreateImage (unitFrame.healthBar)\n    envTable.topArrow:SetBlendMode (\"ADD\")\n    envTable.topArrow.width = scriptTable.config.arrowWidth\n    envTable.topArrow.height = scriptTable.config.arrowHeight\n    envTable.topArrow.alpha = envTable.ArrowAlpha\n    envTable.topArrow.texture = [[Interface\\BUTTONS\\Arrow-Down-Up]]\n    \n    --scale animation\n    envTable.smallScaleAnimation = envTable.smallScaleAnimation or Plater:CreateAnimationHub (unitFrame.healthBar)\n    Plater:CreateAnimation (envTable.smallScaleAnimation, \"SCALE\", 1, 0.075, 1, 1, 1.08, 1.08)\n    Plater:CreateAnimation (envTable.smallScaleAnimation, \"SCALE\", 2, 0.075, 1, 1, 0.95, 0.95)    \n    --envTable.smallScaleAnimation:Play() --envTable.smallScaleAnimation:Stop()\n    \nend\n\n\n\n\n\n\n\n",
						["OnHideCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    Plater.StopDotAnimation(unitFrame.healthBar, envTable.dotAnimation)\n    \n    envTable.overlaySpark:Hide()\n    envTable.topArrow:Hide()\n    \n    Plater.RefreshNameplateColor (unitFrame)\n    \n    envTable.smallScaleAnimation:Stop()\n    \n    --increase the nameplate size\n    local nameplateHeight = Plater.db.profile.plate_config.enemynpc.health_incombat [2]\n    unitFrame.healthBar:SetHeight (nameplateHeight)\nend\n\n\n",
						["OptionsValues"] = {
						},
						["Temp_OnShowCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    envTable.overlaySpark:Show()\n    \n    if (envTable.ShowArrow) then\n        envTable.topArrow:Show()\n    end\n    \n    Plater.FlashNameplateBorder (unitFrame, 0.05)   \n    Plater.FlashNameplateBody (unitFrame, \"\", 0.075)\n    \n    envTable.smallScaleAnimation:Play()\n    \n    --increase the nameplate size\n    local nameplateHeight = Plater.db.profile.plate_config.enemynpc.health_incombat [2]\n    unitFrame.healthBar:SetHeight (nameplateHeight + envTable.NameplateSizeOffset)\n    \n    envTable.overlaySpark.height = nameplateHeight + 5\n    \n    envTable.dotAnimation = Plater.PlayDotAnimation(unitFrame.healthBar, 2, scriptTable.config.dotColor, scriptTable.config.xOffset, scriptTable.config.yOffset)\n    \n    self:SetStatusBarColor (Plater:ParseColors (scriptTable.config.castBarColor))\nend\n\n\n\n\n\n\n",
						["ScriptType"] = 2,
						["UpdateCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    --update the percent\n    envTable.overlaySpark:SetPoint (\"left\", unitFrame.healthBar:GetWidth() * (envTable._CastPercent / 100)-9, 0)\n    \n    envTable.topArrow:SetPoint (\"bottomleft\", unitFrame.healthBar, \"topleft\", unitFrame.healthBar:GetWidth() * (envTable._CastPercent / 100) - 4, 2 )\n    \n    --forces the script to update on a 60Hz base\n    self.ThrottleUpdate = 0\n    \n\nend\n\n\n",
						["Time"] = 1614271003,
						["Temp_Initialization"] = "function (scriptTable)\n    --insert code here\n    \nend\n\n\n",
						["url"] = "",
						["NpcNames"] = {
						},
						["Temp_ConstructorCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    --settings\n    envTable.NameplateSizeOffset = scriptTable.config.castBarHeight\n    envTable.ShowArrow = scriptTable.config.showArrow\n    envTable.ArrowAlpha = scriptTable.config.arrowAlpha\n    envTable.HealthBarColor = scriptTable.config.healthBarColor\n    \n    --creates the spark to show the cast progress inside the health bar\n    envTable.overlaySpark = envTable.overlaySpark or Plater:CreateImage (unitFrame.healthBar)\n    envTable.overlaySpark:SetBlendMode (\"ADD\")\n    envTable.overlaySpark.width = 16\n    envTable.overlaySpark.height = 36\n    envTable.overlaySpark.alpha = .9\n    envTable.overlaySpark.texture = [[Interface\\AddOns\\Plater\\images\\spark3]]\n    \n    envTable.topArrow = envTable.topArrow or Plater:CreateImage (unitFrame.healthBar)\n    envTable.topArrow:SetBlendMode (\"ADD\")\n    envTable.topArrow.width = scriptTable.config.arrowWidth\n    envTable.topArrow.height = scriptTable.config.arrowHeight\n    envTable.topArrow.alpha = envTable.ArrowAlpha\n    envTable.topArrow.texture = [[Interface\\BUTTONS\\Arrow-Down-Up]]\n    \n    --scale animation\n    envTable.smallScaleAnimation = envTable.smallScaleAnimation or Plater:CreateAnimationHub (unitFrame.healthBar)\n    Plater:CreateAnimation (envTable.smallScaleAnimation, \"SCALE\", 1, 0.075, 1, 1, 1.08, 1.08)\n    Plater:CreateAnimation (envTable.smallScaleAnimation, \"SCALE\", 2, 0.075, 1, 1, 0.95, 0.95)    \n    --envTable.smallScaleAnimation:Play() --envTable.smallScaleAnimation:Stop()\n    \nend\n\n\n\n\n\n\n\n",
						["Temp_OnHideCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    Plater.StopDotAnimation(unitFrame.healthBar, envTable.dotAnimation)\n    \n    envTable.overlaySpark:Hide()\n    envTable.topArrow:Hide()\n    \n    Plater.RefreshNameplateColor (unitFrame)\n    \n    envTable.smallScaleAnimation:Stop()\n    \n    --increase the nameplate size\n    local nameplateHeight = Plater.db.profile.plate_config.enemynpc.health_incombat [2]\n    unitFrame.healthBar:SetHeight (nameplateHeight)\nend\n\n\n",
						["Revision"] = 464,
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
								["Name"] = "Cast Bar Height Mod",
								["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
								["Fraction"] = false,
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
								["Name"] = "Arrow Alpha",
								["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
								["Fraction"] = true,
							}, -- [9]
							{
								["Type"] = 2,
								["Max"] = 12,
								["Desc"] = "Arrow Width.",
								["Min"] = 4,
								["Fraction"] = false,
								["Value"] = 8,
								["Key"] = "arrowWidth",
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
								["Name"] = "Arrow Height",
								["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
								["Fraction"] = false,
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
								["Fraction"] = false,
								["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
								["Name"] = "Dot X Offset",
							}, -- [15]
							{
								["Type"] = 2,
								["Max"] = 10,
								["Desc"] = "Dot Y Offset",
								["Min"] = -10,
								["Fraction"] = false,
								["Value"] = 3,
								["Name"] = "Dot Y Offset",
								["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
								["Key"] = "yOffset",
							}, -- [16]
						},
						["Icon"] = 2175503,
						["Enabled"] = true,
						["Author"] = "Bombad�o-Azralon",
						["Initialization"] = "function (scriptTable)\n    --insert code here\n    \nend\n\n\n",
						["Desc"] = "Apply several animations when the explosion orb cast starts on a Mythic Dungeon with Explosion Affix",
						["version"] = -1,
						["Prio"] = 99,
						["Name"] = "Explosion Affix M+ [Plater]",
						["PlaterCore"] = 1,
						["Temp_UpdateCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    --update the percent\n    envTable.overlaySpark:SetPoint (\"left\", unitFrame.healthBar:GetWidth() * (envTable._CastPercent / 100)-9, 0)\n    \n    envTable.topArrow:SetPoint (\"bottomleft\", unitFrame.healthBar, \"topleft\", unitFrame.healthBar:GetWidth() * (envTable._CastPercent / 100) - 4, 2 )\n    \n    --forces the script to update on a 60Hz base\n    self.ThrottleUpdate = 0\n    \n\nend\n\n\n",
						["semver"] = "",
						["OnShowCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    envTable.overlaySpark:Show()\n    \n    if (envTable.ShowArrow) then\n        envTable.topArrow:Show()\n    end\n    \n    Plater.FlashNameplateBorder (unitFrame, 0.05)   \n    Plater.FlashNameplateBody (unitFrame, \"\", 0.075)\n    \n    envTable.smallScaleAnimation:Play()\n    \n    --increase the nameplate size\n    local nameplateHeight = Plater.db.profile.plate_config.enemynpc.health_incombat [2]\n    unitFrame.healthBar:SetHeight (nameplateHeight + envTable.NameplateSizeOffset)\n    \n    envTable.overlaySpark.height = nameplateHeight + 5\n    \n    envTable.dotAnimation = Plater.PlayDotAnimation(unitFrame.healthBar, 2, scriptTable.config.dotColor, scriptTable.config.xOffset, scriptTable.config.yOffset)\n    \n    self:SetStatusBarColor (Plater:ParseColors (scriptTable.config.castBarColor))\nend\n\n\n\n\n\n\n",
						["SpellIds"] = {
							240446, -- [1]
						},
					}, -- [4]
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
						["OnShowCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    if (scriptTable.config.glowEnabled) then\n        envTable.buffIconGlow:Show()\n    end\n    \n    if (scriptTable.config.dotsEnabled) then\n        envTable.dotAnimation = Plater.PlayDotAnimation(self, 6, scriptTable.config.dotsColor, 6, 3) \n    end\nend\n\n\n",
						["SpellIds"] = {
							337220, -- [1]
							337253, -- [2]
							337251, -- [3]
						},
						["PlaterCore"] = 1,
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
						["version"] = -1,
						["Name"] = "Aura - Debuff Alert [Plater]",
						["NpcNames"] = {
						},
					}, -- [5]
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
						["OnShowCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    envTable.overlaySpark:Show()\n    \n    if (envTable.ShowArrow) then\n        envTable.topArrow:Show()\n    end\n    \n    Plater.FlashNameplateBorder (unitFrame, 0.05)   \n    Plater.FlashNameplateBody (unitFrame, \"\", 0.075)\n    \n    envTable.smallScaleAnimation:Play()\n    \n    --increase the nameplate size\n    local nameplateHeight = Plater.db.profile.plate_config.enemynpc.health_incombat [2]\n    unitFrame.healthBar:SetHeight (nameplateHeight + envTable.NameplateSizeOffset)\n    \n    envTable.overlaySpark.height = nameplateHeight + 5\n    \n    envTable.dotAnimation = Plater.PlayDotAnimation(unitFrame.healthBar, 2, scriptTable.config.dotColor, scriptTable.config.xOffset, scriptTable.config.yOffset)\n    \n    \nend",
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
								["Key"] = "castBarHeight",
								["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
								["Fraction"] = false,
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
								["Key"] = "arrowAlpha",
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
								["Fraction"] = false,
								["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
								["Name"] = "Arrow Width",
							}, -- [10]
							{
								["Type"] = 2,
								["Max"] = 12,
								["Desc"] = "Arrow Height.",
								["Min"] = 4,
								["Name"] = "Arrow Height",
								["Value"] = 8,
								["Key"] = "arrowHeight",
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
								["Key"] = "xOffset",
								["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
								["Name"] = "Dot X Offset",
							}, -- [15]
							{
								["Type"] = 2,
								["Max"] = 10,
								["Desc"] = "Dot Y Offset",
								["Min"] = -10,
								["Name"] = "Dot Y Offset",
								["Value"] = 3,
								["Fraction"] = false,
								["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
								["Key"] = "yOffset",
							}, -- [16]
						},
						["version"] = -1,
						["Name"] = "Cast - Ultra Important [P]",
						["NpcNames"] = {
						},
					}, -- [6]
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
						["OnShowCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    --don't execute on battlegrounds and arenas\n    if (Plater.ZoneInstanceType == \"arena\" or Plater.ZoneInstanceType == \"pvp\" or Plater.ZoneInstanceType == \"none\") then\n        return\n    end\n    \n    --play flash animations\n    envTable.FullBarFlash:Play()\n    \n    --envTable.currentHeight = unitFrame.castBar:GetHeight()\n    \n    --restoring the default size (not required since it already restore in the hide script)\n    if (envTable.OriginalHeight) then\n        self:SetHeight (envTable.OriginalHeight)\n    end\n    \n    --increase the cast bar size\n    local height = self:GetHeight()\n    envTable.OriginalHeight = height\n    \n    self:SetHeight (height + envTable.CastBarHeightAdd)\n    \n    Plater.SetCastBarBorderColor (self, 1, .2, .2, 0.4)\n    \n    unitFrame:PlayFrameShake (envTable.FrameShake)\n    \n    --set the color of the cast bar to dark orange (only if can be interrupted)\n    --Plater auto set this color to default when a new cast starts, no need to reset this value at OnHide.    \n    if (envTable._CanInterrupt) then\n        if (scriptTable.config.useCastbarColor) then\n            self:SetStatusBarColor (Plater:ParseColors (envTable.CastbarColor))\n        end\n    end\n    \n    envTable.BackgroundFlash:Play()\n    \n    unitFrame.castBar.Spark:SetHeight(unitFrame.castBar:GetHeight())\n    \nend\n\n\n\n\n\n\n\n\n",
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
								["Key"] = "flashDuration",
								["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
								["Fraction"] = true,
							}, -- [8]
							{
								["Type"] = 2,
								["Max"] = 10,
								["Desc"] = "Increases the cast bar height by this value",
								["Min"] = 0,
								["Name"] = "Cast Bar Height Mod",
								["Value"] = 5,
								["Key"] = "castBarHeight",
								["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
								["Fraction"] = false,
							}, -- [9]
							{
								["Type"] = 2,
								["Max"] = 1,
								["Desc"] = "When the cast starts, there's a small shake in the nameplate, this settings controls how long it takes.",
								["Min"] = 0.1,
								["Name"] = "Shake Duration",
								["Value"] = 0.2,
								["Key"] = "shakeDuration",
								["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
								["Fraction"] = true,
							}, -- [10]
							{
								["Type"] = 2,
								["Max"] = 100,
								["Desc"] = "How strong is the shake.",
								["Min"] = 2,
								["Fraction"] = false,
								["Value"] = 8,
								["Key"] = "shakeAmplitude",
								["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
								["Name"] = "Shake Amplitude",
							}, -- [11]
							{
								["Type"] = 2,
								["Max"] = 80,
								["Desc"] = "How fast the shake moves.",
								["Min"] = 1,
								["Fraction"] = false,
								["Value"] = 40,
								["Key"] = "shakeFrequency",
								["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
								["Name"] = "Shake Frequency",
							}, -- [12]
						},
						["version"] = -1,
						["Name"] = "Cast - Big Alert [Plater]",
						["NpcNames"] = {
						},
					}, -- [7]
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
						["OnShowCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    envTable.SmallFlashAnimationHub:Play()\n    \nend\n\n\n",
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
								["Name"] = "Flash Duration",
								["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
								["Fraction"] = true,
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
						["version"] = -1,
						["Name"] = "Cast - Small Alert [Plater]",
						["NpcNames"] = {
						},
					}, -- [8]
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
						["OnShowCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    Plater.StopDotAnimation(unitFrame.healthBar, unitFrame.healthBar.MainTargetDotAnimation)\n    \n    unitFrame.healthBar.MainTargetDotAnimation = Plater.PlayDotAnimation(unitFrame.healthBar, 2, scriptTable.config.dotsColor, 3, 4) \n    \n    --increase the nameplate size\n    local nameplateHeight = Plater.db.profile.plate_config.enemynpc.health_incombat [2]\n    unitFrame.healthBar:SetHeight (nameplateHeight + scriptTable.config.nameplateSizeOffset)\n    \nend\n\n\n\n\n\n\n\n",
						["SpellIds"] = {
						},
						["PlaterCore"] = 1,
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
								["Fraction"] = false,
								["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
								["Key"] = "nameplateSizeOffset",
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
						["version"] = -1,
						["Name"] = "Unit - Main Target [P]",
						["NpcNames"] = {
							"156212", -- [1]
							"168098", -- [2]
						},
					}, -- [9]
					{
						["ConstructorCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    --settings (require a /reload after editing any setting)\n    do\n        --blink and glow\n        envTable.BlinkEnabled = scriptTable.config.blinkEnabled\n        envTable.GlowEnabled = scriptTable.config.glowEnabled \n        envTable.ChangeNameplateColor = scriptTable.config.changeNameplateColor;\n        envTable.TimeLeftToBlink = scriptTable.config.timeleftToBlink;\n        envTable.BlinkSpeed = scriptTable.config.blinkSpeed; \n        envTable.BlinkColor = scriptTable.config.blinkColor; \n        envTable.BlinkMaxAlpha = scriptTable.config.blinkMaxAlpha; \n        envTable.NameplateColor = scriptTable.config.nameplateColor; \n        \n        --text color\n        envTable.TimerColorEnabled = scriptTable.config.timerColorEnabled \n        envTable.TimeLeftWarning = scriptTable.config.timeLeftWarning;\n        envTable.TimeLeftCritical = scriptTable.config.timeLeftCritical;\n        envTable.TextColor_Warning = scriptTable.config.warningColor; \n        envTable.TextColor_Critical = scriptTable.config.criticalColor; \n        \n        --list of spellIDs to ignore\n        envTable.IgnoredSpellID = {\n            [12] = true, --use a simple comma here\n            [13] = true,\n        }\n    end\n    \n    \n    --private\n    do\n        --if not envTable.blinkTexture then\n        envTable.blinkTexture = Plater:CreateImage (self, \"\", 1, 1, \"overlay\")\n        envTable.blinkTexture:SetPoint ('center', 0, 0)\n        envTable.blinkTexture:Hide()\n        \n        local onPlay = function()\n            envTable.blinkTexture:Show() \n            envTable.blinkTexture.color = envTable.BlinkColor\n        end\n        local onStop = function()\n            envTable.blinkTexture:Hide()  \n        end\n        envTable.blinkAnimation = Plater:CreateAnimationHub (envTable.blinkTexture, onPlay, onStop)\n        Plater:CreateAnimation (envTable.blinkAnimation, \"ALPHA\", 1, envTable.BlinkSpeed / 2, 0, envTable.BlinkMaxAlpha)\n        Plater:CreateAnimation (envTable.blinkAnimation, \"ALPHA\", 2, envTable.BlinkSpeed / 2, envTable.BlinkMaxAlpha, 0)\n        --end\n        \n        envTable.glowEffect = envTable.glowEffect or self.overlay or Plater.CreateIconGlow (self)\n        --envTable.glowEffect = envTable.glowEffect or Plater.CreateIconGlow (self)\n        --envTable.glowEffect:Show() --envTable.glowEffect:Hide()\n        \n    end\n    \nend\n\n\n\n\n",
						["OnHideCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    envTable.blinkAnimation:Stop()\n    envTable.blinkTexture:Hide()\n    envTable.blinkAnimation:Stop()\n    envTable.glowEffect:Stop()\n    Plater:SetFontColor (self.Cooldown.Timer, Plater.db.profile.aura_timer_text_color)\nend\n\n\n",
						["OptionsValues"] = {
						},
						["Temp_OnShowCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    envTable.blinkTexture:SetSize (self:GetSize())\n    \nend\n\n\n",
						["ScriptType"] = 1,
						["Temp_Initialization"] = "function (scriptTable)\n    --insert code here\n    \nend\n\n\n",
						["Time"] = 1616002243,
						["UpdateCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    local timeLeft = envTable._RemainingTime\n    \n    --check if the spellID isn't being ignored\n    if (envTable.IgnoredSpellID [envTable._SpellID]) then\n        return\n    end\n    \n    --check the time left and start or stop the blink animation and also check if the time left is > zero\n    if ((envTable.BlinkEnabled or envTable.GlowEnabled) and timeLeft > 0) then\n        if (timeLeft < envTable.TimeLeftToBlink) then\n            --blink effect\n            if (envTable.BlinkEnabled) then\n                if (not envTable.blinkAnimation:IsPlaying()) then\n                    envTable.blinkAnimation:Play()\n                end\n            end\n            --glow effect\n            if (envTable.GlowEnabled) then\n                envTable.glowEffect:Show()\n            end\n            --nameplate color\n            if (envTable.ChangeNameplateColor) then\n                Plater.SetNameplateColor (unitFrame, envTable.NameplateColor)\n            end\n        else\n            --blink effect\n            if (envTable.blinkAnimation:IsPlaying()) then\n                envTable.blinkAnimation:Stop()\n            end\n            --glow effect\n            if (envTable.GlowEnabled and envTable.glowEffect:IsShown()) then\n                envTable.glowEffect:Hide()\n            end\n        end\n    end\n    \n    --timer color\n    if (envTable.TimerColorEnabled and timeLeft > 0) then\n        if (timeLeft < envTable.TimeLeftCritical) then\n            Plater:SetFontColor (self.Cooldown.Timer, envTable.TextColor_Critical)\n        elseif (timeLeft < envTable.TimeLeftWarning) then\n            Plater:SetFontColor (self.Cooldown.Timer, envTable.TextColor_Warning)        \n        else\n            Plater:SetFontColor (self.Cooldown.Timer, Plater.db.profile.aura_timer_text_color)\n        end\n    end\n    \nend",
						["Temp_ConstructorCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    --settings (require a /reload after editing any setting)\n    do\n        --blink and glow\n        envTable.BlinkEnabled = scriptTable.config.blinkEnabled\n        envTable.GlowEnabled = scriptTable.config.glowEnabled \n        envTable.ChangeNameplateColor = scriptTable.config.changeNameplateColor;\n        envTable.TimeLeftToBlink = scriptTable.config.timeleftToBlink;\n        envTable.BlinkSpeed = scriptTable.config.blinkSpeed; \n        envTable.BlinkColor = scriptTable.config.blinkColor; \n        envTable.BlinkMaxAlpha = scriptTable.config.blinkMaxAlpha; \n        envTable.NameplateColor = scriptTable.config.nameplateColor; \n        \n        --text color\n        envTable.TimerColorEnabled = scriptTable.config.timerColorEnabled \n        envTable.TimeLeftWarning = scriptTable.config.timeLeftWarning;\n        envTable.TimeLeftCritical = scriptTable.config.timeLeftCritical;\n        envTable.TextColor_Warning = scriptTable.config.warningColor; \n        envTable.TextColor_Critical = scriptTable.config.criticalColor; \n        \n        --list of spellIDs to ignore\n        envTable.IgnoredSpellID = {\n            [12] = true, --use a simple comma here\n            [13] = true,\n        }\n    end\n    \n    \n    --private\n    do\n        --if not envTable.blinkTexture then\n        envTable.blinkTexture = Plater:CreateImage (self, \"\", 1, 1, \"overlay\")\n        envTable.blinkTexture:SetPoint ('center', 0, 0)\n        envTable.blinkTexture:Hide()\n        \n        local onPlay = function()\n            envTable.blinkTexture:Show() \n            envTable.blinkTexture.color = envTable.BlinkColor\n        end\n        local onStop = function()\n            envTable.blinkTexture:Hide()  \n        end\n        envTable.blinkAnimation = Plater:CreateAnimationHub (envTable.blinkTexture, onPlay, onStop)\n        Plater:CreateAnimation (envTable.blinkAnimation, \"ALPHA\", 1, envTable.BlinkSpeed / 2, 0, envTable.BlinkMaxAlpha)\n        Plater:CreateAnimation (envTable.blinkAnimation, \"ALPHA\", 2, envTable.BlinkSpeed / 2, envTable.BlinkMaxAlpha, 0)\n        --end\n        \n        envTable.glowEffect = envTable.glowEffect or self.overlay or Plater.CreateIconGlow (self)\n        --envTable.glowEffect = envTable.glowEffect or Plater.CreateIconGlow (self)\n        --envTable.glowEffect:Show() --envTable.glowEffect:Hide()\n        \n    end\n    \nend\n\n\n\n\n",
						["NpcNames"] = {
						},
						["url"] = "",
						["Temp_OnHideCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    envTable.blinkAnimation:Stop()\n    envTable.blinkTexture:Hide()\n    envTable.blinkAnimation:Stop()\n    envTable.glowEffect:Stop()\n    Plater:SetFontColor (self.Cooldown.Timer, Plater.db.profile.aura_timer_text_color)\nend\n\n\n",
						["Revision"] = 373,
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
								["Key"] = "timeleftToBlink",
								["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
								["Name"] = "Timeleft to Blink",
							}, -- [7]
							{
								["Type"] = 2,
								["Max"] = 3,
								["Desc"] = "time to complete a blink loop",
								["Min"] = 0.5,
								["Fraction"] = true,
								["Value"] = 1,
								["Key"] = "blinkSpeed",
								["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
								["Name"] = "Blink Speed",
							}, -- [8]
							{
								["Type"] = 2,
								["Max"] = 1,
								["Desc"] = "max transparency in the animation loop (1.0 is full opaque)",
								["Min"] = 0.1,
								["Fraction"] = true,
								["Value"] = 0.6,
								["Key"] = "blinkMaxAlpha",
								["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
								["Name"] = "Blink Max Alpha",
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
								["Key"] = "timeLeftWarning",
								["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
								["Fraction"] = true,
							}, -- [14]
							{
								["Type"] = 2,
								["Max"] = 10,
								["Desc"] = "in seconds, affects the color of the text",
								["Min"] = 1,
								["Name"] = "Time Left Critical",
								["Value"] = 3,
								["Key"] = "timeLeftCritical",
								["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
								["Fraction"] = true,
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
						["Icon"] = "Interface\\AddOns\\Plater\\images\\icon_aura_blink",
						["Enabled"] = true,
						["Author"] = "Izimode-Azralon",
						["Initialization"] = "function (scriptTable)\n    --insert code here\n    \nend\n\n\n",
						["Desc"] = "Blink, change the number and nameplate color. Add the debuffs int he trigger box. Set settings on constructor script.",
						["version"] = -1,
						["Prio"] = 99,
						["Name"] = "Aura - Blink by Time Left [Plater]",
						["PlaterCore"] = 1,
						["Temp_UpdateCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    local timeLeft = envTable._RemainingTime\n    \n    --check if the spellID isn't being ignored\n    if (envTable.IgnoredSpellID [envTable._SpellID]) then\n        return\n    end\n    \n    --check the time left and start or stop the blink animation and also check if the time left is > zero\n    if ((envTable.BlinkEnabled or envTable.GlowEnabled) and timeLeft > 0) then\n        if (timeLeft < envTable.TimeLeftToBlink) then\n            --blink effect\n            if (envTable.BlinkEnabled) then\n                if (not envTable.blinkAnimation:IsPlaying()) then\n                    envTable.blinkAnimation:Play()\n                end\n            end\n            --glow effect\n            if (envTable.GlowEnabled) then\n                envTable.glowEffect:Show()\n            end\n            --nameplate color\n            if (envTable.ChangeNameplateColor) then\n                Plater.SetNameplateColor (unitFrame, envTable.NameplateColor)\n            end\n        else\n            --blink effect\n            if (envTable.blinkAnimation:IsPlaying()) then\n                envTable.blinkAnimation:Stop()\n            end\n            --glow effect\n            if (envTable.GlowEnabled and envTable.glowEffect:IsShown()) then\n                envTable.glowEffect:Hide()\n            end\n        end\n    end\n    \n    --timer color\n    if (envTable.TimerColorEnabled and timeLeft > 0) then\n        if (timeLeft < envTable.TimeLeftCritical) then\n            Plater:SetFontColor (self.Cooldown.Timer, envTable.TextColor_Critical)\n        elseif (timeLeft < envTable.TimeLeftWarning) then\n            Plater:SetFontColor (self.Cooldown.Timer, envTable.TextColor_Warning)        \n        else\n            Plater:SetFontColor (self.Cooldown.Timer, Plater.db.profile.aura_timer_text_color)\n        end\n    end\n    \nend",
						["semver"] = "",
						["OnShowCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    envTable.blinkTexture:SetSize (self:GetSize())\n    \nend\n\n\n",
						["SpellIds"] = {
						},
					}, -- [10]
					{
						["ConstructorCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    --insert code here\n    \n    envTable.npcInfo = {\n        [164427] = {secondCastBar = true, timer = 20, timerId = 321247, altCastId = \"1\", name = \"Boom!\"}, --reanimated warrior - plaguefall\n        \n        [164414] = {secondCastBar = true, timer = 20, timerId = 321247, altCastId = \"2\", name = \"Boom!\"}, --reanimated mage - plaguefall\n        \n        [164185] = {secondCastBar = true, timer = 20, timerId = 319941, altCastId = \"3\", remaining = 5, name = GetSpellInfo(319941)}, --Echelon - Halls of Atonement\n        \n        [164567] = {secondCastBar = true, altCastId = \"dromanswrath\", debuffTimer = 323059, name = GetSpellInfo(323059), spellIcon = 323059}, --Ingra Maloch -- tirna scythe\n        \n        [165408] = {secondCastBar = true, timer = 20, timerId = 322711, altCastId = \"4\", remaining = 5, name = GetSpellInfo(322711)}, --Halkias - Refracted Sinlight - Halls of Atonement\n        \n        \n        --[154564] = {secondCastBar = true, timerId = \"Test Bar\", altCastId = \"debugcast\", remaining = 5, name = GetSpellInfo(319941), spellIcon = 319941}, --debug \"Test (1)\" BW \"Test Bar\" DBM --DEBUG\n        --[154580] = {secondCastBar = true, altCastId = \"debugcast\", debuffTimer = 204242, name = GetSpellInfo(81297), spellIcon = 81297}, --debug \"Test (1)\" BW \"Test Bar\" DBM --DEBUG\n    }\n    \n    --set the castbar config\n    local config = {\n        iconTexture = \"\",\n        iconTexcoord = {0.1, 0.9, 0.1, 0.9},\n        iconAlpha = 1,\n        iconSize = 14,\n        \n        text = \"Boom!\",\n        textSize = 9,\n        \n        texture = [[Interface\\AddOns\\Plater\\images\\bar_background]],\n        color = \"silver\",\n        \n        isChanneling = false,\n        canInterrupt = false,\n        \n        height = 2,\n        width = Plater.db.profile.plate_config.enemynpc.health_incombat[1],\n        \n        spellNameAnchor = {side = 3, x = 0, y = -2},\n        timerAnchor = {side = 5, x = 0, y = -2},\n    }    \n    \n    function envTable.ShowAltCastBar(npcInfo, unitFrame, unitId, customTime, customStart)\n        --show the cast bar\n        if (npcInfo.timerId) then\n            local barObject = Plater.GetBossTimer(npcInfo.timerId)\n            if (barObject) then\n                if (npcInfo.remaining) then\n                    local timeLeft = barObject.timer + barObject.start - GetTime()\n                    if (timeLeft > npcInfo.remaining) then\n                        return\n                    end\n                end\n                \n                config.text = npcInfo.name\n                \n                if (npcInfo.spellIcon) then\n                    local _, _, iconTexture = GetSpellInfo(npcInfo.spellIcon)\n                    config.iconTexture = iconTexture\n                else\n                    config.iconTexture = \"\"\n                end\n                \n                Plater.SetAltCastBar(unitFrame.PlateFrame, config, barObject.timer, customStart or barObject.start, npcInfo.altCastId)\n            end\n        else\n            Plater.SetAltCastBar(unitFrame.PlateFrame, config, customTime or npcInfo.timer, customStart, npcInfo.altCastId)            \n        end\n        \n        DetailsFramework:TruncateText(unitFrame.castBar2.Text, unitFrame.castBar2:GetWidth() - 16)\n    end\nend",
						["OnHideCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    --insert code here\n    Plater.ClearAltCastBar(unitFrame.PlateFrame)\nend",
						["OptionsValues"] = {
						},
						["Temp_OnShowCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    local npcInfo = envTable.npcInfo[envTable._NpcID]\n    \n    if (npcInfo and npcInfo.secondCastBar) then\n        if (npcInfo.debuffTimer) then\n            if (Plater.NameplateHasAura (unitFrame, npcInfo.debuffTimer)) then\n                \n                local name = npcInfo.name\n                local _, _, _, _, duration, expirationTime = AuraUtil.FindAuraByName(name, unitId, \"DEBUFF\")\n                \n                envTable.ShowAltCastBar(npcInfo, unitFrame, unitId, duration, expirationTime-duration)\n            else\n                if (unitFrame.castBar2:IsShown()) then\n                    local altCastId = Plater.GetAltCastBarAltId(unitFrame.PlateFrame)\n                    if (altCastId == npcInfo.altCastId) then\n                        Plater.ClearAltCastBar(unitFrame.PlateFrame)\n                    end                   \n                end                              \n            end\n        else\n            envTable.ShowAltCastBar(npcInfo, unitFrame, unitId)\n        end\n    end\nend\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n",
						["ScriptType"] = 3,
						["UpdateCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    local npcInfo = envTable.npcInfo[envTable._NpcID]\n    \n    if (npcInfo and npcInfo.secondCastBar) then\n        if (npcInfo.timerId) then\n            local barObject = Plater.GetBossTimer(npcInfo.timerId)\n            if (barObject) then\n                local altCastId = Plater.GetAltCastBarAltId(unitFrame.PlateFrame)\n                if (altCastId ~= npcInfo.altCastId or not unitFrame.castBar2:IsShown()) then\n                    envTable.ShowAltCastBar(npcInfo, unitFrame, unitId)\n                end\n            end \n            \n        elseif (npcInfo.debuffTimer) then\n            if (Plater.NameplateHasAura (unitFrame, npcInfo.debuffTimer)) then\n                \n                --get the debuff timeleft\n                local name = npcInfo.name\n                local _, _, _, _, duration, expirationTime = AuraUtil.FindAuraByName(name, unitId, \"DEBUFF\")\n                local startTime = expirationTime - duration\n                \n                if (not unitFrame.castBar2:IsShown() or unitFrame.castBar2.spellStartTime < startTime) then\n                    envTable.ShowAltCastBar(npcInfo, unitFrame, unitId, duration, startTime)\n                end\n                \n            else \n                if (unitFrame.castBar2:IsShown()) then\n                    local altCastId = Plater.GetAltCastBarAltId(unitFrame.PlateFrame)\n                    if (altCastId == npcInfo.altCastId) then\n                        Plater.ClearAltCastBar(unitFrame.PlateFrame)\n                    end                   \n                end                              \n            end\n        end\n    end\nend\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n",
						["Time"] = 1616002303,
						["Temp_Initialization"] = "function (scriptTable)\n    --insert code here\n    \nend\n\n\n",
						["url"] = "",
						["NpcNames"] = {
							"164427", -- [1]
							"164414", -- [2]
							"164185", -- [3]
							"164567", -- [4]
							"165408", -- [5]
						},
						["Temp_ConstructorCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    --insert code here\n    \n    envTable.npcInfo = {\n        [164427] = {secondCastBar = true, timer = 20, timerId = 321247, altCastId = \"1\", name = \"Boom!\"}, --reanimated warrior - plaguefall\n        \n        [164414] = {secondCastBar = true, timer = 20, timerId = 321247, altCastId = \"2\", name = \"Boom!\"}, --reanimated mage - plaguefall\n        \n        [164185] = {secondCastBar = true, timer = 20, timerId = 319941, altCastId = \"3\", remaining = 5, name = GetSpellInfo(319941)}, --Echelon - Halls of Atonement\n        \n        [164567] = {secondCastBar = true, altCastId = \"dromanswrath\", debuffTimer = 323059, name = GetSpellInfo(323059), spellIcon = 323059}, --Ingra Maloch -- tirna scythe\n        \n        [165408] = {secondCastBar = true, timer = 20, timerId = 322711, altCastId = \"4\", remaining = 5, name = GetSpellInfo(322711)}, --Halkias - Refracted Sinlight - Halls of Atonement\n        \n        \n        --[154564] = {secondCastBar = true, timerId = \"Test Bar\", altCastId = \"debugcast\", remaining = 5, name = GetSpellInfo(319941), spellIcon = 319941}, --debug \"Test (1)\" BW \"Test Bar\" DBM --DEBUG\n        --[154580] = {secondCastBar = true, altCastId = \"debugcast\", debuffTimer = 204242, name = GetSpellInfo(81297), spellIcon = 81297}, --debug \"Test (1)\" BW \"Test Bar\" DBM --DEBUG\n    }\n    \n    --set the castbar config\n    local config = {\n        iconTexture = \"\",\n        iconTexcoord = {0.1, 0.9, 0.1, 0.9},\n        iconAlpha = 1,\n        iconSize = 14,\n        \n        text = \"Boom!\",\n        textSize = 9,\n        \n        texture = [[Interface\\AddOns\\Plater\\images\\bar_background]],\n        color = \"silver\",\n        \n        isChanneling = false,\n        canInterrupt = false,\n        \n        height = 2,\n        width = Plater.db.profile.plate_config.enemynpc.health_incombat[1],\n        \n        spellNameAnchor = {side = 3, x = 0, y = -2},\n        timerAnchor = {side = 5, x = 0, y = -2},\n    }    \n    \n    function envTable.ShowAltCastBar(npcInfo, unitFrame, unitId, customTime, customStart)\n        --show the cast bar\n        if (npcInfo.timerId) then\n            local barObject = Plater.GetBossTimer(npcInfo.timerId)\n            if (barObject) then\n                if (npcInfo.remaining) then\n                    local timeLeft = barObject.timer + barObject.start - GetTime()\n                    if (timeLeft > npcInfo.remaining) then\n                        return\n                    end\n                end\n                \n                config.text = npcInfo.name\n                \n                if (npcInfo.spellIcon) then\n                    local _, _, iconTexture = GetSpellInfo(npcInfo.spellIcon)\n                    config.iconTexture = iconTexture\n                else\n                    config.iconTexture = \"\"\n                end\n                \n                Plater.SetAltCastBar(unitFrame.PlateFrame, config, barObject.timer, customStart or barObject.start, npcInfo.altCastId)\n            end\n        else\n            Plater.SetAltCastBar(unitFrame.PlateFrame, config, customTime or npcInfo.timer, customStart, npcInfo.altCastId)            \n        end\n        \n        DetailsFramework:TruncateText(unitFrame.castBar2.Text, unitFrame.castBar2:GetWidth() - 16)\n    end\nend",
						["Temp_OnHideCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    --insert code here\n    Plater.ClearAltCastBar(unitFrame.PlateFrame)\nend",
						["Revision"] = 209,
						["Options"] = {
						},
						["Icon"] = "Interface\\AddOns\\Plater\\Images\\countdown_bar_icon",
						["Enabled"] = true,
						["Author"] = "Aelerolor-Torghast",
						["Initialization"] = "function (scriptTable)\n    --insert code here\n    \nend\n\n\n",
						["Desc"] = "Some units has special events without a clear way to show. This script adds a second cast bar to inform the user about it.",
						["version"] = -1,
						["Prio"] = 99,
						["Name"] = "Countdown",
						["PlaterCore"] = 1,
						["Temp_UpdateCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    local npcInfo = envTable.npcInfo[envTable._NpcID]\n    \n    if (npcInfo and npcInfo.secondCastBar) then\n        if (npcInfo.timerId) then\n            local barObject = Plater.GetBossTimer(npcInfo.timerId)\n            if (barObject) then\n                local altCastId = Plater.GetAltCastBarAltId(unitFrame.PlateFrame)\n                if (altCastId ~= npcInfo.altCastId or not unitFrame.castBar2:IsShown()) then\n                    envTable.ShowAltCastBar(npcInfo, unitFrame, unitId)\n                end\n            end \n            \n        elseif (npcInfo.debuffTimer) then\n            if (Plater.NameplateHasAura (unitFrame, npcInfo.debuffTimer)) then\n                \n                --get the debuff timeleft\n                local name = npcInfo.name\n                local _, _, _, _, duration, expirationTime = AuraUtil.FindAuraByName(name, unitId, \"DEBUFF\")\n                local startTime = expirationTime - duration\n                \n                if (not unitFrame.castBar2:IsShown() or unitFrame.castBar2.spellStartTime < startTime) then\n                    envTable.ShowAltCastBar(npcInfo, unitFrame, unitId, duration, startTime)\n                end\n                \n            else \n                if (unitFrame.castBar2:IsShown()) then\n                    local altCastId = Plater.GetAltCastBarAltId(unitFrame.PlateFrame)\n                    if (altCastId == npcInfo.altCastId) then\n                        Plater.ClearAltCastBar(unitFrame.PlateFrame)\n                    end                   \n                end                              \n            end\n        end\n    end\nend\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n",
						["semver"] = "",
						["OnShowCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    local npcInfo = envTable.npcInfo[envTable._NpcID]\n    \n    if (npcInfo and npcInfo.secondCastBar) then\n        if (npcInfo.debuffTimer) then\n            if (Plater.NameplateHasAura (unitFrame, npcInfo.debuffTimer)) then\n                \n                local name = npcInfo.name\n                local _, _, _, _, duration, expirationTime = AuraUtil.FindAuraByName(name, unitId, \"DEBUFF\")\n                \n                envTable.ShowAltCastBar(npcInfo, unitFrame, unitId, duration, expirationTime-duration)\n            else\n                if (unitFrame.castBar2:IsShown()) then\n                    local altCastId = Plater.GetAltCastBarAltId(unitFrame.PlateFrame)\n                    if (altCastId == npcInfo.altCastId) then\n                        Plater.ClearAltCastBar(unitFrame.PlateFrame)\n                    end                   \n                end                              \n            end\n        else\n            envTable.ShowAltCastBar(npcInfo, unitFrame, unitId)\n        end\n    end\nend\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n",
						["SpellIds"] = {
						},
					}, -- [11]
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
						["OnShowCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    --insert code here\n    envTable.UpdateMarkers(unitFrame)\nend\n\n\n",
						["SpellIds"] = {
						},
						["PlaterCore"] = 1,
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
								["Key"] = "indicatorAlpha",
								["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
								["Fraction"] = true,
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
								["Name"] = "Fill Alpha",
								["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
								["Key"] = "fillAlpha",
							}, -- [7]
						},
						["version"] = -1,
						["Name"] = "Unit - Health Markers [P]",
						["NpcNames"] = {
							"164451", -- [1]
							"164463", -- [2]
							"164461", -- [3]
							"165946", -- [4]
							"164501", -- [5]
							"164218", -- [6]
						},
					}, -- [12]
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
						["OnShowCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    envTable.movingAnimation:Play()\nend\n\n\n",
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
								["Fraction"] = true,
								["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
								["Name"] = "Arrow Alpha",
							}, -- [5]
							{
								["Type"] = 2,
								["Max"] = 1,
								["Desc"] = "Time that takes for an arrow to travel from the to right.",
								["Min"] = 0,
								["Key"] = "animSpeed",
								["Value"] = 0.2,
								["Fraction"] = true,
								["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
								["Name"] = "Animation Speed",
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
						["version"] = -1,
						["Name"] = "Cast - Frontal Cone [Plater]",
						["NpcNames"] = {
						},
					}, -- [13]
					{
						["ConstructorCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.FixateTarget = Plater:CreateLabel (unitFrame);\n    envTable.FixateTarget:SetPoint (\"bottom\", unitFrame.BuffFrame, \"top\", 0, 10);    \n    \n    envTable.FixateIcon = Plater:CreateImage (unitFrame, 236188, 16, 16, \"overlay\");\n    envTable.FixateIcon:SetPoint (\"bottom\", envTable.FixateTarget, \"top\", 0, 4);    \n    \n    envTable.FixateTarget:Hide()\n    envTable.FixateIcon:Hide()\nend\n\n--165560 = Gormling Larva - MTS\n\n\n\n\n\n\n",
						["OnHideCode"] = "function (self, unitId, unitFrame, envTable)\n    envTable.FixateTarget:Hide()\n    envTable.FixateIcon:Hide()\nend\n\n\n",
						["OptionsValues"] = {
						},
						["Temp_OnShowCode"] = "function (self, unitId, unitFrame, envTable)\n    \nend\n\n\n",
						["ScriptType"] = 3,
						["UpdateCode"] = "function (self, unitId, unitFrame, envTable)\n    local targetName = UnitName (unitId .. \"target\");\n    if (targetName) then\n        local _, class = UnitClass (unitId .. \"target\");\n        targetName = Plater.SetTextColorByClass (unitId .. \"target\", targetName);\n        envTable.FixateTarget.text = targetName;\n        \n        envTable.FixateTarget:Show();\n        envTable.FixateIcon:Show();\n    end    \nend\n\n\n",
						["Time"] = 1614271001,
						["Temp_Initialization"] = "function (scriptTable)\n    --insert code here\n    \nend\n\n\n\n\n\n\n",
						["url"] = "",
						["Icon"] = 1029718,
						["Temp_ConstructorCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.FixateTarget = Plater:CreateLabel (unitFrame);\n    envTable.FixateTarget:SetPoint (\"bottom\", unitFrame.BuffFrame, \"top\", 0, 10);    \n    \n    envTable.FixateIcon = Plater:CreateImage (unitFrame, 236188, 16, 16, \"overlay\");\n    envTable.FixateIcon:SetPoint (\"bottom\", envTable.FixateTarget, \"top\", 0, 4);    \n    \n    envTable.FixateTarget:Hide()\n    envTable.FixateIcon:Hide()\nend\n\n--165560 = Gormling Larva - MTS\n\n\n\n\n\n\n",
						["Temp_OnHideCode"] = "function (self, unitId, unitFrame, envTable)\n    envTable.FixateTarget:Hide()\n    envTable.FixateIcon:Hide()\nend\n\n\n",
						["Revision"] = 270,
						["semver"] = "",
						["NpcNames"] = {
							"165560", -- [1]
						},
						["Enabled"] = true,
						["Author"] = "Celian-Sylvanas",
						["Initialization"] = "function (scriptTable)\n    --insert code here\n    \nend\n\n\n\n\n\n\n",
						["Desc"] = "Show above the nameplate who is the player fixated",
						["version"] = -1,
						["Temp_UpdateCode"] = "function (self, unitId, unitFrame, envTable)\n    local targetName = UnitName (unitId .. \"target\");\n    if (targetName) then\n        local _, class = UnitClass (unitId .. \"target\");\n        targetName = Plater.SetTextColorByClass (unitId .. \"target\", targetName);\n        envTable.FixateTarget.text = targetName;\n        \n        envTable.FixateTarget:Show();\n        envTable.FixateIcon:Show();\n    end    \nend\n\n\n",
						["SpellIds"] = {
						},
						["PlaterCore"] = 1,
						["Prio"] = 99,
						["Options"] = {
						},
						["OnShowCode"] = "function (self, unitId, unitFrame, envTable)\n    \nend\n\n\n",
						["Name"] = "Fixate [Plater]",
					}, -- [14]
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
						["OnShowCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    if (not Plater.IsPlayerTank()) then\n        return\n    end\n    \n    --don't execute on battlegrounds and arenas\n    if (Plater.ZoneInstanceType == \"arena\" or Plater.ZoneInstanceType == \"pvp\") then\n        return\n    end\n    \n    --play flash animations\n    envTable.FullBarFlash:Play()\n    \n    --envTable.currentHeight = unitFrame.castBar:GetHeight()\n    \n    --restoring the default size (not required since it already restore in the hide script)\n    if (envTable.OriginalHeight) then\n        self:SetHeight (envTable.OriginalHeight)\n    end\n    \n    --increase the cast bar size\n    local height = self:GetHeight()\n    envTable.OriginalHeight = height\n    \n    self:SetHeight (height + envTable.CastBarHeightAdd)\n    \n    Plater.SetCastBarBorderColor (self, 1, .2, .2, 0.4)\n    \n    unitFrame:PlayFrameShake (envTable.FrameShake)\n    \n    --set the color of the cast bar to dark orange (only if can be interrupted)\n    --Plater auto set this color to default when a new cast starts, no need to reset this value at OnHide.    \n    if (envTable._CanInterrupt) then\n        if (scriptTable.config.useCastbarColor) then\n            self:SetStatusBarColor (Plater:ParseColors (envTable.CastbarColor))\n        end\n    end\n    \n    envTable.BackgroundFlash:Play()\n    \n    unitFrame.castBar.Spark:SetHeight(unitFrame.castBar:GetHeight())\n    \nend\n\n\n\n\n\n\n\n\n",
						["SpellIds"] = {
							321828, -- [1]
						},
						["PlaterCore"] = 1,
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
								["Fraction"] = true,
								["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
								["Name"] = "Flash Duration",
							}, -- [8]
							{
								["Type"] = 2,
								["Max"] = 10,
								["Desc"] = "Increases the cast bar height by this value",
								["Min"] = 0,
								["Key"] = "castBarHeight",
								["Value"] = 0,
								["Fraction"] = false,
								["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
								["Name"] = "Cast Bar Height Mod",
							}, -- [9]
							{
								["Type"] = 2,
								["Max"] = 1,
								["Desc"] = "When the cast starts, there's a small shake in the nameplate, this settings controls how long it takes.",
								["Min"] = 0.1,
								["Key"] = "shakeDuration",
								["Value"] = 0.1,
								["Fraction"] = true,
								["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
								["Name"] = "Shake Duration",
							}, -- [10]
							{
								["Type"] = 2,
								["Max"] = 200,
								["Desc"] = "How strong is the shake.",
								["Min"] = 10,
								["Key"] = "shakeAmplitude",
								["Value"] = 25,
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
								["Value"] = 30,
								["Name"] = "Shake Frequency",
								["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
								["Fraction"] = false,
							}, -- [12]
						},
						["version"] = -1,
						["Name"] = "Cast - Tank Interrupt [P]",
						["NpcNames"] = {
						},
					}, -- [15]
					{
						["ConstructorCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    envTable.EnergyAmount = Plater:CreateLabel (unitFrame, \"\", 16, \"silver\");\n    envTable.EnergyAmount:SetPoint (\"bottom\", unitFrame, \"top\", 0, 18);    \n    \n    envTable.EnergyAmount.fontsize = scriptTable.config.fontSize\n    envTable.EnergyAmount.fontcolor = scriptTable.config.fontColor\n    envTable.EnergyAmount.outline = scriptTable.config.outline\n    \n    \nend\n\n--[=[\n\n164406 = Shriekwing\n164407 = Sludgefist\n162100 = kryxis the voracious\n162099 = general kaal - sanguine depths\n162329 = Xav the Unfallen - threater of pain\n--]=]",
						["OnHideCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    envTable.EnergyAmount:Hide()\nend\n\n\n",
						["OptionsValues"] = {
						},
						["Temp_OnShowCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    envTable.EnergyAmount:Show()\nend\n\n\n",
						["ScriptType"] = 3,
						["UpdateCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    local currentPower = UnitPower(unitId)\n    \n    if (currentPower and currentPower > 0) then\n        local maxPower = UnitPowerMax (unitId)\n        local percent = floor (currentPower / maxPower * 100)\n        \n        envTable.EnergyAmount.text = \"\" .. percent;\n        \n        if (scriptTable.config.showLater) then\n            local alpha = (percent -80) * 5\n            alpha = alpha / 100\n            alpha = max(0, alpha)\n            envTable.EnergyAmount:SetAlpha(alpha)\n            \n        else\n            envTable.EnergyAmount:SetAlpha(1.0)\n        end\n        \n        \n    else\n        envTable.EnergyAmount.text = \"\"\n    end\nend\n\n\n\n\n\n\n\n\n",
						["Time"] = 1616002249,
						["Temp_Initialization"] = "function (scriptTable)\n    --insert code here\n    \nend\n\n\n",
						["url"] = "",
						["NpcNames"] = {
							"164406", -- [1]
							"164407", -- [2]
							"162100", -- [3]
							"162099", -- [4]
							"162329", -- [5]
							"164558", -- [6]
						},
						["Temp_OnHideCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    envTable.EnergyAmount:Hide()\nend\n\n\n",
						["Enabled"] = true,
						["Revision"] = 234,
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
								["Fraction"] = false,
								["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
								["Name"] = "Text Size",
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
						["Temp_ConstructorCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    envTable.EnergyAmount = Plater:CreateLabel (unitFrame, \"\", 16, \"silver\");\n    envTable.EnergyAmount:SetPoint (\"bottom\", unitFrame, \"top\", 0, 18);    \n    \n    envTable.EnergyAmount.fontsize = scriptTable.config.fontSize\n    envTable.EnergyAmount.fontcolor = scriptTable.config.fontColor\n    envTable.EnergyAmount.outline = scriptTable.config.outline\n    \n    \nend\n\n--[=[\n\n164406 = Shriekwing\n164407 = Sludgefist\n162100 = kryxis the voracious\n162099 = general kaal - sanguine depths\n162329 = Xav the Unfallen - threater of pain\n--]=]",
						["OnShowCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    envTable.EnergyAmount:Show()\nend\n\n\n",
						["Author"] = "Celian-Sylvanas",
						["Initialization"] = "function (scriptTable)\n    --insert code here\n    \nend\n\n\n",
						["Desc"] = "Show the energy amount above the nameplate.",
						["Name"] = "Unit - Show Energy [Plater]",
						["Temp_UpdateCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    local currentPower = UnitPower(unitId)\n    \n    if (currentPower and currentPower > 0) then\n        local maxPower = UnitPowerMax (unitId)\n        local percent = floor (currentPower / maxPower * 100)\n        \n        envTable.EnergyAmount.text = \"\" .. percent;\n        \n        if (scriptTable.config.showLater) then\n            local alpha = (percent -80) * 5\n            alpha = alpha / 100\n            alpha = max(0, alpha)\n            envTable.EnergyAmount:SetAlpha(alpha)\n            \n        else\n            envTable.EnergyAmount:SetAlpha(1.0)\n        end\n        \n        \n    else\n        envTable.EnergyAmount.text = \"\"\n    end\nend\n\n\n\n\n\n\n\n\n",
						["version"] = -1,
						["PlaterCore"] = 1,
						["Prio"] = 99,
						["Icon"] = 136048,
						["semver"] = "",
						["SpellIds"] = {
						},
					}, -- [16]
					{
						["ConstructorCode"] = "--todo: add npc ids for multilanguage support\n\nfunction (self, unitId, unitFrame, envTable)\n    \n    --settings\n    envTable.TextAboveNameplate = \"** On You **\"\n    envTable.NameplateColor = \"green\"\n    \n    --label to show the text above the nameplate\n    envTable.FixateTarget = Plater:CreateLabel (unitFrame);\n    envTable.FixateTarget:SetPoint (\"bottom\", unitFrame.healthBar, \"top\", 0, 30);\n    \n    --the spell casted by the npc in the trigger list needs to be in the list below as well\n    local spellList = {\n        [321891] = \"Freeze Tag Fixation\", --Illusionary Vulpin - MTS\n        \n    }\n    \n    --build the list with localized spell names\n    envTable.FixateDebuffs = {}\n    for spellID, enUSSpellName in pairs (spellList) do\n        local localizedSpellName = GetSpellInfo (spellID)\n        envTable.FixateDebuffs [localizedSpellName or enUSSpellName] = true\n    end\n    \n    --debug - smuggled crawg\n    envTable.FixateDebuffs [\"Jagged Maw\"] = true\n    \nend\n\n--[=[\nNpcIDs:\n136461: Spawn of G'huun (mythic uldir G'huun)\n\n--]=]\n\n\n\n\n",
						["OnHideCode"] = "function (self, unitId, unitFrame, envTable)\n    envTable.FixateTarget:SetText (\"\")\n    envTable.FixateTarget:Hide()\n    \n    envTable.IsFixated = false\n    \n    Plater.RefreshNameplateColor (unitFrame)\nend\n\n\n",
						["OptionsValues"] = {
						},
						["Temp_OnShowCode"] = "function (self, unitId, unitFrame, envTable)\n    \nend\n\n\n",
						["ScriptType"] = 3,
						["UpdateCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --swap this to true when it is fixated\n    local isFixated = false\n    \n    --check the debuffs the player has and see if any of these debuffs has been placed by this unit\n    for debuffId = 1, 40 do\n        local name, texture, count, debuffType, duration, expirationTime, caster = UnitDebuff (\"player\", debuffId)\n        \n        --cancel the loop if there's no more debuffs on the player\n        if (not name) then \n            break \n        end\n        \n        --check if the owner of the debuff is this unit\n        if (envTable.FixateDebuffs [name] and caster and UnitIsUnit (caster, unitId)) then\n            --the debuff the player has, has been placed by this unit, set the name above the unit name\n            envTable.FixateTarget:SetText (envTable.TextAboveNameplate)\n            envTable.FixateTarget:Show()\n            Plater.SetNameplateColor (unitFrame,  envTable.NameplateColor)\n            isFixated = true\n            \n            if (not envTable.IsFixated) then\n                envTable.IsFixated = true\n                Plater.FlashNameplateBody (unitFrame, \"fixate\", .2)\n            end\n        end\n        \n    end\n    \n    --check if the nameplate color is changed but isn't fixated any more\n    if (not isFixated and envTable.IsFixated) then\n        --refresh the nameplate color\n        Plater.RefreshNameplateColor (unitFrame)\n        --reset the text\n        envTable.FixateTarget:SetText (\"\")\n        \n        envTable.IsFixated = false\n    end\n    \nend\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n",
						["Time"] = 1614271003,
						["Temp_ConstructorCode"] = "--todo: add npc ids for multilanguage support\n\nfunction (self, unitId, unitFrame, envTable)\n    \n    --settings\n    envTable.TextAboveNameplate = \"** On You **\"\n    envTable.NameplateColor = \"green\"\n    \n    --label to show the text above the nameplate\n    envTable.FixateTarget = Plater:CreateLabel (unitFrame);\n    envTable.FixateTarget:SetPoint (\"bottom\", unitFrame.healthBar, \"top\", 0, 30);\n    \n    --the spell casted by the npc in the trigger list needs to be in the list below as well\n    local spellList = {\n        [321891] = \"Freeze Tag Fixation\", --Illusionary Vulpin - MTS\n        \n    }\n    \n    --build the list with localized spell names\n    envTable.FixateDebuffs = {}\n    for spellID, enUSSpellName in pairs (spellList) do\n        local localizedSpellName = GetSpellInfo (spellID)\n        envTable.FixateDebuffs [localizedSpellName or enUSSpellName] = true\n    end\n    \n    --debug - smuggled crawg\n    envTable.FixateDebuffs [\"Jagged Maw\"] = true\n    \nend\n\n--[=[\nNpcIDs:\n136461: Spawn of G'huun (mythic uldir G'huun)\n\n--]=]\n\n\n\n\n",
						["NpcNames"] = {
						},
						["Enabled"] = true,
						["Revision"] = 267,
						["Options"] = {
						},
						["url"] = "",
						["Icon"] = 841383,
						["Author"] = "Tecno-Azralon",
						["Temp_OnHideCode"] = "function (self, unitId, unitFrame, envTable)\n    envTable.FixateTarget:SetText (\"\")\n    envTable.FixateTarget:Hide()\n    \n    envTable.IsFixated = false\n    \n    Plater.RefreshNameplateColor (unitFrame)\nend\n\n\n",
						["Desc"] = "When an enemy places a debuff and starts to chase you. This script changes the nameplate color and place your name above the nameplate as well.",
						["semver"] = "",
						["Prio"] = 99,
						["version"] = -1,
						["PlaterCore"] = 1,
						["Name"] = "Fixate On You [Plater]",
						["Temp_UpdateCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --swap this to true when it is fixated\n    local isFixated = false\n    \n    --check the debuffs the player has and see if any of these debuffs has been placed by this unit\n    for debuffId = 1, 40 do\n        local name, texture, count, debuffType, duration, expirationTime, caster = UnitDebuff (\"player\", debuffId)\n        \n        --cancel the loop if there's no more debuffs on the player\n        if (not name) then \n            break \n        end\n        \n        --check if the owner of the debuff is this unit\n        if (envTable.FixateDebuffs [name] and caster and UnitIsUnit (caster, unitId)) then\n            --the debuff the player has, has been placed by this unit, set the name above the unit name\n            envTable.FixateTarget:SetText (envTable.TextAboveNameplate)\n            envTable.FixateTarget:Show()\n            Plater.SetNameplateColor (unitFrame,  envTable.NameplateColor)\n            isFixated = true\n            \n            if (not envTable.IsFixated) then\n                envTable.IsFixated = true\n                Plater.FlashNameplateBody (unitFrame, \"fixate\", .2)\n            end\n        end\n        \n    end\n    \n    --check if the nameplate color is changed but isn't fixated any more\n    if (not isFixated and envTable.IsFixated) then\n        --refresh the nameplate color\n        Plater.RefreshNameplateColor (unitFrame)\n        --reset the text\n        envTable.FixateTarget:SetText (\"\")\n        \n        envTable.IsFixated = false\n    end\n    \nend\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n",
						["OnShowCode"] = "function (self, unitId, unitFrame, envTable)\n    \nend\n\n\n",
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
					}, -- [17]
				},
				["indicator_raidmark_scale"] = 0.699999988079071,
				["aura2_y_offset"] = 5,
				["cast_statusbar_color_nointerrupt"] = {
					1, -- [1]
					0, -- [2]
					0.00784313725490196, -- [3]
					0.9600000008940697, -- [4]
				},
				["npc_cache"] = {
					[167898] = {
						"Manifestation of Envy", -- [1]
						"Halls of Atonement", -- [2]
					},
					[127235] = {
						"Garothi Demolisher", -- [1]
						"Antorus, the Burning Throne", -- [2]
					},
					[165469] = {
						"Nathrian Enforcer", -- [1]
						"Castle Nathria", -- [2]
					},
					[164702] = {
						"Carrion Worm", -- [1]
						"The Necrotic Wake", -- [2]
					},
					[173142] = {
						"Dread Feaster", -- [1]
						"Castle Nathria", -- [2]
					},
					[165470] = {
						"Nathrian Executor", -- [1]
						"Castle Nathria", -- [2]
					},
					[168156] = {
						"Remornia", -- [1]
						"Castle Nathria", -- [2]
					},
					[119052] = {
						"War Banner", -- [1]
						"The Battle for Gilneas", -- [2]
					},
					[173655] = {
						"Mistveil Matriarch", -- [1]
						"Mists of Tirna Scithe", -- [2]
					},
					[173016] = {
						"Corpse Collector", -- [1]
						"The Necrotic Wake", -- [2]
					},
					[14466] = {
						"Horde Battle Standard", -- [1]
						"The Battle for Gilneas", -- [2]
					},
					[164705] = {
						"Pestilence Slime", -- [1]
						"Plaguefall", -- [2]
					},
					[173145] = {
						"Gorging Mite", -- [1]
						"Castle Nathria", -- [2]
					},
					[164450] = {
						"Dealer Xy'exa", -- [1]
						"De Other Side", -- [2]
					},
					[164578] = {
						"Stitchflesh's Creation", -- [1]
						"The Necrotic Wake", -- [2]
					},
					[173146] = {
						"Winged Ravager", -- [1]
						"Castle Nathria", -- [2]
					},
					[165474] = {
						"Nathrian Assassin", -- [1]
						"Castle Nathria", -- [2]
					},
					[164707] = {
						"Congealed Slime", -- [1]
						"Plaguefall", -- [2]
					},
					[122890] = {
						"Fanatical Pyromancer", -- [1]
						"Antorus, the Burning Throne", -- [2]
					},
					[169055] = {
						"Marrow Scraper", -- [1]
						"Theater of Pain", -- [2]
					},
					[173276] = {
						"Stone Legion Commando", -- [1]
						"Castle Nathria", -- [2]
					},
					[169696] = {
						"Mire Soldier", -- [1]
						"Plaguefall", -- [2]
					},
					[176474] = {
						"Hawksong", -- [1]
						"The Eternal Palace", -- [2]
					},
					[168418] = {
						"Forsworn Inquisitor", -- [1]
						"Spires of Ascension", -- [2]
					},
					[53006] = {
						"Spirit Link Totem", -- [1]
						"The Battle for Gilneas", -- [2]
					},
					[172255] = {
						"Gravestalker", -- [1]
						"Torghast, Tower of the Damned", -- [2]
					},
					[173406] = {
						"Renegade Abomination", -- [1]
						"Torghast, Tower of the Damned", -- [2]
					},
					[164967] = {
						"Doctor Ickus", -- [1]
						"Plaguefall", -- [2]
					},
					[168420] = {
						"Forsworn Champion", -- [1]
						"Spires of Ascension", -- [2]
					},
					[165479] = {
						"Court Enforcer", -- [1]
						"Castle Nathria", -- [2]
					},
					[170850] = {
						"Raging Bloodhorn", -- [1]
						"Theater of Pain", -- [2]
					},
					[174175] = {
						"Loyal Stoneborn", -- [1]
						"Halls of Atonement", -- [2]
					},
					[173280] = {
						"Stone Legion Skirmisher", -- [1]
						"Castle Nathria", -- [2]
					},
					[155250] = {
						"Decayspeaker", -- [1]
						"Torghast, Tower of the Damned", -- [2]
					},
					[165481] = {
						"Court Assassin", -- [1]
						"Castle Nathria", -- [2]
					},
					[168934] = {
						"Enraged Spirit", -- [1]
						"De Other Side", -- [2]
					},
					[155763] = {
						"Darkweaver Kar'dress", -- [1]
						"The Eternal Palace", -- [2]
					},
					[123533] = {
						"Tarneth", -- [1]
						"Antorus, the Burning Throne", -- [2]
					},
					[175456] = {
						"Swarm Training Dummy", -- [1]
						"Halls of Atonement", -- [2]
					},
					[160495] = {
						"Maniacal Soulbinder", -- [1]
						"Theater of Pain", -- [2]
					},
					[172899] = {
						"Nathrian Enforcer", -- [1]
						"Castle Nathria", -- [2]
					},
					[155764] = {
						"Rak'sha the Swift", -- [1]
						"The Eternal Palace", -- [2]
					},
					[165483] = {
						"Court Hierarch", -- [1]
						"Castle Nathria", -- [2]
					},
					[153335] = {
						"Potent Spark", -- [1]
						"The Eternal Palace", -- [2]
					},
					[172005] = {
						"Furrowed Colossus", -- [1]
						"Torghast, Tower of the Damned", -- [2]
					},
					[164461] = {
						"Sathel the Accursed", -- [1]
						"Theater of Pain", -- [2]
					},
					[164589] = {
						"Regenerating Wildseed", -- [1]
						"The Battle for Gilneas", -- [2]
					},
					[62982] = {
						"Mindbender", -- [1]
						"The Battle for Gilneas", -- [2]
					},
					[155767] = {
						"Grul'taj", -- [1]
						"The Eternal Palace", -- [2]
					},
					[156023] = {
						"Miniature Soulmass", -- [1]
						"Torghast, Tower of the Damned", -- [2]
					},
					[167532] = {
						"Heavin the Breaker", -- [1]
						"Theater of Pain", -- [2]
					},
					[173798] = {
						"Rat of Unusual Size", -- [1]
						"Castle Nathria", -- [2]
					},
					[155768] = {
						"Squallbinder Mal'ur", -- [1]
						"The Eternal Palace", -- [2]
					},
					[170474] = {
						"Brood Assassin", -- [1]
						"Plaguefall", -- [2]
					},
					[167533] = {
						"Advent Nevermore", -- [1]
						"Theater of Pain", -- [2]
					},
					[163058] = {
						"Mistveil Defender", -- [1]
						"Mists of Tirna Scithe", -- [2]
					},
					[167406] = {
						"Sire Denathrius", -- [1]
						"Castle Nathria", -- [2]
					},
					[167534] = {
						"Rek the Hardened", -- [1]
						"Theater of Pain", -- [2]
					},
					[173800] = {
						"Sewer Rat", -- [1]
						"Castle Nathria", -- [2]
					},
					[165872] = {
						"Flesh Crafter", -- [1]
						"The Necrotic Wake", -- [2]
					},
					[173161] = {
						"Lady Sinsear", -- [1]
						"Castle Nathria", -- [2]
					},
					[168942] = {
						"Death Speaker", -- [1]
						"De Other Side", -- [2]
					},
					[173162] = {
						"Lord Evershade", -- [1]
						"Castle Nathria", -- [2]
					},
					[171500] = {
						"Shuffling Corpse", -- [1]
						"The Necrotic Wake", -- [2]
					},
					[173802] = {
						"Carved Assistant", -- [1]
						"Castle Nathria", -- [2]
					},
					[173163] = {
						"Baron Duskhollow", -- [1]
						"Castle Nathria", -- [2]
					},
					[162038] = {
						"Regal Mistdancer", -- [1]
						"Sanguine Depths", -- [2]
					},
					[173164] = {
						"Countess Gloomveil", -- [1]
						"Castle Nathria", -- [2]
					},
					[165108] = {
						"Illusionary Clone", -- [1]
						"Mists of Tirna Scithe", -- [2]
					},
					[156157] = {
						"Coldheart Ascendant", -- [1]
						"Torghast, Tower of the Damned", -- [2]
					},
					[167538] = {
						"Dokigg the Brutalizer", -- [1]
						"Theater of Pain", -- [2]
					},
					[162040] = {
						"Grand Overseer", -- [1]
						"Sanguine Depths", -- [2]
					},
					[169457] = {
						"Bargast", -- [1]
						"Castle Nathria", -- [2]
					},
					[154240] = {
						"Azshara's Devoted", -- [1]
						"The Eternal Palace", -- [2]
					},
					[166644] = {
						"Artificer Xy'mox", -- [1]
						"Castle Nathria", -- [2]
					},
					[171887] = {
						"Slimy Smorgasbord", -- [1]
						"Plaguefall", -- [2]
					},
					[162041] = {
						"Grubby Dirtcruncher", -- [1]
						"Sanguine Depths", -- [2]
					},
					[171376] = {
						"Head Custodian Javlin", -- [1]
						"Sanguine Depths", -- [2]
					},
					[169458] = {
						"Hecutis", -- [1]
						"Castle Nathria", -- [2]
					},
					[165111] = {
						"Drust Spiteclaw", -- [1]
						"Mists of Tirna Scithe", -- [2]
					},
					[123476] = {
						"Hulking Demolisher", -- [1]
						"Antorus, the Burning Throne", -- [2]
					},
					[170483] = {
						"Atal'ai Deathwalker's Spirit", -- [1]
						"De Other Side", -- [2]
					},
					[122773] = {
						"Decimator", -- [1]
						"Antorus, the Burning Throne", -- [2]
					},
					[168949] = {
						"Risen Bonesoldier", -- [1]
						"De Other Side", -- [2]
					},
					[151814] = {
						"Deadsoul Shade", -- [1]
						"Torghast, Tower of the Damned", -- [2]
					},
					[166264] = {
						"Spare Parts", -- [1]
						"The Necrotic Wake", -- [2]
					},
					[123477] = {
						"Antoran Doomguard", -- [1]
						"Antorus, the Burning Throne", -- [2]
					},
					[151815] = {
						"Deadsoul Echo", -- [1]
						"Torghast, Tower of the Damned", -- [2]
					},
					[3527] = {
						"Healing Stream Totem", -- [1]
						"The Battle for Gilneas", -- [2]
					},
					[174194] = {
						"Court Executor", -- [1]
						"Castle Nathria", -- [2]
					},
					[155908] = {
						"Deathspeaker", -- [1]
						"Torghast, Tower of the Damned", -- [2]
					},
					[166266] = {
						"Spare Parts", -- [1]
						"The Necrotic Wake", -- [2]
					},
					[122135] = {
						"Shatug", -- [1]
						"Antorus, the Burning Throne", -- [2]
					},
					[157571] = {
						"Mawsworn Flametender", -- [1]
						"Torghast, Tower of the Damned", -- [2]
					},
					[173044] = {
						"Stitching Assistant", -- [1]
						"The Necrotic Wake", -- [2]
					},
					[123478] = {
						"Antoran Felguard", -- [1]
						"Antorus, the Burning Throne", -- [2]
					},
					[151817] = {
						"Deadsoul Devil", -- [1]
						"Torghast, Tower of the Damned", -- [2]
					},
					[157572] = {
						"Mawsworn Firecaller", -- [1]
						"Torghast, Tower of the Damned", -- [2]
					},
					[164861] = {
						"Spriggan Barkbinder", -- [1]
						"De Other Side", -- [2]
					},
					[168058] = {
						"Infused Quill-feather", -- [1]
						"Sanguine Depths", -- [2]
					},
					[130192] = {
						"Hulking Demolisher", -- [1]
						"Antorus, the Burning Throne", -- [2]
					},
					[166396] = {
						"Noble Skirmisher", -- [1]
						"Sanguine Depths", -- [2]
					},
					[166524] = {
						"Deathwalker", -- [1]
						"Theater of Pain", -- [2]
					},
					[174069] = {
						"Hulking Gargon", -- [1]
						"Castle Nathria", -- [2]
					},
					[174197] = {
						"Battlefield Ritualist", -- [1]
						"Theater of Pain", -- [2]
					},
					[162049] = {
						"Vestige of Doubt", -- [1]
						"Sanguine Depths", -- [2]
					},
					[171384] = {
						"Research Scribe", -- [1]
						"Sanguine Depths", -- [2]
					},
					[162689] = {
						"Surgeon Stitchflesh", -- [1]
						"The Necrotic Wake", -- [2]
					},
					[174070] = {
						"Kennel Overseer", -- [1]
						"Castle Nathria", -- [2]
					},
					[170234] = {
						"Oppressive Banner", -- [1]
						"Theater of Pain", -- [2]
					},
					[170490] = {
						"Atal'ai High Priest", -- [1]
						"De Other Side", -- [2]
					},
					[168572] = {
						"Fungi Stormer", -- [1]
						"Plaguefall", -- [2]
					},
					[168700] = {
						"Pestering Fiend", -- [1]
						"Castle Nathria", -- [2]
					},
					[174071] = {
						"Vicious Gargon", -- [1]
						"Castle Nathria", -- [2]
					},
					[123480] = {
						"Antoran Champion", -- [1]
						"Antorus, the Burning Throne", -- [2]
					},
					[125590] = {
						"Antoran Felguard", -- [1]
						"Antorus, the Burning Throne", -- [2]
					},
					[163458] = {
						"Forsworn Castigator", -- [1]
						"Spires of Ascension", -- [2]
					},
					[167806] = {
						"Animated Sin", -- [1]
						"Halls of Atonement", -- [2]
					},
					[58959] = {
						"Fizrik", -- [1]
						"The Eternal Palace", -- [2]
					},
					[168318] = {
						"Forsworn Goliath", -- [1]
						"Spires of Ascension", -- [2]
					},
					[168574] = {
						"Pestilent Harvester", -- [1]
						"Plaguefall", -- [2]
					},
					[162692] = {
						"Amarth", -- [1]
						"The Necrotic Wake", -- [2]
					},
					[167935] = {
						"Contagious Droplet", -- [1]
						"Plaguefall", -- [2]
					},
					[173178] = {
						"Stone Legion Goliath", -- [1]
						"Castle Nathria", -- [2]
					},
					[162309] = {
						"Kul'tharok", -- [1]
						"Theater of Pain", -- [2]
					},
					[2630] = {
						"Earthbind Totem", -- [1]
						"The Battle for Gilneas", -- [2]
					},
					[122778] = {
						"Annihilator", -- [1]
						"Antorus, the Burning Throne", -- [2]
					},
					[175992] = {
						"Dutiful Attendant", -- [1]
						"Castle Nathria", -- [2]
					},
					[173051] = {
						"Suppressor Xelors", -- [1]
						"Torghast, Tower of the Damned", -- [2]
					},
					[163077] = {
						"Azules", -- [1]
						"Spires of Ascension", -- [2]
					},
					[165251] = {
						"Illusionary Vulpin", -- [1]
						"Mists of Tirna Scithe", -- [2]
					},
					[174842] = {
						"Belligerent Waiter", -- [1]
						"Castle Nathria", -- [2]
					},
					[165763] = {
						"Vile Occultist", -- [1]
						"Castle Nathria", -- [2]
					},
					[166275] = {
						"Mistveil Shaper", -- [1]
						"Mists of Tirna Scithe", -- [2]
					},
					[174843] = {
						"Stoneborn Maitre D'", -- [1]
						"Castle Nathria", -- [2]
					},
					[165764] = {
						"Rockbound Vanquisher", -- [1]
						"Castle Nathria", -- [2]
					},
					[173053] = {
						"Afterimage of Lord Stavros", -- [1]
						"Castle Nathria", -- [2]
					},
					[155790] = {
						"Mawsworn Acolyte", -- [1]
						"Torghast, Tower of the Damned", -- [2]
					},
					[162056] = {
						"Rockbound Sprite", -- [1]
						"Sanguine Depths", -- [2]
					},
					[166276] = {
						"Mistveil Guardian", -- [1]
						"Mists of Tirna Scithe", -- [2]
					},
					[154128] = {
						"Blazing Elemental", -- [1]
						"Torghast, Tower of the Damned", -- [2]
					},
					[169601] = {
						"Stone Legion Commando", -- [1]
						"Castle Nathria", -- [2]
					},
					[173949] = {
						"Nathrian Soldier", -- [1]
						"Castle Nathria", -- [2]
					},
					[168962] = {
						"Reborn Phoenix", -- [1]
						"Castle Nathria", -- [2]
					},
					[155791] = {
						"Horrific Shrieker", -- [1]
						"The Eternal Palace", -- [2]
					},
					[162057] = {
						"Chamber Sentinel", -- [1]
						"Sanguine Depths", -- [2]
					},
					[154129] = {
						"Burning Emberguard", -- [1]
						"Torghast, Tower of the Damned", -- [2]
					},
					[162058] = {
						"Ventunax", -- [1]
						"Spires of Ascension", -- [2]
					},
					[168580] = {
						"Plagueborer", -- [1]
						"Plaguefall", -- [2]
					},
					[170882] = {
						"Bone Magus", -- [1]
						"Theater of Pain", -- [2]
					},
					[155793] = {
						"Skeletal Remains", -- [1]
						"Torghast, Tower of the Damned", -- [2]
					},
					[174335] = {
						"Stone Legion Skirmisher", -- [1]
						"Castle Nathria", -- [2]
					},
					[169476] = {
						"Highway Serf", -- [1]
						"Halls of Atonement", -- [2]
					},
					[168837] = {
						"Stealthling", -- [1]
						"Plaguefall", -- [2]
					},
					[164873] = {
						"Runestag Elderhorn", -- [1]
						"De Other Side", -- [2]
					},
					[174208] = {
						"Court Executor", -- [1]
						"Castle Nathria", -- [2]
					},
					[174336] = {
						"Kennel Overseer", -- [1]
						"Castle Nathria", -- [2]
					},
					[168326] = {
						"Shattered Visage", -- [1]
						"De Other Side", -- [2]
					},
					[164362] = {
						"Slimy Morsel", -- [1]
						"Plaguefall", -- [2]
					},
					[173953] = {
						"Loyal Gargon", -- [1]
						"Castle Nathria", -- [2]
					},
					[162061] = {
						"Devos", -- [1]
						"Spires of Ascension", -- [2]
					},
					[164363] = {
						"Undying Stonefiend", -- [1]
						"Halls of Atonement", -- [2]
					},
					[122718] = {
						"Felblade Shocktrooper", -- [1]
						"Antorus, the Burning Throne", -- [2]
					},
					[124828] = {
						"Argus the Unmaker", -- [1]
						"Antorus, the Burning Throne", -- [2]
					},
					[174210] = {
						"Blighted Sludge-Spewer", -- [1]
						"Theater of Pain", -- [2]
					},
					[174338] = {
						"Stinky Feedhauler", -- [1]
						"Castle Nathria", -- [2]
					},
					[165515] = {
						"Depraved Darkblade", -- [1]
						"Halls of Atonement", -- [2]
					},
					[168968] = {
						"Plaguebound Fallen", -- [1]
						"Plaguefall", -- [2]
					},
					[163086] = {
						"Rancid Gasbag", -- [1]
						"Theater of Pain", -- [2]
					},
					[173444] = {
						"Caramain", -- [1]
						"Castle Nathria", -- [2]
					},
					[155158] = {
						"First Arcanist Thalyssra", -- [1]
						"The Eternal Palace", -- [2]
					},
					[122783] = {
						"Blazing Imp", -- [1]
						"Antorus, the Burning Throne", -- [2]
					},
					[168969] = {
						"Gushing Slime", -- [1]
						"Plaguefall", -- [2]
					},
					[173189] = {
						"Nathrian Hawkeye", -- [1]
						"Castle Nathria", -- [2]
					},
					[173445] = {
						"Sindrel", -- [1]
						"Castle Nathria", -- [2]
					},
					[167691] = {
						"Stasis Trap", -- [1]
						"Castle Nathria", -- [2]
					},
					[173190] = {
						"Court Hawkeye", -- [1]
						"Castle Nathria", -- [2]
					},
					[173446] = {
						"Hargitas", -- [1]
						"Castle Nathria", -- [2]
					},
					[168843] = {
						"Klotos", -- [1]
						"Spires of Ascension", -- [2]
					},
					[129050] = {
						"Antoran Felguard", -- [1]
						"Antorus, the Burning Throne", -- [2]
					},
					[173191] = {
						"Soulstalker V'lara", -- [1]
						"Torghast, Tower of the Damned", -- [2]
					},
					[163089] = {
						"Disgusting Refuse", -- [1]
						"Theater of Pain", -- [2]
					},
					[60561] = {
						"Earthgrab Totem", -- [1]
						"The Battle for Gilneas", -- [2]
					},
					[155161] = {
						"Shandris Feathermoon", -- [1]
						"The Eternal Palace", -- [2]
					},
					[89] = {
						"Infernal", -- [1]
						"The Battle for Gilneas", -- [2]
					},
					[168844] = {
						"Lakesis", -- [1]
						"Spires of Ascension", -- [2]
					},
					[151581] = {
						"Horrific Vision", -- [1]
						"The Eternal Palace", -- [2]
					},
					[173448] = {
						"Dragost", -- [1]
						"Castle Nathria", -- [2]
					},
					[123680] = {
						"Dark Keeper Aedis", -- [1]
						"Antorus, the Burning Throne", -- [2]
					},
					[167566] = {
						"Bleakwing Assassin", -- [1]
						"Castle Nathria", -- [2]
					},
					[168717] = {
						"Forsworn Justicar", -- [1]
						"Spires of Ascension", -- [2]
					},
					[168845] = {
						"Astronos", -- [1]
						"Spires of Ascension", -- [2]
					},
					[168973] = {
						"High Torturer Darithos", -- [1]
						"Castle Nathria", -- [2]
					},
					[167055] = {
						"Rot Flinger", -- [1]
						"The Necrotic Wake", -- [2]
					},
					[165137] = {
						"Zolramus Gatekeeper", -- [1]
						"The Necrotic Wake", -- [2]
					},
					[165521] = {
						"Lady Inerva Darkvein", -- [1]
						"Castle Nathria", -- [2]
					},
					[168718] = {
						"Forsworn Warden", -- [1]
						"Spires of Ascension", -- [2]
					},
					[165905] = {
						"Son of Hakkar", -- [1]
						"De Other Side", -- [2]
					},
					[125535] = {
						"Riftworld Assistant", -- [1]
						"Antorus, the Burning Throne", -- [2]
					},
					[165138] = {
						"Blight Bag", -- [1]
						"The Necrotic Wake", -- [2]
					},
					[168591] = {
						"Ravenous Dreadbat", -- [1]
						"Sanguine Depths", -- [2]
					},
					[26125] = {
						"Risen Ghoul", -- [1]
						"Warsong Gulch", -- [2]
					},
					[174090] = {
						"Nathrian Hierarch", -- [1]
						"Castle Nathria", -- [2]
					},
					[154014] = {
						"Imprisoned Cabalist", -- [1]
						"Torghast, Tower of the Damned", -- [2]
					},
					[151329] = {
						"Warden Skoldus", -- [1]
						"Torghast, Tower of the Damned", -- [2]
					},
					[122467] = {
						"Asara, Mother of Night", -- [1]
						"Antorus, the Burning Throne", -- [2]
					},
					[168337] = {
						"Moldovaak", -- [1]
						"Castle Nathria", -- [2]
					},
					[164501] = {
						"Mistcaller", -- [1]
						"Mists of Tirna Scithe", -- [2]
					},
					[174092] = {
						"Nathrian Gargon Rider", -- [1]
						"Castle Nathria", -- [2]
					},
					[168594] = {
						"Chamber Sentinel", -- [1]
						"Sanguine Depths", -- [2]
					},
					[151331] = {
						"Cellblock Sentinel", -- [1]
						"Torghast, Tower of the Damned", -- [2]
					},
					[171919] = {
						"Ayeleth's Torturer", -- [1]
						"Torghast, Tower of the Damned", -- [2]
					},
					[174093] = {
						"Nathrian Ranger", -- [1]
						"Castle Nathria", -- [2]
					},
					[122468] = {
						"Noura, Mother of Flames", -- [1]
						"Antorus, the Burning Throne", -- [2]
					},
					[122532] = {
						"Ember of Taeshalach", -- [1]
						"Antorus, the Burning Throne", -- [2]
					},
					[170385] = {
						"Writhing Misery", -- [1]
						"Torghast, Tower of the Damned", -- [2]
					},
					[162329] = {
						"Xav the Unfallen", -- [1]
						"Theater of Pain", -- [2]
					},
					[167956] = {
						"Dark Acolyte", -- [1]
						"Sanguine Depths", -- [2]
					},
					[128095] = {
						"Sister of the Lash", -- [1]
						"Antorus, the Burning Throne", -- [2]
					},
					[154018] = {
						"Prisonbreak Mauler", -- [1]
						"Torghast, Tower of the Damned", -- [2]
					},
					[151333] = {
						"Sentinel Shard", -- [1]
						"Torghast, Tower of the Damned", -- [2]
					},
					[169875] = {
						"Shackled Soul", -- [1]
						"Theater of Pain", -- [2]
					},
					[152612] = {
						"Subjugator Klontzas", -- [1]
						"Torghast, Tower of the Damned", -- [2]
					},
					[122469] = {
						"Diima, Mother of Gloom", -- [1]
						"Antorus, the Burning Throne", -- [2]
					},
					[59764] = {
						"Healing Tide Totem", -- [1]
						"The Battle for Gilneas", -- [2]
					},
					[173840] = {
						"Plaguebound Devoted", -- [1]
						"Plaguefall", -- [2]
					},
					[154020] = {
						"Prisonbreak Cursewalker", -- [1]
						"Torghast, Tower of the Damned", -- [2]
					},
					[165529] = {
						"Depraved Collector", -- [1]
						"Halls of Atonement", -- [2]
					},
					[165913] = {
						"Ghastly Parishioner", -- [1]
						"Halls of Atonement", -- [2]
					},
					[173714] = {
						"Mistveil Nightblossom", -- [1]
						"Mists of Tirna Scithe", -- [2]
					},
					[153382] = {
						"Maw of the Maw", -- [1]
						"Torghast, Tower of the Damned", -- [2]
					},
					[155812] = {
						"Mawsworn Ritualist", -- [1]
						"Torghast, Tower of the Damned", -- [2]
					},
					[103673] = {
						"Darkglare", -- [1]
						"Warsong Gulch", -- [2]
					},
					[169751] = {
						"Ashen Wasp", -- [1]
						"Theater of Pain", -- [2]
					},
					[155813] = {
						"Court Attendant", -- [1]
						"The Eternal Palace", -- [2]
					},
					[166299] = {
						"Mistveil Tender", -- [1]
						"Mists of Tirna Scithe", -- [2]
					},
					[174100] = {
						"Nathrian Singuard", -- [1]
						"Castle Nathria", -- [2]
					},
					[155814] = {
						"Eldritch Understudy", -- [1]
						"The Eternal Palace", -- [2]
					},
					[6112] = {
						"Windfury Totem", -- [1]
						"Silvershard Mines", -- [2]
					},
					[164510] = {
						"Shambling Arbalest", -- [1]
						"Theater of Pain", -- [2]
					},
					[171799] = {
						"Depths Warden", -- [1]
						"Sanguine Depths", -- [2]
					},
					[173973] = {
						"Nathrian Tracker", -- [1]
						"Castle Nathria", -- [2]
					},
					[168986] = {
						"Skeletal Raptor", -- [1]
						"De Other Side", -- [2]
					},
					[166301] = {
						"Mistveil Stalker", -- [1]
						"Mists of Tirna Scithe", -- [2]
					},
					[169498] = {
						"Plague Bomb", -- [1]
						"Plaguefall", -- [2]
					},
					[167964] = {
						"4.RF-4.RF", -- [1]
						"De Other Side", -- [2]
					},
					[172312] = {
						"Spinemaw Gorger", -- [1]
						"Mists of Tirna Scithe", -- [2]
					},
					[166302] = {
						"Corpse Harvester", -- [1]
						"The Necrotic Wake", -- [2]
					},
					[168988] = {
						"Overgrowth", -- [1]
						"Mists of Tirna Scithe", -- [2]
					},
					[155945] = {
						"Gherus the Chained", -- [1]
						"Torghast, Tower of the Damned", -- [2]
					},
					[173464] = {
						"Deplina", -- [1]
						"Castle Nathria", -- [2]
					},
					[165408] = {
						"Halkias", -- [1]
						"Halls of Atonement", -- [2]
					},
					[173720] = {
						"Mistveil Gorgegullet", -- [1]
						"Mists of Tirna Scithe", -- [2]
					},
					[163618] = {
						"Zolramus Necromancer", -- [1]
						"The Necrotic Wake", -- [2]
					},
					[167966] = {
						"Experimental Sludge", -- [1]
						"De Other Side", -- [2]
					},
					[166304] = {
						"Mistveil Stinger", -- [1]
						"Mists of Tirna Scithe", -- [2]
					},
					[163619] = {
						"Zolramus Bonecarver", -- [1]
						"The Necrotic Wake", -- [2]
					},
					[167967] = {
						"Sentient Oil", -- [1]
						"De Other Side", -- [2]
					},
					[173466] = {
						"Fara", -- [1]
						"Castle Nathria", -- [2]
					},
					[165410] = {
						"High Adjudicator Aleez", -- [1]
						"Halls of Atonement", -- [2]
					},
					[163620] = {
						"Rotspew", -- [1]
						"The Necrotic Wake", -- [2]
					},
					[154030] = {
						"Oddly Large Mawrat", -- [1]
						"Torghast, Tower of the Damned", -- [2]
					},
					[163621] = {
						"Goregrind", -- [1]
						"The Necrotic Wake", -- [2]
					},
					[168992] = {
						"Risen Cultist", -- [1]
						"De Other Side", -- [2]
					},
					[164261] = {
						"Hungering Destroyer", -- [1]
						"Castle Nathria", -- [2]
					},
					[163366] = {
						"Magus of the Dead", -- [1]
						"Mists of Tirna Scithe", -- [2]
					},
					[164517] = {
						"Tred'ova", -- [1]
						"Mists of Tirna Scithe", -- [2]
					},
					[163622] = {
						"Goregrind Bits", -- [1]
						"The Necrotic Wake", -- [2]
					},
					[69791] = {
						"Fire Spirit", -- [1]
						"The Battle for Gilneas", -- [2]
					},
					[173469] = {
						"Kullan", -- [1]
						"Castle Nathria", -- [2]
					},
					[163623] = {
						"Rotspew Leftovers", -- [1]
						"The Necrotic Wake", -- [2]
					},
					[125545] = {
						"Blazing Imp", -- [1]
						"Antorus, the Burning Throne", -- [2]
					},
					[157102] = {
						"Imperial Consular", -- [1]
						"Torghast, Tower of the Damned", -- [2]
					},
					[165414] = {
						"Depraved Obliterator", -- [1]
						"Halls of Atonement", -- [2]
					},
					[162729] = {
						"Patchwerk Soldier", -- [1]
						"The Necrotic Wake", -- [2]
					},
					[69792] = {
						"Earth Spirit", -- [1]
						"The Battle for Gilneas", -- [2]
					},
					[150965] = {
						"Mawsworn Shackler", -- [1]
						"Torghast, Tower of the Damned", -- [2]
					},
					[165415] = {
						"Toiling Groundskeeper", -- [1]
						"Halls of Atonement", -- [2]
					},
					[168101] = {
						"Empowered Deadsoul Shade", -- [1]
						"Torghast, Tower of the Damned", -- [2]
					},
					[163882] = {
						"Decaying Flesh Giant", -- [1]
						"Plaguefall", -- [2]
					},
					[168102] = {
						"Empowered Deadsoul Echo", -- [1]
						"Torghast, Tower of the Damned", -- [2]
					},
					[164266] = {
						"Domina Venomblade", -- [1]
						"Plaguefall", -- [2]
					},
					[173729] = {
						"Manifestation of Pride", -- [1]
						"Halls of Atonement", -- [2]
					},
					[169893] = {
						"Nefarious Darkspeaker", -- [1]
						"Theater of Pain", -- [2]
					},
					[171172] = {
						"Mawsworn Shackler", -- [1]
						"Torghast, Tower of the Damned", -- [2]
					},
					[164267] = {
						"Margrave Stradama", -- [1]
						"Plaguefall", -- [2]
					},
					[155828] = {
						"Runecarved Colossus", -- [1]
						"Torghast, Tower of the Damned", -- [2]
					},
					[171557] = {
						"Shade of Bargast", -- [1]
						"Castle Nathria", -- [2]
					},
					[163501] = {
						"Forsworn Skirmisher", -- [1]
						"Spires of Ascension", -- [2]
					},
					[151353] = {
						"Mawrat", -- [1]
						"Torghast, Tower of the Damned", -- [2]
					},
					[168105] = {
						"Empowered Mawsworn Flametender", -- [1]
						"Torghast, Tower of the Damned", -- [2]
					},
					[168361] = {
						"Fen Hornet", -- [1]
						"Plaguefall", -- [2]
					},
					[173604] = {
						"Sinister Antiquarian", -- [1]
						"Castle Nathria", -- [2]
					},
					[168106] = {
						"Empowered Mawsworn Guard", -- [1]
						"Torghast, Tower of the Damned", -- [2]
					},
					[171431] = {
						"Suppressor Vellon", -- [1]
						"Torghast, Tower of the Damned", -- [2]
					},
					[163503] = {
						"Etherdiver", -- [1]
						"Spires of Ascension", -- [2]
					},
					[416] = {
						"Pagbis", -- [1]
						"The Eternal Palace", -- [2]
					},
					[168107] = {
						"Empowered Mawsworn Interceptor", -- [1]
						"Torghast, Tower of the Damned", -- [2]
					},
					[127723] = {
						"Imperator Deconix", -- [1]
						"Antorus, the Burning Throne", -- [2]
					},
					[126764] = {
						"Bladesworn Ravager", -- [1]
						"Antorus, the Burning Throne", -- [2]
					},
					[168747] = {
						"Venomfang", -- [1]
						"Plaguefall", -- [2]
					},
					[168108] = {
						"Empowered Lumbering Creation", -- [1]
						"Torghast, Tower of the Damned", -- [2]
					},
					[163121] = {
						"Stitched Vanguard", -- [1]
						"The Necrotic Wake", -- [2]
					},
					[171433] = {
						"Suppressor Cer", -- [1]
						"Torghast, Tower of the Damned", -- [2]
					},
					[124207] = {
						"Fel-Charged Obfuscator", -- [1]
						"Antorus, the Burning Throne", -- [2]
					},
					[152508] = {
						"Dusky Tremorbeast", -- [1]
						"Torghast, Tower of the Damned", -- [2]
					},
					[154682] = {
						"Echo of Fear", -- [1]
						"The Eternal Palace", -- [2]
					},
					[168109] = {
						"Empowered Mawsworn Ritualist", -- [1]
						"Torghast, Tower of the Damned", -- [2]
					},
					[163122] = {
						"Brittlebone Warrior", -- [1]
						"The Necrotic Wake", -- [2]
					},
					[168365] = {
						"Fungret Shroomtender", -- [1]
						"Plaguefall", -- [2]
					},
					[163506] = {
						"Forsworn Stealthclaw", -- [1]
						"Spires of Ascension", -- [2]
					},
					[162100] = {
						"Kryxis the Voracious", -- [1]
						"Sanguine Depths", -- [2]
					},
					[173609] = {
						"Nathrian Conservator", -- [1]
						"Castle Nathria", -- [2]
					},
					[168878] = {
						"Rigged Plagueborer", -- [1]
						"Plaguefall", -- [2]
					},
					[163891] = {
						"Rotmarrow Slime", -- [1]
						"Plaguefall", -- [2]
					},
					[168111] = {
						"Empowered Imperial Curator", -- [1]
						"Torghast, Tower of the Damned", -- [2]
					},
					[127725] = {
						"Felblade Shocktrooper", -- [1]
						"Antorus, the Burning Throne", -- [2]
					},
					[156219] = {
						"Coldheart Scout", -- [1]
						"Torghast, Tower of the Damned", -- [2]
					},
					[163892] = {
						"Rotting Slimeclaw", -- [1]
						"Plaguefall", -- [2]
					},
					[168112] = {
						"General Kaal", -- [1]
						"Castle Nathria", -- [2]
					},
					[162102] = {
						"Grand Proctor Beryllia", -- [1]
						"Sanguine Depths", -- [2]
					},
					[170414] = {
						"Howling Spectre", -- [1]
						"Torghast, Tower of the Damned", -- [2]
					},
					[154174] = {
						"Horrific Summoner", -- [1]
						"The Eternal Palace", -- [2]
					},
					[168113] = {
						"General Grashaal", -- [1]
						"Castle Nathria", -- [2]
					},
					[163126] = {
						"Brittlebone Mage", -- [1]
						"The Necrotic Wake", -- [2]
					},
					[173484] = {
						"Conjured Manifestation", -- [1]
						"Castle Nathria", -- [2]
					},
					[154175] = {
						"Horrific Summoner", -- [1]
						"The Eternal Palace", -- [2]
					},
					[165556] = {
						"Fleeting Manifestation", -- [1]
						"Sanguine Depths", -- [2]
					},
					[170927] = {
						"Erupting Ooze", -- [1]
						"Plaguefall", -- [2]
					},
					[163894] = {
						"Blighted Spinebreaker", -- [1]
						"Plaguefall", -- [2]
					},
					[169265] = {
						"Creepy Crawler", -- [1]
						"Plaguefall", -- [2]
					},
					[164406] = {
						"Shriekwing", -- [1]
						"Castle Nathria", -- [2]
					},
					[167731] = {
						"Separation Assistant", -- [1]
						"The Necrotic Wake", -- [2]
					},
					[168882] = {
						"Fleeting Manifestation", -- [1]
						"Sanguine Depths", -- [2]
					},
					[24207] = {
						"Army of the Dead", -- [1]
						"Mists of Tirna Scithe", -- [2]
					},
					[171184] = {
						"Mythresh, Sky's Talons", -- [1]
						"De Other Side", -- [2]
					},
					[163128] = {
						"Zolramus Sorcerer", -- [1]
						"The Necrotic Wake", -- [2]
					},
					[157118] = {
						"Royal Advisor", -- [1]
						"Torghast, Tower of the Damned", -- [2]
					},
					[165430] = {
						"Malignant Spawn", -- [1]
						"Plaguefall", -- [2]
					},
					[168627] = {
						"Plaguebinder", -- [1]
						"Plaguefall", -- [2]
					},
					[156015] = {
						"Writhing Soulmass", -- [1]
						"Torghast, Tower of the Damned", -- [2]
					},
					[157807] = {
						"Mawsworn Soulweaver", -- [1]
						"Torghast, Tower of the Damned", -- [2]
					},
					[174126] = {
						"Baron Duskhollow", -- [1]
						"Castle Nathria", -- [2]
					},
					[175123] = {
						"Warden Arkoban", -- [1]
						"Torghast, Tower of the Damned", -- [2]
					},
					[164255] = {
						"Globgrog", -- [1]
						"Plaguefall", -- [2]
					},
					[170199] = {
						"Harnessed Specter", -- [1]
						"Castle Nathria", -- [2]
					},
					[5925] = {
						"Grounding Totem", -- [1]
						"The Battle for Gilneas", -- [2]
					},
					[171422] = {
						"Arch-Suppressor Laguas", -- [1]
						"Torghast, Tower of the Damned", -- [2]
					},
					[167963] = {
						"Headless Client", -- [1]
						"De Other Side", -- [2]
					},
					[151818] = {
						"Deadsoul Miscreation", -- [1]
						"Torghast, Tower of the Damned", -- [2]
					},
					[164920] = {
						"Drust Soulcleaver", -- [1]
						"Mists of Tirna Scithe", -- [2]
					},
					[165805] = {
						"Shade of Kael'thas", -- [1]
						"Castle Nathria", -- [2]
					},
					[173360] = {
						"Plaguebelcher", -- [1]
						"Plaguefall", -- [2]
					},
					[170419] = {
						"Lost Dredger", -- [1]
						"Torghast, Tower of the Damned", -- [2]
					},
					[168457] = {
						"Stonewall Gargon", -- [1]
						"Sanguine Depths", -- [2]
					},
					[165560] = {
						"Gormling Larva", -- [1]
						"Mists of Tirna Scithe", -- [2]
					},
					[175205] = {
						"Baleful Shadow", -- [1]
						"Castle Nathria", -- [2]
					},
					[157809] = {
						"Mawsworn Darkcaster", -- [1]
						"Torghast, Tower of the Damned", -- [2]
					},
					[164921] = {
						"Drust Harvester", -- [1]
						"Mists of Tirna Scithe", -- [2]
					},
					[155830] = {
						"Mawsworn Disciple", -- [1]
						"Torghast, Tower of the Damned", -- [2]
					},
					[168246] = {
						"Reanimated Crossbowman", -- [1]
						"The Necrotic Wake", -- [2]
					},
					[165010] = {
						"Congealed Slime", -- [1]
						"Plaguefall", -- [2]
					},
					[156226] = {
						"Coldheart Binder", -- [1]
						"Torghast, Tower of the Damned", -- [2]
					},
					[167607] = {
						"Stoneborn Slasher", -- [1]
						"Halls of Atonement", -- [2]
					},
					[156213] = {
						"Coldheart Guardian", -- [1]
						"Torghast, Tower of the Damned", -- [2]
					},
					[168886] = {
						"Virulax Blightweaver", -- [1]
						"Plaguefall", -- [2]
					},
					[152644] = {
						"Deadsoul Drifter", -- [1]
						"Torghast, Tower of the Damned", -- [2]
					},
					[171188] = {
						"Plaguebound Devoted", -- [1]
						"Plaguefall", -- [2]
					},
					[152898] = {
						"Deadsoul Chorus", -- [1]
						"Torghast, Tower of the Damned", -- [2]
					},
					[157122] = {
						"Patrician Cromwell", -- [1]
						"Torghast, Tower of the Damned", -- [2]
					},
					[152708] = {
						"Mawsworn Seeker", -- [1]
						"Torghast, Tower of the Damned", -- [2]
					},
					[156142] = {
						"Seeker of Souls", -- [1]
						"Torghast, Tower of the Damned", -- [2]
					},
					[167965] = {
						"Lubricator", -- [1]
						"De Other Side", -- [2]
					},
					[172979] = {
						"Honeydew Sporeflutterer", -- [1]
						"Mists of Tirna Scithe", -- [2]
					},
					[165946] = {
						"Mordretha, the Endless Empress", -- [1]
						"Theater of Pain", -- [2]
					},
					[121975] = {
						"Aggramar", -- [1]
						"Antorus, the Burning Throne", -- [2]
					},
					[172265] = {
						"Remnant of Fury", -- [1]
						"Sanguine Depths", -- [2]
					},
					[162099] = {
						"General Kaal", -- [1]
						"Sanguine Depths", -- [2]
					},
					[170093] = {
						"Mawsworn Seeker", -- [1]
						"Torghast, Tower of the Damned", -- [2]
					},
					[167962] = {
						"Defunct Dental Drill", -- [1]
						"De Other Side", -- [2]
					},
					[164407] = {
						"Sludgefist", -- [1]
						"Castle Nathria", -- [2]
					},
					[151816] = {
						"Deadsoul Scavenger", -- [1]
						"Torghast, Tower of the Damned", -- [2]
					},
					[166970] = {
						"Lord Stavros", -- [1]
						"Castle Nathria", -- [2]
					},
					[155845] = {
						"Crushing Depths", -- [1]
						"The Eternal Palace", -- [2]
					},
					[155156] = {
						"Jaina Proudmoore", -- [1]
						"The Eternal Palace", -- [2]
					},
					[171181] = {
						"Territorial Bladebeak", -- [1]
						"De Other Side", -- [2]
					},
					[123702] = {
						"Feltouched Skitterer", -- [1]
						"Antorus, the Burning Throne", -- [2]
					},
					[167610] = {
						"Stonefiend Anklebiter", -- [1]
						"Halls of Atonement", -- [2]
					},
					[78001] = {
						"Cloudburst Totem", -- [1]
						"The Battle for Gilneas", -- [2]
					},
					[172981] = {
						"Kyrian Stitchwerk", -- [1]
						"The Necrotic Wake", -- [2]
					},
					[166971] = {
						"Castellan Niklaus", -- [1]
						"Castle Nathria", -- [2]
					},
					[36296] = {
						"Apothecary Hummel", -- [1]
						"Shadowfang Keep", -- [2]
					},
					[152905] = {
						"Tower Sentinel", -- [1]
						"Torghast, Tower of the Damned", -- [2]
					},
					[122104] = {
						"Portal Keeper Hasabel", -- [1]
						"Antorus, the Burning Throne", -- [2]
					},
					[164414] = {
						"Reanimated Mage", -- [1]
						"The Necrotic Wake", -- [2]
					},
					[167611] = {
						"Stoneborn Eviscerator", -- [1]
						"Halls of Atonement", -- [2]
					},
					[170488] = {
						"Son of Hakkar", -- [1]
						"De Other Side", -- [2]
					},
					[165222] = {
						"Zolramus Bonemender", -- [1]
						"The Necrotic Wake", -- [2]
					},
					[164926] = {
						"Drust Boughbreaker", -- [1]
						"Mists of Tirna Scithe", -- [2]
					},
					[153878] = {
						"Mawsworn Archer", -- [1]
						"Torghast, Tower of the Damned", -- [2]
					},
					[174773] = {
						"Spiteful Shade", -- [1]
						"Mists of Tirna Scithe", -- [2]
					},
					[171448] = {
						"Dreadful Huntmaster", -- [1]
						"Sanguine Depths", -- [2]
					},
					[171474] = {
						"Finger Food", -- [1]
						"Plaguefall", -- [2]
					},
					[167612] = {
						"Stoneborn Reaver", -- [1]
						"Halls of Atonement", -- [2]
					},
					[173568] = {
						"Anima Crazed Worker", -- [1]
						"Castle Nathria", -- [2]
					},
					[168891] = {
						"Rigged Plagueborer", -- [1]
						"Plaguefall", -- [2]
					},
					[174134] = {
						"Lord Evershade", -- [1]
						"Castle Nathria", -- [2]
					},
					[125570] = {
						"Riftworld Assistant", -- [1]
						"Antorus, the Burning Throne", -- [2]
					},
					[162691] = {
						"Blightbone", -- [1]
						"The Necrotic Wake", -- [2]
					},
					[417] = {
						"Fzuukun", -- [1]
						"The Battle for Gilneas", -- [2]
					},
					[167485] = {
						"Starving Mawrat", -- [1]
						"Torghast, Tower of the Damned", -- [2]
					},
					[170480] = {
						"Atal'ai Deathwalker", -- [1]
						"De Other Side", -- [2]
					},
					[170486] = {
						"Atal'ai Devoted", -- [1]
						"De Other Side", -- [2]
					},
					[155251] = {
						"Elder Longbranch", -- [1]
						"Torghast, Tower of the Damned", -- [2]
					},
					[157634] = {
						"Flameforge Enforcer", -- [1]
						"Torghast, Tower of the Damned", -- [2]
					},
					[166079] = {
						"Brittlebone Crossbowman", -- [1]
						"The Necrotic Wake", -- [2]
					},
					[165911] = {
						"Loyal Creation", -- [1]
						"The Necrotic Wake", -- [2]
					},
					[127732] = {
						"Clobex", -- [1]
						"Antorus, the Burning Throne", -- [2]
					},
					[150958] = {
						"Mawsworn Guard", -- [1]
						"Torghast, Tower of the Damned", -- [2]
					},
					[150859] = {
						"Za'qul", -- [1]
						"The Eternal Palace", -- [2]
					},
					[163862] = {
						"Defender of Many Eyes", -- [1]
						"Plaguefall", -- [2]
					},
					[165824] = {
						"Nar'zudah", -- [1]
						"The Necrotic Wake", -- [2]
					},
					[167998] = {
						"Portal Guardian", -- [1]
						"Theater of Pain", -- [2]
					},
					[173114] = {
						"Invasive Decayfly", -- [1]
						"Torghast, Tower of the Damned", -- [2]
					},
					[153165] = {
						"Custodian Thonar", -- [1]
						"Torghast, Tower of the Damned", -- [2]
					},
					[167994] = {
						"Ossified Conscript", -- [1]
						"Theater of Pain", -- [2]
					},
					[36565] = {
						"Apothecary Baxter", -- [1]
						"Shadowfang Keep", -- [2]
					},
					[167615] = {
						"Depraved Darkblade", -- [1]
						"Halls of Atonement", -- [2]
					},
					[172858] = {
						"Stone Legion Goliath", -- [1]
						"Castle Nathria", -- [2]
					},
					[152910] = {
						"Queen Azshara", -- [1]
						"The Eternal Palace", -- [2]
					},
					[100943] = {
						"Earthen Wall Totem", -- [1]
						"The Battle for Gilneas", -- [2]
					},
					[156159] = {
						"Coldheart Javelineer", -- [1]
						"Torghast, Tower of the Damned", -- [2]
					},
					[157002] = {
						"Imperial Enforcer", -- [1]
						"Torghast, Tower of the Damned", -- [2]
					},
					[155871] = {
						"Voidbound Terror", -- [1]
						"The Eternal Palace", -- [2]
					},
					[95061] = {
						"Greater Fire Elemental", -- [1]
						"The Battle for Gilneas", -- [2]
					},
					[163524] = {
						"Kyrian Dark-Praetor", -- [1]
						"Spires of Ascension", -- [2]
					},
					[127724] = {
						"Fanatical Pyromancer", -- [1]
						"Antorus, the Burning Throne", -- [2]
					},
					[150959] = {
						"Mawsworn Interceptor", -- [1]
						"Torghast, Tower of the Damned", -- [2]
					},
					[168310] = {
						"Plagueroc", -- [1]
						"Plaguefall", -- [2]
					},
					[171805] = {
						"Research Scribe", -- [1]
						"Sanguine Depths", -- [2]
					},
					[157003] = {
						"Imperial Duelist", -- [1]
						"Torghast, Tower of the Damned", -- [2]
					},
					[168104] = {
						"Empowered Flameforge Master", -- [1]
						"Torghast, Tower of the Damned", -- [2]
					},
					[164929] = {
						"Tirnenn Villager", -- [1]
						"Mists of Tirna Scithe", -- [2]
					},
					[172021] = {
						"Coldheart Automaton", -- [1]
						"Torghast, Tower of the Damned", -- [2]
					},
					[164218] = {
						"Lord Chamberlain", -- [1]
						"Halls of Atonement", -- [2]
					},
					[164804] = {
						"Droman Oulfarran", -- [1]
						"Mists of Tirna Scithe", -- [2]
					},
					[152656] = {
						"Deadsoul Stalker", -- [1]
						"Torghast, Tower of the Damned", -- [2]
					},
					[165060] = {
						"Animimic", -- [1]
						"Torghast, Tower of the Damned", -- [2]
					},
					[164621] = {
						"Oozing Slime", -- [1]
						"Torghast, Tower of the Damned", -- [2]
					},
					[174012] = {
						"Executrix Ophelia", -- [1]
						"Castle Nathria", -- [2]
					},
					[156237] = {
						"Imperator Dara", -- [1]
						"Torghast, Tower of the Damned", -- [2]
					},
					[162047] = {
						"Insatiable Brute", -- [1]
						"Sanguine Depths", -- [2]
					},
					[165472] = {
						"Nathrian Siphoner", -- [1]
						"Castle Nathria", -- [2]
					},
					[153552] = {
						"Weeping Wraith", -- [1]
						"Torghast, Tower of the Damned", -- [2]
					},
					[168002] = {
						"Empowered Mawsworn Shackler", -- [1]
						"Torghast, Tower of the Damned", -- [2]
					},
					[19668] = {
						"Shadowfiend", -- [1]
						"Silvershard Mines", -- [2]
					},
					[165189] = {
						"Murphy", -- [1]
						"The Battle for Gilneas", -- [2]
					},
					[171455] = {
						"Stonewall Gargon", -- [1]
						"Sanguine Depths", -- [2]
					},
					[155215] = {
						"Faeleaf Lasher", -- [1]
						"Torghast, Tower of the Damned", -- [2]
					},
					[164550] = {
						"Slithering Ooze", -- [1]
						"Plaguefall", -- [2]
					},
					[168003] = {
						"Empowered Coldheart Ascendant", -- [1]
						"Torghast, Tower of the Damned", -- [2]
					},
					[169861] = {
						"Ickor Bileflesh", -- [1]
						"Plaguefall", -- [2]
					},
					[123451] = {
						"Felguard", -- [1]
						"Antorus, the Burning Throne", -- [2]
					},
					[165076] = {
						"Gluttonous Tick", -- [1]
						"Sanguine Depths", -- [2]
					},
					[162046] = {
						"Famished Tick", -- [1]
						"Sanguine Depths", -- [2]
					},
					[164506] = {
						"Ancient Captain", -- [1]
						"Theater of Pain", -- [2]
					},
					[155216] = {
						"Faeleaf Warden", -- [1]
						"Torghast, Tower of the Damned", -- [2]
					},
					[167876] = {
						"Inquisitor Sigar", -- [1]
						"Halls of Atonement", -- [2]
					},
					[165471] = {
						"Nathrian Duelist", -- [1]
						"Castle Nathria", -- [2]
					},
					[172991] = {
						"Drust Soulcleaver", -- [1]
						"Mists of Tirna Scithe", -- [2]
					},
					[168004] = {
						"Empowered Imperial Consular", -- [1]
						"Torghast, Tower of the Damned", -- [2]
					},
					[167109] = {
						"Skeletal Vanguard", -- [1]
						"The Necrotic Wake", -- [2]
					},
					[165762] = {
						"Soul Infuser", -- [1]
						"Castle Nathria", -- [2]
					},
					[164552] = {
						"Rotmarrow Slime", -- [1]
						"Plaguefall", -- [2]
					},
					[167493] = {
						"Venomous Sniper", -- [1]
						"Plaguefall", -- [2]
					},
					[170690] = {
						"Diseased Horror", -- [1]
						"Theater of Pain", -- [2]
					},
					[163157] = {
						"Amarth", -- [1]
						"The Necrotic Wake", -- [2]
					},
					[123191] = {
						"Fel Hound", -- [1]
						"Antorus, the Burning Throne", -- [2]
					},
					[123452] = {
						"Fel Lord", -- [1]
						"Antorus, the Burning Throne", -- [2]
					},
					[152853] = {
						"Silivaz the Zealous", -- [1]
						"The Eternal Palace", -- [2]
					},
					[152875] = {
						"Massive Crusher", -- [1]
						"Torghast, Tower of the Damned", -- [2]
					},
					[122477] = {
						"F'harg", -- [1]
						"Antorus, the Burning Throne", -- [2]
					},
					[156241] = {
						"Monstrous Guardian", -- [1]
						"Torghast, Tower of the Damned", -- [2]
					},
					[151127] = {
						"Lord of Torment", -- [1]
						"Torghast, Tower of the Damned", -- [2]
					},
					[167999] = {
						"Echo of Sin", -- [1]
						"Castle Nathria", -- [2]
					},
					[169924] = {
						"Veteran Stoneguard", -- [1]
						"Castle Nathria", -- [2]
					},
					[152661] = {
						"Mawsworn Ward", -- [1]
						"Torghast, Tower of the Damned", -- [2]
					},
					[167111] = {
						"Spinemaw Staghorn", -- [1]
						"Mists of Tirna Scithe", -- [2]
					},
					[155219] = {
						"Gormling Spitter", -- [1]
						"Torghast, Tower of the Damned", -- [2]
					},
					[163857] = {
						"Plaguebound Devoted", -- [1]
						"Plaguefall", -- [2]
					},
					[173633] = {
						"Nathrian Archivist", -- [1]
						"Castle Nathria", -- [2]
					},
					[163915] = {
						"Hatchling Nest", -- [1]
						"Plaguefall", -- [2]
					},
					[163459] = {
						"Forsworn Mender", -- [1]
						"Spires of Ascension", -- [2]
					},
					[122366] = {
						"Varimathras", -- [1]
						"Antorus, the Burning Throne", -- [2]
					},
					[168007] = {
						"Empowered Mawsworn Soulbinder", -- [1]
						"Torghast, Tower of the Damned", -- [2]
					},
					[165066] = {
						"Huntsman Altimor", -- [1]
						"Castle Nathria", -- [2]
					},
					[151128] = {
						"Lord of Locks", -- [1]
						"Torghast, Tower of the Damned", -- [2]
					},
					[169159] = {
						"Unstable Canister", -- [1]
						"Plaguefall", -- [2]
					},
					[164427] = {
						"Reanimated Warrior", -- [1]
						"The Necrotic Wake", -- [2]
					},
					[164555] = {
						"Millificent Manastorm", -- [1]
						"De Other Side", -- [2]
					},
					[164562] = {
						"Depraved Houndmaster", -- [1]
						"Halls of Atonement", -- [2]
					},
					[173641] = {
						"Nathrian Gargon", -- [1]
						"Castle Nathria", -- [2]
					},
					[167113] = {
						"Spinemaw Acidgullet", -- [1]
						"Mists of Tirna Scithe", -- [2]
					},
					[165067] = {
						"Margore", -- [1]
						"Castle Nathria", -- [2]
					},
					[99541] = {
						"Risen Skulker", -- [1]
						"Mists of Tirna Scithe", -- [2]
					},
					[155221] = {
						"Faeleaf Tender", -- [1]
						"Torghast, Tower of the Damned", -- [2]
					},
					[156244] = {
						"Winged Automaton", -- [1]
						"Torghast, Tower of the Damned", -- [2]
					},
					[164556] = {
						"Millhouse Manastorm", -- [1]
						"De Other Side", -- [2]
					},
					[125436] = {
						"Thu'raya, Mother of the Cosmos", -- [1]
						"Antorus, the Burning Throne", -- [2]
					},
					[169927] = {
						"Putrid Butcher", -- [1]
						"Theater of Pain", -- [2]
					},
					[171333] = {
						"Atal'ai Devoted", -- [1]
						"De Other Side", -- [2]
					},
					[122367] = {
						"Admiral Svirax", -- [1]
						"Antorus, the Burning Throne", -- [2]
					},
					[153879] = {
						"Deadsoul Shadow", -- [1]
						"Torghast, Tower of the Damned", -- [2]
					},
					[168393] = {
						"Plaguebelcher", -- [1]
						"Plaguefall", -- [2]
					},
					[156245] = {
						"Grand Automaton", -- [1]
						"Torghast, Tower of the Damned", -- [2]
					},
					[164557] = {
						"Shard of Halkias", -- [1]
						"Halls of Atonement", -- [2]
					},
					[165260] = {
						"Oozing Leftovers", -- [1]
						"Theater of Pain", -- [2]
					},
					[171772] = {
						"Mistveil Defender", -- [1]
						"Mists of Tirna Scithe", -- [2]
					},
					[155860] = {
						"Shirakess Voidreaper", -- [1]
						"The Eternal Palace", -- [2]
					},
					[124158] = {
						"Imonar the Soulhunter", -- [1]
						"Antorus, the Burning Throne", -- [2]
					},
					[165197] = {
						"Skeletal Monstrosity", -- [1]
						"The Necrotic Wake", -- [2]
					},
					[168394] = {
						"Slimy Morsel", -- [1]
						"Plaguefall", -- [2]
					},
					[125549] = {
						"Hungering Stalker", -- [1]
						"Antorus, the Burning Throne", -- [2]
					},
					[164558] = {
						"Hakkar the Soulflayer", -- [1]
						"De Other Side", -- [2]
					},
					[154011] = {
						"Armed Prisoner", -- [1]
						"Torghast, Tower of the Damned", -- [2]
					},
					[162693] = {
						"Nalthor the Rimebinder", -- [1]
						"The Necrotic Wake", -- [2]
					},
					[126767] = {
						"Clubfist Beastlord", -- [1]
						"Antorus, the Burning Throne", -- [2]
					},
					[167116] = {
						"Spinemaw Reaver", -- [1]
						"Mists of Tirna Scithe", -- [2]
					},
					[166411] = {
						"Forsworn Usurper", -- [1]
						"Spires of Ascension", -- [2]
					},
					[162059] = {
						"Kin-Tara", -- [1]
						"Spires of Ascension", -- [2]
					},
					[168005] = {
						"Empowered Deadsoul Shambler", -- [1]
						"Torghast, Tower of the Damned", -- [2]
					},
					[168907] = {
						"Slime Tentacle", -- [1]
						"Plaguefall", -- [2]
					},
					[167117] = {
						"Spinemaw Larva", -- [1]
						"Mists of Tirna Scithe", -- [2]
					},
					[164815] = {
						"Zolramus Siphoner", -- [1]
						"The Necrotic Wake", -- [2]
					},
					[153885] = {
						"Deadsoul Shambler", -- [1]
						"Torghast, Tower of the Damned", -- [2]
					},
					[121985] = {
						"Flame of Taeshalach", -- [1]
						"Antorus, the Burning Throne", -- [2]
					},
					[151900] = {
						"Horrific Summoner", -- [1]
						"The Eternal Palace", -- [2]
					},
					[168396] = {
						"Plaguebelcher", -- [1]
						"Plaguefall", -- [2]
					},
					[162060] = {
						"Oryphrion", -- [1]
						"Spires of Ascension", -- [2]
					},
					[126333] = {
						"Felseeker Ritualist", -- [1]
						"Antorus, the Burning Throne", -- [2]
					},
					[73967] = {
						"Niuzao", -- [1]
						"The Eternal Palace", -- [2]
					},
					[61056] = {
						"Primal Earth Elemental", -- [1]
						"The Battle for Gilneas", -- [2]
					},
					[171171] = {
						"Mawsworn Archer", -- [1]
						"Torghast, Tower of the Damned", -- [2]
					},
					[168578] = {
						"Fungalmancer", -- [1]
						"Plaguefall", -- [2]
					},
					[157016] = {
						"Imperial Archivist", -- [1]
						"Torghast, Tower of the Damned", -- [2]
					},
					[159190] = {
						"Synod", -- [1]
						"Torghast, Tower of the Damned", -- [2]
					},
					[14465] = {
						"Alliance Battle Standard", -- [1]
						"The Battle for Gilneas", -- [2]
					},
					[153882] = {
						"Deadsoul Spirit", -- [1]
						"Torghast, Tower of the Damned", -- [2]
					},
					[162317] = {
						"Gorechop", -- [1]
						"Theater of Pain", -- [2]
					},
					[167033] = {
						"Putrid Shambler", -- [1]
						"The Necrotic Wake", -- [2]
					},
					[128060] = {
						"Priestess of Delirium", -- [1]
						"Antorus, the Burning Throne", -- [2]
					},
					[36272] = {
						"Apothecary Frye", -- [1]
						"Shadowfang Keep", -- [2]
					},
					[157017] = {
						"Lithic Watcher", -- [1]
						"Torghast, Tower of the Damned", -- [2]
					},
					[168398] = {
						"Slimy Morsel", -- [1]
						"Plaguefall", -- [2]
					},
					[170572] = {
						"Atal'ai Hoodoo Hexxer", -- [1]
						"De Other Side", -- [2]
					},
					[166608] = {
						"Mueh'zala", -- [1]
						"De Other Side", -- [2]
					},
					[155483] = {
						"Faeleaf Shimmerwing", -- [1]
						"Torghast, Tower of the Damned", -- [2]
					},
					[153174] = {
						"Watchers of Death", -- [1]
						"Torghast, Tower of the Damned", -- [2]
					},
					[162051] = {
						"Frenzied Ghoul", -- [1]
						"Sanguine Depths", -- [2]
					},
					[169925] = {
						"Begrudging Waiter", -- [1]
						"Castle Nathria", -- [2]
					},
					[162133] = {
						"General Kaal", -- [1]
						"Sanguine Depths", -- [2]
					},
					[156242] = {
						"Animated Prowler", -- [1]
						"Torghast, Tower of the Damned", -- [2]
					},
					[31216] = {
						"Mirror Image", -- [1]
						"Silvershard Mines", -- [2]
					},
					[164563] = {
						"Vicious Gargon", -- [1]
						"Halls of Atonement", -- [2]
					},
					[105427] = {
						"Skyfury Totem", -- [1]
						"The Battle for Gilneas", -- [2]
					},
					[172803] = {
						"Afterimage of Baroness Frieda", -- [1]
						"Castle Nathria", -- [2]
					},
					[164737] = {
						"Brood Ambusher", -- [1]
						"Plaguefall", -- [2]
					},
					[157340] = {
						"Skeletal Remains", -- [1]
						"Torghast, Tower of the Damned", -- [2]
					},
					[171341] = {
						"Bladebeak Hatchling", -- [1]
						"De Other Side", -- [2]
					},
					[127230] = {
						"Garothi Annihilator", -- [1]
						"Antorus, the Burning Throne", -- [2]
					},
					[125547] = {
						"Feltouched Skitterer", -- [1]
						"Antorus, the Burning Throne", -- [2]
					},
					[153874] = {
						"Mawsworn Sentry", -- [1]
						"Torghast, Tower of the Damned", -- [2]
					},
					[126776] = {
						"Slobbering Fiend", -- [1]
						"Antorus, the Burning Throne", -- [2]
					},
					[166589] = {
						"Animated Weapon", -- [1]
						"Sanguine Depths", -- [2]
					},
					[156239] = {
						"Dark Ascended Corrus", -- [1]
						"Torghast, Tower of the Damned", -- [2]
					},
					[155869] = {
						"Shirakess Shadowcaster", -- [1]
						"The Eternal Palace", -- [2]
					},
					[171342] = {
						"Juvenile Runestag", -- [1]
						"De Other Side", -- [2]
					},
					[168681] = {
						"Forsworn Helion", -- [1]
						"Spires of Ascension", -- [2]
					},
					[169859] = {
						"Observer Zelgar", -- [1]
						"Torghast, Tower of the Damned", -- [2]
					},
					[152852] = {
						"Pashmar the Fanatical", -- [1]
						"The Eternal Palace", -- [2]
					},
					[171173] = {
						"Mawsworn Shadestalker", -- [1]
						"Torghast, Tower of the Damned", -- [2]
					},
					[63508] = {
						"Xuen", -- [1]
						"The Battle for Gilneas", -- [2]
					},
					[168098] = {
						"Empowered Coldheart Agent", -- [1]
						"Torghast, Tower of the Damned", -- [2]
					},
					[168001] = {
						"Empowered Flameforge Enforcer", -- [1]
						"Torghast, Tower of the Damned", -- [2]
					},
					[171343] = {
						"Bladebeak Matriarch", -- [1]
						"De Other Side", -- [2]
					},
					[127231] = {
						"Garothi Decimator", -- [1]
						"Antorus, the Burning Throne", -- [2]
					},
					[156212] = {
						"Coldheart Agent", -- [1]
						"Torghast, Tower of the Damned", -- [2]
					},
					[169196] = {
						"Crimson Cabalist", -- [1]
						"Castle Nathria", -- [2]
					},
					[163520] = {
						"Forsworn Squad-Leader", -- [1]
						"Spires of Ascension", -- [2]
					},
					[65310] = {
						"Turnip Punching Bag", -- [1]
						"Halls of Atonement", -- [2]
					},
					[168099] = {
						"Empowered Coldheart Javelineer", -- [1]
						"Torghast, Tower of the Damned", -- [2]
					},
					[125569] = {
						"Riftworld Assistant", -- [1]
						"Antorus, the Burning Throne", -- [2]
					},
					[164463] = {
						"Paceran the Virulent", -- [1]
						"Theater of Pain", -- [2]
					},
					[61245] = {
						"Capacitor Totem", -- [1]
						"The Battle for Gilneas", -- [2]
					},
					[123532] = {
						"Dark Keeper", -- [1]
						"Antorus, the Burning Throne", -- [2]
					},
					[164567] = {
						"Ingra Maloch", -- [1]
						"Mists of Tirna Scithe", -- [2]
					},
					[163457] = {
						"Forsworn Vanguard", -- [1]
						"Spires of Ascension", -- [2]
					},
					[167892] = {
						"Tormented Soul", -- [1]
						"Halls of Atonement", -- [2]
					},
					[157583] = {
						"Forge Keeper", -- [1]
						"Torghast, Tower of the Damned", -- [2]
					},
					[166969] = {
						"Baroness Frieda", -- [1]
						"Castle Nathria", -- [2]
					},
					[173613] = {
						"Nathrian Registrar", -- [1]
						"Castle Nathria", -- [2]
					},
					[153059] = {
						"Aethanel", -- [1]
						"The Eternal Palace", -- [2]
					},
					[162103] = {
						"Executor Tarvold", -- [1]
						"Sanguine Depths", -- [2]
					},
					[165919] = {
						"Skeletal Marauder", -- [1]
						"The Necrotic Wake", -- [2]
					},
					[169912] = {
						"Enraged Mask", -- [1]
						"De Other Side", -- [2]
					},
					[157584] = {
						"Flameforge Master", -- [1]
						"Torghast, Tower of the Damned", -- [2]
					},
					[173136] = {
						"Blightsmasher", -- [1]
						"Torghast, Tower of the Damned", -- [2]
					},
					[155873] = {
						"Darkcast Annihilator", -- [1]
						"The Eternal Palace", -- [2]
					},
					[164185] = {
						"Echelon", -- [1]
						"Halls of Atonement", -- [2]
					},
					[153060] = {
						"Cyranus", -- [1]
						"The Eternal Palace", -- [2]
					},
					[95072] = {
						"Greater Earth Elemental", -- [1]
						"The Battle for Gilneas", -- [2]
					},
					[126558] = {
						"Antoran Felguard", -- [1]
						"Antorus, the Burning Throne", -- [2]
					},
					[162039] = {
						"Wicked Oppressor", -- [1]
						"Sanguine Depths", -- [2]
					},
					[170147] = {
						"Volatile Memory", -- [1]
						"De Other Side", -- [2]
					},
					[168022] = {
						"Slime Tentacle", -- [1]
						"Plaguefall", -- [2]
					},
					[169173] = {
						"Meatball's Tormentor", -- [1]
						"Torghast, Tower of the Damned", -- [2]
					},
					[169905] = {
						"Risen Warlord", -- [1]
						"De Other Side", -- [2]
					},
					[127233] = {
						"Flameweaver", -- [1]
						"Antorus, the Burning Throne", -- [2]
					},
					[164862] = {
						"Weald Shimmermoth", -- [1]
						"De Other Side", -- [2]
					},
					[164857] = {
						"Spriggan Mendbender", -- [1]
						"De Other Side", -- [2]
					},
					[164451] = {
						"Dessia the Decapitator", -- [1]
						"Theater of Pain", -- [2]
					},
					[155619] = {
						"Zanj'ir Honor Guard", -- [1]
						"The Eternal Palace", -- [2]
					},
					[174161] = {
						"Lady Sinsear", -- [1]
						"Castle Nathria", -- [2]
					},
					[170197] = {
						"Conjured Manifestation", -- [1]
						"Castle Nathria", -- [2]
					},
					[169753] = {
						"Famished Tick", -- [1]
						"Sanguine Depths", -- [2]
					},
					[167955] = {
						"Sanguine Cadet", -- [1]
						"Sanguine Depths", -- [2]
					},
					[167949] = {
						"Plague-Ridden Survivor", -- [1]
						"Plaguefall", -- [2]
					},
					[165594] = {
						"Coldheart Ambusher", -- [1]
						"Torghast, Tower of the Damned", -- [2]
					},
					[175091] = {
						"Necrotic Droplet", -- [1]
						"The Necrotic Wake", -- [2]
					},
					[164464] = {
						"Xira the Underhanded", -- [1]
						"Theater of Pain", -- [2]
					},
					[174162] = {
						"Countess Gloomveil", -- [1]
						"Castle Nathria", -- [2]
					},
					[157810] = {
						"Mawsworn Endbringer", -- [1]
						"Torghast, Tower of the Damned", -- [2]
					},
					[155824] = {
						"Lumbering Creation", -- [1]
						"Torghast, Tower of the Damned", -- [2]
					},
					[155831] = {
						"Mawsworn Soulbinder", -- [1]
						"Torghast, Tower of the Damned", -- [2]
					},
					[157083] = {
						"Stonewing Ravager", -- [1]
						"Torghast, Tower of the Damned", -- [2]
					},
					[157094] = {
						"Imperial Curator", -- [1]
						"Torghast, Tower of the Damned", -- [2]
					},
					[170838] = {
						"Unyielding Contender", -- [1]
						"Theater of Pain", -- [2]
					},
					[123398] = {
						"Garothi Annihilator", -- [1]
						"Antorus, the Burning Throne", -- [2]
					},
					[170071] = {
						"Mawsworn Shadestalker", -- [1]
						"Torghast, Tower of the Damned", -- [2]
					},
					[168153] = {
						"Plagueroc", -- [1]
						"Plaguefall", -- [2]
					},
					[162744] = {
						"Nekthara the Mangler", -- [1]
						"Theater of Pain", -- [2]
					},
					[153064] = {
						"Overzealous Hulk", -- [1]
						"The Eternal Palace", -- [2]
					},
					[127810] = {
						"Slobbering Fiend", -- [1]
						"Antorus, the Burning Throne", -- [2]
					},
					[171432] = {
						"Suppressor Hersi", -- [1]
						"Torghast, Tower of the Damned", -- [2]
					},
					[170228] = {
						"Bone Husk", -- [1]
						"Torghast, Tower of the Damned", -- [2]
					},
				},
				["indicator_worldboss"] = false,
				["aura_width2"] = 16,
				["aura_show_crowdcontrol"] = true,
				["health_cutoff"] = false,
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
				["health_statusbar_texture"] = "Minimalist",
				["hook_auto_imported"] = {
					["Reorder Nameplate"] = 4,
					["Dont Have Aura"] = 1,
					["Players Targetting Amount"] = 4,
					["Color Automation"] = 1,
					["Hide Neutral Units"] = 1,
					["Cast Bar Icon Config"] = 2,
					["Aura Reorder"] = 3,
					["Combo Points"] = 4,
					["Extra Border"] = 2,
					["Target Color"] = 3,
					["Execute Range"] = 1,
					["Attacking Specific Unit"] = 1,
				},
				["aura_frame1_anchor"] = {
					["y"] = 2,
				},
				["indicator_rare"] = false,
				["extra_icon_stack_font"] = "Expressway",
				["cast_statusbar_bgtexture"] = "Minimalist",
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
					["nameplateShowFriendlyMinions"] = "0",
					["nameplateShowAll"] = "1",
					["ShowNamePlateLoseAggroFlash"] = "1",
					["nameplateShowFriendlyGuardians"] = "0",
					["nameplateTargetBehindMaxDistance"] = "30",
					["NamePlateHorizontalScale"] = "1",
					["nameplateShowEnemies"] = "1",
					["nameplatePersonalHideDelaySeconds"] = "0.2",
					["NamePlateVerticalScale"] = "1",
				},
				["login_counter"] = 1811,
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
					["global_health_width"] = 120,
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
						["health_incombat"] = {
							nil, -- [1]
							14, -- [2]
						},
						["health"] = {
							120, -- [1]
							14, -- [2]
						},
						["actorname_text_size"] = 9,
						["big_actorname_text_font"] = "Expressway",
						["percent_show_health"] = false,
						["spellname_text_size"] = 9,
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
						["health_incombat"] = {
							nil, -- [1]
							14, -- [2]
						},
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
						["spellname_text_size"] = 9,
						["level_text_enabled"] = false,
					},
					["player"] = {
						["spellpercent_text_font"] = "Expressway",
						["power_percent_text_font"] = "Expressway",
						["spellname_text_font"] = "Expressway",
					},
				},
				["aura_y_offset"] = 2,
				["cast_statusbar_bgcolor"] = {
					0.05882352941176471, -- [1]
					0.05882352941176471, -- [2]
					0.05882352941176471, -- [3]
					0.800000011920929, -- [4]
				},
				["bossmod_aura_width"] = 30,
				["indicator_scale"] = 1.100000023841858,
				["castbar_icon_size"] = "same as castbar plus healthbar",
				["bossmod_cooldown_text_size"] = 15,
				["hook_data"] = {
					{
						["Enabled"] = true,
						["Revision"] = 43,
						["Options"] = {
						},
						["HooksTemp"] = {
						},
						["Author"] = "Luckyone-Laughing Skull",
						["OptionsValues"] = {
						},
						["Desc"] = "",
						["Hooks"] = {
							["Nameplate Updated"] = "function (self, unitId, unitFrame, envTable)\n    local unitName = UnitName(unitId)\n    \n    -- Show First Name [Whitelist table]\n    local firstName = {}\n    \n    -- Show Full Name [Whitelist table]\n    local fullName = {\n        [3527] = true, -- Healing Stream Totem\n        [2630] = true, -- Earthbind Totem\n        [61245] = true, -- Capacitor Totem\n        [5925] = true, -- Grounding Totem\n        [105451] = true, -- Counterstrike Totem\n        [105427] = true, -- Skyfury Totem\n        [97369] = true, -- Liquid Magma Totem\n    }\n    \n    if (unitName) then\n        local  a ,b, c ,d ,e ,f = strsplit(' ', unitName, 5)\n        \n        if firstName [unitFrame.namePlateNpcId] then\n            unitFrame.healthBar.unitName:SetText(a)\n        elseif fullName[unitFrame.namePlateNpcId] then\n            unitFrame.healthBar.unitName:SetText(unitName)\n        else\n            unitFrame.healthBar.unitName:SetText(f or e or d or c or b or a)\n        end\n    end\nend",
						},
						["Prio"] = 1,
						["Name"] = "Custom Name",
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
						["LastHookEdited"] = "Nameplate Updated",
						["Time"] = 1612740503,
						["Icon"] = "INTERFACE\\ICONS\\Ability_Argus_DeathFog",
						["PlaterCore"] = 1,
					}, -- [1]
					{
						["Enabled"] = true,
						["Revision"] = 37,
						["Options"] = {
						},
						["HooksTemp"] = {
						},
						["Author"] = "Luckyone-Laughing Skull",
						["OptionsValues"] = {
						},
						["Desc"] = "",
						["Hooks"] = {
							["Nameplate Updated"] = "function (self, unitId, unitFrame, envTable)\n    \n    local color = envTable.NpcColors [unitFrame.namePlateUnitNameLower] or envTable.NpcColors [unitFrame.namePlateUnitName] or envTable.NpcColors [unitFrame.namePlateNpcId]\n    \n    if (color) then\n        Plater.SetNameplateColor (unitFrame, color)\n    end\n    \nend",
							["Constructor"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.NpcColors = {\n        -- De Other Side [DOS]\n        [164857] = \"#00fbff\",\n        [167965] = \"#00fbff\",\n        [168934] = \"#00fbff\",\n        [168942] = \"#00fbff\",\n        [169905] = \"#00fbff\",\n        [170572] = \"#00fbff\",\n        [171343] = \"#00fbff\",\n        -- Halls of Atonement [HOA]\n        [164562] = \"#00fbff\",\n        [165529] = \"#00fbff\",\n        [167612] = \"#00fbff\",\n        [167892] = \"#00fbff\",\n        -- Mists of Tirna Scithe [MISTS]\n        [164804] = \"#00fbff\",\n        [164921] = \"#00fbff\",\n        [166299] = \"#00fbff\",\n        [167111] = \"#00fbff\",\n        -- The Necrotic Wake [NW]\n        [163618] = \"#00fbff\",\n        [165824] = \"#00fbff\",\n        [165872] = \"#00fbff\",\n        [166302] = \"#00fbff\",\n        [173016] = \"#00fbff\",\n        -- Plaguefall [PF]\n        [163882] = \"#00fbff\",\n        [163894] = \"#00fbff\",\n        [164737] = \"#00fbff\",\n        [168572] = \"#00fbff\",\n        [168627] = \"#00fbff\",\n        [169861] = \"#00fbff\",\n        -- Sanguine Depths [SD]\n        [162038] = \"#00fbff\",\n        [162040] = \"#00fbff\",\n        [162057] = \"#00fbff\",\n        [171376] = \"#00fbff\",\n        [171799] = \"#00fbff\",\n        -- Spires of Ascension [SOA]\n        [163459] = \"#00fbff\",\n        [163520] = \"#00fbff\",\n        [168318] = \"#00fbff\",\n        [168681] = \"#00fbff\",\n        -- Theater of Pain [TOP]\n        [160495] = \"#00fbff\",\n        [164506] = \"#00fbff\",\n        [170850] = \"#00fbff\",\n        [174210] = \"#00fbff\",\n        -- Others\n    }\n    \nend",
						},
						["Prio"] = 1,
						["Name"] = "Custom Bar Color",
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
						["LastHookEdited"] = "",
						["Time"] = 1612572888,
						["Icon"] = "INTERFACE\\ICONS\\Ability_Argus_EdgeOfObliteration",
						["PlaterCore"] = 1,
					}, -- [2]
					{
						["Enabled"] = true,
						["Revision"] = 14,
						["Options"] = {
						},
						["HooksTemp"] = {
						},
						["Author"] = "Luckyone-Laughing Skull",
						["OptionsValues"] = {
						},
						["Desc"] = "",
						["Hooks"] = {
							["Nameplate Removed"] = "function (self, unitId, unitFrame, envTable, modTable)\n    envTable.UpdateBorder (unitFrame, false)\nend",
							["Cast Start"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.UpdateIconPosition (unitFrame)\n    envTable.UpdateBorder (unitFrame, true)\n    \nend",
							["Cast Update"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.UpdateIconPosition (unitFrame)\n    \nend",
							["Constructor"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.ShowIcon = Plater.db.profile.castbar_icon_show\n    envTable.IconAnchor = \"left\"\n    envTable.IconSizeOffset = 0\n    \n    envTable.ShowShield = false\n    envTable.ShieldTexture = [[Interface\\GROUPFRAME\\UI-GROUP-MAINTANKICON]]\n    envTable.ShieldDesaturated = true\n    envTable.ShieldColor = {1, 1, 1 ,1}\n    envTable.ShieldSize = {10, 12}\n    \n    function envTable.UpdateIconPosition (unitFrame)\n        local castBar = unitFrame.castBar\n        local icon = castBar.Icon\n        local shield = castBar.BorderShield\n        \n        if (envTable.ShowIcon) then\n            icon:ClearAllPoints()\n            \n            if (envTable.IconAnchor == \"left\") then\n                icon:SetPoint (\"topright\", unitFrame.healthBar, \"topleft\", 0, envTable.IconSizeOffset)\n                icon:SetPoint (\"bottomright\", unitFrame.castBar, \"bottomleft\", 0, 0)    \n                \n            elseif (envTable.IconAnchor == \"right\") then\n                icon:SetPoint (\"topleft\", unitFrame.healthBar, \"topright\", 0, envTable.IconSizeOffset)\n                icon:SetPoint (\"bottomleft\", unitFrame.castBar, \"bottomright\", 0, 0)\n                \n            end\n            \n            icon:SetWidth (icon:GetHeight())\n            icon:Show()\n            \n        else\n            icon:Hide()\n            \n        end\n        \n        if (envTable.ShowShield and not castBar.canInterrupt) then\n            shield:Show()\n            shield:SetAlpha (1)\n            shield:SetTexCoord (0, 1, 0, 1)\n            shield:SetVertexColor (1, 1, 1, 1)\n            \n            shield:SetTexture (envTable.ShieldTexture)\n            shield:SetDesaturated (envTable.ShieldDesaturated)\n            \n            if (not envTable.ShieldDesaturated) then\n                shield:SetVertexColor (DetailsFramework:ParseColors (envTable.ShieldColor))\n            end\n            \n            shield:SetSize (unpack (envTable.ShieldSize))\n            \n            shield:ClearAllPoints()\n            shield:SetPoint (\"center\", castBar, \"left\", 0, 0)\n            \n        else\n            shield:Hide()\n            \n        end\n        \n    end\n    \n    function envTable.UpdateBorder (unitFrame, casting)\n        local healthBar = unitFrame.healthBar\n        local castBar = unitFrame.castBar\n        \n        if casting then\n            if envTable.ShowIcon and castBar.Icon:IsShown() then\n                if envTable.IconAnchor == \"left\" then\n                    healthBar.border:SetPoint(\"TOPLEFT\", castBar.Icon, \"TOPLEFT\", 0, 0)\n                    healthBar.border:SetPoint(\"BOTTOMRIGHT\", castBar, \"BOTTOMRIGHT\", 0, 0)\n                elseif envTable.IconAnchor == \"right\" then\n                    healthBar.border:SetPoint(\"TOPRIGHT\", castBar.Icon, \"TOPRIGHT\", 0, 0)\n                    healthBar.border:SetPoint(\"BOTTOMLEFT\", castBar, \"BOTTOMLEFT\", 0, 0) \n                end\n            else\n                if envTable.IconAnchor == \"left\" then\n                    healthBar.border:SetPoint(\"TOPLEFT\", healthBar, \"TOPLEFT\", 0, 0)\n                    healthBar.border:SetPoint(\"BOTTOMRIGHT\", castBar, \"BOTTOMRIGHT\", 0, 0)\n                elseif envTable.IconAnchor == \"right\" then\n                    healthBar.border:SetPoint(\"TOPRIGHT\", healthBar, \"TOPRIGHT\", 0, 0)\n                    healthBar.border:SetPoint(\"BOTTOMLEFT\", castBar, \"BOTTOMLEFT\", 0, 0) \n                end\n            end\n        else\n            if envTable.IconAnchor == \"left\" then\n                healthBar.border:SetPoint(\"TOPLEFT\", healthBar, \"TOPLEFT\", 0, 0)\n                healthBar.border:SetPoint(\"BOTTOMRIGHT\", healthBar, \"BOTTOMRIGHT\", 0, 0)\n            elseif envTable.IconAnchor == \"right\" then\n                healthBar.border:SetPoint(\"TOPRIGHT\", healthBar, \"TOPRIGHT\", 0, 0)\n                healthBar.border:SetPoint(\"BOTTOMLEFT\", healthBar, \"BOTTOMLEFT\", 0, 0) \n            end\n        end\n    end\n    \n    if not unitFrame.castBar.borderChangeHooked then\n        hooksecurefunc(unitFrame.castBar, \"Hide\", function() envTable.UpdateBorder(unitFrame, false) end)\n        unitFrame.castBar.borderChangeHooked = true\n    end\n    \nend",
						},
						["Prio"] = 1,
						["Name"] = "Custom Castbar",
						["PlaterCore"] = 1,
						["LastHookEdited"] = "Constructor",
						["Time"] = 1613418799,
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
							["race"] = {
							},
							["affix"] = {
							},
							["encounter_ids"] = {
							},
							["spec"] = {
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
				["ui_parent_scale_tune"] = 1.299999952316284,
				["health_statusbar_bgtexture"] = "Minimalist",
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
						[333737] = true,
						[322773] = true,
						[226510] = true,
						[333241] = true,
						[336499] = true,
						[178658] = true,
						[326892] = true,
						[322433] = true,
						[321402] = true,
						[327416] = true,
						[333227] = true,
						[209859] = true,
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
				["aura2_x_offset"] = 0,
				["indicator_extra_raidmark"] = false,
				["indicator_spec"] = false,
				["use_ui_parent"] = true,
				["extra_icon_timer_font"] = "Expressway",
				["indicator_elite"] = false,
				["target_highlight_alpha"] = 1,
				["health_cutoff_upper"] = false,
				["target_highlight_height"] = 10,
				["health_selection_overlay"] = "Solid",
				["cast_statusbar_use_fade_effects"] = false,
				["extra_icon_timer_outline"] = "OUTLINE",
				["patch_version"] = 13,
				["range_check_in_range_or_target_alpha"] = 1,
				["aura_timer_text_size"] = 10,
				["number_region_first_run"] = true,
				["script_data_trash"] = {
					{
						["ConstructorCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    --insert code here\n    \n    --check for marks\n    function  envTable.CheckMark (unitId, unitFrame)\n        if (not GetRaidTargetIndex(unitId)) then\n            if (scriptTable.config.onlyInCombat) then\n                if (not UnitAffectingCombat(unitId)) then\n                    return\n                end                \n            end\n            \n            SetRaidTarget(unitId, 8)\n        end       \n    end\nend\n\n\n--163520 - forsworn squad-leader\n--163618 - zolramus necromancer - The Necrotic Wake\n--164506 - anciet captain - theater of pain\n\n\n",
						["OnHideCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    --insert code here\n    \nend\n\n\n",
						["OptionsValues"] = {
						},
						["Temp_OnShowCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    --insert code here\n    envTable.CheckMark (unitId, unitFrame)\nend\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n",
						["ScriptType"] = 3,
						["UpdateCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    --insert code here\n    envTable.CheckMark (unitId, unitFrame)\nend\n\n\n",
						["Time"] = 1604696441,
						["__TrashAt"] = 1616002253,
						["url"] = "",
						["NpcNames"] = {
							"163520", -- [1]
							"163618", -- [2]
							"164506", -- [3]
						},
						["Temp_Initialization"] = "function (scriptTable)\n    --insert code here\n    \nend\n\n\n",
						["Enabled"] = false,
						["Revision"] = 63,
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
						["Temp_OnHideCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    --insert code here\n    \nend\n\n\n",
						["Temp_ConstructorCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    --insert code here\n    \n    --check for marks\n    function  envTable.CheckMark (unitId, unitFrame)\n        if (not GetRaidTargetIndex(unitId)) then\n            if (scriptTable.config.onlyInCombat) then\n                if (not UnitAffectingCombat(unitId)) then\n                    return\n                end                \n            end\n            \n            SetRaidTarget(unitId, 8)\n        end       \n    end\nend\n\n\n--163520 - forsworn squad-leader\n--163618 - zolramus necromancer - The Necrotic Wake\n--164506 - anciet captain - theater of pain\n\n\n",
						["Author"] = "Aelerolor-Torghast",
						["Initialization"] = "function (scriptTable)\n    --insert code here\n    \nend\n\n\n",
						["Desc"] = "Auto set skull marker",
						["Name"] = "Auto Set Skull",
						["Temp_UpdateCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    --insert code here\n    envTable.CheckMark (unitId, unitFrame)\nend\n\n\n",
						["version"] = -1,
						["PlaterCore"] = 1,
						["OnShowCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    --insert code here\n    envTable.CheckMark (unitId, unitFrame)\nend\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n",
						["Icon"] = "Interface\\Worldmap\\GlowSkull_64Grey",
						["semver"] = "",
						["SpellIds"] = {
						},
					}, -- [1]
					{
						["ConstructorCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    --insert code here\n    \n    if (not unitFrame.spitefulTexture) then\n        unitFrame.spitefulTexture = unitFrame.healthBar:CreateTexture(nil, \"overlay\", nil, 6)\n        unitFrame.spitefulTexture:SetPoint('center', 0, 0)\n        unitFrame.spitefulTexture:SetSize(27, 14)\n        unitFrame.spitefulTexture:SetColorTexture(.3, .3, 1, .7)\n        \n        unitFrame.spitefulText = unitFrame.healthBar:CreateFontString(nil, \"overlay\", \"GameFontNormal\", 6)\n        DetailsFramework:SetFontFace (unitFrame.spitefulText, \"2002\")\n        unitFrame.spitefulText:SetPoint(\"center\", unitFrame.spitefulTexture, \"right\", -2, 0)\n        unitFrame.spitefulText:SetJustifyH(\"center\")\n        \n        unitFrame.roleIcon = unitFrame:CreateTexture(nil, \"overlay\")\n        unitFrame.roleIcon:SetPoint(\"left\", unitFrame.healthBar, \"left\", 2, 0)\n        unitFrame.targetName = unitFrame:CreateFontString(nil, \"overlay\", \"GameFontNormal\")\n        unitFrame.targetName:SetPoint(\"left\", unitFrame.roleIcon, \"right\", 2, 0)\n        \n        unitFrame.spitefulTexture:Hide()\n        unitFrame.spitefulText:Hide()\n    end\n    \n    function envTable.UpdateSpitefulWidget(unitFrame)\n        \n        local r, g, b, a = Plater:ParseColors(scriptTable.config.bgColor)\n        unitFrame.spitefulTexture:SetColorTexture(r, g, b, a)\n        unitFrame.spitefulTexture:SetSize(scriptTable.config.bgWidth, unitFrame.healthBar:GetHeight())   \n        Plater:SetFontSize(unitFrame.spitefulText, scriptTable.config.textSize)\n        Plater:SetFontColor(unitFrame.spitefulText, scriptTable.config.textColor)\n        \n        local currentHealth = unitFrame.healthBar.CurrentHealth\n        local maxHealth = unitFrame.healthBar.CurrentHealthMax\n        \n        local healthPercent = currentHealth / maxHealth * 100\n        local timeToDie = format(\"%.1fs\", healthPercent / 8)\n        unitFrame.spitefulText:SetText(timeToDie)\n        \n        unitFrame.spitefulText:Show()\n        unitFrame.spitefulTexture:Show()\n        \n        if scriptTable.config.switchTargetName then\n            local plateFrame = unitFrame.PlateFrame\n            \n            local target = UnitName(unitFrame.namePlateUnitToken .. \"target\") or UnitName(unitFrame.namePlateUnitToken)\n            \n            if (target and target ~= \"\") then\n                local _, class = UnitClass(unitFrame.namePlateUnitToken .. \"target\")\n                if (class) then\n                    target = DetailsFramework:AddClassColorToText(target, class)\n                end\n                \n                local role = UnitGroupRolesAssigned(unitFrame.namePlateUnitToken .. \"target\")\n                if (role and role ~= \"NONE\") then\n                    target = DetailsFramework:AddRoleIconToText(target, role)\n                end\n                \n                plateFrame.namePlateUnitName = target\n                Plater.UpdateUnitName(plateFrame)\n            end\n        end\n        \n        if scriptTable.config.useTargetingColor then\n            local targeted = UnitIsUnit(unitFrame.namePlateUnitToken .. \"target\", \"player\")\n            if targeted then\n                Plater.SetNameplateColor (unitFrame, scriptTable.config.targetingColor)\n            else\n                Plater.RefreshNameplateColor(unitFrame)\n            end\n        end\n    end\nend",
						["OnHideCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    --insert code here\n    if (unitFrame.spitefulTexture) then\n        unitFrame.spitefulText:Hide()\n        unitFrame.spitefulTexture:Hide()    \n        unitFrame.roleIcon:Hide()\n        unitFrame.targetName:Hide()\n    end\nend\n\n\n\n\n\n",
						["OptionsValues"] = {
						},
						["Temp_OnShowCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    --insert code here\n    envTable.UpdateSpitefulWidget(unitFrame)\nend\n\n\n",
						["ScriptType"] = 3,
						["UpdateCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    --insert code here\n    envTable.UpdateSpitefulWidget(unitFrame)\nend\n\n\n",
						["Time"] = 1616002224,
						["__TrashAt"] = 1616002286,
						["Temp_Initialization"] = "function (scriptTable)\n    --insert code here\n    \nend\n\n\n",
						["url"] = "",
						["Icon"] = 135945,
						["Temp_ConstructorCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    --insert code here\n    \n    if (not unitFrame.spitefulTexture) then\n        unitFrame.spitefulTexture = unitFrame.healthBar:CreateTexture(nil, \"overlay\", nil, 6)\n        unitFrame.spitefulTexture:SetPoint('center', 0, 0)\n        unitFrame.spitefulTexture:SetSize(27, 14)\n        unitFrame.spitefulTexture:SetColorTexture(.3, .3, 1, .7)\n        \n        unitFrame.spitefulText = unitFrame.healthBar:CreateFontString(nil, \"overlay\", \"GameFontNormal\", 6)\n        DetailsFramework:SetFontFace (unitFrame.spitefulText, \"2002\")\n        unitFrame.spitefulText:SetPoint(\"center\", unitFrame.spitefulTexture, \"right\", -2, 0)\n        unitFrame.spitefulText:SetJustifyH(\"center\")\n        \n        unitFrame.roleIcon = unitFrame:CreateTexture(nil, \"overlay\")\n        unitFrame.roleIcon:SetPoint(\"left\", unitFrame.healthBar, \"left\", 2, 0)\n        unitFrame.targetName = unitFrame:CreateFontString(nil, \"overlay\", \"GameFontNormal\")\n        unitFrame.targetName:SetPoint(\"left\", unitFrame.roleIcon, \"right\", 2, 0)\n        \n        unitFrame.spitefulTexture:Hide()\n        unitFrame.spitefulText:Hide()\n    end\n    \n    function envTable.UpdateSpitefulWidget(unitFrame)\n        \n        local r, g, b, a = Plater:ParseColors(scriptTable.config.bgColor)\n        unitFrame.spitefulTexture:SetColorTexture(r, g, b, a)\n        unitFrame.spitefulTexture:SetSize(scriptTable.config.bgWidth, unitFrame.healthBar:GetHeight())   \n        Plater:SetFontSize(unitFrame.spitefulText, scriptTable.config.textSize)\n        Plater:SetFontColor(unitFrame.spitefulText, scriptTable.config.textColor)\n        \n        local currentHealth = unitFrame.healthBar.CurrentHealth\n        local maxHealth = unitFrame.healthBar.CurrentHealthMax\n        \n        local healthPercent = currentHealth / maxHealth * 100\n        local timeToDie = format(\"%.1fs\", healthPercent / 8)\n        unitFrame.spitefulText:SetText(timeToDie)\n        \n        unitFrame.spitefulText:Show()\n        unitFrame.spitefulTexture:Show()\n        \n        if scriptTable.config.switchTargetName then\n            local plateFrame = unitFrame.PlateFrame\n            \n            local target = UnitName(unitFrame.namePlateUnitToken .. \"target\") or UnitName(unitFrame.namePlateUnitToken)\n            \n            if (target and target ~= \"\") then\n                local _, class = UnitClass(unitFrame.namePlateUnitToken .. \"target\")\n                if (class) then\n                    target = DetailsFramework:AddClassColorToText(target, class)\n                end\n                \n                local role = UnitGroupRolesAssigned(unitFrame.namePlateUnitToken .. \"target\")\n                if (role and role ~= \"NONE\") then\n                    target = DetailsFramework:AddRoleIconToText(target, role)\n                end\n                \n                plateFrame.namePlateUnitName = target\n                Plater.UpdateUnitName(plateFrame)\n            end\n        end\n        \n        if scriptTable.config.useTargetingColor then\n            local targeted = UnitIsUnit(unitFrame.namePlateUnitToken .. \"target\", \"player\")\n            if targeted then\n                Plater.SetNameplateColor (unitFrame, scriptTable.config.targetingColor)\n            else\n                Plater.RefreshNameplateColor(unitFrame)\n            end\n        end\n    end\nend",
						["Temp_OnHideCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    --insert code here\n    if (unitFrame.spitefulTexture) then\n        unitFrame.spitefulText:Hide()\n        unitFrame.spitefulTexture:Hide()    \n        unitFrame.roleIcon:Hide()\n        unitFrame.targetName:Hide()\n    end\nend\n\n\n\n\n\n",
						["Revision"] = 199,
						["semver"] = "",
						["NpcNames"] = {
							"174773", -- [1]
						},
						["Prio"] = 99,
						["Author"] = "Symantec-Azralon",
						["Initialization"] = "function (scriptTable)\n    --insert code here\n    \nend\n\n\n",
						["Desc"] = "Time to die Spiteful affix",
						["version"] = -1,
						["Temp_UpdateCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    --insert code here\n    envTable.UpdateSpitefulWidget(unitFrame)\nend\n\n\n",
						["SpellIds"] = {
						},
						["PlaterCore"] = 1,
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
								["Name"] = "Width",
								["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
								["Key"] = "bgWidth",
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
								["Name"] = "Text Size",
								["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
								["Key"] = "textSize",
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
						["Enabled"] = true,
						["Name"] = "M+ Spiteful",
					}, -- [2]
				},
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
					["Fixate On You"] = 11,
					["Spiteful Affix"] = 3,
					["Unit - Show Energy"] = 11,
				},
				["cast_statusbar_texture"] = "Minimalist",
				["indicator_faction"] = false,
				["first_run3"] = true,
				["indicator_pet"] = false,
				["aura_timer_text_font"] = "Expressway",
				["cast_statusbar_color_interrupted"] = {
					0.3019607843137255, -- [1]
					0.3019607843137255, -- [2]
					0.3019607843137255, -- [3]
				},
			},
		},
	}

end
