-- NAGAX HUB | QUEST MODULE
local QuestModule = {}
QuestModule.Quests = {
    [1] = {
        ["Bandit"] = { Level = 1, QuestName = "BanditQuest1", QuestLevel = 1, QuestCFrame = CFrame.new(1059.37, 15.45, 1550.42), MonCFrame = CFrame.new(1045.96, 27.00, 1560.82) },
        ["Monkey"] = { Level = 10, QuestName = "JungleQuest", QuestLevel = 1, QuestCFrame = CFrame.new(-1598.09, 35.55, 153.38), MonCFrame = CFrame.new(-1448.52, 67.85, 11.47) },
        ["Gorilla"] = { Level = 15, QuestName = "JungleQuest", QuestLevel = 2, QuestCFrame = CFrame.new(-1598.09, 35.55, 153.38), MonCFrame = CFrame.new(-1129.88, 40.46, -525.42) }
    },
    [2] = {
        ["Swan Pirate"] = { Level = 700, QuestName = "DesertQuest", QuestLevel = 1, QuestCFrame = CFrame.new(911.31, 5.14, 4391.81), MonCFrame = CFrame.new(924.80, 6.45, 4481.59) }
    },
    [3] = {
        ["Marine Commodore"] = { Level = 1700, QuestName = "MarineTreeIsland", QuestLevel = 1, QuestCFrame = CFrame.new(2180.54, 27.82, -6741.55), MonCFrame = CFrame.new(2286.01, 73.13, -7159.81) }
    }
}
function QuestModule:GetQuest()
    local MyLevel = game:GetService("Players").LocalPlayer.Data.Level.Value
    local World = 1
    if game.PlaceId == 4442272183 then World = 2 elseif game.PlaceId == 7449423635 then World = 3 end
    local BestQuest = nil
    for Name, Data in pairs(self.Quests[World] or {}) do
        if MyLevel >= Data.Level then
            if not BestQuest or Data.Level > BestQuest.Level then
                BestQuest = Data
                BestQuest.Name = Name
            end
        end
    end
    return BestQuest
end
return QuestModule
