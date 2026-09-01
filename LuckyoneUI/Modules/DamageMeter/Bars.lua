local _, Private = ...
local DM = Private.Modules.DamageMeter

if not DM then return end

local LSM = Private.Libs.LSM

local unpack = unpack
local floor = math.floor
local max = math.max
local gsub = string.gsub

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

-- ElvUI keeps the config in sync with prefix style and decimal length
local function FormatAmount(amount)
	return AbbreviateNumbers(amount, E.Abbreviate.short)
end

local function Bar_OnClick(bar, mouseButton)
	local window = bar.window

	if mouseButton == 'RightButton' then
		DM:CloseDrilldown(window)
	elseif window.mode == 'sources' and bar.entry then
		DM:OpenDrilldown(window, bar.entry)
	end
end

local function CreateBar(window)
	local bar = CreateFrame('Button', nil, window.content)
	bar:RegisterForClicks('LeftButtonUp', 'RightButtonUp')
	bar:SetScript('OnClick', Bar_OnClick)
	bar.window = window

	bar.bg = bar:CreateTexture(nil, 'BACKGROUND')
	bar.bg:SetAllPoints()

	bar.icon = bar:CreateTexture(nil, 'ARTWORK')
	bar.icon:Point('LEFT')

	local status = CreateFrame('StatusBar', nil, bar)
	status:SetFrameLevel(bar:GetFrameLevel() + 1)
	bar.status = status

	bar.value = status:CreateFontString(nil, 'OVERLAY')
	bar.value:SetJustifyH('RIGHT')
	bar.value:Point('RIGHT', status, 'RIGHT', -2, 0)

	bar.name = status:CreateFontString(nil, 'OVERLAY')
	bar.name:SetJustifyH('LEFT')
	bar.name:SetWordWrap(false)
	bar.name:Point('LEFT', status, 'LEFT', 2, 0)
	bar.name:Point('RIGHT', bar.value, 'LEFT', -8, 0)

	return bar
end

-- Blizzard Default style
local function SetBarAnchors(bar, iconShown)
	if bar.iconsShown == iconShown then return end
	bar.iconsShown = iconShown

	bar.icon:SetShown(iconShown)

	local status = bar.status
	status:ClearAllPoints()

	if iconShown then
		status:Point('TOPLEFT', bar.icon, 'TOPRIGHT', 0, 0)
	else
		status:Point('TOPLEFT', bar, 'TOPLEFT', 0, 0)
	end

	status:Point('BOTTOMRIGHT', bar, 'BOTTOMRIGHT', 0, 0)
end

local function ApplyBarSettings(window, bar, index)
	local db = DM.db
	local yOffset = -((index - 1) * (db.barHeight + db.barSpacing))

	bar:ClearAllPoints()
	bar:Point('TOPLEFT', window.content, 'TOPLEFT', 0, yOffset)
	bar:Point('TOPRIGHT', window.content, 'TOPRIGHT', 0, yOffset)
	bar:Height(db.barHeight)
	bar.icon:Size(db.barHeight)

	local texture = LSM:Fetch('statusbar', db.barTexture)
	bar.status:SetStatusBarTexture(texture)
	bar.bg:SetTexture(texture)
	bar.bg:SetAlpha(db.backdropAlpha)

	bar.name:FontTemplate(db.font, db.fontSize, db.fontOutline)
	bar.value:FontTemplate(db.font, db.fontSize, db.fontOutline)

	-- Wipe cached states so we can insta display setting changes
	bar.colorKey = nil
	bar.iconFile = nil
	bar.iconAtlas = nil
	bar.lastName = nil
	bar.lastRank = nil
	bar.iconsShown = nil
end

function DM:UpdateWindowGeometry(window, width, height)
	local db = DM.db
	local contentHeight = height - db.headerHeight

	local visibleCount = 0
	if contentHeight >= db.barHeight then
		visibleCount = floor((contentHeight + db.barSpacing) / (db.barHeight + db.barSpacing))
	end

	window.visibleCount = visibleCount

	for i = 1, visibleCount do
		local bar = window.bars[i]
		if not bar then
			bar = CreateBar(window)
			window.bars[i] = bar
		end

		ApplyBarSettings(window, bar, i)
	end

	for i = visibleCount + 1, #window.bars do
		window.bars[i]:Hide()
	end

	DM:RenderWindow(window)
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

	local key = db.classColors and classFilename or ''
	if key == bar.colorKey then return end
	bar.colorKey = key

	local color
	if db.classColors and classFilename ~= '' then
		color = E:ClassColor(classFilename, true)
	end
	if not color then color = db.othersColor end

	bar.status:SetStatusBarColor(color.r, color.g, color.b)
	bar.bg:SetVertexColor(color.r, color.g, color.b)
end

local function UpdateBarStatus(bar, entry, maxAmount, deathEntry)
	local status = bar.status

	if deathEntry then
		status:SetMinMaxValues(0, 1)
		status:SetValue(1)
	else
		-- Both accept secret values from tainted code
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

		-- Pet spells carry the pet name, incoming spells carry the attacker
		if creatureName and (issecretvalue(creatureName) or creatureName ~= '') then
			nameText:SetFormattedText(DAMAGE_METER_SPELL_ENTRY_CREATURE, spellName, creatureName)
		elseif unitName and (issecretvalue(unitName) or unitName ~= '') then
			nameText:SetFormattedText(DAMAGE_METER_SPELL_ENTRY_UNIT, spellName, unitName)
		else
			nameText:SetText(spellName)
		end

		return
	end

	local rawName = entry.name
	local nameSecret = issecretvalue(rawName)

	-- Skip identical text, comparisons are only safe on non secret names
	if not nameSecret and rawName == bar.lastName and rank == bar.lastRank then return end
	bar.lastName = not nameSecret and rawName or nil
	bar.lastRank = rank

	local name = rawName
	if not nameSecret then
		name = name or ''
		if db.stripRealm then
			name = gsub(name, '%-.+', '')
		end
	end

	if db.showRank then
		nameText:SetFormattedText(DAMAGE_METER_SOURCE_NAME, rank, name)
	else
		nameText:SetText(name)
	end
end

local function UpdateBarValue(db, bar, entry, sessionTotal, sessionSecret, persecPrimary, suppressPersec, deathEntry)
	local valueText = bar.value

	if deathEntry then
		local deathTime = entry.deathTimeSeconds
		if issecretvalue(deathTime) or not deathTime or deathTime <= 0 then
			valueText:SetText('')
		else
			valueText:SetText(SecondsToClock(deathTime))
		end
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

	-- Only the share needs arithmetic, so it is the one part secrets have to drop
	if display == 'COMPLETE' and not (sessionSecret or issecretvalue(total)) then
		local percent = sessionTotal > 0 and (total / sessionTotal * 100) or 0

		if secondary then
			valueText:SetFormattedText('%s (%s, %.0f%%)', FormatAmount(primary), FormatAmount(secondary), percent)
		else
			valueText:SetFormattedText('%s (%.0f%%)', FormatAmount(primary), percent)
		end
	elseif display ~= 'MINIMAL' and secondary then
		valueText:SetFormattedText('%s (%s)', FormatAmount(primary), FormatAmount(secondary))
	else
		valueText:SetText(FormatAmount(primary))
	end
end

function DM:RenderWindow(window)
	local db = DM.db
	if not db or window.visibleCount == 0 then return end

	local available, failureReason = IsDamageMeterAvailable()
	window.infoText:SetText(not available and failureReason or '')

	local session = window.session
	local spellMode = window.mode == 'spells'
	local entries = session and (spellMode and session.combatSpells or session.combatSources)
	local numEntries = entries and #entries or 0

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
			SetBarAnchors(bar, iconsShown)
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
end
