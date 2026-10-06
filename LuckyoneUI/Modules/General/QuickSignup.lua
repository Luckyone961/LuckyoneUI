local _, Private = ...

local hooksecurefunc = hooksecurefunc
local LFGListSearchPanel_SelectResult = LFGListSearchPanel_SelectResult
local LFGListSearchPanel_SignUp = LFGListSearchPanel_SignUp
local LFGListSearchPanelUtil_CanSelectResult = LFGListSearchPanelUtil_CanSelectResult

local _G = _G

-- Double-click LFG search results to open the signup
local function QuickSignup_OnDoubleClick(self, button)
	if button ~= 'LeftButton' then return end

	local resultID = self.resultID
	if not resultID or not LFGListSearchPanelUtil_CanSelectResult(resultID) then return end

	local panel = _G.LFGListFrame.SearchPanel
	if panel.selectedResult ~= resultID then
		LFGListSearchPanel_SelectResult(panel, resultID)
	end

	LFGListSearchPanel_SignUp(panel)
end

local function QuickSignup_Update(entry)
	if not entry.LuckyoneQuickSignup then
		entry:HookScript('OnDoubleClick', QuickSignup_OnDoubleClick)
		entry.LuckyoneQuickSignup = true
	end
end

function Private:QuickSignup()
	if not Private.Addon.db.profile.qualityOfLife.quickSignup then return end

	-- Update fires per entry on every list refresh, only set the handler once per entry
	hooksecurefunc('LFGListSearchEntry_Update', QuickSignup_Update)
end
