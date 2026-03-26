-- NAGAX HUB | MAIN LOADER
local Main = {}
local BaseURL = "https://raw.githubusercontent.com/dragonbrxos/Nagax_HUB/main/"

function Main:LoadModule(Path)
    local Success, Result = pcall(function()
        return loadstring(game:HttpGet(BaseURL .. Path))()
    end)
    if Success then return Result else warn("NAGAX HUB: Falha ao carregar " .. Path) return nil end
end

-- Carregar Todos os Módulos
_G.Nagax = {
    W1 = Main:LoadModule("Modules/World1/Quests.lua"),
    W2 = Main:LoadModule("Modules/World2/Quests.lua"),
    W3 = Main:LoadModule("Modules/World3/Quests.lua"),
    Combat = Main:LoadModule("Modules/Combat/FastAttack.lua"),
    Items = Main:LoadModule("Modules/Items/Puzzles.lua"),
    Events = Main:LoadModule("Modules/Events/SeaEvents.lua"),
    UI = Main:LoadModule("UI/Library.lua")
}

print("NAGAX HUB: Todos os módulos carregados com sucesso!")
return _G.Nagax
