local L1UI, E, L, V, P, G = unpack(select(2, ...))

local IsAddOnLoaded = IsAddOnLoaded

-- Update Layout Buttons (Ingame Config)
if L1UI.Retail then

	function L1UI:UpdateLayout(layout)

		-- Shadow & Light changes
		if IsAddOnLoaded('ElvUI_SLE') then L1UI:Get_ShadowAndLight_Profile() end

		-- ActionBar changes
		E.db["actionbar"]["bar1"]["alpha"] = 1
		E.db["actionbar"]["bar2"]["alpha"] = 1
		E.db["actionbar"]["bar3"]["alpha"] = 1
		E.db["actionbar"]["bar4"]["alpha"] = 1
		E.db["actionbar"]["bar5"]["alpha"] = 1
		E.db["actionbar"]["bar6"]["alpha"] = 1
		E.db["actionbar"]["bar7"]["alpha"] = 1
		E.db["actionbar"]["bar8"]["alpha"] = 1
		E.db["actionbar"]["bar9"]["alpha"] = 1
		E.db["actionbar"]["bar10"]["alpha"] = 1
		E.db["actionbar"]["barPet"]["alpha"] = 1
		E.db["actionbar"]["extraActionButton"]["alpha"] = 1
		E.db["actionbar"]["zoneActionButton"]["alpha"] = 1

		-- Custom Text: Focus
		E.db["unitframe"]["units"]["focus"]["customTexts"]["Luckyone_Name"]["justifyH"] = "CENTER"
		E.db["unitframe"]["units"]["focus"]["customTexts"]["Luckyone_Name"]["xOffset"] = 0
		E.db["unitframe"]["units"]["focus"]["customTexts"]["Luckyone_Power"]["justifyH"] = "LEFT"
		E.db["unitframe"]["units"]["focus"]["customTexts"]["Luckyone_Power"]["xOffset"] = 1

		-- Custom Text: Player
		E.db["unitframe"]["units"]["player"]["customTexts"]["Luckyone_Level"]["justifyH"] = "LEFT"
		E.db["unitframe"]["units"]["player"]["customTexts"]["Luckyone_Level"]["xOffset"] = 1
		E.db["unitframe"]["units"]["player"]["customTexts"]["Luckyone_Name"]["justifyH"] = "CENTER"
		E.db["unitframe"]["units"]["player"]["customTexts"]["Luckyone_Name"]["text_format"] = "[classcolor][name]"
		E.db["unitframe"]["units"]["player"]["customTexts"]["Luckyone_Name"]["xOffset"] = 0
		E.db["unitframe"]["units"]["player"]["customTexts"]["Luckyone_Power"]["justifyH"] = "RIGHT"

		-- Custom Text: Target
		E.db["unitframe"]["units"]["target"]["customTexts"]["Luckyone_Name"]["justifyH"] = "CENTER"
		E.db["unitframe"]["units"]["target"]["customTexts"]["Luckyone_Name"]["xOffset"] = 0
		E.db["unitframe"]["units"]["target"]["customTexts"]["Luckyone_Power"]["justifyH"] = "LEFT"
		E.db["unitframe"]["units"]["target"]["customTexts"]["Luckyone_Power"]["xOffset"] = 1

		if layout == 'dps' then
			-- DPS/TANK db changes
		elseif layout == 'healer' then
			-- Healing db changes
		end

		E:StaggeredUpdateAll()
	end

elseif L1UI.TBC then

	function L1UI:UpdateLayout(layout)

		-- ActionBar changes
		E.db["actionbar"]["bar1"]["alpha"] = 1
		E.db["actionbar"]["bar2"]["alpha"] = 1
		E.db["actionbar"]["bar3"]["alpha"] = 1
		E.db["actionbar"]["bar4"]["alpha"] = 1
		E.db["actionbar"]["bar5"]["alpha"] = 1
		E.db["actionbar"]["bar6"]["alpha"] = 1
		E.db["actionbar"]["bar7"]["alpha"] = 1
		E.db["actionbar"]["bar8"]["alpha"] = 1
		E.db["actionbar"]["bar9"]["alpha"] = 1
		E.db["actionbar"]["bar10"]["alpha"] = 1
		E.db["actionbar"]["barPet"]["alpha"] = 1

		-- Custom Text: Focus
		E.db["unitframe"]["units"]["focus"]["customTexts"]["Luckyone_Name"]["justifyH"] = "CENTER"
		E.db["unitframe"]["units"]["focus"]["customTexts"]["Luckyone_Name"]["xOffset"] = 0
		E.db["unitframe"]["units"]["focus"]["customTexts"]["Luckyone_Power"]["justifyH"] = "LEFT"
		E.db["unitframe"]["units"]["focus"]["customTexts"]["Luckyone_Power"]["xOffset"] = 1

		-- Custom Text: Player
		E.db["unitframe"]["units"]["player"]["customTexts"]["Luckyone_Level"]["justifyH"] = "LEFT"
		E.db["unitframe"]["units"]["player"]["customTexts"]["Luckyone_Level"]["xOffset"] = 1
		E.db["unitframe"]["units"]["player"]["customTexts"]["Luckyone_Name"]["justifyH"] = "CENTER"
		E.db["unitframe"]["units"]["player"]["customTexts"]["Luckyone_Name"]["text_format"] = "[classcolor][name]"
		E.db["unitframe"]["units"]["player"]["customTexts"]["Luckyone_Name"]["xOffset"] = 0
		E.db["unitframe"]["units"]["player"]["customTexts"]["Luckyone_Power"]["justifyH"] = "RIGHT"

		-- Custom Text: Target
		E.db["unitframe"]["units"]["target"]["customTexts"]["Luckyone_Name"]["justifyH"] = "CENTER"
		E.db["unitframe"]["units"]["target"]["customTexts"]["Luckyone_Name"]["xOffset"] = 0
		E.db["unitframe"]["units"]["target"]["customTexts"]["Luckyone_Power"]["justifyH"] = "LEFT"
		E.db["unitframe"]["units"]["target"]["customTexts"]["Luckyone_Power"]["xOffset"] = 1

		if layout == 'dps' then
			-- DPS/TANK db changes
		elseif layout == 'healer' then
			-- Healing db changes
		end

		E:StaggeredUpdateAll(nil, true)
	end

elseif L1UI.Classic then

	function L1UI:UpdateLayout(layout)

		-- ActionBar changes
		E.db["actionbar"]["bar1"]["alpha"] = 1
		E.db["actionbar"]["bar2"]["alpha"] = 1
		E.db["actionbar"]["bar3"]["alpha"] = 1
		E.db["actionbar"]["bar4"]["alpha"] = 1
		E.db["actionbar"]["bar5"]["alpha"] = 1
		E.db["actionbar"]["bar6"]["alpha"] = 1
		E.db["actionbar"]["bar7"]["alpha"] = 1
		E.db["actionbar"]["bar8"]["alpha"] = 1
		E.db["actionbar"]["bar9"]["alpha"] = 1
		E.db["actionbar"]["bar10"]["alpha"] = 1
		E.db["actionbar"]["barPet"]["alpha"] = 1

		-- Custom Text: Player
		E.db["unitframe"]["units"]["player"]["customTexts"]["Luckyone_Level"]["justifyH"] = "LEFT"
		E.db["unitframe"]["units"]["player"]["customTexts"]["Luckyone_Level"]["xOffset"] = 1
		E.db["unitframe"]["units"]["player"]["customTexts"]["Luckyone_Name"]["justifyH"] = "CENTER"
		E.db["unitframe"]["units"]["player"]["customTexts"]["Luckyone_Name"]["text_format"] = "[namecolor][name]"
		E.db["unitframe"]["units"]["player"]["customTexts"]["Luckyone_Name"]["xOffset"] = 0
		E.db["unitframe"]["units"]["player"]["customTexts"]["Luckyone_Power"]["justifyH"] = "RIGHT"

		-- Custom Text: Target
		E.db["unitframe"]["units"]["target"]["customTexts"]["Luckyone_Name"]["justifyH"] = "CENTER"
		E.db["unitframe"]["units"]["target"]["customTexts"]["Luckyone_Name"]["xOffset"] = 0
		E.db["unitframe"]["units"]["target"]["customTexts"]["Luckyone_Power"]["justifyH"] = "LEFT"
		E.db["unitframe"]["units"]["target"]["customTexts"]["Luckyone_Power"]["xOffset"] = 1

		if layout == 'dps' then
			-- DPS/TANK db changes
		elseif layout == 'healer' then
			-- Healing db changes
		end

		E:StaggeredUpdateAll(nil, true)
	end

end
