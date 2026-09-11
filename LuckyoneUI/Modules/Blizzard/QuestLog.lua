local _, Private = ...

local CreateFrame = CreateFrame
local hooksecurefunc = hooksecurefunc
local SetUIPanelAttribute = SetUIPanelAttribute

local _G = _G

local initialized

-- FauxScrollFrame_Update hides the whole list once everything fits
-- Keep the list and only toggle the scrollbar, the empty log shows its own text instead
local function QuestLog_UpdateList()
	local list = _G.QuestLogListScrollFrame
	local overflow = list:IsShown()

	list:SetShown(not _G.EmptyQuestLogFrame:IsShown())
	list.ScrollBar:SetShown(overflow)
end

-- Doubles the quest log so the quest list and the quest details sit side by side like in Wrath
function Private:ExpandQuestLog()
	if initialized then return end
	if not Private.Addon.db.profile.qualityOfLife.expandQuestLog then return end

	-- Without the ElvUI skin the Blizzard textures get too stretched and text becomes unreadable
	if not (Private.ElvUI and ElvUI[1].private.skins.blizzard.enable and ElvUI[1].private.skins.blizzard.quest) then return end

	local QuestLogFrame = _G.QuestLogFrame
	local list = _G.QuestLogListScrollFrame
	local detail = _G.QuestLogDetailScrollFrame
	if not (QuestLogFrame and list and detail) then return end

	local grown = list:GetWidth() + 34
	QuestLogFrame:SetWidth(QuestLogFrame:GetWidth() + grown)

	-- Both columns end right above the buttons
	list:SetHeight(366)

	detail:ClearAllPoints()
	detail:SetPoint('TOPLEFT', list, 'TOPRIGHT', 34, 0)
	detail:SetHeight(366)

	for i = _G.QUESTS_DISPLAYED + 1, 24 do
		local title = CreateFrame('Button', 'QuestLogTitle' .. i, QuestLogFrame, 'QuestLogTitleButtonTemplate')
		title:SetID(i)
		title:SetPoint('TOPLEFT', _G['QuestLogTitle' .. (i - 1)], 'BOTTOMLEFT', 0, 1)
		title:Hide()
	end

	_G.QUESTS_DISPLAYED = 24

	SetUIPanelAttribute(QuestLogFrame, 'area', 'doublewide')

	local width = QuestLogFrame:GetAttribute('UIPanelLayout-width')
	if width then
		SetUIPanelAttribute(QuestLogFrame, 'width', width + grown)
	end

	hooksecurefunc('QuestLog_Update', QuestLog_UpdateList)

	initialized = true
end
