local Name, Private = ...
local E, L, V, P, G = unpack(ElvUI)

local SetCVar = SetCVar

-- Ingame config buttons 'Update Main' & 'Update Healing'
function Private:UpdateLayout(layout)
	-- Bump install version
	E.global.L1UI.install_version = Private.Version

	-- Remove Cata happiness
	if E.Cata then
		if E.db.unitframe.units.pet.customTexts.Luckyone_Name.text_format == '[happiness:color][name][ >happiness:full]' then
			E.db.unitframe.units.pet.customTexts.Luckyone_Name.text_format = '[classcolor][name]'
		end
	end

	Private:Print(L["Successfully updated your current layout to LuckyoneUI version "] .. Private.Version)
end

-- Ingame config button for 1080p > 1440p scaling
function Private:UpdateResolution()
	-- Bump install version
	E.global.L1UI.install_version = Private.Version

	-- Protect movers error
	E.db.movers = E.db.movers or {}

	-- This is the scaling magic
	SetCVar('uiScale', 0.53333333333333)
	E.global.general.UIScale = 0.53333333333333

	E.db.movers.ArenaHeaderMover = 'TOPRIGHT,UIParent,TOPRIGHT,-400,-320'
	E.db.movers.BelowMinimapContainerMover = 'TOPRIGHT,ElvUIParent,TOPRIGHT,-80,-184'
	E.db.movers.BossButton = 'BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,416,87'
	E.db.movers.BossHeaderMover = 'TOPRIGHT,ElvUIParent,TOPRIGHT,-400,-320'
	E.db.movers.ElvAB_5 = 'BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-1,558'
	E.db.movers.ElvUF_FocusCastbarMover = 'BOTTOM,ElvUIParent,BOTTOM,277,606'
	E.db.movers.ElvUF_FocusMover = 'BOTTOM,ElvUIParent,BOTTOM,278,625'
	E.db.movers.ElvUF_PartyMover = 'TOPLEFT,ElvUIParent,TOPLEFT,480,-525'
	E.db.movers.ElvUF_PlayerCastbarMover = 'BOTTOM,ElvUIParent,BOTTOM,0,413'
	E.db.movers.ElvUF_PlayerMover = 'BOTTOM,UIParent,BOTTOM,-278,480'
	E.db.movers.ElvUF_TargetCastbarMover = 'BOTTOM,ElvUIParent,BOTTOM,278,461'
	E.db.movers.ElvUF_TargetMover = 'BOTTOM,ElvUIParent,BOTTOM,278,480'
	E.db.movers.ElvUF_TargetTargetMover = 'BOTTOM,ElvUIParent,BOTTOM,0,432'
	E.db.movers.PrivateAurasMover = 'BOTTOM,UIParent,BOTTOM,190,667'
	E.db.movers.WTCombatAlertFrameMover = 'BOTTOM,UIParent,BOTTOM,0,603'
	E.db.movers.ZoneAbility = 'BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,416,34'

	-- Make sure to force reload
	E:StaticPopup_Show('L1UI_RL')

	Private:Print(L["Successfully updated your current layout from 1080p to 1440p"])
end
