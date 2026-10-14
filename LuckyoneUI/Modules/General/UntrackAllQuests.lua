local _, Private = ...
local L = Private.L

local GetNumQuestLogEntries = C_QuestLog.GetNumQuestLogEntries
local GetQuestInfo = C_QuestLog.GetInfo
local RemoveQuestWatch = C_QuestLog.RemoveQuestWatch

-- Source and Credits:
-- https://www.reddit.com/r/WowUI/comments/1qk96mg/otherfixworkaroundhidden_tracked_quests_caused_60/
function Private:UntrackAllQuests()
	for i = 1, GetNumQuestLogEntries() do
		local info = GetQuestInfo(i)
		if info and info.questID and info.questID > 0 then
			RemoveQuestWatch(info.questID)
		end
	end

	Private:Print(L["Successfully untracked all quests (including hidden ones)"])
end
