-- NAGAX HUB | MANUAL SCRIPT
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/dragonbrxos/Nagax_HUB/main/UI/Library.lua"))()
local Quest = loadstring(game:HttpGet("https://raw.githubusercontent.com/dragonbrxos/Nagax_HUB/main/Modules/Quest.lua"))()
local Combat = loadstring(game:HttpGet("https://raw.githubusercontent.com/dragonbrxos/Nagax_HUB/main/Modules/Combat.lua"))()

local Window = Library:CreateWindow("NAGAX HUB | MANUAL")
local MainTab = Window:CreateTab("Auto Farm")
MainTab:CreateToggle("Auto Farm Level", false, function(Value) _G.AutoFarmLevel = Value end)
MainTab:CreateToggle("Auto Stats", false, function(Value) _G.AutoStats = Value end)

-- Lógica de Execução (Integrando a base original)
spawn(function()
    while wait() do
        if _G.AutoFarmLevel then
            pcall(function()
                Quest.CheckQuest()
                -- Lógica de teleporte e ataque extraída do original aqui
                Combat.FastAttack()
            end)
        end
    end
end)
