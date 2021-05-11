local L1UI, E, L, V, P, G = unpack(select(2, ...))

local IsAddOnLoaded = IsAddOnLoaded
local ReloadUI = ReloadUI

-- Update Layout Buttons (Ingame Config)
function L1UI:UpdateLayout(layout)

	-- Protect some rare nil errors
	if not E.db.movers then E.db.movers = {} end

	-- Chat db changes
	if E.private.chat.enable then
		E.db["chat"]["tabFontOutline"] = "OUTLINE"
	end

	-- ElvUI NamePlates db changes
	if E.private.nameplates.enable then
		E.db["nameplates"]["units"]["ENEMY_NPC"]["castbar"]["castTimeFormat"] = "REMAINING"
		E.db["nameplates"]["units"]["ENEMY_NPC"]["castbar"]["channelTimeFormat"] = "REMAINING"
		E.db["nameplates"]["units"]["ENEMY_PLAYER"]["castbar"]["castTimeFormat"] = "REMAINING"
		E.db["nameplates"]["units"]["ENEMY_PLAYER"]["castbar"]["channelTimeFormat"] = "REMAINING"
	end

	-- Shadow&Light db changes
	if (IsAddOnLoaded('ElvUI_SLE') and L1UI.Retail) then L1UI:GetSLEProfile() end

	if layout == 'dps' then
		-- DPS/TANK db changes
	elseif layout == 'healer' then
		-- Healing db changes
	end

	E:StaggeredUpdateAll(nil, true)
end
