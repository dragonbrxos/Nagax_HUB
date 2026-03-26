-- NAGAX HUB | SEA EVENTS
Event:Toggle("Auto Drive Boat", _G.MatsuAutoDriveBoat,function(value)
         _G.MatsuAutoDriveBoat = value
        StopTween( _G.MatsuAutoDriveBoat)
    end)
    
    spawn(function()
        while wait() do
            pcall(function()
                if _G.MatsuAutoDriveBoat then
                    if not game:GetService("Workspace").Enemies:FindFirstChild("Shark") or not game:GetService("Workspace").Enemies:FindFirstChild("Terrorshark") or not game:GetService("Workspace").Enemies:FindFirstChild("Piranha") or not game:GetService("Workspace").Enemies:FindFirstChild("Fish Crew Member") then
                        if not game:GetService("Workspace").Boats:FindFirstChild("PirateBrigade") then
                            buyb = TPP(CFrame.new(-16927.451171875, 9.0863618850708, 433.8642883300781))
                            if (CFrame.new(-16927.451171875, 9.0863618850708, 433.8642883300781).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 10 then
                                if buyb then buyb:Stop() end
                                local args = {
                                    [1] = "BuyBoat",
                                    [2] = "PirateBrigade"
                                }
    
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                            end
                        elseif game:GetService("Workspace").Boats:FindFirstChild("PirateBrigade") then
                            if game.Players.LocalPlayer.Character:WaitForChild("Humanoid").Sit == false then
                                TPP(game:GetService("Workspace").Boats.PirateBrigade.VehicleSeat.CFrame * CFrame.new(0,1,0))
                            else
                                for i,v in pairs(game:GetService("Workspace").Boats:GetChildren()) do
                                    if v.Name == "PirateBrigade" then
                                        repeat wait()
                                            if (CFrame.new(-17013.80078125, 10.962434768676758, 438.0169982910156).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 10 then
                                                TPB(CFrame.new(-33163.1875, 10.964323997497559, -324.4842224121094))
                                            elseif (CFrame.new(-33163.1875, 10.964323997497559, -324.4842224121094).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 10 then
                                                TPB(CFrame.new(-37952.49609375, 10.96342945098877, -1324.12109375))
                                            elseif (CFrame.new(-37952.49609375, 10.96342945098877, -1324.12109375).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 10 then
                                                TPB(CFrame.new(-33163.1875, 10.964323997497559, -324.4842224121094))
                                            end 
                                        until game:GetService("Workspace").Enemies:FindFirstChild("Shark") or game:GetService("Workspace").Enemies:FindFirstChild("Terrorshark") or game:GetService("Workspace").Enemies:FindFirstChild("Piranha") or game:GetService("Workspace").Enemies:FindFirstChild("Fish Crew Member") or _G.MatsuAutoDriveBoat == false
                                    end
                                end
                            end
                        end
                    end
                end
            end)
        end
    end)
    
    spawn(function()
		pcall(function()
			while wait() do
				if _G.MatsuAutoDriveBoat then
					if game:GetService("Workspace").Enemies:FindFirstChild("Shark") or game:GetService("Workspace").Enemies:FindFirstChild("Terrorshark") or game:GetService("Workspace").Enemies:FindFirstChild("Piranha") or game:GetService("Workspace").Enemies:FindFirstChild("Fish Crew Member") then
					    game.Players.LocalPlayer.Character.Humanoid.Sit = false
					end
				end
			end
		end)
	end)

Event:Label("Boat")
    
    SpeedTable = {
	"200",
	"250",
	"300",
	"350",
	"400",
	"450",
	"500"
}
_G.BoatSpeed = "350"
Event:Dropdown("Selected Boat Speed",SpeedTable,function(value)
_G.BoatSpeed = value
end)

    Event:Toggle("Increase Boat Speed",_G.IncreaseBoatSpeed,function(value)
        _G.IncreaseBoatSpeed = value
    local vehicleSeats = {}
                for i, v in pairs(game.Workspace.Boats:GetDescendants()) do
                    if v:IsA("VehicleSeat") then
                        table.insert(vehicleSeats, v)
                    end
                end
                if _G.IncreaseBoatSpeed then
                    for _, v in pairs(vehicleSeats) do
                        v.MaxSpeed = _G.BoatSpeed
                    end
                else
                    for _, v in pairs(vehicleSeats) do
                        v.MaxSpeed = 100
                    end
                end
            end)
            
Event:Toggle("Auto No Clip Rock",_G.IncreaseBoatSpeed,function(value)
_G.NoclipR = value 
end)
                        spawn(function()
                            while wait() do
                                if _G.NoclipR then
                                    if game.Players.LocalPlayer.Character.Humanoid.Sit == true then
                                        for _, v in pairs(game.Workspace.Boats:GetDescendants()) do
                                            if v:IsA("BasePart") and v.CanCollide == true then
                                                v.CanCollide = false
                                            end
                                        end
                                        for _, v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
                                            if v:IsA("BasePart") and v.CanCollide == true then
                                                v.CanCollide = false
                                            end
                                        end
                                    elseif game.Players.LocalPlayer.Character.Humanoid.Sit == false then
                                        for _, v in pairs(game.Workspace.Boats:GetDescendants()) do
                                            if v:IsA("BasePart") and v.CanCollide == false then
                                                v.CanCollide = true
                                            end
                                        end
                                        for _, v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
                                            if v:IsA("BasePart") and v.CanCollide == false then
                                                v.CanCollide = true
                                            end
                                        end
                                    end
                                end
                            end
                        end)

Event:Seperator("Mirage Island")

Mirragecheck = Event:Label("")
spawn(function()
    pcall(function()
        while wait() do
            if game.Workspace._WorldOrigin.Locations:FindFirstChild('Mirage Island') then
                Mirragecheck:Set('✅: Mirage Island is Spawning')
            else
                Mirragecheck:Set('❌: Mirage Island Not Found')
            end
        end
    end)
end)

Event:Toggle("Auto Teleport To Mirage Island", false, function(value)
    _G.AutoMysticIsland = value
    StopTween(_G.AutoMysticIsland)
end)
spawn(function()
    pcall(function()
        while wait() do
            if _G.AutoMysticIsland then
                if game:GetService("Workspace").Map:FindFirstChild("MysticIsland") then
                    topos(CFrame.new(game:GetService("Workspace").Map.MysticIsland.Center.Position.X,500,game:GetService("Workspace").Map.MysticIsland.Center.Position.Z))
                end
            end
        end
    end)
end)

Event:Toggle("Auto Drive Boats", false, function(value)
    AutoW = value
end)
spawn(function()
    while wait() do
		pcall(function()
			if AutoW then
				game:service('VirtualInputManager'):SendKeyEvent(true, "W", false, game)
				wait(0.35)
				game:service('VirtualInputManager'):SendKeyEvent(false, "W", false, game)
				wait(1.5)
				game:service('VirtualInputManager'):SendKeyEvent(true, "S", false, game)
				wait(0.35)
				game:service('VirtualInputManager'):SendKeyEvent(false, "S", false, game)
				wait(1.5)
			end
		end)
    end
end)

Event:Toggle("Auto Mirage Island", false, function(value)
    if state then
        _G.dao = true
    else
        _G.dao = false
    end
    if _G.dao then
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
        wait(1)
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-5411.22021, 778.609863, -2682.27759, 0.927179396, 0, 0.374617696, 0, 1, 0, -0.374617696, 0, 0.927179396)
        wait(0)
        local args = {
            [1] = "BuyBoat",
            [2] = "PirateBrigade"
        }
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
        function two(gotoCFrame) --- Tween
              pcall(function()
                  game.Players.LocalPlayer.Character.Humanoid.Sit = false
                  game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = false
              end)
              if (game:GetService("Players")["LocalPlayer"].Character.HumanoidRootPart.Position - gotoCFrame.Position).Magnitude <= 200 then
                  pcall(function() 
                      tweenz:Cancel()
                  end)
                  game:GetService("Players")["LocalPlayer"].Character.HumanoidRootPart.CFrame = gotoCFrame
              else
                  local tween_s = game:service"TweenService"
                  local info = TweenInfo.new((game:GetService("Players")["LocalPlayer"].Character.HumanoidRootPart.Position - gotoCFrame.Position).Magnitude/325, Enum.EasingStyle.Linear)
                   tween, err = pcall(function()
                      tweenz = tween_s:Create(game.Players.LocalPlayer.Character["HumanoidRootPart"], info, {CFrame = gotoCFrame})
                      tweenz:Play()
                  end)
                  if not tween then return err end
              end
              function _TweenCanCle()
                  tweenz:Cancel()
              end
          
        end
        two(CFrame.new(-5100.7085, 29.968586, -6792.45459, -0.33648631, -0.0396691673, 0.940852463, -6.40461678e-07, 0.999112308, 0.0421253517, -0.941688359, 0.0141740013, -0.336187631))
        wait(13)
        for _,v in next, workspace.Boats.PirateBrigade:GetDescendants() do
            if v.Name:find("VehicleSeat") then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.CFrame
                if game:GetService("Workspace").Map:FindFirstChild("MysticIsland") then
                    topos(game:GetService("Workspace").Map:FindFirstChild("MysticIsland").HumanoidRootPart.CFrame * CFrame.new(0,500,-100))
                end
            end
        end
    end
end)

Event:Toggle("Auto Teleport To Advanced Fruit Dealer", false, function(value)
    _G.Miragenpc = value
    StopTween(_G.Miragenpc)
end)
spawn(function()
    pcall(function()
    while wait() do
        if _G.Miragenpc then
            if game:GetService("Workspace").NPCs:FindFirstChild("Advanced Fruit Dealer") then
                topos(CFrame.new(game:GetService("Workspace").NPCs["Advanced Fruit Dealer"].HumanoidRootPart.Position))
                end
            end
        end
    end)
end)

Event:Toggle("Auto Lock Cam To Moon", false, function(value)
    _G.AutoDooHee = value
end)
spawn(function()
    while wait() do
		pcall(function()
			if _G.AutoDooHee then
			    wait(0.5)
				local moonDir = game.Lighting:GetMoonDirection()
                local lookAtPos = game.Workspace.CurrentCamera.CFrame.p + moonDir * 100
                game.Workspace.CurrentCamera.CFrame = CFrame.lookAt(game.Workspace.CurrentCamera.CFrame.p, lookAtPos)
			end
		end)
    end
end)

Event:Toggle("Auto Teleport To Blue Gear", false, function(value)
    _G.TweenMGear = value
    StopTween(_G.TweenMGear)
end)
spawn(function()
    pcall(function()
        while wait() do
            if _G.TweenMGear then
				if game:GetService("Workspace").Map:FindFirstChild("MysticIsland") then
					for i,v in pairs(game:GetService("Workspace").Map.MysticIsland:GetChildren()) do 
						if v:IsA("MeshPart")then 
                            if v.Material ==  Enum.Material.Neon then  
                                topos(v.CFrame)
                            end
                        end
					end
				end
			end
        end
    end)
end)

Event:Toggle("Auto Farm Chest Mirage Island", false, function(value)
    _G.AutoChestMirage = value
    StopTween(_G.AutoChestMirage)
end)
_G.MagnitudeAdd = 0
spawn(function()
	while wait() do 
		if _G.AutoChestMirage then
			for i,v in pairs(game:GetService("Workspace"):GetChildren()) do 
				if v.Name:find("FragChest") then
					if game:GetService("Workspace"):FindFirstChild(v.Name) then
						if (v.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 5000+_G.MagnitudeAdd then
							repeat wait()
								if game:GetService("Workspace"):FindFirstChild(v.Name) then
									topos(v.CFrame)
								end
							until _G.AutoChestMirage == false or not v.Parent
							TP(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame)
							_G.MagnitudeAdd = _G.MagnitudeAdd+1500
							break
						end
					end
				end
			end
		end
	end
end)

Event:Button("Reset Character", function()
    game.Players.LocalPlayer.Character.Head:Destroy()
end)

Event:Seperator("Leviathan")

FrozenIsland = Event:Label("")
spawn(function()
    pcall(function()
        while wait() do
            if game.Workspace._WorldOrigin.Locations:FindFirstChild('Frozen Dimension') then
                FrozenIsland:Set('✅: Frozen Dimension Spawning')
            else
                FrozenIsland:Set('❌: Frozen Dimension Not Found')
            end
        end
    end)
end)

Event:Toggle("Teleport To Frozen Dimension", false, function(value)
    _G.AutoFrozenDimension = value
    StopTween(_G.AutoFrozenDimension)
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

Event:Toggle("Auto Kill Terror Shark", false, function(value)
    _G.AutoTerrorshark = value
    StopTween( _G.AutoTerrorshark)
end)
spawn(function()
    while wait() do
        if  _G.AutoTerrorshark and World3 then
            pcall(function()
                if game:GetService("Workspace").Enemies:FindFirstChild("Terrorshark") then
                    for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                        if v.Name == "Terrorshark" then
                            if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                repeat task.wait()
                                    AutoHaki()
                                    EquipWeapon(_G.SelectWeapon)
                                    v.HumanoidRootPart.CanCollide = false
                                    v.Humanoid.WalkSpeed = 0
                                    PosNarathiwat = v.HumanoidRootPart.CFrame
                                    v.HumanoidRootPart.Size = Vector3.new(50,50,50)
                                    topos(v.HumanoidRootPart.CFrame * Pos)
                                    Min_XT_Is_Kak = true
                                    game:GetService("VirtualUser"):CaptureController()
                                    game:GetService("VirtualUser"):Button1Down(Vector2.new(1280,672))
                                until not  _G.AutoTerrorshark or not v.Parent or v.Humanoid.Health <= 0
                                Min_XT_Is_Kak = false
                            end
                        end
                    end
                else
                    if game:GetService("ReplicatedStorage"):FindFirstChild("Terrorshark") then
                        topos(game:GetService("ReplicatedStorage"):FindFirstChild("Terrorshark").HumanoidRootPart.CFrame * CFrame.new(2,20,2))
                    else
                        if  _G.AutoTerrorsharkhop then
                            Hop()
                        end
                    end
                end
            end)
        end
    end
end)

Event:Toggle("Auto Kill Shark", false, function(value)
    FarmShark = value
    StopTween(FarmShark)
end)
spawn(function()
    while wait() do
        if  FarmShark and World3 then
            pcall(function()
                if game:GetService("Workspace").Enemies:FindFirstChild("Shark") then
                    for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                        if v.Name == "Shark" then
                            if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                repeat task.wait()
                                    AutoHaki()
                                    EquipWeapon(_G.SelectWeapon)
                                    v.HumanoidRootPart.CanCollide = false
                                    v.Humanoid.WalkSpeed = 0
                                    v.HumanoidRootPart.Size = Vector3.new(50,50,50)
                                    PosNarathiwat = v.HumanoidRootPart.CFrame
                                    topos(v.HumanoidRootPart.CFrame * Pos)
                                    Min_XT_Is_Kak = true
                                    game:GetService("VirtualUser"):CaptureController()
                                    game:GetService("VirtualUser"):Button1Down(Vector2.new(1280,672))
                                until not  FarmShark or not v.Parent or v.Humanoid.Health <= 0
                                Min_XT_Is_Kak = false
                            end
                        end
                    end
                else
                    if game:GetService("ReplicatedStorage"):FindFirstChild("Terrorshark") then
                        topos(game:GetService("ReplicatedStorage"):FindFirstChild("Terrorshark").HumanoidRootPart.CFrame * CFrame.new(2,20,2))
                    else
                        if  _G.AutoTerrorsharkhop then
                            Hop()
                        end
                    end
                end
            end)
        end
    end
end)

Event:Toggle("Auto Kill Piranha", false, function(value)
    _G.farmpiranya = value
    StopTween(_G.farmpiranya)
end)
spawn(function()
    while wait() do
        if  _G.farmpiranya and World3 then
            pcall(function()
                if game:GetService("Workspace").Enemies:FindFirstChild("Piranha") then
                    for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                        if v.Name == "Piranha" then
                            if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                repeat task.wait()
                                    AutoHaki()
                                    EquipWeapon(_G.SelectWeapon)
                                    v.HumanoidRootPart.CanCollide = false
                                    v.Humanoid.WalkSpeed = 0
                                    PosNarathiwat = v.HumanoidRootPart.CFrame
                                    v.HumanoidRootPart.Size = Vector3.new(50,50,50)
                                    topos(v.HumanoidRootPart.CFrame * Pos)
                                    Min_XT_Is_Kak = true
                                    game:GetService("VirtualUser"):CaptureController()
                                    game:GetService("VirtualUser"):Button1Down(Vector2.new(1280,672))
                                until not  _G.farmpiranya or not v.Parent or v.Humanoid.Health <= 0
                                Min_XT_Is_Kak = false
                            end
                        end
                    end
                else
                    if game:GetService("ReplicatedStorage"):FindFirstChild("Piranha") then
                        topos(game:GetService("ReplicatedStorage"):FindFirstChild("Piranha").HumanoidRootPart.CFrame * CFrame.new(2,20,2))
                    else
                        if  _G.AutoTerrorsharkhop then
                            Hop()
                        end
                    end
                end
            end)
        end
    end
end)

Event:Toggle("Auto Kill Fish Crew Member", false, function(value)
    _G.Fish_Crew_Member = value
    StopTween(_G.Fish_Crew_Member)
end)
spawn(function()
    while wait() do
        if  _G.Fish_Crew_Member and World3 then
            pcall(function()
                if game:GetService("Workspace").Enemies:FindFirstChild("Fish Crew Member") then
                    for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                        if v.Name == "Fish Crew Member" then
                            if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                repeat task.wait()
                                    AutoHaki()
                                    EquipWeapon(_G.SelectWeapon)
                                    v.HumanoidRootPart.CanCollide = false
                                    v.Humanoid.WalkSpeed = 0
                                    PosNarathiwat = v.HumanoidRootPart.CFrame
                                    v.HumanoidRootPart.Size = Vector3.new(50,50,50)
                                    Min_XT_Is_Kak = true
                                    topos(v.HumanoidRootPart.CFrame * Pos)
                                    game:GetService("VirtualUser"):CaptureController()
                                    game:GetService("VirtualUser"):Button1Down(Vector2.new(1280,672))
                                until not  _G.Fish_Crew_Member or not v.Parent or v.Humanoid.Health <= 0
                                Min_XT_Is_Kak = false
                            end
                        end
                    end
                else
                    if game:GetService("ReplicatedStorage"):FindFirstChild("Fish Crew Member") then
                        topos(game:GetService("ReplicatedStorage"):FindFirstChild("Fish Crew Member").HumanoidRootPart.CFrame * CFrame.new(2,20,2))
                    else
                        if  _G.AutoTerrorsharkhop then
                            Hop()
                        end
                    end
                end
            end)
        end
    end
end)

Event:Toggle("Auto Kill Raid Ship", false, function(value)
    _G.KillGhostShip = value
    StopTween(_G.KillGhostShip)
end)
spawn(function()
    while wait() do
        if _G.KillGhostShip then
            pcall(function()
                if CheckPirateBoat() then
                    game:GetService("VirtualInputManager"):SendKeyEvent(true,32,false,game)
                    wait(.5)
                    game:GetService("VirtualInputManager"):SendKeyEvent(false,32,false,game)
                    local v = CheckPirateBoat()
                    repeat
                        wait()
                        spawn(topos(v.Engine.CFrame * CFrame.new(0, -20, 0)), 1)
                        AimBotSkillPosition = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0, -5, 0)
                        Skillaimbot = true
                        AutoSkill = false
                    until not v or not v.Parent or v.Health.Value <= 0 or not CheckPirateBoat()
                    Skillaimbot = true
                    AutoSkill = false
                end
            end)
        end
    end
end)

Event:Toggle("Auto Kill Ghost Ship", false, function(value)
    _G.bjirFishBoat = value
    StopTween(_G.bjirFishBoat)
end)
spawn(function()
    while wait() do
        pcall(function()
            if _G.bjirFishBoat then
                if CheckPirateBoat() then
                    game:GetService("VirtualInputManager"):SendKeyEvent(true, 32, false, game)
                    wait(0.5)
                    game:GetService("VirtualInputManager"):SendKeyEvent(false, 32, false, game)
                    local v = CheckPirateBoat()
                    repeat
                        wait()
                        spawn(topos(v.Engine.CFrame * CFrame.new(0, -20, 0), 1))
                        AutoSkill = true
                        Skillaimbot = true
                        AimBotSkillPosition = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0, -5, 0)
                    until v.Parent or v.Health.Value <= 0 or not CheckPirateBoat()
                    AutoSkill = false
                    Skillaimbot = false
                end
            end
        end)
    end
end)   
spawn(function()
    while wait() do
        if _G.bjirFishBoat then
               pcall(function()
                    if CheckPirateBoat() then
                        AutoHaki()
                        game:GetService("VirtualUser"):CaptureController()
                        game:GetService("VirtualUser"):Button1Down(Vector2.new(1280,672))
                        for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                            if v:IsA("Tool") then
                                if v.ToolTip == "Melee" then -- "Blox Fruit" , "Sword" , "Wear" , "Agility"
                                    game.Players.LocalPlayer.Character.Humanoid:EquipTool(v)
                                end
                            end
                        end
                        game:GetService("VirtualInputManager"):SendKeyEvent(true,122,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
                        game:GetService("VirtualInputManager"):SendKeyEvent(false,122,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
                        wait(.2)
                        game:GetService("VirtualInputManager"):SendKeyEvent(true,120,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
                        game:GetService("VirtualInputManager"):SendKeyEvent(false,120,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
                        wait(.2)
                        game:GetService("VirtualInputManager"):SendKeyEvent(true,99,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
                        game:GetService("VirtualInputManager"):SendKeyEvent(false,99,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
                        wait(.2)
                        game:GetService("VirtualInputManager"):SendKeyEvent(false,"C",false,game.Players.LocalPlayer.Character.HumanoidRootPart)
                        for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                            if v:IsA("Tool") then
                                if v.ToolTip == "Blox Fruit" then -- "Blox Fruit" , "Sword" , "Wear" , "Agility"
                                    game.Players.LocalPlayer.Character.Humanoid:EquipTool(v)
                                end
                            end
                        end
                        game:GetService("VirtualInputManager"):SendKeyEvent(true,122,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
                        game:GetService("VirtualInputManager"):SendKeyEvent(false,122,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
                        wait(.2)
                        game:GetService("VirtualInputManager"):SendKeyEvent(true,120,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
                        game:GetService("VirtualInputManager"):SendKeyEvent(false,120,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
                        wait(.2)
                        game:GetService("VirtualInputManager"):SendKeyEvent(true,99,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
                        game:GetService("VirtualInputManager"):SendKeyEvent(false,99,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
                        wait(.2)
                        game:GetService("VirtualInputManager"):SendKeyEvent(true,"V",false,game.Players.LocalPlayer.Character.HumanoidRootPart)
                        game:GetService("VirtualInputManager"):SendKeyEvent(false,"V",false,game.Players.LocalPlayer.Character.HumanoidRootPart)
                        wait(0.6)
                        for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                            if v:IsA("Tool") then
                                if v.ToolTip == "Sword" then -- "Blox Fruit" , "Sword" , "Wear" , "Agility"
                                    game.Players.LocalPlayer.Character.Humanoid:EquipTool(v)
                                end
                            end
                        end
                        game:GetService("VirtualInputManager"):SendKeyEvent(true,122,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
                        game:GetService("VirtualInputManager"):SendKeyEvent(false,122,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
                        wait(.2)
                        game:GetService("VirtualInputManager"):SendKeyEvent(true,120,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
                        game:GetService("VirtualInputManager"):SendKeyEvent(false,120,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
                        wait(.2)
                        game:GetService("VirtualInputManager"):SendKeyEvent(true,99,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
                        game:GetService("VirtualInputManager"):SendKeyEvent(false,99,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
                        wait(0.5)
                        for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                            if v:IsA("Tool") then
                                if v.ToolTip == "Gun" then -- "Blox Fruit" , "Sword" , "Wear" , "Agility"
                                    game.Players.LocalPlayer.Character.Humanoid:EquipTool(v)
                                end
                            end
                        end
                        game:GetService("VirtualInputManager"):SendKeyEvent(true,122,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
                        game:GetService("VirtualInputManager"):SendKeyEvent(false,122,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
                        wait(.2)
                        game:GetService("VirtualInputManager"):SendKeyEvent(true,120,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
                        game:GetService("VirtualInputManager"):SendKeyEvent(false,120,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
                        wait(.2)
                        game:GetService("VirtualInputManager"):SendKeyEvent(true,99,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
                        game:GetService("VirtualInputManager"):SendKeyEvent(false,99,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
                    end
                end)
            end
    end
end)

Event:Toggle("Teleport To Sea Beast", false, function(value)
    _G.AutoSeaBest = value
    StopTween(_G.AutoSeaBest)
end)
spawn(function()
    while wait() do
        if _G.AutoSeaBest then
            pcall(function()
                for i,v in pairs(game:GetService("Workspace").SeaBeasts:GetChildren()) do
                    if v:FindFirstChild("HumanoidRootPart") then
                        AutoHaki()
                        EquipWeapon(_G.SelectWeapon)
                        TP1(v.HumanoidRootPart.CFrame * CFrame.new(0,300,0))
                        game:GetService("VirtualUser"):CaptureController()
                        game:GetService("VirtualUser"):Button1Down(Vector2.new(1280,672))
                    else
                        if _G.AutoSeaBestHop then
                            Hop()
                        end
                    end
                end
            end)
        end
    end
end)

Event:Toggle("Auto Sea Beast", false, function(value)
    _G.Auto_Seabest = value
    StopTween(_G.Auto_Seabest)
end)
local gg = getrawmetatable(game)
local old = gg.__namecall
setreadonly(gg,false)
gg.__namecall = newcclosure(function(...)
	local method = getnamecallmethod()
	local args = {...}
	if tostring(method) == "FireServer" then
		if tostring(args[1]) == "RemoteEvent" then
			if tostring(args[2]) ~= "true" and tostring(args[2]) ~= "false" then
				if Skillaimbot then
					args[2] = AimBotSkillPosition
					return old(unpack(args))
				end
			end
		end
	end
	return old(...)
end)
Skillz = true
Skillx = true
Skillc = true
Skillv = true
spawn(function()
    while wait() do
        pcall(function()
            if AutoSkill then
                if Skillz then
                    game:service('VirtualInputManager'):SendKeyEvent(true, "Z", false, game)
                    wait(.1)
                    game:service('VirtualInputManager'):SendKeyEvent(false, "Z", false, game)
                end
                if Skillx then
                    game:service('VirtualInputManager'):SendKeyEvent(true, "X", false, game)
                    wait(.1)
                    game:service('VirtualInputManager'):SendKeyEvent(false, "X", false, game)
                end
                if Skillc then
                    game:service('VirtualInputManager'):SendKeyEvent(true, "C", false, game)
                    wait(.1)
                    game:service('VirtualInputManager'):SendKeyEvent(false, "C", false, game)
                end
                if Skillv then
                    game:service('VirtualInputManager'):SendKeyEvent(true, "V", false, game)
                    wait(.1)
                    game:service('VirtualInputManager'):SendKeyEvent(false, "V", false, game)
                end
            end
        end)
    end
end)
task.spawn(function()
    while wait() do
        pcall(function()
            if _G.Auto_Seabest then
                if not game:GetService("Workspace").SeaBeasts:FindFirstChild("SeaBeast1") then
                    if not game:GetService("Workspace").Boats:FindFirstChild("PirateBrigade") then 
                        if not game:GetService("Workspace").Boats:FindFirstChild("PirateBrigade") then
                            if not game:GetService("Workspace").Boats:FindFirstChild("PirateBrigade") then
                                buyb = TPP(CFrame.new(-16927.451171875, 9.0863618850708, 433.8642883300781))
                                if (CFrame.new(-16927.451171875, 9.0863618850708, 433.8642883300781).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 10 then
                                    if buyb then buyb:Stop() end
                                    local args = {
                                        [1] = "BuyBoat",
                                        [2] = "PirateBrigade"
                                    }
        
                                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                                end
                            elseif game:GetService("Workspace").Boats:FindFirstChild("PirateBrigade") then
                                if game.Players.LocalPlayer.Character:WaitForChild("Humanoid").Sit == false then
                                    TPP(game:GetService("Workspace").Boats.PirateBrigade.VehicleSeat.CFrame * CFrame.new(0,1,0))
                                elseif game.Players.LocalPlayer.Character:WaitForChild("Humanoid").Sit == true then
                                    repeat wait()
                                        if (game:GetService("Workspace").Boats.PirateBrigade.VehicleSeat.CFrame.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 10 then
                                            TPB(CFrame.new(35.04552459716797, 17.750778198242188, 4819.267578125))
                                        end
                                    until game:GetService("Workspace").SeaBeasts:FindFirstChild("SeaBeast1") or _G.Auto_Seabest == false
                                end
                            end
                        elseif game:GetService("Workspace").Enemies:FindFirstChild("PirateBrigade") then
                            for is,vs in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                if vs.Name == "PirateBrigade" then
                                    if vs:FindFirstChild("VehicleSeat") then
                                        repeat wait()
                                            game.Players.LocalPlayer.Character:WaitForChild("Humanoid").Sit = false
                                            TPP(vs.VehicleSeat.CFrame * CFrame.new(0,30,0))
                                            EquipAllWeapon()  
                                            AutoSkill = true
                                            AimBotSkillPosition = vs.VehicleSeat
                                            Skillaimbot = true
                                        until not game:GetService("Workspace").Boats:FindFirstChild("PirateBrigade") or _G.Auto_Seabest == false
                                        AutoSkill = false
                                        Skillaimbot = false
                                    end
                                end
                            end
                        end
                    elseif game:GetService("Workspace").Enemies:FindFirstChild("PirateBasic") then
                        for iss,vss in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if vss.Name == "PirateBasic" then
                                if vss:FindFirstChild("VehicleSeat") then
                                    repeat wait()
                                        game.Players.LocalPlayer.Character:WaitForChild("Humanoid").Sit = false
                                        TPP(vss.VehicleSeat.CFrame * CFrame.new(0,30,0))
                                        EquipAllWeapon()  
                                        AutoSkill = true
                                        AimBotSkillPosition = vss.VehicleSeat
                                        Skillaimbot = true
                                    until not game:GetService("Workspace").Boats:FindFirstChild("PirateBrigade") or _G.Auto_Seabest == false
                                    AutoSkill = false
                                    Skillaimbot = false
                                end
                            end
                        end
                    end
                elseif game:GetService("Workspace").SeaBeasts:FindFirstChild("SeaBeast1") then  
                    for i,v in pairs(game:GetService("Workspace").SeaBeasts:GetChildren()) do
                        if v:FindFirstChild("HumanoidRootPart") then
                            repeat wait()
                                game.Players.LocalPlayer.Character:WaitForChild("Humanoid").Sit = false
                                TPP(v.HumanoidRootPart.CFrame * CFrame.new(0,500,0))
                                EquipAllWeapon()  
                                AutoSkill = true
                                AimBotSkillPosition = v.HumanoidRootPart
                                Skillaimbot = true
                            until not v:FindFirstChild("HumanoidRootPart") or _G.Auto_Seabest == false
                            AutoSkill = false
                            Skillaimbot = false
                        end
                    end
                end
            end
        end)
    end
end)

game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = "PiHub",
    Text = "Script Loaded! ",
    Icon = "rbxassetid://18899804355",
    Duration = 1
})
game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = "PiHub",
    Text = "discord.gg/25ms",
    Icon = "rbxassetid://18899804355",
    Duration = 1
})
game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = "PiHub",
    Text = "discord.gg/25ms",
    Icon = "rbxassetid://18899804355",
    Duration = 1
})
game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = "PiHub",
    Text = "discord.gg/25ms",
    Icon = "rbxassetid://18899804355",
    Duration = 1
})
game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = "PiHub",
    Text = "discord.gg/25ms",
    Icon = "rbxassetid://18899804355",
    Duration = 1
})
game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = "PiHub",
    Text = "discord.gg/25ms",
    Icon = "rbxassetid://18899804355",
    Duration = 1
})