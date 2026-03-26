-- NAGAX HUB | MAIN ORCHESTRATOR
local Main = {}
local BaseURL = "https://raw.githubusercontent.com/dragonbrxos/Nagax_HUB/main/"

function Main:LoadModule(Path)
    local Success, Result = pcall(function()
        return loadstring(game:HttpGet(BaseURL .. Path))()
    end)
    if Success then 
        print("NAGAX HUB: Módulo " .. Path .. " carregado com sucesso.")
        return Result 
    else 
        warn("NAGAX HUB: Erro ao carregar " .. Path .. ": " .. tostring(Result))
        return nil 
    end
end

-- Inicializar Estrutura Global
_G.Nagax = {
    Modules = {},
    Config = {
        AutoFarm = false,
        AutoStats = false,
        FastAttack = true,
        Weapon = "Melee"
    }
}

-- Carregamento Dinâmico de Módulos Funcionais
_G.Nagax.Modules.UI = Main:LoadModule("UI/Library.lua")
_G.Nagax.Modules.Combat = Main:LoadModule("Modules/Combat/Combat.lua")
_G.Nagax.Modules.W1 = Main:LoadModule("Modules/World1/Quests.lua")
_G.Nagax.Modules.W2 = Main:LoadModule("Modules/World2/Quests.lua")
_G.Nagax.Modules.W3 = Main:LoadModule("Modules/World3/Quests.lua")
_G.Nagax.Modules.Items = Main:LoadModule("Modules/Items/Puzzles.lua")
_G.Nagax.Modules.Events = Main:LoadModule("Modules/Events/SeaEvents.lua")

-- Função de Inicialização de Anti-Cheat Bypass (Extraída da Base)
if _G.Nagax.Modules.Combat and _G.Nagax.Modules.Combat.Initialize then
    _G.Nagax.Modules.Combat.Initialize()
end

print("NAGAX HUB: Sistema centralizado e orquestrado com sucesso!")
return _G.Nagax
