local _, Private = ...

if not Private.ElvUI then
	return
end

local unpack = unpack

local hooksecurefunc = hooksecurefunc

local E = unpack(ElvUI)
local S = E:GetModule('Skins')

-- The addon anchors the button once at the first PLAYER_ENTERING_WORLD, a second point would stretch it across the frame
local function NovaSpellRankChecker_PositionButton(button, point)
	if point == 'BOTTOMLEFT' then return end

	button:ClearAllPoints()
	button:Point('BOTTOMLEFT', SpellBookFrame, 'BOTTOMLEFT', 19, 100)
end

-- Forever builds the button when Blizzard_PlayerSpells loads
local function SpellBookFrame_Show()
	local button = PlayerSpellsFrameScanButton
	if not button or button.IsSkinned then return end

	local spellBook = PlayerSpellsFrame.SpellBookFrame
	button:SetParent(spellBook)
	button:Show()

	S:HandleButton(button)
	button:SetScale(1)
	button:Size(140, 20)

	-- Left of the search box, 1px apart
	local searchBox = spellBook.SearchBox
	button:ClearAllPoints()
	button:Point('RIGHT', searchBox.backdrop or searchBox.Left, 'LEFT', -1, 0)
end

local function Skin_NovaSpellRankChecker()
	if not Private.Addon.db.profile.skins.NovaSpellRankChecker then return end

	if Private.isForever then
		EventRegistry:RegisterCallback('PlayerSpellsFrame.SpellBookFrame.Show', SpellBookFrame_Show, 'LuckyoneUI_NovaSpellRankChecker')
		return
	end

	local button = SpellBookFrameScanButton
	if not button then return end

	-- Skin and resize the spell rank checker button
	S:HandleButton(button)
	button:SetFrameStrata('HIGH')
	button:Size(120, 26)

	-- Move it to the bottom left of the spell book frame
	NovaSpellRankChecker_PositionButton(button)
	hooksecurefunc(button, 'SetPoint', NovaSpellRankChecker_PositionButton)
end

S:AddCallbackForAddon('NovaSpellRankChecker', 'LuckyoneUI_NovaSpellRankChecker', Skin_NovaSpellRankChecker)
