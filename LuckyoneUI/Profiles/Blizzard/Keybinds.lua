local _, Private = ...

local gmatch = string.gmatch
local strmatch = string.match

local GetCurrentBindingSet = GetCurrentBindingSet
local LoadBindings = LoadBindings
local SaveBindings = SaveBindings
local SetBinding = SetBinding
local SetModifiedClick = SetModifiedClick

local _G = _G
local StaticPopupDialogs = _G.StaticPopupDialogs

local BindingContext = Enum.BindingContext
local BindingSet = Enum.BindingSet

local NO = NO
local YES = YES

-- bindings-cache.wtf file
local shared = [[
bind # TOGGLEWORLDSTATESCORES
bind - NONE
bind 0 NONE
bind 6 TOGGLEPINGLISTENER
bind 7 NONE
bind 8 NONE
bind 9 NONE
bind < ACTIONBUTTON7
bind = NONE
bind A MULTIACTIONBAR1BUTTON11
bind ALT-1 MULTIACTIONBAR2BUTTON1
bind ALT-2 MULTIACTIONBAR2BUTTON2
bind ALT-V NAMEPLATES
bind BUTTON3 MULTIACTIONBAR1BUTTON8
bind BUTTON4 MULTIACTIONBAR2BUTTON4
bind BUTTON5 MULTIACTIONBAR2BUTTON5
bind C MULTIACTIONBAR2BUTTON7
bind CTRL-- NONE
bind CTRL-0 NONE
bind CTRL-6 NONE
bind CTRL-7 NONE
bind CTRL-8 NONE
bind CTRL-9 NONE
bind CTRL-= NONE
bind CTRL-E ACTIONBUTTON12
bind CTRL-F1 NONE
bind CTRL-F10 NONE
bind CTRL-F2 NONE
bind CTRL-F3 NONE
bind CTRL-F4 NONE
bind CTRL-F5 NONE
bind CTRL-F6 NONE
bind CTRL-F7 NONE
bind CTRL-F8 NONE
bind CTRL-F9 NONE
bind CTRL-PAGEDOWN NONE
bind CTRL-PAGEUP NONE
bind CTRL-Q ACTIONBUTTON11
bind CTRL-R MULTIACTIONBAR3BUTTON6
bind CTRL-SHIFT-PAGEDOWN NONE
bind CTRL-SHIFT-TAB NONE
bind CTRL-TAB NONE
bind D MULTIACTIONBAR1BUTTON12
bind DELETE NONE
bind DOWN NONE
bind E STRAFERIGHT
bind END NONE
bind F MULTIACTIONBAR1BUTTON7
bind F1 NONE
bind F10 NONE
bind F11 NONE
bind F12 NONE
bind F2 NONE
bind F3 NONE
bind F4 NONE
bind F5 NONE
bind F8 NONE
bind F9 NONE
bind G MULTIACTIONBAR2BUTTON11
bind H ACTIONBUTTON8
bind HOME NONE
bind INSERT NONE
bind LEFT NONE
bind NUMPAD0 NONE
bind NUMPAD5 NONE
bind NUMPADMINUS NONE
bind NUMPADPLUS NONE
bind Q STRAFELEFT
bind R ACTIONBUTTON6
bind RIGHT NONE
bind SHIFT-1 MULTIACTIONBAR1BUTTON1
bind SHIFT-2 MULTIACTIONBAR1BUTTON2
bind SHIFT-3 MULTIACTIONBAR1BUTTON3
bind SHIFT-4 MULTIACTIONBAR1BUTTON4
bind SHIFT-5 MULTIACTIONBAR1BUTTON5
bind SHIFT-B NONE
bind SHIFT-BUTTON3 MULTIACTIONBAR3BUTTON8
bind SHIFT-BUTTON5 MULTIACTIONBAR2BUTTON12
bind SHIFT-C MULTIACTIONBAR1BUTTON10
bind SHIFT-F MULTIACTIONBAR2BUTTON9
bind SHIFT-F1 NONE
bind SHIFT-F2 NONE
bind SHIFT-F3 NONE
bind SHIFT-F4 NONE
bind SHIFT-F5 NONE
bind SHIFT-H ACTIONBUTTON9
bind SHIFT-I NONE
bind SHIFT-MOUSEWHEELUP BONUSACTIONBUTTON1
bind SHIFT-PAGEDOWN NONE
bind SHIFT-Q MULTIACTIONBAR3BUTTON12
bind SHIFT-R MULTIACTIONBAR3BUTTON9
bind SHIFT-SPACE MULTIACTIONBAR2BUTTON10
bind SHIFT-T MULTIACTIONBAR3BUTTON7
bind SHIFT-TAB NONE
bind SHIFT-V ACTIONBUTTON10
bind SHIFT-W MULTIACTIONBAR2BUTTON3
bind SHIFT-X MULTIACTIONBAR3BUTTON10
bind T MULTIACTIONBAR1BUTTON6
bind TAB MULTIACTIONBAR1BUTTON9
bind U NONE
bind UP NONE
bind V MULTIACTIONBAR2BUTTON6
bind ^ MULTIACTIONBAR2BUTTON8
modifiedclick NONE SELFCAST
]]

local bindings = shared .. (Private.isRetail and [[
bind ALT-A MACRO AH
bind ALT-B MACRO BN
bind ALT-BUTTON4 NONE
bind ALT-F MACRO F
bind ALT-G MACRO GLIDE
bind ALT-K TOGGLEFPS
bind ALT-R SPELL Recuperate
bind ALT-S MACRO Sent
bind B TOGGLEBACKPACK
bind CTRL-1 SHAPESHIFTBUTTON1
bind CTRL-2 SHAPESHIFTBUTTON2
bind CTRL-3 SHAPESHIFTBUTTON3
bind CTRL-4 MULTIACTIONBAR3BUTTON5
bind CTRL-5 MULTIACTIONBAR3BUTTON4
bind CTRL-I INTERACTTARGET
bind CTRL-MOUSEWHEELDOWN NONE
bind CTRL-MOUSEWHEELUP NONE
bind CTRL-T MULTIACTIONBAR3BUTTON3
bind F NONE HousingEditorBasicAndExpertDecorMode
bind L HOUSING_TOGGLEDECORNUDGEMODE
bind NUMPAD1 NONE
bind NUMPAD3 NONE
bind SHIFT-BUTTON4 NONE
bind SHIFT-E EXTRAACTIONBUTTON1
bind SHIFT-L TOGGLECOOLDOWNVIEWERSETTINGS
bind SHIFT-MOUSEWHEELDOWN BONUSACTIONBUTTON2
bind SHIFT-O MACRO !Q
bind SHIFT-P MACRO !Q2
bind SHIFT-R NONE HousingEditorBasicAndExpertDecorMode
bind SHIFT-Y NONE
bind V NONE HousingEditorBasicDecorMode
bind Y NONE HousingEditorBasicAndExpertDecorMode
bind Y SHAPESHIFTBUTTON4
]] or [[
bind / NONE
bind B OPENALLBAGS
bind CTRL-1 MULTIACTIONBAR4BUTTON1
bind CTRL-2 MULTIACTIONBAR4BUTTON2
bind CTRL-3 MULTIACTIONBAR4BUTTON3
bind CTRL-4 MULTIACTIONBAR4BUTTON4
bind CTRL-5 MULTIACTIONBAR4BUTTON5
bind CTRL-M NONE
bind CTRL-T MULTIACTIONBAR3BUTTON5
bind SHIFT-6 NONE
bind SHIFT-7 NONE
bind SHIFT-DOWN NONE
bind SHIFT-E NONE
bind SHIFT-MOUSEWHEELDOWN BONUSACTIONBUTTON10
bind SHIFT-P NONE
bind SHIFT-UP NONE
bind Y MULTIACTIONBAR4BUTTON6
]])

-- Reset to defaults, then apply the above
function Private:Setup_Keybinds()
	LoadBindings(BindingSet.Default)

	for line in gmatch(bindings, '[^\r\n]+') do
		local key, command = strmatch(line, '^bind (%S+) (.+)')
		if key then
			local action, context = strmatch(command, '^(.+) (%S+)$')
			context = context and BindingContext[context]
			if context then command = action end

			SetBinding(key, command ~= 'NONE' and command or nil, context)
		else
			local modifier, action = strmatch(line, '^modifiedclick (%S+) (%S+)')
			if modifier then
				SetModifiedClick(action, modifier)
			end
		end
	end

	SaveBindings(GetCurrentBindingSet())
	Private:Print('Keybinds applied.')
end

-- StaticPopup_Show('LUCKYONE_KEYBINDS')
StaticPopupDialogs['LUCKYONE_KEYBINDS'] = {
	text = 'Reset all keybinds to default and apply Luckyone\'s keybinds?',
	button1 = YES,
	button2 = NO,
	OnAccept = function() Private:Setup_Keybinds() end,
	whileDead = 1,
	hideOnEscape = false,
}
