local Name, Private = ...
local E, L, V, P, G = unpack(ElvUI)
local S = E:GetModule('Skins')

local hooksecurefunc = hooksecurefunc
local next = next

local function reskinTlxScrollChild(self)
	for _, child in next, { self.ScrollTarget:GetChildren() } do
		local top = child.BgTop
		local middle = child.BgMiddle
		local bottom = child.BgBottom

		if top and not top.Skinned then
			top:Hide()
			top.Skinned = true
		end
		if middle and not middle.Skinned then
			middle:Hide()
			middle.Skinned = true
		end
		if bottom and not bottom.Skinned then
			bottom:Hide()
			bottom.Skinned = true
		end
	end
end

local function ReskinTlxScrollBox(frame)
	frame:DisableDrawLayer('BACKGROUND')
	frame:StripTextures()
	hooksecurefunc(frame, 'Update', reskinTlxScrollChild)
end

function L1UI:Skin_TalentLoadoutsEx()
	if not E.private.L1UI.skins.TalentLoadoutsEx then return end

	hooksecurefunc(TLX.Frame, 'OnLoad', function()
		if TlxFrame.Skinned then return end

		-- Main Frame
		TlxFrame.NineSlice:SetTemplate('Transparent')
		TlxFrame:Height(883)

		-- Buttons (Don't loop)
		S:HandleButton(TlxFrame.LoadButton)
		S:HandleButton(TlxFrame.EditButton)
		S:HandleButton(TlxFrame.UpButton)
		S:HandleButton(TlxFrame.SaveButton)
		S:HandleButton(TlxFrame.DeleteButton)
		S:HandleButton(TlxFrame.DownButton)

		-- Scroll
		S:HandleTrimScrollBar(TlxFrame.ScrollBar)
		ReskinTlxScrollBox(TlxFrame.ScrollBox)

		-- Misc
		TlxFrame.Bg:Kill()

		-- Reposition for pixel perfect style
		TlxFrame:ClearAllPoints()
		TlxFrame:Point('TOPLEFT', _G.ClassTalentFrame, 'TOPRIGHT', 1, 0)

		TlxFrame.Skinned = true
	end)

	hooksecurefunc(TlxPopupMixin, 'OnShow', function()
		if TlxFrame.PopupFrame.Skinned then return end

		-- Main Frame
		TlxFrame.PopupFrame:StripTextures()
		TlxFrame.PopupFrame:SetTemplate('Transparent')
		TlxFrame.PopupFrame.BorderBox:StripTextures()

		-- Buttons
		S:HandleButton(TlxFrame.PopupFrame.BorderBox.OkayButton)
		S:HandleButton(TlxFrame.PopupFrame.BorderBox.CancelButton)

		-- Scroll
		S:HandleTrimScrollBar(TlxFrame.PopupFrame.IconSelector.ScrollBar)

		-- EditBox
		TlxFrame.PopupFrame.BorderBox.IconSelectorEditBox:StripTextures()
		S:HandleEditBox(TlxFrame.PopupFrame.BorderBox.IconSelectorEditBox)

		-- Notes
		local notice = TlxFrame.PopupFrame.SearchNotice.NineSlice
		if notice then
			notice:SetTemplate('Transparent')
			notice:Point('TOPLEFT', TlxFrame.PopupFrame, 'BOTTOMLEFT', 6, 1)
			notice:Point('TOPRIGHT', TlxFrame.PopupFrame, 'BOTTOMRIGHT', -5, 1)
		end

		TlxFrame.PopupFrame.Skinned = true
	end)
end

S:AddCallbackForAddon('TalentLoadoutsEx', 'LuckyoneUI_TalentLoadoutsEx', L1UI.Skin_TalentLoadoutsEx)
