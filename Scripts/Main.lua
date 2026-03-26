-- NAGAX HUB | BRAIN ORCHESTRATOR (KAITUN LOGIC)
local Main = {}
local BaseURL = "https://raw.githubusercontent.com/dragonbrxos/Nagax_HUB/main/"

function Main:Load(Path) 
    local Success, Result = pcall(function() return loadstring(game:HttpGet(BaseURL .. Path))() end)
    return Success and Result or nil
end

_G.Nagax = {
    Modules = {
        Combat = Main:Load("Modules/Combat/Combat.lua"),
        Race = Main:Load("Modules/RaceV4/RaceV4.lua"),
        Events = Main:Load("Modules/Events/SeaEvents.lua"),
        Items = Main:Load("Modules/Items/Items.lua"),
        W1 = Main:Load("Modules/Farm/World1.lua"),
        W2 = Main:Load("Modules/Farm/World2.lua"),
        W3 = Main:Load("Modules/Farm/World3.lua"),
        Misc = Main:Load("Modules/Misc/Misc.lua"),
        Fruit = Main:Load("Modules/Fruit/Fruit.lua"),
        Stats = Main:Load("Modules/Stats/Stats.lua"),
        Raid = Main:Load("Modules/Raid/Raid.lua")
    },
    Kaitun = {
        Running = false,
        Status = "Iniciando...",
        Log = function(msg) print("[NAGAX HUB]: " .. msg) end
    }
}

function Main:StartAuto()
    _G.Nagax.Kaitun.Running = true
    spawn(function()
        while _G.Nagax.Kaitun.Running do
            local Level = game.Players.LocalPlayer.Data.Level.Value
            if Level < 700 then
                _G.Nagax.Kaitun.Status = "Farmando Mundo 1 (Level: " .. Level .. ")"
                -- Chamar lógica de W1
            elseif Level < 1500 then
                _G.Nagax.Kaitun.Status = "Farmando Mundo 2 (Level: " .. Level .. ")"
                -- Chamar lógica de W2
            else
                _G.Nagax.Kaitun.Status = "Farmando Mundo 3 (Level: " .. Level .. ")"
                -- Chamar lógica de W3
            end
            _G.Nagax.Kaitun.Log(_G.Nagax.Kaitun.Status)
            wait(5)
        end
    end)
end

return Main
