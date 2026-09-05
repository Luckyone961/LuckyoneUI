local _, Private = ...
local DM = Private.Modules.DamageMeter

if not DM then return end

local LSM = Private.Libs.LSM

local unpack = unpack
local floor = math.floor
local ipairs = ipairs
local max = math.max

local CreateAbbreviateConfig = CreateAbbreviateConfig
local CreateFrame = CreateFrame
local GetClassAtlas = GetClassAtlas
local GetSpellName = C_Spell.GetSpellName
local GetSpellTexture = C_Spell.GetSpellTexture
local IsDamageMeterAvailable = C_DamageMeter.IsDamageMeterAvailable
local AbbreviateNumbers = AbbreviateNumbers
local SecondsToClock = SecondsToClock
local issecretvalue = issecretvalue or function() return false end

local UNKNOWN = UNKNOWN
local DAMAGE_METER_SOURCE_NAME = DAMAGE_METER_SOURCE_NAME
local DAMAGE_METER_SPELL_ENTRY_CREATURE = DAMAGE_METER_SPELL_ENTRY_CREATURE
local DAMAGE_METER_SPELL_ENTRY_UNIT = DAMAGE_METER_SPELL_ENTRY_UNIT

local E = unpack(ElvUI)

local renderAbbrev, renderFormats

-- Expand the ElvUI abbrev to support values below 1k
-- This fixes 13 random decimals showing for low dps/hps numbers
local abbrevSource, abbrevOptions
local function GetAbbreviate()
	local config = E.Abbreviate.short.config
	if not config then return E.Abbreviate.short end

	if abbrevSource ~= config then
		abbrevSource = config

		local data = config:GetAbbreviateNumberData()

		data[#data + 1] = {
			breakpoint = 1e-9, -- This is 0.000000001 because 0 is not accepted/valid
			abbreviation = '',
			significandDivisor = 0.1,
			fractionDivisor = 10,
			abbreviationIsGlobal = false
		}

		abbrevOptions = { config = CreateAbbreviateConfig(data) }
	end

	return abbrevOptions
end

local function FormatAmount(amount)
	return AbbreviateNumbers(amount, renderAbbrev)
end

-- Value formats for the secondary number
-- Only rebuilt when the bracket style changes
local formatKey, valueFormats
local function GetValueFormats(db)
	local style = db.bracketStyle

	if formatKey ~= style then
		formatKey = style

		local chars = DM.BracketChars[style] or DM.BracketChars.PARENTHESES
		local open, close = chars[1], chars[2]

		valueFormats = {
			both = open .. '%s, %.0f%%' .. close,
			percent = open .. '%.0f%%' .. close,
			single = open .. '%s' .. close,
		}
	end

	return valueFormats
end

local SampleAmount = '999.9M'
local sampleWidth, sampleText
local function GetSampleWidth(db)
	if sampleWidth then return sampleWidth end

	if not sampleText then
		sampleText = E.HiddenFrame:CreateFontString(nil, 'OVERLAY')
		sampleText:SetWordWrap(false)
	end

	sampleText:FontTemplate(db.font, db.fontSize, db.fontOutline)
	sampleText:SetFormattedText(renderFormats.single, SampleAmount)
	sampleWidth = sampleText:GetStringWidth()

	return sampleWidth
end

local function Bar_OnClick(bar, mouseButton)
	if mouseButton == 'RightButton' then
		DM:WindowRightClick(bar.window)
	elseif bar.entry and not bar.window.spellMode then
		DM:OpenPopup(bar.window, bar.entry)
	end
end

local function Bar_OnEnter(bar)
	DM:UpdateHeaderButtons(bar.window)

	if not DM.db.mouseoverHighlight then return end

	bar.highlight:Show()
end

local function Bar_OnLeave(bar)
	DM:UpdateHeaderButtons(bar.window)
	bar.highlight:Hide()
end

local function CreateBar(window)
	local bar = CreateFrame('Button', nil, window.content)
	bar:RegisterForClicks('LeftButtonUp', 'RightButtonUp')
	bar:SetScript('OnClick', Bar_OnClick)
	bar:SetScript('OnEnter', Bar_OnEnter)
	bar:SetScript('OnLeave', Bar_OnLeave)
	bar.window = window

	bar.bg = bar:CreateTexture(nil, 'BACKGROUND')
	bar.bg:SetAllPoints()

	bar.icon = bar:CreateTexture(nil, 'ARTWORK')
	bar.icon:Point('LEFT')

	local status = CreateFrame('StatusBar', nil, bar)
	status:SetFrameLevel(bar:GetFrameLevel() + 1)
	bar.status = status

	-- Parented to the status bar to sit above the fill, below the texts
	bar.highlight = status:CreateTexture(nil, 'OVERLAY', nil, -1)
	bar.highlight:SetTexture(E.media.blankTex)
	bar.highlight:SetVertexColor(1, 1, 1, 0.2)
	bar.highlight:SetAllPoints(bar)
	bar.highlight:Hide()

	bar.persec = status:CreateFontString(nil, 'OVERLAY')
	bar.persec:SetJustifyH('RIGHT')
	bar.persec:SetWordWrap(false)

	bar.value = status:CreateFontString(nil, 'OVERLAY')
	bar.value:SetJustifyH('RIGHT')
	bar.value:SetWordWrap(false)

	bar.name = status:CreateFontString(nil, 'OVERLAY')
	bar.name:SetJustifyH('LEFT')
	bar.name:SetWordWrap(false)

	return bar
end

-- Edge textures instead of a backdrop frame per bar
-- Separator is between class/spec icon and the bar
local BorderEdges = { 'top', 'bottom', 'left', 'right', 'separator' }

local function SetBarBorder(bar, size, iconShown)
	local border = bar.border

	if not border then
		if size == 0 then return end

		border = {}
		bar.border = border

		for _, edge in ipairs(BorderEdges) do
			local texture = bar:CreateTexture(nil, 'OVERLAY')
			texture:SetTexture(E.media.blankTex)
			border[edge] = texture
		end
	end

	local shown = size > 0
	local r, g, b = unpack(E.media.bordercolor)

	for _, edge in ipairs(BorderEdges) do
		local texture = border[edge]
		texture:ClearAllPoints()
		texture:SetShown(shown)
		texture:SetVertexColor(r, g, b)
	end

	if not shown then return end

	-- Drawn outside the bar so the icon and the status bar keep their space
	border.top:Point('BOTTOMLEFT', bar, 'TOPLEFT', -size, 0)
	border.top:Point('BOTTOMRIGHT', bar, 'TOPRIGHT', size, 0)
	border.top:Height(size)

	border.bottom:Point('TOPLEFT', bar, 'BOTTOMLEFT', -size, 0)
	border.bottom:Point('TOPRIGHT', bar, 'BOTTOMRIGHT', size, 0)
	border.bottom:Height(size)

	border.left:Point('TOPRIGHT', bar, 'TOPLEFT', 0, 0)
	border.left:Point('BOTTOMRIGHT', bar, 'BOTTOMLEFT', 0, 0)
	border.left:Width(size)

	border.right:Point('TOPLEFT', bar, 'TOPRIGHT', 0, 0)
	border.right:Point('BOTTOMLEFT', bar, 'BOTTOMRIGHT', 0, 0)
	border.right:Width(size)

	-- Splits the icon and the bar
	border.separator:SetShown(iconShown)
	border.separator:Point('TOPLEFT', bar.icon, 'TOPRIGHT', 0, 0)
	border.separator:Point('BOTTOMLEFT', bar.icon, 'BOTTOMRIGHT', 0, 0)
	border.separator:Width(size)
end

-- Blizzard styles, Default, Bordered and Thin
-- https://github.com/Gethe/wow-ui-source/blob/live/Interface/AddOns/Blizzard_DamageMeter/DamageMeterEntry.lua
local function SetBarAnchors(db, bar, iconShown)
	if bar.iconsShown == iconShown then return end
	bar.iconsShown = iconShown

	bar.icon:SetShown(iconShown)

	local style = db.barStyle
	local status, name, value, persec = bar.status, bar.name, bar.value, bar.persec

	local relative = iconShown and bar.icon or bar
	local relativePoint = iconShown and 'RIGHT' or 'LEFT'

	-- Bordered wraps the bar and splits off the icon with the same border
	local border = (style == 'BORDERED') and (E.twoPixelsPlease and 2 or 1) or 0
	local separator = iconShown and border or 0

	status:ClearAllPoints()
	name:ClearAllPoints()
	value:ClearAllPoints()
	persec:ClearAllPoints()

	if style == 'THIN' then
		-- Both texts sit on top, the bar only fills the leftover height
		persec:Point('TOP', bar, 'TOP', 0, db.valueYOffset)
		persec:Point('RIGHT', bar, 'RIGHT', -2 + db.valueXOffset, 0)

		value:Point('TOP', bar, 'TOP', 0, db.valueYOffset)
		value:Point('RIGHT', persec, 'LEFT', 0, 0)

		name:Point('TOP', bar, 'TOP', 0, db.nameYOffset)
		name:Point('LEFT', relative, relativePoint, 2 + db.nameXOffset, 0)
		name:Point('RIGHT', value, 'LEFT', -8, 0)

		status:Point('LEFT', relative, relativePoint, 0, 0)
		status:Point('TOP', name, 'BOTTOM', 0, 0)
		status:Point('BOTTOMRIGHT', bar, 'BOTTOMRIGHT', 0, 0)
	else
		status:Point('TOPLEFT', relative, iconShown and 'TOPRIGHT' or 'TOPLEFT', separator, 0)
		status:Point('BOTTOMRIGHT', bar, 'BOTTOMRIGHT', 0, 0)

		persec:Point('RIGHT', status, 'RIGHT', -2 + db.valueXOffset, db.valueYOffset)
		value:Point('RIGHT', persec, 'LEFT', 0, 0)

		-- It has to cancel out that offset
		name:Point('LEFT', status, 'LEFT', 2 + db.nameXOffset, db.nameYOffset)
		name:Point('RIGHT', value, 'LEFT', -8, db.nameYOffset - db.valueYOffset)
	end

	SetBarBorder(bar, border, iconShown)
end

local function ApplyBarSettings(db, window, bar, index, texture)
	local yOffset = -((index - 1) * (db.barHeight + db.barSpacing))

	bar:ClearAllPoints()
	bar:Point('TOPLEFT', window.content, 'TOPLEFT', 0, yOffset)
	bar:Point('TOPRIGHT', window.content, 'TOPRIGHT', 0, yOffset)
	bar:Height(db.barHeight)
	bar.icon:Size(db.barHeight)

	bar.status:SetStatusBarTexture(texture)
	bar.bg:SetTexture(texture)
	bar.bg:SetAlpha(db.backdropAlpha)

	bar.highlight:Hide()

	bar.name:FontTemplate(db.font, db.fontSize, db.fontOutline)
	bar.value:FontTemplate(db.font, db.fontSize, db.fontOutline)
	bar.persec:FontTemplate(db.font, db.fontSize, db.fontOutline)

	-- Wipe cached states so we can insta display setting changes
	bar.colorKey = nil
	bar.iconFile = nil
	bar.iconAtlas = nil
	bar.lastName = nil
	bar.lastRank = nil
	bar.iconsShown = nil
end

-- Refreshes the bars afterwards
function DM:UpdateWindowGeometry(window, width, height)
	local db = DM.db
	local contentHeight = height - db.headerHeight

	local visibleCount = 0
	if contentHeight >= db.barHeight then
		visibleCount = floor((contentHeight + db.barSpacing) / (db.barHeight + db.barSpacing))
	end

	window.visibleCount = visibleCount
	window.contentHeight = contentHeight
	window.columnWidth = nil
	sampleWidth = nil

	local texture = LSM:Fetch('statusbar', db.barTexture)

	for i = 1, visibleCount do
		local bar = window.bars[i]
		if not bar then
			bar = CreateBar(window)
			window.bars[i] = bar
		end

		ApplyBarSettings(db, window, bar, i, texture)
	end

	for i = visibleCount + 1, #window.bars do
		window.bars[i]:Hide()
	end
end

local function SetBarIcon(bar, fileID, atlas)
	if fileID then
		if bar.iconFile ~= fileID then
			bar.iconFile = fileID
			bar.iconAtlas = nil
			bar.icon:SetTexture(fileID)
			bar.icon:SetTexCoord(unpack(E.TexCoords))
		end
	elseif atlas then
		if bar.iconAtlas ~= atlas then
			bar.iconAtlas = atlas
			bar.iconFile = nil
			bar.icon:SetAtlas(atlas)
		end
	elseif bar.iconFile or bar.iconAtlas then
		bar.iconFile = nil
		bar.iconAtlas = nil
		bar.icon:SetTexture(nil)
	end
end

local function UpdateBarIcon(bar, entry, spellMode)
	local fileID, atlas

	if spellMode then
		local details = entry.combatSpellDetails
		local specIcon = details and details.specIconID

		if specIcon and specIcon ~= 0 then
			fileID = specIcon
		elseif entry.spellID and not issecretvalue(entry.spellID) then
			fileID = GetSpellTexture(entry.spellID)
		end
	else
		local specIcon = entry.specIconID

		if specIcon and specIcon ~= 0 then
			fileID = specIcon
		elseif entry.classFilename and entry.classFilename ~= '' then
			atlas = GetClassAtlas(entry.classFilename)
		end
	end

	SetBarIcon(bar, fileID, atlas)
end

local function UpdateBarColor(db, bar, entry, spellMode)
	local classFilename = entry.classFilename
	if spellMode and (not classFilename or classFilename == '') then
		local details = entry.combatSpellDetails
		classFilename = details and details.unitClassFilename
	end
	if not classFilename then classFilename = '' end

	-- Class name comparison is secret safe
	if classFilename == bar.colorKey then return end
	bar.colorKey = classFilename

	local classColor = classFilename ~= '' and E:ClassColor(classFilename, true)
	local color = (db.barColorType == 'CLASS' and classColor) or db.barColor

	bar.status:SetStatusBarColor(color.r, color.g, color.b, db.barAlpha)

	-- Backdrop color can be custom
	local backdrop = db.backdropColorType == 'CUSTOM' and db.backdropColor or color
	bar.bg:SetVertexColor(backdrop.r, backdrop.g, backdrop.b)

	-- Text color can be custom or class
	local nameColor = (db.nameColorType == 'CLASS' and classColor) or db.nameColor
	local valueColor = (db.valueColorType == 'CLASS' and classColor) or db.valueColor

	bar.name:SetTextColor(nameColor.r, nameColor.g, nameColor.b)
	bar.value:SetTextColor(valueColor.r, valueColor.g, valueColor.b)
	bar.persec:SetTextColor(valueColor.r, valueColor.g, valueColor.b)
end

local function UpdateBarStatus(bar, entry, maxAmount, deathEntry)
	local status = bar.status

	if deathEntry then
		status:SetMinMaxValues(0, 1)
		status:SetValue(1)
	else
		status:SetMinMaxValues(0, maxAmount)
		status:SetValue(entry.totalAmount)
	end
end

local function UpdateBarName(db, bar, entry, rank, spellMode)
	local nameText = bar.name

	if spellMode then
		bar.lastName = nil

		local spellID = entry.spellID
		if not spellID or issecretvalue(spellID) then
			nameText:SetText(UNKNOWN)
			return
		end

		local spellName = GetSpellName(spellID) or UNKNOWN
		local creatureName = entry.creatureName
		local details = entry.combatSpellDetails
		local unitName = details and details.unitName

		if creatureName and (issecretvalue(creatureName) or creatureName ~= '') then
			nameText:SetFormattedText(DAMAGE_METER_SPELL_ENTRY_CREATURE, spellName, creatureName)
		elseif unitName and (issecretvalue(unitName) or unitName ~= '') then
			nameText:SetFormattedText(DAMAGE_METER_SPELL_ENTRY_UNIT, spellName, DM:StripRealm(unitName, details.unitClassFilename))
		else
			nameText:SetText(spellName)
		end

		return
	end

	local rawName = entry.name
	local nameSecret = issecretvalue(rawName)

	-- Comparisons are only safe on non-secret names
	if not nameSecret and rawName == bar.lastName and rank == bar.lastRank then return end
	bar.lastName = not nameSecret and rawName or nil
	bar.lastRank = rank

	local name = DM:StripRealm(rawName or '', entry.classFilename)

	if db.showRank then
		nameText:SetFormattedText(DAMAGE_METER_SOURCE_NAME, rank, name)
	else
		nameText:SetText(name)
	end
end

local function UpdateBarValue(db, bar, entry, sessionTotal, sessionSecret, persecPrimary, suppressPersec, deathEntry)
	local valueText, persecText = bar.value, bar.persec

	if deathEntry then
		local deathTime = entry.deathTimeSeconds
		if issecretvalue(deathTime) or not deathTime or deathTime <= 0 then
			valueText:SetText('')
		else
			valueText:SetText(SecondsToClock(deathTime))
		end

		persecText:SetText('')
		return
	end

	local total = entry.totalAmount
	local persec = entry.amountPerSecond

	local primary, secondary
	if persecPrimary then
		primary, secondary = persec, total
	else
		primary, secondary = total, persec
	end

	if suppressPersec then
		secondary = nil
	end

	local display = db.numberDisplay

	valueText:SetText(FormatAmount(primary))

	if display == 'COMPLETE' and not (sessionSecret or issecretvalue(total)) then
		local percent = sessionTotal > 0 and (total / sessionTotal * 100) or 0

		if secondary then
			persecText:SetFormattedText(renderFormats.both, FormatAmount(secondary), percent)
		else
			persecText:SetFormattedText(renderFormats.percent, percent)
		end
	elseif display ~= 'MINIMAL' and secondary then
		persecText:SetFormattedText(renderFormats.single, FormatAmount(secondary))
	else
		persecText:SetText('')
	end
end

local function UpdateValueColumn(db, window)
	local width, secret = 0, false

	-- Value spacing only applies if the slider is greater than 0 in the config
	if db.valueSpacing > 0 then
		for i = 1, window.visibleCount do
			local bar = window.bars[i]
			if bar.entry then
				local barWidth = bar.persec:GetStringWidth()

				if issecretvalue(barWidth) then
					secret = true
				else
					width = max(width, barWidth)
				end
			end
		end

		if secret then
			width = max(width, GetSampleWidth(db))
		end

		if width > 0 then
			width = width + E:Scale(db.valueSpacing)
		end
	end

	if window.columnWidth == width then return end
	window.columnWidth = width

	for i = 1, window.visibleCount do
		window.bars[i].persec:SetWidth(width)
	end
end

function DM:RenderWindow(window)
	local db = DM.db
	if not db or window.visibleCount == 0 then return end

	renderAbbrev = GetAbbreviate()
	renderFormats = GetValueFormats(db)

	-- Only the session windows carry the availability message
	if window.infoText then
		local available, failureReason = IsDamageMeterAvailable()
		local info = (not available and not DM.testMode) and failureReason or ''

		if window.lastInfo ~= info then
			window.lastInfo = info
			window.infoText:SetText(info)
		end
	end

	local session = DM:GetSession(window)
	local spellMode = window.spellMode
	local entries = session and (spellMode and session.combatSpells or session.combatSources)
	local numEntries = entries and #entries or 0
	window.numEntries = numEntries

	local maxOffset = max(0, numEntries - window.visibleCount)
	if window.offset > maxOffset then
		window.offset = maxOffset
	end

	local offset = window.offset
	local maxAmount = session and session.maxAmount or 0
	local sessionTotal = session and session.totalAmount or 0
	local sessionSecret = issecretvalue(sessionTotal)

	local meterType = window.meterType
	local persecPrimary = DM.TypePerSecondPrimary[meterType]
	local suppressPersec = DM.TypeSuppressPerSecond[meterType]
	local iconsShown = db.showIcons and (spellMode or not DM.TypeSuppressIcon[meterType])

	for i = 1, window.visibleCount do
		local bar = window.bars[i]
		local entry = entries and entries[offset + i]

		if entry then
			local deathEntry = not spellMode and entry.deathRecapID and entry.deathRecapID ~= 0

			bar.entry = entry
			SetBarAnchors(db, bar, iconsShown)
			UpdateBarStatus(bar, entry, maxAmount, deathEntry)
			UpdateBarColor(db, bar, entry, spellMode)
			if iconsShown then
				UpdateBarIcon(bar, entry, spellMode)
			end
			UpdateBarName(db, bar, entry, offset + i, spellMode)
			UpdateBarValue(db, bar, entry, sessionTotal, sessionSecret, persecPrimary, suppressPersec, deathEntry)
			bar:Show()
		else
			bar.entry = nil
			bar:Hide()
		end
	end

	UpdateValueColumn(db, window)
end
