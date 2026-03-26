-- NAGAX HUB | MANUAL SCRIPT
local Nagax = loadstring(game:HttpGet("https://raw.githubusercontent.com/dragonbrxos/Nagax_HUB/main/Scripts/Main.lua"))()
local Window = Nagax.UI:CreateWindow("NAGAX HUB | MANUAL")
local FarmTab = Window:CreateTab("Auto Farm")
FarmTab:CreateToggle("Auto Farm Level", false, function(v) _G.AutoFarm = v end)
FarmTab:CreateToggle("Auto Stats", false, function(v) _G.AutoStats = v end)
local SeaTab = Window:CreateTab("Sea Events")
SeaTab:CreateToggle("Auto Drive Boat", false, function(v) _G.AutoDrive = v end)
spawn(function()
    while wait() do
        if _G.AutoFarm then
            Nagax.Combat.Bypass()
            -- Lógica de Farm usando os dados de Nagax.W1, W2, W3
        end
    end
end)
