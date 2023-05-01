local Name, Private = ...
local E, L, V, P, G = unpack(ElvUI)

if not E.Retail then return end

-- OnClick
function L1UI_OnAddonCompartmentClick()
	E:ToggleOptions()
	E.Libs.AceConfigDialog:SelectGroup('ElvUI', 'L1UI')
end

--[[
	function L1UI_OnAddonCompartmentEnter()
		Private:Print('OnEnter Test Print')
	end
]]

--[[
	function L1UI_OnAddonCompartmentLeave()
		Private:Print('OnLeave Test Print')
	end
]]
