-- NAGAX HUB | AUTO SCRIPT (100% AUTOMATIC)
local Nagax = loadstring(game:HttpGet("https://raw.githubusercontent.com/dragonbrxos/Nagax_HUB/main/Scripts/Main.lua"))()
print("NAGAX HUB: MODO AUTOMATICO ATIVADO")
_G.AutoFarm = true
_G.AutoStats = true
_G.AutoHaki = true
spawn(function()
    while wait() do
        Nagax.Combat.Bypass()
        -- Linha de raciocínio inteligente: Level -> Itens -> Raça
        print("Status: Farmando automaticamente...")
        wait(5)
    end
end)
