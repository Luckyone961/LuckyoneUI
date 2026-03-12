-- Addon namespace
local _, Private = ...

-- Global environment
local _G = _G
local StaticPopup_Show = _G.StaticPopup_Show

-- Edit Mode helper
function Private:ToggleEditMode()
	if not _G.EditModeManagerFrame then return end

	if not _G.EditModeManagerFrame:IsShown() then
		_G.EditModeManagerFrame:Show()
	else
		_G.EditModeManagerFrame:Hide()
	end
end

-- Edit Mode profiles
function Private:Return_EditModeString()
	if not _G.EditModeManagerFrame then return end

	-- Global db
	local scaled = Private.Addon.db.global.scaled

	-- Profile string
	local importString = scaled and [[2 50 0 0 1 7 7 UIParent 0.0 45.0 -1 ##$$%/&('%)#+#,$ 0 1 1 7 7 UIParent 0.0 45.0 -1 ##$$%/&('%(#,$ 0 2 1 7 7 UIParent 0.0 45.0 -1 ##$$%/&('%(#,$ 0 3 1 5 5 UIParent -5.0 -77.0 -1 #$$$%/&('%(#,$ 0 4 1 5 5 UIParent -5.0 -77.0 -1 #$$$%/&('%(#,$ 0 5 1 1 4 UIParent 0.0 0.0 -1 ##$$%/&('%(#,$ 0 6 1 1 4 UIParent 0.0 -50.0 -1 ##$$%/&('%(#,$ 0 7 1 1 4 UIParent 0.0 -100.0 -1 ##$$%/&('%(#,$ 0 10 1 7 7 UIParent 0.0 45.0 -1 ##$$&('% 0 11 1 7 7 UIParent 0.0 45.0 -1 ##$$&('%,# 0 12 1 7 7 UIParent 0.0 45.0 -1 ##$$&('% 1 -1 1 4 4 UIParent 0.0 0.0 -1 ##$#%# 2 -1 1 2 2 UIParent 0.0 0.0 -1 ##$#%( 3 0 1 8 7 UIParent -300.0 250.0 -1 $#3# 3 1 1 6 7 UIParent 300.0 250.0 -1 %#3# 3 2 1 6 7 UIParent 520.0 265.0 -1 %#&#3# 3 3 1 0 2 CompactRaidFrameManager 0.0 -7.0 -1 '#(#)#-5.)/#1$3#5#6(7-7$ 3 4 1 0 2 CompactRaidFrameManager 0.0 -5.0 -1 ,#-5.)/#0#1#2(5#6(7-7$ 3 5 1 5 5 UIParent 0.0 0.0 -1 &#*$3# 3 6 1 5 5 UIParent 0.0 0.0 -1 -5.)/#4$5#6(7-7$ 3 7 1 4 4 UIParent 0.0 0.0 -1 3# 4 -1 0 0 0 UIParent 845.0 -778.0 -1 # 5 -1 0 1 1 UIParent -600.0 -222.0 -1 # 6 0 1 2 2 UIParent -255.0 -10.0 -1 ##$#%#&.(()( 6 1 1 2 2 UIParent -270.0 -155.0 -1 ##$#%#'+(()(-$ 6 2 1 1 1 UIParent 0.0 -25.0 -1 ##$#%$&.(()(+#,-,$ 7 -1 0 1 1 UIParent 0.0 -802.0 -1 # 8 -1 0 7 7 UIParent -736.5 34.0 -1 #'$A%$&i 9 -1 1 7 7 UIParent 0.0 45.0 -1 # 10 -1 1 0 0 UIParent 16.0 -116.0 -1 # 11 -1 1 8 8 UIParent -9.0 85.0 -1 # 12 -1 0 4 4 UIParent 795.0 -3.0 -1 #7$#%# 13 -1 1 8 8 MicroButtonAndBagsBar 0.0 0.0 -1 ##$#%)&- 14 -1 1 2 2 MicroButtonAndBagsBar 0.0 10.0 -1 ##$#%( 15 0 1 7 7 StatusTrackingBarManager 0.0 0.0 -1 # 15 1 1 7 7 StatusTrackingBarManager 0.0 17.0 -1 # 16 -1 1 5 5 UIParent 0.0 0.0 -1 #( 17 -1 1 1 1 UIParent 0.0 -100.0 -1 ## 18 -1 1 5 5 UIParent 0.0 0.0 -1 #- 19 -1 1 7 7 UIParent 0.0 0.0 -1 ## 20 0 0 0 0 UIParent 812.0 -687.0 -1 ##$/%$&('%(-($)#+$,$-# 20 1 0 0 0 UIParent 854.0 -732.0 -1 ##$/%$&('%(-($)#+$,$-# 20 2 0 1 1 UIParent 0.0 -602.0 -1 ##$$%$&('((-($)#+$,$-# 20 3 0 0 0 UIParent 539.0 -568.5 -1 #$$$%#&('((-($)#*#+$,$-#.i 21 -1 1 7 7 UIParent -410.0 380.0 -1 ##$# 22 0 1 8 7 UIParent -457.0 336.0 -1 #$$$%#&('((#)U*$+$,$-#.#/U0% 22 1 1 1 1 UIParent 0.0 -40.0 -1 &('()U*#+$ 22 2 1 1 1 UIParent 0.0 -90.0 -1 &('()U*#+$ 22 3 1 1 1 UIParent 0.0 -130.0 -1 &('()U*#+$ 23 -1 1 0 0 UIParent 0.0 0.0 -1 ##$#%$&-&$'7(%)U+$,$-$.(/U]]
	or [[2 50 0 0 1 7 7 UIParent 0.0 45.0 -1 ##$$%/&('%)$+$,$ 0 1 1 6 0 MainActionBar 0.0 5.0 -1 ##$$%/&('%(#,$ 0 2 1 6 0 MultiBarBottomLeft 0.0 5.0 -1 ##$$%/&('%(#,$ 0 3 1 5 5 UIParent -5.0 -77.0 -1 #$$$%/&('%(#,$ 0 4 1 2 0 MultiBarRight -5.0 0.0 -1 #$$$%/&('%(#,$ 0 5 1 1 4 UIParent 0.0 0.0 -1 ##$$%/&('%(#,$ 0 6 0 0 0 UIParent 999.0 -765.0 -1 ##$$%/&('%(#,$ 0 7 0 0 0 UIParent 999.0 -810.0 -1 ##$$%/&('%(#,$ 0 10 1 6 0 MainActionBar 0.0 5.0 -1 ##$$&('% 0 11 1 6 0 MainActionBar 0.0 5.0 -1 ##$$&('%,# 0 12 1 6 0 MainActionBar 0.0 5.0 -1 ##$$&('% 1 -1 1 4 4 UIParent 0.0 0.0 -1 ##$#%# 2 -1 1 2 2 UIParent 0.0 0.0 -1 ##$#%( 3 0 0 4 4 UIParent -261.0 -220.5 -1 $#3# 3 1 0 4 4 UIParent 260.0 -220.0 -1 %#3# 3 2 1 3 5 TargetFrame -10.0 0.0 -1 %#&#3# 3 3 1 0 2 CompactRaidFrameManager 0.0 -7.0 -1 '$(#)#-#.#/#1$3#5#6(7-7$ 3 4 0 0 0 UIParent 1.0 -990.0 -1 ,$-7.)/#0&1$2(5#6(7-7$ 3 5 1 5 5 UIParent 0.0 0.0 -1 &$*$3# 3 6 1 5 5 UIParent 0.0 0.0 -1 -#.#/#4&5#6(7-7$ 3 7 1 4 4 UIParent 0.0 0.0 -1 3# 4 -1 1 7 1 MainActionBar 0.0 5.0 -1 # 5 -1 0 3 3 UIParent 1228.7 -362.2 -1 # 6 0 1 2 0 MinimapCluster -10.0 -10.0 -1 ##$#%#&.(()( 6 1 1 2 8 BuffFrame -13.0 -15.0 -1 ##$#%#'+(()(-$ 6 2 0 0 0 UIParent 1087.5 -31.0 -1 ##$#%$&.(()(+#,-,$ 7 -1 0 4 4 UIParent 0.0 -445.5 -1 # 8 -1 0 1 1 UIParent -1036.5 -1282.0 -1 #($-%)&< 9 -1 1 6 0 MainActionBar 0.0 5.0 -1 # 10 -1 1 0 0 UIParent 16.0 -116.0 -1 # 11 -1 0 4 4 UIParent 939.7 -320.0 -1 # 12 -1 0 0 0 UIParent 2267.0 -238.0 -1 #A$#%# 13 -1 0 4 4 UIParent -920.0 580.0 -1 ##$#%%&% 14 -1 1 2 2 MicroButtonAndBagsBar 0.0 0.0 -1 ##$#%( 15 0 1 7 7 StatusTrackingBarManager 0.0 0.0 -1 # 15 1 1 7 1 MainStatusTrackingBarContainer 0.0 0.0 -1 # 16 -1 0 6 8 VehicleSeatIndicator 3.4 0.6 -1 #( 17 -1 1 1 1 UIParent 0.0 -100.0 -1 ## 18 -1 0 7 7 UIParent -533.8 1.4 -1 #' 19 -1 0 4 4 UIParent 0.0 -580.0 -1 ## 20 0 0 1 1 UIParent 0.0 -922.0 -1 ##$/%$&('((-($)#+$,$-# 20 1 0 0 0 UIParent 1148.3 -965.0 -1 ##$/%$&('((-($)#+$,$-# 20 2 0 1 1 UIParent 0.0 -862.0 -1 ##$$%$&('((-($)#+$,$-# 20 3 0 1 1 UIParent -289.6 -782.0 -1 #$$$%#&('((-($)#*#+$,$-#.e 21 -1 1 7 7 UIParent -410.0 380.0 -1 ##$# 22 0 1 8 7 UIParent -457.0 336.0 -1 #$$$%#&('((#)U*$+$,$ 22 1 1 1 1 UIParent 0.0 -40.0 -1 &('()U*#+$ 22 2 1 1 1 UIParent 0.0 -90.0 -1 &('()U*#+$ 22 3 1 1 1 UIParent 0.0 -130.0 -1 &('()U*#+$ 23 -1 0 7 7 UIParent 1000.0 342.0 -1 ##$$%$&-&$'7(%)U+$,$-$.(/U]]

	StaticPopup_Show('LUCKYONE_EDITBOX', nil, nil, importString)
end
