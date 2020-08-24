local E, L, V, P, G = unpack(ElvUI)
local L1UI = E:GetModule('LuckyoneUI');

function L1UI:SetupLayout(layout)
	if not E.db.movers then
		E.db.movers = {}
	end

	if layout == 'dps' then
		--Paste Here

		--Shadow&Light

		if IsAddOnLoaded('ElvUI_SLE') then
			--Paste Here
		end

		--NamePlate Reset Var

		--Private ElvUI

		--Paste Here

		--Private Shadow&Light

		if IsAddOnLoaded('ElvUI_SLE') then
			--Paste Here
		end

	elseif layout == 'healer' then
		--Paste Here

		--Shadow&Light

		if IsAddOnLoaded('ElvUI_SLE') then
			--Paste Here
		end

		--NamePlate Reset Var

		--Private ElvUI

		--Paste Here

		--Private Shadow&Light

		if IsAddOnLoaded('ElvUI_SLE') then
			--Paste Here
		end
	end

	E:StaggeredUpdateAll(nil, true)

	PluginInstallStepComplete.message = '|cff4beb2cLuckyoneUI|r Layout has been set'
	PluginInstallStepComplete:Show()
end
