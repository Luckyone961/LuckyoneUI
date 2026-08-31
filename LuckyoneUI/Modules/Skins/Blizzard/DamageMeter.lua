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

			if not dropdown.LuckyoneSkinned and window.SessionTimer and window.SessionDropdown then
				dropdown:ClearAllPoints() -- point is a secret
				dropdown:Point('TOPLEFT', window.SessionTimer, 'TOPRIGHT', 0, 4)
				dropdown:Point('RIGHT', window.SessionDropdown, 'LEFT', -3, 0)

				dropdown.LuckyoneSkinned = true
			end

			local typeName = dropdown.TypeName
			if typeName then
				typeName:ClearAllPoints() -- point is a secret
				typeName:Point('LEFT', dropdown, 3, 0)
				typeName:SetTextColor(1, 1, 1)
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
		local settingsDropdown = window.SettingsDropdown
		if settingsDropdown and not settingsDropdown.LuckyoneSkinned then
			settingsDropdown:ClearAllPoints() -- point is a secret
			settingsDropdown:Point('RIGHT', window.MinimizeButton, 'RIGHT', 0, 0)

			settingsDropdown.LuckyoneSkinned = true
		end

		local sessionDropdown = window.SessionDropdown
		if sessionDropdown and settingsDropdown and not sessionDropdown.LuckyoneSkinned then
			sessionDropdown:ClearAllPoints() -- point is a secret
			sessionDropdown:Point('RIGHT', settingsDropdown, 'LEFT', 3, 1)

			sessionDropdown.LuckyoneSkinned = true
		end
	end

	if db.removeScrollbar then
		local scrollBar = window.GetScrollBar and window:GetScrollBar()
		if scrollBar then
			scrollBar:SetAlpha(0)
		end

		local sourceWindow = window.SourceWindow
		local sourceScrollBar = sourceWindow and sourceWindow.GetScrollBar and sourceWindow:GetScrollBar()
		if sourceScrollBar then
			sourceScrollBar:SetAlpha(0)
		end
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

	hooksecurefunc(_G.DamageMeter, 'SetupSessionWindow', DamageMeter_SetupSessionWindows)
	DamageMeter_SetupSessionWindows()
end

-- Values are stored as an offset from minValue, so the saved value never goes negative
local function EditMode_ExtendPaddingSlider()
	local db = Private.Addon.db.profile.skins.Blizzard.DamageMeter
	if not (db.enable and db.extendPaddingSlider) then return end

	-- Requires the ElvUI Damage Meter skin
	if not (E.private.skins.blizzard.enable and E.private.skins.blizzard.damageMeter) then return end

	local manager = _G.EditModeSettingDisplayInfoManager
	local displayInfoMap = manager and manager.displayInfoMap[Enum.EditModeSystem.DamageMeter]
	local padding = displayInfoMap and displayInfoMap[Enum.EditModeDamageMeterSetting.Padding]
	if padding then
		padding.minValue = -2
	end
end

S:AddCallbackForAddon('Blizzard_DamageMeter', 'LuckyoneUI_DamageMeter', Skin_DamageMeter)
S:AddCallbackForAddon('Blizzard_EditMode', 'LuckyoneUI_DamageMeterEditMode', EditMode_ExtendPaddingSlider)
