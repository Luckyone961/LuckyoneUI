local _, Private = ...
local DM = Private.Modules.DamageMeter

if not DM then return end

local LSM = Private.Libs.LSM

local unpack = unpack
local format = string.format
local gsub = string.gsub
local match = string.match
local floor = math.floor
local ipairs = ipairs
local max = math.max
local min = math.min
local wipe = wipe

local CreateAbbreviateConfig = CreateAbbreviateConfig
local CreateFrame = CreateFrame
local GetClassAtlas = GetClassAtlas
local GetSpellName = C_Spell.GetSpellName
local GetSpellTexture = C_Spell.GetSpellTexture
local IsDamageMeterAvailable = C_DamageMeter.IsDamageMeterAvailable
local WrapString = C_StringUtil.WrapString
local AbbreviateNumbers = AbbreviateNumbers
local SecondsToClock = SecondsToClock
local issecretvalue = issecretvalue or function() return false end

local UNKNOWN = UNKNOWN
local DAMAGE_METER_SOURCE_NAME = DAMAGE_METER_SOURCE_NAME
local DAMAGE_METER_SPELL_ENTRY_CREATURE = DAMAGE_METER_SPELL_ENTRY_CREATURE
local DAMAGE_METER_SPELL_ENTRY_UNIT = DAMAGE_METER_SPELL_ENTRY_UNIT

local E = unpack(ElvUI)

local MeterType = Enum.DamageMeterType

local TypePerSecondPrimary = {
	[MeterType.Dps] = true,
	[MeterType.Hps] = true,
}

local TypeSuppressPerSecond = {
	[MeterType.Interrupts] = true,
	[MeterType.Dispels] = true,
	[MeterType.Deaths] = true,
}

local TypeSuppressIcon = {
	[MeterType.EnemyDamageTaken] = true,
}

-- Deaths and enemies dont support "Always Show Yourself"
local TypeSuppressPin = {
	[MeterType.Deaths] = true,
	[MeterType.EnemyDamageTaken] = true,
}

local TypeReverseOrder = {
	[MeterType.Deaths] = true, -- By default first death shows at the bottom, reverse it to the top
}

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

-- Bracket styling () [] etc
local BracketChars = {
	PARENTHESES = { '(', ')' },
	SQUARE = { '[', ']' },
	NONE = { '', '' },
}

-- Value formats for the secondary number
-- Only rebuilt when the bracket style changes
local formatKey, valueFormats
local function GetValueFormats(db)
	local style = db.bracketStyle

	if formatKey ~= style then
		formatKey = style

		local chars = BracketChars[style] or BracketChars.PARENTHESES
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
local SampleRanks = { 9, 99 }

-- Blizzards format with the trailing name dropped, that space belongs to the slider now
local RankFormat = gsub(DAMAGE_METER_SOURCE_NAME, '%s*%%s$', '')

-- Everything the spell formats put around the source, WrapString wants those two halves
local function SplitSourceFormat(sourceFormat, prefix, suffix)
	local left, right = match(sourceFormat, '^%%s(.-)%%s(.*)$')
	return left or prefix, right or suffix
end

local CreaturePrefix, CreatureSuffix = SplitSourceFormat(DAMAGE_METER_SPELL_ENTRY_CREATURE, ' (', ')')
local UnitPrefix, UnitSuffix = SplitSourceFormat(DAMAGE_METER_SPELL_ENTRY_UNIT, ' - ', '')

local sampleText
local sampleWidths = {}

local function GetSampleWidth(db, key)
	local width = sampleWidths[key]
	if width then return width end

	if not sampleText then
		sampleText = E.HiddenFrame:CreateFontString(nil, 'OVERLAY')
		sampleText:SetWordWrap(false)
	end

	sampleText:FontTemplate(db.font, db.fontSize, db.fontOutline)

	if key == 'value' then
		sampleText:SetFormattedText(renderFormats.single, SampleAmount)
	else
		sampleText:SetFormattedText(RankFormat, SampleRanks[key], '')
	end

	width = sampleText:GetStringWidth()
	sampleWidths[key] = width

	return width
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

-- All four texts share the same setup, only the side they align to differs
local function CreateBarText(status, justify)
	local text = status:CreateFontString(nil, 'OVERLAY')
	text:SetJustifyH(justify)
	text:SetWordWrap(false)

	return text
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

	bar.persec = CreateBarText(status, 'RIGHT')
	bar.value = CreateBarText(status, 'RIGHT')

	-- Custom font string so every name can start at the same position
	bar.rank = CreateBarText(status, 'LEFT')
	bar.name = CreateBarText(status, 'LEFT')

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
	local status, rank, name, value, persec = bar.status, bar.rank, bar.name, bar.value, bar.persec

	local relative = iconShown and bar.icon or bar
	local relativePoint = iconShown and 'RIGHT' or 'LEFT'

	-- Bordered wraps the bar and splits off the icon with the same border
	local border = (style == 'BORDERED') and (E.twoPixelsPlease and 2 or 1) or 0
	local separator = iconShown and border or 0

	status:ClearAllPoints()
	rank:ClearAllPoints()
	name:ClearAllPoints()
	value:ClearAllPoints()
	persec:ClearAllPoints()

	-- Only the thin style sets a fixed height, zero hands it back to the anchors
	status:Height(0)

	if style == 'THIN' then
		-- Both texts sit on top, the bar only fills the leftover height
		persec:Point('TOP', bar, 'TOP', 0, db.valueYOffset)
		persec:Point('RIGHT', bar, 'RIGHT', -2 + db.valueXOffset, 0)

		value:Point('TOP', bar, 'TOP', 0, db.valueYOffset)
		value:Point('RIGHT', persec, 'LEFT', 0, 0)

		-- Empty rank has no width, the name keeps its spot without it
		rank:Point('TOP', bar, 'TOP', 0, db.nameYOffset)
		rank:Point('LEFT', relative, relativePoint, 2 + db.nameXOffset, 0)

		name:Point('TOP', bar, 'TOP', 0, db.nameYOffset)
		name:Point('LEFT', rank, 'RIGHT', 0, 0)
		name:Point('RIGHT', value, 'LEFT', -8, 0)

		-- Custom height sits on the bottom edge, zero keeps whatever the text leaves over
		local thinHeight = min(db.thinBarHeight, db.barHeight)

		if thinHeight > 0 then
			status:Point('BOTTOMLEFT', relative, iconShown and 'BOTTOMRIGHT' or 'BOTTOMLEFT', 0, 0)
			status:Point('BOTTOMRIGHT', bar, 'BOTTOMRIGHT', 0, 0)
			status:Height(thinHeight)
		else
			status:Point('LEFT', relative, relativePoint, 0, 0)
			status:Point('TOP', name, 'BOTTOM', 0, 0)
			status:Point('BOTTOMRIGHT', bar, 'BOTTOMRIGHT', 0, 0)
		end
	else
		status:Point('TOPLEFT', relative, iconShown and 'TOPRIGHT' or 'TOPLEFT', separator, 0)
		status:Point('BOTTOMRIGHT', bar, 'BOTTOMRIGHT', 0, 0)

		persec:Point('RIGHT', status, 'RIGHT', -2 + db.valueXOffset, db.valueYOffset)
		value:Point('RIGHT', persec, 'LEFT', 0, 0)

		rank:Point('LEFT', status, 'LEFT', 2 + db.nameXOffset, db.nameYOffset)

		-- It has to cancel out that offset
		name:Point('LEFT', rank, 'RIGHT', 0, 0)
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

	bar.rank:FontTemplate(db.font, db.fontSize, db.fontOutline)
	bar.name:FontTemplate(db.font, db.fontSize, db.fontOutline)
	bar.value:FontTemplate(db.font, db.fontSize, db.fontOutline)
	bar.persec:FontTemplate(db.font, db.fontSize, db.fontOutline)

	-- Wipe cached states so we can insta display setting changes
	bar.colorKey = nil
	bar.iconKey = nil
	bar.lastName = nil
	bar.lastRank = nil
	bar.iconsShown = nil
end

-- Refreshes the bars afterwards, the width comes from the anchors on its own
function DM:UpdateWindowGeometry(window, height)
	local db = DM.db
	local contentHeight = height - db.headerHeight

	local visibleCount = 0
	if contentHeight >= db.barHeight then
		visibleCount = floor((contentHeight + db.barSpacing) / (db.barHeight + db.barSpacing))
	end

	window.visibleCount = visibleCount
	window.contentHeight = contentHeight
	window.columnWidth = nil
	window.rankWidth = nil
	wipe(sampleWidths)

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

-- A file ID and an atlas name never collide, so one key covers both
local function UpdateBarIcon(bar, entry, spellMode)
	local fileID, atlas

	if spellMode then
		local details = entry.combatSpellDetails
		local specIcon = details and details.specIconID

		-- The death log brings its own icon for environment damage
		if entry.texture then
			fileID = entry.texture
		elseif specIcon and specIcon ~= 0 then
			fileID = specIcon
		elseif entry.spellID then
			-- GetSpellTexture takes secret IDs
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

	local key = fileID or atlas

	if issecretvalue(key) then
		bar.iconKey = nil
	else
		if bar.iconKey == key then return end
		bar.iconKey = key
	end

	if fileID then
		bar.icon:SetTexture(fileID)
		bar.icon:SetTexCoord(unpack(E.TexCoords))
	elseif atlas then
		bar.icon:SetAtlas(atlas)
	else
		bar.icon:SetTexture(nil)
	end
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

	bar.rank:SetTextColor(nameColor.r, nameColor.g, nameColor.b)
	bar.name:SetTextColor(nameColor.r, nameColor.g, nameColor.b)
	bar.value:SetTextColor(valueColor.r, valueColor.g, valueColor.b)
	bar.persec:SetTextColor(valueColor.r, valueColor.g, valueColor.b)
end

local function UpdateBarStatus(bar, entry, maxAmount, fullBar)
	local status = bar.status

	if fullBar then
		status:SetMinMaxValues(0, 1)
		status:SetValue(1)
	else
		status:SetMinMaxValues(0, maxAmount)
		status:SetValue(entry.totalAmount)
	end
end

local function UpdateBarName(db, bar, entry, rank, rankColumn, spellMode)
	local nameText = bar.name

	if spellMode then
		bar.lastName = nil

		-- The popup has no rank column, zero is never a real rank
		if bar.lastRank ~= 0 then
			bar.lastRank = 0
			bar.rank:SetText('')
		end

		-- GetSpellName takes secret IDs
		local spellName = entry.spellName
		if not spellName and entry.spellID then
			spellName = GetSpellName(entry.spellID)
		end

		local creatureName = entry.creatureName
		local details = entry.combatSpellDetails
		local unitName = details and details.unitName

		if unitName then
			unitName = DM:StripRealm(unitName, details.unitClassFilename)
		end

		-- Blizzard sends an empty name when a spell has no source and secrets cant be compared, WrapString drops the brackets on those
		local creature = creatureName and WrapString(creatureName, CreaturePrefix, CreatureSuffix) or ''
		local unit = unitName and WrapString(unitName, UnitPrefix, UnitSuffix) or ''

		if spellName then
			nameText:SetFormattedText('%s%s%s', spellName, creature, unit)
		elseif creatureName or unitName then
			-- Enemy damage taken has no spell to name, the source alone beats "Unknown - Name"
			nameText:SetFormattedText('%s%s', WrapString(creatureName or '', '', ''), WrapString(unitName or '', '', ''))
		else
			nameText:SetText(UNKNOWN)
		end

		return
	end

	local rawName = entry.name
	local nameSecret = issecretvalue(rawName)
	local sameRank = rank == bar.lastRank

	-- Comparisons are only safe on non-secret names
	if not nameSecret and sameRank and rawName == bar.lastName then return end
	bar.lastName = not nameSecret and rawName or nil

	-- Only when the bar actually moved
	if not sameRank then
		bar.lastRank = rank

		-- Second argument is only there for locales that keep the name in the format
		bar.rank:SetText(rankColumn and format(RankFormat, rank, '') or '')
	end

	local name = DM:StripRealm(rawName or '', entry.classFilename)

	if db.showRank and not rankColumn then
		nameText:SetFormattedText(DAMAGE_METER_SOURCE_NAME, rank, name)
	else
		nameText:SetText(name)
	end
end

local function UpdateBarValue(db, bar, entry, sessionTotal, sessionSecret, persecPrimary, suppressPersec, deathEntry, recapMode)
	local valueText, persecText = bar.value, bar.persec

	if recapMode then
		local percent, seconds = entry.healthPercent, entry.timeBeforeDeath
		local display = db.numberDisplay

		valueText:SetText(FormatAmount(entry.totalAmount))
		bar.persecSecret = false

		if display == 'MINIMAL' or not percent then
			persecText:SetText('')
		elseif display == 'COMPLETE' and seconds then
			persecText:SetFormattedText(renderFormats.both, format('%.1fs', seconds), percent)
		else
			persecText:SetFormattedText(renderFormats.percent, percent)
		end

		return
	end

	if deathEntry then
		local deathTime = entry.deathTimeSeconds
		if issecretvalue(deathTime) or not deathTime or deathTime <= 0 then
			valueText:SetText('')
		else
			valueText:SetText(SecondsToClock(deathTime))
		end

		persecText:SetText('')
		bar.persecSecret = false
		return
	end

	local total = entry.totalAmount
	local primary, secondary = total, entry.amountPerSecond

	if persecPrimary then
		primary, secondary = secondary, primary
	end

	local secret = issecretvalue(secondary)

	if suppressPersec or (not secret and (not secondary or secondary <= 0)) then
		secondary = nil
	end

	local display = db.numberDisplay

	valueText:SetText(FormatAmount(primary))

	if display == 'COMPLETE' and not (sessionSecret or issecretvalue(total)) then
		local percent = sessionTotal > 0 and (total / sessionTotal * 100) or 0

		if secondary then
			persecText:SetFormattedText(renderFormats.both, FormatAmount(secondary), percent)
			bar.persecSecret = secret
		else
			persecText:SetFormattedText(renderFormats.percent, percent)
			bar.persecSecret = false
		end
	elseif display ~= 'MINIMAL' and secondary then
		persecText:SetFormattedText(renderFormats.single, FormatAmount(secondary))
		bar.persecSecret = secret
	else
		persecText:SetText('')
		bar.persecSecret = false
	end
end

-- Every rank shares the width of the widest one, that lines up the names behind them
local function UpdateRankColumn(db, window, lastRank)
	local width = lastRank > 0 and (GetSampleWidth(db, lastRank < 10 and 1 or 2) + E:Scale(db.rankSpacing)) or 0

	if window.rankWidth == width then return end
	window.rankWidth = width

	for i = 1, window.visibleCount do
		window.bars[i].rank:SetWidth(width)
	end
end

local function UpdateValueColumn(db, window)
	local width, secret = 0, false

	-- Value spacing only applies if the slider is greater than 0 in the config
	if db.valueSpacing > 0 then
		local bars = window.bars

		for i = 1, window.visibleCount do
			local bar = bars[i]

			if bar.entry then
				if bar.persecSecret or bar.persec:IsAnchoringSecret() then
					secret = true
				else
					width = max(width, bar.persec:GetStringWidth())
				end
			end
		end

		if secret then
			width = max(width, GetSampleWidth(db, 'value'))
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

-- isLocalPlayer is flagged as never secret, comparing it is safe
local function FindLocalPlayer(entries, numEntries)
	for index = 1, numEntries do
		if entries[index].isLocalPlayer then
			return index
		end
	end
end

-- Blizzard just overlaps the local player on top of the bottom-most bar, we can do it cleaner
-- https://github.com/Gethe/wow-ui-source/blob/live/Interface/AddOns/Blizzard_DamageMeter/DamageMeterSessionWindow.lua#L656-L698
local function GetPinnedRow(db, window, entries, numEntries, offset, spellMode, meterType)
	if not db.pinLocalPlayer or spellMode then return end
	if numEntries <= window.visibleCount then return end
	if TypeSuppressPin[meterType] then return end

	local index = FindLocalPlayer(entries, numEntries)
	if not index then return end

	if index <= offset then
		return index, 1
	elseif index > offset + window.visibleCount then
		return index, window.visibleCount
	end
end

function DM:RenderWindow(window)
	local db = DM.db
	if not db or window.visibleCount == 0 then return end

	renderAbbrev = GetAbbreviate()
	renderFormats = GetValueFormats(db)

	-- Only the session windows carry the availability message
	local infoText = window.infoText

	if infoText then
		local info = ''

		-- Fake data always renders, only the live data can be unavailable
		if not DM.testMode then
			local available, failureReason = IsDamageMeterAvailable()

			if not available then
				info = failureReason or ''
			end
		end

		if window.lastInfo ~= info then
			window.lastInfo = info
			infoText:SetText(info)
		end
	end

	local session = DM:GetSession(window)
	local spellMode = window.spellMode
	local recapMode = window.recapMode
	local entries = session and (spellMode and session.combatSpells or session.combatSources)
	local numEntries = entries and #entries or 0
	window.numEntries = numEntries

	local bars, visibleCount = window.bars, window.visibleCount

	local maxOffset = max(0, numEntries - visibleCount)
	if window.offset > maxOffset then
		window.offset = maxOffset
	end

	local offset = window.offset
	local maxAmount = session and session.maxAmount or 0
	local sessionTotal = session and session.totalAmount or 0
	local sessionSecret = issecretvalue(sessionTotal)

	local meterType = window.meterType
	local persecPrimary = TypePerSecondPrimary[meterType]
	local suppressPersec = TypeSuppressPerSecond[meterType]
	local iconsShown = db.showIcons and (spellMode or not TypeSuppressIcon[meterType])
	local reverseOrder = not spellMode and TypeReverseOrder[meterType]

	-- For the death log, every hit fills its bar instead
	local fullBars = recapMode and maxAmount == 0

	local pinIndex, pinRow = GetPinnedRow(db, window, entries, numEntries, offset, spellMode, meterType)

	-- Rank spacing only applies if the slider is greater than 0 in the config
	local rankColumn = db.showRank and db.rankSpacing > 0 and not spellMode
	local lastRank = rankColumn and max(pinIndex or 0, min(offset + visibleCount, numEntries)) or 0

	for i = 1, visibleCount do
		local bar = bars[i]
		local rank = (i == pinRow) and pinIndex or (offset + i)

		-- Only the entry gets mirrored
		local entry = entries and entries[reverseOrder and (numEntries - rank + 1) or rank]

		if entry then
			local deathEntry = not spellMode and entry.deathRecapID and entry.deathRecapID ~= 0

			bar.entry = entry
			SetBarAnchors(db, bar, iconsShown)
			UpdateBarStatus(bar, entry, maxAmount, deathEntry or fullBars)
			UpdateBarColor(db, bar, entry, spellMode)
			if iconsShown then
				UpdateBarIcon(bar, entry, spellMode)
			end
			UpdateBarName(db, bar, entry, rank, rankColumn, spellMode)
			UpdateBarValue(db, bar, entry, sessionTotal, sessionSecret, persecPrimary, suppressPersec, deathEntry, recapMode)
			bar:Show()
		else
			bar.entry = nil
			bar:Hide()
		end
	end

	UpdateRankColumn(db, window, lastRank)
	UpdateValueColumn(db, window)
end
