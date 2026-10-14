local _, Private = ...
local L = Private.L

local CreateFrame = CreateFrame
local GetCVarBool = C_CVar.GetCVarBool
local GetInstanceInfo = GetInstanceInfo
local IsLoggingCombat = C_ChatInfo.IsLoggingCombat
local LoggingCombat = LoggingCombat
local SetCVar = C_CVar.SetCVar

-- Delves need special treatment, they don't fire a real loading screen
local HasActiveDelve = Private.isModern and C_DelvesUI.HasActiveDelve

local EventFrame
local active

-- Difficulties are Retail only
local function IsSelectedContent(db)
	local _, instanceType, difficultyID = GetInstanceInfo()

	-- The party keeps its delve after leaving it, real instances keep their own type
	if instanceType == 'none' and HasActiveDelve and HasActiveDelve() then
		instanceType = 'scenario'
	end

	if not db.instances[instanceType] then return false end
	if not Private.isRetail or instanceType == 'scenario' then return true end

	-- Mythic Flexible raids (Sporefall) show as Mythic
	if difficultyID == 233 then
		difficultyID = 16
	end

	return (instanceType == 'party' and db.dungeon or db.raid)[difficultyID] or false
end

local function Update()
	local db = Private.Addon.db.profile.misc.combatLogging
	local logging = IsLoggingCombat()

	if db.enable and IsSelectedContent(db) then
		active = true
		if logging then return end

		-- Has to be on before the log starts
		if not GetCVarBool('advancedCombatLogging') then
			SetCVar('advancedCombatLogging', 1)
		end

		if LoggingCombat(true) and db.notify then
			Private:Print(L["Combat logging started."])
		end
	elseif active then
		if logging and LoggingCombat(false) == nil then return end
		active = nil

		-- Nothing to say when it was stopped by hand in the meantime
		if logging and db.notify then
			Private:Print(L["Combat logging stopped."])
		end
	end
end

function Private:CombatLogging()
	if not EventFrame and Private.Addon.db.profile.misc.combatLogging.enable then
		EventFrame = CreateFrame('Frame')
		EventFrame:SetScript('OnEvent', Update)
		EventFrame:RegisterEvent('PLAYER_ENTERING_WORLD')

		if Private.isModern then
			EventFrame:RegisterEvent('ACTIVE_DELVE_DATA_UPDATE')
		end

		-- Keystones and raid difficulty switches don't fire a loading screen either
		if Private.isRetail then
			EventFrame:RegisterEvent('CHALLENGE_MODE_START')
			EventFrame:RegisterEvent('PLAYER_DIFFICULTY_CHANGED')
		end
	end

	Update()
end
