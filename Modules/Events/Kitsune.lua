-- NAGAX HUB | KITSUNE ISLAND EVENT (INTEGRAL)
Event:Seperator("Kitsune island")

Kitsuneisland = Event:Label("")
spawn(function()
    pcall(function()
        while wait() do
            if game.Workspace._WorldOrigin.Locations:FindFirstChild('Kitsune Island') then
                Kitsuneisland:Set('Kitsune island ✅ Yes Spawn')
            else
                Kitsuneisland:Set('Kitsune Island ❌ No Spawn')
            end
        end
    end)
end)

Event:Toggle("Teleport To Kitsune Island", false, function(value)
    _G.AutoFKitsune = value
    StopTween(_G.AutoFKitsune)
end)
spawn(function()
    while wait() do
        if _G.AutoFKitsune then
            pcall(function()
                if game.Workspace._WorldOrigin.Locations:FindFirstChild('Kitsune Island') then
                    topos(game.Workspace._WorldOrigin.Locations:FindFirstChild('Kitsune Island').HumanoidRootPart.CFrame * CFrame.new(0,100,0))
                end
            end)
        end
    end
end)

Event:Toggle("Collect Azure Ambers",_G.AutoAzuerEmber,function(value)
    _G.AutoAzuerEmber = value
    StopTween(_G.AutoAzuerEmber)
    end)
    
          spawn(function()
            while wait() do
                if _G.AutoFrozenDimension then
                    pcall(function()
                        if game.Workspace._WorldOrigin.Locations:FindFirstChild('Frozen Dimension') then
                            topos(game.Workspace._WorldOrigin.Locations:FindFirstChild('Frozen Dimension').HumanoidRootPart.CFrame * CFrame.new(0,500,-100))
                        end
                    end)
                end
            end
        end)
        
	spawn(function()
        pcall(function()
            while wait() do
                if _G.AutoFKitsune then
                    topos(game.Workspace.Map.KitsuneIsland.ShrineActive.NeonShrinePart.CFrame * CFrame.new(0,0,10))
                end
            end
        end)
    end)
    
        
        spawn(function()
            while wait() do
                if _G.AutoAzuerEmber then
                    pcall(function()
                        if game:GetService("Workspace"):FindFirstChild("AttachedAzureEmber") then
                            topos(game.Workspace.EmberTemplate.Part.CFrame)
                        end
                    end)
                end
            end
        end)
