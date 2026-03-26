-- NAGAX HUB | MANUAL SCRIPT
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/dragonbrxos/Nagax_HUB/main/UI/Library.lua"))()
local Quest = loadstring(game:HttpGet("https://raw.githubusercontent.com/dragonbrxos/Nagax_HUB/main/Modules/Quest.lua"))()
local Window = Library:CreateWindow("NAGAX HUB | MANUAL")
local MainTab = Window:CreateTab("Auto Farm")
MainTab:CreateToggle("Auto Farm Level", false, function(Value) _G.AutoFarmLevel = Value end)
MainTab:CreateToggle("Auto Stats", false, function(Value) _G.AutoStats = Value end)
local ItemTab = Window:CreateTab("Items")
ItemTab:CreateButton("Get Saber", function() print("Getting Saber...") end)
spawn(function()
    while wait() do
        if _G.AutoFarmLevel then
            local CurrentQuest = Quest:GetQuest()
            if CurrentQuest then
                -- Lógica de Farm aqui usando os módulos
            end
        end
    end
end)
