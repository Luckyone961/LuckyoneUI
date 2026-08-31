local _, Private = ...

if not Private.ElvUI then
	return
end

local unpack = unpack

local hooksecurefunc = hooksecurefunc

local _G = _G

local E = unpack(ElvUI)
local S = E:GetModule('Skins')

local function DamageMeter_HandleSessionWindow(window)
	local db = Private.Addon.db.profile.skins.Blizzard.DamageMeter

	if db.applyStyle then
		-- Blank top bar
		if window.Header then
			window.Header:SetAlpha(0)
		end

		local dropdown = window.DamageMeterTypeDropdown
		if dropdown then
			-- Hide the arrow and stretch the dropdown hit area over the TypeName
			if dropdown.customArrow then
				dropdown.customArrow:SetAlpha(0)
			end

			if window.Header and window.SessionDropdown then
				dropdown:ClearAllPoints()
				dropdown:Point('TOPLEFT', window.Header, 3, -5)
				dropdown:Point('RIGHT', window.SessionDropdown, 'LEFT', -3, 0)

				if window.SessionDropdown and window.SessionDropdown.SessionName then
					window.SessionDropdown.SessionName:SetTextColor(1, 1, 1)
				end
			end

			local typeName = dropdown.TypeName
			if typeName then
				typeName:ClearAllPoints()
				typeName:Point('LEFT', dropdown, -2, 0)
				typeName:SetTextColor(1, 1, 1)

				-- Combat timer on the right side of the TypeName
				-- This avoids moving the TypeName when combat timer is updating
				if window.SessionTimer then
					window.SessionTimer:ClearAllPoints()
					window.SessionTimer:Point('LEFT', typeName, 'RIGHT', 3, 0)
				end
			end
		end
	end

	if db.removeCombatTime and window.SessionTimer then
		window.SessionTimer:SetAlpha(0)
	end

	if db.removeCollapseButton and window.MinimizeButton then
		window.MinimizeButton:SetAlpha(0)
		window.MinimizeButton:EnableMouse(false)

		-- Move the dropdowns into the gap left by the hidden button
		-- Reapply on every pass, Blizzard re-anchors these on minimize state restore
		local settingsDropdown = window.SettingsDropdown
		if settingsDropdown then
			settingsDropdown:ClearAllPoints()
			settingsDropdown:Point('RIGHT', window.MinimizeButton, 'RIGHT', 2, -2)
		end

		local sessionDropdown = window.SessionDropdown
		if sessionDropdown and settingsDropdown then
			sessionDropdown:ClearAllPoints()
			sessionDropdown:Point('RIGHT', settingsDropdown, 'LEFT', 6, 0)
		end
	end

	if db.removeScrollbar then
		local scrollBar = window.GetScrollBar and window:GetScrollBar()
		if scrollBar then
			scrollBar:Kill()
		end

		local sourceWindow = window.SourceWindow
		local sourceScrollBar = sourceWindow and sourceWindow.GetScrollBar and sourceWindow:GetScrollBar()
		if sourceScrollBar then
			sourceScrollBar:Kill()
		end
	end

	-- Blizzard re-anchors the header widgets when the saved minimize state is restored on login/reload
	if window.SetMinimized and not window.LuckyoneHooked then
		hooksecurefunc(window, 'SetMinimized', DamageMeter_HandleSessionWindow)

		window.LuckyoneHooked = true
	end
end

local function DamageMeter_SetupSessionWindows()
	_G.DamageMeter:ForEachSessionWindow(DamageMeter_HandleSessionWindow)
end

local function Skin_DamageMeter()
	local db = Private.Addon.db.profile.skins.Blizzard.DamageMeter
	if not db.enable then return end

	-- Requires the ElvUI Damage Meter skin
	if not (E.private.skins.blizzard.enable and E.private.skins.blizzard.damageMeter) then return end

	-- Force off WT skin
	if Private.IsAddOnLoaded('ElvUI_WindTools') and E.private.WT.skins.damageMeter.enable then
		E.private.WT.skins.damageMeter.enable = false
	end

	hooksecurefunc(_G.DamageMeter, 'SetupSessionWindow', DamageMeter_SetupSessionWindows)
	DamageMeter_SetupSessionWindows()
end

S:AddCallbackForAddon('Blizzard_DamageMeter', 'LuckyoneUI_DamageMeter', Skin_DamageMeter)
