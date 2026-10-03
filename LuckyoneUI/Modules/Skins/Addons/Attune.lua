local _, Private = ...

if not Private.ElvUI then
	return
end

local next = next
local unpack = unpack

local hooksecurefunc = hooksecurefunc

local _G = _G

local E = unpack(ElvUI)
local S = E:GetModule('Skins')

local function Skin_Frame()
	local frame = Attune_MainFrame

	-- Portrait Frame, Attune removed ElvUI's backdrop from the window underneath
	local chrome = AttuneBronzeChrome
	if chrome then
		S:HandlePortraitFrame(chrome)
		frame.obj.content:Point('TOPLEFT', frame, 'TOPLEFT', 17, -27)
	end

	-- Survey and Results Buttons
	for _, child in next, { frame:GetChildren() } do
		if child:IsObjectType('Button') and child:GetText() then
			S:HandleButton(child)
		end
	end
end

-- Attune darkens every new TreeGroup after ElvUI's Ace3 skin styled it
local function Skin_ToggleView()
	for _, widget in next, Attune_MainFrame.obj.children do
		if widget.type == 'TreeGroup' then
			widget.treeframe:SetTemplate('Transparent')
			widget.border:SetTemplate('Transparent')
		end
	end
end

-- Box behind the steps inside the dungeon
local function Skin_Select()
	local sideBox = Attune_SideBox
	if sideBox then
		sideBox:SetTemplate('Transparent', nil, true)
	end
end

-- Graph nodes
local function Skin_Node(step)
	if step.TYPE == 'Spacer' then return end

	-- Quest state, next step, attunement
	local node = _G['Attune_Node_'..step.ID]
	local r, g, b, a = node:GetBackdropColor()
	local borderR, borderG, borderB, borderA = node:GetBackdropBorderColor()

	-- Forced pixel mode
	node:SetTemplate(nil, nil, true, true)
	node:SetBackdropColor(r, g, b, a)
	node:SetBackdropBorderColor(borderR, borderG, borderB, borderA)

	-- Step Icon
	local icon = _G['Attune_Icon_'..step.ID]
	icon:GetNormalTexture():SetTexCoords()

	if not icon.backdrop then
		icon:CreateBackdrop()
	end
end

-- Reward rows are created lazily
local function RewardChild_SetHeight()
	for _, row in next, AttuneQuestDetail.rows do
		if not row.icon.backdrop then
			S:HandleIcon(row.icon, true)
		end
	end
end

-- Quest details, opened over the tree by clicking a quest step
local function Skin_QuestDetail()
	local panel = AttuneQuestDetail
	if not panel or panel.isSkinned then return end

	panel:SetTemplate('Transparent')

	-- Close Button
	S:HandleCloseButton((panel:GetChildren()))

	-- The map border already separates the rewards from the map
	panel.separator:SetAlpha(0)

	-- Map and Zoom Buttons
	local map = panel.map
	map:SetTemplate()

	local _, zoomOut, zoomIn = map:GetChildren()
	S:HandleButton(zoomOut)
	S:HandleButton(zoomIn)

	-- Reward Icons
	hooksecurefunc(panel.rewardChild, 'SetHeight', RewardChild_SetHeight)
	RewardChild_SetHeight()

	panel.isSkinned = true
end

-- Sync progress (/attune sync)
local function Skin_SyncProgress()
	Attune_SyncProgress_Frame:SetTemplate('Transparent')

	local bar = Attune_SyncProgress_StatusBar
	bar:SetBackdrop()
	bar:SetStatusBarTexture(E.media.normTex)

	if not bar.backdrop then
		bar:CreateBackdrop()
	end
end

-- Attune builds its window on the first /attune or Broker click
local function Skin_Attune()
	if not Private.Addon.db.profile.skins.Attune then return end

	hooksecurefunc('Attune_Frame', Skin_Frame)
	hooksecurefunc('Attune_Select', Skin_Select)
	hooksecurefunc('Attune_CreateNode', Skin_Node)
	hooksecurefunc('Attune_ShowQuestDetail', Skin_QuestDetail)
	hooksecurefunc('Attune_StartSync', Skin_SyncProgress)

	-- Only restores what ElvUI's Ace3 skin set
	if E.private.skins.ace3Enable then
		hooksecurefunc('Attune_ToggleView', Skin_ToggleView)
	end
end

S:AddCallbackForAddon('Attune', 'LuckyoneUI_Attune', Skin_Attune)
