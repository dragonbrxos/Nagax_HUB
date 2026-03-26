-- NAGAX HUB | CORE PART 5
                    end
                    if game.Players.LocalPlayer.Character:FindFirstChild("Black Leg") and game.Players.LocalPlayer.Character:FindFirstChild("Black Leg").Level.Value >= 300 and game:GetService("Players")["LocalPlayer"].Data.Beli.Value >= 300000 then
                        UnEquipWeapon("Black Leg")
                        wait(.1)
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectro")
                    end
                    if game.Players.LocalPlayer.Backpack:FindFirstChild("Electro") and game.Players.LocalPlayer.Backpack:FindFirstChild("Electro").Level.Value >= 300 and game:GetService("Players")["LocalPlayer"].Data.Beli.Value >= 750000 then
                        UnEquipWeapon("Electro")
                        wait(.1)
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyFishmanKarate")
                    end
                    if game.Players.LocalPlayer.Character:FindFirstChild("Electro") and game.Players.LocalPlayer.Character:FindFirstChild("Electro").Level.Value >= 300 and game:GetService("Players")["LocalPlayer"].Data.Beli.Value >= 750000 then
                        UnEquipWeapon("Electro")
                        wait(.1)
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyFishmanKarate")
                    end
                    if game.Players.LocalPlayer.Backpack:FindFirstChild("Fishman Karate") and game.Players.LocalPlayer.Backpack:FindFirstChild("Fishman Karate").Level.Value >= 300 and game:GetService("Players")["Localplayer"].Data.Fragments.Value >= 1500 then
                        UnEquipWeapon("Fishman Karate")
                        wait(.1)
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward","DragonClaw","1")
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward","DragonClaw","2") 
                    end
                    if game.Players.LocalPlayer.Character:FindFirstChild("Fishman Karate") and game.Players.LocalPlayer.Character:FindFirstChild("Fishman Karate").Level.Value >= 300 and game:GetService("Players")["Localplayer"].Data.Fragments.Value >= 1500 then
                        UnEquipWeapon("Fishman Karate")
                        wait(.1)
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward","DragonClaw","1")
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward","DragonClaw","2") 
                    end
                    if game.Players.LocalPlayer.Backpack:FindFirstChild("Dragon Claw") and game.Players.LocalPlayer.Backpack:FindFirstChild("Dragon Claw").Level.Value >= 300 and game:GetService("Players")["LocalPlayer"].Data.Beli.Value >= 3000000 then
                        UnEquipWeapon("Dragon Claw")
                        wait(.1)
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySuperhuman")
                    end
                    if game.Players.LocalPlayer.Character:FindFirstChild("Dragon Claw") and game.Players.LocalPlayer.Character:FindFirstChild("Dragon Claw").Level.Value >= 300 and game:GetService("Players")["LocalPlayer"].Data.Beli.Value >= 3000000 then
                        UnEquipWeapon("Dragon Claw")
                        wait(.1)
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySuperhuman")
                    end 
                end
            end
        end
    end)
end)

Farm:Toggle("Auto Death Step", false, function(value)
    _G.AutoDeathStep = value
end)
spawn(function()
    while wait() do wait()
        if _G.AutoDeathStep then
            if game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Black Leg") or game:GetService("Players").LocalPlayer.Character:FindFirstChild("Black Leg") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Death Step") or game:GetService("Players").LocalPlayer.Character:FindFirstChild("Death Step") then
                if game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Black Leg") and game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Black Leg").Level.Value >= 450 then
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyDeathStep")
                    _G.SelectWeapon = "Death Step"
                end  
                if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Black Leg") and game:GetService("Players").LocalPlayer.Character:FindFirstChild("Black Leg").Level.Value >= 450 then
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyDeathStep")
                    _G.SelectWeapon = "Death Step"
                end  
                if game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Black Leg") and game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Black Leg").Level.Value <= 449 then
                    _G.SelectWeapon = "Black Leg"
                end 
            else 
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyBlackLeg")
            end
        end
    end
end)

Farm:Toggle("Auto Sharkman Karate", false, function(value)
    _G.AutoSharkman = value
end)
spawn(function()
    pcall(function()
        while wait() do
            if _G.AutoSharkman then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyFishmanKarate")
                if string.find(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySharkmanKarate"), "keys") then  
                    if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Water Key") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Water Key") then
                        topos(CFrame.new(-2604.6958, 239.432526, -10315.1982, 0.0425701365, 0, -0.999093413, 0, 1, 0, 0.999093413, 0, 0.0425701365))
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySharkmanKarate")
                    elseif game:GetService("Players").LocalPlayer.Character:FindFirstChild("Fishman Karate") and game:GetService("Players").LocalPlayer.Character:FindFirstChild("Fishman Karate").Level.Value >= 400 then
                    else 
                        Ms = "Tide Keeper"
                        if game:GetService("Workspace").Enemies:FindFirstChild(Ms) then   
                            for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                if v.Name == Ms then    
                                    OldCFrameShark = v.HumanoidRootPart.CFrame
                                    repeat task.wait()
                                        AutoHaki()
                                        EquipWeapon(_G.SelectWeapon)
                                        v.Head.CanCollide = false
                                        v.Humanoid.WalkSpeed = 0
                                        v.HumanoidRootPart.CanCollide = false
                                        v.HumanoidRootPart.Size = Vector3.new(50,50,50)
                                        v.HumanoidRootPart.CFrame = OldCFrameShark
                                        topos(v.HumanoidRootPart.CFrame*CFrame.new(2,20,2))
                                        game:GetService("VirtualUser"):CaptureController()
                                        game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 670))
                                        sethiddenproperty(game:GetService("Players").LocalPlayer,"SimulationRadius",math.huge)
                                    until not v.Parent or v.Humanoid.Health <= 0 or _G.AutoSharkman == false or game:GetService("Players").LocalPlayer.Character:FindFirstChild("Water Key") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Water Key")
                                end
                            end
                        else
                            topos(CFrame.new(-3570.18652, 123.328949, -11555.9072, 0.465199202, -1.3857326e-08, 0.885206044, 4.0332897e-09, 1, 1.35347511e-08, -0.885206044, -2.72606271e-09, 0.465199202))
                            wait(3)
                        end
                    end
                else 
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySharkmanKarate")
                end
            end
        end
    end)
end)

Farm:Toggle("Auto Sharkman Karate", false, function(value)
    _G.AutoSharkman = value
end)
spawn(function()
    pcall(function()
        while wait() do
            if _G.AutoSharkman then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyFishmanKarate")
                if string.find(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySharkmanKarate"), "keys") then  
                    if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Water Key") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Water Key") then
                        topos(CFrame.new(-2604.6958, 239.432526, -10315.1982, 0.0425701365, 0, -0.999093413, 0, 1, 0, 0.999093413, 0, 0.0425701365))
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySharkmanKarate")
                    elseif game:GetService("Players").LocalPlayer.Character:FindFirstChild("Fishman Karate") and game:GetService("Players").LocalPlayer.Character:FindFirstChild("Fishman Karate").Level.Value >= 400 then
                    else 
                        Ms = "Tide Keeper"
                        if game:GetService("Workspace").Enemies:FindFirstChild(Ms) then   
                            for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                if v.Name == Ms then    
                                    OldCFrameShark = v.HumanoidRootPart.CFrame
                                    repeat task.wait()
                                        AutoHaki()
                                        EquipWeapon(_G.SelectWeapon)
                                        v.Head.CanCollide = false
                                        v.Humanoid.WalkSpeed = 0
                                        v.HumanoidRootPart.CanCollide = false
                                        v.HumanoidRootPart.Size = Vector3.new(50,50,50)
                                        v.HumanoidRootPart.CFrame = OldCFrameShark
                                        topos(v.HumanoidRootPart.CFrame*CFrame.new(2,20,2))
                                        game:GetService("VirtualUser"):CaptureController()
                                        game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 670))
                                        sethiddenproperty(game:GetService("Players").LocalPlayer,"SimulationRadius",math.huge)
                                    until not v.Parent or v.Humanoid.Health <= 0 or _G.AutoSharkman == false or game:GetService("Players").LocalPlayer.Character:FindFirstChild("Water Key") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Water Key")
                                end
                            end
                        else
                            topos(CFrame.new(-3570.18652, 123.328949, -11555.9072, 0.465199202, -1.3857326e-08, 0.885206044, 4.0332897e-09, 1, 1.35347511e-08, -0.885206044, -2.72606271e-09, 0.465199202))
                            wait(3)
                        end
                    end
                else 
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySharkmanKarate")
                end
            end
        end
    end)
end)

Farm:Toggle("Auto Electric Claw", false, function(value)
    _G.AutoElectricClaw = value
    StopTween(_G.AutoElectricClaw)
end)
spawn(function()
    pcall(function()
        while wait() do 
            if _G.AutoElectricClaw then
                if game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Electro") or game:GetService("Players").LocalPlayer.Character:FindFirstChild("Electro") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Electric Claw") or game:GetService("Players").LocalPlayer.Character:FindFirstChild("Electric Claw") then
                    if game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Electro") and game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Electro").Level.Value >= 400 then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectricClaw")
                        _G.SelectWeapon = "Electric Claw"
                    end  
                    if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Electro") and game:GetService("Players").LocalPlayer.Character:FindFirstChild("Electro").Level.Value >= 400 then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectricClaw")
                        _G.SelectWeapon = "Electric Claw"
                    end  
                    if game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Electro") and game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Electro").Level.Value <= 399 then
                        _G.SelectWeapon = "Electro"
                    end 
                else
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectro")
                end
            end
            if _G.AutoElectricClaw then
                if game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Electro") or game:GetService("Players").LocalPlayer.Character:FindFirstChild("Electro") then
                    if game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Electro") or game:GetService("Players").LocalPlayer.Character:FindFirstChild("Electro") and game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Electro").Level.Value >= 400 or game:GetService("Players").LocalPlayer.Character:FindFirstChild("Electro").Level.Value >= 400 then
                        if _G.AutoFarm == false then
                            repeat task.wait()
                                topos(CFrame.new(-10371.4717, 330.764496, -10131.4199))
                            until not _G.AutoElectricClaw or (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position - CFrame.new(-10371.4717, 330.764496, -10131.4199).Position).Magnitude <= 10
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectricClaw","Start")
                            wait(2)
                            repeat task.wait()
                                topos(CFrame.new(-12550.532226563, 336.22631835938, -7510.4233398438))
                            until not _G.AutoElectricClaw or (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position - CFrame.new(-12550.532226563, 336.22631835938, -7510.4233398438).Position).Magnitude <= 10
                            wait(1)
                            repeat task.wait()
                                topos(CFrame.new(-10371.4717, 330.764496, -10131.4199))
                            until not _G.AutoElectricClaw or (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position - CFrame.new(-10371.4717, 330.764496, -10131.4199).Position).Magnitude <= 10
                            wait(1)
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectricClaw")
                        elseif _G.AutoFarm == true then
                            _G.AutoFarm = false
                            wait(1)
                            repeat task.wait()
                                topos(CFrame.new(-10371.4717, 330.764496, -10131.4199))
                            until not _G.AutoElectricClaw or (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position - CFrame.new(-10371.4717, 330.764496, -10131.4199).Position).Magnitude <= 10
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectricClaw","Start")
                            wait(2)
                            repeat task.wait()
                                topos(CFrame.new(-12550.532226563, 336.22631835938, -7510.4233398438))
                            until not _G.AutoElectricClaw or (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position - CFrame.new(-12550.532226563, 336.22631835938, -7510.4233398438).Position).Magnitude <= 10
                            wait(1)
                            repeat task.wait()
                                topos(CFrame.new(-10371.4717, 330.764496, -10131.4199))
                            until not _G.AutoElectricClaw or (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position - CFrame.new(-10371.4717, 330.764496, -10131.4199).Position).Magnitude <= 10
                            wait(1)
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectricClaw")
                            _G.SelectWeapon = "Electric Claw"
                            wait(.1)
                            _G.AutoFarm = true
                        end
                    end
                end
            end
        end
    end)
end)

Farm:Toggle("Auto Dragon Talon", false, function(value)
    _G.AutoDragonTalon = value
end)
spawn(function()
    while wait() do
        if _G.AutoDragonTalon then
            if game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Dragon Claw") or game:GetService("Players").LocalPlayer.Character:FindFirstChild("Dragon Claw") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Dragon Talon") or game:GetService("Players").LocalPlayer.Character:FindFirstChild("Dragon Talon") then
                if game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Dragon Claw") and game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Dragon Claw").Level.Value >= 400 then
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyDragonTalon")
                    _G.SelectWeapon = "Dragon Talon"
                end  
                if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Dragon Claw") and game:GetService("Players").LocalPlayer.Character:FindFirstChild("Dragon Claw").Level.Value >= 400 then
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyDragonTalon")
                    _G.SelectWeapon = "Dragon Talon"
                end  
                if game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Dragon Claw") and game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Dragon Claw").Level.Value <= 399 then
                    _G.SelectWeapon = "Dragon Claw"
                end 
            else 
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward","DragonClaw","2")
            end
        end
    end
end)

Farm:Toggle("Auto Godhuman", false, function(value)
    _G.Auto_God_Human = value
end)
spawn(function()
    while task.wait() do
		if _G.Auto_God_Human then
			pcall(function()
				if game.Players.LocalPlayer.Character:FindFirstChild("Superhuman") or game.Players.LocalPlayer.Backpack:FindFirstChild("Superhuman") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Black Leg") or game:GetService("Players").LocalPlayer.Character:FindFirstChild("Black Leg") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Death Step") or game:GetService("Players").LocalPlayer.Character:FindFirstChild("Death Step") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Fishman Karate") or game:GetService("Players").LocalPlayer.Character:FindFirstChild("Fishman Karate") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Sharkman Karate") or game:GetService("Players").LocalPlayer.Character:FindFirstChild("Sharkman Karate") or game.Players.LocalPlayer.Backpack:FindFirstChild("Electro") or game.Players.LocalPlayer.Character:FindFirstChild("Electro") or game.Players.LocalPlayer.Backpack:FindFirstChild("Electric Claw") or game.Players.LocalPlayer.Character:FindFirstChild("Electric Claw") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Dragon Claw") or game:GetService("Players").LocalPlayer.Character:FindFirstChild("Dragon Claw") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Dragon Talon") or game:GetService("Players").LocalPlayer.Character:FindFirstChild("Dragon Talon") or game.Players.LocalPlayer.Character:FindFirstChild("Godhuman") or game.Players.LocalPlayer.Backpack:FindFirstChild("Godhuman") then
					if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySuperhuman",true) == 1 then
						if game.Players.LocalPlayer.Backpack:FindFirstChild("Superhuman") and game.Players.LocalPlayer.Backpack:FindFirstChild("Superhuman").Level.Value >= 400 or game.Players.LocalPlayer.Character:FindFirstChild("Superhuman") and game.Players.LocalPlayer.Character:FindFirstChild("Superhuman").Level.Value >= 400 then
							game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyDeathStep")
						end
					else
						game.StarterGui:SetCore("SendNotification", {
							Title = "Notification", 
							Text = "Not Have Superhuman" ,
							Icon = "rbxassetid://18899804355",
							Duration = 2.5
						})
					end
					if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyDeathStep",true) == 1 then
						if game.Players.LocalPlayer.Backpack:FindFirstChild("Death Step") and game.Players.LocalPlayer.Backpack:FindFirstChild("Death Step").Level.Value >= 400 or game.Players.LocalPlayer.Character:FindFirstChild("Death Step") and game.Players.LocalPlayer.Character:FindFirstChild("Death Step").Level.Value >= 400 then
							game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySharkmanKarate")
						end
					else
						game.StarterGui:SetCore("SendNotification", {
							Title = "Notification", 
							Text = "Not Have Death Step" ,
							Icon = "rbxassetid://18899804355",
							Duration = 2.5
						})
					end
					if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySharkmanKarate",true) == 1 then
						if game.Players.LocalPlayer.Backpack:FindFirstChild("Sharkman Karate") and game.Players.LocalPlayer.Backpack:FindFirstChild("Sharkman Karate").Level.Value >= 400 or game.Players.LocalPlayer.Character:FindFirstChild("Sharkman Karate") and game.Players.LocalPlayer.Character:FindFirstChild("Sharkman Karate").Level.Value >= 400 then
							game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectricClaw")
						end
					else
						game.StarterGui:SetCore("SendNotification", {
							Title = "Notification", 
							Text = "Not Have SharkMan Karate" ,
							Icon = "rbxassetid://18899804355",
							Duration = 2.5
						})
					end
					if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectricClaw",true) == 1 then
						if game.Players.LocalPlayer.Backpack:FindFirstChild("Electric Claw") and game.Players.LocalPlayer.Backpack:FindFirstChild("Electric Claw").Level.Value >= 400 or game.Players.LocalPlayer.Character:FindFirstChild("Electric Claw") and game.Players.LocalPlayer.Character:FindFirstChild("Electric Claw").Level.Value >= 400 then
							game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyDragonTalon")
						end
					else
						game.StarterGui:SetCore("SendNotification", {
							Title = "Notification", 
							Text = "Not Have Electric Claw" ,
							Icon = "rbxassetid://18899804355",
							Duration = 2.5
						})
					end
					if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyDragonTalon",true) == 1 then
						if game.Players.LocalPlayer.Backpack:FindFirstChild("Dragon Talon") and game.Players.LocalPlayer.Backpack:FindFirstChild("Dragon Talon").Level.Value >= 400 or game.Players.LocalPlayer.Character:FindFirstChild("Dragon Talon") and game.Players.LocalPlayer.Character:FindFirstChild("Dragon Talon").Level.Value >= 400 then
							if string.find(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyGodhuman",true), "Bring") then
								game.StarterGui:SetCore("SendNotification", {
									Title = "Notification", 
									Text = "Not Have Enough Material" ,
									Icon = "rbxassetid://18899804355",
									Duration = 2.5
								})
							else
								game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyGodhuman")
							end
						end
					else
						game.StarterGui:SetCore("SendNotification", {
							Title = "Notification", 
							Text = "Not Have Dragon Talon" ,
							Icon = "rbxassetid://18899804355",
							Duration = 2.5
						})
					end
				else
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySuperhuman")
				end
			end)
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------Stats Tab
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
            end
        end
    end
end)

Stats:Slider("Point To Add", 0, 2550, 1, function(value)
    PointStats = value
end)
PointStats = 1
-----------------------------------------------------------------------------------------------------------------------------Teleport Tab
Tele:Seperator("World Teleport")

Tele:Button("Teleport To Frist Sea", function()
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelMain")
end)

Tele:Button("Teleport To Second Sea", function()
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelDressrosa")
end)

Tele:Button("Teleport To Third Sea", function()
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelZou")
end)

Tele:Seperator("Island Teleport")

if World1 then
    Tele:Dropdown("Select Island", {
        "WindMill",
        "Marine",
        "Middle Town",
        "Jungle",
        "Pirate Village",
        "Desert",
        "Snow Island",
        "MarineFord",
        "Colosseum",
        "Sky Island 1",
        "Sky Island 2",
        "Sky Island 3",
        "Prison",
        "Magma Village",
        "Under Water Island",
        "Fountain City",
        "Shank Room",
        "Mob Island"
        }, function(value)
            _G.SelectIsland = value
    end)
end

if World2 then
    Tele:Dropdown("Select Island", {
        "The Cafe",
        "Frist Spot",
        "Dark Area",
        "Flamingo Mansion",
        "Flamingo Room",
        "Green Zone",
        "Factory",
        "Colossuim",
        "Zombie Island",
        "Two Snow Mountain",
        "Punk Hazard",
        "Cursed Ship",
        "Ice Castle",
        "Forgotten Island",
        "Ussop Island",
        "Mini Sky Island"
        }, function(value)
            _G.SelectIsland = value
    end)
end

if World3 then
    Tele:Dropdown("Select Island", {
        "Mansion",
        "Port Town",
        "Great Tree",
        "Castle On The Sea",
        "MiniSky", 
        "Hydra Island",
        "Floating Turtle",
        "Haunted Castle",
        "Ice Cream Island",
        "Peanut Island",
        "Cake Island",
        "Cocoa Island",
        "Candy Island New",
        "Tiki Outpost"
        }, function(value)
            _G.SelectIsland = value
    end)
end

Tele:Toggle("Teleport To Selected Island", false, function(value)
    _G.TeleportIsland = value
    if _G.TeleportIsland == true then
        repeat wait()
            if _G.SelectIsland == "WindMill" then
                topos(CFrame.new(979.79895019531, 16.516613006592, 1429.0466308594))
            elseif _G.SelectIsland == "Marine" then
                topos(CFrame.new(-2566.4296875, 6.8556680679321, 2045.2561035156))
            elseif _G.SelectIsland == "Middle Town" then
                topos(CFrame.new(-690.33081054688, 15.09425163269, 1582.2380371094))
            elseif _G.SelectIsland == "Jungle" then
                topos(CFrame.new(-1612.7957763672, 36.852081298828, 149.12843322754))
            elseif _G.SelectIsland == "Pirate Village" then
                topos(CFrame.new(-1181.3093261719, 4.7514905929565, 3803.5456542969))
            elseif _G.SelectIsland == "Desert" then
                topos(CFrame.new(944.15789794922, 20.919729232788, 4373.3002929688))
            elseif _G.SelectIsland == "Snow Island" then
                topos(CFrame.new(1347.8067626953, 104.66806030273, -1319.7370605469))
            elseif _G.SelectIsland == "MarineFord" then
                topos(CFrame.new(-4914.8212890625, 50.963626861572, 4281.0278320313))
            elseif _G.SelectIsland == "Colosseum" then
                topos( CFrame.new(-1427.6203613281, 7.2881078720093, -2792.7722167969))
            elseif _G.SelectIsland == "Sky Island 1" then
                topos(CFrame.new(-4869.1025390625, 733.46051025391, -2667.0180664063))
            elseif _G.SelectIsland == "Sky Island 2" then  
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-4607.82275, 872.54248, -1667.55688))
            elseif _G.SelectIsland == "Sky Island 3" then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-7894.6176757813, 5547.1416015625, -380.29119873047))
            elseif _G.SelectIsland == "Prison" then
                topos( CFrame.new(4875.330078125, 5.6519818305969, 734.85021972656))
            elseif _G.SelectIsland == "Magma Village" then
                topos(CFrame.new(-5247.7163085938, 12.883934020996, 8504.96875))
            elseif _G.SelectIsland == "Under Water Island" then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(61163.8515625, 11.6796875, 1819.7841796875))
            elseif _G.SelectIsland == "Fountain City" then
                topos(CFrame.new(5127.1284179688, 59.501365661621, 4105.4458007813))
            elseif _G.SelectIsland == "Shank Room" then
                topos(CFrame.new(-1442.16553, 29.8788261, -28.3547478))
            elseif _G.SelectIsland == "Mob Island" then
                topos(CFrame.new(-2850.20068, 7.39224768, 5354.99268))
            elseif _G.SelectIsland == "The Cafe" then
                topos(CFrame.new(-380.47927856445, 77.220390319824, 255.82550048828))
            elseif _G.SelectIsland == "Frist Spot" then
                topos(CFrame.new(-11.311455726624, 29.276733398438, 2771.5224609375))
            elseif _G.SelectIsland == "Dark Area" then
                topos(CFrame.new(3780.0302734375, 22.652164459229, -3498.5859375))
            elseif _G.SelectIsland == "Flamingo Mansion" then
                topos(CFrame.new(-483.73370361328, 332.0383605957, 595.32708740234))
            elseif _G.SelectIsland == "Flamingo Room" then
                topos(CFrame.new(2284.4140625, 15.152037620544, 875.72534179688))
            elseif _G.SelectIsland == "Green Zone" then
                topos( CFrame.new(-2448.5300292969, 73.016105651855, -3210.6306152344))
            elseif _G.SelectIsland == "Factory" then
                topos(CFrame.new(424.12698364258, 211.16171264648, -427.54049682617))
            elseif _G.SelectIsland == "Colossuim" then
                topos( CFrame.new(-1503.6224365234, 219.7956237793, 1369.3101806641))
            elseif _G.SelectIsland == "Zombie Island" then
                topos(CFrame.new(-5622.033203125, 492.19604492188, -781.78552246094))
            elseif _G.SelectIsland == "Two Snow Mountain" then
                topos(CFrame.new(753.14288330078, 408.23559570313, -5274.6147460938))
            elseif _G.SelectIsland == "Punk Hazard" then
                topos(CFrame.new(-6127.654296875, 15.951762199402, -5040.2861328125))
            elseif _G.SelectIsland == "Cursed Ship" then
                topos(CFrame.new(923.40197753906, 125.05712890625, 32885.875))
            elseif _G.SelectIsland == "Ice Castle" then
                topos(CFrame.new(6148.4116210938, 294.38687133789, -6741.1166992188))
            elseif _G.SelectIsland == "Forgotten Island" then
                topos(CFrame.new(-3032.7641601563, 317.89672851563, -10075.373046875))
            elseif _G.SelectIsland == "Ussop Island" then
                topos(CFrame.new(4816.8618164063, 8.4599885940552, 2863.8195800781))
            elseif _G.SelectIsland == "Mini Sky Island" then
                topos(CFrame.new(-288.74060058594, 49326.31640625, -35248.59375))
            elseif _G.SelectIsland == "Great Tree" then
                topos(CFrame.new(2681.2736816406, 1682.8092041016, -7190.9853515625))
            elseif _G.SelectIsland == "Castle On The Sea" then
                topos(CFrame.new(-5074.45556640625, 314.5155334472656, -2991.054443359375))
            elseif _G.SelectIsland == "MiniSky" then
                topos(CFrame.new(-260.65557861328, 49325.8046875, -35253.5703125))
            elseif _G.SelectIsland == "Port Town" then
                topos(CFrame.new(-290.7376708984375, 6.729952812194824, 5343.5537109375))
            elseif _G.SelectIsland == "Hydra Island" then
                topos(CFrame.new(5228.8842773438, 604.23400878906, 345.0400390625))
            elseif _G.SelectIsland == "Floating Turtle" then
                topos(CFrame.new(-13274.528320313, 531.82073974609, -7579.22265625))
            elseif _G.SelectIsland == "Mansion" then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-12471.169921875, 374.94024658203, -7551.677734375))
            elseif _G.SelectIsland == "Haunted Castle" then
                topos(CFrame.new(-9515.3720703125, 164.00624084473, 5786.0610351562))
            elseif _G.SelectIsland == "Ice Cream Island" then
                topos(CFrame.new(-902.56817626953, 79.93204498291, -10988.84765625))
            elseif _G.SelectIsland == "Peanut Island" then
                topos(CFrame.new(-2062.7475585938, 50.473892211914, -10232.568359375))
            elseif _G.SelectIsland == "Cake Island" then
                topos(CFrame.new(-1884.7747802734375, 19.327526092529297, -11666.8974609375))
            elseif _G.SelectIsland == "Cocoa Island" then
                topos(CFrame.new(87.94276428222656, 73.55451202392578, -12319.46484375))
            elseif _G.SelectIsland == "Candy Island New⛄" then
                topos(CFrame.new(-1014.4241943359375, 149.11068725585938, -14555.962890625))
            elseif _G.SelectIsland == "Tiki Outpost" then
                topos(CFrame.new(-1149.328, 13.5759039, -14445.6143, -0.156446099, 0, -0.987686574, 0, 1, 0, 0.987686574, 0, -0.156446099))
            end
        until not _G.TeleportIsland
    end
    StopTween(_G.TeleportIsland)
end)

Tele:Seperator("NPC Teleport")

if World1 then
    Tele:Dropdown("Select NPC", {
        "Random Devil Fruit",
        "Blox Fruits Dealer",
        "Remove Devil Fruit",
        "Ability Teacher",
        "Dark Step", 
        "Electro",
        "Fishman Karate"
        }, function(value)
            _G.SelectNPC = value
    end)
end

if World2 then
    Tele:Dropdown("Select NPC", {
        "Dargon Berath",
        "Mtsterious Man",
        "Mysterious Scientist",
        "Awakening Expert",
        "Nerd", 
        "Bar Manager",
        "Blox Fruits Dealer",
        "Trevor",
        "Enhancement Editor",
        "Pirate Recruiter",
        "Marines Recruiter",
        "Chemist",
        "Cyborg",
        "Ghoul Mark",
        "Guashiem",
        "El Admin",
        "El Rodolfo",
        "Arowe"
        }, function(value)
            _G.SelectNPC = value
    end)
end

if World3 then
    Tele:Dropdown("Select NPC", {
        "Blox Fruits Dealer",
        "Remove Devil Fruit",
        "Horned Man",
        "Hungey Man",
        "Previous Hero", 
        "Butler",
        "Lunoven",
        "Trevor",
        "Elite Hunter",
        "Player Hunter",
        "Uzoth"
        }, function(value)
            _G.SelectNPC = value
    end)
end

Tele:Toggle("Teleport To Selected NPC", false, function(value)
    _G.TeleportNPC = value
    if _G.TeleportNPC == true then
        repeat wait()
            if _G.SelectNPC == "Dargon Berath" then
                topos(CFrame.new(703.372986, 186.985519, 654.522034, 1, 0, 0, 0, 1, 0, 0, 0, 1))
            elseif _G.SelectNPC == "Mtsterious Man" then
                topos(CFrame.new(-2574.43335, 1627.92371, -3739.35767, 0.378697902, -9.06400288e-09, 0.92552036, -8.95582009e-09, 1, 1.34578926e-08, -0.92552036, -1.33852689e-08, 0.378697902))
            elseif _G.SelectNPC == "Mysterious Scientist" then
                topos(CFrame.new(-6437.87793, 250.645355, -4498.92773, 0.502376854, -1.01223634e-08, -0.864648759, 2.34106086e-08, 1, 1.89508653e-09, 0.864648759, -2.11940012e-08, 0.502376854))
            elseif _G.SelectNPC == "Awakening Expert" then
                topos(CFrame.new(-408.098846, 16.0459061, 247.432846, 0.028394036, 6.17599138e-10, 0.999596894, -5.57905944e-09, 1, -4.59372484e-10, -0.999596894, -5.56376767e-09, 0.028394036))
            elseif _G.SelectNPC == "Nerd" then
                topos(CFrame.new(-401.783722, 73.0859299, 262.306702, 1, 0, 0, 0, 1, 0, 0, 0, 1))
            elseif _G.SelectNPC == "Bar Manager" then
                topos(CFrame.new(-385.84726, 73.0458984, 316.088806, 1, 0, 0, 0, 1, 0, 0, 0, 1))
            elseif _G.SelectNPC == "Blox Fruits Dealer" then
                topos(CFrame.new(-450.725464, 73.0458984, 355.636902, -0.780352175, -2.7266168e-08, 0.625340283, 9.78516468e-09, 1, 5.58128797e-08, -0.625340283, 4.96727601e-08, -0.780352175))
            elseif _G.SelectNPC == "Trevor" then
                topos(CFrame.new(-341.498322, 331.886444, 643.024963, 1, 0, 0, 0, 1, 0, 0, 0, 1))
            elseif _G.SelectNPC == "Plokster" then
                topos( CFrame.new(-1885.16016, 88.3838196, -1912.28723, -0.513468027, 0, 0.858108759, 0, 1, 0, -0.858108759, 0, -0.513468027))
            elseif _G.SelectNPC == "Enhancement Editor" then
                topos(CFrame.new(-346.820221, 72.9856339, 1194.36218, 1, 0, 0, 0, 1, 0, 0, 0, 1))
            elseif _G.SelectNPC == "Pirate Recruiter" then  
                topos(CFrame.new(-428.072998, 72.9495239, 1445.32422, 1, 0, 0, 0, 1, 0, 0, 0, 1))
            elseif _G.SelectNPC == "Marines Recruiter" then
                topos(CFrame.new(-1349.77295, 72.9853363, -1045.12964, 0.866493046, 0, -0.499189168, 0, 1, 0, 0.499189168, 0, 0.866493046))
            elseif _G.SelectNPC == "Chemist" then
                topos( CFrame.new(-2777.45288, 72.9919434, -3572.25732, 1, 0, 0, 0, 1, 0, 0, 0, 1))
            elseif _G.SelectNPC == "Ghoul Mark" then
                topos(CFrame.new(635.172546, 125.976357, 33219.832, 1, 0, 0, 0, 1, 0, 0, 0, 1))
            elseif _G.SelectNPC == "Cyborg" then
                topos(CFrame.new(629.146851, 312.307373, -531.624146, 1, 0, 0, 0, 1, 0, 0, 0, 1))
            elseif _G.SelectNPC == "Guashiem" then
                topos(CFrame.new(937.953003, 181.083359, 33277.9297, 1, -8.60126406e-08, 3.81773896e-17, 8.60126406e-08, 1, -1.89969598e-16, -3.8177373e-17, 1.89969598e-16, 1))
            elseif _G.SelectNPC == "El Admin" then
                topos(CFrame.new(1322.80835, 126.345039, 33135.8789, 0.988783717, -8.69797603e-08, -0.149354503, 8.62223786e-08, 1, -1.15461916e-08, 0.149354503, -1.46101409e-09, 0.988783717))
            elseif _G.SelectNPC == "El Rodolfo" then
                topos(CFrame.new(941.228699, 40.4686775, 32778.9922, -0.818029106, -1.19524382e-08, 0.575176775, -1.28741648e-08, 1, 2.47053866e-09, -0.575176775, -5.38394795e-09, -0.818029106))
            elseif _G.SelectNPC == "Arowe" then
                topos(CFrame.new(-1994.51038, 125.519142, -72.2622986, -0.16715166, -6.55417338e-08, -0.985931218, -7.13315558e-08, 1, -5.43836585e-08, 0.985931218, 6.12376851e-08, -0.16715166))
            elseif _G.SelectNPC == "Random Devil Fruit" then
                topos(CFrame.new(-1436.19727, 61.8777695, 4.75247526, -0.557794094, 2.74216543e-08, 0.829979479, 5.83273234e-08, 1, 6.16037932e-09, -0.829979479, 5.18467118e-08, -0.557794094))
            elseif _G.SelectNPC == "Blox Fruits Dealer" then
                topos(CFrame.new(-923.255066, 7.67800522, 1608.61011, 1, 0, 0, 0, 1, 0, 0, 0, 1))
            elseif _G.SelectNPC == "Remove Devil Fruit" then
                topos(CFrame.new(5664.80469, 64.677681, 867.85907, 1, 0, 0, 0, 1, 0, 0, 0, 1))
            elseif _G.SelectNPC == "Ability Teacher" then
                topos(CFrame.new(-1057.67822, 9.65220833, 1799.49146, -0.865874112, -9.26330159e-08, 0.500262439, -7.33759435e-08, 1, 5.816689e-08, -0.500262439, 1.36579752e-08, -0.865874112))
            elseif _G.SelectNPC == "Dark Step" then
                topos( CFrame.new(-987.873047, 13.7778397, 3989.4978, 1, 0, 0, 0, 1, 0, 0, 0, 1))
            elseif _G.SelectNPC == "Electro" then
                topos(CFrame.new(-5389.49561, 13.283, -2149.80151, 1, 0, 0, 0, 1, 0, 0, 0, 1))
            elseif _G.SelectNPC == "Fishman Karate" then
                topos( CFrame.new(61581.8047, 18.8965912, 987.832703, 1, 0, 0, 0, 1, 0, 0, 0, 1))
            elseif _G.SelectNPC == "Random Devil Fruit" then
                topos(CFrame.new(-12491, 337, -7449))
            elseif _G.SelectNPC == "Blox Fruits Dealer" then
                topos(CFrame.new(-12511, 337, -7448))
            elseif _G.SelectNPC == "Remove Devil Fruit" then
                topos(CFrame.new(-5571, 1089, -2661))
            elseif _G.SelectNPC == "Horned Man" then
                topos(CFrame.new(-11890, 931, -8760))
            elseif _G.SelectNPC == "Hungey Man" then
                topos(CFrame.new(-10919, 624, -10268))
            elseif _G.SelectNPC == "Previous Hero" then
                topos(CFrame.new(-10368, 332, -10128))
            elseif _G.SelectNPC == "Butler" then
                topos(CFrame.new(-5125, 316, -3130))
            elseif _G.SelectNPC == "Lunoven" then
                topos(CFrame.new(-5117, 316, -3093))
            elseif _G.SelectNPC == "Elite Hunter" then
                topos(CFrame.new(-5420, 314, -2828))
            elseif _G.SelectNPC == "Player Hunter" then
                topos(CFrame.new(-5559, 314, -2840))
            elseif _G.SelectNPC == "Uzoth" then
                topos(CFrame.new(-9785, 852, 6667))
            end
        until not _G.TeleportNPC
    end
    StopTween(_G.TeleportNPC)
end)
-----------------------------------------------------------------------------------------------------------------------------Player Tab
local plyserv = Player:Label("")
spawn(function()
    while wait() do
        pcall(function()
            for i,v in pairs(game:GetService("Players"):GetPlayers()) do
                if i == 12 then
                    plyserv:Set("Players :".." "..i.." ".."/".." ".."12".." ".."(Max)")
                elseif i == 1 then
                    plyserv:Set("Player :".." "..i.." ".."/".." ".."12")
                else
                    plyserv:Set("Players :".." "..i.." ".."/".." ".."12")
                end
            end
        end)
    end
end)

Playerslist = {}
for i,v in pairs(game:GetService("Players"):GetChildren()) do
    table.insert(Playerslist,v.Name)
end

local SelectedPly = Player:Dropdown("Select Player", Playerslist, function(value)
    _G.SelectPly = value
end)

Player:Button("Refresh Player List", function()
    Playerslist = {}
    SelectedPly:Clear()
    for i,v in pairs(game:GetService("Players"):GetChildren()) do  
        SelectedPly:Add(v.Name)
    end
end)

Player:Toggle("Spectate Selected Player", false, function(value)
    SpectatePlys = value
    local plr1 = game:GetService("Players").LocalPlayer.Character.Humanoid
    local plr2 = game:GetService("Players"):FindFirstChild(_G.SelectPly)
    repeat wait(.1)
        game:GetService("Workspace").Camera.CameraSubject = game:GetService("Players"):FindFirstChild(_G.SelectPly).Character.Humanoid
    until SpectatePlys == false 
    game:GetService("Workspace").Camera.CameraSubject = game:GetService("Players").LocalPlayer.Character.Humanoid
end)

Player:Toggle("Teleport To Selected Player", false, function(value)
    _G.Teleport = bool
    if _G.Teleport == false then
        game.Players:FindFirstChild(_G.SelectPly).Character.HumanoidRootPart.Size = Vector3.new(2, 2, 1)
    end
    while _G.Teleport do task.wait()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players:FindFirstChild(_G.SelectPly).Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, 0)
        game.Players:FindFirstChild(_G.SelectPly).Character.HumanoidRootPart.Size = Vector3.new(60,60,60)
        game:GetService'VirtualUser':CaptureController()
        game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
    end
end)

Player:Toggle("Auto Kill Selected Player", false, function(value)
    _G.Auto_Kill_Ply = value
    StopTween(_G.Auto_Kill_Ply)
end)
spawn(function()
    while wait() do
        if _G.Auto_Kill_Ply then
            pcall(function()
                if _G.SelectPly ~= nil then 
                    if game.Players:FindFirstChild(_G.SelectPly) then
                        if game.Players:FindFirstChild(_G.SelectPly).Character.Humanoid.Health > 0 then
                            repeat task.wait()
                                EquipWeapon(_G.SelectWeapon)
                                AutoHaki()
                                game.Players:FindFirstChild(_G.SelectPly).Character.HumanoidRootPart.CanCollide = false
                                topos(game.Players:FindFirstChild(_G.SelectPly).Character.HumanoidRootPart.CFrame * CFrame.new(0,5,0))
                                spawn(function()
                                    pcall(function()
                                        if _G.SelectWeapon == SelectWeaponGun then
                                            local args = {
                                                [1] = game.Players:FindFirstChild(_G.SelectPly).Character.HumanoidRootPart.Position,
                                                [2] = game.Players:FindFirstChild(_G.SelectPly).Character.HumanoidRootPart
                                            }
                                            game:GetService("Players").LocalPlayer.Character[SelectWeaponGun].RemoteFunctionShoot:InvokeServer(unpack(args))
                                        else
                                            game:GetService("VirtualUser"):CaptureController()
                                            game:GetService("VirtualUser"):Button1Down(Vector2.new(1280,672))
                                        end
                                    end)
                                end)
                            until game.Players:FindFirstChild(_G.SelectPly).Character.Humanoid.Health <= 0 or not game.Players:FindFirstChild(_G.SelectPly) or not _G.Auto_Kill_Ply
                        end
                    end
                end
            end)
        end
    end
end)

Player:Seperator("Player Quest")

Player:Button("Get Kill Player Quest", function()
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("PlayerHunter")
end)

Player:Toggle("Auto Kill Player Quest", false, function(value)
    _G.AutoPlayerHunter = value
    StopTween(_G.AutoPlayerHunter)
end)
spawn(function()
    game:GetService("RunService").Heartbeat:connect(function()
        pcall(function()
            if _G.AutoPlayerHunter then
                if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Humanoid") then
                    game:GetService("Players").LocalPlayer.Character.Humanoid:ChangeState(11)
                end
            end
        end)
    end)
end)
spawn(function()
    pcall(function()
        while wait(.1) do
            if _G.AutoPlayerHunter then
                if game:GetService("Players").LocalPlayer.PlayerGui.Main.PvpDisabled.Visible == true then
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("EnablePvp")
                end
            end
        end
    end)
end)
spawn(function()
    while wait() do
        if _G.AutoPlayerHunter then
            if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false then
                wait(.5)
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("PlayerHunter")
            else
                for i,v in pairs(game:GetService("Workspace").Characters:GetChildren()) do
                    if string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text,v.Name) then
                        repeat wait()
                            if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
                                local args = {
                                    [1] = "Buso"
                                }
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                            end
                            EquipWeapon(_G.SelectWeapon)
                            Useskill = true
                            topos(v.HumanoidRootPart.CFrame * CFrame.new(1,7,3))								
                            v.HumanoidRootPart.Size = Vector3.new(60,60,60)
                            game:GetService'VirtualUser':CaptureController()
                            game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
                        until _G.AutoPlayerHunter == false or v.Humanoid.Health <= 0
                        Useskill = false
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
                    end
                end
            end
        end
    end
end)
spawn(function()
    while wait() do
		pcall(function()
			if Useskill then
				game:GetService("VirtualInputManager"):SendKeyEvent(true,"Z",false,game)
				wait(0.1)
                game:GetService("VirtualInputManager"):SendKeyEvent(false,"Z",false,game)
                wait(0.1)
                game:GetService("VirtualInputManager"):SendKeyEvent(true,"X",false,game)
				wait(0.1)
                game:GetService("VirtualInputManager"):SendKeyEvent(false,"X",false,game)
                wait(0.1)
                game:GetService("VirtualInputManager"):SendKeyEvent(true,"C",false,game)
				wait(0.1)
                game:GetService("VirtualInputManager"):SendKeyEvent(false,"C",false,game)
                wait(0.1)
                game:GetService("VirtualInputManager"):SendKeyEvent(true,"V",false,game)
				wait(0.1)
                game:GetService("VirtualInputManager"):SendKeyEvent(false,"V",false,game)
			end
		end)
    end
end)

-----------------------------------------------------------------------------------------------------------------------------Devil Fruit Tab

DemonFruit:Seperator("Sniper")
    
    FruitList = {
        "Bomb-Bomb",
        "Spike-Spike",
        "Chop-Chop",
        "Spring-Spring",
        "Kilo-Kilo",
        "Spin-Spin",
        "Bird: Falcon",
        "Smoke-Smoke",
        "Flame-Flame",
        "Ice-Ice",
        "Sand-Sand",
        "Dark-Dark",
        "Revive-Revive",
        "Diamond-Diamond",
        "Light-Light",
        "Love-Love",
        "Rubber-Rubber",
        "Barrier-Barrier",
        "Magma-Magma",
        "Door-Door",
        "Quake-Quake",
        "Human-Human: Buddha",
        "String-String",
        "Bird-Bird: Phoenix",
        "Rumble-Rumble",
        "Paw-Paw",
        "Gravity-Gravity",
        "Dough-Dough",
        "Venom-Venom",
        "Shadow-Shadow",
        "Control-Control",
        "Soul-Soul",
        "Dragon-Dragon",
        "Leopard-Leopard"
    }
    
    local Remote_GetFruits = game.ReplicatedStorage:FindFirstChild("Remotes").CommF_:InvokeServer("GetFruits");
	Table_DevilFruitSniper = {}
	ShopDevilSell = {}
	for i,v in next,Remote_GetFruits do
		table.insert(Table_DevilFruitSniper,v.Name)
		if v.OnSale then 
			table.insert(ShopDevilSell,v.Name)
		end
	end
	
    _G.SelectFruit = ""
    DemonFruit:Dropdown("Select Fruits Sniper",Table_DevilFruitSniper,function(value)
        _G.SelectFruit = value
    end)
    
    DemonFruit:Toggle("Auto Buy Fruit Sniper",_G.AutoBuyFruitSniper,function(value)
        _G.AutoBuyFruitSniper = value
    end)
    
    DemonFruit:Seperator("Others")
    
    DemonFruit:Dropdown("Select Fruits Eat",Table_DevilFruitSniper,function(value)
        _G.SelectFruitEat = value
    end)
    
    DemonFruit:Toggle("Auto Eat Fruit",_G.AutoEatFruit,function(value)
        _G.AutoEatFruit = value
    end)
    
    spawn(function()
        pcall(function()
            while wait(.1) do
                if _G.AutoEatFruit then
                    game:GetService("Players").LocalPlayer.Character:FindFirstChild(_G.SelectFruitEat).EatRemote:InvokeServer()
                end
            end
        end)
    end)
    
    DemonFruit:Toggle("Auto Eat Fruit Hop",_G.AutoEatFruitHop,function(value)
        _G.AutoEatFruitHop = value
    end)
    
    spawn(function()
        pcall(function()
            while wait(.1) do wait(10)
                if _G.AutoEatFruitHop and _G.SelectFruitEat ~= nil then
                    if not game:GetService("Players").LocalPlayer.Character:FindFirstChild(_G.SelectFruitEat) or not game:GetService("Players").LocalPlayer.Backpack:FindFirstChild(_G.SelectFruitEat) then
                        Hop()
                    else
                        game:GetService("Players").LocalPlayer.Character:FindFirstChild(_G.SelectFruitEat).EatRemote:InvokeServer()
                    end
                end
            end
        end)
    end)
    
    spawn(function()
        pcall(function()
            while wait(.1) do
                if _G.AutoBuyFruitSniper then
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("GetFruits")
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("PurchaseRawFruit","_G.SelectFruit",false)
                end 
            end
        end)
    end)
    
    DemonFruit:Toggle("Auto Random Fruit",_G.Random_Auto,function(value)
        _G.Random_Auto = value
    end)
    
    spawn(function()
        pcall(function()
            while wait(.1) do
                if _G.Random_Auto then
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Cousin","Buy")
                end 
            end
        end)
    end)
    
    DemonFruit:Button("Random Fruit",function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Cousin","Buy")
    end)
    
        DemonFruit:Button("Open Devil Shop",function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("GetFruits")
        game:GetService("Players").LocalPlayer.PlayerGui.Main.FruitShop.Visible = true
    end)
    
    DemonFruit:Toggle("Auto Drop Fruit",_G.DropFruit,function(value)
        _G.DropFruit = value
    end)
        
    spawn(function()
        while wait() do
            if _G.DropFruit then
                pcall(function()
                    for i,v in pairs(game:GetService("Players").LocalPlayer.Backpack:GetChildren()) do
                        if string.find(v.Name, "Fruit") then
                            EquipWeapon(v.Name)
                            wait(.1)
                            if game:GetService("Players").LocalPlayer.PlayerGui.Main.Dialogue.Visible == true then
                                game:GetService("Players").LocalPlayer.PlayerGui.Main.Dialogue.Visible = false
                            end
                            EquipWeapon(v.Name)
                            game:GetService("Players").LocalPlayer.Character:FindFirstChild(SelectFruit).EatRemote:InvokeServer("Drop")
                        end
                    end
                for i,v in pairs(game:GetService("Players").LocalPlayer.Character:GetChildren()) do
                        if string.find(v.Name, "Fruit") then
                            EquipWeapon(v.Name)
                            wait(.1)
                            if game:GetService("Players").LocalPlayer.PlayerGui.Main.Dialogue.Visible == true then
                                game:GetService("Players").LocalPlayer.PlayerGui.Main.Dialogue.Visible = false
                            end
                            EquipWeapon(v.Name)
                            game:GetService("Players").LocalPlayer.Character:FindFirstChild(SelectFruit).EatRemote:InvokeServer("Drop")
                        end
                    end
                end)
            end
        end
    end)
    
    DemonFruit:Toggle("Store All Fruits", false, function(value)
    _G.AutoStoreSsFruit = value
end)
spawn(function()
    pcall(function()
        while wait() do
            if _G.AutoStoreSsFruit then
                for i, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                    if v:IsA("Tool") and string.find(v.Name, "Fruit") then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit",v:GetAttribute("OriginalName"),v)
                        Load.Text = "Keep Fruit Success"
                    end
                end
                for i, v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
                    if v:IsA("Tool") and string.find(v.Name, "Fruit") then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit",v:GetAttribute("OriginalName"),v)
                        Load.Text = "Keep Fruit Success"
                    end
                end
            end
        end
    end)
end)
    
    DemonFruit:Toggle("Fruit Notification",_G.Grabfruit,function(value)
    _G.FruitCheck = value
    end)
    
    spawn(function()
			while wait(.1) do
				if _G.FruitCheck then
					for i,v in pairs(game.Workspace:GetChildren()) do
						if string.find(v.Name, "Fruit") then
							require(game:GetService("ReplicatedStorage").Notification).new("Fruit Spawn Kìa"):Display();
                            wait()
                            setthreadcontext(5)
						end
					end
				end
    end
    end)
    
    DemonFruit:Toggle("Bring to Fruit",_G.Grabfruit,function(value)
    _G.Grabfruit = value
    end)
    spawn(function()
			while wait(.1) do
				if _G.Grabfruit then
					for i,v in pairs(game.Workspace:GetChildren()) do
						if string.find(v.Name, "Fruit") then
							game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.Handle.CFrame
						end
					end
				end
    end
    end)
    
DemonFruit:Toggle("Tween to Fruit",false,function(value)
 _G.Grabfruit = value
end)

spawn(function()
			while wait(.1) do
				if _G.Grabfruit then
					for i,v in pairs(game.Workspace:GetChildren()) do
						if string.find(v.Name, "Fruit") then
							game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.Handle.CFrame
						end
					end
				end
end
end)
    
        DemonFruit:Toggle("Bring All Fruit 75% Kick System",_G.BringFruitBF,function(value)
        _G.BringFruitBF = value
    end)
    
    spawn(function()
        while wait() do
            if _G.BringFruitBF then
                pcall(function()
                    for i,v in pairs(game.Workspace:GetChildren()) do
                        if v:IsA("Tool") then
                            v.Handle.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
                        end
                    end	
                end)
            end
        end
    end)

--------------------------------------------------------------------------------------------------------------------Esp tab
Esp:Seperator("ESP")

Esp:Toggle("ESP Player", false, function(value)
    _G.ESPPLayers = value
    ESPPlayer = value
    UpdatePlayerChams()
end)
spawn(function()
    pcall(function()
        while wait() do
            if _G.ESPPLayers then
                UpdatePlayerChams()
            end
        end
    end)
end)
Esp:Toggle("ESP Chest", false, function(value)
    _G.ESPCHESTE = value
    ChestESP = value
    UpdateChestChams()
end)
spawn(function()
    pcall(function()
        while wait() do
            if _G.ESPCHESTE then
                UpdateChestChams()
            end
        end
    end)
end)
Esp:Toggle("ESP Flower", false, function(value)
    _G.ESPFloweers = value
    FlowerESP = value
    UpdateFlowerChams()
end)
spawn(function()
    pcall(function()
        while wait() do
            if _G.ESPFloweers then
                UpdateFlowerChams()
            end
        end
    end)
end)
Esp:Toggle("ESP All Fruits", false, function(value)
    _G.AutoESPFruit = value
    DevilFruitESP = value
    UpdateDevilChams()
end)
spawn(function()
    pcall(function()
        while wait() do
            if _G.AutoESPFruit then
                UpdateDevilChams()
            end
        end
    end)
end)
Esp:Toggle("ESP Real Fruits", false, function(value)
    _G.AutoESPFruit2 = value
    RealFruitESP = value
    UpdateRealFruitChams()
end)
spawn(function()
    pcall(function()
        while wait() do
            if _G.AutoESPFruit2 then
                UpdateRealFruitChams()
            end
        end
    end)
end)
Esp:Toggle("ESP Island", false, function(value)
    _G.AutoESPisland = value
    IslandESP = value
    UpdateIslandESP()
end)
spawn(function()
    pcall(function()
        while wait() do
            if _G.AutoESPisland then
                UpdateIslandESP()
            end
        end
    end)
end)
Esp:Toggle("ESP Mirage", false, function(value)
    _G.AutoESPislandMNM = value
    MirageIslandESP = value
    UpdateIslandMirageESP()
end)
spawn(function()
    pcall(function()
        while wait() do
            if _G.AutoESPislandMNM then
                UpdateIslandMirageESP()
            end
        end
    end)
end)
Esp:Toggle("ESP Advance Dealer", false, function(value)
    _G.AutoESPAFD = value
    AfdESP = value
    UpdateAfdESP()
end)
spawn(function()
    pcall(function()
        while wait() do
            if _G.AutoESPAFD then
                UpdateAfdESP()
            end
        end
    end)
end)

-----------------------------------------------------------------------------------------------------------------------------Raid Tab
local TimeRaid = Raid:Label("")
spawn(function()
    pcall(function()
        while wait() do
            if game:GetService("Players").LocalPlayer.PlayerGui.Main.Timer.Visible == true then
                TimeRaid:Set(game:GetService("Players").LocalPlayer.PlayerGui.Main.Timer.Text)
            else
                TimeRaid:Set("Wait For Dungeon")
            end
        end
    end)
end)

local Island1 = Raid:Label("")
spawn(function()
    pcall(function()
        while wait() do
            if game.Workspace._WorldOrigin.Locations:FindFirstChild('Island 1') then
                Island1:Set('✅: Island 1')
            else
                Island1:Set('❌: Island 1' )
            end
        end
    end)
end)

local Island2 = Raid:Label("")
spawn(function()
    pcall(function()
        while wait() do
            if game.Workspace._WorldOrigin.Locations:FindFirstChild('Island 2') then
                Island2:Set('✅: Island 2')
            else
                Island2:Set('❌: Island 2' )
            end
        end
    end)
end)

local Island3 = Raid:Label("")
spawn(function()
    pcall(function()
        while wait() do
            if game.Workspace._WorldOrigin.Locations:FindFirstChild('Island 3') then
                Island3:Set('✅: Island 3')
            else
                Island3:Set('❌: Island 3' )
            end
        end
    end)
end)

local Island4 = Raid:Label("")
spawn(function()
    pcall(function()
        while wait() do
            if game.Workspace._WorldOrigin.Locations:FindFirstChild('Island 4') then
                Island4:Set('✅: Island 4')
            else
                Island4:Set('❌: Island 4' )
            end
        end
    end)
end)

local Island5 = Raid:Label("")
spawn(function()
    pcall(function()
        while wait() do
            if game.Workspace._WorldOrigin.Locations:FindFirstChild('Island 5') then
                Island5:Set('✅: Island 5')
            else
                Island5:Set('❌: Island 5' )
            end
        end
    end)
end)

Raid:Seperator("Auto Raid")

if World2 then
    Raid:Button("Teleport To Lab", function()
        topos(CFrame.new(-6438.73535, 250.645355, -4501.50684))
    end)
elseif World3 then
    Raid:Button("Teleport To Lab", function()
        topos(CFrame.new(-5017.40869, 314.844055, -2823.0127, -0.925743818, 4.48217499e-08, -0.378151238, 4.55503146e-09, 1, 1.07377559e-07, 0.378151238, 9.7681621e-08, -0.925743818))
    end)
end

_G.SelectChip = selectraids or ""
Raidslist = {}
RaidsModule = require(game.ReplicatedStorage.Raids)
for i,v in pairs(RaidsModule.raids) do
    table.insert(Raidslist,v)
end
for i,v in pairs(RaidsModule.advancedRaids) do
    table.insert(Raidslist,v)
end

Raid:Dropdown("Select Chip", Raidslist, function(value)
    _G.SelectChip = value
end)

Raid:Button("Buy Selected Chip", function()
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("RaidsNpc","Select",_G.SelectChip)
end)

Raid:Toggle("Auto Select Raid", false, function(value)
    _G.AutoSelectDungeon = value
end)
spawn(function()
    while wait() do
        if _G.AutoSelectDungeon then
            pcall(function()
                if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Flame-Flame") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Flame-Flame") then
                    _G.SelectChip = "Flame"
                elseif game:GetService("Players").LocalPlayer.Character:FindFirstChild("Ice-Ice") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Ice-Ice") then
                    _G.SelectChip = "Ice"
                elseif game:GetService("Players").LocalPlayer.Character:FindFirstChild("Quake-Quake") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Quake-Quake") then
                    _G.SelectChip = "Quake"
                elseif game:GetService("Players").LocalPlayer.Character:FindFirstChild("Light-Light") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Light-Light") then
                    _G.SelectChip = "Light"
                elseif game:GetService("Players").LocalPlayer.Character:FindFirstChild("Dark-Dark") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Dark-Dark") then
                    _G.SelectChip = "Dark"
                elseif game:GetService("Players").LocalPlayer.Character:FindFirstChild("String-String") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("String-String") then
                    _G.SelectChip = "String"
                elseif game:GetService("Players").LocalPlayer.Character:FindFirstChild("Rumble-Rumble") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Rumble-Rumble") then
                    _G.SelectChip = "Rumble"
                elseif game:GetService("Players").LocalPlayer.Character:FindFirstChild("Magma-Magma") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Magma-Magma") then
                    _G.SelectChip = "Magma"
                elseif game:GetService("Players").LocalPlayer.Character:FindFirstChild("Human-Human: Buddha Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Human-Human: Buddha Fruit") then
                    _G.SelectChip = "Human: Buddha"
                elseif game:GetService("Players").LocalPlayer.Character:FindFirstChild("Sand-Sand") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Sand-Sand") then
                    _G.SelectChip = "Sand"
                elseif game:GetService("Players").LocalPlayer.Character:FindFirstChild("Bird-Bird: Phoenix") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Bird-Bird: Phoenix") then
                    _G.SelectChip = "Bird: Phoenix"
                elseif game:GetService("Players").LocalPlayer.Character:FindFirstChild("Dough") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Dough") then
                    _G.SelectChip = "Dough"
                else
                    _G.SelectChip = "Flame"
                end
            end)
        end
    end
end)

Raid:Toggle("Auto Buy Chip", false, function(value)
    _G.AutoBuyChip = value
end)
spawn(function()
    pcall(function()
        while wait() do
            if _G.AutoBuyChip then
                if not game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Special Microchip") or not game:GetService("Players").LocalPlayer.Character:FindFirstChild("Special Microchip") then
                    if not game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 1") then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("RaidsNpc", "Select", _G.SelectChip)
                    end
                end
            end
        end
    end)
end)

Raid:Toggle("Auto Start Raid", false, function(value)
    _G.Auto_StartRaid = value
end)
spawn(function()
    while wait(.1) do
        pcall(function()
            if _G.Auto_StartRaid then
                if game:GetService("Players")["LocalPlayer"].PlayerGui.Main.Timer.Visible == false then
                    if not game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 1") and game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Special Microchip") or game:GetService("Players").LocalPlayer.Character:FindFirstChild("Special Microchip") then
                        if World2 then
                            fireclickdetector(game:GetService("Workspace").Map.CircleIsland.RaidSummon2.Button.Main.ClickDetector)
                        elseif World3 then
                            fireclickdetector(game:GetService("Workspace").Map["Boat Castle"].RaidSummon2.Button.Main.ClickDetector)
                        end
                    end
                end
            end
        end)
    end
end)

Raid:Toggle("Kill Aura", false, function(value)
    _G.Kill_Aura = value
end)
spawn(function()
    pcall(function() 
        while wait() do
            if _G.Kill_Aura then
                if game:GetService("Players")["LocalPlayer"].PlayerGui.Main.Timer.Visible == true then
                    for i,v in pairs(game:GetService("Workspace").Enemies:GetDescendants()) do
                        if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                            pcall(function()
                                repeat wait()
                                    sethiddenproperty(game:GetService("Players").LocalPlayer,"SimulationRadius",math.huge)
                                    v.Humanoid.Health = 0
                                    v.HumanoidRootPart.CanCollide = false
                                until not _G.Kill_Aura or not v.Parent or v.Humanoid.Health <= 0
                            end)
                        end
                    end
                end
            end
        end
    end)
end)

Raid:Toggle("Auto Next Island", false, function(value)
    _G.Auto_Dungeon = value
    StopTween(_G.Auto_Dungeon)
end)
spawn(function()
    pcall(function()
        while wait() do
            if _G.Auto_Dungeon then
                if game:GetService("Players")["LocalPlayer"].PlayerGui.Main.Timer.Visible == true then
                    if game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 5") then
                        topos(game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 5").CFrame*RaidPos)
                    elseif game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 4") then
                        topos(game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 4").CFrame*RaidPos)
                    elseif game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 3") then
                        topos(game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 3").CFrame*RaidPos)
                    elseif game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 2") then
                        topos(game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 2").CFrame*RaidPos)
                    elseif game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 1") then
                        topos(game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 1").CFrame*RaidPos)
                    end
                end
            end
        end
    end)
end)
Type = 1
spawn(function()
    while wait(.1) do
        if Type == 1 then
            RaidPos = CFrame.new(0,25,0)
		elseif Type == 2 then
			RaidPos = CFrame.new(0,25,-40)
		elseif Type == 3 then
			RaidPos = CFrame.new(40,25,0)
		elseif Type == 4 then
			RaidPos = CFrame.new(0,25,40)	
		elseif Type == 5 then
			RaidPos = CFrame.new(-40,25,0)
		elseif Type == 6 then
			RaidPos = CFrame.new(0,25,0)
        end
    end
end)
spawn(function()
    while wait(.1) do
        Type = 1
        wait(0.9)
        Type = 2
        wait(0.9)
        Type = 3
        wait(0.9)
        Type = 4
        wait(0.9)
        Type = 5
        wait(0.9)
    end
end)

Raid:Toggle("Auto Awanken Fruit", false, function(value)
    _G.Auto_Awakener = value
end)
spawn(function()
    pcall(function()
        while wait(.1) do
            if _G.Auto_Awakener then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Awakener","Check")
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Awakener","Awaken")
            end
        end
    end)
end)

Raid:Seperator("Advanced Raid")

Raid:Button("Buy Law Raid Chip", function()
    local args = {
        [1] = "BlackbeardReward",
        [2] = "Microchip",
        [3] = "2"
     }
     game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
end)

Raid:Button("Start Law Raid", function()
    fireclickdetector(game:GetService("Workspace").Map.CircleIsland.RaidSummon.Button.Main.ClickDetector)
end)

Raid:Toggle("Auto Law Raid", false, function(value)
    _G.autoLawRaid = value
    StopTween( _G.autoLawRaid)
end)
spawn(function()
    while wait() do
        if  _G.autoLawRaid then
            pcall(function()
                if game:GetService("Workspace").Enemies:FindFirstChild("Order") then
                    for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                        if v.Name == "Order" then
                            if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                repeat task.wait()
                                    AutoHaki()
                                    EquipWeapon(_G.SelectWeapon)
                                    v.HumanoidRootPart.CanCollide = false
                                    v.Humanoid.WalkSpeed = 0
                                    v.HumanoidRootPart.Size = Vector3.new(50,50,50)
                                    topos(v.HumanoidRootPart.CFrame * Pos)
                                    game:GetService("VirtualUser"):CaptureController()
                                    game:GetService("VirtualUser"):Button1Down(Vector2.new(1280,672))
                                    sethiddenproperty(game.Players.LocalPlayer,"SimulationRadius",math.huge)
                                until not  _G.autoLawRaid or not v.Parent or v.Humanoid.Health <= 0
                            end
                        end
                    end
                else
                    if game:GetService("ReplicatedStorage"):FindFirstChild("Order") then
                        topos(game:GetService("ReplicatedStorage"):FindFirstChild("Order").HumanoidRootPart.CFrame * CFrame.new(2,20,2))
                    else
                        if  _G.autoLawRaidHop then
                            Hop()
                        end
                    end
                end
            end)
        end
    end
end)

Raid:Toggle("Auto Phoenix Raid", false, function(value)
    _G.AutoAdvanceDungeon = value
    StopTween(_G.AutoAdvanceDungeon)
end)
spawn(function()
    while wait() do
        if _G.AutoAdvanceDungeon then
            pcall(function()
                if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Bird: Phoenix") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Bird: Phoenix") then
                    if game.Players.LocalPlayer.Backpack:FindFirstChild(game.Players.LocalPlayer.Data.DevilFruit.Value) then
                        if game.Players.LocalPlayer.Backpack:FindFirstChild(game.Players.LocalPlayer.Data.DevilFruit.Value).Level.Value >= 400 then
                            topos(CFrame.new(-2812.76708984375, 254.803466796875, -12595.560546875))
                            if (CFrame.new(-2812.76708984375, 254.803466796875, -12595.560546875).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 10 then
                                wait(1.5)
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SickScientist","Check")
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SickScientist","Heal")
                            end
                        end
                    elseif game.Players.LocalPlayer.Character:FindFirstChild(game.Players.LocalPlayer.Data.DevilFruit.Value) then
                        if game.Players.LocalPlayer.Character:FindFirstChild(game.Players.LocalPlayer.Data.DevilFruit.Value).Level.Value >= 400 then
                            topos(CFrame.new(-2812.76708984375, 254.803466796875, -12595.560546875))
                            if (CFrame.new(-2812.76708984375, 254.803466796875, -12595.560546875).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 10 then
                                wait(1.5)
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SickScientist","Check")
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SickScientist","Heal")
                            end
                        end
                    end
                end
            end)
        end
    end
end)
-----------------------------------------------------------------------------------------------------------------------------    Shop:Seperator("Abilities")
    
    Shop:Button("Buy Geppo [ $10,000 ]",function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyHaki","Geppo")
    end)
    
    Shop:Button("Buy Buso Haki [ $25,000 ]",function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyHaki","Buso")
    end)
    
    Shop:Button("Buy Soru [ $25,000 ]",function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyHaki","Soru")
    end)
    
    Shop:Button("Buy Observation Haki [ $750,000 ]",function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("KenTalk","Buy")
    end)
    
Shop:Toggle("Auto Buy Abilities", false, function(t)
    Abilities = t
    while Abilities do wait(.1)
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyHaki","Geppo")
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyHaki","Buso")
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyHaki","Soru")
    end
end)

Shop:Seperator("Boats")

BoatList = {
    "Pirate Sloop",
    "Enforcer",
    "Rocket Boost",
    "Dinghy",
    "Pirate Basic",
    "Pirate Brigade"
}

spawn(function()
    while wait() do
        pcall(function()
            if SelectBoat == "Pirate Sloop" then
                _G.SelectBoat = "PirateSloop"
            else
                if SelectBoat == "Enforcer" then
                    _G.SelectBoat = "Enforcer"
                else
                    if SelectBoat == "RocketBoost" then
                        _G.SelectBoat = "RocketBoost"
                    else
                        if SelectBoat == "PirateBasic" then
                            _G.SelectBoat = "PirateBasic"
                        else
                            if SelectBoat == "Pirate Brigade" then
                                _G.SelectBoat = "PirateBrigade"
                            end
                        end
                    end
                end
            end
        end)
    end
end)

Shop:Dropdown("Select Boats",BoatList,function(value)
    SelectBoat = value
end)

Shop:Button("Buy Boat",function()
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyBoat",_G.SelectBoat)
end)

    Shop:Seperator("Fighting Style")
    
    Shop:Button("Buy Black Leg [ $150,000 ]",function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyBlackLeg")
    end)
    
    Shop:Button("Buy Electro [ $500,000 ]",function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectro")
    end)
    
    Shop:Button("Buy Fishman Karate [ $750,000 ]",function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyFishmanKarate")
    end)
    
    Shop:Button("Buy Dragon Claw [ 1,500F ]",function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward","DragonClaw","1")
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward","DragonClaw","2")
    end)
    
    Shop:Button("Buy Superhuman [ $3,000,000 ]",function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySuperhuman")
    end)
    
    Shop:Button("Buy Death Step [ $2,500,000 5,000Fag ]",function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyDeathStep")
    end)
    
    Shop:Button("Buy Sharkman Karate [ $2,500,000 5,000Fag ]",function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySharkmanKarate",true)
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySharkmanKarate")
    end)
    
    Shop:Button("Buy Electric Claw [ $3,000,000 5,000Fag ]",function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectricClaw")
    end)
    
    Shop:Button("Buy Dragon Talon [ $3,000,000 5,000Fag ]",function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyDragonTalon")
    end)

    Shop:Button("Buy God Human [ $5,000,000 5,000Fag ]",function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyGodhuman")
    end)
    
    Shop:Button("Buy Sanguine Art [ $5,000,000 5,000Fag ]",function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySanguineArt")
    end)
    -----Shop----------------
    
    Shop:Seperator(" Sword ")
    
    Shop:Button("Cutlass [ $1,000 ]",function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem","Cutlass")
    end)

    Shop:Button("Katana [ $1,000 ]",function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem","Katana")
    end)
    
    Shop:Button("Iron Mace [ $25,000 ]",function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem","Iron Mace")
    end)
    
    Shop:Button("Dual Katana [ $12,000 ]",function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem","Duel Katana")
    end)
    
    Shop:Button("Triple Katana [ $60,000 ]", function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem","Triple Katana")
    end)
    
    Shop:Button("Pipe [ $100,000 ]",function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem","Pipe")
    end)
    
    Shop:Button("Dual-Headed Blade [ $400,000 ]",function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem","Dual-Headed Blade")
    end)
    
    Shop:Button("Bisento [ $1,200,000 ]",function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem","Bisento")
    end)
    
    Shop:Button("Soul Cane [ $750,000 ]",function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem","Soul Cane")
    end)

    Shop:Button("Pole v.2 [ 5,000Fag ]",function()
		game.ReplicatedStorage.Remotes.CommF_:InvokeServer("ThunderGodTalk")
	end)

    Shop:Toggle("Yama Sword [ Elite Hunter 30 ]",_G.AutoYama,function(value)
        _G.AutoYama = value
    end)
    
    spawn(function()
        while wait() do
            if _G.AutoYama then
                if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("EliteHunter","Progress") >= 30 then
                    repeat wait(.1)
                        fireclickdetector(game:GetService("Workspace").Map.Waterfall.SealedKatana.Handle.ClickDetector)
                    until game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Yama") or not _G.AutoYama
                end
            end
        end
    end)


    Shop:Seperator(" Gun ")
    
    Shop:Button("Slingshot [ $5,000 ]",function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem","Slingshot")
    end)
    
    Shop:Button("Musket [ $8,000 ]",function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem","Musket")
    end)
    
    Shop:Button("Flintlock [ $10,500 ]",function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem","Flintlock")
    end)
    
    Shop:Button("Refined Slingshot [ $30,000 ]",function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem","Refined Flintlock")
    end)
    
    Shop:Button("Refined Flintlock [ $65,000 ]",function()
		local args = {
			[1] = "BuyItem",
			[2] = "Refined Flintlock"
		}
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
	end)
    
    Shop:Button("Cannon [ $100,000 ]",function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem","Cannon")
    end)
    
    Shop:Button("Kabucha [ 1,500 Fragments]",function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward","Slingshot","1")
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward","Slingshot","2")
    end)

          Shop:Button("Bizarre Rifle [ 250 Ectoplasm ]", function()
                                    local A_1 = "Ectoplasm"
                                    local A_2 = "Buy"
                                    local A_3 = 1
                                    local Event = game:GetService("ReplicatedStorage").Remotes["CommF_"]
                                    Event:InvokeServer(A_1, A_2, A_3) 
                                    local A_1 = "Ectoplasm"
                                    local A_2 = "Buy"
                                    local A_3 = 1
                                    local Event = game:GetService("ReplicatedStorage").Remotes["CommF_"]
                                    Event:InvokeServer(A_1, A_2, A_3)
                                end)

    ------------Stat------------------
    
    Shop:Seperator("Stats")

Shop:Button("Reset Stats [ 2,500Fag ]", function()
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward","Refund","1")
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward","Refund","2")
end)

Shop:Button("Random Race [ 3,000Fag ]", function()
	game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward","Reroll","1")
	game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward","Reroll","2")
end)
    --------------Accessories-----------------
    	Shop:Seperator("Accessories")
	Shop:Button("Black Cape [ $10,000 ]",function()
		local args = {
			[1] = "BuyItem",
			[2] = "Black Cape"
		}
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
	end)
	Shop:Button("Swordsman Hat [ $150,000 ]",function()
		local args = {
			[1] = "BuyItem",
			[2] = "Swordsman Hat"
		}
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
	end)
	Shop:Button("Tomoe Ring [ $500,000 ]",function()
		local args = {
			[1] = "BuyItem",
			[2] = "Tomoe Ring"
		}
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
	end)
	Shop:Button("Tomoe Ring [ $500,000 ]",function()
		local args = {
			[1] = "BuyItem",
			[2] = "Tomoe Ring"
