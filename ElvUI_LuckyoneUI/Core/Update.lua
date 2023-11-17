local Name, Private = ...
local E, L, V, P, G = unpack(ElvUI)

-- Ingame config buttons 'Update Main' & 'Update Healing'
function L1UI:UpdateLayout(layout)
	-- Bump install version
	E.global.L1UI.install_version = Private.Version

	if E.db.unitframe.units.party.customTexts.Luckyone_Name.text_format == '[classcolor][name:short]|r[manacolor][ - >luckyone:healermana:percent<%]' then
		E.db.unitframe.units.party.customTexts.Luckyone_Name.text_format = '[classcolor][name:short]|r[manacolor][ - >luckyone:healermana:percent]'
	end

	if E.db.unitframe.units.party.customTexts.Luckyone_Name.text_format == '[classcolor][name:short]||r[manacolor][ - >luckyone:healermana:percent<%]' then
		E.db.unitframe.units.party.customTexts.Luckyone_Name.text_format = '[classcolor][name:short]|r[manacolor][ - >luckyone:healermana:percent]'
	end

	if E:IsAddOnEnabled('ElvUI_WindTools') and E.Retail then
		E.db.WT.quest.turnIn.mode = 'COMPLETE'
	end

	E.db.tooltip.healthBar.fontOutline = 'OUTLINE'

	if E.private.nameplates.enable then
		L1UI:Setup_StyleFilters(true)
	end

	Private:Print(L["Successfully updated your current layout to LuckyoneUI version "] .. Private.Version)
end
