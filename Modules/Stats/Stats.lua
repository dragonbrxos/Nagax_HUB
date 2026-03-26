-- NAGAX HUB | AUTO STATS
local Pointstat = Stats:Label("")
spawn(function()
    while wait() do
        pcall(function()
            Pointstat:Set("Available Point : "..tostring(game:GetService("Players")["LocalPlayer"].Data.Points.Value))
        end)
    end
end)
local Melee = Stats:Label("")
spawn(function()
    while wait() do
        pcall(function()
            Melee:Set("Melee : "..game.Players.localPlayer.Data.Stats.Melee.Level.Value)
        end)
    end
end)

local Defense = Stats:Label("")
spawn(function()
    while wait() do
        pcall(function()
            Defense:Set("Defense : "..game.Players.localPlayer.Data.Stats.Defense.Level.Value)
        end)
    end
end)

local Sword = Stats:Label("")
spawn(function()
    while wait() do
        pcall(function()
            Sword:Set("Sword : "..game.Players.localPlayer.Data.Stats.Sword.Level.Value)
        end)
    end
end)

local Gun = Stats:Label("")
spawn(function()
    while wait() do
        pcall(function()
            Gun:Set("Gun : "..game.Players.localPlayer.Data.Stats.Gun.Level.Value)
        end)
    end
end)

local Fruit = Stats:Label("")
spawn(function()
    while wait() do
        pcall(function()
            Fruit:Set("Fruit : "..game.Players.localPlayer.Data.Stats["Demon Fruit"].Level.Value)
        end)
    end
end)

Stats:Seperator("Auto Stats")

Stats:Toggle("Auto Stats Melee", false, function(value)
    melee = value  
end)

Stats:Toggle("Auto Stats Defense", false, function(value)
    defense = value  
end)

Stats:Toggle("Auto Stats Sword", false, function(value)
    sword = value  
end)

Stats:Toggle("Auto Stats Gun", false, function(value)
    gun = value  
end)

Stats:Toggle("Auto Stats Fruit", false, function(value)
    demonfruit = value  
end)

spawn(function()
    while wait() do
        if game.Players.localPlayer.Data.Points.Value >= PointStats then
            if melee then
                local args = {
                    [1] = "AddPoint",
                    [2] = "Melee",
                    [3] = PointStats
                }
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
            end 
            if defense then
                local args = {
                    [1] = "AddPoint",
                    [2] = "Defense",
                    [3] = PointStats
                }
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
            end 
            if sword then
                local args = {
                    [1] = "AddPoint",
                    [2] = "Sword",
                    [3] = PointStats
                }
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
            end 
            if gun then
                local args = {
                    [1] = "AddPoint",
                    [2] = "Gun",
                    [3] = PointStats
                }
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
            end 
            if demonfruit then
                local args = {
                    [1] = "AddPoint",
                    [2] = "Demon Fruit",
                    [3] = PointStats
                }
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
