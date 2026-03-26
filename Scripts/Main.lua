-- NAGAX HUB | SMART ORCHESTRATOR
local Main = {}
local BaseURL = "https://raw.githubusercontent.com/dragonbrxos/Nagax_HUB/main/"

function Main:Load(Path) 
    local Success, Result = pcall(function() return loadstring(game:HttpGet(BaseURL .. Path))() end)
    return Success and Result or nil
end

_G.Nagax = {
    Modules = {},
    Kaitun = {
        Running = false,
        Status = "Aguardando...",
        Log = function(msg) print("[NAGAX HUB]: " .. msg) end
    }
}

function Main:GetModule(Name)
    if not _G.Nagax.Modules[Name] then
        _G.Nagax.Modules[Name] = self:Load("Modules/" .. Name .. ".lua")
    end
    return _G.Nagax.Modules[Name]
end

function Main:StartAuto()
    _G.Nagax.Kaitun.Running = true
    spawn(function()
        while _G.Nagax.Kaitun.Running do
            local Level = game.Players.LocalPlayer.Data.Level.Value
            local Sea = 1
            if Level >= 700 and Level < 1500 then Sea = 2 elseif Level >= 1500 then Sea = 3 end
            
            -- Prioridade 1: Eventos de Spawn (Lua Cheia, Sea Beast, etc)
            local Events = self:GetModule("Events/SeaEvents")
            if Events and Events.CheckSpecial() then
                _G.Nagax.Kaitun.Status = "Evento Especial Detectado! Priorizando..."
            -- Prioridade 2: Itens do Sea Atual
            elseif Level >= 200 and not _G.HasSaber then
                _G.Nagax.Kaitun.Status = "Priorizando Puzzle da Saber (Sea 1)"
            -- Prioridade 3: Farm de Nível
            else
                _G.Nagax.Kaitun.Status = "Farmando Nível no Sea " .. Sea .. " (Level: " .. Level .. ")"
            end
            
            _G.Nagax.Kaitun.Log(_G.Nagax.Kaitun.Status)
            wait(10)
        end
    end)
end

return Main
