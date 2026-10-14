local _, Private = ...

if not Private.ElvUI then
	return
end

local unpack = unpack

local CreateFrame = CreateFrame

local E = unpack(ElvUI)
local CH = E:GetModule('Chat')

local resizeButton
local styled

local function ResizeButton_OnMouseDown(self)
	self:SetButtonState('PUSHED', true)
	CH.CopyChatFrame:StartSizing('BOTTOMRIGHT')
end

-- Also runs when the frame closes mid-drag
local function ResizeButton_OnMouseUp(self)
	self:SetButtonState('NORMAL', false)
	CH.CopyChatFrame:StopMovingOrSizing()
end

-- The scroll bar ends above the button while it is shown
local function SetResizeButton(show)
	if show and not resizeButton then
		local frame = CH.CopyChatFrame
		frame:SetResizeBounds(200, 120, 2000, 1200)

		resizeButton = CreateFrame('Button', nil, frame)
		resizeButton:Size(16)
		resizeButton:Point('BOTTOMRIGHT', frame, 'BOTTOMRIGHT', -2, 2)
		resizeButton:SetNormalTexture([[Interface\ChatFrame\UI-ChatIM-SizeGrabber-Up]])
		resizeButton:SetHighlightTexture([[Interface\ChatFrame\UI-ChatIM-SizeGrabber-Highlight]])
		resizeButton:SetPushedTexture([[Interface\ChatFrame\UI-ChatIM-SizeGrabber-Down]])
		resizeButton:SetScript('OnMouseDown', ResizeButton_OnMouseDown)
		resizeButton:SetScript('OnMouseUp', ResizeButton_OnMouseUp)
		resizeButton:SetScript('OnHide', ResizeButton_OnMouseUp)
	end

	if resizeButton then
		resizeButton:SetShown(show)
		CH.CopyChatScrollFrame.ScrollBar:SetPoint('BOTTOMLEFT', CH.CopyChatScrollFrame, 'BOTTOMRIGHT', 6, show and 32 or 16)
	end
end

function Private:CopyChat()
	local frame, editBox = CH.CopyChatFrame, CH.CopyChatFrameEditBox
	if not frame then return end

	local db = Private.Addon.db.profile.misc.copyChat

	if db.enable then
		SetResizeButton(db.sizing == 'BUTTON')
		Private:SetFont(editBox, db.font, db.fontSize, db.fontOutline)

		-- Dragged sizes are not stored
		if db.sizing == 'CUSTOM' then
			frame:Size(db.width, db.height)
		end

		styled = true
	elseif styled then
		-- Back to the ElvUI font and size
		SetResizeButton(false)
		editBox:SetFontObject('ChatFontNormal')
		frame:Size(700, 200)
		styled = false
	end
end
