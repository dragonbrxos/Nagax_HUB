-- Nagax HUB: Utilities Module
local Utils = {}

-- World Identification
Utils.World1 = (game.PlaceId == 2753915549)
Utils.World2 = (game.PlaceId == 4442272183)
Utils.World3 = (game.PlaceId == 7449423635)

-- Helper Functions
function Utils.isnil(thing)
    return (thing == nil)
end

function Utils.round(n)
    return math.floor(tonumber(n) + 0.5)
end

-- Check Quest Function (Ported and organized)
function Utils.CheckQuest()
    local MyLevel = game:GetService("Players").LocalPlayer.Data.Level.Value
    local QuestInfo = {Mon = "", LevelQuest = 0, NameQuest = "", NameMon = "", CFrameQuest = nil, CFrameMon = nil}
    
    if Utils.World1 then
        if MyLevel >= 1 and MyLevel <= 9 then
            QuestInfo.Mon = "Bandit"
            QuestInfo.LevelQuest = 1
            QuestInfo.NameQuest = "BanditQuest1"
            QuestInfo.NameMon = "Bandit"
            QuestInfo.CFrameQuest = CFrame.new(1059.37195, 15.4495068, 1550.4231)
            QuestInfo.CFrameMon = CFrame.new(1045.962646484375, 27.00250816345215, 1560.8203125)
        elseif MyLevel >= 10 and MyLevel <= 14 then
            QuestInfo.Mon = "Monkey"
            QuestInfo.LevelQuest = 1
            QuestInfo.NameQuest = "JungleQuest"
            QuestInfo.NameMon = "Monkey"
            QuestInfo.CFrameQuest = CFrame.new(-1598.08911, 35.5501175, 153.377838)
            QuestInfo.CFrameMon = CFrame.new(-1448.51806640625, 67.85301208496094, 11.46579647064209)
        -- Add other level ranges here following the same pattern
        end
    elseif Utils.World2 then
        -- Add World 2 Quest logic
    elseif Utils.World3 then
        -- Add World 3 Quest logic
    end
    
    return QuestInfo
end

return Utils
