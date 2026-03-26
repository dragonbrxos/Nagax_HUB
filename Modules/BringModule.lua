local BringModule = {}

BringModule.Config = {
    BringRange = nil,       -- Distância para puxar inimigos
    MaxMonsters = nil,      -- Máximo de monstros para puxar
    BringDelay = nil        -- Delay entre puxões
}

function BringModule:Init(config)
    self.Config = setmetatable(config or {}, {__index = self.Config})
    self.BroughtMonsters = {}
    return self
end

-- Puxa todos os inimigos próximos para perto do jogador
function BringModule:BringAll(monsterName, targetPosition)
    if not self.Config.BringRange then return end
    
    local player = game.Players.LocalPlayer
    local workspace = game:GetService("Workspace")
    local enemies = workspace:FindFirstChild("Enemies") or workspace:FindFirstChild("NPCs")
    
    if not enemies then return end
    
    local count = 0
    for _, enemy in pairs(enemies:GetChildren()) do
        if count >= (self.Config.MaxMonsters or 10) then break end
        
        if enemy.Name == monsterName and enemy:FindFirstChild("Humanoid") then
            if enemy.Humanoid.Health > 0 then
                local hrp = enemy:FindFirstChild("HumanoidRootPart")
                if hrp then
                    local distance = (hrp.Position - targetPosition).Magnitude
                    if distance <= self.Config.BringRange then
                        -- Teleporta inimigo para perto
                        hrp.CFrame = CFrame.new(targetPosition + Vector3.new(
                            math.random(-5, 5), 
                            0, 
                            math.random(-5, 5)
                        ))
                        table.insert(self.BroughtMonsters, enemy)
                        count = count + 1
                    end
                end
            end
        end
    end
    
    if self.Config.BringDelay then
        task.wait(self.Config.BringDelay)
    end
    
    return count
end

-- Puxa inimigos para uma posição específica (útil para agrupar)
function BringModule:BringToCenter(monsterName, centerPosition, radius)
    radius = radius or 10
    local count = 0
    
    for _, enemy in pairs(self.BroughtMonsters) do
        if enemy:FindFirstChild("HumanoidRootPart") and enemy.Humanoid.Health > 0 then
            local angle = (count / (self.Config.MaxMonsters or 10)) * math.pi * 2
            local offset = Vector3.new(
                math.cos(angle) * radius,
                0,
                math.sin(angle) * radius
            )
            enemy.HumanoidRootPart.CFrame = CFrame.new(centerPosition + offset)
            count = count + 1
        end
    end
end

-- Limpa lista de monstros puxados
function BringModule:Clear()
    self.BroughtMonsters = {}
end

return BringModule
