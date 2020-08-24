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

		--Private ElvUI
		E.private["general"]["chatBubbleFont"] = "Expressway"
		E.private["general"]["dmgfont"] = "Expressway"
		E.private["general"]["glossTex"] = "Solid"
		E.private["general"]["loot"] = false
		E.private["general"]["namefont"] = "Expressway"
		E.private["general"]["normTex"] = "Solid"
		E.private["general"]["totemBar"] = false
		E.private["install_complete"] = "11.41"
		E.private["skins"]["cleanBossButton"] = true
		E.private["skins"]["parchmentRemoverEnable"] = true

		--Private Shadow&Light
		if IsAddOnLoaded('ElvUI_SLE') then
		E.private["sle"]["professions"]["deconButton"]["enable"] = false
		E.private["sle"]["skins"]["objectiveTracker"]["BGbackdrop"] = false
		E.private["sle"]["skins"]["objectiveTracker"]["color"]["g"] = 0.41960784313725
		E.private["sle"]["skins"]["objectiveTracker"]["color"]["r"] = 0.25882352941176
		E.private["sle"]["skins"]["objectiveTracker"]["skinnedTextureLogo"] = "SLE"
		E.private["sle"]["skins"]["objectiveTracker"]["texture"] = "Solid"
		end

	elseif layout == 'healer' then
		--Paste Here

		--Shadow&Light

		if IsAddOnLoaded('ElvUI_SLE') then
			--Paste Here
		end

		--Private ElvUI
		E.private["general"]["chatBubbleFont"] = "Expressway"
		E.private["general"]["dmgfont"] = "Expressway"
		E.private["general"]["glossTex"] = "Solid"
		E.private["general"]["loot"] = false
		E.private["general"]["namefont"] = "Expressway"
		E.private["general"]["normTex"] = "Solid"
		E.private["general"]["totemBar"] = false
		E.private["install_complete"] = "11.41"
		E.private["skins"]["cleanBossButton"] = true
		E.private["skins"]["parchmentRemoverEnable"] = true

		--Private Shadow&Light
		if IsAddOnLoaded('ElvUI_SLE') then
		E.private["sle"]["professions"]["deconButton"]["enable"] = false
		E.private["sle"]["skins"]["objectiveTracker"]["BGbackdrop"] = false
		E.private["sle"]["skins"]["objectiveTracker"]["color"]["g"] = 0.41960784313725
		E.private["sle"]["skins"]["objectiveTracker"]["color"]["r"] = 0.25882352941176
		E.private["sle"]["skins"]["objectiveTracker"]["skinnedTextureLogo"] = "SLE"
		E.private["sle"]["skins"]["objectiveTracker"]["texture"] = "Solid"
		end

	end

	E:StaggeredUpdateAll(nil, true)

	PluginInstallStepComplete.message = '|cff4beb2cLuckyoneUI|r Layout has been set'
	PluginInstallStepComplete:Show()
end
