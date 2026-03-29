repeat task.wait() until game.Players.LocalPlayer

local NagaxLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/dragonbrxos/Nagax_HUB/refs/heads/main/UI/NagaxLib", true))()

local Window = NagaxLib:CreateWindow({
    Title = "Nagax_HUB [MODULAR]",
    Game = "BloxFruits",
    Width = 560,
    Height = 390
})

local Sea = "Sea1"
if game.PlaceId == 2753915549 then Sea = "Sea1"
elseif game.PlaceId == 4442272183 then Sea = "Sea2"
elseif game.PlaceId == 7449423635 then Sea = "Sea3" end

-- Carrega o script específico do Sea
local success, SeaScript = pcall(function()
    return loadstring(game:HttpGet("https://raw.githubusercontent.com/dragonbrxos/Nagax_HUB/refs/heads/main/TESTE_MODULAR/Seas/" .. Sea .. ".lua", true))()
end)

if success and type(SeaScript) == "function" then
    -- Executa o script passando a janela e a biblioteca como argumentos
    local runSuccess, runError = pcall(function()
        SeaScript(Window, NagaxLib)
    end)
    if not runSuccess then
        warn("Erro ao executar script do " .. Sea .. ": " .. tostring(runError))
    end
else
    warn("Falha ao carregar ou processar o script para " .. Sea .. ". Verifique se o arquivo existe e é válido.")
end

Window:Init()
