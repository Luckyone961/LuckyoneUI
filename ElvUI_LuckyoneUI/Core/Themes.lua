local L1UI, E, L, V, P, G = unpack(select(2, ...))

-- UnitFrame color themes
function L1UI:Setup_Theme(theme)

	if theme == 'dark' then

		if L1UI.Me then

			E.db.unitframe.colors.healthclass = false
			E.db.unitframe.colors.health.b = 0.05
			E.db.unitframe.colors.health.g = 0.05
			E.db.unitframe.colors.health.r = 0.05

			E.db.unitframe.colors.customhealthbackdrop = true
			E.db.unitframe.colors.health_backdrop.b = 0.61
			E.db.unitframe.colors.health_backdrop.g = 0.56
			E.db.unitframe.colors.health_backdrop.r = 0.54

			E.db.unitframe.colors.useDeadBackdrop = true

			E.db.unitframe.units.arena.name.text_format = '[classcolor][name:last]'
			E.db.unitframe.units.boss.name.text_format = '[classcolor][name:last]'
			E.db.unitframe.units.focus.customTexts.Luckyone_Name.text_format = '[classcolor][name:last]'
			E.db.unitframe.units.party.customTexts.Luckyone_Name.text_format = '[classcolor][name:short]'
			E.db.unitframe.units.pet.customTexts.Luckyone_Name.text_format = E.Retail and '[classcolor][name]' or '[happiness:color][name][ >happiness:full]'
			E.db.unitframe.units.player.customTexts.Luckyone_Name.text_format = '[classcolor][name]'
			E.db.unitframe.units.raid.name.text_format = '[classcolor][name:veryshort]'
			E.db.unitframe.units.raid40.name.text_format = '[classcolor][name:veryshort]'
			E.db.unitframe.units.target.customTexts.Luckyone_Name.text_format = '[classcolor][name:last]'
			E.db.unitframe.units.targettarget.customTexts.Luckyone_Name.text_format = '[classcolor][name:last]'

		else

			E.db.unitframe.colors.classbackdrop = true
			E.db.unitframe.colors.customhealthbackdrop = false
			E.db.unitframe.colors.healthMultiplier = 0.75

			E.db.unitframe.colors.health.b = 0.05
			E.db.unitframe.colors.health.g = 0.05
			E.db.unitframe.colors.health.r = 0.05
			E.db.unitframe.colors.healthclass = false

			E.db.unitframe.colors.transparentHealth = true
			E.db.unitframe.colors.useDeadBackdrop = true

			E.db.unitframe.units.arena.customTexts.Luckyone_Name.text_format = '[classcolor][name:short]'
			E.db.unitframe.units.boss.customTexts.Luckyone_Name.text_format = '[classcolor][name:last]'
			E.db.unitframe.units.party.customTexts.Luckyone_Name.text_format = '[classcolor][name:short]'
			E.db.unitframe.units.raid.customTexts.Luckyone_Name.text_format = '[classcolor][name:short]'
			E.db.unitframe.units.raid40.name.text_format = '[classcolor][name:veryshort]'

		end

	elseif theme == 'class' then

		if L1UI.Me then

			E.db.unitframe.colors.healthclass = true
			E.db.unitframe.colors.classbackdrop = true

			E.db.unitframe.colors.customhealthbackdrop = true
			E.db.unitframe.colors.health_backdrop.b = 0.61
			E.db.unitframe.colors.health_backdrop.g = 0.56
			E.db.unitframe.colors.health_backdrop.r = 0.54

			E.db.unitframe.colors.useDeadBackdrop = true

			E.db.unitframe.units.arena.name.text_format = '[name:last]'
			E.db.unitframe.units.boss.name.text_format = '[name:last]'
			E.db.unitframe.units.focus.customTexts.Luckyone_Name.text_format = '[name:last]'
			E.db.unitframe.units.party.customTexts.Luckyone_Name.text_format = '[name:short]'
			E.db.unitframe.units.pet.customTexts.Luckyone_Name.text_format = E.Retail and '[name]' or '[happiness:color][name][ >happiness:full]'
			E.db.unitframe.units.player.customTexts.Luckyone_Name.text_format = '[name]'
			E.db.unitframe.units.raid.name.text_format = '[name:veryshort]'
			E.db.unitframe.units.raid40.name.text_format = '[name:veryshort]'
			E.db.unitframe.units.target.customTexts.Luckyone_Name.text_format = '[name:last]'
			E.db.unitframe.units.targettarget.customTexts.Luckyone_Name.text_format = '[name:last]'

		else

			E.db.unitframe.colors.classbackdrop = false
			E.db.unitframe.colors.customhealthbackdrop = true
			E.db.unitframe.colors.healthMultiplier = 0

			E.db.unitframe.colors.health_backdrop.b = 0.10
			E.db.unitframe.colors.health_backdrop.g = 0.10
			E.db.unitframe.colors.health_backdrop.r = 0.10
			E.db.unitframe.colors.healthclass = true

			E.db.unitframe.colors.transparentHealth = true
			E.db.unitframe.colors.useDeadBackdrop = true

			E.db.unitframe.units.arena.customTexts.Luckyone_Name.text_format = '[name:short]'
			E.db.unitframe.units.boss.customTexts.Luckyone_Name.text_format = '[name:last]'
			E.db.unitframe.units.party.customTexts.Luckyone_Name.text_format = '[name:short]'
			E.db.unitframe.units.raid.customTexts.Luckyone_Name.text_format = '[name:short]'
			E.db.unitframe.units.raid40.name.text_format = '[name:veryshort]'

		end

	end

	E:UpdateMediaItems(true)
	E:UpdateUnitFrames()

	L1UI:Print(L["Theme has been set."])
end
