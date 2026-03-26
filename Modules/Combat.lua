-- NAGAX HUB | COMBAT MODULE
local CombatModule = {}
function CombatModule:FastAttack()
    pcall(function()
        local CombatFramework = require(game:GetService("Players").LocalPlayer.PlayerScripts.CombatFramework)
        local CombatFrameworkLib = require(game:GetService("ReplicatedStorage").CombatFramework.RigLib)
        if CombatFramework and CombatFramework.activeController then
            CombatFramework.activeController.hitboxMagnitude = 55
            CombatFramework.activeController.attack()
        end
    end)
end
return CombatModule
