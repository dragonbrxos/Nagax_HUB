-- NAGAX HUB | AUTO SCRIPT (100% AUTOMATIC)
local Quest = loadstring(game:HttpGet("https://raw.githubusercontent.com/dragonbrxos/Nagax_HUB/main/Modules/Quest.lua"))()
local Combat = loadstring(game:HttpGet("https://raw.githubusercontent.com/dragonbrxos/Nagax_HUB/main/Modules/Combat.lua"))()
print("NAGAX HUB | MODO AUTOMATICO ATIVADO")
spawn(function()
    while wait() do
        local CurrentQuest = Quest:GetQuest()
        if CurrentQuest then
            print("Objetivo Atual: " .. CurrentQuest.Name)
            -- Lógica de Farm Totalmente Automática sem GUI
            Combat:FastAttack()
        end
    end
end)
