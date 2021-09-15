local L1UI, E, L, V, P, G = unpack(select(2, ...))

local IsAddOnLoaded = IsAddOnLoaded

-- Update Layout Buttons (Ingame Config)
if L1UI.Retail then

	function L1UI:UpdateLayout(layout)

		-- Protect some rare nil errors
		if not E.db.movers then E.db.movers = {} end

		-- Shadow & Light changes
		if IsAddOnLoaded('ElvUI_SLE') then L1UI:Get_ShadowAndLight_Profile() end

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

		-- Protect some rare nil errors
		if not E.db.movers then E.db.movers = {} end

		if layout == 'dps' then
			-- DPS/TANK db changes
		elseif layout == 'healer' then
			-- Healing db changes
		end

		E:StaggeredUpdateAll(nil, true)
	end

elseif L1UI.Classic then

	function L1UI:UpdateLayout(layout)

		-- Protect some rare nil errors
		if not E.db.movers then E.db.movers = {} end

		if layout == 'dps' then
			-- DPS/TANK db changes
		elseif layout == 'healer' then
			-- Healing db changes
		end

		E:StaggeredUpdateAll(nil, true)
	end

end
