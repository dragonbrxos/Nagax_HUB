-- Nagax HUB: Anti-Cheat Bypass Module
if getrawmetatable and setreadonly and newcclosure then
    local grm = getrawmetatable(game)
    setreadonly(grm, false)
    local old = grm.__namecall
    grm.__namecall = newcclosure(function(self, ...)
        local args = {...}
        local method = getnamecallmethod()
        
        -- Block common anti-cheat remotes
        local blockedRemotes = {
            "TeleportDetect", "CHECKER_1", "CHECKER", "GUI_CHECK", 
            "OneMoreTime", "checkingSPEED", "BANREMOTE", "PERMAIDBAN", 
            "KICKREMOTE", "BR_KICKPC", "BR_KICKMOBILE"
        }
        
        if table.find(blockedRemotes, tostring(args[1])) then
            return
        end
        
        return old(self, ...)
    end)
end

-- Safe Farm Protection
spawn(function()
    while wait(1) do
        if getgenv().NagaxConfig.SafeFarm then
            for _, v in pairs(game:GetService("Players").LocalPlayer.Character:GetDescendants()) do
                if v:IsA("LocalScript") then
                    local blockedScripts = {"General", "Shiftlock", "FallDamage", "4444", "CamBob", "JumpCD", "Looking", "Run"}
                    if table.find(blockedScripts, v.Name) then
                        v:Destroy()
                    end
                end
            end
            for _, v in pairs(game:GetService("Players").LocalPlayer.PlayerScripts:GetDescendants()) do
                if v:IsA("LocalScript") then
                    local blockedScripts = {"RobloxMotor6DBugFix", "Clans", "Codes", "CustomForceField", "MenuBloodSp", "PlayerList"}
                    if table.find(blockedScripts, v.Name) then
                        v:Destroy()
                    end
                end
            end
        end
    end
end)

-- Set FFlags
spawn(function()
    while wait(5) do
        if getgenv().NagaxConfig.SetFFlag then
            setfflag("AbuseReportScreenshot", "False")
            setfflag("AbuseReportScreenshotPercentage", "0")
        end
    end
end)
