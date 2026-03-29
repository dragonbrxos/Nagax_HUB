repeat task.wait() until game.Players.LocalPlayer

local Sea = "Sea1"
if game.PlaceId == 2753915549 then Sea = "Sea1"
elseif game.PlaceId == 4442272183 then Sea = "Sea2"
elseif game.PlaceId == 7449423635 then Sea = "Sea3" end

-- Carrega o script específico do Sea diretamente, sem encapsulamento
local SeaScriptURL = "https://raw.githubusercontent.com/dragonbrxos/Nagax_HUB/refs/heads/main/TESTE_MODULAR/Seas/" .. Sea .. ".lua"
local success, result = pcall(function()
    return loadstring(game:HttpGet(SeaScriptURL, true))()
end)

if not success then
    warn("Falha ao carregar o script para " .. Sea .. ": " .. tostring(result))
end
