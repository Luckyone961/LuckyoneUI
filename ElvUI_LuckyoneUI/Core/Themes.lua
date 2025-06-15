-- Lua functions
local strfind = string.find
local unpack = unpack

-- Global environment
local _G = _G

-- AddOn namespace
local _, Private = ...

-- ElvUI modules
local E, L = unpack(ElvUI)

-- Figure out our current profile
local function Profile()
	local data = E.data:GetCurrentProfile()

	return strfind(data, 'Luckyone Main') or strfind(data, 'Luckyone Support') and 1 or strfind(data, 'Luckyone Healing') and 2 or nil
end

-- UnitFrame color themes
function Private:Setup_Theme(theme, installer)

	-- Global db
	local dev = E.global.L1UI.dev
	-- Get current layout
	local profile = Profile()

	if theme == 'dark' then

		-- Frame colors
		E.db.unitframe.colors.classbackdrop = false
		E.db.unitframe.colors.customhealthbackdrop = true
		E.db.unitframe.colors.health_backdrop.b = 0.61
		E.db.unitframe.colors.health_backdrop.g = 0.56
		E.db.unitframe.colors.health_backdrop.r = 0.54
		E.db.unitframe.colors.health.b = 0.05
		E.db.unitframe.colors.health.g = 0.05
		E.db.unitframe.colors.health.r = 0.05
		E.db.unitframe.colors.healthclass = false
		E.db.unitframe.colors.useDeadBackdrop = true

		-- Text colors
		E.db.unitframe.units.arena.customTexts.Luckyone_Name.text_format = '[luckyone:name:last-classcolor]'
		E.db.unitframe.units.boss.customTexts.Luckyone_Name.text_format = '[luckyone:name:last-classcolor]'
		E.db.unitframe.units.focus.customTexts.Luckyone_Name.text_format = '[luckyone:name:last-classcolor]'
		E.db.unitframe.units.party.customTexts.Luckyone_Name.text_format = (profile == 1 and not E.Classic) and '[luckyone:name:short-classcolor]|r[ - >luckyone:healermana:percent]' or '[luckyone:name:short-classcolor]'
		E.db.unitframe.units.player.customTexts.Luckyone_Name.text_format = '[luckyone:name:last-classcolor]'
		E.db.unitframe.units.raid1.name.text_format = '[luckyone:name:veryshort-classcolor]'
		E.db.unitframe.units.raid2.name.text_format = '[luckyone:name:veryshort-classcolor]'
		E.db.unitframe.units.raid3.name.text_format = '[luckyone:name:veryshort-classcolor]'
		E.db.unitframe.units.raidpet.name.text_format = '[luckyone:name:veryshort-classcolor]'
		E.db.unitframe.units.target.customTexts.Luckyone_Name.text_format = (dev and '[luckyone:name:last-classcolor][ |r» >luckyone:target:last-classcolor]') or '[luckyone:name:last-classcolor]'
		E.db.unitframe.units.targettarget.customTexts.Luckyone_Name.text_format = '[luckyone:name:last-classcolor]'

		-- Castbar color
		E.db.unitframe.units.player.castbar.customColor.enable = true

	elseif theme == 'class' then

		-- Frame colors
		E.db.unitframe.colors.classbackdrop = true
		E.db.unitframe.colors.customhealthbackdrop = true
		E.db.unitframe.colors.health_backdrop.b = 0.05
		E.db.unitframe.colors.health_backdrop.g = 0.05
		E.db.unitframe.colors.health_backdrop.r = 0.05
		E.db.unitframe.colors.healthclass = true
		E.db.unitframe.colors.useDeadBackdrop = true

		-- Text colors
		E.db.unitframe.units.arena.customTexts.Luckyone_Name.text_format = '[luckyone:name:last-nocolor]'
		E.db.unitframe.units.boss.customTexts.Luckyone_Name.text_format = '[luckyone:name:last-nocolor]'
		E.db.unitframe.units.focus.customTexts.Luckyone_Name.text_format = '[luckyone:name:last-nocolor]'
		E.db.unitframe.units.party.customTexts.Luckyone_Name.text_format = (profile == 1 and not E.Classic) and '[luckyone:name:short-nocolor][ - >luckyone:healermana:percent]' or '[luckyone:name:short-nocolor]'
		E.db.unitframe.units.player.customTexts.Luckyone_Name.text_format = '[luckyone:name:last-nocolor]'
		E.db.unitframe.units.raid1.name.text_format = '[luckyone:name:veryshort-nocolor]'
		E.db.unitframe.units.raid2.name.text_format = '[luckyone:name:veryshort-nocolor]'
		E.db.unitframe.units.raid3.name.text_format = '[luckyone:name:veryshort-nocolor]'
		E.db.unitframe.units.raidpet.name.text_format = '[luckyone:name:veryshort-nocolor]'
		E.db.unitframe.units.target.customTexts.Luckyone_Name.text_format = (dev and '[luckyone:name:last-nocolor][ |r» >luckyone:target:last-classcolor]') or '[luckyone:name:last-nocolor]'
		E.db.unitframe.units.targettarget.customTexts.Luckyone_Name.text_format = '[luckyone:name:last-nocolor]'

		-- Castbar color
		E.db.unitframe.units.player.castbar.customColor.enable = false

	end

	E:UpdateMediaItems(true)
	E:UpdateUnitFrames()

	if installer then
		_G.LuckyoneInstallStepComplete:ShowMessage(L["Theme has been set."])
	end

	Private:Print(L["Theme has been set."])
end
